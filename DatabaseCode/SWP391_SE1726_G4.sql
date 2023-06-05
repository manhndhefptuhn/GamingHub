CREATE DATABASE  IF NOT EXISTS `swp391_se1726_g4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swp391_se1726_g4`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: swp391_se1726_g4
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Cart_ID` int AUTO_INCREMENT NOT NULL,
  `Product_ID` int NOT NULL,
  `Product_Price` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Total_Cost` int DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  PRIMARY KEY (`Cart_ID`),
  KEY `FK__Cart__Product_ID__5070F446` (`Product_ID`),
  KEY `FK__Cart__User_ID__5165187F` (`User_ID`),
  CONSTRAINT `FK__Cart__Product_ID__5070F446` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `FK__Cart__User_ID__5165187F` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case` (
  `Case_ID` int AUTO_INCREMENT NOT NULL,
  `Case_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Case_ID`),
  KEY `FK__Case__Component___3F466844` (`Component_ID`),
  CONSTRAINT `FK__Case__Component___3F466844` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components` (
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Component_Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpu` (
  `CPU_ID` int AUTO_INCREMENT NOT NULL,
  `CPU_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CPU_ID`),
  KEY `FK__CPU__Component_I__30F848ED` (`Component_ID`),
  CONSTRAINT `FK__CPU__Component_I__30F848ED` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Feedback_ID` int AUTO_INCREMENT NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Create_Date` date DEFAULT NULL,
  `Content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Rating` double DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Feedback_ID`),
  KEY `FK__Feedback__User_I__5441852A` (`User_ID`),
  KEY `FK__Feedback__Produc__5535A963` (`Product_ID`),
  CONSTRAINT `FK__Feedback__Produc__5535A963` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `FK__Feedback__User_I__5441852A` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainboard`
--

DROP TABLE IF EXISTS `mainboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mainboard` (
  `Mainboard_ID` int AUTO_INCREMENT NOT NULL,
  `Mainboard_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Mainboard_ID`),
  KEY `FK__Mainboard__Compo__2E1BDC42` (`Component_ID`),
  CONSTRAINT `FK__Mainboard__Compo__2E1BDC42` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainboard`
--

