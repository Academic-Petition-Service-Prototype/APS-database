-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Feb 13, 2022 at 05:43 PM
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
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `id` int(11) NOT NULL,
  `agency_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อองค์กรหรือหน่วยงาน',
  `agency_created` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่สร้างองค์กรหรือหน่วยงาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `agency_name`, `agency_created`) VALUES
(1, 'kmitl', '2022-02-13 07:26:15'),
(2, 'admin', '2022-02-13 07:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `form_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อฟอร์ม',
  `form_specific` text COMMENT 'Column เก็บหัวข้อเฉพาะ',
  `created_date` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่สร้างฟอร์ม',
  `approval_name` text COMMENT 'Column เก็บชื่อของผู้ที่ต้องอนุมัติคำร้อง',
  `form_status` enum('active','disable') DEFAULT NULL COMMENT 'Column เก็บสถานะของฟอร์ม(เปิดการกรอกฟอร์มหรือปิดการกรอกฟอร์ม)',
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table เอาไว้เก็บ form ที่ head officer และ officer สร้าง';

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report_title` varchar(255) NOT NULL COMMENT 'Column เก็บหัวข้อการร้องเรียน',
  `report_detail` text NOT NULL COMMENT 'Column เก็บรายละเอียดการร้องเรียน',
  `report_state` enum('read','unread') NOT NULL COMMENT 'Column เก็บสถานะการร้องเรียน',
  `report_created` datetime NOT NULL COMMENT 'Column เก็บวันที่สร้างการร้องเรียน',
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_title`, `report_detail`, `report_state`, `report_created`, `users_id`) VALUES
(1, 'โดนอาจารย์บุลลี่', 'โดนอาจารย์บุลลี่ในวิชาสมาธิ', 'unread', '2022-02-14 00:38:08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `submitforms`
--

CREATE TABLE `submitforms` (
  `id` int(11) NOT NULL,
  `form_value` text COMMENT 'Column เก็บข้อมูลจากข้อมูลเฉพาะ',
  `submit_date` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่ส่งคำร้อง',
  `submit_state` varchar(5) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `forms_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'Column เก็บ email ที่ใช้ในการเข้าสู่ระบบ',
  `password` varchar(255) NOT NULL COMMENT 'Column เก็บรหัสผ่านในการเข้าสู่ระบบ',
  `role` enum('user','officer','chief','secretary','admin') NOT NULL COMMENT 'Column เก็บสถานะของผู้ใช้งานในแต่ละบทบาท',
  `f_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อผู้ใช้งาน',
  `l_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บนามสกุลผู้ใช้งาน',
  `tel_num` varchar(10) DEFAULT NULL COMMENT 'Column เก็บเบอร์โทรผู้ใช้งาน',
  `gender` enum('ชาย','หญิง') DEFAULT NULL COMMENT 'Column เก็บเพศของผู้ใช้งาน',
  `address` text COMMENT 'Column เก็บที่อยู่ผู้ใช้งาน',
  `registered` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่ลงทะเบียน',
  `last_login` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่เข้าสู่ระบบครั้งล่าสุด',
  `img` text COMMENT 'Column เก็บรูปผู้ใช้งาน',
  `agency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='เป็น Table ที่เก็บสมาชิกทุกคน(student,officer,head officer,super admin)';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `f_name`, `l_name`, `tel_num`, `gender`, `address`, `registered`, `last_login`, `img`, `agency_id`) VALUES
(1, 'chief@kmitl.ac.th', '$2b$10$4YdedPnm6i6kGWDASqyc2uhG18vCuUh/ftg3wj2aprdQy4blLXq.C', 'chief', 'กชกร', 'ไตรพจน์', NULL, NULL, NULL, '2022-02-13 08:54:47', '2022-02-13 17:31:53', NULL, 1),
(2, 'user@kmitl.ac.th', '$2b$10$kujdoK6qzV5.JBR5wWCgYOepVpVHzjl4NyYLaq6/e7uFd8AV1yl2O', 'user', 'ณัฐกิต', 'วงศ์สิง', NULL, NULL, NULL, '2022-02-13 17:13:00', '2022-02-13 17:22:18', NULL, 1),
(3, 'officer@kmitl.ac.th', '$2b$10$L0SC07/FEjEIK.RoSIBP4.OeNuWkhQq59iPyLFImw.1ib9hpclkfm', 'officer', 'จิรัฐิติกาล', 'จันทร์แก้ว', NULL, NULL, NULL, '2022-02-13 17:13:25', '2022-02-13 17:26:44', NULL, 1),
(4, 'secretary@kmitl.ac.th', '$2b$10$Fc8r06MayQ3/S00MkQ8VFOdKjHtG5HHMU0pyr9/2nnuY600cTW/gW', 'secretary', 'ชุติกาญจน์', 'แก้วมณี', NULL, NULL, NULL, '2022-02-13 17:13:51', '2022-02-13 17:27:34', NULL, 1),
(5, 'admin@kmitl.ac.th', '$2b$10$etQjZe6s2dtKndZ163yG5Oxd2oeNw5Ak7fM0E3Z.sClxGkJfKjJCC', 'admin', 'ณัฐชยุต', 'แสงโสรจสุข', NULL, NULL, NULL, '2022-02-13 17:14:17', '2022-02-13 17:31:11', NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_forms_users1_idx` (`users_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reports_users1_idx` (`users_id`);

--
-- Indexes for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD PRIMARY KEY (`id`,`users_id`,`forms_id`),
  ADD KEY `fk_submitforms_users1_idx` (`users_id`),
  ADD KEY `fk_submitforms_forms1_idx` (`forms_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_agency1_idx` (`agency_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `submitforms`
--
ALTER TABLE `submitforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `fk_forms_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD CONSTRAINT `fk_submitforms_forms1` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_submitforms_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_agency1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
