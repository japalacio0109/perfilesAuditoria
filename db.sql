-- MySQL dump 10.13  Distrib 5.7.17, for osx10.12 (x86_64)
--
-- Host: localhost    Database: auditoria
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `au_crud`
--

DROP TABLE IF EXISTS `au_crud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_crud` (
  `cru_cont` int(11) NOT NULL AUTO_INCREMENT,
  `cru_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`cru_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_crud`
--

LOCK TABLES `au_crud` WRITE;
/*!40000 ALTER TABLE `au_crud` DISABLE KEYS */;
INSERT INTO `au_crud` VALUES (1,'post'),(2,'get'),(3,'create'),(4,'update'),(5,'delete'),(6,'read');
/*!40000 ALTER TABLE `au_crud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `au_dbau`
--

DROP TABLE IF EXISTS `au_dbau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `au_dbau` (
  `dba_cont` int(11) NOT NULL AUTO_INCREMENT,
  `dba_rout` varchar(500) NOT NULL,
  `dba_client` varchar(200) NOT NULL,
  `dba_ip` varchar(16) NOT NULL,
  `dba_urlp` varchar(500) DEFAULT NULL,
  `dba_oldd` text,
  `dba_newd` text,
  `cru_cont` int(11) NOT NULL,
  `dba_dpro` int(11) NOT NULL,
  `ter_cont` int(11) DEFAULT NULL,
  `dba_aprob` tinyint(1) NOT NULL,
  PRIMARY KEY (`dba_cont`),
  KEY `fk_au_dbau_au_crud1_idx` (`cru_cont`),
  KEY `fk_au_dbau_gn_terc1_idx` (`ter_cont`),
  KEY `data_process_idx` (`dba_dpro`),
  CONSTRAINT `data_process` FOREIGN KEY (`dba_dpro`) REFERENCES `au_crud` (`cru_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_au_dbau_au_crud1` FOREIGN KEY (`cru_cont`) REFERENCES `au_crud` (`cru_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_au_dbau_gn_terc1` FOREIGN KEY (`ter_cont`) REFERENCES `gn_terc` (`ter_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_dbau`
--

LOCK TABLES `au_dbau` WRITE;
/*!40000 ALTER TABLE `au_dbau` DISABLE KEYS */;
INSERT INTO `au_dbau` VALUES (1,'/login/auth','g-ginfo.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"1hZ05QQ9/ZeWTa962ByspEcfP26bHTpOSOEERMH6IFrmADhHujjRFVQwo3xDeNvXrCw2D4B+HE8l+c2Bg2HsCg==\", \"user\"=>\"camilo123\", \"pass\"=>\"12345\", \"commit\"=>\"Iniciar Sesión\", \"controller\"=>\"login\", \"action\"=>\"auth\"}',NULL,'Iniciar sesión',1,3,2,1),(2,'/home','g-ginfo.local','127.0.0.1','{\"controller\"=>\"home\", \"action\"=>\"index\"}',NULL,'{\"controller\"=>\"home\", \"action\"=>\"index\"}',2,6,2,1),(3,'/logs/system','g-ginfo.local','127.0.0.1','{\"controller\"=>\"logs\", \"action\"=>\"system\"}',NULL,NULL,2,6,2,1);
/*!40000 ALTER TABLE `au_dbau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gn_tdoc`
--

DROP TABLE IF EXISTS `gn_tdoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gn_tdoc` (
  `tdo_cont` int(11) NOT NULL AUTO_INCREMENT,
  `tdo_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`tdo_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gn_tdoc`
--

LOCK TABLES `gn_tdoc` WRITE;
/*!40000 ALTER TABLE `gn_tdoc` DISABLE KEYS */;
INSERT INTO `gn_tdoc` VALUES (1,'cedula de ciudadania'),(2,'cedula de extranjeria'),(3,'tarjeta de identidad');
/*!40000 ALTER TABLE `gn_tdoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gn_terc`
--

DROP TABLE IF EXISTS `gn_terc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gn_terc` (
  `ter_cont` int(11) NOT NULL AUTO_INCREMENT,
  `ter_iden` bigint(20) NOT NULL,
  `ter_pnom` varchar(45) NOT NULL,
  `ter_snom` varchar(45) NOT NULL,
  `ter_pape` varchar(45) NOT NULL,
  `ter_sape` varchar(45) NOT NULL,
  `tdo_cont` int(11) NOT NULL,
  `ter_usua` varchar(45) NOT NULL,
  `ter_pass` varchar(255) NOT NULL,
  `ter_acti` tinyint(1) NOT NULL,
  `tus_cont` int(11) NOT NULL,
  `ter_onli` tinyint(1) NOT NULL,
  `ter_inte` int(11) DEFAULT '0',
  PRIMARY KEY (`ter_cont`),
  KEY `fk_gn_terc_gn_tdoc_idx` (`tdo_cont`),
  KEY `fk_gn_terc_gn_tusu1_idx` (`tus_cont`),
  CONSTRAINT `fk_gn_terc_gn_tdoc` FOREIGN KEY (`tdo_cont`) REFERENCES `gn_tdoc` (`tdo_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gn_terc_gn_tusu1` FOREIGN KEY (`tus_cont`) REFERENCES `gn_tusu` (`tus_cont`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gn_terc`
--

LOCK TABLES `gn_terc` WRITE;
/*!40000 ALTER TABLE `gn_terc` DISABLE KEYS */;
INSERT INTO `gn_terc` VALUES (1,1070615270,'jeyson','anibal','palacio','palma',1,'japalacio0108','8cb2237d0679ca88db6464eac60da96345513964',1,1,0,1),(2,1234567,'camilo','andres','lopez','urquijo',1,'camilo123','8cb2237d0679ca88db6464eac60da96345513964',1,2,1,0);
/*!40000 ALTER TABLE `gn_terc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gn_tusu`
--

DROP TABLE IF EXISTS `gn_tusu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gn_tusu` (
  `tus_cont` int(11) NOT NULL AUTO_INCREMENT,
  `tus_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`tus_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gn_tusu`
--

LOCK TABLES `gn_tusu` WRITE;
/*!40000 ALTER TABLE `gn_tusu` DISABLE KEYS */;
INSERT INTO `gn_tusu` VALUES (1,'administrador'),(2,'auditor'),(3,'usuario');
/*!40000 ALTER TABLE `gn_tusu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_prue`
--

DROP TABLE IF EXISTS `re_prue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_prue` (
  `pru_cont` int(11) NOT NULL AUTO_INCREMENT,
  `pru_desc` varchar(45) NOT NULL,
  `pru_date` date NOT NULL,
  `pru_priva` varchar(200) NOT NULL,
  PRIMARY KEY (`pru_cont`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_prue`
--

LOCK TABLES `re_prue` WRITE;
/*!40000 ALTER TABLE `re_prue` DISABLE KEYS */;
INSERT INTO `re_prue` VALUES (1,'registro de prueba','2017-10-15','prueba de valor privado 1'),(2,'registro de prueba 2','2017-10-25','prueba de valor privado 2');
/*!40000 ALTER TABLE `re_prue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03 18:02:45
