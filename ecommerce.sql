-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: salesdb
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `attribute_category`
--

DROP TABLE IF EXISTS `attribute_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_category` (
  `attribute_category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`attribute_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_category`
--

LOCK TABLES `attribute_category` WRITE;
INSERT INTO `attribute_category` VALUES (1,'Physical Attributes'),(2,'Technical Specs');
UNLOCK TABLES;

--
-- Table structure for table `attribute_type`
--

DROP TABLE IF EXISTS `attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_type` (
  `attribute_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`attribute_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_type`
--

LOCK TABLES `attribute_type` WRITE;
INSERT INTO `attribute_type` VALUES (1,'text'),(2,'number'),(3,'boolean');
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
INSERT INTO `brand` VALUES (1,'Nike','Popular sportswear brand'),(2,'Apple','Technology and electronics company'),(3,'Zara','Fashion retail brand');
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hex_code` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
INSERT INTO `color` VALUES (1,'Red','#FF0000'),(2,'Black','#000000'),(3,'White','#FFFFFF');
UNLOCK TABLES;

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute` (
  `attribute_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `attribute_category_id` int DEFAULT NULL,
  `attribute_type_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `product_id` (`product_id`),
  KEY `attribute_category_id` (`attribute_category_id`),
  KEY `attribute_type_id` (`attribute_type_id`),
  CONSTRAINT `product_attribute_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `product_attribute_ibfk_2` FOREIGN KEY (`attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`),
  CONSTRAINT `product_attribute_ibfk_3` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute`
--

LOCK TABLES `product_attribute` WRITE;
INSERT INTO `product_attribute` VALUES (1,1,1,1,'Material','Mesh'),(2,2,2,1,'Operating System','iOS 17'),(3,3,1,1,'Material','Denim'),(4,3,1,2,'Weight','1.2');
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
INSERT INTO `product_category` VALUES (1,'Clothing','Apparel for men, women, and children'),(2,'Electronics','Phones, laptops, and gadgets'),(3,'Footwear','Shoes and sandals');
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `product_item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
INSERT INTO `product_image` VALUES (1,1,'https://example.com/nike_black_42.jpg','Nike Running Shoe Size 42 Black'),(2,2,'https://example.com/nike_black_43.jpg','Nike Running Shoe Size 43 Black'),(3,3,'https://example.com/iphone14_white.jpg','iPhone 14 White'),(4,4,'https://example.com/zara_jacket_red_s.jpg','Zara Denim Jacket Small Red');
UNLOCK TABLES;

--
-- Table structure for table `product_item`
--

DROP TABLE IF EXISTS `product_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `variation_id` int DEFAULT NULL,
  `color_id` int DEFAULT NULL,
  `size_option_id` int DEFAULT NULL,
  `stock_quantity` int DEFAULT '0',
  `price_override` decimal(10,2) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `variation_id` (`variation_id`),
  KEY `color_id` (`color_id`),
  KEY `size_option_id` (`size_option_id`),
  CONSTRAINT `product_item_ibfk_1` FOREIGN KEY (`variation_id`) REFERENCES `product_variation` (`variation_id`),
  CONSTRAINT `product_item_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  CONSTRAINT `product_item_ibfk_3` FOREIGN KEY (`size_option_id`) REFERENCES `size_option` (`size_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_item`
--

LOCK TABLES `product_item` WRITE;
INSERT INTO `product_item` VALUES (1,1,2,4,10,NULL,'NIKE-RUN-BLK-42'),(2,1,2,5,8,NULL,'NIKE-RUN-BLK-43'),(3,2,3,NULL,5,950.00,'APPLE-IPHONE14-WHITE'),(4,3,1,1,15,NULL,'ZARA-JKT-RED-S');
UNLOCK TABLES;

--
-- Table structure for table `product_variation`
--

DROP TABLE IF EXISTS `product_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variation` (
  `variation_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`variation_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_variation_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variation`
--

LOCK TABLES `product_variation` WRITE;
INSERT INTO `product_variation` VALUES (1,1),(2,2),(3,3);
UNLOCK TABLES;

--
-- Table structure for table `productdetail`
--

DROP TABLE IF EXISTS `productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetail` (
  `OrderID` int DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `Products` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetail`
--

LOCK TABLES `productdetail` WRITE;
INSERT INTO `productdetail` VALUES (101,'John Doe','Laptop, Mouse'),(102,'Jane Smith','Tablet, Keyboard, Mouse'),(103,'Emily Clark','Phone'),(101,'John Doe','Laptop, Mouse'),(102,'Jane Smith','Tablet, Keyboard, Mouse'),(103,'Emily Clark','Phone');
UNLOCK TABLES;

--
-- Table structure for table `size_category`
--

DROP TABLE IF EXISTS `size_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size_category` (
  `size_category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`size_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_category`
--

LOCK TABLES `size_category` WRITE;
INSERT INTO `size_category` VALUES (1,'Clothing Sizes'),(2,'Shoe Sizes');
UNLOCK TABLES;

--
-- Table structure for table `size_option`
--

DROP TABLE IF EXISTS `size_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size_option` (
  `size_option_id` int NOT NULL AUTO_INCREMENT,
  `size_category_id` int DEFAULT NULL,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`size_option_id`),
  KEY `size_category_id` (`size_category_id`),
  CONSTRAINT `size_option_ibfk_1` FOREIGN KEY (`size_category_id`) REFERENCES `size_category` (`size_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_option`
--

LOCK TABLES `size_option` WRITE;
INSERT INTO `size_option` VALUES (1,1,'S'),(2,1,'M'),(3,1,'L'),(4,2,'42'),(5,2,'43');
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-19 13:28:09
