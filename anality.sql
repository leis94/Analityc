-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: anality
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `ans`
--

DROP TABLE IF EXISTS `ans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(20) NOT NULL,
  `tipo_formato` varchar(100) NOT NULL,
  `servicio` varchar(100) NOT NULL,
  `indicadores_servicio` varchar(200) NOT NULL,
  `nso` decimal(5,2) DEFAULT NULL,
  `nso_dec` decimal(10,2) DEFAULT NULL,
  `ind_txt` varchar(10) DEFAULT NULL,
  `obtenido` decimal(12,2) DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `cumplimiento_general` int DEFAULT NULL,
  `periodo_id` varchar(20) DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ans_periodo_id_e45ab4e1_fk_periodos_periodo` (`periodo_id`),
  KEY `ans_proyecto_id_1965b969_fk_proyectos_id` (`proyecto_id`),
  CONSTRAINT `ans_periodo_id_e45ab4e1_fk_periodos_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `ans_proyecto_id_1965b969_fk_proyectos_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ans`
--

LOCK TABLES `ans` WRITE;
/*!40000 ALTER TABLE `ans` DISABLE KEYS */;
INSERT INTO `ans` VALUES (1,'COLOMBIA','PORCENTAJE','Cumplimiento de Incidentes','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',10.00,NULL,'<',0.01,'',1,'ENE -- 2020',5);
/*!40000 ALTER TABLE `ans` ENABLE KEYS */;
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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Ans',7,'add_ans'),(26,'Can change Ans',7,'change_ans'),(27,'Can delete Ans',7,'delete_ans'),(28,'Can view Ans',7,'view_ans'),(29,'Can add Horas Labor',8,'add_hrslabor'),(30,'Can change Horas Labor',8,'change_hrslabor'),(31,'Can delete Horas Labor',8,'delete_hrslabor'),(32,'Can view Horas Labor',8,'view_hrslabor'),(33,'Can add multas',9,'add_multas'),(34,'Can change multas',9,'change_multas'),(35,'Can delete multas',9,'delete_multas'),(36,'Can view multas',9,'view_multas'),(37,'Can add Ocupacion',10,'add_ocupacion'),(38,'Can change Ocupacion',10,'change_ocupacion'),(39,'Can delete Ocupacion',10,'delete_ocupacion'),(40,'Can view Ocupacion',10,'view_ocupacion'),(41,'Can add periodos',11,'add_periodos'),(42,'Can change periodos',11,'change_periodos'),(43,'Can delete periodos',11,'delete_periodos'),(44,'Can view periodos',11,'view_periodos'),(45,'Can add Pjs',12,'add_pjs'),(46,'Can change Pjs',12,'change_pjs'),(47,'Can delete Pjs',12,'delete_pjs'),(48,'Can view Pjs',12,'view_pjs'),(49,'Can add proyectos',13,'add_proyectos'),(50,'Can change proyectos',13,'change_proyectos'),(51,'Can delete proyectos',13,'delete_proyectos'),(52,'Can view proyectos',13,'view_proyectos'),(53,'Can add Volumetrias',14,'add_volumetrias'),(54,'Can change Volumetrias',14,'change_volumetrias'),(55,'Can delete Volumetrias',14,'delete_volumetrias'),(56,'Can view Volumetrias',14,'view_volumetrias'),(57,'Can add Servicios',15,'add_servicios'),(58,'Can change Servicios',15,'change_servicios'),(59,'Can delete Servicios',15,'delete_servicios'),(60,'Can view Servicios',15,'view_servicios'),(61,'Can add Usuarios',16,'add_usuarios'),(62,'Can change Usuarios',16,'change_usuarios'),(63,'Can delete Usuarios',16,'delete_usuarios'),(64,'Can view Usuarios',16,'view_usuarios');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$KsBgrLK06e8D$7IxM2n5BGr5amH7Bn16s7BzDx7IVQXFe1rquZjfpbBY=','2021-01-06 15:54:19.879831',1,'rgiraldo','','','rgiraldo@itsinfocom.com',1,1,'2020-12-21 02:28:50.913518');
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
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-12-21 02:31:34.699095','21','TODOS',1,'[{\"added\": {}}]',13,1),(2,'2020-12-21 02:31:49.185487','21','TODOS',3,'',13,1),(3,'2020-12-21 03:02:03.947198','1','sibarra@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(4,'2020-12-21 03:02:38.927228','2','jgalindo@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(5,'2020-12-21 03:03:00.719836','3','vruales@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(6,'2020-12-21 03:03:35.651068','4','dpaz@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(7,'2020-12-21 03:03:57.769390','5','npaez@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(8,'2020-12-21 03:04:19.314147','6','pestevez@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(9,'2020-12-21 03:04:50.142416','7','evelez@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(10,'2020-12-21 03:05:15.699582','8','egaravito@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(11,'2020-12-21 03:05:35.118726','9','hmorales@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(12,'2020-12-21 03:06:16.824061','10','sdurango@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(13,'2020-12-21 03:06:36.012907','11','tortega@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(14,'2020-12-21 03:07:18.484908','12','agaray@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(15,'2020-12-21 03:07:41.508013','13','sparra02@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(16,'2020-12-21 03:07:59.573446','14','wgarcia01@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(17,'2020-12-21 03:08:16.075944','15','mcarmona@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(18,'2020-12-21 03:08:50.412878','16','hsanchez@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(19,'2020-12-21 03:09:10.200033','17','dvenegas01@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(20,'2020-12-21 03:10:19.600145','18','kramos@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(21,'2020-12-21 03:11:04.984430','19','rgarcia@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(22,'2020-12-21 03:11:29.254963','20','jquiros@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(23,'2020-12-21 03:12:14.236790','19','HUAWEI REGIONAL N2',2,'[{\"changed\": {\"fields\": [\"Proyecto\"]}}]',13,1),(24,'2020-12-21 03:13:21.525259','21','jsentis@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(25,'2020-12-21 03:24:07.117899','22','arodriguez12@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(26,'2020-12-21 03:24:32.632769','23','cballesteros01@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(27,'2020-12-21 03:25:12.991907','23','cballesteros01@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Formularios\"]}}]',16,1),(28,'2020-12-21 03:25:40.217594','24','macosta@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(29,'2020-12-21 03:25:53.607142','25','sclavijo01@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(30,'2020-12-21 03:26:11.692487','26','fvelasquez@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(31,'2020-12-21 03:26:27.231569','27','sanderson01@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(32,'2020-12-21 03:26:42.491253','28','wcaceres@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(33,'2020-12-21 03:27:06.689754','29','dortiz02@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(34,'2020-12-21 03:27:25.033352','30','ebarrios@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(35,'2020-12-21 03:35:45.693548','35','jacevedo01@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(36,'2020-12-21 03:36:32.672199','36','rlopez04@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(37,'2020-12-21 03:37:12.599414','37','wgarcia@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(38,'2020-12-21 03:37:25.863491','38','bbarragan@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(39,'2020-12-21 03:37:41.313131','39','dsuarez@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(40,'2020-12-21 03:37:51.640878','40','jgallego@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(41,'2020-12-21 03:38:03.595676','41','rgiraldo@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(42,'2020-12-21 03:38:20.256238','42','slopez04@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(43,'2020-12-21 03:38:35.468698','43','jduque@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(44,'2020-12-21 03:38:50.844554','44','morjuela@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(45,'2020-12-21 03:39:07.490335','45','rcala@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(46,'2020-12-21 03:39:24.761862','46','jtorres06@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(47,'2020-12-21 03:39:41.191544','47','abaron@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(48,'2020-12-21 03:40:03.570269','48','saldana@itsinfocom.com',1,'[{\"added\": {}}]',16,1),(49,'2020-12-21 13:13:40.891468','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Proyecto\"]}}]',16,1),(50,'2020-12-21 13:29:31.330212','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',16,1),(51,'2020-12-21 14:38:16.434284','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Formularios\"]}}]',16,1),(52,'2020-12-21 14:55:19.178453','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Rol\", \"Proyecto\", \"Formularios\"]}}]',16,1),(53,'2021-01-04 22:20:04.776548','2','Ocupacion object (2)',2,'[{\"changed\": {\"fields\": [\"Pm\"]}}]',10,1),(54,'2021-01-05 16:10:30.230856','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Formularios\"]}}]',16,1),(55,'2021-01-05 16:19:08.924061','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Formularios\"]}}]',16,1),(56,'2021-01-05 20:49:08.332101','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',16,1),(57,'2021-01-05 20:52:33.938509','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',16,1),(58,'2021-01-05 20:54:25.747692','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Proyecto\"]}}]',16,1),(59,'2021-01-06 12:20:47.891950','41','rgiraldo@itsinfocom.com',2,'[{\"changed\": {\"fields\": [\"Rol\", \"Proyecto\", \"Formularios\"]}}]',16,1),(60,'2021-01-06 12:36:20.331911','1','ENE -- 2020',2,'[{\"changed\": {\"fields\": [\"Trm cr\"]}}]',11,1),(61,'2021-01-06 12:36:32.738402','2','FEB -- 2020',2,'[{\"changed\": {\"fields\": [\"Trm cr\"]}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'analityApi','ans'),(8,'analityApi','hrslabor'),(9,'analityApi','multas'),(10,'analityApi','ocupacion'),(11,'analityApi','periodos'),(12,'analityApi','pjs'),(13,'analityApi','proyectos'),(15,'analityApi','servicios'),(14,'analityApi','volumetrias'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'login','usuarios'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-12-21 02:27:34.835557'),(2,'auth','0001_initial','2020-12-21 02:27:35.248788'),(3,'admin','0001_initial','2020-12-21 02:27:36.342462'),(4,'admin','0002_logentry_remove_auto_add','2020-12-21 02:27:36.441535'),(5,'admin','0003_logentry_add_action_flag_choices','2020-12-21 02:27:36.453171'),(6,'analityApi','0001_initial','2020-12-21 02:27:37.406478'),(7,'contenttypes','0002_remove_content_type_name','2020-12-21 02:27:37.749474'),(8,'auth','0002_alter_permission_name_max_length','2020-12-21 02:27:37.851951'),(9,'auth','0003_alter_user_email_max_length','2020-12-21 02:27:37.897705'),(10,'auth','0004_alter_user_username_opts','2020-12-21 02:27:37.909095'),(11,'auth','0005_alter_user_last_login_null','2020-12-21 02:27:37.988821'),(12,'auth','0006_require_contenttypes_0002','2020-12-21 02:27:37.993192'),(13,'auth','0007_alter_validators_add_error_messages','2020-12-21 02:27:38.004176'),(14,'auth','0008_alter_user_username_max_length','2020-12-21 02:27:38.066780'),(15,'auth','0009_alter_user_last_name_max_length','2020-12-21 02:27:38.276154'),(16,'auth','0010_alter_group_name_max_length','2020-12-21 02:27:38.331344'),(17,'auth','0011_update_proxy_permissions','2020-12-21 02:27:38.402535'),(18,'auth','0012_alter_user_first_name_max_length','2020-12-21 02:27:38.559157'),(19,'login','0001_initial','2020-12-21 02:27:38.866137'),(20,'sessions','0001_initial','2020-12-21 02:27:39.399479'),(21,'analityApi','0002_auto_20201221_0232','2020-12-21 02:32:37.685462'),(22,'analityApi','0003_auto_20210104_2328','2021-01-04 23:28:22.516663'),(23,'login','0002_auto_20210104_2328','2021-01-04 23:28:22.555699'),(24,'analityApi','0004_auto_20210105_1458','2021-01-05 14:59:05.351033');
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
INSERT INTO `django_session` VALUES ('1do74bxuw2foxgfpo102hbj629puthxt','.eJyVV1nPslqW_itf3uvyC4OonKsGZBQ2Mg_dHcMk8yQoSKf_e2_Qc6ouKpVqE7LYa2-eNT_g__wEUZQMw21sy6T5-eMneUtI4lK5mksXG9VymZGeIUYUviEexJKUPGs0FJveW46IR1WHxBaKgUXnw6pzVF5_JFXl2q5_SGqp110u1_k4SOphxclCPlpxDWsRUZCLg9ikaMxA3MK--kWlAcsjfAScYwSMeiExJpKJCauzloGywRuer8fO_7fPS-RvGEwWOxo0Kk7Kmfpcb2STsrmtR2-BkkH-vv-5Voe7CFdWh9tY0KdoaV8yDpDoTeCBQ5QhHi9yTVQxc8KVWtyDIl1UA5n9moXYGqbUyqia4uIZyKJgoAS8VCiOh6tn7yXmUx44HCIW7QwKilBXm6Y1r8n2ai9XCxZTzuUe-jEDk4WB2_sIBq6Y3qSa6QTOFKoYU-45oFgTqDDb_Rvi5YqxJoorogb6Xg157EpPtbEX3xUPUW03gQsQ35UW3wFoVFdI4lRPvz6t8cL1_hA6VRHV5BJiPqI2UhWZ7L_YE__FnrLuFR9_lPcas7d8dIDZdOhH5310W4GV_UdXfp41qa9kv1L8yi-2qX2l9ZXeV0ZfmX7lF6_44hVfvOKLV3zxii9eYeXult_qteZUN6WLj1YXnc_KqPEfFj_tk0Yigqqak5pswrJ6Gk37ChoWVwTt5ddx5_Cz7bPdpPMcZyIc0D51GaNcPDhvaYox7WPDpScX02Gv0YPnVk_PQavVpucQcGAqJHBA5mLgFfLk6NVVtuUHPhN8-hpRtn6Ia99AS-CIa-_NnsmO6lkhlBzN_SLCPMfPYE4W_5OHLBLozudhj-TrMG25qKHdLhSqewh9_Ax73EU1N_j8KTVr7g396cOtRnEX1_bTxaB_jrUNdIhJXdhAH9ehrqsyFqppjSF2QRV9dJPn6OXX3l4x9rOypE9YP1wuIBlsuflneLQQuCtx6C-RJTLozzP49OrrE7-Uw5l6g8LPgIFWvknnMH4UFNY6e5hiIHCO1nqWb7BEBPj0yxTyHOJ_fEHWfEaC_SUWFs6-suilz2sWx-lFRuvW1lPvYNunnlBPaxbpBqZeRBZXm6ydWQjZWyxhqmy6BIKHGnzM6Xg0e5bP-Istw_rOspMVsjP6muU38kZ-oFhnWiwBjM9-wnq8IbcYvsOVIgtjb_TMw_VFrqTKc7TUdLguZL77PDn5DgF9pu0Is99_nokECfZeNfgGXYXb-c1O52NEF1bkEq9xG1v_PUIXdGKFrPuot-aiBhfDzjoNpa8BAiTbqhTPtpAIGwkT0_ambT9sBkE0ZDzYJjt7FRhBJWlRsc0Y4q_92uj3jWMc8unioAhxeutls9x6DPn27P-XLzeOCetqjh377_3ZSM2fvaHBOYmwlcfIIsSQp4eR41rX2KWfq_2o_rOXSSpw9QXydx2uM2UQ6_kNP-bLtZ9cm81QW_D5oBwmUGZ9jMaE7mRZAuu-Ydb2l2f307bGqjJ6bznNwVLVkL8Rn0Egv3rEGpd6LuEssgh87-CgFmfV1Cv1bKGQ37f5T3h0gbmC74Lu-FctKvJul6NiuFzgWKhlWRIRunblIt07WGxfw-IlqbmHZ0tAQzjX4kFm1hlicVZ-_wtTL3xBW98lCCi0RTUVHJg0-Xs-2ap7LnnBHVG-kKdG6gpr0aflyhEjsZcCwojmiUTtMgqEZY82844LDqdU8xRqH0vXfnZe2IR1jScyggJKdumNY-e2mnkhEjvXc5V7lIlsKhczvxH8ndTa2x273k6YQe_yTGUGt8sWxeqSdyDgRT9drCdnvw3Tx6zXvdYxFugKr1Mnu7mSIrsIWuD4bTUe9Ci4SUw153RS75QLkH3BKDNmGI-ner8fz0eahxSg7YZOuZ8fQe9Udm6Efa6aPsEcjw2GOtfLyIn3jpc1M5ERJgxNCckb3StJij4Kp0OslJL8mlr84PdOiw_D0RDUe0up72kG8xmN6H6ocduwrTjbmTwv6arIF7osaz9_-3kk90cyZH99SiG_KfhTnXwf9dRdZgNDLa7AOAl49iKElOUnNODolLjc4n6XRbvSo7j0N5VSNLX96MQYeUOfpsbssZfQVT55kfeUdh5uk0KR11PoK-ayXMruEqSPExaRgkYlj6Sez897e-HOpIj2lNAYk-aquGWxL5-8LbNS223q47vsepZGTnbYqQ_HQaQvcUc7wwG_RollYVFJBhcLO0XmPnd9Mt73PZlRV7OpUSa67I3DKGKhinhX067104geEyn0VPmlNfzObqyaKXl7MuOxO_P65TBq5h0BGarWl34nP6zkhnWAnDWae3nYvmnjvn7y91Ty6KEhkOgge2l05HlfuegvGfSsHy9pz_XyUbCbwY6UcXc8WvVhZnoqymxcB9zrfQyGpy4-3o4f94fUOEsCNWdGngKacOWRvJY3ET2Nnqq90yFhS2ZGz8wcdqWdd4kapU3U7gykbtDbITnR03JD7WOA4s-cYR7JLM8vgXcH_tJc7FQ8CEmccESKlvKpTR2cy1mjecmGfLKpWi0yknGnrASlOY5VH-hOLXmgRtSX4u-TIBE7PanPuavddqW500EBKDwYa0Z49ry4R5Jhr_pSzR72bSfXRU2hNnWW-MODQcurHt4VWpVF76jfXCobiIU44SZmibzQFztOONrsOXIo41GjXGwyZaPoS38h1Ldup-eEkcqMVa4828mG8LrhXj5JJ4t_LoLeMSzXE0fzxGLqG30WL124s9dbgVyWacaZB7Fc9y32iJET_zKv5TtBkAt_0dwm2J_v4vG0Y0djlib91c9T3O3TipiQp5MRz6mSHEJjR_t0as-7xzG5MFwUKxTadsNNhpNSHXBAErmbtJnoIOPt7o1o05wcPLz5x_d0T2I4q7J4Pxmj9KKr-a4eSlKTggpHJHBEK-rQRyQ9CbTATpyGcpZyQ29HarwNlOy0OYVPYg_fNu85sl62WUQebfhnEaPVgOCqu8qyrF2m6Lm-wc9i4k4F-nLjGt3icY8YB79S0JfUyFoD2CdF0A-uuD5R72ZTkJeA_nbkufdgbRL_UgoIJbfpiW7Z9O0frAeWg_S4E9-zlOsNlzuhQmbN3uHOhwlnLm9q8TmfkwamkU6eUl_nc2uSTZ-3-fES1M31fbubY5pe9vOMrvSy0cotmbscsszPH-gBIU8oihH4336aoE4g4ehtmDdD2_zi80dQxe0vEDyCpmjhw0kd5BU88kg_W_-Rj0Pe3NuorX_DC57oHu07icYWQv_nD2WLFGAoqKahVGVVocVtRdurYBn1ypq6KsP7_3oiSES6oqnChWwpLIDSYHVbZETV-GXqFDBsVjcomTXgjml5K8JVUX-JprEZYC4qx4kMCxeCRTms-EtneVEFlPwLYFBpU8Yv7xcnSqsFW_2cFMEKA1RmZ4r8umGc_7yDlin5n4P9N4wzedT5sIb585hW1m7XvFDwgGiYK2YX5FsO_iFsQQVnS6dWdxkVnvqli1tyeIsyWYWSN1egSqegZs2P_AvGC8dW1VeT9_ZRP6vgkX-Sa6pn1Vj1twH-887bb1HfP38cMQT53_8D7lQk8g:1kwYdQ:JZrv6N1S61uppBPiQ1wBXdYo0idueqnNcc3lw_V1U-U','2021-01-05 00:47:32.163453'),('2ra3mnsgt2m0tusdpy5a6239f7ma5u0d','.eJxVjEsOwjAMBe-SNYqSusYJS_Y9Q2U7CSmgVupnhbg7VOoCtm9m3sv0vK2135Y890MyF-PN6XcT1kced5DuPN4mq9O4zoPYXbEHXWw3pfy8Hu7fQeWlfuuGChCeAViAOAURB6oegydVaSNCJAxtSQ4LNLEIhsTRYaAshZya9wfUFzez:1kx7nN:BIC8sgXw4J9msNSmHz2cU9De_-cUCOriddiIbdX8QV4','2021-01-20 12:20:09.974339'),('5i1h9ovysn06obtcumeyt2j07tx0dv7f','.eJyNV1mvs8gR_StX9zn-xGJsM09hNxgas9MkkcVimx2MsVmi_Pc0-M5kHqIollBBdXG6llPV-J_fYRxfn89L3xTX-vu37-ukYFefyfRMObm4kamc8ooIKg8seSeXpmzWQXblTSMS77h9LG-xoBSOnxggD8JowmWbw3DAp6GDK2w4l2-7AJ4lCAtOGknxgms5s4yDTH7K9R1POISbu-cgLw3gQCrAAJ9goDdzhbOxVL4KpuBYuBBOyL7q2-D_tlfoXyiYNPEMtKk8aDzzuSZslaq9PvdwRpLD_rP-uRaH25jUFoeb5GgO8dy8VRJg8USRoUcVEZnMakWVCXcgtUregvw-6xY2BpWAsA1Cq7Ret-UZWtisEaAAkpJrHiR1Hr7lbMhCT8TkvBlBzmwBskPXtCQbVjDTc4HQ-Duu5Rq6lsDdbYwC12w46LwzgdmYNIQBPZAvCdS49X5CeJlmLfZiHtfI9_KZJb7y0mt3Dnx5F1duHfoAC3xlDjyAx1WJXb3yFVSHJV70vN1FXpnHFT1HRIDptVLGtvA_1uT_saYta_nHH21aYobzRwe4VYd_dPCjWwusbT-64vOuzfxI4UfKP_IH2zZ-pPMj4Y-Mf-T9R_7g5T94-Q9e_oOX_-DlP3i5k_nWktPyveTUcIFp2PJbFwFrOCJrltpsC6Of4KUMc7Y3ifEVOCmuuWV_LUwvspXZE2Xc9TVSw2j3RALeOwpdOGOfRvDltTbxMSnkElvqNcQiXaDaDJEkUlEl9mvDVeILemObSGUOXTqPiPEdeUoLPzUeYqksFv8AL2w13iCDyukD3s0QnzHNE0bVRpy05R5xigSVWEFbIDXCodYc--wQemYKSXnpj3HRBWjf0Bspn6DSyHMW7h9Df2lc8y0LVBojf8IPVxCPgjIqaeQfSgLywaloxGkK1X-79k5wNKmFs_KHe59-ksQiOH72023hheo7qblA6dwW9cFak_-GdzeJckJ5KKKJ1eHiT9WuPRQRn_hhLlZaDgloo_g9Z4AZhgEb4qpdTAi3Rz02wVmmtDwmddvBlndjaUwTCa6-rHysWTz8zIoR9f-sYYFkFqjWDtwajiut71T3dZaoSI94cHaJAoOkyAbFKEIXnMOS1Z05lTUiJYCT1qaTkJonSkYV4xZOF7GFN3DCO88RpWBa8zRDch22PIqvjCozRX37cio3DTiWR4MXQ329zBwr8MRCFvA09Ibf19-x5L6Qz3fXB2Wc_dgc2Qn1YBtJzj3wVvt1n8Rb8q7kVlHC0AGGTfS85bqKLYkuOILu6tCFLuBuiBs9EIB6LZ1R8xQ7sgPLOcprXyZoP-hRmE8qZUCUb1T_GRL0sHK1oNiPzQ8nZyVDs26rzUWveUG6cBLkSr7URCOEXpvRkcGbqNfFCsx3Yn3Xo9rYd8s_8W8Kfq89xrbJEbRRFbzRnr1agXe09EHtDlG28Gzh5IerhlRiMbHMtaVnsNdiv-L7Zrv4ljh9BgRldPhU14QDFc9lfq3Ep-Gjuq6YAcrnctAgjq7cSBCfP_MU5jEVVEoFJKPXCLdCMx_FdadQr42A13owBxmaN1hg33FgM9Ta33Xaxzg9L7ManUm_1-Lm44FqC-XolSVwRZG7ejgeuPQprp6454A6Jts0JETLdgDr4mwOHapJRNaV6z8wMUiYn3OEhxjK9QxmZ7gZvxyaZff9jTlRT2J7zeQ6tsLsuOOLpxY7FHuScNqe7qHiVbLqn6tkx9FNoR4LN3scXqMgBJj5HrXUoTdvQJ3GTUInWcDKN2C0WFOzxpNvqpHrZ3FS-YnacYpQPTa7_YPZeiq9A7z9rHPc3dFKpRYk1odc7ZOVCacnF9Ks4pb6k3xLnBgku3J_mjfB9X1TN3XskUIY5_0QvVDy7883qQmXbhT24FCU9Hbgtlizq4zH6-JGyt6kmd0zLUh90J26lJ5aJFxImOoG6yeqSXAvXqf8PiHGk7el9317ix1o5nv6mMc36X58xmpzbqDeZEeSCeNBTqvqGLPmkCjb83vrJpeknoYrVw0jZ9NFv0uG7798d9dbd32mf3wwYb8Y9NO9bBs_mJsqhJaen4F1OJLpmzreBWnAQ5G9U6dL8tik8aaAjHj_xdwZlll_7NXqJcschtp-EO9jWwb0Sd0yBv-8DBpDny-HqGMPvBTW2X1blNR1y1i3OZ6A8AjUlKHyE9GpYT22--GtpoqfFDtm6wtj2myVOTKK3PZwvRdMldtvKC5h6d4w8_vtygbCowmtDd4xU9m-imkoB889PDnAHWGv7yCrBn5ZHs68OMkd5oy-_FKEhomnzJu9GK938pHa-RwX3vCJ8yhFOMLwQOlVZG2qrRbbxuEe-iZU3Ct32e71tNylkL3Zb9yvDEL2BXTylK3KtqAVQ_JigbDS67ysfcjvQYrO3HNk4Y4vXKY9cGLnHTR7Sgp1p-R6mcBhtSlFJsDZ5Nzc6MKnbq0YbSR-s_EgHfV-TXVV1N6UPU3zhHMchZZWk3FyvZp7HjcE__LpWx312YuhazqnOP5tlgJxrllFzvOLa1MgM_OnFPiAyDaNw91S5w3PJ26mCXgIBpWE7OtMMzWa_-EQTvxBKJ4jdcPKmTns0mKUhIGjM7fzIo1BLFPbgttjl3siGEm0zwybUzYmjp2yk6tgdk9f6Jd6PZyJFquM5oKXGfoA1Sxde-pea50wnN9bez4LnvemKW2y8u19Wki79wbiDx8qSrBVI0WNApjte7w3Yke8UZzStA99XxCiMZm-bGrNpcxPQbrlNSU82WZF3ylydzEl89Jt4dmv9ATsbJ5sfOWkPsZzl0wkpsmqDLSsrLBbxG7YRJrRCLAzAYI0u2uSVSmBMzj1UUrtbfJwp7x9bJjHE4yjF0h-siMdM_Rq-RIyh-GNdUewoe9kw19NUKp8Ouw4ZoDs1k82EV9a1f7iecWdL99OEmYFdbcGPSCmAtRcB060QE-70ZkKwd8T7avJxktMzY9HkaYeSjWdRaoLwOU8kKEiH_sJ6tnh0Led8KKfZ06GnrB7Sj3vtLd7mVOwmToB_WPxSPK1q-ri7lES4bndATvZlM2Z8UwWwSydRyjjRWcI4UaC7jiHTQXIAn_keRC9LYUlHX_PWd3bqrE5yfjuzdABsdc6Hvf21kTvd9UDP2n7Sz11Gvtic-MxR_heHhzsohRYz27c5wHNlHWWXK5jm6HR8v0bvsMOFLndEdu_fNdhdUVTxmyirH429ZeUdWGZNF8g7MI6b9DL1yrMSmTS3T9Lf836Z1bfmripfqELWbRdM13jvkHQf_tmXJkBHIPULJK6qmusvD6x7iIETj8Ltqmr6P7vLwyLaV-2dfSgOpoAkLQE05U5Wbe-bJMBliuYFqMKFlqxHbggnDX9S7atdQPupIuizAno4egwniB_mYIk64BRvwCBlC5jfcEvUVaWHVz9YymDBQbo3MaWpWXB4n-_Qzsz6n8H-weK89pV2XMJ87tbR3Wz5EXnnDODHF6cb8NsTcKf4j7qgHdMZvGX0y2b-TLlNTuSw9gCat7VF6QyGaRZEqR-oYBdhtfNZc9b01WvMuyyT3b1-NWGcdbUy9rlif5Zo_tPZafv3_YEhv3r335RGcw:1krCWd:rYLvSbzciJXkoCSVxh60FpL_aNFFDSBReLJUf8L18Vc','2020-12-21 06:10:23.596419'),('aozt7um05w87ny6ilqq7d8mv7r3tsifs','.eJxVjEsOwjAMBe-SNYqSusYJS_Y9Q2U7CSmgVupnhbg7VOoCtm9m3sv0vK2135Y890MyF-PN6XcT1kced5DuPN4mq9O4zoPYXbEHXWw3pfy8Hu7fQeWlfuuGChCeAViAOAURB6oegydVaSNCJAxtSQ4LNLEIhsTRYaAshZya9wfUFzez:1kwYBZ:wdutk5Hy4CpwPiFIJxaCwYzXU-s3p223BpAN53Wdu2g','2021-01-18 22:18:45.803738'),('ap01sm1vnjirmb8nrh4r2jayjr5umpgo','.eJxVjEsOwjAMBe-SNYqSusYJS_Y9Q2U7CSmgVupnhbg7VOoCtm9m3sv0vK2135Y890MyF-PN6XcT1kced5DuPN4mq9O4zoPYXbEHXWw3pfy8Hu7fQeWlfuuGChCeAViAOAURB6oegydVaSNCJAxtSQ4LNLEIhsTRYaAshZya9wfUFzez:1kwtFH:Al3L_6We8Ivd7KIWePTOgCDfbvphFJANTDbYEegNINY','2021-01-19 20:47:59.932206'),('ksughmgmxi4vb8fpu21xz986b8jldyja','.eJyVV9muq0qS_ZWt_Vw-YjDY3KcCMxsSMw9dJYvJZp6MbaBU_94J3vd0P3RfdVtCQWYGK6YVAf7XdxjH6eNxHdsybb7_-E5nGUk9Otdy-eygeq6c5GeEEUVgSqRUdpMqZm7YqITuGaLjgRdwkb3qvnEVqZjIy2yjJCQHc5pE6C6O7fR-lT0C677iZJEQr7imvUgoyKWH1NzR5ARxC-cSFJUObJ8IEMAmCBiNQj5ZSCalnMHZJsqFM9Svxy74P-vL1C8YTJa4OjQqvVWW_lwzsknF2tajv0B5Qv7r_HOtDncxrq4Ot4lovOOlfSk4QOKZwEOXKCM8WZSaqJLTEVdraQ-K-6KZyBTUHMTWMbVWR82SFt9EFhUDJRDkQnV9XGP9l5S_89DlEaloJ1DQBNxb1MLG12T7tZ9rBYepbAkx1RlYMQzc2ccwcNXy35p1x8DCoWB-574LijWB6mm7nyFerpprovgibqDv1SNPPPmpNc4SeBIZ104TegAJPHkJXIDGdYWkbvUM6uMaL1zvycitirimlggLEK2Rq9ji_uJM-oszdT0rPv6o8xozjHLbA6dtD_3s-Z-9rcDq_rNXfp616B_J_UjpR_5gW_qPtH-k_yPjH3n_kT94xQ9e8YNX_OAVP3jFD15h55655rR6rTnVHWDolvTSeMDoNs8k9X4IuIq0eOapo6BPuc6N0XJyFpnXXOei22Pm2KB2ucD0K_lhOjpu8YlmWsinETxpq00sJqVUIWu93jFPlbA270jgiajmx63hav7pu1OXCFXhO1QRYdMrcuXO_9T4HQtVufoHWG6vsjoe1PYYsE4O-YyoLjcpFuSkJY2QUzio-dq3OFzFbGLLsce8Q9fIfFxa-2Na9wJoN3QnwsOILHLtlfti6K2Na7wkjshi6E_44QrkUVBFFQX9Q6vVB7umIKcJWP_91juBaBArZ6UP9z79JPBlIH7saSz3hHUklKJclAL251b_33bNCJO7qAGvKGf-Nx9e4dbbcg77agZFkAETrQKLyWH_oaCw1_7DVBOBvbTWtJzBEhPgw5k1z0iQr8OEQ9bYY9H5GS4c7H91McpAgLXmjSJjDHvj1Rxu5_Rz5YBuU15oGUVs87XFOZmNUL3NEZbG3ZdQ9FFTSHgDjyffDk7B4igeZkyKmxWKOwa6HTTKNgBBseWoBDA-5xkI_Aznixm4fClxMPZmrY-xKJVc-a5-t1y-i04_5wL1DlwC-sw4MebMf-rEovwK6uoRmEwVbfqbnS7AiA7Wa0nWuCG33FkeIg90G_8agPprLmpwNp2s01HmEiJAduxK9R0bibGRsDB9bznO4EBu6chIOhY3-RUYQSXrcbH1GQL9yaDPt23OuNTTw0ER4czGD6vceg751Ez6_87Mbc5EdTUlrnP73R_NysMPN3Shgn6us2ztE-TpY9S41jXxmOdqP66TDnLnEQgUHXrGArlaRxjMsUms-ht-IpQrnxrFAWTMd4XG2u_EC5q4YAobCZ4qrPuGWTs_s3b_3tZYVcbzltMcLFUN-w0JTgicsT6xxqWx5Qj5jsB3D-xDyH3LqCA2Cmf8NmdSAV1gruD7oDv8rkVF3ZxyVE2PD10btW1bJiLPqTykm8PFCXQsWdKaH3xHBjrCe7YAMqvOEJu389tvTKMIRH19nyCg0OEsUHFgMdSvtua4OVbFLr-hpBIfBzbG3qjke0_0JcAZzsWNYx8vkn-dgWjtpeFqkPeoR4TB2t2WUW1f75MTSJemfddkf0wdlGOOHXXIJeQ4W6SHRZKKz5WunLllPAr0xbke0UZI9wtQAGk0adowtuSdHvMSVOnIqQT2KMsbdTgl9NlIE4UF1PHeqzmVe1o0k7Ya-vGo8dbebnVWoPPL3DJVwSVSn4lvU7k111EaCo0ax8g47tXxqXUIzU8jTVN9fAGA9bnF4PLevIrhw1-Eqz3jQ9OMNxS9xrvJPohIb1gY-cIqpbcK9lw5kh_IS045dF1VOS4_uoN8x5PkMAVOOfcNzbxIelIlVJb7XphwjHp__-17SG9D-sh-f04hv2j409x8H_f0TeFCUysuwDyKePYixDsnvNGQZ-7E-Zr0uyzelT7N33_Rd5qhtx-TmqNgGu93Y_XYS-yqgDore1pnH9e3SlOXY8ZfyzGpbh3pKv3MxRmlBZYqDlh2x8vn23ihCZk_qenlN2VwIVuXU0YkV5_yLYzFl7af85giPNWn_R1v-A8pTElTDa8pl2P0ngf3_uIpOpxuy-C_qvFBhcXOEkSvOxmngMZZembOo2QiXDK8dO0w1Msu1orz1dNmuuH0qrkElTUNqIjyOdbeZS7GBenm5xgXGtptZ2gFEWD39okfMon2ql71-LmkxeFsM5NAnmS56YYiuOPx3YlD8uWQHCk4p2FGfQOnG3A90AFA0JcBxvM91GZGYSmpv50ig-ItL8ZuxSO9tfJjlOuQ0vcDI17Gc3uX-oNC4MFYL0vbXDPhkBBdMlA4G6K4k4WzZ-6J60vKjjbCI1Gd0QKtNp1uDf3uMXjNGXubtntO9n5YH9J30pY0fiMSdaKyljV3Is4A4nElDNKJwZ70NWsRPFC5PeUlfOorzHHwHFG6obXvt9ox2O3n6c6_Jn-5mox2JneHUkQH445o9SShu3DWJQ3heKQ7Ybulskn2xI9n18GsAol9Vz5q1iPEuMvOt4JHZ8jvnZieqDfiM_1YUuqxPFPYiznHS-0MrMmQsioszY587K89wXGMCL9BrffItCGDkkThKDIn8wZoHaf02cLbVUJMzNT9SroH0_GugDwWo1hVSHJhNbdq2CaVprnEl2DxXx038WcW7KxhJ7nF_OIrphwa0nARsMh-L5CicDXTmuF5Itnhp0nlo0UccSKJkXd2SEb1pIeebZNmKpr97QKGuh-wfdvJ_vPwFgNZGUfaPeNF_hKueXs85pd-lqfx1qIXNoovSUiGZfpyEE57ujeaVrueA_MT8bDjUc-OrBIt54jBh3N2ATf5yvqn-V72LSnO8SkhS6tdrsZZY6RSSB4gyU3ESZunhtWzlppMYgezKt0wdKSAG7ekjzG2_W4ysk6JSE_CgbubQjx1AxC0yIHGXTG-eLvl_mI8NELjd3c8hJnt7iK3vRvDIu3KO3k3gZFxyXTGotcUnausby_EeM_1SDgKOzYZ6qHBVYJlPAkOl22oXNOpy-GM-f4DJRHqeNjjJP637yasUzhujDbKm0fbfAn5EFZJ-wXCIWyKFj6c1mFeQZXh_jn6ez4-8ubWxm39C15QoxvaOY3HFkL_xzftSDQ40XCbgVJTNJWRthXjrII7aRfOMjQF3v_jiSAx5UmWBheKrXIASpMzHOkkaeaXZdDAdDjDpBXOhCeW7a8IF1X7kixzM3A6azwvnTi4EG3a5aQvgxMkDdDKF8DgpkObX_4XL8mrBUf7aEpghQHaaWdJwnpgsn_eQcu08j-D_RPGmQ51_ljD_B62md2ueaGhgmRaK2YX5lsO_lvYogZY26BXd0_wM57-MqQtOYJNW5xKK5srcMug4c6aH-ULxuvQrGasJm_tUD-rcMg_yRWHhxJG7QAVtfjZhXHeNqva9QH_isP7T43n7z8OGIL8-z8BpaQppA:1kwp3K:THpiUSFMC3Lqk6zJTfVAUIDcDMqQNY42zGRVpSmYne0','2021-01-05 18:19:22.483771'),('rtvsp9akpy18c3dc4i6zfc1zukv7t7g9','.eJyVV1nPq0p2_StH33P7iNnmPgUwYDDzDElkMZoZzGAbovz3FNj3dj-0Wh1LaFO7irXnBf6fnzCO03G8TV2Vtj9__KSLCKUeVaiFeHVgvZAYcY4QvAxMgRBqZbEhclWseLFbTvSbWjadPkjLpI1qezKrFx5Y9JByjiazymh6opjYYpk0pw0nj_h4wzXtVYCVQhiF9g4nDMAtHS0oa12xfTyAlHMCKZNRiowF5ULKGqxtwmy4gPPN1Af_9nmR_A2CyRNXB0aFl3ymPtcC7VKy9vXkr0Ay0N_3P9fmcB-j8uZwl1yMV7x2TwlVoHjB0dDFqwhNVqnB64Q5oXIjYEp5X1UTegcNC7B1RG7kSbWE1TehVUaUSuHFUnZ9VD37T6F4FaHLQULZvZWSwhTLx8GFbsn2G79QSxaRz3dYKStwxSBwB4tB4LLlv9SzjcqrjijLq_BdpdwSKDP7_QLwCtncEsWVcQt8r8ci8cRZbZ018AQibpw29BQo8MQ1cBU4bmoodes5-BQIrDEicusybsg1QgJIbcU6tth_sSf8iz152ys__sjLFrO_fnQKs-vgj87_6PYCy9hHV32etaivZL9S-MovtqV_pf2V_lfGX3n_yi9e-cUrv3jlF6_84pVfvNIuPHPLaf3ccmpY4jWAazHka02uuT691FXq2ovLBnnCBlNqOdcI6dugrQYZDRqHBfUEfZE6-ds1SVr3kkH_1GWKC4FwF_GVIPrHhke_PMQAvUaPvlfPvgvXm03fxcHA1FDoKrmHKM-IJycwcPmeH_BM-OlrCMT4AiPQBCZcKa6w9d7bt9hJPcu4XMBFUMaI7wY5yMkafPKQxxe6D3jQI8U2THsuGmC3jy51FgEf92Gvkj5uuDHgT3er4RbgzyPaa5T0SePMHgL8c-19oCNE7KMW-LgNdVNXyaV-bTEknlLHH93Ld43qaw-XTewtn4UZ1AWTtl7fc_PP8OhL6G3EYTwFFs-BP3P46dXnJ36xADO1KGWQKyZcA_IpQPxgZuxt9gAuBOZoq2e1KGsMZmyv7yviOSj4-AJt-YwvzpdYWDD78mpUAa_bHGeUOW3Ye08t4b5PzUBP6zbphZZRxjbXWKyTA1J82Cxuqex9DS8-bPIJZ6Dx27cDJlgdCdT3Lbl5KblToNtBK-3kByZ7w6wUEJ8zg3osgFvMwOUqgQWxt0buo8Yq1WLtu_rdcrk-Yr77PPkKXBz4TDsx4ix_nokv4jNo6jEw6Traz-92-gDB-6gm12SL29z7b4g8pRdqaNuH_S0XjXI1nbzXYVoLIUV07Fr2HRuKkQm3EB2zHGdwGAjSoYlwLPbt18qk1KIel_uMQcHWr62R7RzjkrOHKmWE0nsvW9XeY9C3Z_-_fLlzTNTU78R1_t6frdj-2Rs6mJMY2XiMLCMEmn2EnLa6Jh49b_bj5s9eJqnQM1bA3020zZSJb-d3_ISvtn5qzbZHHY5rZEh4OWhiOQssObViyBVH75iN8-VZ7LWvkbqKlz2nhbLWDeBvKGAgwK8-vsWlniswiywE3juo0ghv1TJqwOGwfK72-U95eAW5Au-C_vhXLWoyc6pJNj0udG3Ytm0Rjzyn9qB-CVcn0JFkTRtu8B1R0SHOs3klt5ocsjm7yP7CNMrgom_vEkgp9VW1ZFSxaPK3BRghik_jHMMVfXxcBS1_cOINhW5zlYh3pb6cDskcatb99tBc-8k8Qk9t3_UCl8l1FhQHszGYi4xomSK69GRPeNwvPskgiiBAo5Naz9REyyPstZx6fCPI5XoyeQLpasMYE21CiWjqUzAL0Zus5uF6FRK1QW2YitTAtbN3dMDEsVS7bCrvTVihGYce5FvMctkZgxgcq882w81m3p0yep7Q8ZXWZHciBjfDUpQLKV1TAi1x9JAtcE-JMBPjYZE8JnF7vnvWkuKQZhetzI8E35U17mfEgU7z6yTnTzeAHs8HyZIJIXaXfk4bnIrufmMRR71ZrnTWLa6rRBJaV905sg2Sx49W4MHGqXr9_O1nSLMhHfO_PqWg3xT4qW6BxQ8qk9jQVEtNMU8XNH_ilzvLv-CQo-_49ZY8Dnl8qHyKu_-m7hRN7T86NSfeNF6v1nogz0tfB-RVwij9PN5eMkVqh9uljE-6fb_JLO5r19urQl9EGluRTlg1OWNCHt7bW91SB8wbDqZVCbmkCbCvH7Spk9akfSQzRCWFEfiV4XN8LZop8izKfjBfoKIRHRGXlUam9lzYuXPn21OkIGNJmbccybQ5nFpNClj4Yq0WDU0IFQanyVsXu550NirRNoa0hb8oR80sopxqOYTUsvnsvzOR5CXiLeR8d-mu9DBZ1pohAeqUyNo-JhU3ciKJL9ghKbQsQg58SLw9Dzv7dqboLAMLHUNonjsT16mX5cNJRo3nStOQohri-yCfHksLR9U1OCKGktPiCeNYUZG78I4kA48kBVpk0VrgPV0XGBvF1wessV5uwtlZfDUXnbjx5rk7uD5UakdPEhv9aIxIOvRF_o7rmOua_JRWDP2Uruow0MUEzdlYRpFzSCnI63FtyMHHpeM-j9lYYdoRD7DEfCbwjLIP-rX23KLg3KsqytgYGB_QaSpQdzYYCO6JLPLyeDhHwRpHJCDa96ROXUmRoyeSSFeREp4QDE1PiRxiL-Igx3c3LElimUceRp9pSAfvPH9gTSAjN7rMJn86FDhSdLgRv3jlSrrEjeom6nRbyKepPR0xReoiPvo39fKI02VsmPCuDkUVSklD5BigcG_2uGwiE8bT-_o5H0PoitBuyLbMiMKv9kA-pAOiD1R7HTS1oC7Z8W5J11x-96tO5B4pe5rgjVlgy_JlQNdaGo8L9qbKVkys8DhhdU5YZj_ID_3okfNgSbNhM5IuVkog1S0qOzXEnMgr1KmBOoQQwoVJhT4u8Tl-PavrWTCfhuEol7SjpEdfXIgjzPmQpOpkfOCq60xp5ZUqnbtQ0D7nhSJ5IzQ_i2FMk5i-X69-6AgayXi9C9vtkFi8VCOEJiu9_WhuPUw8V5GbanvJxnqsYzITAmcO7bqOjbZ7YOeeb0smPAnHzFbuvnDNl8CW0B6-utN5RO_UCV9a6SxhsHmEELTNEme4Zf2aVE8-emHmg4jAl642SoR29tn0Lmepcn2dHfp8vxgi_5JMU357Mh_pgF52Wrml774ALPPzB0xAJ_wEEUfobz9t2KSAcIwuKtqxa3_xxRDWSfdLCYewLTvwcNqERQ2ODPfP1n8U01i0WRd3zW9wgRP90C1pPHUA-j9_KEegFIYCahpIVVJlWthXtLMJllE11jJUCdz_1wxBMekJlgoWkg3-9wFpsoYjMIJq_rIMSjEd1jApiTXBjmX7G4Imq78Ey9wNMFeV4wSGBYuLTbms8MtgeUFVKOmXggClQ5m__F-cIG4WHPVzUlA2GEVlDpbAbxvm-c87YJmS_jnYf4M406Epxi3Mn2Fn7W7LCwUOCKa1YfZhsefgH8K-qMrZNqjNXUYFp34Zwp4c3qYsVqak3RWgMiig2fIj_QLxOtRZNTaTWTc0cx0OxSe5lnpWzU1_G8E_76L7FnX5-eOIQND__h_0ESTv:1krOVJ:SFtIHsVzC4ayo_xigKkUk-AJ3u23V6dqXKNTvmC1ZbU','2020-12-21 18:57:49.045047'),('skxshw1lhc9c6s1iwt0zpks9tzdslga2','.eJxVjEsOwjAMBe-SNYqSusYJS_Y9Q2U7CSmgVupnhbg7VOoCtm9m3sv0vK2135Y890MyF-PN6XcT1kced5DuPN4mq9O4zoPYXbEHXWw3pfy8Hu7fQeWlfuuGChCeAViAOAURB6oegydVaSNCJAxtSQ4LNLEIhsTRYaAshZya9wfUFzez:1krKzp:NA3tsvaTDe0JMj9TOTiUM__6wiG1P9ZVHcFJGLmJ5sA','2021-01-04 13:13:05.920781'),('syhw5ru4j6ljvfrt0tcn5vg6snnib5mu','.eJyNV1evs8oV_StX5zn-RHW5T6EXU0wvSWTBYNMxppgS5b9nsH1vnhLFEtows2fXtfac88-fCIBb31-HR3lrfn7_uS0ycvOpXM_ls4saucLIY4yRRWhJe6nJXq7_IN3SQNzVfXm-tFq2WwPnJN2cMLMKE03Ktoh9GXc93gCIKWhN1fs42OxksQA2u5azSqiWS73UpGjCQLuFewmLytCcgAwRjU0QbTALmbGRTLpxJudYKBctUL8e2vD_1pdPv2AyWeIZ0Kk0qSz1eRbkLRX7_T0EK5QM8p_9z7MF3AJc3QJ-JKI5gfXxUnANAQuJRx5ZxniyKjVZJcwRV2uJ0Ip01S1kDmsO2jYwtVYH3ZbWwEJWFdNKTZAL1QtwnQ1eUj7lkccjUvGYtYIidRaQ2grWrdhBHeR6wWEqWxLaWuLaqsLEXQLAxFU7mHQ7JdQ1wNVlygNPK7YCqsz7fYH2ctXaCsUXoIGxV32e-PKoN-4a-tIe1G4T-RoS-vIaehoK6gq5edUY1sctX_hN7GOvKkB9WmMsRPRGroDN_Y896X_sqdte8YlHXbacg_WzpjHvNfSzFnzW3g1Wic9a-TlrU1_JfaX0lV_btvGVzlcGXwm-Mv3Kr73ia6_42iu-9oqvveJrr3By39pqWr22mpq2fA7RijHwUDWWU-gIcxUKbmk3KSRLQITYgNmemWuNxsWs-Up8szXrB2mJLWq52hTyPG98-jKAXNp7izwlmPHx4dOTj5kQa3Qf-NUYeGi1-Qw8EhKmQiJPy3xMe8XCaQjqKnvXB56JPrhGYI4TpEAdWmipedKGvTmwuUFnVVLN0TwsABZ4YQZrsoafOmRApNtQgBjJNzK9a1FDv20sVvcYxvgme5m0oOb7UDimds0vMJ5n_O5R0ia1O_oYjM9z3oSOMbmNGxjjRuq6KhOxmrYcEl-rwGdtCjyz_PojVIuY1bUcdVsdYU_WLac__VbyC-Y5Auw0Stx_i-H0GQS1NIeFhGk1hyqeW6mCNGisg2kWQqpFMCuQL5CHC-Qh5FGJvnHXbHU26zdXPviZEq8qP9-Q-6smmGVIG44r6BzPm-9BJT_e-wwJ13naRpNWE7TZ8ELV9HjbxlrDrlTCYrVHUrhSiLhisvKZWcqN5gz3UOSGSFCHCK1oswbjli_AtHeNDAzmB-dJADmpVHIVeEZqwNwT2J9EVEendrOQoTWIxf6P_RinqxjWWeLfvP5DZ4L8qyNvriTBHTb9j5-qgbqjD2cXzBtiq43hIB0AVr7xB3A3f-MNaWVPqFiHO3UGUrmWM2euba4RXl1CNtNcb3AU22QtvHVVm88dDMGcil70d01NGA8_JvxpCb2khRfGHeb3AsIbH_ob-435Hd5gCYoU2_Cp2Hwd2BTsWbAEy9YzLVNsON0wAwlqFfYWEJ-Lwh0jn0dD9_QnP0D9BzZOVOTDOD2yjjeeWGQRY8hnLgnE5n8JsQpiZy5jhG4TUWvjOnwF2GlQ6k3_bR-J3pjXSoszaa9qact1MIdzEK-ecKuRfcN58wSD9d54NyufWQLvAnP91FTCdS-EfDNLxdaqsCi3vAh4JxAQZ6tiQx4WHKkJDqHZzqRbcgLPE7Gv3QEOudz0f_bCR08evEpk4Lah7Zqm0VRD4rl3GEenuRUb4to-8IbMKVHWcBMjwHg9Ek3DteTTHzYTQSvfdwO8i7RtFqwAVUXkV3hRKuMJ48zuRr6L1NFyp6VkzIa3H_1rvlPU61WqB-yxky5cJ4H5lNprNfcmiLmrxx7G8x70KHaVG6dJL9e55tUjJtLz0NDYmRNvlWWs645gub2Lr8thrrWxZncVwzMI3dOV6M5eFed3tkTGlHyQ-9169W9carqxZCLki6bNbqaGUrTX-_1aqh0mB5HnzIiIB0ECia51KtCYUGDW-F7ijUCT3FAW6KpwCE42EeKIq_w6KLK8u4K9RR8kJDFH_-hWQlOZyRwq9MgmUobZPnkTOqDu8x4pMsp6kQ9-Z-Dp82J01a1VcpIWYDzJKI-mE10mq4R9HU5iaxOUY4fTdR78NfJvsX6bMurnLz_d7d7d-uzPv6SQXxT86V5OgCd1V7jI0ouLZh1FPHuRYsoJExrxdEqer8lzl4FdGVB8-otKKZp6_-ibNQiWOU2N_cReYluFp7NCUAbbXyeVOl2ux0PBG0LktnHHO8_JmfeELZ5M_BHm7uUlPAPKDugDsEXJjNiDt5t3tZsEu9UOep276Z10QAf7KFzB8mS9klJvw3UV-2KQekTIAX1JAH1yHrtKW9P4uS_DcyIbjuwCTUXcq_esxH4kCvx8ly_L7CGey6AK0dmHFxEUqzOXPBgjcv9k2MquR04v6gNvgRmUXlezhMo6YRklXHm2mnxxPMqd7L3ExJURA0O54jI55Qf6QD_T-6DS2J7PiTkz0wWlRVx2x_F2J1b8uqDswqjlfMi885o41jL2i4O9ujlGG7zxX36LpFR62O3IZgkGGgHx-NyRsvc8ej57epbegbgqlZ0VthDkDBhLbM38GzTSdSN2Ua4pEdOEyxyBcm-dw_HiSvZV7kMNEkendrTeRWgah9kJsORJ5HtdeSH6kQbpmZAWub8n7HmO97ymwMgNRDMhNrG7f96NDUcs5G5v4hgY5eG-pm42Y8eypftCCQgySl8heCGPYpf1YGCLXAvNGeUIo0R24GSI1SlnIsuPkGDsGC0NuPZq8q3HjwzqxkqrtteFbgtJIi5mOTTn1AHyNQ-OBTuh0mjxWPfK64zShNlS2o48Bta8LDyamc8nmF83ZjI0hV7O5WFaU5KJDxxvLEeEf_KewSpu2pruXt-5ziy3WHfxj6E_I8Eu358eGP94NDwywrFNU11IIOmFJ6zwznr7aJecd4t6uGjkKhcB2qlK0Sto3ZPq8YIm1J6Jj2ur2qcJ0LnzYP0DdoH1q9vxxL3WZOJdNCLNizOrmC1mWcoCpcQCn-RF_hgrNGX3YnyvDSY512FKOLyxRuW874HP5p6UGup6PFumwM7Vmb6Aodh7rR6hywuTdphH33FHMw1yRbi8IYZlBnvGu93XScsuqqoS_sQnKlOI3rze7lTFshbgQR1c2MKZLkbdBXqeXrwcuYmTb6g0vOYPF7vSqWOPSaF_K-5YMPYJ39czocoJnIcMdb11XBg_Qnd6ofHO7JXWecoz8lpq71aLlwqX62XMpUi4tTvfgcPlPVSut7nN4Yz5-R3dI6fjCTke9n_5aaL6BseN-Yjzpn80vwl5F1XJ4zct6qKmeMDDtzrKK6jSpZ-tv-ZDnzf3B3jUv-ADNdrusdzA8ICm__bz9xFBwMmXbB3uXFT9N8m24BtNMWed5yWG-_kHPHHr6rzfDvx00zb9HpsHqL1Zi_K3IUZXdJWWqE3__ujqsYq6_OND7Holih8d1NbB2EYgfzSb2rWH_4zC90-qy8_vBwxB_vVvGU_yHA:1kwtLf:V_KHP9vU4S6Hxh8eob9JWvCL9XN0ZhA-TrLL2Nf0jRQ','2021-01-05 22:54:35.135685'),('zymkob7szgnuafmc34ul5v43viau1595','.eJyVV1mzqkqW_is79nPtEwmIyn0qVEAQEpmSoauCYFCZQUQZKuq_d4Le0_3QfaPbCGKRK5OVa_jWl-m_voMoujweflfnl-r7j-_LKIGLw6ZqKp0QoaXyXnqGJJ15hrgWK-TElsR75k60LB2EQlfoQkRCiy9jU7IdEikG8BSEYs0ikWoIiYdyfm9z3GwnCYVotmtYk0jAVHyI1Y2I99huhs5eVmjQcmkPwEMMYKdn0t4EiXjhdM4yCC4Y8fqya7z_83qJ-YWDSWJbw5uKvXJg388IFimby7hzJyz34L_m38_scBNRyuxwHR_1Pprql0xBEI00Fdh0HlLxJJd0Ee-3lFKKK5jdJtUAg1dy2LZGKqXSqaY4uQaYFBLmUJAyxXYp9eC-xLRPA5sHYlYPMGNX0HRHJROnOdlu6aZqxpHK4UbATMR6BQeOVhEOXDHdXj1YJMy4URn71LVhNidQ2S_vI7aXKsacKD6LKux78UhjR3qqFZo8R1xHJaoCBwLPkSbPhkRUFuBiF0-v3M7x4vFqHdpFFpXMFJIeUCupiEzuL-bEv5hT5rns7Y8yzjG701sH94uOeOvct24psLJ66_L3tyb7kdxHih_5sW1qH2l9pPuR0UfePvJjL_vYyz72so-97GMv-9jLrNQx5pwWrzmnGoK6ZoovlYc7zeJ3OmgI8xhLsChaE-knF8U6ym6vmC9Wrp1U4aQQgQ370GY6rwRjiCJay3U9msC7ERxxqU10jHOxAHO9-ohnclybPhR4Oiz5bmm4kn-69tDEQpG5iMlCcniFttS47xr3kVDks3_wwK2Ug0Z5pdV5B5RiPAPF5gbZxJg0xQ5jioIlX7omRymkRS85dnZ9YOuJS4lzfwyzzsP7BvZAOySdhLY1Y_8YOHPj6i-Ro5MI-xO8sYJx5BVhwWD_iGL2wSoZjGka13-19I531OkZs-Ibe-9-EvjcO773U03uietGypmGH3F64-T3vkZISk1YwVeY7v43H17B0ttSivtqhJmXQIMoMDmluP9w71hz_5GYkXAvzTXNRzhFNHxjZs4z8NKZTDgwxx4d0YdcONz_yqTnnoBrzetZstOtBVdjsMyzzxkDmsU4galnESY_k0OJBZi7xdGmyt2m4OgShhDzOhUNruXtvQnJDqkPsp1kst15muVV8kKAMFtylEMcH3p6Aj9ifjE8m89FDsdezfXRJ7mQCtfWbqbNN-H-My8wvWfT2Ocdikg0_rkmOkovrywenrErwmX9sk_jkXSD6zXFc9wYW_YotaEDmwV_FSTcORclPBkoaTRidw4AlJBVKC6yQER2tElqKxOhFmFsaaBbI5Mb3AJ2sJC0KFv6DGB_EuzzdeEZm3k6FMxCarfgw8yXngPvmon_X85ceCYsiyG20fV3f1QzDt_Y0IQC-zlz2dwn4OmSTDfXNXZ2z3n_qIwbjJ2HJzBs4OgTxmoZkjjHBj2vX-zHQj7jKYgypJmAGaG96i2yH-OcoV0yXxkcv1tslujDtat-GZNFHo1LTlM4FSXuN-DtAeZYl57jUg95px44gM8e3Icz9vUC8zihHPKFZy4CMeFc4fOg2fyuRcFcUd4phsMHtkVYliXRoYMKBzRjMCFPI-PpUvKtiySoAd6xBJiYZQIs3kqvv23qmXfU5vMEwEzDXKBQ0Nwxv_jekYttRLqvzd2m6uRh0-j6tEXaFPjmGK6sNa3Vw8D47YbvA08_0unj5hyfQkPkbX_X7lV9ukiBg7I6BnyZmOZGjS5Dk8Ubs2kN-R41bQ92xA06tZKNaZeefIM4vvy1fbv5_T6TevVxPoHaEvAZ5ANTXtfV41BfhCwyO7dSky0AqC00Ot002bW7ZEXhus9QXDfhdKfEl7B6SdK4zVz6sS32vi-UT4F6FK7Tq8XtBYi9tqM29kFYU7tmJW_2zy2hPTvSys7XPP8R4SiMqc0XnrNxHNILzbGgO472Q-VJVO7knIEYbuv-VDTlQ-OFG5JfqrVrMzkbeZSpmhd6FSfL4JT8VCXUyc1wcq_s99--28u1vTyS39cp8IvFP9VOV9GdvcpcYKjZGRrbI5W86OONE3oi4Hc3-uTH958k-sldlr_9Ym_sjl1-u4vRCYbe95V5J1_HpvCYk7xitcPD7xWWOfsVoQD3RO7NoDVPgclxllm5262lTsna55XdauWlkqOkVrQ9Bw9uH4K9tLoTY1vdkmg_Pv0qoldldctyY-LlxAyIwbrCrrsfmTAcaUncXvKT2hKgUl9pP2r-j-1m6vRMzCxIhyvVXflTWbKsn_jUVWzXSgLELo3XCRF2zcpZ7w-BO4HiarV770qpRONWRdjo9di53rMwvIG-jcZThNpRCsKkoFgl2Zm-ezCebhMbh_OKoVdaLJyD1zOi0AuJQ8UHMuVxP-KavRu8kqFyIqugFmy2I9L1sL8NiRo2SM0jvmzldsVnN4VSLsXpUThdYzWVidZBec5d40rwj1V2ebTwovi8eInupIoKWA9MOJqktX4KBza8n61ytZmYCWR7i1mnQdrFxCankwuXtS_qPo7BcK7Q8am37smspeAy7H429oomkl2Eb4hJwa74DTC6q53GVeH3hkO6AEgb1FqnoTwlbivq64ANti_DzMwbzVVXqnmWt-v1Irv4mvvDi-tcFNf-kd76vrI2YldrvKrRok2_DequGo5OV3cSuekHFjHQ9lxAs66uAyF1G_PFt-Z4gChlNyTNBZs2kBRx-DmHqDhxgc9ogHjeh0qyXafZpf6Ij_CDmB7dKogP642nOZAslCSe1AP0DUlyKY7phduRifzSbQpxm3WmT0xMaxCnGNbitr5s4YNOtcO06ddG3Y-DFRls9nMd5e1Or8uby0dKVqNjPsFVcIaM012v1tl_ZfcYqWnOaGMXXTrzqrLp2TlfysI7N0gMXdiwxWs80PgMkJPxQWmdn9PpVO15-z4Sj-NUeH2uIPKVhWNyPa-vXBwPErtCiY-vHeNm35Cc2dL6-UmBzRjmatdX_EpJYMEFJNrml6sZ7PApR4x3FqJxTeMbzZUoeBN3xYUfad_lWK0SrBw-ATyvz1XT8ZN9y5LbAbp7YiTTM8t75YHHDC6pVuo9r_7KNYLBrDzR-NkRVWoAJiu3WiDfq00fb5toON2vE-Szl8LSu_J8CNOpLgZ258dPcCNo4PEZg5qLcJZoTC4LqfiYZlPMMd9_EGuwpTcURdJ_-66C8oLpRq_DtHrU1ZeQtkER118waIMqq_HHlzJIC7ykvb2n_p52j7S61lFd_sIPXtG09XiJuhqb_o9vFoks3M-UtsNSlVVlJy6jHZoFt1fPnKmrMn7_xxOAiHFEU8UD2VI4iKXB6Ujci6rxZeosNBCnG6zMGXjGtNzZwllRv0TTWDbYn1SeF_ccHhwt1ubEL50TRBWy8hcksRKxxpf7xYvSvANS3ytFOJuB6v7HFIV5wjj8-YZ3ZuX_2dg_cZyXtkwfc5jfbT9zdj3nhcULRMOcbTZBuuTgv4V9VOHB0tnZ3b2KV33p4pIcwWJNTmHlxRWs0lmsmfMjf-F4EXtQ9XnLa92WzyJo03dyTfWgGrPef-D_3mn9Ker4_ceGBODf_wmpMiwW:1krMaq:9CWr50PcKDfNdaBobKx9_qQG8EnQr_BgKUTjFLZDAwE','2020-12-21 16:55:24.549102');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas_labor`
--

