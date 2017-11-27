CREATE DATABASE  IF NOT EXISTS `hotel_management_system` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hotel_management_system`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: hotel_management_system
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `active_reservations`
--

DROP TABLE IF EXISTS `active_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_reservations` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `status` varchar(45) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`res_id`),
  KEY `cus_idx` (`c_id`),
  KEY `rm_idx` (`room`),
  CONSTRAINT `cus` FOREIGN KEY (`c_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `rm` FOREIGN KEY (`room`) REFERENCES `rooms` (`room_no`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_reservations`
--

LOCK TABLES `active_reservations` WRITE;
/*!40000 ALTER TABLE `active_reservations` DISABLE KEYS */;
INSERT INTO `active_reservations` VALUES (19,3,101,'2017-11-26','2017-11-30','Active',200),(20,4,102,'2017-11-26','2017-11-29','Active',200),(21,5,110,'2017-11-27','2017-12-05','Future',200),(23,6,104,'2017-11-26','2017-11-29','Active',200);
/*!40000 ALTER TABLE `active_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `address1` text NOT NULL,
  `address2` text,
  `phone` varchar(15) NOT NULL,
  `country` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'Lionel','Messi','Rosario',NULL,'9222222229','Argentina','1987-06-29'),(4,'Cristiano','Ronaldo','Marida',NULL,'7770007770','Portugal','1984-10-12'),(5,'Wayne ','Rooney','Liverpool','1102','7001001111','England','1985-08-19'),(6,'Andres','Iniesta','Girona','A978','9876540101','Spain','1983-11-09'),(7,'Kevin','DeBruyne','MolenBeek',NULL,'8787678678','Belgium','1991-11-11'),(9,'Pep','Guardiola','La Masia','Barcelona','9566660987','Spain','1986-04-08'),(10,'KondaBabu','Parvathala','Konaseema','Pathacheruvu','7720736666','India','1904-04-30'),(11,'Thomas','Muller','Munich','Allianz Arena','909090909','Germany','1990-05-05'),(12,'Chimpiri','Chengappa','3431A','21st avenue west','7134108291','United States','1940-03-03'),(13,'Donald','Trump','Trump Towers','New York','9876878977','United States','1949-05-16'),(14,'Kuffar','Mohammed','Fake Jannat','Virgin Point 72','3233233237','Saudi Arabia','1988-10-10');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_report`
--

DROP TABLE IF EXISTS `daily_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rent_total` double NOT NULL,
  `order_total` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_report`
--

