-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2025 at 04:29 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storefinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admintable`
--

CREATE TABLE `admintable` (
  `Username` varchar(200) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admintable`
--

INSERT INTO `admintable` (`Username`, `Password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `orders_table`
--

CREATE TABLE `orders_table` (
  `orderid` int(200) NOT NULL,
  `Id` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `gst` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `mode` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_table`
--

INSERT INTO `orders_table` (`orderid`, `Id`, `price`, `gst`, `total`, `mode`, `mail`, `address`, `status`) VALUES
(1000, '1115', '38000', '6840', '44840', 'Cash', 'divitjuneja07@gmail.com', 'friends colony', 'Shipped'),
(1001, '1124', '18000', '3240', '21240', 'UPI', 'aadf@gmail.com', 'mahavir marg\r\n', 'Pending'),
(1002, '1117', '800', '144', '944', 'Cash', 'aapp@gmail.com', 'adarsh nagar', 'Delivered'),
(1003, '1117', '800', '144', '944', 'Cash', 'aapp@gmail.com', 'adarsh nagar', 'Pending'),
(1004, '1115', '38000', '6840', '44840', 'Cash', 'divitjuneja07@gmail.com', 'maqsudan', 'Pending'),
(1005, '1115', '38000', '6840', '44840', 'Cash', 'divitjuneja07@gmail.com', 'qwerty', 'Shipped'),
(1006, '1114', '57000', '10260', '67260', 'UPI', 'divitjuneja07@gmail.com', 'Football chowk', 'Delivered'),
(1007, '1118', '300', '54', '354', 'Cash', 'divitjuneja07@gmail.com', 'ravidas chowk', 'Pending'),
(1008, '1115', '38000', '6840', '44840', 'UPI', 'divitjuneja07@gmail.com', 'dav college', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `outlet_table`
--

CREATE TABLE `outlet_table` (
  `store_id` int(200) NOT NULL,
  `store_name` varchar(200) NOT NULL,
  `Phone` varchar(200) NOT NULL,
  `Mail` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `GST` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outlet_table`
--

INSERT INTO `outlet_table` (`store_id`, `store_name`, `Phone`, `Mail`, `Address`, `GST`) VALUES
(1, 'HP World', '9316521787', 'aadf@gmail.com', 'friends colony', '0704DFFAF');

-- --------------------------------------------------------

--
-- Table structure for table `sales_table`
--

CREATE TABLE `sales_table` (
  `Outlet` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `Model` varchar(200) NOT NULL,
  `Quantity` int(200) NOT NULL,
  `Sell` int(200) NOT NULL,
  `Mode` varchar(200) NOT NULL,
  `sales_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_table`
--

INSERT INTO `sales_table` (`Outlet`, `id`, `Model`, `Quantity`, `Sell`, `Mode`, `sales_id`) VALUES
('1.HP World', '1116', 'aaaa1', 3, 1200, 'Cash', 4),
('1.HP World', '1117', 'aaaa2', 2, 800, 'Card', 5),
('1.HP World', '1117', 'aaaa2', 1, 800, 'Cash', 6),
('1.HP World', '1118', 'aaaa3', 2, 500, 'UPI', 7);

-- --------------------------------------------------------

--
-- Table structure for table `stock_table`
--

CREATE TABLE `stock_table` (
  `Series` varchar(200) NOT NULL,
  `id` varchar(200) NOT NULL,
  `Model` varchar(200) NOT NULL,
  `Serial` varchar(200) NOT NULL,
  `Cost` int(200) NOT NULL,
  `Qty` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_table`
--

INSERT INTO `stock_table` (`Series`, `id`, `Model`, `Serial`, `Cost`, `Qty`) VALUES
('Accessories', '1116', 'aaaa1', 'bbbb2', 900, 9),
('Accessories', '1117', 'aaaa2', 'bbbb3', 600, 16),
('Accessories', '1118', 'aaaa3', 'bbbb4', 250, 33),
('Accessories', '1119', 'aaaa4', 'bbbb5', 900, 10),
('Accessories', '1120', 'aaaa5', 'bbbb6', 1800, 5),
('Accessories', '1121', 'aaaa6', 'bbbb7', 1300, 19),
('Laptop', '1106', 'jjlkdl9', 'lkdlj10', 73000, 8),
('Laptop', '1107', 'jjlkdl10', 'lkdlj11', 74000, 5),
('Laptop', '1108', 'jjlkdl11', 'lkdlj12', 71000, 6),
('Laptop', '1109', 'jjlkdl12', 'lkdlj13', 74000, 3),
('Laptop', '1110', 'jjlkdl13', 'lkdlj14', 77000, 5),
('Laptop', '1111', 'jjlkdl14', 'lkdlj15', 82000, 5),
('Laptop', '1112', 'jjlkdl15', 'lkdlj16', 91000, 2),
('Laptop', '1100', 'jjlkdl3', 'lkdlj4', 54000, 8),
('Laptop', '1101', 'jjlkdl4', 'lkdlj5', 63000, 10),
('Laptop', '1102', 'jjlkdl5', 'lkdlj6', 81000, 7),
('Laptop', '1103', 'jjlkdl6', 'lkdlj7', 95000, 5),
('Laptop', '1104', 'jjlkdl7', 'lkdlj8', 90000, 6),
('Laptop', '1105', 'jjlkdl8', 'lkdlj9', 83000, 3),
('Printers', '1122', 'pppp1', 'qqqq2', 13000, 4),
('Printers', '1123', 'pppp2', 'qqqq3', 5000, 6),
('Printers', '1124', 'pppp3', 'qqqq4', 16000, 6),
('Printers', '1125', 'pppp4', 'qqqq5', 14000, 6),
('PC', '1113', 'qwer1', 'wert2', 46000, 2),
('PC', '1114', 'qwer2', 'wert3', 55000, 3),
('PC', '1115', 'qwer3', 'wert4', 36000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `usertable1`
--

CREATE TABLE `usertable1` (
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertable1`
--

INSERT INTO `usertable1` (`Name`, `Phone`, `Email`, `Password`) VALUES
('Divit Juneja', '7508616092', 'divitjuneja07@gmail.com', 'cccc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders_table`
--
ALTER TABLE `orders_table`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `outlet_table`
--
ALTER TABLE `outlet_table`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `sales_table`
--
ALTER TABLE `sales_table`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `stock_table`
--
ALTER TABLE `stock_table`
  ADD PRIMARY KEY (`Serial`);

--
-- Indexes for table `usertable1`
--
ALTER TABLE `usertable1`
  ADD PRIMARY KEY (`Phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders_table`
--
ALTER TABLE `orders_table`
  MODIFY `orderid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `outlet_table`
--
ALTER TABLE `outlet_table`
  MODIFY `store_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales_table`
--
ALTER TABLE `sales_table`
  MODIFY `sales_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
