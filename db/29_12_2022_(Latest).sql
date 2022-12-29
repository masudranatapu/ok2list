-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 06:09 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ok2list`
--

-- --------------------------------------------------------

--
-- Table structure for table `auths`
--

CREATE TABLE `auths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL COMMENT '1 = Admin',
  `mobile1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1_is_verified` tinyint(4) DEFAULT 0,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `dob` date DEFAULT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `google_id` bigint(20) DEFAULT NULL,
  `package_id` int(10) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `seller_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Individual Seller',
  `activation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_code_expire` datetime DEFAULT NULL,
  `is_first_login` tinyint(4) NOT NULL DEFAULT 1,
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Admin',
  `can_login` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Can login, 0 = Can not login',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `web_setting_access` int(1) NOT NULL DEFAULT 0,
  `profile_pic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_mime_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auths`
--

INSERT INTO `auths` (`id`, `username`, `name`, `email`, `address`, `mobile_no`, `password`, `salt`, `model_id`, `mobile1`, `mobile1_is_verified`, `gender`, `dob`, `facebook_id`, `google_id`, `package_id`, `is_active`, `seller_type`, `activation_code`, `activation_code_expire`, `is_first_login`, `user_type`, `can_login`, `status`, `created_by`, `updated_by`, `remember_token`, `city`, `total_post`, `created_at`, `updated_at`, `web_setting_access`, `profile_pic`, `profile_pic_url`, `pic_mime_type`, `first_name`, `last_name`, `designation`) VALUES
(1, 'sadmin', NULL, 'arobil@gmail.com', NULL, '01681944126', '$2y$10$VFm643nOKw7wq.0N9mUKyeUA4wfq0igfJE0QXP5Q0qZhcUO7Nn0Ty', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 'Individual Seller', NULL, NULL, 1, 0, 1, 1, 0, 0, NULL, NULL, 0, NULL, '2022-12-13 18:49:56', 1, 'profile_06082022_1659775736.jpg', 'https://ok2list.com/media/images/profile/profile_06082022_1659775736.jpg', NULL, 'Maidul', 'Maidul', 'Developer'),
(21, 'Manager', NULL, 'Manager@gmail.com', NULL, '01681944126', '$2y$10$X5TDs4BFzFGOXx9qh/ZW2.rHmHIcLB.WhhPRp586Tn4VIZ2l9WKi6', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 'Individual Seller', NULL, NULL, 1, 0, 1, 1, 0, 0, NULL, NULL, 0, '2022-07-28 14:39:03', '2022-07-28 14:40:37', 0, 'profile_28072022_1659019143.jpg', 'http://localhost/test/ok2list/public/media/images/profile/profile_28072022_1659019143.jpg', NULL, 'Manager', 'Manager', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `auth_role`
--

CREATE TABLE `auth_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `custom_permission` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_role`
--

INSERT INTO `auth_role` (`id`, `auth_id`, `role_id`, `user_group_id`, `custom_permission`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, '2020-10-03 07:06:35', '2022-07-28 14:11:37'),
(3, 21, 8, 3, NULL, '2022-07-28 14:39:03', '2022-07-28 14:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `backup_admin_users`
--

CREATE TABLE `backup_admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_id` bigint(20) UNSIGNED NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_mime_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_type` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backup_admin_users`
--

INSERT INTO `backup_admin_users` (`id`, `first_name`, `last_name`, `designation`, `auth_id`, `profile_pic`, `profile_pic_url`, `pic_mime_type`, `status`, `created_at`, `updated_at`, `deleted_at`, `user_type`) VALUES
(3, 'Super', 'Admin', 'Super', 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0),
(4, 'Admin', 'General', 'General Admin', 2, 'profile_12072021_1626107790.jpg', '/media/images/profile/profile_12072021_1626107790.jpg', NULL, 1, '2020-10-03 07:06:35', '2021-07-12 16:36:30', NULL, 0),
(6, 'Sale', 'Manager', 'Sales', 16, 'profile_12072021_1626108493.jpg', 'https://panel.dalalbazar.com/media/images/profile/profile_12072021_1626108493.jpg', NULL, 1, '2020-10-09 04:59:28', '2021-07-12 16:48:13', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `established` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`id`, `name`, `code`, `moto`, `address`, `established`, `logo`, `logo_url`, `banner`, `banner_url`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Banani', '001', 'We Build', 'Banani', '1999', 'logo_04102020_1601816194.png', 'http://www.boilerplate-admin.local/media/images/gym/logo_04102020_1601816194.png', 'banner_04102020_1601816194.jpg', 'http://www.boilerplate-admin.local/media/images/gym/banner_04102020_1601816194.jpg', 1, 0, 0, 0, '2020-10-03 06:56:34', '2020-10-03 06:56:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_09_30_123517_create_permission_groups_table', 1),
(4, '2019_09_30_123523_create_permissions_table', 1),
(5, '2019_09_30_123524_create_roles_table', 1),
(6, '2019_09_30_123525_create_group_role_permission_table', 1),
(7, '2019_09_30_123526_create_models_table', 1),
(8, '2019_09_30_123527_create_auths_table', 1),
(9, '2019_09_30_123528_create_auth_group_role_table', 1),
(10, '2019_10_01_073858_create_admin_users_table', 1),
(11, '2019_10_02_073857_create_users_table', 1),
(12, '2020_01_21_060402_create_tokens_table', 1),
(13, '2020_01_22_190558_create_verify_mobile_no_table', 1),
(14, '2020_01_28_173236_create_table_workout_body_part', 1),
(15, '2020_01_28_173340_create_table_workout_items', 1),
(16, '2020_02_12_064858_create_gyms_table', 1),
(17, '2020_02_18_102849_add_gym_id_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_key` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00410031-d3f4-4aca-8e23-e948b5ecca9a', 'App\\Notifications\\AdminPostAdNotification', 'App\\User', 29, '[]', NULL, '2022-08-16 01:02:00', '2022-08-16 01:02:00'),
('02a2c794-6933-4616-bbb2-26cc5f86bebe', 'App\\Notifications\\AdminPostAdNotification', 'App\\User', 48, '[]', NULL, '2022-12-15 18:56:45', '2022-12-15 18:56:45'),
('051bb1fa-eba3-493c-9186-dc5a99e6e6c3', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 50, '[]', NULL, '2022-12-19 21:33:54', '2022-12-19 21:33:54'),
('08596201-c17e-41d9-b03f-d4470a426dd6', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-13 22:33:27', '2022-12-13 22:33:27'),
('0bad6a36-de2f-4145-9dad-fa316e1a7d44', 'App\\Notifications\\WellComeNotification', 'App\\User', 37, '{\"user_id\":37}', NULL, '2022-10-22 01:44:08', '2022-10-22 01:44:08'),
('1594c95d-9d07-42c6-9f71-036f64092062', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-19 21:27:11', '2022-12-19 21:27:11'),
('16085316-8d62-4958-9943-08bb9350b0a4', 'App\\Notifications\\AdminPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-20 15:51:03', '2022-08-20 15:51:03'),
('169ef1c4-beaa-47bc-b6f9-bda08bcc7d1e', 'App\\Notifications\\WellComeNotification', 'App\\User', 40, '{\"user_id\":40}', NULL, '2022-11-26 17:21:29', '2022-11-26 17:21:29'),
('1780dab1-cf61-451c-a56b-32c2a44dd25e', 'App\\Notifications\\WellComeNotification', 'App\\User', 8, '{\"user_id\":8}', NULL, '2022-08-06 16:22:27', '2022-08-06 16:22:27'),
('19be9c08-1742-4dd6-9a15-bfbe739da4ba', 'App\\Notifications\\WellComeNotification', 'App\\User', 35, '{\"user_id\":35}', NULL, '2022-10-16 09:32:32', '2022-10-16 09:32:32'),
('1ad21635-2ad1-4fd6-bc38-cfe1efe875b0', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-20 15:50:58', '2022-08-20 15:50:58'),
('2022f734-2177-4a20-bf6c-3c89dd99bd99', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-19 21:26:45', '2022-12-19 21:26:45'),
('230c761f-f7cd-4328-bc01-b979538babed', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 51, '[]', NULL, '2022-12-19 20:37:11', '2022-12-19 20:37:11'),
('29f4c89f-0b9c-4629-a36e-6bb1a8cff89a', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 48, '[]', NULL, '2022-12-15 18:54:21', '2022-12-15 18:54:21'),
('2ed33090-0945-4c99-98ce-b78b8f368c54', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 47, '[]', NULL, '2022-12-14 23:58:13', '2022-12-14 23:58:13'),
('32db467c-23b2-4c5a-98fb-0675e49259aa', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 29, '[]', NULL, '2022-08-16 01:01:55', '2022-08-16 01:01:55'),
('3409c013-0f53-4e51-8ae3-195a4ff12650', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-19 21:27:42', '2022-12-19 21:27:42'),
('37e78058-f0e8-4b1c-ae6e-1da7c72ffd24', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 51, '[]', NULL, '2022-12-19 20:37:34', '2022-12-19 20:37:34'),
('4675d480-85e6-482e-b0c0-55e4b3d6e585', 'App\\Notifications\\WellComeNotification', 'App\\User', 33, '{\"user_id\":33}', NULL, '2022-09-02 02:22:50', '2022-09-02 02:22:50'),
('46b11d65-681f-4f15-9706-18a2132cdcd9', 'App\\Notifications\\WellComeNotification', 'App\\User', 11, '{\"user_id\":11}', NULL, '2022-08-06 17:53:17', '2022-08-06 17:53:17'),
('47d076b6-3755-435f-b0ea-9dbc211287a4', 'App\\Notifications\\WellComeNotification', 'App\\User', 36, '{\"user_id\":36}', NULL, '2022-10-20 05:30:21', '2022-10-20 05:30:21'),
('491b43dd-7b7c-41d0-a556-9952664034c0', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-13 22:26:54', '2022-12-13 22:26:54'),
('49eea444-83de-49c1-ae56-9120a5da5c8f', 'App\\Notifications\\WellComeNotification', 'App\\User', 25, '{\"user_id\":25}', NULL, '2022-08-14 04:01:12', '2022-08-14 04:01:12'),
('49feb57c-ed77-483a-b413-8b2d4bc6cb3e', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-19 21:31:18', '2022-12-19 21:31:18'),
('4a73f0e6-f84e-4e98-9f75-8b130cc86a0d', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 50, '[]', NULL, '2022-12-15 21:27:29', '2022-12-15 21:27:29'),
('51515f35-4df2-43e5-8547-5b84c1c8d7db', 'App\\Notifications\\AdminPostAdNotification', 'App\\User', 51, '[]', NULL, '2022-12-19 20:37:39', '2022-12-19 20:37:39'),
('5379773e-531c-479b-a96c-9442914073d3', 'App\\Notifications\\WellComeNotification', 'App\\User', 31, '{\"user_id\":31}', NULL, '2022-08-19 14:19:25', '2022-08-19 14:19:25'),
('5b55b62c-c016-4a49-a441-a62dd3763d1d', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-09-05 20:13:24', '2022-09-05 20:13:24'),
('5cc5141b-f355-40ee-9952-c0342bb9955c', 'App\\Notifications\\WellComeNotification', 'App\\User', 32, '{\"user_id\":32}', NULL, '2022-08-31 15:58:40', '2022-08-31 15:58:40'),
('63e1fdc5-551e-48b0-9de6-1a0cd4be33ac', 'App\\Notifications\\WellComeNotification', 'App\\User', 26, '{\"user_id\":26}', NULL, '2022-08-14 16:29:13', '2022-08-14 16:29:13'),
('68cd1dc5-b1cf-450d-8c57-9be06e617509', 'App\\Notifications\\WellComeNotification', 'App\\User', 42, '{\"user_id\":42}', NULL, '2022-12-13 20:02:33', '2022-12-13 20:02:33'),
('6e5321c9-1698-4a45-96db-c008b14c02ac', 'App\\Notifications\\WellComeNotification', 'App\\User', 51, '{\"user_id\":51}', NULL, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
('76c3ee49-6e5e-46ca-a47a-044c89a5c445', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-22 15:13:53', '2022-08-22 15:13:53'),
('77ed2652-507b-4880-82d5-dcf1ce9296a8', 'App\\Notifications\\WellComeNotification', 'App\\User', 48, '{\"user_id\":48}', NULL, '2022-12-15 18:44:18', '2022-12-15 18:44:18'),
('78c85bb1-4ca5-481c-8344-860102807848', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-24 18:49:43', '2022-08-24 18:49:43'),
('7b5b8022-69bf-4318-b94e-a26548ef8f35', 'App\\Notifications\\WellComeNotification', 'App\\User', 29, '{\"user_id\":29}', NULL, '2022-08-15 23:59:09', '2022-08-15 23:59:09'),
('841596b1-4b6e-4295-b055-2503bbc3fcd8', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-09-05 20:17:46', '2022-09-05 20:17:46'),
('84709c9c-e113-4d55-bc43-4e4c84c2d627', 'App\\Notifications\\WellComeNotification', 'App\\User', 6, '{\"user_id\":6}', NULL, '2022-08-06 15:36:47', '2022-08-06 15:36:47'),
('8e3b48d3-d136-4246-b07c-bafe6bead502', 'App\\Notifications\\WellComeNotification', 'App\\User', 50, '{\"user_id\":50}', NULL, '2022-12-15 21:12:36', '2022-12-15 21:12:36'),
('9248a6de-2746-49a9-aff4-4a7628948bb6', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 47, '[]', NULL, '2022-12-15 17:17:59', '2022-12-15 17:17:59'),
('9370cb06-5ac5-4fa7-9f31-b1dd4e555a67', 'App\\Notifications\\WellComeNotification', 'App\\User', 13, '{\"user_id\":13}', NULL, '2022-08-06 22:15:46', '2022-08-06 22:15:46'),
('96748e3c-c5b0-46de-93ad-799d29004ca6', 'App\\Notifications\\WellComeNotification', 'App\\User', 23, '{\"user_id\":23}', NULL, '2022-08-12 16:04:57', '2022-08-12 16:04:57'),
('96fe85b8-745d-4e5d-be4f-7b731453f74f', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-09-04 19:20:23', '2022-09-04 19:20:23'),
('9ed484d1-4af5-4bb7-9b46-15b417b326fc', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 51, '[]', NULL, '2022-12-19 23:33:43', '2022-12-19 23:33:43'),
('9fee55dc-3970-4c73-9c6f-5e6d1fec586a', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 51, '[]', NULL, '2022-12-19 20:36:51', '2022-12-19 20:36:51'),
('a3e495ab-768c-45d3-853d-bbd67b3d5032', 'App\\Notifications\\WellComeNotification', 'App\\User', 12, '{\"user_id\":12}', NULL, '2022-08-06 22:08:01', '2022-08-06 22:08:01'),
('a696e64a-bd46-42bb-8973-eb67a7bd52b3', 'App\\Notifications\\WellComeNotification', 'App\\User', 28, '{\"user_id\":28}', NULL, '2022-08-14 22:42:51', '2022-08-14 22:42:51'),
('b328660f-fb16-4f80-a5b3-04879b32739f', 'App\\Notifications\\WellComeNotification', 'App\\User', 3, '{\"user_id\":3}', NULL, '2022-07-28 15:16:18', '2022-07-28 15:16:18'),
('b58dde50-906b-4bc1-b8b1-b4ea64b8adf3', 'App\\Notifications\\WellComeNotification', 'App\\User', 38, '{\"user_id\":38}', NULL, '2022-11-03 06:17:27', '2022-11-03 06:17:27'),
('b667b0d2-6360-4377-9080-97bd2674e010', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-31 15:44:48', '2022-08-31 15:44:48'),
('b7b302c6-d042-4f02-8848-7d0f2054a7d6', 'App\\Notifications\\WellComeNotification', 'App\\User', 21, '{\"user_id\":21}', NULL, '2022-08-07 22:25:20', '2022-08-07 22:25:20'),
('b80d6096-da9a-4577-a4ab-0e9918982514', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-07 17:04:39', '2022-08-07 17:04:39'),
('b8579206-3c25-47ea-960c-15862bdb41ab', 'App\\Notifications\\WellComeNotification', 'App\\User', 49, '{\"user_id\":49}', NULL, '2022-12-15 21:10:10', '2022-12-15 21:10:10'),
('b8d1c9b4-3fee-45e9-802e-4327a3f1765d', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-20 15:54:28', '2022-08-20 15:54:28'),
('ba168ea1-03fa-487b-aa22-f604f9cbcdb5', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-09 02:07:40', '2022-08-09 02:07:40'),
('bd13aaa9-1eef-4271-99a7-73416cfcb38f', 'App\\Notifications\\WellComeNotification', 'App\\User', 17, '{\"user_id\":17}', NULL, '2022-08-07 15:01:43', '2022-08-07 15:01:43'),
('bdd43d8b-1873-4022-ab55-ced133c9a0ef', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-07 18:14:26', '2022-08-07 18:14:26'),
('be408b33-a981-4240-b7f7-bc6aa0cc8ded', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-13 22:58:02', '2022-12-13 22:58:02'),
('bef24ada-aa86-4ce6-9e4b-d7cd116b0c31', 'App\\Notifications\\WellComeNotification', 'App\\User', 9, '{\"user_id\":9}', NULL, '2022-08-06 16:24:50', '2022-08-06 16:24:50'),
('caef3978-91ce-40e4-b0f4-1b8960ea06f8', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 46, '[]', NULL, '2022-12-19 21:28:10', '2022-12-19 21:28:10'),
('cc1bfbaf-d940-48a9-ac31-d5c965336962', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 47, '[]', NULL, '2022-12-14 23:50:07', '2022-12-14 23:50:07'),
('cffc9774-308d-43ae-aae0-e2df829e6928', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 48, '[]', NULL, '2022-12-15 18:56:40', '2022-12-15 18:56:40'),
('d423ef08-4796-4c1b-a841-163d907aa319', 'App\\Notifications\\WellComeNotification', 'App\\User', 15, '{\"user_id\":15}', NULL, '2022-08-06 22:21:56', '2022-08-06 22:21:56'),
('d901924a-b5d4-4243-91d9-04cf13e6b782', 'App\\Notifications\\UserPostAdNotification', 'App\\User', 26, '[]', NULL, '2022-08-31 16:32:40', '2022-08-31 16:32:40'),
('de3f7114-9688-424e-9fd4-916b27c92343', 'App\\Notifications\\AdminPostAdNotification', 'App\\User', 48, '[]', NULL, '2022-12-15 18:54:26', '2022-12-15 18:54:26'),
('e0c72bd8-7212-4c57-99ac-6821d1365b01', 'App\\Notifications\\WellComeNotification', 'App\\User', 14, '{\"user_id\":14}', NULL, '2022-08-06 22:17:13', '2022-08-06 22:17:13'),
('e9ad1c13-36bb-4dd2-a42a-6d82c2d0bebf', 'App\\Notifications\\WellComeNotification', 'App\\User', 10, '{\"user_id\":10}', NULL, '2022-08-06 16:27:46', '2022-08-06 16:27:46'),
('eb363987-150c-4bb7-877d-67eac1a7abd4', 'App\\Notifications\\WellComeNotification', 'App\\User', 18, '{\"user_id\":18}', NULL, '2022-08-07 15:10:48', '2022-08-07 15:10:48'),
('eeb9d748-85fc-4964-bccb-2f069c037931', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-07 17:07:49', '2022-08-07 17:07:49'),
('eee4e6f6-c49e-4981-b532-310c9c0f0804', 'App\\Notifications\\WellComeNotification', 'App\\User', 20, '{\"user_id\":20}', NULL, '2022-08-07 17:14:17', '2022-08-07 17:14:17'),
('f24d0b0a-4308-4ab7-9d78-786851efec6f', 'App\\Notifications\\WellComeNotification', 'App\\User', 45, '{\"user_id\":45}', NULL, '2022-12-13 21:57:04', '2022-12-13 21:57:04'),
('f5d708e9-a3c6-494b-a3ef-91634cab930a', 'App\\Notifications\\WellComeNotification', 'App\\User', 16, '{\"user_id\":16}', NULL, '2022-08-07 02:57:04', '2022-08-07 02:57:04'),
('fa2220e2-6633-4739-9f51-eb6411e4b1f1', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-06 15:42:30', '2022-08-06 15:42:30'),
('fb5dcb7a-33b1-4ed1-9502-8802f1fb7b75', 'App\\Notifications\\WellComeNotification', 'App\\User', 47, '{\"user_id\":47}', NULL, '2022-12-14 22:11:19', '2022-12-14 22:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `page_about_us`
--

CREATE TABLE `page_about_us` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `details_en` longtext DEFAULT NULL,
  `details_sl` longtext DEFAULT NULL,
  `mission_en` text DEFAULT NULL,
  `mission_sl` text DEFAULT NULL,
  `vision_en` text DEFAULT NULL,
  `vision_sl` text DEFAULT NULL,
  `our_values_en` text DEFAULT NULL,
  `our_values_sl` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_about_us`
--

INSERT INTO `page_about_us` (`id`, `image`, `details_en`, `details_sl`, `mission_en`, `mission_sl`, `vision_en`, `vision_sl`, `our_values_en`, `our_values_sl`, `created_at`, `updated_at`) VALUES
(1, 'media/about/about-62fa6ef1955de.jpg', '<p>The ok2list.com was launched in December 2018 to full fill the need of those looking for an alternative to site current market online classified websites. Our vision is to build the best online classified site. To accomplish this, we took the best features of the most popular sites and combined them with many new custom features, not invented and offered by other competitors, and put them into one place. That&rsquo;s ok2list.com.</p>\r\n\r\n<p>Ok2list.com delivers a better user experience while allowing more user control over your ads. We offer FREE Classified Ads, along with the ability to upgrade to our premium features (paid services) for a small fee. We encourage our business users to use our membership and promote your ad subscription services. Ok2list.com allows your business to have custom presence on our site.</p>\r\n\r\n<p>ok2list.com made users to find exactly what users looking in a fast way and users be able to post an ad within 2 minutes. Users can sign up for a free account and post ads easily every time.</p>\r\n\r\n<p>Currently, we are still working on improving further as per latest technology available and to provide the Mobile applications.</p>\r\n\r\n<p>We respect your voice, opinion and recommendation and let us know your thought at&nbsp;<strong>contacts@theqsweek.com.</strong></p>\r\n\r\n<p>Thank you for using ok2list.com</p>', '<p>ok2list.com 2018 දෙසැම්බර් මාසයේදී දියත් කරන ලද්දේ වෙබ් අඩවි වත්මන් වෙළඳපොල සමඟ අමුත්තන් වර්ගීකරණය කරන ලද වෙබ් අඩවි සඳහා විකල්පයක් සොයන අයගේ අවශ්&zwj;යතා සම්පූර්ණ කිරීම සඳහා ය. අපගේ දැක්ම වන්නේ හොඳම මාර්ගගත වර්ගීකරණය කරන ලද වෙබ් අඩවියක් තැනීමයි. මෙය සාක්ෂාත් කර ගැනීම සඳහා, අපි වඩාත් ජනප්&zwj;රිය වෙබ් අඩවි වල හොඳම විශේෂාංග ගෙන ඒවා වෙනත් තරඟකරුවන් විසින් සොයා නොගත් සහ ඉදිරිපත් නොකළ බොහෝ නව අභිරුචි විශේෂාංග සමඟ ඒකාබද්ධ කර ඒවා එක තැනකට තැබුවෙමු. ඒ ok2list.com ය.</p>\r\n\r\n<p>Ok2list.com ඔබේ දැන්වීම් කෙරෙහි වැඩි පරිශීලක පාලනයකට ඉඩ දෙන අතරම වඩා හොඳ පරිශීලක අත්දැකීමක් ලබා දෙයි. අපි කුඩා ගාස්තුවකට අපගේ වාරික විශේෂාංග (ගෙවුම් සේවා) වෙත උත්ශ්&zwj;රේණි කිරීමේ හැකියාව සමඟින් නොමිලේ වර්ගීකරණය කළ දැන්වීම් පිරිනමන්නෙමු. අපගේ සාමාජිකත්වය භාවිතා කිරීමට සහ ඔබේ දැන්වීම් දායක සේවා ප්&zwj;රවර්ධනය කිරීමට අපි අපගේ ව්&zwj;යාපාරික පරිශීලකයින් දිරිමත් කරමු. Ok2list.com ඔබගේ ව්&zwj;යාපාරයට අපගේ වෙබ් අඩවියේ අභිරුචි පැවතීමට ඉඩ සලසයි.</p>\r\n\r\n<p>ok2list.com මඟින් පරිශීලකයින්ට වේගයෙන් පෙනෙන දේ හරියටම සොයා ගැනීමට හැකි වූ අතර පරිශීලකයින්ට මිනිත්තු 2 ක් තුළ දැන්වීමක් පළ කිරීමට හැකි විය. පරිශීලකයින්ට නොමිලේ ගිණුමක් සඳහා ලියාපදිංචි විය හැකි අතර සෑම විටම පහසුවෙන් දැන්වීම් පළ කළ හැකිය.</p>\r\n\r\n<p>දැනට, පවතින නවීන තාක්&zwj;ෂණය අනුව තව දුරටත් වැඩිදියුණු කිරීමට සහ ජංගම යෙදුම් සැපයීමට අපි තවමත් කටයුතු කරමින් සිටිමු.</p>\r\n\r\n<p>අපි ඔබේ හඬට, අදහසට සහ නිර්දේශයට ගරු කරන අතර contacts@theqsweek.com හි ඔබේ අදහස අපට දන්වන්නෙමු.</p>\r\n\r\n<p>ok2list.com භාවිතා කිරීම ගැන ඔබට ස්තුතියි</p>', 'We lead the way in providing value to our customers, by building our position as the reference ok2list.com is the leading online classified in srilanka and in the region.', 'පුද්ගල පද්ධති සහ තාක්‍ෂණය සඳහා ඇති කැපවීම තුළින්, ok2list.com ශ්‍රී ලංකාවේ සහ කලාපයේ ප්‍රමුඛ පෙළේ මාර්ගගත වර්ගීකරණයක් ලෙස අපගේ තත්ත්වය ගොඩනඟා ගනිමින්, අපගේ ගනුදෙනුකරුවන්ට වටිනාකමක් ලබා දීමට අපි පෙරමුණ ගනිමු.', 'Through commitment to people systems and technologylding our position as the reference ok2list.com is the leading online classified in srilanka and in the region.', 'පුද්ගල පද්ධති සහ තාක්‍ෂණය සඳහා ඇති කැපවීම තුළින්, ok2list.com ශ්‍රී ලංකාවේ සහ කලාපයේ ප්‍රමුඛ පෙළේ මාර්ගගත වර්ගීකරණයක් ලෙස අපගේ තත්ත්වය ගොඩනඟා ගනිමින්, අපගේ ගනුදෙනුකරුවන්ට වටිනාකමක් ලබා දීමට අපි පෙරමුණ ගනිමු.', 'Building our position as the reference ok2list.com is the leading online classified in srilanka and in the region.', 'පුද්ගල පද්ධති සහ තාක්‍ෂණය සඳහා ඇති කැපවීම තුළින්, ok2list.com ශ්‍රී ලංකාවේ සහ කලාපයේ ප්‍රමුඛ පෙළේ මාර්ගගත වර්ගීකරණයක් ලෙස අපගේ තත්ත්වය ගොඩනඟා ගනිමින්, අපගේ ගනුදෙනුකරුවන්ට වටිනාකමක් ලබා දීමට අපි පෙරමුණ ගනිමු.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_how_sell_fast`
--

CREATE TABLE `page_how_sell_fast` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_how_sell_fast`
--

INSERT INTO `page_how_sell_fast` (`id`, `description`, `description_sl`) VALUES
(1, '<h3>1. Asszign the market price as applicable</h3>\r\n\r\n<p>Price is one of very important factor to decide the transaction.</p>\r\n\r\n<ul>\r\n	<li>Ok2list.com advise user to browse similar ads and assign an appropriate and competitive price.</li>\r\n	<li>Keep in mind that the buyer will decide the transection based on the price and how much willing to pay. The basic is lower the price, the higher the demand.</li>\r\n</ul>', '<h3>1.sl&nbsp; Asszign the market price as applicable</h3>\r\n\r\n<p>Price is one of very important factor to decide the transaction.</p>\r\n\r\n<ul>\r\n	<li>Ok2list.com advise user to browse similar ads and assign an appropriate and competitive price.</li>\r\n	<li>Keep in mind that the buyer will decide the transection based on the price and how much willing to pay. The basic is lower the price, the higher the demand.</li>\r\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `page_membership`
--

CREATE TABLE `page_membership` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_membership`
--

INSERT INTO `page_membership` (`id`, `description`, `description_sl`) VALUES
(1, '<h3>We have three types of Promotions</h3>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>What is Lorem Ipsum?</h3>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '<p>අපට උසස්වීම් වර්ග තුනක් තිබේ<br />\r\nLorem Ipsum යනු මුද්&zwj;රණ සහ අකුරු සැකසුම් කර්මාන්තයේ ව්&zwj;යාජ පෙළකි. 1500 ගණන්වල සිට ලොරම් ඉප්සම් කර්මාන්තයේ සම්මත ව්&zwj;යාජ පාඨය වී ඇත, නොදන්නා මුද්&zwj;රණ යන්ත්&zwj;රයක් වර්ගයක ගැලියක් ගෙන එය ටයිප් නියැදි පොතක් සෑදීමට තැබූ විටය. එය ශතවර්ෂ පහක් පමණක් නොව, ඉලෙක්ට්&zwj;රොනික අකුරු සැකසීමේ පිම්ම ද නොනැසී පවතී, අත්&zwj;යවශ්&zwj;යයෙන්ම නොවෙනස්ව පවතී. එය 1960 ගණන් වලදී ලෝරම් ඉප්සම් ඡේද අඩංගු ලෙට්&zwj;රාසෙට් පත්&zwj;ර නිකුත් කිරීමත් සමඟ ප්&zwj;රචලිත වූ අතර වඩාත් මෑතකදී ලෝරම් ඉප්සම් හි අනුවාද ඇතුළුව ඇල්ඩස් පේජ්මේකර් වැනි ඩෙස්ක්ටොප් ප්&zwj;රකාශන මෘදුකාංග සමඟ.</p>\r\n\r\n<p>Lorem Ipsum යනු කුමක්ද?<br />\r\nජනප්&zwj;රිය විශ්වාසයට පටහැනිව, Lorem Ipsum යනු හුදෙක් අහඹු පාඨයක් නොවේ. එය ක්&zwj;රිස්තු පූර්ව 45 සිට සම්භාව්&zwj;ය ලතින් සාහිත්&zwj;ය කොටසක මුල් ඇති අතර එය වසර 2000කට වඩා පැරණි වේ. Virginia හි Hampden-Sydney College හි ලතින් මහාචාර්යවරයෙකු වන Richard McClintock, Lorem Ipsum ඡේදයකින් වඩාත් අපැහැදිලි ලතින් වචන වලින් එකක් වන consectetur සොයා බැලූ අතර සම්භාව්&zwj;ය සාහිත්&zwj;යයේ ඇති වචනයේ උපුටා දැක්වීම් හරහා ගොස් සැක කළ නොහැකි මූලාශ්&zwj;රය සොයා ගත්තේය. Lorem Ipsum පැමිණෙන්නේ Cicero විසින් 45 BC හි ලියන ලද &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) හි 1.10.32 සහ 1.10.33 යන කොටස් වලින්. මෙම පොත පුනරුද සමයේ ඉතා ජනප්&zwj;රිය වූ ආචාර ධර්ම පිළිබඳ න්&zwj;යාය පිළිබඳ නිබන්ධනයකි. Lorem Ipsum හි පළමු පේළිය, &quot;Lorem ipsum dolor sit amet..&quot;, 1.10.32 කොටසේ පේළියකින් පැමිණේ.</p>\r\n\r\n<p>1500 ගණන්වල සිට භාවිතා කරන ලද Lorem Ipsum හි සම්මත කොටස උනන්දුවක් දක්වන අය සඳහා පහත ප්&zwj;රතිනිෂ්පාදනය කෙරේ. Cicero විසින් &quot;de Finibus Bonorum et Malorum&quot; හි 1.10.32 සහ 1.10.33 වගන්ති ද ඒවායේ නියම මුල් ස්වරූපයෙන් ප්&zwj;රතිනිෂ්පාදනය කර ඇත, H. Rackham විසින් 1914 පරිවර්තනයෙන් ඉංග්&zwj;රීසි අනුවාද සමඟින්.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `page_privacy_policy`
--

CREATE TABLE `page_privacy_policy` (
  `id` int(11) NOT NULL,
  `details_en` longtext DEFAULT NULL,
  `details_sl` longtext DEFAULT NULL,
  `rules_en` longtext DEFAULT NULL,
  `rules_sl` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_privacy_policy`
--

INSERT INTO `page_privacy_policy` (`id`, `details_en`, `details_sl`, `rules_en`, `rules_sl`, `created_at`, `updated_at`) VALUES
(1, '<p>Ok2list.com Privacy Policy Statement</p>\r\n\r\n<p>These Privacy Policy Statement were written and updated on January 2019. The Company (&ldquo;The QS Week (Pvt) Ltd&rdquo;) reserve the right to change any or all of contents in order to make sure a safe and useful usage of the Website (&ldquo;ok2list.com&rdquo;). We respect the privacy of User and Advertiser and committed to protecting User and Advertiser personal data. This privacy statement will describe how the Company or Website manage User/Advertiser personal data. Please read this privacy policy statement carefully before using our Web Site.</p>\r\n\r\n<p>Definitions:</p>\r\n\r\n<p>In this Privacy Policy Statement used words that starts with caps lock (as explained in Terms and Conditions under the title of &ldquo;Definitions&rdquo;) shall be the same meaning /expression are respectively assigned to them.</p>\r\n\r\n<p>Who are we:</p>\r\n\r\n<p>The QS Week (PVT) LTD is the main body controlling the any date in relation to the Web Site.</p>\r\n\r\n<p>What data do we collect about you?</p>\r\n\r\n<p>Data provided through direct interactions</p>\r\n\r\n<p>Registration and other account information: When the User register to use our Web Site we may collect the following information about you which included name (first and last as applicable), email address, telephone number, gender, age (depending on the permission granted by User) and location.</p>\r\n\r\n<p>When you interact with our platform or use our Web Site, we automatically collect the following information about you:</p>\r\n\r\n<ul>\r\n	<li>Device Information: specific information such as operating system version and unique identifiers</li>\r\n	<li>Location information: depending on your device permissions, if you post an item on our platform, we automatically collect and process information about your actual location.</li>\r\n	<li>User Log data: Technical details, including the Internet Protocol (IP) address of your device, time zone and operating system. We will also store your login information (registration date, date of last password change, date of last successful login), type and version of your browser.</li>\r\n</ul>\r\n\r\n<p>Clickstream data</p>\r\n\r\n<p>We collect information about your activity on our Platform which includes the sites from which you accessed our Platform, date and time stamp of each visit, searches you have performed, listings or advertisement banners you clicked, your interaction with such advertisements or listings, duration of your visit and the order in which you visit the content on our Platform.</p>\r\n\r\n<p>Cookies and Similar Technologies</p>\r\n\r\n<p>We use cookies to manage our users&rsquo; sessions, to store your preferences language selection and deliver you relevant advertisements. &ldquo;Cookies&rdquo; are small text files transferred by a web server to the hard drive of your device. Cookies may be used to collect the date and time of your visit, your browsing history, your preferences, and your username. You can set your browser to refuse all or some cookies, or to alert you when websites set or access cookies. If you disable or refuse cookies, please note that some parts of our Services/Platform may become inaccessible or not function properly. For more information on the cookies we use, please see our Policy on Cookies and Similar Technologies, the terms of which are incorporated into, and form part of, this Privacy Policy by reference.</p>', '<p>රහස්යතා ප්රතිපත්තිය<br />\r\nOk2list.com රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශය</p>\r\n\r\n<p>මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශය ලියා යාවත්කාලීන කරන ලද්දේ 2019 ජනවාරි මාසයේදීය. (&ldquo;The QS Week (Pvt) Ltd&rdquo;) වෙබ් අඩවියේ ආරක්ෂිත සහ ප්&zwj;රයෝජනවත් භාවිතයක් සහතික කර ගැනීම සඳහා ඕනෑම හෝ සියලුම අන්තර්ගතයන් වෙනස් කිරීමේ අයිතිය රඳවා තබා ගනී. ok2list.com&rdquo;). අපි පරිශීලකයාගේ සහ ප්&zwj;රචාරකයාගේ පෞද්ගලිකත්වයට ගරු කරන අතර පරිශීලක සහ දැන්වීම්කරුගේ පුද්ගලික දත්ත ආරක්ෂා කිරීමට කැපවී සිටිමු. මෙම රහස්&zwj;යතා ප්&zwj;රකාශය සමාගම හෝ වෙබ් අඩවිය පරිශීලක/දැන්වීම්කරුගේ පුද්ගලික දත්ත කළමනාකරණය කරන ආකාරය විස්තර කරයි. අපගේ වෙබ් අඩවිය භාවිතා කිරීමට පෙර කරුණාකර මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශය හොඳින් කියවන්න.</p>\r\n\r\n<p>අර්ථ දැක්වීම්:</p>\r\n\r\n<p>මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශයේ භාවිත කර ඇති කැප්ස් ලොක් සමඟින් ආරම්භ වන වචන (&quot;නිර්වචන&quot; යන මාතෘකාව යටතේ නියමයන් සහ කොන්දේසි වල පැහැදිලි කර ඇති පරිදි) ඒවාට පිළිවෙලින් එකම අර්ථය / ප්&zwj;රකාශනය පවරනු ලැබේ.</p>\r\n\r\n<p>අපි කවුද:</p>\r\n\r\n<p>QS Week (PVT) LTD යනු වෙබ් අඩවියට අදාළව ඕනෑම දිනයක් පාලනය කරන ප්&zwj;රධාන ආයතනයයි.</p>\r\n\r\n<p>අපි ඔබ ගැන රැස් කරන දත්ත මොනවාද?</p>\r\n\r\n<p>සෘජු අන්තර්ක්&zwj;රියා හරහා දත්ත සපයනු ලැබේ</p>\r\n\r\n<p>ලියාපදිංචිය සහ අනෙකුත් ගිණුම් තොරතුරු: අපගේ වෙබ් අඩවිය භාවිතා කිරීමට පරිශීලක ලියාපදිංචි වූ විට, නම (අදාළ වන පරිදි පළමු සහ අවසාන), විද්&zwj;යුත් තැපැල් ලිපිනය, දුරකථන අංකය, ස්ත්&zwj;රී පුරුෂ භාවය, වයස (අවසරය මත පදනම්ව) ඇතුළත් පහත තොරතුරු අපි රැස්කර ගත හැක. පරිශීලක) සහ ස්ථානය.</p>\r\n\r\n<p>ඔබ අපගේ වේදිකාව සමඟ අන්තර් ක්&zwj;රියා කරන විට හෝ අපගේ වෙබ් අඩවිය භාවිතා කරන විට, අපි ඔබ ගැන පහත තොරතුරු ස්වයංක්&zwj;රීයව රැස්කර ගනිමු:</p>\r\n\r\n<p>උපාංග තොරතුරු: මෙහෙයුම් පද්ධති අනුවාදය සහ අද්විතීය හඳුනාගැනීම් වැනි නිශ්චිත තොරතුරු<br />\r\nස්ථාන තොරතුරු: ඔබගේ උපාංග අවසර මත පදනම්ව, ඔබ අපගේ වේදිකාවේ අයිතමයක් පළ කරන්නේ නම්, අපි ඔබගේ සත්&zwj;ය ස්ථානය පිළිබඳ තොරතුරු ස්වයංක්&zwj;රීයව රැස් කර සකසමු.<br />\r\nපරිශීලක ලොග් දත්ත: ඔබගේ උපාංගයේ අන්තර්ජාල ප්&zwj;රොටෝකෝලය (IP) ලිපිනය, වේලා කලාපය සහ මෙහෙයුම් පද්ධතිය ඇතුළු තාක්ෂණික විස්තර. අපි ඔබගේ පිවිසුම් තොරතුරු (ලියාපදිංචි දිනය, අවසන් මුරපද වෙනස් කළ දිනය, අවසන් වරට සාර්ථක පුරනය වූ දිනය), ඔබගේ බ්&zwj;රවුසරයේ වර්ගය සහ අනුවාදය ද ගබඩා කරන්නෙමු.<br />\r\nක්ලික් ප්&zwj;රවාහ දත්ත</p>\r\n\r\n<p>ඔබ අපගේ වේදිකාවට ප්&zwj;රවේශ වූ අඩවි, එක් එක් සංචාරයේ දිනය සහ වේලා මුද්&zwj;රාව, ඔබ සිදු කර ඇති සෙවීම්, ඔබ ක්ලික් කළ ලැයිස්තුගත කිරීම් හෝ වෙළඳ දැන්වීම් බැනර්, එවැනි වෙළඳ දැන්වීම් හෝ ලැයිස්තුගත කිරීම් සමඟ ඔබේ අන්තර්ක්&zwj;රියා, කාලසීමාව ඇතුළත් අපගේ වේදිකාවේ ඔබේ ක්&zwj;රියාකාරකම් පිළිබඳ තොරතුරු අපි රැස් කරමු. ඔබගේ සංචාරය සහ ඔබ අපගේ වේදිකාවේ අන්තර්ගතයට පිවිසෙන අනුපිළිවෙල.</p>\r\n\r\n<p>කුකීස් සහ සමාන තාක්ෂණයන්</p>\r\n\r\n<p>අපගේ පරිශීලකයින්ගේ සැසි කළමනාකරණය කිරීමට, ඔබේ මනාප භාෂා තේරීම ගබඩා කිරීමට සහ ඔබට අදාළ වෙළඳ දැන්වීම් ලබා දීමට අපි කුකීස් භාවිතා කරමු. &quot;කුකීස්&quot; යනු ඔබගේ උපාංගයේ දෘඪ තැටියට වෙබ් සේවාදායකයක් විසින් මාරු කරන ලද කුඩා පෙළ ගොනු වේ. ඔබගේ සංචාරයේ දිනය සහ වේලාව, ඔබගේ ගවේෂණ ඉතිහාසය, ඔබගේ මනාපයන් සහ ඔබගේ පරිශීලක නාමය එකතු කිරීමට කුකීස් භාවිතා කළ හැක. ඔබට ඔබගේ බ්&zwj;රවුසරය සියල්ලම හෝ සමහර කුකීස් ප්&zwj;රතික්ෂේප කිරීමට හෝ වෙබ් අඩවි කුකීස් සකසන විට හෝ ප්&zwj;රවේශ වන විට ඔබව දැනුවත් කිරීමට සැකසිය හැක. ඔබ කුකීස් අක්&zwj;රිය කරන්නේ නම් හෝ ප්&zwj;රතික්ෂේප කරන්නේ නම්, අපගේ සේවා/වේදිකාවේ සමහර කොටස් ප්&zwj;රවේශ විය නොහැකි හෝ නිසි ලෙස ක්&zwj;රියා නොකරන බව කරුණාවෙන් සලකන්න. අප භාවිතා කරන කුකීස් පිළිබඳ වැඩි විස්තර සඳහා, කරුණාකර අපගේ කුකීස් සහ ඒ හා සමාන තාක්ෂණයන් පිළිබඳ ප්&zwj;රතිපත්තිය බලන්න, මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්තිය වෙත යොමු කර ඇති සහ එහි කොටසක් ලෙස ඇතුළත් කර ඇත.</p>', 'Posting an ad on ok2list.com is free! However, all ads must follow our rules:\r\n\r\nMake sure you post in the correct category.\r\nDo not post the same ad more than once or repost an ad within 48 hours.\r\nDo not upload pictures with watermarks.\r\nDo not post ads containing multiple items unless it\'s a package deal.\r\nDo not put your email or phone numbers in the title or description.', 'ok2list.com හි දැන්වීමක් පළ කිරීම නොමිලේ! කෙසේ වෙතත්, සියලුම දැන්වීම් අපගේ නීති අනුගමනය කළ යුතුය:\r\n\r\nඔබ නිවැරදි ප්‍රවර්ගයේ පළ කිරීමට වග බලා ගන්න.\r\nඑකම දැන්වීම එක වරකට වඩා පළ නොකරන්න හෝ පැය 48ක් ඇතුළත දැන්වීමක් නැවත පළ නොකරන්න.\r\nජල සලකුණු සහිත පින්තූර උඩුගත නොකරන්න.\r\nපැකේජ ගනුදෙනුවක් නම් මිස අයිතම කිහිපයක් අඩංගු දැන්වීම් පළ නොකරන්න.\r\nමාතෘකාවේ හෝ විස්තරයේ ඔබේ විද්‍යුත් තැපෑල හෝ දුරකථන අංක දමන්න එපා.', '2022-08-15 18:38:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_promote`
--

CREATE TABLE `page_promote` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_promote`
--

INSERT INTO `page_promote` (`id`, `description`, `description_sl`) VALUES
(1, '<p>Promote Your Ad</p>\r\n\r\n<p>Promote your ad and make an attention to buyers and other users and sell fast on ok2list.com is the srilankas&rsquo; largest online classified.</p>\r\n\r\n<ul>\r\n	<li>A largest and popular online classified like ok2list.com has thousands of buyers and sellers, so it is a distinction advantage to reach more customers and sell your product fast.</li>\r\n	<li>The basic service of posting an ad remains free on ok2list.com, we now offer extra paid options for our posters who want to stand out and reach more interested buyers quickly and easily.</li>\r\n</ul>\r\n\r\n<p>Need to sell urgently?</p>\r\n\r\n<p>We made it and our promotions are an excellent way to get your products sold quickly</p>\r\n\r\n<p>To promote an ad simply:</p>\r\n\r\n<ul>\r\n	<li>Ad your post and click the &ldquo;Membership&rdquo; button on top left side of the home page, or</li>\r\n	<li>go to an ad you have already posted and click the &ldquo;Promote Your Ad&rdquo; option.</li>\r\n</ul>\r\n\r\n<p>Get more views</p>\r\n\r\n<p>Our promotions are designed to get more people to see your ad. So by promoting your ad, you save time and effort &ndash; and still get more replies to your ad.</p>\r\n\r\n<p>Sell fast for a good price</p>\r\n\r\n<p>More replies means more interested buyers. With lots of interested buyers, you have a better chance of selling for the price that you want.</p>\r\n\r\n<p>Our Ad Promotions</p>\r\n\r\n<p>Featured Ad</p>\r\n\r\n<p>At the top of every ad listing page, there are up to 4 (four) slots reserved for Featured Ads. By adding a Featured Ad promotion to your ad, you are getting the chance for your ad to be displayed in one of these Featured Ad slots &ndash; which can get you more views.</p>\r\n\r\n<p>Featured Ads stand out and highlighted in red, and clearly marked as a &ldquo;Featured Ad&rdquo;.</p>\r\n\r\n<p>Each Feature Ad is given an equal chance of being shown in the Featured Ad slots. This feature makes extra appearances for each Featured Ad on our most viewed pages. Also, this ad appears in regular post and stand in top of the page.</p>\r\n\r\n<p>Daily Refresh to top</p>\r\n\r\n<p>The daily refresh up promotion moves your ad to the top of the regular ad listings once a day for up to 21 days. It has the same effect as reposting your ad every day and attracts for more views. Ads with daily refresh to top are given a fresh start once a day, to get your ad more views with no extra effort.</p>\r\n\r\n<p>Expand your business with Membership</p>\r\n\r\n<p>Memberships include bonus Top Ad and Bump Up promotions, and are loaded with extra features to give your business a bigger presence on ok2list.com.</p>', '<p>ඔබේ දැන්වීම ප්&zwj;රවර්ධනය කරන්න<br />\r\nඔබේ දැන්වීම ප්&zwj;රවර්ධනය කරන්න</p>\r\n\r\n<p>ඔබගේ දැන්වීම ප්&zwj;රවර්ධනය කර ගැනුම්කරුවන් සහ අනෙකුත් පරිශීලකයින් වෙත අවධානය යොමු කර ok2list.com හි වේගයෙන් විකිණීම ශ්&zwj;රී ලංකාවේ විශාලතම අන්තර්ජාල වර්ගීකරණය වේ.</p>\r\n\r\n<p>ok2list.com වැනි විශාලතම සහ ජනප්&zwj;රිය සබැඳි වර්ගීකරණයකට ගැනුම්කරුවන් සහ විකුණුම්කරුවන් දහස් ගණනක් ඇත, එබැවින් වැඩි ගනුදෙනුකරුවන් වෙත ළඟා වීමට සහ ඔබේ නිෂ්පාදනය වේගයෙන් විකිණීමට එය සුවිශේෂී වාසියකි.<br />\r\nදැන්වීමක් පළ කිරීමේ මූලික සේවාව ok2list.com හි නොමිලයේ පවතී, අපි දැන් කැපී පෙනෙන සහ වඩාත් උනන්දුවක් දක්වන ගැනුම්කරුවන් වෙත ඉක්මනින් සහ පහසුවෙන් ළඟා වීමට කැමති අපගේ පෝස්ටර් සඳහා අමතර ගෙවන විකල්ප ලබා දෙන්නෙමු.<br />\r\nඉක්මනින් විකිණීමට අවශ්&zwj;යද?</p>\r\n\r\n<p>අපි එය සෑදූ අතර අපගේ ප්&zwj;රවර්ධන ඔබේ නිෂ්පාදන ඉක්මනින් අලෙවි කර ගැනීමට විශිෂ්ට ක්&zwj;රමයකි</p>\r\n\r\n<p>දැන්වීමක් ප්&zwj;රවර්ධනය කිරීම සඳහා සරලව:</p>\r\n\r\n<p>ඔබේ පළ කිරීම දැන්වීම සහ මුල් පිටුවේ ඉහළ වම් පැත්තේ ඇති &quot;සාමාජිකත්වය&quot; බොත්තම ක්ලික් කරන්න, හෝ<br />\r\nඔබ දැනටමත් පළ කර ඇති දැන්වීමක් වෙත ගොස් &quot;ඔබේ දැන්වීම ප්&zwj;රවර්ධනය කරන්න&quot; විකල්පය ක්ලික් කරන්න.<br />\r\nතවත් බැලීම් ලබා ගන්න</p>\r\n\r\n<p>අපගේ ප්&zwj;රවර්ධන සැලසුම් කර ඇත්තේ ඔබේ දැන්වීම වැඩි පිරිසකට නැරඹීම සඳහා ය. එබැවින් ඔබේ දැන්වීම ප්&zwj;රවර්ධනය කිරීමෙන්, ඔබ කාලය සහ ශ්&zwj;රමය ඉතිරි කරයි - සහ ඔබේ දැන්වීමට තව පිළිතුරු ලබා ගනී.</p>\r\n\r\n<p>හොඳ මිලකට ඉක්මනින් විකුණන්න</p>\r\n\r\n<p>වැඩි පිළිතුරු යනු වැඩි උනන්දුවක් දක්වන ගැනුම්කරුවන් ය. බොහෝ උනන්දුවක් දක්වන ගැනුම්කරුවන් සමඟ, ඔබට අවශ්&zwj;ය මිලට විකිණීමට ඔබට වඩා හොඳ අවස්ථාවක් තිබේ.</p>\r\n\r\n<p>අපගේ දැන්වීම් ප්&zwj;රවර්ධන</p>\r\n\r\n<p>විශේෂාංගගත දැන්වීම</p>\r\n\r\n<p>සෑම දැන්වීම් ලැයිස්තුගත කිරීමේ පිටුවකම ඉහළින්ම, විශේෂාංගගත දැන්වීම් සඳහා වෙන් කර ඇති තව් 4 (හතර) දක්වා ඇත. ඔබේ දැන්වීමට විශේෂාංගගත දැන්වීම් ප්&zwj;රවර්ධනයක් එක් කිරීමෙන්, ඔබට තවත් බැලීම් ලබා ගත හැකි මෙම විශේෂාංගගත දැන්වීම් තව් එකක ඔබේ දැන්වීම ප්&zwj;රදර්ශනය කිරීමට ඔබට අවස්ථාව ලැබේ.</p>\r\n\r\n<p>විශේෂාංගගත දැන්වීම් කැපී පෙනෙන අතර රතු පැහැයෙන් උද්දීපනය කර ඇති අතර පැහැදිලිවම &ldquo;විශේෂාංග දැන්වීමක්&rdquo; ලෙස සලකුණු කර ඇත.</p>\r\n\r\n<p>සෑම විශේෂාංග දැන්වීමක්ම විශේෂාංගගත දැන්වීම් තව් තුළ පෙන්වීමට සමාන අවස්ථාවක් ලබා දී ඇත. මෙම විශේෂාංගය අපගේ වැඩිපුරම නරඹන පිටුවල එක් එක් විශේෂාංගගත දැන්වීම සඳහා අමතර පෙනී සිටීම් සිදු කරයි. එසේම, මෙම දැන්වීම සාමාන්&zwj;ය පෝස්ට් වල දිස්වන අතර පිටුවේ ඉහළින්ම සිටින්න.</p>\r\n\r\n<p>ඉහළට දිනපතා නැවුම් කරන්න</p>\r\n\r\n<p>දෛනික ප්&zwj;රබෝධමත් ප්&zwj;රවර්ධනය මඟින් ඔබේ දැන්වීම දින 21ක් දක්වා දිනකට වරක් සාමාන්&zwj;ය දැන්වීම් ලැයිස්තුගත කිරීම්වල ඉහළට ගෙන යයි. එය සෑම දිනකම ඔබේ දැන්වීම නැවත පළ කිරීම හා සමාන බලපෑමක් ඇති අතර වැඩි බැලීම් සඳහා ආකර්ෂණය කරයි. අමතර උත්සාහයකින් තොරව ඔබේ දැන්වීම වැඩි බැලීම් ලබා ගැනීමට, දිනපතා නැවුම් කිරීම සහිත දැන්වීම් දිනකට වරක් නැවුම් ආරම්භයක් ලබා දෙනු ලැබේ.</p>\r\n\r\n<p>සාමාජිකත්වය සමඟ ඔබේ ව්&zwj;යාපාරය පුළුල් කරන්න</p>\r\n\r\n<p>සාමාජිකත්වයන්ට ප්&zwj;රසාද Top Ad සහ Bump Up ප්&zwj;රවර්ධන ඇතුළත් වන අතර, ok2list.com හි ඔබේ ව්&zwj;යාපාරයට විශාල පැවැත්මක් ලබා දීම සඳහා අමතර විශේෂාංගවලින් පිරී ඇත.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `page_promotions`
--

CREATE TABLE `page_promotions` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_promotions`
--

INSERT INTO `page_promotions` (`id`, `description`, `description_sl`) VALUES
(1, '<h3>We have three types of Promotions</h3>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>What is Lorem Ipsum?</h3>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '<p>අපට උසස්වීම් වර්ග තුනක් තිබේ<br />\r\nLorem Ipsum යනු මුද්&zwj;රණ සහ අකුරු සැකසුම් කර්මාන්තයේ ව්&zwj;යාජ පෙළකි. 1500 ගණන්වල සිට ලොරම් ඉප්සම් කර්මාන්තයේ සම්මත ව්&zwj;යාජ පාඨය වී ඇත, නොදන්නා මුද්&zwj;රණ යන්ත්&zwj;රයක් වර්ගයක ගැලියක් ගෙන එය ටයිප් නියැදි පොතක් සෑදීමට තැබූ විටය. එය ශතවර්ෂ පහක් පමණක් නොව, ඉලෙක්ට්&zwj;රොනික අකුරු සැකසීමේ පිම්ම ද නොනැසී පවතී, අත්&zwj;යවශ්&zwj;යයෙන්ම නොවෙනස්ව පවතී. එය 1960 ගණන් වලදී ලෝරම් ඉප්සම් ඡේද අඩංගු ලෙට්&zwj;රාසෙට් පත්&zwj;ර නිකුත් කිරීමත් සමඟ ප්&zwj;රචලිත වූ අතර වඩාත් මෑතකදී ලෝරම් ඉප්සම් හි අනුවාද ඇතුළුව ඇල්ඩස් පේජ්මේකර් වැනි ඩෙස්ක්ටොප් ප්&zwj;රකාශන මෘදුකාංග සමඟ.</p>\r\n\r\n<p>Lorem Ipsum යනු කුමක්ද?<br />\r\nජනප්&zwj;රිය විශ්වාසයට පටහැනිව, Lorem Ipsum යනු හුදෙක් අහඹු පාඨයක් නොවේ. එය ක්&zwj;රිස්තු පූර්ව 45 සිට සම්භාව්&zwj;ය ලතින් සාහිත්&zwj;ය කොටසක මුල් ඇති අතර එය වසර 2000කට වඩා පැරණි වේ. Virginia හි Hampden-Sydney College හි ලතින් මහාචාර්යවරයෙකු වන Richard McClintock, Lorem Ipsum ඡේදයකින් වඩාත් අපැහැදිලි ලතින් වචන වලින් එකක් වන consectetur සොයා බැලූ අතර සම්භාව්&zwj;ය සාහිත්&zwj;යයේ ඇති වචනයේ උපුටා දැක්වීම් හරහා ගොස් සැක කළ නොහැකි මූලාශ්&zwj;රය සොයා ගත්තේය. Lorem Ipsum පැමිණෙන්නේ Cicero විසින් 45 BC හි ලියන ලද &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) හි 1.10.32 සහ 1.10.33 යන කොටස් වලින්. මෙම පොත පුනරුද සමයේ ඉතා ජනප්&zwj;රිය වූ ආචාර ධර්ම පිළිබඳ න්&zwj;යාය පිළිබඳ නිබන්ධනයකි. Lorem Ipsum හි පළමු පේළිය, &quot;Lorem ipsum dolor sit amet..&quot;, 1.10.32 කොටසේ පේළියකින් පැමිණේ.</p>\r\n\r\n<p>1500 ගණන්වල සිට භාවිතා කරන ලද Lorem Ipsum හි සම්මත කොටස උනන්දුවක් දක්වන අය සඳහා පහත ප්&zwj;රතිනිෂ්පාදනය කෙරේ. Cicero විසින් &quot;de Finibus Bonorum et Malorum&quot; හි 1.10.32 සහ 1.10.33 වගන්ති ද ඒවායේ නියම මුල් ස්වරූපයෙන් ප්&zwj;රතිනිෂ්පාදනය කර ඇත, H. Rackham විසින් 1914 පරිවර්තනයෙන් ඉංග්&zwj;රීසි අනුවාද සමඟින්.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `page_sidebar`
--

CREATE TABLE `page_sidebar` (
  `id` int(11) NOT NULL,
  `secure_trading_en` text DEFAULT NULL,
  `secure_trading_sl` text DEFAULT NULL,
  `support_en` text DEFAULT NULL,
  `support_sl` text DEFAULT NULL,
  `easy_trading_en` text DEFAULT NULL,
  `easy_trading_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_sidebar`
--

INSERT INTO `page_sidebar` (`id`, `secure_trading_en`, `secure_trading_sl`, `support_en`, `support_sl`, `easy_trading_en`, `easy_trading_sl`) VALUES
(1, 'ok2list.com is determined to maintain privacy of users during the time of trading and even users can make a report if someone try to fraud.', 'ok2list.com is determined to maintain privacy of users during the time of trading and even users can make a report if someone try to fraud.', 'ok2list.com provides service 24 hours a day and 7 days a week for reducing wait times and increasing loyalty of users', 'ok2list.com provides service 24 hours a day and 7 days a week for reducing wait times and increasing loyalty of users', 'ok2list.com is online marketplace where users can easily sell or purchase almost everything.', 'ok2list.com is online marketplace where users can easily sell or purchase almost everything.');

-- --------------------------------------------------------

--
-- Table structure for table `page_sidebar_info`
--

CREATE TABLE `page_sidebar_info` (
  `id` int(11) NOT NULL,
  `secure_trading_en` text DEFAULT NULL,
  `secure_trading_sl` text DEFAULT NULL,
  `support_en` text DEFAULT NULL,
  `support_sl` text DEFAULT NULL,
  `easy_trading_en` text DEFAULT NULL,
  `easy_trading_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_sidebar_info`
--

INSERT INTO `page_sidebar_info` (`id`, `secure_trading_en`, `secure_trading_sl`, `support_en`, `support_sl`, `easy_trading_en`, `easy_trading_sl`) VALUES
(1, 'ok2list.com is determined to maintain privacy of users during the time of trading and even users can make a report if someone try to fraud.', 'ok2list.com is determined to maintain privacy of users during the time of trading and even users can make a report if someone try to fraud.', 'ok2list.com provides service 24 hours a day and 7 days a week for reducing wait times and increasing loyalty of users', 'ok2list.com provides service 24 hours a day and 7 days a week for reducing wait times and increasing loyalty of users', 'ok2list.com is online marketplace where users can easily sell or purchase almost everything.', 'ok2list.com is online marketplace where users can easily sell or purchase almost everything.');

-- --------------------------------------------------------

--
-- Table structure for table `page_terms_conditions`
--

CREATE TABLE `page_terms_conditions` (
  `id` int(11) NOT NULL,
  `details_en` longtext DEFAULT NULL,
  `details_sl` longtext DEFAULT NULL,
  `rules_en` longtext DEFAULT NULL,
  `rules_sl` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page_terms_conditions`
--

INSERT INTO `page_terms_conditions` (`id`, `details_en`, `details_sl`, `rules_en`, `rules_sl`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Introduction</strong></p>\r\n\r\n<p>The QS Week (Pvt.) Ltd is a limited liability company, it&rsquo;s registration number is PV89070 (hereafter the &ldquo;Company&rdquo;) and provides an online classified service which include classified advertisements and chat services through the website www.ok2list.com (hereafter referred &ldquo;Website&rdquo;).</p>\r\n\r\n<p>The services provided through the Website are subject to User and Advertiser compliance with the set-up Terms and Conditions (hereafter &ldquo;Terms&rdquo;) set forth below.</p>\r\n\r\n<p>How to use the Terms</p>\r\n\r\n<ul>\r\n	<li>Step 1: It is User&rsquo;s responsibility to read and understand the Terms prior to use this Website.</li>\r\n	<li>Step 2: By using this Website, the User agrees and bound to the Terms of this Website.</li>\r\n	<li>Step 3: If the User do not agree the Terms, such User do not use this Website.</li>\r\n</ul>\r\n\r\n<p>Terms &amp; Conditions (&ldquo;Terms&rdquo;)</p>\r\n\r\n<p>These Terms were written and updated on January 2019. The Company reserve the right to change any or all of our Terms of use or other conditions for using the Website at any time by publishing the new Terms on our Website.</p>\r\n\r\n<p>Definitions:</p>\r\n\r\n<p>In this Terms included following words and expressions shall have the meanings as are respectively assigned to them;</p>\r\n\r\n<p>&ldquo;Advertiser&rdquo; means the person or persons who uploading Contents on the Website.</p>\r\n\r\n<p>&ldquo;Company&rdquo; means the QS Week (Pvt) Ltd</p>\r\n\r\n<p>&ldquo;Contents&rdquo; means all postings, messages, text, files, images, photos, video, sounds, or other materials uploaded (by Advertiser) for inclusion on Website with fully compliance to all applicable laws of the country. The Company and Website assumes no responsibility for any illegality or any inaccuracy of the Content.</p>\r\n\r\n<p>&ldquo;User&rdquo; means the person or persons who uses, browsing or access any content, data or information on the Website.</p>\r\n\r\n<p>&ldquo;Website&rdquo; means the www.ok2list.com</p>\r\n\r\n<p>&ldquo;Watermark&rdquo; means the mark appears in the images (www.ok2list.com), which prevents the images to be used for the other purposes, without consent of the Advertiser.</p>\r\n\r\n<p>Content</p>\r\n\r\n<p>Advertiser agree that all postings, messages, text, files, images, photos, video, sounds, or other materials (&ldquo;Content&rdquo;) posted on, transmitted through, or linked from the Webs Site, are the sole responsibility of the Advertiser from whom such Content originated. More specifically, Advertiser is entirely responsible for all Content that he or she posts, email or otherwise make available via the Website. Advertiser agree that Company does not control and is not responsible for Content made available through the Website, and that by using the Website, Advertiser may be exposed to Content that is offensive, indecent, inaccurate, misleading, or otherwise objectionable. Advertiser agree that he or she must evaluate, and bear all risks associated with, the use of any Content, that he or she may not rely on said Content, and that under no circumstances will Website not pre-screen or approve Content, but that Website shall have the right (but not the obligation) in its sole discretion to refuse, delete or move any Content that is available via the Website, for violating the letter or spirit of the Terms or for any other reason.</p>\r\n\r\n<p>Advertiser acknowledge and agree that Website may, in its sole discretion, preserve or disclose Content, as well as email addresses, IP addresses, timestamps, and other user information, if required to do so by law or in the good faith belief that such preservation or disclosure is reasonably necessary to: comply with legal process; enforce the Terms; respond to claims that any Content violates the rights of third-parties; or protect the rights, property, or personal safety of Website, its Users or the general public.</p>\r\n\r\n<p>Content displayed on or through the Website is protected by copyright as a collective work and/or compilation, pursuant to copyrights laws, and international conventions. Advertiser and the User agree not to reproduce, duplicate or copy Content from the Website, and agree to abide by any and all copyright notices displayed on the Website.</p>\r\n\r\n<p>User, Advertiser Conduct</p>\r\n\r\n<p>Advertiser and User agree not to post otherwise make available Content:</p>\r\n\r\n<ul>\r\n	<li>that is pornographic, adult, mature or sexual orientation;</li>\r\n	<li>that refers to gambling or is casino-related;</li>\r\n	<li>that includes illicit drugs, drug paraphernalia or sales of prescription drugs</li>\r\n	<li>that includes hacking/cracking information.</li>\r\n	<li>Violent content;</li>\r\n	<li>Content regarding programs which compensate users for clicking ads or offers, performing searches, surfing websites or reading emails;</li>\r\n	<li>Any other content that is illegal, promotes illegal activity or infringes on the legal rights of others;</li>\r\n	<li>Sales of products that are replicas or imitations of designer or other goods;</li>\r\n	<li>Sales of weapons or ammunition (e.g. firearms, firearm components, fighting knives, stun guns);</li>\r\n	<li>that is unlawful, harmful, threatening, abusive, harassing, defamatory, pornographic,</li>\r\n	<li>libelous, invasive of another&rsquo;s privacy, or harms minors in any way;</li>\r\n	<li>that harasses, degrades, intimidates or is hateful toward an individual or individuals on the basis of religion, gender, race, ethnicity, age, or disability;</li>\r\n	<li>that impersonates any person or entity, including, but not limited to, a Website employee, or falsely states or otherwise misrepresents your affiliation with a person or entity;</li>\r\n	<li>that includes personal or identifying information about another person without that person&rsquo;s explicit consent.</li>\r\n	<li>that employs misleading email addresses, or forged headers or otherwise manipulated identifiers in order to disguise the origin of Content transmitted through the Website;</li>\r\n	<li>that infringes any patent, trademark, trade secret, copyright or other proprietary rights of any party, or Content that you do not have a right to make available under any law or under contractual or fiduciary relationships.</li>\r\n	<li>that constitutes or contains unauthorized advertising, promotional materials, &ldquo;junk mail,&rdquo; &ldquo;spam,&rdquo; &ldquo;chain letters, &ldquo;pyramid schemes,&rdquo; or any other form of solicitation.</li>\r\n	<li>that advertises for sale weapons or explosives; controlled substances (including but not limited to) tobacco products, alcoholic beverages, pharmaceuticals, illegal drugs; stolen or counterfeit items; goods or services that do not in fact exist; items that violate or infringe the rights of others; any items you do not have the right to sell; any dangerous items.</li>\r\n	<li>that contains software viruses or any other computer code, files or programs designed to interrupt, destroy or limit the functionality of any computer software or hardware or telecommunications equipment;</li>\r\n	<li>that disrupts the normal flow of dialogue with an excessive number of messages (flooding attack) to the Service, or that otherwise negatively affects other users&rsquo; ability to use the Service;</li>\r\n	<li>intentionally collect personal data about other Users for commercial or unlawful purposes</li>\r\n</ul>\r\n\r\n<p>Appropriateness of images</p>\r\n\r\n<p>Website reserves the right to change the title of the Content, for editorial purposes. Website reserves the right not to publish images that are irrelevant or images that violate Website Terms.</p>\r\n\r\n<p>Information to Authorities:</p>\r\n\r\n<p>Website has the right to cooperate with authorities in the case any Content violates the law. The identity of Advertisers, Users or buyers may be determined, for example by an ISP. IP addresses may also be registered in order to ensure compliance with the Terms.</p>\r\n\r\n<p>Valid email address:</p>\r\n\r\n<p>Advertiser and Users are required to provide a valid email address, before they are grand access to post advertisements. The email address of the User shall not be publicly displayed, and other Users are permitted to send email to the User through Website.</p>\r\n\r\n<p>Website accessibility:</p>\r\n\r\n<p>The Company and Website does not guarantee the availability of Website continuous or secure access. The Website is only available as on available.</p>\r\n\r\n<p>Links to third party websites:</p>\r\n\r\n<p>Website may contain links or references to other websites (&lsquo;Third Party Websites&rsquo;). Website shall not be responsible for the contents in Third Party Websites. Third Party Websites are not investigated or monitored. In the event the user decides to leave Website and access Third Party Sites, the User does so at his/her own risk.</p>\r\n\r\n<p>Paid services:</p>\r\n\r\n<p>Website is set out to use free in some categories and certain facilities that only available for paid basis. The paid services are membership packages, posting of ads and promoting an add that already posted. Users and Advertiser may purchase above paid facilities by making a payment or can make inquiry with Website customer care to get to know the exact requirements.</p>\r\n\r\n<p>Paid service by memberships:</p>\r\n\r\n<p>As part of a membership package, the Website will publish the Advertiser&rsquo;s Contents on behalf of the User. A dedicated team always available support and handle the Advertiser&rsquo;s clarification and queries. The Content provided by the Advertiser, Website has the right to any Content added to the Website by the User and has the right to remove or not publish the Content if it violates any aspect of the Terms.</p>\r\n\r\n<p>The Company or Website reserves the right to modify or change membership packages, including the price and the contents of the membership package. The Company or Website is not obligated to refund money or services if a membership package is cancelled early, for any reason.</p>\r\n\r\n<p>Privacy:</p>\r\n\r\n<p>The Company or Website will collect information from Users and Advertisers. It is a condition of use of the Website that each User and Advertiser consents and authorises The Company or Website to collect and use this information. The Company or Website also reserves the right to disclose it to Company affiliates and any other person for the purposes of administering, supporting and maintaining Website, as well as for improving Website, for example by using the information for research, marketing, product development and planning.</p>\r\n\r\n<p>Cookies:</p>\r\n\r\n<p>This site uses cookies, which means that you must have cookies enabled on your computer in order for all functionality on this Website to work properly. A cookie is a small data file that is written to your hard drive when you visit certain Websites. Cookie files contain certain information, such as a random number user ID that the site assigns to a visitor to track the pages visited. A cookie cannot read data off your hard disk or read cookie files created by other sites. Cookies, by themselves, cannot be used to find out the identity of any user.</p>\r\n\r\n<p>Disclaimer:</p>\r\n\r\n<p>www.ok2list.com and the Company assume no responsibility what so ever for the use of www.ok2list.com and disclaims all responsibility for any injury, claim, liability, or damage of any kind resulting from or arising out of or any way related to (i) any errors on www.ok2list.com or the Content, including but not limited to technical errors and typographical errors, (ii) any third party Websites or content directly or indirectly accessed through links in www.ok2list.com, (iii) the unavailability of www.ok2list.com, (iv) your use of www.ok2list.com or the Content, or (v) your use of any equipment (or software) in connection with www.ok2list.com</p>\r\n\r\n<p>Indemnification:</p>\r\n\r\n<p>Advertisers and Users agree to indemnify www.ok2list.com &amp; the Company as well as its officers, directors, employees, agents, from and against all losses, expenses, damages and costs, including attorney&rsquo;s fees, resulting from any violation of this Terms (including negligent or wrongful conduct).</p>\r\n\r\n<p>Modifications:</p>\r\n\r\n<p>www.ok2list.com &amp; the Company reserves the right to amend the part or full contents of the Terms. Such amendments shall be effective immediately upon posting on www.ok2list.com. User and Advertiser are responsible for the reviewing of such amendment. Advertiser and User continued access or use of www.ok2list.com shall be deemed your acceptance of the amended Terms.</p>\r\n\r\n<p>Governing law:</p>\r\n\r\n<p>Website is operated under the laws and regulations of srilanka. Advertisers and Users agree that it is User and Advertisers responsibility to understand the provisions.</p>', '<p>නියම සහ කොන්දේසි<br />\r\nහැදින්වීම</p>\r\n\r\n<p>QS Week (Pvt.) Ltd යනු සීමිත වගකීම් සහිත සමාගමකි, එහි ලියාපදිංචි අංකය PV89070 (මෙතැන් සිට &quot;සමාගම&quot;) වන අතර www.ok2list.com වෙබ් අඩවිය හරහා ලුහුඬු දැන්වීම් සහ කතාබස් සේවා ඇතුළත් මාර්ගගත ලුහුබැඳීම් සේවාවක් සපයයි (මින් ඉදිරියට යොමු කෙරේ. &quot;වෙබ් අඩවිය&quot;).</p>\r\n\r\n<p>වෙබ් අඩවිය හරහා සපයනු ලබන සේවාවන් පහත දක්වා ඇති සැකසුම් නියමයන් සහ කොන්දේසි (මෙතැන් සිට &quot;කොන්දේසි&quot;) සමඟ පරිශීලක සහ දැන්වීම්කරුගේ අනුකූලතාවයට යටත් වේ.</p>\r\n\r\n<p>නියමයන් භාවිතා කරන්නේ කෙසේද</p>\r\n\r\n<p>පියවර 1: මෙම වෙබ් අඩවිය භාවිතා කිරීමට පෙර කොන්දේසි කියවා අවබෝධ කර ගැනීම පරිශීලකයාගේ වගකීමකි.<br />\r\nපියවර 2: මෙම වෙබ් අඩවිය භාවිතා කිරීමෙන්, පරිශීලකයා මෙම වෙබ් අඩවියේ කොන්දේසි වලට එකඟ වන අතර ඒවාට බැඳී සිටී.<br />\r\nපියවර 3: පරිශීලකයා කොන්දේසි වලට එකඟ නොවන්නේ නම්, එවැනි පරිශීලකයෙකු මෙම වෙබ් අඩවිය භාවිතා නොකරයි.<br />\r\nනියම සහ කොන්දේසි (&quot;නියම&quot;)</p>\r\n\r\n<p>මෙම නියමයන් ලියා යාවත්කාලීන කරන ලද්දේ 2019 ජනවාරි මාසයේදීය. අපගේ වෙබ් අඩවියේ නව නියමයන් ප්&zwj;රකාශයට පත් කිරීමෙන් ඕනෑම වේලාවක වෙබ් අඩවිය භාවිතා කිරීම සඳහා අපගේ ඕනෑම හෝ සියලුම භාවිත නියමයන් හෝ වෙනත් කොන්දේසි වෙනස් කිරීමට සමාගමට අයිතිය ඇත.</p>\r\n\r\n<p>අර්ථ දැක්වීම්:</p>\r\n\r\n<p>මෙම නියමයන් තුළ පහත සඳහන් වචන සහ ප්&zwj;රකාශනවලට පිළිවෙළින් පවරා ඇති අර්ථයන් තිබිය යුතුය;</p>\r\n\r\n<p>&ldquo;දැන්වීම්කරු&rdquo; යන්නෙන් අදහස් වන්නේ වෙබ් අඩවියේ අන්තර්ගතය උඩුගත කරන පුද්ගලයා හෝ පුද්ගලයන්ය.</p>\r\n\r\n<p>&quot;සමාගම&quot; යන්නෙන් අදහස් වන්නේ QS Week (Pvt) Ltd</p>\r\n\r\n<p>&ldquo;අන්තර්ගතය&rdquo; යන්නෙන් අදහස් වන්නේ රටේ සියලුම අදාළ නීතිවලට සම්පූර්ණයෙන්ම අනුකූල වන පරිදි වෙබ් අඩවියට ඇතුළත් කිරීම සඳහා උඩුගත කරන ලද (දැන්වීම්කරු විසින්) සියලුම පළ කිරීම්, පණිවිඩ, පෙළ, ගොනු, පින්තූර, ඡායාරූප, වීඩියෝ, ශබ්ද හෝ වෙනත් ද්&zwj;රව්&zwj;ය ය. සමාගම සහ වෙබ් අඩවිය කිසියම් නීතිවිරෝධී හෝ අන්තර්ගතයේ සාවද්&zwj;ය භාවයක් සඳහා කිසිදු වගකීමක් භාර නොගනී.</p>\r\n\r\n<p>&quot;පරිශීලක&quot; යන්නෙන් අදහස් වන්නේ වෙබ් අඩවියේ ඕනෑම අන්තර්ගතයක්, දත්තයක් හෝ තොරතුරක් භාවිතා කරන, බ්&zwj;රවුස් කරන හෝ ප්&zwj;රවේශ කරන පුද්ගලයා හෝ පුද්ගලයන්ය.</p>\r\n\r\n<p>&quot;වෙබ් අඩවිය&quot; යන්නෙන් අදහස් වන්නේ www.ok2list.com යන්නයි</p>\r\n\r\n<p>&ldquo;Watermark&rdquo; යන්නෙන් අදහස් වන්නේ, වෙළඳ ප්&zwj;රචාරකයාගේ අනුමැතියකින් තොරව රූප වෙනත් අරමුණු සඳහා භාවිත කිරීම වළක්වන (www.ok2list.com) සලකුණ රූපවල දිස් වීමයි.</p>\r\n\r\n<p>අන්තර්ගතය</p>\r\n\r\n<p>සියලුම පළ කිරීම්, පණිවිඩ, පෙළ, ලිපිගොනු, පින්තූර, ඡායාරූප, වීඩියෝ, ශබ්ද, හෝ වෙනත් ද්&zwj;රව්&zwj;ය (&quot;අන්තර්ගතය&quot;) වෙබ් අඩවිය හරහා සම්ප්&zwj;රේෂණය කරන ලද හෝ සබැඳි කර ඇති අතර, ඒවා දැන්වීම්කරුගේ සම්පූර්ණ වගකීම බව දැන්වීම්කරු එකඟ වේ. එවැනි අන්තර්ගතයක් ආරම්භ විය. වඩාත් නිශ්චිතව, ඔහු හෝ ඇය පළ කරන, විද්&zwj;යුත් තැපෑල හෝ වෙනත් ආකාරයකින් වෙබ් අඩවිය හරහා ලබා ගත හැකි සියලුම අන්තර්ගතයන් සඳහා දැන්වීම්කරු සම්පූර්ණයෙන්ම වගකිව යුතුය. වෙබ් අඩවිය හරහා ලබා ගත හැකි අන්තර්ගතයන් සමාගම විසින් පාලනය නොකරන බවත් ඒවාට වගකිව යුතු නොවන බවත්, වෙබ් අඩවිය භාවිතා කිරීමෙන්, අහිතකර, අශෝභන, සාවද්&zwj;ය, නොමඟ යවන හෝ වෙනත් ආකාරයකින් විරුද්ධ විය හැකි අන්තර්ගතයන්ට දැන්වීම්කරු නිරාවරණය විය හැකි බවට දැන්වීම්කරු එකඟ වේ. ප්&zwj;රචාරකයා ඔහු හෝ ඇය යම්කිසි අන්තර්ගතයක භාවිතය ඇගයීමට ලක් කළ යුතු බවටත්, ඒ හා සම්බන්ධ සියලු අවදානම් දරාගත යුතු බවටත් එකඟ වන අතර, ඔහු හෝ ඇය එම අන්තර්ගතය මත විශ්වාසය නොතැබිය යුතු අතර, කිසිම අවස්ථාවක වෙබ් අඩවිය අන්තර්ගතය පූර්ව-තිරීක්ෂණ හෝ අනුමත නොකරන නමුත්, වෙබ් අඩවිය හරහා ලබා ගත හැකි ඕනෑම අන්තර්ගතයක් ප්&zwj;රතික්ෂේප කිරීමට, මකා දැමීමට හෝ ගෙන යාමට, නියමවල ලිපිය හෝ ආත්මය උල්ලංඝනය කිරීම හෝ වෙනත් හේතුවක් නිසා වෙබ් අඩවියට එහි තනි අභිමතය පරිදි අයිතියක් ඇත (නමුත් වගකීමක් නොවේ).</p>\r\n\r\n<p>නීතියෙන් හෝ සද්භාවයෙන් එසේ කිරීමට අවශ්&zwj;ය නම්, වෙබ් අඩවියට එහි තනි අභිමතය පරිදි, අන්තර්ගතය සංරක්ෂණය හෝ හෙළිදරව් කිරීම මෙන්ම විද්&zwj;යුත් තැපැල් ලිපින, IP ලිපින, වේලා මුද්&zwj;රා, සහ වෙනත් පරිශීලක තොරතුරු ද කළ හැකි බව දැන්වීම්කරු පිළිගෙන එකඟ වේ. හෝ හෙළිදරව් කිරීම සාධාරණ ලෙස අවශ්&zwj;ය වේ: නීතිමය ක්&zwj;රියාවලියට අනුකූල වීම; නියමයන් ක්රියාත්මක කිරීම; ඕනෑම අන්තර්ගතයක් තෙවන පාර්ශ්වයන්ගේ අයිතිවාසිකම් උල්ලංඝනය කරන බවට ප්&zwj;රතිචාර දක්වන්න; හෝ වෙබ් අඩවියේ, එහි පරිශීලකයන්ගේ හෝ සාමාන්&zwj;ය ජනතාවගේ අයිතිවාසිකම්, දේපළ හෝ පුද්ගලික ආරක්ෂාව ආරක්ෂා කිරීම.</p>\r\n\r\n<p>ප්&zwj;රකාශන හිමිකම් නීති සහ ජාත්&zwj;යන්තර සම්මුතීන්ට අනුකූලව සාමූහික කාර්යයක් සහ/හෝ සම්පාදනයක් ලෙස ප්&zwj;රකාශන හිමිකම මගින් වෙබ් අඩවිය හරහා හෝ ප්&zwj;රදර්ශනය කෙරෙන අන්තර්ගතය ආරක්ෂා කෙරේ. ප්&zwj;රචාරකයා සහ පරිශීලකයා වෙබ් අඩවියෙන් අන්තර්ගතය ප්&zwj;රතිනිෂ්පාදනය කිරීම, අනුපිටපත් කිරීම හෝ පිටපත් නොකිරීමට එකඟ වන අතර, වෙබ් අඩවියේ ප්&zwj;රදර්ශනය කර ඇති ඕනෑම සහ සියලුම ප්&zwj;රකාශන හිමිකම් දැන්වීම්වලට අවනත වීමට එකඟ වේ.</p>\r\n\r\n<p>පරිශීලක, දැන්වීම්කරු හැසිරීම</p>\r\n\r\n<p>ප්&zwj;රචාරකයා සහ පරිශීලකයා වෙනත් ආකාරයකින් පළ නොකිරීමට එකඟ වන පරිදි අන්තර්ගතය ලබා ගත හැකිය:</p>\r\n\r\n<p>එනම් කාමුක දර්ශන, වැඩිහිටි, පරිණත හෝ ලිංගික දිශානතිය;<br />\r\nසූදුවට යොමු වන හෝ කැසිනෝ ආශ්&zwj;රිත;<br />\r\nනීතිවිරෝධී ඖෂධ, ඖෂධ උපකරණ හෝ බෙහෙත් වට්ටෝරු අලෙවි කිරීම ඇතුළත් වේ<br />\r\nඑයට අනවසරයෙන් ඇතුළුවීමේ/ක්&zwj;රැක් කිරීමේ තොරතුරු ඇතුළත් වේ.<br />\r\nප්&zwj;රචණ්ඩ අන්තර්ගතය;<br />\r\nදැන්වීම් හෝ දීමනා ක්ලික් කිරීම, සෙවීම් සිදු කිරීම, වෙබ් අඩවිවල සැරිසැරීම හෝ ඊමේල් කියවීම සඳහා පරිශීලකයින්ට වන්දි ලබා දෙන වැඩසටහන් සම්බන්ධ අන්තර්ගතය;<br />\r\nනීතිවිරෝධී, නීතිවිරෝධී ක්&zwj;රියාකාරකම් ප්&zwj;රවර්ධනය කරන හෝ අන් අයගේ නීත්&zwj;යානුකූල අයිතිවාසිකම් උල්ලංඝනය කරන වෙනත් ඕනෑම අන්තර්ගතයක්;<br />\r\nනිර්මාණකරුගේ හෝ වෙනත් භාණ්ඩවල අනුරූ හෝ අනුකරණය කරන නිෂ්පාදන විකිණීම;<br />\r\nආයුධ හෝ පතොරම් විකිණීම (උදා: ගිනි අවි, ගිනි අවි සංරචක, සටන් පිහි, ස්ටන් තුවක්කු);<br />\r\nඑය නීති විරෝධී, හානිකර, තර්ජනාත්මක, අපවාදාත්මක, හිරිහැර කරන, අපහාසාත්මක, අසභ්&zwj;ය,<br />\r\nනින්දා සහගත, වෙනත් කෙනෙකුගේ පෞද්ගලිකත්වය ආක්&zwj;රමණය කිරීම හෝ බාල වයස්කරුවන්ට ඕනෑම ආකාරයකින් හානි කිරීම;<br />\r\nආගම, ස්ත්&zwj;රී පුරුෂ භාවය, ජාතිය, වාර්ගිකත්වය, වයස හෝ ආබාධිත පදනම මත පුද්ගලයෙකුට හෝ පුද්ගලයන්ට හිරිහැර කිරීම, පහත් කිරීම, බිය ගැන්වීම හෝ වෛර කිරීම;<br />\r\nබව අපගමනය</p>', 'Posting an ad on ok2list.com is free! However, all ads must follow our rules:\r\n\r\nMake sure you post in the correct category.\r\nDo not post the same ad more than once or repost an ad within 48 hours.\r\nDo not upload pictures with watermarks.\r\nDo not post ads containing multiple items unless it\'s a package deal.\r\nDo not put your email or phone numbers in the title or description.', 'ok2list.com හි දැන්වීමක් පළ කිරීම නොමිලේ! කෙසේ වෙතත්, සියලුම දැන්වීම් අපගේ නීති අනුගමනය කළ යුතුය:\r\n\r\nඔබ නිවැරදි ප්‍රවර්ගයේ පළ කිරීමට වග බලා ගන්න.\r\nඑකම දැන්වීම එක වරකට වඩා පළ නොකරන්න හෝ පැය 48ක් ඇතුළත දැන්වීමක් නැවත පළ නොකරන්න.\r\nජල සලකුණු සහිත පින්තූර උඩුගත නොකරන්න.\r\nපැකේජ ගනුදෙනුවක් නම් මිස අයිතම කිහිපයක් අඩංගු දැන්වීම් පළ නොකරන්න.\r\nමාතෘකාවේ හෝ විස්තරයේ ඔබේ විද්‍යුත් තැපෑල හෝ දුරකථන අංක දමන්න එපා.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `permission_group_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(11, 'view_admin_user', 'View', 9, 1, NULL, '2020-10-07 00:27:01', '2020-10-07 00:27:01'),
(12, 'add_admin_user', 'Add', 9, 1, NULL, '2020-10-07 00:27:23', '2020-10-07 00:27:23'),
(13, 'edit_admin_user', 'Edit', 9, 1, NULL, '2020-10-07 00:27:38', '2020-10-07 00:27:38'),
(14, 'delete_admin_user', 'Delete', 9, 1, NULL, '2020-10-07 00:27:57', '2020-10-07 00:27:57'),
(15, 'execute_admin_user', 'Execute', 9, 1, NULL, '2020-10-07 00:28:13', '2020-10-07 00:28:13'),
(16, 'view_role', 'View', 8, 1, NULL, '2020-10-07 00:30:09', '2020-10-07 00:30:09'),
(17, 'add_role', 'Add', 8, 1, NULL, '2020-10-07 00:30:20', '2020-10-07 00:30:20'),
(18, 'edit_role', 'Edit', 8, 1, NULL, '2020-10-07 00:30:30', '2020-10-07 00:30:30'),
(19, 'delete_role', 'Delete', 8, 1, NULL, '2020-10-07 00:30:43', '2020-10-07 00:30:43'),
(20, 'execute_role', 'Execute', 8, 1, NULL, '2020-10-07 00:30:53', '2020-10-07 00:30:53'),
(21, 'view_menu', 'View', 10, 1, NULL, '2020-10-07 02:46:54', '2020-10-07 03:17:16'),
(22, 'new_menu', 'Add', 10, 1, NULL, '2020-10-07 02:47:09', '2020-10-07 03:17:26'),
(23, 'edit_menu', 'Edit', 10, 1, NULL, '2020-10-07 02:47:30', '2020-10-07 03:17:34'),
(24, 'delete_menu', 'Delete', 10, 1, NULL, '2020-10-07 02:48:04', '2020-10-07 03:17:48'),
(25, 'view_action', 'View', 11, 1, NULL, '2020-10-07 03:18:47', '2020-10-07 03:18:47'),
(26, 'new_action', 'Add', 11, 1, NULL, '2020-10-07 03:19:23', '2020-10-07 03:19:23'),
(27, 'edit_action', 'Edit', 11, 1, NULL, '2020-10-07 03:19:43', '2020-10-07 03:19:43'),
(28, 'delete_action', 'Delete', 11, 1, NULL, '2020-10-07 03:19:52', '2020-10-07 03:19:52'),
(29, 'assign_user_access', 'Can Assign User Access', 12, 1, NULL, '2020-10-09 05:51:48', '2020-10-09 05:51:48'),
(30, 'view_product', 'View', 10, 1, NULL, '2020-10-16 11:48:56', '2020-10-16 11:48:56'),
(31, 'new_prodcut', 'New', 10, 1, NULL, '2020-10-16 11:51:32', '2020-10-16 11:51:32'),
(32, 'view_product', 'View Product', 13, 1, NULL, '2021-07-12 16:02:35', '2021-07-12 16:02:35'),
(33, 'edit_product', 'Edit Product', 13, 1, NULL, '2021-07-12 16:02:52', '2021-07-12 16:02:52'),
(34, 'delete_product', 'Delete Product', 13, 1, NULL, '2021-07-12 16:03:05', '2021-07-12 16:03:05'),
(35, 'view_model', 'View Model', 18, 1, NULL, '2021-07-12 16:03:29', '2021-07-12 16:03:29'),
(36, 'new_model', 'New', 18, 1, NULL, '2021-07-12 16:04:09', '2021-07-12 16:11:47'),
(37, 'edit_model', 'Edit', 18, 1, NULL, '2021-07-12 16:10:15', '2021-07-12 16:12:07'),
(38, 'delete_model', 'Delete', 18, 1, NULL, '2021-07-12 16:12:26', '2021-07-12 16:12:26'),
(39, 'view_brand', 'View', 17, 1, NULL, '2021-07-12 16:12:39', '2021-07-12 16:12:39'),
(40, 'new_brand', 'New', 17, 1, NULL, '2021-07-12 16:12:56', '2021-07-12 16:12:56'),
(41, 'edit_brand', 'Edit', 17, 1, NULL, '2021-07-12 16:13:09', '2021-07-12 16:13:09'),
(42, 'delete_brand', 'Delete', 17, 1, NULL, '2021-07-12 16:13:20', '2021-07-12 16:13:20'),
(43, 'view_package', 'View', 14, 1, NULL, '2021-07-12 16:13:34', '2021-07-12 16:13:34'),
(44, 'new_package', 'New', 14, 1, NULL, '2021-07-12 16:13:46', '2021-07-12 16:13:46'),
(45, 'edit_package', 'Edit', 14, 1, NULL, '2021-07-12 16:14:00', '2021-07-12 16:14:00'),
(46, 'edit_package', 'Edit', 14, 1, NULL, '2021-07-12 16:14:01', '2021-07-12 16:14:01'),
(47, 'view_city', 'View', 19, 1, NULL, '2021-07-12 16:14:25', '2021-07-12 16:14:25'),
(48, 'view_division', 'View', 20, 1, NULL, '2021-07-12 16:14:40', '2021-07-12 16:14:40'),
(49, 'view_area', 'View', 21, 1, NULL, '2021-07-12 16:14:57', '2021-07-12 16:14:57'),
(50, 'new_area', 'New', 21, 1, NULL, '2021-07-12 16:15:09', '2021-07-12 16:15:09'),
(51, 'edit_area', 'Edit', 21, 1, NULL, '2021-07-12 16:15:24', '2021-07-12 16:15:24'),
(52, 'delete_area', 'Delete', 21, 1, NULL, '2021-07-12 16:15:49', '2021-07-12 16:15:49'),
(53, 'view_product_type', 'View', 22, 1, NULL, '2021-07-12 16:16:31', '2021-07-12 16:16:31'),
(54, 'new_product_type', 'New', 22, 1, NULL, '2021-07-12 16:16:44', '2021-07-12 16:16:44'),
(55, 'edit_product_type', 'Edit', 22, 1, NULL, '2021-07-12 16:16:58', '2021-07-12 16:16:58'),
(56, 'delete_product_type', 'Delete', 22, 1, NULL, '2021-07-12 16:17:10', '2021-07-12 16:17:10'),
(57, 'view_customer', 'View', 25, 1, NULL, '2021-07-12 16:18:52', '2021-07-12 16:18:52'),
(58, 'edit_customer', 'Edit', 25, 1, NULL, '2021-07-12 16:19:09', '2021-07-12 16:19:09'),
(59, 'view_category', 'View', 16, 1, NULL, '2021-07-12 16:20:03', '2021-07-12 16:20:03'),
(60, 'new_category', 'New', 16, 1, NULL, '2021-07-12 16:20:32', '2021-07-12 16:20:32'),
(61, 'edit_category', 'Edit', 16, 1, NULL, '2021-07-12 16:20:46', '2021-07-12 16:20:46'),
(62, 'delete_category', 'Delete', 16, 1, NULL, '2021-07-12 16:20:58', '2021-07-12 16:20:58'),
(63, 'view_sub_category', 'View', 16, 1, NULL, '2021-07-12 16:22:20', '2021-07-12 16:22:20'),
(64, 'view_promotion', 'View', 15, 1, NULL, '2021-07-12 16:22:45', '2021-07-12 16:22:45'),
(65, 'edit_promotion', 'Edit', 15, 1, NULL, '2021-07-12 16:22:56', '2021-07-12 16:22:56'),
(66, 'view_client_query', 'View', 23, 1, NULL, '2021-07-12 16:23:16', '2021-07-12 16:23:16'),
(67, 'edit_client_query', 'Edit', 23, 1, NULL, '2021-07-12 16:23:25', '2021-07-12 16:23:25'),
(68, 'view_faq', 'View', 24, 1, NULL, '2021-07-12 16:23:39', '2021-07-12 16:23:39'),
(69, 'edit_faq', 'Edit', 24, 1, NULL, '2021-07-12 16:25:12', '2021-07-12 16:25:12'),
(70, 'delete_faq', 'Delete', 24, 1, NULL, '2021-07-12 16:25:33', '2021-07-12 16:25:33'),
(71, 'new_faq', 'New', 24, 1, NULL, '2021-07-12 16:25:51', '2021-07-12 16:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `group_name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'TEST', 1, NULL, '2022-07-28 14:42:01', '2022-07-28 14:42:01'),
(8, 'User role', 1, NULL, '2020-10-07 00:22:35', '2020-10-07 00:22:35'),
(9, 'Admin User', 1, NULL, '2020-10-07 00:23:50', '2020-10-07 00:23:50'),
(10, 'Menu', 1, NULL, '2020-10-07 02:36:05', '2020-10-07 02:36:05'),
(11, 'Action', 1, NULL, '2020-10-07 03:15:36', '2020-10-07 03:15:36'),
(12, 'Assign Access', 1, NULL, '2020-10-09 05:51:17', '2020-10-09 05:51:17'),
(13, 'Product', 1, NULL, '2021-07-12 15:58:38', '2021-07-12 15:58:38'),
(14, 'Package', 1, NULL, '2021-07-12 15:59:09', '2021-07-12 15:59:09'),
(15, 'Promotion', 1, NULL, '2021-07-12 15:59:40', '2021-07-12 15:59:40'),
(16, 'Category', 1, NULL, '2021-07-12 15:59:55', '2021-07-12 15:59:55'),
(17, 'Product Brand', 1, NULL, '2021-07-12 16:00:08', '2021-07-12 16:00:08'),
(18, 'Product Model', 1, NULL, '2021-07-12 16:00:18', '2021-07-12 16:00:18'),
(19, 'City', 1, NULL, '2021-07-12 16:00:45', '2021-07-12 16:00:45'),
(20, 'Division', 1, NULL, '2021-07-12 16:00:52', '2021-07-12 16:00:52'),
(21, 'Area', 1, NULL, '2021-07-12 16:01:04', '2021-07-12 16:01:04'),
(22, 'Product Type', 1, NULL, '2021-07-12 16:01:23', '2021-07-12 16:01:23'),
(23, 'Client Query', 1, NULL, '2021-07-12 16:01:39', '2021-07-12 16:01:39'),
(24, 'FAQ', 1, NULL, '2021-07-12 16:01:47', '2021-07-12 16:01:47'),
(25, 'Customer', 1, NULL, '2021-07-12 16:18:38', '2021-07-12 16:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `prd_ads`
--

CREATE TABLE `prd_ads` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_ads`
--

INSERT INTO `prd_ads` (`pk_no`, `name`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(4, 'home_page2', 1, NULL, '2022-08-09 11:35:18', NULL, '2022-08-09 11:35:18'),
(5, 'home_page3', 1, NULL, '2022-08-09 11:35:36', NULL, '2022-08-09 11:35:36'),
(6, 'list_page1', 1, NULL, '2022-08-09 11:37:12', NULL, '2022-08-09 11:37:12'),
(7, 'list_page2', 1, NULL, '2022-08-09 11:38:28', NULL, '2022-08-09 11:38:28'),
(8, 'detail_page2', 1, NULL, '2022-08-09 12:05:44', NULL, '2022-08-09 12:05:44'),
(9, 'detail_page3', 1, NULL, '2022-08-09 12:06:46', NULL, '2022-08-09 12:06:46'),
(10, 'detail_page1', 1, NULL, '2022-08-09 12:17:25', NULL, '2022-08-09 12:17:25'),
(11, 'list_page3', 1, NULL, '2022-08-09 17:02:35', NULL, '2022-08-09 17:02:35'),
(12, 'home_page1', 1, NULL, '2022-08-13 20:54:26', NULL, '2022-08-13 20:54:26'),
(13, 'how_to_sell_fast_page1', 1, NULL, '2022-12-13 17:22:35', NULL, '2022-12-13 17:22:35'),
(14, 'how_to_sell_fast_page2', 1, NULL, '2022-12-13 17:22:57', NULL, '2022-12-13 17:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `prd_ad_details`
--

CREATE TABLE `prd_ad_details` (
  `pk_no` int(11) NOT NULL,
  `prd_ad_id` int(11) DEFAULT NULL COMMENT 'from prd_ads id',
  `name` varchar(124) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_ad_details`
--

INSERT INTO `prd_ad_details` (`pk_no`, `prd_ad_id`, `name`, `link`, `photo`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(2, 4, 'home page two', 'https://www.facebook.com/', 'uploads/ads/1660893975-sell-(1).png', 1, NULL, '2022-08-09 11:35:18', NULL, '2022-08-19 13:26:15'),
(3, 5, 'home page three', 'https://ok2list.com/ad-post?type=general', 'uploads/ads/1660894056-sell-(1).png', 1, NULL, '2022-08-09 11:35:36', NULL, '2022-08-19 13:27:36'),
(4, 6, 'list page one', 'https://www.facebook.com/', 'uploads/ads/1661023841-sell-(4).png', 1, NULL, '2022-08-09 11:37:12', NULL, '2022-08-21 01:30:41'),
(5, 7, 'All ads', 'https://www.facebook.com/', 'uploads/ads/1660616682-post-(1).png', 1, NULL, '2022-08-09 11:38:28', NULL, '2022-08-16 08:24:42'),
(6, 8, 'Horizon 1', 'https://www.facebook.com/', 'uploads/ads/1660912697-sell.png', 1, NULL, '2022-08-09 12:05:44', NULL, '2022-08-19 18:38:17'),
(7, 9, 'sdfsdf', 'https://www.facebook.com/', 'uploads/ads/1660593589-post.png', 1, NULL, '2022-08-09 12:06:46', NULL, '2022-08-16 01:59:50'),
(8, 10, 'Ad3', 'https://www.facebook.com/', 'uploads/ads/1661023752-sell-(2).png', 1, NULL, '2022-08-09 12:17:25', NULL, '2022-08-21 01:29:12'),
(9, 11, 'list page three', 'https://www.facebook.com/', 'uploads/ads/1661023941-sell-(2).png', 1, NULL, '2022-08-09 17:02:35', NULL, '2022-08-21 01:32:21'),
(10, 12, 'Ad 1', 'https://ok2list.com/ad-post?type=general', 'uploads/ads/1660893793-sell.png', 1, NULL, '2022-08-13 20:54:26', NULL, '2022-08-19 13:25:25'),
(14, 10, 'Ad1', NULL, 'uploads/ads/1661023752-sell-(4).png', 1, NULL, '2022-08-21 01:29:12', NULL, '2022-08-21 01:29:12'),
(15, 10, 'Ads2', NULL, 'uploads/ads/1661023752-sell-(3).png', 1, NULL, '2022-08-21 01:29:12', NULL, '2022-08-21 01:29:12'),
(16, 13, 'ads', 'https://ok2list.com/', 'uploads/ads/1670932355-1.png', 1, NULL, '2022-12-13 17:22:35', NULL, '2022-12-13 17:22:35'),
(17, 14, 'ads', 'https://ok2list.com/', 'uploads/ads/1670932377-2.png', 1, NULL, '2022-12-13 17:22:57', NULL, '2022-12-13 17:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `prd_brand`
--

CREATE TABLE `prd_brand` (
  `pk_no` int(11) NOT NULL,
  `cat_pk_no` int(10) DEFAULT NULL,
  `scat_pk_no` int(10) DEFAULT NULL,
  `name` varchar(124) DEFAULT NULL,
  `name_bn` varchar(124) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `order_id` int(10) DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Brand Master Setup Table' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_brand`
--

INSERT INTO `prd_brand` (`pk_no`, `cat_pk_no`, `scat_pk_no`, `name`, `name_bn`, `code`, `comments`, `is_active`, `is_delete`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 104, 21, 'Samsung', NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL),
(2, 1, 13, 'Alfa Romeo', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:09:27', 1, '2022-08-13 08:58:10'),
(3, 8, 70, 'Sofa', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:18:07', NULL, '2020-12-13 07:18:07'),
(4, 8, 72, 'Beds', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:22:38', NULL, '2020-12-13 07:22:38'),
(5, 2, 20, 'Lenovo', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:27:08', NULL, '2020-12-13 07:27:08'),
(6, 2, 25, 'Canon', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:37:31', NULL, '2020-12-13 07:37:31'),
(7, 4, 35, 'Guild', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:42:11', NULL, '2020-12-13 07:42:11'),
(8, 4, 36, 'Sony', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:45:25', NULL, '2020-12-13 07:45:25'),
(9, 5, 45, 'The Diamond Band', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:51:50', NULL, '2020-12-13 07:51:50'),
(10, 5, 47, 'Cartier', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:55:24', NULL, '2020-12-13 07:55:24'),
(11, 6, 53, 'Pure', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 07:59:00', NULL, '2020-12-13 07:59:00'),
(12, 6, 55, 'Toys', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:06:07', NULL, '2020-12-13 08:06:07'),
(13, 94, 95, 'Grocery', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:11:49', NULL, '2020-12-13 08:11:49'),
(14, 94, 96, 'Egg Holder', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:15:31', NULL, '2020-12-13 08:15:31'),
(15, 104, 21, 'Asus', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:19:14', NULL, '2020-12-13 08:19:14'),
(16, 104, 26, 'Apple', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:23:01', NULL, '2020-12-13 08:23:01'),
(17, 94, 100, 'CHOCO CARNATION', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:26:50', NULL, '2020-12-13 08:26:50'),
(18, 1, 13, 'Audi', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:28:40', NULL, '2022-08-17 00:28:40'),
(19, 1, 13, 'Aston Martin', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:35:14', NULL, '2022-08-17 00:35:14'),
(20, 1, 13, 'BMW', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:42:38', NULL, '2022-08-17 00:42:38'),
(21, 1, 13, 'Brilliance', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:42:59', NULL, '2022-08-17 00:42:59'),
(22, 1, 13, 'BYD', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:43:16', NULL, '2022-08-17 00:43:16'),
(23, 1, 13, 'BAIC', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:43:38', NULL, '2022-08-17 00:43:38'),
(24, 1, 13, 'Honda', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 00:44:07', NULL, '2022-08-17 00:44:07'),
(25, 1, 13, 'Chevrolet', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:55:10', NULL, '2022-08-17 14:55:10'),
(26, 1, 13, 'Chrysler', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:55:54', NULL, '2022-08-17 14:55:54'),
(27, 1, 13, 'Citreon', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:56:11', NULL, '2022-08-17 14:56:11'),
(28, 1, 13, 'Chery', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:56:28', NULL, '2022-08-17 14:56:28'),
(29, 1, 13, 'Cadillac', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:56:44', NULL, '2022-08-17 14:56:44'),
(30, 1, 13, 'Dodge', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:57:01', NULL, '2022-08-17 14:57:01'),
(31, 1, 13, 'Daihatsu', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:57:18', NULL, '2022-08-17 14:57:18'),
(32, 1, 13, 'Daewoo', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:57:53', NULL, '2022-08-17 14:57:53'),
(33, 1, 13, 'Ford', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:58:16', NULL, '2022-08-17 14:58:16'),
(34, 1, 13, 'Fiat', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:58:30', NULL, '2022-08-17 14:58:30'),
(35, 1, 13, 'Ferrari', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:58:46', NULL, '2022-08-17 14:58:46'),
(36, 1, 13, 'GMC', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:59:08', NULL, '2022-08-17 14:59:08'),
(37, 1, 13, 'Geely', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:59:22', NULL, '2022-08-17 14:59:22'),
(38, 1, 13, 'Honda', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:59:39', NULL, '2022-08-17 14:59:39'),
(39, 1, 13, 'Hyundai', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 14:59:56', NULL, '2022-08-17 14:59:56'),
(40, 1, 13, 'Hummer', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:00:13', NULL, '2022-08-17 15:00:13'),
(41, 1, 13, 'Isuzu', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:00:42', NULL, '2022-08-17 15:00:42'),
(42, 1, 13, 'Infiniti', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:00:55', NULL, '2022-08-17 15:00:55'),
(43, 1, 13, 'Jaguar', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:01:14', NULL, '2022-08-17 15:01:14'),
(44, 1, 13, 'Jeep', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:01:26', NULL, '2022-08-17 15:01:26'),
(45, 1, 13, 'Kia', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:01:53', NULL, '2022-08-17 15:01:53'),
(46, 1, 13, 'Lada', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:02:07', NULL, '2022-08-17 15:02:07'),
(47, 1, 13, 'Land Rover', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:02:21', NULL, '2022-08-17 15:02:21'),
(48, 1, 13, 'Lexus', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:02:37', NULL, '2022-08-17 15:02:37'),
(49, 1, 13, 'Lamborghini', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:03:08', NULL, '2022-08-17 15:03:08'),
(50, 1, 13, 'MINI', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:03:57', NULL, '2022-08-17 15:03:57'),
(51, 1, 13, 'Mercedes-Benz', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:04:18', NULL, '2022-08-17 15:04:18'),
(52, 1, 13, 'Mazda', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:04:29', NULL, '2022-08-17 15:04:29'),
(53, 1, 13, 'Mitsubishi', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:08:34', NULL, '2022-08-17 15:08:34'),
(54, 1, 13, 'Maserati', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:08:48', NULL, '2022-08-17 15:08:48'),
(55, 1, 13, 'Nissan', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:09:01', NULL, '2022-08-17 15:09:01'),
(56, 1, 13, 'Opel', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:09:13', NULL, '2022-08-17 15:09:13'),
(57, 1, 13, 'Porsche', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:09:27', NULL, '2022-08-17 15:09:27'),
(58, 1, 13, 'Peugot', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:09:41', NULL, '2022-08-17 15:09:41'),
(59, 1, 13, 'Proton', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:09:53', NULL, '2022-08-17 15:09:53'),
(60, 1, 13, 'Rover', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:10:07', NULL, '2022-08-17 15:10:07'),
(61, 1, 13, 'Renault', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:10:28', NULL, '2022-08-17 15:10:28'),
(62, 1, 13, 'Suzuki', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:10:40', NULL, '2022-08-17 15:10:40'),
(63, 1, 13, 'Ssang Yong', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:10:53', NULL, '2022-08-17 15:10:53'),
(64, 1, 13, 'Skada', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:11:03', NULL, '2022-08-17 15:11:03'),
(65, 1, 13, 'Seat', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:11:12', NULL, '2022-08-17 15:11:12'),
(66, 1, 13, 'Subaru', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:11:27', NULL, '2022-08-17 15:11:27'),
(67, 1, 13, 'Toyota', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:11:37', NULL, '2022-08-17 15:11:37'),
(68, 1, 13, 'Volvo', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:11:50', NULL, '2022-08-17 15:11:50'),
(69, 1, 13, 'Volkswagen', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-17 15:12:04', NULL, '2022-08-17 15:12:04'),
(70, 1, 14, 'Aprilla', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:15:49', NULL, '2022-08-19 09:15:49'),
(71, 1, 14, 'Bajaj', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:16:11', NULL, '2022-08-19 09:16:11'),
(72, 1, 14, 'BMW', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:16:48', NULL, '2022-08-19 09:16:48'),
(73, 1, 14, 'Chopper', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:17:33', NULL, '2022-08-19 09:17:33'),
(74, 1, 14, 'Demak', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:18:00', NULL, '2022-08-19 09:18:00'),
(75, 1, 14, 'Ducati', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:18:26', NULL, '2022-08-19 09:18:26'),
(76, 1, 14, 'Blectra', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:31:29', NULL, '2022-08-19 09:31:29'),
(77, 1, 14, 'Falcon', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:31:49', NULL, '2022-08-19 09:31:49'),
(78, 1, 14, 'Harley Davidson', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:32:07', 1, '2022-08-19 09:32:33'),
(79, 1, 14, 'Hero', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:32:56', NULL, '2022-08-19 09:32:56'),
(80, 1, 14, 'Honda', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:33:17', NULL, '2022-08-19 09:33:17'),
(81, 1, 14, 'Kawasaki', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:33:40', NULL, '2022-08-19 09:33:40'),
(82, 1, 14, 'Kinetic', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:34:03', NULL, '2022-08-19 09:34:03'),
(83, 1, 14, 'KTM', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:34:21', NULL, '2022-08-19 09:34:21'),
(84, 1, 14, 'Kymco', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:35:07', NULL, '2022-08-19 09:35:07'),
(85, 1, 14, 'Mahindra', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:35:32', NULL, '2022-08-19 09:35:32'),
(86, 1, 14, 'Minnelli', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:37:01', NULL, '2022-08-19 09:37:01'),
(87, 1, 14, 'Piaggio', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:37:24', NULL, '2022-08-19 09:37:24'),
(88, 1, 14, 'Ranomoto', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:37:56', NULL, '2022-08-19 09:37:56'),
(89, 1, 14, 'Suzuki', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:38:42', NULL, '2022-08-19 09:38:42'),
(90, 1, 14, 'Yamaha', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:39:05', NULL, '2022-08-19 09:39:05'),
(91, 1, 14, 'Other Brand', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:39:30', NULL, '2022-08-19 09:39:30'),
(92, 1, 14, 'TVS', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:40:04', NULL, '2022-08-19 09:40:04'),
(93, 1, 154, 'Piaggio', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:42:22', NULL, '2022-08-19 09:42:22'),
(94, 1, 154, 'TVS', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:42:37', NULL, '2022-08-19 09:42:37'),
(95, 1, 154, 'Mahindra', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:42:56', NULL, '2022-08-19 09:42:56'),
(96, 1, 154, 'Bajaj', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:43:22', NULL, '2022-08-19 09:43:22'),
(97, 1, 154, 'Other Brand', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:43:40', NULL, '2022-08-19 09:43:40'),
(98, 1, 15, 'Atlas', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:45:37', NULL, '2022-08-19 09:45:37'),
(99, 1, 15, 'Lumala', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:46:01', NULL, '2022-08-19 09:46:01'),
(100, 1, 15, 'Bianchi', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:46:21', NULL, '2022-08-19 09:46:21'),
(101, 1, 15, 'DSI', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:46:39', NULL, '2022-08-19 09:46:39'),
(102, 1, 15, 'Other Brand', NULL, NULL, NULL, 1, 0, 0, 1, '2022-08-19 09:46:57', NULL, '2022-08-19 09:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `prd_category`
--

CREATE TABLE `prd_category` (
  `pk_no` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(4) DEFAULT NULL,
  `name` varchar(124) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `name_bn` varchar(20) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `seo_des` varchar(200) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `banner` varchar(200) DEFAULT NULL,
  `is_top` int(1) DEFAULT NULL,
  `is_new` int(1) DEFAULT NULL,
  `is_feature` int(1) DEFAULT NULL,
  `hs_prefix` varchar(20) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `order_id` int(10) DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_highlight` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='category master setup table' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_category`
--

INSERT INTO `prd_category` (`pk_no`, `parent_id`, `code`, `name`, `url_slug`, `name_bn`, `description`, `seo_des`, `logo`, `icon`, `banner`, `is_top`, `is_new`, `is_feature`, `hs_prefix`, `comments`, `is_active`, `is_delete`, `total_post`, `active_post`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_highlight`) VALUES
(1, 0, '11', 'Cars & Vehicles', 'cars-vehicles', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, 'category_log_5fe8202d6d53d.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-15 17:21:12', 1, '2022-12-13 15:32:12', 0),
(2, 0, '12', 'Electronics & Gadgets', 'electronics-gedgets', NULL, 'Find great deals for used electronics in Sri Lanka including mobile phones, computers, laptops, TVs, cameras and much more.', 'Find great deals for used electronics in Sri Lanka including mobile phones, computers, laptops, TVs, cameras and much more.', NULL, 'category_log_5fb2b58af0dc9.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 11, 0, 4, 1, '2020-11-16 17:23:22', 1, '2022-12-13 15:32:56', 0),
(3, 0, '13', 'Property for Rent/Sell', 'property', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_5fe78321e6fb1.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 1, 1, '2020-11-16 17:24:29', 1, '2022-12-13 15:32:32', 1),
(4, 0, '14', 'Sports & responsive', 'sports-responsive', NULL, 'Buy and sell used musical instruments, sports gear and accessories, art and collectibles and items for kids here.', 'Buy and sell used musical instruments, sports gear and accessories, art and collectibles and items for kids here.', NULL, 'category_log_5fb2b656e349a.png', NULL, 0, 1, 1, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:26:46', 1, '2020-11-16 17:26:46', 0),
(5, 0, '15', 'Fashion & Beauty', 'fashion-beauty', NULL, 'Buy and sell clothing, garments, shoes and other personal items including handbags, perfumes etc.', 'Buy and sell clothing, garments, shoes and other personal items including handbags, perfumes etc.', NULL, 'category_log_5fb2b67d5307e.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 2, 0, 4, 1, '2020-11-16 17:27:25', 1, '2022-12-13 15:32:59', 0),
(6, 0, '16', 'Pets & Animals', 'pets-animals', NULL, 'Search from the widest variety of pets in Srilanka. Select from dogs, puppies, cats, kittens, birds and other domesticated animals.', 'Search from the widest variety of pets in Srilanka. Select from dogs, puppies, cats, kittens, birds and other domesticated animals.', NULL, 'category_log_5fb2b70570133.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:29:41', 1, '2022-12-13 15:33:01', 0),
(7, 0, '17', 'Jobs & Work Overseas', 'jobs', NULL, 'Post and apply for jobs and career opportunities in Srilanka. Search for job vacancies in your city.', 'Post and apply for jobs and career opportunities in Srilanka. Search for job vacancies in your city.', NULL, 'category_log_5fe783bc456e6.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 2, 1, '2020-11-16 17:30:12', 1, '2022-12-13 15:32:34', 1),
(8, 0, '18', 'Home Appliances', 'home-appliances', NULL, 'Buy and sell new and used home appliances including furniture, kitchen items, gardening products and other items for your garden.', 'Buy and sell new and used home appliances including furniture, kitchen items, gardening products and other items for your garden.', NULL, 'category_log_5fe820fd53eb2.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 3, 1, '2020-11-16 17:30:59', 1, '2022-12-13 15:31:22', 0),
(9, 0, '19', 'Matrimony Services', 'matrimony-services', NULL, NULL, NULL, NULL, 'category_log_5fb2b77f7bad7.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:31:43', 1, '2020-12-26 19:03:47', 0),
(11, 0, '21', 'Miscellaneous', 'miscellaneous', NULL, NULL, NULL, NULL, 'category_log_5fb2b83daaa73.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 6, 1, '2020-11-16 17:34:53', 1, '2020-12-21 19:37:52', 0),
(12, 0, '22', 'Books & Magazines', 'books-magazines', NULL, NULL, NULL, NULL, 'category_log_5fb2b88671c88.png', NULL, 1, 0, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:36:06', 1, '2020-12-21 19:37:48', 0),
(13, 1, '23', 'Cars', 'cars--buses', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:41:37', 1, '2022-08-13 08:57:01', 0),
(14, 1, '24', 'Motorbikes & Scooters', 'motorbikes-scooters', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:41:47', NULL, '2020-11-16 17:41:47', 0),
(15, 1, '25', 'Bicycles', 'bicycles-and-three-wheelers', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:41:56', 1, '2022-08-12 19:32:18', 0),
(17, 1, '27', 'Trucks & Lorries', 'trucks-vans-buses', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:42:17', 1, '2022-08-12 20:00:39', 0),
(18, 1, '28', 'Tractors & Heavy-Duty', 'tractors-heavyduty', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:42:26', NULL, '2020-11-16 17:42:26', 0),
(19, 1, '29', 'Auto Parts & Accessories', 'auto-parts-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:42:52', NULL, '2020-11-16 17:42:52', 0),
(20, 2, '30', 'Laptop & Computer', 'laptop-computer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:02', NULL, '2020-11-16 17:43:02', 0),
(21, 104, '31', 'Mobile Phones', 'mobile-phones', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:10', NULL, '2020-11-16 17:43:10', 0),
(22, 2, '32', 'Phablet & Tablets', 'phablet-tablets', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:22', NULL, '2020-11-16 17:43:22', 0),
(23, 2, '33', 'Audio & MP', 'audio-mp', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:31', NULL, '2020-11-16 17:43:31', 0),
(24, 2, '34', 'Accessories', 'accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:39', NULL, '2020-11-16 17:43:39', 0),
(25, 2, '35', 'Cameras', 'cameras', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:46', NULL, '2020-11-16 17:43:46', 0),
(26, 104, '36', 'Mobile Accessories', 'mobile-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 1, 1, '2020-11-16 17:43:53', 1, '2020-12-18 06:18:04', 0),
(27, 2, '37', 'TV & Video', 'tv-video', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 4, 1, '2020-11-16 17:44:02', 1, '2022-08-14 12:25:46', 0),
(28, 2, '38', 'Other Electronics', 'other-electronics', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:13', NULL, '2020-11-16 17:44:13', 0),
(29, 2, '39', 'TV & Video Accessories', 'tv-video-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:44:26', NULL, '2020-11-16 17:44:26', 0),
(30, 3, '40', 'Houses For Sale', 'houses', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:38', 1, '2022-08-12 19:18:43', 0),
(31, 3, '41', 'Room Annex Rentals', 'rooms', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:46', 1, '2022-08-12 19:21:30', 0),
(32, 3, '42', 'Commercial Property Rentals', 'plots-lands', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:00', 1, '2022-08-12 19:22:23', 0),
(33, 3, '43', 'Apartments Rentals', 'apartment-flats', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:27', 1, '2022-08-12 19:19:28', 0),
(34, 4, '44', 'All Hobbies, Sports & Kids', 'all-hobbies-sports--kids', NULL, NULL, NULL, NULL, 'category_log_6300f7527f82e.png', NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:05:55', 1, '2022-08-20 21:01:38', 0),
(35, 4, '45', 'Musical Instruments', 'musical-instruments', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:06:09', NULL, '2020-11-16 18:06:09', 0),
(36, 4, '46', 'Sports', 'sports', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 18:06:23', NULL, '2020-11-16 18:06:23', 0),
(37, 4, '47', 'Fitness & Gym', 'fitness-gym', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:06:38', NULL, '2020-11-16 18:06:38', 0),
(38, 4, '48', 'Music, Books & Movies', 'music-books-movies', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:06:49', NULL, '2020-11-16 18:06:49', 0),
(39, 4, '49', 'Children\'s Items', 'childrens-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:07:06', NULL, '2020-11-16 18:07:06', 0),
(40, 4, '50', 'Other Hobby, Sport & Kids items', 'other-hobby-sport-kids-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:07:18', NULL, '2020-11-16 18:07:18', 0),
(42, 5, '52', 'Men\'s Clothing & Accessories', 'mens-clothing-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:07:59', NULL, '2020-11-16 18:07:59', 0),
(43, 5, '53', 'Women\'s Clothing & Accessories', 'womens-clothing-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:08:14', NULL, '2020-11-16 18:08:14', 0),
(44, 5, '54', 'Children\'s Clothing & Accessories', 'childrens-clothing-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:08:24', NULL, '2020-11-16 18:08:24', 0),
(45, 5, '55', 'Jewellery', 'jewellery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:08:38', NULL, '2020-11-16 18:08:38', 0),
(46, 5, '56', 'Optical Items', 'optical-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:09:09', NULL, '2020-11-16 18:09:09', 0),
(47, 5, '57', 'Watches', 'watches', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:09:31', NULL, '2020-11-16 18:09:31', 0),
(48, 5, '58', 'Bags', 'bags', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:09:57', NULL, '2020-11-16 18:09:57', 0),
(49, 5, '59', 'Wholesale - Bulk', 'wholesale-bulk', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:10:22', NULL, '2020-11-16 18:10:22', 0),
(50, 5, '60', 'Beauty Products', 'beauty-products', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:10:35', NULL, '2020-11-16 18:10:35', 0),
(51, 5, '61', 'Other Items', 'other-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:10:49', NULL, '2020-11-16 18:10:49', 0),
(53, 6, '63', 'Pets', 'pets', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:13:02', NULL, '2020-11-16 18:13:02', 0),
(54, 6, '64', 'Farm Animals', 'farm-animals', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:13:13', NULL, '2020-11-16 18:13:13', 0),
(55, 6, '65', 'Pet & Animal Accessories', 'pet-animal-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:13:24', NULL, '2020-11-16 18:13:24', 0),
(56, 6, '66', 'Other Pets & Animals', 'other-pets--animals', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:13:39', NULL, '2020-11-16 18:13:39', 0),
(57, 7, '67', 'IT & Telecom', 'it-telecom', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:17:11', NULL, '2020-11-16 18:17:11', 0),
(58, 7, '68', 'Security Services', 'security-services', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:17:35', NULL, '2020-11-16 18:17:35', 0),
(59, 7, '69', 'Consumer Goods & Durables', 'consumer-goods-durables', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:17:47', NULL, '2020-11-16 18:17:47', 0),
(60, 7, '70', 'Ecommerce & Internet', 'ecommerce-internet', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:17:59', NULL, '2020-11-16 18:17:59', 0),
(61, 7, '71', 'Garments & Textile', 'garments--textile', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:18:13', NULL, '2020-11-16 18:18:13', 0),
(62, 7, '72', 'Logistics & Transportation', 'logistics-transportation', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:18:25', NULL, '2020-11-16 18:18:25', 0),
(64, 7, '74', 'Manufacturing', 'manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:20:48', NULL, '2020-11-16 18:20:48', 0),
(65, 7, '75', 'Hotel, Travel & Leisure', 'hotel-travel-leisure', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:21:05', NULL, '2020-11-16 18:21:05', 0),
(66, 7, '76', 'Consulting', 'consulting', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:21:21', NULL, '2020-11-16 18:21:21', 0),
(67, 7, '77', 'Agriculture & Food Processing', 'agriculture-food-processing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:21:32', NULL, '2020-11-16 18:21:32', 0),
(68, 7, '78', 'Others', 'others', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:24:03', NULL, '2020-11-16 18:24:03', 0),
(70, 8, '80', 'Furniture', 'living-room-furniture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:25:02', 1, '2022-08-13 09:45:29', 0),
(71, 8, '81', 'Kitchen & Dining Furniture', 'kitchen-dining-furniture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:25:15', NULL, '2020-11-16 18:25:15', 0),
(72, 8, '82', 'Bedroom Furniture', 'bedroom-furniture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:25:34', NULL, '2020-11-16 18:25:34', 0),
(73, 8, '83', 'Office & Shop Furniture', 'office-shop-furniture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:25:46', NULL, '2020-11-16 18:25:46', 0),
(74, 8, '84', 'Children\'s Furniture', 'childrens-furniture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:26:19', NULL, '2020-11-16 18:26:19', 0),
(75, 8, '85', 'ACs & Home Electronics', 'acs-home-electronics', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:26:55', NULL, '2020-11-16 18:26:55', 0),
(77, 8, '87', 'Household Items', 'household-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:27:43', NULL, '2020-11-16 18:27:43', 0),
(78, 8, '88', 'Home Textiles & Decoration', 'home-textiles--decoration', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:28:01', NULL, '2020-11-16 18:28:01', 0),
(80, 12, '90', 'Textbooks', 'textbooks', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 80, 1, '2020-11-16 18:31:41', 1, '2020-12-18 06:17:05', 0),
(81, 12, '91', 'Tuition', 'tuition', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:31:58', NULL, '2020-11-16 18:31:58', 0),
(82, 12, '92', 'Courses', 'courses', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:32:07', NULL, '2020-11-16 18:32:07', 0),
(83, 12, '93', 'Study Abroad', 'study-abroad', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:32:21', NULL, '2020-11-16 18:32:21', 0),
(84, 12, '94', 'Other Books', 'other-books', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:32:35', NULL, '2020-11-16 18:32:35', 0),
(85, 0, '95', 'Agriculture', 'agriculture', NULL, NULL, NULL, NULL, 'category_log_5fd8e50cbe19c.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:37:16', 1, '2022-12-13 15:30:51', 0),
(87, 85, '97', 'Crops, Seeds & Plants', 'crops-seeds--plants', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:39:38', NULL, '2020-11-16 18:39:38', 0),
(88, 85, '98', 'Farming Tools & Machinery', 'farming-tools--machinery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:39:51', NULL, '2020-11-16 18:39:51', 0),
(89, 85, '99', 'Other Agriculture', 'other-agriculture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:40:03', NULL, '2020-11-16 18:40:03', 0),
(93, 1, '103', 'Rentals', 'car-rentals--auto-services', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:22:15', 1, '2022-08-12 20:01:21', 0),
(94, 0, '104', 'Essential', 'essential', NULL, NULL, NULL, NULL, 'category_log_5fe822230625e.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:00', 1, '2022-12-13 15:33:18', 0),
(95, 94, '105', 'Grocery', 'grocery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:24', NULL, '2020-11-17 20:33:24', 0),
(96, 94, '106', 'Fruits & Vegetables', 'fruits--vegetables', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:36', NULL, '2020-11-17 20:33:36', 0),
(97, 94, '107', 'Meat & Seafood', 'meat--seafood', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:50', NULL, '2020-11-17 20:33:50', 0),
(98, 94, '108', 'Baby Products', 'baby-products', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:06', NULL, '2020-11-17 20:34:06', 0),
(99, 94, '109', 'Healthcare', 'healthcare', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:19', NULL, '2020-11-17 20:34:19', 0),
(100, 94, '110', 'Household', 'household', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:39', NULL, '2020-11-17 20:34:39', 0),
(101, 94, '111', 'Other Essentials', 'other-essentials', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:50', NULL, '2020-11-17 20:34:50', 0),
(104, 0, '112', 'Mobiles', 'mobiles', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, 'category_log_5fe786c5db223.png', NULL, 1, 1, 1, NULL, NULL, 0, 0, 0, 0, 1, 1, '2020-11-16 17:21:12', 1, '2022-08-12 09:55:56', 0),
(107, 3, '113', 'Commercial Properties', 'commercial-property', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:27', 1, '2022-08-12 19:23:02', 0),
(108, 104, '118', 'SIM Cards', 'sim-cards', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:04', NULL, '2021-01-17 19:00:04', 0),
(109, 104, '119', 'Mobile Phone Services', 'mobile-phone-services', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:17', NULL, '2021-01-17 19:00:17', 0),
(110, 2, '120', 'Desktop Computers', 'desktop-computers', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 2, 0, 0, 1, '2021-01-17 19:00:49', NULL, '2021-01-17 19:00:49', 0),
(111, 2, '121', 'Laptops', 'laptops', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2021-01-17 19:01:26', 1, '2021-01-17 19:02:47', 0),
(112, 2, '122', 'Laptop & Computer Accessories', 'laptop-computer-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2021-01-17 19:01:33', 1, '2021-01-17 19:02:37', 0),
(113, 2, '123', 'Tablets & Accessories', 'tablets-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2021-01-17 19:01:41', NULL, '2021-01-17 19:01:41', 0),
(114, 2, '124', 'Photocopiers', 'photocopiers', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:03:05', NULL, '2021-01-17 19:03:05', 0),
(116, 7, '126', 'sales', 'sales', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-24 16:03:27', NULL, '2021-01-24 16:03:27', 0),
(117, 7, '127', 'Marketing', 'marketing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-24 16:26:47', NULL, '2021-01-24 16:26:47', 0),
(118, 7, '128', 'Supervisor', 'supervisor', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-25 06:24:22', NULL, '2021-01-25 06:24:22', 0),
(119, 7, '129', 'Office Admin', 'office-admin', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-25 15:18:26', NULL, '2021-01-25 15:18:26', 0),
(120, 8, '130', 'Refrigerators & Freezers', 'refrigerators-freezers', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-02-13 15:36:47', NULL, '2021-02-13 15:36:47', 0),
(121, 0, '131', 'Business & Industry', 'business-industry', NULL, NULL, NULL, 'category_log_6027f5e644397.png', 'category_log_6027f5869fd0b.png', NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2021-02-13 15:38:09', 1, '2021-02-13 15:54:09', 0),
(122, 121, '132', 'Industry Machinery & Tools', 'industry-machinery-tools', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-02-13 15:38:38', NULL, '2021-02-13 15:38:38', 0),
(123, 2, '133', 'Video Game Consoles & Accessories', 'video-game-consoles-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-02-15 17:43:59', NULL, '2021-02-15 17:43:59', 0),
(124, 104, '134', 'New Mobile', 'new-mobile', NULL, 'New Mobile', 'New Mobile', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 16, '2021-07-12 17:44:04', NULL, '2021-07-12 17:44:04', 0),
(127, 0, '137', 'Services', 'services', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_62fcf6e4e87b1.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 8, 1, '2022-08-10 15:32:48', 1, '2022-08-17 20:10:44', 0),
(128, 0, '138', 'Education', 'education', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'category_log_62fcd51baff36.png', 'category_log_62fcf5ef0a36e.png', 'category_log_62fb9b73b10dd.png', 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 7, 1, '2022-08-12 09:53:59', 1, '2022-08-17 20:06:39', 0),
(129, 2, '139', 'Mobiles Phones', 'mobiles', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2022-08-12 09:56:35', 1, '2022-08-12 20:06:04', 0),
(130, 0, '140', 'Business & Industry', 'business-industry', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_62fcf6becb5d1.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 8, 1, '2022-08-12 10:00:21', 1, '2022-08-17 20:10:06', 0),
(131, 130, '141', 'Other Business Services', 'other-business-services', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:03:46', NULL, '2022-08-12 11:03:46', 0),
(132, 130, '142', 'Industry Tools & Machinery', 'industry-tools-machinery', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:06:49', NULL, '2022-08-12 11:06:49', 0),
(133, 130, '143', 'Office Equipment, Supplies & Stationery', 'office-equipment-supplies-stationery', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:08:12', NULL, '2022-08-12 11:08:12', 0),
(134, 130, '144', 'Solar & Generators', 'solar-generators', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:08:41', NULL, '2022-08-12 11:08:41', 0),
(135, 130, '145', 'Raw Materials & Wholesale Lots', 'raw-materials-wholesale-lots', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:09:19', NULL, '2022-08-12 11:09:19', 0),
(136, 130, '146', 'Healthcare, Medical Equipment & Supplies', 'healthcare-medical-equipment-supplies', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:10:02', NULL, '2022-08-12 11:10:02', 0),
(137, 130, '147', 'Licenses & Titles', 'licenses-titles', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:10:26', NULL, '2022-08-12 11:10:26', 0),
(138, 127, '148', 'Trade Services', 'trade-services', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:13:28', NULL, '2022-08-12 11:13:28', 0),
(139, 127, '149', 'Domestic Services', 'domestic-services', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:13:46', NULL, '2022-08-12 11:13:46', 0),
(140, 127, '150', 'Other Services', 'other-services', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:14:14', NULL, '2022-08-12 11:14:14', 0),
(141, 127, '151', 'Events & Entertainment', 'events-entertainment', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:15:17', NULL, '2022-08-12 11:15:17', 0),
(142, 127, '152', 'Health & Wellbeings', 'health-wellbeings', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:15:45', NULL, '2022-08-12 11:15:45', 0),
(143, 127, '153', 'Travel & Tourism', 'travel-tourism', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:16:10', NULL, '2022-08-12 11:16:10', 0),
(144, 128, '154', 'Other Education', 'other-education', NULL, 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:20:19', NULL, '2022-08-12 11:20:19', 0),
(145, 128, '155', 'Tuition', 'tuition', NULL, 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:20:39', NULL, '2022-08-12 11:20:39', 0),
(146, 128, '156', 'Textbooks', 'textbooks', NULL, 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:21:02', NULL, '2022-08-12 11:21:02', 0),
(147, 128, '157', 'Vocational Institutes', 'vocational-institutes', NULL, 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:21:37', NULL, '2022-08-12 11:21:37', 0),
(148, 128, '158', 'Higher Education', 'higher-education', NULL, 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', 'All you can find Educational Services sector in Sri Lanka, it comprises; Tuition, Other Education, Textbooks, Vocational Institutes, Higher Education', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:21:55', NULL, '2022-08-12 11:21:55', 0),
(149, 3, '159', 'Land', 'land', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:12:59', 1, '2022-08-12 19:17:35', 0),
(150, 3, '160', 'Apartments For Sale', 'apartments-for-sale', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:20:32', 1, '2022-08-12 19:20:55', 0),
(151, 3, '161', 'Holiday & Short-Term Rentals', 'holiday-short-term-rentals', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:23:50', 1, '2022-08-12 19:24:03', 0),
(152, 3, '162', 'House For Rentals', 'house-for-rentals', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2022-08-12 19:24:59', 1, '2022-08-12 19:25:19', 0),
(153, 1, '163', 'Buses & Vans', 'buses', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:28:45', 1, '2022-08-12 20:01:50', 0),
(154, 1, '164', 'Three Wheelers', 'three-wheelers', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:30:45', 1, '2022-08-12 19:31:07', 0),
(155, 1, '165', 'Auto Services', 'auto-services', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:32:52', 1, '2022-08-12 19:33:10', 0),
(156, 1, '166', 'Boats & Water Transport', 'boats-water-transport', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 20:02:51', 1, '2022-08-12 20:03:11', 0),
(157, 0, '167', 'Hobby, Sport & Kids', 'hobby-sport-kids', NULL, NULL, NULL, 'category_log_62f89d79edcd6.png', 'category_log_6300f7d03937c.png', 'category_log_62f89d79ede6d.png', 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:15:10', 1, '2022-12-13 15:31:26', 0),
(158, 3, '168', 'Land', 'land', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-14 12:16:45', 1, '2022-08-14 12:17:09', 0),
(159, 3, '169', 'House Rentals', 'house-rentals', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-14 12:18:13', 1, '2022-08-19 10:11:07', 0),
(160, 8, '170', 'Kitchen items', 'kitchen-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:30', NULL, '2022-08-14 12:19:30', 0),
(161, 8, '171', 'Other Home Items', 'other-home-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:35', NULL, '2022-08-14 12:19:35', 0),
(162, 8, '172', 'Building Material & Tools', 'building-material-tools', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:44', NULL, '2022-08-14 12:19:44', 0),
(163, 8, '173', 'Garden', 'garden', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:52', NULL, '2022-08-14 12:19:52', 0),
(164, 8, '174', 'Home Decor', 'home-decor', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:58', NULL, '2022-08-14 12:19:58', 0),
(165, 8, '175', 'Bathroom & Sanitary ware', 'bathroom-sanitary-ware', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:20:04', NULL, '2022-08-14 12:20:04', 0),
(166, 2, '176', 'Computer Accessories', 'computer-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:21:19', NULL, '2022-08-14 12:21:19', 0),
(167, 2, '177', 'Computers & Tablets', 'computers-tablets', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:21:29', NULL, '2022-08-14 12:21:29', 0),
(168, 2, '178', 'Mobile Phone Accessories', 'mobile-phone-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 2, 0, 0, 1, '2022-08-14 12:21:40', NULL, '2022-08-14 12:21:40', 0),
(169, 2, '179', 'Electronic Home Appliances', 'electronic-home-appliances', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:24:57', NULL, '2022-08-14 12:24:57', 0),
(170, 2, '180', 'Air Conditions & Electrical fittings', 'air-conditions-electrical-fittings', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:25:03', NULL, '2022-08-14 12:25:03', 0),
(171, 2, '181', 'Cameras & Camcorders', 'cameras-camcorders', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:25:12', NULL, '2022-08-14 12:25:12', 0),
(172, 6, '182', 'Animal Accessories', 'animal-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:29:30', NULL, '2022-08-14 12:29:30', 0),
(173, 6, '183', 'Veterinary Services', 'veterinary-services', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:29:38', NULL, '2022-08-14 12:29:38', 0),
(174, 6, '184', 'Pet Food', 'pet-food', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:29:44', NULL, '2022-08-14 12:29:44', 0),
(175, 157, '185', 'Musical Instruments', 'musical-instruments', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:30:29', NULL, '2022-08-14 12:30:29', 0),
(176, 157, '186', 'Sports & Fitness', 'sports-fitness', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:30:35', NULL, '2022-08-14 12:30:35', 0),
(177, 157, '187', 'Art & Collectibles', 'art-collectibles', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:30:40', NULL, '2022-08-14 12:30:40', 0),
(178, 157, '188', 'Children\'s Items', 'children-s-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:30:44', NULL, '2022-08-14 12:30:44', 0),
(179, 157, '189', 'Other Hobby, Sport & Kids Items', 'other-hobby-sport-kids-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:30:49', NULL, '2022-08-14 12:30:49', 0),
(180, 157, '190', 'Music, Books & Movies', 'music-books-movies', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:30:55', NULL, '2022-08-14 12:30:55', 0),
(181, 157, '191', 'Sports Supplements', 'sports-supplements', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:31:00', NULL, '2022-08-14 12:31:00', 0),
(182, 157, '192', 'Travel, Events & Tickets', 'travel-events-tickets', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:31:05', NULL, '2022-08-14 12:31:05', 0),
(183, 5, '193', 'Clothing', 'clothing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:32:06', NULL, '2022-08-14 12:32:06', 0),
(184, 5, '194', 'Shoes & Footwear', 'shoes-footwear', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:12', NULL, '2022-08-14 12:32:12', 0),
(185, 5, '195', 'Bags & Luggage', 'bags-luggage', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:16', NULL, '2022-08-14 12:32:16', 0),
(186, 5, '196', 'Sunglasses & Opticians', 'sunglasses-opticians', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:32:20', NULL, '2022-08-14 12:32:20', 0),
(187, 5, '197', 'Other Fashion Accessories', 'other-fashion-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:24', NULL, '2022-08-14 12:32:24', 0),
(188, 5, '198', 'Other Personal Items', 'other-personal-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:31', NULL, '2022-08-14 12:32:31', 0),
(189, 94, '199', 'Gas', 'gas', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:33:26', NULL, '2022-08-14 12:33:26', 0),
(190, 0, '200', 'test', 'test', NULL, 'test', NULL, NULL, 'category_log_62fcd69f4aa45.png', NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-17 17:53:03', 1, '2022-08-17 17:53:32', 0),
(191, 9, '201', 'Matrimony', 'matrimony-services', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-12-19 18:53:05', 1, '2022-12-19 18:53:57', 0),
(192, 11, '202', 'Miscellaneous', 'miscellaneous', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-12-19 18:55:41', NULL, '2022-12-19 18:55:41', 0);

--
-- Triggers `prd_category`
--
DELIMITER $$
CREATE TRIGGER `before_prd_category_insert` BEFORE INSERT ON `prd_category` FOR EACH ROW begin
    declare var_pkcode int(2) default 0;
    declare var_order_id int(3) default 0;

    if new.code is null then

      select auto_increment into var_pkcode
      from information_schema.tables
      where table_name = 'prd_category'
      and table_schema = database();
      set new.code = var_pkcode+10 ;
    end if;

    if new.order_id is null then

    select ifnull(max(order_id),0) into var_order_id from  prd_category
    where parent_id = new.parent_id;

      set new.order_id = var_order_id+1 ;
    end if;

  end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_prd_category_update` BEFORE UPDATE ON `prd_category` FOR EACH ROW begin
    declare var_order_id int(3) default 0;

    if new.order_id is null then

    select ifnull(max(order_id),0) into var_order_id from  prd_category
    where parent_id = new.parent_id;

      set new.order_id = var_order_id+1 ;
    end if;

  end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prd_favourites`
--

CREATE TABLE `prd_favourites` (
  `pk_no` int(11) NOT NULL,
  `f_customer_pk_no` int(10) DEFAULT NULL,
  `f_prd_pk_no` int(10) DEFAULT NULL,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prd_favourites`
--

INSERT INTO `prd_favourites` (`pk_no`, `f_customer_pk_no`, `f_prd_pk_no`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 26, 1, 26, '2022-08-21 08:10:19', NULL, '2022-08-21 08:10:19'),
(2, 48, 28, 48, '2022-12-15 14:59:30', NULL, '2022-12-15 14:59:30'),
(3, 51, 34, 51, '2022-12-19 15:37:55', NULL, '2022-12-19 15:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `prd_features`
--

CREATE TABLE `prd_features` (
  `pk_no` int(11) NOT NULL,
  `cat_pk_no` int(10) DEFAULT NULL,
  `name` varchar(124) DEFAULT NULL,
  `name_bn` varchar(124) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `order_id` int(10) DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Brand Master Setup Table' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `prd_img_library`
--

CREATE TABLE `prd_img_library` (
  `pk_no` int(11) NOT NULL,
  `f_prd_master_no` int(11) DEFAULT NULL,
  `img_name` varchar(200) DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_img_library`
--

INSERT INTO `prd_img_library` (`pk_no`, `f_prd_master_no`, `img_name`, `serial_no`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, '607281659858799.jpg', 1, NULL, NULL, NULL, NULL),
(2, 1, '296901659858800.jpg', 2, NULL, NULL, NULL, NULL),
(3, 2, '472951660481586.jpeg', 1, NULL, NULL, NULL, NULL),
(4, 2, '647571660481587.jpeg', 2, NULL, NULL, NULL, NULL),
(5, 2, '316901660481587.webp', 3, NULL, NULL, NULL, NULL),
(6, 2, '816181660481588.jpeg', 4, NULL, NULL, NULL, NULL),
(7, 3, '932451660482139.jpeg', 1, NULL, NULL, NULL, NULL),
(8, 3, '968441660482139.jpeg', 2, NULL, NULL, NULL, NULL),
(9, 3, '828061660482140.jpeg', 3, NULL, NULL, NULL, NULL),
(10, 4, '140741660482474.jpeg', 1, NULL, NULL, NULL, NULL),
(11, 4, '7171660482474.jpeg', 2, NULL, NULL, NULL, NULL),
(12, 5, '152891660574388.jpg', 1, NULL, NULL, NULL, NULL),
(13, 5, '70791660574389.jpg', 2, NULL, NULL, NULL, NULL),
(14, 5, '33231660574389.jpg', 3, NULL, NULL, NULL, NULL),
(15, 6, '579571660574927.jpg', 1, NULL, NULL, NULL, NULL),
(16, 6, '26111660574927.jpg', 2, NULL, NULL, NULL, NULL),
(17, 6, '332281660574927.jpg', 3, NULL, NULL, NULL, NULL),
(18, 7, '55461660575087.jpg', 1, NULL, NULL, NULL, NULL),
(19, 7, '35521660575087.jpg', 2, NULL, NULL, NULL, NULL),
(20, 8, '894211660575189.jpg', 1, NULL, NULL, NULL, NULL),
(21, 8, '455731660575189.jpg', 2, NULL, NULL, NULL, NULL),
(22, 9, '630311660575316.jpg', 1, NULL, NULL, NULL, NULL),
(23, 9, '866681660575316.jpg', 2, NULL, NULL, NULL, NULL),
(24, 9, '980341660575316.jpg', 3, NULL, NULL, NULL, NULL),
(25, 10, '816831660575489.jpg', 1, NULL, NULL, NULL, NULL),
(26, 10, '425911660575489.jpg', 2, NULL, NULL, NULL, NULL),
(27, 10, '571311660575489.jpg', 3, NULL, NULL, NULL, NULL),
(28, 11, '918041660575598.jpg', 1, NULL, NULL, NULL, NULL),
(29, 11, '685531660575598.jpg', 2, NULL, NULL, NULL, NULL),
(30, 11, '182911660575598.jpg', 3, NULL, NULL, NULL, NULL),
(31, 12, '686581660575709.jpg', 1, NULL, NULL, NULL, NULL),
(32, 12, '655001660575709.jpeg', 2, NULL, NULL, NULL, NULL),
(33, 12, '809951660575709.jpg', 3, NULL, NULL, NULL, NULL),
(34, 13, '54301660575995.jpg', 1, NULL, NULL, NULL, NULL),
(35, 13, '607001660575995.jpg', 2, NULL, NULL, NULL, NULL),
(36, 13, '37271660575995.jpg', 3, NULL, NULL, NULL, NULL),
(37, 14, '966231660576163.jpg', 1, NULL, NULL, NULL, NULL),
(38, 14, '480231660576163.jpg', 2, NULL, NULL, NULL, NULL),
(39, 14, '742931660576164.jpg', 3, NULL, NULL, NULL, NULL),
(40, 14, '199561660576164.jpg', 4, NULL, NULL, NULL, NULL),
(45, 16, '507861660974651.webp', 1, NULL, NULL, NULL, NULL),
(46, 16, '325631660974652.jpeg', 2, NULL, NULL, NULL, NULL),
(47, 16, '937571660974652.jpeg', 3, NULL, NULL, NULL, NULL),
(48, 16, '900131660974652.jpeg', 4, NULL, NULL, NULL, NULL),
(49, 17, '658361661332733.jpg', 1, NULL, NULL, NULL, NULL),
(50, 18, '177281661926443.jpg', 1, NULL, NULL, NULL, NULL),
(52, 15, '646641662285016.png', 1, NULL, NULL, NULL, NULL),
(53, 15, '375871662285016.png', 2, NULL, NULL, NULL, NULL),
(54, 15, '306301662285016.png', 3, NULL, NULL, NULL, NULL),
(55, 15, '590931662285017.png', 4, NULL, NULL, NULL, NULL),
(56, 19, '138231662374484.png', 1, NULL, NULL, NULL, NULL),
(57, 19, '464541662374484.png', 2, NULL, NULL, NULL, NULL),
(58, 20, '805381666149489.png', 1, NULL, NULL, NULL, NULL),
(59, 20, '131471666149493.jpg', 2, NULL, NULL, NULL, NULL),
(60, 20, '59571666149493.png', 3, NULL, NULL, NULL, NULL),
(61, 20, '700701666149498.png', 4, NULL, NULL, NULL, NULL),
(62, 20, '276961666149499.png', 5, NULL, NULL, NULL, NULL),
(63, 20, '115121666149500.png', 6, NULL, NULL, NULL, NULL),
(64, 21, '862281666266339.jpeg', 1, NULL, NULL, NULL, NULL),
(65, 21, '471281666266339.jpeg', 2, NULL, NULL, NULL, NULL),
(66, 21, '705801666266339.jpeg', 3, NULL, NULL, NULL, NULL),
(67, 21, '91271666266339.jpeg', 4, NULL, NULL, NULL, NULL),
(68, 21, '558251666266339.jpeg', 5, NULL, NULL, NULL, NULL),
(69, 21, '460251666266340.jpeg', 6, NULL, NULL, NULL, NULL),
(70, 24, '231511670921421.jpg', 1, NULL, NULL, NULL, NULL),
(71, 24, '867201670921422.jpg', 2, NULL, NULL, NULL, NULL),
(72, 24, '976861670921423.png', 3, NULL, NULL, NULL, NULL),
(73, 24, '337851670921426.jpg', 4, NULL, NULL, NULL, NULL),
(74, 25, '20751670923470.jpg', 1, NULL, NULL, NULL, NULL),
(75, 25, '13771670923470.jpg', 2, NULL, NULL, NULL, NULL),
(76, 25, '248381670923470.jpg', 3, NULL, NULL, NULL, NULL),
(77, 25, '429031670923470.jpg', 4, NULL, NULL, NULL, NULL),
(78, 26, '484911670924412.jpg', 1, NULL, NULL, NULL, NULL),
(79, 26, '103651670924413.jpg', 2, NULL, NULL, NULL, NULL),
(80, 26, '976811670924414.jpg', 3, NULL, NULL, NULL, NULL),
(81, 27, '379731670925181.jpg', 1, NULL, NULL, NULL, NULL),
(82, 27, '728691670925182.jpg', 2, NULL, NULL, NULL, NULL),
(87, 28, '849841670932998.jpg', 1, NULL, NULL, NULL, NULL),
(88, 28, '387241670933000.jpg', 2, NULL, NULL, NULL, NULL),
(99, 33, '396981671022403.jpg', 1, NULL, NULL, NULL, NULL),
(100, 33, '898431671022404.jpg', 2, NULL, NULL, NULL, NULL),
(101, 34, '600281671092655.jpg', 1, NULL, NULL, NULL, NULL),
(102, 34, '24021671092656.jpg', 2, NULL, NULL, NULL, NULL),
(103, 35, '54731671092794.jpg', 1, NULL, NULL, NULL, NULL),
(104, 35, '955131671092794.jpg', 2, NULL, NULL, NULL, NULL),
(114, 39, '770841671444426.jpg', 1, NULL, NULL, NULL, NULL),
(115, 29, '7051671447399.jpg', 1, NULL, NULL, NULL, NULL),
(116, 30, '69421671447426.jpg', 1, NULL, NULL, NULL, NULL),
(117, 31, '684401671447456.jpg', 1, NULL, NULL, NULL, NULL),
(118, 32, '434261671447484.jpg', 1, NULL, NULL, NULL, NULL),
(119, 37, '992161671447673.jpg', 1, NULL, NULL, NULL, NULL),
(120, 36, '93991671447829.jpg', 1, NULL, NULL, NULL, NULL),
(121, 40, '267941671452423.jpg', 1, NULL, NULL, NULL, NULL),
(122, 41, '455081671452712.jpg', 1, NULL, NULL, NULL, NULL),
(123, 42, '499741671452986.jpg', 1, NULL, NULL, NULL, NULL),
(124, 43, '498301671453145.jpeg', 1, NULL, NULL, NULL, NULL),
(125, 44, '20461671453264.jpg', 1, NULL, NULL, NULL, NULL),
(126, 45, '302571671453621.jpg', 1, NULL, NULL, NULL, NULL),
(127, 46, '707101671453970.jpg', 1, NULL, NULL, NULL, NULL),
(128, 47, '552221671454507.jpg', 1, NULL, NULL, NULL, NULL),
(129, 38, '632441671455017.jpg', 1, NULL, NULL, NULL, NULL),
(130, 38, '307871671455018.jpg', 2, NULL, NULL, NULL, NULL),
(131, 48, '437111672234160.jpeg', 1, NULL, NULL, NULL, NULL),
(132, 48, '246501672234160.jpg', 2, NULL, NULL, NULL, NULL);

--
-- Triggers `prd_img_library`
--
DELIMITER $$
CREATE TRIGGER `before_prd_img_library_insert` BEFORE INSERT ON `prd_img_library` FOR EACH ROW begin 
    declare var_serial_no int(2) default 0; 

        if new.serial_no is null then 

                select ifnull(max(serial_no),0) into var_serial_no 
                        from prd_img_library 
                        where f_prd_master_no = new.f_prd_master_no; 
                        set new.serial_no = var_serial_no+1; 
                
        end if; 

    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prd_like_count`
--

CREATE TABLE `prd_like_count` (
  `pk_no` int(10) NOT NULL,
  `prd_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `counter` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prd_like_count`
--

INSERT INTO `prd_like_count` (`pk_no`, `prd_id`, `customer_id`, `counter`) VALUES
(1, 15, 26, 1),
(2, 1, 26, 1),
(3, 4, 18, 1),
(4, 10, 26, 1),
(5, 20, 25, 1),
(6, 24, 17, 1),
(7, 25, 17, 0),
(8, 26, 42, 1),
(9, 28, 51, 1),
(10, 38, 51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prd_master`
--

CREATE TABLE `prd_master` (
  `pk_no` int(11) NOT NULL,
  `ad_type` varchar(10) DEFAULT NULL COMMENT 'sell, buy',
  `area_id` int(10) DEFAULT NULL,
  `city_division` varchar(20) DEFAULT NULL,
  `city_division_pk_no` int(2) DEFAULT NULL,
  `area_url_slug` varchar(40) DEFAULT NULL,
  `city_division_url_slug` varchar(40) DEFAULT NULL,
  `customer_pk_no` bigint(20) DEFAULT NULL,
  `main_category` varchar(20) DEFAULT NULL,
  `f_cat_pk_no` int(10) DEFAULT NULL,
  `cat_url_slug` varchar(40) DEFAULT NULL,
  `f_scat_pk_no` int(11) DEFAULT NULL,
  `scat_url_slug` varchar(40) DEFAULT NULL,
  `code` int(10) DEFAULT 0,
  `ad_title` varchar(100) DEFAULT NULL,
  `url_slug` varchar(100) DEFAULT NULL,
  `f_brand` int(11) DEFAULT NULL,
  `brand_name` varchar(20) DEFAULT NULL,
  `f_model` int(11) DEFAULT NULL,
  `model_name` varchar(20) DEFAULT NULL,
  `prod_feature` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `price_unit` varchar(124) DEFAULT NULL COMMENT 'like ''total price'' or per sqft''',
  `is_negotiable` tinyint(4) DEFAULT 0,
  `price_to` float DEFAULT NULL,
  `vacanci` int(11) DEFAULT NULL,
  `business_function` varchar(124) DEFAULT NULL,
  `deadline` date DEFAULT NULL COMMENT 'job application deadline',
  `company_name` varchar(100) DEFAULT NULL COMMENT 'company name / employer name',
  `logo` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `edition` varchar(100) DEFAULT NULL,
  `authenticity` varchar(50) DEFAULT NULL,
  `using_condition` varchar(20) DEFAULT NULL COMMENT 'used, new',
  `prod_type` varchar(124) DEFAULT NULL COMMENT 'come from prd_type table ',
  `mobile1` varchar(20) DEFAULT NULL,
  `mobile2` varchar(20) DEFAULT NULL,
  `is_hide_mobile1` tinyint(4) DEFAULT 0,
  `is_hide_mobile2` tinyint(4) DEFAULT 0,
  `model_year` int(4) DEFAULT NULL COMMENT 'Car model year',
  `registration_year` int(4) DEFAULT NULL COMMENT 'for car category',
  `transmission` varchar(55) DEFAULT NULL COMMENT 'for car category ',
  `address` varchar(124) DEFAULT NULL,
  `body_type` varchar(55) DEFAULT NULL COMMENT 'for car category ',
  `fuel_type` varchar(55) DEFAULT NULL,
  `engine_capacity` int(2) DEFAULT NULL COMMENT 'For car category ',
  `kilometers_run` int(10) DEFAULT NULL COMMENT 'for car category ',
  `bed_no` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `bath_no` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `land_size` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `land_unit` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `house_size` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `house_unit` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `property_address` varchar(512) DEFAULT NULL COMMENT 'for property category',
  `flat_size` varchar(124) DEFAULT NULL COMMENT 'for property category',
  `gender` varchar(24) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `is_terms_condition` tinyint(4) NOT NULL DEFAULT 0,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 0 COMMENT 'is_active  0=pending,  1=Active,  2= Expired,  3= Draft',
  `approved_by` int(2) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_view` int(10) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_by` int(10) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `promotion` varchar(20) DEFAULT 'Basic' COMMENT 'Basic, Top, Urgent, Feature',
  `promotion_to` date DEFAULT NULL,
  `thumb` varchar(55) DEFAULT NULL,
  `search_key` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_master`
--

INSERT INTO `prd_master` (`pk_no`, `ad_type`, `area_id`, `city_division`, `city_division_pk_no`, `area_url_slug`, `city_division_url_slug`, `customer_pk_no`, `main_category`, `f_cat_pk_no`, `cat_url_slug`, `f_scat_pk_no`, `scat_url_slug`, `code`, `ad_title`, `url_slug`, `f_brand`, `brand_name`, `f_model`, `model_name`, `prod_feature`, `price`, `price_unit`, `is_negotiable`, `price_to`, `vacanci`, `business_function`, `deadline`, `company_name`, `logo`, `description`, `edition`, `authenticity`, `using_condition`, `prod_type`, `mobile1`, `mobile2`, `is_hide_mobile1`, `is_hide_mobile2`, `model_year`, `registration_year`, `transmission`, `address`, `body_type`, `fuel_type`, `engine_capacity`, `kilometers_run`, `bed_no`, `bath_no`, `land_size`, `land_unit`, `house_size`, `house_unit`, `property_address`, `flat_size`, `gender`, `user_name`, `is_terms_condition`, `comments`, `is_active`, `approved_by`, `approved_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `total_view`, `is_delete`, `deleted_by`, `deleted_at`, `promotion`, `promotion_to`, `thumb`, `search_key`) VALUES
(29, 'sell', 2, 'city', 1, 'nugegoda', 'colombo', 46, 'general', 1, 'cars-vehicles', 13, 'cars--buses', 104, 'BMW Blue Coupe', 'bmw-blue-coupe', 20, 'BMW', 2, 'Other model', NULL, 286532, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BMW 2 Series Gran Coupe is available in Misano Blue Metallic. BMW 2 Series Gran Coupe is also available in 5 colours, namely, Apine White Non Metallic, Black Sapphire Metallic, Melbourne Red Metallic, Snapper Rocks Blue Metallic, Storm Bay.', 'BMW 2 SERIES COUPE 2018', 'original', 'new', NULL, '94743488449', NULL, 0, 0, 2018, 2018, 'Manual', 'Colombo', 'Estate', 'Diseel, Petrol', 3200, 48000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mubarak Hossain', 0, NULL, 1, 1, '2022-12-19 16:32:08', NULL, '2022-12-13 17:38:37', NULL, '2022-12-24 16:12:08', 12, 0, NULL, NULL, 'Basic', NULL, '7051671447399.jpg', 'nugegoda colombo general cars--buses BMW Blue Coupe BMW Other model286532 new94743488449ColomboBMW 2 Series Gran Coupe is available in Misano Blue Metallic. BMW 2 Series Gran Coupe is also available in 5 colours, namely, Apine White Non Metallic, Black Sapphire Metallic, Melbourne Red Metallic, Snapper Rocks Blue Metallic, Storm Bay.'),
(30, 'sell', 2, 'city', 1, 'nugegoda', 'colombo', 46, 'general', 2, 'electronics-gedgets', 113, 'tablets-accessories', 105, 'Acer Laptop', 'acer-laptop', NULL, NULL, NULL, NULL, NULL, 23645, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Acer Aspire is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i7 processor and it comes with 8GB of RAM. The Acer Aspire packs 1TB of HDD storage.\r\n\r\nGraphics are powered by Intel HD Graphics 620. Connectivity options include Wi-Fi 802.11 ac and it comes with 3 USB ports (2 x USB 2.0, 1 x USB 3.0), HDMI Port, Multi Card Slot, Headphone and Mic Combo Jack, RJ45 (LAN) ports.\r\n\r\nAs of 13th December 2022, Acer Aspire price in India starts at Rs. 79,979', NULL, 'original', 'new', NULL, '94743488449', NULL, 0, 0, NULL, NULL, NULL, 'Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mubarak Hossain', 0, NULL, 1, 1, '2022-12-19 16:32:18', NULL, '2022-12-13 17:45:43', NULL, '2022-12-28 19:05:59', 12, 0, NULL, NULL, 'Basic', NULL, '69421671447426.jpg', 'nugegoda colombo general tablets-accessories Acer Laptop  23645 new94743488449ColomboAcer Aspire is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i7 processor and it comes with 8GB of RAM. The Acer Aspire packs 1TB of HDD storage.\r\n\r\nGraphics are powered by Intel HD Graphics 620. Connectivity options include Wi-Fi 802.11 ac and it comes with 3 USB ports (2 x USB 2.0, 1 x USB 3.0), HDMI Port, Multi Card Slot, Headphone and Mic Combo Jack, RJ45 (LAN) ports.\r\n\r\nAs of 13th December 2022, Acer Aspire price in India starts at Rs. 79,979'),
(31, 'sell', 2, 'city', 1, 'nugegoda', 'colombo', 46, 'general', 5, 'fashion-beauty', 183, 'clothing', 106, 'Polo T-Shirt', 'polo-t-shirt', NULL, NULL, NULL, NULL, NULL, 1250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Material : 100% Cotton Single Jersey( Weight : 220-240 gsm ), Pique( Weight : 180-220 gsm )\r\nSize : S-2XL\r\nQuantity : 1000-2000 Pcs / style\r\nDelivery Destination : Marseille Port & Le Havre port, France, Barcelona Port Spain, Montreal port, Canada\r\nPayment Mode : D/P, D/A, L/C\r\nImport Market : India( Tirupur )', NULL, 'original', 'new', NULL, '94743488449', NULL, 0, 0, NULL, NULL, NULL, 'Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mubarak Hossain', 0, NULL, 1, 1, '2022-12-19 16:32:23', NULL, '2022-12-13 17:48:11', NULL, '2022-12-19 18:49:10', 10, 1, NULL, NULL, 'Basic', NULL, '684401671447456.jpg', 'nugegoda colombo general clothing Polo T-Shirt  1250 new94743488449ColomboMaterial : 100% Cotton Single Jersey( Weight : 220-240 gsm ), Pique( Weight : 180-220 gsm )\r\nSize : S-2XL\r\nQuantity : 1000-2000 Pcs / style\r\nDelivery Destination : Marseille Port & Le Havre port, France, Barcelona Port Spain, Montreal port, Canada\r\nPayment Mode : D/P, D/A, L/C\r\nImport Market : India( Tirupur )'),
(32, 'sell', 2, 'city', 1, 'nugegoda', 'colombo', 46, 'general', 4, 'sports-responsive', 36, 'sports', 107, 'Premium Football 2022', 'premium-football-2022', NULL, NULL, NULL, NULL, NULL, 1850, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '1. Qualities and Measurements\r\n\r\nAll balls must be:\r\n\r\nspherical\r\nmade of suitable material\r\nof a circumference of between 68 cm (27 ins) and 70 cm (28 ins)\r\nbetween 410 g (14 oz) and 450 g (16 oz) in weight at the start of the match\r\nof a pressure equal to 0.6 – 1.1 atmosphere (600 – 1,100g/cm2) at sea level (8.5 lbs/sq in – 15.6 lbs/sq in)\r\nAll balls used in matches played in an official competition organised under the auspices of FIFA or confederations must meet the requirements and bear one\r\nof the marks of the FIFA Quality Programme for Footballs.\r\n\r\nEach mark indicates that it has been officially tested and meets the specific technical requirements for that mark which are additional to the minimum specifications stipulated in Law 2 and must be approved by The IFAB.\r\n\r\nNational FA competitions may require the use of balls bearing one of these marks.\r\n\r\nIn matches played in an official competition organised under the auspices of FIFA, confederations or national football associations, no form of commercial advertising is permitted on the ball, except for the logo/emblem of the competition, the competition organiser and the authorised manufacturer’s trademark. The competition regulations may restrict the size and number of such markings.\r\n\r\n2. Replacement of a defective ball\r\n\r\nIf the ball becomes defective:\r\n\r\nplay is stopped and\r\nrestarted with a dropped ball\r\nIf the ball becomes defective at a kick-off, goal kick, corner kick, free kick, penalty kick or throw-in, the restart is re-taken.\r\n\r\nIf the ball becomes defective during a penalty kick or kicks from the penalty mark as it moves forward and before it touches a player, crossbar or goalposts the penalty kick is retaken.\r\n\r\nThe ball may not be changed during the match without the referee’s permission.\r\n\r\n3. Additional Balls\r\n\r\nAdditional balls which meet the requirements of Law 2 may be placed around the field of play and their use is under the referee’s control.', NULL, 'original', 'new', '214', '94743488449', NULL, 0, 0, NULL, NULL, NULL, 'Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mubarak Hossain', 0, NULL, 1, 1, '2022-12-19 16:32:28', NULL, '2022-12-13 17:53:33', NULL, '2022-12-20 14:24:41', 21, 0, NULL, NULL, 'Basic', NULL, '434261671447484.jpg', 'nugegoda colombo general sports Premium Football 2022  1850 new94743488449Colombo1. Qualities and Measurements\r\n\r\nAll balls must be:\r\n\r\nspherical\r\nmade of suitable material\r\nof a circumference of between 68 cm (27 ins) and 70 cm (28 ins)\r\nbetween 410 g (14 oz) and 450 g (16 oz) in weight at the start of the match\r\nof a pressure equal to 0.6 – 1.1 atmosphere (600 – 1,100g/cm2) at sea level (8.5 lbs/sq in – 15.6 lbs/sq in)\r\nAll balls used in matches played in an official competition organised under the auspices of FIFA or confederations must meet the requirements and bear one\r\nof the marks of the FIFA Quality Programme for Footballs.\r\n\r\nEach mark indicates that it has been officially tested and meets the specific technical requirements for that mark which are additional to the minimum specifications stipulated in Law 2 and must be approved by The IFAB.\r\n\r\nNational FA competitions may require the use of balls bearing one of these marks.\r\n\r\nIn matches played in an official competition organised under the auspices of FIFA, confederations or national football associations, no form of commercial advertising is permitted on the ball, except for the logo/emblem of the competition, the competition organiser and the authorised manufacturer’s trademark. The competition regulations may restrict the size and number of such markings.\r\n\r\n2. Replacement of a defective ball\r\n\r\nIf the ball becomes defective:\r\n\r\nplay is stopped and\r\nrestarted with a dropped ball\r\nIf the ball becomes defective at a kick-off, goal kick, corner kick, free kick, penalty kick or throw-in, the restart is re-taken.\r\n\r\nIf the ball becomes defective during a penalty kick or kicks from the penalty mark as it moves forward and before it touches a player, crossbar or goalposts the penalty kick is retaken.\r\n\r\nThe ball may not be changed during the match without the referee’s permission.\r\n\r\n3. Additional Balls\r\n\r\nAdditional balls which meet the requirements of Law 2 may be placed around the field of play and their use is under the referee’s control.'),
(34, 'jobs', 82, 'city', 2, 'katugastota', 'kandy', 48, 'jobs', 7, 'jobs', 57, 'it-telecom', 108, 'Laravel Developer need for arjent', 'laravel-developer-need-for-arjent', NULL, NULL, NULL, NULL, NULL, 23423, NULL, NULL, 43242, NULL, NULL, NULL, 'Arobil', NULL, 'Do not post ads contpackage deal.\r\nDo not post the same ad more than once or repost an ad within 48 hours.\r\nDo not upload pictures with watermarks and title or description.\r\nDo not put your email or phone numbers in the', NULL, NULL, NULL, NULL, '94776628443', NULL, 0, 0, NULL, NULL, NULL, 'New Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masud Rana Tapu', 0, NULL, 2, 1, '2022-12-19 16:52:41', NULL, '2022-12-15 13:54:15', NULL, '2022-12-19 16:50:47', 6, 0, NULL, NULL, 'Urgent', '2022-12-30', NULL, 'katugastota kandy jobs it-telecom Laravel Developer need for arjent  23423Arobil94776628443New ColomboDo not post ads contpackage deal.\r\nDo not post the same ad more than once or repost an ad within 48 hours.\r\nDo not upload pictures with watermarks and title or description.\r\nDo not put your email or phone numbers in the'),
(35, 'rent', 81, 'city', 2, 'gampola', 'kandy', 48, 'property', 3, 'property', 152, 'house-for-rentals', 109, 'Couple House', 'couple-house', NULL, NULL, NULL, NULL, NULL, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Do not upload pictures with watermarks.\r\nDo not post ads containing multiple items unless it\'s a package deal.\r\nDo not put your email or phone numbers in the title or description.\r\nMake sure you post in the correct category.\r\nDo not post ads contpackage deal.', NULL, 'original', 'new', NULL, '94776628443', NULL, 0, 0, NULL, NULL, NULL, 'New Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Masud Rana Tapu', 0, NULL, 1, NULL, NULL, NULL, '2022-12-15 13:56:34', NULL, '2022-12-24 13:50:25', 14, 0, NULL, NULL, 'Feature', '2022-12-30', '54731671092794.jpg', 'gampola kandy property house-for-rentals Couple House  2023 new94776628443New ColomboDo not upload pictures with watermarks.\r\nDo not post ads containing multiple items unless it\'s a package deal.\r\nDo not put your email or phone numbers in the title or description.\r\nMake sure you post in the correct category.\r\nDo not post ads contpackage deal.'),
(36, 'sell', 218, 'city', 1, 'maharagama', 'colombo', 50, 'general', 8, 'home-appliances', 120, 'refrigerators-freezers', 110, 'Walton  Refrigerators', 'walton-refrigerators', NULL, NULL, NULL, NULL, NULL, 45554, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'MEASURING REFRIGERATOR DEPTH\r\nWhen measuring for a refrigerator, you’ll want to decide what depth style you’d prefer.\r\n\r\nStandard-Depth: Measure from your wall with a little room to extend past your cabinets.\r\n\r\nCounter-Depth: Measure from your wall to the edge of your counter. Learn about counter-depth refrigerators. \r\n\r\nDOES YOUR KITCHEN HAVE AN ISLAND?\r\nMeasure the space in front of the refrigerator so doors and drawers can open without getting dinged.\r\n\r\nMeasure: \r\nDepth with drawer open\r\nDepth with doors open\r\nNot including handles\r\nIncluding handles', NULL, 'original', 'new', NULL, '94743488449', NULL, 0, 0, NULL, NULL, NULL, 'Kandy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mubarak', 0, NULL, 0, 1, '2022-12-15 16:27:47', NULL, '2022-12-15 16:21:58', NULL, '2022-12-19 16:33:49', 3, 0, NULL, NULL, 'Basic', NULL, NULL, 'maharagama colombo general refrigerators-freezers Walton  Refrigerators  45554 new94743488449KandyMEASURING REFRIGERATOR DEPTH\r\nWhen measuring for a refrigerator, you’ll want to decide what depth style you’d prefer.\r\n\r\nStandard-Depth: Measure from your wall with a little room to extend past your cabinets.\r\n\r\nCounter-Depth: Measure from your wall to the edge of your counter. Learn about counter-depth refrigerators. \r\n\r\nDOES YOUR KITCHEN HAVE AN ISLAND?\r\nMeasure the space in front of the refrigerator so doors and drawers can open without getting dinged.\r\n\r\nMeasure: \r\nDepth with drawer open\r\nDepth with doors open\r\nNot including handles\r\nIncluding handles'),
(37, 'sell', 15, 'city', 1, 'dehiwala', 'colombo', 46, 'general', 5, 'fashion-beauty', 186, 'sunglasses-opticians', 111, 'Premium Sunglass', 'premium-sunglass', NULL, NULL, NULL, NULL, NULL, 4562, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Semi-Rimless Frame\r\nRectangular Shape\r\nSingle Bridge\r\nGrey Plastic Lenses\r\nMatte Black Finish', NULL, 'original', 'new', NULL, '94743488449', NULL, 0, 0, NULL, NULL, NULL, 'Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mubarak Hossain', 0, NULL, 1, 1, '2022-12-19 16:32:32', NULL, '2022-12-15 16:55:50', NULL, '2022-12-19 16:31:13', 4, 0, NULL, NULL, 'Basic', NULL, '992161671447673.jpg', 'dehiwala colombo general sunglasses-opticians Premium Sunglass  4562 new94743488449ColomboSemi-Rimless Frame\r\nRectangular Shape\r\nSingle Bridge\r\nGrey Plastic Lenses\r\nMatte Black Finish'),
(38, 'sell', 80, 'city', 2, 'kandy-city', 'kandy', 51, 'general', 2, 'electronics-gedgets', 168, 'mobile-phone-accessories', 112, 'Dell core-i5 6th Gen 8GB DDR4 Ram', 'dell-core-i5-6th-gen-8gb-ddr4-ram', NULL, NULL, NULL, NULL, NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:33:58', NULL, '2022-12-15 19:31:49', NULL, '2022-12-24 13:33:08', 20, 0, NULL, NULL, 'Basic', NULL, '632441671455017.jpg', 'kandy-city kandy general mobile-phone-accessories Dell core-i5 6th Gen 8GB DDR4 Ram  250 new94776628446colomboLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(39, 'sell', 119, 'city', 3, 'galle-city', 'galle', 51, 'general', 2, 'electronics-gedgets', 110, 'desktop-computers', 113, 'Transcent 8gb DDR4 ram,Corei5 6th Gen,22', 'transcent-8gb-ddr4-ram-corei5-6th-gen-22', NULL, NULL, NULL, NULL, NULL, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vai ami 100% Orginal Photo Upload Koresi Amr nijer Table Er uporer photo 100% Gaming Computer khub heavy kore build kora hoise.\r\n\r\n*gaming Casing Onk Sundor valo maner 4 Set RGB Light Soho.\r\n\r\n*Gaming Powersupply khub Valo 550 Watt 2500 taka dami.\r\n\r\n*Gaming Motherboard onk valo maner HDMi & USB3 Soho.\r\n\r\n*Corei5 6th Generation proscessor Orginal  intel.', NULL, 'original', 'new', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Galle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 15:39:45', NULL, '2022-12-19 13:19:47', NULL, '2022-12-24 13:51:41', 3, 0, NULL, NULL, 'Basic', NULL, '770841671444426.jpg', 'galle-city galle general desktop-computers Transcent 8gb DDR4 ram,Corei5 6th Gen,22  500 new94776628446GalleVai ami 100% Orginal Photo Upload Koresi Amr nijer Table Er uporer photo 100% Gaming Computer khub heavy kore build kora hoise.\r\n\r\n*gaming Casing Onk Sundor valo maner 4 Set RGB Light Soho.\r\n\r\n*Gaming Powersupply khub Valo 550 Watt 2500 taka dami.\r\n\r\n*Gaming Motherboard onk valo maner HDMi & USB3 Soho.\r\n\r\n*Corei5 6th Generation proscessor Orginal  intel.'),
(40, 'sell', 2, 'city', 1, 'nugegoda', 'colombo', 51, 'general', 2, 'electronics-gedgets', 29, 'tv-video-accessories', 114, 'Samsung AU8100 55\'\' 4K Crystal UHD Smart TV', 'samsung-au8100-55-4k-crystal-uhd-smart-tv', NULL, 'Samsung', NULL, NULL, NULL, 68000, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Screen Size	55 Inch\r\n\r\nPanel	Flat\r\n\r\nResolution	4K, 3840 x 2160p\r\n\r\nTechnology	LED Smart\r\n\r\n3D Technology	2D\r\n\r\nResponse Time	5MS\r\n\r\nRefresh Rate	Auto Motion Plus\r\n\r\nContrast	HDR10, HDR10+, Hybrid Log Gamma, Mega Contrast\r\n\r\nBrightness	High Dynamic Range\r\n\r\nTV Tuner	Digital / Analog\r\n\r\nSound	20 Watt Sound Output, Dolby Digital Plus Dolby Atmos\r\n\r\nConnectivity	2 x USB / 3 x HDMI / Wi-Fi 5.0 / Bluetooth 5.2V / LAN / Anynet+\r\n\r\nRemote	Voice Remote Control\r\n\r\nOperating System	Android\r\n\r\nDimension	1612 x 950 x 164 mm Package Size\r\n\r\nOther Features	Web Browse, Smart TV Screen Mirroring, Wi-Fi Direct ARC Support\r\n\r\nSamsung UA55AU8100UXTW Description\r\n\r\nThe Samsung AU8100 4K UHD TV has 4X more pixels quality than a standard Full HD screen. It provides bright and sharp images. You will see more genuine color emotions because of its superior color imaging algorithms. Now you have the opportunity to enjoy the realistic vision and fluid performance because of its intelligence functionality that analyses and adjusts frames from the video\'s beginning.', NULL, 'original', 'new', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Nugegoda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 17:52:09', NULL, '2022-12-19 17:50:23', NULL, '2022-12-19 17:52:45', 1, 0, NULL, NULL, 'Basic', NULL, '267941671452423.jpg', 'nugegoda colombo general tv-video-accessories Samsung AU8100 55\'\' 4K Crystal UHD Smart TV Samsung 68000 new94776628446NugegodaScreen Size	55 Inch\r\n\r\nPanel	Flat\r\n\r\nResolution	4K, 3840 x 2160p\r\n\r\nTechnology	LED Smart\r\n\r\n3D Technology	2D\r\n\r\nResponse Time	5MS\r\n\r\nRefresh Rate	Auto Motion Plus\r\n\r\nContrast	HDR10, HDR10+, Hybrid Log Gamma, Mega Contrast\r\n\r\nBrightness	High Dynamic Range\r\n\r\nTV Tuner	Digital / Analog\r\n\r\nSound	20 Watt Sound Output, Dolby Digital Plus Dolby Atmos\r\n\r\nConnectivity	2 x USB / 3 x HDMI / Wi-Fi 5.0 / Bluetooth 5.2V / LAN / Anynet+\r\n\r\nRemote	Voice Remote Control\r\n\r\nOperating System	Android\r\n\r\nDimension	1612 x 950 x 164 mm Package Size\r\n\r\nOther Features	Web Browse, Smart TV Screen Mirroring, Wi-Fi Direct ARC Support\r\n\r\nSamsung UA55AU8100UXTW Description\r\n\r\nThe Samsung AU8100 4K UHD TV has 4X more pixels quality than a standard Full HD screen. It provides bright and sharp images. You will see more genuine color emotions because of its superior color imaging algorithms. Now you have the opportunity to enjoy the realistic vision and fluid performance because of its intelligence functionality that analyses and adjusts frames from the video\'s beginning.'),
(41, 'sell', 80, 'city', 2, 'kandy-city', 'kandy', 51, 'general', 2, 'electronics-gedgets', 169, 'electronic-home-appliances', 115, '30KVA china Ricardo Electric Soundproof Power Generator', '30kva-china-ricardo-electric-soundproof-power-generator', NULL, 'Other', NULL, NULL, NULL, 240000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Corporate Office: House-06, Road-3/B, Sector-09, Uttara, Dhaka-1230, Bangladesh\r\n\r\nBranch Office: Khulna, Bogra, Rajshahi, Pabna, Sirajganj, Maymonshing, Foridpur, Shatkhira. Jamalpur.\r\n\r\nAvailable stock: Perkins, Cummins,Ricardo, Duetz (5KVA to 500KVA)\r\n\r\nEngine: Ricardo\r\n\r\nTECHNICAL SPECIFICATION FOR 30KVA/24 KW DG SET\r\n\r\n1). Generator Set Details:\r\n\r\n-------------------------------------\r\n\r\nEngine Brand : Ricardo, China\r\n\r\nAlternator Brand : Copy Stamford, China\r\n\r\nPrime Capacity : 30kVA / 24kW\r\n\r\nCooling System : Water Cooled\r\n\r\n2) Engine Details:\r\n\r\n-----------------------------\r\n\r\nEngine Brand : Ricardo, China\r\n\r\nType : Turbo Charged & Charge Cooled\r\n\r\nCycle : 4- Stroke, compression ignition\r\n\r\nCompression ratio : 16:1 nominal\r\n\r\nEngine Speed : 1500RPM\r\n\r\nGovernor : Mechanical\r\n\r\n3) Alternator Details:\r\n\r\n-------------------------------\r\n\r\nAlternator Brand :Copy Stamford, China\r\n\r\nType : Brushless, Self Exited, AVR controlled\r\n\r\nRated Voltage : 400V / 230V\r\n\r\nRated Frequency : 50Hz\r\n\r\nPhase : 3 (Three)\r\n\r\nInsulation Class : H\r\n\r\nCircuit Breaker : 3 (Three Pole)\r\n\r\nControl Panel : Smart Zen Electronics, China.\r\n\r\nGENERATORS ARE READY STOCK IN OUR WAREHOUSE.\r\n\r\nContact Person:\r\n\r\nEngr. Md. Zahid Hossain\r\n\r\nPS Engineering Ltd\r\n\r\nWebsite: www.psengltd.com\r\n\r\nHouse-06, Road-3/B, Sector-09, Uttara, Dhaka-1230, Bangladesh', NULL, 'original', 'used', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Kandy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:26:13', NULL, '2022-12-19 17:55:12', NULL, '2022-12-19 20:22:18', 3, 0, NULL, NULL, 'Basic', NULL, '455081671452712.jpg', 'kandy-city kandy general electronic-home-appliances 30KVA china Ricardo Electric Soundproof Power Generator Other 240000 used94776628446KandyCorporate Office: House-06, Road-3/B, Sector-09, Uttara, Dhaka-1230, Bangladesh\r\n\r\nBranch Office: Khulna, Bogra, Rajshahi, Pabna, Sirajganj, Maymonshing, Foridpur, Shatkhira. Jamalpur.\r\n\r\nAvailable stock: Perkins, Cummins,Ricardo, Duetz (5KVA to 500KVA)\r\n\r\nEngine: Ricardo\r\n\r\nTECHNICAL SPECIFICATION FOR 30KVA/24 KW DG SET\r\n\r\n1). Generator Set Details:\r\n\r\n-------------------------------------\r\n\r\nEngine Brand : Ricardo, China\r\n\r\nAlternator Brand : Copy Stamford, China\r\n\r\nPrime Capacity : 30kVA / 24kW\r\n\r\nCooling System : Water Cooled\r\n\r\n2) Engine Details:\r\n\r\n-----------------------------\r\n\r\nEngine Brand : Ricardo, China\r\n\r\nType : Turbo Charged & Charge Cooled\r\n\r\nCycle : 4- Stroke, compression ignition\r\n\r\nCompression ratio : 16:1 nominal\r\n\r\nEngine Speed : 1500RPM\r\n\r\nGovernor : Mechanical\r\n\r\n3) Alternator Details:\r\n\r\n-------------------------------\r\n\r\nAlternator Brand :Copy Stamford, China\r\n\r\nType : Brushless, Self Exited, AVR controlled\r\n\r\nRated Voltage : 400V / 230V\r\n\r\nRated Frequency : 50Hz\r\n\r\nPhase : 3 (Three)\r\n\r\nInsulation Class : H\r\n\r\nCircuit Breaker : 3 (Three Pole)\r\n\r\nControl Panel : Smart Zen Electronics, China.\r\n\r\nGENERATORS ARE READY STOCK IN OUR WAREHOUSE.\r\n\r\nContact Person:\r\n\r\nEngr. Md. Zahid Hossain\r\n\r\nPS Engineering Ltd\r\n\r\nWebsite: www.psengltd.com\r\n\r\nHouse-06, Road-3/B, Sector-09, Uttara, Dhaka-1230, Bangladesh'),
(42, 'sell', 218, 'city', 1, 'maharagama', 'colombo', 51, 'general', 2, 'electronics-gedgets', 171, 'cameras-camcorders', 116, 'Nikon D7000 with Lens ( Full box)', 'nikon-d7000-with-lens-full-box', NULL, 'Nikon', NULL, NULL, NULL, 18000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nikon D7000 professional dslr camera with 18-55mm lens, battery, charger, Lens hood, lens uv filter, strap, bag, Box. \r\n\r\nWith 18-55mm lens only 18k\r\n\r\nWith 50mm 1.8D prime lens 20k. Fixed price.', NULL, 'original', 'used', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'maharagam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:26:31', NULL, '2022-12-19 17:59:46', NULL, '2022-12-24 16:13:00', 2, 0, NULL, NULL, 'Basic', NULL, '499741671452986.jpg', 'maharagama colombo general cameras-camcorders Nikon D7000 with Lens ( Full box) Nikon 18000 used94776628446maharagamNikon D7000 professional dslr camera with 18-55mm lens, battery, charger, Lens hood, lens uv filter, strap, bag, Box. \r\n\r\nWith 18-55mm lens only 18k\r\n\r\nWith 50mm 1.8D prime lens 20k. Fixed price.'),
(43, 'sell', 172, 'city', 4, 'ampara-city', 'ampara', 51, 'general', 2, 'electronics-gedgets', 166, 'computer-accessories', 117, 'GIGABYTE GTX 1650 OC 4GB LP GRAPHICS CARD NVIDIA GEFORCE', 'gigabyte-gtx-1650-oc-4gb-lp-graphics-card-nvidia-geforce', NULL, 'GigaByte', NULL, NULL, NULL, 21000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Brand : Gigabyte\r\n\r\nChipset : NVIDIA GeForce\r\n\r\nChipset Model : GeForce GTX 1650\r\n\r\nModel : Gigabyte GeForce GTX 1650 OC Low Profile 4G\r\n\r\nTechnical Information\r\n\r\nCUDA Core / Stream Processors : 896 (CUDA)\r\n\r\nBase Engine Clock Speed : 1695 MHz\r\n\r\nMemory Clock : 8002 MHz\r\n\r\nCapacity (GB/TB) : 4GB\r\n\r\nMemory Bus : 128 bit\r\n\r\nMemory Bandwidth : 128 GB/s\r\n\r\nMemory Type : GDDR5\r\n\r\nInterface(s) : PCI-E 3.0 x 16\r\n\r\nDirectX Support : 12\r\n\r\nOpenGL Support : 4.6\r\n\r\nDisplay & Resolution\r\n\r\nGraphics Resolution Max. : 7680 x 432\r\n\r\nMulti Display Capability : Triple Display\r\n\r\nPorts\r\n\r\nDVI Port\r\n\r\n1\r\n\r\nHDMI Port\r\n\r\n1\r\n\r\nDisplay Port\r\n\r\n1\r\n\r\nPower\r\n\r\nPower Consumption : 85W\r\n\r\nRecommended PSU : 300W\r\n\r\nCountry Of Origin : Taiwan\r\n\r\n______________________________________\r\n\r\nNeed Urgent money so I\'m selling my PC\r\n\r\nI bought it August 2022\r\n\r\nYou can see the date in cash memo\r\n\r\nIt has official warranty \r\n\r\nI bought it from Ryans Computer Uttara.\r\n\r\nI\'m also selling my Motherboard\r\n\r\nMotherboard model : MSI x470 Gaming Max RGB\r\n\r\nIf you\'re interested in motherboard or Graphics card \r\n\r\nyou can call or text me anytime.\r\n\r\nThank you.', NULL, 'original', 'new', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Ampara City', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:26:50', NULL, '2022-12-19 18:02:25', NULL, '2022-12-19 18:02:25', 0, 0, NULL, NULL, 'Basic', NULL, '498301671453145.jpeg', 'ampara-city ampara general computer-accessories GIGABYTE GTX 1650 OC 4GB LP GRAPHICS CARD NVIDIA GEFORCE GigaByte 21000 new94776628446Ampara CityBrand : Gigabyte\r\n\r\nChipset : NVIDIA GeForce\r\n\r\nChipset Model : GeForce GTX 1650\r\n\r\nModel : Gigabyte GeForce GTX 1650 OC Low Profile 4G\r\n\r\nTechnical Information\r\n\r\nCUDA Core / Stream Processors : 896 (CUDA)\r\n\r\nBase Engine Clock Speed : 1695 MHz\r\n\r\nMemory Clock : 8002 MHz\r\n\r\nCapacity (GB/TB) : 4GB\r\n\r\nMemory Bus : 128 bit\r\n\r\nMemory Bandwidth : 128 GB/s\r\n\r\nMemory Type : GDDR5\r\n\r\nInterface(s) : PCI-E 3.0 x 16\r\n\r\nDirectX Support : 12\r\n\r\nOpenGL Support : 4.6\r\n\r\nDisplay & Resolution\r\n\r\nGraphics Resolution Max. : 7680 x 432\r\n\r\nMulti Display Capability : Triple Display\r\n\r\nPorts\r\n\r\nDVI Port\r\n\r\n1\r\n\r\nHDMI Port\r\n\r\n1\r\n\r\nDisplay Port\r\n\r\n1\r\n\r\nPower\r\n\r\nPower Consumption : 85W\r\n\r\nRecommended PSU : 300W\r\n\r\nCountry Of Origin : Taiwan\r\n\r\n______________________________________\r\n\r\nNeed Urgent money so I\'m selling my PC\r\n\r\nI bought it August 2022\r\n\r\nYou can see the date in cash memo\r\n\r\nIt has official warranty \r\n\r\nI bought it from Ryans Computer Uttara.\r\n\r\nI\'m also selling my Motherboard\r\n\r\nMotherboard model : MSI x470 Gaming Max RGB\r\n\r\nIf you\'re interested in motherboard or Graphics card \r\n\r\nyou can call or text me anytime.\r\n\r\nThank you.'),
(44, 'sell', 175, 'city', 7, 'badulla-city', 'badulla', 51, 'general', 2, 'electronics-gedgets', 168, 'mobile-phone-accessories', 118, 'Lenovo Wireless Magnetic Hanging Bluetooth He05', 'lenovo-wireless-magnetic-hanging-bluetooth-he05', NULL, 'Lenevo', NULL, NULL, NULL, 649, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Brand: Lenovo\r\n\r\nModel: HE05\r\n\r\nBT Version: 5.0\r\n\r\nPlay time: Max.8h\r\n\r\nStandby time: Max. 120h\r\n\r\nThe loudspeaker diameter: 10mm\r\n\r\nFrequency range: 20-20kHz\r\n\r\nThe connection distance: 10M(barrier free)\r\n\r\nSensitivity: 108db±3db\r\n\r\nPackage weight: 135g/4.76ounces\r\n\r\nPackage size: 220*165*31mm/8.66*6.49*1.18inches', NULL, 'original', 'new', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Badulla City', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:27:10', NULL, '2022-12-19 18:04:24', NULL, '2022-12-19 18:46:44', 2, 0, NULL, NULL, 'Basic', NULL, '20461671453264.jpg', 'badulla-city badulla general mobile-phone-accessories Lenovo Wireless Magnetic Hanging Bluetooth He05 Lenevo 649 new94776628446Badulla CityBrand: Lenovo\r\n\r\nModel: HE05\r\n\r\nBT Version: 5.0\r\n\r\nPlay time: Max.8h\r\n\r\nStandby time: Max. 120h\r\n\r\nThe loudspeaker diameter: 10mm\r\n\r\nFrequency range: 20-20kHz\r\n\r\nThe connection distance: 10M(barrier free)\r\n\r\nSensitivity: 108db±3db\r\n\r\nPackage weight: 135g/4.76ounces\r\n\r\nPackage size: 220*165*31mm/8.66*6.49*1.18inches'),
(45, 'sell', 218, 'city', 1, 'maharagama', 'colombo', 51, 'general', 2, 'electronics-gedgets', 110, 'desktop-computers', 119, 'Processor Intel Core i5-6400 with Monitor 19 Inch LED', 'processor-intel-core-i5-6400-with-monitor-19-inch-led', NULL, NULL, NULL, NULL, NULL, 17500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Price: 17,500\r\n\r\nProcessor Intel® Core i5-6400 2.70 GHz 	\r\n\r\nMotherboard Gigabyte H110M\r\n\r\nRAM DDR-4 8GB 2666 MHz\r\n\r\nSSD WD Green 120GB SATA\r\n\r\nCasing View One ATX Thermal\r\n\r\nPower Supply View One VB700W\r\n\r\nKeyboard & Mouse View One RGB\r\n\r\nMonitor 19 Inch LED China\r\n\r\n03 Year Limited Warranty', NULL, 'original', 'used', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Galle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:27:30', NULL, '2022-12-19 18:10:21', NULL, '2022-12-19 18:30:52', 2, 0, NULL, NULL, 'Basic', NULL, '302571671453621.jpg', 'maharagama colombo general desktop-computers Processor Intel Core i5-6400 with Monitor 19 Inch LED  17500 used94776628446GallePrice: 17,500\r\n\r\nProcessor Intel® Core i5-6400 2.70 GHz 	\r\n\r\nMotherboard Gigabyte H110M\r\n\r\nRAM DDR-4 8GB 2666 MHz\r\n\r\nSSD WD Green 120GB SATA\r\n\r\nCasing View One ATX Thermal\r\n\r\nPower Supply View One VB700W\r\n\r\nKeyboard & Mouse View One RGB\r\n\r\nMonitor 19 Inch LED China\r\n\r\n03 Year Limited Warranty'),
(46, 'sell', 80, 'city', 2, 'kandy-city', 'kandy', 51, 'general', 2, 'electronics-gedgets', 170, 'air-conditions-electrical-fittings', 120, 'Midea Energy Saving Wall Mounted Inverter 1.5 Ton AC', 'midea-energy-saving-wall-mounted-inverter-1-5-ton-ac', NULL, 'Midea', NULL, NULL, NULL, 31499, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MSI18CRN-AF5 Midea 60% Energy Saving Wall Mounted Inverter 1.5 Ton AC with 5 yrs compessor warranty price.\r\n\r\nCorporation (China)\r\n\r\nInverter 1.5 Ton Midea AC Energy savings\r\n\r\nMidea AC Energy Saving\r\n\r\nR410 eco friendly refrigerant\r\n\r\nProduct Feature:\r\n\r\nBrand: MIDEA\r\n\r\nAC Type: Split\r\n\r\nBTU: 18000 BTU Compressors\r\n\r\nCoverage: 150-180 sft\r\n\r\nFilter Type: Auto Clean\r\n\r\nBritish thermal unit Tested Product.\r\n\r\nCertified importer, Work Experience 37 years.\r\n\r\nHigh Power Saving Unit.\r\n\r\nEco-friendly product service.\r\n\r\nTurbo Mode Cooling.\r\n\r\nSome Features: Auto Restart,\r\n\r\nAnti bacterial filter, Washable filter,\r\n\r\nDouble Auto swing, White color indoor,\r\n\r\nfactory Gas, original compressor of Midea.\r\n\r\nMidea Air Conditioner Split AC / Air Conditioner Rated Capacity (BTUs) 1.5 Ton / 18000 BTU\r\n\r\nCorporate office:Capital Electronics\r\n\r\nCall us - (Whatsapp, Imo)\r\n\r\nAny Brand all size are Available', NULL, 'original', 'used', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Kandy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:27:49', NULL, '2022-12-19 18:16:10', NULL, '2022-12-24 13:32:34', 4, 0, NULL, NULL, 'Basic', NULL, '707101671453970.jpg', 'kandy-city kandy general air-conditions-electrical-fittings Midea Energy Saving Wall Mounted Inverter 1.5 Ton AC Midea 31499 used94776628446KandyMSI18CRN-AF5 Midea 60% Energy Saving Wall Mounted Inverter 1.5 Ton AC with 5 yrs compessor warranty price.\r\n\r\nCorporation (China)\r\n\r\nInverter 1.5 Ton Midea AC Energy savings\r\n\r\nMidea AC Energy Saving\r\n\r\nR410 eco friendly refrigerant\r\n\r\nProduct Feature:\r\n\r\nBrand: MIDEA\r\n\r\nAC Type: Split\r\n\r\nBTU: 18000 BTU Compressors\r\n\r\nCoverage: 150-180 sft\r\n\r\nFilter Type: Auto Clean\r\n\r\nBritish thermal unit Tested Product.\r\n\r\nCertified importer, Work Experience 37 years.\r\n\r\nHigh Power Saving Unit.\r\n\r\nEco-friendly product service.\r\n\r\nTurbo Mode Cooling.\r\n\r\nSome Features: Auto Restart,\r\n\r\nAnti bacterial filter, Washable filter,\r\n\r\nDouble Auto swing, White color indoor,\r\n\r\nfactory Gas, original compressor of Midea.\r\n\r\nMidea Air Conditioner Split AC / Air Conditioner Rated Capacity (BTUs) 1.5 Ton / 18000 BTU\r\n\r\nCorporate office:Capital Electronics\r\n\r\nCall us - (Whatsapp, Imo)\r\n\r\nAny Brand all size are Available'),
(47, 'sell', 119, 'city', 3, 'galle-city', 'galle', 51, 'general', 2, 'electronics-gedgets', 129, 'mobiles', 121, 'Apple iPhone 12 Pro', 'apple-iphone-12-pro', NULL, NULL, NULL, NULL, NULL, 65000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Apple announced iPhone 12 Pro Max on October 13, 2020.\r\n\r\nThe phone which is powered by the new Apple A14 Bionic processor, comes with a 6.7 inche Super Retina XDR OLED capacitive touchscreen and 2778 x 1284 p resolution. It features an HDR display and True Tone, and Wide color (P3) gamut. The display screen is protected by a unique ceramic shield and features 1200 nits max brightness, Dolby Vision, HDR10+ and 120Hz refresh rate.\r\n\r\nIt comes with a 6GB RAM and three storage variants 128GB, 256GB and 512GB. The rear camera consists of a 12MP (wide) + 12MP (telephoto) 5x optical zoom + 12MP (ultrawide) sensors and a LiDAR scanner for night mode.\r\n\r\nThe front camera has a 12 MP (wide) + SL 3D (depth/biometrics) camera sensor. Other sensors include Lidar, Face ID, accelerometer, gyro, proximity, compass, barometer + Siri natural language commands, and dictation.\r\n\r\nThe smartphone is fueled by a 3687mAh Li-Ion battery and supports 20W fast charging, USB Power Delivery 2.0,  7W Qi wireless charging and 15W MagSafe Wireless Charging. The phone runs on iOS 14 operating system which can be updated to iOS 14.7.\r\n\r\niPhone 12 Pro Max comes in four different colors viz: Graphite, Silver, Gold and Pacific Blue. It features 2.0, proprietary reversible connector.', NULL, 'original', 'used', NULL, '94776628446', NULL, 0, 0, NULL, NULL, NULL, 'Galle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Raihan', 0, NULL, 1, 1, '2022-12-19 18:28:08', NULL, '2022-12-19 18:25:07', NULL, '2022-12-19 19:34:18', 3, 0, NULL, NULL, 'Basic', NULL, '552221671454507.jpg', 'galle-city galle general mobiles Apple iPhone 12 Pro  65000 used94776628446GalleApple announced iPhone 12 Pro Max on October 13, 2020.\r\n\r\nThe phone which is powered by the new Apple A14 Bionic processor, comes with a 6.7 inche Super Retina XDR OLED capacitive touchscreen and 2778 x 1284 p resolution. It features an HDR display and True Tone, and Wide color (P3) gamut. The display screen is protected by a unique ceramic shield and features 1200 nits max brightness, Dolby Vision, HDR10+ and 120Hz refresh rate.\r\n\r\nIt comes with a 6GB RAM and three storage variants 128GB, 256GB and 512GB. The rear camera consists of a 12MP (wide) + 12MP (telephoto) 5x optical zoom + 12MP (ultrawide) sensors and a LiDAR scanner for night mode.\r\n\r\nThe front camera has a 12 MP (wide) + SL 3D (depth/biometrics) camera sensor. Other sensors include Lidar, Face ID, accelerometer, gyro, proximity, compass, barometer + Siri natural language commands, and dictation.\r\n\r\nThe smartphone is fueled by a 3687mAh Li-Ion battery and supports 20W fast charging, USB Power Delivery 2.0,  7W Qi wireless charging and 15W MagSafe Wireless Charging. The phone runs on iOS 14 operating system which can be updated to iOS 14.7.\r\n\r\niPhone 12 Pro Max comes in four different colors viz: Graphite, Silver, Gold and Pacific Blue. It features 2.0, proprietary reversible connector.'),
(48, 'sell', 82, 'city', 2, 'katugastota', 'kandy', 52, 'general', 2, 'electronics-gedgets', 110, 'desktop-computers', 122, 'test title', 'test-title', NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis,', NULL, 'original', 'new', NULL, '12345678911', NULL, 0, 0, NULL, NULL, NULL, 'manwa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Md Mridul', 0, NULL, 0, NULL, NULL, NULL, '2022-12-28 18:59:20', NULL, '2022-12-28 19:00:45', 0, 0, NULL, NULL, 'Top', '2023-01-03', NULL, 'katugastota kandy general desktop-computers test title  119 new12345678911manwaLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis,');

--
-- Triggers `prd_master`
--
DELIMITER $$
CREATE TRIGGER `after_prd_master_delete` AFTER DELETE ON `prd_master` FOR EACH ROW begin 

    declare var_total_post_a int;
    declare var_total_post_b int;
    declare var_total_post_c int;
    declare var_total_post_d int;


    select count(*) into var_total_post_a from prd_master where customer_pk_no = old.customer_pk_no;
    update ss_customers set total_post = var_total_post_a where id = old.customer_pk_no;

    select count(*) into var_total_post_b from prd_master where f_cat_pk_no = old.f_cat_pk_no;
    update prd_category set total_post = var_total_post_b where pk_no = old.f_cat_pk_no;

    select count(*) into var_total_post_b from prd_master where f_scat_pk_no = old.f_scat_pk_no;
    update prd_category set total_post = var_total_post_b where pk_no = old.f_scat_pk_no;


    
    if old.city_division = 'city' then
        select count(*) into var_total_post_c from prd_master where city_division_pk_no = old.city_division_pk_no;
        update ss_cities set total_post = var_total_post_c where pk_no = old.city_division_pk_no;

    end if;

    if old.city_division = 'division' then
        select count(*) into var_total_post_d from prd_master where city_division_pk_no = old.city_division_pk_no;
        update ss_divisions set total_post = var_total_post_d where pk_no = old.city_division_pk_no;

   end if;
    
    end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_prd_master_insert` AFTER INSERT ON `prd_master` FOR EACH ROW begin 
      declare var_total_post_a int;

    select count(*) into var_total_post_a from prd_master where customer_pk_no = new.customer_pk_no;
    update ss_customers set total_post = var_total_post_a where id = new.customer_pk_no;
        
 

end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_prd_master_update` AFTER UPDATE ON `prd_master` FOR EACH ROW begin 
    
declare var_total_post_a int;
    declare var_total_post_b int;
    declare var_total_post_c int;
    declare var_total_post_d int;
    declare var_total_post_e int;
    declare var_total_post_f int;
    declare var_total_post_g int;
    declare var_total_post_h int;
   

    select count(*) into var_total_post_a from prd_master where f_cat_pk_no = old.f_cat_pk_no and is_active = 1;
    select count(*) into var_total_post_b from prd_master where f_cat_pk_no = new.f_cat_pk_no and is_active = 1;

    select count(*) into var_total_post_c from prd_master where f_scat_pk_no = old.f_scat_pk_no and is_active = 1;
    select count(*) into var_total_post_d from prd_master where f_scat_pk_no = new.f_scat_pk_no and is_active = 1;

	update prd_category set total_post = var_total_post_a where pk_no = old.f_cat_pk_no;
	update prd_category set total_post = var_total_post_b where pk_no = new.f_cat_pk_no;


	update prd_category set total_post = var_total_post_c where pk_no = old.f_scat_pk_no;
	update prd_category set total_post = var_total_post_d where pk_no = new.f_scat_pk_no;




    if new.city_division = 'city' then 

	    select count(*) into var_total_post_e from prd_master where city_division_pk_no = old.city_division_pk_no and is_active = 1;
	    select count(*) into var_total_post_f from prd_master where city_division_pk_no = new.city_division_pk_no and is_active = 1;
	    
	    update ss_cities set total_post = var_total_post_e where pk_no = old.city_division_pk_no;
	    update ss_cities set total_post = var_total_post_f where pk_no = new.city_division_pk_no;
       
    end if;


    if new.city_division = 'division' then


       	select count(*) into var_total_post_g from prd_master where city_division_pk_no = old.city_division_pk_no and is_active = 1;
	    select count(*) into var_total_post_h from prd_master where city_division_pk_no = new.city_division_pk_no and is_active = 1;
	    
	    update ss_divisions set total_post = var_total_post_g where pk_no = old.city_division_pk_no;
	    update ss_divisions set total_post = var_total_post_h where pk_no = new.city_division_pk_no;


    end if;

end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_prd_master_insert` BEFORE INSERT ON `prd_master` FOR EACH ROW begin 
    	declare var_keyword_search varchar(5000) default null; 
	declare var_description varchar(4000) default null; 
	declare var_area_url_slug varchar(40) default null; 
	declare var_code int(10) default 0; 

       declare var_city_division_url_slug varchar(40) default null; 
       declare var_cat_url_slug varchar(40) default null; 
       declare var_scat_url_slug varchar(40) default null;

       select IFNULL(max(code),100) into var_code
                   from prd_master;
                   SET new.code = var_code+1 ;

           select url_slug into var_cat_url_slug 
           from prd_category 
           where pk_no = NEW.f_cat_pk_no;

        select url_slug into var_scat_url_slug 
           from prd_category 
           where pk_no = NEW.f_scat_pk_no;

       select url_slug into var_area_url_slug 
           from ss_areas 
           where pk_no = NEW.area_id;

       if new.city_division = 'city' then
       select url_slug into var_city_division_url_slug 
           from ss_cities 
           where pk_no = new.city_division_pk_no ;
       elseif new.city_division = 'division' then
       select url_slug into var_city_division_url_slug 
           from ss_divisions 
           where pk_no = new.city_division_pk_no ;
       else set var_city_division_url_slug = null;
       end if; 


           set new.city_division_url_slug = var_city_division_url_slug;
        set new.area_url_slug = var_area_url_slug ;
       
           set new.cat_url_slug = var_cat_url_slug ;
           set new.scat_url_slug = var_scat_url_slug ;


	set var_keyword_search = concat(new.area_url_slug , ' ', ifnull(new.city_division_url_slug,''), ' ', ifnull(new.main_category, ''), ' ', ifnull(new.scat_url_slug, ''), ' ', ifnull(new.ad_title,''), ' ', ifnull(new.brand_name,''), ' ', ifnull(new.model_name,''), ifnull(new.prod_feature,''), ifnull(new.price, ''), ifnull(new.business_function,''), ifnull(new.company_name,' '), ifnull(new.using_condition,''), ifnull(new.mobile1,''),ifnull(new.mobile2,''), ifnull(new.address,''),ifnull(new.property_address,''));
	-- set var_keyword_search = substring(var_keyword_search,1,4880);

	set new.search_key = concat(var_keyword_search,new.description) ;

    end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_prd_master_update` BEFORE UPDATE ON `prd_master` FOR EACH ROW begin 
    declare var_area_url_slug varchar(40) default null;  
    declare var_city_division_url_slug varchar(40) default null; 
    declare var_cat_url_slug varchar(40) default null; 
    declare var_scat_url_slug varchar(40) default null;
    declare var_thumb varchar(50) default null;
    declare var_keyword_search LONGTEXT CHARACTER SET utf8; 
	declare var_description LONGTEXT default null; 
    

    select url_slug into var_cat_url_slug 
        from prd_category 
        where pk_no = NEW.f_cat_pk_no;

    select url_slug into var_scat_url_slug 
        from prd_category 
        where pk_no = NEW.f_scat_pk_no;

    select url_slug into var_area_url_slug 
        from ss_areas 
        where pk_no = NEW.area_id;
    if new.city_division = 'city' then
    select url_slug into var_city_division_url_slug 
        from ss_cities 
        where pk_no = new.city_division_pk_no ;
    elseif new.city_division = 'division' then
    select url_slug into var_city_division_url_slug 
        from ss_divisions 
        where pk_no = new.city_division_pk_no ;
    else set var_city_division_url_slug = null;
    end if; 
    IF new.is_active = '1' THEN 
        SELECT prd_img_library.img_name into var_thumb 
        from prd_img_library 
        where  prd_img_library.f_prd_master_no = new.pk_no and prd_img_library.serial_no = 1 limit 1 ;
        END IF;

    set new.thumb = var_thumb; 


    set new.city_division_url_slug = var_city_division_url_slug;

    set new.area_url_slug = var_area_url_slug;
    set new.cat_url_slug = var_cat_url_slug ;
    set new.scat_url_slug = var_scat_url_slug ;


	-- SELECT fnStripTags(IFNULL(new.description,'')) INTO var_description; 

		set var_keyword_search = concat(new.area_url_slug , ' ', ifnull(new.city_division_url_slug,''), ' ', ifnull(new.main_category, ''), ' ', ifnull(new.scat_url_slug, ''), ' ', ifnull(new.ad_title,''), ' ', ifnull(new.brand_name,''), ' ', ifnull(new.model_name,''), ifnull(new.prod_feature,''), ifnull(new.price, ''), ifnull(new.business_function,''), ifnull(new.company_name,' '), ifnull(new.using_condition,''), ifnull(new.mobile1,''),ifnull(new.mobile2,''), ifnull(new.address,''),ifnull(new.property_address,'')); 
        
		-- set var_keyword_search = substring(var_keyword_search,1,4890); 
         
         -- INSERT INTO r VALUES(var_description);
         -- set var_keyword_search = new.description;

		set new.search_key = concat(var_keyword_search,new.description);
    

    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prd_model`
--

CREATE TABLE `prd_model` (
  `pk_no` int(11) NOT NULL,
  `cat_pk_no` int(10) DEFAULT NULL,
  `scat_pk_no` int(10) DEFAULT NULL COMMENT 'subcategory from category table\r\n',
  `brand_pk_no` int(10) DEFAULT NULL,
  `name` varchar(124) DEFAULT NULL,
  `name_bn` varchar(124) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `order_id` int(10) DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Brand Master Setup Table' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_model`
--

INSERT INTO `prd_model` (`pk_no`, `cat_pk_no`, `scat_pk_no`, `brand_pk_no`, `name`, `name_bn`, `code`, `comments`, `is_active`, `is_delete`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 104, 21, 1, 'Galaxy Grand Prime', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL),
(2, 1, 14, 2, 'Other model', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL),
(3, 104, 21, 15, 'ZenFone Max', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL),
(4, 1, 13, 24, 'Pilot', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL),
(5, 1, 13, 24, 'HRV', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL);

--
-- Triggers `prd_model`
--
DELIMITER $$
CREATE TRIGGER `before_prd_brand_insert` BEFORE INSERT ON `prd_model` FOR EACH ROW BEGIN
                declare var_order_id int(4) default 0 ;

                select IFNULL(max(order_id),0) into var_order_id
                        from prd_brand
                        where cat_pk_no  = NEW.cat_pk_no ;
                SET NEW.order_id = var_order_id+1 ;
    


END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_prd_brand_update` BEFORE UPDATE ON `prd_model` FOR EACH ROW BEGIN
                declare var_order_id int(4) default 0 ;

                select IFNULL(max(order_id),0) into var_order_id
                        from prd_brand
                        where cat_pk_no  = NEW.cat_pk_no ;
                SET NEW.order_id = var_order_id+1 ;
    


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prd_reports`
--

CREATE TABLE `prd_reports` (
  `pk_no` int(11) NOT NULL,
  `prod_pk_no` int(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'unseen =0, seen = 1, replied = 2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prd_reports`
--

INSERT INTO `prd_reports` (`pk_no`, `prod_pk_no`, `email`, `reason`, `message`, `created_at`, `updated_at`, `status`) VALUES
(1, 26, 'rabinmia@gmail.com', 'Spam', 'dfdsfds', '2022-12-15', '2022-12-15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `prd_type`
--

CREATE TABLE `prd_type` (
  `pk_no` int(11) NOT NULL,
  `cat_pk_no` int(10) DEFAULT NULL,
  `scat_pk_no` int(10) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prd_type`
--

INSERT INTO `prd_type` (`pk_no`, `cat_pk_no`, `scat_pk_no`, `name`, `name_bn`, `url_slug`, `order_id`, `status`, `comments`, `is_active`, `is_delete`, `total_post`, `active_post`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(7, 1, 15, 'Bicycles', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 19:53:56', NULL, '2020-11-17 19:53:56'),
(8, 1, 15, 'Three Wheelers & CNGs', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 19:54:16', 1, '2020-11-17 20:16:04'),
(12, 1, 17, 'Trucks', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:16:38', NULL, '2020-11-17 20:16:38'),
(13, 1, 17, 'Buses', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:17:03', NULL, '2020-11-17 20:17:03'),
(14, 1, 17, 'Vans', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:17:21', NULL, '2020-11-17 20:17:21'),
(15, 1, 18, 'Tractors', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:17:56', NULL, '2020-11-17 20:17:56'),
(16, 1, 18, 'Heavy-Duty', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:18:09', NULL, '2020-11-17 20:18:09'),
(17, 1, 19, 'Safety & Security', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:18:52', NULL, '2020-11-17 20:18:52'),
(18, 1, 19, 'Maintenance & Repair', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:19:05', NULL, '2020-11-17 20:19:05'),
(19, 1, 19, 'Audio & Video', NULL, NULL, 10, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:19:32', NULL, '2020-11-17 20:19:32'),
(20, 1, 19, 'Tyres & Rims', NULL, NULL, 11, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:19:51', NULL, '2020-11-17 20:19:51'),
(21, 1, 19, 'Auto parts', NULL, NULL, 12, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:20:11', NULL, '2020-11-17 20:20:11'),
(22, 1, 19, 'Other Accessories', NULL, NULL, 13, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:20:49', NULL, '2020-11-17 20:20:49'),
(23, 1, 93, 'Car Maintenance', NULL, NULL, 14, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:22:51', NULL, '2020-11-17 20:22:51'),
(24, 1, 93, 'Two Wheeler Maintenance', NULL, NULL, 15, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:23:13', NULL, '2020-11-17 20:23:13'),
(25, 1, 93, 'Commercial Vehicle Rentals', NULL, NULL, 16, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:23:44', NULL, '2020-11-17 20:23:44'),
(26, 1, 93, 'Rent A Car', NULL, NULL, 17, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:24:04', NULL, '2020-11-17 20:24:04'),
(27, 1, 93, 'Other Services', NULL, NULL, 18, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:24:27', NULL, '2020-11-17 20:24:27'),
(28, 94, 95, 'Beverages', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:43:29', NULL, '2020-11-17 20:43:29'),
(29, 94, 95, 'Frozen', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:43:44', NULL, '2020-11-17 20:43:44'),
(30, 94, 95, 'Rice & Pulses', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:44:26', NULL, '2020-11-17 20:44:26'),
(31, 94, 95, 'Canned, Dry & Packaged Foods', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:49:37', NULL, '2020-11-17 20:49:37'),
(32, 94, 95, 'Dairy & Chilled', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:50:06', NULL, '2020-11-17 20:50:06'),
(33, 94, 95, 'Biscuits, Snacks & Chocolates', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:50:26', NULL, '2020-11-17 20:50:26'),
(34, 94, 95, 'Baking & Cooking', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:50:40', NULL, '2020-11-17 20:50:40'),
(35, 94, 95, 'Bakery', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:51:02', NULL, '2020-11-17 20:51:02'),
(36, 94, 95, 'Personal Care', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:51:16', NULL, '2020-11-17 20:51:16'),
(37, 94, 95, 'Other', NULL, NULL, 10, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-17 20:51:37', NULL, '2020-11-17 20:51:37'),
(39, 94, 100, 'Clenning', NULL, NULL, 11, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:09:34', NULL, '2020-11-18 13:09:34'),
(40, 94, 100, 'Cleaning', NULL, NULL, 12, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:11:53', NULL, '2020-11-18 13:11:53'),
(41, 94, 100, 'Laundry', NULL, NULL, 13, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:12:08', NULL, '2020-11-18 13:12:08'),
(42, 94, 100, 'Dish Washing', NULL, NULL, 14, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:12:21', NULL, '2020-11-18 13:12:21'),
(43, 94, 100, 'Tissues & Disposables', NULL, NULL, 15, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:12:32', NULL, '2020-11-18 13:12:32'),
(44, 94, 100, 'Freshners', NULL, NULL, 16, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:12:48', NULL, '2020-11-18 13:12:48'),
(45, 94, 100, 'Repellents', NULL, NULL, 17, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 13:13:00', NULL, '2020-11-18 13:13:00'),
(47, 2, 20, 'Motherboards', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:03:15', NULL, '2020-11-18 14:03:15'),
(48, 2, 20, 'Keyboards', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:03:31', NULL, '2020-11-18 14:03:31'),
(49, 2, 20, 'Processors', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:03:50', NULL, '2020-11-18 14:03:50'),
(50, 2, 20, 'Monitors', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:04:02', NULL, '2020-11-18 14:04:02'),
(51, 2, 20, 'Hard Drives', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:04:09', NULL, '2020-11-18 14:04:09'),
(52, 2, 20, 'Graphics Cards', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:04:21', NULL, '2020-11-18 14:04:21'),
(53, 2, 20, 'Software', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:04:34', NULL, '2020-11-18 14:04:34'),
(54, 2, 20, 'Mouse', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:04:51', NULL, '2020-11-18 14:04:51'),
(55, 2, 20, 'Modems & Routers', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:05:09', NULL, '2020-11-18 14:05:09'),
(56, 2, 20, 'Printers & Scanners', NULL, NULL, 10, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:05:29', NULL, '2020-11-18 14:05:29'),
(57, 2, 20, 'RAMs', NULL, NULL, 11, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:05:42', NULL, '2020-11-18 14:05:42'),
(58, 2, 20, 'Pendrive', NULL, NULL, 12, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:05:53', NULL, '2020-11-18 14:05:53'),
(59, 2, 20, 'UPS', NULL, NULL, 13, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:06:13', NULL, '2020-11-18 14:06:13'),
(60, 2, 20, 'Laptop Batteries', NULL, NULL, 14, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:06:26', NULL, '2020-11-18 14:06:26'),
(61, 2, 20, 'Others', NULL, NULL, 15, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:06:40', NULL, '2020-11-18 14:06:40'),
(62, 2, 27, 'Projectors', NULL, NULL, 16, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:07:23', NULL, '2020-11-18 14:07:23'),
(63, 2, 27, 'Video Players', NULL, NULL, 17, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:07:35', NULL, '2020-11-18 14:07:35'),
(64, 2, 27, 'TV Boxes & Cards', NULL, NULL, 18, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:07:49', NULL, '2020-11-18 14:07:49'),
(66, 2, 25, 'Cameras', NULL, NULL, 19, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:09:00', NULL, '2020-11-18 14:09:00'),
(67, 2, 25, 'Camera Accessories', NULL, NULL, 20, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:09:09', NULL, '2020-11-18 14:09:09'),
(68, 2, 25, 'Security & Surveillance Cameras', NULL, NULL, 21, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:09:18', NULL, '2020-11-18 14:09:18'),
(69, 2, 25, 'Camcorders', NULL, NULL, 22, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:09:30', NULL, '2020-11-18 14:09:30'),
(70, 2, 25, 'Lens', NULL, NULL, 23, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:09:39', NULL, '2020-11-18 14:09:39'),
(72, 2, 23, 'Earphones & Headphones', NULL, NULL, 24, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:10:19', NULL, '2020-11-18 14:10:19'),
(73, 2, 23, 'MP3 Players', NULL, NULL, 25, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:10:30', NULL, '2020-11-18 14:10:30'),
(74, 2, 23, 'Sound Systems', NULL, NULL, 26, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:10:40', NULL, '2020-11-18 14:10:40'),
(76, 5, 42, 'Shirts', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:17:06', NULL, '2020-11-18 14:17:06'),
(77, 5, 42, 'Tshirts', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:17:35', NULL, '2020-11-18 14:17:35'),
(78, 5, 42, 'Pants', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:17:48', NULL, '2020-11-18 14:17:48'),
(79, 5, 42, 'Suits & Blazers', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:18:02', NULL, '2020-11-18 14:18:02'),
(81, 5, 42, 'Jackets', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:18:15', NULL, '2020-11-18 14:18:15'),
(82, 5, 42, 'Hoodies & Sweaters', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:18:27', NULL, '2020-11-18 14:18:27'),
(83, 5, 42, 'Traditional Wear', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:18:43', NULL, '2020-11-18 14:18:43'),
(84, 5, 42, 'Innerwear & Accessories', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:19:01', NULL, '2020-11-18 14:19:01'),
(85, 5, 42, 'Shoes', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:19:13', NULL, '2020-11-18 14:19:13'),
(86, 5, 43, 'Traditonal Wear', NULL, NULL, 10, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:19:46', NULL, '2020-11-18 14:19:46'),
(87, 5, 43, 'Western Wear', NULL, NULL, 11, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:19:58', NULL, '2020-11-18 14:19:58'),
(89, 5, 43, 'Winter Wear', NULL, NULL, 12, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:20:22', NULL, '2020-11-18 14:20:22'),
(93, 5, 45, 'Earrings', NULL, NULL, 13, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:22:03', NULL, '2020-11-18 14:22:03'),
(94, 5, 45, 'Rings', NULL, NULL, 14, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:22:13', NULL, '2020-11-18 14:22:13'),
(95, 5, 45, 'Jewellery Sets', NULL, NULL, 15, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:22:23', NULL, '2020-11-18 14:22:23'),
(96, 5, 45, 'Necklaces', NULL, NULL, 16, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:22:33', NULL, '2020-11-18 14:22:33'),
(97, 5, 45, 'Bangles & Bracelets', NULL, NULL, 17, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:22:42', NULL, '2020-11-18 14:22:42'),
(98, 5, 45, 'Gems', NULL, NULL, 18, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:22:55', NULL, '2020-11-18 14:22:55'),
(99, 5, 45, 'Others', NULL, NULL, 19, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:23:06', NULL, '2020-11-18 14:23:06'),
(100, 5, 47, 'Analog', NULL, NULL, 20, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:23:49', NULL, '2020-11-18 14:23:49'),
(101, 5, 47, 'Chronograph', NULL, NULL, 21, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:23:58', NULL, '2020-11-18 14:23:58'),
(102, 5, 47, 'Smart Watches', NULL, NULL, 22, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:24:07', NULL, '2020-11-18 14:24:07'),
(103, 5, 47, 'Digital', NULL, NULL, 23, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:24:16', NULL, '2020-11-18 14:24:16'),
(104, 5, 47, 'Sports & Fitness Gadgets', NULL, NULL, 24, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:24:28', NULL, '2020-11-18 14:24:28'),
(105, 5, 50, 'Hair Care', NULL, NULL, 25, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:29:10', NULL, '2020-11-18 14:29:10'),
(106, 5, 50, 'Grooming', NULL, NULL, 26, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:29:20', NULL, '2020-11-18 14:29:20'),
(107, 5, 50, 'Bodycare', NULL, NULL, 27, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:29:29', NULL, '2020-11-18 14:29:29'),
(108, 5, 50, 'Perfumes', NULL, NULL, 28, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:29:39', NULL, '2020-11-18 14:29:39'),
(109, 5, 50, 'Cosmetics', NULL, NULL, 29, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:29:49', NULL, '2020-11-18 14:29:49'),
(110, 6, 53, 'Bird', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:32:07', NULL, '2020-11-18 14:32:07'),
(111, 6, 53, 'Cat', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:32:20', NULL, '2020-11-18 14:32:20'),
(112, 6, 53, 'Dog', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:32:31', NULL, '2020-11-18 14:32:31'),
(113, 6, 53, 'Fish', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:32:49', NULL, '2020-11-18 14:32:49'),
(114, 6, 53, 'Guinea pig / mouse', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:32:58', NULL, '2020-11-18 14:32:58'),
(115, 6, 53, 'Rabbit', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:33:10', NULL, '2020-11-18 14:33:10'),
(116, 6, 53, 'Reptile', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:33:19', NULL, '2020-11-18 14:33:19'),
(117, 6, 53, 'Other', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-11-18 14:33:29', NULL, '2020-11-18 14:33:29'),
(118, 7, 58, 'Full Time', NULL, 'full-time', 1, 1, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(134, 94, 97, 'Fish', NULL, NULL, 18, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:52:25', NULL, '2020-12-01 11:52:25'),
(135, 94, 97, 'Beef', NULL, NULL, 19, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:52:54', NULL, '2020-12-01 11:52:54'),
(136, 94, 97, 'Mutton', NULL, NULL, 20, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:53:03', NULL, '2020-12-01 11:53:03'),
(137, 94, 97, 'Chicken', NULL, NULL, 21, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:53:12', NULL, '2020-12-01 11:53:12'),
(138, 94, 98, 'Baby food', NULL, NULL, 22, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:53:33', NULL, '2020-12-01 11:53:33'),
(139, 94, 98, 'Diapers & Wipes', NULL, NULL, 23, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:53:44', NULL, '2020-12-01 11:53:44'),
(140, 94, 98, 'Skin & Haircare', NULL, NULL, 24, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:53:54', NULL, '2020-12-01 11:53:54'),
(141, 94, 98, 'Baby accessories', NULL, NULL, 25, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:54:06', NULL, '2020-12-01 11:54:06'),
(142, 94, 98, 'For Mom', NULL, NULL, 26, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:54:18', NULL, '2020-12-01 11:54:18'),
(149, 8, 70, 'Sofas', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:58:04', NULL, '2020-12-01 11:58:04'),
(150, 8, 70, 'TV Stands', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:58:15', NULL, '2020-12-01 11:58:15'),
(151, 8, 70, 'Showcases', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:58:25', NULL, '2020-12-01 11:58:25'),
(152, 8, 70, 'Shoe Racks', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:58:35', NULL, '2020-12-01 11:58:35'),
(153, 8, 70, 'Centre & Side Tables', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:58:44', NULL, '2020-12-01 11:58:44'),
(154, 8, 70, 'Bookcases & Shelves', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:58:53', NULL, '2020-12-01 11:58:53'),
(155, 8, 70, 'Tables & Chairs', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:59:01', NULL, '2020-12-01 11:59:01'),
(156, 8, 70, 'Others', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:59:10', NULL, '2020-12-01 11:59:10'),
(157, 8, 71, 'Cabinets', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:59:47', NULL, '2020-12-01 11:59:47'),
(158, 8, 71, 'Dining Tables & Chairs', NULL, NULL, 10, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 11:59:56', NULL, '2020-12-01 11:59:56'),
(159, 8, 71, 'Racks & Trolleys', NULL, NULL, 11, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:00:05', NULL, '2020-12-01 12:00:05'),
(161, 8, 72, 'Beds', NULL, NULL, 12, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:00:32', NULL, '2020-12-01 12:00:32'),
(162, 8, 72, 'Dressing Tables', NULL, NULL, 13, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:00:40', NULL, '2020-12-01 12:00:40'),
(163, 8, 72, 'Wardrobes', NULL, NULL, 14, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:00:48', NULL, '2020-12-01 12:00:48'),
(165, 8, 73, 'Office Chairs', NULL, NULL, 15, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:02:16', NULL, '2020-12-01 12:02:16'),
(166, 8, 73, 'Desks', NULL, NULL, 16, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:02:24', NULL, '2020-12-01 12:02:24'),
(167, 8, 73, 'Conference Tables', NULL, NULL, 17, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:02:32', NULL, '2020-12-01 12:02:32'),
(168, 8, 73, 'Workstations', NULL, NULL, 18, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:02:42', NULL, '2020-12-01 12:02:42'),
(169, 8, 73, 'Reception Tables', NULL, NULL, 19, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:02:50', NULL, '2020-12-01 12:02:50'),
(170, 8, 73, 'Display Racks', NULL, NULL, 20, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:03:00', NULL, '2020-12-01 12:03:00'),
(172, 8, 75, 'ACs & Coolers', NULL, NULL, 21, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:03:43', NULL, '2020-12-01 12:03:43'),
(173, 8, 75, 'Fans', NULL, NULL, 22, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:03:54', NULL, '2020-12-01 12:03:54'),
(174, 8, 75, 'Heaters', NULL, NULL, 23, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:04:04', NULL, '2020-12-01 12:04:04'),
(175, 8, 75, 'Solar System', NULL, NULL, 24, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:04:16', NULL, '2020-12-01 12:04:16'),
(176, 8, 75, 'IPS', NULL, NULL, 25, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:04:25', NULL, '2020-12-01 12:04:25'),
(177, 8, 75, 'Generators', NULL, NULL, 26, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:04:34', NULL, '2020-12-01 12:04:34'),
(178, 8, 75, 'Lighting', NULL, NULL, 27, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:04:43', NULL, '2020-12-01 12:04:43'),
(179, 8, 77, 'Bathroom Products', NULL, NULL, 28, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:05:31', NULL, '2020-12-01 12:05:31'),
(180, 8, 77, 'Tools & Machineries', NULL, NULL, 29, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:05:40', NULL, '2020-12-01 12:05:40'),
(181, 8, 77, 'Doors', NULL, NULL, 30, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:05:47', NULL, '2020-12-01 12:05:47'),
(182, 8, 77, 'Kitchen & Dining', NULL, NULL, 31, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:05:57', NULL, '2020-12-01 12:05:57'),
(183, 8, 77, 'Sewing Machines', NULL, NULL, 32, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:06:05', NULL, '2020-12-01 12:06:05'),
(185, 8, 78, 'Curtains', NULL, NULL, 33, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:06:37', NULL, '2020-12-01 12:06:37'),
(186, 8, 78, 'Cushions & Covers', NULL, NULL, 34, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:06:47', NULL, '2020-12-01 12:06:47'),
(187, 8, 78, 'Mattresses & Bedding', NULL, NULL, 35, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:06:55', NULL, '2020-12-01 12:06:55'),
(188, 8, 78, 'Carpets', NULL, NULL, 36, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:07:05', NULL, '2020-12-01 12:07:05'),
(189, 8, 78, 'Home Decor', NULL, NULL, 37, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:07:14', NULL, '2020-12-01 12:07:14'),
(190, 8, 78, 'Handicrafts', NULL, NULL, 38, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:07:22', NULL, '2020-12-01 12:07:22'),
(191, 8, 78, 'Antiques', NULL, NULL, 39, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:07:31', NULL, '2020-12-01 12:07:31'),
(192, 8, 78, 'Paintings', NULL, NULL, 40, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:07:40', NULL, '2020-12-01 12:07:40'),
(204, 4, 35, 'Keyboard & Piano', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:13:37', NULL, '2020-12-01 12:13:37'),
(205, 4, 35, 'Percussion & Drums', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:13:47', NULL, '2020-12-01 12:13:47'),
(206, 4, 35, 'String Instruments & Amplifiers', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:13:56', NULL, '2020-12-01 12:13:56'),
(207, 4, 35, 'Studio & Live Music Equipment', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:14:05', NULL, '2020-12-01 12:14:05'),
(208, 4, 35, 'Vinyl', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:14:20', NULL, '2020-12-01 12:14:20'),
(209, 4, 35, 'Woodwind & Brass', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:14:32', NULL, '2020-12-01 12:14:32'),
(210, 4, 35, 'Others', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:14:45', NULL, '2020-12-01 12:14:45'),
(211, 4, 36, 'Boxing & Martial Arts', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:15:23', NULL, '2020-12-01 12:15:23'),
(212, 4, 36, 'Cricket', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:15:31', NULL, '2020-12-01 12:15:31'),
(213, 4, 36, 'Fishing & Camping', NULL, NULL, 10, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:15:39', NULL, '2020-12-01 12:15:39'),
(214, 4, 36, 'Football', NULL, NULL, 11, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:15:47', NULL, '2020-12-01 12:15:47'),
(215, 4, 36, 'Games & Board Games', NULL, NULL, 12, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:15:56', NULL, '2020-12-01 12:15:56'),
(216, 4, 36, 'Hockey', NULL, NULL, 13, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:16:05', NULL, '2020-12-01 12:16:05'),
(217, 4, 36, 'Indoor Sports', NULL, NULL, 14, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:16:14', NULL, '2020-12-01 12:16:14'),
(219, 4, 37, 'Dumbbells', NULL, NULL, 15, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:16:47', NULL, '2020-12-01 12:16:47'),
(220, 4, 37, 'Treadmills', NULL, NULL, 16, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:16:53', NULL, '2020-12-01 12:16:53'),
(221, 4, 37, 'Exercise Bikes', NULL, NULL, 17, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:17:03', NULL, '2020-12-01 12:17:03'),
(222, 4, 37, 'Weight Loss', NULL, NULL, 18, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:17:13', NULL, '2020-12-01 12:17:13'),
(224, 4, 38, 'Books & Novels', NULL, NULL, 19, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:17:43', NULL, '2020-12-01 12:17:43'),
(225, 4, 38, 'DVDs & CDs', NULL, NULL, 20, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:17:51', NULL, '2020-12-01 12:17:51'),
(226, 4, 38, 'Magazines & Comics', NULL, NULL, 21, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:18:00', NULL, '2020-12-01 12:18:00'),
(228, 4, 39, 'Baby Care', NULL, NULL, 22, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:18:29', NULL, '2020-12-01 12:18:29'),
(229, 4, 39, 'Car Seats & Carriers', NULL, NULL, 23, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:18:39', NULL, '2020-12-01 12:18:39'),
(230, 4, 39, 'Prams & Strollers', NULL, NULL, 24, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:18:49', NULL, '2020-12-01 12:18:49'),
(231, 4, 39, 'Toys', NULL, NULL, 25, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:18:58', NULL, '2020-12-01 12:18:58'),
(233, 3, 107, 'Building', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:20:34', NULL, '2020-12-01 12:20:34'),
(234, 3, 107, 'Factory / Mill', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:20:55', NULL, '2020-12-01 12:20:55'),
(235, 3, 107, 'Hotel', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:21:02', NULL, '2020-12-01 12:21:02'),
(236, 3, 107, 'Office', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:21:09', NULL, '2020-12-01 12:21:09'),
(237, 3, 107, 'Restaurant', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:21:17', NULL, '2020-12-01 12:21:17'),
(238, 3, 107, 'Shop', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:21:23', NULL, '2020-12-01 12:21:23'),
(239, 3, 107, 'Warehouse', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:21:30', NULL, '2020-12-01 12:21:30'),
(240, 3, 107, 'Other', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:21:37', NULL, '2020-12-01 12:21:37'),
(245, 104, 26, 'Power Banks', NULL, NULL, 1, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:24:31', NULL, '2020-12-01 12:24:31'),
(246, 104, 26, 'Screen Protectors', NULL, NULL, 2, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:24:42', NULL, '2020-12-01 12:24:42'),
(247, 104, 26, 'Chargers', NULL, NULL, 3, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:24:49', NULL, '2020-12-01 12:24:49'),
(248, 104, 26, 'Cables', NULL, NULL, 4, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:24:58', NULL, '2020-12-01 12:24:58'),
(249, 104, 26, 'Holders & Stands', NULL, NULL, 5, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:25:05', NULL, '2020-12-01 12:25:05'),
(250, 104, 26, 'Bags & Cases', NULL, NULL, 6, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:25:11', NULL, '2020-12-01 12:25:11'),
(251, 104, 26, 'VR Boxes', NULL, NULL, 7, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:25:16', NULL, '2020-12-01 12:25:16'),
(252, 104, 26, 'Selfie Sticks', NULL, NULL, 8, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:25:22', NULL, '2020-12-01 12:25:22'),
(253, 104, 26, 'Others', NULL, NULL, 9, NULL, NULL, 1, 0, 0, 0, 1, '2020-12-01 12:25:28', NULL, '2020-12-01 12:25:28');

--
-- Triggers `prd_type`
--
DELIMITER $$
CREATE TRIGGER `before_prd_type_insert` BEFORE INSERT ON `prd_type` FOR EACH ROW BEGIN
                declare var_order_id int(4) default 0 ;

                select IFNULL(max(order_id),0) into var_order_id
                        from prd_type
                        where cat_pk_no  = NEW.cat_pk_no ;
                SET NEW.order_id = var_order_id+1 ;
    


END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_prd_type_update` BEFORE UPDATE ON `prd_type` FOR EACH ROW BEGIN
                declare var_order_id int(4) default 0 ;

                select IFNULL(max(order_id),0) into var_order_id
                        from prd_type
                        where cat_pk_no  = NEW.cat_pk_no ;
                SET NEW.order_id = var_order_id+1 ;
    


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prod_job_preference`
--

CREATE TABLE `prod_job_preference` (
  `pk_no` int(10) NOT NULL,
  `prod_pk_no` int(10) DEFAULT NULL,
  `mini_qualification` varchar(100) DEFAULT NULL,
  `req_expriance` varchar(100) DEFAULT NULL,
  `edu_specialization` varchar(100) DEFAULT NULL,
  `receive_applications_via` varchar(100) DEFAULT NULL,
  `skill` varchar(100) DEFAULT NULL,
  `max_age` int(2) DEFAULT NULL,
  `pref_gender` varchar(60) DEFAULT NULL,
  `application_requirements` varchar(255) DEFAULT NULL,
  `role_designation` varchar(100) DEFAULT NULL,
  `total_vacancies` int(10) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `business_function` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prod_job_preference`
--

INSERT INTO `prod_job_preference` (`pk_no`, `prod_pk_no`, `mini_qualification`, `req_expriance`, `edu_specialization`, `receive_applications_via`, `skill`, `max_age`, `pref_gender`, `application_requirements`, `role_designation`, `total_vacancies`, `deadline`, `business_function`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 14, 'high_school', '0', 'info_technology', 'phone_number_url', NULL, NULL, 'male', NULL, 'IT Officer', 5, '2022-08-09', 'it_telecom', '2022-08-06 15:25:18', '2022-08-06 15:25:18', 8, NULL),
(2, 4, 'graduate', '6', 'business_management', 'dashboard', 'Top skills', 40, 'any', NULL, 'Sale Executive', 2, '2022-08-25', 'human_resources', '2022-08-14 19:07:54', '2022-08-14 19:07:54', 26, NULL),
(3, 34, 'hsc', '3', 'info_technology', 'phone_number_url', '23 Best', 40, 'female', NULL, 'Laravel Devloer', 5, '2022-12-16', 'administration', '2022-12-15 13:54:15', '2022-12-15 13:54:15', 48, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quick_rules`
--

CREATE TABLE `quick_rules` (
  `id` int(11) NOT NULL,
  `one_en` text DEFAULT NULL,
  `two_en` text DEFAULT NULL,
  `three_en` text DEFAULT NULL,
  `four_en` text DEFAULT NULL,
  `five_en` text DEFAULT NULL,
  `six_en` text DEFAULT NULL,
  `seven_en` text DEFAULT NULL,
  `eight_en` text DEFAULT NULL,
  `nine_en` text DEFAULT NULL,
  `ten_en` text DEFAULT NULL,
  `one_sl` text DEFAULT NULL,
  `two_sl` text DEFAULT NULL,
  `three_sl` text DEFAULT NULL,
  `four_sl` text DEFAULT NULL,
  `five_sl` text DEFAULT NULL,
  `six_sl` text DEFAULT NULL,
  `seven_sl` text DEFAULT NULL,
  `eight_sl` text DEFAULT NULL,
  `nine_sl` text DEFAULT NULL,
  `ten_sl` text DEFAULT NULL,
  `title_en` text DEFAULT NULL,
  `title_sl` text DEFAULT NULL,
  `sub_title_en` text DEFAULT NULL,
  `sub_title_sl` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quick_rules`
--

INSERT INTO `quick_rules` (`id`, `one_en`, `two_en`, `three_en`, `four_en`, `five_en`, `six_en`, `seven_en`, `eight_en`, `nine_en`, `ten_en`, `one_sl`, `two_sl`, `three_sl`, `four_sl`, `five_sl`, `six_sl`, `seven_sl`, `eight_sl`, `nine_sl`, `ten_sl`, `title_en`, `title_sl`, `sub_title_en`, `sub_title_sl`, `created_at`, `updated_at`) VALUES
(1, 'Make sure you post in the correct category.', 'Do not post the same ad more than once or repost an ad within 48 hours.', 'Do not upload pictures with watermarks.', 'Do not post ads containing multiple items unless it\'s a package deal.', 'Do not put your email or phone numbers in the title or description.', 'Make sure you post in the correct category.', 'Do not post ads contpackage deal.', 'Do not post the same ad more than once or repost an ad within 48 hours.', 'Do not upload pictures with watermarks and title or description.', 'Do not put your email or phone numbers in the', 'ඔබ නිවැරදි ප්‍රවර්ගයේ පළ කිරීමට වග බලා ගන්න.', 'එකම දැන්වීම එක වරකට වඩා පළ නොකරන්න හෝ පැය 48ක් ඇතුළත දැන්වීමක් නැවත පළ නොකරන්න.', 'ජල සලකුණු සහිත පින්තූර උඩුගත නොකරන්න.', 'පැකේජ ගනුදෙනුවක් නම් මිස අයිතම කිහිපයක් අඩංගු දැන්වීම් පළ නොකරන්න.', 'මාතෘකාවේ හෝ විස්තරයේ ඔබේ විද්‍යුත් තැපෑල හෝ දුරකථන අංක දමන්න එපා.', 'පැකේජ ගනුදෙනුවක් නම් මිස අයිතම කිහිපයක් අඩංගු දැන්වීම් පළ නොකරන්න.', 'එකම දැන්වීම එක වරකට වඩා පළ නොකරන්න හෝ පැය', 'පැකේජ ගනුදෙනුයක් අඩංගු දැන්වීම් පළ නොකරන්න.', 'ඔබ නිවැරදි ප්‍රවර්ගයේ පළ කිරීමට වග බලා ගන්න.', 'මාතෘකාවේ හෝ විස්තරයේ ඔබේ  විද්‍යුත්', 'Quick Rules', 'ඉක්මන් නීති', 'Posting an ad on ok2list.com is free! However, all ads must follow our rules:', 'ok2list.com හි දැන්වීමක් පළ කිරීම නොමිලේ! කෙසේ වෙතත්, සියලුම දැන්වීම් අපගේ නීති අනුගමනය කළ යුතුය:', '2022-12-13 19:43:08', '2022-12-13 19:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `stars` int(11) NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `status`, `created_by`, `edited_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super admin', 1, 1, 0, '2020-03-03 06:42:11', '2020-03-03 06:42:11', '2017-03-11 16:42:11'),
(8, 'Admin', 1, 1, 0, '2020-03-03 06:42:11', '2020-03-03 06:42:11', NULL),
(12, 'Maneger', 1, 1, 1, NULL, '2020-10-06 05:02:37', '2021-07-12 17:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `permissions`, `role_id`, `created_at`, `updated_at`) VALUES
(1, ',view_dashboard,', 1, NULL, NULL),
(2, ',view_role,edit_role,view_action,delete_action,view_category,new_category,edit_category,view_sub_category,', 12, '2020-10-06 05:02:37', '2021-07-12 17:43:25'),
(3, ',view_dashboard,add_user_report,execute_dashboard,view_role,', 8, NULL, NULL),
(4, ',view_role,view_admin_user,view_menu,view_action,new_action,', 0, '2022-07-28 15:00:51', '2022-07-28 15:00:51');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(10) NOT NULL,
  `website_title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `meta_keyword` text CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8 DEFAULT NULL,
  `website_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `map_address` text DEFAULT NULL,
  `section_one_name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_one_name_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_us_en` varchar(255) DEFAULT NULL,
  `terms_conditions_en` varchar(255) DEFAULT NULL,
  `privacy_policy_en` varchar(255) DEFAULT NULL,
  `sitemap_en` varchar(255) DEFAULT NULL,
  `about_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_us_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `terms_conditions_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `privacy_policy_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitemap_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_two_en` varchar(255) DEFAULT NULL,
  `section_two_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `how_to_sell_fast_en` varchar(255) DEFAULT NULL,
  `membership_en` varchar(255) DEFAULT NULL,
  `promote_your_ad_en` varchar(255) DEFAULT NULL,
  `promotions_en` varchar(255) NOT NULL,
  `faq_en` varchar(255) DEFAULT NULL,
  `how_to_sell_fast_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `membership_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `promote_your_ad_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `promotions_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `faq_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_three_name_en` varchar(255) DEFAULT NULL,
  `section_three_name_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_en` varchar(255) DEFAULT NULL,
  `instagram_en` varchar(255) DEFAULT NULL,
  `twitter_en` varchar(255) DEFAULT NULL,
  `linkedin_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `whatsapp_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `whatsapp_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_four_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_four_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_sl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_mode` enum('local','live','','') NOT NULL DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `website_title`, `logo`, `favicon`, `copyright`, `meta_keyword`, `meta_description`, `website_email`, `phone`, `address`, `map_address`, `section_one_name_en`, `section_one_name_sl`, `about_en`, `contact_us_en`, `terms_conditions_en`, `privacy_policy_en`, `sitemap_en`, `about_sl`, `contact_us_sl`, `terms_conditions_sl`, `privacy_policy_sl`, `sitemap_sl`, `section_two_en`, `section_two_sl`, `how_to_sell_fast_en`, `membership_en`, `promote_your_ad_en`, `promotions_en`, `faq_en`, `how_to_sell_fast_sl`, `membership_sl`, `promote_your_ad_sl`, `promotions_sl`, `faq_sl`, `section_three_name_en`, `section_three_name_sl`, `facebook_en`, `instagram_en`, `twitter_en`, `linkedin_en`, `whatsapp_en`, `youtube_en`, `facebook_sl`, `instagram_sl`, `twitter_sl`, `linkedin_sl`, `whatsapp_sl`, `youtube_sl`, `facebook_link`, `twitter_link`, `instagram_link`, `linkedin_link`, `whatsapp_link`, `youtube_link`, `section_four_en`, `section_four_sl`, `content_en`, `content_sl`, `app_mode`, `created_at`, `updated_at`) VALUES
(12, 'ok2list.com', 'uploads/2022/12/1671873605-logo2.png', 'uploads/2022/06/1655658561-logo-02.jpg', 'Copyright @', 'ok2list.com', 'ok2list.com', 'info@ok2list.com', NULL, 'Sri lanka', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4047213.2839410105!2d80.70625!3d7.857684999999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2593cf65a1e9d%3A0xe13da4b400e2d38c!2sSri%20Lanka!5e0!3m2!1sen!2sbd!4v1660041689475!5m2!1sen!2sbd\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Quick Links', 'ඉක්මන් සබැඳි', 'About', 'Contact Us', 'Terms & Conditions', 'Privacy Policy', 'Sitemap', 'පිළිබඳ', 'අප අමතන්න', 'නියම සහ කොන්දේසි', 'රහස්යතා ප්රතිපත්තිය', 'අඩවි සිතියම', 'How to sell fast', 'ඉක්මනින් විකුණන්නේ කෙසේද', 'How to sell fast', 'Membership', 'Promote Your Ad', 'Promotions', 'FAQ', 'ඉක්මනින් විකුණන්නේ කෙසේද', 'සාමාජිකත්වය', 'ඔබේ සංස්කරණය ප්‍රවර්ධනය කරන්න', 'උසස්වීම්', 'පරතරය', 'Follow Us On', 'අපව අනුගමනය කරන්න සහ', 'Facebook', 'Instagram', 'Twitter', 'Linkedin', 'Whatsapp', 'Youtube', 'ෆේස්බුක්', 'ට්විටර්', 'ට්විටර්', 'Linkedin', 'Whatsapp', 'Youtube', 'https://www.facebook.com/ok2list', 'https://twitter.com/ok2list', 'https://www.instagram.com/ok2list', 'https://www.facebook.com/ok2list', 'https://www.facebook.com/ok2list', 'https://www.facebook.com/ok2list', 'Newsletter', 'පුවත් පත්‍රිකාව', 'Subscribe to our official Newsletter', 'අපගේ නිල පුවත් පත්‍රිකාවට දායක වන්න', '', '2022-05-17 14:57:55', '2022-12-24 08:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `sls_payments`
--

CREATE TABLE `sls_payments` (
  `pk_no` bigint(20) NOT NULL,
  `f_customer_pk_no` int(10) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` varchar(124) DEFAULT NULL,
  `tran_date` date DEFAULT NULL,
  `tran_id` varchar(124) DEFAULT NULL,
  `val_id` varchar(124) DEFAULT NULL,
  `amount` float(11,3) DEFAULT NULL,
  `store_amount` float(11,3) DEFAULT NULL,
  `bank_tran_id` varchar(124) DEFAULT NULL,
  `card_type` varchar(124) DEFAULT NULL,
  `emi_instalment` varchar(124) DEFAULT NULL,
  `emi_amount` float(11,3) DEFAULT NULL,
  `emi_description` varchar(124) DEFAULT NULL,
  `emi_issuer` varchar(124) DEFAULT NULL,
  `card_no` varchar(124) DEFAULT NULL,
  `card_issuer` varchar(124) DEFAULT NULL,
  `card_brand` varchar(124) DEFAULT NULL,
  `card_issuer_country` varchar(124) DEFAULT NULL,
  `card_issuer_country_code` varchar(124) DEFAULT NULL,
  `APIConnect` varchar(124) DEFAULT NULL,
  `validated_on` varchar(124) DEFAULT NULL,
  `gw_version` varchar(124) DEFAULT NULL,
  `payment_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `payment_type` varchar(40) DEFAULT NULL,
  `f_prod_pk_no` int(10) DEFAULT NULL,
  `f_promotion_details_no` int(3) DEFAULT NULL,
  `f_package_pk_no` int(3) DEFAULT NULL,
  `add_limit` varchar(10) DEFAULT '0',
  `expired_on` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `billing_city` varchar(150) DEFAULT NULL,
  `billing_state` varchar(150) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sls_payments`
--

INSERT INTO `sls_payments` (`pk_no`, `f_customer_pk_no`, `transaction_id`, `status`, `tran_date`, `tran_id`, `val_id`, `amount`, `store_amount`, `bank_tran_id`, `card_type`, `emi_instalment`, `emi_amount`, `emi_description`, `emi_issuer`, `card_no`, `card_issuer`, `card_brand`, `card_issuer_country`, `card_issuer_country_code`, `APIConnect`, `validated_on`, `gw_version`, `payment_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `payment_type`, `f_prod_pk_no`, `f_promotion_details_no`, `f_package_pk_no`, `add_limit`, `expired_on`, `date`, `name`, `email`, `phone`, `billing_city`, `billing_state`, `zip_code`, `address`) VALUES
(2, 18, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 11:10:43', NULL, NULL, '2022-08-07 11:10:43', 18, '2022-08-07 11:10:43', NULL, NULL, NULL, NULL, 1, '0', '2022-09-07 11:10:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 7, 'he53wuKMJs2Shcp', 'Due', '2022-08-07', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:10:14', NULL, '2022-08-07 13:10:14', '2022-08-07 13:10:14', 7, '2022-08-07 13:10:14', 7, 'package', NULL, NULL, 3, '50', '2022-10-07 13:10:14', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'Banani', 'Dhaka', '1213', 'Bashati Horizon #20, Road #17, Banani-1213'),
(9, 20, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:14:12', NULL, NULL, '2022-08-07 13:14:12', 20, '2022-08-07 13:14:12', NULL, NULL, NULL, NULL, 1, '0', '2022-09-07 13:14:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 20, 'MByCEKSD0OYKmf6', 'VALID', '2022-08-07', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:15:38', NULL, '2022-08-07 13:15:38', '2022-08-07 13:15:38', 20, '2022-08-07 13:47:15', 1, 'package', NULL, NULL, 3, '50', '2022-10-07 13:15:38', NULL, 'Asia', 'asiaphtlbd@gmail.com', '01995842541', 'Banani', 'Dhaka', '1213', 'Bashati'),
(12, 20, 'WWnoRCUiOzRHKqC', 'VALID', '2022-08-08', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-08 22:05:21', NULL, '2022-08-08 22:05:21', '2022-08-08 22:05:21', 20, '2022-08-09 14:55:16', 1, 'package', NULL, NULL, 3, '50', '2022-10-08 22:05:21', NULL, 'Asia', 'asiaphtlbd@gmail.com', '01990572321', 'dhaka', 'dhaka', '1213', 'dhaka'),
(13, 23, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 12:04:52', NULL, NULL, '2022-08-12 12:04:52', 23, '2022-08-12 12:04:52', NULL, NULL, NULL, NULL, 1, '0', '2022-09-12 12:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 25, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-14 00:01:05', NULL, NULL, '2022-08-14 00:01:05', 25, '2022-08-14 00:01:05', NULL, NULL, NULL, NULL, 1, '0', '2022-09-14 00:01:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 26, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-14 12:29:06', NULL, NULL, '2022-08-14 12:29:06', 26, '2022-08-14 12:29:06', NULL, NULL, NULL, NULL, 1, '0', '2022-09-14 12:29:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 28, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-14 18:42:44', NULL, NULL, '2022-08-14 18:42:44', 28, '2022-08-14 18:42:44', NULL, NULL, NULL, NULL, 1, '0', '2022-09-14 18:42:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 28, 'xFBuihYPSisKDuO', 'VALID', '2022-08-14', NULL, NULL, 49.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-14 19:15:00', NULL, '2022-08-14 19:15:00', '2022-08-14 19:15:00', 28, '2022-08-17 01:03:30', 1, 'package', NULL, NULL, 7, '50', '2023-05-14 19:15:00', NULL, 'Muaz AA', 'extra.muaz@gmail.com', '0767018447', 'Colombo', 'Western Province', '10250', '42B Rathnawali Rd Kalubowila'),
(18, 26, 'gl6GjNvdCDOBDFW', 'VALID', '2022-08-14', NULL, NULL, 49.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-14 19:15:14', NULL, '2022-08-14 19:15:14', '2022-08-14 19:15:14', 26, '2022-08-17 01:03:18', 1, 'package', NULL, NULL, 7, '50', '2023-05-14 19:15:14', NULL, 'Anees Ahamed', 'ahamed622@gmail.com', '94776628447', 'Colombo', 'Western', '10350', 'dehiwela'),
(19, 29, 'UEbWZyqaot1deO9', 'Due', '2022-08-15', NULL, NULL, 49.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-15 20:14:51', NULL, '2022-08-15 20:14:51', '2022-08-15 20:14:51', 29, '2022-08-15 20:14:51', 29, 'package', NULL, NULL, 7, '50', '2023-05-15 20:14:51', NULL, 'sdsa', 'rony@gmail.com', '01990572321', 'dhaka', 'Dhaka', '1213', 'House #2, Road #2, Block-K, Ba\r\nDhaka-1212, Bangladesh'),
(20, 29, 'GCXv6yfkQj8VEjy', 'VALID', '2022-08-15', NULL, NULL, 49.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-15 20:16:08', NULL, '2022-08-15 20:16:08', '2022-08-15 20:16:08', 29, '2022-08-15 20:17:12', 1, 'package', NULL, NULL, 7, '50', '2023-05-15 20:16:08', NULL, 'sdsa', 'rony@gmail.com', '01990572321', 'dhaka', 'Dhaka', '1213', 'House #2, Road #2, Block-K, Ba\r\nDhaka-1212, Bangladesh'),
(21, 31, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-19 10:19:18', NULL, NULL, '2022-08-19 10:19:18', 31, '2022-08-19 10:19:18', NULL, NULL, NULL, NULL, 1, '0', '2022-09-19 10:19:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 26, 'yiv9GFsc6e8xMLH', 'VALID', '2022-08-22', NULL, NULL, 2000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 11:00:40', NULL, '2022-08-22 11:00:40', '2022-08-22 11:00:40', 26, '2022-08-22 11:19:50', 1, 'package', NULL, NULL, 2, '4', '2022-09-22 11:00:40', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'dhaka', 'dhaka', '1234', 'dhaka, banani'),
(23, 26, '0lfQXzbFFzyH2Dr', 'Due', '2022-08-24', NULL, NULL, 665.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-24 15:26:50', NULL, '2022-08-24 15:26:50', '2022-08-24 15:26:50', 26, '2022-08-24 15:26:50', 26, 'promotion', 15, 1, NULL, '0', '2022-08-30 15:26:50', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'dhaka', 'banani', '1234', 'dhaka'),
(24, 26, '2JyTq4p9zPCWR8c', 'VALID', '2022-08-31', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-31 11:30:03', NULL, '2022-08-31 11:30:03', '2022-08-31 11:30:03', 26, '2022-08-31 11:31:00', 1, 'package', NULL, NULL, 3, '50', '2022-10-31 11:30:03', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'dhaka', 'dhaka', '1234', 'dhaka'),
(25, 32, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-31 11:58:35', NULL, NULL, '2022-08-31 11:58:35', 32, '2022-08-31 11:58:35', NULL, NULL, NULL, NULL, 1, '0', '2022-10-01 11:58:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 33, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-01 22:22:44', NULL, NULL, '2022-09-01 22:22:44', 33, '2022-09-01 22:22:44', NULL, NULL, NULL, NULL, 1, '0', '2022-10-01 22:22:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 35, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-16 05:32:31', NULL, NULL, '2022-10-16 05:32:31', 35, '2022-10-16 05:32:31', NULL, NULL, NULL, NULL, 1, '0', '2022-11-16 05:32:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 36, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-20 01:30:15', NULL, NULL, '2022-10-20 01:30:15', 36, '2022-10-20 01:30:15', NULL, NULL, NULL, NULL, 1, '0', '2022-11-20 01:30:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 37, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-21 21:44:02', NULL, NULL, '2022-10-21 21:44:02', 37, '2022-10-21 21:44:02', NULL, NULL, NULL, NULL, 1, '0', '2022-11-21 21:44:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 38, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-03 02:17:21', NULL, NULL, '2022-11-03 02:17:21', 38, '2022-11-03 02:17:21', NULL, NULL, NULL, NULL, 1, '0', '2022-12-03 02:17:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 40, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 12:21:24', NULL, NULL, '2022-11-26 12:21:24', 40, '2022-11-26 12:21:24', NULL, NULL, NULL, NULL, 1, '0', '2022-12-26 12:21:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 41, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 14:36:48', NULL, NULL, '2022-11-26 14:36:48', 41, '2022-11-26 14:36:48', NULL, NULL, NULL, NULL, 1, '0', '2022-12-26 14:36:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 26, 'RQiHXA26tHLJVsH', 'VALID', '2022-12-13', NULL, NULL, 2000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-13 17:25:12', NULL, '2022-12-13 17:25:12', '2022-12-13 17:25:12', 26, '2022-12-13 17:28:22', 1, 'package', NULL, NULL, 2, '4', '2023-01-13 17:25:12', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'dhaka', 'dhaka', '1234', 'dhaka'),
(44, 47, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-14 17:11:11', NULL, NULL, '2022-12-14 17:11:11', 47, '2022-12-14 17:11:11', NULL, NULL, NULL, NULL, 1, '0', '2023-01-14 17:11:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 48, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 13:44:12', NULL, NULL, '2022-12-15 13:44:12', 48, '2022-12-15 13:44:12', NULL, NULL, NULL, NULL, 1, '8', '2023-01-15 13:44:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 48, 'fcWBJLCcHFFXzHe', 'VALID', '2022-12-15', NULL, NULL, 1275.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 13:54:54', NULL, '2022-12-15 13:54:54', '2022-12-15 13:54:54', 48, '2022-12-15 13:55:10', 1, 'promotion', 34, 4, NULL, '0', '2022-12-30 13:54:54', NULL, 'Masud Rana', 'admin@gmail.com', '01551066777', 'Dhaka', 'Bangladesh', '3131', 'New Colombo'),
(47, 48, 'P16Zsg2VFLoD1bX', 'VALID', '2022-12-15', NULL, NULL, 1700.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 13:57:26', NULL, '2022-12-15 13:57:26', '2022-12-15 13:57:26', 48, '2022-12-15 13:57:42', 1, 'promotion', 35, 6, NULL, '0', '2022-12-30 13:57:26', NULL, 'Safwan Ahmmed', 'masudrana.tapu1998@gmail.com', '01551066777341', 'Dhaka', 'Bangladesh', '3131', 'New Dhaka'),
(48, 49, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 16:10:04', NULL, NULL, '2022-12-15 16:10:04', 49, '2022-12-15 16:10:04', NULL, NULL, NULL, NULL, 1, '8', '2023-01-15 16:10:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 50, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 16:12:31', NULL, NULL, '2022-12-15 16:12:31', 50, '2022-12-15 16:12:31', NULL, NULL, NULL, NULL, 1, '8', '2023-01-15 16:12:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 50, 'hnqxkg2WMAHZlpw', 'VALID', '2022-12-15', NULL, NULL, 49.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 16:32:38', NULL, '2022-12-15 16:32:38', '2022-12-15 16:32:38', 50, '2022-12-15 16:33:10', 1, 'package', NULL, NULL, 7, '50', '2023-09-15 16:32:38', NULL, 'Mubarak', 'mubaraktech355@gmail.com', '94743488449', 'Kandy', 'Kandy', '32560', 'Gampola, Kandy City'),
(51, 46, 'O5YnA64DRESLGuq', 'VALID', '2022-12-15', NULL, NULL, 49.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 16:44:12', NULL, '2022-12-15 16:44:12', '2022-12-15 16:44:12', 46, '2022-12-15 16:45:12', 1, 'package', NULL, NULL, 7, '50', '2023-09-15 16:44:12', NULL, 'Mubarak Hossain', 'khiljimonstar355@gmail.com', '94743488444', 'Mahargama', 'Mahargama', '45621', 'Mahargama,Colombo'),
(52, 51, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-15 19:20:53', NULL, NULL, '2022-12-15 19:20:53', 51, '2022-12-15 19:20:53', NULL, NULL, NULL, NULL, 1, '8', '2023-01-15 19:20:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 25, 'uHVHYLMzmeDoUEv', 'Due', '2022-12-17', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-17 20:53:55', NULL, '2022-12-17 20:53:55', '2022-12-17 20:53:55', 25, '2022-12-17 20:53:55', 25, 'package', NULL, NULL, 3, '50', '2023-02-17 20:53:55', NULL, 'Anees Ahamed', 'ahamed622@gmail.com', '776628447', 'Colombo', 'Western', '10350', '42b'),
(54, 51, 'V3Rf4vX4Mfbw8OU', 'VALID', '2022-12-19', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-19 15:41:34', NULL, '2022-12-19 15:41:34', '2022-12-19 15:41:34', 51, '2022-12-19 16:09:14', 1, 'package', NULL, NULL, 3, '50', '2023-02-19 15:41:34', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'colombo', 'colombo', '1234', 'demo'),
(55, 52, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 18:37:15', NULL, NULL, '2022-12-28 18:37:15', 52, '2022-12-28 18:37:15', NULL, NULL, NULL, NULL, 1, '8', '2023-01-28 18:37:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 52, 'htXiSPsFYFcXxio', 'VALID', '2022-12-28', NULL, NULL, 7000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 18:44:41', NULL, '2022-12-28 18:44:41', '2022-12-28 18:44:41', 52, '2022-12-28 18:45:17', 1, 'package', NULL, NULL, 4, '200', '2023-02-28 18:44:41', NULL, 'Md Mridul', 'mdmridul608@gmail.com', '123456789', 'Gazipur', 'Asia', '1470', 'mawna'),
(57, 52, 'Pi8AEYQPvTpnX3s', 'Due', '2022-12-28', NULL, NULL, 1800.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 19:00:45', NULL, '2022-12-28 19:00:45', '2022-12-28 19:00:45', 52, '2022-12-28 19:00:45', 52, 'promotion', 48, 1, NULL, '0', '2023-01-03 19:00:45', NULL, 'Md Mridul', 'mdmridul608@gmail.com', '123456789', 'Gazipur', 'gazipur', '1740', 'maw');

--
-- Triggers `sls_payments`
--
DELIMITER $$
CREATE TRIGGER `after_sls_payments_insert` AFTER INSERT ON `sls_payments` FOR EACH ROW begin 
	declare var_promotion varchar(40) default 'Basic'; 
	declare var_day_limit int default 0; 
			
			if new.payment_type = 'promotion' then 
				select title, day_limit into var_promotion, var_day_limit
					from sls_promotion_details 
					where round(price) = round(new.amount)
					and pk_no = new.f_promotion_details_no;

				update prd_master 
					set promotion = var_promotion, 
					promotion_to = DATE(NOW() + INTERVAL var_day_limit DAY)  
					where prd_master.pk_no = new.f_prod_pk_no;
			
			end if;

			if new.payment_type = 'package' then 
				update ss_customers 
					set package_id = new.f_package_pk_no,
					package_start_date = CURRENT_DATE(),
					 package_end_date = DATE(NOW() + interval 30 day) 
				where ss_customers.id = new.f_customer_pk_no ;
			end if;

	end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sls_promotions`
--

CREATE TABLE `sls_promotions` (
  `pk_no` int(3) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  `updated_by` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sls_promotions`
--

INSERT INTO `sls_promotions` (`pk_no`, `title`, `name`, `description`, `is_active`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Top', 'Top', 'Place your ad at Top of listing to get more views and be part of our advertisement', 1, NULL, NULL, NULL, NULL),
(2, 'Urgent', 'Urgent', 'Place your ad at Urgent of listing to get more views and be part of our advertisement', 1, NULL, NULL, NULL, NULL),
(3, 'Feature', 'Feature', 'Place your ad at Featured of listing to get more views and be part of our advertisement', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sls_promotion_details`
--

CREATE TABLE `sls_promotion_details` (
  `pk_no` int(3) NOT NULL,
  `f_promotion_pk_no` int(3) NOT NULL,
  `day_limit` int(3) NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(3) DEFAULT NULL,
  `updated_by` int(3) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sls_promotion_details`
--

INSERT INTO `sls_promotion_details` (`pk_no`, `f_promotion_pk_no`, `day_limit`, `price`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `title`) VALUES
(1, 1, 6, 700, 1, NULL, '2020-12-22 20:17:31', NULL, 1, 'Top'),
(2, 1, 15, 1000, 1, NULL, NULL, NULL, NULL, 'Top'),
(3, 2, 7, 1000, 1, NULL, NULL, NULL, NULL, 'Urgent'),
(4, 2, 15, 1500, 1, NULL, NULL, NULL, NULL, 'Urgent'),
(5, 3, 7, 1500, 1, NULL, NULL, NULL, NULL, 'Feature'),
(6, 3, 15, 2000, 1, NULL, NULL, NULL, NULL, 'Feature');

-- --------------------------------------------------------

--
-- Table structure for table `ss_areas`
--

CREATE TABLE `ss_areas` (
  `pk_no` int(11) NOT NULL,
  `city_division` enum('city','division') COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_pk_no` int(11) DEFAULT NULL,
  `division_pk_no` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ss_areas`
--

INSERT INTO `ss_areas` (`pk_no`, `city_division`, `city_pk_no`, `division_pk_no`, `name`, `name_bn`, `url_slug`, `order_id`, `status`, `comments`, `is_active`, `is_delete`, `total_post`, `active_post`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(2, 'city', 1, NULL, 'Nugegoda', NULL, 'nugegoda', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-07 10:56:30', NULL, '2022-08-07 10:56:30'),
(3, 'city', 1, NULL, 'Piliyandala', NULL, 'piliyandala', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-07 10:56:42', NULL, '2022-08-07 10:56:42'),
(4, 'city', 11, NULL, 'Mawanella', NULL, 'mawanella', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:25:45', NULL, '2022-08-13 09:25:45'),
(5, 'city', 11, NULL, 'Rambukkana', NULL, 'rambukkana', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:26:22', NULL, '2022-08-13 09:26:22'),
(6, 'city', 11, NULL, 'Kegalle', NULL, 'kegalle', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:26:35', NULL, '2022-08-13 09:26:35'),
(7, 'city', 11, NULL, 'Warakapola', NULL, 'warakapola', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:28:04', NULL, '2022-08-13 09:28:04'),
(8, 'city', 11, NULL, 'Ruwanwella', NULL, 'ruwanwella', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:28:32', NULL, '2022-08-13 09:28:32'),
(9, 'city', 11, NULL, 'Galigamuwa', NULL, 'galigamuwa', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:28:49', NULL, '2022-08-13 09:28:49'),
(10, 'city', 11, NULL, 'Deraniyagala', NULL, 'deraniyagala', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:29:10', NULL, '2022-08-13 09:29:10'),
(11, 'city', 11, NULL, 'Yatiyantota', NULL, 'yatiyantota', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:29:30', NULL, '2022-08-13 09:29:30'),
(12, 'city', 11, NULL, 'Dehiowita', NULL, 'dehiowita', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:29:44', NULL, '2022-08-13 09:29:44'),
(13, 'city', 11, NULL, 'Kitulgala', NULL, 'kitulgala', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:30:08', NULL, '2022-08-13 09:30:08'),
(14, 'city', 1, NULL, 'Kottawa', NULL, 'kottawa', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:35:54', NULL, '2022-08-13 09:35:54'),
(15, 'city', 1, NULL, 'Dehiwala', NULL, 'dehiwala', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:36:30', NULL, '2022-08-13 09:36:30'),
(17, 'city', 1, NULL, 'Homagama', NULL, 'homagama', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:37:22', NULL, '2022-08-13 09:37:22'),
(24, 'city', 1, NULL, 'Kaduwela', NULL, 'kaduwela', 10, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:08', NULL, '2022-08-14 12:35:08'),
(26, 'city', 1, NULL, 'Boralesgamuwa', NULL, 'boralesgamuwa', 12, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:18', NULL, '2022-08-14 12:35:18'),
(27, 'city', 1, NULL, 'Battaramulla', NULL, 'battaramulla', 13, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:22', NULL, '2022-08-14 12:35:22'),
(28, 'city', 1, NULL, 'Malabe', NULL, 'malabe', 14, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:26', NULL, '2022-08-14 12:35:26'),
(29, 'city', 1, NULL, 'Moratuwa', NULL, 'moratuwa', 15, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:30', NULL, '2022-08-14 12:35:30'),
(30, 'city', 1, NULL, 'Athurugiriya', NULL, 'athurugiriya', 16, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:35', NULL, '2022-08-14 12:35:35'),
(31, 'city', 1, NULL, 'Rajagiriya', NULL, 'rajagiriya', 17, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:40', NULL, '2022-08-14 12:35:40'),
(33, 'city', 1, NULL, 'Talawatugoda', NULL, 'talawatugoda', 19, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:50', NULL, '2022-08-14 12:35:50'),
(34, 'city', 1, NULL, 'Pannipitiya', NULL, 'pannipitiya', 20, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:35:56', NULL, '2022-08-14 12:35:56'),
(35, 'city', 1, NULL, 'Wellampitiya', NULL, 'wellampitiya', 21, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:01', NULL, '2022-08-14 12:36:01'),
(36, 'city', 1, NULL, 'Padukka', NULL, 'padukka', 22, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:05', NULL, '2022-08-14 12:36:05'),
(37, 'city', 1, NULL, 'Colombo', NULL, 'colombo', 23, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:09', NULL, '2022-08-14 12:36:09'),
(38, 'city', 1, NULL, 'Meegoda', NULL, 'meegoda', 24, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:24', NULL, '2022-08-14 12:36:24'),
(42, 'city', 1, NULL, 'Mount Lavinia', NULL, 'mount-lavinia', 28, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:43', NULL, '2022-08-14 12:36:43'),
(43, 'city', 1, NULL, 'Kotte', NULL, 'kotte', 29, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:47', NULL, '2022-08-14 12:36:47'),
(45, 'city', 1, NULL, 'Ratmalana', NULL, 'ratmalana', 31, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:36:56', NULL, '2022-08-14 12:36:56'),
(46, 'city', 1, NULL, 'Nawala', NULL, 'nawala', 32, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:03', NULL, '2022-08-14 12:37:03'),
(48, 'city', 1, NULL, 'Angoda', NULL, 'angoda', 34, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:12', NULL, '2022-08-14 12:37:12'),
(49, 'city', 1, NULL, 'Kolonnawa', NULL, 'kolonnawa', 35, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:16', NULL, '2022-08-14 12:37:16'),
(50, 'city', 1, NULL, 'Godagama', NULL, 'godagama', 36, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:26', NULL, '2022-08-14 12:37:26'),
(51, 'city', 1, NULL, 'Kesbewa', NULL, 'kesbewa', 37, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:33', NULL, '2022-08-14 12:37:33'),
(52, 'city', 1, NULL, 'Hanwella', NULL, 'hanwella', 38, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:38', NULL, '2022-08-14 12:37:38'),
(54, 'city', 1, NULL, 'Kohuwala', NULL, 'kohuwala', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:37:51', NULL, '2022-08-19 00:12:28'),
(56, 'city', 1, NULL, 'Avissawella', NULL, 'avissawella', 41, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:38:02', NULL, '2022-08-14 12:38:02'),
(62, 'city', 9, NULL, 'Gampaha City', NULL, 'gampaha-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:45:58', NULL, '2022-08-14 12:45:58'),
(63, 'city', 9, NULL, 'Negombo', NULL, 'negombo', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:46:13', NULL, '2022-08-14 12:46:13'),
(64, 'city', 9, NULL, 'Kiribathgoda', NULL, 'kiribathgoda', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 12:46:19', NULL, '2022-08-14 12:46:19'),
(65, 'city', 9, NULL, 'Wattala', NULL, 'wattala', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:15', NULL, '2022-08-14 13:07:15'),
(66, 'city', 9, NULL, 'Kadawatha', NULL, 'kadawatha', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:21', NULL, '2022-08-14 13:07:21'),
(67, 'city', 9, NULL, 'Ja-Ela', NULL, 'ja-ela', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:25', NULL, '2022-08-14 13:07:25'),
(68, 'city', 9, NULL, 'Kelaniya', NULL, 'kelaniya', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:29', NULL, '2022-08-14 13:07:29'),
(69, 'city', 9, NULL, 'Delgoda', NULL, 'delgoda', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:33', NULL, '2022-08-14 13:07:33'),
(70, 'city', 9, NULL, 'Nittambuwa', NULL, 'nittambuwa', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:39', NULL, '2022-08-14 13:07:39'),
(71, 'city', 9, NULL, 'Minuwangoda', NULL, 'minuwangoda', 10, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:44', NULL, '2022-08-14 13:07:44'),
(72, 'city', 9, NULL, 'Katunayake', NULL, 'katunayake', 11, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:48', NULL, '2022-08-14 13:07:48'),
(73, 'city', 9, NULL, 'Ragama', NULL, 'ragama', 12, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:52', NULL, '2022-08-14 13:07:52'),
(74, 'city', 9, NULL, 'Seeduwa', NULL, 'seeduwa', 13, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:07:57', NULL, '2022-08-14 13:07:57'),
(75, 'city', 9, NULL, 'Kandana', NULL, 'kandana', 14, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:02', NULL, '2022-08-14 13:08:02'),
(76, 'city', 9, NULL, 'Ganemulla', NULL, 'ganemulla', 15, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:07', NULL, '2022-08-14 13:08:07'),
(77, 'city', 9, NULL, 'Veyangoda', NULL, 'veyangoda', 16, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:11', NULL, '2022-08-14 13:08:11'),
(78, 'city', 9, NULL, 'Divulapitiya', NULL, 'divulapitiya', 17, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:16', NULL, '2022-08-14 13:08:16'),
(79, 'city', 9, NULL, 'Mirigama', NULL, 'mirigama', 18, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:21', NULL, '2022-08-14 13:08:21'),
(80, 'city', 2, NULL, 'Kandy City', NULL, 'kandy-city', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:32', NULL, '2022-08-14 13:08:32'),
(81, 'city', 2, NULL, 'Gampola', NULL, 'gampola', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:43', NULL, '2022-08-14 13:08:43'),
(82, 'city', 2, NULL, 'Katugastota', NULL, 'katugastota', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:47', NULL, '2022-08-14 13:08:47'),
(83, 'city', 2, NULL, 'Peradeniya', NULL, 'peradeniya', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:51', NULL, '2022-08-14 13:08:51'),
(84, 'city', 2, NULL, 'Akurana', NULL, 'akurana', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:54', NULL, '2022-08-14 13:08:54'),
(85, 'city', 2, NULL, 'Pilimatalawa', NULL, 'pilimatalawa', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:08:59', NULL, '2022-08-14 13:08:59'),
(86, 'city', 2, NULL, 'Gelioya', NULL, 'gelioya', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:03', NULL, '2022-08-14 13:09:03'),
(87, 'city', 2, NULL, 'Digana', NULL, 'digana', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:07', NULL, '2022-08-14 13:09:07'),
(88, 'city', 2, NULL, 'Kundasale', NULL, 'kundasale', 10, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:11', NULL, '2022-08-14 13:09:11'),
(89, 'city', 2, NULL, 'Nawalapitiya', NULL, 'nawalapitiya', 11, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:15', NULL, '2022-08-14 13:09:15'),
(90, 'city', 2, NULL, 'Galagedara', NULL, 'galagedara', 12, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:19', NULL, '2022-08-14 13:09:19'),
(91, 'city', 2, NULL, 'Wattegama', NULL, 'wattegama', 13, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:23', NULL, '2022-08-14 13:09:23'),
(92, 'city', 2, NULL, 'Madawala Bazaar', NULL, 'madawala-bazaar', 14, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:27', NULL, '2022-08-14 13:09:27'),
(93, 'city', 2, NULL, 'Ampitiya', NULL, 'ampitiya', 15, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:30', NULL, '2022-08-14 13:09:30'),
(94, 'city', 2, NULL, 'Kadugannawa', NULL, 'kadugannawa', 16, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:36', NULL, '2022-08-14 13:09:36'),
(95, 'city', 2, NULL, 'Menikhinna', NULL, 'menikhinna', 17, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:09:40', NULL, '2022-08-14 13:09:40'),
(96, 'city', 10, NULL, 'Horana', NULL, 'horana', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:01', NULL, '2022-08-14 13:10:01'),
(97, 'city', 10, NULL, 'Kalutara City', NULL, 'kalutara-city', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:07', NULL, '2022-08-14 13:10:07'),
(98, 'city', 10, NULL, 'Panadura', NULL, 'panadura', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:13', NULL, '2022-08-14 13:10:13'),
(99, 'city', 10, NULL, 'Wadduwa', NULL, 'wadduwa', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:18', NULL, '2022-08-14 13:10:18'),
(100, 'city', 10, NULL, 'Matugam', NULL, 'matugam', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:23', NULL, '2022-08-14 13:10:23'),
(101, 'city', 10, NULL, 'Bandaragama', NULL, 'bandaragama', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:28', NULL, '2022-08-14 13:10:28'),
(102, 'city', 10, NULL, 'Alutgama', NULL, 'alutgama', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:33', NULL, '2022-08-14 13:10:33'),
(103, 'city', 10, NULL, 'Beruwala', NULL, 'beruwala', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:38', NULL, '2022-08-14 13:10:38'),
(104, 'city', 10, NULL, 'Ingiriya', NULL, 'ingiriya', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:42', NULL, '2022-08-14 13:10:42'),
(105, 'city', 16, NULL, 'Kurunegala City ', NULL, 'kurunegala-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:10:58', NULL, '2022-08-14 13:10:58'),
(106, 'city', 16, NULL, 'Kuliyapitiya', NULL, 'kuliyapitiya', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:07', NULL, '2022-08-14 13:11:07'),
(107, 'city', 16, NULL, 'Narammala', NULL, 'narammala', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:11', NULL, '2022-08-14 13:11:11'),
(108, 'city', 16, NULL, 'Wariyapola', NULL, 'wariyapola', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:16', NULL, '2022-08-14 13:11:16'),
(109, 'city', 16, NULL, 'Polgahawela', NULL, 'polgahawela', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:21', NULL, '2022-08-14 13:11:21'),
(110, 'city', 16, NULL, 'Ibbagamuwa', NULL, 'ibbagamuwa', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:27', NULL, '2022-08-14 13:11:27'),
(111, 'city', 16, NULL, 'Pannala', NULL, 'pannala', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:32', NULL, '2022-08-14 13:11:32'),
(112, 'city', 16, NULL, 'Mawathagama', NULL, 'mawathagama', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:39', NULL, '2022-08-14 13:11:39'),
(113, 'city', 16, NULL, 'Nikaweratiya', NULL, 'nikaweratiya', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:44', NULL, '2022-08-14 13:11:44'),
(114, 'city', 16, NULL, 'Alawwa', NULL, 'alawwa', 10, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:49', NULL, '2022-08-14 13:11:49'),
(115, 'city', 16, NULL, 'Hettipola', NULL, 'hettipola', 11, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:53', NULL, '2022-08-14 13:11:53'),
(116, 'city', 16, NULL, 'Giriulla', NULL, 'giriulla', 12, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:11:58', NULL, '2022-08-14 13:11:58'),
(117, 'city', 16, NULL, 'Galgamuwa', NULL, 'galgamuwa', 13, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:03', NULL, '2022-08-14 13:12:03'),
(118, 'city', 16, NULL, 'Bingiriya', NULL, 'bingiriya', 14, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:08', NULL, '2022-08-14 13:12:08'),
(119, 'city', 3, NULL, 'Galle City', NULL, 'galle-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:22', NULL, '2022-08-14 13:12:22'),
(120, 'city', 3, NULL, 'Ambalangoda', NULL, 'ambalangoda', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:26', NULL, '2022-08-14 13:12:26'),
(121, 'city', 3, NULL, 'Bentota', NULL, 'bentota', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:29', NULL, '2022-08-14 13:12:29'),
(122, 'city', 3, NULL, 'Elpitiya', NULL, 'elpitiya', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:32', NULL, '2022-08-14 13:12:32'),
(123, 'city', 3, NULL, 'Baddegama', NULL, 'baddegama', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:36', NULL, '2022-08-14 13:12:36'),
(124, 'city', 3, NULL, 'Hikkaduwa', NULL, 'hikkaduwa', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:39', NULL, '2022-08-14 13:12:39'),
(125, 'city', 3, NULL, 'Karapitiya', NULL, 'karapitiya', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:44', NULL, '2022-08-14 13:12:44'),
(126, 'city', 3, NULL, 'Ahangama', NULL, 'ahangama', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:51', NULL, '2022-08-14 13:12:51'),
(127, 'city', 3, NULL, 'Batapola', NULL, 'batapola', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:12:54', NULL, '2022-08-14 13:12:54'),
(128, 'city', 12, NULL, 'Ratnapura City', NULL, 'ratnapura-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:08', NULL, '2022-08-14 13:13:08'),
(129, 'city', 12, NULL, 'Embilipitiya', NULL, 'embilipitiya', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:14', NULL, '2022-08-14 13:13:14'),
(130, 'city', 12, NULL, 'Balangoda', NULL, 'balangoda', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:18', NULL, '2022-08-14 13:13:18'),
(131, 'city', 12, NULL, 'Pelmadulla', NULL, 'pelmadulla', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:23', NULL, '2022-08-14 13:13:23'),
(132, 'city', 12, NULL, 'Eheliyagoda', NULL, 'eheliyagoda', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:28', NULL, '2022-08-14 13:13:28'),
(133, 'city', 12, NULL, 'Kuruwita', NULL, 'kuruwita', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:32', NULL, '2022-08-14 13:13:32'),
(134, 'city', 13, NULL, 'Matara City', NULL, 'matara-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:46', NULL, '2022-08-14 13:13:46'),
(135, 'city', 13, NULL, 'Dikwella', NULL, 'dikwella', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:13:53', NULL, '2022-08-14 13:13:53'),
(136, 'city', 13, NULL, 'Akuressa', NULL, 'akuressa', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:04', NULL, '2022-08-14 13:14:04'),
(137, 'city', 13, NULL, 'Weligama', NULL, 'weligama', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:11', NULL, '2022-08-14 13:14:11'),
(138, 'city', 13, NULL, 'Hakmana', NULL, 'hakmana', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:19', NULL, '2022-08-14 13:14:19'),
(139, 'city', 13, NULL, 'Deniyaya', NULL, 'deniyaya', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:33', NULL, '2022-08-14 13:14:33'),
(140, 'city', 13, NULL, 'Kamburupitiya', NULL, 'kamburupitiya', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:39', NULL, '2022-08-14 13:14:39'),
(141, 'city', 13, NULL, 'Kekanadurra', NULL, 'kekanadurra', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:50', NULL, '2022-08-14 13:14:50'),
(142, 'city', 13, NULL, 'Kamburugamuwa', NULL, 'kamburugamuwa', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:14:56', NULL, '2022-08-14 13:14:56'),
(143, 'city', 13, NULL, 'Gandara', NULL, 'gandara', 10, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:03', NULL, '2022-08-14 13:15:03'),
(144, 'city', 18, NULL, 'Puttalam City', NULL, 'puttalam-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:15', NULL, '2022-08-14 13:15:15'),
(145, 'city', 18, NULL, 'Chilaw', NULL, 'chilaw', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:20', NULL, '2022-08-14 13:15:20'),
(146, 'city', 18, NULL, 'Wennappuwa', NULL, 'wennappuwa', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:25', NULL, '2022-08-14 13:15:25'),
(147, 'city', 18, NULL, 'Nattandiya', NULL, 'nattandiya', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:36', NULL, '2022-08-14 13:15:36'),
(148, 'city', 18, NULL, 'Dankotuwa', NULL, 'dankotuwa', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:45', NULL, '2022-08-14 13:15:45'),
(149, 'city', 18, NULL, 'Marawila', NULL, 'marawila', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:49', NULL, '2022-08-14 13:15:49'),
(150, 'city', 18, NULL, 'Anamaduwa', NULL, 'anamaduwa', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:15:55', NULL, '2022-08-14 13:15:55'),
(151, 'city', 6, NULL, 'Anuradhapura City', NULL, 'anuradhapura-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:08', NULL, '2022-08-14 13:16:08'),
(152, 'city', 6, NULL, 'Kekirawa', NULL, 'kekirawa', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:17', NULL, '2022-08-14 13:16:17'),
(153, 'city', 6, NULL, 'Medawachchiya', NULL, 'medawachchiya', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:21', NULL, '2022-08-14 13:16:21'),
(154, 'city', 6, NULL, 'Tambuttegama', NULL, 'tambuttegama', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:25', NULL, '2022-08-14 13:16:25'),
(155, 'city', 6, NULL, 'Eppawala', NULL, 'eppawala', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:29', NULL, '2022-08-14 13:16:29'),
(156, 'city', 6, NULL, 'Mihintale', NULL, 'mihintale', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:34', NULL, '2022-08-14 13:16:34'),
(157, 'city', 6, NULL, 'Habarana', NULL, 'habarana', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:40', NULL, '2022-08-14 13:16:40'),
(158, 'city', 6, NULL, 'Galnewa', NULL, 'galnewa', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:44', NULL, '2022-08-14 13:16:44'),
(159, 'city', 6, NULL, 'Nochchiyagama', NULL, 'nochchiyagama', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:48', NULL, '2022-08-14 13:16:48'),
(160, 'city', 6, NULL, 'Galenbindunuwewa', NULL, 'galenbindunuwewa', 10, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:53', NULL, '2022-08-14 13:16:53'),
(161, 'city', 6, NULL, 'Talawa', NULL, 'talawa', 11, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:16:57', NULL, '2022-08-14 13:16:57'),
(162, 'city', 11, NULL, 'Kegalle City', NULL, 'kegalle-city', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:17:23', NULL, '2022-08-14 13:17:23'),
(163, 'city', 14, NULL, 'Jaffna City', NULL, 'jaffna-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:12', NULL, '2022-08-14 13:18:12'),
(164, 'city', 14, NULL, 'Nallur', NULL, 'nallur', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:19', NULL, '2022-08-14 13:18:19'),
(165, 'city', 14, NULL, 'Chavakachcheri', NULL, 'chavakachcheri', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:24', NULL, '2022-08-14 13:18:24'),
(166, 'city', 15, NULL, 'Tangalla', NULL, 'tangalla', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:41', NULL, '2022-08-14 13:18:41'),
(167, 'city', 15, NULL, 'Beliatta', NULL, 'beliatta', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:46', NULL, '2022-08-14 13:18:46'),
(168, 'city', 15, NULL, 'Hambantota City', NULL, 'hambantota-city', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:51', NULL, '2022-08-14 13:18:51'),
(169, 'city', 15, NULL, 'Ambalantota', NULL, 'ambalantota', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:18:57', NULL, '2022-08-14 13:18:57'),
(170, 'city', 15, NULL, 'Tissamaharama', NULL, 'tissamaharama', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:19:01', NULL, '2022-08-14 13:19:01'),
(171, 'city', 4, NULL, 'Akkarepattu', NULL, 'akkarepattu', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:19:27', NULL, '2022-08-14 13:19:27'),
(172, 'city', 4, NULL, 'Ampara City', NULL, 'ampara-city', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:19:32', NULL, '2022-08-14 13:19:32'),
(173, 'city', 4, NULL, 'Kalmunai', NULL, 'kalmunai', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:19:37', NULL, '2022-08-14 13:19:37'),
(174, 'city', 4, NULL, 'Sainthamaruthu', NULL, 'sainthamaruthu', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:19:42', NULL, '2022-08-14 13:19:42'),
(175, 'city', 7, NULL, 'Badulla City', NULL, 'badulla-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:19:54', NULL, '2022-08-14 13:19:54'),
(176, 'city', 7, NULL, 'Bandarawela', NULL, 'bandarawela', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:00', NULL, '2022-08-14 13:20:00'),
(177, 'city', 7, NULL, 'Mahiyanganaya', NULL, 'mahiyanganaya', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:07', NULL, '2022-08-14 13:20:07'),
(178, 'city', 7, NULL, 'Welimada', NULL, 'welimada', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:13', NULL, '2022-08-14 13:20:13'),
(179, 'city', 7, NULL, 'Haputale', NULL, 'haputale', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:17', NULL, '2022-08-14 13:20:17'),
(180, 'city', 7, NULL, 'Passara', NULL, 'passara', 6, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:21', NULL, '2022-08-14 13:20:21'),
(181, 'city', 7, NULL, 'Hali Ela', NULL, 'hali-ela', 7, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:25', NULL, '2022-08-14 13:20:25'),
(182, 'city', 7, NULL, 'Diyatalawa', NULL, 'diyatalawa', 8, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:30', NULL, '2022-08-14 13:20:30'),
(183, 'city', 7, NULL, 'Ella', NULL, 'ella', 9, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:35', NULL, '2022-08-14 13:20:35'),
(184, 'city', 8, NULL, 'Batticaloa City', NULL, 'batticaloa-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:45', NULL, '2022-08-14 13:20:45'),
(185, 'city', 13, NULL, 'Matale City', NULL, 'matale-city', 11, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:20:56', NULL, '2022-08-14 13:20:56'),
(186, 'city', 13, NULL, 'Dambulla', NULL, 'dambulla', 12, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:13', NULL, '2022-08-14 13:21:13'),
(187, 'city', 13, NULL, 'Galewela', NULL, 'galewela', 13, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:18', NULL, '2022-08-14 13:21:18'),
(188, 'city', 13, NULL, 'Ukuwela', NULL, 'ukuwela', 14, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:23', NULL, '2022-08-14 13:21:23'),
(189, 'city', 13, NULL, 'Rattota', NULL, 'rattota', 15, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:30', NULL, '2022-08-14 13:21:30'),
(190, 'city', 13, NULL, 'Pallepola', NULL, 'pallepola', 16, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:35', NULL, '2022-08-14 13:21:35'),
(191, 'city', 13, NULL, 'Palapathwela', NULL, 'palapathwela', 17, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:39', NULL, '2022-08-14 13:21:39'),
(192, 'city', 13, NULL, 'Yatawatta', NULL, 'yatawatta', 18, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:44', NULL, '2022-08-14 13:21:44'),
(193, 'city', 19, NULL, 'Sigiriya', NULL, 'sigiriya', 19, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:21:49', NULL, '2022-08-19 00:23:13'),
(194, 'city', 28, NULL, 'Trincomalee City Kinniya', NULL, 'trincomalee-city-kinniya', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:22:29', NULL, '2022-08-14 13:22:29'),
(195, 'city', 24, NULL, 'Polonnaruwa City', NULL, 'polonnaruwa-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:23:15', NULL, '2022-08-14 13:23:15'),
(196, 'city', 24, NULL, 'Kaduruwela', NULL, 'kaduruwela', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:23:25', NULL, '2022-08-14 13:23:25'),
(197, 'city', 24, NULL, 'Hingurakgoda', NULL, 'hingurakgoda', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:23:32', NULL, '2022-08-14 13:23:32'),
(198, 'city', 24, NULL, 'Medirigiriya', NULL, 'medirigiriya', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:23:37', NULL, '2022-08-14 13:23:37'),
(199, 'city', 25, NULL, 'Monaragala City', NULL, 'monaragala-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:24:37', NULL, '2022-08-14 13:24:37'),
(200, 'city', 25, NULL, 'Wellawaya', NULL, 'wellawaya', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:24:50', NULL, '2022-08-14 13:24:50'),
(201, 'city', 25, NULL, 'Bibile', NULL, 'bibile', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:24:55', NULL, '2022-08-14 13:24:55'),
(202, 'city', 25, NULL, 'Buttala', NULL, 'buttala', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:03', NULL, '2022-08-14 13:25:03'),
(203, 'city', 25, NULL, 'Kataragama', NULL, 'kataragama', 5, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:13', NULL, '2022-08-14 13:25:13'),
(204, 'city', 26, NULL, 'Nuwara Eliya City', NULL, 'nuwara-eliya-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:32', NULL, '2022-08-14 13:25:32'),
(205, 'city', 26, NULL, 'Hatton', NULL, 'hatton', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:37', NULL, '2022-08-14 13:25:37'),
(206, 'city', 26, NULL, 'Ginigathhena', NULL, 'ginigathhena', 3, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:44', NULL, '2022-08-14 13:25:44'),
(207, 'city', 26, NULL, 'Madulla', NULL, 'madulla', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:49', NULL, '2022-08-14 13:25:49'),
(208, 'city', 20, NULL, 'Vavuniya City', NULL, 'vavuniya-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:25:58', NULL, '2022-08-14 13:25:58'),
(209, 'city', 21, NULL, 'Kilinochchi City', NULL, 'kilinochchi-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:26:10', NULL, '2022-08-14 13:26:10'),
(210, 'city', 22, NULL, 'Mannar City', NULL, 'mannar-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:26:24', NULL, '2022-08-14 13:26:24'),
(211, 'city', 23, NULL, 'Mullativu City', NULL, 'mullativu-city', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-14 13:26:34', NULL, '2022-08-14 13:26:34'),
(213, 'city', 1, NULL, 'colombo3', NULL, 'colombo3', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-19 09:04:08', NULL, '2022-08-19 09:04:08'),
(214, 'city', 1, NULL, 'colombo6', NULL, 'colombo6', 47, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-19 09:04:36', NULL, '2022-08-19 09:04:36'),
(215, 'city', 1, NULL, 'Battramulla', NULL, 'battramulla', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-19 09:05:07', NULL, '2022-08-19 09:05:07'),
(218, 'city', 1, NULL, 'Maharagama', NULL, 'maharagama', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:31:06', NULL, '2022-12-15 11:31:06'),
(219, 'city', 1, NULL, 'Colombo5', NULL, 'colombo5', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:40:02', NULL, '2022-12-15 11:40:02'),
(220, 'city', 1, NULL, 'Colombo4', NULL, 'colombo4', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:44:56', NULL, '2022-12-15 11:44:56'),
(221, 'city', 1, NULL, 'Colombo11', NULL, 'colombo11', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:46:35', NULL, '2022-12-15 11:46:35'),
(222, 'city', 1, NULL, 'Colombo10', NULL, 'colombo10', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:49:52', NULL, '2022-12-15 11:49:52'),
(223, 'city', 1, NULL, 'Colombo9', NULL, 'colombo9', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:52:17', NULL, '2022-12-15 11:52:17'),
(224, 'city', 1, NULL, 'Colombo14', NULL, 'colombo14', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 11:54:47', NULL, '2022-12-15 11:54:47'),
(225, 'city', 1, NULL, 'Colombo2', NULL, 'colombo2', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 12:02:56', NULL, '2022-12-15 12:02:56'),
(226, 'city', 1, NULL, 'Colombo13', NULL, 'colombo13', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 12:04:42', NULL, '2022-12-15 12:04:42'),
(227, 'city', 1, NULL, 'Colombo12', NULL, 'colombo12', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 12:08:07', NULL, '2022-12-15 12:08:58'),
(228, 'city', 1, NULL, 'Colombo7', NULL, 'colombo7', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 12:12:27', NULL, '2022-12-15 12:12:27'),
(229, 'city', 1, NULL, 'Colombo1', NULL, 'colombo1', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-12-15 12:16:32', NULL, '2022-12-15 12:16:32');

--
-- Triggers `ss_areas`
--
DELIMITER $$
CREATE TRIGGER `before_ss_areas_insert` BEFORE INSERT ON `ss_areas` FOR EACH ROW BEGIN
    declare vorder_id int(10) default 0;

    IF NEW.order_id IS NULL THEN
        IF NEW.city_division = 'city' THEN
                select IFNULL(max(order_id),0) into vorder_id
                from ss_areas
                where city_pk_no = NEW.city_pk_no;
        ELSE

        select IFNULL(max(order_id),0) into vorder_id
        from ss_areas
        where division_pk_no = NEW.division_pk_no;

        END IF;
        
        SET NEW.order_id = vorder_id+1 ;

    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ss_business_function`
--

CREATE TABLE `ss_business_function` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ss_business_function`
--

INSERT INTO `ss_business_function` (`pk_no`, `name`, `name_bn`, `url_slug`, `order_id`, `status`, `comments`, `is_active`, `is_delete`, `total_post`, `active_post`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Administration', NULL, 'administration', 1, 1, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(2, 'accounting_finance', NULL, 'ccounting &amp; Finance', 1, 1, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(3, 'customer_support', NULL, 'Customer Support', 1, 1, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(4, 'data_entry_analysis', NULL, 'Data Entry &amp; Analysis', 1, 1, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ss_chat`
--

CREATE TABLE `ss_chat` (
  `id` bigint(20) NOT NULL,
  `prd_pk_no` int(10) DEFAULT NULL,
  `owner_pk_no` int(10) DEFAULT NULL,
  `to_pk_no` int(10) DEFAULT NULL,
  `from_pk_no` int(10) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `data_set` bigint(20) NOT NULL DEFAULT 0,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ss_chat`
--

INSERT INTO `ss_chat` (`id`, `prd_pk_no`, `owner_pk_no`, `to_pk_no`, `from_pk_no`, `to_name`, `from_name`, `message`, `is_active`, `created_at`, `updated_at`, `created_by`, `updated_by`, `data_set`, `is_seen`) VALUES
(1, 4, 26, 26, 18, 'Rony', 'Rony', 'Hi, I am interested on your ads', 1, '2022-08-22 10:52:23', '2022-08-22 10:52:32', 18, NULL, 0, 1),
(2, 4, 26, 18, 26, 'Rony', 'Rony', 'sounds good', 1, '2022-08-22 10:52:52', '2022-08-22 11:30:13', 26, NULL, 0, 1),
(3, 26, 42, 42, 29, 'Masud', 'Rabin mia', 'fdsfdsf', 1, '2022-12-15 10:29:21', '2022-12-15 10:29:21', 29, NULL, 0, 0),
(4, 26, 42, 42, 29, 'Masud', 'Rabin mia', 'fsdfdsf', 1, '2022-12-15 10:29:25', '2022-12-15 10:29:25', 29, NULL, 0, 0);

--
-- Triggers `ss_chat`
--
DELIMITER $$
CREATE TRIGGER `before_ss_chat_insert` BEFORE INSERT ON `ss_chat` FOR EACH ROW begin
			
			declare var_customer_no int(11) default 0;
            declare var_to_name varchar(100) default null;
            declare var_from_name varchar(100) default null;
            

			select customer_pk_no into var_customer_no
				from prd_master
				where pk_no = new.prd_pk_no ;
			
            SELECT name into var_to_name from ss_customers 
            WHERE id = new.to_pk_no ;
            
            SELECT name into var_from_name from ss_customers 
            WHERE id = new.from_pk_no ;
		
			SET new.owner_pk_no = var_customer_no ;
            SET new.to_name = var_to_name;
            set new.from_name = var_from_name;
		


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ss_cities`
--

CREATE TABLE `ss_cities` (
  `pk_no` int(11) NOT NULL,
  `country_pk_no` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT 1,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ss_cities`
--

INSERT INTO `ss_cities` (`pk_no`, `country_pk_no`, `name`, `name_bn`, `url_slug`, `order_id`, `status`, `comments`, `is_active`, `total_post`, `active_post`, `created_by`, `created_at`, `updated_by`, `updated_at`, `image`) VALUES
(1, 1, 'Colombo', NULL, 'colombo', 1, NULL, NULL, 1, 8, 0, 1, '2022-08-07 10:54:39', NULL, '2022-08-07 10:54:39', NULL),
(2, 1, 'Kandy', NULL, 'kandy', 1, NULL, NULL, 1, 4, 0, 1, '2022-08-07 10:54:52', NULL, '2022-08-07 10:54:52', NULL),
(3, 1, 'Galle', NULL, 'galle', 1, NULL, NULL, 1, 2, 0, 1, '2022-08-07 10:55:05', NULL, '2022-08-07 10:55:05', NULL),
(4, 1, 'Ampara', NULL, 'ampara', 1, NULL, NULL, 1, 1, 0, 1, '2022-08-07 10:55:16', NULL, '2022-08-07 10:55:16', NULL),
(6, 1, 'Anuradhapura', NULL, 'anuradhapura', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:55:39', NULL, '2022-08-07 10:55:39', NULL),
(7, 1, 'Badulla', NULL, 'badulla', 1, NULL, NULL, 1, 1, 0, 1, '2022-08-07 10:57:34', NULL, '2022-08-07 10:57:34', NULL),
(8, 1, 'Batticaloa', NULL, 'batticaloa', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:57:48', NULL, '2022-08-07 10:57:48', NULL),
(9, 1, 'Gampaha', NULL, 'gampaha', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:13:12', NULL, '2022-08-13 09:13:12', NULL),
(10, 1, 'Kalutara', NULL, 'kalutara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:13:34', NULL, '2022-08-13 09:13:34', NULL),
(11, 1, 'Kegalle', NULL, 'kegalle', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:13:46', NULL, '2022-08-13 09:13:46', NULL),
(12, 1, 'Ratnapura', NULL, 'ratnapura', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:04', NULL, '2022-08-13 09:14:04', NULL),
(13, 1, 'Matara', NULL, 'matara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:27', NULL, '2022-08-13 09:14:27', NULL),
(14, 1, 'Jaffna', NULL, 'jaffna', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:40', NULL, '2022-08-13 09:14:40', NULL),
(15, 1, 'Hambantota', NULL, 'hambantota', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:59', NULL, '2022-08-13 09:14:59', NULL),
(16, 1, 'Kurunagala', NULL, 'kurunagala', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:15:18', NULL, '2022-08-13 09:15:18', NULL),
(18, 1, 'Puttalam', NULL, 'puttalam', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:16:28', NULL, '2022-08-13 09:16:28', NULL),
(19, 1, 'Matala', NULL, 'matala', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:16:49', NULL, '2022-08-13 09:16:49', NULL),
(20, 1, 'Vavuniya', NULL, 'vavuniya', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:07', NULL, '2022-08-13 09:17:07', NULL),
(21, 1, 'Kilinochchi', NULL, 'kilinochchi', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:25', NULL, '2022-08-13 09:17:25', NULL),
(22, 1, 'Mannar', NULL, 'mannar', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:40', NULL, '2022-08-13 09:17:40', NULL),
(23, 1, 'Mullaitivu', NULL, 'mullaitivu', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:57', NULL, '2022-08-13 09:17:57', NULL),
(24, 1, 'Polannaruwa', NULL, 'polannaruwa', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:18:27', NULL, '2022-08-13 09:18:27', NULL),
(25, 1, 'Monaragala', NULL, 'monaragala', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:18:52', NULL, '2022-08-13 09:18:52', NULL),
(26, 1, 'Nuwara Eliya', NULL, 'nuwara-eliya', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:19:19', NULL, '2022-08-13 09:19:19', NULL),
(27, 1, 'Kilinochchi', NULL, 'kilinochchi', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:23:09', NULL, '2022-08-13 09:23:09', NULL),
(28, 1, 'Trincomalee', NULL, 'trincomalee', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-14 13:22:21', NULL, '2022-08-14 13:22:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ss_contact`
--

CREATE TABLE `ss_contact` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'unseen =0, seen = 1, replied = 2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ss_country`
--

CREATE TABLE `ss_country` (
  `pk_no` int(11) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `order_id` int(2) NOT NULL,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ss_country`
--

INSERT INTO `ss_country` (`pk_no`, `code`, `name`, `comments`, `is_active`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, '+94', 'Srilanka', NULL, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ss_currency`
--

CREATE TABLE `ss_currency` (
  `pk_no` int(11) NOT NULL,
  `code` varchar(4) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ss_customers`
--

CREATE TABLE `ss_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'Individual',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile2_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile1_otp_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile2_otp_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile1_otp_code_extime` datetime DEFAULT NULL,
  `mobile2_otp_code_extime` datetime DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `gender` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highest_education` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_education` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highest_education_ins` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'highest_education_institution',
  `experience_year` decimal(2,2) DEFAULT NULL,
  `skill_summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_industry` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_function` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Current Business Function',
  `current_designation` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_started` datetime DEFAULT NULL,
  `job_notice_period` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Notice period (in days)',
  `current_job_responsibility` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_salary` decimal(6,2) DEFAULT NULL COMMENT 'Current salary (per month) (Tk)',
  `cv` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Supported file formats: DOC, DOCX, PDF, TIFF, JPG, PNG',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_no` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_id` bigint(20) UNSIGNED DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_mime_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `total_favorite` int(5) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` int(3) DEFAULT 1,
  `package_start_date` date DEFAULT NULL,
  `package_end_date` date DEFAULT NULL,
  `promotion` int(1) NOT NULL DEFAULT 0 COMMENT 'I want to receive news and promotion updates',
  `tc` int(1) NOT NULL DEFAULT 0 COMMENT 'Terms & Condition',
  `random_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ss_customers`
--

INSERT INTO `ss_customers` (`id`, `seller_type`, `name`, `email`, `mobile1`, `mobile2`, `mobile1_is_verified`, `mobile2_is_verified`, `mobile1_otp_code`, `mobile2_otp_code`, `mobile1_otp_code_extime`, `mobile2_otp_code_extime`, `area_id`, `is_active`, `is_delete`, `gender`, `linkedin`, `highest_education`, `special_education`, `highest_education_ins`, `experience_year`, `skill_summary`, `about_me`, `current_industry`, `current_function`, `current_designation`, `job_started`, `job_notice_period`, `current_job_responsibility`, `current_salary`, `cv`, `email_verified_at`, `password`, `remember_token`, `first_name`, `middle_name`, `last_name`, `alt_mobile_no`, `designation`, `auth_id`, `google_id`, `gym_id`, `profile_pic`, `profile_pic_url`, `pic_mime_type`, `user_type`, `total_post`, `total_favorite`, `status`, `created_at`, `updated_at`, `deleted_at`, `city`, `address`, `package_id`, `package_start_date`, `package_end_date`, `promotion`, `tc`, `random_token`, `is_verified`) VALUES
(4, 'Individual', 'Rony Islam', 'ronymia2212@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$32Uv2WRzAQ47t3b5ITa4.eB.t/VSsfbE7zC5Ct/NdMlMWZ6b4AMZS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_06082022_1659762393.jpg', 'https://ok2list.com/media/images/profile/profile_06082022_1659762393.jpg', NULL, 0, 0, 0, 1, '2022-08-06 15:03:44', '2022-08-06 15:06:33', NULL, 'Chattogram', NULL, 1, NULL, NULL, 0, 0, 'RCm5fhDGNJlOuVFNmP8cax02DiOrdi', 1),
(7, 'Individual', 'Rony', 'ronymia111333@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$QJau9CDu1FG5RVkpLE2./uVSyj8zGaTkUSjT27.OsM5/OCjWmpQKe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 15:42:25', '2022-08-06 15:42:25', NULL, NULL, NULL, 3, NULL, NULL, 0, 0, 'jWYcCDpcyFCXsTr4im4eM4cGAWFGz7', 1),
(8, 'Individual', 'Angcon Halder', 'angcon26101999@gmail.com', '01791693954', '01775425124', 1, 0, '3130', '8340', '2022-08-08 11:50:25', '2022-08-08 11:50:25', 13, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$oGmWhhcPcD.m2k/sF8LzIe03hWt8NYM2VTM7hhcWUkpNR.NH6uvZ6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_06082022_1659776058.jpg', 'https://ok2list.com/media/images/profile/profile_06082022_1659776058.jpg', NULL, 0, 4, 0, 1, '2022-08-06 16:22:22', '2022-08-06 18:54:18', NULL, 'Dhaka', 'Mohakhali', 2, NULL, NULL, 0, 0, 'S94iSq5Do9PvG03Kfuq9gQktRDKjGw', 1),
(18, 'Individual', 'Rony', 'ronymia2211@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Rsm0WIDt8whlFNN7kynIJ.2X.OnUTH7d18KNreQm87ffPKzuMQ8xC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-07 15:10:43', '2022-08-07 15:10:43', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, '25w6obBGg3IyF0MlFf37JkKc8Cb9hq', 1),
(19, 'Individual', 'MD Rony', 'ronymia111333@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IjFMOFwvNjUzUGhUQU9JS3cxOERRck5RPT0iLCJ2YWx1ZSI6IlVxZ1hGOUJweUJKQm5JQmhoUG5kUHc9PSIsIm1hYyI6IjBjZDg1ODAzNTFkNzBlYjc0OThmMTJkNTc0ZjM1ZjE4YWZjZjEwNDc3MjM1NWM3MjMzMmRmYWY2MzYwNjBmYjMifQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '107664573006850499632', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-07 15:47:25', '2022-08-07 15:47:25', NULL, NULL, NULL, 3, NULL, NULL, 0, 0, NULL, 1),
(20, 'Individual', 'Asia', 'asiaphtlbd@gmail.com', '94776628447', NULL, 1, 0, '3290', '', '2022-10-09 03:55:15', '2022-10-09 03:55:15', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OsXq8fGYNHSh62afMASfC.8hrzh8FaIg5m9j0fzuuQ.KnIGJf8Ujq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-07 17:14:12', '2022-08-09 01:55:23', NULL, NULL, 'Maharagama, Colombo', 3, NULL, NULL, 0, 0, 'nZs57muj5dJ8SFVnI4t9Yqs1lOIjeV', 1),
(23, 'Individual Seller', 'Rakib', 'webdevsforu@gmail.com', '01990572321', NULL, 0, 0, '', '', '2022-08-12 02:07:26', '2022-08-12 02:07:26', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rT8D.GHAWtynYblyddn3aOGNXP4cQrI08Tgrl1DmR681y7B6bvLti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_12082022_1660284386.jpg', 'https://ok2list.com/media/images/profile/profile_12082022_1660284386.jpg', NULL, 0, 0, 0, 1, '2022-08-12 16:04:52', '2022-08-12 16:06:26', NULL, 'Colombo', NULL, 1, NULL, NULL, 0, 0, 'wql8AfiWTRqDPabRs0ffEudeOyPlTX', 1),
(25, 'Individual', 'Anees Ahamed', 'ok2list.com@gmail.com', '94776618447', '94776628447', 0, 1, '3971', '5197', '2022-12-17 10:24:55', '2022-12-17 10:24:55', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BjuM3yCAkjSAabNGNwA83Ou5AR5qDHGQtBKEWpcjKUbmPLm9G5Wzy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-14 04:01:05', '2022-08-21 05:03:50', NULL, NULL, NULL, 3, NULL, NULL, 0, 0, 'TjdB9fqSWDc67FyPeQC7F3abWDZhks', 1),
(26, 'Individual', 'Rony', 'ronymia.tech@gmail.com', '94776628447', NULL, 1, 0, '3786', '', '2022-12-13 06:56:12', '2022-12-13 06:56:12', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$5zFrx9vzFl2PaPkvlyk1T.W0o4AnqCp2ywdKL64MhMQoFDKnzllra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-14 16:29:06', '2022-09-05 20:17:40', NULL, NULL, 'Colombo', 2, NULL, NULL, 0, 0, 'kkFjCNuHyFuiYruqJGXRAmZ9ixCxTM', 1),
(28, 'Individual', 'Muaz AA', 'extra.muaz@gmail.com', NULL, NULL, 1, 0, '1077', '', '2022-10-09 03:55:19', '2022-10-09 03:55:19', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$hPOPgDVmpRIzs7/XYBLrCuRddWa8p2ObRaapXvGbe.lNxXh.s1Bae', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-14 22:42:43', '2022-08-20 19:44:47', NULL, NULL, '42b Rathnawali Road, Kalubowila', 7, NULL, NULL, 0, 0, 'TeHDGtEfsSOCsN0XUhb0e05uVhnPrg', 1),
(29, 'Dealer', 'Rabin mia', 'rabinmia7578@gmail.com', '94776628447', '94776628447', 1, 0, '5675', '9917', '2022-10-09 03:55:53', '2022-10-09 03:55:53', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6InVTNEdiZTdiNmhWVFV2T1pxVW1LRkE9PSIsInZhbHVlIjoiOGs2YjJcL0lrVzVpbjFQdFB0ZHFoNUE9PSIsIm1hYyI6ImE5MjRiYTIzZGZhNWE2MGQ5NjhlMzQzYzFhZDFlNWZhMTdhMTA1NzAxNmJjODkzMzAxMDFkZWY5Mzc2NGRmYWYifQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '115691976286960126962', NULL, 'profile_15082022_1660571687.jpg', 'https://ok2list.com/public/media/images/profile/profile_15082022_1660571687.jpg', NULL, 0, 0, 0, 1, '2022-08-15 23:52:57', '2022-08-16 00:38:20', NULL, 'Ratnapura', NULL, 7, NULL, NULL, 0, 0, NULL, 1),
(30, 'Individual', 'Manicka Raja', 'manickarajainpropel@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IjFBamtZa1J4WXJ5RzhnSFBhZzJ6bGc9PSIsInZhbHVlIjoiRlJCek5vaHUzdlBzZE9tZmJcL0xQTnc9PSIsIm1hYyI6Ijc5MjQxMTQ0YmUwNTAwMDY4NDY0Yzc3MDVjMDExOWJlMDg3N2QzMTVmM2YxYTQxYTBhNWU1YWE2Nzg5MDFhOTQifQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '109586735112403574668', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-17 17:04:56', '2022-08-17 17:04:56', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, NULL, 0),
(31, 'Individual', 'Animo Planet', 'animoplanet2050@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-19 00:21:05', '2022-08-19 00:21:05', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$s5goGX.mLBW99OFNhQ0XG.2OsS6qYx8FrSCcnkLD1ywuUPV7vfMOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-19 14:19:18', '2022-08-19 14:19:18', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'KgerTSiedV0ptZgu32VVE2q3BU2v2q', 1),
(32, 'Individual', 'Jakir', 'jakir@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$iagHX7GhbfN4XCHFtr2QyO.1HPZR1/y4yflnid//ZHMvQ9bs2lqTW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-31 15:58:35', '2022-08-31 15:58:35', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'Vs5PTw0DNxMqZh04BaF0AxPvJ3X82z', 0),
(33, 'Individual', 'A Ahmed', 'anees622@yahoo.com', '94767018447', '94776628447', 0, 1, '3208', '1139', '2022-09-01 13:06:35', '2022-09-01 13:06:35', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OOMM.1NAY4fqvEtUn6ie8.Wm6M1bsQTa31AxHfBJU2eSJFEjZ5z3a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-09-02 02:22:44', '2022-09-02 02:35:35', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'KoRn6SunOe232BOHJxk5ncSTcH2zSD', 1),
(34, 'Individual', 'AUSTENITE TECHNICAL SERVICES L.L.C', 'austenitetechnicalllc@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IkczNGVwUUF5bDFNcU9ZeVZYUnkxOUE9PSIsInZhbHVlIjoiMFgyUmp6WnpkZHpBc3ZzK0c3VWJhUT09IiwibWFjIjoiY2NiNzY3NzQ2NzgxYTEzNDc0Y2U3MjY4MGVlMzlhNmIyY2M4ZjIyZjBmY2RmOGFkMDE5YzcyOGFhOTZjZjFkMSJ9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '108728694568662054017', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-09-27 22:13:18', '2022-09-27 22:13:18', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, NULL, 0),
(35, 'Individual', 'Admin', 'Admin@ok2list.com', '94743488447', NULL, 1, 0, '2986', '', '2022-12-13 04:30:48', '2022-12-13 04:30:48', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xDHVAihd3azuWnsLs/M/bOMkhJEsRXCUm2tioQLdnYc3Jsa/XgKae', 'SUA4Jb4zd4fZAzkwTI7piWxM0h8DUUwoF1WwA5sIb973cDhXbjWyKDdPlHK2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-10-16 09:32:31', '2022-10-19 12:45:48', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, '0O5DpEPAfJMjphLe7ubuaRdHEoUZsp', 1),
(36, 'Individual', 'AlinaHig', 'aa8590@outlook.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$52eQnqJ8/iD2wXegMbyDa.JO3qm2xkCftTA7Q.GTlBq9aTfCWUzp6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-10-20 05:30:15', '2022-10-20 05:30:15', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'P7zrr9UFgekvFJ6f3PvMsJ9Nh7AcrM', 0),
(37, 'Individual', 'topsamarapovoste', 'getanswer@topsamara.ru', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Sf0Oh9IA6EhtiM2YM5sx0Ojxxv.Yw0kfj7bqJJ8Qlzamle2hamPJ2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-10-22 01:44:02', '2022-10-22 01:44:02', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'CDzipryE9Y8iDh8pWZbLz7p1aD3Coj', 0),
(38, 'Individual', 'JamesPhiva', 'vera.dynaeva@yandex.ru', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$7i69.BJoSvtKo0LroyQAUudgcM/iwxJN8FRGB1M1snhEqCuoNz/T2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-11-03 06:17:21', '2022-11-03 06:17:21', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'F9m9pC2pKAqByreqbrVR94kvsKSSdY', 0),
(39, 'Individual', 'Rony Mia', 'ronymia.tech@gmail.com', NULL, NULL, 0, 0, '', '', '2022-11-06 00:58:03', '2022-11-06 00:58:03', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6ImtLd0lKRElocjJHWEtyUTlpUExOVVE9PSIsInZhbHVlIjoiWUw2SWVoK01cL0hTQTBodHNlVXZFZWc9PSIsIm1hYyI6ImE0YjFmZDg2N2ZiZTQwMTEzMzVjMTI3ODYxZDE5YmFlOWQyMzY3NjViNDVjY2MxN2E2ZDk2ZWJjOWUzZDQ2YWUifQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '107403319867710670983', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-11-06 15:21:59', '2022-11-06 15:21:59', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, NULL, 1),
(46, 'Individual', 'Mubarak Hossain', 'khiljimonstar355@gmail.com', '94743488449', NULL, 1, 0, '7661', '', '2022-12-19 06:03:58', '2022-12-19 06:03:58', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$v2Rs4Ix8yymSzcrU448naO/JDU.eLJsn0esoAbN9RD/JQGEe4h/7K', '82TBylspSLcaPsPc1ewtudhF6UG3AbwQ7dQsaG5KrHW0HP6NCKiHASlBJDd0', NULL, NULL, NULL, NULL, NULL, NULL, '101913011581805961395', NULL, NULL, NULL, NULL, 0, 5, 0, 1, '2022-12-13 21:58:21', '2022-12-19 21:31:13', NULL, NULL, 'Colombo', 7, NULL, NULL, 0, 0, NULL, 1),
(48, 'Individual', 'Masud Rana Tapu', 'masudrana.tapu1998@gmail.com', '94776628443', NULL, 1, 0, '3374', '', '2022-12-15 03:27:34', '2022-12-15 03:27:34', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$WR9m5zzGWO7H/PltH/Msz.brCK7AhAje4qIZWdln0W2BW5ocXxjwy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 1, '2022-12-15 18:44:12', '2022-12-15 18:54:03', NULL, NULL, NULL, 1, '2022-12-15', '2023-01-15', 0, 0, 'IX7FIhAYlIcFdLNFHGC35IIyDRIk2i', 1),
(50, 'Individual', 'Mubarak', 'mubaraktech355@gmail.com', '94743488449', NULL, 1, 0, '3407', '', '2022-12-19 06:04:49', '2022-12-19 06:04:49', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$A3ebDPY376e2jbqGb6PNaOLl/cpYzdLgGEk8KOc07YUGNJ6Uip8y2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, '2022-12-15 21:12:31', '2022-12-19 21:33:49', NULL, NULL, 'Kandy', 7, '2022-12-15', '2023-01-15', 0, 0, 'UGA6J8moauIyIc6UD9F5nyjxyzTGCg', 1),
(51, 'Individual', 'Raihan', 'raihan@gmail.com', '94776628446', NULL, 1, 0, '9514', '', '2022-12-19 08:04:37', '2022-12-19 08:04:37', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OXNOuQc.8gKW6w4.kRNW4..RyqvQWG9Mv2tg7J4IBmhQBW9pwq8p6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, 0, 1, '2022-12-16 00:20:53', '2022-12-19 23:33:37', NULL, NULL, 'colombo', 3, '2022-12-15', '2023-01-15', 0, 0, 'SEyFTsUhnv9p18N7OWGZyH39AmGDGq', 1),
(52, 'Individual', 'Md Mridul', 'mdmridul608@gmail.com', NULL, NULL, 0, 0, '', '', '2022-12-28 19:30:20', '2022-12-28 19:30:20', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$REg6F67KxF7tPk8Lg6MD5OXGl5XTn9h04W3NX6d8n2gg/P1RJSG7a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, '2022-12-28 12:37:15', '2022-12-28 12:37:15', NULL, NULL, NULL, 4, '2022-12-28', '2023-01-28', 0, 0, 'nwufLTWzLaKX2CPpNOVXrf2Mgmdktn', 1);

--
-- Triggers `ss_customers`
--
DELIMITER $$
CREATE TRIGGER `before_ss_customers_update` BEFORE UPDATE ON `ss_customers` FOR EACH ROW begin
    declare PKCODE int(2) default 0;

        if new.mobile1_otp_code is not null then

                set new.mobile1_otp_code_extime = DATE_ADD(now(), INTERVAL 60 SECOND);
        
        end if;
        if new.mobile2_otp_code is not null then

                set new.mobile2_otp_code_extime = DATE_ADD(now(), INTERVAL 60 SECOND);
        
        end if;

    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ss_divisions`
--

CREATE TABLE `ss_divisions` (
  `pk_no` int(11) NOT NULL,
  `country_pk_no` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT 1,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_employment_history`
--

CREATE TABLE `ss_employment_history` (
  `pk_no` int(11) NOT NULL,
  `customer_pk_no` int(10) DEFAULT NULL,
  `institution_name` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business _function` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `end_date` datetime NOT NULL DEFAULT current_timestamp(),
  `job_responsibility` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_faq`
--

CREATE TABLE `ss_faq` (
  `pk_no` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(2) DEFAULT NULL,
  `updated_by` int(2) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ss_faq`
--

INSERT INTO `ss_faq` (`pk_no`, `question`, `answer`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `is_active`) VALUES
(1, 'How ok2list.com can help in a fraud case?', 'We are very sorry if you have been a victim of fraud. Luckily ok2list.com or the QS Week (Pvt) Ltd can help you If you want to press charges legally against the fraudster and we can also provide you with all the data (available and accessible within the website) that you require to help you getting your items/money back. As we are trying to keep our user\'s privacy, we cannot release any data concerning a user to another without a legal warrant, which means you have to report the fraud to the local authorities such as the police station and the police department concerned to such cases have to contact us requesting such data, only then we can release all the data they have requested such as (IP, Dates, Email,… etc.). Note we only require a such process to be followed for the sake of our user\'s privacy. Please note that we have no control over and do not guarantee the quality, safety or legality of items/properties/services advertised, the truth or accuracy of users’ Content or listings, the ability of sellers to sell items, the ability of buyers to pay for items, or that a buyer or seller will actually complete a transaction or return an item. It is the buyer’s responsibility to check the items/properties/services before completing the transaction. Ok2list.com or the QS Week (Pvt) Ltd wish not to participate in any dispute between you and other users of the Website. Please note that we are a classifieds platform and have no authority over the ads posted and we do not own them, we are merely a platform where buyers and sellers make transactions without our interference.', '2022-08-14 11:15:49', '2022-08-14 11:15:49', NULL, 1, NULL, 1),
(2, 'How to react to a fraud contact?', 'We strongly recommend you stop communicating with this particular user and block him from sending you further messages and we also recommend you to contact us so we could block this user from contacting another user after conducting the necessary investigation. Also, we recommend you to contact your local authorities if you have been a victim of fraud click here to learn more about what we could help with If you are a victim.', '2022-08-14 11:16:13', '2022-08-14 11:16:13', NULL, 1, NULL, 1),
(3, 'Do ok2list.com, owe the posted ads on the Website?', 'No, we do not owe the items in the ads posted on our website as well as the jobs ads posted do not refer to vacancies in ok2list.com offices. Please note that we have no control over and do not guarantee the quality, safety, or legality of items/properties/services advertised, the truth or accuracy of users’ Content or listings, the ability of sellers to sell items, the ability of buyers to pay for items, or that a buyer or seller will actually complete a transaction or return an item. It is the buyer’s responsibility to check the items/properties/services before entering to complete the transaction. Please note that we are a classifieds platform have no authority over the ads posted and we do not own them, we are merely a platform where buyers and sellers make transactions without our interference.', '2022-08-14 11:16:31', '2022-08-14 11:16:31', NULL, 1, NULL, 1),
(4, 'How much does it cost to place an ad?', 'Most ads on ok2list.com are free. Currently, there are some categories where we charge to place an ad which is in: The Property for Sale / Rent section. It will cost you SLRS 800 per ad to post in this category and your ad will be live on the site for 60 days with the refresh facility, meaning, you can push your ad to the top list every after seven days. After the last refresh date, your ad will still be live for another 2 months. Used Cars for sale: Classic Package costs SLRS 800. (Prices vary depending on the package you choose)', '2022-08-14 11:16:50', '2022-08-14 11:16:50', NULL, 1, NULL, 1),
(5, 'What is a Membership?', 'To know all about Membership, please visit our Membership page.', '2022-08-14 11:17:11', '2022-08-14 11:17:11', NULL, 1, NULL, 1),
(6, 'Why is my ad not showing as a Featured Ad?', 'Ok2list.com home normally displayed the latest four slots, however, all Featured Ad is given equal opportunity to display. If you don’t see your Featured Ad right away, it means that there are more Featured Ads available than the number of Featured Ad slots.', '2022-08-14 11:17:27', '2022-08-14 11:17:27', NULL, 1, NULL, 1),
(7, 'What are the methods of payment?', 'Currently, you can only pay through bank transfer and we are working to provide a secured payment gateway for the easy process.', '2022-08-14 11:17:43', '2022-08-14 11:17:43', NULL, 1, NULL, 1),
(8, 'How soon does my Featured Ad appear on ok2list.com?', 'For existing Ads, it should be on the spot after finishing the payment process, regarding the new Ads it will appear once your Ad passes the review process.', '2022-08-14 11:18:00', '2022-08-14 11:18:00', NULL, 1, NULL, 1),
(9, 'What does a Featured Ad look like?', 'The featured Ad is eye-catching and unique from the normal Ads:', '2022-08-14 11:18:15', '2022-08-14 11:18:15', NULL, 1, NULL, 1),
(10, 'What is a \"Featured Ad\"?', 'Featured Ads is a premium service from ok2list.com which allows you to display your listings on the first four slots on the top of the categories’ pages, that shift alternately with other featured ads.', '2022-08-14 11:18:31', '2022-08-14 11:18:31', NULL, 1, NULL, 1),
(11, 'What is my posting allowance?', 'Each month Users can post a few ads for free in most categories on ok2list.com, some categories are only accepted against the payment as stipulated. If the User consumed the free ad allowance for the month, the User can upgrade to Membership in order to post more ads.', '2022-08-14 11:18:47', '2022-08-14 11:18:47', NULL, 1, NULL, 1),
(12, 'Why can\'t I log in to my accounts?', 'If you are having trouble logging in to your account, please check that you have: Signed up for an account. Entered the correct user name and password on the log-in page. If you are still having trouble accessing your account, please contact us.', '2022-08-14 11:19:03', '2022-08-14 11:19:03', NULL, 1, NULL, 1),
(13, 'How do I change my account details?', 'To change the details on your account, log in to your account and go to your account’s Dashboard.', '2022-08-14 11:19:19', '2022-08-14 11:19:19', NULL, 1, NULL, 1),
(14, 'What are the rules for posting on ok2list?', 'We have set up Terms and Conditions that will make this Website safer and all the posting shall be strict to the requirements: An item or service that is illegal in Sri Lanka or any other country An invalid phone number or email address Offensive language Offensive images and pictures Text in the title or description that is not related to the advertised item or service Pictures that do not match or clearly show the advertised item or service A non-specific item or service, e.g. a description of a company in general terms A website link that is not relevant to the advertised item or service Offers and requests for items or services in the same advertisement Identical content as another advertisement, re-posting within 7 days. Multiple items in the same ad Any contents that are subject to ok2list.com review and discretion.', '2022-08-14 11:19:43', '2022-08-14 11:19:43', NULL, 1, NULL, 1),
(15, 'I haven\'t received any response to my ad. What\'s wrong?', 'If you are not receiving responses to our ads, we recommend taking a look at our other services that will help you to find a way to success.', '2022-08-14 11:20:05', '2022-08-14 11:20:05', NULL, 1, NULL, 1),
(16, 'I\'m getting contacted about an ad I didn\'t post. Can you help me?', 'Yes, please provide further details by contacting us and we will help you right away.', '2022-08-14 11:20:21', '2022-08-14 11:20:21', NULL, 1, NULL, 1),
(17, 'Is any ad will be rejected?', 'As explained in above 6, other than all of the ads are manually reviewed – if your ad does not comply with our Terms and Conditions it will be rejected. You can read what changes you have to make before the ad can be approved in the rejection email.', '2022-08-14 11:20:37', '2022-08-14 11:20:37', NULL, 1, NULL, 1),
(18, 'I posted an ad but can\'t find it. What\'s wrong?', 'Tip: you can keep track of your ads easily by logging in to your account and visiting your “My ads” page! Your ad may not be live due to one (or more) of the following reasons: It is still under review – this will show on your My Ads page, under “Ads under review”. It may be non-compliant with Terms and Conditions – if your ad needs to be edited before it can be published, this will show on your My Ads page, under “Ads that need editing”. You have used up your free ad allowance. If you have been waiting longer than 24 hours for a response from us, you may have given us the wrong contact details when you posted the ad. Try posting again or contact us.', '2022-08-14 11:20:54', '2022-08-14 11:20:54', NULL, 1, NULL, 1),
(19, 'How long do ads live on ok2list.com?', 'Ads appear for 21 days unless you delete them earlier.', '2022-08-14 11:21:09', '2022-08-14 11:21:09', NULL, 1, NULL, 1),
(20, 'How do I set a reset password?', 'To reset a password, please log in to your account, go to the “Settings” page and enter a new password. If you have forgotten your ok2list.com password, you can; go to the login page and click on the “Forgot password?” follow the instruction If you have created an account via Facebook, you will not have a ok2list.com password. You can log in to your account via Facebook without a password', '2022-08-14 11:21:23', '2022-08-14 11:21:23', NULL, 1, NULL, 1),
(21, 'How do I edit my ad?', 'To edit an ad, please go to the ‘My ads’ page and click on the “Edit ad” option.', '2022-08-14 11:21:40', '2022-08-14 11:21:40', NULL, 1, NULL, 1),
(22, 'How do I delete my ad?', 'To delete an ad, please go to ‘My ads page’ and select the ad then click on the “Delete ad” option.', '2022-08-14 11:21:55', '2022-08-14 11:21:55', NULL, 1, NULL, 1),
(23, 'What can I do for editing my ad?', 'To edit an ad, please go to your ad\'s page and click on the \"Edit ad\" option.', '2022-08-14 11:22:10', '2022-08-14 11:22:10', NULL, 1, NULL, 1),
(24, 'Why has my ad been rejected?', 'All of the ads are manually reviewed - if your ad violates our posting rules it will be rejected. You can read what changes you have to make before the ad can be approved in the rejection email as well as the bottom of your rejected ad from the user dashboard.', '2022-08-14 11:22:24', '2022-08-14 11:22:24', NULL, 1, NULL, 1),
(25, 'How do I post an ad?', 'Posting an ad on ok2list.com is easy and only takes a few moments of your time. Follow the tips; For registered Users simply lick the yellow Post Ad button (in the top right corner of the page) and follow the instructions. If you are not already logged in, you will need to log in as the first step of posting your ad. Your ad will go live once it has been reviewed (the reviewing process usually takes less than 1 hour during office hours).', '2022-08-14 11:22:41', '2022-08-14 11:22:41', NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ss_industry`
--

CREATE TABLE `ss_industry` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_job_title`
--

CREATE TABLE `ss_job_title` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_slug` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_location`
--

CREATE TABLE `ss_location` (
  `pk_no` int(11) NOT NULL,
  `divisions_pk_no` int(11) NOT NULL DEFAULT 0,
  `city_pk_no` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `is_popular` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_packages`
--

CREATE TABLE `ss_packages` (
  `pk_no` int(3) NOT NULL,
  `ad_limit_in_montrh` int(11) DEFAULT NULL,
  `title` varchar(124) DEFAULT NULL,
  `title_bn` varchar(125) DEFAULT NULL,
  `price_per_month` float DEFAULT NULL,
  `support_duration` varchar(124) DEFAULT NULL,
  `discount_on_promotion` float DEFAULT NULL,
  `package_duration` varchar(10) DEFAULT '0',
  `sms_feature` tinyint(1) DEFAULT 1,
  `email_feature` tinyint(1) DEFAULT 1,
  `shop_page` tinyint(1) DEFAULT 1,
  `analytics` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `order_id` int(3) NOT NULL DEFAULT 1,
  `created_by` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ss_packages`
--

INSERT INTO `ss_packages` (`pk_no`, `ad_limit_in_montrh`, `title`, `title_bn`, `price_per_month`, `support_duration`, `discount_on_promotion`, `package_duration`, `sms_feature`, `email_feature`, `shop_page`, `analytics`, `is_active`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 8, 'Free', NULL, 0, '24/7 Live Support', 15, '2', 0, 0, 0, 0, 1, 1, NULL, NULL, 1, '2022-08-31 19:03:06'),
(2, 4, 'Personal', NULL, 2000, '24/7 Live Support', 5, '1', 0, 1, 1, 1, 1, 2, NULL, NULL, 1, '2022-08-06 15:21:26'),
(3, 50, 'Business', NULL, 5000, '24/7 Live Support', 10, '2', 1, 1, 1, 1, 1, 3, NULL, NULL, NULL, NULL),
(4, 200, 'Business Premium', NULL, 7000, '24/7 Live Support', 10, '2', 1, 1, 1, 1, 1, 4, NULL, NULL, NULL, NULL),
(5, 3, 'Gold', NULL, 5000, '24/7 Live Support', 20, '2', 1, 1, 1, 1, 1, 5, 1, '2022-06-16 00:39:59', NULL, '2022-06-16 00:39:59'),
(6, 4, 'Gold Plus', NULL, 5000, '24/7 Live Support', 200, '2', 1, 1, 1, 1, 1, 6, 1, '2022-06-16 00:41:10', 1, '2022-09-01 09:59:46'),
(7, 50, 'Silver', NULL, 49, '20', NULL, '9', 1, 1, 1, 1, 1, 1, 1, '2022-07-21 22:43:59', 1, '2022-09-01 09:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `ss_paging`
--

CREATE TABLE `ss_paging` (
  `id` int(10) NOT NULL,
  `total_record` int(3) DEFAULT NULL,
  `Top` int(3) DEFAULT NULL,
  `Feature` int(3) DEFAULT NULL,
  `Urgent` int(3) DEFAULT NULL,
  `Basic` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ss_paging`
--

INSERT INTO `ss_paging` (`id`, `total_record`, `Top`, `Feature`, `Urgent`, `Basic`) VALUES
(1, 20, 2, 5, 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ss_shop`
--

CREATE TABLE `ss_shop` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `open_time` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `customer_pk_no` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ss_shop`
--

INSERT INTO `ss_shop` (`pk_no`, `name`, `url_slug`, `address`, `contact`, `open_time`, `banner`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`, `customer_pk_no`) VALUES
(1, 'AL-Khidmah Computers BD', NULL, 'বেঙ্গল ফ্যাক্টরির অপজিটে,ঝুমা গার্মেন্টস সংলগ্ন, জিরানী বাজার,(বি.কে.এস.পি)আশুলিয়া, সাভার, ঢাকা।', '01554875214', '10:00 am - 10:00 pm', '41635.png', 'AL-Khidmah Computers is the Largest used Laptop provider of Bangladesh. You can choose a Laptop from hundreds of Laptop. You are buying a Laptop less than 40-50% price of a new one. The primary goal of our company is to increase the number of high-quality, low-cost Laptop and related parts and Accessories. When buying a laptop for yourself, there are many factors you should consider to ensure you’re purchasing the right Laptop for your needs and budget. We generally recommend buying a laptop through AL-Khidmah Computers, because of our wide collection, low prices and one-year service warranty.\"', 20, NULL, '2022-08-09 14:58:49', '2022-08-09 14:58:49', 1, 20),
(2, 'Test Shop', NULL, 'dhaka', '01990572322', '12 pm', '22979.jpg', 'hello', 26, NULL, '2022-08-20 20:55:59', '2022-08-20 20:55:59', 1, 26),
(3, 'Masud Rana', NULL, 'Dhaka', '01478523690', 'Every Day', '8114.jpg', 'Shopping is an activity in which a customer browses the available goods or services presented by one or more retailers with the potential intent to purchase a suitable selection of them. Wikipedia', 17, NULL, '2022-12-13 14:32:07', '2022-12-13 14:32:07', 1, 17),
(4, 'IT STORE', NULL, 'Level-5, Block-B, Shop No-43, Bashundhara City Shopping Mall , Panthapath, Dhaka', '01303697733', '10:00 am - 8:30 pm', '80848.png', '\"Welcome to \"\"IT STORE\"\"\r\n\r\nIT STORE is one of the best laptops in Dhaka City. We are the best seller for all kinds of laptops in different brands and configurations. Our laptop quality is very clean and fresh. We always provide the best product at a reasonable price. So that you can keep confidence in our products. \r\n\r\nThanks for Visit our Page', 51, NULL, '2022-12-19 16:12:18', '2022-12-19 16:12:18', 1, 51),
(5, 'MRidul shop', NULL, 'test address', '0123456789', '10am', '8979.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis, leo vel ornare tincidunt, mi mauris aliquam magna, sit amet consectetur nibh tortor sed leo. In vel sollicitudin urna. Duis in lectus vel ipsum laoreet cursus ut sit amet orci. Aenean tincidunt elementum nunc, nec efficitur risus consectetur consequat.', 52, NULL, '2022-12-28 18:50:49', '2022-12-28 18:50:49', 1, 52);

-- --------------------------------------------------------

--
-- Table structure for table `ss_subscribe`
--

CREATE TABLE `ss_subscribe` (
  `pk_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ss_subscribe`
--

INSERT INTO `ss_subscribe` (`pk_no`, `email`, `created_at`, `updated_at`) VALUES
(1, 'extra.muaz@gmail.com', '2022-08-09 23:35:56', '2022-08-09'),
(2, 'ahamed622@yahoo.com', '2022-08-24 18:17:01', '2022-08-24');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_expire` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Alive, 0 = Expire',
  `started_at` datetime NOT NULL,
  `expire_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'Individual Seller',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile2` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile1_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile2_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile1_otp_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile2_otp_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile1_otp_code_extime` datetime DEFAULT NULL,
  `mobile2_otp_code_extime` datetime DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `gender` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highest_education` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_education` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highest_education_ins` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'highest_education_institution',
  `experience_year` decimal(2,2) DEFAULT NULL,
  `skill_summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_me` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_industry` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_function` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Current Business Function',
  `current_designation` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_started` datetime DEFAULT NULL,
  `job_notice_period` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Notice period (in days)',
  `current_job_responsibility` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_salary` decimal(6,2) DEFAULT NULL COMMENT 'Current salary (per month) (Tk)',
  `cv` varchar(124) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Supported file formats: DOC, DOCX, PDF, TIFF, JPG, PNG',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_no` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_mime_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `total_favorite` int(5) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` int(3) DEFAULT NULL,
  `package_start_date` date DEFAULT NULL,
  `package_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `seller_type`, `name`, `email`, `mobile1`, `mobile2`, `mobile1_is_verified`, `mobile2_is_verified`, `mobile1_otp_code`, `mobile2_otp_code`, `mobile1_otp_code_extime`, `mobile2_otp_code_extime`, `area_id`, `is_active`, `is_delete`, `gender`, `linkedin`, `highest_education`, `special_education`, `highest_education_ins`, `experience_year`, `skill_summary`, `about_me`, `current_industry`, `current_function`, `current_designation`, `job_started`, `job_notice_period`, `current_job_responsibility`, `current_salary`, `cv`, `email_verified_at`, `password`, `remember_token`, `first_name`, `middle_name`, `last_name`, `alt_mobile_no`, `designation`, `auth_id`, `gym_id`, `profile_pic`, `profile_pic_url`, `pic_mime_type`, `user_type`, `total_post`, `total_favorite`, `status`, `created_at`, `updated_at`, `deleted_at`, `city`, `address`, `package_id`, `package_start_date`, `package_end_date`) VALUES
(1, 'Individual', 'Mahi', 'mahi@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$LZOFwask9Vlm9tinzRnGXepiareXpb6VJ6ctmPKuG0m1NY0OAppK.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2020-11-08 10:08:54', '2020-11-09 11:51:53', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Individual', 'maidul', 'maidul.tech@gmail.com', '01681944126', '01766682123', 1, 0, '5931', '8587', '2020-12-18 00:31:42', '2020-12-18 00:31:42', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xbK9F3u3PAmc45YU9vbJfOXG8fMijdO//Kys5EcKbiQXAW8TZjC8W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, 0, 1, '2020-11-13 20:16:21', '2020-12-17 06:30:42', NULL, 'Dhaka', NULL, NULL, NULL, NULL),
(3, 'Individual', 'Rabin', 'rabinmia7578@gmail.com', '01984594919', NULL, 1, 0, '2333', '', '2020-12-18 11:34:00', '2020-12-18 11:34:00', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$XVE5h8XrLjomNrFkptJ0qu6BSD1pwtfuCjSiTvYiI2O43.MptRzJW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2020-12-12 02:17:39', '2020-12-12 14:28:10', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Individual Seller', 'joy shahriar', 'hakimali111333@gmail.com', '01984594919', NULL, 0, 0, '3772', '', '2020-12-13 15:39:12', '2020-12-13 15:39:12', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZWQ3UzVJItzHwNm77hnPXeTvmO3x4fXs7edjeq7cvjeYSpDq6crce', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2020-12-12 15:33:59', '2020-12-12 15:38:12', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `role_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super User', 1, 1, NULL, NULL, '2020-10-09 02:45:46'),
(3, 'General Admin Group', 8, 1, NULL, '2020-10-09 02:33:26', '2020-10-09 02:45:57'),
(4, 'Sales Manger Group', 12, 1, NULL, '2020-10-09 02:34:06', '2020-10-09 02:46:01'),
(5, 'Data Entry Operator1', 12, 1, NULL, '2022-07-28 14:55:26', '2022-07-28 14:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `verify_mobile_no`
--

CREATE TABLE `verify_mobile_no` (
  `id` int(10) UNSIGNED NOT NULL,
  `mobile_no` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Admin, 1 = User',
  `purpose` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Verify-mobile,  1 = Reset-password 2= Forgot-password',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Last-one, 0 = Used, 2 = Unused',
  `expire_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workout_body_parts`
--

CREATE TABLE `workout_body_parts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_body_parts`
--

INSERT INTO `workout_body_parts` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Arm', 1, '2020-10-03 07:20:40', '2020-10-03 07:20:40'),
(3, 'qweqe', 1, '2020-10-06 06:57:11', '2020-10-06 06:57:11'),
(4, '1231231', 1, '2020-10-06 06:57:31', '2020-10-06 06:57:31'),
(5, 'asd', 1, '2020-10-06 06:58:41', '2020-10-06 06:58:41');

-- --------------------------------------------------------

--
-- Table structure for table `workout_items`
--

CREATE TABLE `workout_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `workout_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_parts_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_items`
--

INSERT INTO `workout_items` (`id`, `workout_name`, `photo`, `photo_url`, `body_parts_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test 1', 'workout_item_04102020_1601817674.png', 'http://www.boilerplate-admin.local/media/images/workout-item/workout_item_04102020_1601817674.png', 2, 1, '2020-10-03 07:21:14', '2020-10-03 07:21:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auths`
--
ALTER TABLE `auths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auths_email_unique` (`email`);

--
-- Indexes for table `auth_role`
--
ALTER TABLE `auth_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backup_admin_users`
--
ALTER TABLE `backup_admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_users_auth_id_foreign` (`auth_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `page_about_us`
--
ALTER TABLE `page_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_how_sell_fast`
--
ALTER TABLE `page_how_sell_fast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_membership`
--
ALTER TABLE `page_membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_privacy_policy`
--
ALTER TABLE `page_privacy_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_promote`
--
ALTER TABLE `page_promote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_promotions`
--
ALTER TABLE `page_promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sidebar`
--
ALTER TABLE `page_sidebar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sidebar_info`
--
ALTER TABLE `page_sidebar_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_terms_conditions`
--
ALTER TABLE `page_terms_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_permission_group_id_foreign` (`permission_group_id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prd_ads`
--
ALTER TABLE `prd_ads`
  ADD PRIMARY KEY (`pk_no`),
  ADD UNIQUE KEY `u_name` (`name`);

--
-- Indexes for table `prd_ad_details`
--
ALTER TABLE `prd_ad_details`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_brand`
--
ALTER TABLE `prd_brand`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_category`
--
ALTER TABLE `prd_category`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_favourites`
--
ALTER TABLE `prd_favourites`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_features`
--
ALTER TABLE `prd_features`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_img_library`
--
ALTER TABLE `prd_img_library`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_like_count`
--
ALTER TABLE `prd_like_count`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_master`
--
ALTER TABLE `prd_master`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_model`
--
ALTER TABLE `prd_model`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_reports`
--
ALTER TABLE `prd_reports`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prd_type`
--
ALTER TABLE `prd_type`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `prod_job_preference`
--
ALTER TABLE `prod_job_preference`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `quick_rules`
--
ALTER TABLE `quick_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sls_payments`
--
ALTER TABLE `sls_payments`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `sls_promotions`
--
ALTER TABLE `sls_promotions`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `sls_promotion_details`
--
ALTER TABLE `sls_promotion_details`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_areas`
--
ALTER TABLE `ss_areas`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_business_function`
--
ALTER TABLE `ss_business_function`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_chat`
--
ALTER TABLE `ss_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_cities`
--
ALTER TABLE `ss_cities`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_contact`
--
ALTER TABLE `ss_contact`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_country`
--
ALTER TABLE `ss_country`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_currency`
--
ALTER TABLE `ss_currency`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_customers`
--
ALTER TABLE `ss_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_divisions`
--
ALTER TABLE `ss_divisions`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_employment_history`
--
ALTER TABLE `ss_employment_history`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_faq`
--
ALTER TABLE `ss_faq`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_industry`
--
ALTER TABLE `ss_industry`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_job_title`
--
ALTER TABLE `ss_job_title`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_location`
--
ALTER TABLE `ss_location`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_packages`
--
ALTER TABLE `ss_packages`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_paging`
--
ALTER TABLE `ss_paging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ss_shop`
--
ALTER TABLE `ss_shop`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `ss_subscribe`
--
ALTER TABLE `ss_subscribe`
  ADD PRIMARY KEY (`pk_no`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verify_mobile_no`
--
ALTER TABLE `verify_mobile_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_body_parts`
--
ALTER TABLE `workout_body_parts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auths`
--
ALTER TABLE `auths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `auth_role`
--
ALTER TABLE `auth_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_about_us`
--
ALTER TABLE `page_about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_how_sell_fast`
--
ALTER TABLE `page_how_sell_fast`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_membership`
--
ALTER TABLE `page_membership`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_privacy_policy`
--
ALTER TABLE `page_privacy_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_promote`
--
ALTER TABLE `page_promote`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_promotions`
--
ALTER TABLE `page_promotions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_sidebar`
--
ALTER TABLE `page_sidebar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_sidebar_info`
--
ALTER TABLE `page_sidebar_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_terms_conditions`
--
ALTER TABLE `page_terms_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `prd_ads`
--
ALTER TABLE `prd_ads`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `prd_ad_details`
--
ALTER TABLE `prd_ad_details`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `prd_brand`
--
ALTER TABLE `prd_brand`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `prd_category`
--
ALTER TABLE `prd_category`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `prd_favourites`
--
ALTER TABLE `prd_favourites`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prd_features`
--
ALTER TABLE `prd_features`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prd_img_library`
--
ALTER TABLE `prd_img_library`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `prd_like_count`
--
ALTER TABLE `prd_like_count`
  MODIFY `pk_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prd_master`
--
ALTER TABLE `prd_master`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `prd_model`
--
ALTER TABLE `prd_model`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prd_reports`
--
ALTER TABLE `prd_reports`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prd_type`
--
ALTER TABLE `prd_type`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `prod_job_preference`
--
ALTER TABLE `prod_job_preference`
  MODIFY `pk_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quick_rules`
--
ALTER TABLE `quick_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sls_payments`
--
ALTER TABLE `sls_payments`
  MODIFY `pk_no` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sls_promotions`
--
ALTER TABLE `sls_promotions`
  MODIFY `pk_no` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sls_promotion_details`
--
ALTER TABLE `sls_promotion_details`
  MODIFY `pk_no` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ss_areas`
--
ALTER TABLE `ss_areas`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `ss_business_function`
--
ALTER TABLE `ss_business_function`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ss_chat`
--
ALTER TABLE `ss_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ss_cities`
--
ALTER TABLE `ss_cities`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ss_contact`
--
ALTER TABLE `ss_contact`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_country`
--
ALTER TABLE `ss_country`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ss_currency`
--
ALTER TABLE `ss_currency`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_customers`
--
ALTER TABLE `ss_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `ss_divisions`
--
ALTER TABLE `ss_divisions`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_employment_history`
--
ALTER TABLE `ss_employment_history`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_faq`
--
ALTER TABLE `ss_faq`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ss_industry`
--
ALTER TABLE `ss_industry`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_job_title`
--
ALTER TABLE `ss_job_title`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_location`
--
ALTER TABLE `ss_location`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_packages`
--
ALTER TABLE `ss_packages`
  MODIFY `pk_no` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ss_paging`
--
ALTER TABLE `ss_paging`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ss_shop`
--
ALTER TABLE `ss_shop`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ss_subscribe`
--
ALTER TABLE `ss_subscribe`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `verify_mobile_no`
--
ALTER TABLE `verify_mobile_no`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workout_body_parts`
--
ALTER TABLE `workout_body_parts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
