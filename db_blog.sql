-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2022 a las 16:49:42
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user`, `content`, `approved`, `created_at`, `updated_at`) VALUES
(1, 1, 'Paco', 'Praesent tristique at nisl in sollicitudin. Suspendisse aliquet est sit amet diam egestas luctus. Nulla volutpat id libero ac sollicitudin. Fusce accumsan viverra risus, in tristique turpis. Donec quis dolor lectus. Nulla a dictum ligula. Cras eu cursus d', 0, '2022-02-15 13:03:13', NULL),
(2, 1, 'jose', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor placerat diam, sit amet fringilla risus vulputate eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas imperdiet turpis at ', 0, '2022-02-13 13:03:13', NULL),
(3, 2, 'Antonio', 'Nulla facilisi. Suspendisse id lacinia nunc. Nullam commodo turpis risus, vitae blandit eros placerat a. Duis facilisis convallis turpis, eget laoreet ante euismod quis. Vestibulum laoreet arcu eu volutpat porta. Nullam rutrum elit sed aliquam semper. Nam', 0, '2022-03-02 20:01:05', NULL),
(4, 2, 'Paco', 'Proin eleifend placerat odio, vel varius tellus finibus ut. Integer fringilla ultricies sem, a tempor risus ultricies eget. Nam enim neque, tincidunt ut venenatis ut, sollicitudin in dolor. Cras eu orci in lectus ultrices euismod. Nunc pharetra tellus tel', 0, '2022-03-05 20:01:05', NULL),
(5, 2, 'Maria', 'Quisque commodo efficitur erat, non ullamcorper quam efficitur id. Mauris tristique leo vel scelerisque mollis. Pellentesque viverra eros a porttitor aliquam. Aenean placerat urna non sollicitudin pulvinar. Sed sapien ex, fringilla ut ornare dignissim, di', 0, '2022-03-01 20:01:05', NULL),
(6, 3, 'Lucía', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor placerat diam, sit amet fringilla risus vulputate eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas imperdiet turpis at ', 0, '2022-03-08 20:01:05', NULL),
(7, 3, 'Anastasia', 'Bitter Brew Acidic hoppy barley adjunct cask infusion, balthazar Bottle Attenuation krug lauter berliner krausen extract, saccharification Aroma tank secondary hop cider. Pitch original brewpub extract cask hoppy plato Bung Barley Bottle trappist alpha, s', 0, '2022-02-10 20:01:05', NULL),
(8, 3, 'Raquel', 'Praesent tristique at nisl in sollicitudin. Suspendisse aliquet est sit amet diam egestas luctus. Nulla volutpat id libero ac sollicitudin. Fusce accumsan viverra risus, in tristique turpis. Donec quis dolor lectus. Nulla a dictum ligula. Cras eu cursus d', 0, '2022-03-05 20:01:05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `title`, `author`, `content`, `image`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'A day with Symfony2', 'dsyph3r', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor placerat diam, sit amet fringilla risus vulputate eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas imperdiet turpis at ', 'random.jpg', 'comida,bebida,vehiculos,salud', '2022-02-10 00:39:34', NULL),
(2, 'Día del salmorejo', 'Sancho', 'Nulla facilisi. Suspendisse id lacinia nunc. Nullam commodo turpis risus, vitae blandit eros placerat a. Duis facilisis convallis turpis, eget laoreet ante euismod quis. Vestibulum laoreet arcu eu volutpat porta. Nullam rutrum elit sed aliquam semper. Nam', 'salmorejo.jfif', 'binary,hacked,paradise,symblog', '2022-02-02 10:08:31', NULL),
(3, '¿Cómo comprarse un lamborghini?', 'Ezzio', 'Praesent tristique at nisl in sollicitudin. Suspendisse aliquet est sit amet diam egestas luctus. Nulla volutpat id libero ac sollicitudin. Fusce accumsan viverra risus, in tristique turpis. Donec quis dolor lectus. Nulla a dictum ligula. Cras eu cursus d', 'coche.jpg', 'binary,hacked,magic,symblog', '2022-02-06 10:11:39', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog` (`post_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_blog` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
