-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: makeupshop
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `countries_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_FK` (`countries_id`),
  CONSTRAINT `brands_FK` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Loreal',1),(2,'Nyx',2),(3,'Borjua',3),(4,'Aven',4);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyers`
--

DROP TABLE IF EXISTS `buyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `cities_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buyers_FK` (`cities_id`),
  CONSTRAINT `buyers_FK` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyers`
--

LOCK TABLES `buyers` WRITE;
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` VALUES (1,'Maria','women',1),(2,'Marta','women',2),(3,'Ira','women',3),(4,'Ivan','men',4);
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cities_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_FK` (`cities_id`),
  CONSTRAINT `cities_FK` FOREIGN KEY (`cities_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Lviv',1),(2,'Warsaw',2),(3,'Milan',3),(4,'Berlin',4);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cosmeticbagofthebuyers`
--

DROP TABLE IF EXISTS `cosmeticbagofthebuyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cosmeticbagofthebuyers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buyers_id` bigint NOT NULL,
  `brands_id` bigint NOT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cosmeticbagofthebuyers_un` (`buyers_id`,`brands_id`),
  KEY `cosmeticbagofthebuyers_FK_1` (`brands_id`),
  CONSTRAINT `cosmeticbagofthebuyers_FK` FOREIGN KEY (`buyers_id`) REFERENCES `buyers` (`id`),
  CONSTRAINT `cosmeticbagofthebuyers_FK_1` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cosmeticbagofthebuyers`
--

LOCK TABLES `cosmeticbagofthebuyers` WRITE;
/*!40000 ALTER TABLE `cosmeticbagofthebuyers` DISABLE KEYS */;
INSERT INTO `cosmeticbagofthebuyers` VALUES (1,2,2,NULL),(2,3,1,NULL),(3,1,4,NULL),(4,4,3,NULL);
/*!40000 ALTER TABLE `cosmeticbagofthebuyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Ukraine'),(2,'Poland'),(3,'Italy'),(4,'Germany');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hair`
--

DROP TABLE IF EXISTS `hair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hair` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `forwomen` varchar(100) DEFAULT NULL,
  `formen` varchar(100) DEFAULT NULL,
  `forchildren` varchar(100) DEFAULT NULL,
  `brands_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hair_FK` (`brands_id`),
  CONSTRAINT `hair_FK` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hair`
--

LOCK TABLES `hair` WRITE;
/*!40000 ALTER TABLE `hair` DISABLE KEYS */;
INSERT INTO `hair` VALUES (1,'Headen Sholders','Y','Y','N',3),(2,'Syos','Y','Y','N',4);
/*!40000 ALTER TABLE `hair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfumery`
--

DROP TABLE IF EXISTS `perfumery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfumery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `brands_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Perfumery_FK` (`brands_id`),
  CONSTRAINT `Perfumery_FK` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfumery`
--

LOCK TABLES `perfumery` WRITE;
/*!40000 ALTER TABLE `perfumery` DISABLE KEYS */;
INSERT INTO `perfumery` VALUES (1,'Armand Basi','men',1),(2,'Mussaca','women',2),(3,'MMN','men',4);
/*!40000 ALTER TABLE `perfumery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'makeupshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 21:07:35
