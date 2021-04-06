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

--
-- Table structure for table `client_SOM_parents`
--

DROP TABLE IF EXISTS `client_SOM_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_SOM_parents` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `financial_security` set('crisis','precarious','normal','rich') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'normal' COMMENT 'Обеспеченность',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`full_name`),
  CONSTRAINT `client_SOM_parents_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `clients_SOM` (`full_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Родители SOM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_SOM_parents`
--

LOCK TABLES `client_SOM_parents` WRITE;
/*!40000 ALTER TABLE `client_SOM_parents` DISABLE KEYS */;
INSERT INTO `client_SOM_parents` VALUES ('America Becker V','normal','Vero magni nostrum quae vel.'),('Audrey Collins PhD','normal','Tenetur ipsa vero aliquid velit et.'),('Bethel Becker','normal','Praesentium quasi quam nulla porro ipsum.'),('Carley Murphy','normal','Dolorum quia dicta laudantium ut consequatur unde.'),('Chauncey Bogan III','normal','Et accusantium atque ipsam hic accusantium itaque molestias.'),('Dana Nitzsche','normal','Quod consequuntur placeat placeat aut.'),('Donny Bartoletti DVM','normal','Ipsa esse architecto ut ullam sint optio.'),('Dr. Clemens Keeling','normal','Et ratione hic aut.'),('Earnestine Wilderman','normal','Deleniti perspiciatis quia voluptatem aspernatur incidunt nihil.'),('Eloisa Runolfsson','normal','Ut at pariatur eaque.');
/*!40000 ALTER TABLE `client_SOM_parents` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_parents_to_client_SOM` BEFORE INSERT ON `client_SOM_parents` FOR EACH ROW BEGIN
	
	-- Добавляет в clients_SOM родителя, если его там не было
	
	IF ((SELECT cs.full_name FROM clients_SOM cs WHERE cs.full_name = NEW.full_name) = NEW.full_name)
	THEN SET @a = 1;
	ELSE
		INSERT INTO clients_SOM (full_name, time_of_life)
		VALUES (NEW.full_name, 'parent');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_parent_from_clients_SOM` AFTER DELETE ON `client_SOM_parents` FOR EACH ROW BEGIN
	
	-- Удаляет клиента из SOM при удалении из clients_SOM_child
	
	DELETE FROM clients_SOM 
	WHERE full_name = OLD.full_name AND 
		  time_of_life = 'parent';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `type_client` set('university','SOM','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'other' COMMENT 'Тип заказа',
  `orders` mediumint DEFAULT '0' COMMENT 'Кол-во заказов',
  `pay` mediumint DEFAULT '0' COMMENT 'Заплатил',
  `profit` mediumint DEFAULT '0' COMMENT 'Выгода',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`full_name`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `users` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Клиенты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('Alfonzo Block IV','university',2,25490,18825,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('America Becker V','SOM',1,52542,41202,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Arianna Eichmann','university',2,9865,2694,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Aric Shanahan','university',2,33351,30195,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Arvid Schulist','university',2,13268,1814,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Audrey Collins PhD','SOM',0,0,0,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Austin Reichel','university',2,31179,26151,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Ayana Wehner','university',2,16026,6095,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Baby Senger','university',2,7114,-447,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Belle Hauck MD','university',2,26316,20072,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Bethel Becker','SOM',1,10752,2936,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Betsy Sipes','university',2,25185,14280,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Brenna Koepp IV','university',2,21583,15932,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Brook Welch','university',1,18207,9221,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Cali Maggio','university',1,5429,1545,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Carley Murphy','SOM',1,111834,110322,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Carmella Brekke','university',1,2606,57,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Carson Hagenes','university',1,7566,1157,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Casper Cormier','university',1,19693,17843,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Cassidy Heathcote DD','university',1,2695,-5572,'2021-04-01 00:20:33',NULL,'2021-04-04 19:47:38'),('Cassidy Heathcote DDS','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Cassie Gerlach','university',1,15119,13991,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Charlotte Windler','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Chauncey Bogan III','SOM',1,128408,119014,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Cooper Prohaska','university',1,1015,-1049,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dalton Deckow','university',1,2015,-3436,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dana Nitzsche','SOM',1,63768,19432,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Daphnee Kilback','university',1,18596,10986,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Darlene Runolfsdotti','university',1,4039,-4515,'2021-04-01 00:25:06',NULL,'2021-04-04 19:47:38'),('Darlene Runolfsdottir','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Darren Kassulke','university',1,15857,13926,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Darrick Wilderman','university',1,1644,-7451,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dayana Larkin','university',1,1887,-3993,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dedrick Von','university',1,8895,7181,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Demetris Rempel Jr.','university',1,2824,852,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Denis Gerlach','university',1,17527,16688,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Domenica Collins','university',1,14499,11542,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Donny Bartoletti DVM','SOM',1,7248,2142,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Dorothea Mertz','university',1,16489,7746,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Doyle Nienow','university',1,6093,5114,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Amelie Lang','university',1,6174,5903,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Augusta Mann','university',1,1387,-1992,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Aurore Auer','university',1,5714,-4264,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Clemens Keeling','SOM',1,37928,12216,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Dr. Fern Kohler','university',1,6688,4735,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Gwendolyn Schowalter','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Dr. Moriah Metz','university',1,772,-488,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Oceane Ortiz','university',1,14713,13622,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Dr. Terrence Zboncak','university',1,3250,-4210,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Durward Jacobi I','university',1,10951,4662,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Earnestine Wilderman','SOM',1,50472,38043,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Ebony Dickens','university',1,14863,12982,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Eddie Rosenbaum','university',1,12392,7881,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Efren Nienow','university',1,6945,232,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Elena Corwin','university',1,10888,2470,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Eloisa Runolfsson','SOM',1,0,0,'2021-04-02 00:03:55',NULL,'2021-04-04 19:47:38'),('Elsie Howe','university',1,5620,-613,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Eryn Mante','university',1,11120,2204,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Favian Gleason','university',1,1058,-1204,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Felipa Wehner','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Francisco Collier Jr','university',1,4781,-3074,'2021-04-01 00:25:25',NULL,'2021-04-04 19:47:38'),('Francisco Collier Jr.','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Frederick Ziemann','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Haskell Blick','university',1,2360,-631,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Hazel Kerluke','university',1,6513,-1653,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Henri Kshlerin','university',1,3155,381,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Jack Towne','university',1,18552,10920,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Jennifer Adams','university',1,19167,16373,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Jordan Collins','university',1,10555,1760,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('June Mills','university',1,8370,-667,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Karson Auer','university',1,12522,4013,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Larue Kuvalis','university',1,8508,-625,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Laurel Johnson','university',1,6458,-2682,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Lavinia Stroman Jr.','university',1,17283,8389,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Leanne Klocko','university',1,1379,-7257,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Lelah Collins','university',1,10011,2945,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Linda Maggio','university',1,13341,5139,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Lorine Oberbrunner','university',1,13796,5513,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mabelle Senger','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Madaline Smith MD','university',1,8543,4912,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Marc Lowe','university',1,4917,-4333,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Melody Grady','university',1,15811,7181,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Miss Letitia Gutkows','university',1,2812,-2024,'2021-04-01 00:25:40',NULL,'2021-04-04 19:47:38'),('Miss Letitia Gutkowski IV','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Miss Lyda Cummerata ','university',1,7230,4643,'2021-04-01 00:25:40',NULL,'2021-04-04 19:47:38'),('Miss Lyda Cummerata IV','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Miss Mikayla Howell','university',1,13715,11095,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Miss Tiara Zboncak I','university',1,19382,13324,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Modesta Nikolaus DDS','university',1,7874,6458,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Monte Bins','university',1,13548,7042,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Morgan McGlynn','university',1,4211,728,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mozelle Haag','university',1,12678,7554,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mozelle Swaniawski','university',1,282,-5668,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mr. Barney Dooley Sr','university',1,16840,12894,'2021-04-01 00:25:40',NULL,'2021-04-04 19:47:38'),('Mr. Barney Dooley Sr.','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mr. Brandt Ernser Sr','university',1,7487,3442,'2021-04-01 00:25:40',NULL,'2021-04-04 19:47:38'),('Mr. Brandt Ernser Sr.','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mr. Cruz Yost','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Mr. Darron Purdy','university',1,6630,-1676,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mr. Wyatt Hodkiewicz','university',1,17205,12414,'2021-04-01 00:25:40',NULL,'2021-04-04 19:47:38'),('Mr. Wyatt Hodkiewicz V','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mrs. Alberta Hansen','university',1,12254,8409,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Mrs. Kavon Leannon','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Mrs. Rachael Shields','university',1,5122,3783,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Ms. Hosea Heathcote','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Ms. Janae Block','university',1,10293,4360,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Ms. Marjorie Kub V','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Nelson Wolf','university',1,14173,10874,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Abel Reilly','university',1,10785,3326,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Adella Pagac','university',1,7055,-2201,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Austyn Ferry','university',1,9660,5113,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Brandy Nikolau','university',1,19289,16909,'2021-04-01 00:25:53',NULL,'2021-04-04 19:47:38'),('Prof. Brandy Nikolaus','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Kay Lind Jr.','university',1,615,-6255,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Major Bailey','university',1,3137,-2676,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Marianna Wolff','university',1,6205,-302,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Prof. Miguel Crist I','university',1,9680,1665,'2021-04-01 00:25:53',NULL,'2021-04-04 19:47:38'),('Prof. Miguel Crist IV','university',0,0,0,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Randall Rau MD','university',1,4360,4134,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Rosamond Bergnaum','university',1,16635,15267,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Sage Braun I','university',1,11496,6663,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Santa Windler','university',1,9297,513,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Sedrick Russel','university',1,9535,7367,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Stephanie Sporer','university',1,14552,6709,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Stewart Beahan','university',1,16767,15115,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Sydnee O Hara','SOM',0,0,0,'2021-04-02 00:14:41',NULL,'2021-04-04 19:47:38'),('Tamia Pacocha','university',1,5636,499,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Thomas Cormier','university',1,16443,15845,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Travis Lakin','university',1,11739,11582,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38'),('Trudie Ratke','university',1,3977,-2396,'2021-03-31 23:37:47',NULL,'2021-04-04 19:47:38');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_SOM`
--

