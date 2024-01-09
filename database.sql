CREATE DATABASE  IF NOT EXISTS `pepe_csdl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `pepe_csdl`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: pepe_csdl
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cart_stt` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1),(2,2,0),(3,3,1),(4,4,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_pro`
--

DROP TABLE IF EXISTS `cart_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_pro` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`,`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_pro`
--

LOCK TABLES `cart_pro` WRITE;
/*!40000 ALTER TABLE `cart_pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Cây ăn quả'),(2,'Cây công nghiệp'),(3,'Cây lấy gỗ');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contact` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phoneNumber` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` text COLLATE utf8mb4_bin,
  `content` text COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('Hien','0908496271','20130207@st.hcmuaf.edu.vn','Web quÃ¡ xá»n 10Äiá»m\r\n'),('Thong','0908496271','20130207@st.hcmuaf.edu.vn','NQuÃ¡ ÄÆ°á»£c'),('12','0917016666','20130207@st.hcmuaf.edu.vn','QUÃ¡ Xá»n');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dis_code`
--

DROP TABLE IF EXISTS `dis_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dis_code` (
  `code_dis` int(11) NOT NULL AUTO_INCREMENT,
  `per_discount` double DEFAULT NULL,
  PRIMARY KEY (`code_dis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dis_code`
--

LOCK TABLES `dis_code` WRITE;
/*!40000 ALTER TABLE `dis_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `dis_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorite` (
  `pro_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  KEY `pro_id` (`pro_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `image` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`img_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `news` (
  `titel` text COLLATE utf8mb4_bin,
  `infor` text COLLATE utf8mb4_bin,
  `link` text COLLATE utf8mb4_bin,
  `date_post` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pro_text` text COLLATE utf8_bin,
  `discount_stt` int(11) DEFAULT NULL,
  `per_discount` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `img` text COLLATE utf8_bin,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Cây Bơ',30000,'Bơ có nguồn gốc đầu tiên ở tỉnh Puebla, Mexico.\r\nĐặc điểm sinh thái của cây là ưa sáng, ưa ẩm ướt,phát triển tốt ở những vùng đất tới xốp.Chất lượng\r\nsản phẩm làm bên thương hiệu.Luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho \r\nkhách hàng quay lại sau khi mua hàng.\r\n\r\n\r\n',1,0.05,50,1,'2023-01-01 07:03:28','/template/web/hinhanh/cay-2.jpg',NULL),(7,'Cây Bơ034',12000,'Bơ có nguồn gốc đầu tiên ở tỉnh Puebla, Mexico. Đặc điểm sinh thái của cây là ưa sáng, ưa ẩm ướt, phát triển tốt ở những vùng đất tới xốp.Chất lượng sản phẩm làm bên thương hiệu.Luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,30,1,'2023-01-01 07:05:51','/template/web/hinhanh/cay-8.jpg',NULL),(10,'Cây Bưởi',23000,'Bưởi(Giống Bưởi ta) giống cây được yêu thích hiện nay không chỉ đem lại trái cây thơm ngon mà còn rất tốt cho sức khỏe.Có đặc tính chịu hạn tốt,chịu được khu vực nhiều nắng và phát triển tốt khi trồng trên đất phù sa hoặc đất đồi hố.PePE Luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,20,1,'2023-01-01 07:07:50','/template/web/hinhanh/cay-6.jpg',NULL),(11,'Cây Bưởi Đỏ Tân Lạc',15000,'Cây Bưởi Đỏ Tân Lạc Hòa Bình(bưởi đỏ Tân Lạc) có nguồn gốc chính xác tại xã Khánh Thương, huyện Ba Vì, Hà Nội.Điều kiện sinh thái của cây khá kén, ưa ẩm và ánh sáng.Trồng trên loại đất có thành phần cơ giới nhẹ có độ pH khoảng từ 5-5.7,đất cần tơi xốp và thông thoáng tránh úng ngập.Thời điểm thíc hợp trồng cây là tháng 5-6 dương lịch hàng năm.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',1,0.02,40,1,'2023-01-01 07:09:05','/template/web/hinhanh/cay-1.jpg',NULL),(12,'Cây Bưởi Da Xanh chiết Miền Na',18000,'Giống bưởi da xanh ruột đỏ không hạt thơm ngon nổi tiếng khắp cả nước.Cây sinh trưởng nhanh và đặc biệt rất ưa nước  nên không thích hợp trồng trên đồi dốc mà phải trồng dưới vườn thấp.Thời vụ trồng giống bưởi này tốt nhất là cuối mùa khô, đầu mùa mưa.PePE Luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',1,0.06,60,1,'2023-01-01 07:11:19','/template/web/hinhanh/cay-8.jpg',NULL),(15,'Cây Cam Vinh',16000,'Giống Cam Vinh là tên của một loại trái cây thuộc chi Cam chanh được gắn chỉ dẫn địa lý với địa danh Vinh (Nghệ An,Việt Nam).Trái tròn đều,mọng nước,vàng tươi chanh pha với màu xanh.Giống cam này có thể trồng ở khắp nơi.Đối với tỉnh phía Bắc thời vụ trồng cam là mùa Xuân từ tháng 2-4 hoặc mùa Thu.Nhưng tốt nhất là vào mùa Xuân hoặc đầu mùa mưa.Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,50,1,'2023-01-01 07:12:33','/template/web/hinhanh/cay-5.jpg',NULL),(16,'Cây Chay',11000,'Cây Chay là loại cây đặc biệt có ở Việt Nam, ít được tìm thấy ở quốc gia khác.trồng nhiều ở các tỉnh phía bắc như Bắc Cạn,Lào Cai,... và rải rác ở tỉnh trung du duyên hải. Đây là loài dễ trồng trọt và chăm sóc do ít sâu bệnh. Loài thực vật này có thể thu hái quanh năm, đặc biệt mùa hoa quả tháng 5-8.Chất lượng sản phẩm làm nên thương hiệu. PePE luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,40,1,'2023-01-01 07:13:35','/template/web/hinhanh/cay-2.jpg',NULL),(18,'Cây Sa Kê',24000,'Cây Sa Kê hay còn được gọi là cây bánh mì, xuất xứ từ các đảo ở Thái Bình Dương,Malaysia.Giống cây này rất dễ trồng và chăm sóc.Sake ưa sáng hoàn toàn nhưng vẫn có thể chịu một phần bóng râm. Đặc biệt sa kê không kến đẩt có thể thích nghi nhanh ở các loại đất kể cả nhiễm mặn, nhiễm phèn. Tuy nhiên trồng nơi đất nơi đất tơi xốp,giàu dinh dưỡng để đạt hiệu quả cao.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,50,1,'2023-01-01 07:17:00','/template/web/hinhanh/cay-6.jpg',NULL),(19,'Cây Lựu',12000,'Có nguồn gốc từ Châu Âu từ các nước Trung Quốc,Lào… và cả Việt Nam.Giống cây này có thể trồng được bất kì mùa nào trong năm.Tuy nhiên thời điểm trồng thuận lợi là vào đầu mùa mưa và cuối mùa thu.Thích hợp trồng với loại đất thịt phối trộn hữu cơ với hữu cơ hoai mục, đất phù sa giàu dinh dưỡng.Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',1,0.08,70,1,'2023-01-01 07:18:55','/template/web/hinhanh/cay-10.jpg',NULL),(20,'Vú sữa Lò Rèn',34000,'Vú sữa là một loại quả thơm ngon tuyệt vời.Có nguồn gốc từ Trung Mỹ.Cây được trồng nhiều từ miền Trung trở vào phía Nam.Giống cây này thích hợp trồng ở đất phù sa ven sông, đất thịt nhẹ,đất đỏ bazan.Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,30,1,'2023-01-01 07:20:10','/template/web/hinhanh/cay-8.jpg',NULL),(22,'Vú sữa Bơ Hồng',45000,'Là loại trái cây nhiệt đới,cây vú sữa được trồng nhiều  ở các nước thuộc đới khí hậu này như Việt Nam, Thái Lan…..Nguồn gốc từ vùng đảo Antiles ở Châu Mỹ.Phù hợp trồng trên đất phù sa ven sông, đất thịt nhẹ, thoát nước tốt.Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',1,0.09,20,1,'2023-01-01 07:21:32','/template/web/hinhanh/cay-6.jpg',NULL),(23,'Cây Ổi',25000,'Đây là loại thực vật vốn có nguồn gốc từ Brazil.Giống cây này phù hợp với nhiều điều kiện đất trồng khác nhau và trồng khi bắt đầu vào mùa mưa.Chất lượng sản phẩm làm nên thương hiệu.PePE Luôn cung cấp cây giống  chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,50,1,'2023-01-01 07:22:46','/template/web/hinhanh/cay-5.jpg',NULL),(24,'Cây Chuối Tây Thái',32000,'Là giống cây nhập ngoại có nguồn gốc từ Thái Lan.Cây giống có khả năng sinh trưởng và phát triển tốt, năng suất cao, chất lượng ổn định, kháng được \"bệnh nhậy\" sâu thường gặp.Giống cây này có thể trồng quanh năm, nhưng tốt nhất là vào đầu mùa mưa, phù hợp với tất cả loại đất. Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,60,1,'2023-01-01 07:23:57','/template/web/hinhanh/cay-7.jpg',NULL),(25,'Cây Chanh Leo',31000,'Cây chanh leo thuộc họ Lạc Tiên.Hiện nay, được trồng hầu hết ở khắp các tỉnh thành.Giống cây này rất dễ trồng, không hề kén đất.Tuy nhiên ,cây này rất ưa độ ẩm cao nên trồng vào khoảng tháng 4-6 dương lịch ,thời điểm mùa mưa bắt đầu.Chất lượng sản phẩm làm nên thương hiệu. PePE luôn cung cấp cây giống chất lượng và đẹp nhất. mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',1,0.1,50,1,'2023-01-01 07:25:04','/template/web/hinhanh/cay-10.jpg',NULL),(26,'Cây Chôm Chôm Thái',42000,'Cây Chôm Chôm Thái có nguồn gốc từ Thái Lan.Giống cây này sinh trưởng nhanh.Phù hợp với thích ứng cho những vùng đất không ngập nước.Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất . Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',1,0.07,40,1,'2023-01-01 07:28:05','/template/web/hinhanh/cay-6.jpg',NULL),(27,'Sầu Riêng Thái',80000,'Sầu Riêng Thái Monthong là giống sầu riêng được yêu thích nhất thị trường hiện nay vì hương vị thơm ngon khó cưỡng.Giống cây có khả năng sinh trưởng tốt và năng suất ổn định.Không kén khi hậu và đất trồng.Từ đất đỏ bazan đến đất phù sa đều có thể trồng. Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,30,1,'2023-01-01 07:29:11','/template/web/hinhanh/cay-9.jpg',NULL),(28,'Na Nữ Hoàng',80000,'Gọi tắt là Na Thái có nguồn gốc từ Thái Lan.Giống cây rất thích hợp với khí hậu nhiệt đới như Việt Nam.Đặc biệt giống cây này không kén đất,không kén khí hậu.Chất lượng sản phẩm làm nên thương hiệu.PePE Luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,50,1,'2023-01-01 07:30:20','/template/web/hinhanh/cay-8.jpg',NULL),(29,'Cây Dó Bầu',8000,'Cây Dó Bầu(Trầm Hương) là một loại cây lâm nghiệp quý, có giá trị kinh kế rất cao.Cây Trầm Hương thuộc giống cây trồng có tốc độ sinh trưởng khá chậm,rất thích hợp trồng ở vùng đất feralit.Sau khi trồng được 2-3 năm là có thể thu hoạch.Chất lượng sản phẩm làm nên thương hiệu. PePE luôn cung cấp cây giống chất lượng và đẹp nhất. mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,40,1,'2023-01-01 07:32:02','/template/web/hinhanh/cay-1.jpg',NULL),(30,'Cây Hồng Giòn',50000,'Giống Cây hồng giòn có khả năng sinh trưởng tốt,nhanh chóng trong điều kiện mát mẻ, có khả năng chịu lạnh khá ấn tượng.Thời điểm thích hợp nhất để trồng giống cây này là khoảng tháng 1-2 dương lịch hàng năm.Có thể trồng ở đất đồi hoặc đất vườn đều được. Chất lượng sản phẩm làm nên thương hiệu. Luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,60,1,'2023-01-01 07:33:05','/template/web/hinhanh/cay-6.jpg',NULL),(32,'Cây Dổii Hạt',12000,'Cây Dổi là loại giống cây đặc hữu của Việt Nam,phân bố chủ yếu ở các tỉnh miền núi phía Tây Bắc và khu vực Tây Nguyên.Thời điểm lý tưởng trồng dổi tùy thuộc vào mỗi vùng, ở miền Bắc thì vào vụ xuân hay đầu vụ hè:tháng 3-6.Vùng Dông Nam Bộ,duyên hải Nam Trung Bộ và Tây Nguyên: tháng 6-8. Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng  và đẹp nhất Với mục tiêu làm cho khách quay lại sau khi mua hàng.',1,0.06,20,1,'2023-01-01 07:34:51','/template/web/hinhanh/cay-5.jpg',NULL),(33,'Cây Chuối Tây',13000,'Giống cây này rất dễ trồng, phù hợp với nhiều loại đất khác nhau.Tuy nhiên,tốt nhât nên trồng ở đất thịt nhẹ, đất pha cát, đất phù sa màu mỡ, đất ven sông….Là loại cây nhiệt đới nên ưa sống ở khí hậu nóng ẩm mưa nhiều,nên thích hợp trồng vào thời điểm vụ Xuân :tháng 2-4 và vụ hè thu: tháng 8,9. Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,80,1,'2023-01-01 07:36:01','/template/web/hinhanh/cay-1.jpg',NULL),(34,'Mít Không Hạt',65000,'Cây mít không hạt là giống cây mới có thể trồng quanh năm ,nhưng tốt nhất là vào đầu mùa mưa tầm tháng 5 -7 Giống cây này sinh trưởng mạnh mẽ và dễ thích nghi với điều kiện môi trường nên tốn ít công chăm sóc.Điều quan trọng đầu tiên khi trồng là đất cần phải tơi xốp và thoát nước tốt.Chất ượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,50,1,'2023-01-01 07:37:08','/template/web/hinhanh/cay-7.jpg',NULL),(35,'Cây Cam C36',35000,'Giống cây cam 36 là giống cam được nhân giống từ 3 loại cam khác nhau.Giống cây này thích hợp trồng ở đất pha thịt, đất phù sa tơi xốp….Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách quay lại sau khi mua hàng.',1,0.08,80,1,'2023-01-01 07:43:09','/template/web/hinhanh/cay-2.jpg',NULL),(37,'Cây Xà Cừ',12000,'Loài giống cây này có nguồn gốc từ Sudan Châu Phi.Cây xà cừ thích hợp trồng ở nhiều thời gian trong năm.Thời điểm tốt  nhất là vào đầu mùa mưa.Trồng ở nơi có đất thoáng tơi xốp, và có sự thoát nước.Chất lượng sản phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu làm cho khách hàng quay lại sau khi mua hàng.',0,0,30,1,'2023-01-01 07:44:15','/template/web/hinhanh/cay-6.jpg',NULL),(38,'Cây Việt Quất',80000,'Giống việt quất là loại cây yêu thích ánh nắng,.Giống cây này ưu đất có nhiều than bùn, cây sẽ phát triển tốt nhất nếu được trộn mùn cưa với than bùn.Cây sẽ thu trái sau 3-4 năm .Chất lượng sản phẩm làm nên thương hiệu. PePE luôn cung cấp cây giống chất lượng và đẹp nhất.Với mục tiêu  làm cho khách quay lại sau khi mua hàng.',0,0,40,1,'2023-01-01 07:45:13','/template/web/hinhanh/cay-1.jpg',NULL),(39,'Cây Mận Tam Hoa',36000,'Mận tam hoa là loại cây ưa thời tiết mát mẻ, có khả năng chịu hạn . Hoa trắng, đẹp, nở vào đầu xuân, quả đỏ tươi > đỏ đậm, mọng, chấm muối ăn rất ngon. Gần đây, mận được ứng dụng nhiều trong việc trồng sân vườn, cảnh quan vì hoa đẹp, nở dịp tết, lại có quả ngay tại vườn. Theo phong thủy, cây mận đem lại may mắn cho gia chủ tương tự như cây đào',0,0,80,1,'2023-01-01 07:47:10','/template/web/hinhanh/cay-2.jpg',NULL),(40,'Cây Vải Thiều',44000,'Vải thiều Thanh Hà là giống có kích thước quả bé nhất trong tất cả các giống vải hiện nay, dạng quả hơi tròn. Chiều cao quả 3,3 – 3,4 cm, chiều rộng quả 3,4 – 3,5 cm, tỷ lệ cao quả/ rộng quả 0,94 – 0,98. Quả nhỏ, vỏ sần, chín màu đỏ, hạt rất màu đen tuyền hoặc không hạt, cùi trắng dày ăn rất ngọt, hương vị thơm đặc biệt. Quả nặng 18 - 20g, tỷ lệ cùi 72 - 80% thịt hơi nhão, khi bóc vỏ dễ vỡ nước, mùi thơm. Hạt vải thiều gần như bị triệt tiêu, xun lại chứ không thành hạt như vải bình thường. Vải cho vào miệng sẽ cho cảm giác như tự tan ra, không cảm thấy vị se, vị chua, chát, cứ ngọt dần, ngọt dần...Vải thiều Thanh Hà hột nhỏ, màu nâu đen, cây vải tuổi càng cao thì hạt càng nhỏ, có nhiều trái gần như không có hạt và lớp cùi dày ngọt lịm, đầy nước. Giữa cùi và hạt vải thiều không có lớp màng mỏng nâu nâu chan chát như vải Lục Ngạn. Vải Thanh Hà chất lượng ngon, nên giá bán cao hơn các loại vải khác.',1,0.09,60,1,'2023-01-01 07:49:59','/template/web/hinhanh/cay-2.jpg',NULL),(41,'Cây Chanh',22000,'Đặc điểm cây chanh không hạt khỏe mạnh, lá lớn, không gai, trái chùm, cây có thể cho năng suất trái 150-200 kg/năm, trái chanh to có vỏ mỏng, không hạt, nhiều nước, vị chua mùi thơm. Đây là giống chanh thích nghi với nhiều vùng sinh thái, trừ những vùng đất ngập úng, nhiễm phèn hay nhiễm mặn, tốc độ sinh trưởng và phát triển mạnh, chống chịu sâu bệnh khá tốt so với các giống chanh khác.So với các giống chanh không hạt khác, giống chanh này có nhiều đặc tính vượt trội như trái to, tròn, mã trái đẹp vỏ trái mỏng, màu xanh bóng, cơm màu trắng xanh, không hạt, kích thước trái đồng đều, nhiều nước, chua, thơm, phẩm chất ngon hơn nhiều giống chanh khác.Khi cây đã trưởng thành, gai sẽ bị thoái hóa nên dễ dàng chăm sóc và thu hoạch. Quả chanh có thể đáp ứng nhu cầu thị trường ăn tươi, làm nguyên liệu cho các nhà máy chế biến xuất khẩu. Bà con nông dân có thể trồng xen vào vườn cam, quít, tiêu, cà phê...',0,0,50,1,'2023-01-01 07:53:16','/template/web/hinhanh/cay-1.jpg',NULL),(42,'Cây Na',19000,'Cây na hay còn gọi là cây mãng cầu dai ở miền Nam hay mãng cầu ta, mãng cầu dai/giai, sa lê, phan lệ chi. Đây là loại quả  thường thấy trong dịp tết trung thu. Là một cây trồng có giá trị kinh tế cao dễ trông và chăm sóc. Ở nước ta khu vực trồng nhiều na nhất là  vùng Đồng Bành ở Lạng Sơn.Na chống úng kém nhưng chống hạn tốt.Cây na dễ sống không kén chọn đất, kể cả đất nghèo dinh dưỡng, đất sỏi, đất cát, chua hoặc trung tính.Đất thích hợp nhất để trồng na là đất rừng mới khai phá, đất phù sa, có độ pH= 5,5-6,5.Chất lượng sẩn phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống tốt nhất.Với mục tiêu khiến khách quay lại sau khi mua hàng\r\n ',0,0,40,1,'2023-01-01 08:08:21','/template/web/hinhanh/cay-6.jpg',NULL),(46,'Cây Táo',18000,'Táo Redlove có thể trồng ở khắp mọi miền đất nước.Giống cây này trồng quanh năm, dễ trồng, dễ chăm sóc, phù hợp với đất đai tại Việt Nam.\r\nChất lượng sẩn phẩm làm nên thương hiệu.PePE luôn cung cấp cây giống tốt nhất.Với mục tiêu khiến khách hàng quay lại khi mua hàng. ',0,0,30,1,'2023-01-01 08:12:39','/template/web/hinhanh/cay-7.jpg',NULL),(47,'Cây Roi',18000,'Roi đỏ có đặc điểm sai trái và ngọt hơn giống cũ ở Việt Nam. Roi An Phước ( Mận An Phước ) có hình dáng giống quả chuông, màu nâu đỏ, sọc dọc mờ, ruột đặc, màu trắng, ăn giòn, ngọt, thơm. Trọng lượng trái trung bình 100 đến 120 gram/trái. Đặc biệt roi không có hạt và có hương thơm đặc trưng. Cây cho trái quanh năm nhưng màu sai nhất là từ tháng 11 đến tháng 6 hàng năm',0,0,50,1,'2023-01-01 08:19:13','/template/web/hinhanh/cay-5.jpg',NULL),(48,'Cây Dâu Da Đất',32000,'Họ chi của cây dâu da không dưới 100 loài phân bố dải rác từ Indonesia đến phía Tây Thái Bình DươngCây sinh trưởng tốt ở mọi điều kiện tự nhiên khác nhau.chất lượng sản phẩm làm nên thương hiệu. Luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,20,1,'2023-01-01 08:23:47','/template/web/hinhanh/cay-1.jpg',NULL),(49,'Cây Lê Vàng',30000,'Lê là một cây ăn quả đặc sản của vùng ôn đới nước ta, lê được trồng ở các tỉnh miền núi phía Bắc tập trung ở những nơi có độ cao 500 – 1500m so với mực nước biển. Quả (theo nghĩa \'ẩm thực\') của lê là dạng quả táo, một loại quả giả, thực chất là sự phình to của đế hoa (hay ống đài). Nằm bên trong lớp cùi thịt của nó mới là quả thật sự (quả theo nghĩa \'thực vật học\'), hình thành từ 5 lá noãn dạng sụn, trong ẩm thực nó bị gọi chung là \"lõi\". Lê tương tự như táo tây trong gieo trồng, nhân giống và thụ phấn. Lê và táo tây cũng có quan hệ họ hàng gần với mộc qua Kavkaz.chất lượng sản phẩm làm nên thương hiệu. Luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,40,1,'2023-01-01 08:25:47','/template/web/hinhanh/cay-9.jpg',NULL),(50,'Cây KiWi',58000,'Cây kiwi (dương đào) thân leo, cao chỉ khoảng 3m. Để phát triển tốt cây Kiwi cần các điều kiện có nhiều nắng, có mưa cộng với đất đai màu mỡ, thích hợp khí hậu lạnh. Hoa trắng và ruột màu xanh lá cây tươi sáng được bao phủ bởi một làn da lông xù màu nâu. Quả kiwi có vỏ màu nâu, nhiều lông, ruột bên trong màu xanh lục bảo chứa nhiều hạt nhỏ màu đen. Quả có chiều dài khoảng 5cm – 8 cm và đường kính 4,5cm - 5,5 cm. Quả có vị chua, chứa rất nhiều dinh dưỡng, có thể dùng ăn sống, làm salad hay làm món tráng miệng. Kiwi chứa chất nhiều xơ, kali, acid folic, vitamin C và E, carotenoid, chất chống oxy hoá, chất khoáng là các chất cần thiết để xây dựng sức dẻo dai của cơ thể.chất lượng sản phẩm làm nên thương hiệu. Luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,20,1,'2023-01-01 08:27:56','/template/web/hinhanh/cay-2.jpg',NULL),(51,'Cây Quất Cẩm Thạch',18000,'Quất là loài cây thường xanh, có thể làm cây trồng trong nhà. Cây quất hay được trồng làm cây cảnh, thậm chí làm bonsai. Ở Trung Quốc và Việt Nam, cây quất ra trái hay được trưng bày vào dịp Tết vì người ta cho rằng quất là biểu tượng của may mắn. Vì vậy nên đây là loại cây đem hại hiệu quả kinh tế rất cao vào dịp tết.Luôn cung cấp cây giống chất lượng và đẹp nhất. Với mục tiêu làm cho khách quay lại sau khi mua hàng.',0,0,30,1,'2023-01-01 08:30:00','/template/web/hinhanh/cay-5.jpg',NULL),(52,'Cây Cà Chua',2000,'Cà chua được lai tạo, dễ trồng trên các nền đất. Sản lượng cao, năng xuất, giá thành tương đối ổn định, có thể trồng làm cảnh hoặc làm nông vụ.',0,0,24,1,'2023-01-01 01:30:00','/template/web/img/banner/cachua.jpg',NULL),(53,'Tiêu Thekken Ấn Độ',10000,'Đặc điểm nổi bật nhất của tiêu Thekken là chùm quả (còn gọi là gié tiêu) thường phát triển thành dạng chùm, phân thành nhiều nhánh.\nKhoảng 80-90% chùm quả phân nhánh, số còn lại ra dạng chuỗi đơn bình thường\nMỗi chùm quả có khoảng 300 – 600 hạt. Kích thước tương đương với các giống tiêu hiện nay\nThân chính phát triển mạnh, cành lá có xu hướng nhỏ, mảnh khảnh nhưng không ảnh hưởng đến năng suất\nĐốt thân phát triển dài, đọt non màu nâu tím\nLá nhẵn mặt trên hơn nhám, viền lá phẳng không gợn sóng\nTiêu có khả năng phát triển bộ rễ rất mạnh, kháng được sâu bệnh, đặc biệt là bệnh chết nhanh chết chậm',1,0.05,200,2,NULL,'/template/web/hinhanh/caycn1.jpg',NULL),(54,'Tiêu Srilanka',11000,'Chồi màu xanh nhạt (chồi trắng, đọt trắng).\nLá to xanh đậm và có hình trái tim, có phần giống lá của giống tiêu trâu\nChùm quả dài 15-20cm. Quả xếp đều trên gié, ít bị khuyết răng cưa\nSinh trưởng cực mạnh, rễ khỏe, ít bị nấm bệnh\nThích nghi tốt với khí hậu và đất đai các tỉnh Tây Nguyên và lân cận (Bình Phước, Đồng Nai, Bà Rịa Vũng Tàu)\nNăng suất 7-10kg/trụ',1,0.05,200,2,NULL,'/template/web/hinhanh/caycn2.jpg',NULL),(55,'Tiêu ác Vĩnh Linh',10000,'Cây sinh trưởng khỏe mạnh, nhanh phủ trụ\nKhi cây được 1 năm tuổi, chỉ cần hãm ngọn, không tốn nhiều công đôn tiêu như khi trồng bằng tiêu lươn\nCó thể tận dụng phần dây ác sau khi hãm ngọn để nhân giống hoặc bán cho các vườn ươm để thu thêm lợi nhuận.\nNhanh ra trái, nếu chăm sóc tốt có thể cho quả bói sau 2 năm.',0,0.05,200,2,NULL,'/template/web/hinhanh/caycn3.jpg',NULL),(56,'Tiêu giống Vĩnh Linh',12000,'Lá kích thước trung bình, thường có dạng cân đối hơi thon dài\nChuỗi quả dài từ 7-10cm\nCây sinh trưởng nhanh, 12-18 tháng đã có thể phủ trụ\nBắt đầu thu bói vào năm thứ 2\nHạt to, nhân chắc, chín tập trung tiện cho việc thu hoạch\nTỷ lệ đậu trái cao, gié quả đều đẹp\nKhả năng thích nghi rộng, có thể trồng được ở các khu vực canh tác tiêu trên toàn quốc',0,0.05,200,2,NULL,'/template/web/hinhanh/caycn4.jpg',NULL),(57,'Tiêu trâu Tây Nguyên',11000,'Lá hình trái tim đặc trưng, xanh đậm, phiến lá to khi thuần thục\nQuả to, nhân to, khi chín có màu đỏ tươi\nNgọn non, cuống lá non hơi có màu tím\nCây sinh trưởng mạnh, khả năng chống bệnh chết nhanh chết chậm rất tốt\nTỷ lệ đậu trái trung bình, nhưng vẫn đảm bảo năng suất (khoảng 80% nếu so với tiêu vĩnh linh)\nGié quả dài từ 7-10cm\nThích nghi với hầu hết khí hậu và thổ nhưỡng ở các khu vực trồng tiêu trên toàn quốc',1,0.05,200,2,NULL,'/template/web/hinhanh/caycn5.jpg',NULL),(58,'Cà phê TRS1',14000,'Sinh trưởng: Cây phát triển nhanh, tỷ lệ sống cao, phát cành mạnh, cành cơ sở nhiều\nVóc dáng: Cao trung bình, tán phát ngang, hơi rũ, thích hợp với kiểu canh tác đơn thân hãm ngọn\nLá: Hình mũi mác, kích thước trung bình, khi thuần thục có màu từ xanh vàng đến xanh đậm\nQuả: Có núm bò, hình trứng ngược, khi chín màu đỏ cam hoặc huyết dụ\nChùm quả: Dày quả, đốt quả ngắn\nHạt: Kích thước từ trung bình đến lớn, tỷ lệ hạt R1 (sàng 16) từ 80-90%\nTỷ lệ tươi/nhân: 4.1 – 4.3 / 1',1,0.05,200,2,NULL,'/template/web/hinhanh/caycn6.jpg',NULL),(59,'Cà phê Thiện Trường',11000,'Khả năng sinh trưởng mạnh, kháng bệnh tốt, phát triển ổn định ngay cả trên đất bauxit bạc màu, đất lẫn sỏi đá.\nLá to, xanh đậm, bề mặt bóng như có dầu, đọt non màu hơi đỏ\nCành to, cứng cáp, đốt quả dày, chùm quả nhiều trái (trung bình 60 trái/chùm)\nKhả năng đậu trái cao, ít chịu ảnh hưởng của yếu tố thời tiết\nQuả to, ít bị lép, vỏ quả hơi dày nhưng chất lượng nhân vẫn đảm bảo\nKhi chín thường chín tập trung, dễ hái\nTỷ lệ tươi nhân 3,8 – 4,3kg',0,0.05,200,2,NULL,'/template/web/hinhanh/caycn7.jpg',NULL),(60,'Cà phê cao sản TR9',19000,'Sinh trưởng: Cây sinh trưởng khỏe, phân cành mạnh, cành ngang hơi rủ.\nChiều cao cây: Trung bình.\nLá: kích thước trung bình, dạng mũi mác. Màu sắc lá khi thành thục: xanh đậm\nQuả: Dạng thuôn dài, chín màu huyết dụ.\nNăng suất: 5 -7 tấn nhân/ha.\nKháng bệnh: Kháng cao với bệnh gỉ sắt\nChịu hạn tốt, phù hợp với điều kiện khí hậu và đất đai ở các tỉnh Tây Nguyên',0,0.05,200,2,NULL,'/template/web/hinhanh/caycn8.jpg',NULL),(61,'Cà phê TS5',10000,'Lá xanh đậm, dày\nCành to khỏe, dài, dẻo. Cây phát triển rất khỏe\nQuả to xanh đậm có núm bò, vỏ mỏng.\nTrái chín tập trung năng suất từ 7 – 10 tấn / 1ha.\nTỷ lệ tươi/khô 3,8kg.\nTỷ lệ trên sàng 18 là 90%',0,0.05,200,2,NULL,'/template/web/hinhanh/caycn9.jpg',NULL),(62,'Cà phê cao sản TR4',11000,'Một số đặc điểm chính của giống cà phê TR4\nCây sinh trưởng mạnh, cành tán rộng, cành ngang hơi rũ\nLá hình mũi mác, kích thước trung bình, khi thuần thục có màu xanh vàng\nQuả chín màu đỏ cam, nhân trung bình (tỷ lệ trên sàng 16 khoảng 80%)\nNăng suất bình quân 5-7 tấn nhân/ha. Nếu chăm sóc tốt có thể đạt trên 7 tấn\nKhi sử dụng cây ươm từ hạt thuần của cây mẹ TR4 ta có được giống TRS1 (giống vối lai) đa dòng hoặc đơn dòng. Năng suất tương đương hoặc thấp hơn khoảng 10% so với cây mẹ. Nhưng bù lại kỹ thuật chăm sóc đơn giản, bộ rễ khỏe mạnh, cây có sức bền cao.',0,0.05,200,2,NULL,'/template/web/hinhanh/caycn10.jpg',NULL),(63,'Cây trầm hương',5000,'Gỗ trầm hương thuộc loại cây quý hiếm có mùi thơm tại Viêt Nam. Đúng với cái tên, loại cây này có một mùi hương vô cùng dễ chịu khiến nhiều người yêu thích. Mùi hương mà trầm hương mang lại được hình thành từ nhựa thơm của cây gỗ thân già của cây trầm gió tích tụ trong khoảng thời gian dài.\nCây trầm hương khi trưởng thành có thể cao đến khoảng 20 m cùng đường kính thân từ 40 – 60 m. Gỗ cây có màu vàng nhạt, thịt gỗ có màu nâu sọc hay màu nâu đen và loại gỗ này khá nặng.\nTrầm Hương được trồng vào khoảng tháng 6 đến tháng 8 hằng năm. Vì sau những trận mưa đầu mùa, đây chính là thời điểm thích hợp để cây sinh trưởng.',0,0,100,3,NULL,'/template/web/hinhanh/caylg1.jpg',NULL),(64,'Cây keo lá tràm',5000,'Cây keo lá tràm non cũng là một trong các loại cây trồng lấy gỗ được trồng phổ biến nhất hiện nay. Cây có thể thích nghi với mọi điều kiện thời tiết trên tất cả các vùng miền của tổ quốc chúng ta. Cây rất dễ trồng, dễ chăm sóc và thu hoạch nhanh chóng. Chỉ sau khoảng 5-6 năm trồng là bạn đã có thể thu hoạch được.\n\nHiện nay, cây đã có khả năng tỉa cành tự nhiên, thân cây thẳng, không có khuyết tật nên gỗ của cây rất được ưa chuộng sử dụng.',0,0,100,3,NULL,'/template/web/hinhanh/caylg3.jpg',NULL),(65,'Cây gỗ sưa',5000,'Cây gỗ sưa là một loại cây lấy gỗ có giá trị rất cao và được rất nhiều người tìm kiếm hiện nay. Loại cây này có vòng đời khai thác không dài, chỉ từ 10-20 năm, nên nó là loại cây nhanh thu hoạch, nhanh thu hồi vốn nhất.\n\nCây gỗ sưa khi trưởng thành có thể sẽ vươn lên đến độ cao khoảng 10m. Đường kính của thân gỗ rơi vào khoảng 20-30m. Gỗ sưa thường có màu đỏ sẫm cùng với vân gỗ màu đen.',0,0,100,3,NULL,'/template/web/hinhanh/caylg4.jpg',NULL),(66,'Cây bạch đàn cao sản',5000,'Nhắc đến các loại cây trồng lấy gỗ thì không thể không nhắc đến cây bạch đàn cao sản hay còn gọi là bạch đàn lai. Đây là loại cây có tốc độ sinh trưởng nhanh nên có chu kỳ khai thác ngắn. Bạch đàn có tốc độ khai thác nhanh chỉ khoảng 6 năm 1 lần và có giá trị khai thác cao.\n\nCây bạch đàn cao sản có khả năng phân bố một cách rộng rãi, thích hợp với khí hậu á nhiệt đới và nhiệt đới. Cây có thể được trồng ở vùng núi hay vùng ven biển đều có thể được. Ngay kể cả những vùng hạn hán vẫn trồng được vì nó có khả năng chịu hạn hán. Nhưng loại cây này lại không thích hợp với những nơi có sương muối kéo dài.\n\nGỗ bạch đàn có rất nhiều giá trị và ứng dụng trong đời sống hàng ngày như làm giàn giáo cốp pha, chống đỡ…',0,0,100,3,NULL,'/template/web/hinhanh/caylg5.jpg',NULL),(67,'Cây gỗ mường đen',5000,'Gỗ mường đen là loại cây lấy gỗ được trồng nhiều nhất ở Tây Nguyên. Loại gỗ này có đặc trưng là thịt gỗ có màu nâu đen pha tím. Đặc biệt, gỗ này có đặc điểm là không bị mối mọt và phát triển khá nhanh.\n\nThời gian khai thác của loại cây gỗ này là từ 7-10 năm hoặc tốt nhất là trong khoảng 15-20 năm. Cây mường đen trưởng thành có thể cao tới 15m, đường kính khoảng 50-60cm.',1,0.05,100,3,NULL,'/template/web/hinhanh/caylg6.jpg',NULL),(68,'Cây xoan đào',5000,'Một trong các loại cây trồng lấy gỗ mà Vườn Ươm Số 1 muốn giới thiệu cho bạn chính là cây xoan đào. Đây là loại cây được yêu thích ở rất nhiều nơi, nhất là những vùng như Hà Tĩnh, Nghệ An.Cây có thể sống được ở trên các vùng đất cằn cỗi, đường làng… miễn là cây không bị úng nước, đất có độ pH trung bình.\n\nCây xoan đào có thời gian thu hoạch rơi vào khoảng 7-9 năm và mang lại giá trị kinh tế khá cao. Chất liệu của nó được ưa chuộng để đóng đồ gia dụng, đóng tủ, bàn ghế hay làm cửa trong nhà…',0,0,100,3,NULL,'/template/web/hinhanh/caylg7.jpg',NULL),(69,'Cây gỗ cẩm lai',5000,'Cây gỗ cẩm lai cũng là một trong các loại cây lấy gỗ trồng nhiều nhất ở Tây Nguyên, những vùng giáp Lào, Campuchia. Gỗ của cây này khá nặng thịt, gỗ có màu nâu hồng đan xen với những vân gỗ có viền đen.\n\nHỗ có thời gian thu hoạch trung bình rơi vào khoảng 30 năm, thời gian thu hoạch tối thiểu là trên 15 năm. Nhưng thời gian để cho cây phát triển hết mức và cho năng suất cao nhất là 50-60 năm.',0,0,100,3,NULL,'/template/web/hinhanh/caylg8.jpg',NULL),(70,'Cây thiên ngân',5000,'Cây thiên ngân hay còn gọi là cây gáo vàng Thái Lan có nguồn gốc xuất phát từ đất nước Thái Lan với lợi ích kinh tế cao. Với khí hậu của Việt Nam, cây gáo vàng có thể phát triển rất thuận lợi, đặc biệt là những vùng mưa quanh năm thì sẽ càng thuận lợi hơn.\n\nĐể cây trồng phát triển nhanh, tốt và có thể thu hoạch nhanh chóng thì nên trồng ở những nơi đất dày, ẩm ướt. Nếu trồng ở những nơi có nhiều sỏi đá và cằn cỗi thì bạn nên bón nhiều phân hữu cơ vi sinh vào gốc cây.\n\nTrên thực tế, cây thiên ngân có tốc độ phát triển rất nhanh, chỉ sau khoảng 3-4 năm là người dân đã có thể thu hoạch để phục vụ sản xuất giấy, than… Và sau khoảng 6 năm thì có thể thu hoạch để phục vụ công nghệ làm gỗ nội thất, gỗ ép…',0,0,100,3,NULL,'/template/web/hinhanh/caylg1.jpg',NULL),(71,'Cây trúc liễu',5000,'Cây trúc liễu là tổ hợp lai giữa các loài Liễu và Trúc của Mỹ, Triều Tiên, Trung Quốc, dựa vào công nghệ sinh học trình độ cao, mang tính đột phá lớn. Trúc liễu có tiềm lực phát trưởng cực mạnh, cao trên 20m. Vỏ cây non màu xanh, trơn nhẵn, ưu thế phát triển ngọn mạnh, khả năng phát triển chồi nách tốt.\n\nTán hình tháp, phân cành đều. Lá hình mác, lá đơn mọc xen kẽ, phiến là dài 15 – 22cm, rộng 3,5 – 6,2cm, ngọn lá dài, nhọn dần, mép lá có răng cưa nhỏ và rõ, mặt trên phiến lá màu xanh, mặt dưới màu trắng tro, cuống lá hơi đỏ, ngắn.',0,0,100,3,NULL,'/template/web/hinhanh/caylg6.jpg',NULL),(72,'Cây gỗ gụ',5000,'Gỗ gụ là loại gỗ tốt được xếp vào nhóm gỗ quý tại Việt Nam, đặc điểm màu gỗ vàng nhạt, hay vàng trắng, để lâu sẽ chuyển sang màu nâu thẫm. Gỗ gụ có thớ thẳng, vân mịn và đẹp.\n\nTuy nhiên vân gỗ gụ có hình dáng như hoa, đa dạng và rất đẹp, để nhận biết gỗ gụ là khi đưa lên mũi ngửi thấy có mùi chua nhưng không hăng. Khi đánh bóng bằng vecni gỗ sẽ có màu nâu đậm, hoặc màu nâu đỏ. Gỗ gụ lau có màu nâu thẫm, rất ít khi bị mối mọt hay mục, hơi có vân hoa.',0,0,100,3,NULL,'/template/web/hinhanh/caylg1.jpg',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rating` (
  `pro_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `point` float DEFAULT NULL,
  `note` text COLLATE utf8mb4_bin,
  KEY `pro_id` (`pro_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,1.1,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(7,3,1.7,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(10,2,2.2,'Nên ghé lại mua nhaaaa'),(11,3,2.1,'Các bạn mua nhiều vào nhé'),(12,4,2.2,'Chà. Sản phẩm quá tuyệt'),(15,3,2.5,'Tuyệt vời, giá vừa phải. Năng suất cao'),(16,4,2.6,'Nên ghé lại mua nhaaaa'),(18,2,3.7,'Chà. Sản phẩm quá tuyệt'),(19,3,3.8,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(20,4,3.9,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(22,2,4.1,'Nên ghé lại mua nhaaaa'),(23,3,4.2,'Các bạn mua nhiều vào nhé'),(24,4,4.3,'Chà. Sản phẩm quá tuyệt'),(25,1,4.4,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(26,2,4.5,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(27,3,4.6,'Tuyệt vời, giá vừa phải. Năng suất cao'),(28,4,4.7,'Nên ghé lại mua nhaaaa'),(29,1,4.8,'Các bạn mua nhiều vào nhé'),(30,2,4.9,'Chà. Sản phẩm quá tuyệt'),(32,4,3.3,'Chà. Sản phẩm quá tuyệt'),(33,1,3.4,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(34,2,3.5,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(35,3,3.6,'Tuyệt vời, giá vừa phải. Năng suất cao'),(37,1,3.8,'Các bạn mua nhiều vào nhé'),(38,2,3.9,'Chà. Sản phẩm quá tuyệt'),(39,3,4,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(40,4,4.1,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(41,1,4.2,'Tuyệt vời, giá vừa phải. Năng suất cao'),(42,2,4.3,'Nên ghé lại mua nhaaaa'),(46,2,4.4,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(47,3,4.5,'Tuyệt vời, giá vừa phải. Năng suất cao'),(48,4,4.6,'Nên ghé lại mua nhaaaa'),(49,1,4.7,'Các bạn mua nhiều vào nhé'),(50,2,4.8,'Chà. Sản phẩm quá tuyệt'),(51,3,4.9,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(52,4,5,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(53,1,2.4,'Tuyệt vời, giá vừa phải. Năng suất cao'),(54,2,2.5,'Nên ghé lại mua nhaaaa'),(55,3,2.6,'Các bạn mua nhiều vào nhé'),(56,4,2.7,'Chà. Sản phẩm quá tuyệt'),(57,1,2.8,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(58,2,2.9,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(59,3,3,'Tuyệt vời, giá vừa phải. Năng suất cao'),(60,4,3.1,'Nên ghé lại mua nhaaaa'),(61,1,3.2,'Các bạn mua nhiều vào nhé'),(62,2,3.3,'Chà. Sản phẩm quá tuyệt'),(63,3,3.4,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(64,4,3.5,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(65,1,3.6,'Tuyệt vời, giá vừa phải. Năng suất cao'),(66,2,3.7,'Nên ghé lại mua nhaaaa'),(67,3,3.8,'Các bạn mua nhiều vào nhé'),(68,4,3.9,'Chà. Sản phẩm quá tuyệt'),(69,1,4,'Sản phẩm vừa tầm giá, trồng cây rất tốt'),(70,2,4.1,'Hơi khó chăm, bị héo lá. Nhưng sau phát triển mạnh'),(71,3,4.2,'Tuyệt vời, giá vừa phải. Năng suất cao'),(72,4,4.3,'Nên ghé lại mua nhaaaa');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_bin,
  `total` double DEFAULT NULL,
  `items` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (5,'LeCanh','letuancanh.t2264@mail.com','0917016666','Iaphin, GL, VN','Giao hÃ ng á» cÃ¡i cá»ng mÃ u vÃ ng',23000,'Tiêu Srilanka (x1)\nCây Bơ034 (x1)\n');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `first_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `authorities` int(11) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'12345.hlmt','Anh','Nguyen','0123456789','1234@gmail.com',1,'2023-01-01 08:37:21',300000),(2,'23457mltr.','Thuong','Tran','0987654321','3456@gmail.com',2,'2023-01-01 08:38:59',500000),(3,'1','Bao','Le','0129876534','a@gmail.com',1,'2023-01-01 08:40:45',1000000),(4,'1','Quynh','Tran','1234567843','admin',2,'2023-01-01 08:42:25',3000000),(5,'nnnnnnnn1','admin',NULL,NULL,'20130202@gmail.com',1,NULL,NULL),(6,'rrrrrrr1','admin',NULL,NULL,'20130207@st.hcmuaf.edu.vn',1,NULL,NULL),(7,'zxcvbnm1','abc',NULL,NULL,'c@gmai.com',1,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pepe_csdl'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-25  0:38:17
