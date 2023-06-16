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
  `Cart_ID` int NOT NULL AUTO_INCREMENT,
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
  `Case_ID` int NOT NULL AUTO_INCREMENT,
  `Case_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Case_ID`),
  KEY `FK__Case__Component___3F466844` (`Component_ID`),
  CONSTRAINT `FK__Case__Component___3F466844` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'JETEK EM1',330,NULL,'img/case/JETEK_EM1.jpg','7'),(2,'Jetek Mini I8-22B',490,NULL,'img/case/Jetek_Mini_I8_22B.png','7'),(3,'XIGMATEK NYA 3F RGB',690,NULL,'img/case/XIGMATEK_NYA_3F_RGB.png','7'),(4,'1st Player XF Black',890,NULL,'img/case/1st_Player_XF_Black.jpg','7'),(5,'MIK TN10',990,NULL,'img/case/MIK_TN10.jpg','7'),(6,'Cougar Archon 2 Mesh White RGB',1150,NULL,'img/case/Cougar_Archon_2_Mesh_White_RGB.jpg','7'),(7,'MIK LV12 M BLACK',1230,NULL,'img/case/MIK_LV12_M_BLACK.png','7'),(8,'MIK LV12 M WHITE',1330,NULL,'img/case/MIK_LV12_M_WHITE.png','7'),(9,'MIK LV12 BLACK',1690,NULL,'img/case/MIK_LV12_BLACK.png','7'),(10,'Cougar DarkBlader X7 Midnight Green',1690,NULL,'img/case/Cougar_DarkBlader_X7_Midnight_Green.png','7'),(11,'JONSBO D31 MESH WHITE',231,NULL,'img/case/jonsbo_d31_mesh_white.jpg','7'),(12,'JONSBO D31 MESH BLACK',302,NULL,'img/case/jonsbo_d31_mesh_black.jpg','7'),(13,'GAMING HAWK F1 BLACK',504,NULL,'img/case/hawk_f1_black.jpg','7'),(14,'GAMING HAWK F1 WHITE',476,NULL,'img/case/hawk_f1_white.jpg','7'),(15,'CORSAIR 4000D AIRFLOW TG BLACK',674,NULL,'img/case/corsair_4000d_airflow_tg_black.jpg','7'),(16,'CORSAIR 4000D AIRFLOW TG WHITE',723,NULL,'img/case/corsair_4000d_airflow_tg_white.jpg','7');
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
INSERT INTO `components` VALUES ('1','CPU','Central Processing Unit'),('2','RAM','Random Access Memory'),('3','VGA','Video Graphics Array'),('4','Storage','HDD, SSD'),('5','PSU','Power Supply Unit'),('6','Mainboard','NULL'),('7','Case','NULL');
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpu` (
  `CPU_ID` int NOT NULL AUTO_INCREMENT,
  `CPU_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CPU_ID`),
  KEY `FK__CPU__Component_I__30F848ED` (`Component_ID`),
  CONSTRAINT `FK__CPU__Component_I__30F848ED` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
INSERT INTO `cpu` VALUES (1,'INTEL Xeon Max 9462',7995,'','img/cpu/Intel_Xeon_Max_9462.jpg','1'),(2,'INTEL I3 13100T',134,NULL,'img/cpu/INTEL_I3_13100T.jpg','1'),(3,'INTEL I3 13100F',127,NULL,'img/cpu/INTEL_I3_13100F.jpg','1'),(4,'AMD PRO ThreadRipper 5995X',7452,NULL,'img/cpu/AMD_PRO_ThreadRipper_5995X.jpg','1'),(5,'AMD RYZEN 3 5300G',130,NULL,'img/cpu/AMD_RYZEN_3_5300G.jpg','1'),(6,'AMD RYZEN 3 3300X',135,NULL,'img/cpu/amd_3300x.jpg','1'),(7,'AMD Ryzen 5 7600X',299,NULL,'img/cpu/ryzen5_7600_voi_7600x.jpg','1'),(8,'AMD Ryzen 7 7700',379,NULL,'img/cpu/ryzen7_7700_voi_7700x.jpg','1'),(9,'AMD Ryzen 9 7900X',529,NULL,'img/cpu/ryzen9_7900_voi_7900x.jpg','1'),(10,'Intel Core i5-13500F',212,NULL,'img/cpu/i5_13500_voi_i5_13500F.jpg','1'),(11,'Intel Core i7-13700F',364,NULL,'img/cpu/i7_13700_voi_i7_13700F.jpg','1'),(12,'Intel Core i9-13900F',529,NULL,'img/cpu/i9_13900_voi_i9_13900F.jpg','1');
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `Feedback_ID` int NOT NULL AUTO_INCREMENT,
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
  `Mainboard_ID` int NOT NULL AUTO_INCREMENT,
  `Mainboard_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Mainboard_ID`),
  KEY `FK__Mainboard__Compo__2E1BDC42` (`Component_ID`),
  CONSTRAINT `FK__Mainboard__Compo__2E1BDC42` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainboard`