LOCK TABLES `mainboard` WRITE;
/*!40000 ALTER TABLE `mainboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `mainboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` int AUTO_INCREMENT NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Order_Date` date DEFAULT NULL,
  `Total_Cost` int DEFAULT NULL,
  `Saler_ID` int DEFAULT NULL,
  `Order_Status` int DEFAULT NULL,
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `FK__Order__User_ID__59FA5E80` (`User_ID`),
  KEY `FK__Order__Order_Sta__5AEE82B9` (`Order_Status`),
  CONSTRAINT `FK__Order__Order_Sta__5AEE82B9` FOREIGN KEY (`Order_Status`) REFERENCES `order_status` (`Order_Status_ID`),
  CONSTRAINT `FK__Order__User_ID__59FA5E80` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `Order_Detail_ID` int AUTO_INCREMENT NOT NULL,
  `Order_ID` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  `Product_Price` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Order_Detail_ID`),
  KEY `FK__Order_Det__Order__5DCAEF64` (`Order_ID`),
  KEY `FK__Order_Det__Produ__5EBF139D` (`Product_ID`),
  CONSTRAINT `FK__Order_Det__Order__5DCAEF64` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`),
  CONSTRAINT `FK__Order_Det__Produ__5EBF139D` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `Order_Status_ID` int  AUTO_INCREMENT NOT NULL,
  `Order_Status_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Order_Status_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc`
--

DROP TABLE IF EXISTS `pc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pc` (
  `Product_ID` int NOT NULL,
  `Mainboard_ID` int NOT NULL,
  `CPU_ID` int NOT NULL,
  `RAM_ID` int NOT NULL,
  `VGA_ID` int NOT NULL,
  `Storage_ID` int NOT NULL,
  `PSU_ID` int NOT NULL,
  `Case_ID` int NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `FK__PC__Mainboard_ID__47DBAE45` (`Mainboard_ID`),
  KEY `FK__PC__CPU_ID__48CFD27E` (`CPU_ID`),
  KEY `FK__PC__RAM_ID__49C3F6B7` (`RAM_ID`),
  KEY `FK__PC__VGA_ID__4AB81AF0` (`VGA_ID`),
  KEY `FK__PC__Storage_ID__4BAC3F29` (`Storage_ID`),
  KEY `FK__PC__PSU_ID__4CA06362` (`PSU_ID`),
  KEY `FK__PC__Case_ID__4D94879B` (`Case_ID`),
  CONSTRAINT `FK__PC__Case_ID__4D94879B` FOREIGN KEY (`Case_ID`) REFERENCES `case` (`Case_ID`),
  CONSTRAINT `FK__PC__CPU_ID__48CFD27E` FOREIGN KEY (`CPU_ID`) REFERENCES `cpu` (`CPU_ID`),
  CONSTRAINT `FK__PC__Mainboard_ID__47DBAE45` FOREIGN KEY (`Mainboard_ID`) REFERENCES `mainboard` (`Mainboard_ID`),
  CONSTRAINT `FK__PC__Product_ID__46E78A0C` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  CONSTRAINT `FK__PC__PSU_ID__4CA06362` FOREIGN KEY (`PSU_ID`) REFERENCES `psu` (`PSU_ID`),
  CONSTRAINT `FK__PC__RAM_ID__49C3F6B7` FOREIGN KEY (`RAM_ID`) REFERENCES `ram` (`RAM_ID`),
  CONSTRAINT `FK__PC__Storage_ID__4BAC3F29` FOREIGN KEY (`Storage_ID`) REFERENCES `storage` (`Storage_ID`),
  CONSTRAINT `FK__PC__VGA_ID__4AB81AF0` FOREIGN KEY (`VGA_ID`) REFERENCES `vga` (`VGA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc`
--

LOCK TABLES `pc` WRITE;
/*!40000 ALTER TABLE `pc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int AUTO_INCREMENT NOT NULL,
  `Product_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `Product_Images_ID` int AUTO_INCREMENT NOT NULL,
  `Product_ID` int DEFAULT NULL,
  `Images` longtext,
  PRIMARY KEY (`Product_Images_ID`),
  KEY `FK__Product_I__Produ__440B1D61` (`Product_ID`),
  CONSTRAINT `FK__Product_I__Produ__440B1D61` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psu`
--

DROP TABLE IF EXISTS `psu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psu` (
  `PSU_ID` int AUTO_INCREMENT NOT NULL,
  `PSU_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PSU_ID`),
  KEY `FK__PSU__Component_I__3C69FB99` (`Component_ID`),
  CONSTRAINT `FK__PSU__Component_I__3C69FB99` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu`
--

LOCK TABLES `psu` WRITE;
/*!40000 ALTER TABLE `psu` DISABLE KEYS */;
/*!40000 ALTER TABLE `psu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ram`
--

DROP TABLE IF EXISTS `ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ram` (
  `RAM_ID` int AUTO_INCREMENT NOT NULL,
  `RAM_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`RAM_ID`),
  KEY `FK__RAM__Component_I__33D4B598` (`Component_ID`),
  CONSTRAINT `FK__RAM__Component_I__33D4B598` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

LOCK TABLES `ram` WRITE;
/*!40000 ALTER TABLE `ram` DISABLE KEYS */;
/*!40000 ALTER TABLE `ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Role_ID` int AUTO_INCREMENT NOT NULL,
  `Role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Customer'),(2,'Sale'),(3,'Support'),(4,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `Slider_ID` int AUTO_INCREMENT NOT NULL,
  `Slider_Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Slider_Image` longtext,
  `Backlink` longtext,
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Updated_by` int DEFAULT NULL,
  PRIMARY KEY (`Slider_ID`),
  KEY `FK__Slider__Updated___2B3F6F97` (`Updated_by`),
  CONSTRAINT `FK__Slider__Updated___2B3F6F97` FOREIGN KEY (`Updated_by`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `Storage_ID` int AUTO_INCREMENT NOT NULL,
  `Storage_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Storage_ID`),
  KEY `FK__Storage__Compone__398D8EEE` (`Component_ID`),
  CONSTRAINT `FK__Storage__Compone__398D8EEE` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int AUTO_INCREMENT NOT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Profile_picture` longtext,
  `Phone_Number` varchar(50) NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Role_ID` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `FK__User__Role_ID__267ABA7A` (`Role_ID`),
  CONSTRAINT `FK__User__Role_ID__267ABA7A` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Cao Hoàng Việt','vietchhe170297@fpt.edu.vn','Viet11111',NULL,'1231312313','Hà Nội, Việt Nam',1,1),(6,'Nguyễn Đức Mạnh','manhndhe170523@fpt.edu.vn','Manhdz123',NULL,'0365616718','Hà Nội, Việt Nam',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vga`
--

DROP TABLE IF EXISTS `vga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vga` (
  `VGA_ID` int AUTO_INCREMENT NOT NULL,
  `VGA_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`VGA_ID`),
  KEY `FK__VGA__Component_I__36B12243` (`Component_ID`),
  CONSTRAINT `FK__VGA__Component_I__36B12243` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vga`
--

LOCK TABLES `vga` WRITE;
/*!40000 ALTER TABLE `vga` DISABLE KEYS */;
/*!40000 ALTER TABLE `vga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04 21:15:40
