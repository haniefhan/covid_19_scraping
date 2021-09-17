<?php
function get_web_page($url = '', $option = array(), $getinfo = false) {
    $curl = curl_init($url);

    $option[CURLOPT_RETURNTRANSFER] = 1;
    $option[CURLOPT_SSL_VERIFYPEER] = 0;
    $option[CURLOPT_HEADER] = 0;
    $option[CURLOPT_DNS_USE_GLOBAL_CACHE] = false;
    $option[CURLOPT_FOLLOWLOCATION] = true;
    $option[CURLOPT_USERAGENT] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36';

    curl_setopt_array($curl, $option);

    $content = curl_exec($curl);

    $data = curl_getinfo($curl); // get the CURL info.
    $data['error'] = curl_error($curl); // get error messsage occured
    $data['errno'] = curl_errno($curl); // get error number
    $data['content'] = $content;
    curl_close($curl);
    if ($getinfo)
        // info + content
        return $data;
    else
        // just content
        return $data['content'];
}

function parse_the_number($number = 0){
    $number = trim($number);
    // remove all not number
    $number = preg_replace('/[^0-9]/', '', $number);
    return (int) $number;
}

$html = get_web_page("https://www.worldometers.info/coronavirus/");
$dom = new DOMDocument();
@$dom->loadHTML($html);
$x = new DOMXPath($dom);

$country_name = $argv[1];

$data = array();
foreach ($x->query("//table[@id='main_table_countries_today']/tbody/tr") as $tr) {
    if(strpos($tr->nodeValue, $country_name)){
        $td = $x->query('./td', $tr);

        $data['country_rank'] = $td->item(0)->nodeValue;
        $data['country_name'] = trim($td->item(1)->nodeValue);
        $data['total_cases'] = parse_the_number($td->item(2)->nodeValue);
        $data['new_cases'] = parse_the_number($td->item(3)->nodeValue);
        $data['total_deaths'] = parse_the_number($td->item(4)->nodeValue);
        $data['new_deaths'] = parse_the_number($td->item(5)->nodeValue);
        $data['total_recovered'] = parse_the_number($td->item(6)->nodeValue);
    }
}

// == database connection ==
$servername = "localhost";
$username = "root";
$password = "";
$database = "covid_19";

$con = new mysqli($servername, $username, $password, $database);

// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}
// == end database connection ==

$data['insert_date'] = date('Y-m-d H:i:s');

$columns = implode(", ",array_keys($data));
$escaped_values = array_map(array($con, 'real_escape_string'), $data);
$values  = implode("', '", $escaped_values);
$sql = "INSERT INTO `latest_data`($columns) VALUES ('$values');";

if($result = $con->query($sql)){
    echo 'data added to database!';
}else{
    die("Connection failed: " . $con->error);
}
?>