DROP TABLE IF EXISTS `horas_labor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horas_labor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(20) NOT NULL,
  `servicio` varchar(100) NOT NULL,
  `linea_base_horas` decimal(12,2) DEFAULT NULL,
  `horas_ejecutadas` decimal(12,2) DEFAULT NULL,
  `uso` decimal(12,2) DEFAULT NULL,
  `periodo_id` varchar(20) DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `horas_labor_periodo_id_d90259da_fk_periodos_periodo` (`periodo_id`),
  KEY `horas_labor_proyecto_id_c2b3a00b_fk_proyectos_id` (`proyecto_id`),
  CONSTRAINT `horas_labor_periodo_id_d90259da_fk_periodos_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `horas_labor_proyecto_id_c2b3a00b_fk_proyectos_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas_labor`
--

LOCK TABLES `horas_labor` WRITE;
/*!40000 ALTER TABLE `horas_labor` DISABLE KEYS */;
INSERT INTO `horas_labor` VALUES (1,'COLOMBIA','INTERNO ITS',212.00,10.00,4.72,'ENE -- 2020',1);
/*!40000 ALTER TABLE `horas_labor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(20) NOT NULL,
  `valor_facturacion` decimal(12,2) NOT NULL,
  `porcentaje_multa` decimal(12,2) NOT NULL,
  `valor_multa` decimal(12,2) NOT NULL,
  `trm` decimal(12,2) DEFAULT NULL,
  `periodo_id` varchar(20) DEFAULT NULL,
  `pj_id` int DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `multas_periodo_id_77d607eb_fk_periodos_periodo` (`periodo_id`),
  KEY `multas_pj_id_a7dc3cf1_fk_pjs_id` (`pj_id`),
  KEY `multas_proyecto_id_fd6929d0_fk_proyectos_id` (`proyecto_id`),
  CONSTRAINT `multas_periodo_id_77d607eb_fk_periodos_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `multas_pj_id_a7dc3cf1_fk_pjs_id` FOREIGN KEY (`pj_id`) REFERENCES `pjs` (`id`),
  CONSTRAINT `multas_proyecto_id_fd6929d0_fk_proyectos_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multas`
--

LOCK TABLES `multas` WRITE;
/*!40000 ALTER TABLE `multas` DISABLE KEYS */;
INSERT INTO `multas` VALUES (1,'HONDURAS',23111.11,4.81,1111.11,NULL,'ENE -- 2020',3,1),(2,'COLOMBIA',111111.11,2.00,2222.22,3411.05,'FEB -- 2020',4,1),(3,'COLOMBIA',2932.64,0.76,22.22,3311.19,'ENE -- 2020',1,2);
/*!40000 ALTER TABLE `multas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion`
--

DROP TABLE IF EXISTS `ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `semana` varchar(5) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `pm` varchar(100) DEFAULT NULL,
  `cliente` varchar(100) DEFAULT NULL,
  `linea_base_horas` decimal(12,2) NOT NULL,
  `horas_ejecutadas` decimal(12,2) NOT NULL,
  `dedicacion` decimal(12,2) NOT NULL,
  `periodo_id` varchar(20) DEFAULT NULL,
  `pj_id` int DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ocupacion_periodo_id_af5188a1_fk_periodos_periodo` (`periodo_id`),
  KEY `ocupacion_pj_id_e9202ca3_fk_pjs_id` (`pj_id`),
  KEY `ocupacion_proyecto_id_c4e72380_fk_proyectos_id` (`proyecto_id`),
  CONSTRAINT `ocupacion_periodo_id_af5188a1_fk_periodos_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `ocupacion_pj_id_e9202ca3_fk_pjs_id` FOREIGN KEY (`pj_id`) REFERENCES `pjs` (`id`),
  CONSTRAINT `ocupacion_proyecto_id_c4e72380_fk_proyectos_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion`
--

LOCK TABLES `ocupacion` WRITE;
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` VALUES (1,'S1','COLOMBIA','Robinson Giraldo Naranjo','SODEXO // Venta Equipos Fundacion Sodexo-4418-1',10.00,9.00,90.00,'ENE -- 2020',2,9,'rgiraldo@itsinfocom.com'),(2,'S1','COLOMBIA','Robinson Giraldo Naranjo','SODEXO // Venta Equipos Fundacion Sodexo-4418-1',20.00,10.00,50.00,'FEB -- 2020',2,9,'rgiraldo@itsinfocom.com'),(4,'S2','COLOMBIA','Robinson Giraldo Naranjo','SODEXO // Venta de Activos Lenovo-4418-3',10.00,10.00,100.00,'FEB -- 2020',4,9,'morjuela@itsinfocom.com'),(5,'S3','COLOMBIA','Robinson Giraldo Naranjo','SODEXO // Venta de Activos Lenovo-4418-3',10.00,10.00,100.00,'MAY -- 2020',4,9,'rgiraldo@itsinfocom.com'),(6,'S1','COLOMBIA','Robinson Giraldo Naranjo','SODEXO // Venta Equipos Antonio Gomez-4418-2',22.00,20.00,90.91,'FEB -- 2020',3,10,'rgiraldo@itsinfocom.com');
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo` varchar(20) NOT NULL,
  `trm_co` decimal(12,2) DEFAULT NULL,
  `trm_cr` decimal(12,2) DEFAULT NULL,
  `trm_gt` decimal(12,2) DEFAULT NULL,
  `trm_hn` decimal(12,2) DEFAULT NULL,
  `trm_ni` decimal(12,2) DEFAULT NULL,
  `trm_sv` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `periodo` (`periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (1,'ENE -- 2020',3311.19,22.00,NULL,NULL,NULL,NULL),(2,'FEB -- 2020',3411.05,33.00,NULL,NULL,NULL,NULL),(3,'MAR -- 2020',3870.79,NULL,NULL,NULL,NULL,NULL),(4,'ABR -- 2020',3977.39,NULL,NULL,NULL,NULL,NULL),(5,'MAY -- 2020',3858.19,NULL,NULL,NULL,NULL,NULL),(6,'JUN -- 2020',3701.60,NULL,NULL,NULL,NULL,NULL),(7,'JUL -- 2020',3657.87,NULL,NULL,NULL,NULL,NULL),(8,'AGO -- 2020',3783.03,NULL,NULL,NULL,NULL,NULL),(9,'SEP -- 2020',3750.22,NULL,NULL,NULL,NULL,NULL),(10,'OCT -- 2020',NULL,NULL,NULL,NULL,NULL,NULL),(11,'NOV -- 2020',NULL,NULL,NULL,NULL,NULL,NULL),(12,'DIC -- 2020',NULL,NULL,NULL,NULL,NULL,NULL),(13,'ENE -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(14,'FEB -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(15,'MAR -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(16,'ABR -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(17,'MAY -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(18,'JUN -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(19,'JUL -- 2021',NULL,NULL,NULL,NULL,NULL,NULL),(20,'AGO -- 2021',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjs`
--

DROP TABLE IF EXISTS `pjs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pjs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pj` varchar(30) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `ebc` varchar(30) DEFAULT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `unidad` varchar(5) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_pj` (`pj`,`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjs`
--

LOCK TABLES `pjs` WRITE;
/*!40000 ALTER TABLE `pjs` DISABLE KEYS */;
INSERT INTO `pjs` VALUES (1,'PJ_0000001','COLOMBIA','4418','SODEXO // SERVICIOS ADMINISTRADOS OFIMATICA','MRC',1),(2,'PJ_0000001-01','COLOMBIA','4418-1','SODEXO // Venta Equipos Fundacion Sodexo-4418-1','OTC',1),(3,'PJ_0000001-02','COLOMBIA','4418-2','SODEXO // Venta Equipos Antonio Gomez-4418-2','OTC',1),(4,'PJ_0000001-03','COLOMBIA','4418-3','SODEXO // Venta de Activos Lenovo-4418-3','OTC',1),(5,'PJ_0000002','COLOMBIA','7406','COLOMBIA TELECOMUNICACIONES // SENA','MRC',1),(6,'PJ_0000003','COLOMBIA','8995','COLOMBIA TELECOMUNICACIONES // SENA - OPEXIZACION CAPEX','MRC',1),(7,'PJ_0000004','COLOMBIA','7912','COLOMBIA TELECOMUNICACIONES // LAN GESTIONADA (MERAKI)','MRC',1),(8,'PJ_0000007','COLOMBIA','9934','UNE EPM // SOPORTE UNIFICADO CISCO','MRC',1),(9,'PJ_0000009','COLOMBIA','9481','ALMACENES EXITO // WAN EDGE Y ASEGURAMIENTO DE RED','OTC',1),(10,'PJ_0000011','COLOMBIA','11100','TELMEX // IWAN (MRC)','MRC',1),(11,'PJ_0000028','COLOMBIA','11067','BT LATAM // ARGOS - RENOVACION CONTRATO UC','MRC',1),(12,'PJ_0000028-01','COLOMBIA','11067-01','ITS DOMINICANA // ARGOS - RENOVACION CONTRATO UC','MRC',1),(13,'PJ_0000029','COLOMBIA','12064','BT LATAM // ARGOS - INSTALACION GW PANAMA','OTC',1),(14,'PJ_0000036','COLOMBIA','12112','CIENA // LEVEL 3 - CROSS BORDER ECUADOR COLOMBIA','OTC',1),(15,'PJ_0000037','COLOMBIA','12112-2','CIENA // L3 CROSSBORDER ECUADOR COLOMBIA MATERIALES (12112-2','OTC',1),(16,'PJ_0000039','COLOMBIA','10376','CISCO // CLARO - MIGRACION 7600','OTC',1),(17,'PJ_0000041','COLOMBIA','11806','CISCO // CLARO - CRECIMIENTO PUERTOS DE RED CON CISCO','OTC',1),(18,'PJ_0000042','COLOMBIA','11805','CISCO // CLARO - PROYECTO VAS CLOUD CON CISCO','OTC',1),(19,'PJ_0000043','COLOMBIA','11807','CISCO // CLARO - CHANGE REQUEST','OTC',1),(20,'PJ_0000045','COLOMBIA','10274','COLOMBIA MOVIL // TENDER REGIONAL MILLICOM CORE','OTC',1),(21,'PJ_0000047','COLOMBIA','9373','COL. TELECOM. // AV VILLAS -SUM PANTALLAS DIG. Y APPSPACE','OTC',1),(22,'PJ_0000049','COLOMBIA','10086','COL. TELECOM. // CLIN. CARDIOVASCULAR - SOLUC. WIFI','MRC',1),(23,'PJ_0000050','COLOMBIA','10128','COL. TELECOM. // FERROVIAL - SOL. COLABORACION','MRC',1),(24,'PJ_0000051','COLOMBIA','10127','COL. TELECOM. // PACTIA - WIFI GESTIONADO CENTROS COMERCIALES','MRC',1),(25,'PJ_0000052','COLOMBIA','9873','COL. TELECOM. // SENA - AUTOMATIZACION SALAS DIRECTIVAS','MRC',1),(26,'PJ_0000054','COLOMBIA','10336','COL. TELECOM. // SENA - SERVICIOS ADICIONALES','MRC',1),(27,'PJ_0000056','COLOMBIA','9626','COL. TELECOM. // JOHN RESTREPO - VIDEOCONFERENCIA','MRC',1),(28,'PJ_0000057','COLOMBIA','10521','COL. TELECOM. // PANASA - SOLUCION WLAN','MRC',1),(29,'PJ_0000058','COLOMBIA','10403','COL. TELECOM. // BANCOLOMBIA - SEDES ADMINISTRATIVAS','OTC',1),(30,'PJ_0000059','COLOMBIA','10403','COL. TELECOM. // BANCOLOMBIA - SEDES ADMINISTRATIVAS (MRC)','MRC',1),(31,'PJ_0000060','COLOMBIA','11486','COL. TELECOM. // PACTIA WIFI GESTIONADO FASE 2 (MRC)','MRC',1),(32,'PJ_0000061','COLOMBIA','7974','COL. TELECOM. // BANCOLOMBIA - RFP DATA CENTER','OTC',1),(33,'PJ_0000062','COLOMBIA','7974','COL. TELECOM. // BANCOLOMBIA - RFP DATA CENTER (MRC)','MRC',1),(34,'PJ_0000063','COLOMBIA','11612','COL. TELECOM. // ALFAGRES - WIFI','MRC',1),(35,'PJ_0000063-01','COLOMBIA','14323','COL. TELECOM. // SOPORTE AP ALFAGHRES 38 MESES','OTC',1),(36,'PJ_0000064','COLOMBIA','10217','COL. TELECOM. // SURA - SOLUCION DE COLABORACION','MRC',1),(37,'PJ_0000066','COLOMBIA','11809','COL. TELECOM. // BANCOLOMBIA - ONE PLAZA','MRC',1),(38,'PJ_0000067','COLOMBIA','11802','COL. TELECOM. // UNAD - TRASLADOS SOLUCION WIFI','OTC',1),(39,'PJ_0000068','COLOMBIA','10336-14-1','COL. TELECOM. // SERVICIOS ADICIONALES SENA (14.1)','MRC',1),(40,'PJ_0000069','COLOMBIA','10336-14','COL. TELECOM. // SERVICIOS ADICIONALES SENA (14)','MRC',1),(41,'PJ_0000072','COLOMBIA','10336-15','COL. TELECOM. // SERVICIOS ADICIONALES SENA (15)','MRC',1),(42,'PJ_0000073','COLOMBIA','12452','COL. TELECOM. // AVIANCA - SOL. LAN/WLAN/INFRAESTRUCTURA','MRC',1),(43,'PJ_0000084','COLOMBIA','11892','EEP // CENTRO INNOVACION EPSA','MRC',1),(44,'PJ_0000088','COLOMBIA','10945-6','EEP // RFP CELSIA 2Y (6)','OTC',1),(45,'PJ_0000095','COLOMBIA','9557','ETB // COLOMBO AMERICANO - SERV. WIFI MERAKI','MRC',1),(46,'PJ_0000096-01','COLOMBIA','10132','ETB // NUEVA EPS-RENOVACION 3 MESES -10132-1','OTC',1),(47,'PJ_0000097','COLOMBIA','11050','ETB // TECNA - PROYECTO LAN','MRC',1),(48,'PJ_0000098','COLOMBIA','10481','ETB // ARCOS DORADOS - PROY. WIFI MERAKI - SERV. MERAKI','MRC',1),(49,'PJ_0000098-01','COLOMBIA','10481-1','ETB // ARCOS DORADOS-10481-1','MRC',1),(50,'PJ_0000098-02','COLOMBIA','14454','ETB // ARCOS DORADOS 14454','MRC',1),(51,'PJ_0000099','COLOMBIA','11525','ETB // COLEGIO COLOMBOAMERICANO - SOL. WIFI MERAKI','MRC',1),(52,'PJ_0000100','COLOMBIA','14398','ETB // CAJA DE COMPENSACION FAMILIAR DE NORTE DE SANTANDER','MRC',1),(53,'PJ_0000101','COLOMBIA','10520','ETB // PROYECTO WIFI CONFENALCO','MRC',1),(54,'PJ_0000103','COLOMBIA','11791','ETB // SOLUCION WIFI COLANTA','MRC',1),(55,'PJ_0000104','COLOMBIA','16260','ETB // SDH - RENOVACION SOLUCION WIFI','MRC',1),(56,'PJ_0000106','COLOMBIA','10248','FRESENIUS // PROYECTO WIFI INTEXZONA','OTC',1),(57,'PJ_0000107','COLOMBIA','12581','FRESENIUS // VENTA DE SW 3850 UR MANIZALES','OTC',1),(58,'PJ_0000108','COLOMBIA','10350','FRESENIUS // PROYECTO DE TELEPRESENCIA SX80','OTC',1),(59,'PJ_0000109','COLOMBIA','10895','FUREL SA // SW CORE SECRETARIA SEGURIDAD','MRC',1),(60,'PJ_0000111','COLOMBIA','10369','ARGOS- WIFI CAFETERIA SANTILLANA','MRC',1),(61,'PJ_0000114','COLOMBIA','12659','INFORMACION Y TECNOLOGIA // RRHH MONTERIA DIC 2017','MRC',1),(62,'PJ_0000115','COLOMBIA','12504','LINEA DIRECTA SAS // APS HACIENDA ESCOSIA','OTC',1),(63,'PJ_0000117','COLOMBIA','11931','LINEA DIRECTA SAS // LAN/WLAN SEDE MANANTIALES','MRC',1),(64,'PJ_0000118','COLOMBIA','10152','LOREAL // PROYECTO LAN, WLAN, SEGURIDAD PARA NUEVA PLANTA','OTC',1),(65,'PJ_0000119','COLOMBIA','11485','LOREAL // VENTA DE SWITCHES PARA SEDE ADMIN','MRC',1),(66,'PJ_0000129','COLOMBIA','10368','QUIPUX // WIFI NUEVA SEDE','MRC',1),(67,'PJ_0000131','COLOMBIA','11477','SODEXO SA // OUTSOURCING OFIMATICA','MRC',1),(68,'PJ_0000132','COLOMBIA','12149','SODEXO SA // ARRIENDO PCs VIP','MRC',1),(69,'PJ_0000144','COLOMBIA','10056','UNE EPM // PROTECCION - SUM APS, LIC. PRIME Y FORM. BOLSA HR','MRC',1),(70,'PJ_0000147','COLOMBIA','11766','UNE EPM // ELEMENTOS CISCO: TV-ASR9K-OTROS','OTC',1),(71,'PJ_0000148-02','COLOMBIA','11420-2','UNE EPM // SOPORTE TR069 AÑO 6 (UNE EMP)','MRC',1),(72,'PJ_0000151','COLOMBIA','12340','UNE EPM // CMTS Q1 2018','OTC',1),(73,'PJ_0000158','COLOMBIA','11419','UNE EPM // CMTS - H2 2017','OTC',1),(74,'PJ_0000159','COLOMBIA','11937','UNE EPM // PNM (OTC)','OTC',1),(75,'PJ_0000160','COLOMBIA','11937','UNE EPM // PNM (MRC)','MRC',1),(76,'PJ_0000161','COLOMBIA','11990','UNE EPM // SUM. E IMPL. SWITCHES NEXUS PARA DC SIBERIA','OTC',1),(77,'PJ_0000162','COLOMBIA','12173','UNE EPM // CMTS - AMPLIACION Q4 2017','OTC',1),(78,'PJ_0000164','COLOMBIA','11457','UNIV. DE ANTIOQUIA // TELEASISTENCIA AMBULANCIAS SEC SALUD','OTC',1),(79,'PJ_0000166','COLOMBIA','11488','UNIV. EAFIT // RFP COLABORACION','MRC',1),(80,'PJ_0000173','COLOMBIA','12471','ECOPETROL // DISEÑO E IMPL. ENTREGA A LA OP. RED WIFI','OTC',1),(81,'PJ_0000175','COLOMBIA','11100','TELMEX // IWAN (OTC)','OTC',1),(82,'PJ_0000177','COLOMBIA','12372','TELMEX // UNIVERSIDAD LIBRE - VIDEOCONFERENCIA','OTC',1),(83,'PJ_0000178','COLOMBIA','11914','UNION TEMPORAL // RENOV. TECNOLOGICA CAD Y FLA','MRC',1),(84,'PJ_0000179','COLOMBIA','12437','ALMACENES EXITO // RFP SWITCHES (2017-2018)','OTC',1),(85,'PJ_0000179-01','COLOMBIA','12253','ALMACENES EXITO // ACTUALIZACIÓN APs','OTC',1),(86,'PJ_0000181','COLOMBIA','11768','CEMENTOS ARGOS // MATRIZ DARWIN 2017','OTC',1),(87,'PJ_0000183','COLOMBIA','10903','CIENA // CLARO - AMPLIACION BANCO DE OCCIDENTE','OTC',1),(88,'PJ_0000191','COLOMBIA','12113','COLOMBIA TELECOM. // POLICIA RENOVACION SERVICIOS AP','MRC',1),(89,'PJ_0000191-01','COLOMBIA','13555','COLOMBIA TELECOM. // POLICIA RENOVACION SERVICIOS AP (OTC)','OTC',1),(90,'PJ_0000192','COLOMBIA','12360','COLOMBIA TELECOM. // BBVA EXPANSION SOLUCION WIFI NACIONAL','MRC',1),(91,'PJ_0000193','COLOMBIA','10336-16-1','COL. TELECOM. // SERVICIOS ADICIONALES SENA (16.1)','MRC',1),(92,'PJ_0000201','COLOMBIA','11885','SOC. OPERADORA DE AEROP. // SUM TELEFONOS','OTC',1),(93,'PJ_0000206','COLOMBIA','12351','UFINET // AMPLIACION ASR920-24','OTC',1),(94,'PJ_0000209','COLOMBIA','10494','UNE EPM // SOPORTE TR069 AÑO 6','MRC',1),(95,'PJ_0000212','COLOMBIA','11297','CENTRO ONCOLOGICO // SOL. LAN WLAN Y COLABORACION','MRC',1),(96,'PJ_0000215','COLOMBIA','12630','BT LATAM // ARGOS GRABACION EXTENSIONES','MRC',1),(97,'PJ_0000219','COLOMBIA','10336-18','COL. TELECOM. // SERVICIOS ADICIONALES SENA (18)','MRC',1),(98,'PJ_0000220','COLOMBIA','10336-19','COL. TELECOM. // SERVICIOS ADICIONALES SENA (19)','MRC',1),(99,'PJ_0000221','COLOMBIA','12317','COLOMBIA TELECOMUNICACIONES // BANCOLOMBIA VIDEO CONFERENCIA','OTC',1),(100,'PJ_0000221-01','COLOMBIA','12317-1','COLOMBIA TELECOMUNICACIONES // BANCOLOMBIA VIDEO CONFERENCIA (Fase 1)','OTC',1),(101,'PJ_0000221-02','COLOMBIA','12317-2','COLOMBIA TELECOMUNICACIONES // BANCOLOMBIA VIDEO CONFERENCIA','MRC',1),(102,'PJ_0000222','COLOMBIA','12677','CISCO // PROYECTO CAMPUS DAVIVIENDA','OTC',1),(103,'PJ_0000223','COLOMBIA','10336-17','COL. TELECOM. // SERVICIOS ADICIONALES SENA (17)','MRC',1),(104,'PJ_0000225','COLOMBIA','12799','ITS COLOMBIA//COSTOS NO ASIGNADOS','MRC',1),(105,'PJ_0000239','COLOMBIA','11656','COLOMBIA TELECOM. // POLICIA REUBICACION EQUIPOS','OTC',1),(106,'PJ_0000240','COLOMBIA','12672','GRUPO ARGOS // ADQUISICIÓN EQUIPOS SANTILLANA','OTC',1),(107,'PJ_0000250','COLOMBIA','12182','UNIVERSIDAD LA SABANA // CONFIGURACION FIREWALL','OTC',1),(108,'PJ_0000264','COLOMBIA','12653','ALMACENES EXITO // RENOVACIÓN SOPORTE CISCO 2018 ','OTC',1),(109,'PJ_0000266','COLOMBIA','12520','COL. TELECOM. // RENOVACION UNAD ','MRC',1),(110,'PJ_0000270','COLOMBIA','10336-20','COL. TELECOM. // SENA ADICIONALES (20)','MRC',1),(111,'PJ_0000279','COLOMBIA','12923','DEMOS CON BOLSA','DEMO',1),(112,'PJ_0000279-001','COLOMBIA','13081','ETB // DEMO Remote Phy ETB ','DEMO',1),(113,'PJ_0000279-003','COLOMBIA','13083','TELMEX // DEMO Remote Phy Claro ','DEMO',1),(114,'PJ_0000279-006','COLOMBIA','13120','CISCO // ILUMINACION - PORTAL ABIERTO DE DATOS','DEMO',1),(115,'PJ_0000279-008','COLOMBIA','13423','ITS // TELEFONICA // AVIANCA MERAKI','DEMO',1),(116,'PJ_0000280-002','COLOMBIA','13003','ITS COLOMBIA // PM DEMOS ','DEMO',1),(117,'PJ_0000280-007','COLOMBIA','13356','CLARO // INVERSIONES','DEMO',1),(118,'PJ_0000280-008','COLOMBIA','13326','TGOUNE//SFP-NEXUS 5000','DEMO',1),(119,'PJ_0000280-009','COLOMBIA','13333','ARUS // MIG JAMAR','DEMO',1),(120,'PJ_0000283','COLOMBIA','12877','UNE EPM // TIGOUNE - CMTS CRECIMIENTOS','OTC',1),(121,'PJ_0000286','COLOMBIA','12647','UNE EPM // NEXUS 2018 -IDC 5711 EXP 2018 II','OTC',1),(122,'PJ_0000286-01','COLOMBIA','12647-1','UNE EPM // CINCO TELECOM // ASR MIAMI','OTC',1),(123,'PJ_0000288','COLOMBIA','12836','BANCOLOMBIA S.A. // Telefonos de Crecimiento ','OTC',1),(124,'PJ_0000291','COLOMBIA','12628','CEMENTOS ARGOS // AP CISCO TOLU VIEJO','OTC',1),(125,'PJ_0000292','COLOMBIA','12778','AGREGADOS ARGOS // SUMINISTRO EQUIPOS CISCO','OTC',1),(126,'PJ_0000295','COLOMBIA','12473','UNE//NUEVA RENOVACIÓN FONADE (MRC)','MRC',1),(127,'PJ_0000298','COLOMBIA','12936','UNE EPM // TIGOUNE - ELEMENTOS TV Y LICENCIAS CNR','OTC',1),(128,'PJ_0000300','COLOMBIA','12206','UNE EPM // TIGOUNE - DNCS renovación','OTC',1),(129,'PJ_0000303','COLOMBIA','12987','CORPAUL / Suministro AP','OTC',1),(130,'PJ_0000305','COLOMBIA','12752','ALMACENES EXITO // Renovación Soporte Plataforma GMD','OTC',1),(131,'PJ_0000307','COLOMBIA','12802','CEMENTOS ARGOS // MIGRACION SWITCHES CORE','OTC',1),(132,'PJ_0000309','COLOMBIA','12712','CEMENTOS ARGOS // Renovación de Garantía ','OTC',1),(133,'PJ_0000310','COLOMBIA','10336-22','COL. TELECOM. // SENA ADICIONALES (22)','MRC',1),(134,'PJ_0000315','COLOMBIA','12893','COL. TELECOM. // AVIANCA ADICIONES ABRIL (MRC)','MRC',1),(135,'PJ_0000315-01','COLOMBIA','12893','COL. TELECOM. // AVIANCA ADICIONES ABRIL (OTC)','OTC',1),(136,'PJ_0000317','COLOMBIA','12859','BT LATAM // ARGOS GRABACION EXTENSIONES','MRC',1),(137,'PJ_0000326','COLOMBIA','13156','SURA // Suministro Códecs Salas','OTC',1),(138,'PJ_0000327','COLOMBIA','13196','COL. TELECOM. // RENATA POLICIA SOPORTE REMOTO APS','MRC',1),(139,'PJ_0000328','COLOMBIA','12852','ZONA FRANCA ARGOS // MIGRACION SWITCHES CORE','OTC',1),(140,'PJ_0000330','COLOMBIA','12847','SOC. OPERADORA DE AEROP. // MANTENIMIENTOS AIRPLAN 2018','OTC',1),(141,'PJ_0000333','COLOMBIA','12438','UNE EPM // Soporte Unificado Cisco ','MRC',1),(142,'PJ_0000333-01','COLOMBIA','12438-01','UNE EPM // Soporte Unificado Cisco (EDATEL)','MRC',1),(143,'PJ_0000333-02','COLOMBIA','12438-02','UNE EPM // Soporte Unificado Cisco (COLOMBIA MOVIL','MRC',1),(144,'PJ_0000335','COLOMBIA','10945-13','EEP // CONTRATO MARCO 10945-(13)','OTC',1),(145,'PJ_0000335-04','COLOMBIA','10945-17','EEP // CONTRATO MARCO-TULUA CETSA','OTC',1),(146,'PJ_0000335-05','COLOMBIA','10945-17','EEP // CONTRATO MARCO-EPSA','OTC',1),(147,'PJ_0000335-06','COLOMBIA','10945-17','EEP // CONTRATO MARCO-CELSIA','OTC',1),(148,'PJ_0000335-07','COLOMBIA','10945-17','EEP // CONTRATO MARCO-CNC DEL MAR SA','OTC',1),(149,'PJ_0000335-08','COLOMBIA','10945-17','EEP // CONTRATO MARCO-ZONA FRANCA','OTC',1),(150,'PJ_0000336','COLOMBIA','14485','CODENSA S.A. ESP // ENEL -  Suministro Equipos','OTC',1),(151,'PJ_0000336-01','COLOMBIA','14485','CODENSA S.A. ESP // ENEL -  Suministro Equipos-13579-1','OTC',1),(152,'PJ_0000336-02','COLOMBIA','14485','EMGESA S.A. ESP // ENEL -  Suministro Equipos-13579-2','OTC',1),(153,'PJ_0000336-03','COLOMBIA','14485','CODENSA S.A. ESP // ENEL -  SERVICIOS PROFESIONALES CORE-13579-14','OTC',1),(154,'PJ_0000336-04','COLOMBIA','14485','EMGESA S.A. ESP // ENEL -  SEGURIDAD ENEL-13579-18','OTC',1),(155,'PJ_0000343','COLOMBIA','12808','TELMEX // CLARO - U LIBRE - ADICIONALES VIDEOCONFERENCIA','OTC',1),(156,'PJ_0000344','COLOMBIA','12903','CEMENTOS ARGOS // SW CONTROL TOLU','OTC',1),(157,'PJ_0000346','COLOMBIA','12988','ARGOS PANAMA // ARGOS LAN PANAMA','OTC',1),(158,'PJ_0000347','COLOMBIA','14688','LOREAL // RENOVACION 4 MESES','MRC',1),(159,'PJ_0000348','COLOMBIA','15884','LOREAL// RECURSO TECNICO EN SITIO RETAIL','MRC',1),(160,'PJ_0000349','COLOMBIA','12940','UNE EPM // 3 YEARS - Soporte TR-069 2018','MRC',1),(161,'PJ_0000349-01','COLOMBIA','12940','UNE EPM // 3 YEARS - Soporte TR-069 EDATEL','MRC',1),(162,'PJ_0000350','COLOMBIA','12212','ERICSSON // Servicios Axiros Regionales ERICSSON','MRC',1),(163,'PJ_0000351','COLOMBIA','13205','INFORMACION Y TECNOLOGIA // Renovación ARINC Jun-Ago18 ','MRC',1),(164,'PJ_0000352','COLOMBIA','12713','HERMECO // T&B VIDEOCONFERENCIA','OTC',1),(165,'PJ_0000353','COLOMBIA','13249','COL. TELECOM. // SURA Licencias Adicionales Webex','OTC',1),(166,'PJ_0000354','COLOMBIA','14152','LOREAL // RECURSO HELPDESK CALLE 90','MRC',1),(167,'PJ_0000355','COLOMBIA','13193','UNE EPM // CMTS Q3 2018','OTC',1),(168,'PJ_0000359','COLOMBIA','13202','SOC. OPERADORA DE AEROP. // RENOVACION SERVICIO 2018','MRC',1),(169,'PJ_0000360','COLOMBIA','12754','TELMEX // ALMACENES ÉXITO - DRP TRIARA','OTC',1),(170,'PJ_0000362','COLOMBIA','13326','UNE EPM // SFP NEXUS 5000 (Suministro)','OTC',1),(171,'PJ_0000363','COLOMBIA','12466','COL. TELECOM. // OLIMPICA-SOLUCION WIFI','MRC',1),(172,'PJ_0000363-01','COLOMBIA','12466-1','COL. TELECOM. // OLIMPICA-SOLUCION WIFI (OTC)','OTC',1),(173,'PJ_0000363-02','COLOMBIA','12466-2','COL. TELECOM. // OLIMPICA-SOLUCION WIFI (MRC)','MRC',1),(174,'PJ_0000364','COLOMBIA','12376','AIRPLAN // SW CONTROL','OTC',1),(175,'PJ_0000366','COLOMBIA','13161','LOREAL// SUMINISTRO AP ','OTC',1),(176,'PJ_0000369','COLOMBIA','12631','ALMACENES EXITO // AXIROS - IMPRESORAS','OTC',1),(177,'PJ_0000370','COLOMBIA','12632','TELMEX // ASEGURAMIENTO','MRC',1),(178,'PJ_0000373','COLOMBIA','13244','ARGOS // SUMINISTRO AP','OTC',1),(179,'PJ_0000373-1','COLOMBIA','13244-1','ARGOS // SUMINISTRO AP - 1','OTC',1),(180,'PJ_0000373-2','COLOMBIA','13244-2','ARGOS // SUMINISTRO AP - 2','OTC',1),(181,'PJ_0000378','COLOMBIA','13356','CLARO // IP Inspira DC Triara','OTC',1),(182,'PJ_0000379','COLOMBIA','12973','ETB // RENOVACION COMFENALCO','MRC',1),(183,'PJ_0000380','COLOMBIA','12344','SUMMA // MATRIZ DARWIN','OTC',1),(184,'PJ_0000380-01','COLOMBIA','12344-1','SUMMA // MATRIZ DARWIN // 12344-1','OTC',1),(185,'PJ_0000380-02','COLOMBIA','12344-2','SUMMA // MATRIZ DARWIN // 12344-2','OTC',1),(186,'PJ_0000381','COLOMBIA','13368','BANCOLOMBIA // RECURSO TEMPORAL','MRC',1),(187,'PJ_0000382','COLOMBIA','13417','COLOMBIA TELECOM. // AVIANCA - SALA PROVEEDORES','MRC',1),(188,'PJ_0000382-01','COLOMBIA','13417-1','COLOMBIA TELECOM. // AVIANCA - SALA PROVEEDORES','MRC',1),(189,'PJ_0000382-02','COLOMBIA','13417-2','COLOMBIA TELECOM. // AVIANCA - SALA PROVEEDORES','OTC',1),(190,'PJ_0000384','COLOMBIA','13076','TERPEL // Suministro SW  ','OTC',1),(191,'PJ_0000385','COLOMBIA','13148','COLOMBIA TELECOM. // BANCOLOMBIA SERVICIOS SEGURIDAD REGIONAL','MRC',1),(192,'PJ_0000388','COLOMBIA','13240','CODENSA // SUMINISTRO EQUIPOS','OTC',1),(193,'PJ_0000391','COLOMBIA','13415','CLARO // TRANSMISORES SUPERQAM','OTC',1),(194,'PJ_0000392','COLOMBIA','13455','CLARO // BBVA-Instalación SDWAN','OTC',1),(195,'PJ_0000393','COLOMBIA','11669','INRED S A S // SUM SNT TERM CARGA','OTC',1),(196,'PJ_0000394','COLOMBIA','13291','CEMENTOS ARGOS S.A // HAITI//SOPORTE 2018','OTC',1),(197,'PJ_0000396','COLOMBIA','13468','ALMACENES EXITO S.A // ACTUALIZACIÓN WIRELESS ALMACENES Q4 2018','OTC',1),(198,'PJ_0000397','COLOMBIA','13473','TELMEX COLOMBIA SA // NODOS ÓPTICOS MRP7','OTC',1),(199,'PJ_0000398','COLOMBIA','13408','UNE EPM // NEXUS - B2B - AGOSTO 2018','OTC',1),(200,'PJ_0000399','COLOMBIA','13451','COL TELECOM S.A. // BANCOLOMBIA - NUEVAS SALAS','MRC',1),(201,'PJ_0000399-01','COLOMBIA','13451','COL TELECOM S.A. // BANCOLOMBIA - NUEVAS SALAS (OTC)','OTC',1),(202,'PJ_0000399-02','COLOMBIA','13451','COL TELECOM S.A. // BANCOLOMBIA - NUEVAS SALAS (MRC) (Fase 2)','MRC',1),(203,'PJ_0000400-01','COLOMBIA','13534','TELMEX COLOMBIA SA // ÉXITO - PROYECTO WOW','MRC',1),(204,'PJ_0000402','COLOMBIA','13399','QUIPUX // TRASLADO WLAN FORUM','OTC',1),(205,'PJ_0000402-01','COLOMBIA','13399-1','QUIPUX // TRASLADO WLAN FORUM (MRC)','MRC',1),(206,'PJ_0000402-2','COLOMBIA','13399-2','QUIPUX // TRASLADO WLAN FORUM (OTC)','OTC',1),(207,'PJ_0000405','COLOMBIA','13358','BANCOLOMBIA//UNIFICACIÓN DE DOMINIO','MRC',1),(208,'PJ_0000406','COLOMBIA','12812','ETB // Nueva EPS Renovacion 5 meses','MRC',1),(209,'PJ_0000409','COLOMBIA','13482','SURA//ADD LIC M3 // LICENCIAS WEBEX','OTC',1),(210,'PJ_0000410','COLOMBIA','13432','ESU // ACTUALIZACION Y SERVICIOS PROFESIONALES','OTC',1),(211,'PJ_0000411','COLOMBIA','12945','CONCEJO DE MEDELLIN // SOLUCION VIDEOCONFERENCIA','OTC',1),(212,'PJ_0000412','COLOMBIA','14469','ETB // SECRETARIA DE LA MUJER','MRC',1),(213,'PJ_0000414','COLOMBIA','13194','UNE EPM // CMTS Q4 2018','OTC',1),(214,'PJ_0000416','COLOMBIA','13098','CLARO// SDWAN BBVA ','MRC',1),(215,'PJ_0000421','COLOMBIA','13471','COL TELECOM S.A. // AVIANCA WIFI AIRMAN','MRC',1),(216,'PJ_0000421-01','COLOMBIA','13471','COL TELECOM S.A. // AVIANCA WIFI AIRMAN OTC','OTC',1),(217,'PJ_0000422','COLOMBIA','12950','ALMACENES ÉXITO // ADMINISTRACION','MRC',1),(218,'PJ_0000422-01','COLOMBIA','12950','ALMACENES ÉXITO // ADMINISTRACION ITAU VIVA ENVIGADO','MRC',1),(219,'PJ_0000422-02','COLOMBIA','12950','ALMACENES ÉXITO // ADMINISTRACION ITAU VIVA TUNJA','MRC',1),(220,'PJ_0000422-03','COLOMBIA','12950','ALMACENES ÉXITO // ADMINISTRACION ITAU VIVA LAURELES','MRC',1),(221,'PJ_0000423','COLOMBIA','13548','BT LATAM COLOMBIA // TARIFICACION','MRC',1),(222,'PJ_0000425','COLOMBIA','13419','LINEA DIRECTA // SERVICIOS DE CONSULTORIA','OTC',1),(223,'PJ_0000427','COLOMBIA','10514','UNE EPM // WAE - CRECIMIENTO','OTC',1),(224,'PJ_0000429','COLOMBIA','13430','CLARO // AMPLIFICADORES','OTC',1),(225,'PJ_0000430','COLOMBIA','13547','UNE EPM // SW DC B2B 2018','OTC',1),(226,'PJ_0000431','COLOMBIA','13560','FUNDACION VALLE DE LILIS // RFP SOPORTE','OTC',1),(227,'PJ_0000433','COLOMBIA','13890','LOREAL // SMARTNET','OTC',1),(228,'PJ_0000434','COLOMBIA','14077','UNE EPM // CMTS Q4 2018','OTC',1),(229,'PJ_0000435','COLOMBIA','12804','ARGOS // SIERRA VIEJA SUMINISTRO DE SW 8P','OTC',1),(230,'PJ_0000436','COLOMBIA','14095','UNE EPM // CMTS Q4 2018 LICENCIAS ADICIONALES','OTC',1),(231,'PJ_0000437','COLOMBIA','14155','UNE EPM // CMTS Q4 2018 LICENCIAS ADICIONALES 2','OTC',1),(232,'PJ_0000438','COLOMBIA','13931','TELMEX COLOMBIA // DATA CENTER','OTC',1),(233,'PJ_0000440','COLOMBIA','11731','SOCIEDAD OPERADORA DE AEROPUERTOS // ACTUALIZACION TECNOLOGIA CORES','OTC',1),(234,'PJ_0000441','COLOMBIA','12404','CISCO // INSTALACION SW','OTC',1),(235,'PJ_0000442','COLOMBIA','14135','UNE EPM // LICENCIAS SCRAMBLING Q4 2018','OTC',1),(236,'PJ_0000443','COLOMBIA','13891','GRUPO ARGOS // SWITCH PLANTA MOVIL','OTC',1),(237,'PJ_0000444','COLOMBIA','13565','TELEFONICA // AVIANCA HSB','MRC',1),(238,'PJ_0000444-01','COLOMBIA','13565','TELEFONICA // AVIANCA HSB','OTC',1),(239,'PJ_0000444-02','COLOMBIA','13565','TELEFONICA // AVIANCA HSB','MRC',1),(240,'PJ_0000445','COLOMBIA','13936','TELEFONICA // AVIANCA TRASLADO YOPAL + PEREIRA','OTC',1),(241,'PJ_0000449','COLOMBIA','14204','UNE EPM // METRO DE MEDELLIN // ROUTERS','OTC',1),(242,'PJ_0000451','COLOMBIA','13595','UNE EPM // CMTS Q1 2019','OTC',1),(243,'PJ_0000453','COLOMBIA','14146','ÉXITO // RENOVACION SOPORTE','OTC',1),(244,'PJ_0000454','COLOMBIA','14172','TELMEX // CLARO - MEGACENTER Y BUNKER 5','OTC',1),(245,'PJ_0000455','COLOMBIA','14045','TELMEX // CLARO - BBVA-ADICIONALES','OTC',1),(246,'PJ_0000457','COLOMBIA','13376','UNE EPM // CNR - IPV6','OTC',1),(247,'PJ_0000458','COLOMBIA','14417','TELEFONICA // BANCOLOMBIA // CABLES HDMI','OTC',1),(248,'PJ_0000459','COLOMBIA','14262','ARGOS // SWITCHES ENERO','OTC',1),(249,'PJ_0000461','COLOMBIA','14260','TELEFONICA // SOLUCION WIFI OLIMPICA','OTC',1),(250,'PJ_0000461-01','COLOMBIA','14260','TELEFONICA // SOLUCION WIFI OLIMPICA (MRC)','MRC',1),(251,'PJ_0000462','COLOMBIA','13173','TELMEX // SODIMAC-RFP TELCO','OTC',1),(252,'PJ_0000463','COLOMBIA','14356','UNE EPM // ACCESORIOS CMTS FEBRERO 2019','OTC',1),(253,'PJ_0000465','COLOMBIA','14516','TELMEX // ACCESORIOS MRP 1.0 2019','OTC',1),(254,'PJ_0000467','COLOMBIA','14181','TELMEX // BANCOLOMBIA ANILLO','OTC',1),(255,'PJ_0000468','COLOMBIA','14412','FUNDACION DEL AREA ANDINA // LICENCIA WEBEX','OTC',1),(256,'PJ_0000469','COLOMBIA','14346','EPSA // SECURITY LICENSE (E-DELIVERY) CISCO CGR2010','OTC',1),(257,'PJ_0000470','COLOMBIA','14019','UNE EPM // DC - ACI EPM Y AMERICA','OTC',1),(258,'PJ_0000471','COLOMBIA','14509','GRUPO ARGOS // AP ODINSA','OTC',1),(259,'PJ_0000473','COLOMBIA','14581','TELEFONICA // SURA SERVICIOS Y LICENCIAS','OTC',1),(260,'PJ_0000474','COLOMBIA','14587','TELMEX // OLIMPIA MANAGEMENT','OTC',1),(261,'PJ_0000476','COLOMBIA','14605','TELEFONICA // BANCOLOMBIA SALAS PERSONALES','OTC',1),(262,'PJ_0000477','COLOMBIA','14425','ÉXITO // VIVA PALMAS','OTC',1),(263,'PJ_0000478-01','COLOMBIA','14150','CEMENTOS ARGOS // RENOVACION SOPORTE','OTC',1),(264,'PJ_0000478-05','COLOMBIA','14150','SUMMA // RENOVACION SOPORTE','OTC',1),(265,'PJ_0000479','COLOMBIA','13192','CENTURY LINK // OLEODUCTOS - OUTSOURCING TELECOM','OTC',1),(266,'PJ_0000479-01','COLOMBIA','13192','CENTURY LINK // OLEODUCTOS - OUTSOURCING TELECOM (OTC)','OTC',1),(267,'PJ_0000479-02','COLOMBIA','13192','CENTURY LINK // OLEODUCTOS - OUTSOURCING TELECOM (MRC)','MRC',1),(268,'PJ_0000480','COLOMBIA','14351','ORGANIZACION TERPEL S.A. // SERVICIOS GERENCIA DE PROYECTOS','MRC',1),(269,'PJ_0000481','COLOMBIA','14638','UNE EPM // TRASLADOS CBR8','OTC',1),(270,'PJ_0000482','COLOMBIA','14750','TELMEX // FUSIBLES ABRIL 2019','OTC',1),(271,'PJ_0000484','COLOMBIA','14551','UNE // ACTUALIZACION TECNOLOGICA DCM D 990','OTC',1),(272,'PJ_0000485','COLOMBIA','14500','UNE // HUBs SATELITES Y VARIOS TV 2019','OTC',1),(273,'PJ_0000486','COLOMBIA','14253','AVIANCA // LICENCIAS MERAKI','MRC',1),(274,'PJ_0000487','COLOMBIA','13973','AVIANCA // Aps EL DORADO','MRC',1),(275,'PJ_0000488','COLOMBIA','14769','UFINET // CISCO ASR 920','OTC',1),(276,'PJ_0000489','COLOMBIA','14262-01','ARGOS // SWICTH MARZO','OTC',1),(277,'PJ_0000490','COLOMBIA','13431','ITS SALVADOR // VENTA DE EQUIPOS SABMILLER','OTC',1),(278,'PJ_0000491','COLOMBIA','13573','TELMEX // ALKOSTO RENOVACION','OTC',1),(279,'PJ_0000492','COLOMBIA','13424','TELMEX // TUYA SERVICIOS N1','MRC',1),(280,'PJ_0000493','COLOMBIA','14731','TELEFONICA // FERROVIAL AGROMAN RENOVACION','MRC',1),(281,'PJ_0000494','COLOMBIA','14634','ACMI // LICENCIAS WEBEX','OTC',1),(282,'PJ_0000495','COLOMBIA','14681','TERPEL // INGENIERO DE APLICACIONES','MRC',1),(283,'PJ_0000496','COLOMBIA','14482','EPSA // TARJETAS 6800','OTC',1),(284,'PJ_0000497','COLOMBIA','14870','UNE // ELEMENTOS CMTS MAYO 2019','OTC',1),(285,'PJ_0000498','COLOMBIA','16200','E-PROCESS // RENOVACION LICENCIAMIENTO SPARK','OTC',1),(286,'PJ_0000499','COLOMBIA','14322','TELEFONICA // SURA LICENCIAMIENTO WEBEX','OTC',1),(287,'PJ_0000500','COLOMBIA','14714','ARGOS // SUMNISTRO SW CHIRAJARA','OTC',1),(288,'PJ_0000502','COLOMBIA','14584','ENEL // ACTIVIDADES CIBERSEGURIDAD','OTC',1),(289,'PJ_0000503','COLOMBIA','14960','VNA PROYECTOS SAS // SW MERAKI FAMILIA','OTC',1),(290,'PJ_0000505','COLOMBIA','14601','SOCIEDAD OPERADORA DE AEROPUERTOS // SUM.LIC.TEL QUIBDO','OTC',1),(291,'PJ_0000506','COLOMBIA','14988','TELMEX COLOMBIA // BANCOLOMBIA SFPs ANILLO','OTC',1),(292,'PJ_0000507','COLOMBIA','13376-1','UNE EPM TELECOMUNICACIONES // LICENCIAS CNR REGIONAL','OTC',1),(293,'PJ_0000508','COLOMBIA','14857','BT LATAM COLOMBIA S.A // EXTENSION SERVICIO DE GRABACION','MRC',1),(294,'PJ_0000510','COLOMBIA','13483','EAFIT // SERVICIO DE TRALADO DE VC','OTC',1),(295,'PJ_0000511','COLOMBIA','14553','CEMENTOS ARGOS // NUEVA OFICINA  BARRANQUILLA','OTC',1),(296,'PJ_0000511-01','COLOMBIA','14553','GRUPO ARGOS SA','OTC',1),(297,'PJ_0000512','COLOMBIA','15071','VNA PROYECTOS SAS // FAMILIA PLANTA MEDELLIN','OTC',1),(298,'PJ_0000513','COLOMBIA','14799','UNE EPM TELECOMUNICACIONES // ASAs','OTC',1),(299,'PJ_0000514','COLOMBIA','14567','CEMENTOS ARGOS // MATRIZ DARWIN ','OTC',1),(300,'PJ_0000514-01','COLOMBIA','14567','CEMENTOS ARGOS // CEMENTOS ARGOS','OTC',1),(301,'PJ_0000514-02','COLOMBIA','14567','CEMENTOS ARGOS // CONCRETOS ARGOS','OTC',1),(302,'PJ_0000515','COLOMBIA','13568','TELMEX COLOMBIA SA // SEGUROS CONFIANZA - ISE','OTC',1),(303,'PJ_0000516','COLOMBIA','12456','TELMEX COLOMBIA SA // ECOPETROL OUTSOURCING IT','MRC',1),(304,'PJ_0000517','COLOMBIA','14911','CENTURY LINK COLOMBIA S.A. // FRONTERA-SDWAN','OTC',1),(305,'PJ_0000518','COLOMBIA','14820','COLOMBIA TELECOMUNICACIONES SA // TRASLADO VC USA','OTC',1),(306,'PJ_0000519','COLOMBIA','15141','TELMEX COLOMBIA SA // ECOPETROL EQUIPOS','OTC',1),(307,'PJ_0000520','COLOMBIA','11836','ALMACENES ÉXITO SA // WIFI VIVA BARRANQUILLA','OTC',1),(308,'PJ_0000521','COLOMBIA','14742','ETB // ARCOS DORADOS','MRC',1),(309,'PJ_0000521-01','COLOMBIA','14742','ETB // ARCOS DORADOS -OTC','OTC',1),(310,'PJ_0000521-02','COLOMBIA','14742','ETB // ARCOS DORADOS -MRC (MIG)','MRC',1),(311,'PJ_0000522','COLOMBIA','14483','ALMACENES ÉXITO SA // WIFI VIVA SINCELEJO','OTC',1),(312,'PJ_0000523','COLOMBIA','14633','PROMIGAS // MANTENIMIENTO Y SOPORTE HW Y SW CISCO','OTC',1),(313,'PJ_0000523-01','COLOMBIA','14633','TRANSOCCIDENTE SA ESP','OTC',1),(314,'PJ_0000523-02','COLOMBIA','14633','TRANSPORTADORA DE METANO ESP SA','OTC',1),(315,'PJ_0000523-03','COLOMBIA','14633','SOCIEDAD PORTUARIA EL CAYO SA ESP','OTC',1),(316,'PJ_0000523-04','COLOMBIA','14633','PROMISOL SAS','OTC',1),(317,'PJ_0000523-05','COLOMBIA','14633','PROMIORIENTE SA ESP','OTC',1),(318,'PJ_0000523-06','COLOMBIA','14633','ENLACE SERVICIOS COMPARTIDOS SAS','OTC',1),(319,'PJ_0000523-07','COLOMBIA','14633','PROMIGAS S.A E.S.P','OTC',1),(320,'PJ_0000523-08','COLOMBIA','14633','GASES DE OCCIDENTE SA ESP','OTC',1),(321,'PJ_0000525','COLOMBIA','16065','VNA PROYECTOS SAS // FAMILIA SMARTNET 3850','OTC',1),(322,'PJ_0000526','COLOMBIA','14665','COOPERATIVA COLANTA // SW MEDELLIN CARIBE','OTC',1),(323,'PJ_0000527','COLOMBIA','14993','CENTURYLINK COLOMBIA SA // OLEODUCTOS-ADICIONALES SDWAN','OTC',1),(324,'PJ_0000528','COLOMBIA','14698','TELMEX COLOMBIA SA // BBVA- RECURSO N2 ADICIONAL','MRC',1),(325,'PJ_0000529','COLOMBIA','15219','CENTURYLINK COLOMBIA SA // ADICIONALES TEL Y VIDEOCONFERENCIA','OTC',1),(326,'PJ_0000530','COLOMBIA','15039','UNE EPM TELECOMUNICACIONES SA // ELEMENTOS CMTS JULIO 2019','OTC',1),(327,'PJ_0000531','COLOMBIA','14991','INRED SAS // SMARTNET AIRPLAN','OTC',1),(328,'PJ_0000532','COLOMBIA','15049','CENTURY COLOMBIA SA //  OLEODUCTOS-RECURSO OBC','MRC',1),(329,'PJ_0000533','COLOMBIA','14978','ERICSSON DE EL SALVADOR // PLATAFORMA DHCP Y DOCSIS','MRC',1),(330,'PJ_0000534','COLOMBIA','14714-2','CONCRETOS ARGOS SA // SUM. SW2960 CX-8PC','OTC',1),(331,'PJ_0000535','COLOMBIA','13935','EMPRESA DE TELEFONOS DE BOGOTA // CONTRATO MARCO CISCO','OTC',1),(332,'PJ_0000535-01','COLOMBIA','13935','CONTRATO MARCO ETB - OTC','OTC',1),(333,'PJ_0000535-02','COLOMBIA','13935','CONTRATO MARCO ETB - MRC','MRC',1),(334,'PJ_0000537','COLOMBIA','13176','COLOMBIA TELECOMUNICACIONES SA // BANCOLOMBIA-TETRATION','MRC',1),(335,'PJ_0000538','COLOMBIA','15259','TELMEX SA // ACCESORIOS PRISMA','OTC',1),(336,'PJ_0000539','COLOMBIA','15290','CENTURY LINK COLOMBIA SA // ECOPETROL SDWAN EQUIPOS','OTC',1),(337,'PJ_0000540','COLOMBIA','15053','TELMEX COLOMBIA SA // RFP CMTS NUEVOS','OTC',1),(338,'PJ_0000541','COLOMBIA','15194','ALMACENES ÉXITO SA // RENOVACION LICENCIAS Z1','OTC',1),(339,'PJ_0000542','COLOMBIA','15939','LOREAL COLOMBIA SAS // F&F AMOR Y AMISTAD','OTC',1),(340,'PJ_0000543','COLOMBIA','14887','PRODUCTOS FAMILIA SA // FAMILIA CORTEZZA','OTC',1),(341,'PJ_0000544','COLOMBIA','15379','TELMEX COLOMBIA // ECOPETROL- FUENTES ROUTERS','OTC',1),(342,'PJ_0000545','COLOMBIA','15088','COLOMBIA TELECOMUNICACIONES // ALFAGRES INSTAL SW Y AP','OTC',1),(343,'PJ_0000546','COLOMBIA','15112','COLOMBIA TELECOMUNICACIONES SA//AVIANCA-TRASLADO EQ. LETICIA','OTC',1),(344,'PJ_0000547','COLOMBIA','15269','ALMACENES EXITO SA//VIVA BARRANQUILLA-FASE 2','OTC',1),(345,'PJ_0000548','COLOMBIA','15270','FUREL // SWITCH CORE','OTC',1),(346,'PJ_0000549','COLOMBIA','15413','ARGOS PANAMÁ//RENOVACIÓN SMARTNET','OTC',1),(347,'PJ_0000550','COLOMBIA','14833','AIRPLAN//SUMINISTRO DE SW SEDES','OTC',1),(348,'PJ_0000551','COLOMBIA','14912','POLICIA NACIONAL // INSTALACION Y MANTENIMIENTO APS ESCUELAS','OTC',1),(349,'PJ_0000552','COLOMBIA','15516','VNA PROYECTOS SAS//FAMILIA LICECIAMIENTO WLC2504-25APs','OTC',1),(350,'PJ_0000553','COLOMBIA','14586','UNE EPM TELECOMUNICACIONES SA//LICENCIAS AXIROS','OTC',1),(351,'PJ_0000554','COLOMBIA','15059','TELMEX COLOMBIA SA // LICENCIAS TV','OTC',1),(352,'PJ_0000555','COLOMBIA','15523','UNE EPM TELECOMUNICACIONES SA // ELEMENTOS CMTS Q4 2019','OTC',1),(353,'PJ_0000556','COLOMBIA','15487','POSTOBON S.A // LICENCIAMIENTO MERAKI- Aps','OTC',1),(354,'PJ_0000557','COLOMBIA','14697','TELMEX COLOMBIA SA // ÉXITO-ACTUALIZACIÓN SDWAN','OTC',1),(355,'PJ_0000558','COLOMBIA','14942','COLOMBIA TELECOMUNICACIONES // EJERCITO INSTALACION','OTC',1),(356,'PJ_0000559','COLOMBIA','15142','TELMEX COLOMBIA SA // ECOPETROL.SDWAN.INSTALACION','OTC',1),(357,'PJ_0000560','COLOMBIA','15530','CENTURY LINK COLOMBIA SA // OLEODUCTOS-ADICIONALES LAN Y SDWAN','OTC',1),(358,'PJ_0000561','COLOMBIA','15479','QUIPUX SAS // LIC. MERAKI Y SOPORTE 36 MESES','MRC',1),(359,'PJ_0000562','COLOMBIA','15028','TELMEX COLOMBIA SA // SFPs TV','OTC',1),(360,'PJ_0000563','COLOMBIA','14330','ALMACENES ÉXITO SA // SOPORTE PLATAFORMA GMD','OTC',1),(361,'PJ_0000565','COLOMBIA','14994','TELMEX COLOMBIA SA//AMPLIFICADORES 1.0 GHZ JUNIO 2019','OTC',1),(362,'PJ_0000566','COLOMBIA','15613','UNE EPM TELECOMUNICACIONES SA//ELEMENTOS NEXUS Q4 2019','OTC',1),(363,'PJ_0000568','COLOMBIA','15596','COLOMBIA TELECOMUNICACIONES//PONAL ESBOL TULUÁ','MRC',1),(364,'PJ_0000569','COLOMBIA','14254','COMUNICACION CELULAR SA//SOPORTE TV-SYNAMEDIA','OTC',1),(365,'PJ_0000570','COLOMBIA','15743','COMUNICACION CELULAR SA//SUMINISTRO LICENCIA FLEX','OTC',1),(366,'PJ_0000571','COLOMBIA','15658','COMUNICACION CELULAR SA//SOPORTE TV-CISCO','OTC',1),(367,'PJ_0000572','COLOMBIA','14065','TELMEX COLOMBIA SA//POSTOBON-CENTRAL CERVECERA','OTC',1),(368,'PJ_0000573','COLOMBIA','15816','VNA PROYECTOS SAS//FAMILIA POWER INJECTOR','OTC',1),(369,'PJ_0000575','COLOMBIA','15659','TELMEX SA//PRISMA-1','OTC',1),(370,'PJ_0000576','COLOMBIA','15859','Agregados Argos//Suministro SW Cisco','OTC',1),(371,'PJ_0000577','COLOMBIA','14830','CLARO ECP//Solución Red MEI Assesment Ecopetrol','OTC',1),(372,'PJ_0000578','COLOMBIA','15614','UNE EPM TELECOMUNICACIONES SA//ELEMENTOS CMTS Q4 2019-2','OTC',1),(373,'PJ_0000579','COLOMBIA','15659','TELMEX SA//PRISMA 2','OTC',1),(374,'PJ_0000580','COLOMBIA','15870','UNE EPM TELECOMUNICACIONES SA//LICENCIAS SCRAMBLING','OTC',1),(375,'PJ_0000581','COLOMBIA','15744','COLOMBIA MAS TV SAS // LICENCIAS D9800','OTC',1),(376,'PJ_0000582','COLOMBIA','14899','ALMACENES EXITO SA//SITES EXITO WOW','OTC',1),(377,'PJ_0000583','COLOMBIA','13956','CISCO SYSTEM INC//CLARO-ADICIONALES NEXUS (1)','OTC',1),(378,'PJ_0000584','COLOMBIA','15564','VNA PROYECTOS SAS//FAMILIA STOCK APS','OTC',1),(379,'PJ_0000585','COLOMBIA','15705','AIRPLAN//SUMINISTRO SW SEDES','OTC',1),(380,'PJ_0000586','COLOMBIA','14812','GRUPO ARGOS//RENOVACIÓN SMARTNET','OTC',1),(381,'PJ_0000586-01','COLOMBIA','14812','ODINSA//RENOVACIÓN SMARTNET','OTC',1),(382,'PJ_0000586-02','COLOMBIA','14812','ZONA FRANCA ARGOS SAS','OTC',1),(383,'PJ_0000586-03','COLOMBIA','14812','CEMENTOS ARGOS SA','OTC',1),(384,'PJ_0000586-04','COLOMBIA','14812','CONCRETOS ARGOS SAS','OTC',1),(385,'PJ_0000586-05','COLOMBIA','14812','LOGITRANS SA','OTC',1),(386,'PJ_0000586-06','COLOMBIA','14812','SUMMA SERV CORP INTEGRAL','OTC',1),(387,'PJ_0000587','COLOMBIA','15313','Línea Directa//Suministro LAN/WLAN Hacienda Escocia','OTC',1),(388,'PJ_0000588','COLOMBIA','15319','CISCO SYSTEMS//CLARO RACKING/STACKING (1)','OTC',1),(389,'PJ_0000589','COLOMBIA','15654','Línea Directa//SUM. LIC ISE & IMP. POSTURA','OTC',1),(390,'PJ_0000591','COLOMBIA','15877','ALMACENES ÉXITO SA//RENOVACIÓN SOPORTE CORE 2020','OTC',1),(391,'PJ_0000592','COLOMBIA','15979','UNE EPM TELECOMUNICACIONES//ELEMENTOS CMTS Q1 2020','OTC',1),(392,'PJ_0000593','COLOMBIA','15126','BANACOL//SUM. SW CISCO L3','OTC',1),(393,'PJ_0000594','COLOMBIA','15998','TELMEX COLOMBIA SA//VOLUMETRICA SA','OTC',1),(394,'PJ_0000595','COLOMBIA','14535','UNE EPM TELECOMUNICACIONES SA//HFC MONITORING TOOL (PNM)','OTC',1),(395,'PJ_0000595-01','COLOMBIA','14535','OTC-LICENCIAS','OTC',1),(396,'PJ_0000595-02','COLOMBIA','14535','MRC-SERVICIO DE SOPORTE','MRC',1),(397,'PJ_0000595-03','COLOMBIA','14535','PNM-PARAGUAY','OTC',1),(398,'PJ_0000596','COLOMBIA','15997','TELMEX COLOMBIA SA//ECOPETROL-PIEDEMONTE','OTC',1),(399,'PJ_0000597','COLOMBIA','16030','TELMEX COLOMBIA SA//CORFICOLOMBIANA FASE I','OTC',1),(400,'PJ_0000598','COLOMBIA','15861','CISCO SYSTEM INC//CLARO-AMPLIACIÓN 10PE','OTC',1),(401,'PJ_0000599','COLOMBIA','15906','CISCO SYSTEM INC//CLARO-CRS-MEDELLÍN','OTC',1),(402,'PJ_0000600','COLOMBIA','15976','UNE EPM TELECOMUNICACIONES SA//NEXUS 2020','OTC',1),(403,'PJ_0000601','COLOMBIA','16096','TELMEX COLOMBIA SA// AMPLIFICADORES FEBRERO 2020-2','OTC',1),(404,'PJ_0000602','COLOMBIA','15291','CENTURYLINK COLOMBIA SA//OLEODUCTOS-UNIFY','MRC',1),(405,'PJ_0000603','COLOMBIA','15476','CLARO//ECOPETROL RED VRO','OTC',1),(406,'PJ_0000604','COLOMBIA','15472','COLOMBIA TELECOMUNICACIONES//SENA ANALÍTICA SOC','MRC',1),(407,'PJ_0000605','COLOMBIA','14074','COLOMBIA TELECOMUNICACIONES//COMPRA TELÉFONOS SENA','OTC',1),(408,'PJ_0000606','COLOMBIA','16217','CISCO SYSTEM INC//CLARO MIGRACIONES NEXUS (1)','OTC',1),(409,'PJ_0000607','COLOMBIA','15659','TELMEX COLOMBIA SA//PRISMA-3','OTC',1),(410,'PJ_0000608','COLOMBIA','15815','INFOMEDIA SERVICE//ADICIONALES ABINVEB','OTC',1),(411,'PJ_0000609','COLOMBIA','16254','TELMEX COLOMBIA SA//PRODUCTOS DATACENTER','OTC',1),(412,'PJ_0000610','COLOMBIA','16172','TELMEX COLOMBIA SA//ALKOSTO-SUM ROUTERS','OTC',1),(413,'PJ_0000611','COLOMBIA','15659','TELMEX COLOMBIA SA//PRISMA 5','OTC',1),(414,'PJ_0000612','COLOMBIA','15937','CENTURYLINK COLOMBIA SA//OLEODUCTOS-ACD','OTC',1),(415,'PJ_0000613','COLOMBIA','15787','CENTURYLINK COLOMBIA SA//OLEODUCTOS-ADICIONALES UC','OTC',1),(416,'PJ_0000614','COLOMBIA','16099','ALMACENES ÉXITO SA//MUSA-EQUIPOS DE RED','OTC',1),(417,'PJ_0000615','COLOMBIA','16197','SELTIC SAS//ELECTRICARIBE-AMI','OTC',1),(418,'PJ_0000616','COLOMBIA','15905','CEMENTOS ARGOS SA//SUMINISTRO EQUIPOS PLANTA RIO CLARO','OTC',1),(419,'PJ_0000617','COLOMBIA','16125','CENTURYLINK//ECOPETROL-PUNTO SDWAN ADIC.','OTC',1),(420,'PJ_0000618','COLOMBIA','16124','AIRPLAN//SMARTNET CISCO PRIME','OTC',1),(421,'PJ_0000619','COLOMBIA','16202','CENTRO ONCOLOGICO DE ANTIOQUIA // LIC. TELEFONOS IP','OTC',1),(422,'PJ_0000620','COLOMBIA','15544','TELMEX COLOMBIA SA//ÉXITO-SDWAN-INSTALACIÓN','OTC',1),(423,'PJ_0000621','COLOMBIA','16347','EMPRESA DE TELÉFONOS DE BOGOTÁ//TARJETAS EXPANSIÓN CRS','OTC',1),(424,'PJ_0000622','COLOMBIA','16298','UNE EPM TELECOMUNICACIONES SA//LICENCIAS TV','OTC',1),(425,'PJ_0000623','COLOMBIA','14866','TORORTIZ SAS//CONTRATO DE SOPORTE','MRC',1),(426,'PJ_0000623-01','COLOMBIA','14866','JARDINES DE JUAICA SA','MRC',1),(427,'PJ_0000623-02','COLOMBIA','14866','PROMOTORA OVIEDO SAS-TIMIZA','MRC',1),(428,'PJ_0000623-03','COLOMBIA','14866','PROMOTORA MACADAMIA ORIENTAL SAS','MRC',1),(429,'PJ_0000623-04','COLOMBIA','14866','CONSTRUCTORA WEST SAS','MRC',1),(430,'PJ_0000623-05','COLOMBIA','14866','PROMOTORA TEJAR SAS','MRC',1),(431,'PJ_0000623-06','COLOMBIA','14866','TORORTIZ SAS','MRC',1),(432,'PJ_0000624','COLOMBIA','16314','CENTURYLINK COLOMBIA SA//OLEODUCTOS-ROOM KIT P60','OTC',1),(433,'PJ_0000625','COLOMBIA','16451','CLARO//BANCOLOMBIA-MODULO SFP','OTC',1),(434,'PJ_0000626','COLOMBIA','16452','CLARO//BANCOLOMBIA-FUENTE PWR','OTC',1),(435,'PJ_0000627','COLOMBIA','14022','COLOMBIA TELECOMUNICACIONES//PONAL SUMINISTRO-GESTION Aps (Espol)','OTC',1),(436,'PJ_0000628','COLOMBIA','16356','UNE EPM TELECOMUNICACIONES SA//SFPs CMTS','OTC',1),(437,'PJ_0000629','COLOMBIA','16441','CLARO//ALKOSTO-CHASIS ASR','OTC',1),(438,'PJ_0000630','COLOMBIA','16187','COLOMBIA TELECOMUNICACIONES SA//PONAL ESBOL TULUA 2','OTC',1),(439,'PJ_0000631','COLOMBIA','16343','COLOMBIA TELECOMUNICACIONES SA//PONAL INST Y MANT AP (Esjim)','OTC',1),(440,'PJ_0000632','COLOMBIA','16481','COMSA//MODULO STACK SW 3650','OTC',1),(441,'PJ_0000633','COLOMBIA','16331','COLOMBIA TELECOMUNICACIONES SA//OLIMPICA CEDI 5','OTC',1),(442,'PJ_0000634','COLOMBIA','16523','SURAMERICANA SA//SMATNET LICENCIA BE6000','OTC',1),(443,'PJ_0000635','COLOMBIA','16285','ALMACENES ÉXITO SA//SOPORTE PLATAFORMA GMD','MRC',1),(444,'PJ_0000636','COLOMBIA','16454','ESU//BOLSA DE HORAS SOPORTE SW CORE','MRC',1),(445,'PJ_0000637','COLOMBIA','15365','BANCOLOMBIA-ADICIONALES ANILLO','OTC',1),(446,'PJ_0000638','COLOMBIA','15880','COLOMBIA DE TELECOMUNICACIONES SA//AVIANCA-TRASLADO AEROPUER','OTC',1),(447,'PJ_0000639','COLOMBIA','15192','COLOMBIA DE TELECOMUNICACIONES SA//AVIANCA-TRASLADO HONDURAS','OTC',1),(448,'PJ_0000640','COLOMBIA','15473','COLOMBIA DE TELECOMUNICACIONES SA//ROUTERS CLOUD','OTC',1),(449,'PJ_0000641','COLOMBIA','16365','ALMACENES ÉXITO SA//ACTUALIZACIÓN CALLE 80','OTC',1),(450,'PJ_0000642','COLOMBIA','16263','ALMACENES ÉXITO SA//ACTUALIZACIÓN PISO 4 SEDE ADMINISTRATIVA','OTC',1),(451,'PJ_0000643','COLOMBIA','16002','COMUNICACIÓN CELULAR SA//BANCOLOMBIA ADICIONALES ANILLO-SERV','OTC',1),(452,'PJ_0000644','COLOMBIA','16471','CLARO//CLOUD-MEGAPORT INTERCONEXIÓN DC','OTC',1),(453,'PJ_0000645','COLOMBIA','16558','ALMACENES ÉXITO SA//WLAN PISO 2 SEDE ADMINISTRATIVA','OTC',1),(454,'PJ_0000646','COLOMBIA','16501','IQ OUTSOURCING//SMARTNET SWITCHES DE CORE','OTC',1),(455,'PJ_0000647','COLOMBIA','16526','BAVARIA//SERV PROF DE INSTAL Y CONFIG SW C3650','OTC',1),(456,'PJ_0000648','COLOMBIA','16405','CLARO//ALMACENES ÉXITO-SUM SFPs','OTC',1),(457,'PJ_0000649','COLOMBIA','15890','CENTURYLINK//COLOMBINA-SDWAN','MRC',1),(458,'PJ_0000650','COLOMBIA','16389','INSTRUMENTOS Y CONTROLES SA//ECOPETROL-SOL. MEDICIÓN','OTC',1),(459,'PJ_0000651','COLOMBIA','14257','TIGOUNE TELEOCOMUNICACIONES SA//DAVIVIENDA DATACENTER','OTC',1),(460,'PJ_0000652','COLOMBIA','16710','COLOMBIA DE TELECOMUNICACIONES SA//AVIANCA-TRASLADO EQ MIAMI','OTC',1),(461,'PJ_0000653','COLOMBIA','16532','INTERNEXA//SOPORT LAN/WLAN/TOIP AIRPLAN','MRC',1),(462,'PJ_0000654','COLOMBIA','15912','COMUNICACIÓN CELULAR SA//SOPORTE TV 2020','MRC',1),(463,'PJ_0000655','COLOMBIA','15952','ALMACENES ÉXITO SA//ACTUALIZACIÓN SW Y APs','OTC',1),(464,'PJ_0000656','COLOMBIA','16667','CLARO//ALKOSTO SUM ROUTERS BPM006062','OTC',1),(465,'PJ_0000657','COLOMBIA','16767','CEMENTOS ARGOS SA//SUM SW MINA ALTO RICO','OTC',1),(466,'PJ_0000658','COLOMBIA','15988','LINEA DIRECTA SAS//SOLUCION LINEA PICKING #5','OTC',1),(467,'PJ_0000659','COLOMBIA','16250','UNE EPM TELECOMUNICACIONES SA//ELEMENTOS CMTS Q2 2020','OTC',1),(468,'PJ_0000660','COLOMBIA','16739','CLARO//ÉXITO SUM SFPs','OTC',1),(469,'PJ_0000661','COLOMBIA','15297','CISCO SYSTEMS INC//CLARO-R&D RED TÉCNICA','OTC',1),(470,'PJ_0000662','COLOMBIA','16284','CLUB HATOGRANDE//RENOVACIÓN LICENCIAMIENTO MERAKI','OTC',1),(471,'PJ_0000664','COLOMBIA','16500','PRODUCTOS FAMILIA SA//SEGURIDAD END POINT','OTC',1),(472,'PJ_0000665','COLOMBIA','16620','ITS COSTA RICA//TELECABLE-SERVICIOS','OTC',1),(473,'PJ_0000666','COLOMBIA','16257','CIEMENTIERI NATIONALE//SUMINISTRO SW HAITI','OTC',1),(474,'PJ_0000667','COLOMBIA','16560','UNE EPM TELECOMUNICACIONES SA//Soporte routers Metro Med','OTC',1),(475,'PJ_0000668','COLOMBIA','16595','BANACOL//SUMINISTRO SW L2 Y L3','OTC',1),(476,'PJ_0000669','COLOMBIA','15845','ITS GT//Servicios PJ 265','OTC',1),(477,'PJ_0000670','COLOMBIA','16941','COMUNICACION CELULAR SA//SUM ADAPTADOR','OTC',1),(478,'PJ_0000671','COLOMBIA','16758','INSTRUMENTOS Y CONTROLES SA//SUM EQUIPOS ASA','OTC',1),(479,'PJ_0000672','COLOMBIA','16115','CIEMENTIERI NATIONALE//SUMINISTRO APs HAITI','OTC',1),(480,'PJ_0000673','COLOMBIA','16844','COMUNICACION CELULAR SA//PLANTA EXTERNA PLATAFORMA CISCO','OTC',1),(481,'PJ_0000674','COLOMBIA','16188','TELEFÓNICA//PONAL CENOP ESPINAL','MRC',1),(482,'PJ_0000675','COLOMBIA','16346','ERCISSON REGIONAL// PLATAFORMA DHCP Y DOCSIS','MRC',1),(483,'PJ_0000675-01','COLOMBIA','16346','SERVICIOS GT','MRC',1),(484,'PJ_0000675-02','COLOMBIA','16346','SERVICIOS ES','MRC',1),(485,'PJ_0000676','COLOMBIA','16752','UNE EPM TELECOMUNICACIONES//ELEMENTOS CMTS H2 2020','OTC',1),(486,'PJ_0000677','COLOMBIA','17070','COMUNICACIÓN CELULAR SA//SUM EQUIPOS BACKEND','OTC',1),(487,'PJ_0000678','COLOMBIA','16687','CENTURYLINK COLOMBIA SA//OLEODUCTOS TELEFONO WIFI','OTC',1),(488,'PJ_0000680','COLOMBIA','17020','ALMACENES ÉXITO SA//ASEGURAMIENTO CEDI CALIMA','OTC',1),(489,'PJ_0000682','COLOMBIA','15990','COLOMBIA DE TELECOMUNICACIONES SA//BANCOLOMBIA TRASLADO SAN','OTC',1),(490,'PJ_0000683','COLOMBIA','17104','CLARO COMUNICACIÓN SA//SUM MODULOS SFP','OTC',1),(491,'PJ_0000684','COLOMBIA','17072','COMUNICACION CELULAR SA//SUM EQUIPOS','OTC',1),(492,'PJ_0000685','COLOMBIA','16262','COMUNICACIÓN CELULAR SA//ECOPETROL TELEMETRÍA','OTC',1),(493,'PJ_0000686','COLOMBIA','16442','COLOMBIA MOVIL SA ESP//ASA ISE','OTC',1),(494,'PJ_0000687','COLOMBIA','17059','COMUNICACION CELULAR SA//SUM AMPLIFICADORES Y NODOS','OTC',1),(495,'PJ_0000688','COLOMBIA','16613','FUNDACIÓN VALLE DE LILI//RENOVACIÓN SMARTNET','OTC',1),(496,'PJ_0000689','COLOMBIA','15955','GRUPO ARGOS SA//SW-APs-UPS','OTC',1),(497,'PJ_0000690','COLOMBIA','16964','SELTIC SAS//NANSEN-SERVER BACKUP','OTC',1),(498,'PJ_0000691','COLOMBIA','15953','CenturyLink Colombia SAS//Bola de Horas','OTC',1),(499,'PJ_0000692','COLOMBIA','16348','COMUNICACION CELULAR SA//ÉXITO-SERVICIO PREMIUM DC','MRC',1),(500,'PJ_0000693','COLOMBIA','17170','INSTRUMENTOS Y CONTROLES SA//ECOPETROL-FIREWALLS ADICIONALES','OTC',1),(501,'PJ_0000694','COLOMBIA','17227','INSTRUMENTOS Y CONTROLES SA//ECOPETROL-WIFI INDUSTRIAL','OTC',1),(502,'PJ_0000695','COLOMBIA','17017','FRUBATEC SAS ZOMA//SW FRUBATEC','OTC',1),(503,'PJ_0000695-01','COLOMBIA','17017','CFS LOGISTICS LLC. SUCURSAL DE SOCIEDAD EXTRANJERA','OTC',1),(504,'PJ_0000696','COLOMBIA','17294','SELTIC SAS//INTERNEXA APS MERAKI','OTC',1),(505,'PJ_0000697','COLOMBIA','17273','Comunicación Celular SA//ECOPETROL-TELEMETRÍA SERVICIOS ADIC','OTC',1),(506,'PJ_0000698','COLOMBIA','15543','Comunicación Celular SA//ÉXITO ADICIONALES OPERACION','MRC',1),(507,'PJ_0000699','COLOMBIA','16888','COLOMBIA DE TELEOMUNICACIONES//DAVIVIENDA ACI SP','OTC',1),(508,'PJ_0000700','COLOMBIA','16876','COLOMBIA DE TELEOMUNICACIONES//SALUD TOTAL KHOPM SINCELEJO','OTC',1),(509,'PJ_0000700-01','COLOMBIA','16876','Servicios 1 año','MRC',1),(510,'PJ_0000701','COLOMBIA','16801','COLOMBIA TELECOMUNICACIONES//BBVA PROYECTO MUUSA ANALÍTICA','MRC',1),(511,'PJ_0000702','COLOMBIA','14357','COMUNICACIÓN CELULAR SA//CORFICOLOMBIANA','OTC',1),(512,'PJ_0000703','COLOMBIA','17286','Comunicación Celular SA//Crecimiento CAVS','OTC',1),(513,'PJ_0000704','COLOMBIA','17078','Comunicación Celular SA//SUM SWITCHES SP HUB TV','OTC',1),(514,'PJ_0000705','COLOMBIA','16617','Comunicación Celular SA//Licencias DCM Plataforma TV','OTC',1),(515,'PJ_0000706','COLOMBIA','16963','UNE EPM TELECOMUNICACIONES SA//SERVICIO TRASLADO EQUIPOS','OTC',1),(516,'PJ_0000707','COLOMBIA','17333','CENTRO ONTOLÓGICO DE ANTIOQUIA SA//TELEFONOS Y LIC','OTC',1),(517,'PJ_0000708','COLOMBIA','17374','SUMMA // SMARNET','OTC',1),(518,'PJ_0000709','COLOMBIA','17397','SELTIC//SDWAN FNA','OTC',1),(519,'PJ_0000710','COLOMBIA','16794','COMCEL// EXITO WOW MERAKI','MRC',1),(520,'PJ_0000711','COLOMBIA','15646','COMCEL//TUYA-SERVICIOS ADICIONALES','MRC',1),(521,'PJ_0000713','COLOMBIA','17228','UNE EPM// LICENCIAS CMTS Q4','OTC',1),(522,'PJ_0000714','COLOMBIA','16804','UNE EPM//SERVICIOS IPv6 CONSEJO MEDELLIN','OTC',1),(523,'PJ_0000715','COLOMBIA','16891','CENTURYLINK// OBC-RECURSO BICENTENARIO','OTC',1),(524,'PJ_0000716','COLOMBIA','17010','ESU//BOLSA DE HORAS SOPORTE','OTC',1),(525,'PJ_0000717','COLOMBIA','17285','COMCEL//LICENCIAS CMTS','OTC',1);
/*!40000 ALTER TABLE `pjs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proyecto` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `formulario_ocupacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_proyecto_pais` (`proyecto`,`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'AVIANCA','COLOMBIA',0),(2,'BANCOLOMBIA','COLOMBIA',0),(3,'BBVA','COLOMBIA',0),(4,'ECOPETROL','COLOMBIA',0),(5,'ÉXITO','COLOMBIA',0),(6,'LUMEN','COLOMBIA',0),(7,'SERVICIOS TRANSVERSALES','COLOMBIA',0),(8,'TUYA','COLOMBIA',0),(9,'PMO ITS','COLOMBIA',1),(10,'BACKOFFICE','COLOMBIA',1),(12,'HUAWEI REGIONAL N2','GUATEMALA',0),(13,'VAS Y FIJO','GUATEMALA',0),(14,'VOICE','GUATEMALA',0),(15,'INA','COSTA RICA',0),(16,'NOC-TIGO','COSTA RICA',0),(17,'SD-TIGO','COSTA RICA',0),(18,'VICAL','COSTA RICA',0),(19,'HUAWEI REGIONAL N2','EL SALVADOR',0),(20,'TODOS','TODOS',0);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  `servicio` varchar(250) NOT NULL,
  `indicadores_servicio` varchar(250) DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analityApi_servicios_proyecto_id_e7b55888_fk_proyectos_id` (`proyecto_id`),
  CONSTRAINT `analityApi_servicios_proyecto_id_e7b55888_fk_proyectos_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'COLOMBIA','CONECTIVIDAD LAN/WLAN','Oportunidad en la resolución de incidentes prioridad crítica  P1 (menor a 2 horas)',1),(2,'COLOMBIA','CONECTIVIDAD LAN/WLAN','Oportunidad en la resolución de incidentes prioridad crítica  P2 (menor a 4 horas)',1),(3,'COLOMBIA','CONECTIVIDAD LAN/WLAN','Oportunidad en la resolución de incidentes prioridad crítica  P3 (menor a 8 horas)',1),(4,'COLOMBIA','CONECTIVIDAD LAN/WLAN','Oportunidad en la resolución de incidentes prioridad crítica  P4 (menor a 12 horas)',1),(5,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',1),(6,'COLOMBIA','Datacenter y Nodos','FCCG TOTAL',2),(7,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',2),(8,'COLOMBIA','Sedes Administradas','FCCG TOTAL',2),(9,'COLOMBIA','% Solución SLA','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',3),(10,'COLOMBIA','Cumplimiento de Incidentes','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',3),(11,'COLOMBIA','Cumplimiento de Requerimientos','Oportunidad en la solución de requerimientos, dentro de los tiempos establecidos por prioridad',3),(12,'COLOMBIA','Disponibilidad del servicio','Oportunidad en la disponibilidad de los servicios contratados',3),(13,'COLOMBIA','Incident Rate','Oportunidad en la cantidad de Incidentes generados vs la cantidad de servicios contratados',3),(14,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',3),(15,'COLOMBIA','MTTR','Oportunidad en el tiempo medio de resolución incidentes',3),(16,'COLOMBIA','Nivel de Eficiencia','Oportunidad en la respuesta de las llamadas ofrecidas (abandonos)',3),(17,'COLOMBIA','Nivel de Servicio','Oportunidad en el tiempo de respuesta en las llamadas entrantes (Contestadas antes de 20 Segundos)',3),(18,'COLOMBIA','Proactividad','Oportunidad en la cantidad de incidentes generados proactivamente (sin ser notificados por el usuario final)',3),(19,'COLOMBIA','Recurrencia','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por cualquier causa',3),(20,'COLOMBIA','Reincidencia','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',3),(21,'COLOMBIA','Reincidencia R 2 3','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',3),(22,'COLOMBIA','Reincidencia R 2 3 4','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',3),(23,'COLOMBIA','Solución primer contacto','Oportunidad en la solución de Incidentes en el primer contacto, su tiempo de solución es menor a 60 Minutos',3),(24,'COLOMBIA','Ticket vs Servicio','Oportunidad en la cantidad de Incidentes generados vs la cantidad de servicios contratados',3),(25,'COLOMBIA','TMO','Oportunidad en el tiempo medio de operación sobre las llamadas atendidas',3),(26,'COLOMBIA','COMUNICACIONES UNIFICADAS','Disponibilidad CORE Telefonía',4),(27,'COLOMBIA','COMUNICACIONES UNIFICADAS','Disponibilidad CORE Video',4),(28,'COLOMBIA','COMUNICACIONES UNIFICADAS','Oportunidad en la resolución de incidentes prioridad alta (4 horas)_x000D_  (4 horas)',4),(29,'COLOMBIA','COMUNICACIONES UNIFICADAS','Oportunidad en la resolución de incidentes prioridad baja (10 horas)',4),(30,'COLOMBIA','COMUNICACIONES UNIFICADAS','Oportunidad en la resolución de incidentes prioridad crítica ( 2 horas)',4),(31,'COLOMBIA','COMUNICACIONES UNIFICADAS','Oportunidad en la resolución de incidentes prioridad media (6 horas)',4),(32,'COLOMBIA','COMUNICACIONES UNIFICADAS','Oportunidad en la resolución de requerimientos',4),(33,'COLOMBIA','CONECTIVIDAD','Calidad de transmision de datos conectividad e internet',4),(34,'COLOMBIA','CONECTIVIDAD','Disponibilidad Conectividad  SIN redundancia',4),(35,'COLOMBIA','CONECTIVIDAD','Disponibilidad Conectividad redundante',4),(36,'COLOMBIA','CONECTIVIDAD','Disponibilidad redundante',4),(37,'COLOMBIA','CONECTIVIDAD','Disponibilidad SIN redundancia',4),(38,'COLOMBIA','CONECTIVIDAD','Interrupciones máximas de servicio conectividad e internet',4),(39,'COLOMBIA','CONECTIVIDAD','Oportunidad en la resolución de incidentes prioridad alta (4 horas)_x000D_  (4 horas)',4),(40,'COLOMBIA','CONECTIVIDAD','Oportunidad en la resolución de incidentes prioridad baja (10 horas)',4),(41,'COLOMBIA','CONECTIVIDAD','Oportunidad en la resolución de incidentes prioridad crítica ( 2 horas)',4),(42,'COLOMBIA','CONECTIVIDAD','Oportunidad en la resolución de incidentes prioridad media (6 horas)',4),(43,'COLOMBIA','CONECTIVIDAD','Oportunidad en la resolución de requerimientos',4),(44,'COLOMBIA','Global','Backlog de tickets',4),(45,'COLOMBIA','Global','Calidad en la documentación de tickets (indidentes, requerimientos, problemas y cambios)',4),(46,'COLOMBIA','Global','Cumplimiento cronogramas y actividades programadas',4),(47,'COLOMBIA','Global','Cumplimiento de controles',4),(48,'COLOMBIA','Global','Cumplimiento de requerimientos de información',4),(49,'COLOMBIA','Global','Efectividad de cambios',4),(50,'COLOMBIA','Global','Efectividad del servicio',4),(51,'COLOMBIA','Global','Experiencia  de usuario final',4),(52,'COLOMBIA','Global','Gestión de problemas',4),(53,'COLOMBIA','Global','Oportunidad en gestión de quejas, sugerencias y felicitaciones (en un termino máximo de 5 días hábiles)',4),(54,'COLOMBIA','INTERNET','Calidad de transmision de datos conectividad e internet',4),(55,'COLOMBIA','INTERNET','Disponibilidad',4),(56,'COLOMBIA','INTERNET','Interrupciones máximas de servicio conectividad e internet',4),(57,'COLOMBIA','INTERNET','Oportunidad en la resolución de incidentes prioridad alta (4 horas)_x000D_  (4 horas)',4),(58,'COLOMBIA','INTERNET','Oportunidad en la resolución de incidentes prioridad baja (10 horas)',4),(59,'COLOMBIA','INTERNET','Oportunidad en la resolución de incidentes prioridad crítica ( 2 horas)',4),(60,'COLOMBIA','INTERNET','Oportunidad en la resolución de incidentes prioridad media (6 horas)',4),(61,'COLOMBIA','INTERNET','Oportunidad en la resolución de requerimientos',4),(62,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',4),(63,'COLOMBIA','RED DE DATOS LAN','Disponibilidad',4),(64,'COLOMBIA','RED DE DATOS LAN','Oportunidad en la resolución de incidentes prioridad alta (4 horas)_x000D_  (4 horas)',4),(65,'COLOMBIA','RED DE DATOS LAN','Oportunidad en la resolución de incidentes prioridad baja (10 horas)',4),(66,'COLOMBIA','RED DE DATOS LAN','Oportunidad en la resolución de incidentes prioridad crítica ( 2 horas)',4),(67,'COLOMBIA','RED DE DATOS LAN','Oportunidad en la resolución de incidentes prioridad media (6 horas)',4),(68,'COLOMBIA','RED DE DATOS LAN','Oportunidad en la resolución de requerimientos',4),(69,'COLOMBIA','RED DE DATOS WIRELESS LAN','Oportunidad en la resolución de incidentes prioridad alta (4 horas)_x000D_  (4 horas)',4),(70,'COLOMBIA','RED DE DATOS WIRELESS LAN','Oportunidad en la resolución de incidentes prioridad baja (10 horas)',4),(71,'COLOMBIA','RED DE DATOS WIRELESS LAN','Oportunidad en la resolución de incidentes prioridad crítica ( 2 horas)',4),(72,'COLOMBIA','RED DE DATOS WIRELESS LAN','Oportunidad en la resolución de incidentes prioridad media (6 horas)',4),(73,'COLOMBIA','RED DE DATOS WIRELESS LAN','Oportunidad en la resolución de requerimientos',4),(74,'COLOMBIA','SEGURIDAD','Disponibilidad',4),(75,'COLOMBIA','SEGURIDAD','Oportunidad en la resolución de incidentes prioridad alta (4 horas)_x000D_  (4 horas)',4),(76,'COLOMBIA','SEGURIDAD','Oportunidad en la resolución de incidentes prioridad baja (10 horas)',4),(77,'COLOMBIA','SEGURIDAD','Oportunidad en la resolución de incidentes prioridad crítica ( 2 horas)',4),(78,'COLOMBIA','SEGURIDAD','Oportunidad en la resolución de incidentes prioridad media (6 horas)',4),(79,'COLOMBIA','SEGURIDAD','Oportunidad en la resolución de requerimientos',4),(80,'COLOMBIA','% Solución SLA','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',5),(81,'COLOMBIA','Cumplimiento de Incidentes','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',5),(82,'COLOMBIA','Cumplimiento de Requerimientos','Oportunidad en la solución de requerimientos, dentro de los tiempos establecidos por prioridad',5),(83,'COLOMBIA','Cumplimiento Incidentes Telecomunicaciones','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',5),(84,'COLOMBIA','Cumplimiento Incidentes Telefonía','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',5),(85,'COLOMBIA','Disponibilidad del servicio','Oportunidad en la disponibilidad de los servicios contratados',5),(86,'COLOMBIA','Incident Rate','Oportunidad en la cantidad de Incidentes generados vs la cantidad de servicios contratados',5),(87,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',5),(88,'COLOMBIA','MTTR','Oportunidad en el tiempo medio de resolución incidentes',5),(89,'COLOMBIA','Nivel de Eficiencia','Oportunidad en la respuesta de las llamadas ofrecidas (abandonos)',5),(90,'COLOMBIA','Nivel de Servicio','Oportunidad en el tiempo de respuesta en las llamadas entrantes (Contestadas antes de 20 Segundos)',5),(91,'COLOMBIA','Recurrencia','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por cualquier causa',5),(92,'COLOMBIA','Reincidencia','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',5),(93,'COLOMBIA','Reincidencia R 2 3','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',5),(94,'COLOMBIA','Reincidencia R 2 3 4','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',5),(95,'COLOMBIA','Solución primer contacto','Oportunidad en la solución de Incidentes en el primer contacto, su tiempo de solución es menor a 60 Minutos',5),(96,'COLOMBIA','Ticket vs Servicio','Oportunidad en la cantidad de Incidentes generados vs la cantidad de servicios contratados',5),(97,'COLOMBIA','TMO','Oportunidad en el tiempo medio de operación sobre las llamadas atendidas',5),(98,'COLOMBIA','COMUNICACIONES UNIFICADAS - ORO','Disponibilidad',6),(99,'COLOMBIA','COMUNICACIONES UNIFICADAS - ORO','INCIDENTES',6),(100,'COLOMBIA','COMUNICACIONES UNIFICADAS - ORO','INTERRUPCIONES',6),(101,'COLOMBIA','COMUNICACIONES UNIFICADAS - ORO','REQUERIMIENTOS',6),(102,'COLOMBIA','ENLACES - BRONCE','Disponibilidad',6),(103,'COLOMBIA','ENLACES - BRONCE','INCIDENTES',6),(104,'COLOMBIA','ENLACES - BRONCE','INTERRUPCIONES',6),(105,'COLOMBIA','ENLACES - BRONCE','REQUERIMIENTOS',6),(106,'COLOMBIA','ENLACES - ORO','Disponibilidad',6),(107,'COLOMBIA','ENLACES - ORO','INCIDENTES',6),(108,'COLOMBIA','ENLACES - ORO','INTERRUPCIONES',6),(109,'COLOMBIA','ENLACES - ORO','REQUERIMIENTOS',6),(110,'COLOMBIA','ENLACES - PLATA','Disponibilidad',6),(111,'COLOMBIA','ENLACES - PLATA','INCIDENTES',6),(112,'COLOMBIA','ENLACES - PLATA','INTERRUPCIONES',6),(113,'COLOMBIA','ENLACES - PLATA','REQUERIMIENTOS',6),(114,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',6),(115,'COLOMBIA','LAN - BRONCE','Disponibilidad',6),(116,'COLOMBIA','LAN - BRONCE','INCIDENTES',6),(117,'COLOMBIA','LAN - BRONCE','INTERRUPCIONES',6),(118,'COLOMBIA','LAN - BRONCE','REQUERIMIENTOS',6),(119,'COLOMBIA','LAN - PLATA','Disponibilidad',6),(120,'COLOMBIA','LAN - PLATA','INCIDENTES',6),(121,'COLOMBIA','LAN - PLATA','INTERRUPCIONES',6),(122,'COLOMBIA','LAN - PLATA','REQUERIMIENTOS',6),(123,'COLOMBIA','RADIO 2 VIAS - ORO','Disponibilidad',6),(124,'COLOMBIA','RADIO 2 VIAS - ORO','INCIDENTES',6),(125,'COLOMBIA','RADIO 2 VIAS - ORO','INTERRUPCIONES',6),(126,'COLOMBIA','RADIO 2 VIAS - ORO','REQUERIMIENTOS',6),(127,'COLOMBIA','REDES Y SEGURIDAD - BRONCE','INCIDENTES',6),(128,'COLOMBIA','REDES Y SEGURIDAD - BRONCE','INTERRUPCIONES',6),(129,'COLOMBIA','REDES Y SEGURIDAD - BRONCE','REQUERIMIENTOS',6),(130,'COLOMBIA','REDES Y SEGURIDAD - ORO','INCIDENTES',6),(131,'COLOMBIA','REDES Y SEGURIDAD - ORO','INTERRUPCIONES',6),(132,'COLOMBIA','REDES Y SEGURIDAD - ORO','REQUERIMIENTOS',6),(133,'COLOMBIA','REDES Y SEGURIDAD - PLATA','INCIDENTES',6),(134,'COLOMBIA','REDES Y SEGURIDAD - PLATA','INTERRUPCIONES',6),(135,'COLOMBIA','REDES Y SEGURIDAD - PLATA','REQUERIMIENTOS',6),(136,'COLOMBIA','TORRETAS - ORO','Disponibilidad',6),(137,'COLOMBIA','TORRETAS - ORO','INCIDENTES',6),(138,'COLOMBIA','TORRETAS - ORO','INTERRUPCIONES',6),(139,'COLOMBIA','TORRETAS - ORO','REQUERIMIENTOS',6),(140,'COLOMBIA','ALFAGRES','Gestion de Eventos',7),(141,'COLOMBIA','BANCOLOMBIA','Gestion de Eventos',7),(142,'COLOMBIA','EAFIT','Gestion de Eventos',7),(143,'COLOMBIA','ÉXITO','Proactividad',7),(144,'COLOMBIA','ITS','Gestion de Eventos',7),(145,'COLOMBIA','POLICIA NACIONAL','Gestion de Eventos',7),(146,'COLOMBIA','% Solución SLA','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',8),(147,'COLOMBIA','Cumplimiento de Incidentes','Oportunidad en la solución de incidentes, dentro de los tiempos establecidos por prioridad',8),(148,'COLOMBIA','Cumplimiento de Requerimientos','Oportunidad en la solución de requerimientos, dentro de los tiempos establecidos por prioridad',8),(149,'COLOMBIA','Disponibilidad del servicio','Oportunidad en la disponibilidad de los servicios contratados',8),(150,'COLOMBIA','Incident Rate','Oportunidad en la cantidad de Incidentes generados vs la cantidad de servicios contratados',8),(151,'COLOMBIA','INTERNO ITS','Satisfaccion total cliente',8),(152,'COLOMBIA','MTTR','Oportunidad en el tiempo medio de resolución incidentes',8),(153,'COLOMBIA','Nivel de Eficiencia','Oportunidad en la respuesta de las llamadas ofrecidas (abandonos)',8),(154,'COLOMBIA','Nivel de Servicio','Oportunidad en el tiempo de respuesta en las llamadas entrantes (Contestadas antes de 20 Segundos)',8),(155,'COLOMBIA','Proactividad','Oportunidad en la cantidad de incidentes generados proactivamente (sin ser notificados por el usuario final)',8),(156,'COLOMBIA','Recurrencia','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por cualquier causa',8),(157,'COLOMBIA','Reincidencia','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',8),(158,'COLOMBIA','Reincidencia R 2 3','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',8),(159,'COLOMBIA','Reincidencia R 2 3 4','Oportunidad en la cantidad de incidentes generados sobre un mismo enlace por la misma causa',8),(160,'COLOMBIA','Solución primer contacto','Oportunidad en la solución de Incidentes en el primer contacto, su tiempo de solución es menor a 60 Minutos',8),(161,'COLOMBIA','Ticket vs Servicio','Oportunidad en la cantidad de Incidentes generados vs la cantidad de servicios contratados',8),(162,'COLOMBIA','TMO','Oportunidad en el tiempo medio de operación sobre las llamadas atendidas',8),(163,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','AVAILABLE 24 HOURS A DAY, 7 DAYS A WEEK. MONDAY – FRIDAY 9 AM- 6 PM ( 24X7 ON CALL AVAILABILITY)',12),(164,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','FOLLOW HUAWEI PRODUCT TROUBLESHOOTING PROCEDURE AND GET THREE APPROVAL (TECHNICAL, PROJECT MANAGER AND CUSTOMER’S APPROVAL) BEFORE IMPLEMENTING ANY OPERATION IN CUSTOMER’S SYSTEM.',12),(165,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','HANDLING PROBLEMS ON THE SITE',12),(166,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','NO COMPLAIN FROM CUSTOMER.',12),(167,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','ON-SITE HARDWARE REPLACEMENT.',12),(168,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','OTHER NECESSARY ACTIVITY ON THE SITE',12),(169,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','RESOLUTION IMPLEMENTATION ON THE SITE',12),(170,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','RESPOND TIME IS CALCULATED FROM THE TIME WHEN THE ISSUE IS REPORTED TO ASP.TAC WILL BE THE INTERFACE.',12),(171,'GUATEMALA','INGENIEROS NIVEL N2 (IP) EN SITIO','RESPOND WITHIN 30 MINUTES AND ARRIVE SITE WITHIN 4 HOURS. TAC WILL BE THE INTERFACE.',12),(172,'GUATEMALA','SOPORTE FIJO','DIAGNOSTICO - TIEMPO PROMEDIO DE DISAGNOSTICO',13),(173,'GUATEMALA','SOPORTE FIJO','GOS - PORCENTAJE DE LLAMADAS ATENDIDAS ANTES DE 12 SEGUNDOS',13),(174,'GUATEMALA','SOPORTE FIJO','MTTR (HRS) - TIEMPO PROMEDIO DE RESOLUCION DE INCIDENTES',13),(175,'GUATEMALA','SOPORTE FIJO','NOTA DE EVALUACION DE CONOCIMIENTOS PROMEDIO MENSUAL',13),(176,'GUATEMALA','SOPORTE FIJO','NOTA DE MEDICION DE QA DE MANEJO DE TICKET',13),(177,'GUATEMALA','SOPORTE FIJO','PORCENTAJE DE ABANDONO DE LLAMADAS',13),(178,'GUATEMALA','SOPORTE FIJO','PORCENTAJE DE CASOS FUERA DE SLA ESCALADOS JERARQUICAMENTE',13),(179,'GUATEMALA','SOPORTE FIJO','PORCENTAJE DE RESOLUCIÓN DE TICKET DENTRO DEL AREA',13),(180,'GUATEMALA','SOPORTE FIJO','PORCENTAJE DE RESOLUCIONES DENTRO DEL SLA',13),(181,'GUATEMALA','SOPORTE VAS','DIAGNOSTICO - TIEMPO PROMEDIO DE DISAGNOSTICO',13),(182,'GUATEMALA','SOPORTE VAS','GOS - PORCENTAJE DE LLAMADAS ATENDIDAS ANTES DE 12 SEGUNDOS',13),(183,'GUATEMALA','SOPORTE VAS','MTTR (HRS) - TIEMPO PROMEDIO DE RESOLUCION DE INCIDENTES',13),(184,'GUATEMALA','SOPORTE VAS','PORCENTAJE DE ABANDONO DE LLAMADAS',13),(185,'GUATEMALA','SOPORTE VAS','PORCENTAJE DE RESOLUCIÓN DE TICKET DENTRO DEL AREA',13),(186,'GUATEMALA','SOPORTE SERVICIOS VOZ','DIAGNOSTICO - TIEMPO PROMEDIO DE DISAGNOSTICO',14),(187,'GUATEMALA','SOPORTE SERVICIOS VOZ','GOS - PORCENTAJE DE LLAMADAS ATENDIDAS ANTES DE 12 SEGUNDOS',14),(188,'GUATEMALA','SOPORTE SERVICIOS VOZ','MTTR (HRS) - TIEMPO PROMEDIO DE RESOLUCION DE INCIDENTES',14),(189,'GUATEMALA','SOPORTE SERVICIOS VOZ','PORCENTAJE DE ABANDONO DE LLAMADAS',14),(190,'GUATEMALA','SOPORTE SERVICIOS VOZ','PORCENTAJE DE RESOLUCIÓN DE TICKET DENTRO DEL AREA',14),(191,'COSTA RICA','MESA DE SERVICIO','APERTURA DE CASOS',15),(192,'COSTA RICA','MESA DE SERVICIO','MANTENIMIENTO PREVENTIVO',15),(193,'COSTA RICA','MESA DE SERVICIO','MONITOREO',15),(194,'COSTA RICA','MESA DE SERVICIO','SOPORTE N2',15),(195,'COSTA RICA','MONITOREO','MONITOREO Y  SEGUIMIENTO DE INCIDENTES RED PRIMARIA TIGO.',16),(196,'COSTA RICA','MESA DE SERVICIO','ATENCIÓN DE TTK OFIMÁTICA',17),(197,'COSTA RICA','MESA DE SERVICIO','APERTURA DE CASOS',18),(198,'COSTA RICA','MESA DE SERVICIO','DIAGNSOTICO N2',18),(199,'COSTA RICA','MESA DE SERVICIO','MONITOREO',18),(200,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','AVAILABLE 24 HOURS A DAY, 7 DAYS A WEEK. MONDAY – FRIDAY 9 AM- 6 PM ( 24X7 ON CALL AVAILABILITY)',12),(201,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','FOLLOW HUAWEI PRODUCT TROUBLESHOOTING PROCEDURE AND GET THREE APPROVAL (TECHNICAL, PROJECT MANAGER AND CUSTOMER’S APPROVAL) BEFORE IMPLEMENTING ANY OPERATION IN CUSTOMER’S SYSTEM.',12),(202,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','HANDLING PROBLEMS ON THE SITE',12),(203,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','NO COMPLAIN FROM CUSTOMER.',12),(204,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','ON-SITE HARDWARE REPLACEMENT.',12),(205,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','OTHER NECESSARY ACTIVITY ON THE SITE',12),(206,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','RESOLUTION IMPLEMENTATION ON THE SITE',12),(207,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','RESPOND TIME IS CALCULATED FROM THE TIME WHEN THE ISSUE IS REPORTED TO ASP.TAC WILL BE THE INTERFACE.',12),(208,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','RESPOND WITHIN 30 MINUTES AND ARRIVE SITE WITHIN 4 HOURS. TAC WILL BE THE INTERFACE.',12),(209,'COLOMBIA','SDWAN/WLAN','',3),(210,'COLOMBIA','CONECTIVIDAD LAN/WLAN','',1),(211,'COLOMBIA','INFRAESTRUCTURA','',1),(212,'COLOMBIA','COLABORACION','',2),(213,'COLOMBIA','DC/NODOS','',2),(214,'COLOMBIA','E2E','',2),(215,'COLOMBIA','IP MANAGER','',2),(216,'COLOMBIA','LAN/WLAN','',2),(217,'COLOMBIA','MESA DE SOPORTE','',2),(218,'COLOMBIA','TETRATION','',2),(219,'COLOMBIA','COMUNICACIONES OPERATIVAS Y TRANSMISIÓN','',4),(220,'COLOMBIA','COMUNICACIONES UNIFICADAS','',4),(221,'COLOMBIA','LAN/WLAN/WAN','',4),(222,'COLOMBIA','SEGURIDAD E INTERNET','',4),(223,'COLOMBIA','SDWAN, IWAN, WLAN, LAN y UC','',5),(224,'COLOMBIA','Telefonía','',5),(225,'COLOMBIA','CENIT','',6),(226,'COLOMBIA','OCENSA','',6),(227,'COLOMBIA','ODL','',6),(228,'COLOMBIA','ALFAGRES','',7),(229,'COLOMBIA','BANCOLOMBIA','',7),(230,'COLOMBIA','EAFIT','',7),(231,'COLOMBIA','ECOPETROL','',7),(232,'COLOMBIA','ÉXITO','',7),(233,'COLOMBIA','ITS','',7),(234,'COLOMBIA','POLICIA NACIONAL','',7),(235,'COLOMBIA','SDWAN, IWAN, WLAN, LAN y UC','',8),(236,'GUATEMALA','INGENIEROS NIVEL N2 (IP)','',12),(237,'GUATEMALA','RFO','',13),(238,'GUATEMALA','SOPORTE FIJO','',13),(239,'GUATEMALA','SOPORTE VAS','',13),(240,'GUATEMALA','SOPORTE SERVICIOS VOZ','',14),(241,'COSTA RICA','ENLACE PUNTO A PUNTO','',15),(242,'COSTA RICA','MONITOREO Y SEGUIMIENTO DE TTK','',16),(243,'COSTA RICA','ATENCIÓN DE TTK OFIMÁTICA','',17),(244,'COSTA RICA','VICAL SERVICIO DATA CENTER','',18),(245,'EL SALVADOR','INGENIEROS NIVEL N2 (TI) EN SITIO','',12);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `permisos` varchar(20) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `formularios` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'NATALIA IBARRA','sibarra@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(2,'JEIMY GALINDO','jgalindo@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(3,'VIVIANA RUALES','vruales@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(4,'DIEGO PAZ','dpaz@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(5,'NESTOR PAEZ','npaez@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(6,'PABLO ESTEVEZ','pestevez@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(7,'ESTEBAN VELEZ','evelez@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(8,'ELKIN GARAVITO','egaravito@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(9,'HOLMAN MORALES','hmorales@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(10,'SARAH DURANGO','sdurango@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(11,'TANIA ORTEGA','tortega@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(12,'ANDREA GARAY','agaray@itsinfocom.com','PMO','rw','COLOMBIA','TODOS'),(13,'SANDRA PARRA','sparra02@itsinfocom.com','ANALISTA','rw','COLOMBIA','TODOS'),(14,'WILSON GARCIA','wgarcia01@itsinfocom.com','ANALISTA','rw','COLOMBIA','TODOS'),(15,'MARLON CARMONA','mcarmona@itsinfocom.com','ANALISTA','rw','COLOMBIA','TODOS'),(16,'FELIPE SANCHEZ','hsanchez@itsinfocom.com','GERENTE','r','COLOMBIA','TODOS'),(17,'DIEGO VENEGAS','dvenegas01@itsinfocom.com','ANALISTA','rw','COLOMBIA','TODOS'),(18,'KEVIN RAMOS','kramos@itsinfocom.com','PMO','rw','GUATEMALA','TODOS'),(19,'RAFAEL GARCIA','rgarcia@itsinfocom.com','PMO','rw','COSTA RICA','TODOS'),(20,'JORGE QUIROS','jquiros@itsinfocom.com','PMO','rw','COSTA RICA','TODOS'),(21,'JORDY SENTIS','jsentis@itsinfocom.com','PMO','rw','COSTA RICA,GUATEMALA,EL SALVADOR','TODOS'),(22,'Andres Felipe Rodriguez Martinez','arodriguez12@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(23,'Cristian Roger Ballesteros Rosero','cballesteros01@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(24,'Maycon Alfredo Acosta Murcia','macosta@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(25,'Sandra Janeth Clavijo Suarez','sclavijo01@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(26,'Fabian Velasquez Botero','fvelasquez@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(27,'Sebastian Anderson Ramirez','sanderson01@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(28,'William Yunel Cáceres Jaimes','wcaceres@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(29,'Diego Alejandro Ortiz Rodriguez','dortiz02@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(30,'Jesús Eduardo Barrios Contreras','ebarrios@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(35,'Juan Ricardo Acevedo Hincapie','jacevedo01@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(36,'Roberto Rafael Lopez Marquez','rlopez04@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(37,'Wanderley Garcia Ocampo','wgarcia@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(38,'Bryan Steven Barragan Muñoz','bbarragan@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(39,'Diego Alexander Suarez Barrera','dsuarez@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(40,'Juan Camilo Gallego Pineda','jgallego@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(41,'Robinson Giraldo Naranjo','rgiraldo@itsinfocom.com','ANALISTA','rw','COLOMBIA','TODOS'),(42,'Santiago Lopez Aristizabal','slopez04@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(43,'Jose Humberto Duque Castiblanco','jduque@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(44,'Manuel Guillermo Orjuela Castañeda','morjuela@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(45,'Rafael Ernesto Cala Arias','rcala@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(46,'Jhon Leandro Torres Aguilar','jtorres06@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(47,'Andrés Felipe Barón Monroy','abaron@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion'),(48,'Santiago Aldana Gómez','saldana@itsinfocom.com','OCUPACION','rw','COLOMBIA','Ocupacion');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_proyecto`
--

DROP TABLE IF EXISTS `usuarios_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_proyecto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuarios_id` int NOT NULL,
  `proyectos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_proyecto_usuarios_id_proyectos_id_7caa2ba5_uniq` (`usuarios_id`,`proyectos_id`),
  KEY `usuarios_proyecto_proyectos_id_b4adecd2_fk_proyectos_id` (`proyectos_id`),
  CONSTRAINT `usuarios_proyecto_proyectos_id_b4adecd2_fk_proyectos_id` FOREIGN KEY (`proyectos_id`) REFERENCES `proyectos` (`id`),
  CONSTRAINT `usuarios_proyecto_usuarios_id_709a8c53_fk_usuarios_id` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_proyecto`
--

LOCK TABLES `usuarios_proyecto` WRITE;
/*!40000 ALTER TABLE `usuarios_proyecto` DISABLE KEYS */;
INSERT INTO `usuarios_proyecto` VALUES (1,1,20),(2,2,20),(3,3,20),(4,4,20),(5,5,20),(6,6,20),(8,7,5),(7,7,8),(9,8,1),(10,9,3),(11,9,4),(12,10,2),(13,11,6),(14,12,7),(15,13,20),(16,14,20),(17,15,20),(18,16,20),(19,17,20),(20,18,13),(21,18,14),(22,19,18),(23,20,15),(27,21,12),(24,21,16),(25,21,17),(26,21,19),(28,22,10),(29,23,10),(30,24,10),(31,25,10),(32,26,10),(33,27,10),(34,28,10),(35,29,10),(36,30,10),(41,35,10),(42,36,10),(43,37,10),(44,38,10),(45,39,10),(46,40,10),(60,41,20),(48,42,10),(49,43,10),(50,44,10),(51,45,10),(52,46,10),(53,47,10),(54,48,10);
/*!40000 ALTER TABLE `usuarios_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumetrias`
--

DROP TABLE IF EXISTS `volumetrias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumetrias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(20) NOT NULL,
  `servicio` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `registrados` int DEFAULT NULL,
  `cerrados` int DEFAULT NULL,
  `backlog` int DEFAULT NULL,
  `backlog_y_registrados` int DEFAULT NULL,
  `eficiencia` decimal(12,2) DEFAULT NULL,
  `periodo_id` varchar(20) DEFAULT NULL,
  `proyecto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volumetrias_periodo_id_9715c9f3_fk_periodos_periodo` (`periodo_id`),
  KEY `volumetrias_proyecto_id_ceb55d1c_fk_proyectos_id` (`proyecto_id`),
  CONSTRAINT `volumetrias_periodo_id_9715c9f3_fk_periodos_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`periodo`),
  CONSTRAINT `volumetrias_proyecto_id_ceb55d1c_fk_proyectos_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumetrias`
--

LOCK TABLES `volumetrias` WRITE;
/*!40000 ALTER TABLE `volumetrias` DISABLE KEYS */;
INSERT INTO `volumetrias` VALUES (1,'COLOMBIA','ENLACES - PLATA','INCIDENTE',12,12,1,NULL,NULL,'ENE -- 2020',6),(2,'COLOMBIA','ENLACES - PLATA','INCIDENTE',2,2,2,3,66.67,'FEB -- 2020',6);
/*!40000 ALTER TABLE `volumetrias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 14:06:30
