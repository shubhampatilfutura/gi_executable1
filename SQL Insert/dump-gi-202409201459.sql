-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gi
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error` (
  `erorcode` varchar(4) NOT NULL,
  `language` varchar(1) NOT NULL,
  `prefix` varchar(2) NOT NULL,
  `created_datime` datetime DEFAULT NULL,
  `description` varchar(35) DEFAULT NULL,
  `updated_datime` datetime DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`erorcode`,`language`,`prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
INSERT INTO `error` VALUES ('E001','E','ER',NULL,'Field can not be blank',NULL,NULL),('E002','E','ER',NULL,'code should be Y or N',NULL,NULL),('E003','E','ER',NULL,'Record already exists',NULL,NULL),('E004','E','ER',NULL,'Mapping Field not configured',NULL,NULL),('E005','E','ER',NULL,'Success',NULL,NULL),('E006','E','ER',NULL,'Entity is Locked ',NULL,NULL),('E007','E','ER',NULL,'Autonum not Configured',NULL,NULL),('E008','E','ER',NULL,'Field value not required',NULL,NULL),('E009','E','ER',NULL,'clntnum length exceed expected',NULL,NULL),('E010','E','ER',NULL,'Record is not exists for cownnum',NULL,NULL),('E011','E','ER',NULL,'Record is not exists for payrnum',NULL,NULL),('E012','E','ER',NULL,'Record is not exists for lifeNum',NULL,NULL),('E013','E','ER',NULL,'Record not found for Chdrnum',NULL,NULL);
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statuses`
--

DROP TABLE IF EXISTS `user_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `user_status_short_name` varchar(8) DEFAULT NULL,
  `user_status_long_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_statuses_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statuses`
--

LOCK TABLES `user_statuses` WRITE;
/*!40000 ALTER TABLE `user_statuses` DISABLE KEYS */;
INSERT INTO `user_statuses` VALUES (1,NULL,NULL,NULL,'AC','Active'),(2,NULL,NULL,NULL,'AC','Active');
/*!40000 ALTER TABLE `user_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `is_valid` varchar(1) DEFAULT NULL,
  `updated_id` bigint unsigned DEFAULT NULL,
  `tranno` bigint unsigned DEFAULT NULL,
  `session` varchar(15) DEFAULT NULL,
  `session_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `valid_from` varchar(8) DEFAULT NULL,
  `valid_to` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_groups_deleted_at` (`deleted_at`),
  KEY `fk_companies_user_groups` (`company_id`),
  CONSTRAINT `fk_companies_user_groups` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,'2023-02-13 14:10:21.138','2023-02-13 14:10:21.138',NULL,NULL,NULL,NULL,NULL,NULL,1,'Admin','20000101','29991231'),(2,'2023-02-13 14:10:21.138','2023-02-13 14:10:21.138',NULL,'',0,0,'',0,1,'Managers','20231225','20991231'),(3,'2023-02-13 14:10:21.138','2023-02-13 14:10:21.138',NULL,'',0,0,'',0,1,'Bdm','20230201','20990215'),(4,'2023-02-13 14:10:21.138','2023-02-13 14:10:21.138',NULL,'',0,0,'',0,1,'Actuaries','20231225','20991231'),(11,'2023-02-13 14:10:21.138','2023-02-13 14:10:21.138',NULL,'',0,0,'',0,1,'Back Office','20231225','20991231');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'ROLE_SUPER_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `is_valid` bit(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `auth_secret` varchar(50) DEFAULT NULL,
  `last_logged_inipaddress` varchar(25) DEFAULT NULL,
  `last_logged_in_datime` datetime(3) DEFAULT NULL,
  `date_from` varchar(8) DEFAULT NULL,
  `date_to` varchar(8) DEFAULT NULL,
  `profile` longtext,
  `verfication_code` varchar(10) DEFAULT NULL,
  `language_id` bigint unsigned DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `user_group_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `user_status_id` bigint unsigned DEFAULT NULL,
  `last_loggedIn_datime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_users_email` (`email`),
  UNIQUE KEY `uni_users_phone` (`phone`),
  KEY `fk_companies_users` (`company_id`),
  KEY `fk_user_groups_users` (`user_group_id`),
  KEY `fk_languages_users` (`language_id`),
  CONSTRAINT `fk_companies_users` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_languages_users` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `fk_user_groups_users` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shubham.patil@futurainstech.com',_binary '','Shubham','$2a$10$wdH1iQcrjsPf8hwBqKJcEuQEnErUsicnBFF7PThgSe/Rh8/sIKmzu','+919767611268','','','2024-02-26 13:44:09.309','','','','',1,'M',1,1,1,'2024-09-19 10:03:58'),(3,'Actuaries@futurainstech.com',_binary '','Actuaries','$2a$10$wdH1iQcrjsPf8hwBqKJcEuQEnErUsicnBFF7PThgSe/Rh8/sIKmzu','+918877665544','','','2024-02-26 13:44:09.309','','','','',1,'M',4,1,1,NULL),(4,'Bdm@futurainstech.com',_binary '','BDM','$2a$10$wdH1iQcrjsPf8hwBqKJcEuQEnErUsicnBFF7PThgSe/Rh8/sIKmzu','+919988776655','','','2024-02-26 13:44:09.309','','','','',1,'M',3,1,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `is_valid` varchar(1) DEFAULT NULL,
  `updated_id` bigint unsigned DEFAULT NULL,
  `tranno` bigint unsigned DEFAULT NULL,
  `session` varchar(15) DEFAULT NULL,
  `session_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `agency_channel` varchar(5) DEFAULT NULL,
  `office` varchar(5) DEFAULT NULL,
  `agency_st` varchar(5) DEFAULT NULL,
  `license_no` varchar(20) DEFAULT NULL,
  `license_start_date` varchar(8) DEFAULT NULL,
  `license_end_date` varchar(8) DEFAULT NULL,
  `startdate` varchar(8) DEFAULT NULL,
  `end_date` varchar(8) DEFAULT NULL,
  `termination_reason` longtext,
  `client_id` bigint unsigned DEFAULT NULL,
  `aadhar` varchar(20) DEFAULT NULL,
  `pan` varchar(20) DEFAULT NULL,
  `CompanyID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agencies_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'2023-03-02 10:36:46.904',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'AG','CBE','AC','12311','20230104','20230331','20230302','20230824',NULL,8000001,'64676711','3254511',NULL),(2,'2023-03-02 10:36:46.904',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'AG','CBE','AC','123411','20230101','20230430','20230302','20230331',NULL,2,'646767','3254534',NULL),(3,'2024-07-23 09:48:16.124','2024-07-23 09:48:16.124',NULL,'',0,0,'',0,1,'AG','HO	','AC','76868','20240723','20240723','20240723','20240723','768686',5,'7687687686','ght6757',NULL);
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-20 14:59:13
