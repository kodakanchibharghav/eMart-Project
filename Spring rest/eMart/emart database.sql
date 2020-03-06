-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2020 at 11:48 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emartdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details_table`
--

CREATE TABLE `bill_details_table` (
  `bill_details_id` int(20) NOT NULL,
  `bill_id` int(20) NOT NULL,
  `item_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details_table`
--

INSERT INTO `bill_details_table` (`bill_details_id`, `bill_id`, `item_id`) VALUES
(601, 701, 201),
(603, 703, 201),
(611, 716, 203),
(612, 717, 201),
(613, 717, 202),
(614, 718, 201),
(615, 718, 203),
(616, 718, 202),
(617, 719, 201),
(618, 720, 201),
(619, 721, 201),
(620, 722, 202),
(621, 722, 201),
(622, 723, 202),
(623, 724, 202),
(624, 725, 203),
(625, 726, 201);

-- --------------------------------------------------------

--
-- Table structure for table `bill_table`
--

CREATE TABLE `bill_table` (
  `bill_id` int(20) NOT NULL,
  `buyer_id` int(20) NOT NULL,
  `bill_type` varchar(50) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_remarks` varchar(200) NOT NULL,
  `bill_amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_table`
--

INSERT INTO `bill_table` (`bill_id`, `buyer_id`, `bill_type`, `bill_date`, `bill_remarks`, `bill_amount`) VALUES
(701, 1, 'debit', '2020-02-28', 'good', 2000),
(703, 1, 'debit', '2020-02-28', 'dcgfvf', 2000),
(716, 1, 'Debit', '2020-03-05', 'paid', 89900),
(717, 1, 'Debit', '2020-03-05', 'paid', 55000),
(718, 1, 'Debit', '2020-03-05', 'paid', 144900),
(719, 1, 'Debit', '2020-03-05', 'paid', 50000),
(720, 1, 'Debit', '2020-03-05', 'paid', 50000),
(721, 1, 'Debit', '2020-03-05', 'paid', 50000),
(722, 1, 'Debit', '2020-03-05', 'paid', 55000),
(723, 1, 'Debit', '2020-03-05', 'paid', 5000),
(724, 1, 'Debit', '2020-03-06', 'paid', 5000),
(725, 1, 'Debit', '2020-03-06', 'paid', 89900),
(726, 1, 'Debit', '2020-03-06', 'paid', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `buyer_signup_table`
--

CREATE TABLE `buyer_signup_table` (
  `buyer_id` int(20) NOT NULL,
  `buyer_username` varchar(50) NOT NULL,
  `buyer_password` varchar(10) NOT NULL,
  `buyer_email` varchar(20) NOT NULL,
  `buyer_mobile` bigint(10) NOT NULL,
  `buyer_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer_signup_table`
--

INSERT INTO `buyer_signup_table` (`buyer_id`, `buyer_username`, `buyer_password`, `buyer_email`, `buyer_mobile`, `buyer_date`) VALUES
(1, 'john', '1234', 'john@gmail.com', 1234567821, '2020-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_brief` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `category_brief`) VALUES
(302, 'clothing', 'all types'),
(501, 'Electronics', 'Varieties of electronics like TV,Washing Machine'),
(502, 'Mobiles', 'Varieties of SmartPhones'),
(503, 'clothes', 'varieties of clothes'),
(504, 'footwear', 'varieties of footwear');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `item_id` int(20) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_image` varchar(200) NOT NULL,
  `item_price` int(40) NOT NULL,
  `item_stock` int(20) NOT NULL,
  `item_description` varchar(200) NOT NULL,
  `subcategory_id` int(10) NOT NULL,
  `item_remarks` varchar(400) NOT NULL,
  `seller_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`item_id`, `item_name`, `item_image`, `item_price`, `item_stock`, `item_description`, `subcategory_id`, `item_remarks`, `seller_id`) VALUES
(201, 'LED', 'https://u01.appmifile.com/images/2018/04/07/e6d01675-0453-42c7-ac3a-e7a30843133f.png', 50000, 5, 'Xiaomi Mi Smart TV', 101, 'good product', 401),
(202, 'Headphones', 'https://images-na.ssl-images-amazon.com/images/I/51rRwx6wJgL._SL1000_.jpg', 5000, 5, 'Mauno wieless head phones', 102, 'good product', 401),
(203, 'iphonexs', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzkJq0YupQFe9QgntmORJWtaGxmQ3hW-0p2c7sJkLA7qox30WO', 89900, 5, 'Apple iphone xs silver', 102, 'good product', 401);

-- --------------------------------------------------------

--
-- Table structure for table `seller_signup_table`
--

CREATE TABLE `seller_signup_table` (
  `seller_id` int(20) NOT NULL,
  `seller_username` varchar(50) NOT NULL,
  `seller_password` varchar(10) NOT NULL,
  `seller_company` varchar(100) NOT NULL,
  `seller_brief` varchar(200) NOT NULL,
  `seller_gst` int(20) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `seller_email` varchar(60) NOT NULL,
  `seller_contact` bigint(10) NOT NULL,
  `seller_website` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_signup_table`
--

INSERT INTO `seller_signup_table` (`seller_id`, `seller_username`, `seller_password`, `seller_company`, `seller_brief`, `seller_gst`, `seller_address`, `seller_email`, `seller_contact`, `seller_website`) VALUES
(401, 'manik', '1234', 'zosh', 'ajhjkjhlj', 10, 'ramnagar', 'manik@gmail.com', 9896787869, 'www.abc.com');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_table`
--

CREATE TABLE `sub_category_table` (
  `subcategory_id` int(20) NOT NULL,
  `subcategory_name` varchar(50) NOT NULL,
  `category_id` int(200) NOT NULL,
  `subcategory_brief` varchar(200) NOT NULL,
  `subcategory_gst` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category_table`
--

INSERT INTO `sub_category_table` (`subcategory_id`, `subcategory_name`, `category_id`, `subcategory_brief`, `subcategory_gst`) VALUES
(101, 'LED', 501, 'Led 50 inches', 5),
(102, 'Headphones', 501, 'Sony', 5),
(103, 'iphonexs', 502, 'iphone', 5),
(104, 'Samsung M30s', 502, 'samsung', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD PRIMARY KEY (`bill_details_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `sub_category_table_ibfk_1` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  MODIFY `bill_details_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=626;

--
-- AUTO_INCREMENT for table `bill_table`
--
ALTER TABLE `bill_table`
  MODIFY `bill_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=727;

--
-- AUTO_INCREMENT for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  MODIFY `buyer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `item_table`
--
ALTER TABLE `item_table`
  MODIFY `item_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  MODIFY `seller_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  MODIFY `subcategory_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD CONSTRAINT `bill_details_table_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_table` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_details_table_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_table` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD CONSTRAINT `bill_table_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_signup_table` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_table`
--
ALTER TABLE `item_table`
  ADD CONSTRAINT `item_table_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_category_table` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_signup_table` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD CONSTRAINT `sub_category_table_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
