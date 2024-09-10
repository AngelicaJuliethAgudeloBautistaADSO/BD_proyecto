-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-09-2024 a las 07:58:41
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_datos_spa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'crear citas'),
(2, 'leer citas'),
(3, 'modificar citas'),
(4, 'eliminar citas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'cliente'),
(2, 'cosmetólogo'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_permisos`
--

CREATE TABLE `roles_permisos` (
  `rol_id` int NOT NULL,
  `permiso_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles_permisos`
--

INSERT INTO `roles_permisos` (`rol_id`, `permiso_id`) VALUES
(1, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(2, 3),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int NOT NULL,
  `nom_admin` varchar(30) NOT NULL,
  `apell_admin` varchar(30) NOT NULL,
  `document_admin` int NOT NULL,
  `id_rol_fk` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cita`
--

CREATE TABLE `tb_cita` (
  `cod_cita` int NOT NULL,
  `id_cliente_FK` int NOT NULL,
  `id_cosmetolo_FK` int NOT NULL,
  `fech_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `cod_servicio_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id_cliente` int NOT NULL,
  `nom_cliente` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apell_cliente` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_cliente` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `document_cliente` int NOT NULL,
  `genero_cliente` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telef_cliente` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_cliente` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rol_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_cliente`
--

INSERT INTO `tb_cliente` (`id_cliente`, `nom_cliente`, `apell_cliente`, `tipo_cliente`, `document_cliente`, `genero_cliente`, `telef_cliente`, `email_cliente`, `contrasena`, `rol_fk`) VALUES
(1, 'angelica', 'agudelo', 'c.c', 1095909321, 'mujer', '3165694299', 'angelica@gmail.com', 'angelica123', 1),
(2, 'julieth', 'bautista', 't.i', 15987456, 'mujer', '3165985789', 'julieth@gmail.com', 'julieth123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cosmetolo`
--

CREATE TABLE `tb_cosmetolo` (
  `id_cosmetolo` int NOT NULL,
  `nom_cosmetolo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telef_cosmetolo` int NOT NULL,
  `especi_cosmetolo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rol_fk` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_servicios`
--

CREATE TABLE `tb_servicios` (
  `cod_servicio` int NOT NULL,
  `nom_servicio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descrip_servicio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tiemp_servicio` int NOT NULL,
  `costo_servicio` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD PRIMARY KEY (`rol_id`,`permiso_id`),
  ADD KEY `permiso_id` (`permiso_id`);

--
-- Indices de la tabla `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol_fk` (`id_rol_fk`);

--
-- Indices de la tabla `tb_cita`
--
ALTER TABLE `tb_cita`
  ADD PRIMARY KEY (`cod_cita`),
  ADD KEY `id_cliente_FK` (`id_cliente_FK`),
  ADD KEY `id_cosmetolo_FK` (`id_cosmetolo_FK`),
  ADD KEY `cod_servicio_fk` (`cod_servicio_fk`);

--
-- Indices de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `rol_fk` (`rol_fk`);

--
-- Indices de la tabla `tb_cosmetolo`
--
ALTER TABLE `tb_cosmetolo`
  ADD PRIMARY KEY (`id_cosmetolo`),
  ADD KEY `rol_fk` (`rol_fk`);

--
-- Indices de la tabla `tb_servicios`
--
ALTER TABLE `tb_servicios`
  ADD PRIMARY KEY (`cod_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  MODIFY `rol_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_cita`
--
ALTER TABLE `tb_cita`
  MODIFY `cod_cita` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_cosmetolo`
--
ALTER TABLE `tb_cosmetolo`
  MODIFY `id_cosmetolo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_servicios`
--
ALTER TABLE `tb_servicios`
  MODIFY `cod_servicio` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `roles_permisos` (`permiso_id`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `roles_permisos` (`rol_id`);

--
-- Filtros para la tabla `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`id_rol_fk`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `tb_cita`
--
ALTER TABLE `tb_cita`
  ADD CONSTRAINT `tb_cita_ibfk_4` FOREIGN KEY (`id_cliente_FK`) REFERENCES `tb_cliente` (`id_cliente`),
  ADD CONSTRAINT `tb_cita_ibfk_5` FOREIGN KEY (`id_cosmetolo_FK`) REFERENCES `tb_cosmetolo` (`id_cosmetolo`),
  ADD CONSTRAINT `tb_cita_ibfk_6` FOREIGN KEY (`cod_servicio_fk`) REFERENCES `tb_servicios` (`cod_servicio`);

--
-- Filtros para la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD CONSTRAINT `tb_cliente_ibfk_1` FOREIGN KEY (`rol_fk`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `tb_cliente_ibfk_2` FOREIGN KEY (`rol_fk`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `tb_cosmetolo`
--
ALTER TABLE `tb_cosmetolo`
  ADD CONSTRAINT `tb_cosmetolo_ibfk_1` FOREIGN KEY (`rol_fk`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
