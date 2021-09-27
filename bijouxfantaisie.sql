-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 27 sep. 2021 à 15:29
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bijouxfantaisie`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F81A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(1, 4, 'Domicile Créteil', 'boubacar', 'GUEYE', 'dom', '8 Allée Georges Braque', '94000', 'Créteil', 'FR', '+33663953279'),
(3, 4, 'Domicile', 'Boubacar', 'GUEYE', 'dom', '23, Rue du port de Creteil', '94100', 'St Maure des Fossés', 'FR', '0658474428'),
(5, 2, 'Coumba Soumare', 'Coumba', 'soumare', 'Créteil', '8 Allée Georges Braque', '94000', 'Créteil', 'FR', '+33663953279'),
(6, 4, 'Villeneuve le roi', 'Amath', 'Gueye', NULL, '3 PARC HENRI DUNANT, Chez Madame Soumaré', '94290', 'VILLENEUVE LE ROI', 'FR', '0767586892');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Profitez d\'une livraison Premium avec un colis chez vous dans les 72 prochaines heures', 990),
(2, 'Chronopost', 'Profitez d\'une livraison Premium avec un colis chez vous dès le lendemain', 1050);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Bagues'),
(2, 'Colliers'),
(3, 'Boucles d\'oreilles'),
(4, 'Piercings'),
(5, 'Bracelets'),
(6, 'Montres'),
(7, 'Accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210714002010', '2021-07-14 00:22:33', 1478),
('DoctrineMigrations\\Version20210714103443', '2021-07-14 10:36:03', 3075),
('DoctrineMigrations\\Version20210715234550', '2021-07-15 23:46:38', 2830),
('DoctrineMigrations\\Version20210716001751', '2021-07-16 00:18:05', 3324),
('DoctrineMigrations\\Version20210718230418', '2021-07-18 23:04:43', 5387),
('DoctrineMigrations\\Version20210719162606', '2021-07-19 16:26:37', 7774),
('DoctrineMigrations\\Version20210719170006', '2021-07-19 17:04:03', 7772),
('DoctrineMigrations\\Version20210721094737', '2021-07-21 09:47:53', 4094),
('DoctrineMigrations\\Version20210723172634', '2021-07-23 17:26:49', 3201),
('DoctrineMigrations\\Version20210726135804', '2021-07-26 13:58:15', 2059),
('DoctrineMigrations\\Version20210728093717', '2021-07-28 09:37:33', 5202),
('DoctrineMigrations\\Version20210728140439', '2021-07-28 14:04:47', 2378),
('DoctrineMigrations\\Version20210728145123', '2021-07-28 14:51:33', 2857),
('DoctrineMigrations\\Version20210729065624', '2021-07-29 06:56:46', 16023);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

DROP TABLE IF EXISTS `header`;
CREATE TABLE IF NOT EXISTS `header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(1, 'Parure en or', 'Une très belle parure en or massif', 'Acheter', '/nos-bijoux', '807497b7086efd86f0d5d3e417a608b0e6265910.png'),
(2, 'Nouvelle collection', 'Découvrez notre collection pour l\'été 2021 fraichement importée de Mumbaï (Inde)', 'Découvrir', '/nos-bijoux', '91d872a4d6c8124583eb70e4bb691a6e73cb85b9.jpg'),
(3, 'Le style de l\'été', 'Le nouveau style de bijoux fantaisies de l\'été 2021', 'Découvrir', '/nos-bijoux', 'e81f4d0d627f86a9ca5f187c9b014e7ca0270e9c.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strip_session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `strip_session_id`, `state`) VALUES
(1, 4, '2021-07-21 11:01:33', 'Colissimo', 9.9, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '', NULL, 0),
(2, 4, '2021-07-23 17:41:59', 'Chronoposte', 8.5, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '23072021-60faff6782682', NULL, 0),
(3, 4, '2021-07-23 17:51:09', 'Chronoposte', 8.5, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '23072021-60fb018deafa0', NULL, 0),
(4, 4, '2021-07-23 17:55:25', 'Chronoposte', 8.5, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '23072021-60fb028dbd017', NULL, 0),
(5, 4, '2021-07-23 18:08:30', 'Chronoposte', 8.5, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '23072021-60fb059e1ea1e', NULL, 0),
(6, 4, '2021-07-23 18:26:53', 'Chronoposte', 8.5, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '23072021-60fb09ed01bee', NULL, 0),
(7, 4, '2021-07-26 13:49:36', 'Chronoposte', 8.5, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '26072021-60febd70389ce', NULL, 0),
(8, 4, '2021-07-26 14:01:17', 'Colissimo', 9.9, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '26072021-60fec02de988e', 'cs_test_b16ZkWuqSCVkGAU76zlINCCWygef83IrNsGDJDZ7LzjLCznAGu2DnVLP1p', 0),
(9, 4, '2021-07-26 15:11:33', 'Colissimo', 9.9, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '26072021-60fed0a5be7bc', 'cs_test_b1b6AimkNRNXbSVXzQAsr6gfuvtfFx4iPQc43egBjeqZrZY9SAcmbwQa3o', 0),
(10, 4, '2021-07-26 15:45:17', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '26072021-60fed88db09e6', NULL, 0),
(11, 4, '2021-07-26 15:51:22', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '26072021-60fed9faf3431', NULL, 0),
(12, 4, '2021-07-26 16:14:32', 'Chronoposte', 1050, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '26072021-60fedf68ef75f', NULL, 0),
(13, 4, '2021-07-27 09:10:04', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '27072021-60ffcd6c7ce38', 'cs_test_b16O2p3wwUZ1h2wO5QmVZP8UVTSiu4L7D4gLJVlRUfnTFgIs6HatddFVz8', 0),
(14, 4, '2021-07-28 09:11:24', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '28072021-61011f3cafafe', 'cs_test_b1seCoeAL6chIRL0hidIgyQN2rYxPVXV3KROq2To7Z9FKitMfIx8PxqIbp', 0),
(15, 4, '2021-07-28 09:17:44', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '28072021-610120b80a5c5', 'cs_test_b1hznT62MoEHK6G66TSdGYNy2JZVoY31aS9ceQpnM43VCIyqjnjpsB1QCZ', 1),
(16, 4, '2021-07-28 09:49:40', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '28072021-610128345de91', 'cs_test_b1GKmKb9kdzWtVJnA9vbPmiDj5fljZ4uyIM3RdRAjakthbmBm9epoFTGD5', 3),
(17, 4, '2021-07-28 11:25:49', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '28072021-61013ebdaf7df', 'cs_test_b1u1WuYlXwudVT6rhJZC33fZ4inNNXMdTW4yfmCW3VijRJ4LBnD6Z985IA', 2),
(18, 4, '2021-07-31 20:40:24', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '31072021-6105b53869a82', 'cs_test_b15T5HTscNSbrxQSvin7zWxg8zr1xJGfRFbBHabNIQ5YhoVJ4y1adXKHiS', 1),
(19, 4, '2021-08-04 11:05:37', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '04082021-610a748106ed8', NULL, 0),
(20, 4, '2021-08-04 14:23:54', 'Colissimo', 990, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '04082021-610aa2fa2e502', 'cs_test_b1jdsMI7An7YeXNAZCQTvxzXybUPdM0lUqcxeYbiiIKrjozaFMRDVGK29U', 0),
(21, 4, '2021-08-04 14:44:49', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '04082021-610aa7e137c6d', 'cs_test_b1r4wgUIdYpHovZ9RMbia7qxTbKdRommo7zVS8il1WmE3z9fZwd8iA7A3E', 0),
(22, 4, '2021-08-04 14:48:46', 'Colissimo', 990, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '04082021-610aa8ce9da84', 'cs_test_b1bKdKGCjnRpEJQoXJrsnVfeGmqKjD7KdYzlzVG0VlEQu0ZwTqlvHjq7s8', 0),
(23, 4, '2021-08-05 23:40:43', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '05082021-610c76fb91def', NULL, 0),
(24, 4, '2021-08-08 14:03:55', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '08082021-610fe44b55a4e', NULL, 0),
(25, 4, '2021-08-10 11:15:20', 'Chronoposte', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '10082021-61125fc87d525', 'cs_test_b1jt1g5QtfORssw0ndMYYFKrUiogJMO3fAg0rhth95xHdkGRDwXzEMvkMM', 1),
(26, 4, '2021-08-18 09:58:58', 'Colissimo', 990, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '18082021-611cd9e221f9e', 'cs_test_b1124p03E0TkOosMI34AMQ0XfKlRE7TSRusinsDa12ZhV2ODpzuX9EQh23', 1),
(27, 4, '2021-08-25 16:49:36', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '25082021-612674a08f2c7', 'cs_test_b1c3cU3pA4BB5e6OhTBPDc1cxjGhfD2vqaA16k7Kr7A1bejAdDwn3Rm1Yt', 2),
(28, 4, '2021-08-31 11:59:25', 'Chronopost', 1050, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '31082021-612e199dc53b0', 'cs_test_b1qzUXa4r6i8l8ZPpNMUGX2y2JhqNWL7Nc0eZqC76eDfp0dOthDoTEggnI', 0),
(29, 4, '2021-09-02 08:59:17', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '02092021-6130926563632', 'cs_test_b10ZaNGsdd0HwXbzhA1ib1pE7QhwpiZhOvOyfQ4HKZX0Zr7wyQfgAX8xyc', 4),
(30, 4, '2021-09-06 08:06:04', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '06092021-6135cbec98a28', 'cs_test_b1GUewBRBgxzcNIq8wwSA5nkYb9UaH0YqxhsaaOfregCQVr8ttQEBCKDdv', 1),
(31, 4, '2021-09-06 08:11:55', 'Colissimo', 990, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '06092021-6135cd4ba65dc', 'cs_test_b1Ui644O1hV9f09bkrCPvAMcVVqPjYmLg159t6CphTFP1mI4a4lH1Tio6v', 1),
(32, 4, '2021-09-06 09:56:40', 'Chronopost', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '06092021-6135e5d897c7f', NULL, 0),
(33, 4, '2021-09-12 00:04:32', 'Chronopost', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '12092021-613d4410ba231', 'cs_test_b1wSsfQTpxX9wgFSn0625Jgn9xuwL7ocYz5DoStCOQgoWBHAMFR2IVyHmD', 0),
(34, 4, '2021-09-12 02:10:47', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '12092021-613d61a7d40a4', NULL, 0),
(35, 4, '2021-09-12 02:39:22', 'Colissimo', 990, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '12092021-613d685a0ed63', 'cs_test_b1UHV7nheLH4VgqRT3sZd9P30wwO0ymS8wWlZGyif3PSqMqawFJiWUOLYY', 0),
(36, 4, '2021-09-12 11:10:06', 'Colissimo', 990, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '12092021-613de00e20c84', 'cs_test_b1yJzf265I7tKQwaUF6kiEvbIQSMoDPxGsZ4IyTqJG02VztdboRQPRflOr', 0),
(37, 4, '2021-09-12 11:12:17', 'Colissimo', 990, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '12092021-613de09191bc5', 'cs_test_b1gvio7LVNg1AIfhNge41YM1dNkBgHcf9XuSy1XVqtFUqjelf5zxXS3sAD', 1),
(38, 4, '2021-09-12 11:17:44', 'Chronopost', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '12092021-613de1d800cfd', 'cs_test_b1Z10z0IsFMwOvgdVjNQF5YRvVmaBjAbQButzJkkiBThFwezn0a9U7UiAi', 0),
(39, 4, '2021-09-13 15:28:54', 'Chronopost', 1050, 'Boubacar GUEYE<br/>0658474428<br/>dom<br/>23, Rue du port de Creteil<br/>94100 St Maure des Fossés - FR', '13092021-613f6e3694ca6', 'cs_test_b15iQdJAM7tMoWOIHyo4yFG6eXsxNq7fCH5REp4UVKuBZZhL5Z6CbohQMZ', 1),
(40, 4, '2021-09-13 16:07:14', 'Colissimo', 990, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '13092021-613f7732855f9', 'cs_test_b1zA1xgcQnzxoh75CEYTpTlcd6AseBd0PZvHLg5b8xqxzQf8r44CVFG1a4', 0),
(41, 4, '2021-09-14 08:24:28', 'Chronopost', 1050, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '14092021-61405c3c72031', 'cs_test_b1W89AlQl5mqmgXdZ2lbvTHUG2191bgWY4AyuWVLki7LrRCuClNajI2HJI', 1),
(42, 4, '2021-09-26 11:05:03', 'Colissimo', 990, 'boubacar GUEYE<br/>+33663953279<br/>dom<br/>8 Allée Georges Braque<br/>94000 Créteil - FR', '26092021-615053dfce00b', NULL, 0),
(43, 4, '2021-09-26 11:16:12', 'Chronopost', 1050, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '26092021-6150567c19672', NULL, 0),
(44, 4, '2021-09-26 11:18:28', 'Chronopost', 1050, 'Amath Gueye<br/>0767586892<br/>3 PARC HENRI DUNANT, Chez Madame Soumaré<br/>94290 VILLENEUVE LE ROI - FR', '26092021-61505704ea7e4', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `my_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(2, 1, 'COLLIER PAMPILLES', 1, 990, 990),
(3, 2, 'BAGUE MARTELEE', 1, 390, 390),
(4, 2, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(5, 3, 'BAGUE MARTELEE', 1, 390, 390),
(6, 3, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(7, 4, 'BAGUE MARTELEE', 3, 390, 1170),
(8, 4, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(9, 4, 'COLLIER PAMPILLES', 1, 990, 990),
(10, 5, 'BAGUE MARTELEE', 3, 390, 1170),
(11, 5, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(12, 5, 'COLLIER PAMPILLES', 1, 990, 990),
(13, 6, 'BAGUE MARTELEE', 3, 390, 1170),
(14, 6, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(15, 6, 'COLLIER PAMPILLES', 1, 990, 990),
(16, 7, 'BRACELET ÉLASTIQUE MIX', 2, 400, 800),
(17, 7, 'COLLIER PAMPILLES', 1, 990, 990),
(18, 7, 'BOUCLES D\'OREILLES MÉTAL ET TRIANGLE', 1, 750, 750),
(19, 8, 'BRACELET ÉLASTIQUE MIX', 2, 400, 800),
(20, 8, 'COLLIER PAMPILLES', 1, 990, 990),
(21, 8, 'BOUCLES D\'OREILLES MÉTAL ET TRIANGLE', 1, 750, 750),
(22, 9, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(23, 9, 'COLLIER PAMPILLES', 1, 990, 990),
(24, 10, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(25, 10, 'COLLIER PAMPILLES', 1, 990, 990),
(26, 11, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(27, 11, 'COLLIER PAMPILLES', 1, 990, 990),
(28, 12, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(29, 12, 'COLLIER PAMPILLES', 1, 990, 990),
(30, 13, 'PIERCING NOMBRIL GOUTTE STRASS', 1, 990, 990),
(31, 14, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(32, 14, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(33, 15, 'PIECE STRASS ET EFEFET SABLE', 1, 899, 899),
(34, 15, 'Boucles d\'oreilles triangle', 2, 750, 1500),
(35, 16, 'BAGUE MARTELEE', 1, 390, 390),
(36, 16, 'COLLIER PAMPILLES', 1, 990, 990),
(37, 17, 'BRACELET METAL EPAIS MARTELE', 4, 550, 2200),
(38, 17, 'COLLIER PAMPILLES', 1, 990, 990),
(39, 18, 'BRACELET ÉLASTIQUE MIX', 2, 400, 800),
(40, 18, 'COLLIER PAMPILLES', 2, 990, 1980),
(41, 19, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(42, 20, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(43, 21, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(44, 22, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(45, 23, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(46, 23, 'BAGUE MARTELEE', 1, 390, 390),
(47, 24, 'PIERCING NOMBRIL GOUTTE STRASS', 1, 990, 990),
(48, 25, 'BAGUE MARTELEE', 1, 390, 390),
(49, 25, 'COLLIER PAMPILLES', 1, 990, 990),
(50, 25, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(51, 25, 'Boucles d\'oreilles triangle', 1, 750, 750),
(52, 26, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(53, 26, 'BAGUE MARTELEE', 1, 390, 390),
(54, 26, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(55, 27, 'BRACELET ÉLASTIQUE MIX', 2, 400, 800),
(56, 27, 'COLLIER PAMPILLES', 1, 990, 990),
(57, 28, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(58, 29, 'BAGUE MARTELEE', 2, 4590, 9180),
(59, 30, 'BRACELET ÉLASTIQUE MIX', 2, 400, 800),
(60, 31, 'BAGUE MARTELEE', 1, 4590, 4590),
(61, 31, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(62, 32, 'BRACELET MARTELE', 1, 550, 550),
(63, 33, 'BAGUE MARTELEE', 1, 4590, 4590),
(64, 34, 'BAGUE MARTELEE', 1, 4590, 4590),
(65, 35, 'BAGUE MARTELEE', 1, 4590, 4590),
(66, 36, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(67, 36, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(68, 37, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(69, 37, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 1, 400, 400),
(70, 38, 'BAGUE MARTELEE', 1, 4590, 4590),
(71, 38, 'BRACELET MARTELE', 1, 550, 550),
(72, 39, 'BRACELET ÉLASTIQUE MIX', 3, 400, 1200),
(73, 39, 'BRACELET MARTELE', 3, 550, 1650),
(74, 39, 'Boucles d\'oreilles triangle', 2, 750, 1500),
(75, 40, 'BRACELET MARTELE', 1, 550, 550),
(76, 40, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(77, 41, 'BRACELET ÉLASTIQUE MIX', 1, 400, 400),
(78, 41, 'COLLIER PAMPILLES', 1, 990, 990),
(79, 42, 'BAGUE MARTELEE', 1, 4590, 4590),
(80, 43, 'Boucles d\'oreilles triangle', 2, 750, 1500),
(81, 43, 'BRACELET ÉLASTIQUE MIX', 4, 400, 1600),
(82, 44, 'Boucles d\'oreilles triangle', 2, 750, 1500),
(83, 44, 'BRACELET ÉLASTIQUE MIX', 4, 400, 1600);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `composition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `description`, `composition`, `price`, `stock`, `disponible`, `published`, `is_best`) VALUES
(1, 1, 'BAGUE MARTELEE', 'bague-martelee-metal-epoxy', '32350c48ad1c091d519bf9589e49c4a026212323.jpg', 'BAGUE MARTELEE METAL EPOXY', 'METAL EPOXY', 4590, 45, 1, 1, 0),
(2, 5, 'BRACELET ÉLASTIQUE MIX', 'bracelet-elastique-mix-metal-et-couleurs', '3f243ccbd3c867be27beaea24c467cecd0b72b22.jpg', 'BRACELET ÉLASTIQUE MIX MÉTAL ET COULEURS', 'ÉLASTIQUE MIX MÉTAL', 400, 25, 1, 1, 1),
(3, 2, 'COLLIER PAMPILLES', 'collier-4-rangs-separes-pampilles-chaines-et-rond-metal', '610fc78bb334f1f536cb0cf0ccdab99923415b89.jpg', 'COLLIER 4 RANGS SEPARES PAMPILLES, CHAINES ET ROND METAL', 'METAL', 990, 20, 1, 1, 0),
(4, 5, 'BRACELET MARTELE', 'bracelet-metal-epais-martele', 'f37d58aa3ec2c338e38117b1da3329d9c6e79fbb.jpg', 'BRACELET METAL EPAIS MARTELE', 'METAL', 550, 14, 1, 1, 0),
(5, 2, 'PIECE STRASS ET EFEFET SABLE', 'lot-de-2-collier-fin-piece-strass-et-efefet-sable', '696f1b2d5baa25bb69b5bd42086d779204789224.jpg', 'LOT DE 2 COLLIER FIN PIECE STRASS ET EFEFET SABLE', 'METAL', 899, 10, 1, 1, 0),
(6, 3, 'BOUCLES D\'OREILLES FEUILLE TROPICALE', 'boucles-doreilles-feuille-tropicale', 'd4a1e35ca9444b574c98a99e8e2e1151926618ef.jpg', 'BOUCLES D\'OREILLES FEUILLE TROPICALE', '60% fer 20% plastic 20% polyester', 400, 13, 1, 1, 1),
(7, 3, 'Boucles d\'oreilles triangle', 'boucles-doreilles-metal-et-triangle', 'a871f64b6ea366e945f4cf234807a341f7556f05.jpg', 'BOUCLES D\'OREILLES MÉTAL ET TRIANGLE', '10% zinc alloy', 750, 7, 1, 1, 0),
(8, 4, 'PIERCING NOMBRIL GOUTTE STRASS', 'piercing-nombril-goutte-strass', '9aafc19a162cd22f814364d436f17e0544b9b788.jpg', 'PIERCING NOMBRIL GOUTTE STRASS', 'FINITION ARGENTÉE ACIER CHIRURGICAL', 990, 25, 1, 1, 0),
(9, 2, 'COLLIER MULTI RANG LOVE', 'collier-multi-rang-love', 'f68f008ab75c75a9a0594a22f2871d0785117fe1.jpg', 'COLLIER MULTI RANG LOVE\r\nCouleur : Doré\r\nCollection : Stacking', 'METAL', 990, 25, 1, 1, 1),
(10, 2, 'COLLIER COURT PERLES', 'collier-court-perles', '857a06c469d3064c3a3cc4f82589a95f74b26dfe.jpg', 'Couleur : Marron\r\nFINITION DORÉE\r\nFERMOIR MOUSQUETON', '50% glass 40% métal 10% bois', 1599, 35, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE IF NOT EXISTS `reset_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_B9983CE5A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password`
--

INSERT INTO `reset_password` (`id`, `user_id`, `token`, `created_at`) VALUES
(2, 4, '610262b6e80f3', '2021-07-29 08:11:34'),
(3, 4, '610270190129f', '2021-07-29 09:08:41'),
(4, 4, '61125959d1803', '2021-08-10 10:47:53'),
(5, 4, '612e0f46e02ec', '2021-08-31 11:15:18');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(2, 'coumba@gmail.com', '[]', '$2y$13$KGMzD8XeXNROGGoDyiE0B.w6RxvAQhKRpcCZLqB3PLLbcLjAeMAFK', 'Comba', 'soumare'),
(4, 'bgueye@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$xQrhLuC34Gemn9E8CAnuuOfv1KMmfe7/g6UFuCIm3Jm1WzXqQdv8u', 'Boubacar', 'Gueye'),
(6, 'gboubs@hotmail.com', '[]', '$2y$13$JCARLnF6Sqo02kAnvCE50.uLkfSDRUeoWxj45Mmw/Gx.lMWjvnxWG', 'Bocar', 'gueye'),
(7, 'dabandiaye08@gmail.com', '[]', '$2y$13$hFyz7VvwNDHgb4fdiDkC6e1wX2Jpn.hUp7SSnNxYV3eP/lopMQeAm', 'Marie', 'dupond');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
