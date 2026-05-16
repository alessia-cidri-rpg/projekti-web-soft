-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2026 at 12:00 AM
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
(18, 'Pedro Pascal'),
(19, 'Joaquin Phillips'),
(20, 'Christian Bale'),
(21, 'Heath Ledger');

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
(8, 14),
(11, 19),
(12, 20),
(12, 21);

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
  `pershkrimi` varchar(4000) DEFAULT NULL,
  `posteri` varchar(1000) DEFAULT NULL,
  `header_poster` varchar(1000) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `data_kinema` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `filmi`
--

INSERT INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES
(1, 1, 'Dune: Part Two', '02:46:00.000000', '2024', 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he must prevent a terrible future only he can foresee.', 'https://xl.movieposterdb.com/24_02/2024/15239678/xl_dune-part-two-movie-poster_18c5c05f.jpg', 'https://image.tmdb.org/t/p/original/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg', 1, NULL),
(2, 2, 'Avatar: The Way of Water', '03:12:00.000000', '2022', 'Jake Sully and Neytiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora. When an ancient threat resurfaces, Jake must fight a difficult war against the humans.', 'https://xl.movieposterdb.com/23_01/2022/1630029/xl_avatar-the-way-of-water-movie-poster_c111a145.png', 'https://xl.movieposterdb.com/23_01/2022/1630029/xl_avatar-the-way-of-water-movie-poster_c111a145.png', 1, NULL),
(3, 3, 'The Super Mario Bros.', '01:32:00.000000', '2023', 'While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported through a mysterious pipe to a magical new world. But when the siblings are separated, an epic adventure begins.', 'https://xl.movieposterdb.com/23_04/2023/6718170/xl_the-super-mario-bros-movie-movie-poster_c62032f8.jpg', 'https://xl.movieposterdb.com/25_03/2023/6718170/xl_the-super-mario-bros-movie-movie-poster_24de7c16.jpg', 1, NULL),
(4, 4, 'Oppenheimer', '03:00:00.000000', '2023', 'During World War II, Lt. Gen. Leslie Groves Jr. appoints physicist J. Robert Oppenheimer to work on the top-secret Manhattan Project. Oppenheimer and a team of scientists spend years developing and designing the atomic bomb. Their work comes to fruition on July 16, 1945, as they witness the world\'s first nuclear explosion, forever changing the course of history.', 'https://xl.movieposterdb.com/23_06/2023/15398776/xl_oppenheimer-movie-poster_a83f1cbb.jpg', 'https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg', 1, NULL),
(5, 6, 'The Devil Wears Prada 2', '01:50:00.000000', '2026', 'Miranda Priestly struggles against Emily Charlton, her former assistant turned rival executive, as they compete for advertising revenue amid declining print media, while Miranda nears retirement.', 'https://xl.movieposterdb.com/26_04/2026/33612209/xl_the-devil-wears-prada-2-movie-poster_6b73993b.jpg', NULL, 2, '2026-05-15'),
(6, 7, 'The Garfield Movie', '01:41:00.000000', '2024', 'After an unexpected reunion with his long-lost father, a scruffy street cat, Garfield is forced to leave his perfectly pampered life in order to take part in a high-stakes heist. And an incredible outdoor adventure begins!', 'https://xl.movieposterdb.com/24_03/2024/5779228/xl_the-garfield-movie-movie-poster_3ccdd455.jpg', NULL, 2, '2026-05-24'),
(7, 8, 'Central Intelligence', '01:47:00.000000', '2016', 'Accountant Calvin, who was the most popular boy at school, meets his ex-classmate, Bob, at a reunion. Little does he know that the meeting would wreak havoc in his quiet and peaceful life.', 'https://xl.movieposterdb.com/15_11/2016/1489889/xl_1489889_d65e6f4f.jpg', NULL, 2, '2026-06-10'),
(8, 9, 'No Hard Feelings', '01:43:00.000000', '2023', 'On the brink of losing her childhood home, a desperate woman agrees to date a wealthy couple\'s introverted and awkward 19-year-old son. However, he proves to be more of a challenge than she expected, and time is running out before she loses it all.', 'https://xl.movieposterdb.com/23_06/2023/15671028/xl_no-hard-feelings-movie-poster_0bca72a9.jpg', NULL, 2, '2026-06-18'),
(9, 10, 'Barbie', '01:54:00.000000', '2023', 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.', 'https://xl.movieposterdb.com/23_06/2023/1517268/xl_barbie-movie-poster_780f2c78.jpg', NULL, 2, '2026-07-02'),
(10, 11, 'Gladiator II', '02:30:00.000000', '2024', 'Years after witnessing the death of Maximus at the hands of his uncle, Lucius must enter the Colosseum after the powerful emperors of Rome conquer his home. With rage in his heart and the future of the empire at stake, he looks to the past to find the strength and honor needed to return the glory of Rome to its people.', 'https://xl.movieposterdb.com/24_08/2024/9218128/xl_gladiator-2-movie-poster_c8f77715.jpg', NULL, 2, '2026-07-22'),
(11, 5, 'Joker', '02:02:00.000000', '2019', 'Arthur Fleck, a party clown, leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak, he decides to embrace the life of crime and chaos.', 'https://xl.movieposterdb.com/21_04/2019/7286456/xl_7286456_f83eac6d.jpg', NULL, 1, NULL),
(12, 4, 'The Dark Knight', '02:56:00.000000', '2022', 'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.', 'https://xl.movieposterdb.com/24_06/2008/468569/xl_the-dark-knight-movie-poster_96214dbd.jpg', NULL, 1, NULL),
(15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Table structure for table `rezervimi`
--

CREATE TABLE `rezervimi` (
  `rezervimi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shfaqja_id` int(11) NOT NULL,
  `data_rezervimit` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rezervimi_vendi`
--

CREATE TABLE `rezervimi_vendi` (
  `rezervimi_id` int(11) NOT NULL,
  `vendi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salla`
--

CREATE TABLE `salla` (
  `salla_id` int(11) NOT NULL,
  `emri` varchar(50) NOT NULL,
  `kapaciteti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salla`
--

INSERT INTO `salla` (`salla_id`, `emri`, `kapaciteti`) VALUES
(1, 'IMAX', 32);

-- --------------------------------------------------------

--
-- Table structure for table `shfaqja`
--

CREATE TABLE `shfaqja` (
  `shfaqja_id` int(11) NOT NULL,
  `filmi_id` int(11) NOT NULL,
  `salla_id` int(11) NOT NULL,
  `data_ora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','klient') DEFAULT 'klient',
  `krijuar_me` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `krijuar_me`) VALUES
(1, 'admin@test.com', '12345678', 'admin', '2026-05-07 11:31:24'),
(2, 'klient@test.com', '12345678', 'klient', '2026-05-07 11:39:22'),
(4, 'newuser@test.com', '876543211', 'klient', '2026-05-16 21:55:59'),
(5, 'new@test.com', '00000000', 'klient', '2026-05-16 21:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `vendi`
--

CREATE TABLE `vendi` (
  `vendi_id` int(11) NOT NULL,
  `salla_id` int(11) DEFAULT NULL,
  `rreshti` char(1) DEFAULT NULL,
  `numri` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendi`
--

INSERT INTO `vendi` (`vendi_id`, `salla_id`, `rreshti`, `numri`) VALUES
(1, 1, 'A', 1),
(2, 1, 'A', 2),
(3, 1, 'A', 3),
(4, 1, 'A', 4),
(5, 1, 'A', 5),
(6, 1, 'A', 6),
(7, 1, 'A', 7),
(8, 1, 'A', 8),
(9, 1, 'B', 1),
(10, 1, 'B', 2),
(11, 1, 'B', 3),
(12, 1, 'B', 4),
(13, 1, 'B', 5),
(14, 1, 'B', 6),
(15, 1, 'B', 7),
(16, 1, 'B', 8),
(17, 1, 'C', 1),
(18, 1, 'C', 2),
(19, 1, 'C', 3),
(20, 1, 'C', 4),
(21, 1, 'C', 5),
(22, 1, 'C', 6),
(23, 1, 'C', 7),
(24, 1, 'C', 8),
(25, 1, 'D', 1),
(26, 1, 'D', 2),
(27, 1, 'D', 3),
(28, 1, 'D', 4),
(29, 1, 'D', 5),
(30, 1, 'D', 6),
(31, 1, 'D', 7),
(32, 1, 'D', 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_filmat_ne_kinema`
-- (See below for the actual view)
--
CREATE TABLE `view_filmat_ne_kinema` (
`filmi_id` int(11)
,`titulli` varchar(100)
,`status_emri` varchar(50)
);

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
(8, 'Biografi'),
(9, 'Krim');

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
(8, 4),
(11, 7),
(11, 9);

-- --------------------------------------------------------

--
-- Structure for view `view_filmat_ne_kinema`
--
DROP TABLE IF EXISTS `view_filmat_ne_kinema`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_filmat_ne_kinema`  AS SELECT `f`.`filmi_id` AS `filmi_id`, `f`.`titulli` AS `titulli`, `s`.`status_emri` AS `status_emri` FROM (`filmi` `f` join `statusi` `s` on(`f`.`status_id` = `s`.`status_id`)) WHERE `f`.`status_id` = 1 ;

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
-- Indexes for table `rezervimi`
--
ALTER TABLE `rezervimi`
  ADD PRIMARY KEY (`rezervimi_id`),
  ADD KEY `fk_rezervimi_user` (`user_id`),
  ADD KEY `fk_rezervimi_shfaqja` (`shfaqja_id`);

--
-- Indexes for table `rezervimi_vendi`
--
ALTER TABLE `rezervimi_vendi`
  ADD KEY `fk_rv_rezervimi` (`rezervimi_id`),
  ADD KEY `fk_rv_vendi` (`vendi_id`);

--
-- Indexes for table `salla`
--
ALTER TABLE `salla`
  ADD PRIMARY KEY (`salla_id`);

--
-- Indexes for table `shfaqja`
--
ALTER TABLE `shfaqja`
  ADD PRIMARY KEY (`shfaqja_id`),
  ADD KEY `fk_shfaqja_salla` (`salla_id`);

--
-- Indexes for table `statusi`
--
ALTER TABLE `statusi`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vendi`
--
ALTER TABLE `vendi`
  ADD PRIMARY KEY (`vendi_id`),
  ADD KEY `fk_vendi_salla` (`salla_id`);

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
  MODIFY `aktor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `filmi`
--
ALTER TABLE `filmi`
  MODIFY `filmi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `regjisor`
--
ALTER TABLE `regjisor`
  MODIFY `regjisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rezervimi`
--
ALTER TABLE `rezervimi`
  MODIFY `rezervimi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salla`
--
ALTER TABLE `salla`
  MODIFY `salla_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shfaqja`
--
ALTER TABLE `shfaqja`
  MODIFY `shfaqja_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusi`
--
ALTER TABLE `statusi`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendi`
--
ALTER TABLE `vendi`
  MODIFY `vendi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
-- Constraints for table `rezervimi`
--
ALTER TABLE `rezervimi`
  ADD CONSTRAINT `fk_rezervimi_shfaqja` FOREIGN KEY (`shfaqja_id`) REFERENCES `shfaqja` (`shfaqja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rezervimi_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezervimi_vendi`
--
ALTER TABLE `rezervimi_vendi`
  ADD CONSTRAINT `fk_rv_rezervimi` FOREIGN KEY (`rezervimi_id`) REFERENCES `rezervimi` (`rezervimi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rv_vendi` FOREIGN KEY (`vendi_id`) REFERENCES `vendi` (`vendi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shfaqja`
--
ALTER TABLE `shfaqja`
  ADD CONSTRAINT `fk_shfaqja_salla` FOREIGN KEY (`salla_id`) REFERENCES `salla` (`salla_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vendi`
--
ALTER TABLE `vendi`
  ADD CONSTRAINT `fk_vendi_salla` FOREIGN KEY (`salla_id`) REFERENCES `salla` (`salla_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendi_ibfk_1` FOREIGN KEY (`salla_id`) REFERENCES `salla` (`salla_id`) ON DELETE CASCADE;

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
