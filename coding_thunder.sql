-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2020 at 12:14 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding_thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Sr_No` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone_Number` varchar(12) NOT NULL,
  `Message` varchar(120) NOT NULL,
  `Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`Sr_No`, `Name`, `Email`, `Phone_Number`, `Message`, `Date`) VALUES
(1, 'test post', 'tst@tst.com', '11111111', 'test', '2020-04-30 16:16:58'),
(2, 'Sourabh Diwan', 'sourabh.diwan@barclays.com', '9823400449', 'Danger Lover.. :)', '2020-04-30 18:43:30'),
(3, 'Mandar Sahaje', 'mandarsahaje@gmail.com', '9011020651', 'Hi Mandar here..', '2020-04-30 18:46:33'),
(4, 'Krishna Bhat', 'krishnaraj.bhat@barclays.com', '9552534339', 'Krish4 here', '2020-04-30 19:25:13'),
(5, 'Sumit Python', 'sumitsahaje.python@gmail.com', '9552534339', 'Hi Sumit Sahaje from Python..', '2020-05-01 10:55:22'),
(6, 'Prajakta Sahaje', 'sumitsahaje.python@gmail.com', '9552534339', 'Hi Prajakta Sahaje from Python...', '2020-05-01 10:57:40'),
(7, 'Mandar Sahaje', 'sumitsahaje.python@gmail.com', '9011020651', 'Isko bolte hai Manddar Sahaje..', '2020-05-01 11:00:18');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Sr_No` int(13) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Content` varchar(200) NOT NULL,
  `Slug` varchar(50) NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Sr_No`, `Title`, `Content`, `Slug`, `img_file`, `Date`) VALUES
(1, 'Sumit\'s Post', 'The mail or post is a system for physically transporting postcards, letters, and parcels.[1] A postal service can be private or public, though many governments place restrictions on private systems. S', 'first-post', 'post_img.jpg', '2020-05-01 11:17:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Sr_No`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Sr_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Sr_No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Sr_No` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
