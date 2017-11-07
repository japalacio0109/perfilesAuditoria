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
  `dba_fech` datetime DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `au_dbau`
--

LOCK TABLES `au_dbau` WRITE;
/*!40000 ALTER TABLE `au_dbau` DISABLE KEYS */;
INSERT INTO `au_dbau` VALUES (1,'2017-11-03 20:49:24','/gn_tdoc','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"gn_tdoc\", \"action\"=>\"index\"}',NULL,NULL,2,6,1,1),(2,'2017-11-03 20:49:31','/gn_tdoc/save','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"crVk5ScBaAg/Tadvv+5M9aSAk4xnJIsgUVlF1njruHjSUd2SpMAiPEiW8JoZXCahkGSivhJwfalJUp5aDkg8Sg==\", \"tdo_cont\"=>\"\", \"tdo_desc\"=>\"prueba\", \"commit\"=>\"Guardar\", \"controller\"=>\"gn_tdoc\", \"action\"=>\"save\"}',NULL,NULL,1,6,1,1),(3,'2017-11-03 20:49:31','/gn_tdoc/save','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"crVk5ScBaAg/Tadvv+5M9aSAk4xnJIsgUVlF1njruHjSUd2SpMAiPEiW8JoZXCahkGSivhJwfalJUp5aDkg8Sg==\", \"tdo_cont\"=>\"\", \"tdo_desc\"=>\"prueba\", \"commit\"=>\"Guardar\", \"controller\"=>\"gn_tdoc\", \"action\"=>\"save\"}',NULL,'{\"tdo_cont\"=>4, \"tdo_desc\"=>\"prueba\"}',1,3,1,1),(4,'2017-11-03 20:49:31','/gn_tdoc','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"gn_tdoc\", \"action\"=>\"index\"}',NULL,NULL,2,6,1,1),(5,'2017-11-03 20:49:33','/gn_tdoc/show','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"authenticity_token\"=>\"HBV8yJ/9TRaHHBsKW9VpOsecVEc+xSYrbz8zH0AvQ4vg0Iw3jvpQ6JLRuO6YO32EfKCuHOtVps59R+kSWxTyeg==\", \"form\"=>{\"id\"=>\"4\"}, \"controller\"=>\"gn_tdoc\", \"action\"=>\"show\"}',NULL,NULL,1,6,1,1),(6,'2017-11-03 20:49:33','/gn_tdoc/show','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"authenticity_token\"=>\"HBV8yJ/9TRaHHBsKW9VpOsecVEc+xSYrbz8zH0AvQ4vg0Iw3jvpQ6JLRuO6YO32EfKCuHOtVps59R+kSWxTyeg==\", \"form\"=>{\"id\"=>\"4\"}, \"controller\"=>\"gn_tdoc\", \"action\"=>\"show\"}',NULL,NULL,1,6,1,1),(7,'2017-11-03 20:49:37','/gn_tdoc/save','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"UESRJ1xdslsn508wbeFMy/QxffsKNmq+3HEQ6fj95UDwoChQ35z4b1A8GMXLUyafwNVMyX9inDfEestljl5hcg==\", \"tdo_cont\"=>\"4\", \"tdo_desc\"=>\"prueba1\", \"commit\"=>\"Guardar\", \"controller\"=>\"gn_tdoc\", \"action\"=>\"save\"}',NULL,NULL,1,6,1,1),(8,'2017-11-03 20:49:37','/gn_tdoc/save','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"UESRJ1xdslsn508wbeFMy/QxffsKNmq+3HEQ6fj95UDwoChQ35z4b1A8GMXLUyafwNVMyX9inDfEestljl5hcg==\", \"tdo_cont\"=>\"4\", \"tdo_desc\"=>\"prueba1\", \"commit\"=>\"Guardar\", \"controller\"=>\"gn_tdoc\", \"action\"=>\"save\"}','{\"tdo_cont\"=>4, \"tdo_desc\"=>\"prueba\"}','{\"tdo_desc\"=>\"prueba1\", \"tdo_cont\"=>4}',1,4,1,1),(9,'2017-11-03 20:49:37','/gn_tdoc','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"gn_tdoc\", \"action\"=>\"index\"}',NULL,NULL,2,6,1,1),(10,'2017-11-03 20:49:40','/gn_tdoc/delete','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"authenticity_token\"=>\"IDS3Vlc/HsabNTm1I1IPXQw/gbRRYA1GOVL43BcD2vbc8UepRjgDOI74mlHgvBvjtwN774TwjaMrKiLRDDhrBw==\", \"form\"=>{\"id\"=>\"4\"}, \"controller\"=>\"gn_tdoc\", \"action\"=>\"delete\"}',NULL,NULL,1,6,1,1),(11,'2017-11-03 20:49:40','/gn_tdoc/delete','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"authenticity_token\"=>\"IDS3Vlc/HsabNTm1I1IPXQw/gbRRYA1GOVL43BcD2vbc8UepRjgDOI74mlHgvBvjtwN774TwjaMrKiLRDDhrBw==\", \"form\"=>{\"id\"=>\"4\"}, \"controller\"=>\"gn_tdoc\", \"action\"=>\"delete\"}',NULL,NULL,1,5,1,1),(12,'2017-11-03 20:49:47','/logs/system','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"logs\", \"action\"=>\"system\"}',NULL,NULL,2,6,1,0),(13,'2017-11-03 20:49:47','/home','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"home\", \"action\"=>\"index\"}',NULL,'{\"controller\"=>\"home\", \"action\"=>\"index\"}',2,6,1,1),(14,'2017-11-03 20:49:49','/logout','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"logout\"}',NULL,'Cerrar sesión',2,5,1,1),(15,'2017-11-03 20:49:49','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1),(16,'2017-11-03 20:49:52','/logs/system','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"logs\", \"action\"=>\"system\"}',NULL,NULL,2,6,NULL,0),(17,'2017-11-03 20:49:52','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1),(18,'2017-11-03 20:50:00','/login/auth','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"l4W5AbkPklY6hMjnjpGE3DP3b+TuOckjNqAfuHVDu1YoZSp6gAcKXC+Rn5fLMrYhlQCeTio/ljRvEgkauZFnXg==\", \"user\"=>\"japalacio0108\", \"pass\"=>\"123456\", \"commit\"=>\"Iniciar Sesión\", \"controller\"=>\"login\", \"action\"=>\"auth\"}',NULL,'Iniciar sesión',1,3,1,0),(19,'2017-11-03 20:50:00','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1),(20,'2017-11-03 20:50:07','/login/auth','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"bsm8lZSwkmpDWhnBcLtDZT9daiGildV48FUHnz5IyuLRKS/urbgKYFZPTrE1GHGYmaqbi2aTim+p5xE98poW6g==\", \"user\"=>\"japalacio0108\", \"pass\"=>\"12345\", \"commit\"=>\"Iniciar Sesión\", \"controller\"=>\"login\", \"action\"=>\"auth\"}',NULL,'Iniciar sesión',1,3,1,1),(21,'2017-11-03 20:50:07','/home','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"home\", \"action\"=>\"index\"}',NULL,'{\"controller\"=>\"home\", \"action\"=>\"index\"}',2,6,1,1),(22,'2017-11-03 20:50:10','/logout','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"logout\"}',NULL,'Cerrar sesión',2,5,1,1),(23,'2017-11-03 20:50:10','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1),(24,'2017-11-03 20:50:17','/login/auth','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"utf8\"=>\"✓\", \"authenticity_token\"=>\"HukYcK7OPb2GKSl1mGfA5Ot4isIlMjMVqBYfe1ENkEShCYsLl8alt5M8fgXdxPIZTY97aOE0bALxpAnZnd9MTA==\", \"user\"=>\"camilo123\", \"pass\"=>\"12345\", \"commit\"=>\"Iniciar Sesión\", \"controller\"=>\"login\", \"action\"=>\"auth\"}',NULL,'Iniciar sesión',1,3,2,1),(25,'2017-11-03 20:50:17','/home','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"home\", \"action\"=>\"index\"}',NULL,'{\"controller\"=>\"home\", \"action\"=>\"index\"}',2,6,2,1),(26,'2017-11-03 20:50:19','/logs/system','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"logs\", \"action\"=>\"system\"}',NULL,NULL,2,6,2,1),(27,'2017-11-03 20:52:06','/logout','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"logout\"}',NULL,'Cerrar sesión',2,5,2,1),(28,'2017-11-03 20:52:06','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1),(29,'2017-11-03 23:38:31','/gn_terc','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"gn_terc\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,0),(30,'2017-11-03 23:38:31','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1),(31,'2017-11-03 23:39:42','/gn_terc','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"gn_terc\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,0),(32,'2017-11-03 23:39:43','/login','MacBook-Pro-de-Jeyson.local','127.0.0.1','{\"controller\"=>\"login\", \"action\"=>\"index\"}',NULL,NULL,2,6,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gn_terc`
--

LOCK TABLES `gn_terc` WRITE;
/*!40000 ALTER TABLE `gn_terc` DISABLE KEYS */;
INSERT INTO `gn_terc` VALUES (1,1070615270,'jeyson','anibal','palacio','palma',1,'japalacio0108','8cb2237d0679ca88db6464eac60da96345513964',1,1,0,0),(2,1234567,'camilo','andres','lopez','urquijo',1,'camilo123','8cb2237d0679ca88db6464eac60da96345513964',1,2,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gn_tusu`
--

LOCK TABLES `gn_tusu` WRITE;
/*!40000 ALTER TABLE `gn_tusu` DISABLE KEYS */;
INSERT INTO `gn_tusu` VALUES (1,'administrador'),(2,'auditor'),(3,'usuario'),(4,'prueba');
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

-- Dump completed on 2017-11-07  8:36:08
