-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2026 at 06:38 PM
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
-- Database: `kinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `filmi`
--

CREATE TABLE `filmi` (
  `filmi_id` int(11) NOT NULL,
  `regjisor_id` int(11) DEFAULT NULL,
  `titulli_id` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `kohezgjatja` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `trailer_link` varchar(1000) DEFAULT NULL,
  `pershkrimi` varchar(4000) DEFAULT NULL,
  `zhanri` varchar(100) DEFAULT NULL,
  `posteri` varchar(1000) DEFAULT NULL,
  `header` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regjisor`
--

CREATE TABLE `regjisor` (
  `regjisor_id` int(11) NOT NULL,
  `regjisor_emri` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filmi`
--
ALTER TABLE `filmi`
  ADD PRIMARY KEY (`filmi_id`);

--
-- Indexes for table `regjisor`
--
ALTER TABLE `regjisor`
  ADD PRIMARY KEY (`regjisor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filmi`
--
ALTER TABLE `filmi`
  MODIFY `filmi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regjisor`
--
ALTER TABLE `regjisor`
  MODIFY `regjisor_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
