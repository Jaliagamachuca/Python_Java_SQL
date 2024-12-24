CREATE DATABASE  IF NOT EXISTS `bdnavidad` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdnavidad`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdnavidad
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `jerarquia`
--

DROP TABLE IF EXISTS `jerarquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jerarquia` (
  `idJerarquia` int NOT NULL,
  `NombreJerarquia` varchar(45) NOT NULL,
  PRIMARY KEY (`idJerarquia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jerarquia`
--

LOCK TABLES `jerarquia` WRITE;
/*!40000 ALTER TABLE `jerarquia` DISABLE KEYS */;
INSERT INTO `jerarquia` VALUES (1,'Rey'),(2,'Clerigo'),(3,'Caballero'),(4,'Burgues'),(5,'Campesino'),(6,'Esclavo');
/*!40000 ALTER TABLE `jerarquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `idPersonajes` int NOT NULL,
  `NombrePersonaje` varchar(45) NOT NULL,
  PRIMARY KEY (`idPersonajes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Superman'),(2,'Batman'),(3,'Wonder Woman'),(4,'Yellow Lantern');
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Jerarquia_idJerarquia` int NOT NULL,
  PRIMARY KEY (`idUsuarios`,`Jerarquia_idJerarquia`),
  KEY `fk_Usuarios_Jerarquia1_idx` (`Jerarquia_idJerarquia`),
  CONSTRAINT `fk_Usuarios_Jerarquia1` FOREIGN KEY (`Jerarquia_idJerarquia`) REFERENCES `jerarquia` (`idJerarquia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Julio','Aliaga',1),(2,'Carlos','Aliaga',2),(3,'Robert ','Aliaga',3),(4,'Patricia','Cayotopa',4);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_has_personajes`
--

DROP TABLE IF EXISTS `usuarios_has_personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_has_personajes` (
  `Usuarios_idUsuarios` int NOT NULL,
  `Personajes_idPersonajes` int NOT NULL,
  PRIMARY KEY (`Usuarios_idUsuarios`,`Personajes_idPersonajes`),
  KEY `fk_Usuarios_has_Personajes_Personajes1_idx` (`Personajes_idPersonajes`),
  KEY `fk_Usuarios_has_Personajes_Usuarios_idx` (`Usuarios_idUsuarios`),
  CONSTRAINT `fk_Usuarios_has_Personajes_Personajes1` FOREIGN KEY (`Personajes_idPersonajes`) REFERENCES `personajes` (`idPersonajes`),
  CONSTRAINT `fk_Usuarios_has_Personajes_Usuarios` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_personajes`
--

LOCK TABLES `usuarios_has_personajes` WRITE;
/*!40000 ALTER TABLE `usuarios_has_personajes` DISABLE KEYS */;
INSERT INTO `usuarios_has_personajes` VALUES (1,1),(1,2),(4,3),(1,4);
/*!40000 ALTER TABLE `usuarios_has_personajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-24 10:29:07
