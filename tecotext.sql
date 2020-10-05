-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2020 a las 22:34:24
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecotext`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_articulos`
--

CREATE TABLE `stock_articulos` (
  `CODIGO` int(11) NOT NULL,
  `CODGACI` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_articulos`
--

INSERT INTO `stock_articulos` (`CODIGO`, `CODGACI`, `DESCRIPCION`) VALUES
(1, 'T01-56', 'TORNILLO DE ACERO MICROMETRICO ACO 8'),
(1, 'T01-57', 'TORNILLO DE ACERO ZULTZER'),
(1, 'T01-58', 'TORNILLO DE DEBASTACION SLATFOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_codigos`
--

CREATE TABLE `stock_codigos` (
  `CODVALE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_codigos`
--

INSERT INTO `stock_codigos` (`CODVALE`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74),
(75),
(76),
(77),
(78),
(79),
(80),
(81),
(82),
(83),
(84),
(85),
(86),
(87),
(88),
(89),
(90),
(91),
(92);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_legajos`
--

CREATE TABLE `stock_legajos` (
  `LEGAJO` int(11) NOT NULL,
  `NOMBRE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_legajos`
--

INSERT INTO `stock_legajos` (`LEGAJO`, `NOMBRE`) VALUES
(1, 'Agustin'),
(4, 'Walter'),
(6, 'Cecilia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_vales`
--

CREATE TABLE `stock_vales` (
  `CODIGO` int(11) NOT NULL,
  `CODGACI` varchar(255) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `LEGAJO` int(11) NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `VALE` int(11) NOT NULL,
  `FECHA` date NOT NULL DEFAULT current_timestamp(),
  `HORA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_vales`
--

INSERT INTO `stock_vales` (`CODIGO`, `CODGACI`, `DESCRIPCION`, `CANTIDAD`, `LEGAJO`, `NOMBRE`, `VALE`, `FECHA`, `HORA`) VALUES
(1, 'T01-58', 'TORNILLO DE DEBASTACION SLATFOR', 1, 1, 'Agustin', 64, '0000-00-00', '21:43'),
(1, 'T01-58', 'TORNILLO DE DEBASTACION SLATFOR', 1, 1, 'Agustin', 66, '2020-10-05', '21:45'),
(1, 'T01-57', 'TORNILLO DE ACERO ZULTZER', 1, 1, 'Agustin', 67, '2020-10-05', '21:46'),
(1, 'T01-57', 'TORNILLO DE ACERO ZULTZER', 1, 1, 'Agustin', 68, '2020-10-05', '16:47'),
(1, 'T01-57', 'TORNILLO DE ACERO ZULTZER', 1, 1, 'Agustin', 69, '2020-10-05', '16:49'),
(1, 'T01-58', 'TORNILLO DE DEBASTACION SLATFOR', 1, 1, 'Agustin', 71, '2020-10-05', '17:03'),
(1, 'T01-58', 'TORNILLO DE DEBASTACION SLATFOR', 3, 6, 'Cecilia', 84, '2020-10-05', '17:28'),
(1, 'T01-56', 'TORNILLO DE ACERO MICROMETRICO ACO 8', 1, 1, 'Agustin', 90, '2020-10-05', '17:31'),
(1, 'T01-58', 'TORNILLO DE DEBASTACION SLATFOR', 3, 4, 'Walter', 91, '2020-10-05', '17:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `stock_articulos`
--
ALTER TABLE `stock_articulos`
  ADD PRIMARY KEY (`CODGACI`);

--
-- Indices de la tabla `stock_codigos`
--
ALTER TABLE `stock_codigos`
  ADD UNIQUE KEY `CODVALE` (`CODVALE`);

--
-- Indices de la tabla `stock_legajos`
--
ALTER TABLE `stock_legajos`
  ADD PRIMARY KEY (`LEGAJO`);

--
-- Indices de la tabla `stock_vales`
--
ALTER TABLE `stock_vales`
  ADD PRIMARY KEY (`VALE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `stock_codigos`
--
ALTER TABLE `stock_codigos`
  MODIFY `CODVALE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `stock_legajos`
--
ALTER TABLE `stock_legajos`
  MODIFY `LEGAJO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
