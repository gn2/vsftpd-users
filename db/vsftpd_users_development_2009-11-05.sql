# Sequel Pro dump
# Version 1191
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.38)
# Database: vsftpd_users_development
# Generation Time: 2009-11-05 14:53:15 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ftpusers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ftpusers`;

CREATE TABLE `ftpusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

LOCK TABLES `ftpusers` WRITE;
/*!40000 ALTER TABLE `ftpusers` DISABLE KEYS */;
INSERT INTO `ftpusers` (`id`,`login`,`crypted_password`,`state`,`server_id`,`created_at`,`updated_at`,`deleted_at`,`group_id`,`password`)
VALUES
	(1,'new_login','7694f4a66316e53c8cdd9d9954bd611d','active',9,'2009-10-08 11:08:50','2009-10-13 14:58:46',NULL,4,NULL),
	(2,'super login2','343b1c4a3ea721b2d640fc8700db0f36','active',5,'2009-10-09 11:36:27','2009-10-16 11:44:18',NULL,2,NULL),
	(3,'htrdht','uuu','active',9,'2009-10-12 13:29:18','2009-10-12 13:29:18','2009-10-12 13:31:49',2,NULL),
	(4,'nouveau','827ccb0eea8a706c4c34a16891f84e7b','active',5,'2009-10-15 15:00:27','2009-10-15 15:00:27',NULL,2,NULL),
	(6,'erer','e10adc3949ba59abbe56e057f20f883e','inactive',4,'2009-10-19 15:25:31','2009-11-02 10:55:57',NULL,4,NULL),
	(7,'gfdhtd','e10adc3949ba59abbe56e057f20f883e','inactive',4,'2009-10-23 10:21:03','2009-10-30 16:19:41',NULL,2,NULL),
	(9,'gfdg','e10adc3949ba59abbe56e057f20f883e','active',5,'2009-10-23 12:14:40','2009-11-03 10:08:58',NULL,2,NULL),
	(10,'htry','cfcd208495d565ef66e7dff9f98764da','active',4,'2009-10-23 12:17:01','2009-10-23 12:17:01',NULL,2,NULL),
	(11,'dfgdfg','202cb962ac59075b964b07152d234b70','active',8,'2009-10-23 13:46:56','2009-10-23 13:46:56',NULL,2,NULL),
	(12,'1','128ecf542a35ac5270a87dc740918404','active',4,'2009-10-23 14:02:34','2009-10-30 14:41:31',NULL,4,NULL),
	(13,'newlog2','4297f44b13955235245b2497399d7a93','active',5,'2009-10-23 14:03:16','2009-10-30 15:14:57',NULL,2,NULL),
	(15,'21242','96e79218965eb72c92a549dd5a330112','active',9,'2009-10-30 13:08:04','2009-10-30 13:08:04','2009-10-30 13:08:37',4,NULL),
	(16,'2','e10adc3949ba59abbe56e057f20f883e','active',8,'2009-10-30 15:15:50','2009-11-03 11:08:02',NULL,7,NULL),
	(17,'testt','4297f44b13955235245b2497399d7a93','inactive',10,'2009-10-30 16:41:02','2009-10-30 16:49:48','2009-10-30 16:49:50',2,NULL),
	(18,'rerwrere','4693fbb215b8ca15a6900f0cfa164cdc','active',9,'2009-11-04 19:00:22','2009-11-04 19:00:22','2009-11-04 19:00:33',2,NULL),
	(19,'qqq','343b1c4a3ea721b2d640fc8700db0f36','active',8,'2009-11-04 19:00:49','2009-11-04 19:00:49',NULL,4,NULL),
	(20,'gfgfdgfgfd','9cafeef08db2dd477098a0293e71f90a','active',9,'2009-11-04 19:02:44','2009-11-04 19:02:44',NULL,4,NULL),
	(21,'gfdghdfgh','875f26fdb1cecf20ceb4ca028263dec6','active',5,'2009-11-04 19:03:21','2009-11-04 19:03:21',NULL,4,NULL),
	(22,'ggggg','9cafeef08db2dd477098a0293e71f90a','active',9,'2009-11-04 19:04:57','2009-11-04 19:04:57',NULL,7,NULL),
	(23,'rgtrgt',NULL,'active',8,'2009-11-04 19:05:38','2009-11-04 19:05:38',NULL,6,'vvvvvv'),
	(24,'hhydty',NULL,'active',8,'2009-11-04 19:06:17','2009-11-04 19:06:17',NULL,6,NULL),
	(25,'gfgfgfgd',NULL,'active',8,'2009-11-04 19:08:18','2009-11-04 19:08:18',NULL,4,NULL),
	(26,'gfdggdrsg',NULL,'active',8,'2009-11-04 19:08:55','2009-11-04 19:08:55',NULL,4,NULL);

/*!40000 ALTER TABLE `ftpusers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`,`name`,`description`,`deleted_at`,`created_at`,`updated_at`)
VALUES
	(1,'','','2009-10-07 15:54:13','2009-10-07 11:10:48','2009-10-07 11:10:48'),
	(2,'group 2','group 2 description bla',NULL,'2009-10-07 11:10:52','2009-10-19 15:27:54'),
	(3,'group 3','description of group 3','2009-10-07 15:52:00','2009-10-07 11:10:59','2009-10-07 11:38:52'),
	(4,'group 4','group 4 description',NULL,'2009-10-07 15:54:48','2009-10-07 15:54:48'),
	(5,'ttytyytu','uyttii','2009-10-19 13:36:32','2009-10-19 13:36:27','2009-10-19 13:36:27'),
	(6,'new group','rttrtr',NULL,'2009-10-22 13:32:26','2009-10-22 13:32:26'),
	(7,'gfdgfdgfdh','dfghfdgfdsghfdg',NULL,'2009-10-30 17:14:51','2009-10-30 17:14:51');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups_users`;

