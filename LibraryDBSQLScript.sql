CREATE DATABASE  IF NOT EXISTS `LibraryDB` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LibraryDB`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: LibraryDB
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
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOK` (
  `Book_id` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Publisher_name` char(60) DEFAULT NULL,
  PRIMARY KEY (`Book_id`),
  KEY `Publisher_name` (`Publisher_name`),
  CONSTRAINT `fk_Publisher_Name` FOREIGN KEY (`Publisher_name`) REFERENCES `PUBLISHER` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (1,'Life 3.0: Being Human in the Age of Artificial Intelligence','Vintage Books'),(2,'Should We Eat Meat?: Evolution and Consequences of Modern Carnivory','John Wiley & Sons'),(3,'I Contain Multitudes: The Microbes Within Us and a Grander View of Life','HarperCollins'),(4,'Behind the Beautiful Forevers: Life, Death, and Hope in a Mumbai Undercity','Random House'),(5,'The Most Powerful Idea in the World: A Story of Steam, Industry, and Invention','Jonathan Cape'),(6,'Sustainable Energy - Without the Hot Air','UIT'),(7,'The Emperor of All Maladies: A Biography of Cancer','Scribner'),(8,'The Gene: An Intimate History','Scribner'),(9,'Energy Myths and Realities: Bringing Science to the Energy Policy Debate','AEI Press'),(10,'Prepared: What Kids Need for a Fulfilled Life','Currency Press');
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_AUTHORS`
--

DROP TABLE IF EXISTS `BOOK_AUTHORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOK_AUTHORS` (
  `Book_id` int NOT NULL,
  `Author_name` varchar(60) NOT NULL,
  PRIMARY KEY (`Book_id`,`Author_name`),
  CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `BOOK` (`Book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_AUTHORS`
--

LOCK TABLES `BOOK_AUTHORS` WRITE;
/*!40000 ALTER TABLE `BOOK_AUTHORS` DISABLE KEYS */;
INSERT INTO `BOOK_AUTHORS` VALUES (1,'Max Tegmark '),(2,'Vaclav Smil'),(3,'Ed Yong'),(4,'Katherine Boo'),(5,'William Rosen'),(6,'David MacKay'),(7,'Siddhartha Mukherjee'),(8,'Siddhartha Mukherjee'),(9,'Vaclav Smil'),(10,'Diane Tavenner');
/*!40000 ALTER TABLE `BOOK_AUTHORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_COPIES`
--

DROP TABLE IF EXISTS `BOOK_COPIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOK_COPIES` (
  `Book_id` int NOT NULL,
  `Branch_id` int NOT NULL,
  `No_of_copies` int DEFAULT NULL,
  PRIMARY KEY (`Book_id`,`Branch_id`),
  KEY `Branch_id` (`Branch_id`),
  CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `BOOK` (`Book_id`),
  CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`Branch_id`) REFERENCES `LIBRARY_BRANCH` (`Branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_COPIES`
--

LOCK TABLES `BOOK_COPIES` WRITE;
/*!40000 ALTER TABLE `BOOK_COPIES` DISABLE KEYS */;
INSERT INTO `BOOK_COPIES` VALUES (1,3025,10),(2,3025,30),(2,5489,7),(3,3025,70),(3,4156,11),(4,4156,15),(5,3568,80),(6,5489,60),(7,3025,NULL),(7,5489,10),(8,3211,30),(8,3568,40),(9,3025,44),(9,3568,0),(10,3568,50),(10,4156,60);
/*!40000 ALTER TABLE `BOOK_COPIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK_LOANS`
--

DROP TABLE IF EXISTS `BOOK_LOANS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOK_LOANS` (
  `Book_id` int NOT NULL,
  `Due_date` date DEFAULT NULL,
  `Date_out` date DEFAULT NULL,
  `Branch_id` int NOT NULL,
  `Card_no` int NOT NULL,
  PRIMARY KEY (`Book_id`,`Branch_id`,`Card_no`),
  KEY `Branch_id` (`Branch_id`),
  KEY `Card_no` (`Card_no`),
  CONSTRAINT `book_loans_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `BOOK` (`Book_id`),
  CONSTRAINT `book_loans_ibfk_2` FOREIGN KEY (`Branch_id`) REFERENCES `LIBRARY_BRANCH` (`Branch_id`),
  CONSTRAINT `book_loans_ibfk_3` FOREIGN KEY (`Card_no`) REFERENCES `BORROWER` (`Card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK_LOANS`
--

LOCK TABLES `BOOK_LOANS` WRITE;
/*!40000 ALTER TABLE `BOOK_LOANS` DISABLE KEYS */;
INSERT INTO `BOOK_LOANS` VALUES (1,'2020-02-10','2020-02-01',3025,166),(3,'2020-04-03','2020-02-01',3025,166),(4,'2020-01-01','2020-02-05',3568,976),(4,'2020-01-29','2020-02-01',4156,703),(5,'2020-01-14','2020-01-03',5489,816),(6,'2020-03-01','2020-02-01',3025,703),(6,'2020-01-15','2019-12-26',3025,976),(6,'2020-03-01','2020-02-06',3568,976);
/*!40000 ALTER TABLE `BOOK_LOANS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BORROWER`
--

DROP TABLE IF EXISTS `BORROWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BORROWER` (
  `Card_no` int NOT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Phone` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWER`
--

LOCK TABLES `BORROWER` WRITE;
/*!40000 ALTER TABLE `BORROWER` DISABLE KEYS */;
INSERT INTO `BORROWER` VALUES (166,'Carmen J Clyburn','2604 Victoria Park Ave, ON',NULL),(432,'Sythoun Sun','3094 Brew Creek Road, Whistler, BC','543-234-8765'),(500,'Ali Ahmadi','3853 Broadmoor Blvd, Mississauga, ON',NULL),(543,'Diane Tavenner','3094 Brew Creek Road, Whistler, BC','345-542-7777'),(703,'Sythoun Sun','3783 Front Street, Toronto, Ontario','321-654-1987'),(777,'Stainbrook Green','1065 Glover Road, Hannon, ON',NULL),(816,'Jess Huynh','3094 Brew Creek Road, Whistler, BC','123-456-7891'),(976,'Harry V. Stainbrook','1065 Glover Road, Hannon, ON','321-456-7891'),(978,'Ethel V. Stainbrook','1074 Glover Road, Hannon, ON','654-321-1987');
/*!40000 ALTER TABLE `BORROWER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIBRARY_BRANCH`
--

DROP TABLE IF EXISTS `LIBRARY_BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIBRARY_BRANCH` (
  `Branch_id` int NOT NULL,
  `Branch_name` varchar(60) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIBRARY_BRANCH`
--

LOCK TABLES `LIBRARY_BRANCH` WRITE;
/*!40000 ALTER TABLE `LIBRARY_BRANCH` DISABLE KEYS */;
INSERT INTO `LIBRARY_BRANCH` VALUES (3025,'Albert Campbell','496 Birchmount Road Toronto, ON  M1K 1N8'),(3211,'Barbara Frum','20 Covington Rd, North York, ON M6A 3C1'),(3444,'Champlain Heights','7110 Kerr St, Vancouver, BC V5S 4W2'),(3568,'Bayview','2901 Bayview Ave, North York, ON M2K 1E6'),(4156,'Northern District','40 Orchard View Blvd, Toronto, ON M4R 1B9'),(4567,'Central Saanich','1209 Clarke Rd, Brentwood Bay, BC V8M 1P8'),(5489,'Albion','1515 Albion Road Toronto, ON  M9V 1B2 ');
/*!40000 ALTER TABLE `LIBRARY_BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUBLISHER`
--

DROP TABLE IF EXISTS `PUBLISHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PUBLISHER` (
  `Name` char(60) NOT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Phone` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUBLISHER`
--

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;
INSERT INTO `PUBLISHER` VALUES ('AEI Press',NULL,NULL),('Coach House Books','Toronto, Canada','111-111-2345'),('Currency Press','Redfern, New South Wales, Australia',NULL),('HarperCollins','New York, New York, United States','222-222-2222'),('John Wiley & Sons','Hoboken, New Jersey, United States',NULL),('Jonathan Cape','London, United Kingdom','555-555-5555'),('Random House','Random House Tower, New York City, United States',NULL),('Scribner','New York, United States','333-333-3333'),('Turnstone Press','Canada',NULL),('UIT',NULL,NULL),('Vintage Books','New York, New York, United States','666-666-6666');
/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'LibraryDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-15 13:55:32
