CREATE DATABASE  IF NOT EXISTS `databasename`;
USE `databasename`;


DROP TABLE IF EXISTS `city_dim`;

CREATE TABLE `city_dim` (
  `CITY_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY_NAME` varchar(255) NOT NULL,
  `TIMEZONE` int(11) NOT NULL,
  `LAT` float NOT NULL,
  `LON` float NOT NULL,
  PRIMARY KEY (`CITY_ID`)
);

INSERT INTO `city_dim` VALUES (1581130,'Hanoi','VN',25200,21.0245,105.841),(1609350,'Bangkok','TH',25200,13.75,100.517),(1835848,'Seoul','KR',32400,37.5683,126.978),(1850144,'Tokyo','JP',32400,35.6895,139.692),(2643123,'Manchester','GB',3600,53.4809,-2.2374),(2988507,'Paris','FR',7200,48.8534,2.3488),(2997438,'London','FR',7200,46.6327,5.0982),(4517009,'London','US',-14400,39.8865,-83.4483);

DROP TABLE IF EXISTS `status_dim`;
CREATE TABLE `status_dim` (
  `STATUS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `ICON` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  PRIMARY KEY (`STATUS_ID`)
);

INSERT INTO `status_dim` VALUES (1,'Clouds','04d','overcast clouds'),(2,'Clouds','04d','overcast clouds'),(3,'Clouds','04d','overcast clouds'),(4,'Clouds','04d','overcast clouds'),(5,'Clouds','04d','overcast clouds'),(6,'Clouds','04n','overcast clouds'),(7,'Clouds','04d','overcast clouds'),(8,'Clouds','04d','broken clouds'),(9,'Clear','01d','clear sky'),(10,'Clear','01d','clear sky'),(11,'Rain','10d','light rain'),(12,'Rain','10d','moderate rain'),(13,'Rain','10d','moderate rain'),(14,'Clouds','04d','overcast clouds'),(15,'Clouds','04d','overcast clouds'),(16,'Clear','01d','clear sky'),(17,'Rain','10d','light rain'),(18,'Clouds','04d','overcast clouds'),(19,'Clouds','04n','overcast clouds'),(20,'Clouds','04d','broken clouds'),(21,'Rain','10d','light rain'),(22,'Clouds','04n','overcast clouds'),(23,'Clouds','04d','broken clouds'),(24,'Clouds','03n','scattered clouds'),(25,'Clouds','04n','overcast clouds'),(26,'Clouds','04d','overcast clouds'),(27,'Clouds','04d','broken clouds'),(28,'Clouds','03n','scattered clouds'),(29,'Clouds','04n','overcast clouds'),(30,'Clouds','04d','overcast clouds'),(31,'Clouds','04d','overcast clouds'),(32,'Clouds','04d','overcast clouds'),(33,'Clouds','04d','overcast clouds'),(34,'Clouds','03d','scattered clouds'),(35,'Clouds','04d','overcast clouds'),(36,'Clouds','04d','overcast clouds'),(37,'Clouds','04d','overcast clouds'),(38,'Clouds','03d','scattered clouds'),(39,'Clouds','04d','overcast clouds'),(40,'Clouds','04d','overcast clouds'),(41,'Clouds','04d','overcast clouds'),(42,'Clouds','04d','overcast clouds'),(43,'Clouds','04d','overcast clouds'),(44,'Clouds','04d','overcast clouds'),(45,'Clouds','04d','overcast clouds'),(46,'Clouds','04d','overcast clouds'),(47,'Clouds','04d','overcast clouds'),(48,'Clouds','04d','overcast clouds'),(49,'Clouds','04d','overcast clouds'),(50,'Rain','10n','light rain'),(51,'Rain','10n','light rain'),(52,'Rain','10n','light rain'),(53,'Clouds','04n','overcast clouds'),(54,'Rain','10n','light rain'),(55,'Rain','10n','light rain'),(56,'Rain','10n','light rain'),(57,'Rain','10n','light rain'),(58,'Rain','10n','light rain'),(59,'Rain','10n','light rain'),(60,'Clouds','04n','overcast clouds'),(61,'Clouds','04n','overcast clouds'),(62,'Clouds','04n','overcast clouds'),(63,'Clouds','04n','overcast clouds'),(64,'Clouds','04n','overcast clouds'),(65,'Clouds','04n','overcast clouds'),(66,'Rain','10d','moderate rain'),(67,'Rain','10d','moderate rain'),(68,'Rain','10d','moderate rain'),(69,'Rain','10d','moderate rain'),(70,'Rain','10d','moderate rain'),(71,'Rain','10d','moderate rain'),(72,'Rain','10d','moderate rain'),(73,'Rain','10d','heavy intensity rain'),(74,'Rain','10d','heavy intensity rain'),(75,'Rain','10d','heavy intensity rain'),(76,'Rain','10d','heavy intensity rain'),(77,'Rain','10d','heavy intensity rain'),(78,'Rain','10d','heavy intensity rain'),(79,'Rain','10d','heavy intensity rain'),(80,'Rain','10d','heavy intensity rain'),(81,'Rain','10d','heavy intensity rain'),(82,'Rain','10d','heavy intensity rain'),(83,'Rain','10d','light rain'),(84,'Rain','10d','light rain'),(85,'Rain','10d','light rain'),(86,'Rain','10d','light rain'),(87,'Rain','10d','moderate rain'),(88,'Rain','10d','moderate rain'),(89,'Rain','10d','light rain'),(90,'Rain','10d','light rain'),(91,'Clouds','03d','scattered clouds'),(92,'Clouds','03d','scattered clouds'),(93,'Rain','10d','light rain'),(94,'Rain','10d','moderate rain'),(95,'Rain','10d','moderate rain'),(96,'Clouds','03d','scattered clouds'),(97,'Clouds','03d','scattered clouds'),(98,'Rain','10n','light rain'),(99,'Rain','10d','moderate rain'),(100,'Clouds','03d','scattered clouds'),(101,'Clouds','03d','scattered clouds'),(102,'Rain','10d','light rain'),(103,'Rain','10d','moderate rain'),(104,'Clouds','03d','scattered clouds'),(105,'Rain','10n','light rain'),(106,'Rain','10n','light rain'),(107,'Rain','10n','light rain'),(108,'Rain','10n','light rain'),(109,'Rain','10n','light rain'),(110,'Rain','10n','light rain'),(111,'Clouds','03d','scattered clouds'),(112,'Clouds','04d','broken clouds'),(113,'Rain','10n','moderate rain'),(114,'Rain','10n','light rain'),(115,'Clouds','03d','scattered clouds'),(116,'Clouds','04d','broken clouds'),(117,'Rain','10n','moderate rain'),(118,'Rain','10n','light rain'),(119,'Clouds','03d','scattered clouds'),(120,'Clouds','04d','broken clouds'),(121,'Rain','10n','moderate rain'),(122,'Rain','10n','light rain'),(123,'Rain','10n','light rain');


DROP TABLE IF EXISTS `weather_fact`;

CREATE TABLE `weather_fact` (
  `CITY_ID` int(11) NOT NULL,
  `STATUS_ID` int(11) NOT NULL,
  `DT` datetime NOT NULL,
  `TEMP` float NOT NULL,
  `REAL_TEMP` float NOT NULL,
  `TEMP_MIN` float NOT NULL,
  `TEMP_MAX` float NOT NULL,
  `PRESSURE` float DEFAULT '0',
  `HUMIDITY` float DEFAULT '0',
  `SEA_LEVEL` float DEFAULT '0',
  `GRND_LEVEL` float DEFAULT '0',
  `VISIBILITY` float DEFAULT '0',
  `CLOUD` float DEFAULT '0',
  `RAIN` float DEFAULT '0',
  `WIND_SPEED` float DEFAULT '0',
  `WIND_DEG` float DEFAULT '0',
  `WIND_GUST` float DEFAULT '0',
  `SUNRISE` datetime NOT NULL,
  `SUNSET` datetime NOT NULL,
  `CURRENT_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CITY_ID`,`STATUS_ID`),
  KEY `STATUS_ID` (`STATUS_ID`),
  CONSTRAINT `weather_fact_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city_dim` (`CITY_ID`),
  CONSTRAINT `weather_fact_ibfk_2` FOREIGN KEY (`STATUS_ID`) REFERENCES `status_dim` (`STATUS_ID`)
);
INSERT INTO `weather_fact` VALUES (1581130,7,'2022-05-26 15:59:50',33,40,33,33,998,62,998,996,10000,98,0,2.06,147,2.58,'2022-05-26 05:15:53','2022-05-26 18:31:43','N'),(1581130,18,'2022-05-26 16:46:26',33,40,33,33,998,69,998,996,10000,97,0,3.02,140,3.86,'2022-05-26 05:15:53','2022-05-26 18:31:43','N'),(1581130,22,'2022-05-26 20:26:22',29,35.64,29,29,1000,84,1000,998,10000,100,0,3.49,129,7.42,'2022-05-26 05:15:53','2022-05-26 18:31:43','N'),(1581130,26,'2022-05-27 08:36:34',27,29.46,27,27,1002,77,1002,1000,10000,88,0,2.38,105,2.75,'2022-05-27 05:15:41','2022-05-27 18:32:08','N'),(1581130,30,'2022-05-27 08:36:34',27,29.46,27,27,1002,77,1002,1000,10000,88,0,2.38,105,2.75,'2022-05-27 05:15:41','2022-05-27 18:32:08','N'),(1581130,31,'2022-05-27 12:50:23',31,35.1,31,31,998,61,998,997,10000,100,0,2.45,167,3.1,'2022-05-27 05:15:41','2022-05-27 18:32:08','N'),(1581130,32,'2022-05-27 14:01:25',31,34.36,31,31,997,58,997,996,10000,100,0,2.37,172,3.38,'2022-05-27 05:15:41','2022-05-27 18:32:08','N'),(1581130,36,'2022-05-27 14:29:13',32,36.48,32,32,997,58,997,996,10000,100,0,2.37,172,3.38,'2022-05-27 05:15:41','2022-05-27 18:32:08','N'),(1581130,40,'2022-05-27 14:29:13',32,36.48,32,32,997,58,997,996,10000,100,0,2.37,172,3.38,'2022-05-27 05:15:41','2022-05-27 18:32:08','N'),(1581130,93,'2022-05-28 18:29:51',30,36.56,30,30,998,76,998,997,10000,86,0.49,4.48,125,8.19,'2022-05-28 05:15:30','2022-05-28 18:32:34','N'),(1581130,98,'2022-05-28 18:37:40',30,37,30,30,999,85,999,998,10000,84,0.72,3.76,126,8.3,'2022-05-28 05:15:30','2022-05-28 18:32:34','N'),(1581130,102,'2022-05-28 18:29:51',30,36.56,30,30,998,76,998,997,10000,86,0.49,4.48,125,8.19,'2022-05-28 05:15:30','2022-05-28 18:32:34','N'),(1581130,113,'2022-05-28 18:58:20',30,37,30,30,999,83,999,998,10000,91,3.65,3.83,129,8.4,'2022-05-28 05:15:30','2022-05-28 18:32:34','N'),(1581130,117,'2022-05-28 18:58:20',30,37,30,30,999,83,999,998,10000,91,3.65,3.83,129,8.4,'2022-05-28 05:15:30','2022-05-28 18:32:34','N'),(1581130,121,'2022-05-28 18:58:20',30,37,30,30,999,83,999,998,10000,91,3.65,3.83,129,8.4,'2022-05-28 05:15:30','2022-05-28 18:32:34','Y'),(1609350,1,'2022-05-26 15:18:49',34.25,40.04,33.84,34.4,1004,53,1004,1003,10000,100,0,5.56,273,7.25,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,2,'2022-05-26 15:37:27',33.87,39.86,33.84,33.94,1003,55,1003,1002,10000,95,0,5.71,278,7.84,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,3,'2022-05-26 15:46:40',33.59,39.19,33.28,34.96,1003,55,1003,1002,10000,95,0,5.71,278,7.84,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,4,'2022-05-26 15:52:21',33.93,39.64,33.84,34.94,1003,54,1003,1002,10000,95,0,5.71,278,7.84,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,5,'2022-05-26 15:52:21',33.93,39.64,33.84,34.94,1003,54,1003,1002,10000,95,0,5.71,278,7.84,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,14,'2022-05-26 16:40:55',33.33,39.63,32.73,34.4,1003,58,1003,1002,10000,94,0,5.36,266,6.81,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,15,'2022-05-26 16:40:55',33.33,39.63,32.73,34.4,1003,58,1003,1002,10000,94,0,5.36,266,6.81,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,19,'2022-05-26 20:29:39',31.45,32.56,30.51,32.18,1005,46,1005,1004,10000,85,0,4.36,250,8.01,'2022-05-26 05:49:47','2022-05-26 18:40:25','N'),(1609350,23,'2022-05-27 08:36:33',30.4,36.03,29.94,31.63,1007,70,1007,1006,10000,55,0,5.23,264,7.65,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,27,'2022-05-27 08:36:33',30.4,36.03,29.94,31.63,1007,70,1007,1006,10000,55,0,5.23,264,7.65,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,33,'2022-05-27 14:29:12',34.29,39.76,33.94,35.52,1004,52,1004,1003,10000,100,0,7.42,290,10.59,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,37,'2022-05-27 14:29:12',34.29,39.76,33.94,35.52,1004,52,1004,1003,10000,100,0,7.42,290,10.59,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,41,'2022-05-27 14:44:54',34.02,39.13,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,42,'2022-05-27 14:47:17',34.02,39.13,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,43,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,44,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,45,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,46,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,47,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,48,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,49,'2022-05-27 15:18:51',34.08,39.27,32.72,34.95,1003,52,1003,1002,10000,100,0,6.91,285,9.88,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,50,'2022-05-27 19:49:31',30.51,37.44,27.16,32.18,1004,74,1004,1003,10000,99,0.18,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,51,'2022-05-27 19:49:31',30.51,37.44,27.16,32.18,1004,74,1004,1003,10000,99,0.18,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,52,'2022-05-27 19:49:52',30.51,37.44,27.16,32.18,1004,74,1004,1003,10000,99,0.18,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,53,'2022-05-27 20:12:34',30.43,37.43,27.16,32.18,1004,75,1004,1003,10000,99,0,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,54,'2022-05-27 20:22:50',30.16,36.74,28.94,31.63,1004,75,1004,1003,10000,99,0.14,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,55,'2022-05-27 20:22:50',30.16,36.74,28.94,31.63,1004,75,1004,1003,10000,99,0.14,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,56,'2022-05-27 20:22:50',30.16,36.74,28.94,31.63,1004,75,1004,1003,10000,99,0.14,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,57,'2022-05-27 20:22:50',30.16,36.74,28.94,31.63,1004,75,1004,1003,10000,99,0.14,3.81,278,6.21,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,58,'2022-05-27 20:39:08',30.11,36.87,28.94,31.63,1005,76,1005,1004,10000,100,0.15,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,59,'2022-05-27 20:39:08',30.11,36.87,28.94,31.63,1005,76,1005,1004,10000,100,0.15,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,60,'2022-05-27 20:51:33',29.85,36.41,28.94,31.63,1005,77,1005,1004,10000,100,0,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,61,'2022-05-27 20:49:19',29.85,36.41,28.94,31.63,1005,77,1005,1004,10000,100,0,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,62,'2022-05-27 20:49:19',29.85,36.41,28.94,31.63,1005,77,1005,1004,10000,100,0,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,63,'2022-05-27 20:51:33',29.85,36.41,28.94,31.63,1005,77,1005,1004,10000,100,0,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,64,'2022-05-27 20:51:33',29.85,36.41,28.94,31.63,1005,77,1005,1004,10000,100,0,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,65,'2022-05-27 20:51:33',29.85,36.41,28.94,31.63,1005,77,1005,1004,10000,100,0,3.98,267,7.73,'2022-05-27 05:49:41','2022-05-27 18:40:44','N'),(1609350,68,'2022-05-28 17:57:16',29.59,36.59,28.27,31.63,1002,85,1002,1001,10000,91,1.94,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,69,'2022-05-28 17:57:16',29.59,36.59,28.27,31.63,1002,85,1002,1001,10000,91,1.94,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,70,'2022-05-28 17:57:16',29.59,36.59,28.27,31.63,1002,85,1002,1001,10000,91,1.94,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,71,'2022-05-28 17:57:16',29.59,36.59,28.27,31.63,1002,85,1002,1001,10000,91,1.94,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,72,'2022-05-28 17:57:16',29.59,36.59,28.27,31.63,1002,85,1002,1001,10000,91,1.94,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,73,'2022-05-28 18:10:32',29.69,32.63,28.27,31.63,1002,62,1002,1001,10000,91,11.78,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,74,'2022-05-28 18:15:44',29.78,32.8,27.72,31.63,1002,62,1002,1001,10000,91,10.29,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,75,'2022-05-28 18:15:44',29.78,32.8,27.72,31.63,1002,62,1002,1001,10000,91,10.29,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,76,'2022-05-28 18:10:32',29.69,32.63,28.27,31.63,1002,62,1002,1001,10000,91,11.78,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,77,'2022-05-28 18:15:44',29.78,32.8,27.72,31.63,1002,62,1002,1001,10000,91,10.29,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,78,'2022-05-28 18:10:32',29.69,32.63,28.27,31.63,1002,62,1002,1001,10000,91,11.78,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,79,'2022-05-28 18:10:32',29.69,32.63,28.27,31.63,1002,62,1002,1001,10000,91,11.78,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,80,'2022-05-28 18:15:44',29.78,32.8,27.72,31.63,1002,62,1002,1001,10000,91,10.29,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,81,'2022-05-28 18:15:44',29.78,32.8,27.72,31.63,1002,62,1002,1001,10000,91,10.29,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,82,'2022-05-28 18:15:44',29.78,32.8,27.72,31.63,1002,62,1002,1001,10000,91,10.29,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,83,'2022-05-28 18:22:34',30.12,33.48,27.72,31.63,1002,62,1002,1001,10000,91,0.79,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,84,'2022-05-28 18:22:34',30.12,33.48,27.72,31.63,1002,62,1002,1001,10000,91,0.79,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,85,'2022-05-28 18:22:34',30.12,33.48,27.72,31.63,1002,62,1002,1001,10000,91,0.79,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,86,'2022-05-28 18:22:34',30.12,33.48,27.72,31.63,1002,62,1002,1001,10000,91,0.79,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,87,'2022-05-28 18:31:50',30.02,33.93,27.16,31.63,1004,65,1004,1002,10000,93,1.15,3.03,195,4.61,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,88,'2022-05-28 18:31:50',30.02,33.93,27.16,31.63,1004,65,1004,1002,10000,93,1.15,3.03,195,4.61,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,89,'2022-05-28 18:22:34',30.12,33.48,27.72,31.63,1002,62,1002,1001,10000,91,0.79,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,90,'2022-05-28 18:22:34',30.12,33.48,27.72,31.63,1002,62,1002,1001,10000,91,0.79,6.76,191,8.13,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,94,'2022-05-28 18:31:50',30.02,33.93,27.16,31.63,1004,65,1004,1002,10000,93,1.15,3.03,195,4.61,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,95,'2022-05-28 18:37:39',29.94,33.75,27.16,31.63,1004,65,1004,1002,10000,93,1.53,3.03,195,4.61,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,99,'2022-05-28 18:37:39',29.94,33.75,27.16,31.63,1004,65,1004,1002,10000,93,1.53,3.03,195,4.61,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,103,'2022-05-28 18:31:50',30.02,33.93,27.16,31.63,1004,65,1004,1002,10000,93,1.15,3.03,195,4.61,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,105,'2022-05-28 18:47:01',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.41,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,106,'2022-05-28 18:47:01',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.41,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,107,'2022-05-28 18:47:01',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.41,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,108,'2022-05-28 18:57:19',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.11,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,109,'2022-05-28 18:57:19',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.11,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,110,'2022-05-28 18:47:01',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.41,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,114,'2022-05-28 18:57:19',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.11,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,118,'2022-05-28 18:57:19',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.11,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,122,'2022-05-28 18:57:19',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.11,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','N'),(1609350,123,'2022-05-28 18:57:19',27.09,28.92,23.94,28.94,1004,69,1004,1002,10000,90,0.11,4.73,196,6.51,'2022-05-28 05:49:37','2022-05-28 18:41:02','Y'),(1835848,9,'2022-05-26 16:00:12',21.66,20.69,18.69,21.66,1002,31,1002,996,10000,1,0,7.33,233,12.85,'2022-05-26 03:15:37','2022-05-26 17:42:52','N'),(1835848,10,'2022-05-26 16:08:31',22.66,21.79,18.69,22.66,1002,31,1002,996,10000,1,0,7.33,233,12.85,'2022-05-26 03:15:37','2022-05-26 17:42:52','N'),(1850144,11,'2022-05-26 16:10:30',22.74,22.69,20.97,23.34,1009,62,0,0,10000,75,0.81,8.23,200,0,'2022-05-26 02:29:37','2022-05-26 16:47:09','N'),(2643123,12,'2022-05-26 16:14:36',13.59,13.35,12.64,15.04,1016,90,0,0,10000,100,1.78,4.63,210,0,'2022-05-26 10:53:18','2022-05-27 03:18:59','N'),(2643123,13,'2022-05-26 16:14:36',13.59,13.35,12.64,15.04,1016,90,0,0,10000,100,1.78,4.63,210,0,'2022-05-26 10:53:18','2022-05-27 03:18:59','N'),(2643123,17,'2022-05-26 16:46:26',14.19,14.04,13.08,16.03,1016,91,0,0,10000,100,0.32,6.69,230,0,'2022-05-26 10:53:18','2022-05-27 03:18:59','N'),(2643123,21,'2022-05-26 20:29:40',15.4,15.27,14.19,17.36,1016,87,0,0,10000,75,0.12,8.23,260,0,'2022-05-26 10:53:18','2022-05-27 03:18:59','N'),(2643123,25,'2022-05-27 08:36:33',10.58,9.5,9.53,11.66,1022,69,0,0,10000,100,0,5.66,270,0,'2022-05-27 10:52:08','2022-05-28 03:20:23','N'),(2643123,29,'2022-05-27 08:36:33',10.58,9.5,9.53,11.66,1022,69,0,0,10000,100,0,5.66,270,0,'2022-05-27 10:52:08','2022-05-28 03:20:23','N'),(2643123,35,'2022-05-27 14:29:13',11.54,10.6,10.21,12.91,1023,71,0,0,10000,100,0,5.66,270,0,'2022-05-27 10:52:08','2022-05-28 03:20:23','N'),(2643123,39,'2022-05-27 14:30:35',11.58,10.65,10.64,12.91,1023,71,0,0,10000,100,0,5.66,270,0,'2022-05-27 10:52:08','2022-05-28 03:20:23','N'),(2643123,92,'2022-05-28 18:33:29',16.27,15.34,14.52,16.99,1025,53,0,0,10000,47,0,1.34,345,1.79,'2022-05-28 10:51:01','2022-05-29 03:21:44','N'),(2643123,97,'2022-05-28 18:33:29',16.27,15.34,14.52,16.99,1025,53,0,0,10000,47,0,1.34,345,1.79,'2022-05-28 10:51:01','2022-05-29 03:21:44','N'),(2643123,101,'2022-05-28 18:37:50',16.4,15.45,14.71,17.21,1025,52,0,0,10000,47,0,1.34,345,1.79,'2022-05-28 10:51:01','2022-05-29 03:21:44','N'),(2643123,112,'2022-05-28 18:58:19',16.4,15.58,15.25,17.97,1026,57,1026,1019,10000,53,0,2.67,357,2.97,'2022-05-28 10:51:01','2022-05-29 03:21:44','N'),(2643123,116,'2022-05-28 18:58:19',16.4,15.58,15.25,17.97,1026,57,1026,1019,10000,53,0,2.67,357,2.97,'2022-05-28 10:51:01','2022-05-29 03:21:44','N'),(2643123,120,'2022-05-28 18:59:22',16.41,15.59,15.26,17.97,1026,57,1026,1019,10000,53,0,2.67,357,2.97,'2022-05-28 10:51:01','2022-05-29 03:21:44','Y'),(2988507,8,'2022-05-26 15:57:19',15.36,15.07,14.06,17.36,1025,81,0,0,10000,75,0,5.66,300,0,'2022-05-26 10:56:48','2022-05-27 02:38:47','N'),(2997438,16,'2022-05-26 16:46:26',21.13,20.53,20.46,21.14,1025,47,1025,1002,10000,2,0,1.34,11,3.58,'2022-05-26 10:54:34','2022-05-27 02:19:02','N'),(2997438,20,'2022-05-26 20:29:39',22.8,22.39,21.01,22.81,1024,48,1024,1001,10000,53,0,1.34,252,3.58,'2022-05-26 10:54:34','2022-05-27 02:19:02','N'),(2997438,24,'2022-05-27 08:36:33',10.59,9.79,10.59,11.82,1025,80,1025,1001,10000,34,0,1.55,338,2.08,'2022-05-27 10:53:45','2022-05-28 02:20:05','N'),(2997438,28,'2022-05-27 08:36:33',10.59,9.79,10.59,11.82,1025,80,1025,1001,10000,34,0,1.55,338,2.08,'2022-05-27 10:53:45','2022-05-28 02:20:05','N'),(2997438,34,'2022-05-27 14:29:12',14.47,14.3,14.47,16.82,1025,89,1025,1002,10000,45,0,1.94,345,3.12,'2022-05-27 10:53:45','2022-05-28 02:20:05','N'),(2997438,38,'2022-05-27 14:29:12',14.47,14.3,14.47,16.82,1025,89,1025,1002,10000,45,0,1.94,345,3.12,'2022-05-27 10:53:45','2022-05-28 02:20:05','N'),(2997438,91,'2022-05-28 18:33:28',20.59,19.83,20.59,21.26,1017,43,1017,994,10000,25,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','N'),(2997438,96,'2022-05-28 18:33:28',20.59,19.83,20.59,21.26,1017,43,1017,994,10000,25,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','N'),(2997438,100,'2022-05-28 18:33:28',20.59,19.83,20.59,21.26,1017,43,1017,994,10000,25,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','N'),(2997438,104,'2022-05-28 18:33:28',20.59,19.83,20.59,21.26,1017,43,1017,994,10000,25,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','N'),(2997438,111,'2022-05-28 18:58:19',20.59,19.83,20.59,21.26,1018,43,1018,994,10000,41,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','N'),(2997438,115,'2022-05-28 18:58:19',20.59,19.83,20.59,21.26,1018,43,1018,994,10000,41,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','N'),(2997438,119,'2022-05-28 18:58:19',20.59,19.83,20.59,21.26,1018,43,1018,994,10000,41,0,2.68,51,5.81,'2022-05-28 10:52:58','2022-05-29 02:21:06','Y'),(4517009,6,'2022-05-26 16:00:25',19.19,19.49,18.37,20.73,1015,89,0,0,10000,100,0,4.12,170,0,'2022-05-26 17:10:36','2022-05-27 07:51:25','N');