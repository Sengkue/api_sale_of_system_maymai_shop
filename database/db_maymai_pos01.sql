-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2023 at 07:08 AM
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
  `ownerId` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `c_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `c_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `c_gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_location_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `provinceId` int(11) NOT NULL,
  `districtName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `provinceId`, `districtName`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Pakkading', '2023-06-23 23:22:33', '2023-06-23 23:22:33'),
(2, 2, 'Pakkading', '2023-06-28 01:53:08', '2023-06-28 01:53:08'),
(3, 2, 'ຄຳເກິບ', '2023-06-28 01:53:24', '2023-06-28 01:53:24'),
(4, 2, 'ວຽງທອງ', '2023-06-28 01:53:33', '2023-06-28 01:53:33');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `firstName`, `lastName`, `gender`, `profile`, `email`, `phone`, `village`, `createdAt`, `updatedAt`, `provinceId`, `districtId`) VALUES
('0ca8a48d-4aee-4cb3-a4e2-dbe2285b4dbf', 'kchange', 'wang', 'Male', 'https://firebasestorage.googleapis.com/v0/b/seng-demo.appspot.com/o/multiple-images%2FIMG_1723%20(1).JPG?alt=media&token=150ca63e-3f53-4db3-9eb1-3ffea21e4168', 'john.doe@example.com', '02078781525', 'Village A', '2023-06-25 14:01:08', '2023-06-25 14:01:08', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `productId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `altText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `productId`, `url`, `altText`, `createdAt`, `updatedAt`) VALUES
('016c526b-0a93-4e4e-8dd8-6fa9a7a1baeb', 'd1ca3e0d-2da8-4809-8e1f-14f85ea6c285', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', 'shirt', '2023-06-25 12:45:06', '2023-06-25 12:45:06'),
('5f4e780f-10f0-493e-8f17-352fe2db12af', 'd1ca3e0d-2da8-4809-8e1f-14f85ea6c285', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', 'shirt', '2023-06-25 12:45:46', '2023-06-25 12:45:46'),
('62ebff31-e30d-4980-8468-b2e29f8e38ca', 'd1ca3e0d-2da8-4809-8e1f-14f85ea6c285', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', 'shirt', '2023-06-25 11:59:44', '2023-06-25 11:59:44'),
('6b258353-79d1-41ec-a320-74a1cd198f66', 'd1ca3e0d-2da8-4809-8e1f-14f85ea6c285', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', 'shirt', '2023-06-25 11:55:57', '2023-06-25 11:55:57'),
('9e707e3c-9b6e-4425-86c8-232663900c37', 'd1ca3e0d-2da8-4809-8e1f-14f85ea6c285', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', 'shirt', '2023-06-25 12:45:58', '2023-06-25 12:45:58'),
('c8fa54d3-f68c-486e-99f2-ba9def87889f', 'd1ca3e0d-2da8-4809-8e1f-14f85ea6c285', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', 'shirt', '2023-06-25 12:45:51', '2023-06-25 12:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `provinceId` int(11) NOT NULL,
  `districtId` int(11) NOT NULL,
  `village` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `express` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `provinceId`, `districtId`, `village`, `express`, `createdAt`, `updatedAt`) VALUES
(1, 1, 123, 'Example Village', 'Example Express', '2023-06-28 00:55:57', '2023-06-28 00:55:57');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannerId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `shopName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `firstName`, `lastName`, `gender`, `profile`, `bannerId`, `shopName`, `phone`, `email`, `description`, `address`, `createdAt`, `updatedAt`) VALUES
('b353a948-3386-4ef6-9e6d-130b44125e78', 'John', 'Doe', 'Male', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2F01.png?alt=media&token=25f7acd8-4481-45ce-86df-a2857c70a33f', '123456789', 'Maymai shop', '02055054511', 'john.doe@example.com', 'Welcome to my shop!', 'in font of the dongdok street 2, saythany district and vientiane capietal province', '2023-06-23 23:25:24', '2023-06-23 23:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `qauntity` int(11) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `condition` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `provinceName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `provinceName`) VALUES
(1, 'Bolikhamsay'),
(2, 'ບໍລິຄຳໄຊ');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceId` int(11) NOT NULL,
  `districtId` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `profile`, `name`, `phone`, `provinceId`, `districtId`, `address`, `description`, `createdAt`, `updatedAt`) VALUES
('7fbedd29-b45e-4819-a9b3-8ab2541946a6', 'https://firebasestorage.googleapis.com/v0/b/seng-demo.appspot.com/o/multiple-images%2FIMG_1723%20(1).JPG?alt=media&token=150ca63e-3f53-4db3-9eb1-3ffea21e4168', 'Supplier Company', '1234567890', 1, 1, '123 Supplier Street', 'This is a supplier company.', '2023-06-28 01:07:52', '2023-06-28 01:07:52'),
('caca7d87-ef39-474b-a9f7-68814a705b87', 'https://firebasestorage.googleapis.com/v0/b/test-8c391.appspot.com/o/Single_image%2FESALin.jpg?alt=media&token=b5d9897a-d515-4e6a-b33c-9ff256fe4cb0', 'sengkuevang shop', '2078781522', 2, 4, 'dongdok ', 'asefasdfasdfsadfsd', '2023-06-28 02:09:50', '2023-06-28 02:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `employee_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `owner_id`, `phone`, `password`, `status`, `createdAt`, `updatedAt`) VALUES
('020b4bfd-48b3-4b42-8680-8a67d14cb3a4', '0ca8a48d-4aee-4cb3-a4e2-dbe2285b4dbf', '', '02012345678', '$2b$05$qFIdgWGeaT5tTt1uJoinFOt0gFcTM7TCqGvOl/D1EIYh7hiNOOYzi', 'admin', '2023-06-26 01:33:17', '2023-06-26 01:42:55'),
('08276361-34e7-4002-9312-a4c0f11be24b', '', 'b353a948-3386-4ef6-9e6d-130b44125e78', '02078781525', '$2b$05$6YSXorchKxRYFasCbU0NM.GQ5oGvpgYtSYUdouMS63hqDhZ9sYpPS', 'admin', '2023-06-26 01:25:30', '2023-06-26 01:29:56'),
('0977df43-ed51-44ad-8ce4-8b785ff315a6', '', 'b353a948-3386-4ef6-9e6d-130b44125e78', '02032132132', '$2b$05$zUj9O2/UAgjIBu.nyEkMP.XfIy4guJ5EwSvLG58QaVpj2SQdOrMB.', 'user', '2023-06-26 01:39:37', '2023-06-26 01:39:37'),
('9eff108e-fd90-4238-adf0-633268f63314', '0ca8a48d-4aee-4cb3-a4e2-dbe2285b4dbf', '', '02055054511', '$2b$05$N5GT51AIHiwXXuuuip2brOKngMgYi/YCr/WxR18l0Mn8JDG9Qndpe', 'admin', '2023-06-26 01:01:47', '2023-06-26 01:30:07');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `provinces` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`districtId`) REFERENCES `districts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
