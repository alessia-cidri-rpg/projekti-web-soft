-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2026 at 01:47 PM
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

--
-- Dumping data for table `aktore`
--

INSERT INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES
(1, 'Zendaya'),
(2, 'Timothée Chalamet'),
(3, 'Sam Worthington'),
(4, 'Zoe Saldana'),
(5, 'Chris Pratt'),
(6, 'Anya Taylor-Joy'),
(7, 'Cillian Murphy'),
(8, 'Emily Blunt'),
(9, 'Meryl Streep'),
(10, 'Anne Hathaway'),
(11, 'Samuel L. Jackson'),
(12, 'Dwayne Johnson'),
(13, 'Kevin Hart'),
(14, 'Jennifer Lawrence'),
(15, 'Margot Robbie'),
(16, 'Ryan Gosling'),
(17, 'Paul Mescal'),
(18, 'Pedro Pascal');

-- --------------------------------------------------------

--
-- Table structure for table `aktori_filmi`
--

CREATE TABLE `aktori_filmi` (
  `filmi_id` int(11) DEFAULT NULL,
  `aktor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aktori_filmi`
--

INSERT INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES
(1, 2),
(1, 1),
(5, 9),
(5, 10),
(6, 5),
(6, 11),
(7, 12),
(7, 13),
(9, 15),
(9, 16),
(10, 17),
(10, 18),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(8, 14);

-- --------------------------------------------------------

--
-- Table structure for table `filmi`
--

CREATE TABLE `filmi` (
  `filmi_id` int(11) NOT NULL,
  `regjisor_id` int(11) DEFAULT NULL,
  `titulli` varchar(100) DEFAULT NULL,
  `kohezgjatja` time(6) DEFAULT NULL,
  `data` year(4) DEFAULT NULL,
  `trailer_link` varchar(1000) DEFAULT NULL,
  `pershkrimi` varchar(4000) DEFAULT NULL,
  `posteri` varchar(1000) DEFAULT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `data_kinema` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filmi`
--

INSERT INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `trailer_link`, `pershkrimi`, `posteri`, `header`, `status_id`, `data_kinema`) VALUES
(1, 1, 'Dune: Part Two', '02:46:00.000000', '2024', NULL, NULL, NULL, NULL, 1, NULL),
(2, 2, 'Avatar: The Way of Water', '03:12:00.000000', '2022', NULL, NULL, NULL, NULL, 1, NULL),
(3, 3, 'The Super Mario Bros.', '01:32:00.000000', '2023', NULL, NULL, NULL, NULL, 1, NULL),
(4, 4, 'Oppenheimer', '03:00:00.000000', '2023', NULL, NULL, NULL, NULL, 1, NULL),
(5, 6, 'The Devil Wears Prada 2', '01:50:00.000000', '2026', NULL, NULL, NULL, NULL, 2, NULL),
(6, 7, 'The Garfield Movie', '01:41:00.000000', '2024', NULL, NULL, NULL, NULL, 2, NULL),
(7, 8, 'Central Intelligence', '01:47:00.000000', '2016', NULL, NULL, NULL, NULL, 2, NULL),
(8, NULL, 'No Hard Feelings', '01:43:00.000000', '2023', NULL, NULL, NULL, NULL, 2, NULL),
(9, 10, 'Barbie', '01:54:00.000000', '2023', NULL, NULL, NULL, NULL, 2, '2026-07-02'),
(10, 11, 'Gladiator II', '02:30:00.000000', '2024', NULL, NULL, NULL, NULL, 2, '2026-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `regjisor`
--

CREATE TABLE `regjisor` (
  `regjisor_id` int(11) NOT NULL,
  `regjisor_emri` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regjisor`
--

INSERT INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES
(1, 'Denis Villeneuve'),
(2, 'James Cameron'),
(3, 'Aaron Horvath'),
(4, 'Christopher Nolan'),
(5, 'Todd Phillips'),
(6, 'David Frankel'),
(7, 'Mark Dindal'),
(8, 'Rawson Marshall Thurber'),
(9, 'Gene Stupnitsky'),
(10, 'Greta Gerwig'),
(11, 'Ridley Scott');

-- --------------------------------------------------------

--
-- Table structure for table `statusi`
--

CREATE TABLE `statusi` (
  `status_id` int(11) NOT NULL,
  `status_emri` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statusi`
--

INSERT INTO `statusi` (`status_id`, `status_emri`) VALUES
(1, 'ne kinema'),
(2, 'se shpejti');

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
(0, 'Sci-Fi'),
(1, 'Aksion'),
(2, 'Aventure'),
(3, 'Animacion'),
(4, 'Komedi'),
(5, 'Fantazi'),
(6, 'Drame'),
(7, 'Thriller'),
(8, 'Biografi');

-- --------------------------------------------------------

--
-- Table structure for table `zhanri_filmi`
--

CREATE TABLE `zhanri_filmi` (
  `filmi_id` int(11) DEFAULT NULL,
  `zhanri_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zhanri_filmi`
--

INSERT INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES
(1, 0),
(1, 1),
(2, 0),
(2, 2),
(3, 3),
(3, 2),
(4, 8),
(4, 6),
(5, 4),
(5, 6),
(6, 3),
(6, 4),
(7, 1),
(7, 4),
(9, 4),
(9, 2),
(10, 1),
(10, 6),
(8, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktore`
--
ALTER TABLE `aktore`
  ADD PRIMARY KEY (`aktor_id`);

--
-- Indexes for table `aktori_filmi`
--
ALTER TABLE `aktori_filmi`
  ADD KEY `FK_af_aktori` (`aktor_id`),
  ADD KEY `FK_af_filmi` (`filmi_id`);

--
-- Indexes for table `filmi`
--
ALTER TABLE `filmi`
  ADD PRIMARY KEY (`filmi_id`),
  ADD KEY `fk_filmi_regjisor` (`regjisor_id`),
  ADD KEY `fk_filmi_statusi` (`status_id`);

--
-- Indexes for table `regjisor`
--
ALTER TABLE `regjisor`
  ADD PRIMARY KEY (`regjisor_id`);

--
-- Indexes for table `statusi`
--
ALTER TABLE `statusi`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `zhanri`
--
ALTER TABLE `zhanri`
  ADD PRIMARY KEY (`zhanri_id`);

--
-- Indexes for table `zhanri_filmi`
--
ALTER TABLE `zhanri_filmi`
  ADD KEY `fk_zf_filmi` (`filmi_id`),
  ADD KEY `fk_zf_zhanri` (`zhanri_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktore`
--
ALTER TABLE `aktore`
  MODIFY `aktor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `filmi`
--
ALTER TABLE `filmi`
  MODIFY `filmi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `regjisor`
--
ALTER TABLE `regjisor`
  MODIFY `regjisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `statusi`
--
ALTER TABLE `statusi`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktori_filmi`
--
ALTER TABLE `aktori_filmi`
  ADD CONSTRAINT `FK_af_aktori` FOREIGN KEY (`aktor_id`) REFERENCES `aktore` (`aktor_id`),
  ADD CONSTRAINT `FK_af_filmi` FOREIGN KEY (`filmi_id`) REFERENCES `filmi` (`filmi_id`);

--
-- Constraints for table `filmi`
--
ALTER TABLE `filmi`
  ADD CONSTRAINT `fk_filmi_regjisor` FOREIGN KEY (`regjisor_id`) REFERENCES `regjisor` (`regjisor_id`),
  ADD CONSTRAINT `fk_filmi_statusi` FOREIGN KEY (`status_id`) REFERENCES `statusi` (`status_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `zhanri_filmi`
--
ALTER TABLE `zhanri_filmi`
  ADD CONSTRAINT `fk_zf_filmi` FOREIGN KEY (`filmi_id`) REFERENCES `filmi` (`filmi_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zf_zhanri` FOREIGN KEY (`zhanri_id`) REFERENCES `zhanri` (`zhanri_id`),
  ADD CONSTRAINT `fk_zhanrifilmi_filmi` FOREIGN KEY (`filmi_id`) REFERENCES `filmi` (`filmi_id`),
  ADD CONSTRAINT `fk_zhanrifilmi_zhanri` FOREIGN KEY (`zhanri_id`) REFERENCES `zhanri` (`zhanri_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
