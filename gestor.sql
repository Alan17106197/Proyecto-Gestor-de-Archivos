-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-12-2020 a las 09:33:01
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_archivos`
--

CREATE TABLE `t_archivos` (
  `id_archivo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `ruta` text DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_archivos`
--

INSERT INTO `t_archivos` (`id_archivo`, `id_usuario`, `id_categoria`, `nombre`, `tipo`, `ruta`, `fecha`) VALUES
(2, 12, 4, 'Sin título.png', 'png', '../../archivos/12/Sin título.png', '2020-12-29 23:46:18'),
(3, 11, 3, 'Sin título - copia.png', 'png', '../../archivos/11/Sin título - copia.png', '2020-12-30 00:33:39'),
(7, 11, 3, 'Calendario_Academico_Ciclo_Escolar_2020-2021.pdf', 'pdf', '../../archivos/11/Calendario_Academico_Ciclo_Escolar_2020-2021.pdf', '2020-12-30 01:25:56'),
(8, 11, 3, 'Educar en valores corto sobre bullying.mp4', 'mp4', '../../archivos/11/Educar en valores corto sobre bullying.mp4', '2020-12-30 02:26:05'),
(9, 11, 3, 'Promo.jpg', 'jpg', '../../archivos/11/Promo.jpg', '2020-12-30 02:26:21'),
(10, 11, 3, 'Dash Berlin feat. Emma Hewitt - Disarm Yourself (Official Music Video).mp3', 'mp3', '../../archivos/11/Dash Berlin feat. Emma Hewitt - Disarm Yourself (Official Music Video).mp3', '2020-12-30 02:26:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_categorias`
--

CREATE TABLE `t_categorias` (
  `id_categoria` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fechaInsert` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_categorias`
--

INSERT INTO `t_categorias` (`id_categoria`, `id_usuario`, `nombre`, `fechaInsert`) VALUES
(3, 11, 'Peliculas20', '2020-12-29 19:11:33'),
(4, 12, 'ProyectoPrueba1', '2020-12-29 23:45:31'),
(5, 12, 'ProyectoPrueba2', '2020-12-29 23:45:37'),
(6, 12, 'ProyectoPrueba3', '2020-12-29 23:45:42'),
(7, 11, 'Tesis', '2020-12-30 01:08:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `email` varchar(245) DEFAULT NULL,
  `usuario` varchar(245) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `insert` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_usuarios`
--

INSERT INTO `t_usuarios` (`id_usuario`, `nombre`, `fechaNacimiento`, `email`, `usuario`, `password`, `insert`) VALUES
(3, 'Alan', '1998-06-25', 'alandejesus98@hotmail.com', 'usuario1', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2020-12-29 02:16:04'),
(11, 'Jesus', '2020-12-11', 'alanjesusjesus2015@gmail.com', 'usuario2', '6a62415b43a0268f38f117f076dce135705d7895', '2020-12-29 12:56:06'),
(12, 'Adrian', '2020-12-09', 'pepe@hotmail.com', '123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2020-12-29 23:44:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_archivos`
--
ALTER TABLE `t_archivos`
  ADD PRIMARY KEY (`id_archivo`),
  ADD KEY `fkArchivosCategorias_idx` (`id_categoria`),
  ADD KEY `fkUsuariosArchivos_idx` (`id_usuario`);

--
-- Indices de la tabla `t_categorias`
--
ALTER TABLE `t_categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `fkCategoriaUsuario_idx` (`id_usuario`);

--
-- Indices de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_archivos`
--
ALTER TABLE `t_archivos`
  MODIFY `id_archivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_categorias`
--
ALTER TABLE `t_categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_archivos`
--
ALTER TABLE `t_archivos`
  ADD CONSTRAINT `fkArchivosCategorias` FOREIGN KEY (`id_categoria`) REFERENCES `t_categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkUsuariosArchivos` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_categorias`
--
ALTER TABLE `t_categorias`
  ADD CONSTRAINT `fkCategoriaUsuario` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
