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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Case_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
INSERT INTO `case` VALUES (1,'JETEK EM1',330,NULL,'img/case/JETEK_EM1.jpg',1),(2,'Jetek Mini I8-22B',490,NULL,'img/case/Jetek_Mini_I8_22B.png',1),(3,'XIGMATEK NYA 3F RGB',690,NULL,'img/case/XIGMATEK_NYA_3F_RGB.png',1),(4,'1st Player XF Black',890,NULL,'img/case/1st_Player_XF_Black.jpg',1),(5,'MIK TN10',990,NULL,'img/case/MIK_TN10.jpg',1),(6,'Cougar Archon 2 Mesh White RGB',1150,NULL,'img/case/Cougar_Archon_2_Mesh_White_RGB.jpg',1),(7,'MIK LV12 M BLACK',1230,NULL,'img/case/MIK_LV12_M_BLACK.png',1),(8,'MIK LV12 M WHITE',1330,NULL,'img/case/MIK_LV12_M_WHITE.png',1),(9,'MIK LV12 BLACK',1690,NULL,'img/case/MIK_LV12_BLACK.png',1),(10,'Cougar DarkBlader X7 Midnight Green',1690,NULL,'img/case/Cougar_DarkBlader_X7_Midnight_Green.png',1),(11,'JONSBO D31 MESH WHITE',231,NULL,'img/case/jonsbo_d31_mesh_white.jpg',1),(12,'JONSBO D31 MESH BLACK',302,NULL,'img/case/jonsbo_d31_mesh_black.jpg',1),(13,'GAMING HAWK F1 BLACK',504,NULL,'img/case/hawk_f1_black.jpg',1),(14,'GAMING HAWK F1 WHITE',476,NULL,'img/case/hawk_f1_white.jpg',1),(15,'CORSAIR 4000D AIRFLOW TG BLACK',674,NULL,'img/case/corsair_4000d_airflow_tg_black.jpg',1),(16,'CORSAIR 4000D AIRFLOW TG WHITE',723,NULL,'img/case/corsair_4000d_airflow_tg_white.jpg',1),(17,'COUGAR ARCHON 2 MESH BLACK RGB',456,NULL,'img/case/COUGAR_ARCHON_2_MESH_BLACK_RGB.png',1),(18,'XIGMATEKELITE ONE ARCTIC 3F',673,NULL,'img/case/XIGMATEKELITE_ONE_ARCTIC_3F.png',1),(19,'VITRA POSEIDON R15 RGB BLACK',423,NULL,'img/case/VITRA_POSEIDON_R15_RGB_BLACK.png',1),(20,'VITRA CERES V308 ARGB 1FRGB WHITE',833,NULL,'img/case/VITRA_CERES_V308_ARGB_1FRGB_WHITE.png',1),(21,'VITRA CERES V305 G 3FRGB BLACK',732,NULL,'img/case/VITRA_CERES_V305_G_3FRGB_BLACK.png',1),(22,'LIAN LI PC O11 DYNAMIC EVO WHITE',478,NULL,'img/case/LIAN_LI_PC_O11_DYNAMIC_EVO_WHITE.png',1),(23,'INFINITY JIKAN',222,NULL,'img/case/INFINITY_JIKAN.png',1),(24,'COUGAR DUOFACE RGB',543,NULL,'img/case/COUGAR_DUOFACE_RGB.png',1),(25,'COUGAR DARKBLADER G ARGB',642,NULL,'img/case/COUGAR_DARKBLADER_G_ARGB.png',1),(26,'COOLER MASTER MASTERBOX 520 ARGB WHITE',345,NULL,'img/case/COOLER_MASTER_MASTERBOX_520_ARGB_WHITE.png',1),(27,'JONSBO C6 BLACK',231,NULL,'img/case/JONSBO_C6_BLACK.png',1),(28,'JONSBO C6 HANDLE BLACK',356,NULL,'img/case/JONSBO_C6_HANDLE_BLACK.png',1),(29,'JONSBO C6 HANDLE WHITE',423,NULL,'img/case/JONSBO_C6_HANDLE_WHITE.png',1),(30,'JONSBO C6 WHITE',389,NULL,'img/case/JONSBO_C6_WHITE.png',1),(31,'JONSBO N2 BLACK',342,NULL,'img/case/JONSBO_N2_BLACK.png',1),(32,'JONSBO N2 WHITE',356,NULL,'img/case/JONSBO_N2_WHITE.png',1),(33,'Lian Li A4 H2O X4',653,NULL,'img/case/Lian_Li_A4_H2O_X4.png',1),(34,'LIAN LI PC O11 Dynamic Mini Air Black',562,NULL,'img/case/LIAN_LI_PC_O11_Dynamic_Mini_Air_Black.png',1),(35,'Slath Mini ITX',478,NULL,'img/case/Slath_Mini_ITX.png',1);
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_ID` int NOT NULL AUTO_INCREMENT,
  `category_Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Gaming',1),(2,'MiniPC',1),(3,'WorkStation',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CPU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