DROP TABLE IF EXISTS `clients_SOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_SOM` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `time_of_life` set('child','parent','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Возраст',
  `subject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Предмет',
  `schedule` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Расписание',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`full_name`),
  CONSTRAINT `clients_SOM_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `users` (`full_name`) ON UPDATE CASCADE
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

--
-- Table structure for table `clients_university`
--

DROP TABLE IF EXISTS `clients_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_university` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `university` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Университет',
  `course` set('1','2','3','4','5','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Курс',
  `faculty` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Факультет',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`full_name`),
  CONSTRAINT `clients_university_ibfk_1` FOREIGN KEY (`full_name`) REFERENCES `users` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Клиенты университета';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_university`
--

LOCK TABLES `clients_university` WRITE;
/*!40000 ALTER TABLE `clients_university` DISABLE KEYS */;
INSERT INTO `clients_university` VALUES ('Alfonzo Block IV','Jaskolski-Stoltenberg','1','South','Corporis soluta quis dolorem id sed.'),('Arianna Eichmann','Hudson, Rowe and Bayer','1','East','Iste veniam ut sit iure.'),('Aric Shanahan','Russel-Schroeder','3','Port','Distinctio a laboriosam est est.'),('Arvid Schulist','Feeney PLC','1','Port','Autem non sapiente est a.'),('Austin Reichel','Johns Inc','3','New','Beatae aliquid inventore explicabo qui.'),('Ayana Wehner','Sanford, Botsford and Fay','1','North','Fugit ut non occaecati ipsa quia ut cum veritatis.'),('Baby Senger','Hayes, Kerluke and Schowalter','1','West','Saepe assumenda autem sit aspernatur.'),('Belle Hauck MD','Baumbach, Homenick and Rau','3','West','Magni dolorum magni velit officia.'),('Betsy Sipes','Ratke-Heidenreich','1','East','Fugiat veniam a et recusandae est libero ratione.'),('Brenna Koepp IV','Leffler-Schiller','2','New','Repellendus voluptas quibusdam cum et omnis.'),('Brook Welch','Lueilwitz-Gerlach','1','East','Et enim nam vitae deleniti laborum autem omnis sequi.'),('Cali Maggio','Beer, Nitzsche and Stroman','1','Lake','Fugiat odio ut aut voluptates et perspiciatis.'),('Carmella Brekke','Koss-Senger','1','Lake','Ducimus ducimus labore exercitationem quis veniam.'),('Carson Hagenes','Auer-Murphy','1','New','Est minus ea porro fugit.'),('Casper Cormier','Gottlieb-Bode','1','Port','Quidem voluptatem adipisci sint deserunt eligendi culpa laboriosam.'),('Cassidy Heathcote DD','Koss-Senger','2','New','Quidem voluptatem adipisci sint deserunt eligendi culpa laboriosam.'),('Cassie Gerlach','Rice, Corwin and Deckow','3','West','Doloribus sint nam commodi et.'),('Cooper Prohaska','Hegmann Inc','1','West','Quia vitae voluptas blanditiis consequuntur praesentium qui.'),('Dalton Deckow','Rolfson, Farrell and Upton','1','Port','Impedit delectus vero quia reiciendis sit natus.'),('Daphnee Kilback','Predovic and Sons','1','North','Consequuntur error quia enim similique.'),('Darlene Runolfsdotti','Koss-Senger','2','New','Quidem voluptatem adipisci sint deserunt eligendi culpa laboriosam.'),('Darren Kassulke','Greenholt, Koss and Hane','2','West','Explicabo consequuntur sint cumque dolor qui.'),('Darrick Wilderman','Wolf, Hirthe and Jones','2','West','Dolor molestiae officia et sed sed voluptatem.'),('Dayana Larkin','DuBuque, Lesch and Schimmel','2','Lake','Quis enim et sit eius ea ut tenetur ea.'),('Dedrick Von','Rau LLC','3','Lake','Explicabo voluptatem dolorum quae repudiandae non mollitia.'),('Demetris Rempel Jr.','Christiansen-O\'Keefe','3','Port','Sit asperiores excepturi odit vel aut.'),('Denis Gerlach','Dickens, Franecki and Hirthe','3','New','Placeat tempora voluptatem nihil officiis beatae amet doloremque.'),('Domenica Collins','Klocko, Beer and Maggio','1,3','North','Numquam qui quo vel autem molestiae non enim.'),('Dorothea Mertz','Grady-Ziemann','3','South','Excepturi cum sapiente sed recusandae consectetur non facilis qui.'),('Doyle Nienow','Donnelly, Abbott and Friesen','1,3','North','Qui alias eum aliquam voluptates.'),('Dr. Amelie Lang','Yundt, Ernser and Fay','1','Lake','Corporis possimus iste aut esse enim alias.'),('Dr. Augusta Mann','Adams-Blick','1,3','New','Consequatur commodi odio non enim aut.'),('Dr. Aurore Auer','Lebsack Inc','1,2','West','In et reprehenderit modi dolorum quibusdam voluptas voluptas.'),('Dr. Fern Kohler','Walter, Mitchell and Thiel','2','West','Rerum sed nihil velit ullam et alias.'),('Dr. Moriah Metz','Ziemann Inc','3','Lake','Voluptates voluptatem occaecati odit pariatur aperiam dolorem.'),('Dr. Oceane Ortiz','Doyle-Veum','3','Port','Ut vitae quisquam molestias.'),('Dr. Terrence Zboncak','Gleason-Ortiz','3','North','Assumenda ullam odio earum architecto.'),('Durward Jacobi I','Marks, Schamberger and Flatley','2','North','Fuga nemo blanditiis ut.'),('Ebony Dickens','Pfannerstill, Rodriguez and Hudson','1','North','Nulla beatae distinctio qui alias totam maiores numquam.'),('Eddie Rosenbaum','Hudson-Dare','3','East','Nulla qui non quis incidunt nihil amet cum tenetur.'),('Efren Nienow','Shields-Gerhold','3','East','Tempore ipsum aut quod numquam consequatur similique sequi commodi.'),('Elena Corwin','Balistreri, Huel and Waelchi','2','South','Unde voluptas architecto eum expedita.'),('Elsie Howe','Torphy, Williamson and Strosin','2','Lake','Voluptatibus ex omnis culpa ex porro voluptate.'),('Eryn Mante','Schowalter, Sanford and Hauck','3','New','Accusantium natus ipsa dolorem eum rerum.'),('Favian Gleason','Romaguera, Hermiston and Baumbach','2','New','Delectus reprehenderit temporibus qui delectus quod voluptas voluptas qui.'),('Francisco Collier Jr','Romaguera, Hermiston and Baumbach','3','West','Delectus reprehenderit temporibus qui delectus quod voluptas voluptas qui.'),('Francisco Collier Jr.','Barrows LLC','3','Lake','Quia facere necessitatibus aliquam eum.'),('Haskell Blick','Durgan and Sons','2','South','Explicabo sapiente vel asperiores est non.'),('Hazel Kerluke','Schuster, Mayert and McKenzie','2','South','Ab qui laborum et assumenda et possimus et et.'),('Henri Kshlerin','Emmerich, Purdy and Kautzer','3','New','Quam et sed optio deserunt.'),('Jack Towne','Pollich-Hansen','2','North','Rem qui incidunt repellat unde corporis natus ut.'),('Jennifer Adams','Williamson Inc','1','East','Omnis officia a autem et consequatur et excepturi.'),('Jordan Collins','Bins, Torp and Cartwright','2','Lake','Sit mollitia autem odit eveniet tempora eligendi ad.'),('June Mills','Deckow-Krajcik','2','New','Dicta molestiae assumenda cumque id minima vero.'),('Karson Auer','Eichmann-Thompson','2','West','Accusantium aperiam dolor ex molestiae a deserunt.'),('Larue Kuvalis','Hauck PLC','2','Lake','Rem asperiores est dicta.'),('Laurel Johnson','Kunde, Legros and Hickle','1','East','Sed deserunt facere et tenetur.'),('Lavinia Stroman Jr.','Ratke-Fisher','2','South','Facere unde quia amet sint autem est.'),('Leanne Klocko','Ratke-Corwin','2','Port','Explicabo vero molestiae ut et voluptas.'),('Lelah Collins','Price-Dietrich','2','West','Optio quisquam aut perferendis fuga mollitia aliquam fuga sint.'),('Linda Maggio','Turcotte, Smitham and Dibbert','3','South','Nulla omnis iure nisi nobis ea est dolores.'),('Lorine Oberbrunner','Klein-Murazik','3','Port','Sequi maxime exercitationem tempore non possimus.'),('Madaline Smith MD','Prohaska, Bradtke and Kutch','3','Port','Eos non nihil voluptatem aut natus exercitationem sint voluptas.'),('Marc Lowe','Thompson-Littel','3','Lake','Unde est ratione esse quibusdam alias quod perferendis.'),('Melody Grady','Sanford-Leannon','3','West','Amet ullam reiciendis saepe cupiditate voluptas.'),('Miss Letitia Gutkows','Sanford-Leannon','3','West','Maiores et quam quia quis hic.'),('Miss Letitia Gutkowski IV','Lind-Brown','3','Port','Voluptas aliquid corporis sint nulla.'),('Miss Lyda Cummerata ','Sanford-Leannon','3','West','Maiores et quam quia quis hic.'),('Miss Lyda Cummerata IV','Davis PLC','3','North','Cum consequatur assumenda ut.'),('Miss Mikayla Howell','Powlowski Group','3','Port','Id eaque velit eveniet magnam cumque natus.'),('Miss Tiara Zboncak I','McDermott PLC','3','East','Optio sapiente nam odit voluptate animi excepturi.'),('Modesta Nikolaus DDS','Hagenes, Williamson and Murray','3','North','Voluptate esse adipisci iusto.'),('Monte Bins','Thompson Group','1','Port','Consequatur sed totam delectus eligendi modi ut.'),('Morgan McGlynn','Pollich Group','2','Port','Molestias facere occaecati eos consectetur exercitationem non consequatur.'),('Mozelle Haag','Schmidt LLC','2','West','Cum laudantium in repellat deleniti occaecati rerum voluptate.'),('Mozelle Swaniawski','Dibbert-Kuvalis','3','South','In similique labore voluptatem nesciunt doloribus impedit perspiciatis.'),('Mr. Barney Dooley Sr','Koss-Senger','2','New','Maiores et quam quia quis hic.'),('Mr. Barney Dooley Sr.','Gleichner Ltd','2','Port','Porro sed qui porro enim quis voluptatem voluptatem.'),('Mr. Brandt Ernser Sr','Koss-Senger','2','New','Maiores et quam quia quis hic.'),('Mr. Brandt Ernser Sr.','Koepp-Schumm','2','Lake','Totam aut tenetur aliquam ullam consequatur dolore est.'),('Mr. Darron Purdy','Hills and Sons','3','West','Odit corporis ad modi incidunt.'),('Mr. Wyatt Hodkiewicz','Hills and Sons','2','New','Maiores et quam quia quis hic.'),('Mr. Wyatt Hodkiewicz V','Rogahn, Ratke and Walker','3','Port','Voluptatem sint blanditiis ea quisquam accusantium ut soluta.'),('Mrs. Alberta Hansen','Leffler-Grady','2','Lake','Rerum quisquam voluptas occaecati tempore quisquam omnis.'),('Mrs. Rachael Shields','Franecki-Abernathy','3','South','Ab consequatur inventore earum qui assumenda minima quasi.'),('Ms. Janae Block','Murphy Ltd','3','East','Alias provident fuga porro voluptatum voluptatem unde.'),('Nelson Wolf','Hilll-Pouros','3','New','Similique nisi pariatur ipsa dolores doloribus.'),('Prof. Abel Reilly','Crist, Walter and Witting','3','West','Voluptas dolores in dolorem iure.'),('Prof. Adella Pagac','Fisher, Littel and Bode','2','East','Maiores et quam quia quis hic.'),('Prof. Austyn Ferry','Waters, Zieme and Krajcik','1','South','Voluptatem voluptatem ea et odit.'),('Prof. Brandy Nikolau','Hills and Sons','2','New','O\'Conner, Hauck and Stamm'),('Prof. Brandy Nikolaus','Cartwright, Murazik and Reichert','3','New','Tempora est et reiciendis iste hic aut iure dolor.'),('Prof. Kay Lind Jr.','Berge Inc','1','West','Ipsam qui id saepe itaque quibusdam enim saepe ipsum.'),('Prof. Major Bailey','Klocko and Sons','1','West','Eligendi aut earum reiciendis quod.'),('Prof. Marianna Wolff','Hills and Sons','1','South','Amet dolore rerum velit.'),('Prof. Miguel Crist I','Klocko and Sons','2','New','O\'Conner, Hauck and Stamm'),('Prof. Miguel Crist IV','O\'Conner, Hauck and Stamm','3','North','Non deserunt ut praesentium dolores aut beatae.'),('Randall Rau MD','Smith Inc','2','South','Voluptate dolores deserunt veritatis dolorem eveniet.'),('Rosamond Bergnaum','Schulist-Bergstrom','3','Port','Nisi qui reiciendis quia facere aperiam ea dolore veniam.'),('Sage Braun I','Lowe-Reichel','2','North','Velit in dolore quos praesentium sint.'),('Santa Windler','Crona Inc','2','Port','Voluptas libero nihil consequatur quia doloribus.'),('Sedrick Russel','Cormier Inc','2','New','Doloremque excepturi eos consectetur rerum voluptatem ut.'),('Stephanie Sporer','Brekke, Stiedemann and Lowe','3','Lake','Quo ut dolorem aut.'),('Stewart Beahan','Champlin and Sons','3','Port','Distinctio sequi molestiae mollitia culpa aperiam cupiditate laudantium.'),('Tamia Pacocha','O\'Reilly-Lockman','3','East','Reiciendis consequuntur ullam iste.'),('Thomas Cormier','Hansen-Dach','1','Lake','Rerum est quam excepturi voluptatem explicabo amet vel sit.'),('Travis Lakin','Durgan-Rath','2','West','Cumque neque labore cumque distinctio dicta impedit mollitia.'),('Trudie Ratke','Lehner-Dibbert','1','East','Est qui cum ea nihil numquam quae.');
/*!40000 ALTER TABLE `clients_university` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_clients_university_to_users` BEFORE INSERT ON `clients_university` FOR EACH ROW BEGIN
	
	-- Добавляет в users клиента университета, если его там не было
	
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_client_university_to_clients` AFTER INSERT ON `clients_university` FOR EACH ROW BEGIN
	
	-- Добавляет в clients клиета university, если его там не было
	
	IF ((SELECT c2.full_name FROM clients c2 WHERE c2.full_name = NEW.full_name) = NEW.full_name)
	THEN SET @a = 1;
	ELSE
		INSERT INTO clients (full_name, type_client)
	VALUES (NEW.full_name, 'university');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_client_university_from_clients` AFTER DELETE ON `clients_university` FOR EACH ROW BEGIN
	
	-- Удаляет клиента из clients при удалении из client_university
	
	DELETE FROM clients
	WHERE full_name = OLD.full_name AND 
		  type_client = 'university';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `my_orders_SOM`
--

DROP TABLE IF EXISTS `my_orders_SOM`;
/*!50001 DROP VIEW IF EXISTS `my_orders_SOM`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_orders_SOM` AS SELECT 
 1 AS `month`,
 1 AS `year`,
 1 AS `orders`,
 1 AS `price`,
 1 AS `salary`,
 1 AS `lessons`,
 1 AS `profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `worker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type_order` set('university','SOM','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'university',
  `status` set('discuss','running','check','completed','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'discuss' COMMENT 'Статус работы: discuss - "Обсуждение", running - "В работе", check - "На проверке", completed - "Завершена", cancel - "Отмена".',
  `price` mediumint DEFAULT '0',
  `salary` mediumint DEFAULT '0' COMMENT 'Зарплата работнику',
  `profit` mediumint DEFAULT '0' COMMENT 'Прибыль',
  `comment` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `worker` (`worker`),
  KEY `client` (`client`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`worker`) REFERENCES `workers` (`full_name`) ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`client`) REFERENCES `clients` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1068,'Alfonzo Block IV','Alva Erdman','university','discuss,check',10063,2040,8023,'In omnis id dolorem temporibus qui.','1972-03-15 11:20:02','2021-04-01 00:52:39'),(1069,'Arianna Eichmann','Andres Welch','university','discuss,check',7508,1598,5910,'Blanditiis eius ratione eos et et libero cumque culpa.','1989-04-19 07:11:46','2021-04-01 00:52:39'),(1070,'Aric Shanahan','Braxton Haag','university','discuss',13604,518,13086,'Eos sunt earum reprehenderit tenetur quis beatae.','1978-05-14 14:04:32','2021-04-01 00:52:39'),(1071,'Arvid Schulist','Domingo Labadie','university','completed',5000,7052,-2052,'Est in doloribus necessitatibus blanditiis suscipit earum consequatur aliquam.','2005-06-28 17:37:14','2021-04-01 14:31:31'),(1072,'Austin Reichel','Ellie Glover I','university','check',17321,3006,14315,'Quis quam tempore in consequatur aliquam incidunt molestiae aliquam.','2009-12-24 21:53:37','2021-04-01 00:52:39'),(1073,'Ayana Wehner','Emilia Rempel','university','discuss,running',6531,4377,2154,'Quo autem quia possimus vero.','2020-04-05 04:58:56','2021-04-01 00:52:39'),(1076,'Baby Senger','Evan Stoltenberg','university','',3662,7246,-3584,'Reiciendis et numquam fugiat omnis illo.','2010-05-02 02:07:57','2021-04-01 00:52:39'),(1077,'Belle Hauck MD','Kirk Adams IV','university','running,check',12149,4788,7361,'Placeat cumque autem laboriosam optio exercitationem sapiente nihil.','1986-01-22 22:46:35','2021-04-01 00:52:39'),(1078,'Betsy Sipes','Laurianne Ankunding III','university','discuss,completed',6571,6438,133,'Eius iste ut quibusdam qui.','1983-10-23 03:24:09','2021-04-01 00:52:39'),(1079,'Brenna Koepp IV','Lilla Vandervort','university','running',12016,1063,10953,'Libero corrupti pariatur eveniet nulla maiores quia reprehenderit ipsam.','2019-06-14 19:43:56','2021-04-01 00:52:39'),(1084,'Brook Welch','Lizzie Conroy','university','discuss,running,check',18207,8986,9221,'Rem omnis quia alias aliquam.','1989-01-20 19:31:35','2021-04-01 00:52:39'),(1085,'Cali Maggio','Marc Jacobi','university','discuss,check',5429,3884,1545,'Nemo ratione autem velit vero hic odit repellat.','1994-09-02 14:41:36','2021-04-01 00:52:39'),(1086,'Carmella Brekke','Marcia Lueilwitz','university','completed',2606,2549,57,'Qui consectetur ut voluptates maiores.','2003-07-19 06:08:34','2021-04-01 00:52:39'),(1087,'Carson Hagenes','Melvin Vandervort','university','running,check',7566,6409,1157,'Praesentium ad quis ipsam.','1982-07-12 16:10:32','2021-04-01 00:52:39'),(1088,'Casper Cormier','Miss Cleta Buckridge Jr.','university','running',19693,1850,17843,'Consectetur illum iure expedita inventore iusto assumenda.','1976-12-01 03:35:38','2021-04-01 00:52:39'),(1089,'Cassidy Heathcote DD','Miss Concepcion Nienow','university','discuss,completed',2695,8267,-5572,'Sit doloribus et expedita ea debitis.','2020-12-02 17:44:48','2021-04-01 00:52:39'),(1092,'Cassie Gerlach','Miss Elta Gerhold II','university','running',15119,1128,13991,'Id quia tenetur ut sunt.','2007-04-22 04:51:10','2021-04-01 00:52:39'),(1093,'Cooper Prohaska','Miss Laurence Bogisich','university','check',1015,2064,-1049,'Nihil omnis qui omnis molestiae nobis voluptates.','2019-05-31 08:12:46','2021-04-01 00:52:39'),(1094,'Dalton Deckow','Miss Marilie Keeling V','university','discuss,running,check',2015,5451,-3436,'Non quod et nostrum possimus doloribus quas.','1994-11-17 20:23:04','2021-04-01 00:52:39'),(1095,'Daphnee Kilback','Mr. Agustin Walsh I','university','discuss,check',18596,7610,10986,'Et quia odit odio voluptatum tempore et dolorum.','1997-07-28 23:21:14','2021-04-01 00:52:39'),(1096,'Darlene Runolfsdotti','Mr. Monroe Stokes','university','check',4039,8554,-4515,'Explicabo reprehenderit consectetur sed atque.','1977-10-30 21:08:54','2021-04-01 00:52:39'),(1097,'Darren Kassulke','Otilia Braun','university','discuss',15857,1931,13926,'Recusandae sed tempora dolorum voluptatem atque consequatur consectetur.','2015-04-07 12:44:39','2021-04-01 00:52:39'),(1098,'Darrick Wilderman','Prof. Oscar Gottlieb IV','university','discuss,running',1644,9095,-7451,'Cum sequi eveniet animi praesentium eius.','1992-08-16 12:33:04','2021-04-01 00:52:39'),(1099,'Dayana Larkin','Prof. Reuben Morar','university','',1887,5880,-3993,'Voluptate minima dolorem sequi labore corrupti repellat excepturi.','2011-09-12 18:59:06','2021-04-01 00:52:39'),(1100,'Dedrick Von','Schuyler Wyman','university','completed',8895,1714,7181,'Ut repellat eligendi suscipit sit autem veniam.','1998-04-29 12:50:29','2021-04-01 00:52:39'),(1101,'Demetris Rempel Jr.','Stanley Friesen','university','',2824,1972,852,'Magnam consequatur quo commodi aperiam consequatur quam qui.','1998-12-08 11:31:35','2021-04-01 00:52:39'),(1102,'Denis Gerlach','Tobin Weber','university','discuss,running',17527,839,16688,'Eos blanditiis non deleniti unde modi mollitia maiores.','1988-10-24 16:22:42','2021-04-01 00:52:39'),(1103,'Domenica Collins','Vivien Reynolds','university','running',14499,2957,11542,'Minus voluptas esse esse nemo.','1976-09-10 20:13:36','2021-04-01 00:52:39'),(1104,'Dorothea Mertz','Walker Pacocha','university','running',16489,8743,7746,'Aspernatur sed laborum sed laborum dolor autem quia.','2003-04-16 02:54:30','2021-04-01 00:52:39'),(1105,'Doyle Nienow','Winifred Thompson','university','',6093,979,5114,'Sit earum saepe quia ea corporis beatae.','2005-08-08 19:52:18','2021-04-01 00:52:39'),(1106,'Dr. Amelie Lang','Alva Erdman','university','discuss,running',6174,271,5903,'Laboriosam qui tenetur qui soluta et consequatur.','2013-07-14 02:38:24','2021-04-01 00:52:39'),(1107,'Dr. Augusta Mann','Andres Welch','university','discuss,completed',1387,3379,-1992,'Et neque ea corrupti quas ut assumenda sit.','1986-05-24 05:11:10','2021-04-01 00:52:39'),(1108,'Dr. Aurore Auer','Braxton Haag','university','running',5714,9978,-4264,'Ex molestiae dicta eos dolor.','1991-10-17 17:27:50','2021-04-01 00:52:39'),(1109,'Dr. Fern Kohler','Domingo Labadie','university','discuss,running,check',6688,1953,4735,'Neque est quasi iusto aut voluptas.','2006-12-05 23:52:51','2021-04-01 00:52:39'),(1110,'Dr. Moriah Metz','Ellie Glover I','university','discuss,running',772,1260,-488,'Est nihil quos facere reiciendis dolor quo.','2013-03-27 11:05:48','2021-04-01 00:52:39'),(1111,'Dr. Oceane Ortiz','Emilia Rempel','university','discuss,check',14713,1091,13622,'Quas hic inventore eum eaque.','2009-08-30 13:18:16','2021-04-01 00:52:39'),(1112,'Dr. Terrence Zboncak','Evan Stoltenberg','university','running',3250,7460,-4210,'Vero et nulla voluptatem eum.','1995-07-29 16:28:40','2021-04-01 00:52:39'),(1113,'Durward Jacobi I','Kirk Adams IV','university','discuss,running',10951,6289,4662,'Et debitis enim consequatur saepe.','2007-04-06 01:10:34','2021-04-01 00:52:39'),(1114,'Ebony Dickens','Laurianne Ankunding III','university','',14863,1881,12982,'Id aliquid ea accusamus et natus alias.','1972-09-10 19:15:20','2021-04-01 00:52:39'),(1115,'Eddie Rosenbaum','Lilla Vandervort','university','discuss,running',12392,4511,7881,'Omnis aspernatur possimus corrupti quo quis et.','1994-03-16 23:28:57','2021-04-01 00:52:39'),(1116,'Efren Nienow','Lizzie Conroy','university','discuss,running',6945,6713,232,'Nam dolorem enim error et.','2011-02-08 20:26:28','2021-04-01 00:52:39'),(1117,'Elena Corwin','Marc Jacobi','university','running',10888,8418,2470,'Dignissimos dolor modi occaecati nesciunt voluptatem pariatur explicabo.','2013-10-13 18:42:32','2021-04-01 00:52:39'),(1118,'Elsie Howe','Marcia Lueilwitz','university','discuss,completed',5620,6233,-613,'Architecto aut vel tempore et.','1989-02-06 23:33:17','2021-04-01 00:52:39'),(1119,'Eryn Mante','Melvin Vandervort','university','check',11120,8916,2204,'Deleniti vel sed autem.','1986-02-17 10:59:15','2021-04-01 00:52:39'),(1120,'Favian Gleason','Miss Cleta Buckridge Jr.','university','running',1058,2262,-1204,'Velit non sequi nihil nemo libero ut.','2002-04-28 09:22:08','2021-04-01 00:52:39'),(1121,'Francisco Collier Jr','Miss Concepcion Nienow','university','running,check',4781,7855,-3074,'Expedita laboriosam qui cumque vitae odit rerum.','1985-10-20 16:56:49','2021-04-01 00:52:39'),(1122,'Haskell Blick','Miss Elta Gerhold II','university','running',2360,2991,-631,'Fugiat minus voluptate quia eum voluptatem culpa.','1977-12-26 18:49:46','2021-04-01 00:52:39'),(1123,'Hazel Kerluke','Miss Laurence Bogisich','university','discuss,check',6513,8166,-1653,'Molestias non placeat laudantium eligendi et sed.','2001-08-14 02:50:16','2021-04-01 00:52:39'),(1124,'Henri Kshlerin','Miss Marilie Keeling V','university','check',3155,2774,381,'Eveniet sed voluptatum molestiae sunt ea quia fugit.','2018-09-23 13:29:51','2021-04-01 00:52:39'),(1125,'Jack Towne','Mr. Agustin Walsh I','university','',18552,7632,10920,'Quaerat et accusantium rem rem dolore pariatur.','2009-06-12 08:47:39','2021-04-01 00:52:39'),(1126,'Jennifer Adams','Mr. Monroe Stokes','university','',19167,2794,16373,'Hic quia qui amet delectus pariatur voluptatum est.','2013-07-05 11:40:00','2021-04-01 00:52:39'),(1127,'Jordan Collins','Otilia Braun','university','check',10555,8795,1760,'Veniam tenetur consequuntur laudantium in amet et facere.','2006-05-11 06:54:57','2021-04-01 00:52:39'),(1128,'June Mills','Prof. Oscar Gottlieb IV','university','discuss,running,check',8370,9037,-667,'Non est dignissimos eveniet quia ipsam quia aut.','1988-04-05 02:53:52','2021-04-01 00:52:39'),(1129,'Karson Auer','Prof. Reuben Morar','university','discuss,running',12522,8509,4013,'Voluptates possimus velit et exercitationem quis ipsa.','2018-04-05 10:51:02','2021-04-01 00:52:39'),(1130,'Larue Kuvalis','Schuyler Wyman','university','discuss',8508,9133,-625,'Nesciunt temporibus minima ut enim ut dolorum.','2009-07-19 18:27:51','2021-04-01 00:52:39'),(1131,'Laurel Johnson','Stanley Friesen','university','',6458,9140,-2682,'Optio autem voluptates et delectus deleniti ut.','1999-12-26 19:53:48','2021-04-01 00:52:39'),(1132,'Lavinia Stroman Jr.','Tobin Weber','university','running',17283,8894,8389,'Ad rerum consequatur distinctio quasi.','1971-07-03 22:44:32','2021-04-01 00:52:39'),(1133,'Leanne Klocko','Vivien Reynolds','university','discuss,running',1379,8636,-7257,'Odio ea in et veniam.','1984-06-25 09:27:11','2021-04-01 00:52:39'),(1134,'Lelah Collins','Walker Pacocha','university','discuss,running,check',10011,7066,2945,'Et velit perferendis quas vel culpa iusto.','1980-02-08 03:01:56','2021-04-01 00:52:39'),(1135,'Linda Maggio','Winifred Thompson','university','running',13341,8202,5139,'Magnam provident necessitatibus assumenda illo voluptatem sed pariatur.','1971-11-29 12:49:36','2021-04-01 00:52:39'),(1136,'Lorine Oberbrunner','Alva Erdman','university','discuss,running',13796,8283,5513,'Qui eaque repudiandae ipsa neque quas at.','2001-07-14 19:09:10','2021-04-01 00:52:39'),(1137,'Madaline Smith MD','Andres Welch','university','discuss,completed',8543,3631,4912,'Beatae praesentium animi delectus non magnam et similique.','2000-11-18 12:33:42','2021-04-01 00:52:39'),(1138,'Marc Lowe','Braxton Haag','university','running',4917,9250,-4333,'Cupiditate debitis perferendis repellendus officia.','2007-10-15 21:46:26','2021-04-01 00:52:39'),(1139,'Melody Grady','Domingo Labadie','university','completed',15811,8630,7181,'Tenetur est recusandae cupiditate praesentium qui autem.','2014-09-02 10:42:03','2021-04-01 00:52:39'),(1140,'Miss Letitia Gutkows','Ellie Glover I','university','completed',2812,4836,-2024,'Repellat veritatis culpa expedita est reprehenderit ut.','1980-06-28 06:46:55','2021-04-01 00:52:39'),(1141,'Miss Lyda Cummerata ','Emilia Rempel','university','discuss,running',7230,2587,4643,'Odio pariatur illo neque enim.','1989-10-04 05:41:54','2021-04-01 00:52:39'),(1142,'Miss Mikayla Howell','Evan Stoltenberg','university','running,check',13715,2620,11095,'Minus eum doloribus expedita nihil et laboriosam.','2005-01-29 06:54:48','2021-04-01 00:52:39'),(1143,'Miss Tiara Zboncak I','Kirk Adams IV','university','',19382,6058,13324,'Minima aut eum molestias quisquam quia et.','2003-04-26 03:42:26','2021-04-01 00:52:39'),(1144,'Modesta Nikolaus DDS','Laurianne Ankunding III','university','discuss,running',7874,1416,6458,'Vel ut aliquid amet magni laudantium modi.','1994-03-26 03:49:48','2021-04-01 00:52:39'),(1145,'Monte Bins','Lilla Vandervort','university','discuss,completed',13548,6506,7042,'Corrupti consequatur sequi repellat magni commodi.','2000-06-02 00:48:03','2021-04-01 00:52:39'),(1146,'Morgan McGlynn','Lizzie Conroy','university','discuss',4211,3483,728,'Hic et ut suscipit illo.','2017-07-10 01:36:34','2021-04-01 00:52:39'),(1147,'Mozelle Haag','Marc Jacobi','university','completed',12678,5124,7554,'Delectus ducimus eveniet rerum quia.','1970-05-18 20:41:07','2021-04-01 00:52:39'),(1148,'Mozelle Swaniawski','Marcia Lueilwitz','university','running',282,5950,-5668,'Id temporibus qui ea id velit ut.','1988-01-13 07:33:03','2021-04-01 00:52:39'),(1149,'Mr. Barney Dooley Sr','Melvin Vandervort','university','',16840,3946,12894,'Ut qui occaecati sit eligendi excepturi.','1977-02-10 11:23:38','2021-04-01 00:52:39'),(1150,'Mr. Brandt Ernser Sr','Miss Cleta Buckridge Jr.','university','discuss',7487,4045,3442,'Nesciunt nam voluptatem veritatis.','2005-11-01 09:15:27','2021-04-01 00:52:39'),(1151,'Mr. Darron Purdy','Miss Concepcion Nienow','university','discuss,completed',6630,8306,-1676,'Dolor et ea dolorum velit et tenetur asperiores.','1999-09-03 13:47:48','2021-04-01 00:52:39'),(1152,'Mr. Wyatt Hodkiewicz','Miss Elta Gerhold II','university','discuss,check',17205,4791,12414,'Molestias eaque asperiores veritatis ut.','1991-07-13 19:21:09','2021-04-01 00:52:39'),(1153,'Mrs. Alberta Hansen','Miss Laurence Bogisich','university','completed',12254,3845,8409,'Aut nihil omnis quos veritatis est commodi consequatur enim.','1983-12-29 00:04:24','2021-04-01 00:52:39'),(1154,'Mrs. Rachael Shields','Miss Marilie Keeling V','university','',5122,1339,3783,'Consectetur excepturi odit quam laudantium nemo repudiandae.','1984-07-23 20:42:21','2021-04-01 00:52:39'),(1155,'Ms. Janae Block','Mr. Agustin Walsh I','university','discuss,running',10293,5933,4360,'Consequatur aliquid nihil sit cum quasi cumque.','2011-12-09 19:50:57','2021-04-01 00:52:39'),(1156,'Nelson Wolf','Mr. Monroe Stokes','university','discuss,check',14173,3299,10874,'Ea qui vitae velit eos nam earum qui cumque.','1971-01-11 00:57:15','2021-04-01 00:52:39'),(1157,'Prof. Abel Reilly','Otilia Braun','university','completed',10785,7459,3326,'Quas quia doloribus nulla totam tempora error aut quas.','2002-12-21 21:37:03','2021-04-01 00:52:39'),(1158,'Prof. Adella Pagac','Prof. Oscar Gottlieb IV','university','discuss,running',7055,9256,-2201,'Eaque ut ipsum labore sint qui assumenda ut.','2008-04-21 10:52:04','2021-04-01 00:52:39'),(1159,'Prof. Austyn Ferry','Prof. Reuben Morar','university','completed',9660,4547,5113,'Officiis sequi aspernatur enim quaerat soluta.','1991-05-10 23:13:32','2021-04-01 00:52:39'),(1160,'Prof. Brandy Nikolau','Schuyler Wyman','university','discuss,check',19289,2380,16909,'Repellat nulla et quo quis exercitationem repudiandae.','1989-06-12 18:29:47','2021-04-01 00:52:39'),(1161,'Prof. Kay Lind Jr.','Stanley Friesen','university','check',615,6870,-6255,'Voluptatibus consectetur dolor eius et nisi libero.','2011-12-21 02:45:43','2021-04-01 00:52:39'),(1162,'Prof. Major Bailey','Tobin Weber','university','running,check',3137,5813,-2676,'Nam sint iusto maiores enim recusandae facilis aperiam sunt.','1987-07-15 06:26:34','2021-04-01 00:52:39'),(1163,'Prof. Marianna Wolff','Vivien Reynolds','university','discuss',6205,6507,-302,'Ducimus doloribus dolores dolorem optio sed natus.','1991-02-16 11:35:45','2021-04-01 00:52:39'),(1164,'Prof. Miguel Crist I','Walker Pacocha','university','discuss',9680,8015,1665,'Nihil eos eaque quasi sed.','2002-10-22 11:29:29','2021-04-01 00:52:39'),(1165,'Randall Rau MD','Winifred Thompson','university','running',4360,226,4134,'Quae vel doloremque consequuntur sint et ut reprehenderit repellendus.','1997-11-20 13:31:17','2021-04-01 00:52:39'),(1166,'Rosamond Bergnaum','Alva Erdman','university','discuss,check',16635,1368,15267,'In vel et voluptatum est consequatur quasi omnis sed.','1986-12-05 04:35:52','2021-04-01 00:52:39'),(1167,'Sage Braun I','Andres Welch','university','',11496,4833,6663,'Sunt in harum nostrum maiores aut.','2003-06-22 04:53:01','2021-04-01 00:52:39'),(1168,'Santa Windler','Braxton Haag','university','check',9297,8784,513,'Assumenda magnam commodi et perferendis illo ducimus.','1992-10-05 03:09:22','2021-04-01 00:52:39'),(1169,'Sedrick Russel','Domingo Labadie','university','',9535,2168,7367,'Expedita id voluptas ut architecto tempora.','1998-11-04 11:46:35','2021-04-01 00:52:39'),(1170,'Stephanie Sporer','Ellie Glover I','university','check',14552,7843,6709,'Ipsum nesciunt debitis impedit expedita.','1975-08-28 02:42:43','2021-04-01 00:52:39'),(1171,'Stewart Beahan','Emilia Rempel','university','check',16767,1652,15115,'Sequi id culpa voluptatem natus sunt incidunt.','1976-12-03 16:39:11','2021-04-01 00:52:39'),(1172,'Tamia Pacocha','Evan Stoltenberg','university','discuss,check',5636,5137,499,'Numquam aperiam similique sit.','1979-10-09 02:34:25','2021-04-01 00:52:39'),(1173,'Thomas Cormier','Kirk Adams IV','university','running',16443,598,15845,'Porro minus dolor explicabo ducimus quam rerum.','1985-02-12 19:56:21','2021-04-01 00:52:39'),(1174,'Travis Lakin','Laurianne Ankunding III','university','discuss',11739,157,11582,'At quibusdam sed quisquam ipsa tenetur aspernatur ut.','2004-10-01 12:13:21','2021-04-01 00:52:39'),(1175,'Trudie Ratke','Lilla Vandervort','university','discuss',3977,6373,-2396,'Quos expedita aperiam quisquam fuga harum maiores assumenda a.','2015-10-09 19:28:16','2021-04-01 00:52:39'),(1176,'Alfonzo Block IV','Lizzie Conroy','university','discuss,completed',15427,4625,10802,'Enim officiis eius aliquam labore et nihil laborum.','1990-01-25 05:34:50','2021-04-01 00:52:39'),(1177,'Arianna Eichmann','Marc Jacobi','university','running',2357,5573,-3216,'Voluptatibus repellat veritatis omnis asperiores enim illum sed alias.','2009-08-04 06:44:20','2021-04-01 00:52:39'),(1178,'Aric Shanahan','Marcia Lueilwitz','university','check',19747,2638,17109,'Soluta esse asperiores impedit laudantium.','2020-05-16 04:18:34','2021-04-01 00:52:39'),(1179,'Arvid Schulist','Melvin Vandervort','university','discuss,running',8268,4402,3866,'Expedita sed in eos iusto incidunt doloremque.','1971-04-17 03:05:37','2021-04-01 00:52:39'),(1180,'Austin Reichel','Miss Cleta Buckridge Jr.','university','discuss,running',13858,2022,11836,'Qui et sint laudantium repellendus voluptas.','1979-04-02 19:41:50','2021-04-01 00:52:39'),(1181,'Ayana Wehner','Miss Concepcion Nienow','university','discuss,running,check',9495,5554,3941,'Et nihil qui ut ducimus.','1983-09-04 07:04:07','2021-04-01 00:52:39'),(1182,'Baby Senger','Miss Elta Gerhold II','university','discuss,completed',3452,315,3137,'Nam sit neque vel perspiciatis.','1997-04-20 16:13:07','2021-04-01 00:52:39'),(1183,'Belle Hauck MD','Miss Laurence Bogisich','university','discuss,check',14167,1456,12711,'Non dolor omnis sunt eos suscipit enim facilis.','2020-07-10 17:10:37','2021-04-01 00:52:39'),(1184,'Betsy Sipes','Miss Marilie Keeling V','university','discuss,running',18614,4467,14147,'Provident officia et doloribus eveniet ad et illum.','2014-07-22 16:04:50','2021-04-01 00:52:39'),(1185,'Brenna Koepp IV','Mr. Agustin Walsh I','university','discuss,completed',9567,4588,4979,'Iste autem autem tenetur ut.','2005-01-21 17:58:42','2021-04-01 00:52:39'),(1188,'America Becker V','Evan Stoltenberg','SOM','discuss,check',52542,11340,41202,'Sequi id culpa voluptatem natus sunt incidunt.','2021-04-02 00:22:29','2021-04-02 00:38:13'),(1189,'Bethel Becker','Evan Stoltenberg','SOM','discuss,completed',10752,7816,2936,'Nam sit neque vel perspiciatis.','2021-04-02 00:27:21','2021-04-02 00:38:13'),(1190,'Carley Murphy','Ellie Glover I','SOM','',111834,1512,110322,'Expedita sed in eos iusto incidunt doloremque.','2021-04-02 00:27:27','2021-04-02 00:38:13'),(1191,'Chauncey Bogan III','Miss Concepcion Nienow','SOM','discuss',128408,9394,119014,'Sequi id culpa voluptatem natus sunt incidunt.','2021-04-02 00:27:32','2021-04-02 00:38:13'),(1194,'Dana Nitzsche','Marcia Lueilwitz','SOM','running',63768,44336,19432,'Nam sit neque vel perspiciatis.','2021-04-02 00:28:10','2021-04-02 00:38:13'),(1195,'Donny Bartoletti DVM','Miss Laurence Bogisich','SOM','discuss,running',7248,5106,2142,'Expedita sed in eos iusto incidunt doloremque.','2021-04-02 00:28:10','2021-04-02 00:38:13'),(1196,'Dr. Clemens Keeling','Alva Erdman','SOM','completed',37928,25712,12216,'Sequi id culpa voluptatem natus sunt incidunt.','2021-04-02 00:32:00','2021-04-02 00:38:13'),(1197,'Earnestine Wilderman','Evan Stoltenberg','SOM','check',50472,12429,38043,'Nam sit neque vel perspiciatis.','2021-04-02 00:32:08','2021-04-02 00:38:13'),(1198,'Eloisa Runolfsson','Ellie Glover I','SOM','discuss',0,0,0,'Sequi id culpa voluptatem natus sunt incidunt.','2021-04-02 00:32:08','2021-04-02 00:38:13');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_client_after_insert_to_orders` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
	
	-- Обновляет данные клиента после добавления заказа в orders. 
	
	UPDATE clients
		SET orders = (SELECT COUNT(*) FROM (SELECT * FROM orders o  WHERE o.client = NEW.client) as results1),
			pay = (SELECT SUM(price) FROM (SELECT * FROM orders o  WHERE o.client = NEW.client) as results1),
			profit = (SELECT SUM(profit) FROM (SELECT * FROM orders o  WHERE o.client = NEW.client) as results1)
	WHERE full_name = NEW.client;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_workers_after_insert_orders` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
	
	-- При добавлении заказа в orders обновляет работника
	
	UPDATE workers 
		SET orders = (SELECT COUNT(*) FROM (SELECT * FROM orders o  WHERE o.worker = NEW.worker) as results1),
			salary = (SELECT SUM(salary) FROM (SELECT * FROM orders o  WHERE o.worker = NEW.worker) as results1)
	WHERE full_name = NEW.worker;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_client_after_update_orders` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
	
	-- Обновляет клиента после обновления заказа (orders)
	
	UPDATE clients
		SET orders = (SELECT COUNT(*) FROM (SELECT * FROM orders o  WHERE o.client = NEW.client) as results1),
			pay = (SELECT SUM(price) FROM (SELECT * FROM orders o  WHERE o.client = NEW.client) as results1),
			profit = (SELECT SUM(profit) FROM (SELECT * FROM orders o  WHERE o.client = NEW.client) as results1)
	WHERE full_name = NEW.client;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_worker_after_update_orders` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
	
	-- Обновляет данные о worker после обновления orders
	
	UPDATE workers 
		SET orders = (SELECT COUNT(*) FROM (SELECT * FROM orders o  WHERE o.worker = NEW.worker) as results1),
			salary = (SELECT SUM(salary) FROM (SELECT * FROM orders o  WHERE o.worker = NEW.worker) as results1),
			profit = (SELECT SUM(profit) FROM (SELECT * FROM orders o  WHERE o.worker = NEW.worker) as results1)
	WHERE full_name = NEW.worker;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_worker_and_client_after_delete_orders` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
	
	-- Обновляет данные о worker после удаления orders
	
	UPDATE workers 
		SET orders = (SELECT COUNT(*) FROM (SELECT * FROM orders o  WHERE o.worker = OLD.worker) as results1),
			salary = (SELECT SUM(salary) FROM (SELECT * FROM orders o  WHERE o.worker = OLD.worker) as results1),
			profit = (SELECT SUM(profit) FROM (SELECT * FROM orders o  WHERE o.worker = OLD.worker) as results1)
	WHERE full_name = OLD.worker;


	-- Обновляет данные о clien после удаления orders
	
	UPDATE clients
		SET orders = (SELECT COUNT(*) FROM (SELECT * FROM orders o  WHERE o.client = OLD.client) as results1),
			pay = (SELECT SUM(price) FROM (SELECT * FROM orders o  WHERE o.client = OLD.client) as results1),
			profit = (SELECT SUM(profit) FROM (SELECT * FROM orders o  WHERE o.client = OLD.client) as results1)
	WHERE full_name = OLD.client;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders_SOM`
--

DROP TABLE IF EXISTS `orders_SOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_SOM` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Номер заказа',
  `client_SOM_child` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ребенок',
  `client_SOM_parent` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Родитель',
  `worker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Преподаватель',
  `subgect` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Предмет',
  `status` set('discuss','running','check','completed','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'discuss' COMMENT 'Статус работы: discuss - "Обсуждение", running - "В работе", check - "На проверке", completed - "Завершена", cancel - "Отмена".',
  `price` mediumint DEFAULT '0' COMMENT 'Цена за одно занятие',
  `salary` mediumint DEFAULT '0' COMMENT 'Зарплата работнику',
  `lessons` smallint unsigned DEFAULT '0' COMMENT 'Кол-во уроков',
  `profit` mediumint DEFAULT '0' COMMENT 'Общая прибыль',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_SOM_child` (`client_SOM_child`),
  KEY `client_SOM_parent` (`client_SOM_parent`),
  KEY `worker` (`worker`),
  CONSTRAINT `orders_SOM_ibfk_1` FOREIGN KEY (`client_SOM_child`) REFERENCES `client_SOM_childs` (`full_name`) ON UPDATE CASCADE,
  CONSTRAINT `orders_SOM_ibfk_2` FOREIGN KEY (`client_SOM_parent`) REFERENCES `client_SOM_parents` (`full_name`) ON UPDATE CASCADE,
  CONSTRAINT `orders_SOM_ibfk_3` FOREIGN KEY (`worker`) REFERENCES `workers` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы SOM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_SOM`
--

LOCK TABLES `orders_SOM` WRITE;
/*!40000 ALTER TABLE `orders_SOM` DISABLE KEYS */;
INSERT INTO `orders_SOM` VALUES (21,'Charlotte Windler','America Becker V','Evan Stoltenberg','placeat','discuss,check',5832,1260,9,41148,'1992-01-11 02:19:22','2021-04-02 00:38:57',NULL),(44,'Felipa Wehner','Bethel Becker','Evan Stoltenberg','repudiandae','discuss,completed',2688,1954,4,2936,'2004-09-10 19:46:12','2021-04-02 00:34:38',NULL),(46,'Frederick Ziemann','Carley Murphy','Ellie Glover I','architecto','',18639,252,6,110322,'1974-12-19 07:42:54','2021-04-02 00:34:38',NULL),(81,'Sydnee O Hara','Eloisa Runolfsson','Ellie Glover I','quis','discuss',11116,3589,0,0,'1995-03-17 00:02:56','2021-04-02 00:34:38',NULL),(105,'Mr. Cruz Yost','Dana Nitzsche','Marcia Lueilwitz','eos','running',7971,5542,8,19432,'1996-09-11 00:57:47','2021-04-02 00:34:38',NULL),(129,'Ms. Marjorie Kub V','Earnestine Wilderman','Evan Stoltenberg','blanditiis','check',16824,4143,3,38043,'1999-04-20 19:07:32','2021-04-02 00:34:38',NULL),(206,'Mabelle Senger','Chauncey Bogan III','Miss Concepcion Nienow','recusandae','discuss',18344,1342,7,119014,'2012-03-09 00:30:31','2021-04-02 00:34:38',NULL),(238,'Mrs. Kavon Leannon','Donny Bartoletti DVM','Miss Laurence Bogisich','id','discuss,running',1208,851,6,2142,'2005-07-31 17:04:59','2021-04-02 00:34:38',NULL),(298,'Ms. Hosea Heathcote','Dr. Clemens Keeling','Alva Erdman','qui','completed',9482,6428,4,12216,'1978-10-22 09:55:23','2021-04-02 00:34:38',NULL);
/*!40000 ALTER TABLE `orders_SOM` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_orders_SOM_before_insert` BEFORE INSERT ON `orders_SOM` FOR EACH ROW BEGIN
	
	-- Обновляет выручку заказа SOM
	
	SET NEW.profit = (NEW.price - NEW.salary) * NEW.lessons; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_order_SOM_to_orders` AFTER INSERT ON `orders_SOM` FOR EACH ROW BEGIN
	
	-- Добавляет в orders заказы из SOM
	
	INSERT INTO orders (client, worker, type_order, status, price, salary, profit, comment) 
	VALUES (NEW.client_SOM_parent, NEW.worker, 'SOM', NEW.status, NEW.price * NEW.lessons, NEW.salary * NEW.lessons, NEW.profit, NEW.comment);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_orders_SOM` BEFORE UPDATE ON `orders_SOM` FOR EACH ROW BEGIN
	
	-- Обновляет выгоду после обновления orders_SOM
	
	SET NEW.profit = (NEW.price - NEW.salary) * NEW.lessons; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_order_after_update_orders_SOM` AFTER UPDATE ON `orders_SOM` FOR EACH ROW BEGIN
	
	-- Обновляет заказы (orders) после обновления orders_SOM
	
	UPDATE orders
		SET client = NEW.client_SOM_parent,
		worker = NEW.worker,
		status = NEW.status,
		price = NEW.price * NEW.lessons,
		salary = NEW.salary * NEW.lessons,
		profit = NEW.profit,
		comment = NEW.comment
	WHERE created_at = OLD.created_at AND 
		  client = OLD.client_SOM_parent AND
		  worker = OLD.worker;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_orders_from_SOM` AFTER DELETE ON `orders_SOM` FOR EACH ROW BEGIN
	
	-- При удалении заказов SOM, удаляет заказ в orders
	
	DELETE FROM orders
	WHERE created_at = OLD.created_at AND 
		  client = OLD.client_SOM_parent AND
		  worker = OLD.worker;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `orders_univer`
--

DROP TABLE IF EXISTS `orders_univer`;
/*!50001 DROP VIEW IF EXISTS `orders_univer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders_univer` AS SELECT 
 1 AS `month`,
 1 AS `year`,
 1 AS `orders`,
 1 AS `price`,
 1 AS `salary`,
 1 AS `profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders_university`
--

DROP TABLE IF EXISTS `orders_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_university` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Номер заказа',
  `client_university` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Клиент',
  `worker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Работник',
  `status` set('discuss','running','check','completed','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'discuss' COMMENT 'Статус работы: discuss - "Обсуждение", running - "В работе", check - "На проверке", completed - "Завершена", cancel - "Отмена".',
  `type_order` set('test','coursework','exam','task','paper','project','lab','diploma','anti-plagiarism') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'task',
  `price` mediumint DEFAULT '0' COMMENT 'Цена зказа',
  `salary` mediumint DEFAULT '0' COMMENT 'Зарплата работника',
  `profit` mediumint DEFAULT '0' COMMENT 'Прибыль',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deadline` date DEFAULT NULL COMMENT 'Дата сдачи',
  `comment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_university` (`client_university`),
  KEY `worker` (`worker`),
  CONSTRAINT `orders_university_ibfk_1` FOREIGN KEY (`client_university`) REFERENCES `clients_university` (`full_name`) ON UPDATE CASCADE,
  CONSTRAINT `orders_university_ibfk_2` FOREIGN KEY (`worker`) REFERENCES `workers` (`full_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы университета';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_university`
--

LOCK TABLES `orders_university` WRITE;
/*!40000 ALTER TABLE `orders_university` DISABLE KEYS */;
INSERT INTO `orders_university` VALUES (1,'Eddie Rosenbaum','Lilla Vandervort','discuss,running','test,coursework,exam',12392,4511,7881,'1994-03-16 23:28:57','2021-04-01 00:52:39','1983-06-29','Omnis aspernatur possimus corrupti quo quis et.'),(4,'Arvid Schulist','Domingo Labadie','completed','test,exam',5000,7052,-2052,'2005-06-28 17:37:14','2021-04-01 14:31:31','1988-03-09','Est in doloribus necessitatibus blanditiis suscipit earum consequatur aliquam.'),(6,'Prof. Miguel Crist I','Walker Pacocha','discuss','coursework,exam',9680,8015,1665,'2002-10-22 11:29:29','2021-04-01 00:52:39','2019-02-22','Nihil eos eaque quasi sed.'),(8,'Cassidy Heathcote DD','Miss Concepcion Nienow','discuss,completed','coursework',2695,8267,-5572,'2020-12-02 17:44:48','2021-04-01 00:52:39','1994-05-10','Sit doloribus et expedita ea debitis.'),(13,'Dalton Deckow','Miss Marilie Keeling V','discuss,running,check','test,coursework',2015,5451,-3436,'1994-11-17 20:23:04','2021-04-01 00:52:39','1976-09-25','Non quod et nostrum possimus doloribus quas.'),(16,'Randall Rau MD','Winifred Thompson','running','exam',4360,226,4134,'1997-11-20 13:31:17','2021-04-01 00:52:39','2001-12-28','Quae vel doloremque consequuntur sint et ut reprehenderit repellendus.'),(17,'Dr. Aurore Auer','Braxton Haag','running','coursework,exam',5714,9978,-4264,'1991-10-17 17:27:50','2021-04-01 00:52:39','2020-01-26','Ex molestiae dicta eos dolor.'),(19,'Brenna Koepp IV','Mr. Agustin Walsh I','discuss,completed','test,coursework',9567,4588,4979,'2005-01-21 17:58:42','2021-04-01 00:52:39','1981-04-24','Iste autem autem tenetur ut.'),(20,'Lelah Collins','Walker Pacocha','discuss,running,check','test,coursework',10011,7066,2945,'1980-02-08 03:01:56','2021-04-01 00:52:39','1979-03-14','Et velit perferendis quas vel culpa iusto.'),(22,'Alfonzo Block IV','Lizzie Conroy','discuss,completed','test,task',15427,4625,10802,'1990-01-25 05:34:50','2021-04-01 00:52:39','1993-03-29','Enim officiis eius aliquam labore et nihil laborum.'),(33,'Arianna Eichmann','Andres Welch','discuss,check','test,coursework,exam',7508,1598,5910,'1989-04-19 07:11:46','2021-04-01 00:52:39','1996-10-31','Blanditiis eius ratione eos et et libero cumque culpa.'),(34,'Dorothea Mertz','Walker Pacocha','running','coursework,exam',16489,8743,7746,'2003-04-16 02:54:30','2021-04-01 00:52:39','2013-11-13','Aspernatur sed laborum sed laborum dolor autem quia.'),(37,'Linda Maggio','Winifred Thompson','running','test,exam',13341,8202,5139,'1971-11-29 12:49:36','2021-04-01 00:52:39','1999-09-23','Magnam provident necessitatibus assumenda illo voluptatem sed pariatur.'),(38,'Haskell Blick','Miss Elta Gerhold II','running','task',2360,2991,-631,'1977-12-26 18:49:46','2021-04-01 00:52:39','1999-07-14','Fugiat minus voluptate quia eum voluptatem culpa.'),(45,'Durward Jacobi I','Kirk Adams IV','discuss,running','test',10951,6289,4662,'2007-04-06 01:10:34','2021-04-01 00:52:39','1973-09-14','Et debitis enim consequatur saepe.'),(56,'Ayana Wehner','Emilia Rempel','discuss,running','coursework',6531,4377,2154,'2020-04-05 04:58:56','2021-04-01 00:52:39','1983-04-22','Quo autem quia possimus vero.'),(58,'Aric Shanahan','Braxton Haag','discuss','task',13604,518,13086,'1978-05-14 14:04:32','2021-04-01 00:52:39','2011-03-25','Eos sunt earum reprehenderit tenetur quis beatae.'),(62,'Betsy Sipes','Laurianne Ankunding III','discuss,completed','test,exam',6571,6438,133,'1983-10-23 03:24:09','2021-04-01 00:52:39','2004-10-13','Eius iste ut quibusdam qui.'),(63,'Belle Hauck MD','Miss Laurence Bogisich','discuss,check','exam',14167,1456,12711,'2020-07-10 17:10:37','2021-04-01 00:52:39','2009-12-13','Non dolor omnis sunt eos suscipit enim facilis.'),(64,'Carson Hagenes','Melvin Vandervort','running,check','test,coursework,exam',7566,6409,1157,'1982-07-12 16:10:32','2021-04-01 00:52:39','2003-01-11','Praesentium ad quis ipsam.'),(66,'Dayana Larkin','Prof. Reuben Morar','','coursework,exam',1887,5880,-3993,'2011-09-12 18:59:06','2021-04-01 00:52:39','1980-08-31','Voluptate minima dolorem sequi labore corrupti repellat excepturi.'),(67,'Miss Letitia Gutkows','Ellie Glover I','completed','test,task',2812,4836,-2024,'1980-06-28 06:46:55','2021-04-01 00:52:39','1987-12-13','Repellat veritatis culpa expedita est reprehenderit ut.'),(71,'Mr. Darron Purdy','Miss Concepcion Nienow','discuss,completed','coursework,exam',6630,8306,-1676,'1999-09-03 13:47:48','2021-04-01 00:52:39','2009-01-22','Dolor et ea dolorum velit et tenetur asperiores.'),(72,'Prof. Marianna Wolff','Vivien Reynolds','discuss','test',6205,6507,-302,'1991-02-16 11:35:45','2021-04-01 00:52:39','1972-05-06','Ducimus doloribus dolores dolorem optio sed natus.'),(75,'Jack Towne','Mr. Agustin Walsh I','','test',18552,7632,10920,'2009-06-12 08:47:39','2021-04-01 00:52:39','1970-01-29','Quaerat et accusantium rem rem dolore pariatur.'),(77,'Mr. Barney Dooley Sr','Melvin Vandervort','','test,coursework,exam',16840,3946,12894,'1977-02-10 11:23:38','2021-04-01 00:52:39','1985-01-15','Ut qui occaecati sit eligendi excepturi.'),(78,'Santa Windler','Braxton Haag','check','coursework',9297,8784,513,'1992-10-05 03:09:22','2021-04-01 00:52:39','2005-07-28','Assumenda magnam commodi et perferendis illo ducimus.'),(81,'Daphnee Kilback','Mr. Agustin Walsh I','discuss,check','test,exam',18596,7610,10986,'1997-07-28 23:21:14','2021-04-01 00:52:39','2008-09-06','Et quia odit odio voluptatum tempore et dolorum.'),(82,'Casper Cormier','Miss Cleta Buckridge Jr.','running','test,coursework,exam',19693,1850,17843,'1976-12-01 03:35:38','2021-04-01 00:52:39','1988-04-19','Consectetur illum iure expedita inventore iusto assumenda.'),(84,'Monte Bins','Lilla Vandervort','discuss,completed','test',13548,6506,7042,'2000-06-02 00:48:03','2021-04-01 00:52:39','1991-07-27','Corrupti consequatur sequi repellat magni commodi.'),(85,'Karson Auer','Prof. Reuben Morar','discuss,running','test,exam',12522,8509,4013,'2018-04-05 10:51:02','2021-04-01 00:52:39','1977-11-05','Voluptates possimus velit et exercitationem quis ipsa.'),(87,'Brenna Koepp IV','Lilla Vandervort','running','test,task',12016,1063,10953,'2019-06-14 19:43:56','2021-04-01 00:52:39','1991-08-07','Libero corrupti pariatur eveniet nulla maiores quia reprehenderit ipsam.'),(88,'Favian Gleason','Miss Cleta Buckridge Jr.','running','test,coursework,exam',1058,2262,-1204,'2002-04-28 09:22:08','2021-04-01 00:52:39','1976-05-30','Velit non sequi nihil nemo libero ut.'),(93,'Ms. Janae Block','Mr. Agustin Walsh I','discuss,running','test,coursework,exam',10293,5933,4360,'2011-12-09 19:50:57','2021-04-01 00:52:39','1998-04-03','Consequatur aliquid nihil sit cum quasi cumque.'),(96,'Cali Maggio','Marc Jacobi','discuss,check','coursework',5429,3884,1545,'1994-09-02 14:41:36','2021-04-01 00:52:39','2014-11-17','Nemo ratione autem velit vero hic odit repellat.'),(99,'Ayana Wehner','Miss Concepcion Nienow','discuss,running,check','test,coursework,exam',9495,5554,3941,'1983-09-04 07:04:07','2021-04-01 00:52:39','1990-10-17','Et nihil qui ut ducimus.'),(101,'Nelson Wolf','Mr. Monroe Stokes','discuss,check','test,task',14173,3299,10874,'1971-01-11 00:57:15','2021-04-01 00:52:39','2002-12-06','Ea qui vitae velit eos nam earum qui cumque.'),(107,'Mrs. Rachael Shields','Miss Marilie Keeling V','','test,coursework,exam',5122,1339,3783,'1984-07-23 20:42:21','2021-04-01 00:52:39','1979-11-13','Consectetur excepturi odit quam laudantium nemo repudiandae.'),(109,'Francisco Collier Jr','Miss Concepcion Nienow','running,check','coursework',4781,7855,-3074,'1985-10-20 16:56:49','2021-04-01 00:52:39','1970-09-05','Expedita laboriosam qui cumque vitae odit rerum.'),(114,'Demetris Rempel Jr.','Stanley Friesen','','task',2824,1972,852,'1998-12-08 11:31:35','2021-04-01 00:52:39','2005-06-08','Magnam consequatur quo commodi aperiam consequatur quam qui.'),(116,'Mozelle Haag','Marc Jacobi','completed','exam',12678,5124,7554,'1970-05-18 20:41:07','2021-04-01 00:52:39','1997-04-15','Delectus ducimus eveniet rerum quia.'),(117,'Alfonzo Block IV','Alva Erdman','discuss,check','task',10063,2040,8023,'1972-03-15 11:20:02','2021-04-01 00:52:39','2014-12-04','In omnis id dolorem temporibus qui.'),(120,'Dr. Oceane Ortiz','Emilia Rempel','discuss,check','test,coursework',14713,1091,13622,'2009-08-30 13:18:16','2021-04-01 00:52:39','2020-05-25','Quas hic inventore eum eaque.'),(133,'Mrs. Alberta Hansen','Miss Laurence Bogisich','completed','test,exam',12254,3845,8409,'1983-12-29 00:04:24','2021-04-01 00:52:39','1981-11-02','Aut nihil omnis quos veritatis est commodi consequatur enim.'),(137,'Lorine Oberbrunner','Alva Erdman','discuss,running','test,coursework,exam',13796,8283,5513,'2001-07-14 19:09:10','2021-04-01 00:52:39','2013-01-13','Qui eaque repudiandae ipsa neque quas at.'),(138,'Prof. Major Bailey','Tobin Weber','running,check','coursework,exam',3137,5813,-2676,'1987-07-15 06:26:34','2021-04-01 00:52:39','2009-07-19','Nam sint iusto maiores enim recusandae facilis aperiam sunt.'),(146,'Melody Grady','Domingo Labadie','completed','coursework',15811,8630,7181,'2014-09-02 10:42:03','2021-04-01 00:52:39','2018-08-05','Tenetur est recusandae cupiditate praesentium qui autem.'),(148,'Prof. Kay Lind Jr.','Stanley Friesen','check','exam',615,6870,-6255,'2011-12-21 02:45:43','2021-04-01 00:52:39','2005-06-17','Voluptatibus consectetur dolor eius et nisi libero.'),(151,'Dr. Amelie Lang','Alva Erdman','discuss,running','test,coursework,exam',6174,271,5903,'2013-07-14 02:38:24','2021-04-01 00:52:39','1992-11-28','Laboriosam qui tenetur qui soluta et consequatur.'),(152,'Prof. Adella Pagac','Prof. Oscar Gottlieb IV','discuss,running','test,task',7055,9256,-2201,'2008-04-21 10:52:04','2021-04-01 00:52:39','1982-09-11','Eaque ut ipsum labore sint qui assumenda ut.'),(154,'Baby Senger','Miss Elta Gerhold II','discuss,completed','coursework,exam',3452,315,3137,'1997-04-20 16:13:07','2021-04-01 00:52:39','1981-09-19','Nam sit neque vel perspiciatis.'),(159,'Darlene Runolfsdotti','Mr. Monroe Stokes','check','test,exam',4039,8554,-4515,'1977-10-30 21:08:54','2021-04-01 00:52:39','1975-02-08','Explicabo reprehenderit consectetur sed atque.'),(162,'Dr. Terrence Zboncak','Evan Stoltenberg','running','exam',3250,7460,-4210,'1995-07-29 16:28:40','2021-04-01 00:52:39','1991-08-26','Vero et nulla voluptatem eum.'),(167,'Elena Corwin','Marc Jacobi','running','test,exam',10888,8418,2470,'2013-10-13 18:42:32','2021-04-01 00:52:39','2012-05-27','Dignissimos dolor modi occaecati nesciunt voluptatem pariatur explicabo.'),(169,'Marc Lowe','Braxton Haag','running','task',4917,9250,-4333,'2007-10-15 21:46:26','2021-04-01 00:52:39','2004-05-06','Cupiditate debitis perferendis repellendus officia.'),(172,'Miss Tiara Zboncak I','Kirk Adams IV','','test',19382,6058,13324,'2003-04-26 03:42:26','2021-04-01 00:52:39','2014-10-31','Minima aut eum molestias quisquam quia et.'),(176,'Dr. Fern Kohler','Domingo Labadie','discuss,running,check','coursework,exam',6688,1953,4735,'2006-12-05 23:52:51','2021-04-01 00:52:39','1971-08-01','Neque est quasi iusto aut voluptas.'),(179,'Henri Kshlerin','Miss Marilie Keeling V','check','coursework',3155,2774,381,'2018-09-23 13:29:51','2021-04-01 00:52:39','1989-10-11','Eveniet sed voluptatum molestiae sunt ea quia fugit.'),(180,'Mr. Wyatt Hodkiewicz','Miss Elta Gerhold II','discuss,check','task',17205,4791,12414,'1991-07-13 19:21:09','2021-04-01 00:52:39','1986-04-13','Molestias eaque asperiores veritatis ut.'),(181,'Belle Hauck MD','Kirk Adams IV','running,check','task',12149,4788,7361,'1986-01-22 22:46:35','2021-04-01 00:52:39','2010-06-20','Placeat cumque autem laboriosam optio exercitationem sapiente nihil.'),(185,'Arianna Eichmann','Marc Jacobi','running','test,coursework,exam',2357,5573,-3216,'2009-08-04 06:44:20','2021-04-01 00:52:39','1998-09-23','Voluptatibus repellat veritatis omnis asperiores enim illum sed alias.'),(188,'Prof. Austyn Ferry','Prof. Reuben Morar','completed','coursework',9660,4547,5113,'1991-05-10 23:13:32','2021-04-01 00:52:39','1981-02-23','Officiis sequi aspernatur enim quaerat soluta.'),(191,'Aric Shanahan','Marcia Lueilwitz','check','test,coursework,exam',19747,2638,17109,'2020-05-16 04:18:34','2021-04-01 00:52:39','2007-08-02','Soluta esse asperiores impedit laudantium.'),(192,'Austin Reichel','Miss Cleta Buckridge Jr.','discuss,running','coursework,exam',13858,2022,11836,'1979-04-02 19:41:50','2021-04-01 00:52:39','1971-08-03','Qui et sint laudantium repellendus voluptas.'),(193,'Ebony Dickens','Laurianne Ankunding III','','exam',14863,1881,12982,'1972-09-10 19:15:20','2021-04-01 00:52:39','1974-04-27','Id aliquid ea accusamus et natus alias.'),(194,'Baby Senger','Evan Stoltenberg','','test,exam',3662,7246,-3584,'2010-05-02 02:07:57','2021-04-01 00:52:39','2007-06-25','Reiciendis et numquam fugiat omnis illo.'),(204,'Stephanie Sporer','Ellie Glover I','check','coursework,exam',14552,7843,6709,'1975-08-28 02:42:43','2021-04-01 00:52:39','1992-09-28','Ipsum nesciunt debitis impedit expedita.'),(205,'Miss Mikayla Howell','Evan Stoltenberg','running,check','test,coursework',13715,2620,11095,'2005-01-29 06:54:48','2021-04-01 00:52:39','1990-02-18','Minus eum doloribus expedita nihil et laboriosam.'),(209,'Mr. Brandt Ernser Sr','Miss Cleta Buckridge Jr.','discuss','coursework,exam',7487,4045,3442,'2005-11-01 09:15:27','2021-04-01 00:52:39','2011-02-09','Nesciunt nam voluptatem veritatis.'),(211,'Darrick Wilderman','Prof. Oscar Gottlieb IV','discuss,running','test,coursework',1644,9095,-7451,'1992-08-16 12:33:04','2021-04-01 00:52:39','1989-07-12','Cum sequi eveniet animi praesentium eius.'),(212,'Sedrick Russel','Domingo Labadie','','coursework',9535,2168,7367,'1998-11-04 11:46:35','2021-04-01 00:52:39','1977-12-09','Expedita id voluptas ut architecto tempora.'),(214,'Larue Kuvalis','Schuyler Wyman','discuss','test,exam',8508,9133,-625,'2009-07-19 18:27:51','2021-04-01 00:52:39','1984-11-30','Nesciunt temporibus minima ut enim ut dolorum.'),(215,'Domenica Collins','Vivien Reynolds','running','test,coursework',14499,2957,11542,'1976-09-10 20:13:36','2021-04-01 00:52:39','2008-07-10','Minus voluptas esse esse nemo.'),(218,'Prof. Abel Reilly','Otilia Braun','completed','exam',10785,7459,3326,'2002-12-21 21:37:03','2021-04-01 00:52:39','1976-02-07','Quas quia doloribus nulla totam tempora error aut quas.'),(220,'June Mills','Prof. Oscar Gottlieb IV','discuss,running,check','coursework,exam',8370,9037,-667,'1988-04-05 02:53:52','2021-04-01 00:52:39','1970-01-04','Non est dignissimos eveniet quia ipsam quia aut.'),(224,'Sage Braun I','Andres Welch','','test',11496,4833,6663,'2003-06-22 04:53:01','2021-04-01 00:52:39','2000-09-12','Sunt in harum nostrum maiores aut.'),(227,'Modesta Nikolaus DDS','Laurianne Ankunding III','discuss,running','test',7874,1416,6458,'1994-03-26 03:49:48','2021-04-01 00:52:39','2020-02-05','Vel ut aliquid amet magni laudantium modi.'),(232,'Laurel Johnson','Stanley Friesen','','test,coursework',6458,9140,-2682,'1999-12-26 19:53:48','2021-04-01 00:52:39','1978-03-27','Optio autem voluptates et delectus deleniti ut.'),(233,'Trudie Ratke','Lilla Vandervort','discuss','test,task',3977,6373,-2396,'2015-10-09 19:28:16','2021-04-01 00:52:39','2012-10-27','Quos expedita aperiam quisquam fuga harum maiores assumenda a.'),(235,'Cassie Gerlach','Miss Elta Gerhold II','running','coursework,exam',15119,1128,13991,'2007-04-22 04:51:10','2021-04-01 00:52:39','2014-04-01','Id quia tenetur ut sunt.'),(237,'Madaline Smith MD','Andres Welch','discuss,completed','test,task',8543,3631,4912,'2000-11-18 12:33:42','2021-04-01 00:52:39','1979-02-18','Beatae praesentium animi delectus non magnam et similique.'),(238,'Dr. Moriah Metz','Ellie Glover I','discuss,running','test,task',772,1260,-488,'2013-03-27 11:05:48','2021-04-01 00:52:39','2005-04-15','Est nihil quos facere reiciendis dolor quo.'),(239,'Cooper Prohaska','Miss Laurence Bogisich','check','test,exam',1015,2064,-1049,'2019-05-31 08:12:46','2021-04-01 00:52:39','2003-04-16','Nihil omnis qui omnis molestiae nobis voluptates.'),(245,'Prof. Brandy Nikolau','Schuyler Wyman','discuss,check','test,coursework',19289,2380,16909,'1989-06-12 18:29:47','2021-04-01 00:52:39','1974-10-22','Repellat nulla et quo quis exercitationem repudiandae.'),(247,'Miss Lyda Cummerata ','Emilia Rempel','discuss,running','task',7230,2587,4643,'1989-10-04 05:41:54','2021-04-01 00:52:39','2014-07-21','Odio pariatur illo neque enim.'),(249,'Morgan McGlynn','Lizzie Conroy','discuss','test,task',4211,3483,728,'2017-07-10 01:36:34','2021-04-01 00:52:39','1977-05-31','Hic et ut suscipit illo.'),(253,'Doyle Nienow','Winifred Thompson','','test',6093,979,5114,'2005-08-08 19:52:18','2021-04-01 00:52:39','2013-01-31','Sit earum saepe quia ea corporis beatae.'),(256,'Betsy Sipes','Miss Marilie Keeling V','discuss,running','test,task',18614,4467,14147,'2014-07-22 16:04:50','2021-04-01 00:52:39','2010-03-22','Provident officia et doloribus eveniet ad et illum.'),(257,'Carmella Brekke','Marcia Lueilwitz','completed','coursework',2606,2549,57,'2003-07-19 06:08:34','2021-04-01 00:52:39','1995-05-25','Qui consectetur ut voluptates maiores.'),(260,'Brook Welch','Lizzie Conroy','discuss,running,check','exam',18207,8986,9221,'1989-01-20 19:31:35','2021-04-01 00:52:39','1994-12-04','Rem omnis quia alias aliquam.'),(261,'Mozelle Swaniawski','Marcia Lueilwitz','running','coursework',282,5950,-5668,'1988-01-13 07:33:03','2021-04-01 00:52:39','1975-07-24','Id temporibus qui ea id velit ut.'),(265,'Rosamond Bergnaum','Alva Erdman','discuss,check','test,coursework,exam',16635,1368,15267,'1986-12-05 04:35:52','2021-04-01 00:52:39','2003-06-15','In vel et voluptatum est consequatur quasi omnis sed.'),(269,'Thomas Cormier','Kirk Adams IV','running','test,coursework,exam',16443,598,15845,'1985-02-12 19:56:21','2021-04-01 00:52:39','1981-10-17','Porro minus dolor explicabo ducimus quam rerum.'),(271,'Jennifer Adams','Mr. Monroe Stokes','','test',19167,2794,16373,'2013-07-05 11:40:00','2021-04-01 00:52:39','2005-08-07','Hic quia qui amet delectus pariatur voluptatum est.'),(274,'Austin Reichel','Ellie Glover I','check','coursework',17321,3006,14315,'2009-12-24 21:53:37','2021-04-01 00:52:39','1997-07-29','Quis quam tempore in consequatur aliquam incidunt molestiae aliquam.'),(275,'Tamia Pacocha','Evan Stoltenberg','discuss,check','test',5636,5137,499,'1979-10-09 02:34:25','2021-04-01 00:52:39','1973-08-17','Numquam aperiam similique sit.'),(276,'Jordan Collins','Otilia Braun','check','exam',10555,8795,1760,'2006-05-11 06:54:57','2021-04-01 00:52:39','1996-02-12','Veniam tenetur consequuntur laudantium in amet et facere.'),(278,'Darren Kassulke','Otilia Braun','discuss','task',15857,1931,13926,'2015-04-07 12:44:39','2021-04-01 00:52:39','1972-01-06','Recusandae sed tempora dolorum voluptatem atque consequatur consectetur.'),(280,'Eryn Mante','Melvin Vandervort','check','task',11120,8916,2204,'1986-02-17 10:59:15','2021-04-01 00:52:39','1994-08-24','Deleniti vel sed autem.'),(281,'Denis Gerlach','Tobin Weber','discuss,running','test,exam',17527,839,16688,'1988-10-24 16:22:42','2021-04-01 00:52:39','1996-06-11','Eos blanditiis non deleniti unde modi mollitia maiores.'),(285,'Efren Nienow','Lizzie Conroy','discuss,running','test',6945,6713,232,'2011-02-08 20:26:28','2021-04-01 00:52:39','1974-06-20','Nam dolorem enim error et.'),(287,'Elsie Howe','Marcia Lueilwitz','discuss,completed','coursework',5620,6233,-613,'1989-02-06 23:33:17','2021-04-01 00:52:39','2018-08-08','Architecto aut vel tempore et.'),(288,'Dr. Augusta Mann','Andres Welch','discuss,completed','test,task',1387,3379,-1992,'1986-05-24 05:11:10','2021-04-01 00:52:39','1980-03-02','Et neque ea corrupti quas ut assumenda sit.'),(289,'Lavinia Stroman Jr.','Tobin Weber','running','task',17283,8894,8389,'1971-07-03 22:44:32','2021-04-01 00:52:39','1985-12-19','Ad rerum consequatur distinctio quasi.'),(290,'Hazel Kerluke','Miss Laurence Bogisich','discuss,check','test,exam',6513,8166,-1653,'2001-08-14 02:50:16','2021-04-01 00:52:39','1985-10-24','Molestias non placeat laudantium eligendi et sed.'),(291,'Dedrick Von','Schuyler Wyman','completed','task',8895,1714,7181,'1998-04-29 12:50:29','2021-04-01 00:52:39','1976-10-16','Ut repellat eligendi suscipit sit autem veniam.'),(294,'Travis Lakin','Laurianne Ankunding III','discuss','test,coursework',11739,157,11582,'2004-10-01 12:13:21','2021-04-01 00:52:39','1998-09-05','At quibusdam sed quisquam ipsa tenetur aspernatur ut.'),(296,'Arvid Schulist','Melvin Vandervort','discuss,running','test',8268,4402,3866,'1971-04-17 03:05:37','2021-04-01 00:52:39','2003-02-26','Expedita sed in eos iusto incidunt doloremque.'),(298,'Stewart Beahan','Emilia Rempel','check','exam',16767,1652,15115,'1976-12-03 16:39:11','2021-04-01 00:52:39','1983-08-22','Sequi id culpa voluptatem natus sunt incidunt.'),(300,'Leanne Klocko','Vivien Reynolds','discuss,running','test',1379,8636,-7257,'1984-06-25 09:27:11','2021-04-01 00:52:39','2010-10-07','Odio ea in et veniam.');
/*!40000 ALTER TABLE `orders_university` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_orders_university` BEFORE INSERT ON `orders_university` FOR EACH ROW BEGIN
	
	-- При создании order_university проверяет, есть ли клиент в clients_university. Если есть, то добавляет выручку. 
	-- Если нету, то добавляет в клиента в clients_university, а после добавляет выручку.
	
	IF ((SELECT full_name FROM clients_university WHERE full_name = NEW.client_university) = NEW.client_university) 
	THEN SET NEW.profit = NEW.price - NEW.salary;
	ELSE
		INSERT INTO clients_university (full_name) VALUES (NEW.client_university);
		SET NEW.profit = NEW.price - NEW.salary; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_order_university_to_orders` AFTER INSERT ON `orders_university` FOR EACH ROW BEGIN
	
	-- Добавляет в orders заказы из университета
	
	INSERT INTO orders (client, worker, type_order, status, price, salary, profit, created_at, update_at, comment) 
	VALUES (NEW.client_university, NEW.worker, 'university', NEW.status, NEW.price, NEW.salary, NEW.profit, NEW.created_at, NEW.updated_at, NEW.comment);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_orders_university` BEFORE UPDATE ON `orders_university` FOR EACH ROW BEGIN
	
	-- Обновляет выгоду после обновления orders_university
	
	SET NEW.profit = NEW.price - NEW.salary; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_order_after_update_orders_university` AFTER UPDATE ON `orders_university` FOR EACH ROW BEGIN
	
	-- Обновляет заказы (orders) после обновления university
	
	UPDATE orders
		SET client = NEW.client_university,
		worker = NEW.worker,
		status = NEW.status,
		price = NEW.price,
		salary = NEW.salary,
		profit = NEW.profit,
		comment = NEW.comment,
		created_at = OLD.created_at,
		update_at = NEW.updated_at
	WHERE created_at = OLD.created_at AND 
		  client = OLD.client_university AND
		  worker = OLD.worker;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_orders_from_university` AFTER DELETE ON `orders_university` FOR EACH ROW BEGIN
	
	-- При удалении заказов university, удаляет заказ в orders
	
	DELETE FROM orders
	WHERE created_at = OLD.created_at AND 
		  client = OLD.client_university AND
		  worker = OLD.worker;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `top_client`
--

DROP TABLE IF EXISTS `top_client`;
/*!50001 DROP VIEW IF EXISTS `top_client`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_client` AS SELECT 
 1 AS `month`,
 1 AS `year`,
 1 AS `top_client`,
 1 AS `price`,
 1 AS `orders`,
 1 AS `profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_workers`
--

DROP TABLE IF EXISTS `top_workers`;
/*!50001 DROP VIEW IF EXISTS `top_workers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_workers` AS SELECT 
 1 AS `month`,
 1 AS `year`,
 1 AS `top_worker`,
 1 AS `salary`,
 1 AS `orders`,
 1 AS `profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Телефон',
  `type_connect` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Тип связи',
  `link_connect` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Ссылка на связь',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`full_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Alfonzo Block IV','+91(6)7115367565','dolorem','arlo69@gmail.com','Totam non corporis ut.'),('Alva Erdman',NULL,NULL,NULL,NULL),('America Becker V','611-850-2873','Club','king.kling','Dolores quidem et doloribus hic.'),('Andres Welch',NULL,NULL,NULL,NULL),('Arianna Eichmann','826.386.4497','asperiores','hauck.trisha@hotmail.com','Velit minima eaque rerum ex ipsum earum et.'),('Aric Shanahan','(501)807-1770','numquam','ozieme@quigleystark.com','Nulla harum est nam accusantium.'),('Arvid Schulist','(082)565-4882','velit','sierra03@lemke.com','Sint delectus est ut itaque saepe qui est.'),('Audrey Collins PhD','(107)575-5211x304','Village','edd.nicolas','Impedit cupiditate quos esse distinctio.'),('Austin Reichel','614-913-7379','accusamus','pmayer@hotmail.com','Quis quasi et quis minus quis qui pariatur.'),('Ayana Wehner','1-927-273-3776x578','eum','carlo.macejkovic@gmail.com','Dicta optio dolore non excepturi.'),('Baby Senger','703-564-5368x077','laborum','cheyanne.bartell@douglas.com','Quam possimus repellat nihil saepe numquam nostrum officiis ipsam.'),('Belle Hauck MD','146.636.7014','quo','pzulauf@hotmail.com','Ut quo praesentium harum et non et aut.'),('Bethel Becker','193-520-0790','Rapids','etha.ritchie','Accusamus qui non fugit et architecto aut et.'),('Betsy Sipes','(054)883-4548x51154','inventore','cristopher.quigley@hettingeroreilly.com','Non temporibus eum placeat et saepe perferendis doloribus.'),('Braxton Haag',NULL,NULL,NULL,NULL),('Brenna Koepp IV','812-398-0354x269','iusto','tkerluke@gmail.com','Non quia aut quod quaerat sunt.'),('Brook Welch','(141)651-4827x102','et','violette.gutkowski@adams.net','Doloribus voluptatem voluptatibus sunt aut blanditiis voluptatum praesentium assumenda.'),('Cali Maggio','020-221-6529','repellat','kunde.marilie@yahoo.com','Inventore mollitia voluptatem repudiandae dolores impedit quo enim itaque.'),('Carley Murphy','626.022.1047x74752','Manor','bzemlak','Autem cum nihil aut officiis aspernatur.'),('Carmella Brekke','1-217-218-2722x13476','esse','jillian.strosin@hotmail.com','Quia ipsum magni non cupiditate.'),('Carson Hagenes','09406656230','repellat','muller.cade@yundt.info','Reprehenderit corrupti laborum id placeat.'),('Casper Cormier','139.578.8115','consectetur','elias.bernier@gmail.com','Quae impedit eos cupiditate deserunt est dicta ut ratione.'),('Cassidy Heathcote DD',NULL,NULL,NULL,NULL),('Cassidy Heathcote DDS','1-095-821-7467x66770','tempora','maud.romaguera@maggiokuhn.com','Recusandae quod aut ex iusto qui rerum.'),('Cassie Gerlach','028-679-7479x1785','ipsum','gleason.amy@runolfsson.com','Optio molestiae maxime rerum quasi.'),('Charlotte Windler',NULL,NULL,NULL,NULL),('Chauncey Bogan III','(279)882-2782','Throughway','yolanda58','Molestias rem fugit cum incidunt aliquid doloremque dignissimos.'),('Cooper Prohaska','844-912-3740x97313','excepturi','langworth.akeem@hotmail.com','Eum cumque quia ipsa.'),('Dalton Deckow','994.050.6392x6184','ea','gorczany.geo@kunde.org','Corrupti ducimus error et officiis harum aliquam.'),('Dana Nitzsche','+59(6)1504285996','Fords','pschinner','Nisi molestias qui magnam ad.'),('Daphnee Kilback','849-695-8263x936','magni','halvorson.ian@smithamfeest.org','Sequi expedita ut sint molestiae dignissimos eum sit totam.'),('Darlene Runolfsdotti',NULL,NULL,NULL,NULL),('Darlene Runolfsdottir','(834)309-1842x12050','iste','lhowell@oconner.com','Aut aut culpa est ipsam est dolorem eum.'),('Darren Kassulke','560-460-4284x1816','velit','durgan.isobel@yahoo.com','Illo architecto consectetur illum quis excepturi sed quo.'),('Darrick Wilderman','04006086442','consequatur','ekshlerin@hotmail.com','Itaque cumque non exercitationem molestias repellat et.'),('Dayana Larkin','03360068434','enim','shayne30@hotmail.com','Recusandae ex voluptatem consequatur illo amet dicta.'),('Dedrick Von','(226)982-0496','autem','kprohaska@hilpert.com','Cum voluptate voluptatem est praesentium et odio voluptas.'),('Demetris Rempel Jr.','1-041-286-1196x8805','hic','nikki53@yahoo.com','Magni adipisci maiores sit dolore.'),('Denis Gerlach','(605)267-8710','optio','okreiger@hotmail.com','Cupiditate et est necessitatibus praesentium et.'),('Domenica Collins','087.737.2937','facilis','imedhurst@monahan.com','Ducimus deserunt rerum aliquam numquam aut.'),('Domingo Labadie',NULL,NULL,NULL,NULL),('Donny Bartoletti DVM','1-938-857-9029x50073','Port','hand.davin','Occaecati doloremque doloremque harum omnis ea.'),('Dorothea Mertz','+43(7)8823026220','consequatur','pagac.cade@stracke.com','Quo laborum aut nobis consectetur enim ipsam non.'),('Doyle Nienow','(440)783-6899','est','jayme.wolff@deckow.com','Similique ducimus esse veritatis dicta quos.'),('Dr. Amelie Lang','(365)565-8780','eos','hmcclure@jacobigoldner.com','Veritatis nobis aut delectus.'),('Dr. Augusta Mann','(434)546-9014x101','officiis','rogahn.erick@schimmel.com','Mollitia ad asperiores quo in hic tempore velit.'),('Dr. Aurore Auer','684-681-2593x8700','aut','imedhurst@gmail.com','Quia omnis est expedita occaecati dolor totam est.'),('Dr. Clemens Keeling','(716)190-6270','Motorway','durgan.allen','Ullam eligendi inventore nobis et blanditiis odio.'),('Dr. Fern Kohler','+17(1)3155032120','ducimus','mcclure.anahi@murrayjakubowski.com','Voluptates repellendus et sunt et.'),('Dr. Gwendolyn Schowalter',NULL,NULL,NULL,NULL),('Dr. Moriah Metz','827.233.6611x3972','sit','kautzer.toni@yahoo.com','Minus et earum illum.'),('Dr. Oceane Ortiz','08205440796','et','brooklyn.casper@gmail.com','Nostrum qui dolores ipsum ad sit sint.'),('Dr. Terrence Zboncak','(908)114-0530x32664','accusamus','mcdermott.rusty@gmail.com','Voluptatem optio ullam sit voluptatem.'),('Durward Jacobi I','(293)316-6324x05408','ea','pacocha.devin@yahoo.com','Ipsum natus praesentium ut et repellendus necessitatibus sunt.'),('Earnestine Wilderman','164.391.4354x299','Divide','jenkins.william','Omnis sit qui similique provident maiores a.'),('Ebony Dickens','349-767-3814x96642','explicabo','jovan52@hotmail.com','At aut ab et fuga consequatur numquam.'),('Eddie Rosenbaum','144-935-1293x4397','dolores','cole.rosalee@hotmail.com','Officia dolores est tempore cum.'),('Efren Nienow','1-311-953-8367','veritatis','kiana.fahey@gmail.com','Quo ratione quidem corporis et dolores animi.'),('Elena Corwin','536-771-7344x44926','quis','charlie98@hotmail.com','Architecto nostrum assumenda quas error iste optio.'),('Ellie Glover I',NULL,NULL,NULL,NULL),('Eloisa Runolfsson','551-151-3513','Square','bogan.fabiola','Voluptas in ducimus magnam beatae nihil delectus.'),('Elsie Howe','(779)106-5526','sunt','hammes.pink@gmail.com','Eius expedita aut sit voluptatibus ut eum cum ut.'),('Elvie Pouros','04134740771','Burgs','mcglynn.anthony','Natus occaecati voluptas hic repellendus id ut quae.'),('Emilia Rempel',NULL,NULL,NULL,NULL),('Ericka Towne','753-278-8833x3275','Light','josianne17','Odio nesciunt laboriosam provident eum vel sit similique.'),('Eryn Mante','03074834591','amet','ayana96@yahoo.com','Nam qui ad sunt nobis.'),('Evan Stoltenberg',NULL,NULL,NULL,NULL),('Favian Gleason','+26(8)3529898952','corporis','daniella.quigley@blick.org','Enim sint vel dolor animi dicta fuga.'),('Felipa Wehner',NULL,NULL,NULL,NULL),('Flavio Keebler','(457)721-9251x74057','Track','jovany.kihn','Autem ut voluptatem ad voluptatem iste quidem.'),('Francisco Collier Jr',NULL,NULL,NULL,NULL),('Francisco Collier Jr.','473.999.6984','dolorum','doyle.hassie@hotmail.com','Sed voluptas et architecto placeat quibusdam.'),('Frederick Ziemann',NULL,NULL,NULL,NULL),('Haskell Blick','632-816-7636','modi','vmcclure@gmail.com','Enim unde error qui.'),('Hazel Kerluke','849-190-8738x279','eaque','corene04@wuckert.net','Velit nisi deserunt incidunt nostrum sit non placeat.'),('Henri Kshlerin','207.452.6824x3957','quasi','nmante@hotmail.com','Officia voluptatem assumenda ipsum et in voluptatum.'),('Hershel Klocko','748.047.3872x6063','Mews','karianne.ernser','Ex eum magni non numquam non aut dicta.'),('Ines Tremblay','1-373-366-1565x10853','Knolls','klockman','Corrupti corporis saepe eos quis doloremque.'),('Jack Towne','157.492.3664','sunt','braeden02@lednermayer.biz','Architecto qui eius nobis qui.'),('Jennifer Adams','624.473.8355','est','alverta.cronin@langworth.com','Quia laboriosam et aliquid voluptatem voluptatem cum.'),('Jerry Torphy','579-945-6493x176','Walk','bernard.bayer','Molestiae a nesciunt cumque corrupti.'),('Jordan Collins','1-115-952-4742x3101','quaerat','emmett97@hotmail.com','Laudantium consequatur eos eos esse aperiam rerum quis.'),('June Mills','528.870.0265x39920','fuga','joanny77@yahoo.com','Eligendi ad dolores nobis ex enim.'),('Karson Auer','06475966672','debitis','udeckow@bednarhammes.org','Vero odit ut aliquid rem aut dolor.'),('Kirk Adams IV',NULL,NULL,NULL,NULL),('Larue Kuvalis','165.038.4942','iure','opal.rau@simonis.org','Sit voluptatem fugit aut ad repellat ut ipsum.'),('Laurel Johnson','(630)788-1771','totam','mcclure.olen@yahoo.com','Alias quam vitae sapiente repudiandae quia veritatis.'),('Laurianne Ankunding III',NULL,NULL,NULL,NULL),('Lavinia Stroman Jr.','278.463.0756','officia','dmarvin@hotmail.com','Harum ullam et laborum ducimus expedita qui quos.'),('Leanne Klocko','+25(6)8732398598','consequatur','daniel.lukas@yahoo.com','Qui nemo quisquam debitis harum quidem laudantium.'),('Lelah Collins','420-426-3515x8783','laboriosam','jdibbert@hotmail.com','Tempora quae repellendus harum reiciendis.'),('Lilla Vandervort',NULL,NULL,NULL,NULL),('Linda Maggio','765-814-2321x92560','minus','jakubowski.gennaro@sipesfeest.com','Officiis modi quis quia explicabo rem.'),('Lizzie Conroy',NULL,NULL,NULL,NULL),('Lorine Oberbrunner','445.798.8400','omnis','amely46@yahoo.com','Nihil provident tempore hic.'),('Mabelle Senger',NULL,NULL,NULL,NULL),('Madaline Smith MD','927-447-0444','non','wisozk.shayne@hintz.com','Rerum officia molestiae laborum iusto laudantium.'),('Marc Jacobi',NULL,NULL,NULL,NULL),('Marc Lowe','1-269-298-8800x28092','et','jones.tess@yahoo.com','Ducimus nihil laboriosam enim eaque quia rerum.'),('Marcia Lueilwitz',NULL,NULL,NULL,NULL),('Melody Grady','(595)187-6662x26891','nisi','zmertz@yahoo.com','Nostrum sit ea voluptatem molestias et omnis.'),('Melvin Vandervort',NULL,NULL,NULL,NULL),('Miss Cleta Buckridge Jr.',NULL,NULL,NULL,NULL),('Miss Concepcion Nienow',NULL,NULL,NULL,NULL),('Miss Elta Gerhold II',NULL,NULL,NULL,NULL),('Miss Katelin Reinger','1-671-902-7871x01344','Circles','noelia50','Corrupti perspiciatis incidunt voluptas sit possimus.'),('Miss Laurence Bogisich',NULL,NULL,NULL,NULL),('Miss Letitia Gutkows',NULL,NULL,NULL,NULL),('Miss Letitia Gutkowski IV','108-905-4922','dolor','khudson@yahoo.com','Alias alias incidunt sit aperiam consectetur minus.'),('Miss Lyda Cummerata ',NULL,NULL,NULL,NULL),('Miss Lyda Cummerata IV','(975)704-5096x26590','dignissimos','crooks.dario@gmail.com','Voluptatibus ducimus fuga ea laborum quibusdam porro ut.'),('Miss Malinda Krajcik DDS','(918)520-0517','Court','gwindler','Excepturi dolorum quia soluta ut dolore.'),('Miss Marilie Keeling V',NULL,NULL,NULL,NULL),('Miss Mikayla Howell','937.538.5877','tempora','kuvalis.blair@yahoo.com','Earum praesentium velit consequatur in et veritatis nisi.'),('Miss Tiara Zboncak I','899.103.1593x33324','sequi','mayra.schuster@hotmail.com','Voluptas ut deserunt maiores sed.'),('Modesta Bechtelar','117-742-8192','Tunnel','bergstrom.magnus','Odit autem fuga iste eligendi minima repudiandae autem.'),('Modesta Nikolaus DDS','09103997403','eaque','suzanne29@kesslerreynolds.com','Ipsum beatae aut fugiat eos laudantium.'),('Monte Bins','245.147.8107','aut','kilback.herminia@hotmail.com','Et est quidem nesciunt qui non.'),('Morgan McGlynn','479.402.0633','ipsum','krystina.armstrong@herzog.com','Provident laboriosam optio laudantium consectetur sequi.'),('Mozelle Haag','+15(5)6684668015','nam','athena94@hotmail.com','Ut molestiae sint accusamus iste.'),('Mozelle Swaniawski','129.549.4166x2481','eum','eriberto.buckridge@bednar.com','Quaerat ad itaque pariatur deserunt exercitationem nihil in.'),('Mr. Agustin Walsh I',NULL,NULL,NULL,NULL),('Mr. Barney Dooley Sr',NULL,NULL,NULL,NULL),('Mr. Barney Dooley Sr.','1-706-802-3017','voluptas','mrodriguez@hotmail.com','Ipsum aut vitae rerum saepe recusandae.'),('Mr. Brandt Ernser Sr',NULL,NULL,NULL,NULL),('Mr. Brandt Ernser Sr.','622.984.4567x1191','perspiciatis','merle.crist@hotmail.com','Est iure est voluptas exercitationem nisi velit.'),('Mr. Cruz Yost',NULL,NULL,NULL,NULL),('Mr. Darron Purdy','(677)853-5284x30456','sunt','jayne.klocko@jacobson.org','Omnis id error repellendus quia.'),('Mr. Dorian Kihn Sr.','1-263-585-3103x220','Corner','laurie29','Inventore accusantium vel rerum veritatis autem.'),('Mr. Monroe Stokes',NULL,NULL,NULL,NULL),('Mr. Wyatt Hodkiewicz',NULL,NULL,NULL,NULL),('Mr. Wyatt Hodkiewicz V','957.536.1383x16919','magni','neha06@gmail.com','Sed rem et commodi aut.'),('Mrs. Alberta Hansen','02089760937','sapiente','osinski.marley@greenholtkeebler.info','Non cumque quia tenetur cupiditate et sit enim sed.'),('Mrs. Kavon Leannon',NULL,NULL,NULL,NULL),('Mrs. Rachael Shields','888.424.9782','ipsum','ekilback@gmail.com','Molestias officiis aperiam non repellendus voluptas.'),('Mrs. Ruthe Leffler Jr.','1-104-122-8094x51783','Key','ziemann.jayne','Nihil recusandae minus iste eaque.'),('Ms. Eudora Koch V','008-164-6920x6345','Camp','geoffrey92','Quos ea quam saepe sequi neque voluptas.'),('Ms. Hosea Heathcote',NULL,NULL,NULL,NULL),('Ms. Janae Block','934.507.9678x57917','consequuntur','rosalia37@hotmail.com','Numquam aperiam quo omnis voluptatum quasi.'),('Ms. Linnie Reichel V','07897777317','Viaduct','mayra53','Dolor sed ipsum nemo eos.'),('Ms. Marjorie Kub V',NULL,NULL,NULL,NULL),('Ms. Michaela Lind DVM','06112712544','Bridge','torp.breanne','Nobis nihil repudiandae at veniam voluptatum.'),('Nelson Wolf','220-184-6585x866','voluptatibus','leonel66@hotmail.com','Ratione sit at optio tempore veritatis quasi eos ratione.'),('Otilia Braun',NULL,NULL,NULL,NULL),('Prof. Abel Reilly','1-695-105-2036x647','eligendi','genevieve06@lang.com','Natus assumenda quae fuga.'),('Prof. Adella Pagac','1-279-481-5224','tenetur','jazmyne.tillman@yahoo.com','Provident assumenda qui ab aut nostrum.'),('Prof. Austyn Ferry','277-647-2377','ullam','jaylon.kub@yahoo.com','Quibusdam sit aspernatur voluptatem itaque.'),('Prof. Brandy Nikolau',NULL,NULL,NULL,NULL),('Prof. Brandy Nikolaus','894.117.7925','aspernatur','fred.bechtelar@morar.com','Itaque suscipit dolorem omnis consequatur reprehenderit excepturi.'),('Prof. Effie Funk Jr.','552-640-6835','Skyway','gregory51','Dolorum et ut eveniet vitae culpa dolorem.'),('Prof. Ellis Halvorson','607-696-2307','Mall','jordy.feil','Doloribus velit omnis reiciendis dicta aperiam quia numquam.'),('Prof. Kay Lind Jr.','778-068-0422','autem','wilford.green@heathcoteziemann.info','Non voluptates maxime neque cupiditate.'),('Prof. Major Bailey','892-219-9928x46433','omnis','gdicki@yahoo.com','Ipsum autem nihil repellat perferendis ea totam.'),('Prof. Marianna Wolff','05181191203','non','labadie.claudie@hotmail.com','Atque iste libero rerum voluptas ad commodi.'),('Prof. Miguel Crist I',NULL,NULL,NULL,NULL),('Prof. Miguel Crist IV','01139776381','accusantium','kaia.mclaughlin@yahoo.com','Incidunt maxime asperiores rem consectetur dolorum.'),('Prof. Oscar Gottlieb IV',NULL,NULL,NULL,NULL),('Prof. Owen Pacocha MD','(423)229-6419x752','Streets','harmon.schaden','Quos officiis beatae eum itaque consequatur qui.'),('Prof. Reuben Morar',NULL,NULL,NULL,NULL),('Queen Turner','652-578-4935','Views','blick.dixie','Necessitatibus impedit delectus qui magnam magnam occaecati.'),('Randall Rau MD','+93(4)7263207939','aliquam','damien.ullrich@gmail.com','Exercitationem omnis quia harum nihil beatae.'),('Reed Paucek','003-639-9822x37127','Meadow','madisen.mckenzie','Quibusdam aperiam fugiat numquam voluptatum atque.'),('Rosamond Bergnaum','611.707.5792x2789','accusamus','dedrick.king@quitzonkautzer.com','Et accusamus voluptatem neque.'),('Sage Braun I','1-885-916-1828x741','exercitationem','oerdman@carter.biz','Similique est earum at sit.'),('Santa Windler','07072559489','dolor','nico29@yahoo.com','Enim officiis soluta aut nulla sed sequi.'),('Schuyler Wyman',NULL,NULL,NULL,NULL),('Sedrick Russel','779-078-6962x38089','voluptates','greg58@yahoo.com','Quia ut est omnis consequatur earum ea.'),('Stanley Friesen',NULL,NULL,NULL,NULL),('Stephanie Sporer','01140459461','qui','xgislason@stracke.com','Necessitatibus sed aut voluptatem reiciendis magni temporibus error ipsa.'),('Stewart Beahan','(800)505-2722','mollitia','tavares56@olson.com','Deleniti voluptatem quia aspernatur.'),('Sydnee O Hara',NULL,NULL,NULL,NULL),('Tamia Pacocha','241.790.3913x05540','neque','elaina94@turnersipes.com','Assumenda ea possimus illum atque delectus eos.'),('Thomas Cormier','357-953-9141x4309','ea','monroe.lesch@gmail.com','Eveniet voluptatem ab autem repellat sit expedita totam.'),('Tobin Weber',NULL,NULL,NULL,NULL),('Travis Lakin','871.104.9592','non','renner.katrine@corkery.net','Totam illo inventore quae assumenda.'),('Travis McCullough','728.528.5208','Plaza','terence.johnston','Dolore dolorem consequatur voluptas nobis molestiae accusamus non reprehenderit.'),('Trudie Ratke','988.647.6076','distinctio','connor63@gmail.com','Necessitatibus ipsam eos ut ullam.'),('Vivien Reynolds',NULL,NULL,NULL,NULL),('Walker Pacocha',NULL,NULL,NULL,NULL),('Winifred Thompson',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping events for database 'Medved'
--

--
-- Dumping routines for database 'Medved'
--

--
-- Final view structure for view `my_orders_SOM`
--

/*!50001 DROP VIEW IF EXISTS `my_orders_SOM`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_orders_SOM` AS select monthname(`o`.`created_at`) AS `month`,date_format(`o`.`created_at`,'%Y') AS `year`,count(0) AS `orders`,sum(`o`.`price`) AS `price`,sum(`o`.`salary`) AS `salary`,sum(`o`.`lessons`) AS `lessons`,sum(`o`.`profit`) AS `profit` from `orders_SOM` `o` group by monthname(`o`.`created_at`),date_format(`o`.`created_at`,'%Y') order by date_format(`o`.`created_at`,'%Y'),monthname(`o`.`created_at`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_univer`
--

/*!50001 DROP VIEW IF EXISTS `orders_univer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_univer` AS select monthname(`o`.`created_at`) AS `month`,date_format(`o`.`created_at`,'%Y') AS `year`,count(0) AS `orders`,sum(`o`.`price`) AS `price`,sum(`o`.`salary`) AS `salary`,sum(`o`.`profit`) AS `profit` from `orders_university` `o` group by monthname(`o`.`created_at`),date_format(`o`.`created_at`,'%Y') order by date_format(`o`.`created_at`,'%Y') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_client`
--

/*!50001 DROP VIEW IF EXISTS `top_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_client` AS select `result1`.`month1` AS `month`,`result1`.`year1` AS `year`,substring_index(group_concat(`result1`.`client_university` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `top_client`,substring_index(group_concat(`result1`.`pric` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `price`,substring_index(group_concat(`result1`.`orders` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `orders`,substring_index(group_concat(`result1`.`prof` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `profit` from (select `ou`.`client_university` AS `client_university`,sum(`ou`.`price`) AS `pric`,sum(`ou`.`profit`) AS `prof`,count(`ou`.`client_university`) AS `orders`,(((sum(`ou`.`price`) * 0.6) + (count(`ou`.`client_university`) * 400)) + (0.5 * sum(`ou`.`profit`))) AS `ordered`,monthname(`ou`.`created_at`) AS `month1`,year(`ou`.`created_at`) AS `year1` from `orders_university` `ou` group by `ou`.`client_university`,`month1`,`year1` order by `ordered` desc) `result1` group by `result1`.`month1`,`result1`.`year1` order by `result1`.`year1`,field(`result1`.`month1`,'January','February','March','April','May','June','July','August','September','October','November','December') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_workers`
--

/*!50001 DROP VIEW IF EXISTS `top_workers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_workers` AS select `result1`.`month1` AS `month`,`result1`.`year1` AS `year`,substring_index(group_concat(`result1`.`worker` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `top_worker`,substring_index(group_concat(`result1`.`salar` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `salary`,substring_index(group_concat(`result1`.`orders` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `orders`,substring_index(group_concat(`result1`.`prof` order by `result1`.`ordered` DESC separator '. '),' ',3) AS `profit` from (select `ou`.`worker` AS `worker`,sum(`ou`.`salary`) AS `salar`,sum(`ou`.`profit`) AS `prof`,count(`ou`.`worker`) AS `orders`,(((sum(`ou`.`salary`) * 0.6) + (count(`ou`.`worker`) * 400)) + (0.5 * sum(`ou`.`profit`))) AS `ordered`,monthname(`ou`.`created_at`) AS `month1`,year(`ou`.`created_at`) AS `year1` from `orders_university` `ou` group by `ou`.`worker`,`month1`,`year1` order by `ordered` desc) `result1` group by `result1`.`month1`,`result1`.`year1` order by `result1`.`year1`,field(`result1`.`month1`,'January','February','March','April','May','June','July','August','September','October','November','December') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 13:13:32
