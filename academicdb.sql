-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Jan 30, 2022 at 02:03 PM
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
  `form_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อฟอร์ม',
  `form_specific` text COMMENT 'Column เก็บหัวข้อเฉพาะ',
  `created_date` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่สร้างฟอร์ม',
  `created_by` varchar(255) DEFAULT NULL COMMENT 'Column เก็บผู้ที่สร้างฟอร์ม',
  `approval_name` text COMMENT 'Column เก็บชื่อของผู้ที่ต้องอนุมัติคำร้อง',
  `form_status` enum('active','disable') DEFAULT NULL COMMENT 'Column เก็บสถานะของฟอร์ม(เปิดการกรอกฟอร์มหรือปิดการกรอกฟอร์ม)'
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
  `report_created` datetime NOT NULL COMMENT 'Column เก็บวันที่สร้างการร้องเรียน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submitforms`
--

CREATE TABLE `submitforms` (
  `id` int(11) NOT NULL,
  `form_value` text COMMENT 'Column เก็บข้อมูลจากข้อมูลเฉพาะ',
  `submit_date` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่ส่งคำร้อง',
  `forms_id` int(11) NOT NULL,
  `submit_state` varchar(45) DEFAULT NULL,
  `submit_by` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อผู้ส่งคำร้อง'
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
  `email` varchar(255) NOT NULL COMMENT 'Column เก็บ email ที่ใช้ในการเข้าสู่ระบบ',
  `password` varchar(255) NOT NULL COMMENT 'Column เก็บรหัสผ่านในการเข้าสู่ระบบ',
  `status` enum('user','officer','chief','secretary','admin') NOT NULL COMMENT 'Column เก็บสถานะของผู้ใช้งานในแต่ละบทบาท',
  `f_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อผู้ใช้งาน',
  `l_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บนามสกุลผู้ใช้งาน',
  `tel_num` varchar(10) DEFAULT NULL COMMENT 'Column เก็บเบอร์โทรผู้ใช้งาน',
  `gender` enum('ชาย','หญิง') DEFAULT NULL COMMENT 'Column เก็บเพศของผู้ใช้งาน',
  `address` text COMMENT 'Column เก็บที่อยู่ผู้ใช้งาน',
  `registered` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่ลงทะเบียน',
  `last_login` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่เข้าสู่ระบบครั้งล่าสุด',
  `agency` varchar(255) DEFAULT NULL COMMENT 'Column เก็บองค์กรหรือหน่วยงาน',
  `img` text COMMENT 'Column เก็บรูปผู้ใช้งาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='เป็น Table ที่เก็บสมาชิกทุกคน(student,officer,head officer,super admin)';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `status`, `f_name`, `l_name`, `tel_num`, `gender`, `address`, `registered`, `last_login`, `agency`, `img`) VALUES
(3, 'chief@kmitl.ac.th', '$2b$10$MUEOjWd/KX.XxZrwRnkzXOffLYHTUp3rTAPlO/3csGaXS/2PFVKxu', 'chief', NULL, NULL, NULL, NULL, NULL, '2022-01-29 13:19:51', '2022-01-29 16:38:32', 'kmitl', NULL),
(4, 'user@kmitl.ac.th', '$2b$10$8DnQ/YX1kDys9YF9xyiN6eOXoUA9lY3CIHcqeV6eiv1kSf2C6ZWbS', 'user', NULL, NULL, NULL, NULL, NULL, '2022-01-29 13:20:40', '2022-01-29 14:30:14', 'kmitl', NULL),
(5, 'officer@kmitl.ac.th', '$2b$10$5Nfbshr/0.VTrXfOBRmjoeSz3as6nu3kNtdOoEjXQ8PJcON0gR3Xa', 'officer', 'จิรัฐิติกาล', 'จันทร์แก้ว', NULL, NULL, NULL, '2022-01-29 13:22:25', '2022-01-29 16:07:55', 'kmitl', NULL),
(6, 'secretary@kmitl.ac.th', '$2b$10$JGdcKWLvo9tevtcAccjdAO84q6BTMh9ai5LI2pNDrf9u0TNerrdVq', 'secretary', NULL, NULL, NULL, NULL, NULL, '2022-01-29 13:22:55', NULL, 'kmitl', NULL),
(7, 'admin@kmitl.ac.th', '$2b$10$9z7ROeA1UUSr/Euqr3riXOxAFSqEUaNS.oFnwHGtBAYCeDZzoHuAG', 'admin', NULL, NULL, NULL, NULL, NULL, '2022-01-29 13:23:07', '2022-01-29 16:33:03', 'kmitl', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD CONSTRAINT `fk_submitforms_forms1` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trackings`
--
ALTER TABLE `trackings`
  ADD CONSTRAINT `fk_tracking_form1` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