INSERT INTO `cpu` VALUES (1,'INTEL Xeon Max 9462',7995,NULL,'img/cpu/Intel_Xeon_Max_9462.jpg',1),(2,'INTEL I3 13100T',134,NULL,'img/cpu/INTEL_I3_13100T.jpg',1),(3,'INTEL I3 13100F',127,NULL,'img/cpu/INTEL_I3_13100F.jpg',1),(4,'AMD PRO ThreadRipper 5995X',7452,NULL,'img/cpu/AMD_PRO_ThreadRipper_5995X.jpg',1),(5,'AMD RYZEN 3 5300G',130,NULL,'img/cpu/AMD_RYZEN_3_5300G.jpg',1),(6,'AMD RYZEN 3 3300X',135,NULL,'img/cpu/amd_3300x.jpg',1),(7,'AMD Ryzen 5 7600X',299,NULL,'img/cpu/ryzen5_7600_voi_7600x.jpg',1),(8,'AMD Ryzen 7 7700',379,NULL,'img/cpu/ryzen7_7700_voi_7700x.jpg',1),(9,'AMD Ryzen 9 7900X',529,NULL,'img/cpu/ryzen9_7900_voi_7900x.jpg',1),(10,'Intel Core i5-13500F',212,NULL,'img/cpu/i5_13500_voi_i5_13500F.jpg',1),(11,'Intel Core i7-13700F',364,NULL,'img/cpu/i7_13700_voi_i7_13700F.jpg',1),(12,'Intel Core i9-13900F',529,NULL,'img/cpu/i9_13900_voi_i9_13900F.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,1,'2023-06-20','Good product','img/feedback/XIGMATEK_NYA_3F_RGB_1.png',5,1),(2,3,1,'2023-06-21','Greate product','img/feedback/XIGMATEK_NYA_3F_RGB_2.png',4,1);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_response`
--

DROP TABLE IF EXISTS `feedback_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_response` (
  `Response_ID` int NOT NULL AUTO_INCREMENT,
  `Feedback_ID` int DEFAULT NULL,
  `User_ID` int DEFAULT NULL,
  `Response_date` date DEFAULT NULL,
  `Response_content` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`Response_ID`),
  KEY `FK_Feedback_Response_Feedback_HE237402_idx` (`Feedback_ID`),
  KEY `FK_Feedback_Response_User_HE823740_idx` (`User_ID`),
  CONSTRAINT `FK_Feedback_Response_Feedback_HE237402` FOREIGN KEY (`Feedback_ID`) REFERENCES `feedback` (`Feedback_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Feedback_Response_User_HE823740` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_response`
--

LOCK TABLES `feedback_response` WRITE;
/*!40000 ALTER TABLE `feedback_response` DISABLE KEYS */;
INSERT INTO `feedback_response` VALUES (1,1,5,'2023-06-23','Thank you for choosing our product');
/*!40000 ALTER TABLE `feedback_response` ENABLE KEYS */;
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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Mainboard_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainboard`
--

LOCK TABLES `mainboard` WRITE;
/*!40000 ALTER TABLE `mainboard` DISABLE KEYS */;
INSERT INTO `mainboard` VALUES (1,'MAINBOARD ASUS PRIME H510M-K ',72,NULL,'img/mainboard/MAINBOARD_ASUS_PRIME_H510MK .jpg',1),(2,'MAINBOARD MSI H510M PRO-E',70,NULL,'img/mainboard/MAINBOARD_MSI_H510M_PROE.jpg',1),(3,'MAINBOARD ASUS TUF GAMING B550M-PLUS WIFI II',160,NULL,'img/mainboard/MAINBOARD_ASUS_TUF_GAMING_B550MPLUS_WIFI_II.jpg',1),(4,'MAINBOARD ASUS PRIME H510M-K R2.0 - CSM (TRAY)',69,NULL,'img/mainboard/MAINBOARD_ASUS_PRIME_H510MK_R2.0_CSM_(TRAY).jpg',1),(5,'MAINBOARD MSI PRO Z790-P WIFI DDR4',272,NULL,'img/mainboard/MAINBOARD_MSI_PRO_Z790P_WIFI_DDR4.jpg',1),(6,'MAINBOARD ASUS Prime Z790-A WiFi 6E',425,NULL,'img/mainboard/MAINBOARD_ASUS_Prime_Z790A_WiFi_6E.jpg',1),(7,'Mainboard MSI PRO B660M-E DDR4',114,NULL,'img/mainboard/MAINBOARD_MSI_PRO_B660M_E_DDR4.jpg',1),(8,'ASUS PRIME Z790-P WIFI-CSM',499,NULL,'img/mainboard/ASUS_PRIME_Z790P_WIFI_CSM.jpg',1),(9,'Gigabyte B550M K AM4 Micro-ATX',139,NULL,'img/mainboard/Gigabyte_B550M_K_AM4_MicroATX.jpg',1),(10,'Gigabyte B560 HD3 Intel',149,NULL,'img/mainboard/Gigabyte_B560_HD3.jpg',1),(11,'Gigabyte Z790 AORUS ELITE AX',429,NULL,'img/mainboard/Gigabyte_Z690_AORUS_ELITE_AX_V2.jpg',1),(12,'MSI MPG B650 Edge WiFi AM5 ATX',499,NULL,'img/mainboard/MSI_MPG_B650_Edge_WiFi_AM5_ATX.jpg',1),(13,'Asus PRIME B760M-A WIFI',255,NULL,'img/mainboard/MSI_PRO_B760MA_WIFI.jpg',1),(14,'MSI PRO Z790-A WIFI',439,NULL,'img/mainboard/MSI_PRO_Z790A_WIFI.jpg',1),(15,'ASUS B550-PLUS TUF Gaming Wi-Fi',259,NULL,'img/mainboard/ASUS_B550_PLUS_TUF_Gaming_WiFi.jpg',1);
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
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset` (
  `Reset_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Reset_Password` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `Time_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Reset_ID`),
  KEY `FK_Password_Reset_User_HE091283_idx` (`User_ID`),
  CONSTRAINT `FK_Password_Reset_User_HE091283` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset`
--

LOCK TABLES `password_reset` WRITE;
/*!40000 ALTER TABLE `password_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset` ENABLE KEYS */;
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
INSERT INTO `pc` VALUES (1,1,2,1,1,1,6,3),(2,2,3,4,5,2,7,5),(3,1,1,5,3,3,3,1),(4,3,4,2,4,1,4,2),(5,4,3,3,6,2,5,3),(6,5,6,4,8,4,7,4),(7,15,7,6,4,5,2,5),(8,12,3,7,5,6,3,6),(9,13,8,8,6,7,4,7),(10,14,4,9,8,3,6,8),(11,8,7,2,9,4,8,9),(12,9,9,3,1,5,9,10),(13,10,10,4,2,6,1,11),(14,11,12,5,3,8,2,12),(15,5,11,1,4,3,3,13),(16,6,4,2,5,2,10,14),(17,7,5,4,7,3,1,15),(18,2,6,5,8,4,3,16),(19,3,2,6,9,5,4,17),(20,4,3,4,10,6,5,18),(21,5,4,3,12,2,6,19),(22,6,7,5,13,3,7,20),(23,11,8,7,14,4,2,21),(24,12,5,8,11,7,3,22),(25,13,3,9,12,8,4,23),(26,14,1,2,13,2,6,24),(27,15,2,1,14,1,7,25),(28,6,3,7,11,2,8,26),(29,5,5,3,10,3,9,1),(30,7,6,4,6,7,1,2),(31,1,1,1,1,1,1,2),(32,2,2,2,2,2,2,4),(33,3,3,3,3,3,3,5),(34,4,4,4,4,4,4,6),(35,5,5,5,5,5,5,7),(36,6,6,6,6,6,6,8),(37,7,7,7,7,7,7,10),(38,8,8,8,8,8,8,12),(39,9,9,9,9,1,9,14),(40,10,10,1,10,2,10,16),(41,11,11,2,11,3,1,17),(42,12,12,3,12,4,2,19),(43,13,1,4,13,5,3,21),(44,14,2,5,14,6,4,23),(45,15,3,6,1,7,5,24),(46,1,4,7,2,8,6,27),(47,2,5,8,3,1,7,28),(48,3,6,9,4,2,8,29),(49,4,7,1,5,3,9,30),(50,5,8,2,6,4,10,31),(51,6,9,3,7,5,1,32),(52,7,10,4,8,6,2,33),(53,8,11,5,9,7,3,34),(54,9,12,6,10,8,4,35),(55,10,1,7,11,1,5,28),(56,11,2,8,12,2,6,29),(57,12,3,9,13,3,7,32),(58,13,4,1,14,4,8,33),(59,14,5,2,1,5,9,34),(60,15,6,3,2,6,10,27);
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
  `Description` longtext,
  `Status` tinyint(1) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Product_Status_ID` int DEFAULT NULL,
  `Category_ID` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `FK_Product_Product_Status_HE170004_idx` (`Product_Status_ID`),
  KEY `FK_Product_Category_HE170011_idx` (`Category_ID`),
  CONSTRAINT `FK_Product_Category_HE170011` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`category_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Product_Product_Status_HE170004` FOREIGN KEY (`Product_Status_ID`) REFERENCES `product_status` (`Product_Status_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'QuantumEdge','Dive into a cutting-edge gaming experience with QuantumEdge. This high-performance gaming PC combines advanced technology and lightning-fast processing for immersive gameplay like never before.',1,3,1,1),(2,'CyberByte','Unleash unparalleled power and precision with CyberByte. This gaming PC dominates the virtual battlefield with lightning-fast speeds and flawless execution, giving you the ultimate gaming edge.',1,4,2,1),(3,'TechNexus','Experience the convergence of technology and gaming prowess with TechNexus. This high-performance gaming PC offers seamless connectivity, lightning-fast processing, and immersive visuals, empowering gamers to push boundaries and dominate the virtual realm.',1,5,0,1),(4,'AeroCore','Take flight with AeroCore, the gaming PC that soars above the competition. With its powerful hardware, advanced cooling system, and aerodynamic design, AeroCore delivers unparalleled performance, ensuring every gaming session is a thrilling and seamless experience.',1,3,0,1),(5,'SynthWave',' Immerse yourself in the neon-drenched world of SynthWave. This gaming PC combines retro aesthetics with futuristic power, offering blazing-fast speeds, stunning visuals, and a nostalgic gaming experience that will transport you to a realm where old-school charm meets cutting-edge technology.',1,2,1,1),(6,'MegaByte','Unleash the power of MegaByte, the titan of gaming PCs. With its exceptional processing capacity and lightning-fast speeds, MegaByte tears through the most demanding games, delivering a larger-than-life gaming experience that immerses you in a world of unparalleled excitement and adventure.',1,3,0,1),(7,'TurboTech','Experience gaming at warp speed with TurboTech. This powerhouse gaming PC is fueled by turbocharged performance, offering blistering speeds, unrivaled responsiveness, and seamless gameplay, leaving your opponents in the dust and propelling you to victory.',1,4,2,1),(8,'NexusPrime','Step into the realm of gaming supremacy with NexusPrime. This gaming PC serves as the nexus of cutting-edge technology, delivering breathtaking graphics, lightning-fast processing, and seamless connectivity, ensuring you stay at the forefront of the gaming universe.',1,6,0,1),(9,'DynaPulse','Harness the dynamic power of DynaPulse, the gaming PC that pulsates with speed and precision. With its unmatched processing capabilities and powerful performance, DynaPulse delivers an adrenaline-fueled gaming experience, allowing you to unleash your true gaming potential.',1,5,0,1),(10,'BlazeForce',' Ignite your gaming passion with BlazeForce. This gaming PC sets the gaming world on fire, combining blazing-fast speeds, intense graphics, and immersive audio, enabling you to unleash your skills and dominate the gaming arena with an unstoppable force.',1,7,1,1),(11,'AlphaTech','Rise to alpha status with AlphaTech, the gaming PC that embodies power and sophistication. With its state-of-the-art components, cutting-edge features, and unmatched performance, AlphaTech empowers you to conquer every virtual challenge and emerge as the ultimate gaming champion.',1,2,0,1),(12,'PowerXcel','Experience unparalleled power and precision with PowerXcel. This gaming PC combines exceptional processing capabilities, high-speed connectivity, and stunning visuals to deliver an electrifying gaming experience that propels you to the top of the leaderboard.',1,3,1,1),(13,'ElectroByte',' Enter the realm of electrifying gaming with ElectroByte. This gaming PC harnesses lightning-fast processing and stunning graphics to create a gaming experience that sparks with excitement, immersing you in a world where every pixel comes alive.',1,4,0,1),(14,'SwiftSpark','Unleash your gaming potential with SwiftSpark, the gaming PC that ignites your performance. With its swift processing, seamless gameplay, and stunning visuals, SwiftSpark ensures that every gaming moment is a spark of brilliance.',1,5,0,1),(15,'HyperNova','Blast off into gaming greatness with HyperNova. This gaming PC harnesses the power of a cosmic explosion, offering exceptional performance, stunning graphics, and unrivaled speed, transporting you to the outer reaches of the gaming universe.',1,6,1,1),(16,'PixelForge','Craft your gaming masterpiece with PixelForge. This gaming PC delivers pixel-perfect visuals, exceptional processing power, and immersive gameplay, allowing you to forge your own path and create unforgettable gaming experiences.',1,1,0,1),(17,'CyberFusion','Immerse yourself in the fusion of cybernetic power and gaming excellence with CyberFusion. This gaming PC combines cutting-edge technology, lightning-fast speeds, and stunning visuals to create a seamless fusion of virtual worlds and unparalleled gaming adventures.',1,2,2,1),(18,'TechVortex','Step into the whirlwind of gaming prowess with TechVortex. This gaming PC harnesses lightning-fast speeds, immersive graphics, and seamless connectivity, propelling you into the heart of the action with unparalleled precision and performance.',1,6,0,1),(19,'QuantumPulse','Experience gaming with quantum precision and pulse-pounding speed with QuantumPulse. This high-performance gaming PC utilizes advanced quantum technology to deliver mind-bending processing power, stunning visuals, and lightning-fast response times, ensuring you stay ahead of the competition.',1,7,2,1),(20,'SynthTech','Immerse yourself in a retro-futuristic gaming experience with SynthTech. This gaming PC combines nostalgia-inducing aesthetics with cutting-edge technology, providing smooth gameplay, vibrant visuals, and a captivating synthwave soundtrack that transports you back in time while propelling you into the future of gaming.',1,8,0,1),(21,'MegaCore',' Unleash the might of MegaCore, the gaming PC powerhouse. With its exceptional processing capabilities and lightning-fast speeds, MegaCore delivers uncompromising performance, allowing you to conquer virtual worlds with ease and precision.',1,3,1,1),(22,'TurboBlaze','Ignite your gaming passion with TurboBlaze, the gaming PC that blazes a trail to victory. With turbocharged performance, blazing-fast speeds, and immersive visuals, TurboBlaze empowers you to push the limits, delivering an intense and exhilarating gaming experience.',1,4,1,1),(23,'NexusByte','Discover the perfect balance of power and connectivity with NexusByte. This gaming PC seamlessly blends high-performance components with advanced connectivity options, allowing you to unlock new gaming horizons, connect with fellow gamers, and dominate the virtual realm',1,5,0,1),(24,'DynaForce',' Unleash the force of gaming with DynaForce. This gaming PC packs a punch with its dynamic processing power and lightning-fast speeds, delivering an explosive gaming experience that propels you to new heights of performance and excitement.',1,6,2,1),(25,'RapidTech','Experience gaming at breakneck speeds with RapidTech. This high-speed gaming PC combines cutting-edge technology with exceptional performance, ensuring swift and seamless gameplay that keeps you at the forefront of the action.',1,7,0,1),(26,'AlphaByte','Rise to alpha status with AlphaByte, the gaming PC that commands respect. With its formidable processing power and advanced features, AlphaByte empowers you to dominate the gaming landscape, unleashing your true gaming potential and claiming your place as the alpha gamer.',1,8,1,1),(27,'PowerCore','Tap into unrivaled power and performance with PowerCore. This gaming PC harnesses raw processing power and superior graphics capabilities, enabling you to tackle the most demanding games with ease and precision, and unleashing a new level of gaming excellence.',1,9,0,1),(28,'ElectroPulse','Feel the electrifying energy of gaming with ElectroPulse. This gaming PC delivers lightning-fast processing, stunning visuals, and immersive audio, creating an electrifying gaming experience that sparks excitement and ignites your gaming passion.',1,3,2,1),(29,'SwiftTech',' Embrace the swiftness of gaming with SwiftTech. This gaming PC offers lightning-fast speeds, seamless gameplay, and fluid graphics, ensuring that your gaming experience is swift, responsive, and incredibly immersive.',1,4,2,1),(30,'HyperStream','Dive into a hyper-real gaming experience with HyperStream. This gaming PC delivers unparalleled speed and performance, immersing you in a world where every movement is lightning-quick, every detail is razor-sharp, and every game session is a thrilling adventure.',1,5,1,1),(31,'ElitePro Workstation','Experience professional-grade performance and reliability with the ElitePro Workstation. This powerhouse combines cutting-edge technology, exceptional processing power, and precision engineering to deliver an unmatched workstation experience for demanding professionals.',1,10,1,3),(32,'PowerForge Workstation','Unleash your creative potential with the PowerForge Workstation. Engineered for maximum productivity, this workstation combines relentless power, lightning-fast speeds, and advanced graphics capabilities, empowering you to tackle complex tasks with ease and unlock new levels of creativity.',1,9,1,3),(33,'OptimaTech Workstation','Achieve optimal performance and efficiency with the OptimaTech Workstation. This high-powered workstation is designed to deliver exceptional processing power, seamless multitasking, and reliable stability, making it the perfect companion for intensive workloads and resource-demanding tasks.',1,8,2,3),(34,'PrecisionMax Workstation','Experience precision and performance at its best with the PrecisionMax Workstation. This workstation is meticulously engineered to provide unmatched accuracy, top-tier processing capabilities, and advanced graphics, allowing professionals to push the boundaries of their work and achieve exceptional results.',1,9,1,3),(35,'ProVision Workstation','Gain a visionary edge with the ProVision Workstation. Equipped with cutting-edge technology and top-notch components, this workstation offers a robust and reliable platform for professionals to visualize, create, and innovate with utmost precision and efficiency.',1,5,1,3),(36,'WorkMaster Pro','Master your work with the WorkMaster Pro Workstation. This versatile powerhouse combines superior processing power, exceptional graphics, and comprehensive connectivity options, empowering professionals to tackle complex tasks, streamline workflows, and excel in their fields.',1,5,2,3),(37,'TechPro X Workstation','Experience the next level of professional computing with the TechPro X Workstation. Designed for demanding workloads and resource-intensive applications, this workstation delivers lightning-fast speeds, advanced performance, and unmatched reliability, ensuring professionals stay at the forefront of their industries.',1,6,2,3),(38,'EonWork Station','Step into a new era of productivity with the EonWork Station. This workstation combines futuristic design, exceptional processing capabilities, and innovative features, providing professionals with an immersive and efficient working environment to unlock their full potential.',1,7,2,3),(39,'MegaCore Workstation','Harness the mega power of the MegaCore Workstation. This high-performance workstation is built to handle complex tasks, intense workloads, and data-intensive applications, allowing professionals to achieve optimal productivity and tackle the most demanding projects with ease.',1,8,0,3),(40,'ProGenius Workstation','Tap into your genius with the ProGenius Workstation. This intelligently engineered workstation combines powerful performance, advanced features, and seamless connectivity, enabling professionals to unleash their creativity, optimize workflows, and bring their ideas to life with unmatched precision.',1,10,0,3),(41,'InnovatePro Workstation','Fuel innovation with the InnovatePro Workstation. This cutting-edge powerhouse is designed to inspire creativity, enhance collaboration, and drive breakthrough solutions, providing professionals with the tools they need to push boundaries, pioneer new ideas, and make a lasting impact.',1,12,0,3),(42,'TurboTech Workstation','Experience turbocharged performance with the TurboTech Workstation. Engineered for speed and efficiency, this workstation delivers lightning-fast processing, high-end graphics, and seamless multitasking capabilities, empowering professionals to turbocharge their productivity and achieve extraordinary results.',1,4,0,3),(43,'ApexWork Station','Reach the pinnacle of performance with the ApexWork Station. This top-tier workstation offers unparalleled processing power, exceptional graphics, and enterprise-level reliability, allowing professionals to scale new heights, tackle complex tasks, and elevate their work to new levels of excellence.',1,3,1,3),(44,'ProVisionX Workstation','Step into the future of professional computing with the ProVisionX Workstation. This advanced workstation combines cutting-edge technology, immersive visuals, and superior performance, offering professionals a platform to envision, create, and execute their projects with precision and confidence.',1,5,2,3),(45,'DynamoForce Workstation','Unleash dynamic force and performance with the DynamoForce Workstation. This workstation delivers lightning-fast speeds, unparalleled processing power, and robust reliability, empowering professionals to handle intensive workloads, process large datasets, and achieve exceptional results with ease.',1,7,1,3),(46,'NanoFusion Mini','Experience the fusion of power and compactness with the NanoFusion Mini. This mini PC packs a punch with its small form factor, delivering impressive performance, efficient multitasking, and seamless connectivity, making it the ideal companion for both work and entertainment on-the-go.',1,7,1,2),(47,'PocketTech MiniPC','Unleash the power of portability with the PocketTech MiniPC. This ultra-compact powerhouse offers exceptional performance and versatility in a pocket-sized package, allowing you to carry your workstation wherever you go, without compromising on power or functionality.',1,8,2,2),(48,'MicroMax Pro','Maximize your computing potential with the MicroMax Pro Mini PC. This pint-sized powerhouse combines powerful processing capabilities, advanced features, and expandable storage options, making it the perfect solution for space-conscious users who demand high performance in a compact form factor.',1,9,0,2),(49,'CompactCore Mini','Experience the core essentials of computing in a compact package with the CompactCore Mini. Designed for efficiency and convenience, this mini PC offers reliable performance, versatile connectivity, and a small footprint, making it an ideal choice for home or office setups where space is at a premium.',1,5,1,2),(50,'TinyTech MiniPC','Discover the big possibilities of the TinyTech MiniPC. Despite its small size, this mini PC delivers impressive performance, efficient multitasking, and seamless connectivity, enabling you to handle everyday computing tasks with ease while saving valuable desk space.',1,4,2,2),(51,'NanoBeam Mini','Harness the power of a miniaturized computing beam with the NanoBeam Mini. This mini PC combines sleek design, powerful processing, and versatile connectivity, allowing you to effortlessly beam through your daily computing tasks with efficiency and style.',1,6,2,2),(52,'MiniMax Ultra','Experience maximum performance in a mini form factor with the MiniMax Ultra. This mini PC offers a perfect blend of power and portability, delivering top-notch performance, expandability, and versatile connectivity options, making it an ideal choice for users who need high-end computing capabilities on-the-go.',1,7,1,2),(53,'MicroBlade Pro','Slice through your computing needs with the MicroBlade Pro Mini PC. This compact powerhouse features cutting-edge performance, robust features, and exceptional energy efficiency, making it the perfect solution for users who require both power and mobility in their computing setup.',1,3,1,2),(54,'PocketPower MiniPC','Carry the power of a full-fledged computer in your pocket with the PocketPower MiniPC. Despite its compact size, this mini PC packs a punch with its impressive processing power, storage options, and versatile connectivity, allowing you to stay productive no matter where you are.',1,10,2,2),(55,'NanoEdge Mini','Immerse yourself in a world of computing possibilities with the NanoEdge Mini. This mini PC features a stunning edge-to-edge display, powerful performance, and seamless connectivity, providing a captivating visual experience and optimal productivity in a space-saving design.',1,12,0,2),(56,'MicroFusion Pro','Unleash the fusion of power and compactness with the MicroFusion Pro Mini PC. Equipped with advanced features, high-performance components, and expandable storage, this mini PC offers a seamless computing experience without compromising on power or versatility.',1,11,0,2),(57,'CompactCube MiniPC','Think inside the box with the CompactCube MiniPC. This mini PC offers a space-saving design, reliable performance, and efficient multitasking capabilities, making it a perfect choice for users who desire a compact and clutter-free computing solution.',1,6,0,2),(58,'MiniMighty Pro','Embrace the might of the MiniMighty Pro Mini PC. Packed with powerful hardware, advanced features, and seamless connectivity options, this mini PC delivers exceptional performance and versatility, making it an ideal companion for intensive tasks and multimedia experiences.',1,7,1,2),(59,'MicroGlide Mini','Glide through your computing tasks with ease using the MicroGlide Mini. This compact and sleek mini PC combines smooth performance, efficient multitasking, and energy-saving features, providing a seamless computing experience in a small and stylish package.',1,4,2,2),(60,'PocketRocket MiniPC','Ignite your productivity with the PocketRocket MiniPC. Designed for users who require fast and efficient computing on-the-go, this mini PC delivers blazing-fast speeds, compact portability, and versatile connectivity, allowing you to achieve peak performance wherever you are.',1,8,2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'img/product/XIGMATEK_NYA_3F_RGB_1.png'),(2,1,'img/product/XIGMATEK_NYA_3F_RGB_2.png'),(3,1,'img/product/XIGMATEK_NYA_3F_RGB_3.png');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_status`
--

DROP TABLE IF EXISTS `product_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_status` (
  `Product_Status_ID` int NOT NULL,
  `Product_Status_Name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Product_Status_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_status`
--

LOCK TABLES `product_status` WRITE;
/*!40000 ALTER TABLE `product_status` DISABLE KEYS */;
INSERT INTO `product_status` VALUES (0,'Normal',1),(1,'New',1),(2,'Sale',1);
/*!40000 ALTER TABLE `product_status` ENABLE KEYS */;
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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PSU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu`
--

LOCK TABLES `psu` WRITE;
/*!40000 ALTER TABLE `psu` DISABLE KEYS */;
INSERT INTO `psu` VALUES (1,'Jetek A200M',17,NULL,'img/psu/Jetek_A200M.jpg',1),(2,'Jetek 350W Elite V2',20,NULL,'img/psu/Jetek_350W_Elite_V2.jpeg',1),(3,'Jetek J400',26,NULL,'img/psu/Jetek_J400.jpg',1),(4,'1st Player PS-500FK',36,NULL,'img/psu/1st_Player_PS500FK.jpg',1),(5,'Deepcool PF450D - 80 Plus',36,NULL,'img/psu/Deepcool_PF450D_80_Plus.jpg',1),(6,'Gigabyte P450B - 80 Plus Bronze',38,NULL,'img/psu/Gigabyte_P450B_80_Plus_Bronze.png',1),(7,'FSP HV PRO 550W - 80 Plus Bronze',42,NULL,'img/psu/FSP_HV_PRO_550W_80_Plus_Bronze.jpg',1),(8,'Gigabyte P550B - 80 Plus Bronze',46,NULL,'img/psu/Gigabyte_P550B__80_Plus_Bronze.png',1),(9,'Corsair AX1600i',551,NULL,'img/psu/Corsair_AX1600i.jpg',1),(10,'Gigabyte AORUS P1200W Platinum',425,NULL,'img/psu/Gigabyte_AORUS_P1200W_Platinum.png',1);
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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RAM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ram`
--

LOCK TABLES `ram` WRITE;
/*!40000 ALTER TABLE `ram` DISABLE KEYS */;
INSERT INTO `ram` VALUES (1,'RAM DDR5 G.Skill Trident Z5 RGB',299,'Capacity: 32GB (16GBx2),Memory Type: DDR5,Rated Frequency: 5600MHz','img/ram/RAM_DDR5_G.Skill_Trident_Z5_RGB.jpg',1),(2,'RAM DDR5 TeamGroup T-Force Delta TUF RGB',255,'Capacity: 32GB (16GBx2),Memory Type: DDR5,Rated Frequency: 5200MHz','img/ram/RAM_DDR5_TeamGroup_T-Force_Delta_TUF _RGB.jpg',1),(3,'RAM DDR5 Adata XPG Lancer',249,'Capacity: 16GB (16GBx1),Memory Type: DDR5,Rated Frequency: 6000MHz','img/ram/RAM_DDR5_Adata_XPG_Lancer.png',1),(4,'RAM DDR5 Kingston Fury Beast',149,'Capacity: 16GB (16GBx1),Memory Type: DDR5,Rated Frequency: 5200MHz','img/ram/RAM_DDR5_Kingston_FuryBeast.jpg',1),(5,'RAM DDR5 Kingston Fury Beast RGB',129,'Capacity: 16GB (8GBx2),Memory Type: DDR5,Rated Frequency: 5200MHz','img/ram/RAM_DDR5_Kingston_FuryBeast_RGB.jpg',1),(6,'RAM DDR4 G.Skill Ripjaws V',59,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3200MHz','img/ram/RAM_DDR4_G.Skill_Ripjaws_V.png',1),(7,'Ram DDR4 PNY XLR8 Low Profile',55,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3200MHz','img/ram/RAM_DDR4_PNY_XLR8_LowProfile.jpg',1),(8,'RAM DDR4 Kingston Fury Beast ',65,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3600MHz','img/ram/RAM_DDR4_Kingston_FuryBeast.jpg',1),(9,'RAM DDR4 Kingston Fury Beast RGB SE',65,'Capacity: 8GB (8GBx1),Memory Type: DDR4,Rated Frequency: 3600MHz','img/ram/RAM_DDR4_Kingston_FuryBeast_RGB_SE.png',1);
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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Storage_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,'WD Blue',39,NULL,'img/storage/WD_Blue.png',1),(2,'WD Black',85,NULL,'img/storage/WD_Black.png',1),(3,'WD Red',219,NULL,'img/storage/WD_Red.jpg',1),(4,'Samsung 980 V8V1T0BW',60,NULL,'img/storage/Samsung_980_V8V500BW.jpg',1),(5,'Samsung 970 EVO Plus',65,NULL,'img/storage/Samsung_970_EVO_Plus.jpg',1),(6,'Samsung 870 Qvo',110,NULL,'img/storage/Samsung_870_Qvo.jpg',1),(7,'SSD Kingston A400 960GB SA400S37/960G',85,NULL,'img/storage/Kingston_A400_960GB_SA400S37.png',1),(8,'MSI SPATIUM M390',94,NULL,'img/storage/MSI_SPATIUM_M390.jpg',1);
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
INSERT INTO `user` VALUES (1,'Cao Hoàng Việt','vietchhe170297@fpt.edu.vn','Viet11111',NULL,'0935091066	','Hà Nội, Việt Nam',1,4),(2,'Nguyễn Thị B','manhndhe170523@fpt.edu.vn','Manhdz2411',NULL,'0123456789','Hoà Lạc',1,1),(3,'Phạm Cao Đức Minh','minhpcdhe170377@fpt.edu.vn		','Minh12345',NULL,'0868659100	','Hà Nội, Việt Nam',1,1),(4,'Bùi Tiến Đạt','datbthe170585@fpt.edu.vn		','Dat123456',NULL,'0389501823	','Hà Nội, Việt Nam',1,2),(5,'Nguyễn Duy Anh','anhndhe170163@fpt.edu.vn		','Anh123456',NULL,'0836889919	','Hà Nội, Việt Nam',1,3),(6,'Nguyễn Văn A','manh24112003@gmaiil.com','Test12345',NULL,'0123456789','Hà Nội, Việt Nam',1,1),(13,'Nguyễn Đức Mạnh','manhduc150@yahoo.com','Manhdz2411',NULL,'0365616718','Hà Nội',1,1);
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
  `Status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`VGA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vga`
--

LOCK TABLES `vga` WRITE;
/*!40000 ALTER TABLE `vga` DISABLE KEYS */;
INSERT INTO `vga` VALUES (1,'GIGABYTE GeForce RTX 4090 GAMING OC 24G',2258,'Base clock: 2535 MHz, CUDA cores: 16384, VRAM: 24GB GDDR6X, TDP: 1000W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_4090_GAMING_OC_24G.jpg',1),(2,'ASUS Dual GeForce RTX 3060 White 8G GDDR6',362,'Base clock: 1807MHz, CUDA cores: 3584, VRAM: 8GB GDDR6, TDP: 650W, PCIe slot: PCIe x16','img/vga/ASUS_Dual_GeForce_RTX_3060_White_8G_GDDR6.png',1),(3,'Gigabyte GeForce GTX 1660 SUPER OC 6GB GDDR6',225,'Base clock: 1830MHz, CUDA cores: 1408, VRAM: 6GB GDDR6, TDP: 450W, PCIe slot: PCIe 3.0 x16','img/vga/Gigabyte_GeForce_GTX_1660_SUPER_OC_6GB_GDDR6.png',1),(4,'GIGABYTE AORUS GeForce RTX 4060 Ti ELITE 8G',619,'Base clock: 2655MHz, CUDA cores: 4352, VRAM: 8GB GDDR6, TDP: 500W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_AORUS_GeForce_RTX_4060_Ti_ELITE_8G.jpg',1),(5,'GIGABYTE AORUS GeForce RTX 4090 XTREME WATERFORCE 24G',2513,'Base clock: 2565MHz, CUDA cores: 16384, VRAM: 24GB GDDR6X, TDP: 850W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_AORUS_GeForce_RTX_4090_XTREME_WATERFORCE_24G.jpg',1),(6,'GIGABYTE GeForce RTX 3060 Ti VISION OC 8G (LHR)',532,'Base clock: 1755MHz, CUDA cores: 4864, VRAM: 8GB GDDR6, TDP: 650W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_3060_Ti_VISION_OC_8G_(LHR).png',1),(7,'GIGABYTE GeForce RTX 4060 Ti EAGLE 8G',532,'Base clock: 2535MHz, CUDA cores: 4352, VRAM: 8GB GDDR6, TDP: 500W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_4060_Ti_EAGLE_8G.jpg',1),(8,'GIGABYTE GeForce RTX 4070 Ti AERO OC 12G',1235,'Base clock: 2640MHz, CUDA cores: 7680, VRAM: 12GB GDDR6X, TDP: 750W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_GeForce_RTX_4070_Ti_AERO_OC_12G.jpg',1),(9,'GIGABYTE Radeon RX 6600 XT GAMING OC 8G',555,'Base clock: 1968MHz, Cores: 2048, VRAM: 8GB GDDR6, TDP: 500W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_Radeon_RX_6600_XT_GAMING_OC_8G.png',1),(10,'GIGABYTE Radeon RX 6700 XT GAMING OC 12G',1064,'Base clock: 2622MHz, Cores: 2560, VRAM: 12GB GDDR6, TDP: 650W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_Radeon_RX_6700_XT_GAMING_OC_12G.png',1),(11,'ASUS TUF Gaming Radeon RX 6800 OC Edition 16GB GDDR6',1193,'Base clock: 2190MHz, Cores: 3840, VRAM: 16GB GDDR6, TDP: 650W, PCIe slot: PCIe 4.0 x16','img/vga/ASUS_TUF_Gaming_Radeon_RX_6800_OC_Edition_16GB_GDDR6.png',1),(12,'GIGABYTE Radeon RX 7900 XT GAMING OC 20G',1277,'Base clock: 2535MHz, Cores: 5376, VRAM: 20GB GDDR6, TDP: 800W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_Radeon_RX_7900_XT_GAMING_OC_20G.jpg',1),(13,'ASUS TUF Gaming Radeon RX 7900 XTX OC Edition 24GB GDDR6',1533,'Base clock: 2565MHz, Cores: 6144, VRAM: 20GB GDDR6, TDP: 850W,PCIe slot: PCIe 4.0 x16 ','img/vga/ASUS_TUF_Gaming_Radeon_RX_7900_XTX_OC_Edition_24GB_GDDR6.jpg',1),(14,'GIGABYTE AORUS Radeon RX 6900 XT MASTER 16G',1703,'Base clock: 2335MHz, Cores: 5120, VRAM: 16GB GDDR6, TDP: 850W, PCIe slot: PCIe 4.0 x16','img/vga/GIGABYTE_AORUS_Radeon_RX_6900_XT_MASTER_16G.png',1);
/*!40000 ALTER TABLE `vga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `Wishlist_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Product_ID` int DEFAULT NULL,
  PRIMARY KEY (`Wishlist_ID`),
  KEY `FK_Wishlist_User_HE179382_idx` (`User_ID`),
  KEY `FK_Wishlist_Product_HE108237_idx` (`Product_ID`),
  CONSTRAINT `FK_Wishlist_Product_HE108237` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Wishlist_User_HE179382` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-21 20:38:35
