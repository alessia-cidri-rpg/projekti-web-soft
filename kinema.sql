-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2026 at 09:28 PM
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
-- Table structure for table `aktore`
--

CREATE TABLE `aktore` (
  `aktor_id` int(11) NOT NULL,
  `aktor_emri` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filmi`
--

CREATE TABLE `filmi` (
  `filmi_id` int(11) NOT NULL,
  `regjisor_id` int(11) DEFAULT NULL,
  `titulli` varchar(100) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `zhanri`
--

CREATE TABLE `zhanri` (
  `zhanri_id` int(11) NOT NULL,
  `zhanri_emri` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zhanri`
--

INSERT INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES
(1, 'Aksion'),
(2, 'Aventure'),
(3, 'Animacion'),
(4, 'Komedi'),
(5, 'Fantazi'),
(6, 'Drame'),
(7, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `zhanri_filmi`
--

CREATE TABLE `zhanri_filmi` (
  `filmi_id` int(11) DEFAULT NULL,
  `zhanri_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktore`
--
ALTER TABLE `aktore`
  ADD PRIMARY KEY (`aktor_id`);

--
-- Indexes for table `filmi`
--
ALTER TABLE `filmi`
  ADD PRIMARY KEY (`filmi_id`),
  ADD KEY `fk_filmi_regjisor` (`regjisor_id`);

--
-- Indexes for table `regjisor`
--
ALTER TABLE `regjisor`
  ADD PRIMARY KEY (`regjisor_id`);

--
-- Indexes for table `zhanri`
--
ALTER TABLE `zhanri`
  ADD PRIMARY KEY (`zhanri_id`);

--
-- Indexes for table `zhanri_filmi`
--
ALTER TABLE `zhanri_filmi`
  ADD KEY `fk_zhanrifilmi_filmi` (`filmi_id`),
  ADD KEY `fk_zhanrifilmi_zhanri` (`zhanri_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktore`
--
ALTER TABLE `aktore`
  MODIFY `aktor_id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `filmi`
--
ALTER TABLE `filmi`
  ADD CONSTRAINT `fk_filmi_regjisor` FOREIGN KEY (`regjisor_id`) REFERENCES `regjisor` (`regjisor_id`);

--
-- Constraints for table `zhanri_filmi`
--
ALTER TABLE `zhanri_filmi`
  ADD CONSTRAINT `fk_zhanrifilmi_filmi` FOREIGN KEY (`filmi_id`) REFERENCES `filmi` (`filmi_id`),
  ADD CONSTRAINT `fk_zhanrifilmi_zhanri` FOREIGN KEY (`zhanri_id`) REFERENCES `zhanri` (`zhanri_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
