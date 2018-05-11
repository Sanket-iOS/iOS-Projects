-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 08, 2016 at 08:23 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iWitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `Complaint`
--

CREATE TABLE IF NOT EXISTS `Complaint` (
  `cID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `psID` int(11) NOT NULL,
  `poID` int(11) NOT NULL,
  `ctID` int(11) NOT NULL,
  `cDetails` varchar(150) NOT NULL,
  `locationAddress` varchar(100) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `cDate` date NOT NULL,
  `cTime` time NOT NULL,
  `cIMG_URLs` varchar(500) NOT NULL,
  `cStatus` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Complaint`
--

INSERT INTO `Complaint` (`cID`, `UID`, `psID`, `poID`, `ctID`, `cDetails`, `locationAddress`, `latitude`, `longitude`, `cDate`, `cTime`, `cIMG_URLs`, `cStatus`) VALUES
(1, 1, 9, 0, 5, 'I witnessed the bribery case nearby my society. Rs. 1 lac has been demanded from the bribe side.', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '19.01761469999999931701', '72.85616439999999727206', '2016-10-08', '11:05:11', 'http://localhost/iWitness_WS/uploads/C4313.jpg,http://localhost/iWitness_WS/uploads/C4001.jpg,http://localhost/iWitness_WS/uploads/C7114.jpg,http://localhost/iWitness_WS/uploads/C7691.jpg', 'sent'),
(2, 1, 9, 0, 9, 'Two days ago, I became the victim of the cybercrime as Rs. 5000 withdrawn from my SBI account as I replied all my Debit Card information to the mail s', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '19.01761469999999931701', '72.85616439999999727206', '2016-10-08', '11:11:00', 'http://localhost/iWitness_WS/uploads/C4418.jpg,http://localhost/iWitness_WS/uploads/C6634.jpg', 'sent'),
(3, 2, 9, 0, 15, 'There are some neighbor in our society who continuously disturbing us by doing miscellaneous activities.     ', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '19.01761469999999931701', '72.85616439999999727206', '2016-10-08', '11:17:05', 'http://localhost/iWitness_WS/uploads/C3279.jpg,http://localhost/iWitness_WS/uploads/C7458.jpg', 'sent'),
(4, 2, 9, 9, 20, 'I witnessed an accident made by the person who is drunk and the opposite party is badly injured.', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '19.01761469999999931701', '72.85616439999999727206', '2016-10-08', '11:22:41', 'http://localhost/iWitness_WS/uploads/C1113.jpg,http://localhost/iWitness_WS/uploads/C5584.jpg,http://localhost/iWitness_WS/uploads/C2147.jpg', 'sent'),
(5, 1, 9, 9, 46, 'My cell-phone is stolen a hour ago', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '19.01761469999999931701', '72.85616439999999727206', '2016-10-08', '11:29:25', 'http://localhost/iWitness_WS/uploads/C8888.jpg,http://localhost/iWitness_WS/uploads/C5875.jpg', 'sent');

-- --------------------------------------------------------

--
-- Table structure for table `crimeTypes`
--

CREATE TABLE IF NOT EXISTS `crimeTypes` (
  `ctID` int(11) NOT NULL,
  `ctName` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crimeTypes`
--

INSERT INTO `crimeTypes` (`ctID`, `ctName`) VALUES
(1, 'Arson'),
(2, 'Assault'),
(3, 'Aggravated Assault/Battery'),
(4, 'Attempt'),
(5, 'Bribery'),
(6, 'Child Abandonment'),
(7, 'Child Abuse'),
(8, 'Child Pornography'),
(9, 'Computer Crime/Cyber Crime'),
(10, 'Conspiracy'),
(11, 'Credit / Debit Card Fraud'),
(12, 'Cyber Bullying'),
(13, 'Criminal Contempt of Court'),
(14, 'Disorderly Conduct'),
(15, 'Disturbing the Peace'),
(16, 'Domestic Violence'),
(17, 'Drug Manufacturing and Cultivation'),
(18, 'Drug Trafficking/Distribution'),
(19, 'Drug Possession'),
(20, 'Drunk Driving/DUI/DWI'),
(21, 'Embezzlement'),
(22, 'Extortion'),
(23, 'Forgery'),
(24, 'Fraud'),
(25, 'Harassment'),
(26, 'Hate Crime'),
(27, 'Homicide'),
(28, 'Indecent Exposure'),
(29, 'Identity Theft'),
(30, 'Insurance Fraud'),
(31, 'Kidnapping'),
(32, 'Manslaughter: Involuntary/Voluntary'),
(33, 'Money Laundering'),
(34, 'Murder'),
(35, 'Perjury'),
(36, 'Probation Violation'),
(37, 'Prostitution'),
(38, 'Public Intoxication'),
(39, 'Racketeering'),
(40, 'Rape'),
(41, 'Robbery'),
(42, 'Sexual Assault'),
(43, 'Shoplifting'),
(44, 'Solicitation'),
(45, 'Stalking'),
(46, 'Theft'),
(47, 'Vandalism/Criminal Damage'),
(48, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `Feedbacks`
--

CREATE TABLE IF NOT EXISTS `Feedbacks` (
  `fbID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `feedBacks` varchar(50) NOT NULL,
  `givenRates` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Feedbacks`
--

INSERT INTO `Feedbacks` (`fbID`, `UID`, `feedBacks`, `givenRates`) VALUES
(1, 1, 'Excellent service provided. ', 5),
(2, 2, 'Good service', 4.5),
(3, 1, 'Nice work done by police department', 4.5);

-- --------------------------------------------------------

--
-- Table structure for table `missingPerson`
--

CREATE TABLE IF NOT EXISTS `missingPerson` (
  `mpID` int(11) NOT NULL,
  `mpName` varchar(30) NOT NULL,
  `mpAge` int(10) NOT NULL,
  `mpDetails` varchar(50) NOT NULL,
  `mpContact` varchar(12) NOT NULL,
  `missingDate` date NOT NULL,
  `mpImage` varchar(50) DEFAULT NULL,
  `mpStatus` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `missingPerson`
--

INSERT INTO `missingPerson` (`mpID`, `mpName`, `mpAge`, `mpDetails`, `mpContact`, `missingDate`, `mpImage`, `mpStatus`) VALUES
(1, 'Jignesh Maradiya', 25, 'Black Hair and fair skin', '9274743999', '2016-05-25', 'null', 1),
(2, 'Bhavesh Rana', 24, 'medium fair skin', '98654743590', '2016-06-10', 'null', 1),
(3, 'Manish Pandey', 29, 'Long Hair and Having tatto on right arm', '7589416960', '2016-06-20', 'null', 1),
(4, 'Sneha Agarwal', 10, 'Fair skin, Long silky hair and weared pink frock', '8456126946', '2016-06-16', 'null', 1),
(5, 'Harpreet Singh', 35, 'Fat, brown eyes and Having tatoo on chest', '99654653414', '2016-06-12', 'null', 1),
(6, 'Pavan Dubey', 47, 'Dark Skin and french beard', '9745665235', '2016-06-19', 'null', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mpFoundLocation`
--

CREATE TABLE IF NOT EXISTS `mpFoundLocation` (
  `mpFLID` int(11) NOT NULL,
  `mpID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `psID` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `foundLocationAddress` varchar(100) NOT NULL,
  `mpFLDate` date NOT NULL,
  `mpFLTime` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mpFoundLocation`
--

INSERT INTO `mpFoundLocation` (`mpFLID`, `mpID`, `UID`, `psID`, `latitude`, `longitude`, `foundLocationAddress`, `mpFLDate`, `mpFLTime`) VALUES
(1, 2, 1, 9, '19.01761470', '72.85616440', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '2016-10-05', '12:50:52'),
(2, 2, 1, 9, '19.01761470', '72.85616440', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '2016-10-05', '12:51:43'),
(3, 2, 1, 9, '19.01761470', '72.85616440', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '2016-10-05', '12:53:45'),
(4, 2, 1, 9, '19.01761470', '72.85616440', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '2016-10-05', '12:54:44'),
(5, 6, 1, 9, '19.01761470', '72.85616440', '(null)', '2016-10-08', '11:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `policeOfficialsInfo`
--

CREATE TABLE IF NOT EXISTS `policeOfficialsInfo` (
  `poID` int(11) NOT NULL,
  `psID` int(11) NOT NULL,
  `poName` varchar(50) NOT NULL,
  `poPost` varchar(50) NOT NULL,
  `poContact` varchar(50) NOT NULL,
  `poImage` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policeOfficialsInfo`
--

INSERT INTO `policeOfficialsInfo` (`poID`, `psID`, `poName`, `poPost`, `poContact`, `poImage`, `status`) VALUES
(1, 1, 'Shri A.M. Captan', 'Police Inspector (P.I.)', '9879509779', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Athwa.jpg', 0),
(2, 2, 'Shri G. A. Sarvaiya', 'Police Inspector (P.I.)', '9727754545', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Umra.jpg', 0),
(3, 3, 'Shri P.K. Patel', 'Police Inspector (P.I.)', '9825586368', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Khatodra.png', 0),
(4, 4, 'Shri P.B. Sapra', 'Police Inspector (P.I.)', '9712009090', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Udhana.jpg', 0),
(5, 5, 'Shri D.P. Vaghela', 'Police Inspector (P.I.)', '9913344144', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Adajan.png', 0),
(6, 6, 'Shri B.K. Vanar', 'Police Inspector (P.I.)', '9979011100', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Salabatpura.png', 0),
(7, 7, 'Shri P.K. Diyora', 'Police Inspector (P.I.)', '9925020128', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Katargam.jpg', 0),
(8, 8, 'Shri G.A. Patel', 'Police Inspector (P.I.)', '8980045800', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Rander.png', 0),
(9, 9, 'Shri N.L. Desai', 'Police Inspector (P.I.)', '9924466599', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Pandesara.png', 0),
(10, 10, 'Shri C.K. Patel', 'Police Inspector (P.I.)', '9879798844', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Varachha.png', 0),
(11, 11, 'Shri B.S. Mori', 'Police Inspector (P.I.)', '9879794497', 'http://localhost/iWitness_WS/uploads/policeOfficials/PI-Kapodra.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `psRegistration`
--

CREATE TABLE IF NOT EXISTS `psRegistration` (
  `psID` int(11) NOT NULL,
  `psName` varchar(50) NOT NULL,
  `psAddress` varchar(70) NOT NULL,
  `psLatitude` varchar(50) NOT NULL,
  `psLongitude` varchar(50) NOT NULL,
  `psUsername` varchar(20) NOT NULL,
  `psPassword` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `psRegistration`
--

INSERT INTO `psRegistration` (`psID`, `psName`, `psAddress`, `psLatitude`, `psLongitude`, `psUsername`, `psPassword`) VALUES
(1, 'Athwa Police Station', 'Ghod Dod Rd, Athwalines, Athwa, Surat, Gujarat-395001', '21.1756607', '72.739673', 'psathwa', 'psathwa'),
(2, 'Umra Police Station', 'NearPolice Pared Ground, Athwalines, Surat, Gujarat 395001', '21.179149', '72.7337117', 'psumra', 'psumra'),
(3, 'Khotdara Police Station', 'Near Jogani Temple, U.M.Road, Udhna, Surat, Gujarat-395002', '21.1758536', '72.7605397', 'pskhotdara', 'pskhotdara'),
(4, 'Udhna Police Station', 'GIDC, Hari Ichchha Industrial Society, Udhna Udhyog Nagar, Surat, Guja', '21.1654721', '72.7803658', 'psudhna', 'psudhna'),
(5, 'Adajan Police Station', 'Adajan Gam, Surat, Gujarat 395009', '21.1907475', '72.7238225', 'psadajan', 'psadajan'),
(6, 'Salabatpura Police Station', ' Salabatpura Main Rd, Surat, Gujarat-395003', '21.1910898', '72.7664676', 'pssalabatpura', 'pssalabatpura'),
(7, 'Katargam Police Station', 'Katargam Main Road, Near Ram Temple, Katargam, Surat, Gujarat-395004', '21.2232639', '72.7631644', 'pskatargam', 'pskatargam'),
(8, 'Rander Police Station', 'Rander, Surat, Gujarat-395005', '21.2183962', '72.7245907', 'psrander', 'psrander'),
(9, 'Pandesara Police Station', 'Pandesara GIDC, Udhna, Surat, Gujarat-394221', '21.1418794', '72.7699651', 'pspandesara', 'pspandesara'),
(10, 'Varachha Police Station', 'Surat - Kamrej Highway, Laxman Nagar, Varachha, Surat, Gujarat-395006', '21.2094003', '72.7795494', 'psvarachha', 'psvarachha'),
(11, 'Kapodra Police Station', 'Nana Varachha Road, Kamrej Highway, Kapodra, Surat, Gujarat-394010', '21.2206162', '72.8055535', 'pskapodra', 'pskapodra');

-- --------------------------------------------------------

--
-- Table structure for table `Suggestions`
--

CREATE TABLE IF NOT EXISTS `Suggestions` (
  `sugID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `psID` int(11) NOT NULL,
  `sugSubject` varchar(50) NOT NULL,
  `sugDetail` varchar(80) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Suggestions`
--

INSERT INTO `Suggestions` (`sugID`, `UID`, `psID`, `sugSubject`, `sugDetail`) VALUES
(1, 1, 1, 'Subject to work upgradation', 'I complained for my lost cellphone about tow weeks ago. Still there is no progre'),
(2, 2, 3, 'About service', 'Please improve your service'),
(3, 1, 11, 'About traffic management', 'I stuck in the traffic since last half an hour. But there is no traffic police t');

-- --------------------------------------------------------

--
-- Table structure for table `userRegistration`
--

CREATE TABLE IF NOT EXISTS `userRegistration` (
  `UID` int(11) NOT NULL,
  `UName` varchar(30) NOT NULL,
  `USurname` varchar(30) NOT NULL,
  `UAddress` varchar(100) NOT NULL,
  `UContact` varchar(50) NOT NULL,
  `UEmail` varchar(25) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `UAadharNo` bigint(25) NOT NULL,
  `UProfilePic` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userRegistration`
--

INSERT INTO `userRegistration` (`UID`, `UName`, `USurname`, `UAddress`, `UContact`, `UEmail`, `Username`, `Password`, `UAadharNo`, `UProfilePic`) VALUES
(1, 'Chintan', 'Maisuriya', 'Bhatar, Surat', '7359189897', 'csm@gmail.com', 'csm', 'csm12345', 765834544345, 'http://localhost/iWitness_WS/uploads/ChintanMaisuriya.jpg'),
(2, 'Dhruvit', 'Modi', 'Surat', '8947354545', 'xyz@gmail.com', 'dm', 'dm', 798453143696, 'http://localhost/iWitness_WS/uploads/DhruvitModi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wantedPersons`
--

CREATE TABLE IF NOT EXISTS `wantedPersons` (
  `wpID` int(11) NOT NULL,
  `wpName` varchar(50) NOT NULL,
  `wpSex` varchar(10) NOT NULL,
  `wpDOB` date NOT NULL,
  `wpPOB` varchar(30) NOT NULL,
  `languageSpoken` varchar(50) NOT NULL,
  `wpNationality` varchar(30) NOT NULL,
  `wpDetails` varchar(100) NOT NULL,
  `wpCharges` varchar(100) NOT NULL,
  `Reward` varchar(25) NOT NULL,
  `wpImage` varchar(50) NOT NULL,
  `wpStatus` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wantedPersons`
--

INSERT INTO `wantedPersons` (`wpID`, `wpName`, `wpSex`, `wpDOB`, `wpPOB`, `languageSpoken`, `wpNationality`, `wpDetails`, `wpCharges`, `Reward`, `wpImage`, `wpStatus`) VALUES
(1, 'Dawood Ibrahim', 'Male', '2055-12-27', 'Khed Ratnagiri, Maharastra', 'Hindi, Urdu, English', 'India', 'Leader of the Indian organised crime syndicate D-Company', 'Cheating, Criminal Conspiracy ', '$25 million', '', 1),
(2, 'Ahmed Maksood', 'Male', '0000-00-00', 'Pakistan', 'Urdu', 'Pakistan', '', 'Murder and Use of Firearms', '', '', 1),
(3, 'Chand Bahadur', 'Male', '1978-01-07', 'Baitali, Nepal', 'Nepali, Hindi, Marathi', 'Nepalese', '', 'Kidnapping, Husband or relative of husband or woman subjecting her cruelty', '', '', 1),
(4, 'Abu Baker', 'Male', '1997-05-07', 'Mumbai, India', 'Hindi, Urdu, Marathi', 'Indian', '165 Cms. Height, Clean Shaven, Scar Below Chin', 'Criminal conspiracy,causing bodily harm,damage to property, murder,terrorist activities', '', '', 1),
(5, 'Maulana Mohamad Masood Azhar Alvi Masood', 'Male', '2068-07-10', 'Bahawalpur, Punjab, Pakistan', 'Urdu, Arabic, Farsi, Punjabi', 'Pakistani', '167 cm Height, Small black mole on forehead', 'Conspiracy to wage war against the State, murder, possessing explosives, arms and ammunition', '', '', 1),
(6, 'Yakub Memon', 'Male', '2062-07-30', 'Mumbai, India', 'Hindi, Urdu', 'Indian', 'Executed by hanging  in Nagpur Central Jail on 30 July 2015 ', '1993 Bombay bombings', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wpFoundLocation`
--

CREATE TABLE IF NOT EXISTS `wpFoundLocation` (
  `wpFLID` int(11) NOT NULL,
  `wpID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `psID` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `foundLocationAddress` varchar(100) NOT NULL,
  `wpFLDate` date NOT NULL,
  `wpFLTime` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wpFoundLocation`
--

INSERT INTO `wpFoundLocation` (`wpFLID`, `wpID`, `UID`, `psID`, `latitude`, `longitude`, `foundLocationAddress`, `wpFLDate`, `wpFLTime`) VALUES
(1, 3, 1, 9, '19.01761470', '72.85616440', 'B/1, Sewari Wadala Road, Mumbai, Maharashtra, India - 400019', '2016-10-08', '11:38:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Complaint`
--
ALTER TABLE `Complaint`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `crimeTypes`
--
ALTER TABLE `crimeTypes`
  ADD PRIMARY KEY (`ctID`);

--
-- Indexes for table `Feedbacks`
--
ALTER TABLE `Feedbacks`
  ADD PRIMARY KEY (`fbID`);

--
-- Indexes for table `missingPerson`
--
ALTER TABLE `missingPerson`
  ADD PRIMARY KEY (`mpID`);

--
-- Indexes for table `mpFoundLocation`
--
ALTER TABLE `mpFoundLocation`
  ADD PRIMARY KEY (`mpFLID`);

--
-- Indexes for table `policeOfficialsInfo`
--
ALTER TABLE `policeOfficialsInfo`
  ADD PRIMARY KEY (`poID`);

--
-- Indexes for table `psRegistration`
--
ALTER TABLE `psRegistration`
  ADD PRIMARY KEY (`psID`);

--
-- Indexes for table `Suggestions`
--
ALTER TABLE `Suggestions`
  ADD PRIMARY KEY (`sugID`);

--
-- Indexes for table `userRegistration`
--
ALTER TABLE `userRegistration`
  ADD PRIMARY KEY (`UID`);

--
-- Indexes for table `wantedPersons`
--
ALTER TABLE `wantedPersons`
  ADD PRIMARY KEY (`wpID`);

--
-- Indexes for table `wpFoundLocation`
--
ALTER TABLE `wpFoundLocation`
  ADD PRIMARY KEY (`wpFLID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Complaint`
--
ALTER TABLE `Complaint`
  MODIFY `cID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `crimeTypes`
--
ALTER TABLE `crimeTypes`
  MODIFY `ctID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `Feedbacks`
--
ALTER TABLE `Feedbacks`
  MODIFY `fbID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `missingPerson`
--
ALTER TABLE `missingPerson`
  MODIFY `mpID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mpFoundLocation`
--
ALTER TABLE `mpFoundLocation`
  MODIFY `mpFLID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `policeOfficialsInfo`
--
ALTER TABLE `policeOfficialsInfo`
  MODIFY `poID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `psRegistration`
--
ALTER TABLE `psRegistration`
  MODIFY `psID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `Suggestions`
--
ALTER TABLE `Suggestions`
  MODIFY `sugID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `userRegistration`
--
ALTER TABLE `userRegistration`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wantedPersons`
--
ALTER TABLE `wantedPersons`
  MODIFY `wpID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wpFoundLocation`
--
ALTER TABLE `wpFoundLocation`
  MODIFY `wpFLID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
