-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 02:43 AM
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
-- Database: `newsletterdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `UserID`) VALUES
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `ApplicationID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `approval_status` enum('Pending','Approved','Denied') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`ApplicationID`, `UserID`, `approval_status`) VALUES
(1, 5, 'Approved'),
(2, 6, 'Denied'),
(3, 5, 'Approved'),
(4, 9, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `BlogID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text DEFAULT NULL,
  `PublishDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `CategoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`BlogID`, `Title`, `Content`, `PublishDate`, `CategoryName`) VALUES
(4, 'ande tat', 'bugadi', '2024-11-23 08:29:08', 'Business'),
(5, 'ande tat', 'bugadi', '2024-11-23 08:31:15', 'Business'),
(6, 'ande tat', 'bugadi', '2024-11-23 09:27:52', 'Business'),
(7, 'asDASFD', 'adapada', '2024-11-23 10:05:02', 'Business'),
(8, 'asDASFD', 'dgnszgfsngsfnnsgfgnsf', '2024-11-23 10:27:14', 'Sports'),
(9, 'asDASFDsfgnsfgn', 'aaaaaaaaaaaaaaaaaaaaaaa', '2024-11-23 10:27:26', 'Books'),
(10, 'asdggasdfgasdgasdgasdgasdg', 'asdgasgasdgasdgasgasgsadgasgsadgasgasgasdgsdag', '2024-11-23 10:27:39', 'Quotes'),
(11, 'Its the Writer', 'Hello, This is written by a writer', '2024-11-23 12:56:13', 'Business'),
(12, 'This is my writing', 'Hello book lovers', '2024-11-24 01:20:26', 'Books'),
(13, 'Anotehr writing', 'asfafasfasf', '2024-11-24 01:39:40', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Business'),
(2, 'Sports'),
(3, 'Books'),
(4, 'Quotes');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `Message` text DEFAULT NULL,
  `FeedbackDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FeedbackID`, `Message`, `FeedbackDate`) VALUES
(4, 'pocha website', '2024-11-23 12:29:26'),
(5, 'This is another feedback', '2024-11-24 01:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MembershipID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MembershipID`, `UserID`) VALUES
(7, 6),
(11, 9);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `NewsletterNo` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Content` text DEFAULT NULL,
  `CategoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`NewsletterNo`, `Title`, `Content`, `CategoryName`) VALUES
