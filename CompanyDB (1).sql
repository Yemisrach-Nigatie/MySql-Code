CREATE DATABASE  IF NOT EXISTS `CompanyDB` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CompanyDB`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: CompanyDB
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPARTMENT` (
  `dept_name` varchar(20) DEFAULT NULL,
  `dept_number` int NOT NULL AUTO_INCREMENT,
  `manager_sin` varchar(20) DEFAULT NULL,
  `manager_start_date` date DEFAULT NULL,
  PRIMARY KEY (`dept_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `DEPARTMENT` VALUES ('Headquarters',1,'333445555','1990-06-19'),('Marketing',2,'453453453','2000-05-22'),('Finance',3,'808080808','2021-02-02'),('Administration',4,'453453453','2010-01-01'),('Research',5,'808080808','2017-06-12'),('Sales',6,'707070707','2020-08-01');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

DROP TABLE IF EXISTS `DEPENDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPENDENT` (
  `depend_sin` varchar(20) NOT NULL DEFAULT '99',
  `depend_name` varchar(20) DEFAULT NULL,
  `depend_gender` char(1) DEFAULT NULL,
  `depend_birth_date` date DEFAULT NULL,
  `depend_relationship` varchar(20) DEFAULT NULL,
  `emp_sin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`depend_sin`),
  KEY `fk_dependent_enp_sin_idx` (`emp_sin`),
  CONSTRAINT `fk_dependent_enp_sin` FOREIGN KEY (`emp_sin`) REFERENCES `EMPLOYEE` (`emp_sin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENT`
--

LOCK TABLES `DEPENDENT` WRITE;
/*!40000 ALTER TABLE `DEPENDENT` DISABLE KEYS */;
INSERT INTO `DEPENDENT` VALUES ('123456789','Alice','F','2019-12-30','Daughter','987987987'),('124445555','Joy','F','2013-05-03','Spouse','987987987'),('127654321','Jennifer','F','2014-01-04','Daughter','987987987'),('321456789','John','M','2014-02-28','Son','987987987'),('332344432','Theodore','M','2012-10-25','Son','121231234'),('333445555','Alice','F','2014-04-05','Daughter','666884444'),('453453453','Joyce','F','2011-04-05','Daughter','666884444'),('645343423','John','M','2021-04-01','Son','888665575'),('987654321','Andrew','M','2010-01-04','Son','453453453'),('987656789','Elizabeth','F','2015-05-05','Spouse','453453453'),('987987987','Nabil','M','2010-08-05','Son','123456789');
/*!40000 ALTER TABLE `DEPENDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPTLOCATION`
--

DROP TABLE IF EXISTS `DEPTLOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPTLOCATION` (
  `dept_location` varchar(20) DEFAULT NULL,
  `dept_number` int NOT NULL,
  KEY `fk_deptlocation_dept_number` (`dept_number`),
  CONSTRAINT `fk_deptlocation_dept_number` FOREIGN KEY (`dept_number`) REFERENCES `DEPARTMENT` (`dept_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPTLOCATION`
--

LOCK TABLES `DEPTLOCATION` WRITE;
/*!40000 ALTER TABLE `DEPTLOCATION` DISABLE KEYS */;
INSERT INTO `DEPTLOCATION` VALUES ('East York',1),('North York',2),('Edmonton',3),('Montréal',4),('Toronto',5),('Toronto',6);
/*!40000 ALTER TABLE `DEPTLOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `emp_first_name` varchar(20) DEFAULT NULL,
  `emp_last_name` varchar(20) DEFAULT NULL,
  `emp_sin` varchar(20) NOT NULL,
  `emp_birth_date` date DEFAULT NULL,
  `emp_address` varchar(80) DEFAULT NULL,
  `emp_gender` char(1) DEFAULT NULL,
  `emp_salary` float DEFAULT NULL,
  `manager_sin` varchar(20) DEFAULT NULL,
  `dept_number` int DEFAULT NULL,
  PRIMARY KEY (`emp_sin`),
  KEY `fk_emp_dept_number_idx` (`dept_number`),
  CONSTRAINT `fk_emp_dept_number` FOREIGN KEY (`dept_number`) REFERENCES `DEPARTMENT` (`dept_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('Susan','Westerberg','121231234','1960-01-01','124 Eglinton Ave W, Toronto, ON','F',75000,NULL,1),('Jack','English','123456789','1965-01-09','1455 Boulevard de Maisonneuve O, Montréal, QC','M',30000,'808080808',2),('Amarantha','Enrique','234563433','2000-05-05','99 University Ave, Kingston, ON','F',40000,NULL,3),('Frank','Wong','333445555','1955-12-08','350 Victoria St, Toronto, ON','M',42000,'888665575',2),('Joanne','English','453453453','1972-07-31','85 Ave, Edmonton, AB','F',25000,'333445555',2),('Rakesh','Narayan','666884444','1980-09-15','1430 Trafalgar Rd, Oakville, ON','M',38000,'987987987',2),('Melinda','Jones','808080808','1970-07-10','4700 Keele St, Toronto, ON','F',27500,'123456789',2),('John','Baines','888665575','1947-11-10','2900 Edouard Montpetit Blvd, Montréal, QC','M',60000,'123456789',1),('Janine','Wallace','987654321','1941-06-20','45 Sherbrooke St W, Montréal, QC','F',49000,'888665575',4),('Ahmad','Jabbar','987987987','1969-03-29','99 University Ave, Kingston, ON','M',33000,'999887777',4),('Amelia','English','999887777','1968-01-19','7 King\'s College Cir, Toronto, ON','F',26000,'987654321',4);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT` (
  `prj_name` varchar(20) DEFAULT NULL,
  `prj_number` int NOT NULL,
  `prj_location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`prj_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES ('ProductX',100,'Edmonton'),('ProductY',200,'Edmonton'),('ProductZ',300,'Montréal'),('Computerization',400,'Stafford'),('Reorganization',500,'Toronto'),('Newbenefits',600,'Stafford'),('ProjectW',700,'Toronto'),('Virtualization',800,'Montréal');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKSON`
--

DROP TABLE IF EXISTS `WORKSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKSON` (
  `emp_sin` varchar(20) NOT NULL,
  `prj_number` int NOT NULL,
  `working_hours` float(3,1) NOT NULL,
  PRIMARY KEY (`emp_sin`,`prj_number`,`working_hours`),
  KEY `fk_workson_prj_number_idx` (`prj_number`),
  CONSTRAINT `fk_workson_emp_sin` FOREIGN KEY (`emp_sin`) REFERENCES `EMPLOYEE` (`emp_sin`),
  CONSTRAINT `fk_workson_prj_number` FOREIGN KEY (`prj_number`) REFERENCES `PROJECT` (`prj_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKSON`
--

LOCK TABLES `WORKSON` WRITE;
/*!40000 ALTER TABLE `WORKSON` DISABLE KEYS */;
INSERT INTO `WORKSON` VALUES ('123456789',100,32.0),('987987987',100,20.0),('999887777',100,10.0),('987654321',200,12.0),('987987987',200,18.0),('999887777',200,10.0),('333445555',300,15.0),('333445555',400,10.0),('453453453',400,10.0),('808080808',400,35.0),('123456789',500,20.0),('453453453',500,12.0),('808080808',500,15.0),('987987987',500,15.0),('123456789',600,5.0),('453453453',600,32.5),('808080808',600,32.5),('999887777',600,32.5),('453453453',700,5.0);
/*!40000 ALTER TABLE `WORKSON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'CompanyDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-29 12:33:40
