-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2020 a las 22:59:12
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comidas`
--

CREATE TABLE `comidas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `precio` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comidas`
--

INSERT INTO `comidas` (`id`, `tipo`, `precio`, `created_at`, `updated_at`) VALUES
(1, 'bartender', 400, '2020-12-13 23:47:36', '2020-12-13 23:47:36'),
(2, 'cervecero', 200, '2020-12-13 23:47:36', '2020-12-13 23:47:36'),
(3, 'cocinero', 600, '2020-12-13 23:47:36', '2020-12-13 23:47:36'),
(4, 'candy', 150, '2020-12-13 23:47:36', '2020-12-13 23:47:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_mesas`
--

CREATE TABLE `estado_mesas` (
  `id` int(11) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_mesas`
--

INSERT INTO `estado_mesas` (`id`, `estado`) VALUES
(1, 'con cliente esperando pedido'),
(2, 'con clientes comiendo'),
(3, 'con clientes pagando'),
(4, 'cerrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedidos`
--

CREATE TABLE `estado_pedidos` (
  `id` int(11) NOT NULL,
  `estadoPedido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `idEstado`, `created_at`, `updated_at`) VALUES
(11111, 1, '2020-12-13 23:37:44', '2020-12-13 23:37:44'),
(22222, 2, '2020-12-13 23:43:52', '2020-12-13 23:43:52'),
(33333, 3, '2020-12-13 23:43:52', '2020-12-13 23:43:52'),
(44444, 1, '2020-12-13 23:43:52', '2020-12-14 04:03:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_pedidos`
--

CREATE TABLE `mesa_pedidos` (
  `id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` varchar(11) NOT NULL,
  `nombre_cliente` varchar(60) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `tiempoEstimadoPreparacion` int(11) NOT NULL,
  `tiempoRestantePedido` int(11) NOT NULL,
  `costoTotal` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `nombre_cliente`, `idMesa`, `idEstado`, `tiempoEstimadoPreparacion`, `tiempoRestantePedido`, `costoTotal`, `created_at`, `updated_at`) VALUES
('1', 'Jose', 1, 1, 10, 10, 300, '2020-12-13 23:33:07', '2020-12-13 23:33:07'),
('4', 'Yanina', 44444, 1, 36, 36, 800, '2020-12-14 03:56:03', '2020-12-14 03:56:03'),
('A1', 'Yanina', 44444, 1, 32, 32, 800, '2020-12-14 04:03:15', '2020-12-14 04:03:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_comidas`
--

CREATE TABLE `pedido_comidas` (
  `id` int(11) NOT NULL,
  `idPedido` varchar(20) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `idComida` int(11) NOT NULL,
  `idMozo` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector_comidas`
--

CREATE TABLE `sector_comidas` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`, `tipo`, `created_at`, `updated_at`, `estado`) VALUES
(4, 'socio2@mail.com', '12345678', 'socio', '2020-12-14 03:28:33', '2020-12-14 03:28:33', 'activo'),
(5, 'mozo1@mail.com', '12345678', 'mozo', '2020-12-14 03:35:53', '2020-12-14 03:35:53', 'activo'),
(6, 'cervecero1@mail.com', '12345678', 'cervecero', '2020-12-14 04:11:43', '2020-12-14 04:11:43', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comidas`
--
ALTER TABLE `comidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_mesas`
--
ALTER TABLE `estado_mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesa_pedidos`
--
ALTER TABLE `mesa_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indices de la tabla `pedido_comidas`
--
ALTER TABLE `pedido_comidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sector_comidas`
--
ALTER TABLE `sector_comidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comidas`
--
ALTER TABLE `comidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_mesas`
--
ALTER TABLE `estado_mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44445;

--
-- AUTO_INCREMENT de la tabla `mesa_pedidos`
--
ALTER TABLE `mesa_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido_comidas`
--
ALTER TABLE `pedido_comidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `sector_comidas`
--
ALTER TABLE `sector_comidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
