-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2026 at 10:11 PM
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

INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(1, 'Zendaya');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(2, 'Timothée Chalamet');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(3, 'Sam Worthington');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(4, 'Zoe Saldana');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(5, 'Chris Pratt');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(6, 'Anya Taylor-Joy');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(7, 'Cillian Murphy');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(8, 'Emily Blunt');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(9, 'Meryl Streep');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(10, 'Anne Hathaway');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(11, 'Samuel L. Jackson');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(12, 'Dwayne Johnson');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(13, 'Kevin Hart');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(14, 'Jennifer Lawrence');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(15, 'Margot Robbie');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(16, 'Ryan Gosling');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(17, 'Paul Mescal');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(18, 'Pedro Pascal');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(19, 'Joaquin Phillips');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(20, 'Christian Bale');
INSERT DELAYED IGNORE INTO `aktore` (`aktor_id`, `aktor_emri`) VALUES(21, 'Heath Ledger');

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

INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(1, 2);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(1, 1);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(5, 9);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(5, 10);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(6, 5);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(6, 11);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(7, 12);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(7, 13);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(9, 15);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(9, 16);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(10, 17);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(10, 18);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(2, 3);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(2, 4);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(3, 5);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(3, 6);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(4, 7);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(4, 8);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(8, 14);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(11, 19);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(12, 20);
INSERT DELAYED IGNORE INTO `aktori_filmi` (`filmi_id`, `aktor_id`) VALUES(12, 21);

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

INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(1, 1, 'Dune: Part Two', '02:46:00.000000', '2024', 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he must prevent a terrible future only he can foresee.', 'https://xl.movieposterdb.com/24_02/2024/15239678/xl_dune-part-two-movie-poster_18c5c05f.jpg', 'https://image.tmdb.org/t/p/original/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg', 1, NULL);
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(2, 2, 'Avatar: The Way of Water', '03:12:00.000000', '2022', 'Jake Sully and Neytiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora. When an ancient threat resurfaces, Jake must fight a difficult war against the humans.', 'https://xl.movieposterdb.com/23_01/2022/1630029/xl_avatar-the-way-of-water-movie-poster_c111a145.png', 'https://xl.movieposterdb.com/23_01/2022/1630029/xl_avatar-the-way-of-water-movie-poster_c111a145.png', 1, NULL);
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(3, 3, 'The Super Mario Bros.', '01:32:00.000000', '2023', 'While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported through a mysterious pipe to a magical new world. But when the siblings are separated, an epic adventure begins.', 'https://xl.movieposterdb.com/23_04/2023/6718170/xl_the-super-mario-bros-movie-movie-poster_c62032f8.jpg', 'https://xl.movieposterdb.com/25_03/2023/6718170/xl_the-super-mario-bros-movie-movie-poster_24de7c16.jpg', 1, NULL);
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(4, 4, 'Oppenheimer', '03:00:00.000000', '2023', 'During World War II, Lt. Gen. Leslie Groves Jr. appoints physicist J. Robert Oppenheimer to work on the top-secret Manhattan Project. Oppenheimer and a team of scientists spend years developing and designing the atomic bomb. Their work comes to fruition on July 16, 1945, as they witness the world\'s first nuclear explosion, forever changing the course of history.', 'https://xl.movieposterdb.com/23_06/2023/15398776/xl_oppenheimer-movie-poster_a83f1cbb.jpg', 'https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg', 1, NULL);
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(5, 6, 'The Devil Wears Prada 2', '01:50:00.000000', '2026', 'Miranda Priestly struggles against Emily Charlton, her former assistant turned rival executive, as they compete for advertising revenue amid declining print media, while Miranda nears retirement.', 'https://xl.movieposterdb.com/26_04/2026/33612209/xl_the-devil-wears-prada-2-movie-poster_6b73993b.jpg', NULL, 2, '2026-05-15');
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(6, 7, 'The Garfield Movie', '01:41:00.000000', '2024', 'After an unexpected reunion with his long-lost father, a scruffy street cat, Garfield is forced to leave his perfectly pampered life in order to take part in a high-stakes heist. And an incredible outdoor adventure begins!', 'https://xl.movieposterdb.com/24_03/2024/5779228/xl_the-garfield-movie-movie-poster_3ccdd455.jpg', NULL, 2, '2026-05-24');
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(7, 8, 'Central Intelligence', '01:47:00.000000', '2016', 'Accountant Calvin, who was the most popular boy at school, meets his ex-classmate, Bob, at a reunion. Little does he know that the meeting would wreak havoc in his quiet and peaceful life.', 'https://xl.movieposterdb.com/15_11/2016/1489889/xl_1489889_d65e6f4f.jpg', NULL, 2, '2026-06-10');
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(8, 9, 'No Hard Feelings', '01:43:00.000000', '2023', 'On the brink of losing her childhood home, a desperate woman agrees to date a wealthy couple\'s introverted and awkward 19-year-old son. However, he proves to be more of a challenge than she expected, and time is running out before she loses it all.', 'https://xl.movieposterdb.com/23_06/2023/15671028/xl_no-hard-feelings-movie-poster_0bca72a9.jpg', NULL, 2, '2026-06-18');
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(9, 10, 'Barbie', '01:54:00.000000', '2023', 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.', 'https://xl.movieposterdb.com/23_06/2023/1517268/xl_barbie-movie-poster_780f2c78.jpg', NULL, 2, '2026-07-02');
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(10, 11, 'Gladiator II', '02:30:00.000000', '2024', 'Years after witnessing the death of Maximus at the hands of his uncle, Lucius must enter the Colosseum after the powerful emperors of Rome conquer his home. With rage in his heart and the future of the empire at stake, he looks to the past to find the strength and honor needed to return the glory of Rome to its people.', 'https://xl.movieposterdb.com/24_08/2024/9218128/xl_gladiator-2-movie-poster_c8f77715.jpg', NULL, 2, '2026-07-22');
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(11, 5, 'Joker', '02:02:00.000000', '2019', 'Arthur Fleck, a party clown, leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak, he decides to embrace the life of crime and chaos.', 'https://xl.movieposterdb.com/21_04/2019/7286456/xl_7286456_f83eac6d.jpg', NULL, 1, NULL);
INSERT DELAYED IGNORE INTO `filmi` (`filmi_id`, `regjisor_id`, `titulli`, `kohezgjatja`, `data`, `pershkrimi`, `posteri`, `header_poster`, `status_id`, `data_kinema`) VALUES(12, 4, 'The Dark Knight', '02:56:00.000000', '2022', 'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.', 'https://xl.movieposterdb.com/24_06/2008/468569/xl_the-dark-knight-movie-poster_96214dbd.jpg', NULL, 1, NULL);

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

INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(1, 'Denis Villeneuve');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(2, 'James Cameron');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(3, 'Aaron Horvath');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(4, 'Christopher Nolan');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(5, 'Todd Phillips');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(6, 'David Frankel');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(7, 'Mark Dindal');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(8, 'Rawson Marshall Thurber');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(9, 'Gene Stupnitsky');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(10, 'Greta Gerwig');
INSERT DELAYED IGNORE INTO `regjisor` (`regjisor_id`, `regjisor_emri`) VALUES(11, 'Ridley Scott');

-- --------------------------------------------------------

--
-- Table structure for table `rezervimi`
--

CREATE TABLE `rezervimi` (
  `rezervimi_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `filmi_id` int(11) DEFAULT NULL,
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

INSERT DELAYED IGNORE INTO `statusi` (`status_id`, `status_emri`) VALUES(1, 'ne kinema');
INSERT DELAYED IGNORE INTO `statusi` (`status_id`, `status_emri`) VALUES(2, 'se shpejti');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','klient') DEFAULT 'klient',
  `krijuar_me` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT DELAYED IGNORE INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `krijuar_me`) VALUES(1, 'admin', 'admin@test.com', '12345678', 'admin', '2026-05-07 11:31:24');
INSERT DELAYED IGNORE INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `krijuar_me`) VALUES(2, 'klient', 'klient@test.com', '12345678', 'klient', '2026-05-07 11:39:22');

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

INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(0, 'Sci-Fi');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(1, 'Aksion');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(2, 'Aventure');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(3, 'Animacion');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(4, 'Komedi');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(5, 'Fantazi');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(6, 'Drame');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(7, 'Thriller');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(8, 'Biografi');
INSERT DELAYED IGNORE INTO `zhanri` (`zhanri_id`, `zhanri_emri`) VALUES(9, 'Krim');

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

INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(1, 0);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(1, 1);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(2, 0);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(2, 2);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(3, 3);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(3, 2);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(4, 8);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(4, 6);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(5, 4);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(5, 6);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(6, 3);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(6, 4);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(7, 1);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(7, 4);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(9, 4);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(9, 2);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(10, 1);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(10, 6);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(8, 4);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(11, 7);
INSERT DELAYED IGNORE INTO `zhanri_filmi` (`filmi_id`, `zhanri_id`) VALUES(11, 9);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `filmi_id` (`filmi_id`);

--
-- Indexes for table `rezervimi_vendi`
--
ALTER TABLE `rezervimi_vendi`
  ADD PRIMARY KEY (`rezervimi_id`,`vendi_id`),
  ADD KEY `vendi_id` (`vendi_id`);

--
-- Indexes for table `salla`
--
ALTER TABLE `salla`
  ADD PRIMARY KEY (`salla_id`);

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
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vendi`
--
ALTER TABLE `vendi`
  ADD PRIMARY KEY (`vendi_id`),
  ADD KEY `salla_id` (`salla_id`);

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
  MODIFY `filmi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `salla_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusi`
--
ALTER TABLE `statusi`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendi`
--
ALTER TABLE `vendi`
  MODIFY `vendi_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `rezervimi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rezervimi_ibfk_2` FOREIGN KEY (`filmi_id`) REFERENCES `filmi` (`filmi_id`) ON DELETE CASCADE;

--
-- Constraints for table `rezervimi_vendi`
--
ALTER TABLE `rezervimi_vendi`
  ADD CONSTRAINT `rezervimi_vendi_ibfk_1` FOREIGN KEY (`rezervimi_id`) REFERENCES `rezervimi` (`rezervimi_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rezervimi_vendi_ibfk_2` FOREIGN KEY (`vendi_id`) REFERENCES `vendi` (`vendi_id`) ON DELETE CASCADE;

--
-- Constraints for table `vendi`
--
ALTER TABLE `vendi`
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
