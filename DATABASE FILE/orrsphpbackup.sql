-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 02:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orrsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `orrs_admin`
--

CREATE TABLE `orrs_admin` (
  `admin_id` int(20) NOT NULL,
  `admin_fname` varchar(200) NOT NULL,
  `admin_lname` varchar(200) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_uname` varchar(200) NOT NULL,
  `admin_pwd` varchar(200) NOT NULL,
  `admin_dpic` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orrs_admin`
--

INSERT INTO `orrs_admin` (`admin_id`, `admin_fname`, `admin_lname`, `admin_email`, `admin_uname`, `admin_pwd`, `admin_dpic`) VALUES
(1, 'System ', 'Admin', 'admin@mail.com', 'Administrator', '903b21879b4a60fc9103c3334e4f6f62cf6c3a2d', 'admin-icn.png');

-- --------------------------------------------------------

--
-- Table structure for table `orrs_passenger`
--

CREATE TABLE `orrs_passenger` (
  `pass_id` int(20) NOT NULL,
  `pass_fname` varchar(200) NOT NULL,
  `pass_lname` varchar(200) NOT NULL,
  `pass_phone` varchar(200) NOT NULL,
  `pass_addr` varchar(200) NOT NULL,
  `pass_email` varchar(200) NOT NULL,
  `pass_pwd` varchar(200) NOT NULL,
  `pass_dpic` varchar(200) NOT NULL,
  `pass_uname` varchar(200) NOT NULL,
  `pass_bday` varchar(200) NOT NULL,
  `pass_bio` longtext NOT NULL,
  `pass_train_number` varchar(200) NOT NULL,
  `pass_train_name` varchar(200) NOT NULL,
  `pass_dep_station` varchar(200) NOT NULL,
  `pass_dep_time` varchar(200) NOT NULL,
  `pass_arr_station` varchar(200) NOT NULL,
  `pass_train_fare` varchar(200) NOT NULL,
  `pass_fare_payment_code` varchar(200) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orrs_passenger`
--

INSERT INTO `orrs_passenger` (`pass_id`, `pass_fname`, `pass_lname`, `pass_phone`, `pass_addr`, `pass_email`, `pass_pwd`, `pass_dpic`, `pass_uname`, `pass_bday`, `pass_bio`, `pass_train_number`, `pass_train_name`, `pass_dep_station`, `pass_dep_time`, `pass_arr_station`, `pass_train_fare`, `pass_fare_payment_code`, `payment_status`) VALUES
(22, 'Md Rashedujjaman', 'Reza', '+601161342013', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ai210045@student.uthm.edu.my', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', '211031-B-38==50x50 net.jpg', 'Reza', '10/20/2030', '', 'SCS21', 'ETS Komuter', 'Padang Besar', '7:00 AM', 'Butterworth', '56', 'sdfeasdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orrs_train`
--

CREATE TABLE `orrs_train` (
  `id` int(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `route` varchar(200) NOT NULL,
  `current` varchar(200) NOT NULL,
  `destination` varchar(200) NOT NULL,
  `time` varchar(200) NOT NULL,
  `passengers` varchar(200) NOT NULL,
  `number` varchar(200) NOT NULL,
  `fare` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orrs_train`
--

INSERT INTO `orrs_train` (`id`, `name`, `route`, `current`, `destination`, `time`, `passengers`, `number`, `fare`) VALUES
(1, 'ETS Komuter', 'Padang Besar - Butterworth', 'Padang Besar', 'Butterworth', '7:00 AM', '255', 'SCS21', '56'),
(10, 'ETS Platinum', 'Kuala Lumpur - Butterworth', 'Kuala Lumpur', 'Butterworth', '7:15 AM', '198', 'ESTG56', '42'),
(11, 'ETS Gold', 'Kuala Lumpur - Ipoh', 'Kuala Lumpur', 'Ipoh', '9:00 AM', '295', 'ESTG96', '36'),
(12, 'ETS Silver', 'Kuala Lumpur - Ipoh', 'Kuala Lumpur', 'Ipoh', '10:45 AM', '266', 'ESTS21', '26'),
(13, 'Southern Shuttle Trains', 'Gemas - Johor Bharu', 'Gemas', 'Johor Bharu', '1:00 PM', '330', 'SST-21', '18'),
(14, 'Ekspress Rakyat Timuran', 'Tumpat - Johor Bharu', 'Tumpat', 'Johor Bharu', '10:00 AM', '156', 'ERT-21', '15'),
(15, 'East Coast Shuttle Trains', 'Gua Musang - Kuala Lipis', 'Gua Musang', 'Kuala Lipis', '8:45 AM', '190', 'ECST25', '168'),
(16, 'ETS Komuter', 'Batu Caves - Tampin', 'Batu Caves', 'Pulau Sebang', '6:00 AM', '210', 'SCS21', '16'),
(17, 'ETS Platinum', 'Ipoh - Kuala Lumpur', 'Ipoh', 'Kuala Lumpur', '12:45 PM', '195', 'ESTP99', '38');

-- --------------------------------------------------------

--
-- Table structure for table `orrs_train_tickets`
--

CREATE TABLE `orrs_train_tickets` (
  `ticket_id` int(20) NOT NULL,
  `pass_name` varchar(200) NOT NULL,
  `pass_email` varchar(200) NOT NULL,
  `pass_addr` varchar(200) NOT NULL,
  `train_name` varchar(200) NOT NULL,
  `train_no` varchar(200) NOT NULL,
  `train_dep_stat` varchar(200) NOT NULL,
  `train_arr_stat` varchar(200) NOT NULL,
  `train_fare` varchar(200) NOT NULL,
  `fare_payment_code` varchar(200) NOT NULL,
  `confirmation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orrs_train_tickets`
--

INSERT INTO `orrs_train_tickets` (`ticket_id`, `pass_name`, `pass_email`, `pass_addr`, `train_name`, `train_no`, `train_dep_stat`, `train_arr_stat`, `train_fare`, `fare_payment_code`, `confirmation`) VALUES
(15, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(16, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(17, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(18, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(19, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(20, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(21, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(22, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(23, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(24, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(25, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(26, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(27, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'East Coast Shuttle Trains', 'ECST25', 'Gua Musang', 'Kuala Lipis', '168', 'sdfeasdf', ''),
(28, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(29, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(30, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(31, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Platinum', 'ESTP99', 'Ipoh', 'Kuala Lumpur', '38', 'sdfeasdf', ''),
(32, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Platinum', 'ESTP99', 'Ipoh', 'Kuala Lumpur', '38', 'sdfeasdf', ''),
(33, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(34, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(35, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(36, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', ''),
(37, 'Md Rashedujjaman Reza', 'ai210045@student.uthm.edu.my', 'NHD- 081, Paiker Chhara, Bhurungamari, Kurigram', 'ETS Komuter', 'SCS21', 'Padang Besar', 'Butterworth', '56', 'sdfeasdf', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orrs_admin`
--
ALTER TABLE `orrs_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `orrs_passenger`
--
ALTER TABLE `orrs_passenger`
  ADD PRIMARY KEY (`pass_id`);

--
-- Indexes for table `orrs_train`
--
ALTER TABLE `orrs_train`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orrs_train_tickets`
--
ALTER TABLE `orrs_train_tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orrs_admin`
--
ALTER TABLE `orrs_admin`
  MODIFY `admin_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orrs_passenger`
--
ALTER TABLE `orrs_passenger`
  MODIFY `pass_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orrs_train`
--
ALTER TABLE `orrs_train`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orrs_train_tickets`
--
ALTER TABLE `orrs_train_tickets`
  MODIFY `ticket_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
