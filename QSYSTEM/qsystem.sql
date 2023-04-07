-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2023 at 08:12 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_patient`
--

CREATE TABLE `tbl_patient` (
  `pid` varchar(13) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `pgender` varchar(10) NOT NULL,
  `pimage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_patient`
--

INSERT INTO `tbl_patient` (`pid`, `pname`, `pgender`, `pimage`) VALUES
('1705000000001', 'สมชาย รักเรียน', 'ชาย', 'lorem-face-4.jpg'),
('1705000000002', 'นาตยา สมหวัง', 'หญิง', 'lorem-face-1.jpg'),
('1705000000003', 'วรชาติ อยู่บุญ', 'ชาย', 'lorem-face-3.jpg'),
('1705000000004', 'กนกกร ดารา', 'หญิง', 'lorem-face-5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_queue`
--

CREATE TABLE `tbl_queue` (
  `qdate` date NOT NULL,
  `qnumber` int(5) NOT NULL,
  `pid` varchar(13) NOT NULL,
  `qstatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_queue`
--

INSERT INTO `tbl_queue` (`qdate`, `qnumber`, `pid`, `qstatus`) VALUES
('2023-04-03', 1, '1705000000001', 'รักษาเสร็จแล้ว'),
('2023-04-04', 1, '1705000000003', 'รักษาเสร็จแล้ว'),
('2023-04-05', 1, '1705000000001', 'รอเข้ารับการรักษา'),
('2023-04-03', 2, '1705000000002', 'รักษาเสร็จแล้ว'),
('2023-04-04', 2, '1705000000004', 'รักษาเสร็จแล้ว');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_patient`
--
ALTER TABLE `tbl_patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `tbl_queue`
--
ALTER TABLE `tbl_queue`
  ADD PRIMARY KEY (`qnumber`,`qdate`),
  ADD KEY `pid_ibfk` (`pid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_queue`
--
ALTER TABLE `tbl_queue`
  ADD CONSTRAINT `pid_ibfk` FOREIGN KEY (`pid`) REFERENCES `tbl_patient` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
