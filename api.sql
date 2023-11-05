-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 04, 2023 at 05:35 AM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u297473652_ecommerce_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(1, 'shoe', 'shoe, outer covering for the foot, usually of leather with a stiff or thick sole and heel, and generally (distinguishing it from a boot) reaching no higher', 1, '2023-10-23 04:39:50', '2023-10-23 04:40:07'),
(2, 'T-Shirt', 't-shirt for moisture-wicking and comfort during workouts.', 2, '2023-11-04 05:15:40', '2023-11-04 05:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `category_id`, `stock_quantity`, `created_at`, `updated_at`, `images`) VALUES
(1, 'Nike Air Max 270', 'Classic Nike Air Max sneakers with lightweight cushioning and a stylish design.', '129.99', 1, 50, '2023-11-04 12:00:00', '2023-11-04 05:34:32', '[\"image1.jpg\", \"image2.jpg\"]'),
(2, 'Nike Dri-FIT T-Shirt', 'Men\'s short-sleeve Nike Dri-FIT t-shirt for moisture-wicking and comfort during workouts.', '29.99', 2, 100, '2023-11-04 12:01:00', '2023-11-04 05:34:32', '[\"image3.jpg\", \"image4.jpg\"]'),
(3, 'Nike Women\'s Running Shoes', 'Lightweight and breathable Nike running shoes for women with excellent support.', '129.99', 1, 75, '2023-11-04 12:02:00', '2023-11-04 05:34:32', '[\"image5.jpg\", \"image6.jpg\"]'),
(4, 'Nike Elite Basketball Socks', 'High-performance Nike Elite basketball socks with arch support and moisture control.', '29.99', 1, 200, '2023-11-04 12:03:00', '2023-11-04 05:34:32', '[\"image7.jpg\", \"image8.jpg\"]'),
(5, 'Nike Gym Bag', 'Durable Nike gym bag with multiple compartments for easy storage and organization.', '29.99', 1, 30, '2023-11-04 12:04:00', '2023-11-04 05:34:32', '[\"image9.jpg\", \"image10.jpg\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
