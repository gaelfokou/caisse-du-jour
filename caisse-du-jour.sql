-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 22 août 2023 à 04:15
-- Version du serveur : 8.0.34-0ubuntu0.22.04.1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `activations`
--

CREATE TABLE `activations` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_activations`
--

CREATE TABLE `admin_activations` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin_users`
--

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Administrator', 'Administrator', 'administrator@brackets.sk', '$2y$10$kAGnLVPK4UMiZS6/CY7UXOX0kVHYrkFmO5wHP8VN89nw0ZXtUGZQS', NULL, 1, 0, 'en', NULL, '2023-08-20 09:22:38', '2023-08-20 09:22:38', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cashes`
--

CREATE TABLE `cashes` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('ticket','coin','cent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` enum('1','5','10','50','100') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `fund_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cashes`
--

INSERT INTO `cashes` (`id`, `type`, `nominal`, `quantity`, `fund_id`, `created_at`, `updated_at`) VALUES
(10, 'cent', '1', 5, 5, '2023-08-22 01:25:27', '2023-08-22 01:25:27'),
(11, 'ticket', '1', 0, 5, '2023-08-22 01:25:27', '2023-08-22 01:25:27'),
(12, 'coin', '1', 0, 5, '2023-08-22 01:25:27', '2023-08-22 01:25:27'),
(13, 'cent', '1', 0, 6, '2023-08-22 01:51:56', '2023-08-22 01:51:56'),
(14, 'ticket', '1', 3, 6, '2023-08-22 01:51:56', '2023-08-22 01:51:56'),
(15, 'coin', '1', 0, 6, '2023-08-22 01:51:56', '2023-08-22 01:51:56');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `funds`
--

CREATE TABLE `funds` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('deposit','discount','withdrawal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` date NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `funds`
--

INSERT INTO `funds` (`id`, `type`, `published_at`, `comment`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'discount', '2023-08-23', 'aaa', 1, '2023-08-22 01:25:27', '2023-08-22 01:25:27'),
(6, 'discount', '2023-08-14', 'aaa', 1, '2023-08-22 01:51:56', '2023-08-22 01:51:56');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1, '40685e00-5b3d-4455-a0b9-4fd756cfcdf1', 'avatar', 'avatar', 'avatar.png', 'image/png', 'media', 'media', 23924, '[]', '[]', '{\"thumb_75\": true, \"thumb_150\": true, \"thumb_200\": true}', '[]', 1, '2023-08-20 09:22:38', '2023-08-20 09:22:39');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_24_000000_create_activations_table', 1),
(4, '2017_08_24_000000_create_admin_activations_table', 1),
(5, '2017_08_24_000000_create_admin_password_resets_table', 1),
(6, '2017_08_24_000000_create_admin_users_table', 1),
(7, '2018_07_18_000000_create_wysiwyg_media_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2020_10_21_000000_add_last_login_at_timestamp_to_admin_users_table', 1),
(11, '2023_08_20_102237_create_media_table', 1),
(12, '2023_08_20_102237_create_permission_tables', 1),
(13, '2023_08_20_102242_fill_default_admin_user_and_permissions', 1),
(14, '2023_08_20_102237_create_translations_table', 2),
(15, '2023_08_20_115725_create_funds_table', 3),
(16, '2023_08_20_125729_create_cashes_table', 3);

-- --------------------------------------------------------

--
-- Structure de la table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(2, 'admin.translation.index', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(3, 'admin.translation.edit', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(4, 'admin.translation.rescan', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(5, 'admin.admin-user.index', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(6, 'admin.admin-user.create', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(7, 'admin.admin-user.edit', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(8, 'admin.admin-user.delete', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(9, 'admin.upload', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38'),
(10, 'admin.admin-user.impersonal-login', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2023-08-20 09:22:38', '2023-08-20 09:22:38');

-- --------------------------------------------------------

--
-- Structure de la table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` json NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(2, 'brackets/admin-ui', 'admin', 'operation.failed', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(3, 'brackets/admin-ui', 'admin', 'operation.not_allowed', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(4, '*', 'admin', 'admin-user.columns.activated', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(5, '*', 'admin', 'admin-user.columns.email', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(6, '*', 'admin', 'admin-user.columns.first_name', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(7, '*', 'admin', 'admin-user.columns.forbidden', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(8, '*', 'admin', 'admin-user.columns.language', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(9, 'brackets/admin-ui', 'admin', 'forms.select_an_option', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(10, '*', 'admin', 'admin-user.columns.last_name', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(11, '*', 'admin', 'admin-user.columns.password', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(12, '*', 'admin', 'admin-user.columns.password_repeat', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(13, '*', 'admin', 'admin-user.columns.roles', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(14, 'brackets/admin-ui', 'admin', 'forms.select_options', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(15, '*', 'admin', 'admin-user.actions.create', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(16, 'brackets/admin-ui', 'admin', 'btn.save', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(17, '*', 'admin', 'admin-user.actions.edit', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(18, '*', 'admin', 'admin-user.actions.index', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(19, 'brackets/admin-ui', 'admin', 'placeholder.search', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(20, 'brackets/admin-ui', 'admin', 'btn.search', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(21, '*', 'admin', 'admin-user.columns.id', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(22, '*', 'admin', 'admin-user.columns.last_login_at', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(23, 'brackets/admin-ui', 'admin', 'btn.edit', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(24, 'brackets/admin-ui', 'admin', 'btn.delete', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(25, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(26, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(27, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(28, 'brackets/admin-ui', 'admin', 'btn.new', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(29, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(30, 'brackets/admin-auth', 'admin', 'profile_dropdown.profile', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(31, 'brackets/admin-auth', 'admin', 'profile_dropdown.password', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(32, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(33, 'brackets/admin-ui', 'admin', 'sidebar.content', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(34, 'brackets/admin-ui', 'admin', 'sidebar.settings', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(35, '*', 'admin', 'admin-user.actions.edit_password', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(36, '*', 'admin', 'admin-user.actions.edit_profile', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(37, 'brackets/admin-auth', 'admin', 'activation_form.title', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(38, 'brackets/admin-auth', 'admin', 'activation_form.note', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(39, 'brackets/admin-auth', 'admin', 'auth_global.email', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(40, 'brackets/admin-auth', 'admin', 'activation_form.button', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(41, 'brackets/admin-auth', 'admin', 'login.title', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(42, 'brackets/admin-auth', 'admin', 'login.sign_in_text', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(43, 'brackets/admin-auth', 'admin', 'auth_global.password', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(44, 'brackets/admin-auth', 'admin', 'login.button', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(45, 'brackets/admin-auth', 'admin', 'login.forgot_password', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(46, 'brackets/admin-auth', 'admin', 'forgot_password.title', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(47, 'brackets/admin-auth', 'admin', 'forgot_password.note', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(48, 'brackets/admin-auth', 'admin', 'forgot_password.button', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(49, 'brackets/admin-auth', 'admin', 'password_reset.title', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(50, 'brackets/admin-auth', 'admin', 'password_reset.note', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(51, 'brackets/admin-auth', 'admin', 'auth_global.password_confirm', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(52, 'brackets/admin-auth', 'admin', 'password_reset.button', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(53, 'brackets/admin-auth', 'activations', 'email.line', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(54, 'brackets/admin-auth', 'activations', 'email.action', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(55, 'brackets/admin-auth', 'activations', 'email.notRequested', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(56, 'brackets/admin-auth', 'admin', 'activations.activated', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(57, 'brackets/admin-auth', 'admin', 'activations.invalid_request', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(58, 'brackets/admin-auth', 'admin', 'activations.disabled', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(59, 'brackets/admin-auth', 'admin', 'activations.sent', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(60, 'brackets/admin-auth', 'admin', 'passwords.sent', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(61, 'brackets/admin-auth', 'admin', 'passwords.reset', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(62, 'brackets/admin-auth', 'admin', 'passwords.invalid_token', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(63, 'brackets/admin-auth', 'admin', 'passwords.invalid_user', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(64, 'brackets/admin-auth', 'admin', 'passwords.invalid_password', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(65, 'brackets/admin-auth', 'resets', 'email.line', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(66, 'brackets/admin-auth', 'resets', 'email.action', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(67, 'brackets/admin-auth', 'resets', 'email.notRequested', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(68, '*', 'auth', 'failed', '[]', NULL, '2023-08-20 09:23:06', '2023-08-20 09:23:06', NULL),
(69, '*', 'auth', 'throttle', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(70, '*', '*', 'Manage access', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(71, '*', '*', 'Translations', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(72, '*', '*', 'Configuration', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(73, '*', '*', 'Login', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(74, '*', '*', 'Email Address', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(75, '*', '*', 'Password', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(76, '*', '*', 'Remember Me', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(77, '*', '*', 'Forgot Your Password?', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(78, '*', '*', 'Confirm Password', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(79, '*', '*', 'Please confirm your password before continuing.', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(80, '*', '*', 'Reset Password', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(81, '*', '*', 'Send Password Reset Link', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(82, '*', '*', 'Register', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(83, '*', '*', 'Name', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(84, '*', '*', 'Verify Your Email Address', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(85, '*', '*', 'A fresh verification link has been sent to your email address.', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(86, '*', '*', 'Before proceeding, please check your email for a verification link.', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(87, '*', '*', 'If you did not receive the email', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(88, '*', '*', 'click here to request another', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(89, '*', '*', 'Dashboard', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(90, '*', '*', 'You are logged in!', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(91, '*', '*', 'Toggle navigation', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL),
(92, '*', '*', 'Logout', '[]', NULL, '2023-08-20 09:23:07', '2023-08-20 09:23:07', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User', 'user@localhost.com', NULL, '$2y$10$fUQu.ftM.F/b1zbId6IIJ.6adM9Y8N9ODROApTScKI9Luni.YNUn2', NULL, '2023-08-20 13:26:08', '2023-08-20 13:26:08');

-- --------------------------------------------------------

--
-- Structure de la table `wysiwyg_media`
--

CREATE TABLE `wysiwyg_media` (
  `id` int UNSIGNED NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int UNSIGNED DEFAULT NULL,
  `wysiwygable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activations`
--
ALTER TABLE `activations`
  ADD KEY `activations_email_index` (`email`);

--
-- Index pour la table `admin_activations`
--
ALTER TABLE `admin_activations`
  ADD KEY `admin_activations_email_index` (`email`);

--
-- Index pour la table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Index pour la table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Index pour la table `cashes`
--
ALTER TABLE `cashes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cashes_fund_id_foreign` (`fund_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `funds_user_id_foreign` (`user_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Index pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_namespace_index` (`namespace`),
  ADD KEY `translations_group_index` (`group`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cashes`
--
ALTER TABLE `cashes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cashes`
--
ALTER TABLE `cashes`
  ADD CONSTRAINT `cashes_fund_id_foreign` FOREIGN KEY (`fund_id`) REFERENCES `funds` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `funds`
--
ALTER TABLE `funds`
  ADD CONSTRAINT `funds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
