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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 21:41:07
