-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2020 a las 14:14:31
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basededatos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `MUESTRA_CLIENTES` (IN `BMATRICULA` VARCHAR(46))  SELECT NOMBRE_CLIENTE FROM CLIENTE WHERE ID_CLIENTE IN (SELECT ID_CLIENTEC FROM COCHE WHERE MATRICULA_COCHE=BMATRICULA)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MUESTRA_EMPEADO` (`BNOMBRE` VARCHAR(46))  SELECT NOMBRE_CLIENTE FROM CLIENTE WHERE ID_CLIENTE IN (SELECT ID_CLIENTEC FROM NOMBRE WHERE EMPLEADOS_NOMBRE=BNOMBRE)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `DNI` varchar(46) NOT NULL,
  `Nombre` varchar(46) NOT NULL,
  `Apellido1` varchar(46) NOT NULL,
  `Apellido2` varchar(46) NOT NULL,
  `Dirección` varchar(46) NOT NULL,
  `Teléfono` varchar(46) NOT NULL,
  `Email` varchar(46) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `DNI`, `Nombre`, `Apellido1`, `Apellido2`, `Dirección`, `Teléfono`, `Email`) VALUES
(0, '598688441J', 'Pepe', 'Gonzalez', 'Rodriguez', 'Calle Alfarería 45', '641876397', 'pepegonzalez@gmail.com'),
(0, '598688441K', 'Rocio', 'Sanchez', 'Sanchez', 'Calle Marqués 14', '641475391', 'desconocido@gmail.com'),
(0, '598688441L', 'Mario', 'Rezandero ', 'Hierro', 'Calle La isla 6', '641876344', 'mariohierro@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

CREATE TABLE `coches` (
  `id_coches` int(11) NOT NULL,
  `Marca` varchar(46) NOT NULL,
  `Modelo` varchar(46) NOT NULL,
  `Tipo` text NOT NULL,
  `Matricula` varchar(46) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coches`
--

INSERT INTO `coches` (`id_coches`, `Marca`, `Modelo`, `Tipo`, `Matricula`) VALUES
(0, 'Seat', 'Ibiza 2019', '1,0 L 3 motor en línea, 1,0 L 3 motor en línea Gas natural vehicular, 1,6 L 4 motor en línea diésel', '53945LLL'),
(0, 'Audi', 'audi a3', 'L 3 motor en línea, 1,4 L 4 motor en línea', '4396LMK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleados` int(11) NOT NULL,
  `DNI` varchar(46) NOT NULL,
  `Nombre` varchar(46) NOT NULL,
  `Apellidos1` varchar(46) NOT NULL,
  `Apellidos2` varchar(46) NOT NULL,
  `Dirección` varchar(46) NOT NULL,
  `Teléfono` varchar(46) NOT NULL,
  `Email` varchar(46) NOT NULL,
  `Sueldo` varchar(46) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleados`, `DNI`, `Nombre`, `Apellidos1`, `Apellidos2`, `Dirección`, `Teléfono`, `Email`, `Sueldo`) VALUES
(0, '594875846L', 'Marcos', 'Fernandez', 'Gomez', 'Calle Plaza nueva 55', '65487', '', ''),
(0, '594875846K', '', '', '', '', '', '', ''),
(0, '594875846L', 'Ana', 'Gomez', 'Martinez', 'Calle Iglesia 9', '626541974', 'confesionarioAG@gmail.com', '1200'),
(0, '594875889M', 'Marcos', 'Hidalgo', 'Sanchez', 'Calle Perez 55 ', '626541444', 'confesionarioMH@gmail.com', '1207');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
