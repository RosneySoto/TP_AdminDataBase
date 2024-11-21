-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2024 a las 02:42:32
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
-- Base de datos: `tp1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donmaldiciones`
--

CREATE TABLE `donmaldiciones` (
  `IdDonMaldicion` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `donmaldiciones`
--

INSERT INTO `donmaldiciones` (`IdDonMaldicion`, `Nombre`) VALUES
(1, 'Telequinesis'),
(2, 'Invisibilidad'),
(3, 'Vuelo'),
(4, 'Superfuerza'),
(5, 'Control del Fuego'),
(6, 'Velocidad Sobrehumana'),
(7, 'Curación Rápida'),
(8, 'Control del Agua'),
(9, 'Lectura de Mentes'),
(10, 'Inmortalidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidades`
--

CREATE TABLE `nacionalidades` (
  `IdNacionalidad` int(11) NOT NULL,
  `Pais` varchar(40) NOT NULL,
  `Nacionalidad` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `nacionalidades`
--

INSERT INTO `nacionalidades` (`IdNacionalidad`, `Pais`, `Nacionalidad`) VALUES
(1, 'Argentina', 'Argentino'),
(2, 'Brasil', 'Brasileño'),
(3, 'Chile', 'Chileno'),
(4, 'Perú', 'Peruano'),
(5, 'México', 'Mexicano'),
(6, 'España', 'Español'),
(7, 'Italia', 'Italiano'),
(8, 'Francia', 'Francés'),
(9, 'Japón', 'Japonés'),
(10, 'Canadá', 'Canadiense');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `IdPersonaje` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `Nivel` int(11) NOT NULL DEFAULT 1,
  `Peso` int(11) NOT NULL,
  `Altura` double NOT NULL,
  `Pelo` varchar(40) NOT NULL,
  `Sexo` enum('Masculino','Femenino') NOT NULL,
  `Edad` int(11) NOT NULL,
  `ColorOjos` varchar(20) DEFAULT NULL,
  `IdDonMaldicion` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `IdNacionalidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`IdPersonaje`, `Nombre`, `Apellido`, `Nivel`, `Peso`, `Altura`, `Pelo`, `Sexo`, `Edad`, `ColorOjos`, `IdDonMaldicion`, `idUser`, `IdNacionalidad`) VALUES
(1, 'Lucas', 'Martínez', 5, 80, 1.8, 'Negro', 'Masculino', 25, 'Marrón', 1, 1, 1),
(2, 'Marta', 'García', 10, 70, 1.7, 'Rubio', 'Femenino', 30, 'Verde', 2, 2, 2),
(3, 'Carlos', 'Fernández', 7, 90, 1.85, 'Castaño', 'Masculino', 35, 'Azul', 3, 3, 3),
(4, 'Ana', 'Rodríguez', 8, 60, 1.65, 'Negro', 'Femenino', 28, 'Gris', 4, 4, 4),
(5, 'Javier', 'López', 12, 75, 1.75, 'Castaño', 'Masculino', 40, 'Negro', 5, 5, 5),
(6, 'Laura', 'Martínez', 9, 68, 1.68, 'Rubio', 'Femenino', 32, 'Verde', 6, 6, 6),
(7, 'Miguel', 'Sánchez', 11, 85, 1.78, 'Castaño', 'Masculino', 27, 'Marrón', 7, 7, 7),
(8, 'Raquel', 'Romero', 13, 64, 1.72, 'Negro', 'Femenino', 26, 'Negro', 8, 8, 8),
(9, 'Fernando', 'Domínguez', 15, 95, 1.9, 'Castaño', 'Masculino', 38, 'Azul', 9, 9, 9),
(10, 'Diana', 'Riera', 9, 85, 1.9, 'Castaño', 'Femenino', 22, 'Azul', 9, 8, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE `rols` (
  `idRol` int(11) NOT NULL,
  `TipoJugador` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rols`
--

INSERT INTO `rols` (`idRol`, `TipoJugador`) VALUES
(1, 'Jugador'),
(2, 'Dungeon Master');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUser` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Apellido` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Contrasena` varchar(40) NOT NULL,
  `idRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUser`, `Nombre`, `Apellido`, `Email`, `Contrasena`, `idRol`) VALUES
(1, 'Lucas', 'Martínez', 'lucas.martinez@example.com', 'pass123', 1),
(2, 'Marta', 'García', 'marta.garcia@example.com', 'pass123', 2),
(3, 'Carlos', 'Fernández', 'carlos.fernandez@example.com', 'pass123', 1),
(4, 'Ana', 'Rodríguez', 'ana.rodriguez@example.com', 'pass123', 1),
(5, 'Javier', 'López', 'javier.lopez@example.com', 'pass123', 2),
(6, 'Laura', 'Martínez', 'laura.martinez@example.com', 'pass123', 1),
(7, 'Miguel', 'Sánchez', 'miguel.sanchez@example.com', 'pass123', 1),
(8, 'Raquel', 'Romero', 'raquel.romero@example.com', 'pass123', 2),
(9, 'Fernando', 'Domínguez', 'fernando.dominguez@example.com', 'pass123', 1),
(10, 'Diana', 'Riera', 'diana.riera@example.com', 'pass123', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `donmaldiciones`
--
ALTER TABLE `donmaldiciones`
  ADD PRIMARY KEY (`IdDonMaldicion`);

--
-- Indices de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  ADD PRIMARY KEY (`IdNacionalidad`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`IdPersonaje`),
  ADD KEY `Characters_nationality_id_foreign_idx` (`IdNacionalidad`),
  ADD KEY `donDamn_id` (`IdDonMaldicion`),
  ADD KEY `user_id` (`idUser`);

--
-- Indices de la tabla `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `rol_id` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `donmaldiciones`
--
ALTER TABLE `donmaldiciones`
  MODIFY `IdDonMaldicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  MODIFY `IdNacionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `IdPersonaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `rols`
--
ALTER TABLE `rols`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `Characters_nationality_id_foreign_idx` FOREIGN KEY (`IdNacionalidad`) REFERENCES `nacionalidades` (`IdNacionalidad`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Personajes_ibfk_5` FOREIGN KEY (`IdDonMaldicion`) REFERENCES `donmaldiciones` (`IdDonMaldicion`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Personajes_ibfk_6` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idUser`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rols` (`idRol`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
