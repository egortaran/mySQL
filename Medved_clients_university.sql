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
-- Table structure for table `clients_university`
--

DROP TABLE IF EXISTS `clients_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_university` (
  'id' mediumint unsigned NOT NULL AUTO_INCREMENT,
  `university` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Университет',
  `course` set('1','2','3','4','5','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Курс',
  `faculty` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Факультет',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_university_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 21:41:07
