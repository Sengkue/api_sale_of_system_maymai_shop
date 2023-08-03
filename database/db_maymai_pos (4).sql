-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 01:27 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

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
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `ownerId`, `url`, `createdAt`, `updatedAt`) VALUES
(1, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp03.jpg?alt=media&token=cdb5b04a-977f-4464-b99d-7efe64368e6f', '2023-07-23 06:50:26', '2023-07-23 06:50:26'),
(2, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp01.jpg?alt=media&token=f6656b36-c723-4795-9f46-848e415578c5', '2023-07-23 06:50:26', '2023-07-23 06:50:26'),
(3, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp02.jpg?alt=media&token=e0f28ddd-abce-4293-a7b8-574ed7214d53', '2023-07-23 06:50:26', '2023-07-23 06:50:26'),
(4, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp05.jpg?alt=media&token=a1708af7-6fc5-445b-8886-da5375efb413', '2023-07-23 06:50:26', '2023-07-23 06:50:26'),
(5, NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fp04.jpg?alt=media&token=6340dd03-4899-4c9c-b6e3-547857d4fb94', '2023-07-23 06:50:26', '2023-07-23 06:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
('0b23272e-4f37-4a1e-a539-4b0d795595db', '106e8499-495d-4538-8049-233ab5eedeb3', 'ແດງ', 'S', 5, 90000, 165000, '2023-08-02 15:45:27', '2023-08-02 15:45:27'),
('594d1521-05ea-473b-863d-b502ffa6cd1c', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 'ບົວ', 'M', 5, 15000, 45000, '2023-08-01 22:36:28', '2023-08-01 22:36:28'),
('6f45025a-c27b-4801-872a-329fe0b9053a', '106e8499-495d-4538-8049-233ab5eedeb3', 'ຂາວ', 'S', 6, 90000, 165000, '2023-08-01 14:45:08', '2023-08-01 14:45:08'),
('fcf87d87-2e3e-40c4-b14c-0c1c55a928ee', '106e8499-495d-4538-8049-233ab5eedeb3', 'ສົ້ມ', 'S', 1, 90000, 165000, '2023-08-02 15:45:32', '2023-08-02 15:45:32'),
('fe673641-2f6b-48dc-be4c-a76f0051bf8f', '13468770-bee7-49ee-a7fb-5958bfebd932', 'ເທົາ', 'S', 5, 65000, 79000, '2023-08-02 15:45:27', '2023-08-02 15:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `c_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_fname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_lname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`c_id`, `c_profile`, `c_fname`, `c_lname`, `c_gender`, `c_phone`, `c_password`, `createdAt`, `updatedAt`) VALUES
('0c968987-2ca6-40c0-a6d2-244413740ce3', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F2.png?alt=media&token=6e1424b5-9059-46ca-9ad7-99fbfa6191bb', 'touyang', 'thortou', 'ຊາຍ', '02078955536', '$2b$05$Q.9e3zNEDCN29jECBSRra.MNVP.3HGg8J2uA8ulmiZdA9ZZYuUZcq', '2023-08-01 13:13:40', '2023-08-01 13:13:40'),
('26c7d125-d636-4716-b5e3-aa694fb82112', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome_3.jpg?alt=media&token=2c037669-eaa2-420a-a8dc-8e77962b61ab', 'afsd', 'sdfs', 'ຊາຍ', '02056565656', '$2b$05$x6uxPrs8u0quUITeWMlhLO4/Sk4SPbPDOAqZhNQIx4jCuhRrlDSVe', '2023-07-29 10:58:39', '2023-07-29 10:58:39'),
('444b636a-6360-4ab3-82a9-7c621d994720', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F(2)%20WhatsApp%20-%20Google%20Chrome_2.jpg?alt=media&token=44d74ea6-29c8-4a7a-bacc-11a87091dcd7', 'ບີ', 'ວ່າງ', 'ຍິງ', '0203333333', '$2b$05$F1UyM2Jj6TUoBtjcFxlSRuOcJRG2wyw2um7K8UQwFAxJq4ioc4fhW', '2023-07-25 07:25:54', '2023-07-25 23:01:06'),
('68292fce-c47f-4049-8cf9-63c4b1e4df25', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FWhatsApp%20-%20Google%20Chrome.jpg?alt=media&token=5ded7c46-a8aa-4757-bf7d-5978decbe0c9', 'sdfs', 'sdf', 'ຊາຍ', '020555522211', '$2b$05$8MVYxZPDRjbee1r2rCXONOkBV6nfMH.N6lxhEMyjwNv1ZAX0NOmAC', '2023-07-30 01:38:32', '2023-07-30 01:38:32'),
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
  `districtName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `productId`, `url`, `altText`, `createdAt`, `updatedAt`) VALUES
('01685da5-4277-4f20-b9d8-0fd0f2d1ca82', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0025.jpg?alt=media&token=e6b3a914-30b9-4609-abf6-9b0eb3f799cf', 'IMG-20230724-WA0025.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('04892472-709f-4444-aba8-8af9d069965d', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F05.png?alt=media&token=4b5551b6-07bb-41f8-b4ab-c8670283a10b', '05.png', '2023-07-24 08:59:13', '2023-07-24 08:59:13'),
('0815334c-bc8d-419f-a644-b4f5a0fb48e1', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F02_2.jpg?alt=media&token=5cd7d0bd-7924-44a2-8a5d-1b1e69b43ea0', '02_2.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('1349dc82-3e35-49b5-99bf-6fbd53ddcc6c', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0045.jpg?alt=media&token=2a0f0445-8953-4817-883a-c7213d8a1d77', 'IMG-20230724-WA0045.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('1a681ce6-9aed-4ca0-8be2-23c6d70ed3dd', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0022.jpg?alt=media&token=97aad804-47bf-45bf-aa4d-71c71703f48f', 'IMG-20230724-WA0022.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('1b51e335-b1e4-4096-9641-3184331c165e', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0028.jpg?alt=media&token=b9b421f4-6af9-4b65-9923-7589db4c6dd5', 'IMG-20230724-WA0028.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('2bc6bf8f-4713-4e77-abf8-8bdeee3ad3be', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0020.jpg?alt=media&token=a021f149-048a-4505-b694-9027468d1605', 'IMG-20230724-WA0020.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('2dc3b626-6eb1-4fe8-9222-ddabe17c111d', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0010.jpg?alt=media&token=020c2c92-cdd0-4824-aebd-e530bd699d74', 'IMG-20230723-WA0010.jpg', '2023-07-24 08:42:35', '2023-07-24 08:42:35'),
('2fc67d09-3972-489d-ab75-89737b8599fd', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F669e73c9-801a-4f1b-8150-a0ee09a6f71c.jpeg?alt=media&token=5070d026-81bb-4173-a9e5-d1c1d2f3a769', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('351c52e5-5de1-4675-8d57-ef450d9c4b2b', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0010.jpg?alt=media&token=33fb1adc-a613-49ca-9b87-aa4265fce4af', 'IMG-20230724-WA0010.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('394ada31-f5eb-4151-859c-0c5a3ca1ba93', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F07.png?alt=media&token=e1d4e449-d2cd-4ac4-be4d-48d24100e7aa', '07.png', '2023-07-24 09:03:52', '2023-07-24 09:03:52'),
('3d989063-8478-4e3b-8543-7a8e98ef41e9', 'af3ec450-2b6a-4739-80d7-e87858483432', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F004.jpg?alt=media&token=ad290234-19c3-4a10-a70b-41cabddc5426', '004.jpg', '2023-07-24 07:54:25', '2023-07-24 07:54:25'),
('3ef68b0c-8df7-4ad2-bd28-eba2a71f6085', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0039.jpg?alt=media&token=5da48e23-31af-4241-b1f4-914f9fa025ab', 'IMG-20230724-WA0039.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('46552527-ec49-493e-92b5-45b3d7af2cdf', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0021.jpg?alt=media&token=4a6961af-ac82-44b9-ac2f-e0eed3f54599', 'IMG-20230724-WA0021.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('473a6827-e5e4-4e6f-af60-254cf5ffd096', 'af3ec450-2b6a-4739-80d7-e87858483432', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F002.jpg?alt=media&token=4f88c34a-494e-4f9f-8621-2fc089ef2250', '002.jpg', '2023-07-24 07:54:25', '2023-07-24 07:54:25'),
('4b307f5a-6cd8-4b18-985a-d69e06c56c01', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0006.jpg?alt=media&token=c42a350f-0250-4be6-a7dd-7bbbae005fa3', 'IMG-20230724-WA0006.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('4e901c58-1826-48b3-9b1a-4f92eb718afb', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0040.jpg?alt=media&token=fb77c78a-2b39-4d06-b8ff-f5819e40a32d', 'IMG-20230724-WA0040.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('51353012-bb0e-484d-8053-ef2ac3bac202', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0015.jpg?alt=media&token=0381d14f-f6f0-437a-ae06-d880d800e101', 'IMG-20230724-WA0015.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('528b9499-1d5b-4969-8eee-89728b4ceeee', '106e8499-495d-4538-8049-233ab5eedeb3', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F0001.jpg?alt=media&token=549fa709-f17f-4bf4-a497-2ff350b42aeb', '0001.jpg', '2023-07-24 08:19:53', '2023-07-24 08:19:53'),
('598d5277-d4b7-4c4f-a13f-7090c2ba7dd4', '9480c313-4921-41c3-bfb1-51c53092fc47', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F06.png?alt=media&token=29f0cfad-ea1f-4063-8d4c-64346379a893', '06.png', '2023-07-24 09:01:23', '2023-07-24 09:01:23'),
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
('8e935f5e-0d15-410d-b7a8-92bf6bfca7b2', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F01_2.jpg?alt=media&token=b9bd8b37-fe00-4663-8305-fb5b1d9fceae', '01_2.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('93a2502a-0a0a-434c-97a0-a2916fb95b8c', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F02.png?alt=media&token=bb255bea-0f15-44c5-b48d-6457f161742d', '02.png', '2023-07-24 08:59:13', '2023-07-24 08:59:13'),
('956aface-d61a-49c7-b067-353ccb2280bd', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230723-WA0007.jpg?alt=media&token=1baccbdb-bdb6-4c3b-bef7-5d433b1015dc', 'IMG-20230723-WA0007.jpg', '2023-07-24 08:42:35', '2023-07-24 08:42:35'),
('9f0d875b-4b7a-472e-8888-ca928774f67d', 'af3ec450-2b6a-4739-80d7-e87858483432', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F001.jpg?alt=media&token=0240b7dd-eca0-419d-ae11-3ea4ee6157eb', '001.jpg', '2023-07-24 07:54:25', '2023-07-24 07:54:25'),
('9ff74298-d404-4232-ba51-34cbdaae1c0e', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0046.jpg?alt=media&token=2931cf6f-7ae6-443c-8b7d-8133226fc93e', 'IMG-20230724-WA0046.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('a3bd987e-15e6-429d-b737-7bc016d44174', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0044.jpg?alt=media&token=eca597f8-26fd-49e5-b619-e8494e54fe02', 'IMG-20230724-WA0044.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('a620b76e-d239-4c7a-ad94-17bc26f904e4', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F857f1472-cd98-4243-a514-bd4c5d81c9ba.jpeg?alt=media&token=94fb2c0b-dba2-496d-8f87-432ac8580c8e', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('a895db27-7472-4c7b-abd9-d976dfb705e0', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0023.jpg?alt=media&token=2cb0f062-0876-4a2b-a9c8-d755bfd824c4', 'IMG-20230724-WA0023.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('aa621517-036f-41fa-972b-7c97192b96eb', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0042.jpg?alt=media&token=e14526ae-5f96-4773-8dfc-9f70c101613d', 'IMG-20230724-WA0042.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
('b5036a8f-f827-4ff5-9023-04a1d812128d', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0009.jpg?alt=media&token=f937b4a9-5b5c-4c03-8f69-49aabe433a29', 'IMG-20230724-WA0009.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('b7af92d1-6479-4c62-864d-365fc9d69626', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0003.jpg?alt=media&token=c6bd5f5a-1bd5-4549-bdec-dc6b39c64282', 'IMG-20230724-WA0003.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('bb44958e-6eb4-4edd-b36d-34ba68fb70df', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F04.jpg?alt=media&token=b7b429e3-823b-4421-b9a7-9d76b66d6348', '04.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('c3154394-db74-4971-aff7-5bf788afbf26', '13468770-bee7-49ee-a7fb-5958bfebd932', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0018.jpg?alt=media&token=a2ba1d89-de24-4e79-8457-317043a3189b', 'IMG-20230724-WA0018.jpg', '2023-07-24 08:13:53', '2023-07-24 08:13:53'),
('c33adf64-bba4-45b2-a1c5-0ec7a12f7447', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0004.jpg?alt=media&token=81380957-312f-4362-b6d0-5677be891dae', 'IMG-20230724-WA0004.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('c3a2aa29-a35e-4f17-abf8-ecfd24b3248b', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F03.jpg?alt=media&token=1bf95721-20c3-4e51-8a25-c0203b75b7e8', '03.jpg', '2023-07-24 07:50:00', '2023-07-24 07:50:00'),
('ca9a34e9-5372-4df4-827f-cab311c64e53', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2F90281284-599e-49ef-b2d4-258cfc00d1aa.jpeg?alt=media&token=c4bb2315-672f-4114-b657-65ccd1c5297c', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('d0b04e7e-f0e9-4943-9d2f-82c197195391', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0007.jpg?alt=media&token=a076b160-dac8-4890-b8d3-ef55d8344d83', 'IMG-20230724-WA0007.jpg', '2023-07-24 08:34:16', '2023-07-24 08:34:16'),
('d1002aac-567f-4946-9253-2bb7f47cfb80', 'e05130d6-77e0-424c-a377-55e42c430245', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2Fb8f3a9e3-ac9a-4641-a3ce-df8e289720d5.jpeg?alt=media&token=20a4af7b-d35f-4a0d-a8b0-b0236168e3bf', '555', '2023-07-24 07:36:00', '2023-07-24 07:36:00'),
('d3de980f-93a2-45ca-8e0d-dc3229c919fa', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Multiple_images%2FIMG-20230724-WA0043.jpg?alt=media&token=6bdd39ce-39d9-4abb-ba6b-ba94f54eece8', 'IMG-20230724-WA0043.jpg', '2023-07-24 07:42:15', '2023-07-24 07:42:15'),
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
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
('IMPORT20230802053624', '2023-08-01 22:36:24', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 425000, 10, '2023-08-01 22:36:24', '2023-08-01 22:36:24'),
('IMPORT20230802053631', '2023-08-01 22:36:31', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 425000, 10, '2023-08-01 22:36:31', '2023-08-01 22:36:31'),
('IMPORT20230802054334', '2023-08-01 22:43:34', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 1150000, 10, '2023-08-01 22:43:34', '2023-08-01 22:43:34'),
('IMPORT20230802054337', '2023-08-01 22:43:37', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 1150000, 10, '2023-08-01 22:43:37', '2023-08-01 22:43:37'),
('IMPORT20230802054342', '2023-08-01 22:43:42', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 1150000, 10, '2023-08-01 22:43:42', '2023-08-01 22:43:42'),
('IMPORT20230802224523', '2023-08-02 15:45:23', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 1025000, 15, '2023-08-02 15:45:23', '2023-08-02 15:45:23'),
('IMPORT20230802224531', '2023-08-02 15:45:31', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', 140000, 2, '2023-08-02 15:45:31', '2023-08-02 15:45:31');

-- --------------------------------------------------------

--
-- Table structure for table `import_details`
--

CREATE TABLE `import_details` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `import_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Imp_price` int(11) DEFAULT NULL,
  `Imp_quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `import_details`
--

INSERT INTO `import_details` (`id`, `product_id`, `import_id`, `Imp_price`, `Imp_quantity`, `createdAt`, `updatedAt`) VALUES
('1b08ac54-7a4a-4635-92ab-2eefbee5cd8c', 'e05130d6-77e0-424c-a377-55e42c430245', 'IMPORT20230802054342', 150000, 5, '2023-08-01 22:43:42', '2023-08-01 22:43:42'),
('1c45394b-d787-4e6d-a8c8-dd2932ba419f', 'e05130d6-77e0-424c-a377-55e42c430245', 'IMPORT20230802054337', 150000, 5, '2023-08-01 22:43:38', '2023-08-01 22:43:38'),
('299d4ca9-fa6d-4c84-97e3-74022966f089', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 'IMPORT20230802053631', 15000, 5, '2023-08-01 22:36:31', '2023-08-01 22:36:31'),
('339c23ef-d5c7-4343-ab80-27dd0e0c97cb', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'IMPORT20230802054334', 80000, 5, '2023-08-01 22:43:34', '2023-08-01 22:43:34'),
('3c6135f7-1cab-46be-8d6a-c1e47b2f240b', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'IMPORT20230802224523', 50000, 5, '2023-08-02 15:45:27', '2023-08-02 15:45:27'),
('48efd416-e999-4645-bbdb-69a505986d82', '106e8499-495d-4538-8049-233ab5eedeb3', 'IMPORT20230802224523', 90000, 5, '2023-08-02 15:45:27', '2023-08-02 15:45:27'),
('49642b6a-a73e-4169-aa22-e313b14085a8', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 'IMPORT20230802053624', 15000, 5, '2023-08-01 22:36:28', '2023-08-01 22:36:28'),
('58421f4b-9bea-415a-be02-6dac71cea216', '106e8499-495d-4538-8049-233ab5eedeb3', 'IMPORT20230802224531', 90000, 1, '2023-08-02 15:45:32', '2023-08-02 15:45:32'),
('688888c5-defb-48a4-870a-5a11855134dc', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'IMPORT20230802054337', 80000, 5, '2023-08-01 22:43:38', '2023-08-01 22:43:38'),
('70e9fc9b-56d5-4b9a-bb6b-8f9271c5d375', '06ec815e-652a-48ab-b38f-7a75243f3e86', 'IMPORT20230802224531', 50000, 1, '2023-08-02 15:45:32', '2023-08-02 15:45:32'),
('80005635-5377-4104-8471-4de1638cce80', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'IMPORT20230802053631', 70000, 5, '2023-08-01 22:36:31', '2023-08-01 22:36:31'),
('df849b1c-b002-427c-9908-f31b43d0fa55', '13468770-bee7-49ee-a7fb-5958bfebd932', 'IMPORT20230802224523', 65000, 5, '2023-08-02 15:45:27', '2023-08-02 15:45:27'),
('df8c00d1-03aa-4a2b-8b5a-c1679d05fc58', 'e05130d6-77e0-424c-a377-55e42c430245', 'IMPORT20230802054334', 150000, 5, '2023-08-01 22:43:34', '2023-08-01 22:43:34'),
('dfaba4c5-6b59-485b-8a0c-2d1ef093336d', 'f595738c-28da-42c6-be3b-9989db8e17c1', 'IMPORT20230802054342', 80000, 5, '2023-08-01 22:43:42', '2023-08-01 22:43:42'),
('fd230ea0-834b-4d09-8356-1d5b9e9cb5de', '246619ee-7287-4cd1-a3ec-13c3c7498512', 'IMPORT20230802053624', 70000, 5, '2023-08-01 22:36:28', '2023-08-01 22:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `express` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `customer_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `province`, `district`, `village`, `address`, `express`, `recipient`, `phone`, `customer_id`, `createdAt`, `updatedAt`) VALUES
('02868fc3-664d-435c-ab15-e71292ac639f', 'sdfas', 'sdfsadff', 'sdfasd', 'sadfasds', 'dfasdf', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-23 12:47:32', '2023-07-23 12:47:32'),
('0a47cdd7-6533-4177-a405-749026e37ec3', 'ddddddddd', 'dddddddd', 'ddddddddddd', 'dddddddddddddd', 'dddddddddddddd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:32:21', '2023-07-31 00:32:21'),
('0e8ad452-4114-48e7-ab35-585f90105ef5', 'fgsfh', 'ghdfghdfgsdf', 'gsdfgsdfgsd', 'fgsdfgsd', 'fgsdfgsd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-01 22:30:00', '2023-08-01 22:30:00'),
('12415dd2-49e0-4445-b99c-399e23783089', 'GFFG', 'SXS', 'WSW', 'WSW', 'WSW', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-28 07:49:03', '2023-07-28 07:49:03'),
('18bed6b0-2822-4130-a495-2fca4642983f', 'sfsdf', 'sdfsdfs', 'sdfsdf', 'sdfsadf', 'asdfasdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 15:24:50', '2023-07-30 15:24:50'),
('23380670-bab6-40f5-a811-bd2b9a741b9e', 'se', 'se', 'se', 'se', 'se', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-02 15:11:28', '2023-08-02 15:11:28'),
('28608a24-9a5b-4f3d-bdbf-6000ea47a0a3', 'tret', 'fef', 'frf', 'fr', 'dfref', 'touyang', 2078955536, '0c968987-2ca6-40c0-a6d2-244413740ce3', '2023-08-01 13:27:24', '2023-08-01 13:27:24'),
('38aa178a-956d-450b-8a12-8f8b50cb436c', 'ຫຳ', 'ຫກດັຫ', 'ຫກດັຫກ', 'ັຫກດ', 'ັຫກດັຫ', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 13:12:14', '2023-07-30 13:12:14'),
('3b9fddea-5d3b-4175-8ef1-e617f244179d', 'dfasd', 'fasdfas', 'dfasd', 'sdfasdf', 'asdfasdfas', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-01 22:45:06', '2023-08-01 22:45:06'),
('3dfe4bda-e53d-4b2e-802e-253867409013', 'sfdf', 'sdfasd', 'fasdf', 'asdfadf', 'asdfasdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:15:31', '2023-07-31 00:15:31'),
('46ea93e6-b53f-49c2-b36d-e21c18f66841', 'SDS', 'SDFA', 'SDF', 'SDFS', 'SDFAS', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 13:30:17', '2023-07-30 13:30:17'),
('4990a011-00e7-4b59-8292-5a38f02430d0', 'gfg', 'df', 'dfg', 'dsfgdsf', 'sfdgsdf', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-23 06:20:47', '2023-07-23 06:20:47'),
('4de2a6df-75e8-4895-b43d-0a76f4903830', 'bolikhamsay', 'pakading', 'thongnamy', 'abnousee', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-28 07:25:30', '2023-07-28 07:25:30'),
('54aa561f-a9e7-4da7-a676-58021fc25a03', 'afd', 'fasdfsd', 'fsdfsdf', 'sdfsdfs', 'dfsadsdfasd', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-25 07:10:22', '2023-07-25 07:10:22'),
('58dbb8ed-2323-4895-9cd6-1ff1f90761a2', 'rtre', 'frt4', 'ferf', 'sdde', 'er', 'touyang', 2078955536, '0c968987-2ca6-40c0-a6d2-244413740ce3', '2023-08-01 13:17:08', '2023-08-01 13:17:08'),
('65d521db-8052-45d5-921e-d2957b2082be', 'sdfas', 'sdfas', 'asdfasd', 'sssadfad', 'asdfas', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 13:48:44', '2023-07-30 13:48:44'),
('73aa4c7d-c011-4a03-8263-f039335bb7cd', 'asdfsds', 'dfasdf', 'sadfasd', 'sdfasd', 'sdfasdfasd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:08:10', '2023-07-31 00:08:10'),
('77f0cda8-8dca-4a80-82ba-2ed095d1a4dd', 'asdfsad', 'asdfasdfasdf', 'asdf', 'asdfsadfa', 'sdfasdf', 'touyang', 2078955536, '0c968987-2ca6-40c0-a6d2-244413740ce3', '2023-08-01 14:47:52', '2023-08-01 14:47:52'),
('79f10e1c-91be-4547-b07d-46484acb1d5d', 'efasdf', 'sdfsd', 'sdfasdfa', 'sdfasdf', 'asdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 05:22:20', '2023-07-31 05:22:20'),
('7ca7bc61-4977-4adb-aea4-d000b8f5c4ca', 'asdfasd', 'fasdfasdf', 'asdfasdf', 'sadfasdf', 'asdfasdfs', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-01 22:53:26', '2023-08-01 22:53:26'),
('7e009681-5330-44b1-8b8e-842c8513341b', 'bolikhamsay', 'pakkading', 'thongnamy', 'abnusi', 'thongnamy', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-25 22:49:30', '2023-07-25 22:49:30'),
('82cbfac6-d253-4a49-84dc-5cc6a203c485', 'ADFGSDFGD', 'FGDFGDFG', 'SDFGSDFGSD', 'FGSDFGF', 'DFGSDFGSDFG', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-24 09:58:30', '2023-07-24 09:58:30'),
('83104052-20b9-46d9-84aa-2aced95dbedd', 'fsdf', 'asdfasdf', 'asdfas', 'asdfasf', 'asdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 01:03:59', '2023-07-31 01:03:59'),
('854a2efe-a4ac-4a4e-b7bd-1da600345567', 'ffff', 'ddddddddddddddd', 'ddd', 'ddddddddddd', 'ddddddddddddddddddddd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:17:56', '2023-07-31 00:17:56'),
('89e2234d-60db-4466-959b-154045b29c1e', 'tt', 'fdgfg', 'dssd', 'sdvd', 'zxc', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-28 07:53:16', '2023-07-28 07:53:16'),
('8eeb5d58-26db-4942-8361-1f4611b858dd', 'DsaSD', 'wfdasdfasd', 'fasdf', 'asdfasf', 'asdfasdfasdfsd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-01 15:57:24', '2023-08-01 15:57:24'),
('940fa8cd-a5a0-41be-87ab-5cbef71cd04d', 'ຫກດັຫກ', 'ຫກດັຫກດ', 'ຫກດັຫ', 'ຫກດັຫ', 'ຫັກດັຫ', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 13:15:23', '2023-07-30 13:15:23'),
('941ce2a5-65ac-4265-afb9-427f0709167e', 'dsfgsdf', 'dfgsf', 'dfgdsf', 'dfsgsdf', 'sdfgsdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 07:36:30', '2023-07-30 07:36:30'),
('9a7c23c7-5731-412f-867b-87c227a83f0e', 'fgsdfg', 'dsfgsdfg', 'sdfgsd', 'gsdfgsdfgsd', 'fgsdfgsdfgdf', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-23 09:23:33', '2023-07-23 09:23:33'),
('9e7fe6e7-5517-442d-8c3c-981a4668c308', 'dfasdfa', 'dfasdf', 'asdfasdf', 'asdfadf', 'asdfasdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 23:46:26', '2023-07-30 23:46:26'),
('a213232a-049e-4524-8b58-4d82e5adc048', 'sdfzsdf', 'asdfasdfas', 'dfasdf', 'asdfasd', 'asdfasd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 13:51:00', '2023-07-30 13:51:00'),
('a4832c08-e5e2-473c-a53e-94286579d1bd', 'ກເກດເ', 'ກດເຫກດເ', 'ກດເຫກດເ', 'ກດເກດເກຫ', 'ດຫກດເກດ', 'ເຊັງວ່າງ', 203333333, '444b636a-6360-4ab3-82a9-7c621d994720', '2023-07-25 07:27:42', '2023-07-25 07:27:42'),
('a9401b08-717c-4df5-b9d3-f5f4fc4ec06e', 'ບໍລິຄຳໄຊ', 'ປາກກະດິງ', 'ທົ່ງນາມີ', 'ອະນຸສິດ', 'ສາຂາທົ່ງນາມີ', 'ເມໄມ', 2055054511, 'ba369ac9-4709-4769-a8cf-90d459e48f2f', '2023-07-25 07:51:08', '2023-07-25 07:51:08'),
('a9e23110-b299-4cfd-8e51-bc22c5e2b9a1', 'kjlk', 'dfs', 'sdfs', 'dfsdfss', 'adfssd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-29 10:22:29', '2023-07-29 10:22:29'),
('ace5b1ad-af44-4586-84e7-fd1e32311ea0', 'sdSDF', 'sdfdas', 'fasdfa', 'sdfas', 'asdfasdfasd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:23:10', '2023-07-31 00:23:10'),
('b05da121-97c9-4593-a6ae-60504c5c58b8', 'afgdf', 'dfgdfg', 'ddfg', 'dfgdf', 'gdfgdf', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-23 09:20:55', '2023-07-23 09:20:55'),
('beaad62f-d3a4-447b-ba73-c1e099ff627b', 'afasf', 'sdfasdf', 'sdfsaa', 'sdfasdfas', 'dfasdfas', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 15:30:03', '2023-07-30 15:30:03'),
('c17e93f1-4667-47e7-a788-7cfdb2f9031d', 'dfaf', 'sdfasd', 'fasdf', 'asd', 'sdfasd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 12:37:40', '2023-07-31 12:37:40'),
('c204cdec-e4b4-40d3-a747-0411172847e7', 'ffffffffffffffff', 'fffffffffffffffff', 'fffffffffffffff', 'ffffffffffffffff', 'fffffffffffff', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:12:37', '2023-07-31 00:12:37'),
('c40eb4de-926a-453f-9337-ea320ffb2979', 'bolikhamsay', 'pakkading', 'thongnamy', 'Anousith', 'thongnamy', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 07:13:46', '2023-07-30 07:13:46'),
('cc01fac0-f9d9-4797-8104-5ac26f80a187', 'ຫກດັຫກ', 'ຫກດັຫກ', 'ັຫກດັຫ', 'ັຫກດັຫກ', 'ັຫກດັຫກດ', 'ເຊັງວ່າງ', 203333333, '444b636a-6360-4ab3-82a9-7c621d994720', '2023-07-25 07:28:39', '2023-07-25 07:28:39'),
('cd58cb99-434c-4402-bb36-26be59ec5b09', 'ddddddd', 'ddddddddd', 'dddddddd', 'dd', 'dddddddd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 00:37:12', '2023-07-31 00:37:12'),
('ce1ce5d9-42d0-4663-9061-b1bb49a9af8c', 'sdfgdfg', 'dfgdsfg', 'sdfgsdfgsd', 'fgsdf', 'gsdfgsdfg', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-01 22:38:08', '2023-08-01 22:38:08'),
('d6118c32-2731-482f-9088-152325589872', 'sdfasd', 'fasdf', 'asdfasdf', 'asdfa', 'sdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 12:35:08', '2023-07-31 12:35:08'),
('d627a0ed-ee5f-41ff-a152-a2229eeb34a2', 'dff', 'dfgdf', 'dfgdf', 'dfgdfd', 'fgdfg', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-23 12:03:50', '2023-07-23 12:03:50'),
('da06e134-b5a2-4e4a-ad93-4f6cc440eda3', 'fasdf', 'fasdfas', 'dfasd', 'fasdf', 'asdfs', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-08-01 15:45:46', '2023-08-01 15:45:46'),
('dacdd178-e782-4002-af4a-f8abbbe66474', 'ກດເຫກດ', 'ດເຫກດ', 'ດເກດເກຫ', 'ກດເຫກດເກ', 'ດກເກດ', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-29 09:18:51', '2023-07-29 09:18:51'),
('e02e8cb4-c67f-44c7-bcbd-6a1369184dcc', 'xdf', 'sefsd', 'sfdsd', 'sdf', 'sdfsdf', 'se', 2012312312, 'd2c72e20-9937-43e0-aba5-d4e8d7734875', '2023-07-30 07:43:53', '2023-07-30 07:43:53'),
('e0d25ea9-23b3-4a16-9a2e-724de340d961', 'sadfasd', 'fasdfasd', 'fasd', 'sdfasdf', 'asdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 12:35:58', '2023-07-31 12:35:58'),
('eac90f8c-00ed-443e-ac31-cc5e779b807a', 'sdfasdf', 'sdfassa', 'dfasd', 'asdfas', 'asdfasd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 12:32:42', '2023-07-31 12:32:42'),
('fabcb1e2-400d-4a4c-86fa-9264a70be8e8', 'ddddddddd', 'dddddddddddddd', 'dddddddd', 'dddddddddddd', 'ddddddddddd', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-31 01:09:06', '2023-07-31 01:09:06'),
('fb7ca589-a2c8-4f03-adf5-45d252febe91', 'asdsf', 'sdfasd', 'sdfas', 'sdfsa', 'asdfasdf', 'ມໍ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-30 13:34:44', '2023-07-30 13:34:44'),
('fbcdab33-a059-4e2d-8d69-fe09c1b7c255', 'sdfasd', 'fasdf', 'asdfasdf', 'asdfasd', 'fasdfasdfasd', 'ເຊັງວ່າງ', 2078781525, 'ad1d351e-123f-4406-aef1-576e766fb9f5', '2023-07-24 10:56:26', '2023-07-24 10:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `employee_id`, `order_date`, `status`, `createdAt`, `updatedAt`) VALUES
('ORDER20230801155932', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 08:59:32', 'completed', '2023-08-01 08:59:32', '2023-08-01 09:00:20'),
('ORDER20230801155951', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 08:59:51', 'completed', '2023-08-01 08:59:51', '2023-08-01 09:00:23'),
('ORDER20230801160005', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 09:00:05', 'completed', '2023-08-01 09:00:05', '2023-08-01 09:00:26'),
('ORDER20230801160553', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 09:05:53', 'completed', '2023-08-01 09:05:53', '2023-08-01 09:06:35'),
('ORDER20230801161459', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 09:14:59', 'completed', '2023-08-01 09:14:59', '2023-08-01 09:15:13'),
('ORDER20230801162937', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 09:29:37', 'completed', '2023-08-01 09:29:37', '2023-08-01 09:29:52'),
('ORDER20230801164641', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 09:46:40', 'completed', '2023-08-01 09:46:41', '2023-08-01 09:47:02'),
('ORDER20230801173830', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 10:38:30', 'completed', '2023-08-01 10:38:30', '2023-08-01 13:46:17'),
('ORDER20230801173936', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 10:39:36', 'completed', '2023-08-01 10:39:36', '2023-08-01 14:45:04'),
('ORDER20230801175518', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 10:55:18', 'completed', '2023-08-01 10:55:18', '2023-08-01 13:46:25'),
('ORDER20230801204237', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 13:42:37', 'completed', '2023-08-01 13:42:37', '2023-08-01 13:45:12'),
('ORDER20230801214342', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 14:43:42', 'completed', '2023-08-01 14:43:42', '2023-08-01 14:45:08'),
('ORDER20230801214412', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 14:44:12', 'completed', '2023-08-01 14:44:12', '2023-08-01 14:45:15'),
('ORDER20230801214445', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 14:44:45', 'completed', '2023-08-01 14:44:45', '2023-08-01 14:45:01'),
('ORDER20230802053454', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 22:34:54', 'completed', '2023-08-01 22:34:54', '2023-08-01 22:36:28'),
('ORDER20230802053526', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 22:35:26', 'completed', '2023-08-01 22:35:26', '2023-08-01 22:36:31'),
('ORDER20230802054233', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 22:42:33', 'completed', '2023-08-01 22:42:33', '2023-08-01 22:43:42'),
('ORDER20230802054302', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 22:43:02', 'completed', '2023-08-01 22:43:02', '2023-08-01 22:43:38'),
('ORDER20230802054324', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-01 22:43:24', 'completed', '2023-08-01 22:43:24', '2023-08-01 22:43:34'),
('ORDER20230802074547', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-02 00:45:47', 'completed', '2023-08-02 00:45:47', '2023-08-02 15:45:31'),
('ORDER20230802224438', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', '2023-08-02 15:44:38', 'completed', '2023-08-02 15:44:38', '2023-08-02 15:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `order_quantity`, `order_id`, `color`, `size`, `createdAt`, `updatedAt`) VALUES
('0acf8f1b-5ed5-470a-b4c8-3a19b86a82c0', 'e05130d6-77e0-424c-a377-55e42c430245', 1, 'ORDER20230801204237', 'ຂາວ', 'S', '2023-08-01 13:42:41', '2023-08-01 13:42:41'),
('0c924ed2-c3d3-436c-bc57-322bc7da6d78', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 5, 'ORDER20230802053454', 'ບົວ', 'M', '2023-08-01 22:34:57', '2023-08-01 22:34:57'),
('0d729b93-c83e-4340-a102-06291e76312f', '13b209e5-217c-4be0-b620-320d17b4d83c', 1, 'ORDER20230801175518', 'ສົ້ມ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('1348c7c4-0e47-460f-ba08-24f0d8f68408', '13b209e5-217c-4be0-b620-320d17b4d83c', 5, 'ORDER20230801173936', 'ຟ້າຂຽວ', 'S', '2023-08-01 10:39:40', '2023-08-01 10:39:40'),
('18b625cf-1c4d-433b-8092-76a89246323e', 'af3ec450-2b6a-4739-80d7-e87858483432', 5, 'ORDER20230801173830', 'ຂາວ', 'S', '2023-08-01 10:38:30', '2023-08-01 10:38:30'),
('1d946c6e-c43e-4281-988d-b17e78bda84f', '9457e6e6-032d-4b18-a304-98d9f49c0e9d', 1, 'ORDER20230801175518', 'ຂາວ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('1eb83030-6ab2-4cfd-beba-11bf19e092b1', '06ec815e-652a-48ab-b38f-7a75243f3e86', 5, 'ORDER20230801214412', 'ຂາວ', 'M', '2023-08-01 14:44:13', '2023-08-01 14:44:13'),
('1fd205b7-5094-4c33-b706-b27a83fa8679', '106e8499-495d-4538-8049-233ab5eedeb3', 5, 'ORDER20230802224438', 'ແດງ', 'S', '2023-08-02 15:44:42', '2023-08-02 15:44:42'),
('26fe134a-4da3-400b-b537-b8715d07db16', 'f595738c-28da-42c6-be3b-9989db8e17c1', 5, 'ORDER20230802054302', 'ບົວ', 'S', '2023-08-01 22:43:02', '2023-08-01 22:43:02'),
('28d2c4b4-dfbd-41f9-8891-a0fd9375f84b', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 5, 'ORDER20230802053526', 'ຂາວ', 'S', '2023-08-01 22:35:26', '2023-08-01 22:35:26'),
('3a5956fd-c34b-463e-913f-3d4c4fb1aa16', '246619ee-7287-4cd1-a3ec-13c3c7498512', 5, 'ORDER20230802053526', 'ຂາວ', 'S', '2023-08-01 22:35:26', '2023-08-01 22:35:26'),
('3afba6ec-0d92-46e9-a1a1-cf0db5cc3de4', 'f595738c-28da-42c6-be3b-9989db8e17c1', 5, 'ORDER20230802054233', 'ຂາວ', 'S', '2023-08-01 22:42:37', '2023-08-01 22:42:37'),
('3dbb018f-0e8a-4fd4-8d9f-527f0ba43db9', '06ec815e-652a-48ab-b38f-7a75243f3e86', 1, 'ORDER20230802074547', 'ສົ້ມ', 'S', '2023-08-02 00:45:50', '2023-08-02 00:45:50'),
('3e8f02cd-47f4-4150-9a4f-8ea5f96e1c96', 'e05130d6-77e0-424c-a377-55e42c430245', 5, 'ORDER20230802054233', 'ຂາວ', 'S', '2023-08-01 22:42:37', '2023-08-01 22:42:37'),
('404ebd69-9306-4a4d-8904-03ef523036d4', '13468770-bee7-49ee-a7fb-5958bfebd932', 5, 'ORDER20230801175518', 'ສົ້ມ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('4095d300-9105-4de1-8df4-b408b4076511', '9480c313-4921-41c3-bfb1-51c53092fc47', 1, 'ORDER20230801175518', 'ແດງ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('435ca62e-8012-4b9d-836b-117a20898c4f', '106e8499-495d-4538-8049-233ab5eedeb3', 5, 'ORDER20230801214412', 'ຂາວ', 'M', '2023-08-01 14:44:13', '2023-08-01 14:44:13'),
('449f99f8-516c-4db3-b6e8-d4d82018f180', '106e8499-495d-4538-8049-233ab5eedeb3', 10, 'ORDER20230801164641', 'ດຳ', 'S', '2023-08-01 09:46:44', '2023-08-01 09:46:44'),
('4a3c5b07-62e3-41bd-997e-385b7bce97e7', '13b209e5-217c-4be0-b620-320d17b4d83c', 5, 'ORDER20230801173830', 'ຟ້າຂຽວ', 'S', '2023-08-01 10:38:30', '2023-08-01 10:38:30'),
('4f602a2d-5be1-4798-aca2-16fb9e9c941f', 'af3ec450-2b6a-4739-80d7-e87858483432', 1, 'ORDER20230801175518', 'ມ່ວງ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('52a58565-413f-4131-b18f-eb7129713c64', 'ff98f549-849f-48eb-8cd9-4e8d7b9e57b6', 1, 'ORDER20230801175518', 'ສົ້ມ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('57030db4-2b46-4524-b26b-9cf97b0a0ccf', '13468770-bee7-49ee-a7fb-5958bfebd932', 5, 'ORDER20230802224438', 'ເທົາ', 'S', '2023-08-02 15:44:42', '2023-08-02 15:44:42'),
('61007d09-5e57-4a0c-8a08-ca84b903dc08', '06ec815e-652a-48ab-b38f-7a75243f3e86', 5, 'ORDER20230801214445', 'ຂາວ', 'L', '2023-08-01 14:44:48', '2023-08-01 14:44:48'),
('6769cc21-3314-48c2-b13c-ff6fbf042bd8', '06ec815e-652a-48ab-b38f-7a75243f3e86', 10, 'ORDER20230801164641', 'ດຳ', 'S', '2023-08-01 09:46:44', '2023-08-01 09:46:44'),
('7d9a5e3f-cfa3-4497-ae7f-9780674db09a', 'bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 1, 'ORDER20230801175518', 'ມ່ວງ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('7e60cf08-0d97-437b-b34c-30db499bff0f', 'e05130d6-77e0-424c-a377-55e42c430245', 1, 'ORDER20230801175518', 'ມ່ວງ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('7f8211cb-2b39-41c5-9cd7-39f6f37fdbc9', 'af3ec450-2b6a-4739-80d7-e87858483432', 5, 'ORDER20230801173936', 'ຂາວ', 'S', '2023-08-01 10:39:40', '2023-08-01 10:39:40'),
('7f83ae82-0ab0-44b5-9b30-b3227cce28ca', 'e05130d6-77e0-424c-a377-55e42c430245', 10, 'ORDER20230801160005', 'ຂາວ', 'L', '2023-08-01 09:00:05', '2023-08-01 09:00:05'),
('819aa8dd-b04a-4afc-a1a2-4d463f906edb', '06ec815e-652a-48ab-b38f-7a75243f3e86', 6, 'ORDER20230801214342', 'ຂາວ', 'S', '2023-08-01 14:43:46', '2023-08-01 14:43:46'),
('8b0d2a34-5d41-4093-b4be-18e66d35913b', 'e05130d6-77e0-424c-a377-55e42c430245', 10, 'ORDER20230801161459', 'ຂາວ', 'S', '2023-08-01 09:15:02', '2023-08-01 09:15:02'),
('8feee0c0-b085-4f4c-b118-c2543bbbfacc', 'f595738c-28da-42c6-be3b-9989db8e17c1', 5, 'ORDER20230802054324', 'ບົວ', 'L', '2023-08-01 22:43:25', '2023-08-01 22:43:25'),
('ab13b632-7970-40bf-b3cd-436168f72ea4', '106e8499-495d-4538-8049-233ab5eedeb3', 1, 'ORDER20230802074547', 'ສົ້ມ', 'S', '2023-08-02 00:45:50', '2023-08-02 00:45:50'),
('abcfb0be-4a95-4c20-b7e7-9b87cb0f9ea1', '246619ee-7287-4cd1-a3ec-13c3c7498512', 1, 'ORDER20230801175518', 'ດຳ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('b15046dc-8f04-4622-ba65-a09f6061a6a7', '106e8499-495d-4538-8049-233ab5eedeb3', 5, 'ORDER20230801175518', 'ມ່ວງ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('b37b1e77-17d1-46d9-8832-88bcd42d6ba4', 'e05130d6-77e0-424c-a377-55e42c430245', 5, 'ORDER20230802054324', 'ຂາວ', 'L', '2023-08-01 22:43:25', '2023-08-01 22:43:25'),
('b5d2f935-35e4-44c3-a210-97afd464d012', 'e05130d6-77e0-424c-a377-55e42c430245', 5, 'ORDER20230802054302', 'ດຳ', 'S', '2023-08-01 22:43:02', '2023-08-01 22:43:02'),
('b62be26b-440b-4356-b882-b962416a14c5', '106e8499-495d-4538-8049-233ab5eedeb3', 6, 'ORDER20230801214342', 'ຂາວ', 'S', '2023-08-01 14:43:46', '2023-08-01 14:43:46'),
('b919f931-6188-44f5-bd11-3e666c0f39c3', 'e05130d6-77e0-424c-a377-55e42c430245', 10, 'ORDER20230801162937', 'ຂາວ', 'S', '2023-08-01 09:29:41', '2023-08-01 09:29:41'),
('bf110039-d024-4d38-85fe-6270d370bbea', '13b209e5-217c-4be0-b620-320d17b4d83c', 1, 'ORDER20230801204237', 'ແດງ', 'S', '2023-08-01 13:42:41', '2023-08-01 13:42:41'),
('cc455090-0697-44c9-8c5b-8f9b27af9aed', '13468770-bee7-49ee-a7fb-5958bfebd932', 10, 'ORDER20230801164641', 'ດຳ', 'S', '2023-08-01 09:46:44', '2023-08-01 09:46:44'),
('da06b156-2fe4-49d8-840f-70a5bfef6afc', 'e05130d6-77e0-424c-a377-55e42c430245', 10, 'ORDER20230801160553', 'ຂາວ', 'S', '2023-08-01 09:05:56', '2023-08-01 09:05:56'),
('daab7703-0bd9-40e3-ae80-02d9b60dbdac', '06ec815e-652a-48ab-b38f-7a75243f3e86', 5, 'ORDER20230802224438', 'ດຳ', 'S', '2023-08-02 15:44:42', '2023-08-02 15:44:42'),
('e0361ea3-9772-4540-a963-e57b8e5dc41b', 'af3ec450-2b6a-4739-80d7-e87858483432', 1, 'ORDER20230801204237', 'ຂາວ', 'M', '2023-08-01 13:42:41', '2023-08-01 13:42:41'),
('eabe776c-21ce-47d3-858a-3e6455af1091', '06ec815e-652a-48ab-b38f-7a75243f3e86', 5, 'ORDER20230801175518', 'ດຳ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('eba34a7f-108c-4099-a3ba-96bf94a9ca8d', '246619ee-7287-4cd1-a3ec-13c3c7498512', 5, 'ORDER20230802053454', 'ດຳ', 'S', '2023-08-01 22:34:57', '2023-08-01 22:34:57'),
('f0aaae27-991c-4646-91f1-b7ccc691c925', '106e8499-495d-4538-8049-233ab5eedeb3', 5, 'ORDER20230801214445', 'ຂາວ', 'L', '2023-08-01 14:44:48', '2023-08-01 14:44:48'),
('f3dffc83-eae5-42e1-a7aa-6e95a5e09340', 'e05130d6-77e0-424c-a377-55e42c430245', 10, 'ORDER20230801155932', 'ຂາວ', 'S', '2023-08-01 08:59:36', '2023-08-01 08:59:36'),
('f3fa7f5b-5425-496f-a442-e5cfc12b6357', 'f595738c-28da-42c6-be3b-9989db8e17c1', 1, 'ORDER20230801175518', 'ສົ້ມ', 'L', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('f7613e1d-37a5-488f-9b31-e22d6ea9d90c', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 1, 'ORDER20230801175518', 'ມ່ວງ', 'S', '2023-08-01 10:55:22', '2023-08-01 10:55:22'),
('fb41d6ea-fbb4-4119-aeb1-7aecb1658709', 'e05130d6-77e0-424c-a377-55e42c430245', 10, 'ORDER20230801155951', 'ຂາວ', 'M', '2023-08-01 08:59:51', '2023-08-01 08:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `cost_price` float DEFAULT NULL,
  `Barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `size_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `sale_price`, `cost_price`, `Barcode`, `supplier_id`, `profile`, `quantity`, `size_id`, `color`, `createdAt`, `updatedAt`) VALUES
('06ec815e-652a-48ab-b38f-7a75243f3e86', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຍືດ', 'ສິນຄ້າມີຄຸນນະພາບນຳເຂົ້າຈາກປະເທດໄທ', 69000, 50000, '123121', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230724-WA0003.jpg?alt=media&token=96d018eb-ca6a-4ecb-920a-1535e30a7b54', 0, 'ມີທຸກsize', 'ມີສີຕາມທີເຫັນ', '2023-07-24 08:34:10', '2023-08-02 15:46:10'),
('106e8499-495d-4538-8049-233ab5eedeb3', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເຟຊັນ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 165000, 90000, '123496', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F00003.jpg?alt=media&token=755ad3dd-7eb2-4457-99c7-886aa0d5d36a', 6, 'freesize', 'ທຸກຂະໜາດ', '2023-07-24 08:19:48', '2023-08-02 15:45:32'),
('13468770-bee7-49ee-a7fb-5958bfebd932', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເສືອເດັກນ້ອຍ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 79000, 65000, '123459', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230724-WA0021.jpg?alt=media&token=e6834fd1-e577-46c5-ad49-54dce8e95ae3', 5, 'ມີທຸກsize', 'ມີທຸກສີຕາມທີເຫັນ', '2023-07-24 08:13:49', '2023-08-02 15:45:27'),
('13b209e5-217c-4be0-b620-320d17b4d83c', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເສືອເສືບ', 'ນຳເຂົ້າຈາກປະເທດໃທ', 250000, 150000, '32123', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230723-WA0012.jpg?alt=media&token=5b4e9443-a17d-439f-8133-2593d61b9785', 0, 'freesize', 'ດຳລາຍຟ້າ', '2023-07-24 08:52:31', '2023-08-01 14:46:03'),
('246619ee-7287-4cd1-a3ec-13c3c7498512', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເສືອເຟຊັນ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທມີຄຸນະພາບ', 89000, 70000, '123458', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F05.jpg?alt=media&token=c90f9646-b4c6-4ff2-aaab-2589b369fb3a', 0, 'ທຸກsize', 'ມີທຸກສີຕາມທີເຫັນ', '2023-07-24 07:49:54', '2023-08-02 15:46:46'),
('4f27ece6-d950-468d-a9bf-f3e03c9343d8', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຢືດ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 45000, 15000, '321652', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F02.png?alt=media&token=d14006ec-e9b2-425e-9b08-74c3829546ff', 5, 'S, M', 'ສີນຳ້ເງິນ, ດຳ', '2023-07-24 08:59:02', '2023-08-01 22:39:04'),
('9457e6e6-032d-4b18-a304-98d9f49c0e9d', '66fd8ab3-fa02-4399-8115-edc8a1508093', 'ເສື້ອກຳໜາວ', 'ສິນີຄ້ານຳເຂົ້າຈາກປະເທດໃທ', 250000, 90000, '325623', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F07.png?alt=media&token=bc5e598a-7e48-4b62-966e-c7048c5f1ae5', 0, 'M, L', 'ຂາວ, ນໍ້າເງິນ', '2023-07-24 09:03:46', '2023-08-01 14:39:26'),
('9480c313-4921-41c3-bfb1-51c53092fc47', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຍືດ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໃທ', 50000, 35000, '852963', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F06.png?alt=media&token=6cc5bb1e-d2f5-4afe-b125-5d3111dcbad0', 0, 'S, M', 'ຂາວ, ຂຽວ, ເເດງ', '2023-07-24 09:01:17', '2023-08-01 13:48:13'),
('af3ec450-2b6a-4739-80d7-e87858483432', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'ເຟຊັນ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 165000, 100000, '123459', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F004.jpg?alt=media&token=1444135d-ce11-4d5f-be1b-8ece12c26c86', 0, 'ມີsize', 'ສີຂາວຕາມເຫັນ', '2023-07-24 07:54:20', '2023-08-01 22:34:17'),
('bbacd5eb-2fb1-40a9-b9be-e56ce34bb153', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ເສືອຢືດ', 'ນຳເຂົ້າຈາກປະເທດໄທສິນຄ້າມີຄຸນນະພາບ', 59000, 25000, '123457', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230724-WA0043.jpg?alt=media&token=c3c3d311-c782-4615-ade0-3f7ed43da73c', 0, 'ທຸກ', 'ຫຼາຍສີຕາມທີເຫັດ', '2023-07-24 07:42:09', '2023-08-01 14:42:37'),
('d5fab737-60ae-44e1-be24-b75fba960e79', '813202ce-bfd5-4e91-b5b1-c42d40d2d95a', 'shirt55555555555555555', 'Description of Product 1', 29, 19, 'ABC123', NULL, 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2Ftuam%20leej%20kuab.png?alt=media&token=9e1e175d-818e-4494-9b3a-312e8eca8765', 10, 'ທຸກ size', 'ຂາວ, ເຫຼືອງ, ດຳ, ເເດງ', '2023-07-24 08:29:20', '2023-07-30 06:26:55'),
('e05130d6-77e0-424c-a377-55e42c430245', '7c4b7538-897c-4b1b-8387-f257ff848cb1', 'ຊຸດນອນ', 'ສິ່ງຄ້ານຳຈາກປະເທດໄທ', 200000, 150000, '3216582', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F4b4672b0-c037-4c03-aec2-2c494fecfbf3.jpeg?alt=media&token=f7245943-fb87-4201-b49d-d38e563a8057', 0, 'S', 'ສີຂາວ', '2023-07-24 07:35:09', '2023-08-01 22:54:25'),
('f595738c-28da-42c6-be3b-9989db8e17c1', 'd76e5a38-6310-4a70-8c6e-db1b97f80a86', 'ໄຮລາຍ', 'ສິນຄ້ານຳເຂົ້າຈາກປະເທດໄທ', 250000, 80000, '123323', '8a7d818e-3da0-4c74-acdf-0ebb684e0403', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FIMG-20230723-WA0007.jpg?alt=media&token=4502a259-c64e-4329-a387-6103dad5e753', 0, NULL, 'ດຳ, ແດງ', '2023-07-24 08:42:30', '2023-08-02 15:41:52'),
('ff98f549-849f-48eb-8cd9-4e8d7b9e57b6', '66fd8ab3-fa02-4399-8115-edc8a1508093', 'ຊຸດນອນ', 'ຊຸດນອນນຳເຂົ້າຈາກປະເທດໄທສິນຄ້າດີມີຄຸນນະພາບ', 135000, 52000, '123456', 'a1e43244-0382-4b54-83e6-0aa0ac876928', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2Fb8f3a9e3-ac9a-4641-a3ce-df8e289720d5.jpeg?alt=media&token=eabe9f01-2957-47ba-aff0-6f4dcd0ad743', 0, '6456', '45', '2023-07-23 06:19:45', '2023-08-01 14:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `condition`, `discount`, `createdAt`, `updatedAt`) VALUES
('b1e3e5a7-06ed-4853-b016-d035a88a61ec', 'ໂປໂມຊັນລະດູຝົນ', 'ຊື້ຫຼາຍກ່ວາ 100,000 ກີບ', 0.5, '2023-07-22 12:35:11', '2023-07-25 23:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `provinceName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `payment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  `sale_total` float DEFAULT NULL,
  `sale_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `promotion_id`, `employee_id`, `location_id`, `payment`, `sale_date`, `sale_total`, `sale_type`, `sale_status`, `sale_quantity`, `createdAt`, `updatedAt`) VALUES
('SELL20230802053813', 'ad1d351e-123f-4406-aef1-576e766fb9f5', NULL, NULL, 'ce1ce5d9-42d0-4663-9061-b1bb49a9af8c', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F08.jpg?alt=media&token=c9d16b3b-3868-4c13-9ac3-054210cd516c', '2023-08-01 22:38:08', 670000, 'online', 'completed', 10, '2023-08-01 22:38:13', '2023-08-01 22:39:04'),
('SELL20230802054512', 'ad1d351e-123f-4406-aef1-576e766fb9f5', NULL, NULL, '3b9fddea-5d3b-4175-8ef1-e617f244179d', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F08.jpg?alt=media&token=c47c1e23-1c8f-4370-8472-0859a042c4ca', '2023-08-01 22:45:06', 1200000, 'online', 'completed', 6, '2023-08-01 22:45:12', '2023-08-01 22:46:01'),
('SELL20230802055331', 'ad1d351e-123f-4406-aef1-576e766fb9f5', NULL, NULL, '7ca7bc61-4977-4adb-aea4-d000b8f5c4ca', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F03.jpg?alt=media&token=f82e76d9-2dc5-4532-8a9b-69b39e558f32', '2023-08-01 22:53:26', 1800000, 'online', 'completed', 9, '2023-08-01 22:53:31', '2023-08-01 22:54:21'),
('SELL20230802072221', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-02 00:22:21', 267000, 'pos', 'completed', 3, '2023-08-02 00:22:21', '2023-08-02 00:22:21'),
('SELL20230802221133', 'ad1d351e-123f-4406-aef1-576e766fb9f5', NULL, NULL, '23380670-bab6-40f5-a811-bd2b9a741b9e', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F07.jpg?alt=media&token=6b437054-3110-48ed-b490-b58a138f8cf0', '2023-08-02 15:11:28', 178000, 'online', 'completed', 2, '2023-08-02 15:11:33', '2023-08-02 15:46:43'),
('SELL20230802224034', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-02 15:40:33', 750000, 'pos', 'completed', 3, '2023-08-02 15:40:34', '2023-08-02 15:40:34'),
('SELL20230802224149', NULL, 'b1e3e5a7-06ed-4853-b016-d035a88a61ec', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-02 15:41:49', 2985000, 'pos', 'completed', 12, '2023-08-02 15:41:49', '2023-08-02 15:41:49'),
('SELL20230802224609', NULL, NULL, '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, NULL, '2023-08-02 15:46:09', 414000, 'pos', 'completed', 6, '2023-08-02 15:46:09', '2023-08-02 15:46:09');

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
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `color_size_id`, `product_id`, `sale_price`, `quantity`, `color`, `size`, `createdAt`, `updatedAt`) VALUES
('026aefc9-9066-44db-8942-366a15d786cd', 'SELL20230802054512', '51f97320-4487-48a0-a574-6e8858fbfc85', 'e05130d6-77e0-424c-a377-55e42c430245', 200000, 2, 'ຂາວ', 'S', '2023-08-01 22:45:13', '2023-08-01 22:45:13'),
('04e3ad03-2d36-4f9b-a255-13eca09cba1f', 'SELL20230802224149', 'addbacfe-c671-4498-9252-cfabcf98ae39', 'f595738c-28da-42c6-be3b-9989db8e17c1', 250000, 4, NULL, NULL, '2023-08-02 15:41:52', '2023-08-02 15:41:52'),
('16b845cc-da70-413e-9960-3e3796880fae', 'SELL20230802072221', '4e0700a4-ade5-4fb2-9e89-15992c7b0f75', '246619ee-7287-4cd1-a3ec-13c3c7498512', 89000, 3, NULL, NULL, '2023-08-02 00:22:25', '2023-08-02 00:22:25'),
('189d583f-6dbc-4eb2-8228-40d897169ce5', 'SELL20230802055331', '92ec096e-cbf4-45f0-bbbc-48f4ae6e5a3c', 'e05130d6-77e0-424c-a377-55e42c430245', 200000, 3, 'ດຳ', 'S', '2023-08-01 22:53:31', '2023-08-01 22:53:31'),
('1d45ec70-9a74-45ad-bf7b-663fef91c806', 'SELL20230802221133', '4e0700a4-ade5-4fb2-9e89-15992c7b0f75', '246619ee-7287-4cd1-a3ec-13c3c7498512', 89000, 2, 'ຂາວ', 'S', '2023-08-02 15:11:33', '2023-08-02 15:11:33'),
('1e8adf6d-cc8a-408d-ab1a-a26d326720ea', 'SELL20230802053813', '27467e6e-3eab-4ef0-9da2-6893a246e69d', '246619ee-7287-4cd1-a3ec-13c3c7498512', 89000, 5, 'ດຳ', 'S', '2023-08-01 22:38:13', '2023-08-01 22:38:13'),
('32e7c3d1-3a2c-4a0f-8ab8-16fc329a8c6a', 'SELL20230802055331', '51f97320-4487-48a0-a574-6e8858fbfc85', 'e05130d6-77e0-424c-a377-55e42c430245', 200000, 3, 'ຂາວ', 'S', '2023-08-01 22:53:31', '2023-08-01 22:53:31'),
('6cce4ab5-2f0e-4220-b923-798b5d157468', 'SELL20230802224609', 'd4a26985-0ef0-483d-b186-b5daf964f76e', '06ec815e-652a-48ab-b38f-7a75243f3e86', 69000, 1, NULL, NULL, '2023-08-02 15:46:10', '2023-08-02 15:46:10'),
('93da1b5b-6f9d-4f1c-91d1-3d95da70ff15', 'SELL20230802224034', '083ae053-117a-4959-a87f-956ab5b05332', 'f595738c-28da-42c6-be3b-9989db8e17c1', 250000, 1, NULL, NULL, '2023-08-02 15:40:37', '2023-08-02 15:40:37'),
('9bba3593-1caa-4fe7-a634-f726f2f8fb47', 'SELL20230802224034', '20a1c19f-14b5-4019-937b-c2d84c8857b3', 'f595738c-28da-42c6-be3b-9989db8e17c1', 250000, 1, NULL, NULL, '2023-08-02 15:40:37', '2023-08-02 15:40:37'),
('a17ab9d4-a377-4de0-ac20-571d351b7d6f', 'SELL20230802224149', '20a1c19f-14b5-4019-937b-c2d84c8857b3', 'f595738c-28da-42c6-be3b-9989db8e17c1', 250000, 4, NULL, NULL, '2023-08-02 15:41:52', '2023-08-02 15:41:52'),
('a874fe82-290b-4cca-b716-881df284fd36', 'SELL20230802053813', '0ee9bcca-cd07-45ea-8ce3-16938efc7006', '4f27ece6-d950-468d-a9bf-f3e03c9343d8', 45000, 5, 'ຂາວ', 'S', '2023-08-01 22:38:13', '2023-08-01 22:38:13'),
('c58269ab-0564-459f-a247-2977446f4038', 'SELL20230802055331', 'cf4df8da-4fd2-40cb-9223-91b68baf06ee', 'e05130d6-77e0-424c-a377-55e42c430245', 200000, 3, 'ຂາວ', 'L', '2023-08-01 22:53:31', '2023-08-01 22:53:31'),
('d5efdb80-2ad7-418d-9c82-5f16ac5074ee', 'SELL20230802224609', '9360eeb4-a899-4a1f-98a7-dae770791d87', '06ec815e-652a-48ab-b38f-7a75243f3e86', 69000, 5, NULL, NULL, '2023-08-02 15:46:10', '2023-08-02 15:46:10'),
('daf8ad72-94e4-4600-8654-c162e2f129ee', 'SELL20230802054512', 'cf4df8da-4fd2-40cb-9223-91b68baf06ee', 'e05130d6-77e0-424c-a377-55e42c430245', 200000, 2, 'ຂາວ', 'L', '2023-08-01 22:45:13', '2023-08-01 22:45:13'),
('e7b3f141-6c7e-415d-ba54-22f50342e6b6', 'SELL20230802054512', '92ec096e-cbf4-45f0-bbbc-48f4ae6e5a3c', 'e05130d6-77e0-424c-a377-55e42c430245', 200000, 2, 'ດຳ', 'S', '2023-08-01 22:45:13', '2023-08-01 22:45:13'),
('fef509ea-97ba-4b4d-89ab-8865eb129b2e', 'SELL20230802224149', '083ae053-117a-4959-a87f-956ab5b05332', 'f595738c-28da-42c6-be3b-9989db8e17c1', 250000, 4, NULL, NULL, '2023-08-02 15:41:52', '2023-08-02 15:41:52'),
('ff844fc8-5152-4354-9c79-a1c0dc9bad6c', 'SELL20230802224034', 'addbacfe-c671-4498-9252-cfabcf98ae39', 'f595738c-28da-42c6-be3b-9989db8e17c1', 250000, 1, NULL, NULL, '2023-08-02 15:40:37', '2023-08-02 15:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL,
  `village` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `owner_id`, `phone`, `password`, `status`, `createdAt`, `updatedAt`) VALUES
('06e69d8e-fb56-40ce-b1ad-3340a5bc3132', '0d53462e-879d-4c3f-b5e6-1e778b8fb721', NULL, '02078781525', '$2b$05$kyHVboaHKSBFLFfdsMhbAOQ7dltgTZs2flItmUeb5ec0LjCih8EL6', 'admin', '2023-07-22 12:30:54', '2023-07-22 12:30:54'),
('0b600b2c-1c80-4ceb-9fdd-aee26d8e0418', NULL, '5b32889b-755f-492e-9549-885499baebdf', '02012345678', '$2b$05$kthVtqzHI4RnhtRxk4i.qOsj4xdT7x76xKQUXO3cUERiaKwLW.eAi', 'admin', '2023-07-24 09:21:08', '2023-07-24 09:21:08'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
