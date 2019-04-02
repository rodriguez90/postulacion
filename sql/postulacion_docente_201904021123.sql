-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2019 a las 11:23:19
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `postulacion_docente`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Administrador', '1', 1553703631),
('Docente', '19', 1553932360),
('Docente', '20', 1553938363),
('HHRR', '21', 1553938430);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Administrador', 1, '', NULL, NULL, 1553703631, 1553944747),
('Docente', 1, '', NULL, NULL, 1553784122, 1553784122),
('docente/*', 2, 'Route docente/*', NULL, NULL, 1553768084, 1553768084),
('docente/create', 2, 'Route docente/create', NULL, NULL, 1553768084, 1553768084),
('docente/delete', 2, 'Route docente/delete', NULL, NULL, 1553768084, 1553768084),
('docente/index', 2, 'Route docente/index', NULL, NULL, 1553768084, 1553768084),
('docente/update', 2, 'Route docente/update', NULL, NULL, 1553768084, 1553768084),
('docente/view', 2, 'Route docente/view', NULL, NULL, 1553768084, 1553768084),
('documento/*', 2, 'Route documento/*', NULL, NULL, 1553768084, 1553768084),
('documento/create', 2, 'Route documento/create', NULL, NULL, 1553768084, 1553768084),
('documento/delete', 2, 'Route documento/delete', NULL, NULL, 1553768084, 1553768084),
('documento/index', 2, 'Route documento/index', NULL, NULL, 1553768084, 1553768084),
('documento/update', 2, 'Route documento/update', NULL, NULL, 1553768084, 1553768084),
('documento/view', 2, 'Route documento/view', NULL, NULL, 1553768084, 1553768084),
('HHRR', 1, 'Director de HHRR', NULL, NULL, 1553783966, 1553944701),
('postulacion/*', 2, 'Route postulacion/*', NULL, NULL, 1553768084, 1553768084),
('postulacion/create', 2, 'Route postulacion/create', NULL, NULL, 1553768084, 1553768084),
('postulacion/delete', 2, 'Route postulacion/delete', NULL, NULL, 1553768084, 1553768084),
('postulacion/index', 2, 'Route postulacion/index', NULL, NULL, 1553768084, 1553768084),
('postulacion/update', 2, 'Route postulacion/update', NULL, NULL, 1553768084, 1553768084),
('postulacion/view', 2, 'Route postulacion/view', NULL, NULL, 1553768084, 1553768084),
('reclamacion/*', 2, 'Route reclamacion/*', NULL, NULL, 1553768084, 1553768084),
('reclamacion/create', 2, 'Route reclamacion/create', NULL, NULL, 1553768084, 1553768084),
('reclamacion/delete', 2, 'Route reclamacion/delete', NULL, NULL, 1553768084, 1553768084),
('reclamacion/index', 2, 'Route reclamacion/index', NULL, NULL, 1553768084, 1553768084),
('reclamacion/update', 2, 'Route reclamacion/update', NULL, NULL, 1553768084, 1553768084),
('reclamacion/view', 2, 'Route reclamacion/view', NULL, NULL, 1553768084, 1553768084),
('site/*', 2, 'Route site/*', NULL, NULL, 1553768084, 1553768084),
('site/about', 2, 'Route site/about', NULL, NULL, 1553768084, 1553768084),
('site/captcha', 2, 'Route site/captcha', NULL, NULL, 1553768084, 1553768084),
('site/contact', 2, 'Route site/contact', NULL, NULL, 1553768084, 1553768084),
('site/error', 2, 'Route site/error', NULL, NULL, 1553768084, 1553768084),
('site/index', 2, 'Route site/index', NULL, NULL, 1553768084, 1553768084),
('site/logout', 2, 'Route site/logout', NULL, NULL, 1553768084, 1553768084),
('tipo-documento/*', 2, 'Route tipo-documento/*', NULL, NULL, 1553768084, 1553768084),
('tipo-documento/create', 2, 'Route tipo-documento/create', NULL, NULL, 1553768084, 1553768084),
('tipo-documento/delete', 2, 'Route tipo-documento/delete', NULL, NULL, 1553768084, 1553768084),
('tipo-documento/index', 2, 'Route tipo-documento/index', NULL, NULL, 1553768084, 1553768084),
('tipo-documento/update', 2, 'Route tipo-documento/update', NULL, NULL, 1553768084, 1553768084),
('tipo-documento/view', 2, 'Route tipo-documento/view', NULL, NULL, 1553768084, 1553768084),
('titulo-profesional/*', 2, 'Route titulo-profesional/*', NULL, NULL, 1553768084, 1553768084),
('titulo-profesional/create', 2, 'Route titulo-profesional/create', NULL, NULL, 1553768084, 1553768084),
('titulo-profesional/delete', 2, 'Route titulo-profesional/delete', NULL, NULL, 1553768084, 1553768084),
('titulo-profesional/index', 2, 'Route titulo-profesional/index', NULL, NULL, 1553768084, 1553768084),
('titulo-profesional/update', 2, 'Route titulo-profesional/update', NULL, NULL, 1553768084, 1553768084),
('titulo-profesional/view', 2, 'Route titulo-profesional/view', NULL, NULL, 1553768084, 1553768084);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Administrador', 'docente/create'),
('Administrador', 'docente/delete'),
('Administrador', 'docente/index'),
('Administrador', 'docente/update'),
('Administrador', 'docente/view'),
('Administrador', 'documento/create'),
('Administrador', 'documento/delete'),
('Administrador', 'documento/index'),
('Administrador', 'documento/update'),
('Administrador', 'documento/view'),
('Administrador', 'postulacion/create'),
('Administrador', 'postulacion/delete'),
('Administrador', 'postulacion/index'),
('Administrador', 'postulacion/update'),
('Administrador', 'postulacion/view'),
('Administrador', 'reclamacion/delete'),
('Administrador', 'reclamacion/index'),
('Administrador', 'reclamacion/update'),
('Administrador', 'reclamacion/view'),
('Administrador', 'site/about'),
('Administrador', 'site/contact'),
('Administrador', 'site/error'),
('Administrador', 'site/index'),
('Administrador', 'site/logout'),
('Administrador', 'tipo-documento/*'),
('Administrador', 'tipo-documento/create'),
('Administrador', 'tipo-documento/delete'),
('Administrador', 'tipo-documento/index'),
('Administrador', 'tipo-documento/update'),
('Administrador', 'tipo-documento/view'),
('Administrador', 'titulo-profesional/create'),
('Administrador', 'titulo-profesional/index'),
('Administrador', 'titulo-profesional/view'),
('Docente', 'docente/update'),
('Docente', 'documento/view'),
('Docente', 'postulacion/create'),
('Docente', 'postulacion/delete'),
('Docente', 'postulacion/index'),
('Docente', 'postulacion/update'),
('Docente', 'postulacion/view'),
('Docente', 'reclamacion/create'),
('Docente', 'reclamacion/delete'),
('Docente', 'reclamacion/index'),
('Docente', 'reclamacion/update'),
('Docente', 'reclamacion/view'),
('docente/*', 'docente/create'),
('docente/*', 'docente/delete'),
('docente/*', 'docente/index'),
('docente/*', 'docente/update'),
('docente/*', 'docente/view'),
('documento/*', 'documento/create'),
('documento/*', 'documento/delete'),
('documento/*', 'documento/index'),
('documento/*', 'documento/update'),
('documento/*', 'documento/view'),
('HHRR', 'docente/index'),
('HHRR', 'docente/view'),
('HHRR', 'documento/index'),
('HHRR', 'documento/view'),
('HHRR', 'postulacion/index'),
('HHRR', 'postulacion/update'),
('HHRR', 'postulacion/view'),
('HHRR', 'reclamacion/index'),
('HHRR', 'reclamacion/update'),
('HHRR', 'reclamacion/view'),
('HHRR', 'site/index'),
('HHRR', 'site/logout'),
('HHRR', 'tipo-documento/index'),
('HHRR', 'tipo-documento/view'),
('HHRR', 'titulo-profesional/index'),
('HHRR', 'titulo-profesional/view'),
('postulacion/*', 'postulacion/create'),
('postulacion/*', 'postulacion/delete'),
('postulacion/*', 'postulacion/index'),
('postulacion/*', 'postulacion/update'),
('postulacion/*', 'postulacion/view'),
('reclamacion/*', 'reclamacion/create'),
('reclamacion/*', 'reclamacion/delete'),
('reclamacion/*', 'reclamacion/index'),
('reclamacion/*', 'reclamacion/update'),
('reclamacion/*', 'reclamacion/view'),
('site/*', 'site/about'),
('site/*', 'site/captcha'),
('site/*', 'site/contact'),
('site/*', 'site/error'),
('site/*', 'site/index'),
('site/*', 'site/logout'),
('tipo-documento/*', 'tipo-documento/create'),
('tipo-documento/*', 'tipo-documento/delete'),
('tipo-documento/*', 'tipo-documento/index'),
('tipo-documento/*', 'tipo-documento/update'),
('tipo-documento/*', 'tipo-documento/view'),
('titulo-profesional/*', 'titulo-profesional/create'),
('titulo-profesional/*', 'titulo-profesional/delete'),
('titulo-profesional/*', 'titulo-profesional/index'),
('titulo-profesional/*', 'titulo-profesional/update'),
('titulo-profesional/*', 'titulo-profesional/view');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `usuario_id` int(11) NOT NULL COMMENT 'Usuario',
  `primer_nombre` varchar(255) NOT NULL COMMENT 'Primer Nombre',
  `segundo_nombre` varchar(255) DEFAULT NULL COMMENT 'Segundo Nombre',
  `primer_apellido` varchar(255) NOT NULL COMMENT 'Primer Apellido',
  `segundo_apellido` varchar(255) DEFAULT NULL COMMENT 'Segundo Apellido',
  `cedula` varchar(255) NOT NULL COMMENT 'Cédula',
  `telefono` varchar(255) NOT NULL COMMENT 'Teléfono',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`usuario_id`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `cedula`, `telefono`, `email`, `fecha_creacion`) VALUES
