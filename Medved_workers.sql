-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: Medved
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `post` set('freelancer','tutor','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'freelancer' COMMENT 'Должность',
  `orders` mediumint DEFAULT '0' COMMENT 'Кол-во заказов',
  `salary` mediumint DEFAULT '0' COMMENT 'Зарплата',
  `profit` mediumint DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`full_name`),
  CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `users` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Работники';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES ('Alva Erdman','freelancer',5,37674,46922,'2011-02-25 07:18:23','2021-04-02 00:37:51',NULL),('Andres Welch','other',4,13441,15493,'1974-03-30 18:12:42','2021-04-01 00:52:39',NULL),('Braxton Haag','other',4,28530,5002,'1979-09-07 15:49:55','2021-04-01 00:52:39',NULL),('Domingo Labadie','freelancer,other',4,19803,17231,'2000-02-22 02:59:25','2021-04-01 14:31:31',NULL),('Ellie Glover I','',6,18457,128834,'1995-06-24 02:53:30','2021-04-02 00:37:51',NULL),('Emilia Rempel','tutor,other',4,9707,35534,'1989-05-16 04:28:37','2021-04-01 00:52:39',NULL),('Evan Stoltenberg','freelancer,tutor,other',7,54048,85981,'1979-03-26 21:33:28','2021-04-02 00:37:51',NULL),('Kirk Adams IV','freelancer,other',4,17733,41192,'2003-01-15 22:46:35','2021-04-01 00:52:39',NULL),('Laurianne Ankunding III','tutor,other',4,9892,31155,'1978-03-23 05:40:49','2021-04-01 00:52:39',NULL),('Lilla Vandervort','',4,18453,23480,'1989-04-03 20:34:39','2021-04-01 00:52:39',NULL),('Lizzie Conroy','tutor',4,23807,20983,'1993-02-16 12:04:41','2021-04-01 00:52:39',NULL),('Marc Jacobi','',4,22999,8353,'1974-08-15 02:22:59','2021-04-01 00:52:39',NULL),('Marcia Lueilwitz','freelancer',5,61706,30317,'2002-03-20 03:12:47','2021-04-02 00:37:51',NULL),('Melvin Vandervort','tutor',4,23673,20121,'1998-05-05 16:33:07','2021-04-01 00:52:39',NULL),('Miss Cleta Buckridge Jr.','tutor',4,10179,31917,'1973-05-24 19:57:20','2021-04-01 00:52:39',NULL),('Miss Concepcion Nienow','freelancer',5,39376,112633,'2018-01-11 06:15:08','2021-04-02 00:37:51',NULL),('Miss Elta Gerhold II','freelancer,tutor',4,9225,28911,'2001-08-26 03:53:18','2021-04-01 00:52:39',NULL),('Miss Laurence Bogisich','',5,20637,20560,'2019-01-02 19:59:48','2021-04-02 00:37:51',NULL),('Miss Marilie Keeling V','',4,14031,14875,'2012-09-03 14:06:03','2021-04-01 00:52:39',NULL),('Mr. Agustin Walsh I','tutor,other',4,25763,31245,'2019-06-06 20:07:47','2021-04-01 00:52:39',NULL),('Mr. Monroe Stokes','other',3,14647,22732,'2005-03-16 12:04:53','2021-04-01 00:52:39',NULL),('Otilia Braun','freelancer',3,18185,19012,'1982-11-13 14:23:35','2021-04-01 00:52:39',NULL),('Prof. Oscar Gottlieb IV','freelancer,other',3,27388,-10319,'1986-06-24 08:37:31','2021-04-01 00:52:39',NULL),('Prof. Reuben Morar','freelancer,other',3,18936,5133,'1971-09-05 12:41:44','2021-04-01 00:52:39',NULL),('Schuyler Wyman','tutor,other',3,13227,23465,'1978-10-25 14:46:37','2021-04-01 00:52:39',NULL),('Stanley Friesen','',3,17982,-8085,'2009-03-07 13:13:26','2021-04-01 00:52:39',NULL),('Tobin Weber','freelancer,tutor,other',3,15546,22401,'2003-04-10 09:29:35','2021-04-01 00:52:39',NULL),('Vivien Reynolds','freelancer,other',3,18100,3983,'2003-07-24 02:10:50','2021-04-01 00:52:39',NULL),('Walker Pacocha','freelancer,tutor,other',3,23824,12356,'2004-07-21 16:11:24','2021-04-01 00:52:39',NULL),('Winifred Thompson','tutor',3,9407,14387,'2020-12-30 14:41:48','2021-04-01 00:52:39',NULL);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_workers_to_users` BEFORE INSERT ON `workers` FOR EACH ROW BEGIN
	
	-- Добавляет в users работника, если его там не было
	
	IF ((SELECT u2.full_name FROM users u2 WHERE u2.full_name = NEW.full_name) = NEW.full_name)
	THEN SET @a = 1;
	ELSE
		INSERT INTO users (full_name)
		VALUES (NEW.full_name);
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 21:41:07