--

LOCK TABLES `mainboard` WRITE;
/*!40000 ALTER TABLE `mainboard` DISABLE KEYS */;
INSERT INTO `mainboard` VALUES (1,'MAINBOARD ASUS PRIME H510M-K ',72,NULL,'img/mainboard/MAINBOARD_ASUS_PRIME_H510MK .jpg','6'),(2,'MAINBOARD MSI H510M PRO-E',70,NULL,'img/mainboard/MAINBOARD_MSI_H510M_PROE.jpg','6'),(3,'MAINBOARD ASUS TUF GAMING B550M-PLUS WIFI II',160,NULL,'img/mainboard/MAINBOARD_ASUS_TUF_GAMING_B550MPLUS_WIFI_II.jpg','6'),(4,'MAINBOARD ASUS PRIME H510M-K R2.0 - CSM (TRAY)',69,NULL,'img/mainboard/MAINBOARD_ASUS_PRIME_H510MK_R2.0_CSM_(TRAY).jpg','6'),(5,'MAINBOARD MSI PRO Z790-P WIFI DDR4',272,NULL,'img/mainboard/MAINBOARD_MSI_PRO_Z790P_WIFI_DDR4.jpg','6'),(6,'MAINBOARD ASUS Prime Z790-A WiFi 6E',425,NULL,'img/mainboard/MAINBOARD_ASUS_Prime_Z790A_WiFi_6E.jpg','6'),(7,'Mainboard MSI PRO B660M-E DDR4',114,NULL,'img/mainboard/MAINBOARD_MSI_PRO_B660M_E_DDR4.jpg','6'),(8,'ASUS PRIME Z790-P WIFI-CSM',499,NULL,'img/mainboard/ASUS_PRIME_Z790P_WIFI_CSM.jpg','6'),(9,'Gigabyte B550M K AM4 Micro-ATX',139,NULL,'img/mainboard/Gigabyte_B550M_K_AM4_MicroATX.jpg','6'),(10,'Gigabyte B560 HD3 Intel',149,NULL,'img/mainboard/Gigabyte_B560_HD3.jpg','6'),(11,'Gigabyte Z790 AORUS ELITE AX',429,NULL,'img/mainboard/Gigabyte_Z690_AORUS_ELITE_AX_V2.jpg','6'),(12,'MSI MPG B650 Edge WiFi AM5 ATX',499,NULL,'img/mainboard/MSI_MPG_B650_Edge_WiFi_AM5_ATX.jpg','6'),(13,'Asus PRIME B760M-A WIFI',255,NULL,'img/mainboard/MSI_PRO_B760MA_WIFI.jpg','6'),(14,'MSI PRO Z790-A WIFI',439,NULL,'img/mainboard/MSI_PRO_Z790A_WIFI.jpg','6'),(15,'ASUS B550-PLUS TUF Gaming Wi-Fi',259,NULL,'img/mainboard/ASUS_B550_PLUS_TUF_Gaming_WiFi.jpg','6');
/*!40000 ALTER TABLE `mainboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
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
  `Order_Detail_ID` int NOT NULL AUTO_INCREMENT,
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
  `Order_Status_ID` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `pc` VALUES (1,1,2,1,1,1,6,3),(2,2,3,4,5,2,7,5),(3,1,1,5,3,3,3,1),(4,3,4,2,4,1,4,2),(5,4,3,3,6,2,5,3),(6,5,6,4,8,4,7,5),(7,15,7,6,4,5,2,7),(8,12,3,7,5,6,3,3),(9,13,8,8,6,7,4,4),(10,14,4,9,8,3,6,6),(11,8,7,2,9,4,8,8),(12,9,9,3,1,5,9,9),(13,10,10,4,2,6,1,10),(14,11,12,5,3,8,2,12),(15,5,11,1,4,3,3,13),(16,6,4,2,5,2,10,14),(17,7,5,4,7,3,1,15),(18,2,6,5,8,4,3,16),(19,3,2,6,9,5,4,11),(20,4,3,4,10,6,5,12),(21,5,4,3,12,2,6,15),(22,6,7,5,13,3,7,16),(23,11,8,7,14,4,2,12),(24,12,5,8,11,7,3,1),(25,13,3,9,12,8,4,2),(26,14,1,2,13,2,6,4),(27,15,2,1,14,1,7,5),(28,6,3,7,11,2,8,6),(29,5,5,3,10,3,9,7),(30,7,6,4,6,7,1,8);
/*!40000 ALTER TABLE `pc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'QuantumEdge',1,3),(2,'CyberByte',1,4),(3,'TechNexus',1,5),(4,'AeroCore',1,3),(5,'SynthWave',1,2),(6,'MegaByte',1,3),(7,'TurboTech',1,4),(8,'NexusPrime',1,6),(9,'DynaPulse',1,5),(10,'BlazeForce',1,7),(11,'AlphaTech',1,2),(12,'PowerXcel',1,3),(13,'ElectroByte',1,4),(14,'SwiftSpark',1,5),(15,'HyperNova',1,6),(16,'PixelForge',1,1),(17,'CyberFusion',1,2),(18,'TechVortex',1,6),(19,'QuantumPulse',1,7),(20,'SynthTech',1,8),(21,'MegaCore',1,3),(22,'TurboBlaze',1,4),(23,'NexusByte',1,5),(24,'DynaForce',1,6),(25,'RapidTech',1,7),(26,'AlphaByte',1,8),(27,'PowerCore',1,9),(28,'ElectroPulse',1,3),(29,'SwiftTech',1,4),(30,'HyperStream',1,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `Product_Images_ID` int NOT NULL AUTO_INCREMENT,
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
  `PSU_ID` int NOT NULL AUTO_INCREMENT,
  `PSU_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PSU_ID`),
  KEY `FK__PSU__Component_I__3C69FB99` (`Component_ID`),
  CONSTRAINT `FK__PSU__Component_I__3C69FB99` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu`
--

LOCK TABLES `psu` WRITE;
/*!40000 ALTER TABLE `psu` DISABLE KEYS */;
INSERT INTO `psu` VALUES (1,'Jetek A200M',17,NULL,'img/psu/Jetek_A200M.jpg','5'),(2,'Jetek 350W Elite V2',20,NULL,'img/psu/Jetek_350W_Elite_V2.jpeg','5'),(3,'Jetek J400',26,NULL,'img/psu/Jetek_J400.jpg','5'),(4,'1st Player PS-500FK',36,NULL,'img/psu/1st_Player_PS500FK.jpg','5'),(5,'Deepcool PF450D - 80 Plus',36,NULL,'img/psu/Deepcool_PF450D_80_Plus.jpg','5'),(6,'Gigabyte P450B - 80 Plus Bronze',38,NULL,'img/psu/Gigabyte_P450B_80_Plus_Bronze.png','5'),(7,'FSP HV PRO 550W - 80 Plus Bronze',42,NULL,'img/psu/FSP_HV_PRO_550W_80_Plus_Bronze.jpg','5'),(8,'Gigabyte P550B - 80 Plus Bronze',46,NULL,'img/psu/Gigabyte_P550B__80_Plus_Bronze.png','5'),(9,'Corsair AX1600i',551,NULL,'img/psu/Corsair_AX1600i.jpg','5'),(10,'Gigabyte AORUS P1200W Platinum',425,NULL,'img/psu/Gigabyte_AORUS_P1200W_Platinum.png','5');
/*!40000 ALTER TABLE `psu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ram`
--

DROP TABLE IF EXISTS `ram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ram` (
  `RAM_ID` int NOT NULL AUTO_INCREMENT,
  `RAM_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`RAM_ID`),
  KEY `FK__RAM__Component_I__33D4B598` (`Component_ID`),
  CONSTRAINT `FK__RAM__Component_I__33D4B598` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

LOCK TABLES `ram` WRITE;
/*!40000 ALTER TABLE `ram` DISABLE KEYS */;
INSERT INTO `ram` VALUES (1,'RAM DDR5 G.Skill Trident Z5 RGB',299,'Capacity: 32GB (16GBx2),Memory Type: DDR5,Rated Frequency: 5600MHz','img/ram/RAM_DDR5_G.Skill_Trident_Z5_RGB.jpg','2'),(2,'RAM DDR5 TeamGroup T-Force Delta TUF RGB',255,'Capacity: 32GB (16GBx2),Memory Type: DDR5,Rated Frequency: 5200MHz','img/ram/RAM_DDR5_TeamGroup_T-Force_Delta_TUF _RGB.jpg','2'),(3,'RAM DDR5 Adata XPG Lancer',249,'Capacity: 16GB (16GBx1),Memory Type: DDR5,Rated Frequency: 6000MHz','img/ram/RAM_DDR5_Adata_XPG_Lancer.png','2'),(4,'RAM DDR5 Kingston Fury Beast',149,'Capacity: 16GB (16GBx1),Memory Type: DDR5,Rated Frequency: 5200MHz','img/ram/RAM_DDR5_Kingston_FuryBeast.jpg','2'),(5,'RAM DDR5 Kingston Fury Beast RGB',129,'Capacity: 16GB (8GBx2),Memory Type: DDR5,Rated Frequency: 5200MHz','img/ram/RAM_DDR5_Kingston_FuryBeast_RGB.jpg','2'),(6,'RAM DDR4 G.Skill Ripjaws V',59,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3200MHz','img/ram/RAM_DDR4_G.Skill_Ripjaws_V.png','2'),(7,'Ram DDR4 PNY XLR8 Low Profile',55,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3200MHz','img/ram/RAM_DDR4_PNY_XLR8_LowProfile.jpg','2'),(8,'RAM DDR4 Kingston Fury Beast ',65,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3600MHz','img/ram/RAM_DDR4_Kingston_FuryBeast.jpg','2'),(9,'RAM DDR4 Kingston Fury Beast RGB SE',65,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3600MHz','img/ram/RAM_DDR4_Kingston_FuryBeast_RGB_SE.png','2');
/*!40000 ALTER TABLE `ram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Role_ID` int NOT NULL AUTO_INCREMENT,
  `Role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `Slider_ID` int NOT NULL AUTO_INCREMENT,
  `Slider_Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Slider_Image` longtext,
  `Backlink` longtext,
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Updated_by` int DEFAULT NULL,
  PRIMARY KEY (`Slider_ID`),
  KEY `FK__Slider__Updated___2B3F6F97` (`Updated_by`),
  CONSTRAINT `FK__Slider__Updated___2B3F6F97` FOREIGN KEY (`Updated_by`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (1,'Slider_1','img/slider/banner-1.jpg',NULL,NULL,1,NULL),(2,'Slider_2','img/slider/banner-2.jpg',NULL,NULL,1,NULL),(3,'Slider_3','img/slider/banner-3.jpg',NULL,NULL,1,NULL),(4,'Slider_4','img/slider/banner-4.jpg',NULL,NULL,1,NULL),(5,'Slider_5','img/slider/banner-5.jpg',NULL,NULL,0,NULL),(6,'Slider_6','img/slider/banner-6.jpg',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `Storage_ID` int NOT NULL AUTO_INCREMENT,
  `Storage_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Storage_ID`),
  KEY `FK__Storage__Compone__398D8EEE` (`Component_ID`),
  CONSTRAINT `FK__Storage__Compone__398D8EEE` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'WD Blue',39,NULL,'img/storage/WD_Blue.png','4'),(2,'WD Black',85,NULL,'img/storage/WD_Black.png','4'),(3,'WD Red',219,NULL,'img/storage/WD_Red.jpg','4'),(4,'Samsung 980 V8V1T0BW',60,NULL,'img/storage/Samsung_980_V8V500BW.jpg','4'),(5,'Samsung 970 EVO Plus',65,NULL,'img/storage/Samsung_970_EVO_Plus.jpg','4'),(6,'Samsung 870 Qvo',110,NULL,'img/storage/Samsung_870_Qvo.jpg','4'),(7,'SSD Kingston A400 960GB SA400S37/960G',85,NULL,'img/storage/Kingston_A400_960GB_SA400S37.png','4'),(8,'MSI SPATIUM M390',94,NULL,'img/storage/MSI_SPATIUM_M390.jpg','4');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Cao Hoàng Việt','vietchhe170297@fpt.edu.vn','Viet11111',NULL,'0935091066	','Hà Nội, Việt Nam',1,4),(2,'Nguyễn Thị B','manhndhe170523@fpt.edu.vn','Manhdz123','img/avatar/1686297381529.png','0123456789','Hoà Lạc',1,1),(3,'Phạm Cao Đức Minh','minhpcdhe170377@fpt.edu.vn		','Minh12345',NULL,'0868659100	','Hà Nội, Việt Nam',1,1),(4,'Bùi Tiến Đạt','datbthe170585@fpt.edu.vn		','Dat123456',NULL,'0389501823	','Hà Nội, Việt Nam',1,2),(5,'Nguyễn Duy Anh','anhndhe170163@fpt.edu.vn		','Anh123456',NULL,'0836889919	','Hà Nội, Việt Nam',1,3),(6,'Nguyễn Văn A','manh24112003@gmaiil.com','Test12345',NULL,'0123456789','Hà Nội, Việt Nam',1,1),(13,'Nguyễn Đức Mạnh','manhduc150@yahoo.com','Manhdz2411','img/avatar/1686722551944.jpg','0365616718','Hà Nội',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vga`
--

DROP TABLE IF EXISTS `vga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vga` (
  `VGA_ID` int NOT NULL AUTO_INCREMENT,
  `VGA_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Images` longtext,
  `Component_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`VGA_ID`),
  KEY `FK__VGA__Component_I__36B12243` (`Component_ID`),
  CONSTRAINT `FK__VGA__Component_I__36B12243` FOREIGN KEY (`Component_ID`) REFERENCES `components` (`Component_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vga`
--

LOCK TABLES `vga` WRITE;
/*!40000 ALTER TABLE `vga` DISABLE KEYS */;
INSERT INTO `vga` VALUES (1,'GIGABYTE GeForce RTX 4090 GAMING OC 24G',2258,'Base clock: 2535 MHz, CUDA cores: 16384, VRAM: 24GB GDDR6X, TDP: 1000W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_4090_GAMING_OC_24G.jpg','3'),(2,'ASUS Dual GeForce RTX 3060 White 8G GDDR6',362,'Base clock: 1807MHz, CUDA cores: 3584, VRAM: 8GB GDDR6, TDP: 650W, PCIe slot: PCIe x16','img/vga/ASUS_Dual_GeForce_RTX_3060_White_8G_GDDR6.png','3'),(3,'Gigabyte GeForce GTX 1660 SUPER OC 6GB GDDR6',225,'Base clock: 1830MHz, CUDA cores: 1408, VRAM: 6GB GDDR6, TDP: 450W, PCIe slot: PCIe 3.0 x16','img/vga/Gigabyte_GeForce_GTX_1660_SUPER_OC_6GB_GDDR6.png','3'),(4,'GIGABYTE AORUS GeForce RTX 4060 Ti ELITE 8G',619,'Base clock: 2655MHz, CUDA cores: 4352, VRAM: 8GB GDDR6, TDP: 500W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_AORUS_GeForce_RTX_4060_Ti_ELITE_8G.jpg','3'),(5,'GIGABYTE AORUS GeForce RTX 4090 XTREME WATERFORCE 24G',2513,'Base clock: 2565MHz, CUDA cores: 16384, VRAM: 24GB GDDR6X, TDP: 850W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_AORUS_GeForce_RTX_4090_XTREME_WATERFORCE_24G.jpg','3'),(6,'GIGABYTE GeForce RTX 3060 Ti VISION OC 8G (LHR)',532,'Base clock: 1755MHz, CUDA cores: 4864, VRAM: 8GB GDDR6, TDP: 650W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_3060_Ti_VISION_OC_8G_(LHR).png','3'),(7,'GIGABYTE GeForce RTX 4060 Ti EAGLE 8G',532,'Base clock: 2535MHz, CUDA cores: 4352, VRAM: 8GB GDDR6, TDP: 500W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_4060_Ti_EAGLE_8G.jpg','3'),(8,'GIGABYTE GeForce RTX 4070 Ti AERO OC 12G',1235,'Base clock: 2640MHz, CUDA cores: 7680, VRAM: 12GB GDDR6X, TDP: 750W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_4070_Ti_AERO_OC_12G.jpg','3'),(9,'GIGABYTE Radeon RX 6600 XT GAMING OC 8G',555,'Base clock: 1968MHz, Cores: 2048, VRAM: 8GB GDDR6, TDP: 500W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_Radeon_RX_6600_XT_GAMING_OC_8G.png','3'),(10,'GIGABYTE Radeon RX 6700 XT GAMING OC 12G',1064,'Base clock: 2622MHz, Cores: 2560, VRAM: 12GB GDDR6, TDP: 650W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_Radeon_RX_6700_XT_GAMING_OC_12G.png','3'),(11,'ASUS TUF Gaming Radeon RX 6800 OC Edition 16GB GDDR6',1193,'Base clock: 2190MHz, Cores: 3840, VRAM: 16GB GDDR6, TDP: 650W, PCIe slot: PCIe 4.0 x16','img/vga/ASUS_TUF_Gaming_Radeon_RX_6800_OC_Edition_16GB_GDDR6.png','3'),(12,'GIGABYTE Radeon RX 7900 XT GAMING OC 20G',1277,'Base clock: 2535MHz, Cores: 5376, VRAM: 20GB GDDR6, TDP: 800W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_Radeon_RX_7900_XT_GAMING_OC_20G.jpg','3'),(13,'ASUS TUF Gaming Radeon RX 7900 XTX OC Edition 24GB GDDR6',1533,'Base clock: 2565MHz, Cores: 6144, VRAM: 20GB GDDR6, TDP: 850W,PCIe slot: PCIe 4.0 x16 ','img/vga/ASUS_TUF_Gaming_Radeon_RX_7900_XTX_OC_Edition_24GB_GDDR6.jpg','3'),(14,'GIGABYTE AORUS Radeon RX 6900 XT MASTER 16G',1703,'Base clock: 2335MHz, Cores: 5120, VRAM: 16GB GDDR6, TDP: 850W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_AORUS_Radeon_RX_6900_XT_MASTER_16G.png','3');
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

-- Dump completed on 2023-06-16 10:07:03
