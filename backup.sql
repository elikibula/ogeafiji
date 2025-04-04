-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ogeafiji_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add sub category',7,'add_subcategory'),(26,'Can change sub category',7,'change_subcategory'),(27,'Can delete sub category',7,'delete_subcategory'),(28,'Can view sub category',7,'view_subcategory'),(29,'Can add document category',8,'add_documentcategory'),(30,'Can change document category',8,'change_documentcategory'),(31,'Can delete document category',8,'delete_documentcategory'),(32,'Can view document category',8,'view_documentcategory'),(33,'Can add document',9,'add_document'),(34,'Can change document',9,'change_document'),(35,'Can delete document',9,'delete_document'),(36,'Can view document',9,'view_document'),(37,'Can add news',10,'add_news'),(38,'Can change news',10,'change_news'),(39,'Can delete news',10,'delete_news'),(40,'Can view news',10,'view_news'),(41,'Can add category',11,'add_category'),(42,'Can change category',11,'change_category'),(43,'Can delete category',11,'delete_category'),(44,'Can view category',11,'view_category'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add product',13,'add_product'),(50,'Can change product',13,'change_product'),(51,'Can delete product',13,'delete_product'),(52,'Can view product',13,'view_product'),(53,'Can add category',14,'add_category'),(54,'Can change category',14,'change_category'),(55,'Can delete category',14,'delete_category'),(56,'Can view category',14,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$uFHAUAW6DL5xCRNMukYiXi$qVd70OQiguvQVw8kungSPykwtApXlgtL3XjTvH3OgAg=','2025-03-31 21:38:09.735163',1,'lixtronics','','','',1,1,'2025-03-12 04:37:16.893158');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-14 03:17:08.934733','1','Admin',1,'[{\"added\": {}}]',3,1),(2,'2025-03-14 03:18:28.550552','1','Nakoro',1,'[{\"added\": {}}, {\"added\": {\"name\": \"sub category\", \"object\": \"Documents mai Nakoro\"}}]',8,1),(3,'2025-03-14 03:20:14.072304','2','Suva',1,'[{\"added\": {}}, {\"added\": {\"name\": \"sub category\", \"object\": \"Miniti ni Bose Vakoro e Suva\"}}, {\"added\": {\"name\": \"sub category\", \"object\": \"Tukutuku Vakailavo e Suva\"}}, {\"added\": {\"name\": \"sub category\", \"object\": \"Bank Statements e Suva\"}}]',8,1),(4,'2025-03-14 03:21:50.407858','1','ANZ Bank Statement as at Jan 2025',1,'[{\"added\": {}}]',9,1),(5,'2025-03-14 03:24:30.303018','5','Tukutuku Vakailavo e Suva',1,'[{\"added\": {}}]',7,1),(6,'2025-03-14 03:24:52.906994','3','Tukutuku Vakailavo e Suva',3,'',7,1),(7,'2025-03-14 03:35:46.686653','1','ANZ Bank Statement as at Jan 2025',2,'[{\"changed\": {\"fields\": [\"File\"]}}]',9,1),(8,'2025-03-14 03:51:08.006408','2','ANZ Bank Statement as July 2023',1,'[{\"added\": {}}]',9,1),(9,'2025-03-14 03:52:41.414571','3','Yatu Lau Statement as at August 2023',1,'[{\"added\": {}}]',9,1),(10,'2025-03-14 03:54:04.355208','4','UTOF Statement as at November 2023',1,'[{\"added\": {}}]',9,1),(11,'2025-03-14 03:55:31.380098','5','Yatu Lau Statement as at July 2024',1,'[{\"added\": {}}]',9,1),(12,'2025-03-14 04:00:27.410931','6','Komiti - Miniti - Okosita 2023',1,'[{\"added\": {}}]',9,1),(13,'2025-03-14 04:11:02.174964','7','Komiti - Miniti - Okosita 2024',1,'[{\"added\": {}}]',9,1),(14,'2025-03-14 04:11:44.743311','6','Miniti ni Bose ni Komiti',1,'[{\"added\": {}}]',7,1),(15,'2025-03-14 04:12:13.743598','6','Komiti - Miniti - Okosita 2023',2,'[{\"changed\": {\"fields\": [\"Subcategory\"]}}]',9,1),(16,'2025-03-14 04:12:22.866235','7','Komiti - Miniti - Okosita 2024',2,'[{\"changed\": {\"fields\": [\"Subcategory\"]}}]',9,1),(17,'2025-03-14 04:14:05.807822','8','Komiti - Miniti - Sept - 2024',1,'[{\"added\": {}}]',9,1),(18,'2025-03-14 04:17:37.555407','9','Miniti ni Bose Vakoro e Suva Feb 2024',1,'[{\"added\": {}}]',9,1),(19,'2025-03-14 04:20:22.804044','10','Miniti ni Bose Vakoro June 2024',1,'[{\"added\": {}}]',9,1),(20,'2025-03-14 04:23:19.979199','11','Miniti ni Bose Vakoro e Suva Okosita 2024',1,'[{\"added\": {}}]',9,1),(21,'2025-03-14 04:25:16.127125','12','Support Letter mai Nakoro March 2024',1,'[{\"added\": {}}]',9,1),(22,'2025-03-14 04:27:46.713331','13','Ogea Waluvu and Works in Pictures',1,'[{\"added\": {}}]',9,1),(23,'2025-03-14 04:29:02.331533','14','Ogea Sea Wall Cover Letter',1,'[{\"added\": {}}]',9,1),(24,'2025-03-14 04:29:19.964163','1','Documents ni Nakoro',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(25,'2025-03-14 04:34:17.715204','15','Ogea Sea Wall Quotation Listing',1,'[{\"added\": {}}]',9,1),(26,'2025-03-14 04:37:00.153630','16','Tukutuku Vakailavo ni Seawall ena August 2023',1,'[{\"added\": {}}]',9,1),(27,'2025-03-14 04:37:48.396056','17','Tukutuku vakai lavo ni Ogea Day mai na 2022-2024',1,'[{\"added\": {}}]',9,1),(28,'2025-03-14 04:39:01.722855','18','Ripote_-_Tukutuku_Ni_Lavo_Ni_Koro_2024',1,'[{\"added\": {}}]',9,1),(29,'2025-03-31 12:17:18.214781','1','Tokatoka Natubesara',1,'[{\"added\": {}}]',11,1),(30,'2025-03-31 12:17:42.347347','2','Tokatoka Tu-tu',1,'[{\"added\": {}}]',11,1),(31,'2025-03-31 12:17:51.545075','3','Tokatoka Mata',1,'[{\"added\": {}}]',11,1),(32,'2025-03-31 12:18:04.212951','4','Nakoro e Suva',1,'[{\"added\": {}}]',11,1),(33,'2025-03-31 12:18:19.024344','5','Nakoro e Naiculaga',1,'[{\"added\": {}}]',11,1),(34,'2025-03-31 12:18:34.893361','6','Ogea Day',1,'[{\"added\": {}}]',11,1),(35,'2025-03-31 12:20:51.342512','1','Ogea Day 2024',1,'[{\"added\": {}}]',10,1),(36,'2025-03-31 21:58:32.578006','2','Gade ki nakoro ena 2024',1,'[{\"added\": {}}]',10,1),(37,'2025-03-31 23:03:16.809239','3','Website Launch 2025',1,'[{\"added\": {}}]',10,1),(38,'2025-03-31 23:04:50.414454','7','Na Waqa Vakaviti',1,'[{\"added\": {}}]',11,1),(39,'2025-03-31 23:38:37.339065','4','Sarasara Wavoki e Ogea',1,'[{\"added\": {}}]',10,1),(40,'2025-03-31 23:50:44.573496','4','Sarasara Wavoki e Ogea',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(41,'2025-04-01 21:49:42.222979','5','Ai Vakananumi vei ira ai Vakatawa',2,'[{\"changed\": {\"fields\": [\"Image\", \"Is featured\"]}}]',10,1),(42,'2025-04-01 21:50:52.095480','5','Ai Vakananumi vei ira ai Vakatawa',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',10,1),(43,'2025-04-02 09:02:44.076762','1','Kakana',1,'[{\"added\": {}}]',14,1),(44,'2025-04-02 09:04:37.858732','2','Cakacaka ni Liga',1,'[{\"added\": {}}]',14,1),(45,'2025-04-02 09:11:07.803720','1','Kumete ni Yaqona',1,'[{\"added\": {}}]',13,1),(46,'2025-04-02 18:13:32.029567','1','Kumete ni Yaqona',2,'[{\"changed\": {\"fields\": [\"Stock\"]}}]',13,1),(47,'2025-04-02 18:37:58.378786','1','Kumete ni Yaqona',2,'[{\"changed\": {\"fields\": [\"Description\", \"Location\"]}}]',13,1),(48,'2025-04-02 19:26:20.245377','2','Ika mai Nakoro',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'documents','subcategory'),(8,'documents','documentcategory'),(9,'documents','document'),(10,'news','news'),(11,'news','category'),(12,'news','comment'),(13,'shop','product'),(14,'shop','category');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-03 05:43:45.168794');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cqnbesoz9th77gpy4u0kuan5orjr8nq9','.eJxVjEEOwiAQRe_C2hAYLAWX7nsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-N4zpwXUHdI_11mRqdV1mlLsiD9rl1Iif18P9Oyixl2-dIBpjPPhzAtSDB20BRwNssgG0ykL02idtsyWfFfKoGNVAoInYOSfeH7msNzk:1tsDu6:J21B6QNtatBM02ppvaNwMnFdVzAiG_9kyvJMj_i7dSE','2025-03-26 04:41:14.271111'),('pevl3htde6daxsnmb6ng4x538tk1uhrh','.eJxVjEEOwiAQRe_C2hAYLAWX7nsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-N4zpwXUHdI_11mRqdV1mlLsiD9rl1Iif18P9Oyixl2-dIBpjPPhzAtSDB20BRwNssgG0ykL02idtsyWfFfKoGNVAoInYOSfeH7msNzk:1tzMpd:3s62QH1pBOcaXv7moKe6Djlb6znsrNOultEpWgEIEBs','2025-04-14 21:38:09.871759'),('t0ku7g6iply40fambxwoiz77ztpnqlki','.eJxVjEEOwiAQRe_C2hAYLAWX7nsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnERWpx-N4zpwXUHdI_11mRqdV1mlLsiD9rl1Iif18P9Oyixl2-dIBpjPPhzAtSDB20BRwNssgG0ykL02idtsyWfFfKoGNVAoInYOSfeH7msNzk:1tvEhL:EkbVEk1kpWELMsjBJ44TF1QUkSXLdi3vLQcOQbfZiEE','2025-04-03 12:08:31.015211');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_document`
--

DROP TABLE IF EXISTS `documents_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(600) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_document_author_id_6440570b_fk_auth_user_id` (`author_id`),
  KEY `documents_document_category_id_99a4d66f_fk_documents` (`category_id`),
  CONSTRAINT `documents_document_author_id_6440570b_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `documents_document_category_id_99a4d66f_fk_documents` FOREIGN KEY (`category_id`) REFERENCES `documents_documentcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_document`
--

LOCK TABLES `documents_document` WRITE;
/*!40000 ALTER TABLE `documents_document` DISABLE KEYS */;
INSERT INTO `documents_document` VALUES (1,'ANZ Bank Statement as at Jan 2025','documents/Bank_Statement_as_of_Jan_2025_38EtKoF.jpg','','2025-03-14 03:20:30.000000',1,2),(2,'ANZ Bank Statement as July 2023','documents/Account_Statement_7_Jan_23_7_July_23.jpg','','2025-03-14 03:50:04.000000',1,2),(3,'Yatu Lau Statement as at August 2023','documents/Yatu_Lau_Staement_as_at_August_2023.jpg','','2025-03-14 03:51:59.000000',1,2),(4,'UTOF Statement as at November 2023','documents/Unit_Trust_Statement_as_at_Nov_2023.pdf','','2025-03-14 03:53:10.000000',1,2),(5,'Yatu Lau Statement as at July 2024','documents/Ogea_Yatu_Lau_kabani_25_July_2024.jpg','','2025-03-14 03:54:35.000000',1,2),(6,'Komiti - Miniti - Okosita 2023','documents/Miniti_ni_Bose_ni_Komiti_-_Okosita_2023.pdf','Namadi','2025-03-14 03:59:37.000000',1,2),(7,'Komiti - Miniti - Okosita 2024','documents/Komiti_-_Miniti_-_Okosita_2024.pdf','Nadawa','2025-03-14 04:10:09.000000',1,2),(8,'Komiti - Miniti - Sept - 2024','documents/Komiti_-_Miniti_-_Sept_-2024.pdf','','2025-03-14 04:13:21.000000',1,2),(9,'Miniti ni Bose Vakoro e Suva Feb 2024','documents/Miniti_-_Bose_Vakoro_-_Feb_2024.pdf','','2025-03-14 04:16:50.000000',1,2),(10,'Miniti ni Bose Vakoro June 2024','documents/Miniti_ni_Bose_Vakoro_e_Suva_Jiune_2024.pdf','','2025-03-14 04:19:11.000000',1,2),(11,'Miniti ni Bose Vakoro e Suva Okosita 2024','documents/Bose_Vakoro_ena_Polotu_mai_Kilikali_ena_ka_10_ni_Okosita_2024.pdf','','2025-03-14 04:22:06.000000',1,2),(12,'Support Letter mai Nakoro March 2024','documents/Ogea_Village_Support_Letter_March_2024.pdf','','2025-03-14 04:24:31.000000',1,1),(13,'Ogea Waluvu and Works in Pictures','documents/Ogea_Waluvu_and_Works_in_Pictures.pdf','','2025-03-14 04:27:08.000000',1,1),(14,'Ogea Sea Wall Cover Letter','documents/Ogea_Sea_Wall_cover_letter.docx','','2025-03-14 04:28:32.000000',1,1),(15,'Ogea Sea Wall Quotation Listing','documents/Quotation_Listings_-_Ogea.xlsx','','2025-03-14 04:33:46.000000',1,1),(16,'Tukutuku Vakailavo ni Seawall ena August 2023','documents/Ripote_-_Tukutuku_Ni_Lave_Ni_Seawall_11_August_2023.pdf','','2025-03-14 04:35:55.000000',1,2),(17,'Tukutuku vakai lavo ni Ogea Day mai na 2022-2024','documents/Ripote_-_Tukutuku_Ni_Lavo_Ni_Koro_2024_Rev_1_24031_240316_122442.pdf','','2025-03-14 04:37:00.000000',1,2),(18,'Ripote_-_Tukutuku_Ni_Lavo_Ni_Koro_2024','documents/Ripote_-_Tukutuku_Ni_Lavo_Ni_Koro_2024_Rev_1.xlsx','','2025-03-14 04:38:35.000000',1,2);
/*!40000 ALTER TABLE `documents_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_document_groups`
--

DROP TABLE IF EXISTS `documents_document_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_document_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_document_groups_document_id_group_id_2789cf19_uniq` (`document_id`,`group_id`),
  KEY `documents_document_groups_group_id_459396c3_fk_auth_group_id` (`group_id`),
  CONSTRAINT `documents_document_g_document_id_047833cb_fk_documents` FOREIGN KEY (`document_id`) REFERENCES `documents_document` (`id`),
  CONSTRAINT `documents_document_groups_group_id_459396c3_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_document_groups`
--

LOCK TABLES `documents_document_groups` WRITE;
/*!40000 ALTER TABLE `documents_document_groups` DISABLE KEYS */;
INSERT INTO `documents_document_groups` VALUES (1,1,1),(2,3,1),(3,5,1),(4,6,1),(5,7,1),(6,10,1),(7,18,1);
/*!40000 ALTER TABLE `documents_document_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_document_subcategory`
--

DROP TABLE IF EXISTS `documents_document_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_document_subcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `subcategory_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_document_subca_document_id_subcategory__f9d268f0_uniq` (`document_id`,`subcategory_id`),
  KEY `documents_document_s_subcategory_id_2eef80da_fk_documents` (`subcategory_id`),
  CONSTRAINT `documents_document_s_document_id_ad2347b7_fk_documents` FOREIGN KEY (`document_id`) REFERENCES `documents_document` (`id`),
  CONSTRAINT `documents_document_s_subcategory_id_2eef80da_fk_documents` FOREIGN KEY (`subcategory_id`) REFERENCES `documents_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_document_subcategory`
--

LOCK TABLES `documents_document_subcategory` WRITE;
/*!40000 ALTER TABLE `documents_document_subcategory` DISABLE KEYS */;
INSERT INTO `documents_document_subcategory` VALUES (1,1,4),(2,2,4),(3,3,4),(4,4,4),(5,5,4),(8,6,6),(9,7,6),(10,8,6),(11,9,2),(12,10,2),(13,11,2),(14,12,1),(15,13,1),(16,14,1),(17,15,1),(18,16,5),(19,17,5),(20,18,5);
/*!40000 ALTER TABLE `documents_document_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_documentcategory`
--

DROP TABLE IF EXISTS `documents_documentcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_documentcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_documentca_parent_category_id_6b0817d6_fk_documents` (`parent_category_id`),
  CONSTRAINT `documents_documentca_parent_category_id_6b0817d6_fk_documents` FOREIGN KEY (`parent_category_id`) REFERENCES `documents_documentcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_documentcategory`
--

LOCK TABLES `documents_documentcategory` WRITE;
/*!40000 ALTER TABLE `documents_documentcategory` DISABLE KEYS */;
INSERT INTO `documents_documentcategory` VALUES (1,'Nakoro',NULL),(2,'Suva',NULL);
/*!40000 ALTER TABLE `documents_documentcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_documentcategory_groups`
--

DROP TABLE IF EXISTS `documents_documentcategory_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_documentcategory_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `documentcategory_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_documentcatego_documentcategory_id_grou_c1d70d71_uniq` (`documentcategory_id`,`group_id`),
  KEY `documents_documentca_group_id_a4609660_fk_auth_grou` (`group_id`),
  CONSTRAINT `documents_documentca_documentcategory_id_cb6a08d1_fk_documents` FOREIGN KEY (`documentcategory_id`) REFERENCES `documents_documentcategory` (`id`),
  CONSTRAINT `documents_documentca_group_id_a4609660_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_documentcategory_groups`
--

LOCK TABLES `documents_documentcategory_groups` WRITE;
/*!40000 ALTER TABLE `documents_documentcategory_groups` DISABLE KEYS */;
INSERT INTO `documents_documentcategory_groups` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `documents_documentcategory_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_subcategory`
--

DROP TABLE IF EXISTS `documents_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_subcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_subcategor_category_id_3cd8ae45_fk_documents` (`category_id`),
  CONSTRAINT `documents_subcategor_category_id_3cd8ae45_fk_documents` FOREIGN KEY (`category_id`) REFERENCES `documents_documentcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_subcategory`
--

LOCK TABLES `documents_subcategory` WRITE;
/*!40000 ALTER TABLE `documents_subcategory` DISABLE KEYS */;
INSERT INTO `documents_subcategory` VALUES (1,'Documents ni Nakoro',1),(2,'Miniti ni Bose Vakoro e Suva',2),(4,'Bank Statements e Suva',2),(5,'Tukutuku Vakailavo e Suva',2),(6,'Miniti ni Bose ni Komiti',2);
/*!40000 ALTER TABLE `documents_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_subcategory_groups`
--

DROP TABLE IF EXISTS `documents_subcategory_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_subcategory_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subcategory_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documents_subcategory_gr_subcategory_id_group_id_763fcfc2_uniq` (`subcategory_id`,`group_id`),
  KEY `documents_subcategory_groups_group_id_3dfa1f1c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `documents_subcategor_subcategory_id_34d58d37_fk_documents` FOREIGN KEY (`subcategory_id`) REFERENCES `documents_subcategory` (`id`),
  CONSTRAINT `documents_subcategory_groups_group_id_3dfa1f1c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_subcategory_groups`
--

LOCK TABLES `documents_subcategory_groups` WRITE;
/*!40000 ALTER TABLE `documents_subcategory_groups` DISABLE KEYS */;
INSERT INTO `documents_subcategory_groups` VALUES (1,1,1),(2,2,1),(4,4,1),(5,5,1),(6,6,1);
/*!40000 ALTER TABLE `documents_subcategory_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (1,'Tokatoka Natubesara','tokatoka-natubesara'),(2,'Tokatoka Tu-tu','tokatoka-tu-tu'),(3,'Tokatoka Mata','tokatoka-mata'),(4,'Nakoro e Suva','nakoro-e-suva'),(5,'Nakoro e Naiculaga','nakoro-e-naiculaga'),(6,'Ogea Day','ogea-day'),(7,'Na Waqa Vakaviti','na-waqa-vakaviti');
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_comment`
--

DROP TABLE IF EXISTS `news_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `news_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_comment_author_id_088b3054_fk_auth_user_id` (`author_id`),
  KEY `news_comment_news_id_18ce08a8_fk_news_news_id` (`news_id`),
  CONSTRAINT `news_comment_author_id_088b3054_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `news_comment_news_id_18ce08a8_fk_news_news_id` FOREIGN KEY (`news_id`) REFERENCES `news_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_comment`
--

LOCK TABLES `news_comment` WRITE;
/*!40000 ALTER TABLE `news_comment` DISABLE KEYS */;
INSERT INTO `news_comment` VALUES (1,'yes','2025-03-31 19:57:37.883325',1,1);
/*!40000 ALTER TABLE `news_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_news`
--

DROP TABLE IF EXISTS `news_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `author_id` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `news_news_author_id_9f88be71_fk_auth_user_id` (`author_id`),
  KEY `news_news_category_id_f060a768_fk_news_category_id` (`category_id`),
  CONSTRAINT `news_news_author_id_9f88be71_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `news_news_category_id_f060a768_fk_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_news`
--

LOCK TABLES `news_news` WRITE;
/*!40000 ALTER TABLE `news_news` DISABLE KEYS */;
INSERT INTO `news_news` VALUES (1,'Ogea Day 2024','Siga ni Ogea Day 2024','2025-03-31 12:20:51.319977',1,1,6,'news_images/viber_image_2024-05-30_09-09-39-682.jpg','ogea-day-2024',NULL),(2,'Gade ki nakoro ena 2024','Nu sa malo a bula.\r\n\r\nE a mai lako e dua ai lakolako ki Nakoro ena Siga ni Sucu 2024 ka charter taki kina e dua a waqa ni Matanitu a MV Iloilovatu.\r\n\r\nEra ka biubiu e Suva ena Siga ni Sucu ka ra yaco yani ki Ogea ena........................','2025-03-31 21:58:32.576003',1,1,4,'news_images/269596629_4813919998671414_2598422592575830106_n.jpg','gade-ki-nakoro-ena-2024',NULL),(3,'Website Launch 2025','Esa mai tavoci nikua e dua ai vatavata vou ni ona volai vakamatata ai tukutuku me baleji ira Yavusa Ogea.','2025-03-31 23:03:16.804241',1,1,4,'news_images/2025.jpg','website-launch-2025',NULL),(4,'Sarasara Wavoki e Ogea','E dua ai yaloyalo ni sarasara','2025-03-31 23:38:37.291458',1,1,5,'news_images/background.jpg','sarasara-wavoki-e-ogea','news_videos/sarasara_wavoki.mp4'),(5,'Ai Vakananumi vei ira ai Vakatawa','Kaiei e dua ai vakananumi ka toka ena yasa ni Valenilotu mai Ogea. E volai tu kina a yacadra kei na odra koro se yanuyanu ko ira ai Vakatawa ka ra sa veiqaravi oji e Ogea.\r\n\r\nE tekivu mai na 1910 kina yabaki 2000 ka mai duri kina ai vakananumi kaiei.','2025-04-01 21:48:47.640793',1,1,5,'news_images/269597492_4809115715818509_2134495704827635413_n.jpg','ai-vakananumi-vei-ira-ai-vakatawa','');
/*!40000 ALTER TABLE `news_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'Kakana','kakana','A meca e volitaki ka rawa ni laukana.'),(2,'Cakacaka ni Liga','cakacaka-ni-liga','A meca era cakacaka ni liga, tali se sivi.');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` bigint NOT NULL,
  `seller_id` int NOT NULL,
  `stock` int unsigned NOT NULL,
  `stock_threshold` int unsigned NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`),
  KEY `shop_product_seller_id_8a4f1fdb_fk_auth_user_id` (`seller_id`),
  CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`),
  CONSTRAINT `shop_product_seller_id_8a4f1fdb_fk_auth_user_id` FOREIGN KEY (`seller_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shop_product_chk_1` CHECK ((`stock` >= 0)),
  CONSTRAINT `shop_product_chk_2` CHECK ((`stock_threshold` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (1,'Kumete ni Yaqona','kumete-ni-yaqona','Kumete ni Yaqona 22 inch. Rauta vinaka me vakayagataki e vale.',200.00,'2177277',1,'2025-04-02 09:11:07.763534','2025-04-02 18:37:58.357008','products/2025/04/02/kava-bowl.jpg',2,1,5,2,'Namadi, Suva'),(2,'Ika mai Nakoro','ika-nakoro','Volitaki ika kele mai na siga Cokonaki. Fresh qai se tuituiwina vinaka sara tu ga.',20.00,'2177277',1,'2025-04-02 19:26:20.236749','2025-04-02 19:26:20.236749','products/2025/04/03/volitaki_ika.jpg',1,1,3,2,'Namadi, Suva');
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04  7:40:58
