CREATE DATABASE  IF NOT EXISTS `dailyshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dailyshop`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: dailyshop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitiethoadon` (
  `IdHoaDon` int(11) NOT NULL AUTO_INCREMENT,
  `IdChiTietSanPham` int(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaTien` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdHoaDon`,`IdChiTietSanPham`),
  KEY `fk_ChiTietHoaDon_ChiTietSanPham` (`IdChiTietSanPham`),
  CONSTRAINT `fk_ChiTietHoaDon_ChiTietSanPham` FOREIGN KEY (`IdChiTietSanPham`) REFERENCES `chitietsanpham` (`idchitietsanpham`),
  CONSTRAINT `fk_ChiTietHoaDon_HoaDon` FOREIGN KEY (`IdHoaDon`) REFERENCES `hoadon` (`idhoadon`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (2,136,2,314),(2,142,9,352),(2,144,5,235),(3,39,3,230),(3,43,2,352),(3,50,4,653),(4,115,6,356),(4,139,2,423),(5,48,5,245),(5,118,2,325),(5,137,4,235),(6,82,3,346),(6,124,2,325),(8,53,1,432),(8,79,3,475),(8,138,2,235);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietsanpham`
--

DROP TABLE IF EXISTS `chitietsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitietsanpham` (
  `IdChiTietSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `IdSanPham` int(11) DEFAULT NULL,
  `IdSize` int(11) DEFAULT NULL,
  `IdMau` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `NgayNhap` datetime DEFAULT NULL,
  PRIMARY KEY (`IdChiTietSanPham`),
  KEY `fk_ChiTietSP_SanPham` (`IdSanPham`),
  KEY `fk_ChiTietSP_Size` (`IdSize`),
  KEY `fk_ChiTietSP_Mau` (`IdMau`),
  CONSTRAINT `fk_ChiTietSP_Mau` FOREIGN KEY (`IdMau`) REFERENCES `mausanpham` (`idmau`),
  CONSTRAINT `fk_ChiTietSP_SanPham` FOREIGN KEY (`IdSanPham`) REFERENCES `sanpham` (`idsanpham`),
  CONSTRAINT `fk_ChiTietSP_Size` FOREIGN KEY (`IdSize`) REFERENCES `sizesanpham` (`idsize`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietsanpham`
--

LOCK TABLES `chitietsanpham` WRITE;
/*!40000 ALTER TABLE `chitietsanpham` DISABLE KEYS */;
INSERT INTO `chitietsanpham` VALUES (36,17,1,1,12,NULL),(37,17,1,3,14,NULL),(38,17,2,1,31,NULL),(39,18,2,1,11,NULL),(40,18,1,2,42,NULL),(41,19,1,1,11,NULL),(42,19,2,2,22,NULL),(43,20,2,2,20,NULL),(44,20,1,1,11,NULL),(45,21,2,1,21,NULL),(46,21,1,2,12,NULL),(47,22,2,2,22,NULL),(48,22,2,1,22,NULL),(49,23,2,3,23,NULL),(50,23,3,2,32,NULL),(51,24,2,4,24,NULL),(52,24,4,2,42,NULL),(53,25,2,5,24,NULL),(54,25,5,2,51,NULL),(59,26,2,3,23,NULL),(60,26,3,2,32,NULL),(61,27,4,3,43,NULL),(62,27,3,4,34,NULL),(73,56,3,3,33,NULL),(74,56,3,2,23,NULL),(75,57,5,3,53,NULL),(76,57,5,2,25,NULL),(77,58,5,2,52,NULL),(78,58,2,5,25,NULL),(79,59,4,2,41,NULL),(80,59,2,4,24,NULL),(81,60,1,1,11,NULL),(82,60,1,2,14,NULL),(83,61,2,2,21,NULL),(84,61,1,2,21,NULL),(85,62,1,2,12,NULL),(86,62,2,3,23,NULL),(87,63,3,4,23,NULL),(88,63,4,5,45,NULL),(89,64,4,4,44,NULL),(90,64,3,3,33,NULL),(91,65,2,2,22,NULL),(92,65,1,1,11,NULL),(93,66,1,2,12,NULL),(94,66,2,2,22,NULL),(95,67,3,3,33,NULL),(96,67,4,4,44,NULL),(97,68,4,5,45,NULL),(98,68,3,4,34,NULL),(99,69,2,3,23,NULL),(100,69,1,2,12,NULL),(101,70,2,1,21,NULL),(102,70,3,2,32,NULL),(103,71,3,2,32,NULL),(104,71,4,3,43,NULL),(105,72,5,4,54,NULL),(106,72,4,5,45,NULL),(107,73,3,3,33,NULL),(108,73,2,2,22,NULL),(109,74,1,1,11,NULL),(110,74,2,2,22,NULL),(111,75,3,3,33,NULL),(112,75,4,4,44,NULL),(113,76,5,5,55,NULL),(114,76,5,3,53,NULL),(115,77,4,2,42,NULL),(116,77,3,1,31,NULL),(117,78,2,2,22,NULL),(118,78,1,3,13,NULL),(119,79,2,2,22,NULL),(120,79,3,2,32,NULL),(121,80,4,3,43,NULL),(122,80,5,4,54,NULL),(123,81,3,2,34,NULL),(124,81,2,1,22,NULL),(125,82,1,2,12,NULL),(126,82,2,3,23,NULL),(127,83,3,4,34,NULL),(128,83,4,5,45,NULL),(129,84,4,3,43,NULL),(130,84,3,2,31,NULL),(131,85,2,2,22,NULL),(132,85,3,3,33,NULL),(133,86,5,4,54,NULL),(134,86,3,3,32,NULL),(135,87,2,3,23,NULL),(136,87,1,2,12,NULL),(137,88,2,2,21,NULL),(138,88,3,1,30,NULL),(139,89,4,2,42,NULL),(140,89,3,5,35,NULL),(141,90,2,4,24,NULL),(142,90,2,3,23,NULL),(143,91,1,2,12,NULL),(144,91,3,5,35,NULL),(145,92,5,4,54,NULL),(146,92,3,3,22,NULL),(147,93,2,2,22,NULL),(148,93,2,1,21,NULL),(174,NULL,1,1,1,NULL),(175,NULL,2,2,2,NULL),(200,NULL,2,2,2,NULL),(201,NULL,1,1,3,NULL),(202,NULL,4,4,5,NULL),(203,NULL,3,3,3,NULL),(204,NULL,3,3,5,NULL),(205,NULL,1,1,3,NULL),(206,NULL,4,4,5,NULL),(207,NULL,2,2,4,NULL),(208,NULL,1,1,2,NULL),(209,NULL,2,2,4,NULL),(210,NULL,4,4,3,NULL),(211,NULL,3,3,1,NULL),(212,NULL,2,2,4,NULL),(213,NULL,1,1,2,NULL),(214,NULL,4,4,3,NULL),(215,NULL,3,3,1,NULL),(218,NULL,4,2,12,NULL),(219,NULL,5,4,24,NULL),(220,NULL,1,1,1,NULL),(227,NULL,5,2,33,NULL),(228,NULL,5,5,110,NULL),(229,NULL,3,3,22,NULL),(230,NULL,6,4,41,NULL),(234,NULL,3,3,22,NULL),(235,NULL,6,4,41,NULL),(236,NULL,5,5,110,NULL),(237,NULL,5,2,33,NULL),(238,NULL,1,3,41,NULL),(239,NULL,4,5,53,NULL),(240,NULL,5,2,54,NULL),(241,118,5,5,109,NULL),(242,118,6,4,41,NULL),(243,118,3,3,22,NULL),(244,118,5,2,33,NULL),(245,122,1,3,40,NULL),(246,122,4,5,53,NULL),(247,122,5,2,54,NULL);
/*!40000 ALTER TABLE `chitietsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chucvu` (
  `IdChucVu` int(11) NOT NULL AUTO_INCREMENT,
  `TenChucVu` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IdChucVu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'Admin'),(2,'Nhân viên'),(3,'Khách hàng');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmucsanpham`
--

DROP TABLE IF EXISTS `danhmucsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `danhmucsanpham` (
  `IdDanhMuc` int(11) NOT NULL AUTO_INCREMENT,
  `TenDanhMuc` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IdDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmucsanpham`
--

LOCK TABLES `danhmucsanpham` WRITE;
/*!40000 ALTER TABLE `danhmucsanpham` DISABLE KEYS */;
INSERT INTO `danhmucsanpham` VALUES (1,'Men'),(2,'Women'),(3,'Kids'),(4,'Sports'),(5,'Furniture');
/*!40000 ALTER TABLE `danhmucsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hoadon` (
  `IdHoaDon` int(11) NOT NULL AUTO_INCREMENT,
  `TenKhachHang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Sdt` varchar(20) DEFAULT NULL,
  `DiaChiGiao` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HinhThucGiao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GhiChu` text,
  `NgayLap` datetime DEFAULT NULL,
  `DaThanhToan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdHoaDon`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (2,'Nhật Huy','0987654321','Houston, Texas',NULL,'Giao hàng mau mau tí nha mấy má',NULL,0),(3,'Huy Heo','0987654321','Dallas, Texas',NULL,'Giao hàng vào buổi sáng nha',NULL,0),(4,'Nhật Huy','0987654321','Miami, Florida',NULL,'Giao hàng vào sáng sớm nha các chế',NULL,0),(5,'Huy Huy','1234567890','Austin, Texas',NULL,'Nước Mỹ dô địch',NULL,1),(6,'Huy Nhật','0987654321','Cầu Vượt Thủy Dương, TX Hương Thủy, TT-Huế',NULL,'Giao hàng trong vòng 2 ngày',NULL,1),(8,'Huy Heo','0987654321','Vancouver, Canada',NULL,'testing...........',NULL,1);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mausanpham`
--

DROP TABLE IF EXISTS `mausanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mausanpham` (
  `IdMau` int(11) NOT NULL AUTO_INCREMENT,
  `Mau` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IdMau`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mausanpham`
--

LOCK TABLES `mausanpham` WRITE;
/*!40000 ALTER TABLE `mausanpham` DISABLE KEYS */;
INSERT INTO `mausanpham` VALUES (1,'White'),(2,'Red'),(3,'Yellow'),(4,'Gray'),(5,'Black');
/*!40000 ALTER TABLE `mausanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sanpham` (
  `IdSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `IdDanhMuc` int(11) DEFAULT NULL,
  `TenSanPham` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GiaTien` int(11) DEFAULT NULL,
  `MoTa` text,
  `GioiTinh` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HinhAnh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdSanPham`),
  KEY `fk_SanPham_DanhMuc` (`IdDanhMuc`),
  CONSTRAINT `fk_SanPham_DanhMuc` FOREIGN KEY (`IdDanhMuc`) REFERENCES `danhmucsanpham` (`iddanhmuc`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES (17,1,'Cable Twist Contrast',300,'Made in Chị Na','male','Brave Soul Cable Twist Contrast Jumper.jpg'),(18,1,'Burton Menswear',230,'Hàng Việt Nam chất lượng Tàu','male','Burton Menswear.jpg'),(19,1,'Cable Knit',435,'Chất liệu len','male','Cable Knit Jumper In White.jpg'),(20,1,'Connection Reindeer Fairisle',352,'Sản xuất tại Mỹ','male','Connection Reindeer Fairisle Christmas Jumper.jpg'),(21,1,'crew neck',364,'Áo len sọc trắng đỏ','male','crew neck jumper in red stripe.jpg'),(22,1,'diagonal jumper stripe',245,'Áo len sọc chéo','male','diagonal jumper stripe.jpg'),(23,1,'hand knitted',653,'Giá mắc khủng khiếp','male','hand knitted heavyweight jumper.jpg'),(24,1,'Homme knitted',200,'Gái rẻ như cho','male','Homme knitted jumper.jpg'),(25,1,'jacquard knit',432,'Màu mè xôi chè','male','jacquard knit jumper.jpg'),(26,1,'lambswool cable crew neck',231,'Thiết kế đơn giản','male','lambswool cable crew neck jumper.jpg'),(27,1,'Menswear pucker up',634,'Giá mắc khủng khiếp. Cho còn đánh','male','Menswear pucker up Christmas jumper.jpg'),(56,2,'Baggy Denim Sherpa Trucker Jacket',457,'Không có mô tả đâu nha mấy má','female','Baggy Denim Sherpa Trucker Jacket.jpg'),(57,2,'Champion Reverse Weave',356,'Mô tả mẹ gì nữa','female','Weave Logo Patch Sweatshirt.jpg'),(58,2,'UO Bobby Boyfriend Striped Crew',686,'Giá mắc kinh hồn. Cho không thèm lấy','female','UO Bobby Boyfriend Striped Crew.jpg'),(59,2,'UO Brea Fleece Hooded Zip-Up Jacket',475,'Giá hơi mắc','female','Hooded Zip-Up Jacket.jpg'),(60,2,'UO Casey Kick Flare Pant',346,'Quần chấm bi mặc dô cảm thấy thoải mái','female','UO Casey Kick Flare Pant.jpg'),(61,2,'UO Cropped Teddy Jacket',567,'Không có mô tả','female','UO Cropped Teddy Jacket.jpg'),(62,2,'UO Dolman Teddy Jacket',235,'Giá rẻ bất ngờ','female','UO Dolman Teddy Jacket.jpg'),(63,2,'UO Willow Fuzzy Drawstring Teddy Jacket',123,'Hàng xịn giá rẻ. Mua ngay ko hết','female','Drawstring Teddy Jacket.jpg'),(64,3,'Infant Unicorn Sk8-Hi Crib',355,'Giá rẻ như cho. Mua ngay ko hết','female','Infant Unicorn Sk8-Hi Crib.jpg'),(65,3,'Kids Checkerboard Slip-On',234,'Giá rẻ bất ngờ','male','Kids Checkerboard Slip-On.jpg'),(66,3,'Kids Floatie Sharks Slip-On',235,'Hàng nhập khẩu từ Lào','male','Kids Floatie Sharks Slip-On.jpg'),(67,3,'Kids Old Skool V',344,'Hàng Mỹ giá rẻ','male','Kids Old Skool V.jpg'),(68,3,'Kids Primary Check Old Skool',364,'Không có mô tả đâu','male','Kids Primary Check Old Skool.jpg'),(69,3,'Kids Unicorn Old Skool',341,'Không mô tả','male','Kids Unicorn Old Skool.jpg'),(70,3,'Kids Unicorn Sk8-Hi Zip',324,'Mô tả ma tổ','male','Kids Unicorn Sk8-Hi Zip.jpg'),(71,3,'Toddler Asher V',235,'Hổng có mô tả','male','Toddler Asher V.jpg'),(72,3,'Toddler Checkerboard Slip-On',363,'Không nghĩ ra gì để mô tả','male','Toddler Checkerboard Slip-On.jpg'),(73,3,'Toddler UltraRange Rapidweld',346,'Mô tả mẹ gì','male','Toddler UltraRange Rapidweld.jpg'),(74,3,'Toddler Unicorn Sk8-Hi Zip',463,'Giá mắc bà cố','female','Toddler Unicorn Sk8-Hi Zip.jpg'),(75,4,'nike-dri-fit-flex-stride-5-short-men',235,'Mặc vô thoải mái','male','nike-dri-fit-flex-stride-5-short-men.jpg'),(76,4,'nike-dry-miler-ls-top-women',246,'Chất liệu thấm mồ hôi','male','nike-dry-miler-ls-top-women.jpg'),(77,4,'nike-hooded-printed-jacket-women',356,'Áo giành cho mấy má bánh bèo','female','nike-hooded-printed-jacket-women.jpg'),(78,4,'nike-miler-essential-men',325,'Chưa nghĩ ra mô tả','male','nike-miler-essential-men.jpg'),(79,4,'nike-miler-ss-top-men',245,'Thiết kế đơn giản, mặc vô thoải mái','male','nike-miler-ss-top-men.jpg'),(80,4,'nike-miler-tanktop-men',235,'Áo khoe lông nách','male','nike-miler-tanktop-men.jpg'),(81,4,'nike-rise-365-ss-top-men',325,'Chất tới từng đồng','male','nike-rise-365-ss-top-men.jpg'),(82,4,'nike-rise-aj',134,'Thiết kế trẻ trung','male','nike-rise-365-ss-top-men-aj7671.jpg'),(83,4,'nike-windrunner-jacket-men',335,'Áo phao chống chìm','male','nike-windrunner-jacket-men.jpg'),(84,4,'nike-zonal-cooling-relay-men',465,'Thiết kế đơn giản mà sâu sắc','male','nike-zonal-cooling-relay-men.jpg'),(85,5,'Dining-Chair',346,'Giá mắc kinh dị',NULL,'Dining-Chair.jpg'),(86,5,'Hall-Furniture',253,'Thiết kế thông minh tiện lợi',NULL,'Hall-Furniture.jpg'),(87,5,'Living_Room_Chairs',314,'Ngồi lên thoải mái',NULL,'Living_Room_Chairs.jpg'),(88,5,'Shoe-Cabinet',235,'Tủ vạn năng, đựng được mọi thứ',NULL,'Shoe-Cabinet.jpg'),(89,5,'Shoe-Rack-tobago',423,'Giá để dép',NULL,'Shoe-Rack-tobago.jpg'),(90,5,'Stool-jefferson',352,'Ngồi lên không ê đít',NULL,'Stool-jefferson.jpg'),(91,5,'Stools-Mozart',235,'Ghế nghệ sĩ',NULL,'Stools-Mozart.jpg'),(92,5,'TV-Bench',143,'Giá rẻ như cho ho ho',NULL,'TV-Bench.jpg'),(93,5,'Vail-Linen-Upholstered-Sofa',312,'Đồ Mỹ chất lượng cao',NULL,'Vail-Linen-Upholstered-Sofa.jpg'),(118,5,'Huy 11111111',2222,'khdfbgk\r\nfdgndkf\r\ndfbnj','male','spring.png'),(122,5,'Huy hihi',234,'jfngljdflg\r\ndfkgbk\r\ndfjgn\r\ndfljndf','male','huyheo.png');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sizesanpham`
--

DROP TABLE IF EXISTS `sizesanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sizesanpham` (
  `IdSize` int(11) NOT NULL AUTO_INCREMENT,
  `Size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IdSize`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sizesanpham`
--

LOCK TABLES `sizesanpham` WRITE;
/*!40000 ALTER TABLE `sizesanpham` DISABLE KEYS */;
INSERT INTO `sizesanpham` VALUES (1,'S'),(2,'X'),(3,'L'),(4,'XL'),(5,'SM'),(6,'MM');
/*!40000 ALTER TABLE `sizesanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `IdChucVu` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdUser`),
  KEY `fk_User_ChucVu` (`IdChucVu`),
  CONSTRAINT `fk_User_ChucVu` FOREIGN KEY (`IdChucVu`) REFERENCES `chucvu` (`idchucvu`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (12,'Nhật Huy','nhathuy@gmail.com','123',3),(13,'Huy Heo','huyheo@gmail.com','123',3),(14,'Huy Huy','huyhuy@gmail.com','123',3),(15,'Huy Nhật','huynhat@gmail.com','123456',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 18:16:11
