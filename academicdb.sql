-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Dec 06, 2021 at 10:25 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academicdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `form_name` varchar(255) DEFAULT NULL,
  `form_prototype` text COMMENT 'ตารางเก็บฟอร์มที่ Officer และ Chief สร้างขึ้น',
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `approval_email` text COMMENT 'เก็บอีเมลของผู้ที่ต้องอนุมัติคำร้อง'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table เอาไว้เก็บ form ที่ head officer และ officer สร้าง';

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report_title` varchar(255) NOT NULL,
  `report_detail` text NOT NULL,
  `report_state` enum('read','unread') NOT NULL,
  `report_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_title`, `report_detail`, `report_state`, `report_created`) VALUES
(1, 'โดนอาจารย์บุลลี่', 'โดนอาจารย์บุลลี่ในวิชาสมาธิ', 'read', '2021-12-02 00:01:42'),
(2, 'โดนอาจารย์บุลลี่fdgdfsgdfsg', 'โดนอาจารย์บุลลี่ในวิชาสมาธิdsfgdfsgd', 'read', '2021-12-02 21:42:55'),
(3, 'asdfsafadf', 'asdfsadfsadfsafsd', 'read', '2021-12-02 21:46:58'),
(4, 'asdfdsaf', 'dghfdhf', 'read', '2021-12-02 21:47:57'),
(5, 'asdfdaf', 'asdfasdfsdf551555', 'read', '2021-12-02 21:56:33'),
(6, 'asdfdaf', 'asdfasdfsdf551555', 'read', '2021-12-02 21:56:53'),
(7, 'agsdfgdfs', 'gdsfgdsfgdsfg', 'read', '2021-12-02 22:00:39'),
(8, 'agsdfgdfs', 'gdsfgdsfgdsfg', 'read', '2021-12-02 22:03:20'),
(9, 'ฟหกดหฟก', 'กด', 'unread', '2021-12-02 22:08:27'),
(10, 'หฟกดหฟกดฟดหฟกด', 'ฟหกดหฟกด', 'unread', '2021-12-02 22:23:00'),
(11, 'fdgdfsgdh', 'ffjghj', 'unread', '2021-12-02 22:24:02'),
(12, 'fdgdfsgdh', 'ffjghj', 'unread', '2021-12-02 22:24:10'),
(13, 'gdfsgh', 'fjgkhjkjk454', 'unread', '2021-12-02 22:25:43'),
(14, 'gdfsgh', 'fjgkhjkjk454', 'unread', '2021-12-02 22:31:50'),
(15, 'sadfhdfhgf', 'jgghj', 'unread', '2021-12-02 22:33:58'),
(16, 'sdfgfdhfj', 'khjkjkljk;', 'read', '2021-12-02 22:40:39');

-- --------------------------------------------------------

--
-- Table structure for table `submitforms`
--

CREATE TABLE `submitforms` (
  `id` int(11) NOT NULL,
  `form_value` text,
  `submit_date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `forms_id` int(11) NOT NULL,
  `submit_state` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trackings`
--

CREATE TABLE `trackings` (
  `idtracking` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `tracking_count` text,
  `tracking_status` text,
  `tracking_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table ที่ track เอกสารหรือรายงานที่ student ส่งว่าอยู่สถานะไหน';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('user','officer','chief','secretary','admin') NOT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `tel_num` varchar(10) DEFAULT NULL,
  `gender` enum('ชาย','หญิง') DEFAULT NULL,
  `registered` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `agency` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='เป็น Table ที่เก็บสมาชิกทุกคน(student,officer,head officer,super admin)';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `status`, `f_name`, `l_name`, `tel_num`, `gender`, `registered`, `last_login`, `agency`) VALUES
(1, 'chief@kmitl.ac.th', '$2b$10$cnvUyGs831sC.S107Bbxh.e9TuXNX5uYRiSDSlILGbo81dx3UYLRa', 'chief', 'กชกร', 'ไตรพจน์', NULL, NULL, '2021-12-01 06:23:35', '2021-12-02 18:44:58', 'kmitl'),
(2, 'user@kmitl.ac.th', '$2b$10$7E7lZENm/rnrX1cflXsFpeHlr9KL2uUwBFsAyxUd2Q2zzbpUTFZLW', 'user', 'ณัฐกิต', 'วงศ์สิง', '0856145522', 'ชาย', '2021-12-01 06:24:52', '2021-12-02 18:28:31', 'kmitl'),
(3, 'officer@kmitl.ac.th', '$2b$10$HIxiU23xveHK7oS57IJMeOmJVTSQWW28Z1QEyJF7gOwSDjjIb88Ga', 'officer', 'จิรัฐิติกาล', 'จันทร์แก้ว', NULL, NULL, '2021-12-01 06:28:05', '2021-12-02 18:44:04', 'kmitl'),
(4, 'secretary@kmitl.ac.th', '$2b$10$/aTHOASVRzmhskBp4T.EnOCQhgtnT9NS4akv810nMheZu1toRTZ4y', 'secretary', 'ชุติกาญจน์', 'แก้วมณี', NULL, NULL, '2021-12-01 06:29:22', '2021-12-02 18:47:52', 'kmitl'),
(5, 'admin@kmitl.ac.th', '$2b$10$NlXElY5HqXP9gmOc0hH61ulKUDpLf7FPtJdwfgvY9OV4hRDUXOfpG', 'admin', 'ณัฐชยุต', 'แสงโสรจสุข', NULL, NULL, '2021-12-01 06:29:57', '2021-12-02 18:52:10', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_submitforms_users1_idx` (`users_id`),
  ADD KEY `fk_submitforms_forms1_idx` (`forms_id`);

--
-- Indexes for table `trackings`
--
ALTER TABLE `trackings`
  ADD PRIMARY KEY (`idtracking`),
  ADD KEY `fk_tracking_form1_idx` (`form_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `submitforms`
--
ALTER TABLE `submitforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trackings`
--
ALTER TABLE `trackings`
  MODIFY `idtracking` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD CONSTRAINT `fk_submitforms_forms1` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_submitforms_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trackings`
--
ALTER TABLE `trackings`
  ADD CONSTRAINT `fk_tracking_form1` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
