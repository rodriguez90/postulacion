/*
 Navicat Premium Data Transfer

 Source Server         : utelvt
 Source Server Type    : MySQL
 Source Server Version : 100131
 Source Host           : localhost:3306
 Source Schema         : postulacion_docente

 Target Server Type    : MySQL
 Target Server Version : 100131
 File Encoding         : 65001

 Date: 30/03/2019 12:37:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `auth_assignment_user_id_idx`(`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Administrador', '1', 1553703631);
INSERT INTO `auth_assignment` VALUES ('Docente', '19', 1553932360);
INSERT INTO `auth_assignment` VALUES ('Docente', '20', 1553938363);
INSERT INTO `auth_assignment` VALUES ('HHRR', '21', 1553938430);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` blob NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('Administrador', 1, '', NULL, NULL, 1553703631, 1553944747);
INSERT INTO `auth_item` VALUES ('Docente', 1, '', NULL, NULL, 1553784122, 1553784122);
INSERT INTO `auth_item` VALUES ('docente/*', 2, 'Route docente/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('docente/create', 2, 'Route docente/create', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('docente/delete', 2, 'Route docente/delete', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('docente/index', 2, 'Route docente/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('docente/update', 2, 'Route docente/update', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('docente/view', 2, 'Route docente/view', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('documento/*', 2, 'Route documento/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('documento/create', 2, 'Route documento/create', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('documento/delete', 2, 'Route documento/delete', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('documento/index', 2, 'Route documento/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('documento/update', 2, 'Route documento/update', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('documento/view', 2, 'Route documento/view', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('HHRR', 1, 'Director de HHRR', NULL, NULL, 1553783966, 1553944701);
INSERT INTO `auth_item` VALUES ('postulacion/*', 2, 'Route postulacion/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('postulacion/create', 2, 'Route postulacion/create', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('postulacion/delete', 2, 'Route postulacion/delete', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('postulacion/index', 2, 'Route postulacion/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('postulacion/update', 2, 'Route postulacion/update', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('postulacion/view', 2, 'Route postulacion/view', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('reclamacion/*', 2, 'Route reclamacion/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('reclamacion/create', 2, 'Route reclamacion/create', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('reclamacion/delete', 2, 'Route reclamacion/delete', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('reclamacion/index', 2, 'Route reclamacion/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('reclamacion/update', 2, 'Route reclamacion/update', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('reclamacion/view', 2, 'Route reclamacion/view', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/*', 2, 'Route site/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/about', 2, 'Route site/about', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/captcha', 2, 'Route site/captcha', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/contact', 2, 'Route site/contact', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/error', 2, 'Route site/error', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/index', 2, 'Route site/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('site/logout', 2, 'Route site/logout', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('tipo-documento/*', 2, 'Route tipo-documento/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('tipo-documento/create', 2, 'Route tipo-documento/create', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('tipo-documento/delete', 2, 'Route tipo-documento/delete', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('tipo-documento/index', 2, 'Route tipo-documento/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('tipo-documento/update', 2, 'Route tipo-documento/update', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('tipo-documento/view', 2, 'Route tipo-documento/view', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('titulo-profesional/*', 2, 'Route titulo-profesional/*', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('titulo-profesional/create', 2, 'Route titulo-profesional/create', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('titulo-profesional/delete', 2, 'Route titulo-profesional/delete', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('titulo-profesional/index', 2, 'Route titulo-profesional/index', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('titulo-profesional/update', 2, 'Route titulo-profesional/update', NULL, NULL, 1553768084, 1553768084);
INSERT INTO `auth_item` VALUES ('titulo-profesional/view', 2, 'Route titulo-profesional/view', NULL, NULL, 1553768084, 1553768084);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Administrador', 'docente/create');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'docente/delete');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'docente/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'docente/update');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'docente/view');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'documento/create');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'documento/delete');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'documento/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'documento/update');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'documento/view');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'postulacion/create');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'postulacion/delete');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'postulacion/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'postulacion/update');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'postulacion/view');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'reclamacion/delete');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'reclamacion/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'reclamacion/update');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'reclamacion/view');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'site/about');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'site/contact');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'site/error');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'site/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'site/logout');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'tipo-documento/*');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'tipo-documento/create');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'tipo-documento/delete');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'tipo-documento/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'tipo-documento/update');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'tipo-documento/view');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'titulo-profesional/create');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'titulo-profesional/index');
INSERT INTO `auth_item_child` VALUES ('Administrador', 'titulo-profesional/view');
INSERT INTO `auth_item_child` VALUES ('Docente', 'docente/update');
INSERT INTO `auth_item_child` VALUES ('Docente', 'documento/view');
INSERT INTO `auth_item_child` VALUES ('Docente', 'postulacion/create');
INSERT INTO `auth_item_child` VALUES ('Docente', 'postulacion/delete');
INSERT INTO `auth_item_child` VALUES ('Docente', 'postulacion/index');
INSERT INTO `auth_item_child` VALUES ('Docente', 'postulacion/update');
INSERT INTO `auth_item_child` VALUES ('Docente', 'postulacion/view');
INSERT INTO `auth_item_child` VALUES ('Docente', 'reclamacion/create');
INSERT INTO `auth_item_child` VALUES ('Docente', 'reclamacion/delete');
INSERT INTO `auth_item_child` VALUES ('Docente', 'reclamacion/index');
INSERT INTO `auth_item_child` VALUES ('Docente', 'reclamacion/update');
INSERT INTO `auth_item_child` VALUES ('Docente', 'reclamacion/view');
INSERT INTO `auth_item_child` VALUES ('docente/*', 'docente/create');
INSERT INTO `auth_item_child` VALUES ('docente/*', 'docente/delete');
INSERT INTO `auth_item_child` VALUES ('docente/*', 'docente/index');
INSERT INTO `auth_item_child` VALUES ('docente/*', 'docente/update');
INSERT INTO `auth_item_child` VALUES ('docente/*', 'docente/view');
INSERT INTO `auth_item_child` VALUES ('documento/*', 'documento/create');
INSERT INTO `auth_item_child` VALUES ('documento/*', 'documento/delete');
INSERT INTO `auth_item_child` VALUES ('documento/*', 'documento/index');
INSERT INTO `auth_item_child` VALUES ('documento/*', 'documento/update');
INSERT INTO `auth_item_child` VALUES ('documento/*', 'documento/view');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'docente/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'docente/view');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'documento/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'documento/view');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'postulacion/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'postulacion/update');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'postulacion/view');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'reclamacion/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'reclamacion/update');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'reclamacion/view');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'site/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'site/logout');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'tipo-documento/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'tipo-documento/view');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'titulo-profesional/index');
INSERT INTO `auth_item_child` VALUES ('HHRR', 'titulo-profesional/view');
INSERT INTO `auth_item_child` VALUES ('postulacion/*', 'postulacion/create');
INSERT INTO `auth_item_child` VALUES ('postulacion/*', 'postulacion/delete');
INSERT INTO `auth_item_child` VALUES ('postulacion/*', 'postulacion/index');
INSERT INTO `auth_item_child` VALUES ('postulacion/*', 'postulacion/update');
INSERT INTO `auth_item_child` VALUES ('postulacion/*', 'postulacion/view');
INSERT INTO `auth_item_child` VALUES ('reclamacion/*', 'reclamacion/create');
INSERT INTO `auth_item_child` VALUES ('reclamacion/*', 'reclamacion/delete');
INSERT INTO `auth_item_child` VALUES ('reclamacion/*', 'reclamacion/index');
INSERT INTO `auth_item_child` VALUES ('reclamacion/*', 'reclamacion/update');
INSERT INTO `auth_item_child` VALUES ('reclamacion/*', 'reclamacion/view');
INSERT INTO `auth_item_child` VALUES ('site/*', 'site/about');
INSERT INTO `auth_item_child` VALUES ('site/*', 'site/captcha');
INSERT INTO `auth_item_child` VALUES ('site/*', 'site/contact');
INSERT INTO `auth_item_child` VALUES ('site/*', 'site/error');
INSERT INTO `auth_item_child` VALUES ('site/*', 'site/index');
INSERT INTO `auth_item_child` VALUES ('site/*', 'site/logout');
INSERT INTO `auth_item_child` VALUES ('tipo-documento/*', 'tipo-documento/create');
INSERT INTO `auth_item_child` VALUES ('tipo-documento/*', 'tipo-documento/delete');
INSERT INTO `auth_item_child` VALUES ('tipo-documento/*', 'tipo-documento/index');
INSERT INTO `auth_item_child` VALUES ('tipo-documento/*', 'tipo-documento/update');
INSERT INTO `auth_item_child` VALUES ('tipo-documento/*', 'tipo-documento/view');
INSERT INTO `auth_item_child` VALUES ('titulo-profesional/*', 'titulo-profesional/create');
INSERT INTO `auth_item_child` VALUES ('titulo-profesional/*', 'titulo-profesional/delete');
INSERT INTO `auth_item_child` VALUES ('titulo-profesional/*', 'titulo-profesional/index');
INSERT INTO `auth_item_child` VALUES ('titulo-profesional/*', 'titulo-profesional/update');
INSERT INTO `auth_item_child` VALUES ('titulo-profesional/*', 'titulo-profesional/view');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente`  (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Usuario',
  `primer_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Primer Nombre',
  `segundo_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Segundo Nombre',
  `primer_apellido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Primer Apellido',
  `segundo_apellido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'Segundo Apellido',
  `cedula` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Cédula',
  `telefono` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Teléfono',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Email',
  `fecha_creacion` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`) USING BTREE,
  CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO `docente` VALUES (19, 'test', NULL, 'test', NULL, '1111111111', '1111111111', 'test@test.cu', '2019-03-30 08:52:40');
INSERT INTO `docente` VALUES (20, 'asd', NULL, 'asd', NULL, '1111111111', '1111111111', 'asd@asd.cu', '2019-03-30 10:32:43');

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Nombre Documento',
  `contenido` blob NOT NULL COMMENT 'Contenido',
  `tipo_documento_id` int(11) NOT NULL COMMENT 'Tipo Documento',
  `fecha_creacion` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_documento_tipo`(`tipo_documento_id`) USING BTREE,
  CONSTRAINT `fk_documento_tipo` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipodocumento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000001_create_user_table', 1553676120);
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000002_create_profile_table', 1553676120);
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000003_create_social_account_table', 1553676121);
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000004_create_token_table', 1553676121);
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000005_add_last_login_at', 1553676121);
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000006_add_two_factor_fields', 1553676121);
INSERT INTO `migration` VALUES ('Da\\User\\Migration\\m000000_000007_enable_password_expiration', 1553676121);
INSERT INTO `migration` VALUES ('m000000_000000_base', 1553676118);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1553676131);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1553676131);
INSERT INTO `migration` VALUES ('m190327_161057_esquema_inicial', 1553765950);

-- ----------------------------
-- Table structure for postulacion
-- ----------------------------
DROP TABLE IF EXISTS `postulacion`;
CREATE TABLE `postulacion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `docente_id` int(11) NOT NULL COMMENT 'Docente',
  `documento_id` int(11) NOT NULL COMMENT 'Documento',
  `puntuacion` double NOT NULL DEFAULT 0 COMMENT 'Puntuación',
  `fecha_creacion` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_Postulacion_docente`(`docente_id`) USING BTREE,
  INDEX `fk_Postulacion_documento`(`documento_id`) USING BTREE,
  CONSTRAINT `fk_Postulacion_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Postulacion_documento` FOREIGN KEY (`documento_id`) REFERENCES `documento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `timezone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for reclamacion
-- ----------------------------
DROP TABLE IF EXISTS `reclamacion`;
CREATE TABLE `reclamacion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `docente_id` int(11) NOT NULL COMMENT 'Docente',
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Contenido',
  `procede` tinyint(1) NULL DEFAULT 0 COMMENT 'Procede',
  `fecha_creacion` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_reclamacion_docente`(`docente_id`) USING BTREE,
  CONSTRAINT `fk_reclamacion_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reclamacion
-- ----------------------------
INSERT INTO `reclamacion` VALUES (1, 19, 'eeeee', 0, '2019-03-30 10:14:28');
INSERT INTO `reclamacion` VALUES (2, 19, 'dsadsad', NULL, '2019-03-30 10:28:28');
INSERT INTO `reclamacion` VALUES (3, 20, 'asd asd asd asd asd\r\nasd asd asd asd asdasd asd asd asd asd\r\nasd asd asd asd asd\r\nasd asd asd asd asd', 0, '2019-03-30 10:33:05');

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_social_account_provider_client_id`(`provider`, `client_id`) USING BTREE,
  UNIQUE INDEX `idx_social_account_code`(`code`) USING BTREE,
  INDEX `fk_social_account_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tipodocumento
-- ----------------------------
DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE `tipodocumento`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Nombre',
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nombre`(`nombre`) USING BTREE,
  UNIQUE INDEX `descripcion`(`descripcion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipodocumento
-- ----------------------------
INSERT INTO `tipodocumento` VALUES (1, 'CV', 'Curriculum');

-- ----------------------------
-- Table structure for titulodocente
-- ----------------------------
DROP TABLE IF EXISTS `titulodocente`;
CREATE TABLE `titulodocente`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `titulo_id` int(11) NOT NULL COMMENT 'Titulo Profesional.',
  `docente_id` int(11) NOT NULL COMMENT 'Docente',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_tituloDocente_titulo`(`titulo_id`) USING BTREE,
  INDEX `fk_tituloDocente_docente`(`docente_id`) USING BTREE,
  CONSTRAINT `fk_tituloDocente_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tituloDocente_titulo` FOREIGN KEY (`titulo_id`) REFERENCES `tituloprofesional` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of titulodocente
-- ----------------------------
INSERT INTO `titulodocente` VALUES (3, 2, 19);
INSERT INTO `titulodocente` VALUES (4, 2, 20);

-- ----------------------------
-- Table structure for tituloprofesional
-- ----------------------------
DROP TABLE IF EXISTS `tituloprofesional`;
CREATE TABLE `tituloprofesional`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'No.',
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Nombre',
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nombre`(`nombre`) USING BTREE,
  UNIQUE INDEX `descripcion`(`descripcion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tituloprofesional
-- ----------------------------
INSERT INTO `tituloprofesional` VALUES (2, 'Licenciado', 'Licenciado');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `user_id` int(11) NULL DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL,
  UNIQUE INDEX `idx_token_user_id_code_type`(`user_id`, `code`, `type`) USING BTREE,
  CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `confirmed_at` int(11) NULL DEFAULT NULL,
  `blocked_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) NULL DEFAULT NULL,
  `auth_tf_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) NULL DEFAULT 0,
  `password_changed_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_user_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', 'root@test.com', '$2y$10$l.H4OYgaIGVL8mcP0dCfj.97min2dXUayOVfWPeaR6RlfFH3PJrcK', 'zxfVmWefHKHG538pNYX83ozdn0uD7qgu', NULL, NULL, 0, 1553703630, NULL, 1553703630, 1553703630, 1553938400, '', 0, 1553703630);
INSERT INTO `user` VALUES (2, 'pedro', 'pedro@gmail.com', '$2y$10$W37EFtstHCC/ho0fVfN57uN7p0fEswIKBU5VoM58Bq2DJ8mNhyHYy', 'Wa31zzttUw_XsF6p34UpNjPnQHXOR3If', NULL, '::1', 0, 1553783697, NULL, 1553855092, 1553783697, 1553855102, '', 0, 1553855092);
INSERT INTO `user` VALUES (19, 'test', 'test@test.cu', '$2y$10$UjVVA87.Da12j282CAfvb..CtPz5JoKm203MUrK/V2vFwvwHl.g2.', '1hw9zTR5rJVGCIUVsytw3GHeGUhlMOzX', NULL, '::1', 0, 1553932359, NULL, 1553932359, 1553932359, 1553945519, '', 0, 1553932359);
INSERT INTO `user` VALUES (20, 'asd', 'asd@asd.cu', '$2y$10$rXDkKrIvi6dREhcNEX5EQOOdY.EUwMuLXq.dX90pwaQEprGJVnNJC', 'Sj3-XyDMc0beMghdGwNXNNHy2iMaYaso', NULL, '::1', 0, 1553938362, NULL, 1553938362, 1553938362, 1553938371, '', 0, 1553938362);
INSERT INTO `user` VALUES (21, 'hhrr', 'hhrr@test.cu', '$2y$10$k5ZXze8r3XhyVVphKRM9auiU4am0LWkBDrLGkAbD2wdeg3SJeGnmi', 'xWOVxrjRxFhMXW6sujfWmz19vlqWo2FQ', NULL, '::1', 0, 1553938424, NULL, 1553938424, 1553938424, 1553945306, '', 0, 1553938424);

SET FOREIGN_KEY_CHECKS = 1;
