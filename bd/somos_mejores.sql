-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2020 at 03:25 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `somos_mejores`
--

-- --------------------------------------------------------

--
-- Table structure for table `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `rut` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `apellidoPaterno` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `apellidoMaterno` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `fecha` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `hora` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `horaSalida` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `activa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `asistencia`
--

INSERT INTO `asistencia` (`id`, `rut`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fecha`, `hora`, `horaSalida`, `activa`) VALUES
(1, '2222222-2', 'Valeria', 'Rosales', 'Dominguez', '28/06/2020', '22:54:34', 'No Registrada', 1),
(2, '1111111-1', 'Rebecca', 'Vasquez', 'Nunez', '28/06/2020', '22:55:51', '22:55:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `docente`
--

CREATE TABLE `docente` (
  `rut` varchar(15) COLLATE utf8_general_mysql500_ci NOT NULL,
  `nombre` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `apellidoPaterno` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `apellidoMaterno` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `tipoUsuario` int(11) NOT NULL,
  `foto` varchar(25) COLLATE utf8_general_mysql500_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `docente`
--

INSERT INTO `docente` (`rut`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `tipoUsuario`, `foto`, `username`, `password`, `estado`) VALUES
('1111111-1', 'Rebecca', 'Vasquez', 'Nunez', 1, 'foto3.jpg', 'rvasquez0', '123456', 0),
('2222222-2', 'Maria', 'Rosales', 'Dominguez', 2, 'foto3.jpg', 'vrosales0', '654321', 0),
('33333333-3', 'Ramon', 'Benitez', 'Saavedra', 3, 'foto3.jpg', 'rbenitez0', '123456', 0),
('44444444-4', 'Roman', 'Benitez', 'Ramos', 4, 'foto3.jpg', 'rbenitez1', '456321', 0),
('5555555-5', 'Valentina', 'Ramirez', 'Martinez', 4, 'foto3.jpg', 'vramirez0', '123654', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`rut`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
