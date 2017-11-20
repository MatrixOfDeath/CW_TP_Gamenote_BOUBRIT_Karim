CREATE DATABASE  IF NOT EXISTS `gamenote` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gamenote`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: gamenote
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `jeuxGenre`
--

DROP TABLE IF EXISTS `jeuxGenre`;
/*!50001 DROP VIEW IF EXISTS `jeuxGenre`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jeuxGenre` (
  `nom` tinyint NOT NULL,
  `genre(s)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `showNotebyGamebyCritere`
--

DROP TABLE IF EXISTS `showNotebyGamebyCritere`;
/*!50001 DROP VIEW IF EXISTS `showNotebyGamebyCritere`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `showNotebyGamebyCritere` (
  `nom du jeu` tinyint NOT NULL,
  `critere` tinyint NOT NULL,
  `moyenne` tinyint NOT NULL,
  `support` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `pivotMoyennebyJeuxandCritere`
--

DROP TABLE IF EXISTS `pivotMoyennebyJeuxandCritere`;
/*!50001 DROP VIEW IF EXISTS `pivotMoyennebyJeuxandCritere`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `pivotMoyennebyJeuxandCritere` (
  `nom du jeu` tinyint NOT NULL,
  `graphisme` tinyint NOT NULL,
  `lifetime` tinyint NOT NULL,
  `gameplay` tinyint NOT NULL,
  `support` tinyint NOT NULL,
  `moyenne_total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jeuxSupport`
--

DROP TABLE IF EXISTS `jeuxSupport`;
/*!50001 DROP VIEW IF EXISTS `jeuxSupport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jeuxSupport` (
  `nom` tinyint NOT NULL,
  `suppport(s)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `jeuxGenre`
--

/*!50001 DROP TABLE IF EXISTS `jeuxGenre`*/;
/*!50001 DROP VIEW IF EXISTS `jeuxGenre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jeuxGenre` AS select `j`.`nom` AS `nom`,group_concat(`g`.`genre` separator ', ') AS `genre(s)` from ((`JEUX_has_GENRE` `jg` left join `JEUX` `j` on((`j`.`idJEUX` = `jg`.`JEUX_idJEUX`))) left join `GENRE` `g` on((`g`.`idGENRE` = `jg`.`GENRE_idGENRE`))) group by `j`.`nom` order by `j`.`nom` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showNotebyGamebyCritere`
--

/*!50001 DROP TABLE IF EXISTS `showNotebyGamebyCritere`*/;
/*!50001 DROP VIEW IF EXISTS `showNotebyGamebyCritere`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showNotebyGamebyCritere` AS select `j`.`nom` AS `nom du jeu`,`c`.`critere` AS `critere`,round(avg(`NOTE`.`note`),2) AS `moyenne`,`s`.`name` AS `support` from (((`NOTE` left join `CRITERE` `c` on((`NOTE`.`idCRITERE` = `c`.`idCRITERE`))) left join `JEUX` `j` on((`NOTE`.`idJEUX` = `j`.`idJEUX`))) left join `SUPPORT` `s` on((`NOTE`.`idSUPPORT` = `s`.`idSUPPORT`))) group by `NOTE`.`idJEUX`,`NOTE`.`idCRITERE`,`NOTE`.`idSUPPORT` order by `j`.`nom`,`s`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pivotMoyennebyJeuxandCritere`
--

/*!50001 DROP TABLE IF EXISTS `pivotMoyennebyJeuxandCritere`*/;
/*!50001 DROP VIEW IF EXISTS `pivotMoyennebyJeuxandCritere`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pivotMoyennebyJeuxandCritere` AS select `j`.`nom` AS `nom du jeu`,group_concat(if((`c`.`critere` = 'graphisme'),`NOTE`.`note`,NULL) separator ',') AS `graphisme`,group_concat(if((`c`.`critere` = 'lifetime'),`NOTE`.`note`,NULL) separator ',') AS `lifetime`,group_concat(if((`c`.`critere` = 'gameplay'),`NOTE`.`note`,NULL) separator ',') AS `gameplay`,`s`.`name` AS `support`,round(avg(`NOTE`.`note`),2) AS `moyenne_total` from (((`NOTE` left join `CRITERE` `c` on((`NOTE`.`idCRITERE` = `c`.`idCRITERE`))) left join `JEUX` `j` on((`NOTE`.`idJEUX` = `j`.`idJEUX`))) left join `SUPPORT` `s` on((`NOTE`.`idSUPPORT` = `s`.`idSUPPORT`))) group by `NOTE`.`idJEUX`,`NOTE`.`idSUPPORT` order by `j`.`nom`,`s`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jeuxSupport`
--

/*!50001 DROP TABLE IF EXISTS `jeuxSupport`*/;
/*!50001 DROP VIEW IF EXISTS `jeuxSupport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jeuxSupport` AS select `j`.`nom` AS `nom`,group_concat(`g`.`name` separator ', ') AS `suppport(s)` from ((`JEUX_has_SUPPORT` `js` left join `JEUX` `j` on((`j`.`idJEUX` = `js`.`JEUX_idJEUX`))) left join `SUPPORT` `g` on((`g`.`idSUPPORT` = `js`.`SUPPORT_idSUPPORT`))) group by `j`.`nom` order by `j`.`nom` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'gamenote'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-27  1:33:06
