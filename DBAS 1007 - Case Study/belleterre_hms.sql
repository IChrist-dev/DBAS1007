-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2022 at 07:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belleterre_hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_doctors`
--

CREATE TABLE `all_doctors` (
  `docID` varchar(20) NOT NULL,
  `deptID` int(11) NOT NULL
) ;

--
-- Dumping data for table `all_doctors`
--

INSERT INTO `all_doctors` (`docID`, `deptID`) VALUES
('DR12', 1),
('DC34', 2),
('DC89', 2),
('DC88', 3),
('DR41', 4),
('DR54', 4);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `deptID` int(11) NOT NULL,
  `deptName` varchar(50) NOT NULL,
  `deptLocation` varchar(50) NOT NULL,
  `deptDesc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptID`, `deptName`, `deptLocation`, `deptDesc`) VALUES
(1, 'Emergency', 'Meyer Building', 'Urgent care patient intake'),
(2, 'Oncology', 'Hawthorn Building', 'Cancer treatment and research'),
(3, 'Maternity', 'Meyer Building', 'Pediactric care'),
(4, 'Neurology', 'Coburg Building', 'Treatment of brain related issues'),
(5, 'Administration', 'Lawrence-Wright Building', 'Staff services and management');

-- --------------------------------------------------------

--
-- Table structure for table `doc_on_call`
--

CREATE TABLE `doc_on_call` (
  `docID` varchar(20) NOT NULL,
  `docName` varchar(50) NOT NULL,
  `docQualID` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phoneCell` varchar(15) NOT NULL,
  `phoneHome` varchar(15) NOT NULL,
  `phonePref` varchar(1) NOT NULL,
  `feePerCall` decimal(6,2) NOT NULL,
  `paymentDue` decimal(8,2) DEFAULT NULL,
  `email` varchar(50) NOT NULL
) ;

--
-- Dumping data for table `doc_on_call`
--

INSERT INTO `doc_on_call` (`docID`, `docName`, `docQualID`, `address`, `phoneCell`, `phoneHome`, `phonePref`, `feePerCall`, `paymentDue`, `email`) VALUES
('DC34', 'Carl Schofield', 7, '78 Bard Way', '221-7834', '4891238', 'C', '28.99', '115.96', 'cschofield@cloudside.com'),
('DC88', 'Sam Michaelson', 5, '235 Oakline Ave', '951-235-5842', '8153475', 'C', '15.87', '31.74', 'smichaelson@cloudside.com'),
('DC89', 'Dr. Bonnie Avery', 8, '164 Quinn Street', '409-1555', '8889844251', 'H', '88.95', NULL, 'bavery@cloudside.com');

-- --------------------------------------------------------

--
-- Table structure for table `doc_qualification`
--

