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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 21:41:07
