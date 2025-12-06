-- MySQL dump for World Database
-- Database: world

CREATE DATABASE IF NOT EXISTS world;
USE world;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(35) NOT NULL DEFAULT '',
  `country_code` char(3) NOT NULL DEFAULT '',
  `district` char(20) NOT NULL DEFAULT '',
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `code` char(3) NOT NULL DEFAULT '',
  `name` char(52) NOT NULL DEFAULT '',
  `continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `region` char(26) NOT NULL DEFAULT '',
  `surface_area` float(10,2) NOT NULL DEFAULT '0.00',
  `independence_year` smallint(6) DEFAULT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  `life_expectancy` float(3,1) DEFAULT NULL,
  `gnp` float(10,2) DEFAULT NULL,
  `local_name` char(45) NOT NULL DEFAULT '',
  `government_form` char(45) NOT NULL DEFAULT '',
  `head_of_state` char(60) DEFAULT NULL,
  `capital` int(11) DEFAULT NULL,
  `code2` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `country_code` char(3) NOT NULL DEFAULT '',
  `language` char(30) NOT NULL DEFAULT '',
  `official` enum('T','F') NOT NULL DEFAULT 'F',
  `percentage` float(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`country_code`,`language`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sample data for table `countries`
--

INSERT INTO `countries` VALUES ('USA','United States','North America','North America',9363520.00,1776,278357000,77.1,8510700.00,'United States','Federal Republic','George W. Bush',3813,'US');
INSERT INTO `countries` VALUES ('CAN','Canada','North America','North America',9970610.00,1867,31147000,79.4,598862.00,'Canada','Constitutional Monarchy, Federation','Elizabeth II',1822,'CA');
INSERT INTO `countries` VALUES ('MEX','Mexico','North America','Central America',1958201.00,1810,98881000,71.5,414972.00,'México','Federal Republic','Vicente Fox Quesada',2515,'MX');
INSERT INTO `countries` VALUES ('GBR','United Kingdom','Europe','British Islands',242900.00,1066,59623400,77.7,1378330.00,'United Kingdom','Constitutional Monarchy','Elizabeth II',456,'GB');
INSERT INTO `countries` VALUES ('FRA','France','Europe','Western Europe',551500.00,843,59225700,78.8,1424285.00,'France','Republic','Jacques Chirac',2974,'FR');
INSERT INTO `countries` VALUES ('DEU','Germany','Europe','Western Europe',357022.00,1871,82164700,77.4,2133367.00,'Deutschland','Federal Republic','Johannes Rau',3068,'DE');
INSERT INTO `countries` VALUES ('JPN','Japan','Asia','Eastern Asia',377829.00,-660,126714000,80.7,3787042.00,'Nihon/Nippon','Constitutional Monarchy','Akihito',1532,'JP');
INSERT INTO `countries` VALUES ('CHN','China','Asia','Eastern Asia',9572900.00,-1523,1277558000,71.4,982268.00,'Zhongquo','People\'s Republic','Jiang Zemin',1891,'CN');
INSERT INTO `countries` VALUES ('IND','India','Asia','Southern and Central Asia',3287263.00,1947,1013662000,62.5,447114.00,'Bharat/India','Federal Republic','Kocheril Raman Narayanan',1109,'IN');
INSERT INTO `countries` VALUES ('BRA','Brazil','South America','South America',8547403.00,1822,170115000,62.9,776739.00,'Brasil','Federal Republic','Fernando Henrique Cardoso',211,'BR');
INSERT INTO `countries` VALUES ('AUS','Australia','Oceania','Australia and New Zealand',7741220.00,1901,18886000,79.8,351182.00,'Australia','Constitutional Monarchy, Federation','Elizabeth II',135,'AU');
INSERT INTO `countries` VALUES ('RUS','Russian Federation','Europe','Eastern Europe',17075400.00,1991,146934000,67.2,276608.00,'Rossija','Federal Republic','Vladimir Putin',3580,'RU');
INSERT INTO `countries` VALUES ('JAM','Jamaica','North America','Caribbean',10990.00,1962,2583000,75.2,6871.00,'Jamaica','Constitutional Monarchy','Elizabeth II',1530,'JM');

--
-- Sample data for table `cities`
--

INSERT INTO `cities` VALUES (1,'Kabul','AFG','Kabol',1780000);
INSERT INTO `cities` VALUES (2,'Qandahar','AFG','Qandahar',237500);
INSERT INTO `cities` VALUES (3,'Herat','AFG','Herat',186800);
INSERT INTO `cities` VALUES (56,'London','GBR','England',7285000);
INSERT INTO `cities` VALUES (130,'Sydney','AUS','New South Wales',3276207);
INSERT INTO `cities` VALUES (131,'Melbourne','AUS','Victoria',2865329);
INSERT INTO `cities` VALUES (135,'Canberra','AUS','Capital Region',322723);
INSERT INTO `cities` VALUES (206,'São Paulo','BRA','São Paulo',9968485);
INSERT INTO `cities` VALUES (207,'Rio de Janeiro','BRA','Rio de Janeiro',5598953);
INSERT INTO `cities` VALUES (211,'Brasília','BRA','Distrito Federal',1969868);
INSERT INTO `cities` VALUES (1024,'Mumbai (Bombay)','IND','Maharashtra',10500000);
INSERT INTO `cities` VALUES (1025,'Delhi','IND','Delhi',7206704);
INSERT INTO `cities` VALUES (1109,'New Delhi','IND','Delhi',301297);
INSERT INTO `cities` VALUES (1530,'Kingston','JAM','St. Andrew',103962);
INSERT INTO `cities` VALUES (1532,'Tokyo','JPN','Tokyo-to',7980230);
INSERT INTO `cities` VALUES (1533,'Jokohama [Yokohama]','JPN','Kanagawa',3339594);
INSERT INTO `cities` VALUES (1822,'Montréal','CAN','Québec',1016376);
INSERT INTO `cities` VALUES (1891,'Shanghai','CHN','Shanghai',9696300);
INSERT INTO `cities` VALUES (1892,'Peking','CHN','Peking',7472000);
INSERT INTO `cities` VALUES (2515,'Ciudad de México','MEX','Distrito Federal',8591309);
INSERT INTO `cities` VALUES (2974,'Paris','FRA','Île-de-France',2125246);
INSERT INTO `cities` VALUES (3068,'Berlin','DEU','Berliini',3386667);
INSERT INTO `cities` VALUES (3580,'Moscow','RUS','Moscow (City)',8389200);
INSERT INTO `cities` VALUES (3793,'New York','USA','New York',8008278);
INSERT INTO `cities` VALUES (3794,'Los Angeles','USA','California',3694820);
INSERT INTO `cities` VALUES (3795,'Chicago','USA','Illinois',2896016);
INSERT INTO `cities` VALUES (3813,'Washington','USA','District of Columbia',572059);
INSERT INTO `cities` VALUES (456,'London','GBR','England',7285000);

--
-- Sample data for table `languages`
--

INSERT INTO `languages` VALUES ('USA','English','T',86.2);
INSERT INTO `languages` VALUES ('USA','Spanish','F',7.5);
INSERT INTO `languages` VALUES ('CAN','English','T',60.4);
INSERT INTO `languages` VALUES ('CAN','French','T',23.4);
INSERT INTO `languages` VALUES ('MEX','Spanish','T',92.1);
INSERT INTO `languages` VALUES ('GBR','English','T',97.3);
INSERT INTO `languages` VALUES ('FRA','French','T',93.6);
INSERT INTO `languages` VALUES ('DEU','German','T',91.3);
INSERT INTO `languages` VALUES ('JPN','Japanese','T',99.1);
INSERT INTO `languages` VALUES ('CHN','Chinese','T',92.0);
INSERT INTO `languages` VALUES ('IND','Hindi','T',39.9);
INSERT INTO `languages` VALUES ('IND','English','T',2.0);
INSERT INTO `languages` VALUES ('BRA','Portuguese','T',97.5);
INSERT INTO `languages` VALUES ('AUS','English','T',81.2);
INSERT INTO `languages` VALUES ('RUS','Russian','T',86.6);
INSERT INTO `languages` VALUES ('JAM','English','T',90.0);
INSERT INTO `languages` VALUES ('JAM','Creole English','F',94.2);
