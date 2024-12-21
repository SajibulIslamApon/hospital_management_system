-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 21, 2024 at 04:41 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appointments`
--

CREATE TABLE `Appointments` (
  `appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(50) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Appointments`
--

INSERT INTO `Appointments` (`appointment_id`, `date`, `time`, `status`, `doctor_id`, `patient_id`, `department_id`) VALUES
(1, '2024-12-22', '09:00:00', 'Scheduled', 1, 1, 1),
(2, '2024-12-23', '10:30:00', 'Completed', 2, 2, 2),
(3, '2024-12-24', '11:15:00', 'Cancelled', 3, 3, 3),
(4, '2024-12-25', '14:00:00', 'Scheduled', 4, 4, 4),
(5, '2024-12-26', '16:45:00', 'Rescheduled', 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Departments`
--

CREATE TABLE `Departments` (
  `department_id` int(11) NOT NULL,
  `dep_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`department_id`, `dep_name`, `location`, `doctor_id`) VALUES
(1, 'Cardiology', 'Block A', 1),
(2, 'Neurology', 'Block B', 2),
(3, 'Pediatrics', 'Block C', 3),
(4, 'Orthopedics', 'Block D', 4),
(5, 'Dermatology', 'Block E', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Doctors`
--

CREATE TABLE `Doctors` (
  `doctor_id` int(11) NOT NULL,
  `doc_name` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `doc_phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Doctors`
--

INSERT INTO `Doctors` (`doctor_id`, `doc_name`, `specialization`, `doc_phone`) VALUES
(1, 'Dr. Alice Smith', 'Cardiology', '123-456-7890'),
(2, 'Dr. Bob Jones', 'Neurology', '234-567-8901'),
(3, 'Dr. Carol White', 'Pediatrics', '345-678-9012'),
(4, 'Dr. David Brown', 'Orthopedics', '456-789-0123'),
(5, 'Dr. Eve Black', 'Dermatology', '567-890-1234');

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `patient_id` int(11) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `p_phone` varchar(20) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Patients`
--

INSERT INTO `Patients` (`patient_id`, `p_name`, `age`, `gender`, `p_phone`, `doctor_id`) VALUES
(1, 'John Doe', 35, 'Male', '123-111-2222', 1),
(2, 'Jane Roe', 29, 'Female', '124-222-3333', 2),
(3, 'Jim Beam', 40, 'Male', '125-333-4444', 3),
(4, 'Emily Stone', 25, 'Female', '126-444-5555', 4),
(5, 'Michael Brown', 50, 'Male', '127-555-6666', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appointments`
--
ALTER TABLE `Appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Appointments`
--
ALTER TABLE `Appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Departments`
--
ALTER TABLE `Departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Patients`
--
ALTER TABLE `Patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Appointments`
--
ALTER TABLE `Appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Departments`
--
ALTER TABLE `Departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Patients`
--
ALTER TABLE `Patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
