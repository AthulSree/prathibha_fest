-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: prathibha_fest_main
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accYear` varchar(4) NOT NULL,
  `desc` varchar(7) NOT NULL,
  `endDate` date NOT NULL,
  `startDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (1,'2024','2024-25','2025-03-31','2024-04-01');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add class list',7,'add_classlist'),(26,'Can change class list',7,'change_classlist'),(27,'Can delete class list',7,'delete_classlist'),(28,'Can view class list',7,'view_classlist'),(29,'Can add quiz master',8,'add_quizmaster'),(30,'Can change quiz master',8,'change_quizmaster'),(31,'Can delete quiz master',8,'delete_quizmaster'),(32,'Can view quiz master',8,'view_quizmaster'),(33,'Can add academic year',9,'add_academicyear'),(34,'Can change academic year',9,'change_academicyear'),(35,'Can delete academic year',9,'delete_academicyear'),(36,'Can view academic year',9,'view_academicyear'),(37,'Can add events_master',10,'add_events_master'),(38,'Can change events_master',10,'change_events_master'),(39,'Can delete events_master',10,'delete_events_master'),(40,'Can view events_master',10,'view_events_master'),(41,'Can add students',11,'add_students'),(42,'Can change students',11,'change_students'),(43,'Can delete students',11,'delete_students'),(44,'Can view students',11,'view_students'),(45,'Can add comp stud events',12,'add_compstudevents'),(46,'Can change comp stud events',12,'change_compstudevents'),(47,'Can delete comp stud events',12,'delete_compstudevents'),(48,'Can view comp stud events',12,'view_compstudevents'),(49,'Can add form test',13,'add_formtest'),(50,'Can change form test',13,'change_formtest'),(51,'Can delete form test',13,'delete_formtest'),(52,'Can view form test',13,'view_formtest'),(53,'Can add cultural events',14,'add_culturalevents'),(54,'Can change cultural events',14,'change_culturalevents'),(55,'Can delete cultural events',14,'delete_culturalevents'),(56,'Can view cultural events',14,'view_culturalevents');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
-- Table structure for table `class_list`
--

