-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.16.04.1-log

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
-- Table structure for table `amenities`
--
SHOW DATABASES;
USE hbnb_dev_db;
DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('71370c79-0248-40d4-a96c-14d5d9c97109','2020-04-29 00:08:09','2020-04-29 00:08:09','Bello','bd00c942-f688-4e97-8504-0b956f6a7c3f'),('77f10dab-08ae-4b2b-8aa0-a39ab8e2b0a3','2020-04-29 00:04:54','2020-04-29 00:04:54','Soacha','f3cdee8a-7b3e-4cac-a886-e7411cc719d9'),('96316e02-4a0c-4329-8b16-c585d7e4c79a','2020-04-29 00:03:11','2020-04-29 00:03:11','Bogota','f3cdee8a-7b3e-4cac-a886-e7411cc719d9'),('eec98c55-2b1a-4434-b8ae-f34cc66bb46d','2020-04-29 00:06:01','2020-04-29 00:06:01','Medellin','bd00c942-f688-4e97-8504-0b956f6a7c3f');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int(11) NOT NULL,
  `number_bathrooms` int(11) NOT NULL,
  `max_guest` int(11) NOT NULL,
  `price_by_night` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('1f9533ec-547a-441c-96b4-d3605b73c185','2020-04-29 00:12:29','2020-04-29 00:12:29','96316e02-4a0c-4329-8b16-c585d7e4c79a','88f08b27-576f-4540-9a50-89761ebb9232','Lugar1',NULL,3,1,6,120,37.774,-122.431),('39bb1d34-1e86-4bd3-b82b-b49df8783dbc','2020-04-29 00:22:18','2020-04-29 00:22:18','71370c79-0248-40d4-a96c-14d5d9c97109','7ab13f65-9f78-4c77-9bf4-de96f3b37dcd','Lugar6',NULL,3,1,6,120,37.774,-122.431),('6dfbc92c-00ab-4544-b450-3a6041f7b45f','2020-04-29 00:14:48','2020-04-29 00:14:48','96316e02-4a0c-4329-8b16-c585d7e4c79a','7ab13f65-9f78-4c77-9bf4-de96f3b37dcd','Lugar2',NULL,3,1,6,120,37.774,-122.431),('a58b69a6-9713-45db-b63b-8783545e673c','2020-04-29 00:18:29','2020-04-29 00:18:29','77f10dab-08ae-4b2b-8aa0-a39ab8e2b0a3','7ab13f65-9f78-4c77-9bf4-de96f3b37dcd','Lugar4',NULL,3,1,6,120,37.774,-122.431),('d2a470cb-c64b-4731-a6db-228fa67dff38','2020-04-29 00:16:24','2020-04-29 00:16:24','77f10dab-08ae-4b2b-8aa0-a39ab8e2b0a3','88f08b27-576f-4540-9a50-89761ebb9232','Lugar3',NULL,3,1,6,120,37.774,-122.431),('e11d09f3-87cb-4f98-9138-ead17c61caba','2020-04-29 00:20:45','2020-04-29 00:20:45','eec98c55-2b1a-4434-b8ae-f34cc66bb46d','88f08b27-576f-4540-9a50-89761ebb9232','Lugar5',NULL,3,1,6,120,37.774,-122.431);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('030dbea4-954f-452a-98ac-5d1a94baad61','2020-04-29 00:40:41','2020-04-29 00:40:41','6dfbc92c-00ab-4544-b450-3a6041f7b45f','7ab13f65-9f78-4c77-9bf4-de96f3b37dcd','Amazing place, huge kitchen'),('15928825-b369-4070-8ed6-1399e4dbc6a8','2020-04-29 00:34:25','2020-04-29 00:34:25','1f9533ec-547a-441c-96b4-d3605b73c185','88f08b27-576f-4540-9a50-89761ebb9232','Amazing place, huge kitchen'),('c2bba5aa-d5a9-4b51-96de-d84defc57fa6','2020-04-29 00:35:48','2020-04-29 00:35:48','6dfbc92c-00ab-4544-b450-3a6041f7b45f','7ab13f65-9f78-4c77-9bf4-de96f3b37dcd','Amazing place, huge kitchen'),('f6b5f890-18b3-4360-b897-0d4a8f758f60','2020-04-29 00:33:33','2020-04-29 00:33:33','1f9533ec-547a-441c-96b4-d3605b73c185','88f08b27-576f-4540-9a50-89761ebb9232','Amazing place, huge kitchen');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('bd00c942-f688-4e97-8504-0b956f6a7c3f','2020-04-29 00:01:24','2020-04-29 00:01:24','Antioquia'),('f3cdee8a-7b3e-4cac-a886-e7411cc719d9','2020-04-29 00:00:41','2020-04-29 00:00:41','Cundinamarca');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('7ab13f65-9f78-4c77-9bf4-de96f3b37dcd','2020-04-29 00:10:42','2020-04-29 00:10:42','prueba2@no.com','pueba2','prueba2','prueba2'),('88f08b27-576f-4540-9a50-89761ebb9232','2020-04-29 00:09:44','2020-04-29 00:09:44','prueba1@no.com','pueba1','prueba1','prueba1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-29  3:59:41
