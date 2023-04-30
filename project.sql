-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2023 at 08:50 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomer` ()   SELECT * FROM customer$$

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
(2, 5, 'pasteries', 'Caramel'),
(3, 5, 'pasteries', 'cadbury'),
(4, 2, 'pasteries', 'Choclate');

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
(2, '<script>alert(\\\"xss\\\")</script>', 'deepa@gmail.com', 101010100, 'female'),
(3, '9999999999', 'deepa@gmm', 0, 'male'),
(4, '9999999999', 'deepa@gmm', 11111111111111111, 'female'),
(5, 'project1', 'deepa@gmm', 123265565, 'male');

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
(2, 4, 'Dublin 0', '2023-05-03', 55),
(3, 3, 'Dublin 2', '2023-05-04', 54),
(4, 1, 'Dublin 1', '2023-05-04', 52);

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
(2, 500, 'North-Indian'),
(3, 54, 'North-Indian'),
(4, 0, 'North-Indian');

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
(19, '<script>alert(\\\"xss\\\")</s', 2, 'INSERTED', '2023-04-30 16:54:30'),
(20, '9999999999', 3, 'INSERTED', '2023-04-30 17:05:32'),
(21, '9999999999', 4, 'INSERTED', '2023-04-30 17:08:16'),
(22, 'project1', 5, 'INSERTED', '2023-04-30 17:10:58');

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
  MODIFY `eventid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `eventid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `decoration`
--
ALTER TABLE `decoration`
  MODIFY `decoid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eventid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `eventid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `sl.no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
