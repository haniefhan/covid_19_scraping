-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.23 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for covid_19
CREATE DATABASE IF NOT EXISTS `covid_19` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `covid_19`;

-- Dumping structure for table covid_19.latest_data
CREATE TABLE IF NOT EXISTS `latest_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_rank` tinyint DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `total_cases` int DEFAULT NULL,
  `new_cases` int DEFAULT NULL,
  `total_deaths` int DEFAULT NULL,
  `new_deaths` int DEFAULT NULL,
  `total_recovered` int DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table covid_19.latest_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `latest_data` DISABLE KEYS */;
INSERT INTO `latest_data` (`id`, `country_rank`, `country_name`, `total_cases`, `new_cases`, `total_deaths`, `new_deaths`, `total_recovered`, `insert_date`) VALUES
	(1, 1, 'USA', 41854465, 1103, 678001, 13, 31871869, '2021-09-13 14:21:29');
/*!40000 ALTER TABLE `latest_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
