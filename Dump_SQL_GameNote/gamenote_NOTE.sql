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
-- Table structure for table `NOTE`
--

DROP TABLE IF EXISTS `NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTE` (
  `note` float(2,1) DEFAULT NULL,
  `commentaire` text,
  `idUSER` int(10) unsigned NOT NULL,
  `idJEUX` int(10) unsigned NOT NULL,
  `idCRITERE` int(10) unsigned NOT NULL,
  `idSUPPORT` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idUSER`,`idJEUX`,`idCRITERE`,`idSUPPORT`),
  KEY `fk_iduser_idx` (`idUSER`),
  KEY `fk_idcritere_idx` (`idCRITERE`),
  KEY `fk_idsupport_idx` (`idSUPPORT`),
  KEY `fk_idjeux_idx` (`idJEUX`),
  CONSTRAINT `fk_idcritere` FOREIGN KEY (`idCRITERE`) REFERENCES `CRITERE` (`idCRITERE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idjeux` FOREIGN KEY (`idJEUX`) REFERENCES `JEUX_has_SUPPORT` (`JEUX_idJEUX`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idsupport` FOREIGN KEY (`idSUPPORT`) REFERENCES `JEUX_has_SUPPORT` (`JEUX_idJEUX`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_iduser` FOREIGN KEY (`idUSER`) REFERENCES `USER` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTE`
--

LOCK TABLES `NOTE` WRITE;
/*!40000 ALTER TABLE `NOTE` DISABLE KEYS */;
INSERT INTO `NOTE` VALUES (3.0,'super graphisme',1,1,1,1),(4.0,'super jeux',1,1,2,1),(5.0,'durée de jeux super longue',1,1,3,1),(5.0,'super graphisme',1,3,1,1),(5.0,'pareil super graphisme',1,3,1,3),(5.0,'super jeux',1,3,2,1),(5.0,'idemsuper jeux',1,3,2,3),(5.0,'durée de jeux super longue',1,3,3,1),(5.0,'Sur ce support pareil durée de jeux super longue',1,3,3,3),(1.0,'mauvaise qualité graphique',2,2,1,2),(1.0,'super jeux',2,2,2,2),(3.0,'durée de jeux trop longue relou !',2,2,3,2),(4.0,'super graphisme',2,3,1,1),(5.0,'super jeux',2,3,2,1),(4.0,'durée de jeux super longue',2,3,3,1),(1.0,'mauvaise qualité graphique',3,2,1,2),(1.0,'super jeux',3,2,2,2),(3.0,'durée de jeux trop longue relou !',3,2,3,2),(4.0,'super graphisme',3,3,1,1),(4.0,'super graphisme',3,3,1,3),(5.0,'super jeux',3,3,2,1),(5.0,'super jeux',3,3,2,3),(4.0,'durée de jeux super longue',3,3,3,1),(4.0,'durée de jeux super longue',3,3,3,3);
/*!40000 ALTER TABLE `NOTE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `NOTE_BINS` BEFORE INSERT ON `NOTE` FOR EACH ROW
begin
	if(NEW.note<0 OR NEW.note>5) then
		signal sqlstate '45000'
			Set message_text = "Valeur de la note incorrecte (entre 0 et 5)";
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `NOTE_BUPD` BEFORE UPDATE ON `NOTE` FOR EACH ROW
begin
	if(NEW.note<0 OR NEW.note>5) then
		signal sqlstate '45000'
			Set message_text = "Valeur de la note incorrecte (entre 0 et 5)";
	end if;
end */;;
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

-- Dump completed on 2016-11-27  1:33:06