LOCK TABLES `daily_report` WRITE;
/*!40000 ALTER TABLE `daily_report` DISABLE KEYS */;
INSERT INTO `daily_report` VALUES (5,'2017-11-27 02:08:00',600,777,1377);
/*!40000 ALTER TABLE `daily_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Sticky Chicken Wings','Appetizer',15,'Deeply Fried Gameday Snack baked with gojuchang, korean red pepper sauce'),(2,'Crab Cakes','Appetizer',10,'Classic Crab cakes with tangy horseradish cream'),(3,'Deviled Eggs with Country Ham','Appetizer',7,'European flavor from goat cheese, Dijon mustard and cornichons, plus a topping of country ham'),(4,'Pimento Cheese and Bacon Crostini','Appetizer',7,'Adobe Dishes!'),(5,'Cocktail Meatballs','Appetizer',8,'Delicious Meatballs Southern style!'),(6,'ApplePie','Dessert',7,'ApplePie'),(7,'Cheese Cake','Dessert',6,'Cheese Cake!'),(8,'Ice Cream','Dessert',8,'Choose Any Flavor!'),(9,'Carrot Cake','Dessert',10,'Carrot Cake'),(10,'Key Lime Pie','Dessert',11,'Tasty dish in the traditional Florida Keys Style!'),(11,'Chicken Biryani','Maincourse',15,'Flavored Steamed Rice in Hyderabadi style!'),(12,'Mutton Biryani','Maincourse',18,'Flavored Steamed Rice in Hyderabadi style!'),(13,'Prawn Biryani','Maincourse',17,'Flavored Steamed Rice in Hyderabadi style!'),(14,'Fish Biryani','Maincourse',16,'Flavored Steamed Rice in Hyderabadi style!'),(15,'Mixed NonVeg Biryani','Maincourse',20,'Flavored Steamed Rice in Hyderabadi style with 7 different kinds of meat!'),(16,'Albino White Wine','Beverages',12,'Famous Swedish Wine!'),(17,'Soft Drinks','Beverages',3,'Choose any popular soft drink brand!'),(18,'Beers','Beverages',3,'Choose your favourite beer!'),(20,'Fruit Juices','Beverages',5,'Freshly made fruit juice!'),(21,'Milk Shakes','Beverages',5,'Choose your Favorite Flavor!'),(22,'Chilli Chicken','Appetizer',5,'Spicy Chicken pieces with Indian Chilli!');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) NOT NULL,
  `i_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq` (`o_id`,`i_id`) USING BTREE,
  KEY `ord_idx` (`o_id`),
  CONSTRAINT `ord` FOREIGN KEY (`o_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (51,34,10,1,11),(52,34,11,2,30),(53,34,12,1,18),(54,34,13,1,17),(55,34,14,1,16),(56,34,15,1,20),(57,34,18,15,45),(58,35,5,5,40),(59,35,8,3,24),(60,35,12,2,36),(61,35,16,1,12),(62,35,17,5,15),(63,36,1,3,45),(64,36,2,3,30),(65,36,3,4,28),(66,36,5,3,24),(67,36,7,2,12),(68,36,6,2,14),(69,37,22,5,25),(70,37,21,5,25),(71,37,20,15,75),(72,37,18,14,42),(73,37,17,10,30),(74,37,14,1,16),(75,37,13,1,17),(76,38,1,1,15),(77,38,5,1,8),(78,38,6,1,7),(79,38,7,1,6),(80,38,8,1,8),(81,38,12,1,18),(82,38,11,1,15),(83,38,18,11,33);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) NOT NULL,
  `total` double NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `res_idx` (`res_id`),
  CONSTRAINT `res` FOREIGN KEY (`res_id`) REFERENCES `active_reservations` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (34,19,157,'2017-11-26 19:11:40'),(35,20,127,'2017-11-26 19:12:47'),(36,19,153,'2017-11-26 21:11:08'),(37,20,230,'2017-11-26 21:12:00'),(38,23,110,'2017-11-26 22:53:53');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `past_reservations`
--

DROP TABLE IF EXISTS `past_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `past_reservations` (
  `res_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `past_reservations`
--

LOCK TABLES `past_reservations` WRITE;
/*!40000 ALTER TABLE `past_reservations` DISABLE KEYS */;
INSERT INTO `past_reservations` VALUES (1,3,103,'2017-11-09','2017-11-13','Checked Out',800),(2,4,105,'2017-11-08','2017-11-16','Checked Out',1520),(3,5,107,'2017-11-09','2017-11-12','Checked Out',600),(4,6,109,'2017-11-08','2017-11-18','Checked Out',2000),(5,7,110,'2017-11-11','2017-11-18','Checked Out',200),(6,3,102,'2017-11-17','2017-11-20','Checked Out',600),(7,5,106,'2017-11-14','2017-11-18','Checked Out',800),(8,7,110,'2017-11-16','2017-11-22','Checked Out',1200),(10,11,104,'2017-11-22','2017-11-25','Checked Out',857),(12,3,101,'2017-11-22','2017-11-24','Checked Out',400),(13,5,102,'2017-11-22','2017-11-25','Checked Out',651),(14,4,103,'2017-11-21','2017-11-23','Checked Out',400),(16,9,108,'2017-11-20','2017-11-23','Checked Out',736);
/*!40000 ALTER TABLE `past_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `room_no` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (101,'Vacant',200),(102,'Vacant',200),(103,'Vacant',200),(104,'Vacant',200),(105,'Vacant',200),(106,'Vacant',200),(107,'Vacant',200),(108,'Vacant',200),(109,'Vacant',200),(110,'Vacant',200);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Yash','Nemani','nemaniyh','nemaniyh','admin'),(2,'yashwanth','nemani','enduser','enduser','user'),(5,'Nick','Offerman','nickof','nickof','admin'),(6,'Jon','Hamm','DDraper','DDraper','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hotel_management_system'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Delete UnChecked Reservations` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`yash`@`localhost`*/ /*!50106 EVENT `Delete UnChecked Reservations` ON SCHEDULE EVERY 1 DAY STARTS '2017-11-23 23:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	
		-- Delete unchecked reservations
		delete from active_reservations where start<curdate() and status='Future';
	    
		-- update reservations past end dates
		update active_reservations set status='Important' where end<curdate();
		
	    
	END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `Delete Unchecked Reservations new` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`yash`@`localhost`*/ /*!50106 EVENT `Delete Unchecked Reservations new` ON SCHEDULE EVERY 1 DAY STARTS '2017-11-23 23:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	
		-- Delete unchecked reservations
		delete from active_reservations where start<curdate() and status='Future';
	    
		-- update reservations past end dates
		update active_reservations set status='Important' where end<curdate();
		
	    
	END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `generate_daily_reports` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`yash`@`localhost`*/ /*!50106 EVENT `generate_daily_reports` ON SCHEDULE EVERY 1 DAY STARTS '2017-11-27 00:15:00' ON COMPLETION NOT PRESERVE ENABLE DO call new_procedure() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'hotel_management_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`yash`@`localhost` PROCEDURE `new_procedure`()
BEGIN
declare rent_total double default 0;
declare order_total double default 0;
declare totals double default 0;
select sum(total) into order_total from orders 
where (select date(date_time))= SUBDATE(CURDATE(), INTERVAL 1 DAY);
if (order_total is null) then
set order_total = 0;
end if;
select sum(rate) into rent_total from active_reservations where status='active';
set totals = order_total+rent_total;
insert into daily_report(rent_total, order_total, total) values(rent_total,order_total,totals);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-27 10:40:58
