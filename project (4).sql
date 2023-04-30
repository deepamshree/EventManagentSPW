-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2018 at 11:02 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomer` ()  SELECT * FROM customer$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cake`
--

CREATE TABLE `cake` (
  `eventid` int(10) NOT NULL,
  `weight` int(10) NOT NULL,
  `type` varchar(25) NOT NULL,
  `flavour` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cake`
--

INSERT INTO `cake` (`eventid`, `weight`, `type`, `flavour`) VALUES
(1, 89, 'pasteries', 'nmsnx');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `eventid` int(20) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint(14) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`eventid`, `name`, `email`, `phone`, `gender`) VALUES
(1, 'maggi', 'maggi#@gmail.com', 9389392, 'male');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `delete_log` AFTER DELETE ON `customer` FOR EACH ROW INSERT INTO logs VALUES(null,old.name,old.eventid,'DELETED',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_log` AFTER INSERT ON `customer` FOR EACH ROW INSERT INTO logs VALUES(null,new.name,new.eventid,'INSERTED',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_log` AFTER UPDATE ON `customer` FOR EACH ROW INSERT INTO logs VALUES(null,new.name,new.eventid,'UPDATED',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE `decoration` (
  `decoid` int(5) NOT NULL,
  `deconame` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`decoid`, `deconame`) VALUES
(1, 'Simple Ballon Decoration'),
(2, 'Helium Ballon Decoration'),
(3, 'Ballon Arch Decoration'),
(4, 'Surprize Ballon Decoratio');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventid` int(10) NOT NULL,
  `decoid` int(10) NOT NULL,
  `venue` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `people` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventid`, `decoid`, `venue`, `date`, `people`) VALUES
(1, 1, 'mysire', '2018-12-22', 98);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `eventid` int(11) NOT NULL,
  `noofpeople` int(11) NOT NULL,
  `types` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`eventid`, `noofpeople`, `types`) VALUES
(1, 90, 'North-Indian');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `sl.no` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `eventid` int(11) NOT NULL,
  `action` varchar(25) NOT NULL,
  `c_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`sl.no`, `name`, `eventid`, `action`, `c_date`) VALUES
(1, 'ss', 17, 'inserted', '2018-12-05 23:54:19'),
(2, 'ss', 17, 'inserted', '2018-12-05 23:56:07'),
(3, 'dilli', 15, 'UPDATED', '2018-12-05 23:59:06'),
(4, 'DEEPA', 2, 'DELETED', '2018-12-05 23:59:26'),
(5, 'nikitha', 6, 'DELETED', '2018-12-05 23:59:32'),
(6, 'abcd', 7, 'DELETED', '2018-12-05 23:59:46'),
(7, 'DEEPA', 8, 'DELETED', '2018-12-05 23:59:53'),
(8, 'dilli', 15, 'DELETED', '2018-12-05 23:59:58'),
(9, 'ss', 17, 'DELETED', '2018-12-06 00:00:04'),
(10, 'dee', 18, 'INSERTED', '2018-12-06 00:02:32'),
(11, 'dee', 19, 'INSERTED', '2018-12-06 00:12:51'),
(12, 'dee', 18, 'DELETED', '2018-12-06 00:21:44'),
(13, 'dee', 19, 'DELETED', '2018-12-06 00:21:51'),
(14, 'maggi', 1, 'INSERTED', '2018-12-06 00:53:55'),
(15, 'deepa', 2, 'INSERTED', '2018-12-06 14:47:08'),
(16, 'deepashree', 2, 'UPDATED', '2018-12-06 14:48:39'),
(17, 'deepashree', 2, 'DELETED', '2018-12-06 14:49:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cake`
--
ALTER TABLE `cake`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`decoid`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventid`),
  ADD KEY `decoid` (`decoid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`eventid`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`sl.no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cake`
--
ALTER TABLE `cake`
  MODIFY `eventid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `eventid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `decoration`
--
ALTER TABLE `decoration`
  MODIFY `decoid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eventid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `eventid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `sl.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cake`
--
ALTER TABLE `cake`
  ADD CONSTRAINT `cake_ibfk_1` FOREIGN KEY (`eventid`) REFERENCES `customer` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`eventid`) REFERENCES `customer` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`eventid`) REFERENCES `customer` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
