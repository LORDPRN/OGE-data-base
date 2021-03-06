-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: oge_bd
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `nombre1Admin` varchar(50) NOT NULL,
  `nombre2Admin` varchar(50) DEFAULT NULL,
  `apellido1Admin` varchar(50) NOT NULL,
  `apellido2Admin` varchar(50) DEFAULT NULL,
  `correoAdmin` varchar(50) NOT NULL,
  `telefonoAdmin` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'Abdiel','David','Arias','Asprilla','abdiel.arias@uao.edu.co','000000','abdiel.arias','2175176'),(2,'Maria','Fernanda','Brand',NULL,'brand@uao.edu.co','0000000000','maria.brand','2171458'),(3,'Alejandro',NULL,'Ochoa','Salamanca','alejandro.ochoa@uao.edu.co','0000000000','alejandro.ochoa','2180619');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `administradorgrupo`
--

DROP TABLE IF EXISTS `administradorgrupo`;
/*!50001 DROP VIEW IF EXISTS `administradorgrupo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `administradorgrupo` AS SELECT 
 1 AS `nombre1Admin`,
 1 AS `apellido1Admin`,
 1 AS `nombreGrupo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `archivos_contenidos`
--

DROP TABLE IF EXISTS `archivos_contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivos_contenidos` (
  `idArchivoContenido` int(11) NOT NULL AUTO_INCREMENT,
  `archivoContenido` varchar(255) DEFAULT NULL,
  `idContenidoFA` int(11) NOT NULL,
  PRIMARY KEY (`idArchivoContenido`),
  KEY `archivos_contenidos_ibfk_1` (`idContenidoFA`),
  CONSTRAINT `archivos_contenidos_ibfk_1` FOREIGN KEY (`idContenidoFA`) REFERENCES `contenidossd` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos_contenidos`
--

LOCK TABLES `archivos_contenidos` WRITE;
/*!40000 ALTER TABLE `archivos_contenidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivos_contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(100) NOT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Ingenier??a de manufactura - modalidad combinada'),(2,'Ingenier??a de datos e inteligencia artificial - modalidad combinada'),(3,'Ingenier??a empresarial - modalidad combinada'),(4,'Dise??o industrial'),(5,'Ingenier??a ambiental'),(6,'Ingenier??a biom??dica'),(7,'Ingenier??a el??ctrica'),(8,'Ingenier??a electr??nica y telecomunicaciones'),(9,'Ingenier??a industrial'),(10,'Ingenier??a inform??tica'),(11,'Ingenier??a mec??nica'),(12,'Ingenier??a mecatr??nica'),(13,'Ingenier??a multimedia');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionComentario` varchar(300) NOT NULL,
  `fechaComentario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigoCuentaFCom` int(11) NOT NULL,
  `idContenidoFCom` int(11) NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `comentarios_ibfk_1` (`codigoCuentaFCom`),
  KEY `comentarios_ibfk_2` (`idContenidoFCom`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`codigoCuentaFCom`) REFERENCES `cuentasd` (`idCuenta`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idContenidoFCom`) REFERENCES `contenidossd` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `consultarcuentasgrupos`
--

DROP TABLE IF EXISTS `consultarcuentasgrupos`;
/*!50001 DROP VIEW IF EXISTS `consultarcuentasgrupos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consultarcuentasgrupos` AS SELECT 
 1 AS `nombre1Cuenta`,
 1 AS `nombre2Cuenta`,
 1 AS `nombreGrupo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contenidos`
--

DROP TABLE IF EXISTS `contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidos` (
  `idContenido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPublicacionC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcionC` varchar(255) NOT NULL,
  `archivoC` blob NOT NULL,
  PRIMARY KEY (`idContenido`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos`
--

LOCK TABLES `contenidos` WRITE;
/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
INSERT INTO `contenidos` VALUES (2,'2021-06-04 10:34:45','Post 2',_binary 'm60a648c04ed0be0c0c926471.jpg'),(3,'2021-06-04 11:00:42','Post 3',_binary '99357e5232234af8d3d02cd8d5efb634_fbb99da38998301f24c35ca6c45aad39__0014_batidochiamangolimonadamango_1200_600.jpg'),(4,'2021-06-04 11:06:50','Post 4',_binary 'd06094974d0180b5b8ef0fecdfc28453_PASTA_CON_TOMATE_Y_SARDINA_1200_600.jpg'),(5,'2021-06-04 15:27:37','Post 5',_binary '60a648c04ed0be0c0c926472.jpg'),(6,'2021-06-04 15:28:33','Post 6',_binary '99357e5232234af8d3d02cd8d5efb634_fbb99da38998301f24c35ca6c45aad39__0014_batidochiamangolimonadamango_1200_600.jpg'),(33,'2021-06-04 18:01:49','Post 7',_binary 'm60a648c04ed0be0c0c926471.jpg');
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidossd`
--

DROP TABLE IF EXISTS `contenidossd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidossd` (
  `idContenido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPublicacionC` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcionC` varchar(300) DEFAULT NULL,
  `idGrupoFCont` int(11) NOT NULL,
  PRIMARY KEY (`idContenido`),
  KEY `contenidos_ibfk_1` (`idGrupoFCont`),
  CONSTRAINT `contenidossd_ibfk_1` FOREIGN KEY (`idGrupoFCont`) REFERENCES `grupos_estudiantilessd` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidossd`
--

LOCK TABLES `contenidossd` WRITE;
/*!40000 ALTER TABLE `contenidossd` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidossd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre1Cuenta` varchar(50) NOT NULL,
  `nombre2Cuenta` varchar(50) NOT NULL,
  `apellido1Cuenta` varchar(50) NOT NULL,
  `apellido2Cuenta` varchar(50) NOT NULL,
  `correoInstitucional` varchar(100) NOT NULL,
  `numeroCelular` varchar(10) NOT NULL,
  `usuarioCuenta` varchar(50) NOT NULL,
  `contraseniaCuenta` varchar(50) NOT NULL,
  `esCoordinador` tinyint(1) NOT NULL,
  `nombreCarrera` varchar(255) NOT NULL,
  PRIMARY KEY (`idCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (22,'Hello','Mundo','World','Hola','root@uao.edu.co','3167573985','coordinador','root',1,'Ingenier??a multimedia'),(25,'n1 est1','n2 est1','a1 est1','a2 est1','correoest1@uao.edu.co','3100000000','n1','n1',0,'Ingenier??a mecatr??nica'),(26,'n1 est2','n2 est2','a1 est2','a2 est2','correoest2@uao.edu.co','3110000000','n1','n2',0,'Ingenier??a inform??tica');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasd`
--

DROP TABLE IF EXISTS `cuentasd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentasd` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre1Cuenta` varchar(50) NOT NULL,
  `nombre2Cuenta` varchar(50) DEFAULT NULL,
  `apellido1Cuenta` varchar(50) NOT NULL,
  `apellido2Cuenta` varchar(50) DEFAULT NULL,
  `correoInstitucional` varchar(50) NOT NULL,
  `numeroCelular` varchar(50) NOT NULL,
  `usuarioCuenta` varchar(50) NOT NULL,
  `contraseniaCuenta` varchar(50) NOT NULL,
  `esCoordinador` tinyint(4) DEFAULT NULL,
  `idCarreraFC` int(11) NOT NULL,
  PRIMARY KEY (`idCuenta`),
  KEY `cuentas_ibfk_1` (`idCarreraFC`),
  CONSTRAINT `cuentasd_ibfk_1` FOREIGN KEY (`idCarreraFC`) REFERENCES `carreras` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2175193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasd`
--

LOCK TABLES `cuentasd` WRITE;
/*!40000 ALTER TABLE `cuentasd` DISABLE KEYS */;
INSERT INTO `cuentasd` VALUES (1234567,'Valeria','Andrea','Delgado','Galvez','valeria.delgado@uao.edu.co','3124567890','valeria.delgado','1234',0,8),(2175180,'xd','xd','xd','xd','xd','3','xd','xd',1,1);
/*!40000 ALTER TABLE `cuentasd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_estudiantilessd`
--

DROP TABLE IF EXISTS `grupos_estudiantilessd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos_estudiantilessd` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGrupo` varchar(50) NOT NULL,
  `descripcionGrupo` varchar(50) DEFAULT NULL,
  `correoGrupo` varchar(50) NOT NULL,
  `telefonoGrupo` varchar(50) DEFAULT NULL,
  `idAdminFG` int(11) NOT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `grupos_estudiantiles_ibfk_1` (`idAdminFG`),
  CONSTRAINT `grupos_estudiantilessd_ibfk_1` FOREIGN KEY (`idAdminFG`) REFERENCES `administradores` (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_estudiantilessd`
--

LOCK TABLES `grupos_estudiantilessd` WRITE;
/*!40000 ALTER TABLE `grupos_estudiantilessd` DISABLE KEYS */;
INSERT INTO `grupos_estudiantilessd` VALUES (1,'programadores uao','nos gusta programar','programadores@uao.edu.co','3000000000',2),(3,'3Draftsman','Aprende a modelar en 3d ','aprende3d@uao.edu.co','3000000001',1),(4,'SGI','Ciencia y tecnolog??a','sgi@uao.edu.co','3112333321',1);
/*!40000 ALTER TABLE `grupos_estudiantilessd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes_perfiles`
--

DROP TABLE IF EXISTS `imagenes_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes_perfiles` (
  `idImagen` int(11) NOT NULL AUTO_INCREMENT,
  `imagenP` longblob,
  `idGrupoFIm` int(11) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `imagenes_perfiles_ibfk_1` (`idGrupoFIm`),
  CONSTRAINT `imagenes_perfiles_ibfk_1` FOREIGN KEY (`idGrupoFIm`) REFERENCES `grupos_estudiantilessd` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes_perfiles`
--

LOCK TABLES `imagenes_perfiles` WRITE;
/*!40000 ALTER TABLE `imagenes_perfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `idInscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `codigoCuentaFI` int(11) NOT NULL,
  `idGrupoFI` int(11) NOT NULL,
  PRIMARY KEY (`idInscripcion`),
  KEY `inscripciones_ibfk_1` (`codigoCuentaFI`),
  KEY `inscripciones_ibfk_2` (`idGrupoFI`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`codigoCuentaFI`) REFERENCES `cuentasd` (`idCuenta`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`idGrupoFI`) REFERENCES `grupos_estudiantilessd` (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,'2021-06-09 21:09:14',1234567,4),(2,'2021-06-09 21:08:10',2175180,1);
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `idLike` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCuentaFL` int(11) NOT NULL,
  `idContenidoFL` int(11) NOT NULL,
  PRIMARY KEY (`idLike`),
  KEY `likes_ibfk_1` (`codigoCuentaFL`),
  KEY `likes_ibfk_2` (`idContenidoFL`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`codigoCuentaFL`) REFERENCES `cuentasd` (`idCuenta`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`idContenidoFL`) REFERENCES `contenidossd` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oge_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `updateCuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCuentas`(IN p_idCuenta int, IN p_nombre1Cuenta varchar(50), IN p_nombre2Cuenta varchar(50), p_apellido1Cuenta varchar(50), p_apellido2Cuenta varchar(50), p_correoInstitucional varchar(50), p_numeroCelular varchar(50), p_usuarioCuenta varchar(50), p_contraseniaCuenta varchar(50), p_esCoordinador tinyint)
BEGIN
update cuentas
set
nombre1Cuenta = p_nombre1Cuenta,
nombre2Cuenta = p_nombre2Cuenta,
apellido1Cuenta = p_apellido1Cuenta,
apellido2Cuenta = p_apellido2Cuenta,
correoInstitucional = p_correoInstitucional,
numeroCelular = p_numeroCelular,
usuarioCuenta = p_usuarioCuenta,
contraseniaCuenta = p_contraseniaCuenta,
esCoordinador = p_esCoordinador
where
idCuenta = p_idCuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `administradorgrupo`
--

/*!50001 DROP VIEW IF EXISTS `administradorgrupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `administradorgrupo` AS select `a`.`nombre1Admin` AS `nombre1Admin`,`a`.`apellido1Admin` AS `apellido1Admin`,`g`.`nombreGrupo` AS `nombreGrupo` from (`administradores` `a` join `grupos_estudiantilessd` `g`) where (`a`.`idAdmin` = `g`.`idGrupo`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consultarcuentasgrupos`
--

/*!50001 DROP VIEW IF EXISTS `consultarcuentasgrupos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultarcuentasgrupos` AS select `c`.`nombre1Cuenta` AS `nombre1Cuenta`,`c`.`nombre2Cuenta` AS `nombre2Cuenta`,`g`.`nombreGrupo` AS `nombreGrupo` from ((`cuentasd` `c` join `inscripciones` `i`) join `grupos_estudiantilessd` `g`) where ((`c`.`idCuenta` = `i`.`codigoCuentaFI`) and (`i`.`idGrupoFI` = `g`.`idGrupo`)) */;
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

-- Dump completed on 2021-06-09 16:14:18
