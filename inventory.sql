-- Adminer 4.8.1 MySQL 8.0.33-0ubuntu0.20.04.2 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_category_id` int DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_497DD634796A8F92` (`parent_category_id`),
  CONSTRAINT `FK_497DD634796A8F92` FOREIGN KEY (`parent_category_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categorie` (`id`, `parent_category_id`, `category`, `valid`, `deleted`) VALUES
(1,	NULL,	'test',	1,	0),
(2,	NULL,	'pc',	1,	0);

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role` (`id`, `role_name`) VALUES
(1,	'ROLE_SUPERUSER'),
(2,	'ROLE_ADMINISTRATOR'),
(3,	'ROLE_TECH'),
(4,	'ROLE_CLIENT');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `nom_complet` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user` (`id`, `username`, `roles`, `nom_complet`, `email`, `valid`, `deleted`, `password`, `admin`) VALUES
(1,	'admin',	'[\"ROLE_SUPERUSER\"]',	'Admin',	'admin@example.com',	1,	0,	'$2y$13$izuSOO//adtgItDIg92XBu1aiSYso57A/SbmsyzWscQleQXnLXd72',	1),
(2,	'test',	'[\"ROLE_CLIENT\"]',	'test',	'test@test.com',	1,	0,	'test',	0),
(7,	'test2',	'[\"ROLE_TECH\"]',	'test22',	'test2@test2.com',	1,	0,	'$argon2id$v=19$m=65536,t=4,p=1$8Ws8dFh9PsgUJE8NSyHaJQ$ITc7MVGo1R9SH5d7bNLwQ3svQ7SwyZB2hnfLukZWeOk',	1);

-- 2023-05-25 23:53:10
