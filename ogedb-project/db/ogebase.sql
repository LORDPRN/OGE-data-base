-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ogebase
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
  `contraseniaAdmin` varchar(50) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `archivos_contenidos_ibfk_1` FOREIGN KEY (`idContenidoFA`) REFERENCES `contenidos` (`idContenido`)
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
  `nombreCarrera` varchar(50) NOT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
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
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`codigoCuentaFCom`) REFERENCES `cuentas` (`codigoCuenta`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idContenidoFCom`) REFERENCES `contenidos` (`idContenido`)
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
-- Table structure for table `contenidos`
--

DROP TABLE IF EXISTS `contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidos` (
  `idContenido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPublicacionC` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcionC` varchar(300) DEFAULT NULL,
  `idGrupoFCont` int(11) NOT NULL,
  PRIMARY KEY (`idContenido`),
  KEY `contenidos_ibfk_1` (`idGrupoFCont`),
  CONSTRAINT `contenidos_ibfk_1` FOREIGN KEY (`idGrupoFCont`) REFERENCES `grupos_estudiantiles` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos`
--

LOCK TABLES `contenidos` WRITE;
/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `codigoCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre1Cuenta` varchar(50) NOT NULL,
  `nombre2Cuenta` varchar(50) DEFAULT NULL,
  `apellido1Cuenta` varchar(50) NOT NULL,
  `apellido2Cuenta` varchar(50) DEFAULT NULL,
  `correoInstitucional` varchar(50) NOT NULL,
  `numeroCelular` varchar(50) NOT NULL,
  `contraseniaCuenta` varchar(50) NOT NULL,
  `esCoordinador` tinyint(4) DEFAULT NULL,
  `idCarreraFC` int(11) NOT NULL,
  PRIMARY KEY (`codigoCuenta`),
  KEY `cuentas_ibfk_1` (`idCarreraFC`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`idCarreraFC`) REFERENCES `carreras` (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_estudiantiles`
--

DROP TABLE IF EXISTS `grupos_estudiantiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos_estudiantiles` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreGrupo` varchar(50) NOT NULL,
  `descripcionGrupo` varchar(50) DEFAULT NULL,
  `correoGrupo` varchar(50) NOT NULL,
  `telefonoGrupo` varchar(50) DEFAULT NULL,
  `idAdminFG` int(11) NOT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `grupos_estudiantiles_ibfk_1` (`idAdminFG`),
  CONSTRAINT `grupos_estudiantiles_ibfk_1` FOREIGN KEY (`idAdminFG`) REFERENCES `administradores` (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_estudiantiles`
--

LOCK TABLES `grupos_estudiantiles` WRITE;
/*!40000 ALTER TABLE `grupos_estudiantiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos_estudiantiles` ENABLE KEYS */;
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
  CONSTRAINT `imagenes_perfiles_ibfk_1` FOREIGN KEY (`idGrupoFIm`) REFERENCES `grupos_estudiantiles` (`idGrupo`)
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
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`codigoCuentaFI`) REFERENCES `cuentas` (`codigoCuenta`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`idGrupoFI`) REFERENCES `grupos_estudiantiles` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
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
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`codigoCuentaFL`) REFERENCES `cuentas` (`codigoCuenta`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`idContenidoFL`) REFERENCES `contenidos` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-29 16:41:16
