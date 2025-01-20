-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2025 a las 21:35:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_login`
--
CREATE DATABASE IF NOT EXISTS `proyecto_login` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto_login`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono`
--

CREATE TABLE `abono` (
  `id` int(11) NOT NULL,
  `kil_os` decimal(10,2) NOT NULL,
  `fech_a` date NOT NULL,
  `fech_reg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `responsable` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `razon` varchar(100) NOT NULL,
  `fech_gas` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_perdida`
--

CREATE TABLE `historial_perdida` (
  `id` int(11) NOT NULL,
  `cantidad_inicial` int(11) DEFAULT NULL,
  `cantidad_perdida` int(11) DEFAULT NULL,
  `cantidad_efectiva` int(11) DEFAULT NULL,
  `plantas_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nombre_comun` varchar(255) DEFAULT NULL,
  `fecha_siembra` date DEFAULT NULL,
  `fecha_trasplante` date DEFAULT NULL,
  `fecha_traslado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `humus`
--

CREATE TABLE `humus` (
  `id` int(11) NOT NULL,
  `tipo_h` set('liquido','solido') NOT NULL COMMENT 'tipo de humus (liquido o solido)',
  `cantidad_h` decimal(10,2) NOT NULL,
  `fecha_rh` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantas`
--

CREATE TABLE `plantas` (
  `id` int(11) NOT NULL,
  `nombre_comun` varchar(50) NOT NULL,
  `nombre_cien` varchar(50) NOT NULL,
  `fecha_siembra` date NOT NULL,
  `etapa` text NOT NULL,
  `tipo` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta_traslado`
--

CREATE TABLE `planta_traslado` (
  `id` int(11) NOT NULL,
  `plantas_id` int(11) NOT NULL,
  `fecha_traslado` date NOT NULL,
  `cantidad_t` int(250) NOT NULL,
  `observ` text NOT NULL,
  `perdida` int(11) DEFAULT 0,
  `ubicacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta_trasplante`
--

CREATE TABLE `planta_trasplante` (
  `id` int(11) NOT NULL,
  `plantas_id` int(11) NOT NULL,
  `fecha_trasplante` date NOT NULL,
  `cantidad` int(250) NOT NULL,
  `observacion` text NOT NULL,
  `perdida_t` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(70) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_perdida`
--
ALTER TABLE `historial_perdida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `humus`
--
ALTER TABLE `humus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cien`);

--
-- Indices de la tabla `planta_traslado`
--
ALTER TABLE `planta_traslado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `planta_id` (`plantas_id`);

--
-- Indices de la tabla `planta_trasplante`
--
ALTER TABLE `planta_trasplante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `planta_id` (`plantas_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`username`),
  ADD KEY `IDRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abono`
--
ALTER TABLE `abono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_perdida`
--
ALTER TABLE `historial_perdida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `humus`
--
ALTER TABLE `humus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantas`
--
ALTER TABLE `plantas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planta_traslado`
--
ALTER TABLE `planta_traslado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planta_trasplante`
--
ALTER TABLE `planta_trasplante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `planta_traslado`
--
ALTER TABLE `planta_traslado`
  ADD CONSTRAINT `fk_planta_traslado` FOREIGN KEY (`plantas_id`) REFERENCES `plantas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
