-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: InsuranceDB
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
-- Table structure for table `Client_Agents`
--
USE InsuranceDB;
DROP TABLE IF EXISTS `Client_Agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client_Agents` (
  `Agents_SIN` int NOT NULL,
  `HealthCardNo` varchar(12) NOT NULL,
  PRIMARY KEY (`Agents_SIN`,`HealthCardNo`),
  KEY `fk_Client_has_Insurance_Agents_Insurance_Agents1_idx` (`Agents_SIN`),
  KEY `fk_Client_has_Insurance_Agents_Clients1_idx` (`HealthCardNo`),
  CONSTRAINT `fk_Client_has_Insurance_Agents_Clients1` FOREIGN KEY (`HealthCardNo`) REFERENCES `Clients` (`HealthCardNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Client_has_Insurance_Agents_Insurance_Agents1` FOREIGN KEY (`Agents_SIN`) REFERENCES `Insurance_Agents` (`Agents_SIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client_Agents`
--

LOCK TABLES `Client_Agents` WRITE;
/*!40000 ALTER TABLE `Client_Agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client_Agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `HealthCardNo` varchar(12) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Age` int NOT NULL,
  PRIMARY KEY (`HealthCardNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES ('1000000000AV','Biruk tesfa','33 donmills',35),('1000000001AV','Yoni Heny','22 Yonge st',29),('1000000002AV','Dagi Fike','11 jarvis st',32),('100000000AV','BIRUK DAGI','33 donmills',23),('100000001AV','TESFA FIKE','13 Stayner ave',43),('100000002AV','HENY MIKY','22 yonge st',20);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contracts`
--

DROP TABLE IF EXISTS `Contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contracts` (
  `Contracts_ID` varchar(45) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `ContractsText` text NOT NULL,
  `Agents_SIN` int NOT NULL,
  `PHD_idPHD` int NOT NULL,
  PRIMARY KEY (`Agents_SIN`,`PHD_idPHD`,`Contracts_ID`),
  KEY `fk_Contracts_PHD1_idx` (`PHD_idPHD`),
  CONSTRAINT `fk_Contracts_Insurance_Agents1` FOREIGN KEY (`Agents_SIN`) REFERENCES `Insurance_Agents` (`Agents_SIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Contracts_PHD1` FOREIGN KEY (`PHD_idPHD`) REFERENCES `ProvincialHealthDepartment` (`idPHD`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contracts`
--

LOCK TABLES `Contracts` WRITE;
/*!40000 ALTER TABLE `Contracts` DISABLE KEYS */;
INSERT INTO `Contracts` VALUES ('112','2021-10-09','2021-10-09','Life insurance coverage',111222333,2),('111','2021-10-09','2021-10-09','Life insurance coverage',444555666,1),('113','2021-10-09','2021-10-09','Life insurance coverage',777888999,3);
/*!40000 ALTER TABLE `Contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insurance_Agents`
--

DROP TABLE IF EXISTS `Insurance_Agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insurance_Agents` (
  `Agents_SIN` int NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Speciality` varchar(45) NOT NULL,
  PRIMARY KEY (`Agents_SIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insurance_Agents`
--

LOCK TABLES `Insurance_Agents` WRITE;
/*!40000 ALTER TABLE `Insurance_Agents` DISABLE KEYS */;
INSERT INTO `Insurance_Agents` VALUES (111222333,'Tigist Birish','Life Insurance'),(444555666,'Selam Get','Property Insurance'),(777888999,'Miky Tesfa','Health Insurance');
/*!40000 ALTER TABLE `Insurance_Agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insurance_Policy`
--

DROP TABLE IF EXISTS `Insurance_Policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insurance_Policy` (
  `idInsurance_Policy` int NOT NULL,
  `tradeName` varchar(15) NOT NULL,
  `Symbol` varchar(15) DEFAULT NULL,
  `idPHD` int NOT NULL,
  `PolicyIssuersID` int NOT NULL,
  PRIMARY KEY (`idInsurance_Policy`,`idPHD`,`PolicyIssuersID`),
  UNIQUE KEY `tradeName_UNIQUE` (`tradeName`),
  KEY `fk_Insurance_Policy_PHD1_idx` (`idPHD`),
  KEY `fk_Insurance_Policy_Policy_Issuers1_idx` (`PolicyIssuersID`),
  CONSTRAINT `fk_Insurance_Policy_PHD1` FOREIGN KEY (`idPHD`) REFERENCES `ProvincialHealthDepartment` (`idPHD`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Insurance_Policy_Policy_Issuers1` FOREIGN KEY (`PolicyIssuersID`) REFERENCES `Policy_Issuers` (`PolicyIssuersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insurance_Policy`
--

LOCK TABLES `Insurance_Policy` WRITE;
/*!40000 ALTER TABLE `Insurance_Policy` DISABLE KEYS */;
INSERT INTO `Insurance_Policy` VALUES (111111111,'Canada Life','life',1,100),(222222222,'ManuLife','green',2,200),(333333333,'BlueCross','cross',3,300);
/*!40000 ALTER TABLE `Insurance_Policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insurance_Prices`
--

DROP TABLE IF EXISTS `Insurance_Prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insurance_Prices` (
  `price` float NOT NULL,
  `currency` varchar(15) NOT NULL,
  `idInsurance_Policy` int NOT NULL,
  `PHD_idPHD` int NOT NULL,
  `PolicyIssuersID` int NOT NULL,
  PRIMARY KEY (`idInsurance_Policy`,`PHD_idPHD`,`PolicyIssuersID`),
  KEY `fk_Prices_Insurance_Policy1_idx` (`idInsurance_Policy`),
  KEY `fk_Prices_PHD1_idx` (`PHD_idPHD`),
  KEY `fk_Prices_PolicyIssuers1_idx` (`PolicyIssuersID`),
  CONSTRAINT `fk_Prices_Insurance_Policy1` FOREIGN KEY (`idInsurance_Policy`) REFERENCES `Insurance_Policy` (`idInsurance_Policy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Prices_PHD1` FOREIGN KEY (`PHD_idPHD`) REFERENCES `ProvincialHealthDepartment` (`idPHD`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Prices_PolicyIssuers1` FOREIGN KEY (`PolicyIssuersID`) REFERENCES `Policy_Issuers` (`PolicyIssuersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insurance_Prices`
--

LOCK TABLES `Insurance_Prices` WRITE;
/*!40000 ALTER TABLE `Insurance_Prices` DISABLE KEYS */;
INSERT INTO `Insurance_Prices` VALUES (300,'USD',111111111,1,100),(400,'CAD',222222222,2,200),(500,'EURO',333333333,3,300);
/*!40000 ALTER TABLE `Insurance_Prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PolicyIssuers_Agents`
--

DROP TABLE IF EXISTS `PolicyIssuers_Agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PolicyIssuers_Agents` (
  `Agents_SIN` int NOT NULL,
  `PolicyIssuersID` int NOT NULL,
  `YearOfExp` int NOT NULL,
  `JobType` varchar(45) NOT NULL,
  PRIMARY KEY (`Agents_SIN`,`PolicyIssuersID`),
  KEY `fk_Insurance_Agents_has_PolicyIssuers_Insurance_Agents1_idx` (`Agents_SIN`),
  KEY `fk_Insurance_Agents_has_PolicyIssuers_PolicyIssuers1_idx` (`PolicyIssuersID`),
  CONSTRAINT `fk_Insurance_Agents_has_PolicyIssuers_Insurance_Agents1` FOREIGN KEY (`Agents_SIN`) REFERENCES `Insurance_Agents` (`Agents_SIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Insurance_Agents_has_PolicyIssuers_PolicyIssuers1` FOREIGN KEY (`PolicyIssuersID`) REFERENCES `Policy_Issuers` (`PolicyIssuersID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PolicyIssuers_Agents`
--

LOCK TABLES `PolicyIssuers_Agents` WRITE;
/*!40000 ALTER TABLE `PolicyIssuers_Agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `PolicyIssuers_Agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy_Issuers`
--

DROP TABLE IF EXISTS `Policy_Issuers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policy_Issuers` (
  `PolicyIssuersID` int NOT NULL,
  `Name` varchar(15) NOT NULL,
  `ContactPhoneNo` varchar(45) NOT NULL,
  `PHD_idPHD` int NOT NULL,
  PRIMARY KEY (`PolicyIssuersID`,`PHD_idPHD`),
  KEY `fk_PolicyIssuers_PHD1_idx` (`PHD_idPHD`),
  CONSTRAINT `fk_PolicyIssuers_PHD1` FOREIGN KEY (`PHD_idPHD`) REFERENCES `ProvincialHealthDepartment` (`idPHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy_Issuers`
--

LOCK TABLES `Policy_Issuers` WRITE;
/*!40000 ALTER TABLE `Policy_Issuers` DISABLE KEYS */;
INSERT INTO `Policy_Issuers` VALUES (100,'CanadaLife Inc','4371234567',1),(200,'Manulife Inc','4169876543',2),(300,'BlueCross Inc','6475432178',3);
/*!40000 ALTER TABLE `Policy_Issuers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy_Recommendations`
--

DROP TABLE IF EXISTS `Policy_Recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policy_Recommendations` (
  `Recommendation_ID` int NOT NULL,
  `Date` varchar(45) NOT NULL,
  `Quantiiy` varchar(45) NOT NULL,
  `Agents_SIN` int NOT NULL,
  `idInsurance_Policy` int NOT NULL,
  `HealthCardNo` varchar(12) NOT NULL,
  PRIMARY KEY (`Agents_SIN`,`idInsurance_Policy`,`Recommendation_ID`,`HealthCardNo`),
  KEY `fk_Recommendations_Insurance_Policy1_idx` (`idInsurance_Policy`),
  KEY `fk_Policy_Recommendations_Clients1_idx` (`HealthCardNo`),
  CONSTRAINT `fk_Policy_Recommendations_Clients1` FOREIGN KEY (`HealthCardNo`) REFERENCES `Clients` (`HealthCardNo`) ON DELETE CASCADE,
  CONSTRAINT `fk_Recommendations_Insurance_Agents1` FOREIGN KEY (`Agents_SIN`) REFERENCES `Insurance_Agents` (`Agents_SIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Recommendations_Insurance_Policy1` FOREIGN KEY (`idInsurance_Policy`) REFERENCES `Insurance_Policy` (`idInsurance_Policy`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy_Recommendations`
--

LOCK TABLES `Policy_Recommendations` WRITE;
/*!40000 ALTER TABLE `Policy_Recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policy_Recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProvincialHealthDepartment`
--

DROP TABLE IF EXISTS `ProvincialHealthDepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProvincialHealthDepartment` (
  `idPHD` int NOT NULL,
  `Name_of_Province` varchar(45) NOT NULL,
  `OfficeStreet` varchar(40) NOT NULL,
  `City` varchar(45) NOT NULL,
  `ContactPhoneNo` varchar(15) NOT NULL,
  PRIMARY KEY (`idPHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProvincialHealthDepartment`
--

LOCK TABLES `ProvincialHealthDepartment` WRITE;
/*!40000 ALTER TABLE `ProvincialHealthDepartment` DISABLE KEYS */;
INSERT INTO `ProvincialHealthDepartment` VALUES (1,'Ontario','200 Bloor St E','Toronto','4379775432'),(2,'Alberta','402 Terrace building','Edmonton','7804271432'),(3,'Manitoba','300 Carlton St','Winnipeg','2047867101');
/*!40000 ALTER TABLE `ProvincialHealthDepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'InsuranceDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16 21:32:48