CREATE TABLE `doc_qualification` (
  `docQualID` int(11) NOT NULL,
  `levelName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_qualification`
--

INSERT INTO `doc_qualification` (`docQualID`, `levelName`) VALUES
(1, 'Medical Student'),
(2, 'Intern'),
(3, 'Fellow'),
(4, 'Department Head'),
(5, 'Junior Resident'),
(6, 'Senior Resident'),
(7, 'Chief Resident'),
(8, 'Attending Physician'),
(9, 'Medical Director');

-- --------------------------------------------------------

--
-- Table structure for table `doc_reg`
--

CREATE TABLE `doc_reg` (
  `docID` varchar(20) NOT NULL,
  `docName` varchar(50) NOT NULL,
  `docQualID` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `salary` decimal(9,2) NOT NULL,
  `joinDate` date NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doc_reg`
--

INSERT INTO `doc_reg` (`docID`, `docName`, `docQualID`, `address`, `city`, `phone`, `salary`, `joinDate`, `email`) VALUES
('DR12', 'Dr. Harrison Ford', 8, '782 Stoneybrook Road', 'Belleterre', '455-848-3993', '225000.00', '1999-08-14', 'hford@cloudside.com'),
('DR41', 'Butch Cassidy', 3, '85 Boyle Street', 'Belleterre', '455-855-3989', '65000.00', '2018-02-17', 'bcassidy@cloudside.com'),
('DR54', 'Dr. Jebediah Schrume', 6, '7820 Queen Street', 'Belleterre', '455-348-4896', '120000.00', '2015-09-02', 'jschrume@cloudside.com');

-- --------------------------------------------------------

--
-- Table structure for table `op_theatre`
--

CREATE TABLE `op_theatre` (
  `opTheatreID` int(11) NOT NULL,
  `deptID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `op_theatre`
--

INSERT INTO `op_theatre` (`opTheatreID`, `deptID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 4),
(9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pat_admit`
--

CREATE TABLE `pat_admit` (
  `patID` varchar(20) NOT NULL,
  `advancePay` decimal(8,2) DEFAULT NULL,
  `modePay` varchar(20) DEFAULT NULL,
  `roomNum` int(11) NOT NULL,
  `deptID` int(11) NOT NULL,
  `dateAdmit` date NOT NULL,
  `initialCondition` varchar(50) NOT NULL,
  `diagnosis` varchar(50) DEFAULT NULL,
  `treatment` varchar(50) DEFAULT NULL,
  `treatDocID` varchar(20) DEFAULT NULL,
  `nurseName` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `pat_admit`
--

INSERT INTO `pat_admit` (`patID`, `advancePay`, `modePay`, `roomNum`, `deptID`, `dateAdmit`, `initialCondition`, `diagnosis`, `treatment`, `treatDocID`, `nurseName`) VALUES
('PT669', NULL, 'deferred', 46, 2, '2022-10-03', 'priority', 'Non-Hodgkins Lymphoma', 'Intralesional chemotherapy', 'DC89', 'Caitlyn Davis'),
('PT723', '4600.00', 'credit', 47, 2, '2022-11-12', 'stable', 'Multiple Myeloma', 'CSF chemotherapy', 'DC34', 'Clair Dunsworth');

-- --------------------------------------------------------

--
-- Table structure for table `pat_chkup`
--

CREATE TABLE `pat_chkup` (
  `patID` varchar(20) NOT NULL,
  `docID` varchar(20) NOT NULL,
  `checkUpDate` date NOT NULL,
  `diagnosis` varchar(50) DEFAULT NULL,
  `treatment` varchar(50) DEFAULT NULL,
  `patStatus` varchar(8) NOT NULL
) ;

--
-- Dumping data for table `pat_chkup`
--

INSERT INTO `pat_chkup` (`patID`, `docID`, `checkUpDate`, `diagnosis`, `treatment`, `patStatus`) VALUES
('PT458', 'DR12', '2022-09-01', 'Cardiac arrest', 'Operation', 'referred'),
('PT668', 'DC88', '2022-09-20', 'Pregnancy', 'Rest and more water', 'regular'),
('PT669', 'DC89', '2022-10-03', 'Non-Hodgkins Lymphoma', 'Intralesional chemotherapy', 'regular'),
('PT723', 'DC34', '2022-11-12', 'Multiple Myeloma', 'CSF chemotherapy', 'admitted'),
('PT755', 'DR54', '2022-11-16', 'Subarachnoid hemorrhage', 'Operation', 'referred'),
('PT789', 'DR54', '2022-12-02', 'Cervical radiculopathy', NULL, 'admitted');

-- --------------------------------------------------------

--
-- Table structure for table `pat_dis`
--

CREATE TABLE `pat_dis` (
  `patID` varchar(20) NOT NULL,
  `treatmentGiven` varchar(50) DEFAULT NULL,
  `treatmentReccomended` varchar(50) DEFAULT NULL,
  `paymentMade` varchar(1) NOT NULL,
  `modePay` varchar(20) DEFAULT NULL,
  `dateDischarge` date NOT NULL,
  `exitComments` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `pat_dis`
--

INSERT INTO `pat_dis` (`patID`, `treatmentGiven`, `treatmentReccomended`, `paymentMade`, `modePay`, `dateDischarge`, `exitComments`) VALUES
('PT458', 'Triple bypass surgery', 'Rest and aspirin as needed', 'Y', 'debit', '2022-09-03', NULL),
('PT669', 'Intralesional chemotherapy', 'Remission - no treatment', 'N', 'deferred', '2022-10-05', 'pleasant attitude'),
('PT789', 'Ice and massage', 'Avoid exercise for one week', 'Y', 'credit', '2022-12-03', 'Potential hypochondriac');

-- --------------------------------------------------------

--
-- Table structure for table `pat_entry`
--

CREATE TABLE `pat_entry` (
  `patID` varchar(20) NOT NULL,
  `patName` varchar(50) NOT NULL,
  `dBirth` date NOT NULL,
  `sex` varchar(1) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dateEntry` date NOT NULL,
  `refDocID` varchar(20) DEFAULT NULL,
  `diagnosis` varchar(50) DEFAULT NULL,
  `deptID` int(11) DEFAULT NULL,
  `healthCardNum` int(11) DEFAULT NULL,
  `emergContact` varchar(50) DEFAULT NULL,
  `emergConPhone` varchar(15) DEFAULT NULL
) ;

--
-- Dumping data for table `pat_entry`
--

INSERT INTO `pat_entry` (`patID`, `patName`, `dBirth`, `sex`, `address`, `city`, `phone`, `email`, `dateEntry`, `refDocID`, `diagnosis`, `deptID`, `healthCardNum`, `emergContact`, `emergConPhone`) VALUES
('PT458', 'Phinneas Beech', '1928-12-30', 'M', '509 Danger Drive', 'Belleterre', '815-6654', NULL, '2022-08-15', 'DR12', 'Cardiac arrest', 1, 841225355, NULL, NULL),
('PT668', 'Veronique Leblanc', '1991-05-03', 'F', '843 Faucet Street', 'Belleterre', '890-0547', 'veronkitty@gmail.com', '2022-09-20', 'DC88', 'Pregnacy checkup', 3, 623355879, 'Patrick Leblanc', '902-554-8448'),
('PT669', 'Faye McDonald', '1963-03-22', 'F', '430 Aberdeen Court', 'Vingt Rivieres', '774-4565', 'faye@mcdonald.ca', '2022-10-03', 'DC89', 'Non-Hodgkins Lymphoma', 2, NULL, 'Mallory Smith', '440-458-6775'),
('PT723', 'Owen Croft', '1947-11-06', 'M', '189 Saunders Street', 'Sherbrooke', '902-752-3540', 'craftycroft@hotmail.com', '2022-11-12', 'DC34', 'Multiple Myeloma', 2, NULL, 'Betty Croft', '655-8892'),
('PT755', 'Theodore Bradetich', '1998-09-18', 'M', '12 Highview Ave.', 'Belleterre', '551-8567', 'teddy-brad@gmail.com', '2022-11-16', 'DR54', 'Migrane', 4, 564112983, 'Madelene Bradetich', '551-8567'),
('PT789', 'Jeremy Renner', '1971-01-07', 'M', '588 Pepperell Street', 'Sherbrooke', '894-5412', 'jrenndog999@gmail.com', '2022-12-02', 'DR54', 'Loss of feeling in fingers', 4, 545898237, 'Sonni Pacheco', '879-545-5782');

-- --------------------------------------------------------

--
-- Table structure for table `pat_opr`
--

CREATE TABLE `pat_opr` (
  `patID` varchar(20) NOT NULL,
  `dateAdmit` date NOT NULL,
  `dateOperation` date NOT NULL,
  `operatingDocID` varchar(20) NOT NULL,
  `opTheatreID` int(11) NOT NULL,
  `preCondition` varchar(50) NOT NULL,
  `postCondition` varchar(50) NOT NULL,
  `treatmentRecc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_opr`
--

INSERT INTO `pat_opr` (`patID`, `dateAdmit`, `dateOperation`, `operatingDocID`, `opTheatreID`, `preCondition`, `postCondition`, `treatmentRecc`) VALUES
('PT458', '2022-09-01', '2022-09-01', 'DR12', 2, 'Critical', 'Stable', 'Aspirin and oxygen therapy'),
('PT755', '2022-11-16', '2022-11-16', 'DR54', 3, 'Routine', 'Stable', 'Rest');

-- --------------------------------------------------------

--
-- Table structure for table `pat_reg`
--

CREATE TABLE `pat_reg` (
  `visitID` int(11) NOT NULL,
  `patID` varchar(20) NOT NULL,
  `dateVisit` date NOT NULL,
  `diagnosis` varchar(50) DEFAULT NULL,
  `treatment` varchar(50) DEFAULT NULL,
  `medicineRecc` varchar(50) DEFAULT NULL,
  `treatmentStatus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pat_reg`
--

INSERT INTO `pat_reg` (`visitID`, `patID`, `dateVisit`, `diagnosis`, `treatment`, `medicineRecc`, `treatmentStatus`) VALUES
(426, 'PT668', '2022-09-20', 'Pregnancy', 'Rest and more water', NULL, 'healthy, mild fatigue'),
(552, 'PT669', '2022-10-03', 'Non-Hodgkins Lymphoma', 'Intralesional chemotherapy', 'Arimidex', 'Stable, improving'),
(584, 'PT669', '2022-10-03', 'Non-Hodgkins Lymphoma', 'Intralesional chemotherapy', 'Arimidex', 'Remission achieved');

-- --------------------------------------------------------

--
-- Table structure for table `room_details`
--

CREATE TABLE `room_details` (
  `roomNum` int(11) NOT NULL,
  `roomType` varchar(1) NOT NULL,
  `roomOccupied` varchar(1) NOT NULL,
  `roomLocation` int(11) NOT NULL,
  `patID` varchar(20) DEFAULT NULL,
  `patName` varchar(50) DEFAULT NULL,
  `chargePerDay` decimal(6,2) DEFAULT NULL
) ;

--
-- Dumping data for table `room_details`
--

INSERT INTO `room_details` (`roomNum`, `roomType`, `roomOccupied`, `roomLocation`, `patID`, `patName`, `chargePerDay`) VALUES
(14, 'G', 'Y', 1, 'PT458', NULL, '90.50'),
(15, 'G', 'Y', 1, 'PT755', NULL, '90.50'),
(16, 'P', 'N', 1, NULL, NULL, NULL),
(17, 'P', 'N', 1, NULL, NULL, NULL),
(46, 'P', 'Y', 2, 'PT669', NULL, '105.00'),
(47, 'P', 'Y', 2, 'PT723', NULL, '105.00'),
(48, 'P', 'N', 2, NULL, NULL, NULL),
(65, 'P', 'Y', 4, 'PT668', NULL, '105.00'),
(102, 'G', 'Y', 4, 'PT789', NULL, '150.00');

-- --------------------------------------------------------

--
-- Table structure for table `web_email_login`
--

CREATE TABLE `web_email_login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_email_login`
--

INSERT INTO `web_email_login` (`email`, `password`) VALUES
('bavery@cloudside.com', '478yhudf#'),
('bcassidy@cloudside.com', 'Summer of `69'),
('craftycroft@hotmail.com', '93rfd55$(('),
('cschofield@cloudside.com', '5fd5351'),
('faye@mcdonald.ca', 'carrots&beans'),
('hford@cloudside.com', '3fhu&*d8az'),
('jrenndog999@gmail.com', 'December 9th'),
('jschrume@cloudside.com', 'roscoe the puppy'),
('smichaelson@cloudside.com', '87/gfsad%'),
('teddy-brad@gmail.com', 'password'),
('veronkitty@gmail.com', 'Mr. Meowzalot');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_doctors`
--
ALTER TABLE `all_doctors`
  ADD PRIMARY KEY (`docID`),
  ADD KEY `deptID` (`deptID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`deptID`),
  ADD UNIQUE KEY `deptName` (`deptName`);

--
-- Indexes for table `doc_on_call`
--
ALTER TABLE `doc_on_call`
  ADD PRIMARY KEY (`docID`),
  ADD KEY `docQualID` (`docQualID`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `doc_qualification`
--
ALTER TABLE `doc_qualification`
  ADD PRIMARY KEY (`docQualID`);

--
-- Indexes for table `doc_reg`
--
ALTER TABLE `doc_reg`
  ADD PRIMARY KEY (`docID`),
  ADD KEY `docQualID` (`docQualID`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `op_theatre`
--
ALTER TABLE `op_theatre`
  ADD PRIMARY KEY (`opTheatreID`),
  ADD KEY `deptID` (`deptID`);

--
-- Indexes for table `pat_admit`
--
ALTER TABLE `pat_admit`
  ADD PRIMARY KEY (`patID`),
  ADD KEY `roomNum` (`roomNum`),
  ADD KEY `deptID` (`deptID`),
  ADD KEY `treatDocID` (`treatDocID`);

--
-- Indexes for table `pat_chkup`
--
ALTER TABLE `pat_chkup`
  ADD PRIMARY KEY (`patID`),
  ADD KEY `docID` (`docID`);

--
-- Indexes for table `pat_dis`
--
ALTER TABLE `pat_dis`
  ADD PRIMARY KEY (`patID`);

--
-- Indexes for table `pat_entry`
--
ALTER TABLE `pat_entry`
  ADD PRIMARY KEY (`patID`),
  ADD KEY `refDocID` (`refDocID`),
  ADD KEY `deptID` (`deptID`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `pat_opr`
--
ALTER TABLE `pat_opr`
  ADD PRIMARY KEY (`patID`),
  ADD KEY `operatingDocID` (`operatingDocID`);

--
-- Indexes for table `pat_reg`
--
ALTER TABLE `pat_reg`
  ADD PRIMARY KEY (`visitID`),
  ADD KEY `patID` (`patID`);

--
-- Indexes for table `room_details`
--
ALTER TABLE `room_details`
  ADD PRIMARY KEY (`roomNum`),
  ADD KEY `roomLocation` (`roomLocation`),
  ADD KEY `patID` (`patID`);

--
-- Indexes for table `web_email_login`
--
ALTER TABLE `web_email_login`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_doctors`
--
ALTER TABLE `all_doctors`
  ADD CONSTRAINT `all_doctors_ibfk_1` FOREIGN KEY (`deptID`) REFERENCES `department` (`deptID`);

--
-- Constraints for table `doc_on_call`
--
ALTER TABLE `doc_on_call`
  ADD CONSTRAINT `doc_on_call_ibfk_1` FOREIGN KEY (`docID`) REFERENCES `all_doctors` (`docID`),
  ADD CONSTRAINT `doc_on_call_ibfk_2` FOREIGN KEY (`docQualID`) REFERENCES `doc_qualification` (`docQualID`),
  ADD CONSTRAINT `doc_on_call_ibfk_3` FOREIGN KEY (`email`) REFERENCES `web_email_login` (`email`);

--
-- Constraints for table `doc_reg`
--
ALTER TABLE `doc_reg`
  ADD CONSTRAINT `doc_reg_ibfk_1` FOREIGN KEY (`docID`) REFERENCES `all_doctors` (`docID`),
  ADD CONSTRAINT `doc_reg_ibfk_2` FOREIGN KEY (`docQualID`) REFERENCES `doc_qualification` (`docQualID`),
  ADD CONSTRAINT `doc_reg_ibfk_3` FOREIGN KEY (`email`) REFERENCES `web_email_login` (`email`);

--
-- Constraints for table `op_theatre`
--
ALTER TABLE `op_theatre`
  ADD CONSTRAINT `op_theatre_ibfk_1` FOREIGN KEY (`deptID`) REFERENCES `department` (`deptID`);

--
-- Constraints for table `pat_admit`
--
ALTER TABLE `pat_admit`
  ADD CONSTRAINT `pat_admit_ibfk_1` FOREIGN KEY (`patID`) REFERENCES `pat_entry` (`patID`),
  ADD CONSTRAINT `pat_admit_ibfk_2` FOREIGN KEY (`roomNum`) REFERENCES `room_details` (`roomNum`),
  ADD CONSTRAINT `pat_admit_ibfk_3` FOREIGN KEY (`deptID`) REFERENCES `department` (`deptID`),
  ADD CONSTRAINT `pat_admit_ibfk_4` FOREIGN KEY (`treatDocID`) REFERENCES `all_doctors` (`docID`);

--
-- Constraints for table `pat_chkup`
--
ALTER TABLE `pat_chkup`
  ADD CONSTRAINT `pat_chkup_ibfk_1` FOREIGN KEY (`patID`) REFERENCES `pat_entry` (`patID`),
  ADD CONSTRAINT `pat_chkup_ibfk_2` FOREIGN KEY (`docID`) REFERENCES `all_doctors` (`docID`);

--
-- Constraints for table `pat_dis`
--
ALTER TABLE `pat_dis`
  ADD CONSTRAINT `pat_dis_ibfk_1` FOREIGN KEY (`patID`) REFERENCES `pat_entry` (`patID`);

--
-- Constraints for table `pat_entry`
--
ALTER TABLE `pat_entry`
  ADD CONSTRAINT `pat_entry_ibfk_1` FOREIGN KEY (`refDocID`) REFERENCES `all_doctors` (`docID`),
  ADD CONSTRAINT `pat_entry_ibfk_2` FOREIGN KEY (`deptID`) REFERENCES `department` (`deptID`),
  ADD CONSTRAINT `pat_entry_ibfk_3` FOREIGN KEY (`email`) REFERENCES `web_email_login` (`email`);

--
-- Constraints for table `pat_opr`
--
ALTER TABLE `pat_opr`
  ADD CONSTRAINT `pat_opr_ibfk_1` FOREIGN KEY (`patID`) REFERENCES `pat_entry` (`patID`),
  ADD CONSTRAINT `pat_opr_ibfk_2` FOREIGN KEY (`operatingDocID`) REFERENCES `all_doctors` (`docID`);

--
-- Constraints for table `pat_reg`
--
ALTER TABLE `pat_reg`
  ADD CONSTRAINT `pat_reg_ibfk_1` FOREIGN KEY (`patID`) REFERENCES `pat_entry` (`patID`);

--
-- Constraints for table `room_details`
--
ALTER TABLE `room_details`
  ADD CONSTRAINT `room_details_ibfk_1` FOREIGN KEY (`roomLocation`) REFERENCES `department` (`deptID`),
  ADD CONSTRAINT `room_details_ibfk_2` FOREIGN KEY (`patID`) REFERENCES `pat_entry` (`patID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
