-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `arenas`
--

DROP TABLE IF EXISTS `arenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arenas` (
  `ARENA_ID` int NOT NULL AUTO_INCREMENT,
  `ARENA_NAME` varchar(45) NOT NULL,
  `ARENA_PICTURE` varchar(1000) NOT NULL,
  `LOCATION_ID` int NOT NULL,
  `ARENA_DESCRIPTION` varchar(1000) NOT NULL,
  PRIMARY KEY (`ARENA_ID`),
  KEY `fk_ARENAS_LOCATION1_idx` (`LOCATION_ID`),
  CONSTRAINT `fk_ARENAS_LOCATION1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arenas`
--

LOCK TABLES `arenas` WRITE;
/*!40000 ALTER TABLE `arenas` DISABLE KEYS */;
INSERT INTO `arenas` VALUES (1,'Black Dragon Fight Club','https://static.wikia.nocookie.net/mkwikia/images/7/78/Blackdragonfightclub.jpg/revision/latest/scale-to-width-down/1000?cb=20190829021116',1,'The Black Dragon Fight Club is an arena that debuted in Mortal Kombat 11.'),(2,'Dead Pool','https://static.wikia.nocookie.net/mkwikia/images/a/a4/TheDeadPool_2011.jpg/revision/latest/scale-to-width-down/1000?cb=20110308235842',2,'The Dead Pool is an arena in the Mortal Kombat series. It debuted in Mortal Kombat II and later reappeared in several sequels.'),(3,'Goro\'s Lair','https://static.wikia.nocookie.net/mkwikia/images/2/2b/Mk11goroslair.jpg/revision/latest/scale-to-width-down/1000?cb=20190829021706',1,'Goro\'s Lair is a stage that made its debut in Mortal Kombat. This lair is home to the Grand Champion Goro, where he battles the player in the first Mortal Kombat game. Shang Tsung also watches Goro\'s battles, for should he fail, Shang Tsung will intervene and battle as soon as Goro is defeated.'),(4,'Soul Chamber','https://static.wikia.nocookie.net/mkwikia/images/3/3b/The_soul_chamber_02.png/revision/latest/scale-to-width-down/395?cb=20101226105053',2,'The Soul Chamber is a location within Shao Kahn\'s Fortress in Outworld.');
/*!40000 ALTER TABLE `arenas` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$FOypTMDxOntH$5KrT9Uc1Y7+BjkpRVY1BDmsHDT8GB46pOdWpTnHe3Qk=','2021-04-20 22:55:50.120558',1,'admin','','','',1,1,'2021-03-13 19:54:04.517494'),(2,'pbkdf2_sha256$216000$x6WYYrxtLQzI$cxy6Xm9soOLktsvfjhmtS4Yf8x3trKv2OWUOsdcYqaE=',NULL,0,'userooo','','','tarektanas@yahoo.com',0,1,'2021-03-14 00:48:00.744319');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `CHARACTER_ID` int NOT NULL,
  `CHARACTER_NAME` varchar(45) NOT NULL,
  `GAME_ID` int NOT NULL,
  `LOCATION_ID` int NOT NULL,
  `CHARACTER_DESCRIPTION` varchar(1000) NOT NULL,
  `CHARACTER_PICTURE` varchar(1000) NOT NULL,
  PRIMARY KEY (`CHARACTER_ID`),
  KEY `fk_Characters_GAME_INFO1_idx` (`GAME_ID`),
  KEY `fk_Characters_LOCATION1_idx` (`LOCATION_ID`),
  CONSTRAINT `fk_Characters_LOCATION1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Scorpion',1,2,'Hanzo Hasashi, (橋 半蔵) better known as Scorpion (全蠍人, \"Full Scorpion Man\"), is a resurrected ninja in the Mortal Kombat fighting game series as well as the mascot of the games. He is one of the very few original characters debuting in the first Mortal Kombat arcade game. He holds the distinction, along with Raiden and Sub-Zero (in one form or another), of appearing in every generation of Mortal Kombat games as a playable character.','https://static.wikia.nocookie.net/mkwikia/images/b/b6/Scorpion_MK11_3.png/revision/latest/scale-to-width-down/580?cb=20190405144918'),(2,'Sub-Zero',1,1,'Kuai Liang (Chinese language: 奎良; Wade-Giles: Kuài Liáng; meaning \"Quick Cooling\"), better known as Sub-Zero (绝对零度, \"Absolute Zero\")[1], Grandmaster (of the Lin Kuei), and formerly known as Tundra and briefly as the cyborg LK-52O, is the Grandmaster of the Lin Kuei assassin clan in the Mortal Kombat fighting game series.','https://static.wikia.nocookie.net/mkwikia/images/e/ed/Sub-Zero_Mk11.png/revision/latest/scale-to-width-down/712?cb=20190323023757'),(3,'Raiden',1,1,'Raiden (雷電) is a character in the Mortal Kombat fighting game series. Being the eternal God of Thunder, Raiden has been the one the most significant characters in the series along with being one of the most memorable characters in the fighting game genre. ','https://static.wikia.nocookie.net/mkwikia/images/c/cb/Ra.png/revision/latest/scale-to-width-down/500?cb=20200509154910'),(4,'Mileena',1,2,'Mileena is a character in the Mortal Kombat fighting game series. A genetic experiment created by the sorcerer Shang Tsung, she is one of the adopted daughters of the Outworld Emperor Shao Kahn and one of his personal enforcers. She has served as an antagonist throughout the series.','https://static.wikia.nocookie.net/mkwikia/images/e/e0/MK11MileenaRender.png/revision/latest/scale-to-width-down/652?cb=20201008153856'),(5,'Liu Kang',1,1,'Liu Kang (劉康) is a character in the Mortal Kombat fighting game series. He is one of the few original characters, debuting in the first Mortal Kombat arcade game. He serves as the protagonist of Mortal Kombat, Mortal Kombat II, Mortal Kombat 3, Mortal Kombat 4, Mortal Kombat (2011) (co-protagonist), Mortal Kombat 11, the live-action films and the original comic book series. He became the Grand Champion of Mortal Kombat throughout the first four tournaments, a title that remained undisputed in the original timeline.','https://static.wikia.nocookie.net/mkwikia/images/0/00/Liu_Kang_mk11.png/revision/latest/scale-to-width-down/848?cb=20190329012026');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `PLATFORM_ID` int NOT NULL AUTO_INCREMENT,
  `MOVE_ID` int NOT NULL,
  `COMBO_MOVE` varchar(45) NOT NULL,
  PRIMARY KEY (`PLATFORM_ID`,`MOVE_ID`),
  KEY `fk_M:N relationship_Special moves1_idx` (`MOVE_ID`),
  KEY `fk_M:N relationship_platform1_idx` (`PLATFORM_ID`),
  CONSTRAINT `fk_M:N relationship_platform1` FOREIGN KEY (`PLATFORM_ID`) REFERENCES `platform` (`PLATFORM_ID`),
  CONSTRAINT `fk_M:N relationship_Special moves1` FOREIGN KEY (`MOVE_ID`) REFERENCES `moves` (`MOVE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
INSERT INTO `combo` VALUES (1,1,'bn'),(1,2,'sds'),(1,4,'gfdg'),(1,5,'PS41'),(2,1,'nb'),(2,2,'sdd'),(2,4,'gdfgd'),(2,5,'XBOX1');
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-03-13 19:49:59.070563'),(2,'auth','0001_initial','2021-03-13 19:49:59.423467'),(3,'admin','0001_initial','2021-03-13 19:50:00.486958'),(4,'admin','0002_logentry_remove_auto_add','2021-03-13 19:50:00.705972'),(5,'admin','0003_logentry_add_action_flag_choices','2021-03-13 19:50:00.716953'),(6,'contenttypes','0002_remove_content_type_name','2021-03-13 19:50:00.941934'),(7,'auth','0002_alter_permission_name_max_length','2021-03-13 19:50:01.058851'),(8,'auth','0003_alter_user_email_max_length','2021-03-13 19:50:01.260263'),(9,'auth','0004_alter_user_username_opts','2021-03-13 19:50:01.285743'),(10,'auth','0005_alter_user_last_login_null','2021-03-13 19:50:01.494024'),(11,'auth','0006_require_contenttypes_0002','2021-03-13 19:50:01.503000'),(12,'auth','0007_alter_validators_add_error_messages','2021-03-13 19:50:01.517961'),(13,'auth','0008_alter_user_username_max_length','2021-03-13 19:50:01.649412'),(14,'auth','0009_alter_user_last_name_max_length','2021-03-13 19:50:01.792420'),(15,'auth','0010_alter_group_name_max_length','2021-03-13 19:50:01.902142'),(16,'auth','0011_update_proxy_permissions','2021-03-13 19:50:01.913279'),(17,'auth','0012_alter_user_first_name_max_length','2021-03-13 19:50:02.038068'),(18,'sessions','0001_initial','2021-03-13 19:50:02.128013');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('x3yo0ywjanwfmqlmwua4cfm56suq7j4h','.eJxVjMsOwiAURP-FtSHyaAGX7v0Gch8gVQNJaVfGf7dNutDdZM6ZeYsI61Li2tMcJxYXocTpt0OgZ6o74AfUe5PU6jJPKHdFHrTLW-P0uh7u30GBXrY1gbU6ZTBnjZqyI-cI_BgyhZGZwZiBVCbMjFaHQGnwXqPCLWdwisXnCxXMOSo:1lYzHa:K_lgibFoN5RSHg5_MNGhl_XrJvNi9V4beVSytzDhCT0','2021-05-04 22:55:50.128342');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_info`
--

DROP TABLE IF EXISTS `game_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_info` (
  `GAME_ID` int NOT NULL,
  `GAME_NAME` varchar(45) NOT NULL,
  `RELEASE_DATE` date NOT NULL,
  PRIMARY KEY (`GAME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_info`
--

LOCK TABLES `game_info` WRITE;
/*!40000 ALTER TABLE `game_info` DISABLE KEYS */;
INSERT INTO `game_info` VALUES (1,'Mortal Kombat 11','2019-03-23');
/*!40000 ALTER TABLE `game_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LOCATION_ID` int NOT NULL,
  `LOCATION_NAME` varchar(1000) NOT NULL,
  `LOCATION_DESCRIPTION` varchar(1000) NOT NULL,
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Earthrealm','In the Mortal Kombat series, Earthrealm is the name that is most frequently used for what humans normally call Earth, which is a rocky planet orbiting the Sun.'),(2,'Outworld','Outworld is one of the six main realms in the Mortal Kombat series of fighting games.'),(3,'Edenia','Edenia is one of the six main realms in the Mortal Kombat universe.'),(4,'Orderrealm','The Orderrealm, also known as the Realm of Order or Seido, is one of the six main realms in the Mortal Kombat universe.'),(5,'Chaosrealm','The Chaosrealm, also known as the Realm of Chaos, is one of the six main realms in the video game series Mortal Kombat.'),(6,'Netherrealm','The Netherrealm is a realm in the Mortal Kombat series. The Netherrealm is comparable to the Underworld, also known as Hell, in religions and mythologies. It seems to resemble an eternally aflame (continent), containing many volcanic fields and lava pits. The area is also spelled Netherealm, as confirmed in the bios and endings for Mortal Kombat Gold and Mortal Kombat: Deadly Alliance.');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moves`
--

DROP TABLE IF EXISTS `moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moves` (
  `MOVE_ID` int NOT NULL,
  `CHARACTER_ID` int NOT NULL,
  `MOVE_TYPE` varchar(45) NOT NULL,
  `MOVES_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`MOVE_ID`),
  KEY `fk_Special moves_Characters1_idx` (`CHARACTER_ID`),
  CONSTRAINT `fk_Special moves_Characters1` FOREIGN KEY (`CHARACTER_ID`) REFERENCES `characters` (`CHARACTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moves`
--

LOCK TABLES `moves` WRITE;
/*!40000 ALTER TABLE `moves` DISABLE KEYS */;
INSERT INTO `moves` VALUES (1,2,'Combo','nb'),(2,2,'Combo','dsd'),(4,1,'Combo','fdgdfgd'),(5,1,'Combo','newCombo1');
/*!40000 ALTER TABLE `moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `PLATFORM_ID` int NOT NULL,
  `PLATFORM_NAME` varchar(45) NOT NULL,
  `GAME_ID` int NOT NULL,
  PRIMARY KEY (`PLATFORM_ID`),
  KEY `fk_platform_GAME_INFO1_idx` (`GAME_ID`),
  CONSTRAINT `fk_platform_GAME_INFO1` FOREIGN KEY (`GAME_ID`) REFERENCES `game_info` (`GAME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'Playstation',1),(2,'Xbox',1),(3,'PC',1);
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 19:58:10
