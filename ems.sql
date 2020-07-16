-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2018 at 03:49 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `COUNTATTANDENCE` (`RID` INT) RETURNS INT(11) BEGIN
	DECLARE s int;
    SET s=0;
	SELECT SUM(attendance_table.Attendance) INTO s FROM attendance_table WHERE attendance_table.R_ID=RID;
    RETURN s;
  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `Admin_Id` int(11) NOT NULL,
  `Admin_Name` varchar(50) NOT NULL,
  `Admin_Email` varchar(50) NOT NULL COMMENT 'Email id',
  `Admin_Password` varchar(32) NOT NULL COMMENT 'Password',
  `Birthdate` date NOT NULL,
  `Mobile_number` int(11) NOT NULL,
  `Short_Name` varchar(5) NOT NULL,
  `Admin_Image` varchar(50) NOT NULL COMMENT 'Profile Image'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`Admin_Id`, `Admin_Name`, `Admin_Email`, `Admin_Password`, `Birthdate`, `Mobile_number`, `Short_Name`, `Admin_Image`) VALUES
(1, 'akash', 'gmail@gmail.com', 'gmail', '2018-03-07', 123456789, 'SAH', ''),
(2, 'akash', 'gmail@gmail.com', 'gmail', '2018-03-21', 123456789, 'gmail', '');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_table`
--

CREATE TABLE `attendance_table` (
  `A_ID` int(11) NOT NULL COMMENT 'Attendence_ID',
  `Date` date NOT NULL COMMENT 'Date',
  `IP_Address` varchar(50) NOT NULL COMMENT 'Employee System IP Address',
  `Shift_Time` varchar(20) NOT NULL COMMENT 'Employee Shift Time',
  `In_Time` varchar(20) NOT NULL COMMENT 'Employee Incoming Time',
  `Working_Time` varchar(20) DEFAULT NULL,
  `Reason_Of_Late` varchar(150) DEFAULT NULL COMMENT 'Reason',
  `Attendance` int(11) NOT NULL COMMENT 'Attendance',
  `R_ID` int(11) NOT NULL COMMENT 'Employee ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance_table`
--