DROP TABLE IF EXISTS `class_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_level` varchar(50) NOT NULL,
  `class_level_abbr` varchar(5) NOT NULL,
  `classno` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_list`
--

LOCK TABLES `class_list` WRITE;
/*!40000 ALTER TABLE `class_list` DISABLE KEYS */;
INSERT INTO `class_list` VALUES (1,'Lower Primary','LP',1),(2,'Lower Primary','LP',2),(3,'Lower Primary','LP',3),(4,'Lower Primary','LP',4),(5,'Upper Primary','UP',5),(6,'Upper Primary','UP',6),(7,'Upper Primary','UP',7),(8,'High School','HS',8),(9,'High School','HS',9),(10,'High School','HS',10),(11,'Higher Secondary School','HSS',11),(12,'Higher Secondary School','HSS',12);
/*!40000 ALTER TABLE `class_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_student_events`
--

DROP TABLE IF EXISTS `comp_student_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_student_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pgm_id` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `academic_year_id` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  `student_id` bigint DEFAULT NULL,
  `standard_id` bigint DEFAULT NULL,
  `prize` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comp_student_events_academic_year_id_972f73db_fk_academic_` (`academic_year_id`),
  KEY `comp_student_events_event_id_2db9da2b_fk_events_master_id` (`event_id`),
  KEY `comp_student_events_student_id_5458b78a_fk_students_id` (`student_id`),
  KEY `comp_student_events_standard_id_e4c8ddfd_fk_class_list_id` (`standard_id`),
  CONSTRAINT `comp_student_events_academic_year_id_972f73db_fk_academic_` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_year` (`id`),
  CONSTRAINT `comp_student_events_event_id_2db9da2b_fk_events_master_id` FOREIGN KEY (`event_id`) REFERENCES `events_master` (`id`),
  CONSTRAINT `comp_student_events_standard_id_e4c8ddfd_fk_class_list_id` FOREIGN KEY (`standard_id`) REFERENCES `class_list` (`id`),
  CONSTRAINT `comp_student_events_student_id_5458b78a_fk_students_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_student_events`
--

LOCK TABLES `comp_student_events` WRITE;
/*!40000 ALTER TABLE `comp_student_events` DISABLE KEYS */;
INSERT INTO `comp_student_events` VALUES (1,181,'',1,4,1,3,'I'),(2,407,'',1,4,2,2,'II'),(3,828,'',1,4,3,7,'I'),(5,450,'',1,4,5,6,'I'),(6,561,'',1,4,4,5,'II'),(7,264,'',1,4,6,6,'II'),(8,909,'',1,5,1,3,'I'),(9,184,'',1,5,7,2,'II'),(10,811,'',1,5,5,6,'I'),(11,360,'',1,5,8,6,'II'),(12,534,'',1,5,9,6,'I'),(13,933,'',1,5,10,7,'II'),(14,235,'',1,14,11,10,'I'),(15,841,'',1,14,12,9,'II'),(16,190,'',1,14,13,12,'I'),(17,712,'',1,14,14,12,'II');
/*!40000 ALTER TABLE `comp_student_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultural_events`
--

DROP TABLE IF EXISTS `cultural_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultural_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `EventName` varchar(200) NOT NULL,
  `EventDesc` longtext NOT NULL,
  `EventFile` varchar(100) NOT NULL,
  `updatedOn` datetime(6) NOT NULL,
  `AccYear_id` bigint NOT NULL,
  `classId_id` bigint NOT NULL,
  `eventId_id` bigint NOT NULL,
  `EventOrder` int DEFAULT NULL,
  `FileName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cultural_events_AccYear_id_131d199b_fk_academic_year_id` (`AccYear_id`),
  KEY `cultural_events_classId_id_c995077e_fk_class_list_id` (`classId_id`),
  KEY `cultural_events_eventId_id_b450a010_fk_events_master_id` (`eventId_id`),
  CONSTRAINT `cultural_events_AccYear_id_131d199b_fk_academic_year_id` FOREIGN KEY (`AccYear_id`) REFERENCES `academic_year` (`id`),
  CONSTRAINT `cultural_events_classId_id_c995077e_fk_class_list_id` FOREIGN KEY (`classId_id`) REFERENCES `class_list` (`id`),
  CONSTRAINT `cultural_events_eventId_id_b450a010_fk_events_master_id` FOREIGN KEY (`eventId_id`) REFERENCES `events_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultural_events`
--