(19, 'test', NULL, 'test', NULL, '1111111111', '1111111111', 'test@test.cu', '2019-03-30 07:52:40'),
(20, 'asd', NULL, 'asd', NULL, '1111111111', '1111111111', 'asd@asd.cu', '2019-03-30 09:32:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL COMMENT 'No.',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre Documento',
  `contenido` blob COMMENT 'Contenido',
  `tipo_documento_id` int(11) NOT NULL COMMENT 'Tipo Documento',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postulacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `nombre`, `contenido`, `tipo_documento_id`, `fecha_creacion`, `postulacion_id`) VALUES
(5, 'Consentimiento Alcohol Root Root Root_6.pdf', 0x646f63756d656e746f732f436f6e73656e74696d69656e746f20416c636f686f6c20526f6f7420526f6f7420526f6f745f362e706466, 1, '2019-04-02 12:14:51', 4),
(6, 'Consentimiento Droga Root Root Root_7.pdf', 0x646f63756d656e746f732f436f6e73656e74696d69656e746f2044726f676120526f6f7420526f6f7420526f6f745f372e706466, 2, '2019-04-02 12:14:51', 4),
(7, 'Consentimiento Droga Root Root Root_6.pdf', 0x646f63756d656e746f732f436f6e73656e74696d69656e746f2044726f676120526f6f7420526f6f7420526f6f745f362e706466, 3, '2019-04-02 12:14:51', 4),
(8, '91caa861-e71b-46e1-a4b2-911b285d3b09.pdf', 0x646f63756d656e746f732f39316361613836312d653731622d343665312d613462322d3931316232383564336230392e706466, 4, '2019-04-02 12:14:51', 4),
(9, '6aecb790-5372-4f2a-a9fc-003045ac487b.pdf', 0x646f63756d656e746f732f36616563623739302d353337322d346632612d613966632d3030333034356163343837622e706466, 5, '2019-04-02 12:14:51', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('Da\\User\\Migration\\m000000_000001_create_user_table', 1553676120),
('Da\\User\\Migration\\m000000_000002_create_profile_table', 1553676120),
('Da\\User\\Migration\\m000000_000003_create_social_account_table', 1553676121),
('Da\\User\\Migration\\m000000_000004_create_token_table', 1553676121),
('Da\\User\\Migration\\m000000_000005_add_last_login_at', 1553676121),
('Da\\User\\Migration\\m000000_000006_add_two_factor_fields', 1553676121),
('Da\\User\\Migration\\m000000_000007_enable_password_expiration', 1553676121),
('m000000_000000_base', 1553676118),
('m140506_102106_rbac_init', 1553676131),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1553676131),
('m190327_161057_esquema_inicial', 1553765950),
('m190331_102229_alter_table_postulacion_documento', 1554031688),
('m190402_084458_alter_table_postulacion', 1554194782);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulacion`
--

CREATE TABLE `postulacion` (
  `id` int(11) NOT NULL COMMENT 'No.',
  `docente_id` int(11) NOT NULL COMMENT 'Docente',
  `puntuacion` double NOT NULL DEFAULT '0' COMMENT 'Puntuación',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1' COMMENT 'Estado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `postulacion`
--

INSERT INTO `postulacion` (`id`, `docente_id`, `puntuacion`, `fecha_creacion`, `estado`) VALUES
(4, 20, 15, '2019-04-02 12:14:51', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `timezone`, `bio`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamacion`
--