CREATE TABLE `groups_users` (
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` (`user_id`,`group_id`)
VALUES
	(3,6),
	(2,7);

/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`)
VALUES
	('20090325234046'),
	('20090331224841'),
	('20090402215040'),
	('20090530233356'),
	('20090530235522'),
	('20090602235707'),
	('20090603000255'),
	('20090603004324'),
	('20091021141935'),
	('20091023151313');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table servers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `servers`;

CREATE TABLE `servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` (`id`,`name`,`ip_address`,`description`,`created_at`,`updated_at`,`deleted_at`)
VALUES
	(1,'','','','2009-09-28 14:20:30','2009-09-28 14:20:30','2009-09-28 14:21:47'),
	(2,'','','','2009-09-28 14:22:18','2009-09-28 14:22:18','2009-09-28 14:44:48'),
	(3,'gfdgsfghs','123','desc','2009-09-28 14:29:58','2009-09-28 14:29:58','2009-09-30 14:55:20'),
	(4,'Test server','192.167.1.1','This server is great !','2009-09-30 14:57:03','2009-09-30 14:57:03',NULL),
	(5,'Create a new server','0.0.0.0','Test\r\n2 lines...','2009-09-30 16:23:49','2009-10-07 10:53:36',NULL),
	(6,'gwerhw','123.123.123.123','ghweh','2009-10-01 09:13:42','2009-10-01 09:13:42','2009-10-02 15:56:39'),
	(7,'gwerhw','123.123.123.123','ghweh','2009-10-01 09:14:29','2009-10-01 09:14:29','2009-10-02 15:56:34'),
	(8,'herluoi;iu','123.133.123.123','her\'oup\'opu','2009-10-01 09:16:19','2009-10-01 09:16:19',NULL),
	(9,'herher','233.12.12.13','kliuytl;yuo;','2009-10-01 09:17:22','2009-10-01 09:17:22',NULL),
	(10,'herher','233.12.12.13','kliuytl;yuo;','2009-10-01 09:18:11','2009-10-01 09:18:11',NULL),
	(11,'new server','123.123.45.10','jgfoig  teriotho ','2009-10-15 15:11:53','2009-10-15 15:11:53',NULL);

/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(255) DEFAULT NULL,
  `persistence_token` varchar(255) DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `last_request_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `perishable_token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`email`,`login`,`password_salt`,`crypted_password`,`persistence_token`,`login_count`,`last_request_at`,`last_login_at`,`current_login_at`,`last_login_ip`,`current_login_ip`,`state`,`company_id`,`created_at`,`updated_at`,`deleted_at`,`is_admin`,`perishable_token`)
VALUES
	(1,'Administrator','blah@qwerty.fr','admin','3Hi1u2nEcXS0HBQy2GCa','8467622944e758d321ca8026472a8d1e74d8f5861b8a345a9230be7f5814169d87769d387d8c47ae69b5f8b2c4a39a0495144466e41270d4a017d36cfcf0161c','2d3244033456ceaf6fa3b93f506c8ca47050a949144c087400c0b951bcff4d9318a16e4f1bc5af8fd79f959e71a7ac60c4676928ec6c20b678cf7199914226c6',99,'2009-11-04 19:08:55','2009-11-03 09:56:39','2009-11-03 11:27:48','127.0.0.1','127.0.0.1','active',101,'2009-09-25 10:24:31','2009-11-04 19:08:55',NULL,1,'UpFMEQgXp9TznDmFFc5u'),
	(2,'You Zeur','user@lamb.da','user','RBE4teqWOSqPKIDNuR7P','797864a8904c3fb72a781df15f9e9dbf666628e54a69e929ba47c63476b0f2a01b8f21f9a72d7da641dfd740ffc5b0455063553121bcb5125ffbab6525de663b','42b53674b1e27381e2d9ae3a2278d3de88e1fb4160bd841262c8fd76ebbd35a10b8d5b266edea7a948b45f1f9ca70494fb09058df6db0820c8a87601f00f95f0',50,'2009-11-03 11:27:43','2009-11-03 10:39:17','2009-11-03 10:41:36','127.0.0.1','127.0.0.1','active',103,'2009-10-02 16:02:36','2009-11-03 11:27:43',NULL,0,'lMK_0KCnASBJaiFF4j3K'),
	(3,'frkrt','gfgtg@gfdg.fr','ffgt','P7TLSNnmCrMFwp0TROgg','9cfb1f928a26391ebc054bd6b25b83b206b4b34d6c055edcf753e50381fb348be037aa90d567d68a24233f312a6a1c6584bcee0c6ebb21f39dba585f9d337a46','aaae507238e21450618c22ca7362ad7029d1d9ccaa9239d666954a6b648e302e538d0bd67346e1a77cb5f410491fec7bde45a37c0b45aafb3fadd98bd70bd90a',NULL,NULL,NULL,NULL,NULL,NULL,'active',NULL,'2009-10-20 15:22:58','2009-11-02 10:41:29',NULL,1,'CYs-898m2sdHy5_PtnfS');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
