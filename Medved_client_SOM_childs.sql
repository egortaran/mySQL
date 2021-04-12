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
-- Table structure for table `client_SOM_childs`
--

DROP TABLE IF EXISTS `client_SOM_childs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_SOM_childs` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `parent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Родитель',
  `age` tinyint unsigned DEFAULT NULL COMMENT 'Лет',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`full_name`),
  KEY `parent` (`parent`),
  CONSTRAINT `client_SOM_childs_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `clients_SOM` (`full_name`) ON UPDATE CASCADE,
  CONSTRAINT `client_SOM_childs_ibfk_2` FOREIGN KEY (`parent`) REFERENCES `client_SOM_parents` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Дети SOM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_SOM_childs`
--

LOCK TABLES `client_SOM_childs` WRITE;
/*!40000 ALTER TABLE `client_SOM_childs` DISABLE KEYS */;
INSERT INTO `client_SOM_childs` VALUES ('Charlotte Windler','Dana Nitzsche',9,NULL),('Dr. Gwendolyn Schowalter','Audrey Collins PhD',6,NULL),('Felipa Wehner','Earnestine Wilderman',13,NULL),('Frederick Ziemann','Dr. Clemens Keeling',8,NULL),('Mabelle Senger','America Becker V',14,NULL),('Mr. Cruz Yost','Bethel Becker',9,NULL),('Mrs. Kavon Leannon','Eloisa Runolfsson',11,NULL),('Ms. Hosea Heathcote','Chauncey Bogan III',10,NULL),('Ms. Marjorie Kub V','Carley Murphy',5,NULL),('Sydnee O Hara','Donny Bartoletti DVM',15,NULL);
/*!40000 ALTER TABLE `client_SOM_childs` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_child_to_client_SOM` BEFORE INSERT ON `client_SOM_childs` FOR EACH ROW BEGIN

	-- Добавляет в client_SOM ребенка, если его там не было

	IF ((SELECT cs.full_name FROM clients_SOM cs WHERE cs.full_name = NEW.full_name) = NEW.full_name)
	THEN SET @a = 1;
	ELSE
		INSERT INTO clients_SOM (full_name, time_of_life)
		VALUES (NEW.full_name, 'child');
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_child_from_cliients_SOM` AFTER DELETE ON `client_SOM_childs` FOR EACH ROW BEGIN
	
	-- Удаляет клиента из SOM при удалении из clients_SOM_child
	
	DELETE FROM clients_SOM 
	WHERE full_name = OLD.full_name AND 
		  time_of_life = 'child';
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
