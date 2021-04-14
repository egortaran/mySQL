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
-- Table structure for table `clients_SOM`
--

DROP TABLE IF EXISTS `clients_SOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_SOM` (
  'id' mediumint unsigned NOT NULL AUTO_INCREMENT,
  `time_of_life` set('child','parent','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Возраст',
  `subject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Предмет',
  `schedule` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Расписание',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_SOM_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Клиенты SOM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_SOM`
--

LOCK TABLES `clients_SOM` WRITE;
/*!40000 ALTER TABLE `clients_SOM` DISABLE KEYS */;
INSERT INTO `clients_SOM` VALUES ('America Becker V','parent','math','3',NULL),('Audrey Collins PhD','parent','phis','2',NULL),('Bethel Becker','parent','math','3',NULL),('Carley Murphy','parent','phis','2',NULL),('Charlotte Windler','child',NULL,NULL,NULL),('Chauncey Bogan III','parent','math','2',NULL),('Dana Nitzsche','parent','phis','2',NULL),('Donny Bartoletti DVM','parent','math','3',NULL),('Dr. Clemens Keeling','parent','phis','3',NULL),('Dr. Gwendolyn Schowalter','child',NULL,NULL,NULL),('Earnestine Wilderman','parent','math','3',NULL),('Eloisa Runolfsson','parent','phis','2',NULL),('Felipa Wehner','child',NULL,NULL,NULL),('Frederick Ziemann','child',NULL,NULL,NULL),('Mabelle Senger','child',NULL,NULL,NULL),('Mr. Cruz Yost','child',NULL,NULL,NULL),('Mrs. Kavon Leannon','child',NULL,NULL,NULL),('Ms. Hosea Heathcote','child',NULL,NULL,NULL),('Ms. Marjorie Kub V','child',NULL,NULL,NULL),('Sydnee O Hara','child',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clients_SOM` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_clients_SOM_to_users` BEFORE INSERT ON `clients_SOM` FOR EACH ROW BEGIN
	
	-- Добавляет в users клиента SOM, если его там не было
	
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_client_SOM_to_clients` AFTER INSERT ON `clients_SOM` FOR EACH ROW BEGIN
	
	-- Добавляет в clients клиета SOM, если его там не было
	
	IF ((SELECT c2.full_name FROM clients c2 WHERE c2.full_name = NEW.full_name) = NEW.full_name)
	THEN SET @a = 1;
	ELSE
		INSERT INTO clients (full_name, type_client)
	VALUES (NEW.full_name, 'SOM');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_client_SOM_from_clients` AFTER DELETE ON `clients_SOM` FOR EACH ROW BEGIN
	
	-- Удаляет клиента SOM из clients при удалении из clients_SOM
	
	DELETE FROM clients 
	WHERE full_name = OLD.full_name AND 
		  type_client = 'SOM';
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
