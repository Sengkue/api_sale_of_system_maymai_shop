-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2023 at 01:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_maymai_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `ownerId`, `url`, `createdAt`, `updatedAt`) VALUES
(4, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp05.jpg?alt=media&token=a1708af7-6fc5-445b-8886-da5375efb413', '2023-07-23 06:50:26', '2023-07-23 06:50:26'),
(5, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp04.jpg?alt=media&token=6340dd03-4899-4c9c-b6e3-547857d4fb94', '2023-07-23 06:50:26', '2023-07-23 06:50:26'),
(7, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F001.jpg?alt=media&token=6fdd599d-2369-469f-8405-0e897e6d80ff', '2023-08-08 12:37:46', '2023-08-08 12:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `createdAt`, `updatedAt`) VALUES
('0a349301-e0c8-4de8-bcb7-21126869159b', 'ໂສ້ງ', '2023-07-24 04:22:14', '2023-07-24 04:22:14'),
('66fd8ab3-fa02-4399-8115-edc8a1508093', 'ເສື້ອເຊີດ', '2023-07-24 04:37:33', '2023-07-24 04:37:33'),
('7c4b7538-897c-4b1b-8387-f257ff848cb1', 'ຊຸດນອນ', '2023-07-24 04:37:46', '2023-07-24 04:37:46'),
('813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເສື້ອ', '2023-07-24 04:21:36', '2023-07-24 04:21:36'),
('d76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສື້ອຍືດ', '2023-07-24 04:38:09', '2023-07-24 04:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `color_sizes`
--

CREATE TABLE `color_sizes` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `cost_price` float DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `color_sizes`
--

INSERT INTO `color_sizes` (`id`, `product_id`, `color`, `size`, `quantity`, `cost_price`, `sale_price`, `createdAt`, `updatedAt`) VALUES
('3e38ae24-e892-4cf7-9a92-9d47913497a0', '9480c313-4921-41c3-bfb1-51c53092fc47', 'ບົວ', 'S', 15, 35000, 50000, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('43645fc8-e5ae-4c97-a30d-92fe716f6e53', 'af3ec450-2b6a-4739-80d7-e87858483432', 'ດຳ', 'M', 14, 100000, 165000, '2023-08-09 12:42:30', '2023-08-09 12:43:27'),
('546ae085-ac92-4fe3-adc8-53eb804d1d2e', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'ແດງ', 'S', 15, 70000, 89000, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('7202e816-3620-4267-ace9-7408c0c02ad8', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'ດຳ', 'S', 15, 90000, 250000, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('85eaceee-12d2-4f50-ac66-e200dc2e3157', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 'ດຳ', 'S', 15, 85000, 250000, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('911a36a1-e49e-4408-acd5-b1b96dbbfe89', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'ບົວ', 'S', 15, 25000, 59000, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('ca6a4ff6-7f14-4de1-86b0-8bded92cb2a5', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'ດຳ', 'S', 13, 45000, 69000, '2023-08-09 12:42:30', '2023-08-14 08:31:51'),
('dd943298-c818-43c4-9463-eb5ff3bd0366', '61683384-a4c5-4210-bb57-ba4f7b5996ba', 'ຂຽວ', 'S', 12, 25000, 35000, '2023-08-09 08:46:47', '2023-08-09 12:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `c_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_profile` varchar(255) DEFAULT NULL,
  `c_fname` varchar(255) DEFAULT NULL,
  `c_lname` varchar(255) DEFAULT NULL,
  `c_gender` varchar(255) DEFAULT NULL,
  `c_phone` varchar(255) DEFAULT NULL,
  `c_password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`c_id`, `c_profile`, `c_fname`, `c_lname`, `c_gender`, `c_phone`, `c_password`, `createdAt`, `updatedAt`) VALUES
('0c968987-2ca6-40c0-a6d2-244413740ce3', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F2.png?alt=media&token=6e1424b5-9059-46ca-9ad7-99fbfa6191bb', 'touyang', 'thortou', 'ຊາຍ', '02078955536', '$2b$05$Q.9e3zNEDCN29jECBSRra.MNVP.3HGg8J2uA8ulmiZdA9ZZYuUZcq', '2023-08-01 13:13:40', '2023-08-01 13:13:40'),
('26c7d125-d636-4716-b5e3-aa694fb82112', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome_3.jpg?alt=media&token=2c037669-eaa2-420a-a8dc-8e77962b61ab', 'afsd', 'sdfs', 'ຊາຍ', '02056565656', '$2b$05$x6uxPrs8u0quUITeWMlhLO4/Sk4SPbPDOAqZhNQIx4jCuhRrlDSVe', '2023-07-29 10:58:39', '2023-07-29 10:58:39'),
('3ac5e553-f9f7-4bcd-ba06-bd166a97b0ca', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FWhatsApp%20Image%202023-07-18%20at%2010.10.30.jpeg?alt=media&token=bbf0aae4-08d6-46e3-be57-70f518bd7ecb', 'user', 'wang', 'ຊາຍ', '02077777777', '$2b$05$9qp5i3gN9.x0dn5rQoZKAuJzjH3VX/ss.hJVUTrNBDCMpMoFuXWRq', '2023-08-05 09:12:10', '2023-08-05 09:12:10'),
('444b636a-6360-4ab3-82a9-7c621d994720', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome_2.jpg?alt=media&token=44d74ea6-29c8-4a7a-bacc-11a87091dcd7', 'ບີ', 'ວ່າງ', 'ຍິງ', '0203333333', '$2b$05$F1UyM2Jj6TUoBtjcFxlSRuOcJRG2wyw2um7K8UQwFAxJq4ioc4fhW', '2023-07-25 07:25:54', '2023-07-25 23:01:06'),
('4ff5e4cb-bbde-49b4-a33b-0e094f3dc346', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FAn%20error%20occurred%20-%20ecommerce_landing%20-%20Google%20Chrome.jpg?alt=media&token=eee09d07-93f1-4054-b499-998fe767d8d0', NULL, 'ພົງວົງສາ', 'ຊາຍ', '02056325632', '$2b$05$z58t1cl6T.24LuH2udMBMeYigbVf6OuKa6e4uOrS1dkUWEPNpAYjC', '2023-08-09 12:53:10', '2023-08-09 12:53:10'),
('68292fce-c47f-4049-8cf9-63c4b1e4df25', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FWhatsApp%20-%20Google%20Chrome.jpg?alt=media&token=5ded7c46-a8aa-4757-bf7d-5978decbe0c9', 'sdfs', 'sdf', 'ຊາຍ', '020555522211', '$2b$05$8MVYxZPDRjbee1r2rCXONOkBV6nfMH.N6lxhEMyjwNv1ZAX0NOmAC', '2023-07-30 01:38:32', '2023-07-30 01:38:32'),
('68d98abb-9e35-4fdb-81fd-e97d1bcb4db4', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FgreenShirt.png?alt=media&token=4038e390-6463-4268-9e96-5cde97becf0c', 'se', 'se', 'ຊາຍ', '02022221111', '$2b$05$mb3AuNfCkpNwj.qaQSb1HuuS7piQ11E/wk1uZ4ylv50r4actGZIii', '2023-08-09 02:32:25', '2023-08-09 02:32:25'),
('6e5ffcfd-e934-4095-a09c-b77d5030c2e1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F2.png?alt=media&token=c7977953-d7b0-4a72-a0e0-31cea862a72e', 'g', 'g', 'ຍິງ', '02097181800', '$2b$05$ZSUDSy/a1LU89cFr18a/reDYwvNhSViKB4gISOmiyhKs8YUoAG4T.', '2023-07-28 10:27:38', '2023-07-28 10:27:38'),
('761810d4-f1d4-4022-bd1d-652fbdd81c82', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome.jpg?alt=media&token=93d20f48-f20f-45f2-9d87-5fc76837a4f1', 'dfadsf', 'sdfsd', 'ຊາຍ', '0205566655', '$2b$05$yCRAlJWqDtiRNM5EYAqUY.0jB9U/SsXp7Z5Ezqc4C0rGgt9AvxRVy', '2023-07-30 01:43:13', '2023-07-30 01:43:13'),
('8d404dd4-3fee-49ac-ac3f-16d81349896d', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome_3.jpg?alt=media&token=0591cdf0-e7a6-4753-bde0-f5bcefa08872', 'kchange ', 'wang', 'ຊາຍ', '20298798798', '$2b$05$uj7xySuFeN9722tSt09ea.BwoRm6ZXz07fGr10LTrgjptSc1HiwfG', '2023-07-30 07:10:28', '2023-07-30 07:10:28'),
('a8168718-5082-4bba-bbfa-990b8d5fe8b0', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F6c05f1b3-409a-4438-9597-dfdab42a0bdb.jpg?alt=media&token=07b44c26-ddea-4b64-bc1f-a5c2cf22a5f0', 'pany', 'xiong', 'ຍິງ', '02056985698', '$2b$05$.pzUc5vhb9H7jMf99DRwG.Ossno/SpM8ncLgLnnzybqVumKEIubKC', '2023-07-29 14:06:26', '2023-07-29 14:06:26'),
('ad1d351e-123f-4406-aef1-576e766fb9f5', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG_E4889.JPG?alt=media&token=f6ffd80e-8098-4cfd-a5fc-211e313d9e50', 'ມໍ', 'ເລົ່າ', 'ຊາຍ', '02078781525', '$2b$05$kqOZ7ejFlCTktjg9MjM1Zu1BYPseycuPvuHkQcFPiEPPWmb1Npotu', '2023-07-23 04:54:18', '2023-07-27 14:32:02'),
('ba369ac9-4709-4769-a8cf-90d459e48f2f', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome_3.jpg?alt=media&token=c6076e5b-bd13-4961-86ea-ae14eafe13b5', 'ຟົງ', 'ວື', 'ຊາຍ', '02055054511', '$2b$05$Z9BF9lvfzg9B/DiZtVsw3e4q3JEIJXMSru0DAdGEmO9lSMlN8MhgC', '2023-07-25 07:47:57', '2023-07-25 23:02:21'),
('c29bb68b-610a-4ecb-b8a3-c3dfef90908b', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome.jpg?alt=media&token=824388d9-b799-451b-bb22-d8726b50afe3', 'sdfasd', 'sdfs', 'ຊາຍ', '02033333222', '$2b$05$pxfRIetmM9CZ/F3DHzETMOaTrO/9Izli8ictfScjb6.z.1rnDBkLq', '2023-07-30 01:36:58', '2023-07-30 01:36:58'),
('c3fb1b6c-3664-4900-bb1e-b84666f6084b', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F001.jpg?alt=media&token=2d1f226b-5d1f-44d4-9e7d-6c1ebafcea9e', 's', 's', 'ຊາຍ', '02033333333', '$2b$05$awFIQUQyMB54hNuYOEhMCuVRuWpw87fbPWcMaSpH3L1PdtnQnSxbO', '2023-07-29 10:53:56', '2023-07-29 10:53:56'),
('c58afa29-a1e8-41cd-b0f2-309a40399bac', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2Fer.jpg?alt=media&token=30333c0f-95a5-4415-aaf2-d00ba6e3398d', 'sdfs', 'dfs', 'ຊາຍ', '020323232323', '$2b$05$f02Ku8YDpz7YYTDD.RAtQeHKxF.STc7EW5L9k38LHs0hsmGMGU7LC', '2023-07-30 01:41:56', '2023-07-30 01:41:56'),
('d2c72e20-9937-43e0-aba5-d4e8d7734875', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome.jpg?alt=media&token=4e014975-7474-436f-a1d1-92b1decca89f', 'se', 'se', 'ຊາຍ', '02012312312', '$2b$05$e.UlwhAgbUEXSiB3ZULtXeIJYAtGOcRtwMfFvF92RnkVQswwvWNBW', '2023-07-30 07:42:59', '2023-07-30 07:42:59'),
('de5a498c-683f-4e55-ad5e-4f6c61880d07', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F6c05f1b3-409a-4438-9597-dfdab42a0bdb.jpg?alt=media&token=4271cf79-72ec-4791-b8cd-fd784e69a17f', 'sdfass', 'adfasd', 'ຊາຍ', '02085296321', '$2b$05$H/OGhVapdaI7ZeFiaNTDg.BneZde1qWr9Lm60qMMSnl8dpn8.WM3.', '2023-08-01 13:08:02', '2023-08-01 13:08:02'),
('fdde3761-4500-4756-aff0-0835b4818337', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome.jpg?alt=media&token=ff8407d9-4311-4b1b-9a22-703b2f9f82f2', 'sdafs', 'sdf', 'ຊາຍ', '020555222663', '$2b$05$zVO4CkjJWa9roYIi9gkf3epE.04/w4bpc5eDDLN39nZNBjydfI7XO', '2023-07-30 01:42:31', '2023-07-30 01:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `districtName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `provinceId`, `districtName`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'ໄຊເສດຖາ', '2023-07-22 12:29:50', '2023-07-22 12:29:50'),
(2, 25, 'ຫ້ວຍຊາຍ', '2023-07-24 05:07:41', '2023-07-24 06:58:14'),
(3, 25, 'ປາກທາ', '2023-07-24 05:07:49', '2023-07-24 05:07:49'),
(4, 25, 'ຕົ້ນເຜີ້ງ', '2023-07-24 05:08:05', '2023-07-24 05:08:05'),
(5, 25, 'ຜາອຸດົມ', '2023-07-24 05:08:23', '2023-07-24 05:20:54'),
(6, 1, 'ແປກ', '2023-07-24 05:15:58', '2023-07-24 05:15:58'),
(7, 1, 'ຄຳ', '2023-07-24 05:16:05', '2023-07-24 05:16:05'),
(8, 1, 'ໜອງເເຮດ', '2023-07-24 05:16:23', '2023-07-24 05:16:23'),
(9, 1, 'ຄຸນ', '2023-07-24 05:16:39', '2023-07-24 05:16:39'),
(10, 1, 'ໝອກ', '2023-07-24 05:16:45', '2023-07-24 05:16:45'),
(11, 1, 'ພູກູດ', '2023-07-24 05:16:58', '2023-07-24 05:16:58'),
(12, 1, 'ຜາໄຊ', '2023-07-24 05:17:27', '2023-07-24 05:17:27'),
(13, 25, 'ເມິງ', '2023-07-24 05:23:04', '2023-07-24 05:23:04'),
(14, 26, 'ທ່າແຂກ', '2023-07-24 05:26:03', '2023-07-24 05:26:03'),
(15, 26, 'ມະຫາໄຊ', '2023-07-24 05:26:15', '2023-07-24 05:26:15'),
(16, 26, 'ໜອງບົກ', '2023-07-24 05:26:34', '2023-07-24 05:26:34'),
(17, 26, 'ຫີນບູນ', '2023-07-24 05:26:42', '2023-07-24 05:26:42'),
(18, 26, 'ຍົມມະລາດ', '2023-07-24 05:27:00', '2023-07-24 05:27:00'),
(19, 26, 'ບົວລະພາ', '2023-07-24 05:27:10', '2023-07-24 05:27:10'),
(20, 26, 'ນາກາຍ', '2023-07-24 05:27:15', '2023-07-24 05:27:15'),
(21, 26, 'ເຊບັ້ງໄຟ', '2023-07-24 05:27:25', '2023-07-24 05:27:25'),
(22, 26, 'ໄຊບົວທອງ', '2023-07-24 05:27:33', '2023-07-24 05:27:33'),
(23, 26, 'ຄູນຄຳ', '2023-07-24 05:27:41', '2023-07-24 05:27:41'),
(24, 27, 'ນະຄອນປາກເຊ', '2023-07-24 05:29:49', '2023-07-24 05:29:49'),
(25, 27, 'ຊະນະສົມບູນ', '2023-07-24 05:30:03', '2023-07-24 05:30:03'),
(26, 27, 'ບາຈຽງຈະເລີນສຸກ', '2023-07-24 05:30:27', '2023-07-24 05:30:27'),
(27, 27, 'ປາກຊ່ອງ', '2023-07-24 05:30:46', '2023-07-24 05:30:46'),
(28, 27, 'ປະທຸມພອນ', '2023-07-24 05:30:59', '2023-07-24 05:30:59'),
(29, 27, 'ໂພນທອງ', '2023-07-24 05:31:23', '2023-07-24 05:31:23'),
(30, 27, 'ຈຳປາສັກ', '2023-07-24 05:31:32', '2023-07-24 05:31:32'),
(31, 27, 'ສຸຂຸມາ', '2023-07-24 05:31:43', '2023-07-24 05:31:43'),
(32, 27, 'ມູນລະປະໂມກ', '2023-07-24 05:31:55', '2023-07-24 05:31:55'),
(33, 27, 'ໂຂງ', '2023-07-24 05:31:58', '2023-07-24 05:31:58'),
(34, 29, 'ສາລະວັນ', '2023-07-24 05:33:16', '2023-07-24 05:33:16'),
(35, 29, 'ລະຄອນເພັງ', '2023-07-24 05:33:25', '2023-07-24 05:33:25'),
(36, 29, 'ວາບີ', '2023-07-24 05:33:34', '2023-07-24 05:33:34'),
(37, 29, 'ເລົ່າງາມ', '2023-07-24 05:33:43', '2023-07-24 05:33:43'),
(38, 29, 'ຕຸ້ມລານ', '2023-07-24 05:33:58', '2023-07-24 05:33:58'),
(42, 29, 'ຕະໂອ້ຍ', '2023-07-24 05:35:05', '2023-07-24 05:35:05'),
(43, 29, 'ຄົງເຊໂດນ', '2023-07-24 05:35:19', '2023-07-24 05:35:19'),
(44, 29, 'ສະໝ້ວຍ', '2023-07-24 05:35:26', '2023-07-24 05:35:26'),
(45, 30, 'ໄກສອນ ພົມວິຫານ', '2023-07-24 05:40:18', '2023-07-24 05:40:18'),
(46, 30, 'ອຸທຸມພອນ', '2023-07-24 05:40:32', '2023-07-24 05:40:32'),
(47, 30, 'ອາດສະພັງທອງ', '2023-07-24 05:40:40', '2023-07-24 05:40:40'),
(48, 30, 'ພີນ', '2023-07-24 05:40:45', '2023-07-24 05:40:45'),
(49, 30, 'ເຊໂປນ', '2023-07-24 05:40:56', '2023-07-24 05:40:56'),
(50, 30, 'ນອງ', '2023-07-24 05:40:59', '2023-07-24 05:40:59'),
(51, 30, 'ທຳປາງທອງ', '2023-07-24 05:41:15', '2023-07-24 05:41:15'),
(52, 30, 'ສອງຄອນ', '2023-07-24 05:41:22', '2023-07-24 05:41:22'),
(53, 30, 'ຈຳພອນ', '2023-07-24 05:41:31', '2023-07-24 05:41:31'),
(54, 30, 'ຊົນນະບູລີ', '2023-07-24 05:41:42', '2023-07-24 05:41:42'),
(55, 30, 'ໄຊບູລີ', '2023-07-24 05:41:58', '2023-07-24 05:41:58'),
(56, 30, 'ວິລະບູລີ', '2023-07-24 05:42:13', '2023-07-24 05:42:13'),
(57, 30, 'ອາດສະພອນ', '2023-07-24 05:42:34', '2023-07-24 05:42:34'),
(58, 30, 'ໄຊພູທອງ', '2023-07-24 05:42:50', '2023-07-24 05:42:50'),
(59, 30, 'ພະລານໄຊ', '2023-07-24 05:42:55', '2023-07-24 05:42:55'),
(60, 31, 'ບໍ່ແຕນ', '2023-07-24 05:44:54', '2023-07-24 05:44:54'),
(61, 31, 'ຫົງສາ', '2023-07-24 05:45:07', '2023-07-24 05:45:07'),
(62, 31, 'ແກ່ນທ້າວ', '2023-07-24 05:45:15', '2023-07-24 05:45:15'),
(63, 31, 'ຄອບ', '2023-07-24 05:45:19', '2023-07-24 05:45:19'),
(64, 31, 'ເງິນ', '2023-07-24 05:45:22', '2023-07-24 05:45:22'),
(65, 31, 'ປາກລາຍ', '2023-07-24 05:45:27', '2023-07-24 05:45:27'),
(66, 31, 'ພຽງ', '2023-07-24 05:45:37', '2023-07-24 05:45:37'),
(67, 31, 'ທົ່ງມີໄຊ', '2023-07-24 05:45:47', '2023-07-24 05:45:47'),
(68, 31, 'ໄຊລະບູລີ', '2023-07-24 05:46:01', '2023-07-24 05:46:01'),
(69, 31, 'ຊຽງຮ່ອນ', '2023-07-24 05:46:07', '2023-07-24 05:46:07'),
(70, 31, 'ໄຊສະຖານ', '2023-07-24 05:46:21', '2023-07-24 05:46:21'),
(71, 32, 'ຮົ່ມ', '2023-07-24 05:57:50', '2023-07-24 05:57:50'),
(72, 32, 'ທ່າໂທມ', '2023-07-24 05:58:17', '2023-07-24 05:58:17'),
(73, 32, 'ອະນຸວົງ', '2023-07-24 05:58:34', '2023-07-24 05:58:34'),
(74, 32, 'ລ້ອງຊານ', '2023-07-24 05:58:41', '2023-07-24 05:58:41'),
(75, 32, 'ລ່ອງແຈ້ງ', '2023-07-24 05:58:49', '2023-07-24 05:58:49'),
(76, 33, 'ທ່າແຕງ', '2023-07-24 06:55:22', '2023-07-24 06:55:22'),
(77, 33, 'ລະມາມ', '2023-07-24 06:55:33', '2023-07-24 06:55:33'),
(78, 33, 'ກະລຶມ', '2023-07-24 06:55:40', '2023-07-24 06:55:40'),
(79, 33, 'ດັກຈຶງ', '2023-07-24 06:55:46', '2023-07-24 06:55:46'),
(80, 34, 'ປາກຊັນ', '2023-07-24 06:56:42', '2023-07-24 06:56:42'),
(81, 34, 'ທ່າພະພາດ', '2023-07-24 06:56:58', '2023-07-24 06:56:58'),
(82, 34, 'ປາກກະດິງ', '2023-07-24 06:57:05', '2023-07-24 06:57:05'),
(83, 34, 'ບໍລິຄັນ', '2023-07-24 06:57:13', '2023-07-24 06:57:13'),
(84, 34, 'ຄຳເກີດ', '2023-07-24 06:57:20', '2023-07-24 06:57:20'),
(85, 34, 'ວຽງທອງ', '2023-07-24 06:57:23', '2023-07-24 06:57:23'),
(86, 34, 'ໄຊຈຳພອນ', '2023-07-24 06:57:30', '2023-07-24 06:57:30'),
(87, 36, 'ບຸນໃຕ້', '2023-07-24 06:59:57', '2023-07-24 06:59:57'),
(88, 36, 'ຂວາ', '2023-07-24 07:00:12', '2023-07-24 07:00:12'),
(89, 36, 'ໃໝ່', '2023-07-24 07:00:23', '2023-07-24 07:00:23'),
(90, 36, 'ຍອດອູ', '2023-07-24 07:00:29', '2023-07-24 07:00:29'),
(91, 36, 'ຜົ້ງສາລີ', '2023-07-24 07:00:36', '2023-07-24 07:00:36'),
(92, 36, 'ສຳພັນ', '2023-07-24 07:00:40', '2023-07-24 07:00:40'),
(93, 36, 'ບຸນເໜືອ', '2023-07-24 07:00:49', '2023-07-24 07:00:49'),
(94, 37, 'ຫຼວງນຳ້ທາ', '2023-07-24 07:05:46', '2023-07-24 07:05:46'),
(95, 37, 'ສິງ', '2023-07-24 07:05:54', '2023-07-24 07:05:54'),
(96, 37, 'ລອງ', '2023-07-24 07:05:55', '2023-07-24 07:05:55'),
(97, 37, 'ວຽງພູຄາ', '2023-07-24 07:06:07', '2023-07-24 07:06:07'),
(98, 37, 'ນາແລ', '2023-07-24 07:06:14', '2023-07-24 07:06:14'),
(99, 38, 'ຫຼວງພະບາງ', '2023-07-24 07:07:47', '2023-07-24 07:07:47'),
(100, 38, 'ຊຽງເງິນ', '2023-07-24 07:07:54', '2023-07-24 07:07:54'),
(101, 38, 'ນານ', '2023-07-24 07:07:56', '2023-07-24 07:07:56'),
(102, 38, 'ປາກອູ', '2023-07-24 07:08:05', '2023-07-24 07:08:05'),
(103, 38, 'ນໍ້າບາກ', '2023-07-24 07:08:14', '2023-07-24 07:08:14'),
(104, 38, 'ງອຍ', '2023-07-24 07:08:18', '2023-07-24 07:08:18'),
(105, 38, 'ປາກແຊງ', '2023-07-24 07:08:23', '2023-07-24 07:08:23'),
(106, 38, 'ໂພນໄຊ', '2023-07-24 07:08:29', '2023-07-24 07:08:29'),
(107, 38, 'ຈອມເພັດ', '2023-07-24 07:08:34', '2023-07-24 07:08:34'),
(108, 38, 'ວຽງຄຳ', '2023-07-24 07:08:37', '2023-07-24 07:08:37'),
(109, 38, 'ພູຄູນ', '2023-07-24 07:08:48', '2023-07-24 07:08:48'),
(110, 38, 'ໂພນທອງ', '2023-07-24 07:08:52', '2023-07-24 07:08:52'),
(111, 39, 'ເຟືອງ', '2023-07-24 07:09:56', '2023-07-24 07:09:56'),
(112, 39, 'ຫືນເຫິບ', '2023-07-24 07:10:05', '2023-07-24 07:10:05'),
(113, 39, 'ກາສີ', '2023-07-24 07:10:09', '2023-07-24 07:10:09'),
(114, 39, 'ແກ້ວອຸດົມ', '2023-07-24 07:10:22', '2023-07-24 07:10:22'),
(115, 39, 'ແມດ', '2023-07-24 07:10:25', '2023-07-24 07:10:25'),
(116, 39, 'ໂພນໂຮງ', '2023-07-24 07:10:29', '2023-07-24 07:10:29'),
(117, 39, 'ທຸລະຄົທ', '2023-07-24 07:10:37', '2023-07-24 07:10:37'),
(118, 39, 'ວັງວຽງ', '2023-07-24 07:10:44', '2023-07-24 07:10:44'),
(119, 39, 'ວຽງຄຳ', '2023-07-24 07:10:48', '2023-07-24 07:10:48'),
(120, 39, 'ຊະນະຄາມ', '2023-07-24 07:10:55', '2023-07-24 07:10:55'),
(121, 39, 'ໝື່ນ', '2023-07-24 07:11:02', '2023-07-24 07:11:02'),
(122, 42, 'ໄຊເຊດຖາ', '2023-07-24 07:14:10', '2023-07-24 07:14:10'),
(123, 42, 'ສາມັກຄີໄຊ', '2023-07-24 07:14:27', '2023-07-24 07:14:27'),
(124, 42, 'ສະໜາມໄຊ', '2023-07-24 07:14:34', '2023-07-24 07:14:34'),
(125, 42, 'ຊານໄຊ', '2023-07-24 07:14:41', '2023-07-24 07:14:41'),
(126, 42, 'ພູວົງ', '2023-07-24 07:14:48', '2023-07-24 07:14:48'),
(127, 44, 'ໄຊ', '2023-07-24 07:15:57', '2023-07-24 07:15:57'),
(128, 44, 'ຫຼາ', '2023-07-24 07:16:03', '2023-07-24 07:16:03'),
(129, 44, 'ນາໝໍ້', '2023-07-24 07:16:21', '2023-07-24 07:16:21'),
(130, 44, 'ງາ', '2023-07-24 07:16:24', '2023-07-24 07:16:24'),
(131, 44, 'ແບ່ງ', '2023-07-24 07:16:26', '2023-07-24 07:16:26'),
(132, 44, 'ຮຸນ', '2023-07-24 07:16:31', '2023-07-24 07:16:31'),
(133, 44, 'ປາກແບ່ງ', '2023-07-24 07:16:49', '2023-07-24 07:16:49'),
(134, 45, 'ຊຳເໜືອ', '2023-07-24 07:18:26', '2023-07-24 07:18:26'),
(135, 45, 'ຊຽງຄໍ້', '2023-07-24 07:18:35', '2023-07-24 07:18:35'),
(136, 45, 'ຮ້ຽມ', '2023-07-24 07:18:40', '2023-07-24 07:18:59'),
(137, 45, 'ວຽງໄຊ', '2023-07-24 07:19:18', '2023-07-24 07:19:18'),
(138, 45, 'ຫົວເມືອງ', '2023-07-24 07:19:31', '2023-07-24 07:19:31'),
(139, 45, 'ຊຳໃຕ້', '2023-07-24 07:19:41', '2023-07-24 07:19:41'),
(140, 45, 'ສົບເບົາ', '2023-07-24 07:19:51', '2023-07-24 07:19:51'),
(141, 45, 'ແອດ', '2023-07-24 07:20:02', '2023-07-24 07:20:02'),
(142, 45, 'ກອັນ', '2023-07-24 07:20:07', '2023-07-24 07:20:07'),
(143, 45, 'ຊ່ອນ', '2023-07-24 07:20:11', '2023-07-24 07:20:11'),
(144, 47, 'ຈັນທະບູລີ', '2023-07-24 07:21:27', '2023-07-24 07:21:27'),
(145, 47, 'ຫາດຊາຍຟອງ', '2023-07-24 07:21:49', '2023-07-24 07:21:49'),
(146, 47, 'ປາກງື່ມ', '2023-07-24 07:22:05', '2023-07-24 07:22:05'),
(147, 47, 'ນາຊາຍທອງ', '2023-07-24 07:22:21', '2023-07-24 07:22:21'),
(148, 47, 'ສັງທອງ', '2023-07-24 07:22:26', '2023-07-24 07:22:26'),
(149, 47, 'ສິໂຄດຕະບອງ', '2023-07-24 07:22:39', '2023-07-24 07:22:39'),
(150, 47, 'ສີໂຄດຕະບອງ', '2023-07-24 07:22:51', '2023-07-24 07:22:51'),
(151, 47, 'ສີສັດຕະນາກ', '2023-07-24 07:23:02', '2023-07-24 07:23:02'),
(152, 47, 'ໄຊເສດຖາ', '2023-07-24 07:23:15', '2023-07-24 07:23:15'),
(153, 47, 'ໄຊທານີ', '2023-07-24 07:23:22', '2023-07-24 07:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `firstName`, `lastName`, `gender`, `profile`, `email`, `phone`, `village`, `provinceId`, `districtId`, `createdAt`, `updatedAt`) VALUES
('0d53462e-879d-4c3f-b5e6-1e778b8fb721', 'ບີ່', 'ວ່າງ', 'ຍິງ', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FWhatsApp%20Image%202023-01-03%20at%2011.52.12%20(1).jpeg?alt=media&token=8efcf632-6086-4672-9e20-a4bd20da4a6d', 'ຶຶbeevang@gmail.com', '02022996387', 'ໂພກງານໃຕ້', 1, 6, '2023-07-22 12:30:22', '2023-07-27 15:20:36'),
('636a4fa1-a0fb-4c38-a036-3c2a8bff844b', 'ຈະໝີ', 'ເຮີ', 'ຍິງ', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FWhatsApp%20Image%202023-01-01%20at%2019.33.17.jpeg?alt=media&token=8b0667f4-2894-42e5-8b68-61c8ee783236', 'jamee@gmail.com', '02078981524', 'ຕາມມີໄຊ', 47, 153, '2023-07-27 15:22:43', '2023-07-27 15:22:43'),
('dbc05e74-a2a8-40dc-80a2-3536fa2d5233', 'ເຢຍ', 'ທໍ່', 'ຍິງ', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FWhatsApp%20Image%202023-01-03%20at%2010.10.40.jpeg?alt=media&token=0c76bbe4-62b2-44c2-8e1d-b29cfb95b3c0', 'yiathor@gmail.com', '02078781525', 'ໝອງວຽງຄຳ', 47, 153, '2023-07-27 15:24:41', '2023-07-27 15:25:14');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `productId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `altText` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `productId`, `url`, `altText`, `createdAt`, `updatedAt`) VALUES
('01685da5-4277-4f20-b9d8-0fd0f2d1ca82', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0025.jpg?alt=media&token=e6b3a914-30b9-4609-abf6-9b0eb3f799cf', 'IMG-20230724-WA0025.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('04892472-709f-4444-aba8-8af9d069965d', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F05.png?alt=media&token=4b5551b6-07bb-41f8-b4ab-c8670283a10b', '05.png', '2023-07-24 08:59:13', '2023-07-24 08:59:13'),
('0815334c-bc8d-419f-a644-b4f5a0fb48e1', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F02_2.jpg?alt=media&token=5cd7d0bd-7924-44a2-8a5d-1b1e69b43ea0', '02_2.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('0c2e6fae-0d40-4fbd-b555-eadeb28a0d92', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F01.png?alt=media&token=97a7179b-b04c-4a03-8610-6172aa8400e7', '01.png', '2023-08-09 02:10:33', '2023-08-09 02:10:33'),
('1349dc82-3e35-49b5-99bf-6fbd53ddcc6c', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0045.jpg?alt=media&token=2a0f0445-8953-4817-883a-c7213d8a1d77', 'IMG-20230724-WA0045.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('1a681ce6-9aed-4ca0-8be2-23c6d70ed3dd', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0022.jpg?alt=media&token=97aad804-47bf-45bf-aa4d-71c71703f48f', 'IMG-20230724-WA0022.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('1b51e335-b1e4-4096-9641-3184331c165e', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0028.jpg?alt=media&token=b9b421f4-6af9-4b65-9923-7589db4c6dd5', 'IMG-20230724-WA0028.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('2bc6bf8f-4713-4e77-abf8-8bdeee3ad3be', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0020.jpg?alt=media&token=a021f149-048a-4505-b694-9027468d1605', 'IMG-20230724-WA0020.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('2dc3b626-6eb1-4fe8-9222-ddabe17c111d', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0010.jpg?alt=media&token=020c2c92-cdd0-4824-aebd-e530bd699d74', 'IMG-20230723-WA0010.jpg', '2023-07-24 08:42:35', '2023-07-24 08:42:35'),
('2e221e60-9dff-4cb6-be54-af528cdf5e23', '5ba43646-0351-480a-98fb-4e9c128b1853', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F03.png?alt=media&token=4572e4e7-b363-47c9-9088-e42ed4e79bac', '03.png', '2023-08-09 09:51:40', '2023-08-09 09:51:40'),
('2fc67d09-3972-489d-ab75-89737b8599fd', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F669e73c9-801a-4f1b-8150-a0ee09a6f71c.jpeg?alt=media&token=5070d026-81bb-4173-a9e5-d1c1d2f3a769', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('351c52e5-5de1-4675-8d57-ef450d9c4b2b', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0010.jpg?alt=media&token=33fb1adc-a613-49ca-9b87-aa4265fce4af', 'IMG-20230724-WA0010.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('394ada31-f5eb-4151-859c-0c5a3ca1ba93', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F07.png?alt=media&token=e1d4e449-d2cd-4ac4-be4d-48d24100e7aa', '07.png', '2023-07-24 09:03:52', '2023-07-24 09:03:52'),
('3d989063-8478-4e3b-8543-7a8e98ef41e9', 'af3ec450-2b6a-4739-80d7-e87858483432', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F004.jpg?alt=media&token=ad290234-19c3-4a10-a70b-41cabddc5426', '004.jpg', '2023-07-24 07:54:25', '2023-07-24 07:54:25'),
('3ef68b0c-8df7-4ad2-bd28-eba2a71f6085', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0039.jpg?alt=media&token=5da48e23-31af-4241-b1f4-914f9fa025ab', 'IMG-20230724-WA0039.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('46552527-ec49-493e-92b5-45b3d7af2cdf', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0021.jpg?alt=media&token=4a6961af-ac82-44b9-ac2f-e0eed3f54599', 'IMG-20230724-WA0021.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('473a6827-e5e4-4e6f-af60-254cf5ffd096', 'af3ec450-2b6a-4739-80d7-e87858483432', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F002.jpg?alt=media&token=4f88c34a-494e-4f9f-8621-2fc089ef2250', '002.jpg', '2023-07-24 07:54:25', '2023-07-24 07:54:25'),
('47f23e21-830e-4482-94f3-d5414cd9cf77', '5ba43646-0351-480a-98fb-4e9c128b1853', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FgreenShirt.png?alt=media&token=048ac413-7f17-41ea-9154-d8ff5607241e', 'greenShirt.png', '2023-08-09 09:51:40', '2023-08-09 09:51:40'),
('4b307f5a-6cd8-4b18-985a-d69e06c56c01', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0006.jpg?alt=media&token=c42a350f-0250-4be6-a7dd-7bbbae005fa3', 'IMG-20230724-WA0006.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('4e901c58-1826-48b3-9b1a-4f92eb718afb', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0040.jpg?alt=media&token=fb77c78a-2b39-4d06-b8ff-f5819e40a32d', 'IMG-20230724-WA0040.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('4ff6387d-a760-408a-86ef-88602c416dc9', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F03.png?alt=media&token=d17de246-2f2e-4d70-ad1d-dfeee221cce8', '03.png', '2023-08-09 03:38:46', '2023-08-09 03:38:46'),
('51353012-bb0e-484d-8053-ef2ac3bac202', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0015.jpg?alt=media&token=0381d14f-f6f0-437a-ae06-d880d800e101', 'IMG-20230724-WA0015.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('528b9499-1d5b-4969-8eee-89728b4ceeee', '106e8499-495d-4538-8049-233ab5eedeb3', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F0001.jpg?alt=media&token=549fa709-f17f-4bf4-a497-2ff350b42aeb', '0001.jpg', '2023-07-24 08:19:53', '2023-07-24 08:19:53'),
('52df2276-88c0-463f-ad05-25f300cca400', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F07.png?alt=media&token=c85a02cc-6dbb-4743-a993-ff7a21fc1a55', '07.png', '2023-08-09 02:10:33', '2023-08-09 02:10:33'),
('5661a136-a823-4fb7-b0db-df6280ab7cea', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FwhiteShirt.png?alt=media&token=55d28756-9afe-4c23-a625-9c66a52b48d3', 'whiteShirt.png', '2023-08-09 03:38:46', '2023-08-09 03:38:46'),
('598d5277-d4b7-4c4f-a13f-7090c2ba7dd4', '9480c313-4921-41c3-bfb1-51c53092fc47', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F06.png?alt=media&token=29f0cfad-ea1f-4063-8d4c-64346379a893', '06.png', '2023-07-24 09:01:23', '2023-07-24 09:01:23'),
('5c69ac83-85f9-4873-b10f-c2a5d16ae165', '5ba43646-0351-480a-98fb-4e9c128b1853', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F07.png?alt=media&token=6d01e9f1-f31c-4f36-b5a3-19777837c5da', '07.png', '2023-08-09 09:52:11', '2023-08-09 09:52:11'),
('631c1ed3-dbcf-46da-b1fa-04367c3135a1', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0024.jpg?alt=media&token=0bbe3163-6aff-4b78-ba51-b7d15e3fc0a6', 'IMG-20230724-WA0024.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('6392970e-c903-431f-865d-752c10b37fde', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0008.jpg?alt=media&token=3552b377-48e0-4f2f-9dc3-a54bd2ca3b74', 'IMG-20230724-WA0008.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('65929b78-d6b3-4d5d-9b02-f76c00eff48d', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0009.jpg?alt=media&token=238b5306-b95d-4e39-a90f-333b2e5547c2', 'IMG-20230723-WA0009.jpg', '2023-07-24 08:42:35', '2023-07-24 08:42:35'),
('65aceb57-e22f-4dd8-8a8e-8995035fa7a5', '106e8499-495d-4538-8049-233ab5eedeb3', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F00003.jpg?alt=media&token=ae66a0e7-12c2-4e17-a361-91893b2a2896', '00003.jpg', '2023-07-24 08:19:53', '2023-07-24 08:19:53'),
('69e999fa-ad25-415f-8c2b-f021eaaee576', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0041.jpg?alt=media&token=5c3677e5-e544-4ecf-88a7-ef22249a8e89', 'IMG-20230724-WA0041.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('6e321d38-a58c-4152-9ad0-2ac9d343cd81', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0008.jpg?alt=media&token=74384a2d-d6b0-490f-9eab-28009e14c1b6', 'IMG-20230723-WA0008.jpg', '2023-07-24 08:42:35', '2023-07-24 08:42:35'),
('6e72a1bd-6797-4cbf-8b46-ad663ee3b8d3', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0019.jpg?alt=media&token=161465da-4dcd-40cf-8074-f7869d2af93f', 'IMG-20230724-WA0019.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('721706e1-5dee-48e9-aa26-7b01ea671398', '106e8499-495d-4538-8049-233ab5eedeb3', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F00002.jpg?alt=media&token=bb794432-3f6d-4f2f-9fae-f9c6a687b8a8', '00002.jpg', '2023-07-24 08:19:53', '2023-07-24 08:19:53'),
('75b7f47d-dcc5-42d0-8041-00a42ac01aee', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0026.jpg?alt=media&token=623397d2-0166-4dd5-83dd-a97f270b6595', 'IMG-20230724-WA0026.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('77530412-dad0-4dd6-bb27-e2c2eaff93c0', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F4b4672b0-c037-4c03-aec2-2c494fecfbf3.jpeg?alt=media&token=4eb7e020-37ed-4e0c-a98e-9504f99c1b2c', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('834d2c68-3623-4436-9762-10f14bb00e29', '13b209e5-217c-4be0-b620-320d17b4d83c', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0011.jpg?alt=media&token=c22a6dc0-d8ae-4c70-bd81-633de653977f', 'IMG-20230723-WA0011.jpg', '2023-07-24 08:52:36', '2023-07-24 08:52:36'),
('8b1a83f3-3771-4b6c-86cb-53d4bfd3c2b8', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F1b90e1f8-f015-4fa1-b641-3a16c25c5479.jpeg?alt=media&token=1ebc0218-f657-49bb-8abd-c81b09a552af', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('8dba6d39-1160-46c2-8f0d-0bb6f71ef6c0', '9480c313-4921-41c3-bfb1-51c53092fc47', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FgreenShirt.png?alt=media&token=a6894399-1563-4046-80fd-849f363395bd', 'greenShirt.png', '2023-07-24 09:01:23', '2023-07-24 09:01:23'),
('8e935f5e-0d15-410d-b7a8-92bf6bfca7b2', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F01_2.jpg?alt=media&token=b9bd8b37-fe00-4663-8305-fb5b1d9fceae', '01_2.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('93a2502a-0a0a-434c-97a0-a2916fb95b8c', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F02.png?alt=media&token=bb255bea-0f15-44c5-b48d-6457f161742d', '02.png', '2023-07-24 08:59:13', '2023-07-24 08:59:13'),
('956aface-d61a-49c7-b067-353ccb2280bd', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0007.jpg?alt=media&token=1baccbdb-bdb6-4c3b-bef7-5d433b1015dc', 'IMG-20230723-WA0007.jpg', '2023-07-24 08:42:35', '2023-07-24 08:42:35'),
('9f007d62-d2c1-45ec-a3de-edc0e87eee6f', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FgreenShirt.png?alt=media&token=98b84b3f-1a57-4948-b9c9-add27e69eede', 'greenShirt.png', '2023-08-09 03:38:46', '2023-08-09 03:38:46'),
('9f0d875b-4b7a-472e-8888-ca928774f67d', 'af3ec450-2b6a-4739-80d7-e87858483432', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F001.jpg?alt=media&token=0240b7dd-eca0-419d-ae11-3ea4ee6157eb', '001.jpg', '2023-07-24 07:54:25', '2023-07-24 07:54:25'),
('9ff74298-d404-4232-ba51-34cbdaae1c0e', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0046.jpg?alt=media&token=2931cf6f-7ae6-443c-8b7d-8133226fc93e', 'IMG-20230724-WA0046.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('a2b1552f-9766-4cc4-b80d-73def115ce9a', '5ba43646-0351-480a-98fb-4e9c128b1853', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FgreenShirt.png?alt=media&token=b6ff800a-a86f-4a89-a9f8-7123c002a89d', 'greenShirt.png', '2023-08-09 09:52:11', '2023-08-09 09:52:11'),
('a3bd987e-15e6-429d-b737-7bc016d44174', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0044.jpg?alt=media&token=eca597f8-26fd-49e5-b619-e8494e54fe02', 'IMG-20230724-WA0044.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('a620b76e-d239-4c7a-ad94-17bc26f904e4', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F857f1472-cd98-4243-a514-bd4c5d81c9ba.jpeg?alt=media&token=94fb2c0b-dba2-496d-8f87-432ac8580c8e', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('a895db27-7472-4c7b-abd9-d976dfb705e0', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0023.jpg?alt=media&token=2cb0f062-0876-4a2b-a9c8-d755bfd824c4', 'IMG-20230724-WA0023.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('aa621517-036f-41fa-972b-7c97192b96eb', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0042.jpg?alt=media&token=e14526ae-5f96-4773-8dfc-9f70c101613d', 'IMG-20230724-WA0042.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('ab221154-7d7c-45b9-84d6-f87e46096d17', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F04.png?alt=media&token=18fbfb8c-035f-4929-babc-bb45cccf1696', '04.png', '2023-08-09 02:10:33', '2023-08-09 02:10:33'),
('b5036a8f-f827-4ff5-9023-04a1d812128d', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0009.jpg?alt=media&token=f937b4a9-5b5c-4c03-8f69-49aabe433a29', 'IMG-20230724-WA0009.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('b7af92d1-6479-4c62-864d-365fc9d69626', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0003.jpg?alt=media&token=c6bd5f5a-1bd5-4549-bdec-dc6b39c64282', 'IMG-20230724-WA0003.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('bb44958e-6eb4-4edd-b36d-34ba68fb70df', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F04.jpg?alt=media&token=b7b429e3-823b-4421-b9a7-9d76b66d6348', '04.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('c3154394-db74-4971-aff7-5bf788afbf26', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0018.jpg?alt=media&token=a2ba1d89-de24-4e79-8457-317043a3189b', 'IMG-20230724-WA0018.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('c33adf64-bba4-45b2-a1c5-0ec7a12f7447', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0004.jpg?alt=media&token=81380957-312f-4362-b6d0-5677be891dae', 'IMG-20230724-WA0004.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('c3a2aa29-a35e-4f17-abf8-ecfd24b3248b', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F03.jpg?alt=media&token=1bf95721-20c3-4e51-8a25-c0203b75b7e8', '03.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('ca9a34e9-5372-4df4-827f-cab311c64e53', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F90281284-599e-49ef-b2d4-258cfc00d1aa.jpeg?alt=media&token=c4bb2315-672f-4114-b657-65ccd1c5297c', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('d0b04e7e-f0e9-4943-9d2f-82c197195391', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0007.jpg?alt=media&token=a076b160-dac8-4890-b8d3-ef55d8344d83', 'IMG-20230724-WA0007.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('d1002aac-567f-4946-9253-2bb7f47cfb80', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fb8f3a9e3-ac9a-4641-a3ce-df8e289720d5.jpeg?alt=media&token=20a4af7b-d35f-4a0d-a8b0-b0236168e3bf', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('d3de980f-93a2-45ca-8e0d-dc3229c919fa', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0043.jpg?alt=media&token=6bdd39ce-39d9-4abb-ba6b-ba94f54eece8', 'IMG-20230724-WA0043.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('da4c2760-d948-4dd4-a030-111316325c5b', '5ba43646-0351-480a-98fb-4e9c128b1853', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FwhiteShirt.png?alt=media&token=b21afe3c-0e1f-4e90-9e33-4f4a9386c271', 'whiteShirt.png', '2023-08-09 09:52:11', '2023-08-09 09:52:11'),
('e537503d-74a6-4ef3-a964-cb6b80919841', '13b209e5-217c-4be0-b620-320d17b4d83c', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0012.jpg?alt=media&token=ecd7404e-8d4f-4649-918b-1008cdbf0f83', 'IMG-20230723-WA0012.jpg', '2023-07-24 08:52:36', '2023-07-24 08:52:36'),
('ed12bca8-4934-494a-80c3-69508784500f', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0005.jpg?alt=media&token=ba883e76-b9ac-4daa-bc08-8baa2b584a54', 'IMG-20230724-WA0005.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('eec3bb10-d8a7-44d8-97ff-4473e7fa3ccd', '9480c313-4921-41c3-bfb1-51c53092fc47', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FwhiteShirt.png?alt=media&token=815c7edf-c25e-41ec-89b4-d0e45c597608', 'whiteShirt.png', '2023-07-24 09:01:23', '2023-07-24 09:01:23'),
('f46e5283-95d7-4e3b-8e29-4402eff6127a', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F04.png?alt=media&token=ba77ea78-62ca-4367-b5b6-233135d1a358', '04.png', '2023-07-24 09:03:52', '2023-07-24 09:03:52'),
('fb1c0540-25bb-430e-b129-83f4fd6ddcbf', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0014.jpg?alt=media&token=e1416e92-b007-48dc-be36-79f0656bfbc8', 'IMG-20230724-WA0014.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('fe77db2c-36ab-40d0-9739-f98fab8a00e5', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F73cfe8ca-ffb1-40ba-af98-a7370c66214f.jpeg?alt=media&token=7e97ab56-c00b-457d-967f-996dbae2204d', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` varchar(255) NOT NULL,
  `receive_date` datetime DEFAULT NULL,
  `employee_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `receive_date`, `employee_id`, `total_price`, `total_quantity`, `createdAt`, `updatedAt`) VALUES
('IMPORT20230809154647', '2023-08-09 08:46:47', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 375000, 15, '2023-08-09 08:46:47', '2023-08-09 08:46:47'),
('IMPORT20230809194230', '2023-08-09 12:42:30', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 10150000, 145, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('IMPORT20230814181225', '2023-08-14 11:12:25', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 100000, 4, '2023-08-14 11:12:25', '2023-08-14 11:12:25'),
('IMPORT20230814181239', '2023-08-14 11:12:39', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 100000, 4, '2023-08-14 11:12:39', '2023-08-14 11:12:39'),
('IMPORT20230814181245', '2023-08-14 11:12:45', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 100000, 4, '2023-08-14 11:12:45', '2023-08-14 11:12:45'),
('IMPORT20230814181617', '2023-08-14 11:16:17', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 250000, 10, '2023-08-14 11:16:17', '2023-08-14 11:16:17'),
('IMPORT20230814181728', '2023-08-14 11:17:28', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 250000, 10, '2023-08-14 11:17:28', '2023-08-14 11:17:28'),
('IMPORT20230814181733', '2023-08-14 11:17:33', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 250000, 10, '2023-08-14 11:17:33', '2023-08-14 11:17:33'),
('IMPORT20230814181738', '2023-08-14 11:17:38', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 250000, 10, '2023-08-14 11:17:38', '2023-08-14 11:17:38'),
('IMPORT20230814181746', '2023-08-14 11:17:46', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 60000, 1, '2023-08-14 11:17:46', '2023-08-14 11:17:46'),
('IMPORT20230814181749', '2023-08-14 11:17:49', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 150000, 1, '2023-08-14 11:17:49', '2023-08-14 11:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `import_details`
--

CREATE TABLE `import_details` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `import_id` varchar(255) DEFAULT NULL,
  `Imp_price` int(11) DEFAULT NULL,
  `Imp_quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `import_details`
--

INSERT INTO `import_details` (`id`, `product_id`, `import_id`, `Imp_price`, `Imp_quantity`, `createdAt`, `updatedAt`) VALUES
('007a4633-e1d9-4502-8348-164bfc811f4a', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181239', 25000, 4, '2023-08-14 11:12:39', '2023-08-14 11:12:39'),
('0e461658-4d8b-4806-9530-0235edb637dc', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'IMPORT20230809194230', 45000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('1a2fdbe6-719b-4dca-b6f6-6ab5982423ff', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 'IMPORT20230809194230', 85000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('34bb6e16-5972-4502-982c-5ab5db00cf25', 'af3ec450-2b6a-4739-80d7-e87858483432', 'IMPORT20230809194230', 100000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('46a35244-fbc0-4fe3-8f80-7602128f3eec', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'IMPORT20230809194230', 25000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('549fb590-71e3-449b-9559-5a86572347ca', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'IMPORT20230809194230', 90000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('5ea4c983-33ba-46fe-9f3e-4126fe9a2bf1', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230809194230', 25000, 10, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('65885265-108d-47a5-a647-fbbdd730045c', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181733', 25000, 10, '2023-08-14 11:17:33', '2023-08-14 11:17:33'),
('83ade720-9214-43ae-9c51-37b53f19bb63', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181245', 25000, 4, '2023-08-14 11:12:45', '2023-08-14 11:12:45'),
('88735441-db36-4c92-bce8-581814bb5b13', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181225', 25000, 4, '2023-08-14 11:12:25', '2023-08-14 11:12:25'),
('98902664-0997-4318-994d-446073d4ec16', '13b209e5-217c-4be0-b620-320d17b4d83c', 'IMPORT20230814181749', 150000, 1, '2023-08-14 11:17:49', '2023-08-14 11:17:49'),
('a786c58b-ef9d-4a04-9459-7bcb66592721', '13468770-bee7-49ee-a7fb-5958bfebd932', 'IMPORT20230809194230', 60000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('b219d7ff-3aeb-437a-807c-8abdae29189b', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181738', 25000, 10, '2023-08-14 11:17:38', '2023-08-14 11:17:38'),
('b25d1d4e-3f88-4137-96bc-a29e67b7caf2', '13468770-bee7-49ee-a7fb-5958bfebd932', 'IMPORT20230814181746', 60000, 1, '2023-08-14 11:17:46', '2023-08-14 11:17:46'),
('d7a9e7d8-98f8-46e5-843d-00bee2a8d4f9', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181617', 25000, 10, '2023-08-14 11:16:17', '2023-08-14 11:16:17'),
('dabb24c6-04c6-448b-878c-7874e1f0308a', '5ba43646-0351-480a-98fb-4e9c128b1853', 'IMPORT20230814181728', 25000, 10, '2023-08-14 11:17:28', '2023-08-14 11:17:28'),
('dc320462-a2d1-4381-b485-305929a44042', '13b209e5-217c-4be0-b620-320d17b4d83c', 'IMPORT20230809194230', 150000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30'),
('ddba283b-0234-45d7-8989-0d89a2bf7cfc', '9480c313-4921-41c3-bfb1-51c53092fc47', 'IMPORT20230809194230', 35000, 15, '2023-08-09 12:42:30', '2023-08-09 12:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `express` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `customer_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `province`, `district`, `village`, `address`, `express`, `recipient`, `phone`, `customer_id`, `createdAt`, `updatedAt`) VALUES
('03029382-f7bf-4b8d-a1ff-6165cebd8425', 'dsf', 'sdfsad', 'sdfas', 'asdfasd', 'asdfasdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 16:01:35', '2023-08-08 16:01:35'),
('0be5016d-53ef-4a2e-8b03-bd3406f27887', 'sdfsadfasd', 'sdfasasdfa', 'sadfas', 'asdf', 'asdfa', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-09 02:57:10', '2023-08-09 02:57:10'),
('1b161e0c-1330-4a25-bce7-2a90671191f5', 'Bolikhamsay', 'pakkading', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 08:00:42', '2023-08-08 08:00:42'),
('3a0e99b1-3a99-4917-9073-698f4100df58', 'Bolikhamsay', 'pakkading', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 06:25:13', '2023-08-08 06:25:13'),
('4eb8cc80-d750-4633-9c06-5fc1734185c2', 'ບໍລິຄຳໄຊ', 'ປາກກະດິງ', 'ທົ່ງນາມີ', 'ອະນຸສິດ', 'ທົ່ງນາມີ', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 07:26:39', '2023-08-08 07:26:39'),
('54064dd3-c725-473d-8ae1-8ca27b8e9765', 'Bolikhamsay', 'pakadding', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-07 09:01:22', '2023-08-07 09:01:22'),
('787cfb01-b417-43d5-b94f-f9f4aef5528a', 'Bolikhamsay', 'pakkading', 'thongnay', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 07:46:24', '2023-08-08 07:46:24'),
('7dd7b821-70c1-4944-80ac-ad8cbb940a19', 'bolikhamsay', 'pakkading', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-06 06:21:24', '2023-08-06 06:21:24'),
('7f27774e-f68e-44a0-b5f3-f8feff56e75b', 'Bolikhamsay', 'pakkading', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-07 09:41:27', '2023-08-07 09:41:27'),
('9f4dc1ba-a219-42aa-a80a-ce49514a3dfe', 'Bolikhamsay', 'pakkading', 'thongnamy', 'Abnousith', 'thongmany', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-06 06:33:12', '2023-08-06 06:33:12'),
('a5fde517-6f98-4a6d-8864-e8ec29875f2d', 'Bolikhamsay', 'pakkading', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 09:16:15', '2023-08-08 09:16:15'),
('b81a21da-8527-4f9f-a0a9-3825483431f2', 'ພໄຳຫດ', 'ຫກດຫກ', 'ດຫກ', 'ຫກດັຫກດ', 'ຫກດັຫກ', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-06 12:21:31', '2023-08-06 12:21:31'),
('c772d111-8d77-4ba8-8c62-49dd8056573e', 'Bolikhamsay', 'pakading', 'thongnamy', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-07 08:42:15', '2023-08-07 08:42:15'),
('df0ad5f8-0fe0-418a-9c41-8c4c0f5398cb', 'Bolikhamsay', 'pakkading', 'thongnamay', 'Abnousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 09:10:48', '2023-08-08 09:10:48'),
('f24fa28b-dfc7-43f7-b558-439f72d786dc', 'ບໍລິຄຳໄຊ', 'ປາກກະດິງ', 'ທົ່ງນາມີ', 'ອະນຸສິດ', 'ທົ່ງນາມີ', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-08 07:32:05', '2023-08-08 07:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `employee_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `employee_id`, `order_date`, `status`, `createdAt`, `updatedAt`) VALUES
('ORDER20230809154520', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-09 08:45:20', 'completed', '2023-08-09 08:45:20', '2023-08-09 08:46:47'),
('ORDER20230809163641', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-09 09:36:41', 'completed', '2023-08-09 09:36:41', '2023-08-14 11:17:46'),
('ORDER20230809164507', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-09 09:45:07', 'completed', '2023-08-09 09:45:07', '2023-08-14 11:17:49'),
('ORDER20230809194151', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-09 12:41:51', 'completed', '2023-08-09 12:41:51', '2023-08-09 12:42:30'),
('ORDER20230814181136', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:11:36', 'completed', '2023-08-14 11:11:36', '2023-08-14 11:12:39'),
('ORDER20230814181158', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:11:58', 'completed', '2023-08-14 11:11:58', '2023-08-14 11:12:45'),
('ORDER20230814181218', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:12:18', 'completed', '2023-08-14 11:12:18', '2023-08-14 11:12:25'),
('ORDER20230814181601', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:16:01', 'completed', '2023-08-14 11:16:01', '2023-08-14 11:16:17'),
('ORDER20230814181646', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:16:46', 'completed', '2023-08-14 11:16:46', '2023-08-14 11:17:28'),
('ORDER20230814181706', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:17:06', 'completed', '2023-08-14 11:17:06', '2023-08-14 11:17:38'),
('ORDER20230814181721', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-14 11:17:21', 'completed', '2023-08-14 11:17:21', '2023-08-14 11:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `order_quantity`, `order_id`, `color`, `size`, `createdAt`, `updatedAt`) VALUES
('15d202e8-0670-42c5-a5a2-6f626b8dce2c', '5ba43646-0351-480a-98fb-4e9c128b1853', 4, 'ORDER20230814181158', 'ແດງ', 'M', '2023-08-14 11:11:59', '2023-08-14 11:11:59'),
('1c1e0394-1cbd-4e29-876e-67db635fa115', '13468770-bee7-49ee-a7fb-5958bfebd932', 15, 'ORDER20230809194151', 'ເທົາ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('3d3ce977-a662-467a-9443-7cb6825b8ba2', '06ec815e-652a-48ab-b38f-7a75243f3e86', 15, 'ORDER20230809194151', 'ດຳ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('5a2df379-d50b-43b6-9450-e6940daf5886', '13b209e5-217c-4be0-b620-320d17b4d83c', 1, 'ORDER20230809164507', 'ຂາວ', 'S', '2023-08-09 09:45:07', '2023-08-09 09:45:07'),
('5aa3588d-62a5-40e1-b9d3-71e8dfb70105', 'f595738c-28da-42c6-be3b-9989db8e17c1', 15, 'ORDER20230809194151', 'ດຳ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('66771387-90d3-4d0b-bc42-dc4a39cf558b', '9480c313-4921-41c3-bfb1-51c53092fc47', 15, 'ORDER20230809194151', 'ບົວ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('6ec92be1-4c72-43dd-9da9-37a6865aa331', '5ba43646-0351-480a-98fb-4e9c128b1853', 10, 'ORDER20230814181646', 'ຂາວ', 'L', '2023-08-14 11:16:46', '2023-08-14 11:16:46'),
('7c23b61d-7227-4c17-ad36-654ea8f2c983', '5ba43646-0351-480a-98fb-4e9c128b1853', 10, 'ORDER20230814181721', 'ສົ້ມ', 'L', '2023-08-14 11:17:21', '2023-08-14 11:17:21'),
('96291f21-4f0e-48bb-b769-21f3da1c75d7', '13b209e5-217c-4be0-b620-320d17b4d83c', 15, 'ORDER20230809194151', 'ບົວ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('a3b3c64d-2dfe-43bb-939e-e8cb32ed707a', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 15, 'ORDER20230809194151', 'ບົວ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('a88c2a09-fa63-45b6-9936-bae886e03d0f', '5ba43646-0351-480a-98fb-4e9c128b1853', 10, 'ORDER20230814181706', 'ຟ້າຂຽວ', 'L', '2023-08-14 11:17:06', '2023-08-14 11:17:06'),
('bb5e35b0-aa87-4f55-b9c6-c2096c5e0a53', '5ba43646-0351-480a-98fb-4e9c128b1853', 10, 'ORDER20230814181601', 'ດຳ', 'L', '2023-08-14 11:16:02', '2023-08-14 11:16:02'),
('c3f9a938-ef15-4dc2-aa01-5e6603bf9487', 'af3ec450-2b6a-4739-80d7-e87858483432', 15, 'ORDER20230809194151', 'ດຳ', 'M', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('e1dc3ec2-658b-4a64-b69c-cbe2a3d54cec', '5ba43646-0351-480a-98fb-4e9c128b1853', 4, 'ORDER20230814181218', 'ຟ້າ', 'S', '2023-08-14 11:12:18', '2023-08-14 11:12:18'),
('e8a1d8c2-0ca1-4e17-a0a2-3a9666b900fc', '5ba43646-0351-480a-98fb-4e9c128b1853', 4, 'ORDER20230814181136', 'ດຳ', 'S', '2023-08-14 11:11:37', '2023-08-14 11:11:37'),
('ead813e9-3c1b-4eac-a4cf-36144e884674', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 15, 'ORDER20230809194151', 'ດຳ', 'S', '2023-08-09 12:41:51', '2023-08-09 12:41:51'),
('f6040908-a6a8-4be0-8392-6766f3877144', '13468770-bee7-49ee-a7fb-5958bfebd932', 1, 'ORDER20230809163641', 'ຂຽວ', 'S', '2023-08-09 09:36:41', '2023-08-09 09:36:41'),
('f8339bd6-40d3-4972-bc1f-16dab4e9e317', '5ba43646-0351-480a-98fb-4e9c128b1853', 15, 'ORDER20230809194151', 'ຟ້າ', 'M', '2023-08-09 12:41:51', '2023-08-09 12:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `firstName`, `lastName`, `gender`, `profile`, `shopName`, `phone`, `email`, `description`, `address`, `createdAt`, `updatedAt`) VALUES
('5b32889b-755f-492e-9549-885499baebdf', 'ເຊັງວ່າງ', 'ບຼົ່ງໄມ', 'ຊາຍ', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=a0789dc9-8509-48ad-b35e-0cb3a88ab6f6', 'ຮ້ານເມໄມເຟຊັນ', '02078781525', 'sengkuevang@gmail.com', 'ເປັນຮ້ານທີຂາຍເຄື່ອງເຟຊັຮທົ່ວໄປ', 'dongdok', '2023-07-24 09:16:37', '2023-07-24 09:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `cost_price` float DEFAULT NULL,
  `Barcode` varchar(255) DEFAULT NULL,
  `supplier_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `size_id` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `sale_price`, `cost_price`, `Barcode`, `supplier_id`, `profile`, `quantity`, `size_id`, `color`, `createdAt`, `updatedAt`) VALUES
('06ec815e-652a-48ab-b38f-7a75243f3e86', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຍືດ', 'ສິນຄ້າມີຄຸນນະພາບນຳເຂົ້າຈາກປະເທດໄທ', 69000, 45000, '123121', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230724-WA0003.jpg?alt=media&token=96d018eb-ca6a-4ecb-920a-1535e30a7b54', 13, 'ມີທຸກsize', 'ມີສີຕາມທີເຫັນ', '2023-07-24 08:34:10', '2023-08-14 08:31:51'),
('106e8499-495d-4538-8049-233ab5eedeb3', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເຟຊັນ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 200000, 150000, '123496', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F00003.jpg?alt=media&token=755ad3dd-7eb2-4457-99c7-886aa0d5d36a', 10, 'freesize', 'ທຸກຂະໜາດ', '2023-07-24 08:19:48', '2023-08-09 02:36:53'),
('13468770-bee7-49ee-a7fb-5958bfebd932', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເສືອເດັກນ້ອຍ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 79000, 60000, '123459', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230724-WA0021.jpg?alt=media&token=e6834fd1-e577-46c5-ad49-54dce8e95ae3', 0, 'ມີທຸກsize', 'ມີທຸກສີຕາມທີເຫັນ', '2023-07-24 08:13:49', '2023-08-14 11:20:35'),
('13b209e5-217c-4be0-b620-320d17b4d83c', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເສືອເສືບ', 'ນຳເຂົ້າຈາກປະເທດໃທ', 250000, 150000, '32123', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230723-WA0012.jpg?alt=media&token=5b4e9443-a17d-439f-8133-2593d61b9785', 0, 'freesize', 'ດຳລາຍຟ້າ', '2023-07-24 08:52:31', '2023-08-14 11:20:35'),
('5ba43646-0351-480a-98fb-4e9c128b1853', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'shirt', 'ສິນຄ້າມີຄຸນນະພາບນຳເຂົ້າຈາກປະເທດໄທ ແລະ ເກົາຫຼີ', 35000, 25000, '123456', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FgreenShirt.png?alt=media&token=997da5a9-e0b6-498b-b60b-5bf6c8e2ab5d', 0, NULL, NULL, '2023-08-09 09:51:35', '2023-08-14 11:18:25'),
('9457e6e6-032d-4b18-a304-98d9f49c0e9d', '66fd8ab3-fa02-4399-8115-edc8a1508093', 'ເສື້ອກຳໜາວ', 'ສິນີຄ້ານຳເຂົ້າຈາກປະເທດໃທ', 250000, 85000, '325623', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F07.png?alt=media&token=bc5e598a-7e48-4b62-966e-c7048c5f1ae5', 15, 'M, L', 'ຂາວ, ນໍ້າເງິນ', '2023-07-24 09:03:46', '2023-08-09 12:42:30'),
('9480c313-4921-41c3-bfb1-51c53092fc47', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຍືດ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໃທ', 50000, 35000, '852963', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F06.png?alt=media&token=6cc5bb1e-d2f5-4afe-b125-5d3111dcbad0', 15, 'S, M', 'ຂາວ, ຂຽວ, ເເດງ', '2023-07-24 09:01:17', '2023-08-09 12:42:30'),
('af3ec450-2b6a-4739-80d7-e87858483432', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເຟຊັນ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 165000, 100000, '123459', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F004.jpg?alt=media&token=1444135d-ce11-4d5f-be1b-8ece12c26c86', 14, 'ມີsize', 'ສີຂາວຕາມເຫັນ', '2023-07-24 07:54:20', '2023-08-09 12:43:27'),
('bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຢືດ', 'ນຳເຂົ້າຈາກປະເທດໄທສິນຄ້າມີຄຸນນະພາບ', 59000, 25000, '123457', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230724-WA0043.jpg?alt=media&token=c3c3d311-c782-4615-ade0-3f7ed43da73c', 15, 'ທຸກ', 'ຫຼາຍສີຕາມທີເຫັດ', '2023-07-24 07:42:09', '2023-08-09 12:42:30'),
('d5fab737-60ae-44e1-be24-b75fba960e79', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'shirt55555555555555555', 'Description of Product 1', 29, 19, 'ABC123', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2Ftuam%20leej%20kuab.png?alt=media&token=9e1e175d-818e-4494-9b3a-312e8eca8765', 0, 'ທຸກ size', 'ຂາວ, ເຫຼືອງ, ດຳ, ເເດງ', '2023-07-24 08:29:20', '2023-07-30 06:26:55'),
('e05130d6-77e0-424c-a377-55e42c430245', '7c4b7538-897c-4b1b-8387-f257ff848cb1', 'ຊຸດນອນ', 'ສິ່ງຄ້ານຳຈາກປະເທດໄທ', 200000, 25000, '3216582', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F4b4672b0-c037-4c03-aec2-2c494fecfbf3.jpeg?alt=media&token=f7245943-fb87-4201-b49d-d38e563a8057', 9, 'S', 'ສີຂາວ', '2023-07-24 07:35:09', '2023-08-09 02:37:11'),
('f595738c-28da-42c6-be3b-9989db8e17c1', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ໄຮລາຍ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 250000, 90000, '123323', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230723-WA0007.jpg?alt=media&token=4502a259-c64e-4329-a387-6103dad5e753', 15, NULL, 'ດຳ, ແດງ', '2023-07-24 08:42:30', '2023-08-09 12:42:30'),
('ff98f549-849f-48eb-8cd9-4e8d7b9e57b6', '66fd8ab3-fa02-4399-8115-edc8a1508093', 'ຊຸດນອນ', 'ຊຸດນອນນຳເຂົ້າຈາກປະເທດໄທສິນຄ້າດີມີຄຸນນະພາບ', 135000, 60000, '123456', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2Fb8f3a9e3-ac9a-4641-a3ce-df8e289720d5.jpeg?alt=media&token=eabe9f01-2957-47ba-aff0-6f4dcd0ad743', 0, '6456', '45', '2023-07-23 06:19:45', '2023-08-09 02:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `condition`, `discount`, `createdAt`, `updatedAt`) VALUES
('375b6d74-30f8-420e-b8ea-4eccc139d0ac', 'ໂປໂມຊັນລະດູຝົນ', 'ຊື້ສິນຄ້າເຄື່ອງຫຼາຍກ່ວາ 1,000,000', 0.5, '2023-08-09 02:19:41', '2023-08-09 02:21:06'),
('b1e3e5a7-06ed-4853-b016-d035a88a61ec', 'ໂປໂມຊັນລະດູຝົນ', 'ຊື້ສິນຄ້າຫຼາຍກ່ວາ 100,000', 1, '2023-07-22 12:35:11', '2023-08-14 08:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `provinceName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `provinceName`, `createdAt`, `updatedAt`) VALUES
(1, 'ຊຽງຂວາງ', '2023-07-22 12:29:29', '2023-07-22 12:29:29'),
(25, 'ບໍ່ແກ້ວ', '2023-07-24 05:06:44', '2023-07-24 05:06:44'),
(26, 'ຄຳມ່ວນ', '2023-07-24 05:25:25', '2023-07-24 05:25:25'),
(27, 'ຈຳປາສັກ', '2023-07-24 05:28:39', '2023-07-24 05:28:39'),
(29, 'ສາລະວັນ', '2023-07-24 05:32:49', '2023-07-24 05:32:49'),
(30, 'ສະຫວັນນະເຂດ', '2023-07-24 05:39:33', '2023-07-24 05:39:33'),
(31, 'ໄຊຍະບູລີ', '2023-07-24 05:43:49', '2023-07-24 05:43:49'),
(32, 'ໄຊສົມບູນ', '2023-07-24 05:46:54', '2023-07-24 05:46:54'),
(33, 'ເຊກອງ', '2023-07-24 05:59:50', '2023-07-24 05:59:50'),
(34, 'ບໍລິຄຳໄຊ', '2023-07-24 06:56:15', '2023-07-24 06:56:15'),
(36, 'ຜົ້ງສາລີ', '2023-07-24 06:59:17', '2023-07-24 06:59:17'),
(37, 'ຫຼວງນຳ້ທາ', '2023-07-24 07:01:30', '2023-07-24 07:01:30'),
(38, 'ຫຼວງພະບາງ', '2023-07-24 07:07:13', '2023-07-24 07:07:13'),
(39, 'ວຽງຈັນ', '2023-07-24 07:09:24', '2023-07-24 07:09:24'),
(42, 'ອັດຕະປື', '2023-07-24 07:13:36', '2023-07-24 07:13:36'),
(44, 'ອຸດົມໄຊ', '2023-07-24 07:15:22', '2023-07-24 07:15:22'),
(45, 'ຫົວພັນ', '2023-07-24 07:17:41', '2023-07-24 07:17:41'),
(47, 'ນະຄອນຫຼວງວຽງຈັນ', '2023-07-24 07:20:38', '2023-07-24 07:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `promotion_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `employee_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `location_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `sale_total` float DEFAULT NULL,
  `sale_type` varchar(255) DEFAULT NULL,
  `sale_status` varchar(255) DEFAULT NULL,
  `sale_quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `promotion_id`, `employee_id`, `location_id`, `payment`, `sale_date`, `sale_total`, `sale_type`, `sale_status`, `sale_quantity`, `createdAt`, `updatedAt`) VALUES
('SELL20230809162319', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-09 09:23:19', 35000, 'pos', 'completed', 1, '2023-08-09 09:23:19', '2023-08-09 09:23:19'),
('SELL20230809164809', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-09 09:48:09', 35000, 'pos', 'completed', 1, '2023-08-09 09:48:09', '2023-08-09 09:48:09'),
('SELL20230809194327', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-09 12:43:27', 633000, 'pos', 'completed', 6, '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('SELL20230814153151', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-14 08:31:51', 69000, 'pos', 'completed', 1, '2023-08-14 08:31:51', '2023-08-14 08:31:51'),
('SELL20230814181310', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-14 11:13:10', 420000, 'pos', 'completed', 12, '2023-08-14 11:13:10', '2023-08-14 11:13:10'),
('SELL20230814181455', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-14 11:14:55', 315000, 'pos', 'completed', 9, '2023-08-14 11:14:55', '2023-08-14 11:14:55'),
('SELL20230814181825', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-14 11:18:25', 1400000, 'pos', 'completed', 40, '2023-08-14 11:18:25', '2023-08-14 11:18:25'),
('SELL20230814182035', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-14 11:20:35', 4935000, 'pos', 'completed', 30, '2023-08-14 11:20:35', '2023-08-14 11:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sale_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `color_size_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `color_size_id`, `product_id`, `sale_price`, `quantity`, `color`, `size`, `createdAt`, `updatedAt`) VALUES
('002c2b61-af30-4d27-acd0-69f999052f11', 'SELL20230814181310', 'd5813cbf-08d4-4e68-80db-e547e99b8bec', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 1, 'ຟ້າ', 'S', '2023-08-14 11:13:10', '2023-08-14 11:13:10'),
('148efffd-7bd3-41f3-95aa-fa00d579d5cc', 'SELL20230809194327', '5fd13527-0055-48d2-8776-965903906376', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 1, 'ຟ້າ', 'M', '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('2c689eaf-f92e-4ca4-81ec-d954c64580cb', 'SELL20230809194327', '99491604-c5ad-40e3-8da5-5d0f4154a2cd', '13b209e5-217c-4be0-b620-320d17b4d83c', 250000, 1, 'ບົວ', 'S', '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('37416f69-febc-4af7-bb97-7a74100ce78a', 'SELL20230814181310', '34ed7be5-0fbb-441b-a40c-47334267430e', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 1, 'ດຳ', 'S', '2023-08-14 11:13:10', '2023-08-14 11:13:10'),
('414bb895-0aaf-4694-8e6a-e0c327826b53', 'SELL20230814181825', '05a28d73-6e91-4cde-8a8e-d8dbe2a069bd', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 10, 'ດຳ', 'L', '2023-08-14 11:18:25', '2023-08-14 11:18:25'),
('4b18956d-1eab-4c15-92c8-5dc7608f26e0', 'SELL20230814182035', '6a11e5fb-389f-4c49-afe6-fef73cc8a547', '13b209e5-217c-4be0-b620-320d17b4d83c', 250000, 1, 'ຂາວ', 'S', '2023-08-14 11:20:35', '2023-08-14 11:20:35'),
('53d61b67-1089-482f-af06-97a58ecd4ebe', 'SELL20230814181455', 'd5813cbf-08d4-4e68-80db-e547e99b8bec', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 3, 'ຟ້າ', 'S', '2023-08-14 11:14:55', '2023-08-14 11:14:55'),
('5d8de4e7-13c7-40fa-8d84-a5671ceabb4f', 'SELL20230814181310', '5fd13527-0055-48d2-8776-965903906376', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 9, 'ຟ້າ', 'M', '2023-08-14 11:13:10', '2023-08-14 11:13:10'),
('695b3162-f981-4d11-add0-863b03b7f937', 'SELL20230814182035', '9a45b6d0-6aa9-4960-bad3-07c9552470b6', '13468770-bee7-49ee-a7fb-5958bfebd932', 79000, 1, 'ຂຽວ', 'S', '2023-08-14 11:20:35', '2023-08-14 11:20:35'),
('6981c03f-508d-42c9-8a31-9698d645742d', 'SELL20230814181310', '7cba21ea-b719-4c85-b372-9f9dbcd1408a', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 1, 'ແດງ', 'M', '2023-08-14 11:13:10', '2023-08-14 11:13:10'),
('6a21cd67-dc87-4dc2-afff-b5f04fa7ca96', 'SELL20230809194327', 'dd943298-c818-43c4-9463-eb5ff3bd0366', NULL, 35000, 1, 'ຂຽວ', 'S', '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('776b44f4-3b18-4871-a914-45798c960cff', 'SELL20230809162319', 'dd943298-c818-43c4-9463-eb5ff3bd0366', NULL, 35000, 1, 'ຂຽວ', 'S', '2023-08-09 09:23:19', '2023-08-09 09:23:19'),
('88bb1c5b-7571-46a6-bda5-69cd8f0d8d5c', 'SELL20230809164809', 'dd943298-c818-43c4-9463-eb5ff3bd0366', NULL, 35000, 1, 'ຂຽວ', 'S', '2023-08-09 09:48:09', '2023-08-09 09:48:09'),
('aa885fec-2f3e-458e-82f6-a15d02ca53f2', 'SELL20230809194327', '861a5c18-d5e1-4fff-9332-3746923d2adf', '13468770-bee7-49ee-a7fb-5958bfebd932', 79000, 1, 'ເທົາ', 'S', '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('ac1d9aa8-74c9-4907-aa33-200c1169a822', 'SELL20230814181825', '9a925791-5efe-4991-a95b-af698929d228', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 10, 'ຟ້າຂຽວ', 'L', '2023-08-14 11:18:25', '2023-08-14 11:18:25'),
('b6d416b5-4936-43de-b237-9c8daafe8e8e', 'SELL20230814181455', '34ed7be5-0fbb-441b-a40c-47334267430e', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 3, 'ດຳ', 'S', '2023-08-14 11:14:55', '2023-08-14 11:14:55'),
('b999d64d-51d1-4eac-afd3-e14e39d50cc5', 'SELL20230814181455', '7cba21ea-b719-4c85-b372-9f9dbcd1408a', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 3, 'ແດງ', 'M', '2023-08-14 11:14:55', '2023-08-14 11:14:55'),
('c1e967bd-602f-4cdd-96e3-01d01339e833', 'SELL20230809194327', '43645fc8-e5ae-4c97-a30d-92fe716f6e53', 'af3ec450-2b6a-4739-80d7-e87858483432', 165000, 1, 'ດຳ', 'M', '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('e1b27d6c-d682-49aa-b0bd-994905c2be44', 'SELL20230809194327', 'ca6a4ff6-7f14-4de1-86b0-8bded92cb2a5', '06ec815e-652a-48ab-b38f-7a75243f3e86', 69000, 1, 'ດຳ', 'S', '2023-08-09 12:43:27', '2023-08-09 12:43:27'),
('eb3d35f2-44ce-4ca3-9f1c-819aa001730b', 'SELL20230814153151', 'ca6a4ff6-7f14-4de1-86b0-8bded92cb2a5', '06ec815e-652a-48ab-b38f-7a75243f3e86', 69000, 1, 'ດຳ', 'S', '2023-08-14 08:31:51', '2023-08-14 08:31:51'),
('f1d308b4-fd36-4d69-9b94-9f69f61d2df2', 'SELL20230814181825', '7053100c-223a-4ae7-a21b-b885a6990ef8', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 10, 'ຂາວ', 'L', '2023-08-14 11:18:25', '2023-08-14 11:18:25'),
('f4bcd341-9328-434c-8ac3-b9aa32b834ca', 'SELL20230814182035', '861a5c18-d5e1-4fff-9332-3746923d2adf', '13468770-bee7-49ee-a7fb-5958bfebd932', 79000, 14, 'ເທົາ', 'S', '2023-08-14 11:20:35', '2023-08-14 11:20:35'),
('f5dd2319-d4a8-4c2b-8c47-59cdc9212eed', 'SELL20230814181825', 'c9a9b2ab-c001-430e-8ca5-44b8b992ed45', '5ba43646-0351-480a-98fb-4e9c128b1853', 35000, 10, 'ສົ້ມ', 'L', '2023-08-14 11:18:25', '2023-08-14 11:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `profile`, `name`, `phone`, `provinceId`, `districtId`, `village`, `address`, `description`, `createdAt`, `updatedAt`) VALUES
('8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F02.jpg?alt=media&token=149d1952-6c4f-4093-87a9-ec6ed5ad57d4', 'ຕົ່ງ', '02078381398', 1, 1, 'ຄຳເເຂດ', 'ຕິດທະໜົນ', NULL, '2023-07-24 04:40:06', '2023-07-25 22:59:18'),
('a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.jpg?alt=media&token=b19b16f3-1dac-43b3-9090-cb7e9f1e18cd', 'ຮົ້ວຢ່າງ', '02092342342', 1, 1, 'ໜອງວຽງຄຳ', '', '', '2023-07-22 12:37:32', '2023-07-25 22:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `employee_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `owner_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `owner_id`, `phone`, `password`, `status`, `createdAt`, `updatedAt`) VALUES
('06e69d8e-fb56-40ce-b1ad-3340a5bc3132', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, '02078781525', '$2b$05$kyHVboaHKSBFLFfdsMhbAOQ7dltgTZs2flItmUeb5ec0LjCih8EL6', 'admin', '2023-07-22 12:30:54', '2023-07-22 12:30:54'),
('f97ae6b5-40de-4364-b8df-9b17447a040d', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, '02055054511', '$2b$05$jMQjioymPeeXZuTTpVjkH.O9YYUqqmWhrljOsyaGCBdJxInx64YI.', 'user', '2023-07-22 12:31:23', '2023-07-22 12:31:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_sizes`
--
ALTER TABLE `color_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provinceId` (`provinceId`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provinceId` (`provinceId`),
  ADD KEY `districtId` (`districtId`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `import_details`
--
ALTER TABLE `import_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `import_id` (`import_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `promotion_id` (`promotion_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provinceId` (`provinceId`),
  ADD KEY `districtId` (`districtId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`districtId`) REFERENCES `districts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `import_details`
--
ALTER TABLE `import_details`
  ADD CONSTRAINT `import_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `import_details_ibfk_2` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`c_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`c_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`districtId`) REFERENCES `districts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