CREATE TABLE `reclamacion` (
  `id` int(11) NOT NULL COMMENT 'No.',
  `docente_id` int(11) NOT NULL COMMENT 'Docente',
  `descripcion` text NOT NULL COMMENT 'Contenido',
  `procede` tinyint(1) DEFAULT '0' COMMENT 'Procede',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reclamacion`
--

INSERT INTO `reclamacion` (`id`, `docente_id`, `descripcion`, `procede`, `fecha_creacion`) VALUES
(1, 19, 'eeeee', 0, '2019-03-30 09:14:28'),
(2, 19, 'dsadsad', NULL, '2019-03-30 09:28:28'),
(3, 20, 'asd asd asd asd asd\r\nasd asd asd asd asdasd asd asd asd asd\r\nasd asd asd asd asd\r\nasd asd asd asd asd', 0, '2019-03-30 09:33:05'),
(4, 20, 'ttttt', NULL, '2019-03-31 13:39:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL COMMENT 'No.',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `descripcion` varchar(255) NOT NULL COMMENT 'Descripción'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipodocumento`
--

INSERT INTO `tipodocumento` (`id`, `nombre`, `descripcion`) VALUES
(1, 'CV', 'Curriculum'),
(2, 'Biografía', 'Biografía'),
(3, 'Título', 'Título'),
(4, 'Certificado de Nacimiento', 'Certificado de Nacimiento'),
(5, 'Cedula', 'Cedula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulodocente`
--

CREATE TABLE `titulodocente` (
  `id` int(11) NOT NULL COMMENT 'No.',
  `titulo_id` int(11) NOT NULL COMMENT 'Titulo Profesional.',
  `docente_id` int(11) NOT NULL COMMENT 'Docente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `titulodocente`
--

INSERT INTO `titulodocente` (`id`, `titulo_id`, `docente_id`) VALUES
(3, 2, 19),
(4, 2, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tituloprofesional`
--

CREATE TABLE `tituloprofesional` (
  `id` int(11) NOT NULL COMMENT 'No.',
  `nombre` varchar(255) NOT NULL COMMENT 'Nombre',
  `descripcion` varchar(255) NOT NULL COMMENT 'Descripción'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tituloprofesional`
--

INSERT INTO `tituloprofesional` (`id`, `nombre`, `descripcion`) VALUES
(2, 'Licenciado', 'Licenciado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `confirmed_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `auth_tf_key` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT '0',
  `password_changed_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `auth_tf_key`, `auth_tf_enabled`, `password_changed_at`) VALUES
(1, 'root', 'root@test.com', '$2y$10$l.H4OYgaIGVL8mcP0dCfj.97min2dXUayOVfWPeaR6RlfFH3PJrcK', 'zxfVmWefHKHG538pNYX83ozdn0uD7qgu', NULL, NULL, 0, 1553703630, NULL, 1553703630, 1553703630, 1554037965, '', 0, 1553703630),
(2, 'pedro', 'pedro@gmail.com', '$2y$10$W37EFtstHCC/ho0fVfN57uN7p0fEswIKBU5VoM58Bq2DJ8mNhyHYy', 'Wa31zzttUw_XsF6p34UpNjPnQHXOR3If', NULL, '::1', 0, 1553783697, NULL, 1553855092, 1553783697, 1553855102, '', 0, 1553855092),
(19, 'test', 'test@test.cu', '$2y$10$UjVVA87.Da12j282CAfvb..CtPz5JoKm203MUrK/V2vFwvwHl.g2.', '1hw9zTR5rJVGCIUVsytw3GHeGUhlMOzX', NULL, '::1', 0, 1553932359, NULL, 1553932359, 1553932359, 1553945519, '', 0, 1553932359),
(20, 'asd', 'asd@asd.cu', '$2y$10$rXDkKrIvi6dREhcNEX5EQOOdY.EUwMuLXq.dX90pwaQEprGJVnNJC', 'Sj3-XyDMc0beMghdGwNXNNHy2iMaYaso', NULL, '::1', 0, 1553938362, NULL, 1553938362, 1553938362, 1554211839, '', 0, 1553938362),
(21, 'hhrr', 'hhrr@test.cu', '$2y$10$k5ZXze8r3XhyVVphKRM9auiU4am0LWkBDrLGkAbD2wdeg3SJeGnmi', 'xWOVxrjRxFhMXW6sujfWmz19vlqWo2FQ', NULL, '::1', 0, 1553938424, NULL, 1553938424, 1553938424, 1554211814, '', 0, 1553938424);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_documento_tipo` (`tipo_documento_id`),
  ADD KEY `fk_documento_postulacion` (`postulacion_id`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Postulacion_docente` (`docente_id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `reclamacion`
--
ALTER TABLE `reclamacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reclamacion_docente` (`docente_id`);

--
-- Indices de la tabla `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  ADD UNIQUE KEY `idx_social_account_code` (`code`),
  ADD KEY `fk_social_account_user` (`user_id`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `titulodocente`
--
ALTER TABLE `titulodocente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tituloDocente_titulo` (`titulo_id`),
  ADD KEY `fk_tituloDocente_docente` (`docente_id`);

--
-- Indices de la tabla `tituloprofesional`
--
ALTER TABLE `tituloprofesional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `idx_token_user_id_code_type` (`user_id`,`code`,`type`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_username` (`username`),
  ADD UNIQUE KEY `idx_user_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Usuario', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profile`
--
ALTER TABLE `profile`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `reclamacion`
--
ALTER TABLE `reclamacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `titulodocente`
--
ALTER TABLE `titulodocente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tituloprofesional`
--
ALTER TABLE `tituloprofesional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `fk_documento_postulacion` FOREIGN KEY (`postulacion_id`) REFERENCES `postulacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documento_tipo` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipodocumento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD CONSTRAINT `fk_Postulacion_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reclamacion`
--
ALTER TABLE `reclamacion`
  ADD CONSTRAINT `fk_reclamacion_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `titulodocente`
--
ALTER TABLE `titulodocente`
  ADD CONSTRAINT `fk_tituloDocente_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tituloDocente_titulo` FOREIGN KEY (`titulo_id`) REFERENCES `tituloprofesional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
