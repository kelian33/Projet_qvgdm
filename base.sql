-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: qvgdlt
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Current Database: `qvgdlt`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `qvgdlt` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qvgdlt`;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (1,'Qui a dit \"Allo ? Non mais allo quoi ? T\'es une fille t\'as pas de shampoing\" ?'),(2,'Le golf est-t\'il un sport ?'),(3,'Qui est la reine d\'Angleterre ?'),(4,'Qui est le fondateur de Microsoft ?'),(5,'Quel héros à été mordu par une araignée ?'),(6,'Qui est l\'attaquant vedette de Barcelone ?'),(7,'En quelle année fut  découvert l\'Amérique ?'),(8,'Quel monument du Rock français est décédé en fin d\'année 2017 ?');
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Réponses`
--

DROP TABLE IF EXISTS `Réponses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Réponses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_question` int(11) NOT NULL,
  `reponse` varchar(255) NOT NULL,
  `bonne_reponse` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Réponses`
--

LOCK TABLES `Réponses` WRITE;
/*!40000 ALTER TABLE `Réponses` DISABLE KEYS */;
INSERT INTO `Réponses` VALUES (1,1,'Nabilla Benattia',1),(2,1,'John Lennon',0),(3,1,'Léo Brugère',0),(4,1,'Sara Fraissou',0),(5,2,'Non',0),(6,2,'Oui',1),(7,3,'Hugh Jackman',0),(8,3,'Taylor Swift',0),(9,3,'Elizabet Alexandra Mary',1),(10,3,'Elisabeth Tudor',0),(11,4,'François Hollande',0),(12,4,'Bill Gates',1),(13,4,'Elon Musk',0),(14,4,'Steve Jobs',0),(15,5,'Hulk',0),(16,5,'Iron Man',0),(17,5,'Batman',0),(18,5,'SpiderMan',1),(19,6,'Lionel Messi',1),(20,6,'Jacques Chirac',0),(21,6,'Michael Jordan',0),(22,6,'Christophe Maé',0),(23,7,'1781',0),(24,7,'1492',1),(25,7,'An 0',0),(26,7,'2016',0),(27,8,'Elton John',0),(28,8,'Eddy Mitchell',0),(29,8,'Serge Gainsbourg',0),(30,8,'Johnny Hallyday',1);
/*!40000 ALTER TABLE `Réponses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-03 21:46:12
