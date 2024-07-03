-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 09:41 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zone`
--
CREATE DATABASE `zone`;
USE `zone`;

-- --------------------------------------------------------

--
-- Table structure for table `paper`
--

CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL,
  `paper_number` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `semester` enum('1st','2nd','3rd','4th') DEFAULT NULL,
  `academic_year` int(11) NOT NULL,
  `type` enum('elective','compulsory') DEFAULT NULL,
  `syllabus` mediumblob DEFAULT NULL,
  `theory_practical` enum('theory','practical') DEFAULT 'theory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paper_setter`
--

CREATE TABLE `paper_setter` (
  `setter_id` int(11) NOT NULL,
  `title` enum('Mr.','Mrs.','Ms.','Dr.','Prof.') NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `designation` enum('Professor','Associate Professor','Assistant Professor') NOT NULL,
  `mobile_no` char(10) NOT NULL,
  `organization` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paper_setter`
--

INSERT INTO `paper_setter` (`setter_id`, `title`, `first_name`, `last_name`, `designation`, `mobile_no`, `organization`) VALUES
(2, 'Dr.', 'Amiya Kumar', 'Sahoo', 'Professor', '6456487897', 'Sambalpur University'),
(8, 'Mr.', 'Niranjan', 'Bara', 'Assistant Professor', '8984501468', 'Sambalpur University');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `paper_number` varchar(255) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `setter_id` int(11) NOT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_return` date DEFAULT NULL,
  `bill_amount` int(11) DEFAULT 0,
  `bill` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `script`
--

CREATE TABLE `script` (
  `paper_number` varchar(255) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `num_answer_script` int(11) DEFAULT NULL,
  `code_no` varchar(255) DEFAULT NULL,
  `date_of_receive` date DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_return` date DEFAULT NULL,
  `issued_from` varchar(255) DEFAULT NULL,
  `issued_to` varchar(255) DEFAULT NULL,
  `mobile_no` char(10) DEFAULT NULL,
  `bill_amount` int(11) DEFAULT NULL,
  `to_memo` mediumblob DEFAULT NULL,
  `received_memo` mediumblob DEFAULT NULL,
  `bill` mediumblob DEFAULT NULL,
  `from_memo` mediumblob DEFAULT NULL,
  `issue_to_address` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','examiner','clerk') DEFAULT 'examiner'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'nbara', '$2y$10$WKoft4F7RQfNJCk.TVx6geCfNO4ZcXRPzU.EXHVcZ6AYvOUTa1MVy', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `paper`
--
ALTER TABLE `paper`
  ADD PRIMARY KEY (`paper_number`,`academic_year`,`paper_id`) USING BTREE,
  ADD UNIQUE KEY `paper_id` (`paper_id`);

--
-- Indexes for table `paper_setter`
--
ALTER TABLE `paper_setter`
  ADD PRIMARY KEY (`setter_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`paper_number`,`academic_year`) USING BTREE,
  ADD KEY `question_ibfk_2` (`setter_id`);

--
-- Indexes for table `script`
--
ALTER TABLE `script`
  ADD PRIMARY KEY (`paper_number`,`academic_year`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `paper`
--
ALTER TABLE `paper`
  MODIFY `paper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paper_setter`
--
ALTER TABLE `paper_setter`
  MODIFY `setter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`paper_number`,`academic_year`) REFERENCES `paper` (`paper_number`, `academic_year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`setter_id`) REFERENCES `paper_setter` (`setter_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `script`
--
ALTER TABLE `script`
  ADD CONSTRAINT `script_ibfk_1` FOREIGN KEY (`paper_number`,`academic_year`) REFERENCES `paper` (`paper_number`, `academic_year`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
