-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2019 a las 01:11:31
-- Versión del servidor: 5.5.57-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `Zombies`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
(1, 'Infeccion'),
(2, 'Coma');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie`
--

CREATE TABLE IF NOT EXISTS `zombie` (
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL,
  `hora_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zombie`
--

INSERT INTO `zombie` (`nombre`, `apellido`, `estado`, `hora_fecha`) VALUES
('Marla', 'Galvan', 1, '2019-04-02 23:00:02'),
('Carlos', 'Negrete', 1, '2019-04-02 23:17:44'),
('Hola', 'Mundo', 2, '2019-04-02 23:33:53'),
('Cristian', 'Castro', 4, '2019-04-02 23:54:18'),
('Erendira', 'Guadalupe', 4, '2019-04-03 00:47:57'),
('Julia', 'Galvan', 3, '2019-04-03 00:48:19'),
('Rodolfo', 'Galvan ', 1, '2019-04-03 00:48:45'),
('Zombie', 'Hernandez', 1, '2019-04-03 00:49:14'),
('Benito', 'Juarez', 1, '2019-04-03 00:49:23'),
('Javier', 'Iñiguez', 1, '2019-04-03 00:50:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
