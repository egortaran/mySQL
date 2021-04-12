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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 21:41:07
