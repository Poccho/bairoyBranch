-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 11:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cardealership`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `serialNumber` int(11) NOT NULL,
  `make` varchar(50) DEFAULT NULL,
  `year` date DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `salesPersonId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`serialNumber`, `make`, `year`, `model`, `type`, `salesPersonId`, `customerId`) VALUES
(1, 'Toyota', '2021-05-15', 'Corolla', 1, 1, 1),
(2, 'Honda', '2018-06-20', 'Civic', 0, 2, 2),
(3, 'Ford', '2020-03-10', 'Mustang', 1, 1, 3),
(4, 'Chevrolet', '2022-07-01', 'Camaro', 1, 3, 4),
(5, 'Nissan', '2019-11-10', 'Altima', 0, 4, 5),
(6, 'BMW', '2023-01-30', 'X5', 1, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `firstName`, `lastName`, `phoneNumber`, `email`) VALUES
(1, 'John', 'Doe', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', '555-123-4567', 'alice.johnson@example.com'),
(4, 'Robert', 'Williams', '321-654-9870', 'robert.williams@example.com'),
(5, 'Olivia', 'Moore', '111-222-3333', 'olivia.moore@example.com'),
(6, 'David', 'Taylor', '777-888-9999', 'david.taylor@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `totalAmount` int(11) DEFAULT NULL,
  `salesPersonId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `serialNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceId`, `date`, `totalAmount`, `salesPersonId`, `customerId`, `serialNumber`) VALUES
(1, '2023-10-01', 25000, 1, 1, 1),
(2, '2023-10-15', 18000, 2, 2, 2),
(3, '2023-11-05', 35000, 1, 3, 3),
(4, '2024-01-15', 35000, 3, 4, 4),
(5, '2024-01-20', 22000, 4, 5, 5),
(6, '2024-02-05', 45000, 3, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mechanic`
--

CREATE TABLE `mechanic` (
  `mechanicId` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanic`
--

INSERT INTO `mechanic` (`mechanicId`, `firstName`, `lastName`, `phoneNumber`, `email`) VALUES
(1, 'Jack', 'Miller', '333-444-5555', 'jack.miller@example.com'),
(2, 'Sophia', 'Taylor', '444-555-6666', 'sophia.taylor@example.com'),
(3, 'Mason', 'Wilson', '555-777-8888', 'mason.wilson@example.com'),
(4, 'Isabella', 'Lee', '888-777-6666', 'isabella.lee@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `partId` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `partName` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`partId`, `brand`, `partName`, `price`) VALUES
(1, 'Bosch', 'Oil Filter', 25.50),
(2, 'Michelin', 'Tire', 120.00),
(3, 'Brembo', 'Brake Pads', 75.00),
(4, 'K&N', 'Air Filter', 30.00),
(5, 'Bridgestone', 'Tire', 140.00),
(6, 'MagnaFlow', 'Exhaust System', 400.00);

-- --------------------------------------------------------

--
-- Table structure for table `salesperson`
--

CREATE TABLE `salesperson` (
  `salesPersonId` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesperson`
--

INSERT INTO `salesperson` (`salesPersonId`, `firstName`, `lastName`, `phoneNumber`, `email`) VALUES
(1, 'Michael', 'Brown', '222-333-4444', 'michael.brown@example.com'),
(2, 'Emily', 'Davis', '555-666-7777', 'emily.davis@example.com'),
(3, 'Lucas', 'Garcia', '666-777-8888', 'lucas.garcia@example.com'),
(4, 'Sophia', 'Martinez', '555-444-3333', 'sophia.martinez@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `servicehistory`
--

CREATE TABLE `servicehistory` (
  `serviceHistoryId` int(11) NOT NULL,
  `serviceTicketId` int(11) DEFAULT NULL,
  `serialNumber` int(11) DEFAULT NULL,
  `mechanicId` int(11) DEFAULT NULL,
  `partId` int(11) DEFAULT NULL,
  `laborCost` decimal(10,2) DEFAULT NULL,
  `totalCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servicehistory`
--

INSERT INTO `servicehistory` (`serviceHistoryId`, `serviceTicketId`, `serialNumber`, `mechanicId`, `partId`, `laborCost`, `totalCost`) VALUES
(1, 1, 1, 1, 1, 50.00, 75.50),
(2, 2, 2, 2, 2, 100.00, 220.00),
(3, 3, 3, 1, 3, 80.00, 155.00),
(4, 4, 4, 3, 4, 75.00, 105.00),
(5, 5, 5, 4, 5, 120.00, 260.00),
(6, 6, 6, 3, 6, 150.00, 550.00);

-- --------------------------------------------------------

--
-- Table structure for table `serviceticket`
--

CREATE TABLE `serviceticket` (
  `serviceTicketId` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `serialNumber` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serviceticket`
--

INSERT INTO `serviceticket` (`serviceTicketId`, `date`, `description`, `serialNumber`, `customerId`) VALUES
(1, '2023-12-01', 'Oil Change', 1, 1),
(2, '2023-12-10', 'Tire Replacement', 2, 2),
(3, '2023-12-20', 'Brake Inspection', 3, 3),
(4, '2024-02-01', 'Engine Tune-up', 4, 4),
(5, '2024-02-07', 'Transmission Check', 5, 5),
(6, '2024-02-10', 'Wheel Alignment', 6, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`serialNumber`),
  ADD KEY `salesPersonId` (`salesPersonId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `salesPersonId` (`salesPersonId`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `serialNumber` (`serialNumber`);

--
-- Indexes for table `mechanic`
--
ALTER TABLE `mechanic`
  ADD PRIMARY KEY (`mechanicId`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`partId`);

--
-- Indexes for table `salesperson`
--
ALTER TABLE `salesperson`
  ADD PRIMARY KEY (`salesPersonId`);

--
-- Indexes for table `servicehistory`
--
ALTER TABLE `servicehistory`
  ADD PRIMARY KEY (`serviceHistoryId`),
  ADD KEY `serviceTicketId` (`serviceTicketId`),
  ADD KEY `serialNumber` (`serialNumber`),
  ADD KEY `mechanicId` (`mechanicId`),
  ADD KEY `partId` (`partId`);

--
-- Indexes for table `serviceticket`
--
ALTER TABLE `serviceticket`
  ADD PRIMARY KEY (`serviceTicketId`),
  ADD KEY `serialNumber` (`serialNumber`),
  ADD KEY `customerId` (`customerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `serialNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mechanic`
--
ALTER TABLE `mechanic`
  MODIFY `mechanicId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `partId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `salesperson`
--
ALTER TABLE `salesperson`
  MODIFY `salesPersonId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `servicehistory`
--
ALTER TABLE `servicehistory`
  MODIFY `serviceHistoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `serviceticket`
--
ALTER TABLE `serviceticket`
  MODIFY `serviceTicketId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`salesPersonId`) REFERENCES `salesperson` (`salesPersonId`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`salesPersonId`) REFERENCES `salesperson` (`salesPersonId`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`serialNumber`) REFERENCES `car` (`serialNumber`);

--
-- Constraints for table `servicehistory`
--
ALTER TABLE `servicehistory`
  ADD CONSTRAINT `servicehistory_ibfk_1` FOREIGN KEY (`serviceTicketId`) REFERENCES `serviceticket` (`serviceTicketId`),
  ADD CONSTRAINT `servicehistory_ibfk_2` FOREIGN KEY (`serialNumber`) REFERENCES `car` (`serialNumber`),
  ADD CONSTRAINT `servicehistory_ibfk_3` FOREIGN KEY (`mechanicId`) REFERENCES `mechanic` (`mechanicId`),
  ADD CONSTRAINT `servicehistory_ibfk_4` FOREIGN KEY (`partId`) REFERENCES `parts` (`partId`);

--
-- Constraints for table `serviceticket`
--
ALTER TABLE `serviceticket`
  ADD CONSTRAINT `serviceticket_ibfk_1` FOREIGN KEY (`serialNumber`) REFERENCES `car` (`serialNumber`),
  ADD CONSTRAINT `serviceticket_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
