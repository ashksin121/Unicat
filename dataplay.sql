-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 18, 2019 at 11:22 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataplay`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(32) NOT NULL,
  `course_author` varchar(32) NOT NULL,
  `course_description` varchar(32) NOT NULL,
  `course_rating` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_author`, `course_description`, `course_rating`) VALUES
(1, 'Introduction to Statistics', 'Nishant Gupta', 'Desc1', '4.5'),
(2, 'Machine Learning', 'Nishant Gupta', 'Desc2', '4.5'),
(3, 'Deep Learning', 'Nishant Gupta', 'Desc3', '4.5'),
(4, 'Course 4', 'Auth4', 'Desc4', '4.5'),
(5, 'Course 5', 'Auth5', 'Desc5', '4.5');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE `enrolled` (
  `user_id` varchar(32) DEFAULT NULL,
  `course_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled`
--

INSERT INTO `enrolled` (`user_id`, `course_id`) VALUES
('1f3e84d29ce8e3fdad3d6867ba7b3c1b', 3),
('1f3e84d29ce8e3fdad3d6867ba7b3c1b', 4),
('317ab7c66326bf3690e9201998d05e6a', 2),
('317ab7c66326bf3690e9201998d05e6a', 3),
('317ab7c66326bf3690e9201998d05e6a', 4),
('a19359d19f56997f6b9e4b6abac2ca2d', 1),
('a19359d19f56997f6b9e4b6abac2ca2d', 3),
('d23f67088519c7660fe7c1740e2289f0', 1),
('d23f67088519c7660fe7c1740e2289f0', 2),
('d23f67088519c7660fe7c1740e2289f0', 4);

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE `registered` (
  `user_first_id` int(12) NOT NULL,
  `user_second_id` varchar(32) NOT NULL,
  `fname` varchar(32) NOT NULL,
  `sname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered`
--

INSERT INTO `registered` (`user_first_id`, `user_second_id`, `fname`, `sname`, `email`, `password`) VALUES
(1, 'a19359d19f56997f6b9e4b6abac2ca2d', 'Kaus', 'Pathak', 'kaus.pathak@gmail.com', '76c430e61c7451d25d214f0367593bb464e5010db6ee79e81122df60f8947b03'),
(2, 'd23f67088519c7660fe7c1740e2289f0', 'Ashish', 'Singh', 'ashksin121@gmail.com', '65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5'),
(3, '1f3e84d29ce8e3fdad3d6867ba7b3c1b', 'Demo', 'Demo', 'demo@demo.com', '2a97516c354b68848cdbd8f54a226a0a55b21ed138e207ad6c5cbb9c00aa5aea'),
(4, '317ab7c66326bf3690e9201998d05e6a', 'Test', 'Test', 'test@test.com', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD UNIQUE KEY `user_id` (`user_id`,`course_id`);

--
-- Indexes for table `registered`
--
ALTER TABLE `registered`
  ADD PRIMARY KEY (`user_first_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registered`
--
ALTER TABLE `registered`
  MODIFY `user_first_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
