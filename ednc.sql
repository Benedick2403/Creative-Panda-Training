-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2025 at 10:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ednc`
--

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` int(11) NOT NULL,
  `crud_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `visible` tinyint(11) NOT NULL DEFAULT 1,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`id`, `crud_id`, `name`, `age`, `birthdate`, `visible`, `created`, `modified`) VALUES
(31, 125, 'HELLO WORLD', 0, '2025-06-03', 0, '2025-06-11 09:56:35', '2025-06-11 09:56:35'),
(32, 128, 'MELVIN RAMORAN', 0, '2025-06-03', 1, '2025-06-12 05:38:21', '2025-06-12 05:38:21'),
(33, 129, '123', 0, '2025-06-02', 1, '2025-06-12 05:40:51', '2025-06-12 05:40:51'),
(34, 130, 'HIHIHI', 0, '2025-06-02', 1, '2025-06-12 05:44:02', '2025-06-12 05:44:02'),
(35, 130, 'ASDASD', 0, '2025-06-02', 1, '2025-06-12 05:44:02', '2025-06-12 05:44:02'),
(36, 131, 'NELSON', 0, '2025-06-02', 1, '2025-06-12 05:49:36', '2025-06-12 05:49:36'),
(37, 132, '123', 0, '2025-06-02', 1, '2025-06-12 05:56:24', '2025-06-12 05:56:24'),
(38, 133, 'paldo', 0, '2025-06-02', 1, '2025-06-12 06:06:55', '2025-06-12 06:06:55'),
(39, 134, 'DDSA', 0, '2025-06-03', 0, '2025-06-12 06:12:39', '2025-06-12 06:12:39'),
(40, 135, '1232', 0, '2025-06-03', 1, '2025-06-12 06:17:30', '2025-06-12 06:17:30'),
(41, 136, '1232', 0, '2025-06-03', 0, '2025-06-12 06:17:30', '2025-06-12 06:17:30'),
(42, 141, 'asdas', 0, '2025-06-02', 1, '2025-06-13 00:59:42', '2025-06-13 00:59:42'),
(43, 142, 'asdas', 0, '2025-06-02', 1, '2025-06-13 00:59:42', '2025-06-13 00:59:42'),
(44, 146, 'hasjdgh', 0, '2025-06-03', 1, '2025-06-13 08:53:23', '2025-06-13 08:53:23'),
(45, 144, 'asdas', 0, '2025-06-01', 1, '2025-06-14 01:42:33', '2025-06-14 01:42:33'),
(46, 144, 'asdas', 0, '2025-06-02', 1, '2025-06-14 01:42:33', '2025-06-14 01:42:33'),
(47, 151, '123', 0, '2025-06-03', 1, '2025-06-14 02:27:44', '2025-06-14 02:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`id`, `name`) VALUES
(1, 'APPROVED'),
(2, 'DISAPPROVED'),
(3, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `cruds`
--

CREATE TABLE `cruds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `crudStatusID` int(11) DEFAULT NULL,
  `conditionId` int(11) DEFAULT 3,
  `charac` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cruds`
--

INSERT INTO `cruds` (`id`, `name`, `age`, `birthdate`, `email`, `crudStatusID`, `conditionId`, `charac`, `visible`, `created`, `modified`) VALUES
(123, 'hello', 0, '2025-06-01', 'hgasdg@gmail.com', 1, 3, 'asdasd', 0, '2025-06-11 16:57:34', '2025-06-12 11:04:16'),
(124, 'hihihi SAMple123', 0, '2025-06-02', 'lahsdkgH@gmail.com', 2, 1, 'asdasd', 1, '2025-06-11 17:44:21', '2025-06-11 17:44:21'),
(125, 'World', 0, '2025-06-02', 'World123@gmail.com', 2, 3, 'asdasd', 1, '2025-06-11 17:56:35', '2025-06-12 11:03:52'),
(126, 'SAMPLE123', 0, '2025-06-02', 'HELLOWORLD@GMAIL.COM', 1, 3, '23123123', 1, '2025-06-12 08:07:41', '2025-06-12 08:07:41'),
(127, 'sample789', 0, '2025-06-01', '123@GMAIL.COM', 2, 3, 'adasda', 1, '2025-06-12 08:37:05', '2025-06-12 08:37:05'),
(128, 'HELLO WORLD', 0, '2025-06-02', 'BENEDICK2403@GMAIL.COM', 1, 2, 'AWWEQWQWE', 1, '2025-06-12 13:38:21', '2025-06-12 13:38:21'),
(129, 'TOMMOROW', 0, '2025-06-02', '123@GMAIL.COM', 2, 3, '123', 1, '2025-06-12 13:40:51', '2025-06-12 13:40:51'),
(130, 'HELLO 123', 0, '2025-06-05', 'EMAIL@EMAIL.COM', 1, 3, '12312', 1, '2025-06-12 13:44:02', '2025-06-12 13:44:02'),
(131, 'MELVIN', 0, '2025-06-01', 'VINVIN@GMAIL.COM', 2, 2, '123', 1, '2025-06-12 13:49:36', '2025-06-12 13:49:36'),
(132, 'TRYTRY', 0, '2025-06-02', '1231@GMAIL.COM', 2, 3, '1231', 1, '2025-06-12 13:56:24', '2025-06-12 13:56:24'),
(133, 'Grow a Garden', 0, '2025-06-02', '123@gmail.com', 2, 3, '32123', 0, '2025-06-12 14:06:55', '2025-06-14 09:09:12'),
(134, 'HI', 0, '2025-06-02', '123@GMAIL.COM', 2, 2, '1232', 1, '2025-06-12 14:12:39', '2025-06-12 14:12:39'),
(135, 'aasdasd', 0, '2025-06-03', 'hjehjhw@gmail.com', 1, 3, '23123', 1, '2025-06-12 14:17:30', '2025-06-12 14:17:30'),
(136, 'aasdasd', 0, '2025-06-03', 'hjehjhw@gmail.com', 1, 3, '23123', 0, '2025-06-12 14:17:30', '2025-06-13 08:57:31'),
(137, 'Ben', 0, '2025-06-01', 'ashdg@gmail.com', 1, 3, '1231', 1, '2025-06-12 14:22:48', '2025-06-12 14:22:48'),
(138, 'Ben', 0, '2025-06-01', 'ashdg@gmail.com', 1, 3, '1231', 1, '2025-06-12 14:22:48', '2025-06-12 14:22:48'),
(139, 'cat', 0, '2025-06-01', '13jh@gmail.com', 2, 3, 'asdas', 1, '2025-06-12 14:23:11', '2025-06-12 14:23:11'),
(140, 'cat', 0, '2025-06-01', '13jh@gmail.com', 2, 3, 'asdas', 1, '2025-06-12 14:23:11', '2025-06-12 14:23:11'),
(141, 'helloooooWOOOORLLLD', 0, '2025-06-02', '1231@gmail.com', 2, 3, '123123', 0, '2025-06-13 08:59:42', '2025-06-13 09:03:24'),
(142, 'helloooooWOOOORLLLD', 0, '2025-06-02', '1231@gmail.com', 2, 3, '123123', 1, '2025-06-13 08:59:42', '2025-06-13 08:59:42'),
(143, '123', 0, '2025-06-02', '312@gmail.com', 2, 1, '213', 1, '2025-06-13 09:03:43', '2025-06-13 09:03:43'),
(144, '241', 0, '2025-06-02', '124@gmail.com', 1, 1, '13', 1, '2025-06-13 09:05:55', '2025-06-13 09:05:55'),
(145, 'SAMPLE ADDED', 0, '2025-06-02', 'BENEDIC@gmail.com', 5, 3, 'sdasdasd', 1, '2025-06-13 14:07:07', '2025-06-13 14:07:07'),
(146, 'jhagsdjgh', 0, '2025-06-02', '123@gmail.com', 2, 3, '123123', 1, '2025-06-13 16:53:23', '2025-06-13 16:53:23'),
(147, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, '2025-06-13 17:11:28', '2025-06-13 17:11:28'),
(148, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, '2025-06-13 17:11:55', '2025-06-13 17:11:55'),
(149, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, '2025-06-13 17:12:03', '2025-06-13 17:12:03'),
(150, 'uPLOAD TRY', 0, '2025-06-01', 'hASDBHSHBASDBH@gmail.com', 16, 3, 'agsasgasgasg', 1, '2025-06-14 09:40:11', '2025-06-14 09:40:11'),
(151, 'da', 0, '2025-06-01', '12@gmail.com', 2, 3, '123', 1, '2025-06-14 10:27:44', '2025-06-14 10:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `crud_files`
--

CREATE TABLE `crud_files` (
  `id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `visible` tinyint(11) NOT NULL DEFAULT 1,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crud_files`
--

INSERT INTO `crud_files` (`id`, `crud_id`, `file_name`, `file_path`, `visible`, `created`, `modified`) VALUES
(8, 124, 'FOR EMPLOYEE INFO.txt', 'uploads/1749635061_FOR EMPLOYEE INFO.txt', 1, '2025-06-11 17:44:21', '2025-06-11 17:44:21'),
(9, 124, 'my notes.txt', 'uploads/1749635061_my notes.txt', 1, '2025-06-11 17:44:21', '2025-06-11 17:44:21'),
(10, 125, 'INTERNSHIP PROGRAM ACTIVITY with YELLOW.pdf', 'uploads/1749635795_INTERNSHIP PROGRAM ACTIVITY with YELLOW.pdf', 0, '2025-06-11 17:56:35', '2025-06-11 17:56:35'),
(11, 125, 'INTERNSHIP PROGRAM ACTIVITY.pdf', 'uploads/1749635795_INTERNSHIP PROGRAM ACTIVITY.pdf', 0, '2025-06-11 17:56:35', '2025-06-11 17:56:35'),
(12, 127, 'OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 'uploads/1749688625_OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 1, '2025-06-12 08:37:05', '2025-06-12 08:37:05'),
(13, 127, 'OP01D_(JUNE 9, 2025)-DAILY REPORT.docx', 'uploads/1749688625_OP01D_(JUNE 9, 2025)-DAILY REPORT.docx', 1, '2025-06-12 08:37:05', '2025-06-12 08:37:05'),
(14, 127, 'my notes.txt', 'uploads/1749689230_my notes.txt', 1, '2025-06-12 08:47:10', '2025-06-12 08:47:10'),
(15, 127, 'june 06.txt', 'uploads/1749689254_june 06.txt', 1, '2025-06-12 08:47:34', '2025-06-12 08:47:34'),
(16, 127, 'FOR EMPLOYEE INFO.txt', 'uploads/1749689316_FOR EMPLOYEE INFO.txt', 1, '2025-06-12 08:48:36', '2025-06-12 08:48:36'),
(17, 124, 'INTERNSHIP PROGRAM ACTIVITY.pdf', 'uploads/1749689622_INTERNSHIP PROGRAM ACTIVITY.pdf', 1, '2025-06-12 08:53:42', '2025-06-12 08:53:42'),
(18, 124, 'INTERNSHIP PROGRAM ACTIVITY with YELLOW.pdf', 'uploads/1749689747_INTERNSHIP PROGRAM ACTIVITY with YELLOW.pdf', 1, '2025-06-12 08:55:47', '2025-06-12 08:55:47'),
(19, 124, 'OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 'uploads/1749690027_OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 1, '2025-06-12 09:00:27', '2025-06-12 09:00:27'),
(20, 124, 'OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 'uploads/1749690196_OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 1, '2025-06-12 09:03:16', '2025-06-12 09:03:16'),
(21, 125, 'my notes.txt', 'uploads/1749690333_my notes.txt', 0, '2025-06-12 09:05:33', '2025-06-12 09:05:33'),
(22, 125, 'OP01D_(JUNE 9, 2025)-DAILY REPORT.docx', 'uploads/1749690483_OP01D_(JUNE 9, 2025)-DAILY REPORT.docx', 1, '2025-06-12 09:08:03', '2025-06-12 09:08:03'),
(23, 125, 'OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 'uploads/1749690570_OP01D_(JUNE 06, 2024)-DAILY REPORT.pdf', 1, '2025-06-12 09:09:30', '2025-06-12 09:09:30'),
(24, 125, 'june 06.txt', 'uploads/1749690673_june 06.txt', 1, '2025-06-12 09:11:13', '2025-06-12 09:11:13'),
(25, 125, 'INTERNSHIP PROGRAM ACTIVITY with blue.pdf', 'uploads/1749691299_INTERNSHIP PROGRAM ACTIVITY with blue.pdf', 1, '2025-06-12 09:21:39', '2025-06-12 09:21:39'),
(26, 128, 'June 10.txt', 'uploads/1749706701_June 10.txt', 1, '2025-06-12 13:38:21', '2025-06-12 13:38:21'),
(27, 129, 'my notes.txt', 'uploads/1749706851_my notes.txt', 1, '2025-06-12 13:40:51', '2025-06-12 13:40:51'),
(28, 130, 'my notes.txt', 'uploads/1749707042_my notes.txt', 0, '2025-06-12 13:44:02', '2025-06-12 13:44:02'),
(29, 131, 'June 10.txt', 'uploads/1749707376_June 10.txt', 1, '2025-06-12 13:49:36', '2025-06-12 13:49:36'),
(30, 131, 'my notes.txt', 'uploads/1749707376_my notes.txt', 1, '2025-06-12 13:49:36', '2025-06-12 13:49:36'),
(31, 132, 'my notes.txt', 'uploads/1749707784_my notes.txt', 1, '2025-06-12 13:56:24', '2025-06-12 13:56:24'),
(32, 133, 'June 10.txt', 'uploads/1749708415_June 10.txt', 0, '2025-06-12 14:06:55', '2025-06-12 14:06:55'),
(33, 134, 'OP01D_(JUNE 9, 2025)-DAILY REPORT.docx', 'uploads/1749708759_OP01D_(JUNE 9, 2025)-DAILY REPORT.docx', 0, '2025-06-12 14:12:39', '2025-06-12 14:12:39'),
(34, 136, 'my notes.txt', 'uploads/1749709050_my notes.txt', 0, '2025-06-12 14:17:30', '2025-06-12 14:17:30'),
(35, 135, 'bugs.txt', 'uploads/1749776312_bugs.txt', 1, '2025-06-13 08:58:32', '2025-06-13 08:58:32'),
(36, 135, 'June 10.txt', 'uploads/1749776312_June 10.txt', 1, '2025-06-13 08:58:32', '2025-06-13 08:58:32'),
(37, 142, 'bugs.txt', 'uploads/1749776382_bugs.txt', 1, '2025-06-13 08:59:42', '2025-06-13 08:59:42'),
(38, 144, 'bugs.txt', 'uploads/1749776755_bugs.txt', 1, '2025-06-13 09:05:55', '2025-06-13 09:05:55'),
(39, 146, 'bugs.txt', 'uploads/1749804803_bugs.txt', 1, '2025-06-13 16:53:23', '2025-06-13 16:53:23'),
(40, 150, 'june 06.txt', 'uploads/1749865211_june 06.txt', 0, '2025-06-14 09:40:11', '2025-06-14 09:40:11'),
(41, 150, 'June 10.txt', 'uploads/1749865211_June 10.txt', 0, '2025-06-14 09:40:11', '2025-06-14 09:40:11'),
(42, 150, 'my notes.txt', 'uploads/1749865211_my notes.txt', 1, '2025-06-14 09:40:11', '2025-06-14 09:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `crud_statuses`
--

CREATE TABLE `crud_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `visible` tinyint(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crud_statuses`
--

INSERT INTO `crud_statuses` (`id`, `name`, `visible`) VALUES
(1, 'REG', 0),
(2, 'Project-Based', 1),
(5, 'HI', 0),
(6, 'Contractual', 0),
(7, 'SAMPLE 6', 0),
(8, 'SAMPLE 2', 0),
(9, 'SAMPLE 3', 0),
(10, 'SAMPLE 5', 0),
(11, 'SAMPLE 1', 0),
(12, 'SAMPLE 4', 0),
(13, 'HELLO WORLD', 0),
(14, 'HEllO', 0),
(15, 'sd', 0),
(16, 'SAMPLE 10', 0),
(17, 'Regular', 1),
(18, 'Admin', 1),
(19, 'Technical', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module`, `action`, `visible`, `created`, `modified`) VALUES
(1, 'customer-logs', 'index', 1, '2017-02-06 12:50:36', '2016-07-11 13:30:07'),
(2, 'customer-logs', 'add', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(3, 'customer-logs', 'edit', 1, '2017-02-06 12:50:36', '2016-07-11 13:29:42'),
(4, 'customer-logs', 'view', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(5, 'customer-logs', 'delete', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(6, 'members', 'index', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(7, 'members', 'add', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(8, 'members', 'edit', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(9, 'members', 'view', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(10, 'members', 'delete', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(11, 'share-capitals', 'index', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(12, 'share-capitals', 'delete', 1, '2017-02-06 12:50:36', '2016-07-12 08:16:04'),
(13, 'share-capitals', 'add', 1, '2017-02-06 12:50:36', '2016-07-12 08:15:52'),
(14, 'share-capitals', 'view', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(15, 'share-capitals', 'edit', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(16, 'membership-types', 'index', 1, NULL, NULL),
(17, 'membership-types', 'add', 1, NULL, NULL),
(18, 'membership-types', 'edit', 1, NULL, NULL),
(19, 'membership-types', 'delete', 1, NULL, NULL),
(20, 'loans', 'index', 1, '2016-07-11 13:06:22', '2016-07-11 13:06:22'),
(21, 'loans', 'add', 1, '2016-07-11 13:07:03', '2016-07-11 13:07:03'),
(22, 'loans', 'edit', 1, '2016-07-11 14:34:10', '2016-07-11 14:34:10'),
(23, 'loans', 'view', 1, '2016-07-12 08:08:54', '2016-07-12 08:08:54'),
(24, 'loans', 'delete', 1, '2016-07-12 08:13:52', '2016-07-12 08:13:52'),
(25, 'loans', 'close-account', 1, '2016-07-12 08:14:24', '2016-07-12 08:14:24'),
(26, 'loans', 'add-schedule', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(27, 'loans', 'add-payment', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(28, 'loan-types', 'add', 1, '2016-07-12 08:20:36', '2016-07-12 08:20:36'),
(29, 'loan-types', 'delete', 1, '2016-07-12 08:21:20', '2016-07-12 08:21:20'),
(30, 'loan-types', 'edit', 1, '2016-07-12 08:22:22', '2016-07-12 08:22:22'),
(31, 'loan-types', 'index', 1, '2016-07-12 08:23:09', '2016-07-12 08:23:09'),
(32, 'loan-fees', 'index', 1, '2016-07-12 08:24:21', '2016-07-12 08:24:21'),
(33, 'daily-payments', 'index', 1, '2016-07-12 08:25:03', '2016-07-12 08:25:03'),
(34, 'daily-payments', 'paid', 1, '2016-07-12 08:28:02', '2016-07-12 08:28:02'),
(35, 'payment-notifications', 'index', 1, '2016-07-12 08:29:11', '2016-07-12 08:29:11'),
(36, 'regular-savings', 'index', 1, '2017-01-25 09:45:46', '2017-01-25 09:45:46'),
(37, 'regular-savings', 'add', 1, '2017-01-25 09:45:57', '2017-01-25 09:45:57'),
(38, 'regular-savings', 'add-transaction', 1, '2017-01-25 09:47:59', '2017-01-25 09:47:59'),
(39, 'regular-savings', 'delete-transaction', 1, '2017-01-25 09:48:51', '2017-01-25 09:48:51'),
(40, 'regular-savings', 'view', 1, '2017-01-25 09:45:57', '2017-01-25 09:45:57'),
(41, 'regular-savings', 'delete-account', 1, '2017-01-25 09:48:51', '2017-01-25 09:48:51'),
(42, 'regular-savings', 'edit-transaction', 1, '2017-01-25 09:47:59', '2017-01-25 09:47:59'),
(43, 'payments', 'index', 1, NULL, NULL),
(44, 'payments', 'new-share-capital', 1, NULL, NULL),
(45, 'payments', 'add-deposit', 1, NULL, NULL),
(46, 'payments', 'view-deposit', 1, NULL, NULL),
(47, 'payments', 'add-loan-payment', 1, NULL, NULL),
(48, 'payments', 'view-loan-payment', 1, NULL, NULL),
(49, 'payments', 'remove-accounting-entry', 1, NULL, NULL),
(50, 'payments', 'add-accounting-entry', 1, NULL, NULL),
(51, 'payments', 'save', 1, NULL, NULL),
(52, 'backups', 'backup', 1, NULL, NULL),
(53, 'backups', 'delete', 1, NULL, NULL),
(251, 'inventory', 'index', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(252, 'inventory', 'view', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(253, 'inventory', 'add', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(254, 'inventory', 'edit', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(255, 'inventory', 'delete', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(261, 'inventory', 'sales', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(262, 'inventory', 'purchases', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(275, 'inventory', 'delete-inventory-items', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(276, 'inventory', 'edit-inventory-items', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(277, 'reports', 'loan-releases-report', 1, NULL, NULL),
(278, 'reports', 'loan-payments-report', 1, NULL, NULL),
(279, 'reports', 'dividends', 1, NULL, NULL),
(280, 'reports', 'patronage-refunds', 1, NULL, NULL),
(281, 'reports', 'savings-deposits-report', 1, NULL, NULL),
(282, 'reports', 'savings-withdrawals-report', 1, NULL, NULL),
(283, 'reports', 'share-capitals-report', 1, NULL, NULL),
(284, 'time-deposit-savings', 'index', 1, NULL, NULL),
(285, 'time-deposit-savings', 'view', 1, NULL, NULL),
(286, 'time-deposit-savings', 'delete-account', 1, NULL, NULL),
(287, 'time-deposit-savings', 'add', 1, NULL, NULL),
(288, 'time-deposit-savings', 'edit', 1, NULL, NULL),
(289, 'time-deposit-savings', 'add-transaction', 1, NULL, NULL),
(290, 'time-deposit-savings', 'delete-transaction', 1, NULL, '2017-10-11 14:04:12'),
(291, 'time-deposit-savings', 'edit-transaction', 1, NULL, '2017-10-11 14:04:22'),
(292, 'settings', 'add', 1, '2016-07-12 09:13:16', '2016-07-12 09:13:16'),
(293, 'settings', 'edit', 1, '2016-07-12 09:13:24', '2016-07-12 09:13:24'),
(294, 'settings', 'index', 1, '2016-07-12 09:13:33', '2016-07-12 09:13:33'),
(295, 'departments', 'add', 1, '2016-07-12 09:14:29', '2016-07-12 09:14:29'),
(296, 'departments', 'edit', 1, '2016-07-12 09:14:34', '2016-07-12 09:14:34'),
(297, 'departments', 'view', 1, '2016-07-12 09:14:42', '2016-07-12 09:14:42'),
(298, 'departments', 'delete', 1, '2016-07-12 09:14:58', '2016-07-12 09:14:58'),
(299, 'departments', 'index', 1, '2016-07-12 09:15:18', '2016-07-12 09:15:18'),
(300, 'income-factors', 'add', 1, '2016-07-12 09:15:54', '2016-07-12 09:15:54'),
(301, 'income-factors', 'edit', 1, '2016-07-12 09:16:03', '2016-07-12 09:16:03'),
(302, 'income-factors', 'index', 1, '2016-07-12 09:16:16', '2016-07-12 09:16:16'),
(303, 'permissions', 'edit', 1, '2016-07-12 09:18:33', '2016-07-12 09:18:33'),
(304, 'permissions', 'add', 1, '2016-07-12 09:19:18', '2016-07-12 09:19:18'),
(305, 'permissions', 'index', 1, '2016-07-12 09:19:24', '2016-07-12 09:19:24'),
(306, 'users', 'add', 1, '2016-07-12 09:19:42', '2016-07-12 09:19:42'),
(307, 'users', 'view', 1, '2016-07-12 09:19:48', '2016-07-12 09:19:48'),
(308, 'users', 'delete', 1, '2016-07-12 09:19:54', '2016-07-12 09:19:54'),
(309, 'users', 'edit', 1, '2016-07-12 09:20:01', '2016-07-12 09:20:01'),
(310, 'users', 'index', 1, '2016-07-12 09:20:08', '2016-07-12 09:20:08'),
(311, 'user-logs', 'index', 1, '2016-07-12 09:20:08', '2016-07-12 09:20:08'),
(312, 'users', 'add-permission', 1, '2016-08-05 14:54:26', '2016-08-05 14:54:26'),
(313, 'users', 'delete-permission', 1, '2016-08-05 14:54:37', '2016-08-05 14:54:37'),
(314, 'inventory-category', 'index', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(315, 'inventory-category', 'add', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(316, 'inventory-category', 'edit', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(317, 'inventory-category', 'delete', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(318, 'inventory-unit', 'index', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(319, 'inventory-unit', 'add', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(320, 'inventory-unit', 'edit', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(321, 'inventory-unit', 'delete', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(322, 'inventory-supplier', 'index', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(323, 'inventory-supplier', 'add', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(324, 'inventory-supplier', 'edit', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(325, 'inventory-supplier', 'delete', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(326, 'inventory-supplier', 'view', 1, '2017-02-06 12:50:36', '2017-02-06 12:50:36'),
(327, 'income-statements', 'search', 1, '2016-07-12 09:07:29', '2016-07-12 09:07:29'),
(328, 'income-statements', 'index', 1, '2016-07-12 09:07:22', '2016-07-12 09:07:22'),
(329, 'income-statements', 'print', 1, '2016-07-12 09:07:06', '2016-07-12 09:07:06'),
(330, 'balance-sheets', 'index', 1, '2016-07-12 09:06:44', '2016-07-12 09:06:44'),
(331, 'balance-sheets', 'advance search', 1, '2016-07-12 09:05:57', '2016-07-12 09:05:57'),
(332, 'balance-sheets', 'print', 1, '2016-07-12 09:05:47', '2016-07-12 09:05:47'),
(333, 'trial-balances', 'index', 1, '2016-07-12 09:01:55', '2016-07-12 09:01:55'),
(334, 'trial-balances', 'search', 1, '2016-07-12 09:01:45', '2016-07-12 09:01:45'),
(335, 'trial-balances', 'print', 1, '2016-07-12 09:01:33', '2016-07-12 09:01:33'),
(336, 'ledgers', 'index', 1, '2016-07-12 09:00:27', '2016-07-12 09:00:27'),
(337, 'ledgers', 'advance search', 1, '2016-07-12 09:00:15', '2016-07-12 09:00:15'),
(338, 'ledgers', 'print', 1, '2016-07-12 08:58:34', '2016-07-12 08:58:34'),
(339, 'ledgers', 'view', 1, '2016-07-12 08:58:20', '2016-07-12 08:58:20'),
(340, 'cash-books', 'index', 1, '2016-07-12 08:57:22', '2016-07-12 08:57:22'),
(341, 'cash-books', 'search', 1, '2016-07-12 08:57:10', '2016-07-12 08:57:10'),
(342, 'cash-books', 'print', 1, '2016-07-12 08:56:30', '2016-07-12 08:56:30'),
(343, 'accounting-entries', 'index', 1, '2016-07-12 08:56:06', '2016-07-12 08:56:06'),
(344, 'accounting-entries', 'print', 1, '2016-07-12 08:55:26', '2016-07-12 08:55:26'),
(345, 'accounting-entries', 'view', 1, '2016-07-12 08:55:07', '2016-07-12 08:55:07'),
(346, 'accounting-entries', 'delete', 1, '2016-07-12 08:54:58', '2016-07-12 08:54:58'),
(347, 'accounting-entries', 'edit', 1, '2016-07-12 08:54:50', '2016-07-12 08:54:50'),
(348, 'accounting-entries', 'TEST02', 1, '2016-07-12 08:54:41', '2016-07-12 08:54:41'),
(349, 'beginning-balances', 'index', 1, '2016-07-12 08:54:14', '2016-07-12 08:54:14'),
(350, 'beginning-balances', 'search', 1, '2016-07-12 08:54:05', '2016-07-12 08:54:05'),
(351, 'beginning-balances', 'filter', 1, '2016-07-12 08:53:35', '2016-07-12 08:53:35'),
(352, 'beginning-balances', 'delete', 1, '2016-07-12 08:53:25', '2016-07-12 08:53:25'),
(353, 'beginning-balances', 'edit', 1, '2016-07-12 08:53:18', '2016-07-12 08:53:18'),
(354, 'server', 'connect', 1, '2017-04-25 11:16:51', '2017-04-25 11:16:51'),
(355, 'front desk', 'add', 1, '2017-05-08 13:17:07', '2017-05-08 13:17:07'),
(356, 'loan-applications', 'view', 1, NULL, NULL),
(357, 'loan-applications', 'index', 1, NULL, NULL),
(358, 'loan-applications', 'delete', 1, NULL, NULL),
(359, 'loan-applications', 'add', 1, NULL, NULL),
(360, 'loan-applications', 'edit', 1, NULL, NULL),
(361, 'accounting-entries', 'ADD', 1, '2020-01-24 11:52:27', '2020-01-24 11:52:27'),
(362, 'settings', 'test', 1, '2020-02-24 09:14:01', '2020-02-24 09:14:01'),
(363, 'Settings', 'Test01', 1, '2020-02-24 09:17:36', '2020-02-24 09:17:36'),
(364, 'Front Desk', 'Exit', 1, '2020-02-29 16:41:49', '2020-02-29 16:41:49'),
(365, 'MAIN', 'ACTION', 1, '2020-03-09 19:21:38', '2020-03-09 19:21:38'),
(366, 'MEMBERS MANAGEMENT', 'INDEX101', 1, '2020-03-10 14:12:20', '2020-03-10 14:12:20'),
(367, 'main', 'main', 1, '2020-03-10 16:58:15', '2020-03-10 16:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `name`, `description`, `visible`, `created`, `modified`) VALUES
(1, 'superadmin', 'Superadmin', NULL, 1, NULL, NULL),
(2, 'admin', 'Administrator', NULL, 1, NULL, NULL),
(4, 'chairperson', 'Chairperson', NULL, 1, NULL, NULL),
(5, 'general manager', 'General Manager', NULL, 1, NULL, NULL),
(6, 'auditor client', 'Auditor (Client)', NULL, 1, NULL, NULL),
(7, 'loan officer', 'Loan Officer', NULL, 1, NULL, NULL),
(8, 'cashier', 'Cashier', NULL, 1, NULL, NULL),
(9, 'auditor company', 'Auditor (Company)', NULL, 1, NULL, NULL),
(10, 'officer', 'Officer', NULL, 1, NULL, NULL),
(11, 'user', 'User', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `code`, `name`, `value`, `visible`, `created`, `modified`) VALUES
(1, 'system_name', 'System Name', 'EDNC', 1, NULL, '2014-11-14 04:58:14'),
(2, 'address', 'Address', '', 1, NULL, '2014-10-23 04:21:38'),
(4, 'email', 'Email', NULL, 1, NULL, NULL),
(5, 'telephone', 'Telephone', NULL, 1, NULL, '2014-10-23 04:21:53'),
(6, 'fax', 'Fax', NULL, 1, NULL, NULL),
(7, 'chairman', 'Chairman', NULL, 1, NULL, '2015-10-15 08:59:54'),
(8, 'general_manager', 'General Manager', NULL, 1, NULL, NULL),
(12, 'system_title', 'System Title', NULL, 1, NULL, '2014-11-25 01:58:32'),
(13, 'active_year', 'Active Year', '2017', 1, '2014-11-25 00:00:00', '2017-03-23 01:26:23'),
(14, 'branch_name', 'Branch Name', NULL, 1, '2015-10-15 08:56:34', '2015-10-15 08:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `branchId` int(3) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `verified` tinyint(1) DEFAULT 0,
  `visible` tinyint(1) DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branchId`, `code`, `username`, `password`, `token`, `last_name`, `first_name`, `middle_name`, `gender`, `email`, `image`, `roleId`, `active`, `verified`, `visible`, `created`, `modified`) VALUES
(1, NULL, 'admin', 'admin', '0ec253be453a5b632905c1db7f3a5c0bb2970259', NULL, 'EDNC', 'ADMIN', NULL, NULL, NULL, NULL, 1, 1, 1, 1, '2015-12-05 21:04:59', '2017-03-28 14:34:40'),
(2, NULL, '', 'dev01', '7622ac86d61b3fe751f4a685195d35895cc0824f', NULL, '01', 'Dev', NULL, NULL, NULL, NULL, 2, 1, 1, 1, '2020-07-02 11:25:55', '2020-07-02 11:25:55'),
(3, NULL, '', 'samople', 'b4e25a01fffc4532413960f643a8ea673ed6f78e', NULL, 'Samople', 'Samople', NULL, NULL, NULL, NULL, 2, 1, 1, 1, '2020-07-02 13:20:52', '2020-07-02 13:20:52'),
(4, NULL, '', 'asd', 'aff738433ceaf169dffdef2b6aa0b1ad59e3a47f', NULL, 'Asd', 'Asd', NULL, NULL, NULL, NULL, 2, 1, 1, 1, '2020-07-02 13:24:24', '2020-07-02 13:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `remarks` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission_id`, `permission`, `date`, `amount`, `remarks`, `visible`, `created`, `modified`) VALUES
(1, 4, 1, 'customer-logs (index)', '2020-07-01', '1.00', 1, 1, '2020-07-02 13:24:24', '2020-07-02 13:24:24'),
(2, 4, 2, 'customer-logs (add)', '2020-07-02', '2.00', 2, 0, '2020-07-02 13:24:24', '2020-07-02 13:24:24'),
(3, 4, 3, 'customer-logs (edit)', '2020-07-03', '3.00', 3, 1, '2020-07-02 13:24:24', '2020-07-02 13:24:24'),
(4, 4, 4, 'customer-logs (view)', '2020-07-04', '4.00', 4, 0, '2020-07-02 13:24:24', '2020-07-02 13:24:24'),
(5, 2, 2, 'customer-logs (add)', '2025-06-06', '12.00', 21, 1, '2025-06-06 09:57:18', '2025-06-06 09:57:18'),
(6, 3, 4, 'customer-logs (view)', '2025-06-02', '123.00', 0, 1, '2025-06-13 08:40:46', '2025-06-13 08:40:46'),
(7, 2, 17, 'membership-types (add)', '2025-06-10', '123.00', 123, 1, '2025-06-13 08:41:04', '2025-06-13 08:41:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_beneficiaries_crud_id` (`crud_id`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cruds`
--
ALTER TABLE `cruds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_files`
--
ALTER TABLE `crud_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_statuses`
--
ALTER TABLE `crud_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cruds`
--
ALTER TABLE `cruds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `crud_files`
--
ALTER TABLE `crud_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `crud_statuses`
--
ALTER TABLE `crud_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD CONSTRAINT `fk_beneficiaries_crud_id` FOREIGN KEY (`crud_id`) REFERENCES `cruds` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
