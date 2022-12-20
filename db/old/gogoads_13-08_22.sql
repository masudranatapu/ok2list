-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2022 at 04:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gogoads`
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
(1, 'sadmin', NULL, 'admin@gmail.com', NULL, '01681944126', '$2y$10$VFm643nOKw7wq.0N9mUKyeUA4wfq0igfJE0QXP5Q0qZhcUO7Nn0Ty', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 'Individual Seller', NULL, NULL, 1, 0, 1, 1, 0, 0, NULL, NULL, 0, NULL, '2022-08-06 18:48:56', 1, 'profile_06082022_1659775736.jpg', 'https://gogoads.lk/media/images/profile/profile_06082022_1659775736.jpg', NULL, 'Maidul', 'Maidul', 'Developer'),
(21, 'Manager', NULL, 'Manager@gmail.com', NULL, '01681944126', '$2y$10$X5TDs4BFzFGOXx9qh/ZW2.rHmHIcLB.WhhPRp586Tn4VIZ2l9WKi6', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 'Individual Seller', NULL, NULL, 1, 0, 1, 1, 0, 0, NULL, NULL, 0, '2022-07-28 14:39:03', '2022-07-28 14:40:37', 0, 'profile_28072022_1659019143.jpg', 'http://localhost/test/gogoads/public/media/images/profile/profile_28072022_1659019143.jpg', NULL, 'Manager', 'Manager', 'Manager');

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
('1780dab1-cf61-451c-a56b-32c2a44dd25e', 'App\\Notifications\\WellComeNotification', 'App\\User', 8, '{\"user_id\":8}', NULL, '2022-08-06 16:22:27', '2022-08-06 16:22:27'),
('46b11d65-681f-4f15-9706-18a2132cdcd9', 'App\\Notifications\\WellComeNotification', 'App\\User', 11, '{\"user_id\":11}', NULL, '2022-08-06 17:53:17', '2022-08-06 17:53:17'),
('84709c9c-e113-4d55-bc43-4e4c84c2d627', 'App\\Notifications\\WellComeNotification', 'App\\User', 6, '{\"user_id\":6}', NULL, '2022-08-06 15:36:47', '2022-08-06 15:36:47'),
('9370cb06-5ac5-4fa7-9f31-b1dd4e555a67', 'App\\Notifications\\WellComeNotification', 'App\\User', 13, '{\"user_id\":13}', NULL, '2022-08-06 22:15:46', '2022-08-06 22:15:46'),
('96748e3c-c5b0-46de-93ad-799d29004ca6', 'App\\Notifications\\WellComeNotification', 'App\\User', 23, '{\"user_id\":23}', NULL, '2022-08-12 16:04:57', '2022-08-12 16:04:57'),
('a3e495ab-768c-45d3-853d-bbd67b3d5032', 'App\\Notifications\\WellComeNotification', 'App\\User', 12, '{\"user_id\":12}', NULL, '2022-08-06 22:08:01', '2022-08-06 22:08:01'),
('b328660f-fb16-4f80-a5b3-04879b32739f', 'App\\Notifications\\WellComeNotification', 'App\\User', 3, '{\"user_id\":3}', NULL, '2022-07-28 15:16:18', '2022-07-28 15:16:18'),
('b7b302c6-d042-4f02-8848-7d0f2054a7d6', 'App\\Notifications\\WellComeNotification', 'App\\User', 21, '{\"user_id\":21}', NULL, '2022-08-07 22:25:20', '2022-08-07 22:25:20'),
('b80d6096-da9a-4577-a4ab-0e9918982514', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-07 17:04:39', '2022-08-07 17:04:39'),
('ba168ea1-03fa-487b-aa22-f604f9cbcdb5', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-09 02:07:40', '2022-08-09 02:07:40'),
('bd13aaa9-1eef-4271-99a7-73416cfcb38f', 'App\\Notifications\\WellComeNotification', 'App\\User', 17, '{\"user_id\":17}', NULL, '2022-08-07 15:01:43', '2022-08-07 15:01:43'),
('bdd43d8b-1873-4022-ab55-ced133c9a0ef', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-07 18:14:26', '2022-08-07 18:14:26'),
('bef24ada-aa86-4ce6-9e4b-d7cd116b0c31', 'App\\Notifications\\WellComeNotification', 'App\\User', 9, '{\"user_id\":9}', NULL, '2022-08-06 16:24:50', '2022-08-06 16:24:50'),
('d423ef08-4796-4c1b-a841-163d907aa319', 'App\\Notifications\\WellComeNotification', 'App\\User', 15, '{\"user_id\":15}', NULL, '2022-08-06 22:21:56', '2022-08-06 22:21:56'),
('e0c72bd8-7212-4c57-99ac-6821d1365b01', 'App\\Notifications\\WellComeNotification', 'App\\User', 14, '{\"user_id\":14}', NULL, '2022-08-06 22:17:13', '2022-08-06 22:17:13'),
('e9ad1c13-36bb-4dd2-a42a-6d82c2d0bebf', 'App\\Notifications\\WellComeNotification', 'App\\User', 10, '{\"user_id\":10}', NULL, '2022-08-06 16:27:46', '2022-08-06 16:27:46'),
('eb363987-150c-4bb7-877d-67eac1a7abd4', 'App\\Notifications\\WellComeNotification', 'App\\User', 18, '{\"user_id\":18}', NULL, '2022-08-07 15:10:48', '2022-08-07 15:10:48'),
('eeb9d748-85fc-4964-bccb-2f069c037931', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-07 17:07:49', '2022-08-07 17:07:49'),
('eee4e6f6-c49e-4981-b532-310c9c0f0804', 'App\\Notifications\\WellComeNotification', 'App\\User', 20, '{\"user_id\":20}', NULL, '2022-08-07 17:14:17', '2022-08-07 17:14:17'),
('f5d708e9-a3c6-494b-a3ef-91634cab930a', 'App\\Notifications\\WellComeNotification', 'App\\User', 16, '{\"user_id\":16}', NULL, '2022-08-07 02:57:04', '2022-08-07 02:57:04'),
('fa2220e2-6633-4739-9f51-eb6411e4b1f1', 'App\\Notifications\\WellComeNotification', 'App\\User', 7, '{\"user_id\":7}', NULL, '2022-08-06 15:42:30', '2022-08-06 15:42:30');

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
  `name` enum('home_page1','home_page2','home_page3','list_page1','list_page2','list_page3','detail_page1','detail_page2','detail_page3') DEFAULT NULL,
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
(3, 'home_page1', 1, NULL, '2022-08-09 11:34:59', NULL, '2022-08-09 11:34:59'),
(4, 'home_page2', 1, NULL, '2022-08-09 11:35:18', NULL, '2022-08-09 11:35:18'),
(5, 'home_page3', 1, NULL, '2022-08-09 11:35:36', NULL, '2022-08-09 11:35:36'),
(6, 'list_page1', 1, NULL, '2022-08-09 11:37:12', NULL, '2022-08-09 11:37:12'),
(7, 'list_page2', 1, NULL, '2022-08-09 11:38:28', NULL, '2022-08-09 11:38:28'),
(8, 'detail_page2', 1, NULL, '2022-08-09 12:05:44', NULL, '2022-08-09 12:05:44'),
(9, 'detail_page3', 1, NULL, '2022-08-09 12:06:46', NULL, '2022-08-09 12:06:46'),
(10, 'detail_page1', 1, NULL, '2022-08-09 12:17:25', NULL, '2022-08-09 12:17:25'),
(11, 'list_page3', 1, NULL, '2022-08-09 17:02:35', NULL, '2022-08-09 17:02:35');

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
(2, 4, 'home page two', 'https://www.facebook.com/', 'uploads/ads/1660025742-horizontal-ads.png', 1, NULL, '2022-08-09 11:35:18', NULL, '2022-08-09 12:15:42'),
(3, 5, 'home page three', 'https://www.facebook.com/', 'uploads/ads/1660025750-horizontal-ads.png', 1, NULL, '2022-08-09 11:35:36', NULL, '2022-08-09 12:15:50'),
(4, 6, 'list page one', 'https://www.facebook.com/', 'uploads/ads/1660025765-horizontal-ads.png', 1, NULL, '2022-08-09 11:37:12', NULL, '2022-08-09 12:16:05'),
(5, 7, 'list page two', 'https://www.facebook.com/', 'uploads/ads/1660025783-vertical-ads-banner.png', 1, NULL, '2022-08-09 11:38:28', NULL, '2022-08-09 12:16:23'),
(6, 8, 'dsafds', 'https://www.facebook.com/', 'uploads/ads/1660025804-horizontal-ads.png', 1, NULL, '2022-08-09 12:05:44', NULL, '2022-08-09 12:16:44'),
(7, 9, 'sdfsdf', 'https://www.facebook.com/', 'uploads/ads/1660025821-vertical-ads-banner.png', 1, NULL, '2022-08-09 12:06:46', NULL, '2022-08-09 12:17:01'),
(8, 10, 'ads', 'https://www.facebook.com/', 'uploads/ads/1660025845-horizontal-ads.png', 1, NULL, '2022-08-09 12:17:25', NULL, '2022-08-09 12:17:25'),
(9, 11, 'list page three', 'https://www.facebook.com/', 'uploads/ads/1660042955-horizontal-ads.png', 1, NULL, '2022-08-09 17:02:35', NULL, '2022-08-09 17:02:35');

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
(17, 94, 100, 'CHOCO CARNATION', NULL, NULL, NULL, 1, 0, 0, 1, '2020-12-13 08:26:50', NULL, '2020-12-13 08:26:50');

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
(1, 0, '11', 'Cars & Vehicles', 'cars-vehicles', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Bangladesh. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Bangladesh. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, 'category_log_5fe8202d6d53d.png', NULL, 1, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-15 17:21:12', 1, '2020-12-27 05:48:29', 0),
(2, 0, '12', 'Electronics & Gadgets', 'electronics-gedgets', NULL, 'Find great deals for used electronics in Sri Lanka including mobile phones, computers, laptops, TVs, cameras and much more.', 'Find great deals for used electronics in Sri Lanka including mobile phones, computers, laptops, TVs, cameras and much more.', NULL, 'category_log_5fb2b58af0dc9.png', NULL, 1, 1, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:23:22', 1, '2022-08-09 22:56:21', 0),
(3, 0, '13', 'Property for Rent/Sell', 'property', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_5fe78321e6fb1.png', NULL, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 1, 1, '2020-11-16 17:24:29', 1, '2022-08-12 12:50:45', 1),
(4, 0, '14', 'Sports & responsive', 'sports-responsive', NULL, 'Buy and sell used musical instruments, sports gear and accessories, art and collectibles and items for kids here.', 'Buy and sell used musical instruments, sports gear and accessories, art and collectibles and items for kids here.', NULL, 'category_log_5fb2b656e349a.png', NULL, 0, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:26:46', 1, '2020-11-16 17:26:46', 0),
(5, 0, '15', 'Fashion & Beauty', 'fashion-beauty', NULL, 'Buy and sell clothing, garments, shoes and other personal items including handbags, perfumes etc.', 'Buy and sell clothing, garments, shoes and other personal items including handbags, perfumes etc.', NULL, 'category_log_5fb2b67d5307e.png', NULL, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:27:25', 1, '2020-12-18 07:54:36', 0),
(6, 0, '16', 'Pets & Animals', 'pets-animals', NULL, 'Search from the widest variety of pets in Bangladesh. Select from dogs, puppies, cats, kittens, birds and other domesticated animals.', 'Search from the widest variety of pets in Bangladesh. Select from dogs, puppies, cats, kittens, birds and other domesticated animals.', NULL, 'category_log_5fb2b70570133.png', NULL, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:29:41', 1, '2020-12-21 19:37:44', 0),
(7, 0, '17', 'Jobs & Work Overseas', 'jobs', NULL, 'Post and apply for jobs and career opportunities in Bangladesh. Search for job vacancies in your city.', 'Post and apply for jobs and career opportunities in Bangladesh. Search for job vacancies in your city.', NULL, 'category_log_5fe783bc456e6.png', NULL, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 2, 1, '2020-11-16 17:30:12', 1, '2022-08-12 10:04:20', 1),
(8, 0, '18', 'Home Appliances', 'home-appliances', NULL, 'Buy and sell new and used home appliances including furniture, kitchen items, gardening products and other items for your garden.', 'Buy and sell new and used home appliances including furniture, kitchen items, gardening products and other items for your garden.', NULL, 'category_log_5fe820fd53eb2.png', NULL, 1, 0, 1, NULL, NULL, 1, 0, 0, 0, 3, 1, '2020-11-16 17:30:59', 1, '2020-12-27 05:51:57', 0),
(9, 0, '19', 'Matrimony Services', 'matrimony-services', NULL, NULL, NULL, NULL, 'category_log_5fb2b77f7bad7.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:31:43', 1, '2020-12-26 19:03:47', 0),
(11, 0, '21', 'Miscellaneous', 'miscellaneous', NULL, NULL, NULL, NULL, 'category_log_5fb2b83daaa73.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 6, 1, '2020-11-16 17:34:53', 1, '2020-12-21 19:37:52', 0),
(12, 0, '22', 'Books & Magazines', 'books-magazines', NULL, NULL, NULL, NULL, 'category_log_5fb2b88671c88.png', NULL, 1, 0, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:36:06', 1, '2020-12-21 19:37:48', 0),
(13, 1, '23', 'Cars', 'cars--buses', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:41:37', 1, '2022-08-13 08:57:01', 0),
(14, 1, '24', 'Motorbikes & Scooters', 'motorbikes-scooters', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:41:47', NULL, '2020-11-16 17:41:47', 0),
(15, 1, '25', 'Bicycles', 'bicycles-and-three-wheelers', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:41:56', 1, '2022-08-12 19:32:18', 0),
(17, 1, '27', 'Trucks & Lorries', 'trucks-vans-buses', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:42:17', 1, '2022-08-12 20:00:39', 0),
(18, 1, '28', 'Tractors & Heavy-Duty', 'tractors-heavyduty', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:42:26', NULL, '2020-11-16 17:42:26', 0),
(19, 1, '29', 'Auto Parts & Accessories', 'auto-parts-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:42:52', NULL, '2020-11-16 17:42:52', 0),
(20, 2, '30', 'Laptop & Computer', 'laptop-computer', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:43:02', NULL, '2020-11-16 17:43:02', 0),
(21, 104, '31', 'Mobile Phones', 'mobile-phones', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:10', NULL, '2020-11-16 17:43:10', 0),
(22, 2, '32', 'Phablet & Tablets', 'phablet-tablets', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:22', NULL, '2020-11-16 17:43:22', 0),
(23, 2, '33', 'Audio & MP', 'audio-mp', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:31', NULL, '2020-11-16 17:43:31', 0),
(24, 2, '34', 'Accessories', 'accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:39', NULL, '2020-11-16 17:43:39', 0),
(25, 2, '35', 'Cameras', 'cameras', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:43:46', NULL, '2020-11-16 17:43:46', 0),
(26, 104, '36', 'Mobile Accessories', 'mobile-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 1, 1, '2020-11-16 17:43:53', 1, '2020-12-18 06:18:04', 0),
(27, 2, '37', 'TV & Video', 'tv-video', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:02', NULL, '2020-11-16 17:44:02', 0),
(28, 2, '38', 'Other Electronics', 'other-electronics', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:13', NULL, '2020-11-16 17:44:13', 0),
(29, 2, '39', 'TV & Video Accessories', 'tv-video-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:26', NULL, '2020-11-16 17:44:26', 0),
(30, 3, '40', 'Houses For Sale', 'houses', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:38', 1, '2022-08-12 19:18:43', 0),
(31, 3, '41', 'Room Annex Rentals', 'rooms', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:46', 1, '2022-08-12 19:21:30', 0),
(32, 3, '42', 'Commercial Property Rentals', 'plots-lands', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:00', 1, '2022-08-12 19:22:23', 0),
(33, 3, '43', 'Apartments Rentals', 'apartment-flats', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:27', 1, '2022-08-12 19:19:28', 0),
(34, 4, '44', 'All Hobbies, Sports & Kids', 'all-hobbies-sports--kids', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:05:55', NULL, '2020-11-16 18:05:55', 0),
(35, 4, '45', 'Musical Instruments', 'musical-instruments', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:06:09', NULL, '2020-11-16 18:06:09', 0),
(36, 4, '46', 'Sports', 'sports', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:06:23', NULL, '2020-11-16 18:06:23', 0),
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
(85, 0, '95', 'Agriculture', 'agriculture', NULL, NULL, NULL, NULL, 'category_log_5fd8e50cbe19c.png', NULL, 0, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:37:16', 1, '2020-12-15 16:32:12', 0),
(87, 85, '97', 'Crops, Seeds & Plants', 'crops-seeds--plants', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:39:38', NULL, '2020-11-16 18:39:38', 0),
(88, 85, '98', 'Farming Tools & Machinery', 'farming-tools--machinery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:39:51', NULL, '2020-11-16 18:39:51', 0),
(89, 85, '99', 'Other Agriculture', 'other-agriculture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:40:03', NULL, '2020-11-16 18:40:03', 0),
(93, 1, '103', 'Rentals', 'car-rentals--auto-services', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:22:15', 1, '2022-08-12 20:01:21', 0),
(94, 0, '104', 'Essential', 'essential', NULL, NULL, NULL, NULL, 'category_log_5fe822230625e.png', NULL, 1, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:00', 1, '2020-12-27 05:56:51', 0),
(95, 94, '105', 'Grocery', 'grocery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:24', NULL, '2020-11-17 20:33:24', 0),
(96, 94, '106', 'Fruits & Vegetables', 'fruits--vegetables', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:36', NULL, '2020-11-17 20:33:36', 0),
(97, 94, '107', 'Meat & Seafood', 'meat--seafood', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:50', NULL, '2020-11-17 20:33:50', 0),
(98, 94, '108', 'Baby Products', 'baby-products', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:06', NULL, '2020-11-17 20:34:06', 0),
(99, 94, '109', 'Healthcare', 'healthcare', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:19', NULL, '2020-11-17 20:34:19', 0),
(100, 94, '110', 'Household', 'household', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:39', NULL, '2020-11-17 20:34:39', 0),
(101, 94, '111', 'Other Essentials', 'other-essentials', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:50', NULL, '2020-11-17 20:34:50', 0),
(104, 0, '112', 'Mobiles', 'mobiles', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Bangladesh. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Bangladesh. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, 'category_log_5fe786c5db223.png', NULL, 1, 1, 1, NULL, NULL, 0, 0, 0, 0, 1, 1, '2020-11-16 17:21:12', 1, '2022-08-12 09:55:56', 0),
(107, 3, '113', 'Commercial Properties', 'commercial-property', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:27', 1, '2022-08-12 19:23:02', 0),
(108, 104, '118', 'SIM Cards', 'sim-cards', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:04', NULL, '2021-01-17 19:00:04', 0),
(109, 104, '119', 'Mobile Phone Services', 'mobile-phone-services', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:17', NULL, '2021-01-17 19:00:17', 0),
(110, 2, '120', 'Desktop Computers', 'desktop-computers', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:49', NULL, '2021-01-17 19:00:49', 0),
(111, 2, '121', 'Laptops', 'laptops', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2021-01-17 19:01:26', 1, '2021-01-17 19:02:47', 0),
(112, 2, '122', 'Laptop & Computer Accessories', 'laptop-computer-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2021-01-17 19:01:33', 1, '2021-01-17 19:02:37', 0),
(113, 2, '123', 'Tablets & Accessories', 'tablets-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:01:41', NULL, '2021-01-17 19:01:41', 0),
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
(125, 0, '135', 'Services', 'services', NULL, 'All the services rendered by the user can list under this category', NULL, NULL, 'category_log_62f2601b00a41.png', NULL, 1, 1, 1, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-09 19:21:05', 1, '2022-08-09 19:26:18', 0),
(126, 0, '136', 'Services', 'services', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_62f29777e0ee5.png', NULL, 1, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-09 23:20:55', 1, '2022-08-09 23:21:31', 0),
(127, 0, '137', 'Services', 'services', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 8, 1, '2022-08-10 15:32:48', 1, '2022-08-12 10:09:27', 0),
(128, 0, '138', 'Education', 'education', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 7, 1, '2022-08-12 09:53:59', 1, '2022-08-12 10:06:21', 0),
(129, 2, '139', 'Mobiles Phones', 'mobiles', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 09:56:35', 1, '2022-08-12 20:06:04', 0),
(130, 0, '140', 'Business & Industry', 'business-industry', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 8, 1, '2022-08-12 10:00:21', 1, '2022-08-12 11:01:35', 0),
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
(152, 3, '162', 'House For Rentals', 'house-for-rentals', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:24:59', 1, '2022-08-12 19:25:19', 0),
(153, 1, '163', 'Buses & Vans', 'buses', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:28:45', 1, '2022-08-12 20:01:50', 0),
(154, 1, '164', 'Three Wheelers', 'three-wheelers', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:30:45', 1, '2022-08-12 19:31:07', 0),
(155, 1, '165', 'Auto Services', 'auto-services', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 19:32:52', 1, '2022-08-12 19:33:10', 0),
(156, 1, '166', 'Boats & Water Transport', 'boats-water-transport', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 20:02:51', 1, '2022-08-12 20:03:11', 0);

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
(2, 1, '296901659858800.jpg', 2, NULL, NULL, NULL, NULL);

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
  `is_active` int(1) DEFAULT 0,
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
(1, 'sell', 1, 'city', 1, 'maharagama', 'colombo', 20, 'general', 2, 'electronics-gedgets', 20, 'laptop-computer', 101, 'POS System Full Packages', 'pos-system-full-packages', 5, 'Lenovo', NULL, 'M11', NULL, 98500, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '❇️All Invoices\r\n\r\n❇️Income reports date wise\r\n\r\n❇️Item wise sales reports\r\n\r\n❇️Reorder levels \r\n\r\n❇️Cashier wise Income\r\n\r\n❇️Suppers details \r\n\r\n❇️Customers details \r\n\r\n❇️Current Stock \r\n\r\n❇️GRN details \r\n\r\n❇️All GRN with items\r\n\r\n❇️Expenses details date wise\r\n\r\n❇️Expire Item details\r\n\r\n❇️Customers payment details', NULL, 'original', 'new', '50', '94776628447', NULL, 0, 0, NULL, NULL, NULL, 'Maharagama, Colombo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Asia', 1, NULL, 1, 1, '2022-08-08 21:55:40', NULL, '2022-08-07 13:53:19', NULL, '2022-08-13 19:28:38', 38, 0, 20, NULL, 'Basic', NULL, '607281659858799.jpg', 'maharagama colombo general laptop-computer POS System Full Packages Lenovo M1198500 new94776628447Maharagama, Colombo❇️All Invoices\r\n\r\n❇️Income reports date wise\r\n\r\n❇️Item wise sales reports\r\n\r\n❇️Reorder levels \r\n\r\n❇️Cashier wise Income\r\n\r\n❇️Suppers details \r\n\r\n❇️Customers details \r\n\r\n❇️Current Stock \r\n\r\n❇️GRN details \r\n\r\n❇️All GRN with items\r\n\r\n❇️Expenses details date wise\r\n\r\n❇️Expire Item details\r\n\r\n❇️Customers payment details');

--
-- Triggers `prd_master`
--
DELIMITER $$
CREATE TRIGGER `after_prd_master_delete` AFTER DELETE ON `prd_master` FOR EACH ROW begin 

    update ss_customers 
        set total_post = total_post-1
        where id = old.customer_pk_no;
    update prd_category 
        set total_post = total_post-1
        where pk_no = old.f_cat_pk_no;
    update prd_category 
        set total_post = total_post-1
        where pk_no = old.f_scat_pk_no;
    
    if old.city_division = 'city' then
    update ss_cities 
        set total_post = total_post-1
        where pk_no = old.city_division_pk_no;
    end if;

    if old.city_division = 'division' then
    update ss_divisions 
        set total_post = total_post-1
        where pk_no = old.city_division_pk_no;
    end if;

    end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_prd_master_insert` AFTER INSERT ON `prd_master` FOR EACH ROW begin 
    declare var_serial_no int(2) default 0; 

    update ss_customers 
        set total_post = total_post+1
        where id = new.customer_pk_no;
    update prd_category 
        set total_post = total_post+1
        where pk_no = new.f_cat_pk_no;
    update prd_category 
        set total_post = total_post+1
        where pk_no = new.f_scat_pk_no;
        
        if new.city_division = 'city' then
    update ss_cities 
        set total_post = total_post+1
        where pk_no = new.city_division_pk_no;
    end if;

    if new.city_division = 'division' then
    update ss_divisions 
        set total_post = total_post+1
        where pk_no = new.city_division_pk_no;
    end if;

    end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_prd_master_update` AFTER UPDATE ON `prd_master` FOR EACH ROW begin 
    
    if old.f_cat_pk_no <> new.f_cat_pk_no then
    update prd_category 
        set total_post = total_post+1
        where pk_no = new.f_cat_pk_no;
    update prd_category 
        set total_post = total_post-1
        where pk_no = old.f_cat_pk_no;
    end if;

    if old.f_scat_pk_no <> new.f_scat_pk_no then
    update prd_category 
        set total_post = total_post+1
        where pk_no = new.f_scat_pk_no;

    update prd_category 
        set total_post = total_post-1
        where pk_no = old.f_scat_pk_no; 
    end if;


    if new.city_division = 'city' then
        if old.city_division_pk_no <> new.city_division_pk_no then
                update ss_cities 
                set total_post = total_post+1
                where pk_no = new.city_division_pk_no;

                update ss_cities 
                set total_post = total_post-1
                where pk_no = old.city_division_pk_no;

        end if;

    end if;


    if new.city_division = 'division' then
        if new.city_division_pk_no <> old.city_division_pk_no then 
        update ss_divisions 
        set total_post = total_post+1
        where pk_no = new.city_division_pk_no;

        update ss_divisions 
        set total_post = total_post-1
        where pk_no = old.city_division_pk_no;

        end if;

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
(3, 104, 21, 15, 'ZenFone Max', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL);

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
(1, 14, 'high_school', '0', 'info_technology', 'phone_number_url', NULL, NULL, 'male', NULL, 'IT Officer', 5, '2022-08-09', 'it_telecom', '2022-08-06 15:25:18', '2022-08-06 15:25:18', 8, NULL);

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
  `meta_keyword` text CHARACTER SET utf8 DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8 DEFAULT NULL,
  `website_email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `map_address` text DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `website_title`, `logo`, `favicon`, `meta_keyword`, `meta_description`, `website_email`, `phone`, `address`, `map_address`, `facebook_link`, `twitter_link`, `instagram_link`, `linkedin_link`, `whatsapp_link`, `youtube_link`, `created_at`, `updated_at`) VALUES
