-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 06:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happy_paws`
--

-- --------------------------------------------------------

--
-- Table structure for table `pet_care_center`
--

CREATE TABLE `pet_care_center` (
  `care_center_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cetificate` mediumblob NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `contact_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet_care_center`
--

INSERT INTO `pet_care_center` (`care_center_id`, `user_id`, `name`, `cetificate`, `district`, `city`, `street`, `contact_no`) VALUES
(1, 4, 'Pet Oasis Center', '', 'Kalutara', 'Panadura', '1/23,Horana road,Wekada', '0382233445');

-- --------------------------------------------------------

--
-- Table structure for table `pet_owner`
--

CREATE TABLE `pet_owner` (
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `num_pets` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet_owner`
--

INSERT INTO `pet_owner` (`owner_id`, `user_id`, `f_name`, `l_name`, `age`, `district`, `city`, `street`, `contact_no`, `num_pets`) VALUES
(1, 1, 'Chaminda', 'Perera', 34, 'Kalutara', 'Bandaragama', '5/3 temple street', '0711234567', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pet_sitter`
--

CREATE TABLE `pet_sitter` (
  `sitter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `years_exp` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet_sitter`
--

INSERT INTO `pet_sitter` (`sitter_id`, `user_id`, `f_name`, `l_name`, `age`, `gender`, `district`, `city`, `street`, `contact_no`, `years_exp`) VALUES
(1, 3, 'Kasun ', 'Jayasinghe', 32, 'M', 'Kalutara', 'Wadduwa', '12/2,wijaya street', '0771234567', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `pharmacy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `certificate` mediumblob NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `contact_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`pharmacy_id`, `user_id`, `name`, `certificate`, `district`, `city`, `street`, `contact_no`) VALUES
(1, 5, 'Pet Pharmacy', '', 'Colombo', 'Moratuwa', '8/23,Galle road', '0722222111');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `user_id` int(11) NOT NULL,
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`user_id`, `role`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `active_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `created_at`, `active_status`) VALUES
(1, 'ChamindaPerera', 'chaminda.perera@example.lk', 'password123', '2024-11-13 04:33:36', 1),
(2, 'NiroshanSilva', 'niroshan.silva@example.lk', '123456', '2024-11-13 04:33:36', 1),
(3, 'KasunJayasinghe', 'kasun.jayasinghe@example.lk', 'mypassword', '2024-11-13 04:33:36', 1),
(4, 'DineshFernando', 'dinesh.fernando@example.lk', 'securepass', '2024-11-13 04:33:36', 1),
(5, 'ShashikaWijesinghe', 'shashika.wijesinghe@example.lk', 'shashika123', '2024-11-13 04:33:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `veterinary_surgeon`
--

CREATE TABLE `veterinary_surgeon` (
  `vet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `license_no` varchar(50) NOT NULL,
  `certificate` mediumblob DEFAULT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `district` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(150) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `years_exp` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `veterinary_surgeon`
--

INSERT INTO `veterinary_surgeon` (`vet_id`, `user_id`, `license_no`, `certificate`, `f_name`, `l_name`, `age`, `gender`, `district`, `city`, `street`, `contact_no`, `years_exp`) VALUES
(1, 2, 'SLVC/VET/1234', '', 'niroshan', 'silva', 36, 'M', 'kalutara', 'panadura', '23/2 ,jaya street,Wekada', '0712345678', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pet_care_center`
--
ALTER TABLE `pet_care_center`
  ADD PRIMARY KEY (`care_center_id`),
  ADD KEY `care_center_id` (`care_center_id`),
  ADD KEY `care_center_id_2` (`care_center_id`),
  ADD KEY `care_center_id_3` (`care_center_id`),
  ADD KEY `fk_pet_care_center_user` (`user_id`);

--
-- Indexes for table `pet_owner`
--
ALTER TABLE `pet_owner`
  ADD PRIMARY KEY (`owner_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `fk_pet_owner_user` (`user_id`);

--
-- Indexes for table `pet_sitter`
--
ALTER TABLE `pet_sitter`
  ADD PRIMARY KEY (`sitter_id`),
  ADD KEY `sitter_id` (`sitter_id`),
  ADD KEY `sitter_id_2` (`sitter_id`),
  ADD KEY `fk_pet_sitter_user` (`user_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`pharmacy_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
  ADD KEY `pharmacy_id_2` (`pharmacy_id`),
  ADD KEY `pharmacy_id_3` (`pharmacy_id`),
  ADD KEY `fk_pharmacy_user` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`user_id`,`role`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `veterinary_surgeon`
--
ALTER TABLE `veterinary_surgeon`
  ADD PRIMARY KEY (`vet_id`),
  ADD KEY `vet_id` (`vet_id`),
  ADD KEY `fk_veterinary_surgeon_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pet_care_center`
--
ALTER TABLE `pet_care_center`
  MODIFY `care_center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pet_owner`
--
ALTER TABLE `pet_owner`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pet_sitter`
--
ALTER TABLE `pet_sitter`
  MODIFY `sitter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `pharmacy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `veterinary_surgeon`
--
ALTER TABLE `veterinary_surgeon`
  MODIFY `vet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pet_care_center`
--
ALTER TABLE `pet_care_center`
  ADD CONSTRAINT `fk_pet_care_center_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `pet_owner`
--
ALTER TABLE `pet_owner`
  ADD CONSTRAINT `fk_pet_owner_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `pet_sitter`
--
ALTER TABLE `pet_sitter`
  ADD CONSTRAINT `fk_pet_sitter_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD CONSTRAINT `fk_pharmacy_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `fk_roles_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `veterinary_surgeon`
--
ALTER TABLE `veterinary_surgeon`
  ADD CONSTRAINT `fk_veterinary_surgeon_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