INSERT INTO `attendance_table` (`A_ID`, `Date`, `IP_Address`, `Shift_Time`, `In_Time`, `Working_Time`, `Reason_Of_Late`, `Attendance`, `R_ID`) VALUES
(1, '2018-04-19', '0:0:0:0:0:0:0:1', '05:00', '15:25', NULL, 'abc', 1, 1),
(2, '2018-04-20', '0:0:0:0:0:0:0:1', '05:00', '14:21', NULL, 'traffic', 1, 2),
(3, '2018-04-20', '192.168.43.30', '05:00', '15:25', NULL, 'abc', 1, 1),
(4, '2018-04-21', '192.168.43.44', '05:00', '12:36', NULL, 'abc', 1, 1),
(5, '2018-04-21', '192.168.43.30', '05:00', '11:40', NULL, 'traffic', 1, 2),
(6, '2018-04-21', '192.168.43.30', '05:00', '13:04', NULL, 'abc', 1, 3),
(7, '2018-04-23', '0:0:0:0:0:0:0:1', '05:00', '06:48', NULL, 'abc', 1, 1),
(8, '2018-04-23', '0:0:0:0:0:0:0:1', '05:00', '06:51', NULL, 'abc', 1, 3),
(9, '2018-05-18', '0:0:0:0:0:0:0:1', '05:00', '19:14', NULL, 'abc', 1, 1),
(10, '2018-05-18', '0:0:0:0:0:0:0:1', '05:00', '16:29', NULL, 'abc', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `client_details_table`
--

CREATE TABLE `client_details_table` (
  `Client_ID` int(11) NOT NULL COMMENT 'Client id',
  `Client_Name` varchar(50) NOT NULL COMMENT 'Username',
  `Email_ID` varchar(50) NOT NULL COMMENT 'Email_ID',
  `Password` varchar(32) NOT NULL COMMENT 'Password',
  `Mobile_Number` int(15) NOT NULL COMMENT 'Client mobile number',
  `Client_Project_Name` varchar(100) NOT NULL COMMENT 'Project Name',
  `Client_Project_Image` varchar(50) DEFAULT NULL COMMENT 'Profile Image'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_details_table`
--

INSERT INTO `client_details_table` (`Client_ID`, `Client_Name`, `Email_ID`, `Password`, `Mobile_Number`, `Client_Project_Name`, `Client_Project_Image`) VALUES
(1, 'sky', 'sky@gmail.com', 'sky', 1234568881, 'hotel management', ''),
(2, 'dev', 'dev@gmail.com', 'dev', 1234567800, 'library', NULL),
(4, 'drumil', 'drumil@gmail.com', 'drumil', 1234567890, 'e-commerce', NULL),
(5, 'ravi', 'ravi@gmail.com', 'ravi', 1234567890, 'agroo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_table`
--

CREATE TABLE `department_table` (
  `Dept_ID` int(11) NOT NULL COMMENT 'Department id',
  `Dept_Name` varchar(50) NOT NULL COMMENT 'Department Name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_table`
--

INSERT INTO `department_table` (`Dept_ID`, `Dept_Name`) VALUES
(1, 'buby'),
(3, 'desktop-app'),
(4, 'IOS-developers'),
(5, 'python');

-- --------------------------------------------------------

--
-- Table structure for table `employee_designation_table`
--

CREATE TABLE `employee_designation_table` (
  `Des_ID` int(11) NOT NULL COMMENT 'Designation ID',
  `Des_Name` varchar(50) NOT NULL COMMENT 'Designation Name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_table`
--

CREATE TABLE `event_table` (
  `Event_ID` int(10) NOT NULL,
  `Event_Date` date NOT NULL COMMENT 'Event Date',
  `Event_Time` varchar(50) NOT NULL COMMENT 'Event Time',
  `Event_Title` varchar(200) NOT NULL COMMENT 'Event Title',
  `Event_Details` varchar(500) NOT NULL COMMENT 'Event Details'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_table`
--

INSERT INTO `event_table` (`Event_ID`, `Event_Date`, `Event_Time`, `Event_Title`, `Event_Details`) VALUES
(1, '2018-03-16', '12:00', 'tea ceremany', 'every '),
(2, '2018-03-01', '11:00', 'interview', 'all employee'),
(3, '2018-04-21', '11:00', 'project-fair', 'project-represention'),
(4, '2018-04-21', '11:00', 'hollyday', 'for every one');

-- --------------------------------------------------------

--
-- Table structure for table `leave_table`
--

CREATE TABLE `leave_table` (
  `Leave_ID` int(11) NOT NULL COMMENT 'Leave ID',
  `Emp_ID` int(11) NOT NULL COMMENT 'Employee ID',
  `From_Date` varchar(20) NOT NULL COMMENT 'Date',
  `To_Date` varchar(20) NOT NULL COMMENT 'Date',
  `Reason` varchar(20) NOT NULL COMMENT 'Reason for leave',
  `Leave_state` varchar(15) NOT NULL DEFAULT 'NOT- APPROVAL'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_table`
--

INSERT INTO `leave_table` (`Leave_ID`, `Emp_ID`, `From_Date`, `To_Date`, `Reason`, `Leave_state`) VALUES
(2, 1, '2018-03-01', '2018-03-02', 'medical', 'APPROVAL'),
(3, 3, '2018-04-10', '2018-04-20', 'for personal', 'APPROVAL');

-- --------------------------------------------------------

--
-- Table structure for table `project_detail_table`
--

CREATE TABLE `project_detail_table` (
  `P_ID` int(11) NOT NULL COMMENT 'Project ID',
  `P_Name` varchar(50) NOT NULL COMMENT 'Project Name',
  `Client_ID` int(11) NOT NULL COMMENT 'Client ID',
  `Project_Type` varchar(50) NOT NULL COMMENT 'Project Type',
  `Project_Working_Status` varchar(20) NOT NULL COMMENT 'Project Working Status',
  `Start_Date` date NOT NULL COMMENT 'Project Start Date',
  `End_Date` date NOT NULL COMMENT 'Project End Date'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_detail_table`
--

INSERT INTO `project_detail_table` (`P_ID`, `P_Name`, `Client_ID`, `Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date`) VALUES
(1, 'hotel', 1, 'web-develop', 'pending', '2018-03-13', '2018-03-20'),
(2, 'schoolsabc', 1, 'desktop', 'pending', '2018-03-20', '2018-03-20'),
(3, 'library', 2, 'desktop', 'pending', '2018-03-22', '2018-03-18'),
(4, 'transportation', 2, 'web-base ', 'pending', '2018-02-28', '2018-03-31'),
(8, 'itmanagement', 2, 'web-browser', 'pending', '2018-03-01', '2018-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `registration_table`
--

CREATE TABLE `registration_table` (
  `Name` varchar(50) NOT NULL COMMENT 'Username',
  `Email_ID` varchar(100) NOT NULL COMMENT 'Email_ID',
  `Password` varchar(32) NOT NULL COMMENT 'Password',
  `Gender` varchar(50) NOT NULL COMMENT 'Gender',
  `Address` varchar(250) NOT NULL COMMENT 'Address',
  `Mobile_No` varchar(10) NOT NULL COMMENT 'Mobile Number',
  `R_ID` int(10) NOT NULL,
  `Birthday` date NOT NULL,
  `Is_Allow` varchar(8) NOT NULL DEFAULT 'Deactive',
  `Dept_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration_table`
--

INSERT INTO `registration_table` (`Name`, `Email_ID`, `Password`, `Gender`, `Address`, `Mobile_No`, `R_ID`, `Birthday`, `Is_Allow`, `Dept_ID`) VALUES
('jorj', 'abc@gmail.com', 'abc', 'male', 'abc', '1234567890', 1, '2018-03-20', 'Active', 1),
('sagar', 'xyz@gmail.com', 'abc', 'male', 'xyz', '1234567890', 2, '2018-03-14', 'Active', 4),
('srikar', 'sky@gmail.com', 'abc', 'male', 'sky', '1234567800', 3, '2018-03-08', 'Active', 1),
('devrath', 'xyz@gmail.com', 'abc', 'male', 'xyzpqr', '1234567890', 7, '2018-03-14', 'Deactive', 1),
('welsa', 'xyz@gmail.com', 'abc', 'male', 'as3cgvjvhjvhjvhjb', '9876543210', 8, '2018-04-17', 'Active', 3),
('vatsal', 'xyz@gmail.com', 'abc', 'male', 'xyz', '1234567890', 9, '2018-03-14', 'Deactive', 4),
('akasha', 'akasha@gmail.com', 'akasha', 'female', 'nana-varachha', '1234567890', 10, '2018-05-17', 'Active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `task_table`
--

CREATE TABLE `task_table` (
  `Task_ID` int(11) NOT NULL COMMENT 'Project Task ID',
  `P_ID` int(11) NOT NULL COMMENT 'Project Id',
  `Emp_ID` varchar(250) NOT NULL COMMENT 'Employee Id',
  `Task_Details` varchar(50) NOT NULL COMMENT 'Task details',
  `Task_Status` varchar(20) NOT NULL COMMENT 'Task status'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_leader_table`
--

CREATE TABLE `team_leader_table` (
  `Team_ID` int(11) NOT NULL COMMENT 'Team ID',
  `Teamleader_ID` int(11) NOT NULL COMMENT 'Team Leader ID',
  `P_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_leader_table`
--

INSERT INTO `team_leader_table` (`Team_ID`, `Teamleader_ID`, `P_ID`) VALUES
(1, 1, 1),
(10, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `team_task_table`
--

CREATE TABLE `team_task_table` (
  `Task_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL COMMENT 'Employee ID',
  `P_ID` int(11) NOT NULL COMMENT 'Project ID',
  `Teamleader_ID` int(11) NOT NULL,
  `Task_Name` varchar(250) NOT NULL COMMENT 'Task Name',
  `Task_Details` varchar(500) NOT NULL COMMENT 'Task Details',
  `Task_Status` varchar(50) NOT NULL DEFAULT 'pandding' COMMENT 'Task Status',
  `Add_log` varchar(100) DEFAULT NULL COMMENT 'Add Log'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_task_table`
--

INSERT INTO `team_task_table` (`Task_ID`, `Emp_ID`, `P_ID`, `Teamleader_ID`, `Task_Name`, `Task_Details`, `Task_Status`, `Add_log`) VALUES
(1, 3, 1, 1, 'hotel manul', 'describe various categories', 'inprogress', ''),
(2, 3, 1, 1, 'worker', 'manage hotel worker', 'inprogress', '');

-- --------------------------------------------------------

--
-- Table structure for table `team_task_update_table`
--

CREATE TABLE `team_task_update_table` (
  `Update_ID` int(11) NOT NULL COMMENT 'Project Task Update ID',
  `Task_ID` int(11) NOT NULL COMMENT 'Task ID',
  `Emp_ID` int(11) NOT NULL COMMENT 'Employee ID',
  `Start_Date` date NOT NULL COMMENT 'Task Start Date',
  `End_Date` date NOT NULL COMMENT 'Task End Date',
  `Remark` varchar(150) NOT NULL COMMENT 'Task Remark',
  `Task_Status` varchar(100) NOT NULL COMMENT 'Task Status'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`Admin_Id`);

--
-- Indexes for table `attendance_table`
--
ALTER TABLE `attendance_table`
  ADD PRIMARY KEY (`A_ID`);

--
-- Indexes for table `client_details_table`
--
ALTER TABLE `client_details_table`
  ADD PRIMARY KEY (`Client_ID`);

--
-- Indexes for table `department_table`
--
ALTER TABLE `department_table`
  ADD PRIMARY KEY (`Dept_ID`);

--
-- Indexes for table `employee_designation_table`
--
ALTER TABLE `employee_designation_table`
  ADD PRIMARY KEY (`Des_ID`);

--
-- Indexes for table `event_table`
--
ALTER TABLE `event_table`
  ADD PRIMARY KEY (`Event_ID`);

--
-- Indexes for table `leave_table`
--
ALTER TABLE `leave_table`
  ADD PRIMARY KEY (`Leave_ID`);

--
-- Indexes for table `project_detail_table`
--
ALTER TABLE `project_detail_table`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `registration_table`
--
ALTER TABLE `registration_table`
  ADD PRIMARY KEY (`R_ID`);

--
-- Indexes for table `task_table`
--
ALTER TABLE `task_table`
  ADD PRIMARY KEY (`Task_ID`);

--
-- Indexes for table `team_leader_table`
--
ALTER TABLE `team_leader_table`
  ADD PRIMARY KEY (`Team_ID`);

--
-- Indexes for table `team_task_table`
--
ALTER TABLE `team_task_table`
  ADD PRIMARY KEY (`Task_ID`);

--
-- Indexes for table `team_task_update_table`
--
ALTER TABLE `team_task_update_table`
  ADD PRIMARY KEY (`Update_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `Admin_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance_table`
--
ALTER TABLE `attendance_table`
  MODIFY `A_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Attendence_ID', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client_details_table`
--
ALTER TABLE `client_details_table`
  MODIFY `Client_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Client id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department_table`
--
ALTER TABLE `department_table`
  MODIFY `Dept_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Department id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event_table`
--
ALTER TABLE `event_table`
  MODIFY `Event_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_table`
--
ALTER TABLE `leave_table`
  MODIFY `Leave_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Leave ID', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_detail_table`
--
ALTER TABLE `project_detail_table`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Project ID', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration_table`
--
ALTER TABLE `registration_table`
  MODIFY `R_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `task_table`
--
ALTER TABLE `task_table`
  MODIFY `Task_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Project Task ID';

--
-- AUTO_INCREMENT for table `team_leader_table`
--
ALTER TABLE `team_leader_table`
  MODIFY `Team_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Team ID', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team_task_table`
--
ALTER TABLE `team_task_table`
  MODIFY `Task_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_task_update_table`
--
ALTER TABLE `team_task_update_table`
  MODIFY `Update_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Project Task Update ID';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
