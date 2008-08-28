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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `depends`
--

DROP TABLE IF EXISTS `depends`;
CREATE TABLE `depends` (
  `port` int(11) NOT NULL,
  `dependency` int(11) NOT NULL,
  KEY `port` (`port`),
  KEY `dependency` (`dependency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `port` int(11) NOT NULL,
  `phase` varchar(16) NOT NULL,
  `type` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `msg` text,
  `machine` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `port` (`port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL auto_increment,
  `port` int(11) NOT NULL,
  `data` longtext,
  PRIMARY KEY  (`id`),
  UNIQUE KEY (`port`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
CREATE TABLE `machines` (
  `id` int(11) NOT NULL auto_increment,
  `arch` varchar(12) NOT NULL,
  `name` varchar(128) NOT NULL,
  `maintainer` varchar(128) NOT NULL,
  `osversion` varchar(16) NOT NULL,
  `run` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `port_categories`
--

DROP TABLE IF EXISTS `port_categories`;
CREATE TABLE `port_categories` (
  `port` varchar(128) NOT NULL,
  `category` int(11) NOT NULL,
  KEY `port` (`port`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
CREATE TABLE `ports` (
  `id` int(11) NOT NULL auto_increment,
  `run` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `pkgname` varchar(128) NOT NULL,
  `version` varchar(32) NOT NULL,
  `description` text,
  `license` varchar(16) default NULL,
  `www` text,
  `status` varchar(32) NOT NULL default 'untested',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `run` (`run`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Temporary table structure for view `ready_ports`
--

DROP TABLE IF EXISTS `ready_ports`;
/*!50001 DROP VIEW IF EXISTS `ready_ports`*/;
/*!50001 CREATE TABLE `ready_ports` (
  `id` int(11),
  `run` int(11),
  `name` varchar(128),
  `pkgname` varchar(128),
  `version` varchar(32),
  `description` text,
  `license` varchar(16),
  `www` text,
  `status` varchar(32),
  `updated` timestamp,
  `priority` bigint(21)
) */;

--
-- Table structure for table `runs`
--

DROP TABLE IF EXISTS `runs`;
CREATE TABLE `runs` (
  `id` int(11) NOT NULL auto_increment,
  `osversion` varchar(16) NOT NULL,
  `arch` varchar(11) NOT NULL,
  `status` varchar(40) NOT NULL default 'inactive',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Final view structure for view `ready_ports`
--

/*!50001 DROP TABLE IF EXISTS `ready_ports`*/;
/*!50001 DROP VIEW IF EXISTS `ready_ports`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ready_ports` AS select `ports`.`id` AS `id`,`ports`.`run` AS `run`,`ports`.`name` AS `name`,`ports`.`pkgname` AS `pkgname`,`ports`.`version` AS `version`,`ports`.`description` AS `description`,`ports`.`license` AS `license`,`ports`.`www` AS `www`,`ports`.`status` AS `status`,`ports`.`updated` AS `updated`,(select count(0) AS `COUNT(*)` from `depends` where (`depends`.`dependency` = `ports`.`id`)) AS `priority` from `ports` where ((`ports`.`status` = _latin1'untested') and (not(`ports`.`id` in (select `locks`.`port` AS `port` from `locks` where (`locks`.`port` = `ports`.`id`)))) and ((not(`ports`.`id` in (select `depends`.`port` AS `port` from `depends` where (`depends`.`port` = `ports`.`id`)))) or (not(`ports`.`id` in (select `depends`.`port` AS `port` from `depends` where (((`depends`.`port` = `ports`.`id`) and (not(`depends`.`dependency` in (select `depends`.`port` AS `port` from `ports` where ((`ports`.`id` = `depends`.`dependency`) and ((`ports`.`status` = _latin1'pass') or (`ports`.`status` = _latin1'warn'))))))) or `depends`.`dependency` in (select `locks`.`port` AS `port` from `locks` where (`locks`.`port` = `depends`.`dependency`)))))))) order by (select count(0) AS `COUNT(*)` from `depends` where (`depends`.`dependency` = `ports`.`id`)) desc */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-12-19 23:11:23
