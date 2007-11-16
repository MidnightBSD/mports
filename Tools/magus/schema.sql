-- MySQL dump 10.11
--
-- Host: localhost    Database: magus
-- ------------------------------------------------------
-- Server version	5.0.45

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `category` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB;

--
-- Table structure for table `depends`
--

DROP TABLE IF EXISTS `depends`;
CREATE TABLE `depends` (
  `port` int(11) NOT NULL,
  `dependency` int(11) NOT NULL,
  KEY `port` (`port`),
  KEY `dependency` (`dependency`)
) ENGINE=InnoDB;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
CREATE TABLE `locks` (
  `id` int(11) NOT NULL auto_increment,
  `port` int(11) NOT NULL,
  `machine` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `port` (`port`)
) ENGINE=InnoDB;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `result` int(11) NOT NULL,
  `phase` varchar(32) NOT NULL,
  `data` text,
  UNIQUE KEY `result` (`result`,`phase`)
) ENGINE=InnoDB;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
CREATE TABLE `machines` (
  `id` int(11) NOT NULL auto_increment,
  `arch` varchar(12) NOT NULL,
  `name` varchar(128) NOT NULL,
  `maintainer` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

--
-- Table structure for table `port_categories`
--

DROP TABLE IF EXISTS `port_categories`;
CREATE TABLE `port_categories` (
  `port` varchar(128) NOT NULL,
  `category` int(11) NOT NULL,
  KEY `port` (`port`),
  KEY `category` (`category`)
) ENGINE=InnoDB;

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
CREATE TABLE `ports` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `arch` varchar(8) NOT NULL,
  `version` varchar(32) default NULL,
  `description` text,
  `license` varchar(16) default NULL,
  `pkgname` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `archname` (`name`,`arch`),
  KEY `name` (`name`)
) ENGINE=InnoDB;

--
-- Temporary table structure for view `ready_ports`
--

DROP TABLE IF EXISTS `ready_ports`;
/*!50001 DROP VIEW IF EXISTS `ready_ports`*/;
/*!50001 CREATE TABLE `ready_ports` (
  `id` int(11),
  `name` varchar(128),
  `arch` varchar(8),
  `version` varchar(32),
  `description` text,
  `license` varchar(16),
  `pkgname` varchar(128)
) */;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(11) NOT NULL auto_increment,
  `port` int(11) NOT NULL,
  `version` varchar(32) NOT NULL,
  `summary` varchar(32) NOT NULL,
  `machine` int(11) NOT NULL,
  `snap` int(11) NOT NULL,
  `osversion` varchar(64) NOT NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `port` (`port`,`version`),
  KEY `summary` (`summary`)
) ENGINE=InnoDB;

--
-- Table structure for table `snaps`
--

DROP TABLE IF EXISTS `snaps`;
CREATE TABLE `snaps` (
  `id` int(11) NOT NULL auto_increment,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

--
-- Table structure for table `subresults`
--

DROP TABLE IF EXISTS `subresults`;
CREATE TABLE `subresults` (
  `id` int(11) NOT NULL auto_increment,
  `result` int(11) NOT NULL,
  `phase` varchar(16) NOT NULL,
  `type` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `msg` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

--
-- Final view structure for view `ready_ports`
--

/*!50001 DROP TABLE IF EXISTS `ready_ports`*/;
/*!50001 DROP VIEW IF EXISTS `ready_ports`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ready_ports` AS select `ports`.`id` AS `id`,`ports`.`name` AS `name`,`ports`.`arch` AS `arch`,`ports`.`version` AS `version`,`ports`.`description` AS `description`,`ports`.`license` AS `license`,`ports`.`pkgname` AS `pkgname` from `ports` where ((not(`ports`.`id` in (select `locks`.`port` AS `port` from `locks`))) and (not(`ports`.`id` in (select `results`.`port` AS `port` from `results` where (`results`.`version` = `ports`.`version`)))) and ((not(`ports`.`id` in (select `depends`.`port` AS `port` from `depends`))) or (not(`ports`.`id` in (select `depends`.`port` AS `port` from `depends` where ((not(`depends`.`dependency` in (select `results`.`port` AS `port` from (`results` join `ports` on(((`ports`.`id` = `results`.`port`) and (`ports`.`version` = `results`.`version`)))) where ((`results`.`summary` = _latin1'pass') or (`results`.`summary` = _latin1'fail'))))) or `depends`.`dependency` in (select `locks`.`port` AS `port` from `locks`))))))) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-11-16  6:12:14
