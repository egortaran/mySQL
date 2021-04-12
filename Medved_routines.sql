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
-- Dumping events for database 'Medved'
--

--
-- Dumping routines for database 'Medved'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-11 21:41:07