(4, 'ande tat', 'bugadi', 'Business'),
(5, 'ande tat', 'bugadi', 'Business'),
(6, 'ande tat', 'bugadi', 'Business'),
(7, 'asDASFD', 'adapada', 'Business'),
(8, 'asDASFD', 'dgnszgfsngsfnnsgfgnsf', 'Sports'),
(9, 'asDASFDsfgnsfgn', 'aaaaaaaaaaaaaaaaaaaaaaa', 'Books'),
(10, 'asdggasdfgasdgasdgasdgasdg', 'asdgasgasdgasdgasgasgsadgasgsadgasgasgasdgsdag', 'Quotes'),
(11, 'Its the Writer', 'Hello, This is written by a writer', 'Business'),
(12, 'This is my writing', 'Hello book lovers', 'Books'),
(13, 'Anotehr writing', 'asfafasfasf', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `newsletterreceivers`
--

CREATE TABLE `newsletterreceivers` (
  `NewsletterNo` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletterreceivers`
--

INSERT INTO `newsletterreceivers` (`NewsletterNo`, `CategoryID`, `UserID`) VALUES
(6, 1, 4),
(7, 1, 4),
(8, 2, 4),
(9, 3, 4),
(10, 4, 4),
(11, 1, 4),
(11, 1, 5),
(12, 3, 4),
(13, 1, 4),
(13, 1, 5),
(13, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `publishedas`
--

CREATE TABLE `publishedas` (
  `NewsletterNo` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL,
  `PublishDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publishedas`
--

INSERT INTO `publishedas` (`NewsletterNo`, `CategoryID`, `BlogID`, `PublishDate`) VALUES
(4, 1, 4, '2024-11-23 08:29:08'),
(5, 1, 5, '2024-11-23 08:31:15'),
(6, 1, 6, '2024-11-23 09:27:52'),
(7, 1, 7, '2024-11-23 10:05:02'),
(8, 2, 8, '2024-11-23 10:27:14'),
(9, 3, 9, '2024-11-23 10:27:26'),
(10, 4, 10, '2024-11-23 10:27:39'),
(11, 1, 11, '2024-11-23 12:56:13'),
(12, 3, 12, '2024-11-24 01:20:26'),
(13, 1, 13, '2024-11-24 01:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `receivesfeedback`
--

CREATE TABLE `receivesfeedback` (
  `FeedbackID` int(11) NOT NULL,
  `AdminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receivesfeedback`
--

INSERT INTO `receivesfeedback` (`FeedbackID`, `AdminID`) VALUES
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roleofuser`
--

CREATE TABLE `roleofuser` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roleofuser`
--

INSERT INTO `roleofuser` (`UserID`, `RoleID`) VALUES
(4, 1),
(5, 3),
(6, 2),
(9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `SubscriberNo` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `SubscriptionDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriber`
--

INSERT INTO `subscriber` (`SubscriberNo`, `UserID`, `SubscriptionDate`) VALUES
(7, 4, '2024-11-23 08:28:50'),
(8, 4, '2024-11-23 09:43:49'),
(13, 5, '2024-11-23 12:32:34'),
(14, 6, '2024-11-23 12:34:39'),
(15, 6, '2024-11-23 12:34:40'),
(18, 9, '2024-11-23 16:45:34'),
(19, 4, '2024-11-24 01:31:02'),
(20, 5, '2024-11-24 01:31:41'),
(21, 9, '2024-11-24 01:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `SubscriptionID` int(11) NOT NULL,
  `SubscriberNo` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`SubscriptionID`, `SubscriberNo`, `CategoryID`, `UserID`) VALUES
(7, 7, 1, 4),
(8, 8, 3, 4),
(13, 13, 1, 5),
(14, 14, 2, 6),
(15, 15, 4, 6),
(17, 18, 1, 9),
(18, 19, 2, 4),
(19, 20, 2, 5),
(20, 21, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `FName` varchar(255) DEFAULT NULL,
  `LName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `Password`, `FName`, `LName`, `Email`, `PhoneNumber`, `otp`) VALUES
(4, 'Mogee', '$2y$10$zsQKTRSKMwjHqniwyHohpejYIufk5/s/TvLtCT7at8HgnfKFthZA6', 'Mohommed Bon', 'Ohmed', 'mohammedbinahmed007@gmail.com', '12312312312', 166503),
(5, 'Mahee', '$2y$10$x2lkuNRLz30r5v8fl88YnuiJL0..LofRUJHWsgDZ/lqtoTwmXd0Fm', 'Mohammed Bin', 'Ahmed', 'mbinahmed27@gmail.com', '12312312312', 110251),
(6, 'Mohee', '$2y$10$Lo6PuPkEX7uHNmSbYpb8oOdf2FsFnMNVo9boYfuQ1MB/8ykW90skK', 'Mohommed Bin', 'Ohmed', 'zerotarta@gmail.com', '01310839501', 119376),
(9, 'Tartaglia', '$2y$10$4701ysXsBpHN4oaPWgnFuOO1HdnKQXAnSDoS2v937CT.15gOlIAFe', 'Zero', 'Tartaglia', 'zerotarta0@gmail.com', '01010101010', 589943);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(255) NOT NULL,
  `AssignmentDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`RoleID`, `RoleName`, `AssignmentDate`) VALUES
(1, 'Admin', '2024-11-23 06:29:17'),
(2, 'Member', '2024-11-23 06:29:17'),
(3, 'Writer', '2024-11-23 06:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `writer`
--

CREATE TABLE `writer` (
  `WriterID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `writer`
--

INSERT INTO `writer` (`WriterID`, `UserID`) VALUES
(10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `writings`
--

CREATE TABLE `writings` (
  `WritingID` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `WriterID` int(11) DEFAULT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approval_status` enum('Pending','Approved','Denied') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `writings`
--

INSERT INTO `writings` (`WritingID`, `title`, `content`, `WriterID`, `CategoryName`, `created_at`, `approval_status`) VALUES
(2, 'Its the Writer', 'Hello, This is written by a writer', 10, 'Business', '2024-11-23 12:53:23', 'Approved'),
(3, 'Its the Writer but Denied', 'Hello, This is also written by a writer', 10, 'Sports', '2024-11-23 12:53:42', 'Denied'),
(4, 'Its the Writer but Pending', 'Hello, This is also written by a writer but I am waiting', 10, 'Books', '2024-11-23 12:53:57', 'Pending'),
(5, 'This is my writing', 'Hello book lovers', 10, 'Books', '2024-11-24 01:17:50', 'Approved'),
(6, 'Writing testing', 'Test message', 10, 'Sports', '2024-11-24 01:25:09', 'Pending'),
(7, 'Anotehr writing', 'asfafasfasf', 10, 'Business', '2024-11-24 01:39:09', 'Approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`ApplicationID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`BlogID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MembershipID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`NewsletterNo`);

--
-- Indexes for table `newsletterreceivers`
--
ALTER TABLE `newsletterreceivers`
  ADD PRIMARY KEY (`NewsletterNo`,`CategoryID`,`UserID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `publishedas`
--
ALTER TABLE `publishedas`
  ADD PRIMARY KEY (`NewsletterNo`,`CategoryID`,`BlogID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `BlogID` (`BlogID`);

--
-- Indexes for table `receivesfeedback`
--
ALTER TABLE `receivesfeedback`
  ADD PRIMARY KEY (`FeedbackID`,`AdminID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `roleofuser`
--
ALTER TABLE `roleofuser`
  ADD PRIMARY KEY (`UserID`,`RoleID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`SubscriberNo`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`SubscriptionID`),
  ADD KEY `SubscriberNo` (`SubscriberNo`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `writer`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`WriterID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `writings`
--
ALTER TABLE `writings`
  ADD PRIMARY KEY (`WritingID`),
  ADD KEY `WriterID` (`WriterID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `ApplicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `BlogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MembershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `NewsletterNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `SubscriberNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `SubscriptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `writer`
--
ALTER TABLE `writer`
  MODIFY `WriterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `writings`
--
ALTER TABLE `writings`
  MODIFY `WritingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `newsletterreceivers`
--
ALTER TABLE `newsletterreceivers`
  ADD CONSTRAINT `newsletterreceivers_ibfk_1` FOREIGN KEY (`NewsletterNo`) REFERENCES `newsletter` (`NewsletterNo`),
  ADD CONSTRAINT `newsletterreceivers_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `newsletterreceivers_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `publishedas`
--
ALTER TABLE `publishedas`
  ADD CONSTRAINT `publishedas_ibfk_1` FOREIGN KEY (`NewsletterNo`) REFERENCES `newsletter` (`NewsletterNo`),
  ADD CONSTRAINT `publishedas_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `publishedas_ibfk_3` FOREIGN KEY (`BlogID`) REFERENCES `blog` (`BlogID`);

--
-- Constraints for table `receivesfeedback`
--
ALTER TABLE `receivesfeedback`
  ADD CONSTRAINT `receivesfeedback_ibfk_1` FOREIGN KEY (`FeedbackID`) REFERENCES `feedback` (`FeedbackID`),
  ADD CONSTRAINT `receivesfeedback_ibfk_2` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `roleofuser`
--
ALTER TABLE `roleofuser`
  ADD CONSTRAINT `roleofuser_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `roleofuser_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `userrole` (`RoleID`);

--
-- Constraints for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD CONSTRAINT `subscriber_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`SubscriberNo`) REFERENCES `subscriber` (`SubscriberNo`),
  ADD CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `subscription_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `writer`
--
ALTER TABLE `writer`
  ADD CONSTRAINT `writer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `writings`
--
ALTER TABLE `writings`
  ADD CONSTRAINT `writings_ibfk_1` FOREIGN KEY (`WriterID`) REFERENCES `writer` (`WriterID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