(12, 'gogoads.lk', 'uploads/2022/06/1655658537-logo-02.jpg', 'uploads/2022/06/1655658561-logo-02.jpg', 'gogoads.lk', 'Gogoads', 'info@gogoads.lk', NULL, 'Sri lanka', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4047213.2839410105!2d80.70625!3d7.857684999999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2593cf65a1e9d%3A0xe13da4b400e2d38c!2sSri%20Lanka!5e0!3m2!1sen!2sbd!4v1660041689475!5m2!1sen!2sbd\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-17 14:57:55', '2022-08-13 16:23:36');

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
(1, 17, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 11:01:36', NULL, NULL, '2022-08-07 11:01:36', 17, '2022-08-07 11:01:36', NULL, NULL, NULL, NULL, 1, '0', '2022-09-07 11:01:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 18, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 11:10:43', NULL, NULL, '2022-08-07 11:10:43', 18, '2022-08-07 11:10:43', NULL, NULL, NULL, NULL, 1, '0', '2022-09-07 11:10:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 12:02:49', 19, '2022-08-07 12:02:49', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'Rony', 'ronymia111333@gmail.com', '01990572321', 'colombo', 'colombo', '1213', 'colombo'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 12:03:09', 19, '2022-08-07 12:03:09', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'Rony', 'ronymia111333@gmail.com', '01990572321', 'colombo', 'colombo', '1213', 'colombo'),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 12:05:14', 19, '2022-08-07 12:05:14', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'Rony', 'ronymia111333@gmail.com', '01990572321', 'colombo', 'colombo', '1213', 'colombo'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 12:05:42', 19, '2022-08-07 12:05:42', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'Rony Islam', 'ronymia.tech@gmail.com', '01990572321', 'Chittoor', 'ANDHRA PRADESH', '1213', 'dhaka, banani\r\ndhaka'),
(7, 7, 'he53wuKMJs2Shcp', 'Due', '2022-08-07', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:10:14', NULL, '2022-08-07 13:10:14', '2022-08-07 13:10:14', 7, '2022-08-07 13:10:14', 7, 'package', NULL, NULL, 3, '50', '2022-10-07 13:10:14', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'Banani', 'Dhaka', '1213', 'Bashati Horizon #20, Road #17, Banani-1213'),
(8, 15, 'doj87snD5Fq5lYN', 'Due', '2022-08-07', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:12:48', NULL, '2022-08-07 13:12:48', '2022-08-07 13:12:48', 15, '2022-08-07 13:12:48', 15, 'package', NULL, NULL, 3, '50', '2022-10-07 13:12:48', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'Banani', 'Dhaka', '1213', 'Bashati Horizon'),
(9, 20, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:14:12', NULL, NULL, '2022-08-07 13:14:12', 20, '2022-08-07 13:14:12', NULL, NULL, NULL, NULL, 1, '0', '2022-09-07 13:14:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 20, 'MByCEKSD0OYKmf6', 'VALID', '2022-08-07', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 13:15:38', NULL, '2022-08-07 13:15:38', '2022-08-07 13:15:38', 20, '2022-08-07 13:47:15', 1, 'package', NULL, NULL, 3, '50', '2022-10-07 13:15:38', NULL, 'Asia', 'asiaphtlbd@gmail.com', '01995842541', 'Banani', 'Dhaka', '1213', 'Bashati'),
(11, 21, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-07 18:25:19', NULL, NULL, '2022-08-07 18:25:19', 21, '2022-08-07 18:25:19', NULL, NULL, NULL, NULL, 1, '0', '2022-09-07 18:25:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 20, 'WWnoRCUiOzRHKqC', 'VALID', '2022-08-08', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-08 22:05:21', NULL, '2022-08-08 22:05:21', '2022-08-08 22:05:21', 20, '2022-08-09 14:55:16', 1, 'package', NULL, NULL, 3, '50', '2022-10-08 22:05:21', NULL, 'Asia', 'asiaphtlbd@gmail.com', '01990572321', 'dhaka', 'dhaka', '1213', 'dhaka'),
(13, 23, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 12:04:52', NULL, NULL, '2022-08-12 12:04:52', 23, '2022-08-12 12:04:52', NULL, NULL, NULL, NULL, 1, '0', '2022-09-12 12:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 'city', 1, NULL, 'Maharagama', NULL, 'maharagama', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-07 10:56:07', NULL, '2022-08-07 10:56:07'),
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
(16, 'city', 1, NULL, 'Colombo 3', NULL, 'colombo-3', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:37:00', NULL, '2022-08-13 09:37:00'),
(17, 'city', 1, NULL, 'Homagama', NULL, 'homagama', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2022-08-13 09:37:22', NULL, '2022-08-13 09:37:22');

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
(1, 1, 'Colombo', NULL, 'colombo', 1, NULL, NULL, 1, 1, 0, 1, '2022-08-07 10:54:39', NULL, '2022-08-07 10:54:39', NULL),
(2, 1, 'Kandy', NULL, 'kandy', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:54:52', NULL, '2022-08-07 10:54:52', NULL),
(3, 1, 'Galle', NULL, 'galle', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:55:05', NULL, '2022-08-07 10:55:05', NULL),
(4, 1, 'Ampara', NULL, 'ampara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:55:16', NULL, '2022-08-07 10:55:16', NULL),
(5, 1, 'Ampara', NULL, 'ampara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:55:29', NULL, '2022-08-07 10:55:29', NULL),
(6, 1, 'Anuradhapura', NULL, 'anuradhapura', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:55:39', NULL, '2022-08-07 10:55:39', NULL),
(7, 1, 'Badulla', NULL, 'badulla', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:57:34', NULL, '2022-08-07 10:57:34', NULL),
(8, 1, 'Batticaloa', NULL, 'batticaloa', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-07 10:57:48', NULL, '2022-08-07 10:57:48', NULL),
(9, 1, 'Gampaha', NULL, 'gampaha', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:13:12', NULL, '2022-08-13 09:13:12', NULL),
(10, 1, 'Kalutara', NULL, 'kalutara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:13:34', NULL, '2022-08-13 09:13:34', NULL),
(11, 1, 'Kegalle', NULL, 'kegalle', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:13:46', NULL, '2022-08-13 09:13:46', NULL),
(12, 1, 'Ratnapura', NULL, 'ratnapura', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:04', NULL, '2022-08-13 09:14:04', NULL),
(13, 1, 'Matara', NULL, 'matara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:27', NULL, '2022-08-13 09:14:27', NULL),
(14, 1, 'Jaffna', NULL, 'jaffna', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:40', NULL, '2022-08-13 09:14:40', NULL),
(15, 1, 'Hambantota', NULL, 'hambantota', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:14:59', NULL, '2022-08-13 09:14:59', NULL),
(16, 1, 'Kurunagala', NULL, 'kurunagala', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:15:18', NULL, '2022-08-13 09:15:18', NULL),
(17, 1, 'Ampara', NULL, 'ampara', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:15:53', NULL, '2022-08-13 09:15:53', NULL),
(18, 1, 'Puttalam', NULL, 'puttalam', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:16:28', NULL, '2022-08-13 09:16:28', NULL),
(19, 1, 'Matala', NULL, 'matala', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:16:49', NULL, '2022-08-13 09:16:49', NULL),
(20, 1, 'Vavuniya', NULL, 'vavuniya', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:07', NULL, '2022-08-13 09:17:07', NULL),
(21, 1, 'Kilinochchi', NULL, 'kilinochchi', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:25', NULL, '2022-08-13 09:17:25', NULL),
(22, 1, 'Mannar', NULL, 'mannar', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:40', NULL, '2022-08-13 09:17:40', NULL),
(23, 1, 'Mullaitivu', NULL, 'mullaitivu', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:17:57', NULL, '2022-08-13 09:17:57', NULL),
(24, 1, 'Polannaruwa', NULL, 'polannaruwa', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:18:27', NULL, '2022-08-13 09:18:27', NULL),
(25, 1, 'Monaragala', NULL, 'monaragala', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:18:52', NULL, '2022-08-13 09:18:52', NULL),
(26, 1, 'Nuwara Eliya', NULL, 'nuwara-eliya', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:19:19', NULL, '2022-08-13 09:19:19', NULL),
(27, 1, 'Kilinochchi', NULL, 'kilinochchi', 1, NULL, NULL, 1, 0, 0, 1, '2022-08-13 09:23:09', NULL, '2022-08-13 09:23:09', NULL);

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
(2, 'Individual', 'Md Omit Hasan', 'omit@gmail.com', '01916962118', NULL, 1, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$RakH.8CEAu17H7T/U5v5W.ilCQcKbNnNJO8U9C0kD6PWE6zbpqvya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-07-23 19:08:04', '2022-07-23 19:08:04', NULL, NULL, NULL, 3, '2022-07-25', '2022-08-24', 1, 1, NULL, 0),
(3, 'Individual', 'Maidul', 'maidul@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$RzOAv1TwNrbPQWHr4ABtD.M63xbsfLsgIcLo7E2lxpbwtImxq.rx6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-07-28 15:16:13', '2022-07-28 15:16:13', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0),
(4, 'Individual', 'Rony Islam', 'ronymia2212@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$32Uv2WRzAQ47t3b5ITa4.eB.t/VSsfbE7zC5Ct/NdMlMWZ6b4AMZS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_06082022_1659762393.jpg', 'https://gogoads.lk/media/images/profile/profile_06082022_1659762393.jpg', NULL, 0, 0, 0, 1, '2022-08-06 15:03:44', '2022-08-06 15:06:33', NULL, 'Chattogram', NULL, 1, NULL, NULL, 0, 0, 'RCm5fhDGNJlOuVFNmP8cax02DiOrdi', 1),
(5, 'Individual', 'Rony', 'ronymia2213@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$xdQqvB02C6sOO8Xa3a2rwO21R2cD8EnFkHWv3OvNG5ia2sQTfXzfy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 15:34:31', '2022-08-06 15:34:31', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'Qqik9cQvqywNTF5I8XmMPXU95TdODP', 0),
(6, 'Individual', 'Rony', 'ronymia2216@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$HxEngOFnb8BYwannGbhskuO8o9HPCYIWtFXz.UPNQc4sftGdwLyTu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 15:36:42', '2022-08-06 15:36:42', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'kYxv9quwPBFzCvCLtLRUdvLgG32cUb', 0),
(7, 'Individual', 'Rony', 'ronymia111333@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$QJau9CDu1FG5RVkpLE2./uVSyj8zGaTkUSjT27.OsM5/OCjWmpQKe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 15:42:25', '2022-08-06 15:42:25', NULL, NULL, NULL, 3, NULL, NULL, 0, 0, 'jWYcCDpcyFCXsTr4im4eM4cGAWFGz7', 1),
(8, 'Individual', 'Angcon Halder', 'angcon26101999@gmail.com', '01791693954', '01775425124', 1, 0, '3130', '8340', '2022-08-08 11:50:25', '2022-08-08 11:50:25', 13, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$oGmWhhcPcD.m2k/sF8LzIe03hWt8NYM2VTM7hhcWUkpNR.NH6uvZ6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_06082022_1659776058.jpg', 'https://gogoads.lk/media/images/profile/profile_06082022_1659776058.jpg', NULL, 0, 4, 0, 1, '2022-08-06 16:22:22', '2022-08-06 18:54:18', NULL, 'Dhaka', 'Mohakhali', 2, NULL, NULL, 0, 0, 'S94iSq5Do9PvG03Kfuq9gQktRDKjGw', 1),
(9, 'Individual', 'Angcon Halder', 'angcon26011999@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$1BTXB1po2wZ3.e5jPV/Ede2Bos59sPdzp8dFuXD.ow5VQTgP3mk8a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 16:24:45', '2022-08-06 16:24:45', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'WaBSMwZwFxHA5SThVDK1znvCJmikdi', 0),
(10, 'Individual', 'Angcon Halder', 'ziariyad0138@gmail.com', '01715145205', NULL, 0, 0, '6115', '', '2022-08-12 02:10:38', '2022-08-12 02:10:38', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$m2.j7tPBs3zAmQK7RlUMxe3vGn/GpOUwp4Cn/Q11WtHig2OyORIWe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 16:27:40', '2022-08-06 16:41:43', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'Eaa214LuprmjlusqprhEsySwESOrZD', 0),
(11, 'Individual', 'GogoAds Admin', 'gogoads.lk@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$n8zgr2qOnLbjy2WDXS1bGu2mkGwyibWMmfjgO/26R2lAkof55be4e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 17:53:11', '2022-08-06 17:53:11', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, '1X7HOlsyrsS79pCZLEoTSbNMut6u5h', 0),
(12, 'Individual', 'Rony', 'ronymia.tech1@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pDrO1BXXmImX6ppgh5pZfePyXhL8lYRbqQe455hcxwTMuNL5hEWru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 22:07:55', '2022-08-06 22:07:55', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'DbI8AK5Ae1rWbLewvPCy1CjFdiNZnH', 0),
(13, 'Individual', 'Rony', 'ronymia22112@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$VDvr4iAeapAu3bQThzcjSONSQ0ES4TGwRr6nkoP9JSgWyJORxfq7S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 22:15:41', '2022-08-06 22:15:41', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'e6Rrjf6l1IwxJSPy62g2biAxVfY04g', 0),
(14, 'Individual', 'rony', 'ronymia.tech2@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$V7BmmNVWV2OYUczpU3i8a.q5IUCNIIBhZdQyvVfj3JxY1AeU87KTG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 22:17:08', '2022-08-06 22:17:08', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'O3fR2dnlxSS8LsGbwmeiFkxUAOHhU5', 0),
(15, 'Individual', 'rony', 'ronymia.tech@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BellIYBJJKWdEg3S7tESoOMGQ0bH/HVfW8UrBYaLDm7MRt60tGSE.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-06 22:21:51', '2022-08-06 22:21:51', NULL, NULL, NULL, 3, NULL, NULL, 0, 0, '1RWJwqgIbMXwEsOSw42ob0dCCPqrpB', 1),
(16, 'Individual', 'Anees Ahamed', 'anees6222@yahoo.com', '94776628447', NULL, 0, 0, '4942', '', '2022-08-12 02:10:52', '2022-08-12 02:10:52', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$.UV0tkM11lganiwL0c2kFuQhCP7WAib0st19Y9BypYSoMk8OewbvW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_06082022_1659805585.jpg', 'https://gogoads.lk/media/images/profile/profile_06082022_1659805585.jpg', NULL, 0, 0, 0, 1, '2022-08-07 02:56:58', '2022-08-07 03:22:17', NULL, 'Kolombo', NULL, 2, NULL, NULL, 0, 0, '8wrK9c5SIPnR6UQ7oKHcm2pKItPh2a', 1),
(17, 'Individual', 'Masud Rana Tapu', 'masudrana.tapu1998@gmail.com', '94776628447', NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$.0tlqgcFL3JYTj/LhCv/C.zLgmOUK/slTbZpvSmuxYxX3C5GrdFZO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_07082022_1659851665.jpg', 'https://gogoads.lk/media/images/profile/profile_07082022_1659851665.jpg', NULL, 0, 0, 0, 1, '2022-08-07 15:01:36', '2022-08-07 15:54:25', NULL, 'Colombo', NULL, 1, NULL, NULL, 0, 0, '32n2QPbVV3BNIwXKbD66YA3ZTVdNL9', 1),
(18, 'Individual', 'Rony', 'ronymia2211@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Rsm0WIDt8whlFNN7kynIJ.2X.OnUTH7d18KNreQm87ffPKzuMQ8xC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-07 15:10:43', '2022-08-07 15:10:43', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, '25w6obBGg3IyF0MlFf37JkKc8Cb9hq', 1),
(19, 'Individual', 'MD Rony', 'ronymia111333@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-08 11:50:25', '2022-08-08 11:50:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IjFMOFwvNjUzUGhUQU9JS3cxOERRck5RPT0iLCJ2YWx1ZSI6IlVxZ1hGOUJweUJKQm5JQmhoUG5kUHc9PSIsIm1hYyI6IjBjZDg1ODAzNTFkNzBlYjc0OThmMTJkNTc0ZjM1ZjE4YWZjZjEwNDc3MjM1NWM3MjMzMmRmYWY2MzYwNjBmYjMifQ==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '107664573006850499632', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-07 15:47:25', '2022-08-07 15:47:25', NULL, NULL, NULL, 3, NULL, NULL, 0, 0, NULL, 1),
(20, 'Individual', 'Asia', 'asiaphtlbd@gmail.com', '94776628447', NULL, 1, 0, '3290', '', '2022-08-08 11:56:23', '2022-08-08 11:56:23', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$OsXq8fGYNHSh62afMASfC.8hrzh8FaIg5m9j0fzuuQ.KnIGJf8Ujq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, '2022-08-07 17:14:12', '2022-08-09 01:55:23', NULL, NULL, 'Maharagama, Colombo', 3, NULL, NULL, 0, 0, 'nZs57muj5dJ8SFVnI4t9Yqs1lOIjeV', 1),
(21, 'Individual', 'Anees Ahamed', 'Ahamed6233@hotmail.co', NULL, NULL, 0, 0, '', '', '2022-08-12 02:11:04', '2022-08-12 02:11:04', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$IUQdNpLUhv3uAmjutKy4rOxOl/.B1ixL.a473hl6nmR.PVFpAX1I6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-07 22:25:19', '2022-08-07 22:25:19', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, 'E8zUYpXF33LIuF0uT85SAryOL98Zdb', 0),
(22, 'Individual', 'Muaz AA', 'muaz.extr3a@gmail.com', NULL, NULL, 0, 0, '', '', '2022-08-13 05:57:45', '2022-08-13 05:57:45', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IlA2K2lYY3F2SGh6Y0dvdVE1ajE2bVE9PSIsInZhbHVlIjoiTVJMV2dUYnRGeU1GOUdtb1hFWVd2QT09IiwibWFjIjoiNjRkNTRhNTExMDc1YTJmZmZhYjYzYjUwNDJlNTgzYjQ1ZTE5MjhlNDEyODJiODQwM2Y2MTllOWU4MWQ5MmRlOSJ9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '101190293793594824240', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-09 23:36:14', '2022-08-09 23:36:14', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, NULL, 1),
(23, 'Individual Seller', 'Rakib', 'webdevsforu@gmail.com', '01990572321', NULL, 0, 0, '', '', '2022-08-12 02:07:26', '2022-08-12 02:07:26', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rT8D.GHAWtynYblyddn3aOGNXP4cQrI08Tgrl1DmR681y7B6bvLti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_12082022_1660284386.jpg', 'https://gogoads.lk/media/images/profile/profile_12082022_1660284386.jpg', NULL, 0, 0, 0, 1, '2022-08-12 16:04:52', '2022-08-12 16:06:26', NULL, 'Colombo', NULL, 1, NULL, NULL, 0, 0, 'wql8AfiWTRqDPabRs0ffEudeOyPlTX', 1),
(24, 'Individual', 'Muaz Extra', 'extra.muaz@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eyJpdiI6IllLNTdBbkFNMTJ5aDdLWVhvQTFSUVE9PSIsInZhbHVlIjoiWlZIQnU1ZWVsbVFTbFd1NmhtbmFlZz09IiwibWFjIjoiOGU0NTM0OGVjMmFlOWNjNmEzNTBiOTA4ZjNkYWYwNDMwMTVjNDE0MjBjZWZhNzg5Y2Q3NTc3NzY1MDRmOGY4NCJ9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '104938031516186999259', NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2022-08-13 19:56:28', '2022-08-13 19:56:28', NULL, NULL, NULL, 1, NULL, NULL, 0, 0, NULL, 0);

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
(1, 'How do I post an ad?', 'Posting an ad on gogoads.lk is easy and only takes few moments of your time. Follow the tips;\r\n\r\n For registered Users simply lick the yellow Post Ad button (in the top right corner of page) and follow the instructions.\r\n If you are not already logged in, you will need to log in as the first step of posting your ad.\r\n Your ad will go live once it has been reviewed (the reviewing process usually takes less than 1 hour during office hours).', '2020-12-15 16:45:14', '2022-08-13 18:01:55', '0000-00-00 00:00:00', NULL, 1, 0),
(2, 'How can I delete my posted ad on Dalalbazar.com?', 'To delete an ad on Dalalbazar.com, please go to your ad\'s page and click on the \"Delete ad\" option.', '2020-12-15 16:45:14', '2022-08-03 12:24:02', '0000-00-00 00:00:00', NULL, 1, 0),
(3, 'Why has my ad been rejected ?', 'All of the ads are manually reviewed - if your ad violates our posting rules it will be rejected. You can read what changes you have to make before the ad can be approved in the rejection email as well as bottom of your rejected ad from user dashboard.', '2020-12-15 16:45:14', '2022-08-03 12:24:00', '0000-00-00 00:00:00', NULL, 1, 0),
(4, 'What can I do for editing my ad?', 'To edit an ad, please go to your ad\'s page and click on the \"Edit ad\" option.', '2020-12-15 16:45:14', '2022-07-25 01:35:05', '0000-00-00 00:00:00', NULL, 1, 0),
(5, 'How can I set a new password on Dalalbazar.com?', 'To set a new Dalalbazar.com password, please log in to your account, go to the \"Settings\" page and enter a new password. If you forget your Dalalbazar.com password, you can go to the log-in page and click on the \"Forgot your password?\" link\r\nIf you have created an account via Facebook, you will not have a Dalalbazar.com password. You can log in to your account via Facebook without a password.', '2020-12-15 16:12:54', '2022-08-03 12:23:59', NULL, 1, 1, 0),
(6, 'How do I delete my ad?', 'To delete an ad, please go to ‘My ads page’ and select the ad then click on the “Delete ad” option.', '2022-08-03 12:29:55', '2022-08-13 18:01:58', NULL, 1, 1, 0),
(7, 'How do I edit my ad?', 'To edit an ad, please go to ‘My ads’ page and click on the “Edit ad” option.', '2022-08-03 12:30:08', '2022-08-13 18:02:02', NULL, 1, 1, 0),
(8, 'How do I set a reset password?', 'To reset a password, please log in to your account, go to the “Settings” page and enter a new password.\r\n\r\n\r\nIf you have forgotten your gogoads.lk password, you can; go to the log-in page and click on the “Forgot password?” follow the instruction\r\n If you have created an account via Facebook, you will not have a gogoads.lk password. You can log in to your account via Facebook without a password.', '2022-08-03 12:30:22', '2022-08-13 18:02:06', NULL, 1, 1, 0),
(9, 'How long do ads live on gogoads.lk?', 'Ads appear for 21 days, unless you delete them earlier.', '2022-08-03 12:30:52', '2022-08-13 18:02:09', NULL, 1, 1, 0),
(10, 'I posted an ad but can\'t find it. What\'s wrong?', 'Tip: you can keep track of your ads easily by logging in to your account and visiting your “My ads” page!\r\n\r\nYour ad may not be live due to one (or more) of the following reasons:\r\n\r\n\r\nIt is still under review – this will show on your My Ads page, under “Ads under review”.\r\nIt may non-compliant with Terms and Conditions – if your ad needs to be edited before it can be published, this will show on your My Ads page, under “Ads that need editing”.\r\nYou have used up your free ad allowance.\r\n\r\nIf you have been waiting longer than 24 hours for a response from us, you may have given us the wrong contact details when you posted the ad. Try posting again or contact us.', '2022-08-03 12:31:15', '2022-08-13 18:02:11', NULL, 1, 1, 0),
(11, 'Is any ad will be rejected?', 'As explained in above 6, other than all of the ads are manually reviewed – if your ad not comply with our Terms and Conditions it will be rejected. You can read what changes you have to make before the ad can be approved in the rejection email.', '2022-08-03 12:31:30', '2022-08-13 18:02:14', NULL, 1, 1, 0),
(12, 'I\'m getting contacted about an ad I didn\'t post. Can you help me?', 'Yes, please provide further details by contact us and we will help you right away.', '2022-08-03 12:31:39', '2022-08-13 18:02:16', NULL, 1, 1, 0),
(13, 'I haven\'t receive any response to my ad. What\'s wrong?', 'If you are not receiving responses to our ads, we recommend taking a look at our other services that will help you to find a way for success.', '2022-08-03 12:31:48', '2022-08-13 18:02:19', NULL, 1, 1, 0),
(14, 'What are the rules for posting on gogoads?', 'We have set up Terms and Conditions that will make this Website safer and all the posting shall be strictly to the requirements:\r\n\r\nAn item or service that is illegal in Sri Lanka or any other country\r\nAn invalid phone number or email address\r\nOffensive language\r\nOffensive images and pictures\r\nText in the title or description that is not related to the advertised item or service\r\nPictures that do not match or clearly show the advertised item or service\r\nA non-specific item or service, e.g. a description of a company in general terms\r\nA website link that is not relevant to the advertised item or service\r\nOffers and requests for items or services in the same advertisement\r\nIdentical content as another advertisement, re-posting within 7 days.\r\nMultiple items in the same ad\r\nAny contents that subject to gogoads.lk review and discretion.', '2022-08-03 12:32:06', '2022-08-13 18:02:21', NULL, 1, 1, 0),
(15, 'dd', 'd', '2022-08-03 12:32:32', '2022-08-03 12:33:00', NULL, 1, 1, 0),
(16, 'How do I change my account details?', 'To change the details on your account, log in to your account and go to your account’s Dashboard.', '2022-08-03 12:33:11', '2022-08-13 18:02:23', NULL, 1, 1, 0),
(17, 'Why can\'t I log in to my accounts?', 'If you are having trouble logging in to your account, please check that you have:\r\n\r\nSigned up for an account.\r\nEntered the correct user name and password on the log in page.\r\nIf you are still having trouble accessing your account, please contact us.', '2022-08-03 12:33:25', '2022-08-13 18:02:26', NULL, 1, 1, 0),
(18, 'What is my posting allowance?', 'Each month User can post a few ads for free in most categories on gogoads.lk, some categories are only accepted against the payment as stipulated. If the User consumed the free ad allowance for the month, User can upgrade to Membership in order to post more ads.', '2022-08-03 12:33:35', '2022-08-13 18:02:28', NULL, 1, 1, 0),
(19, 'What is \"Featured Ad\"?', 'Featured Ads is a premium service from gogoads.lk which allows you to display your listings on the first four slots on the top of the categories’ pages, that shift alternately with other featured ads.', '2022-08-03 12:33:44', '2022-08-13 18:02:31', NULL, 1, 1, 0),
(20, 'How does a Featured Ad look like?', 'Featured Ad is eye-catching and unique from the normal Ads:', '2022-08-03 12:33:59', '2022-08-13 18:02:33', NULL, 1, 1, 0),
(21, 'How soon does my Featured Ad appear on gogoads.lk?', 'For existing Ads, it should be on the spot after finishing the payment process, regarding the new Ads it will appear once your Ad passes the review process.', '2022-08-03 12:34:08', '2022-08-13 18:02:35', NULL, 1, 1, 0),
(22, 'What are the methods of payment?', 'Currently, you can only pay through bank transfer and we are working to provide a secured payment gateway for the easy process.', '2022-08-03 12:34:16', '2022-08-13 18:02:38', NULL, 1, 1, 0),
(23, 'Why is my ad not showing as a Featured Ad?', 'Gogoads.lk home normally displayed the latest four slots, however all Featured Ad is given equal opportunity to display. If you don’t see your Featured Ad right away, it means that there are more Featured Ads available than there are number of Featured Ad slots.', '2022-08-03 12:34:26', '2022-08-13 18:02:41', NULL, 1, 1, 0),
(24, 'What is a Membership?', 'To know all about Membership, please visit our Membership page.', '2022-08-03 12:34:43', '2022-08-13 18:02:44', NULL, 1, 1, 0),
(25, 'How much does it cost to place an ad?', 'Most ads on gogoads.lk are free. Currently, there are some categories where we charge to place an ad which is in:\r\n\r\nThe Property for Sale / Rent section. It will cost you SLRS 800 per ad to post in this category and your ad will be live on the site for 60 days with the refresh facility, meaning, you can push your ad to the top list every after seven days. After the last refresh date, your ad will still be live for another 2 months.\r\nUsed Cars for sale: Classic Package costs SLRS 800. (Prices vary depending on the package you choose)', '2022-08-03 12:35:01', '2022-08-13 18:02:47', NULL, 1, 1, 0),
(26, '21. Do gogoads.lk owe the posted ads on the Website?', 'No, we do not owe the items in the ads posted on our website as well as the jobs ads posted do not refer to vacancies in gogoads.lk offices.\r\n\r\nPlease note that we have no control over and do not guarantee the quality, safety or legality of items / properties / services advertised, the truth or accuracy of users’ Content or listings, the ability of sellers to sell items, the ability of buyers to pay for items, or that a buyer or seller will actually complete a transaction or return an item. It is the buyer’s responsibility to check the items / properties / services before entering to complete the transaction.\r\n\r\nPlease note that we are as a classifieds platform have no authority on the ads posted and we do not own them, we are merely a platform where buyers and sellers make transactions without our interference.', '2022-08-03 12:35:12', '2022-08-13 18:02:49', NULL, 1, 1, 0),
(27, '22. How to react to a fraud contact?', 'We strongly recommend you to stop communicating with this particular user and block him from sending you further messages and we also recommend you to contact us so we could block this user from contacting another user after conducting the necessary investigation.\r\n\r\nAlso we recommend you to contact your local authorities if you have been a victim of fraud click here to learn more about what we could help with If you are a victim.', '2022-08-03 12:35:22', '2022-08-13 18:02:51', NULL, 1, 1, 0),
(28, '23. How gogoads.lk can help in a fraud case?', 'We are very sorry if you have been a victim of a fraud.\r\n\r\nLuckily gogoads.lk or the QS Week (Pvt) Ltd can help you If you want to press charges legally against the fraudster and we can also provide you with all the data (available and accessible within the website) that you require to help you getting your items/money back.\r\n\r\nAs we are trying to keep our users privacy, we cannot release any data concerns a user to another without a legal warrant, means you have to report the fraud to the local authorities such as the police station and the police department concerned to such cases have to contact us requesting such data, only then we can release all the data they have requested such as (IP, Dates, Email,… etc.). Note we only require such process to be followed for the sake of our users privacy.\r\n\r\nPlease note that we have no control over and do not guarantee the quality, safety or legality of items / properties / services advertised, the truth or accuracy of users’ Content or listings, the ability of sellers to sell items, the ability of buyers to pay for items, or that a buyer or seller will actually complete a transaction or return an item. It is the buyer’s responsibility to check the items / properties / services before completing the transaction.\r\n\r\nGogoads.lk or the QS Week (Pvt) Ltd wish not to participate in any dispute between you and other user(s) of the Website.\r\n\r\nPlease note that we are as a classifieds platform have no authority on the ads posted and we do not own them, we are merely a platform where buyers and sellers make transactions without our interference.', '2022-08-03 12:35:32', '2022-08-13 18:02:54', NULL, 1, 1, 0),
(29, 'How gogoads.lk can help in a fraud case?', 'We are very sorry if you have been a victim of fraud. Luckily gogoads.lk or the QS Week (Pvt) Ltd can help you If you want to press charges legally against the fraudster and we can also provide you with all the data (available and accessible within the website) that you require to help you getting your items/money back. As we are trying to keep our user\'s privacy, we cannot release any data concerning a user to another without a legal warrant, which means you have to report the fraud to the local authorities such as the police station and the police department concerned to such cases have to contact us requesting such data, only then we can release all the data they have requested such as (IP, Dates, Email,… etc.). Note we only require a such process to be followed for the sake of our user\'s privacy. Please note that we have no control over and do not guarantee the quality, safety or legality of items/properties/services advertised, the truth or accuracy of users’ Content or listings, the ability of sellers to sell items, the ability of buyers to pay for items, or that a buyer or seller will actually complete a transaction or return an item. It is the buyer’s responsibility to check the items/properties/services before completing the transaction. Gogoads.lk or the QS Week (Pvt) Ltd wish not to participate in any dispute between you and other users of the Website. Please note that we are a classifieds platform and have no authority over the ads posted and we do not own them, we are merely a platform where buyers and sellers make transactions without our interference.', '2022-08-13 18:03:45', '2022-08-13 18:03:45', NULL, 1, NULL, 1),
(30, 'How to react to a fraud contact?', 'We strongly recommend you stop communicating with this particular user and block him from sending you further messages and we also recommend you to contact us so we could block this user from contacting another user after conducting the necessary investigation. Also, we recommend you to contact your local authorities if you have been a victim of fraud click here to learn more about what we could help with If you are a victim.', '2022-08-13 18:04:06', '2022-08-13 18:04:06', NULL, 1, NULL, 1),
(31, 'Do gogoads.lk, owe the posted ads on the Website?', 'No, we do not owe the items in the ads posted on our website as well as the jobs ads posted do not refer to vacancies in gogoads.lk offices. Please note that we have no control over and do not guarantee the quality, safety, or legality of items/properties/services advertised, the truth or accuracy of users’ Content or listings, the ability of sellers to sell items, the ability of buyers to pay for items, or that a buyer or seller will actually complete a transaction or return an item. It is the buyer’s responsibility to check the items/properties/services before entering to complete the transaction. Please note that we are a classifieds platform have no authority over the ads posted and we do not own them, we are merely a platform where buyers and sellers make transactions without our interference.', '2022-08-13 18:04:35', '2022-08-13 18:04:35', NULL, 1, NULL, 1),
(32, 'How much does it cost to place an ad?', 'Most ads on gogoads.lk are free. Currently, there are some categories where we charge to place an ad which is in: The Property for Sale / Rent section. It will cost you SLRS 800 per ad to post in this category and your ad will be live on the site for 60 days with the refresh facility, meaning, you can push your ad to the top list every after seven days. After the last refresh date, your ad will still be live for another 2 months. Used Cars for sale: Classic Package costs SLRS 800. (Prices vary depending on the package you choose)', '2022-08-13 18:04:59', '2022-08-13 18:05:08', NULL, 1, 1, 0),
(33, 'How much does it cost to place an ad?', 'Most ads on gogoads.lk are free. Currently, there are some categories where we charge to place an ad which is in: The Property for Sale / Rent section. It will cost you SLRS 800 per ad to post in this category and your ad will be live on the site for 60 days with the refresh facility, meaning, you can push your ad to the top list every after seven days. After the last refresh date, your ad will still be live for another 2 months. Used Cars for sale: Classic Package costs SLRS 800. (Prices vary depending on the package you choose)', '2022-08-13 18:05:36', '2022-08-13 18:05:36', NULL, 1, NULL, 1),
(34, 'What is a Membership?', 'To know all about Membership, please visit our Membership page.', '2022-08-13 18:05:58', '2022-08-13 18:05:58', NULL, 1, NULL, 1),
(35, 'Why is my ad not showing as a Featured Ad?', 'Gogoads.lk home normally displayed the latest four slots, however, all Featured Ad is given equal opportunity to display. If you don’t see your Featured Ad right away, it means that there are more Featured Ads available than the number of Featured Ad slots.', '2022-08-13 18:06:16', '2022-08-13 18:06:16', NULL, 1, NULL, 1),
(36, 'What are the methods of payment?', 'Currently, you can only pay through bank transfer and we are working to provide a secured payment gateway for the easy process.', '2022-08-13 18:06:36', '2022-08-13 18:06:36', NULL, 1, NULL, 1),
(37, 'How soon does my Featured Ad appear on gogoads.lk?', 'For existing Ads, it should be on the spot after finishing the payment process, regarding the new Ads it will appear once your Ad passes the review process.', '2022-08-13 18:06:58', '2022-08-13 18:06:58', NULL, 1, NULL, 1),
(38, 'What does a Featured Ad look like?', 'The featured Ad is eye-catching and unique from the normal Ads.', '2022-08-13 18:07:24', '2022-08-13 18:07:24', NULL, 1, NULL, 1),
(39, 'What is a \"Featured Ad\"?', 'Featured Ads is a premium service from gogoads.lk which allows you to display your listings on the first four slots on the top of the categories’ pages, that shift alternately with other featured ads.', '2022-08-13 18:07:42', '2022-08-13 18:07:42', NULL, 1, NULL, 1),
(40, 'What is my posting allowance?', 'Each month Users can post a few ads for free in most categories on gogoads.lk, some categories are only accepted against the payment as stipulated. If the User consumed the free ad allowance for the month, the User can upgrade to Membership in order to post more ads.', '2022-08-13 18:07:58', '2022-08-13 18:07:58', NULL, 1, NULL, 1),
(41, 'Why can\'t I log in to my accounts?', 'If you are having trouble logging in to your account, please check that you have: Signed up for an account. Entered the correct user name and password on the log-in page. If you are still having trouble accessing your account, please contact us.', '2022-08-13 18:08:15', '2022-08-13 18:08:15', NULL, 1, NULL, 1),
(42, 'How do I change my account details?', 'To change the details on your account, log in to your account and go to your account’s Dashboard.', '2022-08-13 18:08:34', '2022-08-13 18:08:34', NULL, 1, NULL, 1),
(43, 'What are the rules for posting on gogoads?', 'We have set up Terms and Conditions that will make this Website safer and all the posting shall be strict to the requirements: An item or service that is illegal in Sri Lanka or any other country An invalid phone number or email address Offensive language Offensive images and pictures Text in the title or description that is not related to the advertised item or service Pictures that do not match or clearly show the advertised item or service A non-specific item or service, e.g. a description of a company in general terms A website link that is not relevant to the advertised item or service Offers and requests for items or services in the same advertisement Identical content as another advertisement, re-posting within 7 days. Multiple items in the same ad Any contents that are subject to gogoads.lk review and discretion.', '2022-08-13 18:08:58', '2022-08-13 18:08:58', NULL, 1, NULL, 1),
(44, 'I haven\'t received any response to my ad. What\'s wrong?', 'If you are not receiving responses to our ads, we recommend taking a look at our other services that will help you to find a way to success.', '2022-08-13 18:09:15', '2022-08-13 18:09:15', NULL, 1, NULL, 1),
(45, 'I\'m getting contacted about an ad I didn\'t post. Can you help me?', 'Yes, please provide further details by contacting us and we will help you right away.', '2022-08-13 18:09:40', '2022-08-13 18:09:40', NULL, 1, NULL, 1),
(46, 'Is any ad will be rejected?', 'As explained in above 6, other than all of the ads are manually reviewed – if your ad does not comply with our Terms and Conditions it will be rejected. You can read what changes you have to make before the ad can be approved in the rejection email.', '2022-08-13 18:10:06', '2022-08-13 18:10:06', NULL, 1, NULL, 1),
(47, 'I posted an ad but can\'t find it. What\'s wrong?', 'Tip: you can keep track of your ads easily by logging in to your account and visiting your “My ads” page! Your ad may not be live due to one (or more) of the following reasons: It is still under review – this will show on your My Ads page, under “Ads under review”. It may be non-compliant with Terms and Conditions – if your ad needs to be edited before it can be published, this will show on your My Ads page, under “Ads that need editing”. You have used up your free ad allowance. If you have been waiting longer than 24 hours for a response from us, you may have given us the wrong contact details when you posted the ad. Try posting again or contact us.', '2022-08-13 18:10:28', '2022-08-13 18:10:28', NULL, 1, NULL, 1),
(48, 'How long do ads live on gogoads.lk?', 'Ads appear for 21 days unless you delete them earlier.', '2022-08-13 18:10:44', '2022-08-13 18:10:44', NULL, 1, NULL, 1),
(49, 'How do I set a reset password?', 'To reset a password, please log in to your account, go to the “Settings” page and enter a new password. If you have forgotten your gogoads.lk password, you can; go to the login page and click on the “Forgot password?” follow the instruction If you have created an account via Facebook, you will not have a gogoads.lk password. You can log in to your account via Facebook without a password', '2022-08-13 18:11:00', '2022-08-13 18:11:00', NULL, 1, NULL, 1),
(50, 'How do I edit my ad?', 'To edit an ad, please go to the ‘My ads’ page and click on the “Edit ad” option.', '2022-08-13 18:11:15', '2022-08-13 18:11:15', NULL, 1, NULL, 1),
(51, 'How do I delete my ad?', 'To delete an ad, please go to ‘My ads page’ and select the ad then click on the “Delete ad” option.', '2022-08-13 18:11:28', '2022-08-13 18:11:28', NULL, 1, NULL, 1),
(52, 'What can I do for editing my ad?', 'To edit an ad, please go to your ad\'s page and click on the \"Edit ad\" option.', '2022-08-13 18:11:43', '2022-08-13 18:11:43', NULL, 1, NULL, 1),
(53, 'Why has my ad been rejected?', 'All of the ads are manually reviewed - if your ad violates our posting rules it will be rejected. You can read what changes you have to make before the ad can be approved in the rejection email as well as the bottom of your rejected ad from the user dashboard.', '2022-08-13 18:12:01', '2022-08-13 18:12:01', NULL, 1, NULL, 1),
(54, 'How do I post an ad?', 'Posting an ad on gogoads.lk is easy and only takes a few moments of your time. Follow the tips; For registered Users simply lick the yellow Post Ad button (in the top right corner of the page) and follow the instructions. If you are not already logged in, you will need to log in as the first step of posting your ad. Your ad will go live once it has been reviewed (the reviewing process usually takes less than 1 hour during office hours).', '2022-08-13 18:12:15', '2022-08-13 18:12:15', NULL, 1, NULL, 1);

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
(1, 2, 'Free', NULL, 2000, '24/7 Live Support', 5, '2', 0, 0, 0, 0, 1, 1, NULL, NULL, 1, '2022-08-06 15:04:06'),
(2, 4, 'Personal', NULL, 2000, '24/7 Live Support', 5, '1', 0, 1, 1, 1, 1, 2, NULL, NULL, 1, '2022-08-06 15:21:26'),
(3, 50, 'Business', NULL, 5000, '24/7 Live Support', 10, '2', 1, 1, 1, 1, 1, 3, NULL, NULL, NULL, NULL),
(4, 200, 'Business Premium', NULL, 7000, '24/7 Live Support', 10, '2', 1, 1, 1, 1, 1, 4, NULL, NULL, NULL, NULL),
(5, 3, 'Gold', NULL, 5000, '24/7 Live Support', 20, '2', 1, 1, 1, 1, 1, 5, 1, '2022-06-16 00:39:59', NULL, '2022-06-16 00:39:59'),
(6, 4, 'Gold', NULL, 5000, '24/7 Live Support', 200, '2', 1, 1, 1, 1, 1, 6, 1, '2022-06-16 00:41:10', 1, '2022-06-16 01:06:48'),
(7, 50, 'test', NULL, 49, '20', NULL, '9', 1, 1, 1, 1, 1, 1, 1, '2022-07-21 22:43:59', 1, '2022-07-21 22:44:16');

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
(1, 'AL-Khidmah Computers BD', NULL, 'বেঙ্গল ফ্যাক্টরির অপজিটে,ঝুমা গার্মেন্টস সংলগ্ন, জিরানী বাজার,(বি.কে.এস.পি)আশুলিয়া, সাভার, ঢাকা।', '01554875214', '10:00 am - 10:00 pm', '41635.png', 'AL-Khidmah Computers is the Largest used Laptop provider of Bangladesh. You can choose a Laptop from hundreds of Laptop. You are buying a Laptop less than 40-50% price of a new one. The primary goal of our company is to increase the number of high-quality, low-cost Laptop and related parts and Accessories. When buying a laptop for yourself, there are many factors you should consider to ensure you’re purchasing the right Laptop for your needs and budget. We generally recommend buying a laptop through AL-Khidmah Computers, because of our wide collection, low prices and one-year service warranty.\"', 20, NULL, '2022-08-09 14:58:49', '2022-08-09 14:58:49', 1, 20);

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
(1, 'extra.muaz@gmail.com', '2022-08-09 23:35:56', '2022-08-09');

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `prd_ad_details`
--
ALTER TABLE `prd_ad_details`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prd_brand`
--
ALTER TABLE `prd_brand`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `prd_category`
--
ALTER TABLE `prd_category`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `prd_favourites`
--
ALTER TABLE `prd_favourites`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prd_features`
--
ALTER TABLE `prd_features`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prd_img_library`
--
ALTER TABLE `prd_img_library`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prd_master`
--
ALTER TABLE `prd_master`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prd_model`
--
ALTER TABLE `prd_model`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prd_reports`
--
ALTER TABLE `prd_reports`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prd_type`
--
ALTER TABLE `prd_type`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `prod_job_preference`
--
ALTER TABLE `prod_job_preference`
  MODIFY `pk_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `pk_no` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ss_business_function`
--
ALTER TABLE `ss_business_function`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ss_chat`
--
ALTER TABLE `ss_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ss_cities`
--
ALTER TABLE `ss_cities`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ss_subscribe`
--
ALTER TABLE `ss_subscribe`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