LOCK TABLES `cultural_events` WRITE;
/*!40000 ALTER TABLE `cultural_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cultural_events` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'Cultural_events','culturalevents'),(10,'Cultural_events','events_master'),(9,'Quiz','academicyear'),(7,'Quiz','classlist'),(8,'Quiz','quizmaster'),(6,'sessions','session'),(11,'Students','students'),(12,'studevents','compstudevents'),(13,'studevents','formtest');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Cultural_events','0001_initial','2024-10-11 12:08:16.632023'),(2,'Quiz','0001_initial','2024-10-11 12:08:16.687804'),(3,'Quiz','0002_remove_classlist_class_abbr_and_more','2024-10-11 12:08:16.857407'),(4,'Quiz','0003_quizmaster','2024-10-11 12:08:16.980455'),(5,'Quiz','0004_alter_quizmaster_audio_q_alter_quizmaster_image_q_and_more','2024-10-11 12:08:16.996971'),(6,'Quiz','0005_alter_quizmaster_audio_q_alter_quizmaster_image_q_and_more','2024-10-11 12:08:17.015345'),(7,'Quiz','0006_alter_quizmaster_audio_q_alter_quizmaster_image_q_and_more','2024-10-11 12:08:17.046977'),(8,'Quiz','0007_remove_quizmaster_classid_quizmaster_classlevel','2024-10-11 12:08:17.310055'),(9,'Quiz','0008_academicyear_quizmaster_acc_year','2024-10-11 12:08:17.499327'),(10,'Quiz','0009_academicyear_enddate_academicyear_startdate','2024-10-11 12:08:17.676488'),(11,'Students','0001_initial','2024-10-11 12:08:17.874083'),(12,'contenttypes','0001_initial','2024-10-11 12:08:17.950345'),(13,'auth','0001_initial','2024-10-11 12:08:18.826416'),(14,'admin','0001_initial','2024-10-11 12:08:19.047354'),(15,'admin','0002_logentry_remove_auto_add','2024-10-11 12:08:19.072221'),(16,'admin','0003_logentry_add_action_flag_choices','2024-10-11 12:08:19.096841'),(17,'contenttypes','0002_remove_content_type_name','2024-10-11 12:08:19.254643'),(18,'auth','0002_alter_permission_name_max_length','2024-10-11 12:08:19.354396'),(19,'auth','0003_alter_user_email_max_length','2024-10-11 12:08:19.419405'),(20,'auth','0004_alter_user_username_opts','2024-10-11 12:08:19.450969'),(21,'auth','0005_alter_user_last_login_null','2024-10-11 12:08:19.573668'),(22,'auth','0006_require_contenttypes_0002','2024-10-11 12:08:19.578805'),(23,'auth','0007_alter_validators_add_error_messages','2024-10-11 12:08:19.602597'),(24,'auth','0008_alter_user_username_max_length','2024-10-11 12:08:19.741592'),(25,'auth','0009_alter_user_last_name_max_length','2024-10-11 12:08:19.887509'),(26,'auth','0010_alter_group_name_max_length','2024-10-11 12:08:19.951911'),(27,'auth','0011_update_proxy_permissions','2024-10-11 12:08:20.012476'),(28,'auth','0012_alter_user_first_name_max_length','2024-10-11 12:08:20.141082'),(29,'sessions','0001_initial','2024-10-11 12:08:20.220300'),(30,'studevents','0001_initial','2024-10-11 12:08:20.422692'),(31,'studevents','0002_rename_studeevents_studevents','2024-10-11 12:08:20.474263'),(32,'studevents','0003_compstudevents_delete_studevents','2024-10-11 12:08:20.797974'),(33,'studevents','0004_remove_compstudevents_student_compstudevents_student','2024-10-11 12:08:21.502559'),(34,'studevents','0005_remove_compstudevents_student_compstudevents_student','2024-10-11 12:08:21.751573'),(35,'studevents','0006_compstudevents_standard','2024-10-11 12:08:21.997741'),(36,'studevents','0007_formtest','2024-10-11 12:08:22.243284'),(37,'studevents','0008_rename_standard_formtest_standard_formtest_event','2024-10-11 12:08:22.676770'),(38,'studevents','0009_formtest_student','2024-10-11 12:08:22.851812'),(39,'Students','0002_students_gender','2024-10-13 14:18:40.520775'),(40,'Cultural_events','0002_culturalevents','2024-10-13 15:02:32.103259'),(41,'Cultural_events','0003_culturalevents_eventorder_culturalevents_filename','2024-10-14 14:39:17.884193'),(42,'Cultural_events','0004_alter_culturalevents_eventorder','2024-10-14 14:39:17.908170'),(43,'studevents','0010_compstudevents_prize','2024-10-15 16:16:25.647877'),(44,'Cultural_events','0005_events_master_artistic_item_and_more','2024-10-20 15:09:15.643763');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_master`
--

DROP TABLE IF EXISTS `events_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event` varchar(100) NOT NULL,
  `competition_item` varchar(1) NOT NULL,
  `group_item` varchar(1) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `artistic_item` varchar(1) NOT NULL,
  `sports_item` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_master`
--

LOCK TABLES `events_master` WRITE;
/*!40000 ALTER TABLE `events_master` DISABLE KEYS */;
INSERT INTO `events_master` VALUES (1,'ഓർമ പരിശോധന','Y','N','2024-10-20 15:09:42.626752','N','Y'),(2,'ക്വിസ് ','Y','N','2024-10-20 15:09:50.515455','N','Y'),(3,'കസേര ചുറ്റൽ ','Y','N','2024-10-20 15:10:01.412900','N','Y'),(4,'പുന്നക്ക പറക്കൽ','Y','N','2024-10-20 15:10:09.136485','N','Y'),(5,'റൊട്ടി കടി ','Y','N','2024-10-20 15:10:16.175303','N','Y'),(6,'ആനയ്ക്ക് വാല് വരയ്ക്കൽ','Y','N','2024-10-20 15:10:23.807761','N','Y'),(7,'സുന്ദരന് മീശ വരയ്ക്കൽ ','Y','N','2024-10-20 15:10:29.738048','N','Y'),(8,'സുന്ദരിയ്ക്ക് പൊട്ടു തൊടൽ ','Y','N','2024-10-20 15:10:35.939127','N','Y'),(9,'പാസിംഗ് ദി ഡോൾ','Y','N','2024-10-20 15:10:42.561794','N','Y'),(10,'ചതിയൻ തൊപ്പി ','Y','N','2024-10-20 15:10:58.685532','N','Y'),(11,'മെഴുകുതിരി കത്തിക്കൽ ','Y','N','2024-10-20 15:11:13.276446','N','Y'),(12,'മിസ്റ്റർ പ്രതിഭ','Y','N','2024-10-20 15:17:14.913595','N','Y'),(13,'ലെമൺ & സ്പൂൺ','Y','N','2024-10-20 15:17:31.916042','N','Y'),(14,'സൈക്കിൾ സ്ലോ റേസ് ','Y','N','2024-10-20 15:17:44.290161','N','Y'),(15,'ചെസ്സ് ','Y','N','2024-10-20 15:17:52.024015','N','Y'),(16,'കവിതാ രചന','Y','N','2024-10-20 15:18:02.187360','Y','N'),(17,'കഥാ രചന','Y','N','2024-10-20 15:18:19.120968','Y','N'),(18,'ഉപന്യാസം ','Y','N','2024-10-20 15:18:27.227533','Y','N'),(19,'ചിത്ര രചന','Y','N','2024-10-20 15:18:34.106071','Y','N'),(20,'കളറിംഗ് ','Y','N','2024-10-20 15:18:41.389473','Y','N'),(21,'കവിതാ പാരായണം','Y','N','2024-10-11 12:35:01.994555','N','N'),(22,'ലളിതഗാനം','Y','N','2024-10-11 12:35:24.884991','N','N'),(23,'പ്രസംഗം','Y','N','2024-10-11 12:35:34.569082','N','N'),(24,'പ്രച്ഛന്നവേശം','Y','N','2024-10-11 12:35:52.134178','N','N'),(25,'സമൂഹഗാനം','Y','Y','2024-10-11 12:36:05.498273','N','N'),(26,'നാടൻപാട്ട്','Y','Y','2024-10-11 12:36:16.156596','N','N'),(27,'സിനിമാഗാനം','Y','N','2024-10-20 15:19:57.221105','N','N'),(28,'നിശ്ചല ദൃശ്യം ','Y','Y','2024-10-11 12:37:02.386076','N','N');
/*!40000 ALTER TABLE `events_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_test`
--

DROP TABLE IF EXISTS `form_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Standard_id` bigint NOT NULL,
  `Event_id` bigint DEFAULT NULL,
  `Student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_test_Standard_id_0437c583_fk_class_list_id` (`Standard_id`),
  KEY `form_test_Event_id_3c423481_fk_events_master_id` (`Event_id`),
  KEY `form_test_Student_id_04e29e6b_fk_students_id` (`Student_id`),
  CONSTRAINT `form_test_Event_id_3c423481_fk_events_master_id` FOREIGN KEY (`Event_id`) REFERENCES `events_master` (`id`),
  CONSTRAINT `form_test_Standard_id_0437c583_fk_class_list_id` FOREIGN KEY (`Standard_id`) REFERENCES `class_list` (`id`),
  CONSTRAINT `form_test_Student_id_04e29e6b_fk_students_id` FOREIGN KEY (`Student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_test`
--

LOCK TABLES `form_test` WRITE;
/*!40000 ALTER TABLE `form_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_master`
--

DROP TABLE IF EXISTS `quiz_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_Q` varchar(100) NOT NULL,
  `audio_Q` varchar(100) NOT NULL,
  `video_Q` varchar(100) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `classLevel` varchar(5) NOT NULL,
  `acc_year_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_master_acc_year_id_acb593a1_fk_academic_year_id` (`acc_year_id`),
  CONSTRAINT `quiz_master_acc_year_id_acb593a1_fk_academic_year_id` FOREIGN KEY (`acc_year_id`) REFERENCES `academic_year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_master`
--

LOCK TABLES `quiz_master` WRITE;
/*!40000 ALTER TABLE `quiz_master` DISABLE KEYS */;
INSERT INTO `quiz_master` VALUES (1,'2024/quizdocs/image/up_93AS06g.jpg','2024/quizdocs/audio/up_Q4799ld.mp3','2024/quizdocs/video/up_xmK9vg4.mp4','2024-10-11 12:15:35.980136','UP',1),(2,'2024/quizdocs/image/hs_fEtYflt.jpg','2024/quizdocs/audio/hs.mp3','2024/quizdocs/video/hs.mp4','2024-10-11 12:16:24.564458','HS',1),(3,'2024/quizdocs/image/hss.jpg','2024/quizdocs/audio/hss.mp3','2024/quizdocs/video/hss.mp4','2024-10-11 12:17:03.099143','HSS',1);
/*!40000 ALTER TABLE `quiz_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_name` varchar(30) NOT NULL,
  `academic_yr_id` bigint NOT NULL,
  `class_list_id` bigint NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_academic_yr_id_ac22e49f_fk_academic_year_id` (`academic_yr_id`),
  KEY `students_class_list_id_cdcab79c_fk_class_list_id` (`class_list_id`),
  CONSTRAINT `students_academic_yr_id_ac22e49f_fk_academic_year_id` FOREIGN KEY (`academic_yr_id`) REFERENCES `academic_year` (`id`),
  CONSTRAINT `students_class_list_id_cdcab79c_fk_class_list_id` FOREIGN KEY (`class_list_id`) REFERENCES `class_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Sachu Suresh',1,3,'M'),(2,'Niveditha S S',1,4,'F'),(3,'Aswin B',1,7,'M'),(4,'Adithyan S S',1,5,'M'),(5,'Arathy B S',1,6,'F'),(6,'Abhithajith A M',1,6,'F'),(7,'Jewel S S',1,2,'F'),(8,'Aslin B Shaji',1,6,'F'),(9,'Jidev B',1,6,'M'),(10,'Vishnu S S',1,7,'M'),(11,'Arjun Krishna R R',1,10,'M'),(12,'Ajay R',1,9,'M'),(13,'Amarind A D',1,12,'M'),(14,'Abhishek S',1,12,'M'),(15,'Sreehari S',1,10,'M'),(16,'Sachu Lal A N',1,11,'M'),(17,'Sreesanth S Sunil',1,11,'M'),(18,'Keerthana J Jiji',1,8,'F'),(19,'Gowri S V',1,10,'F'),(20,'Adithya J Saji',1,11,'F'),(21,'Kavya B K',1,11,'F'),(22,'Caine Nevis',1,10,'M'),(23,'Vishnu Rajesh R S',1,12,'M'),(24,'Nivedya R Kumar',1,10,'F'),(25,'Anamika S S',1,8,'F'),(26,'Anakha Krishna S B',1,12,'F'),(27,'Saniya Binu D',1,12,'F'),(28,'Amal S',1,12,'M'),(29,'Siju B',1,11,'M'),(30,'Avanthika A R',1,1,'F'),(31,'Adithya S P',1,9,'F'),(32,'Gouri S',1,12,'F'),(33,'Bhadra S Laiju',1,12,'F'),(34,'Abhijith S R',1,7,'M'),(35,'Milan S S',1,5,'M');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-20 21:03:17
