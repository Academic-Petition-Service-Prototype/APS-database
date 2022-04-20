-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Apr 20, 2022 at 04:42 AM
-- Server version: 5.7.37
-- PHP Version: 8.0.15

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
  `agency_id` int(3) NOT NULL,
  `agency_name` varchar(255) NOT NULL COMMENT 'Column เก็บชื่อองค์กรหรือหน่วยงาน',
  `agency_created` datetime NOT NULL COMMENT 'Column เก็บวันที่สร้างองค์กรหรือหน่วยงาน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`agency_id`, `agency_name`, `agency_created`) VALUES
(1, 'admin', '2022-02-13 07:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `form_id` int(5) NOT NULL,
  `form_name` varchar(255) DEFAULT NULL COMMENT 'Column เก็บชื่อคำร้อง',
  `form_specific` text COMMENT 'Column เก็บหัวข้อเฉพาะคำร้อง',
  `created_date` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่สร้างคำร้อง',
  `approval_name` text COMMENT 'Column เก็บชื่อของผู้ที่ต้องอนุมัติคำร้อง',
  `form_status` tinyint(1) DEFAULT NULL COMMENT 'Column เก็บสถานะของคำร้อง(เปิดการกรอกคำร้องหรือปิดการกรอกคำร้อง)',
  `form_detail` text COMMENT 'Column เก็บรายละเอียดของคำร้อง',
  `users_id` int(6) NOT NULL,
  `tags_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table เอาไว้เก็บ form ที่ head officer และ officer สร้าง';

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(5) NOT NULL,
  `report_title` varchar(255) NOT NULL COMMENT 'Column เก็บหัวข้อการร้องเรียน',
  `report_detail` text NOT NULL COMMENT 'Column เก็บรายละเอียดการร้องเรียน',
  `report_state` enum('read','unread') NOT NULL COMMENT 'Column เก็บสถานะการร้องเรียน',
  `report_created` datetime NOT NULL COMMENT 'Column เก็บวันที่สร้างการร้องเรียน',
  `report_occur` datetime NOT NULL COMMENT 'Column เก็บวันที่เกิดเหตุการณ์',
  `users_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `request_id` int(5) NOT NULL,
  `request_title` varchar(255) NOT NULL COMMENT 'Column เก็บหัวเรื่องการร้องขอคำร้องที่ไม่มีในระบบ',
  `request_detail` text NOT NULL COMMENT 'Column เก็บรายละเอียดเหตุผลการร้องขอคำร้องที่ไม่มีในระบบ',
  `request_state` enum('read','unread') NOT NULL COMMENT 'Column เก็บสถานะการการร้องขอคำร้องที่ไม่มีในระบบ',
  `request_created` datetime NOT NULL COMMENT 'Column เก็บวันที่สร้างการร้องขอคำร้องที่ไม่มีในระบบ',
  `users_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submitforms`
--

CREATE TABLE `submitforms` (
  `submit_id` int(9) NOT NULL,
  `form_value` text COMMENT 'Column เก็บข้อมูลจากข้อมูลเฉพาะ',
  `submit_date` datetime DEFAULT NULL COMMENT 'Column เก็บวันที่ส่งคำร้อง',
  `submit_state` int(2) DEFAULT NULL,
  `approval_order` text,
  `submit_refuse` text,
  `users_id` int(6) NOT NULL,
  `forms_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(3) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_created` datetime NOT NULL,
  `agencies_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
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
  `agencies_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='เป็น Table ที่เก็บสมาชิกทุกคน(student,officer,head officer,super admin)';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `role`, `f_name`, `l_name`, `tel_num`, `gender`, `address`, `registered`, `last_login`, `img`, `agencies_id`) VALUES
(1, 'admin@gmail.com', '$2b$10$HKwUVwKWmVi2fEF5VTJ8Ueny8auQXgs21qE7PfUJ1rdHgyhAHmWKe', 'admin', 'วรกร', 'คงมั่น', '0857256321', 'ชาย', ' เลขที่ 989 อาคารสยามพิวรรธน์ทาวเวอร์ ชั้นที่ 9 ถนนพระราม 1 แขวงปทุมวัน เขตปทุมวัน', '2022-04-20 03:41:06', '2022-04-20 04:00:43', '165042606598899.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`form_id`,`users_id`),
  ADD KEY `fk_forms_users1_idx` (`users_id`),
  ADD KEY `fk_forms_tags1_idx` (`tags_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_reports_users1_idx` (`users_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_request_users1_idx` (`users_id`);

--
-- Indexes for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD PRIMARY KEY (`submit_id`,`users_id`,`forms_id`),
  ADD KEY `fk_submitforms_users1_idx` (`users_id`),
  ADD KEY `fk_submitforms_forms1_idx` (`forms_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`,`agencies_id`),
  ADD KEY `fk_tags_agency1_idx` (`agencies_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_agency1_idx` (`agencies_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `form_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submitforms`
--
ALTER TABLE `submitforms`
  MODIFY `submit_id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `fk_forms_tags1` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_forms_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `fk_request_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submitforms`
--
ALTER TABLE `submitforms`
  ADD CONSTRAINT `fk_submitforms_forms1` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_submitforms_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_tags_agency1` FOREIGN KEY (`agencies_id`) REFERENCES `agency` (`agency_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_agency1` FOREIGN KEY (`agencies_id`) REFERENCES `agency` (`agency_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
