-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2023 at 03:36 AM
-- Server version: 10.3.37-MariaDB-log-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viclghik_listorbuydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auths`
--

CREATE TABLE `auths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `mobile_no` varchar(14) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(20) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL COMMENT '1 = Admin',
  `mobile1` varchar(100) DEFAULT NULL,
  `mobile1_is_verified` tinyint(4) DEFAULT 0,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `dob` date DEFAULT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `google_id` bigint(20) DEFAULT NULL,
  `package_id` int(10) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `seller_type` varchar(255) NOT NULL DEFAULT 'Individual Seller',
  `activation_code` varchar(255) DEFAULT NULL,
  `activation_code_expire` datetime DEFAULT NULL,
  `is_first_login` tinyint(4) NOT NULL DEFAULT 1,
  `user_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Admin',
  `can_login` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Can login, 0 = Can not login',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updated_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `web_setting_access` int(1) NOT NULL DEFAULT 0,
  `profile_pic` varchar(100) DEFAULT NULL,
  `profile_pic_url` varchar(100) DEFAULT NULL,
  `pic_mime_type` varchar(20) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auths`
--

INSERT INTO `auths` (`id`, `username`, `name`, `email`, `address`, `mobile_no`, `password`, `salt`, `model_id`, `mobile1`, `mobile1_is_verified`, `gender`, `dob`, `facebook_id`, `google_id`, `package_id`, `is_active`, `seller_type`, `activation_code`, `activation_code_expire`, `is_first_login`, `user_type`, `can_login`, `status`, `created_by`, `updated_by`, `remember_token`, `city`, `total_post`, `created_at`, `updated_at`, `web_setting_access`, `profile_pic`, `profile_pic_url`, `pic_mime_type`, `first_name`, `last_name`, `designation`) VALUES
(1, 'rony', NULL, 'arobil@gmail.com', NULL, '01681944126', '$2y$10$VFm643nOKw7wq.0N9mUKyeUA4wfq0igfJE0QXP5Q0qZhcUO7Nn0Ty', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 'Individual Seller', NULL, NULL, 1, 0, 1, 1, 0, 0, NULL, NULL, 0, NULL, '2023-01-19 05:57:43', 1, 'profile_19012023_1674104236.jpg', 'http://ok2list.webdevs4u.com/media/images/profile/profile_19012023_1674104236.jpg', NULL, 'Ron', 'Mia', 'Developer'),
(21, 'Manager', NULL, 'Manager@gmail.com', NULL, '01681944126', '$2y$10$X5TDs4BFzFGOXx9qh/ZW2.rHmHIcLB.WhhPRp586Tn4VIZ2l9WKi6', NULL, 0, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 'Individual Seller', NULL, NULL, 1, 0, 1, 1, 0, 0, NULL, NULL, 0, '2022-07-28 14:39:03', '2023-01-19 05:58:23', 0, 'profile_19012023_1674104303.jpg', 'http://ok2list.webdevs4u.com/media/images/profile/profile_19012023_1674104303.jpg', NULL, 'Manager', 'Manager', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `auth_role`
--

CREATE TABLE `auth_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` int(11) DEFAULT NULL,
  `custom_permission` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_role`
--

INSERT INTO `auth_role` (`id`, `auth_id`, `role_id`, `user_group_id`, `custom_permission`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, '2020-10-03 07:06:35', '2022-07-28 14:11:37'),
(3, 21, 12, 5, NULL, '2022-07-28 14:39:03', '2023-01-19 05:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `backup_admin_users`
--

CREATE TABLE `backup_admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `auth_id` bigint(20) UNSIGNED NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `profile_pic_url` varchar(255) DEFAULT NULL,
  `pic_mime_type` varchar(50) DEFAULT NULL,
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
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `conversion_rate` float(14,4) DEFAULT 0.0000,
  `default_currencies` int(2) DEFAULT 0 COMMENT '1=Default currencies; 0=Absence currencies,	',
  `symbol_position` varchar(255) NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `conversion_rate`, `default_currencies`, `symbol_position`, `created_at`, `updated_at`) VALUES
(1, 'United State Dollar', 'USD', '$', 1.0000, 1, 'left', '2022-08-19 23:31:12', '2023-01-17 12:10:39'),
(4, 'Euro', 'EUR', '€', 0.9271, 0, 'right', '2023-01-16 04:17:42', '2023-01-17 12:10:39'),
(6, 'Bangla', 'BDT', '৳', 104.1698, 0, 'left', '2023-01-16 04:18:11', '2023-01-17 12:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `moto` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `established` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
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
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `direction` varchar(3) NOT NULL DEFAULT 'ltr',
  `default_lang` int(2) DEFAULT 0 COMMENT '1=Default Lang; 0=Absence Lang,',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `direction`, `default_lang`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'flag-icon-gb', 'ltr', 1, '2022-08-19 23:31:12', '2023-01-24 19:29:30'),
(2, 'Chinese', 'zh', 'flag-icon-cn', 'ltr', 0, '2022-12-20 09:15:21', '2023-01-24 19:29:30'),
(3, 'Hindi', 'hi', 'flag-icon-in', 'ltr', 0, '2023-01-15 06:22:28', '2023-01-15 07:34:49'),
(6, 'Arabic', 'ar', 'flag-icon-sa', 'ltr', 0, '2023-01-15 07:29:44', '2023-01-15 07:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
  `display_name` varchar(255) NOT NULL,
  `model_key` varchar(10) NOT NULL,
  `model_class_name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `amount` varchar(100) NOT NULL,
  `cart` text DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_value` varchar(255) DEFAULT NULL,
  `discount` text DEFAULT NULL,
  `shipping` text DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `txnid` varchar(255) DEFAULT NULL,
  `tax` double NOT NULL DEFAULT 0,
  `referance` varchar(255) DEFAULT NULL,
  `transaction_number` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `shipping_info` text DEFAULT NULL,
  `billing_info` text DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `state_price` double DEFAULT 0,
  `state` text DEFAULT NULL,
  `donate` varchar(255) DEFAULT NULL,
  `is_shipped` int(2) NOT NULL DEFAULT 0,
  `tracking_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_about_us`
--

INSERT INTO `page_about_us` (`id`, `image`, `details_en`, `details_sl`, `mission_en`, `mission_sl`, `vision_en`, `vision_sl`, `our_values_en`, `our_values_sl`, `created_at`, `updated_at`) VALUES
(1, 'media/about/about-63be59da3ce4e.jpg', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p>ok2list.com 2018 දෙසැම්බර් මාසයේදී දියත් කරන ලද්දේ වෙබ් අඩවි වත්මන් වෙළඳපොල සමඟ අමුත්තන් වර්ගීකරණය කරන ලද වෙබ් අඩවි සඳහා විකල්පයක් සොයන අයගේ අවශ්&zwj;යතා සම්පූර්ණ කිරීම සඳහා ය. අපගේ දැක්ම වන්නේ හොඳම මාර්ගගත වර්ගීකරණය කරන ලද වෙබ් අඩවියක් තැනීමයි. මෙය සාක්ෂාත් කර ගැනීම සඳහා, අපි වඩාත් ජනප්&zwj;රිය වෙබ් අඩවි වල හොඳම විශේෂාංග ගෙන ඒවා වෙනත් තරඟකරුවන් විසින් සොයා නොගත් සහ ඉදිරිපත් නොකළ බොහෝ නව අභිරුචි විශේෂාංග සමඟ ඒකාබද්ධ කර ඒවා එක තැනකට තැබුවෙමු. ඒ ok2list.com ය.</p>\r\n\r\n<p>Ok2list.com ඔබේ දැන්වීම් කෙරෙහි වැඩි පරිශීලක පාලනයකට ඉඩ දෙන අතරම වඩා හොඳ පරිශීලක අත්දැකීමක් ලබා දෙයි. අපි කුඩා ගාස්තුවකට අපගේ වාරික විශේෂාංග (ගෙවුම් සේවා) වෙත උත්ශ්&zwj;රේණි කිරීමේ හැකියාව සමඟින් නොමිලේ වර්ගීකරණය කළ දැන්වීම් පිරිනමන්නෙමු. අපගේ සාමාජිකත්වය භාවිතා කිරීමට සහ ඔබේ දැන්වීම් දායක සේවා ප්&zwj;රවර්ධනය කිරීමට අපි අපගේ ව්&zwj;යාපාරික පරිශීලකයින් දිරිමත් කරමු. Ok2list.com ඔබගේ ව්&zwj;යාපාරයට අපගේ වෙබ් අඩවියේ අභිරුචි පැවතීමට ඉඩ සලසයි.</p>\r\n\r\n<p>ok2list.com මඟින් පරිශීලකයින්ට වේගයෙන් පෙනෙන දේ හරියටම සොයා ගැනීමට හැකි වූ අතර පරිශීලකයින්ට මිනිත්තු 2 ක් තුළ දැන්වීමක් පළ කිරීමට හැකි විය. පරිශීලකයින්ට නොමිලේ ගිණුමක් සඳහා ලියාපදිංචි විය හැකි අතර සෑම විටම පහසුවෙන් දැන්වීම් පළ කළ හැකිය.</p>\r\n\r\n<p>දැනට, පවතින නවීන තාක්&zwj;ෂණය අනුව තව දුරටත් වැඩිදියුණු කිරීමට සහ ජංගම යෙදුම් සැපයීමට අපි තවමත් කටයුතු කරමින් සිටිමු.</p>\r\n\r\n<p>අපි ඔබේ හඬට, අදහසට සහ නිර්දේශයට ගරු කරන අතර contacts@theqsweek.com හි ඔබේ අදහස අපට දන්වන්නෙමු.</p>\r\n\r\n<p>ok2list.com භාවිතා කිරීම ගැන ඔබට ස්තුතියි</p>', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'පුද්ගල පද්ධති සහ තාක්‍ෂණය සඳහා ඇති කැපවීම තුළින්, ok2list.com ශ්‍රී ලංකාවේ සහ කලාපයේ ප්‍රමුඛ පෙළේ මාර්ගගත වර්ගීකරණයක් ලෙස අපගේ තත්ත්වය ගොඩනඟා ගනිමින්, අපගේ ගනුදෙනුකරුවන්ට වටිනාකමක් ලබා දීමට අපි පෙරමුණ ගනිමු.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'පුද්ගල පද්ධති සහ තාක්‍ෂණය සඳහා ඇති කැපවීම තුළින්, ok2list.com ශ්‍රී ලංකාවේ සහ කලාපයේ ප්‍රමුඛ පෙළේ මාර්ගගත වර්ගීකරණයක් ලෙස අපගේ තත්ත්වය ගොඩනඟා ගනිමින්, අපගේ ගනුදෙනුකරුවන්ට වටිනාකමක් ලබා දීමට අපි පෙරමුණ ගනිමු.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'පුද්ගල පද්ධති සහ තාක්‍ෂණය සඳහා ඇති කැපවීම තුළින්, ok2list.com ශ්‍රී ලංකාවේ සහ කලාපයේ ප්‍රමුඛ පෙළේ මාර්ගගත වර්ගීකරණයක් ලෙස අපගේ තත්ත්වය ගොඩනඟා ගනිමින්, අපගේ ගනුදෙනුකරුවන්ට වටිනාකමක් ලබා දීමට අපි පෙරමුණ ගනිමු.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_how_sell_fast`
--

CREATE TABLE `page_how_sell_fast` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_privacy_policy`
--

INSERT INTO `page_privacy_policy` (`id`, `details_en`, `details_sl`, `rules_en`, `rules_sl`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p>රහස්යතා ප්රතිපත්තිය<br />\r\nOk2list.com රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශය</p>\r\n\r\n<p>මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශය ලියා යාවත්කාලීන කරන ලද්දේ 2019 ජනවාරි මාසයේදීය. (&ldquo;The QS Week (Pvt) Ltd&rdquo;) වෙබ් අඩවියේ ආරක්ෂිත සහ ප්&zwj;රයෝජනවත් භාවිතයක් සහතික කර ගැනීම සඳහා ඕනෑම හෝ සියලුම අන්තර්ගතයන් වෙනස් කිරීමේ අයිතිය රඳවා තබා ගනී. ok2list.com&rdquo;). අපි පරිශීලකයාගේ සහ ප්&zwj;රචාරකයාගේ පෞද්ගලිකත්වයට ගරු කරන අතර පරිශීලක සහ දැන්වීම්කරුගේ පුද්ගලික දත්ත ආරක්ෂා කිරීමට කැපවී සිටිමු. මෙම රහස්&zwj;යතා ප්&zwj;රකාශය සමාගම හෝ වෙබ් අඩවිය පරිශීලක/දැන්වීම්කරුගේ පුද්ගලික දත්ත කළමනාකරණය කරන ආකාරය විස්තර කරයි. අපගේ වෙබ් අඩවිය භාවිතා කිරීමට පෙර කරුණාකර මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශය හොඳින් කියවන්න.</p>\r\n\r\n<p>අර්ථ දැක්වීම්:</p>\r\n\r\n<p>මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්ති ප්&zwj;රකාශයේ භාවිත කර ඇති කැප්ස් ලොක් සමඟින් ආරම්භ වන වචන (&quot;නිර්වචන&quot; යන මාතෘකාව යටතේ නියමයන් සහ කොන්දේසි වල පැහැදිලි කර ඇති පරිදි) ඒවාට පිළිවෙලින් එකම අර්ථය / ප්&zwj;රකාශනය පවරනු ලැබේ.</p>\r\n\r\n<p>අපි කවුද:</p>\r\n\r\n<p>QS Week (PVT) LTD යනු වෙබ් අඩවියට අදාළව ඕනෑම දිනයක් පාලනය කරන ප්&zwj;රධාන ආයතනයයි.</p>\r\n\r\n<p>අපි ඔබ ගැන රැස් කරන දත්ත මොනවාද?</p>\r\n\r\n<p>සෘජු අන්තර්ක්&zwj;රියා හරහා දත්ත සපයනු ලැබේ</p>\r\n\r\n<p>ලියාපදිංචිය සහ අනෙකුත් ගිණුම් තොරතුරු: අපගේ වෙබ් අඩවිය භාවිතා කිරීමට පරිශීලක ලියාපදිංචි වූ විට, නම (අදාළ වන පරිදි පළමු සහ අවසාන), විද්&zwj;යුත් තැපැල් ලිපිනය, දුරකථන අංකය, ස්ත්&zwj;රී පුරුෂ භාවය, වයස (අවසරය මත පදනම්ව) ඇතුළත් පහත තොරතුරු අපි රැස්කර ගත හැක. පරිශීලක) සහ ස්ථානය.</p>\r\n\r\n<p>ඔබ අපගේ වේදිකාව සමඟ අන්තර් ක්&zwj;රියා කරන විට හෝ අපගේ වෙබ් අඩවිය භාවිතා කරන විට, අපි ඔබ ගැන පහත තොරතුරු ස්වයංක්&zwj;රීයව රැස්කර ගනිමු:</p>\r\n\r\n<p>උපාංග තොරතුරු: මෙහෙයුම් පද්ධති අනුවාදය සහ අද්විතීය හඳුනාගැනීම් වැනි නිශ්චිත තොරතුරු<br />\r\nස්ථාන තොරතුරු: ඔබගේ උපාංග අවසර මත පදනම්ව, ඔබ අපගේ වේදිකාවේ අයිතමයක් පළ කරන්නේ නම්, අපි ඔබගේ සත්&zwj;ය ස්ථානය පිළිබඳ තොරතුරු ස්වයංක්&zwj;රීයව රැස් කර සකසමු.<br />\r\nපරිශීලක ලොග් දත්ත: ඔබගේ උපාංගයේ අන්තර්ජාල ප්&zwj;රොටෝකෝලය (IP) ලිපිනය, වේලා කලාපය සහ මෙහෙයුම් පද්ධතිය ඇතුළු තාක්ෂණික විස්තර. අපි ඔබගේ පිවිසුම් තොරතුරු (ලියාපදිංචි දිනය, අවසන් මුරපද වෙනස් කළ දිනය, අවසන් වරට සාර්ථක පුරනය වූ දිනය), ඔබගේ බ්&zwj;රවුසරයේ වර්ගය සහ අනුවාදය ද ගබඩා කරන්නෙමු.<br />\r\nක්ලික් ප්&zwj;රවාහ දත්ත</p>\r\n\r\n<p>ඔබ අපගේ වේදිකාවට ප්&zwj;රවේශ වූ අඩවි, එක් එක් සංචාරයේ දිනය සහ වේලා මුද්&zwj;රාව, ඔබ සිදු කර ඇති සෙවීම්, ඔබ ක්ලික් කළ ලැයිස්තුගත කිරීම් හෝ වෙළඳ දැන්වීම් බැනර්, එවැනි වෙළඳ දැන්වීම් හෝ ලැයිස්තුගත කිරීම් සමඟ ඔබේ අන්තර්ක්&zwj;රියා, කාලසීමාව ඇතුළත් අපගේ වේදිකාවේ ඔබේ ක්&zwj;රියාකාරකම් පිළිබඳ තොරතුරු අපි රැස් කරමු. ඔබගේ සංචාරය සහ ඔබ අපගේ වේදිකාවේ අන්තර්ගතයට පිවිසෙන අනුපිළිවෙල.</p>\r\n\r\n<p>කුකීස් සහ සමාන තාක්ෂණයන්</p>\r\n\r\n<p>අපගේ පරිශීලකයින්ගේ සැසි කළමනාකරණය කිරීමට, ඔබේ මනාප භාෂා තේරීම ගබඩා කිරීමට සහ ඔබට අදාළ වෙළඳ දැන්වීම් ලබා දීමට අපි කුකීස් භාවිතා කරමු. &quot;කුකීස්&quot; යනු ඔබගේ උපාංගයේ දෘඪ තැටියට වෙබ් සේවාදායකයක් විසින් මාරු කරන ලද කුඩා පෙළ ගොනු වේ. ඔබගේ සංචාරයේ දිනය සහ වේලාව, ඔබගේ ගවේෂණ ඉතිහාසය, ඔබගේ මනාපයන් සහ ඔබගේ පරිශීලක නාමය එකතු කිරීමට කුකීස් භාවිතා කළ හැක. ඔබට ඔබගේ බ්&zwj;රවුසරය සියල්ලම හෝ සමහර කුකීස් ප්&zwj;රතික්ෂේප කිරීමට හෝ වෙබ් අඩවි කුකීස් සකසන විට හෝ ප්&zwj;රවේශ වන විට ඔබව දැනුවත් කිරීමට සැකසිය හැක. ඔබ කුකීස් අක්&zwj;රිය කරන්නේ නම් හෝ ප්&zwj;රතික්ෂේප කරන්නේ නම්, අපගේ සේවා/වේදිකාවේ සමහර කොටස් ප්&zwj;රවේශ විය නොහැකි හෝ නිසි ලෙස ක්&zwj;රියා නොකරන බව කරුණාවෙන් සලකන්න. අප භාවිතා කරන කුකීස් පිළිබඳ වැඩි විස්තර සඳහා, කරුණාකර අපගේ කුකීස් සහ ඒ හා සමාන තාක්ෂණයන් පිළිබඳ ප්&zwj;රතිපත්තිය බලන්න, මෙම රහස්&zwj;යතා ප්&zwj;රතිපත්තිය වෙත යොමු කර ඇති සහ එහි කොටසක් ලෙස ඇතුළත් කර ඇත.</p>', 'Posting an ad on ok2list.com is free! However, all ads must follow our rules:\r\n\r\nMake sure you post in the correct category.\r\nDo not post the same ad more than once or repost an ad within 48 hours.\r\nDo not upload pictures with watermarks.\r\nDo not post ads containing multiple items unless it\'s a package deal.\r\nDo not put your email or phone numbers in the title or description.', 'ok2list.com හි දැන්වීමක් පළ කිරීම නොමිලේ! කෙසේ වෙතත්, සියලුම දැන්වීම් අපගේ නීති අනුගමනය කළ යුතුය:\r\n\r\nඔබ නිවැරදි ප්‍රවර්ගයේ පළ කිරීමට වග බලා ගන්න.\r\nඑකම දැන්වීම එක වරකට වඩා පළ නොකරන්න හෝ පැය 48ක් ඇතුළත දැන්වීමක් නැවත පළ නොකරන්න.\r\nජල සලකුණු සහිත පින්තූර උඩුගත නොකරන්න.\r\nපැකේජ ගනුදෙනුවක් නම් මිස අයිතම කිහිපයක් අඩංගු දැන්වීම් පළ නොකරන්න.\r\nමාතෘකාවේ හෝ විස්තරයේ ඔබේ විද්‍යුත් තැපෑල හෝ දුරකථන අංක දමන්න එපා.', '2022-08-15 18:38:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_promote`
--

CREATE TABLE `page_promote` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_promote`
--

INSERT INTO `page_promote` (`id`, `description`, `description_sl`) VALUES
(1, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p>ඔබේ දැන්වීම ප්&zwj;රවර්ධනය කරන්න<br />\r\nඔබේ දැන්වීම ප්&zwj;රවර්ධනය කරන්න</p>\r\n\r\n<p>ඔබගේ දැන්වීම ප්&zwj;රවර්ධනය කර ගැනුම්කරුවන් සහ අනෙකුත් පරිශීලකයින් වෙත අවධානය යොමු කර ok2list.com හි වේගයෙන් විකිණීම ශ්&zwj;රී ලංකාවේ විශාලතම අන්තර්ජාල වර්ගීකරණය වේ.</p>\r\n\r\n<p>ok2list.com වැනි විශාලතම සහ ජනප්&zwj;රිය සබැඳි වර්ගීකරණයකට ගැනුම්කරුවන් සහ විකුණුම්කරුවන් දහස් ගණනක් ඇත, එබැවින් වැඩි ගනුදෙනුකරුවන් වෙත ළඟා වීමට සහ ඔබේ නිෂ්පාදනය වේගයෙන් විකිණීමට එය සුවිශේෂී වාසියකි.<br />\r\nදැන්වීමක් පළ කිරීමේ මූලික සේවාව ok2list.com හි නොමිලයේ පවතී, අපි දැන් කැපී පෙනෙන සහ වඩාත් උනන්දුවක් දක්වන ගැනුම්කරුවන් වෙත ඉක්මනින් සහ පහසුවෙන් ළඟා වීමට කැමති අපගේ පෝස්ටර් සඳහා අමතර ගෙවන විකල්ප ලබා දෙන්නෙමු.<br />\r\nඉක්මනින් විකිණීමට අවශ්&zwj;යද?</p>\r\n\r\n<p>අපි එය සෑදූ අතර අපගේ ප්&zwj;රවර්ධන ඔබේ නිෂ්පාදන ඉක්මනින් අලෙවි කර ගැනීමට විශිෂ්ට ක්&zwj;රමයකි</p>\r\n\r\n<p>දැන්වීමක් ප්&zwj;රවර්ධනය කිරීම සඳහා සරලව:</p>\r\n\r\n<p>ඔබේ පළ කිරීම දැන්වීම සහ මුල් පිටුවේ ඉහළ වම් පැත්තේ ඇති &quot;සාමාජිකත්වය&quot; බොත්තම ක්ලික් කරන්න, හෝ<br />\r\nඔබ දැනටමත් පළ කර ඇති දැන්වීමක් වෙත ගොස් &quot;ඔබේ දැන්වීම ප්&zwj;රවර්ධනය කරන්න&quot; විකල්පය ක්ලික් කරන්න.<br />\r\nතවත් බැලීම් ලබා ගන්න</p>\r\n\r\n<p>අපගේ ප්&zwj;රවර්ධන සැලසුම් කර ඇත්තේ ඔබේ දැන්වීම වැඩි පිරිසකට නැරඹීම සඳහා ය. එබැවින් ඔබේ දැන්වීම ප්&zwj;රවර්ධනය කිරීමෙන්, ඔබ කාලය සහ ශ්&zwj;රමය ඉතිරි කරයි - සහ ඔබේ දැන්වීමට තව පිළිතුරු ලබා ගනී.</p>\r\n\r\n<p>හොඳ මිලකට ඉක්මනින් විකුණන්න</p>\r\n\r\n<p>වැඩි පිළිතුරු යනු වැඩි උනන්දුවක් දක්වන ගැනුම්කරුවන් ය. බොහෝ උනන්දුවක් දක්වන ගැනුම්කරුවන් සමඟ, ඔබට අවශ්&zwj;ය මිලට විකිණීමට ඔබට වඩා හොඳ අවස්ථාවක් තිබේ.</p>\r\n\r\n<p>අපගේ දැන්වීම් ප්&zwj;රවර්ධන</p>\r\n\r\n<p>විශේෂාංගගත දැන්වීම</p>\r\n\r\n<p>සෑම දැන්වීම් ලැයිස්තුගත කිරීමේ පිටුවකම ඉහළින්ම, විශේෂාංගගත දැන්වීම් සඳහා වෙන් කර ඇති තව් 4 (හතර) දක්වා ඇත. ඔබේ දැන්වීමට විශේෂාංගගත දැන්වීම් ප්&zwj;රවර්ධනයක් එක් කිරීමෙන්, ඔබට තවත් බැලීම් ලබා ගත හැකි මෙම විශේෂාංගගත දැන්වීම් තව් එකක ඔබේ දැන්වීම ප්&zwj;රදර්ශනය කිරීමට ඔබට අවස්ථාව ලැබේ.</p>\r\n\r\n<p>විශේෂාංගගත දැන්වීම් කැපී පෙනෙන අතර රතු පැහැයෙන් උද්දීපනය කර ඇති අතර පැහැදිලිවම &ldquo;විශේෂාංග දැන්වීමක්&rdquo; ලෙස සලකුණු කර ඇත.</p>\r\n\r\n<p>සෑම විශේෂාංග දැන්වීමක්ම විශේෂාංගගත දැන්වීම් තව් තුළ පෙන්වීමට සමාන අවස්ථාවක් ලබා දී ඇත. මෙම විශේෂාංගය අපගේ වැඩිපුරම නරඹන පිටුවල එක් එක් විශේෂාංගගත දැන්වීම සඳහා අමතර පෙනී සිටීම් සිදු කරයි. එසේම, මෙම දැන්වීම සාමාන්&zwj;ය පෝස්ට් වල දිස්වන අතර පිටුවේ ඉහළින්ම සිටින්න.</p>\r\n\r\n<p>ඉහළට දිනපතා නැවුම් කරන්න</p>\r\n\r\n<p>දෛනික ප්&zwj;රබෝධමත් ප්&zwj;රවර්ධනය මඟින් ඔබේ දැන්වීම දින 21ක් දක්වා දිනකට වරක් සාමාන්&zwj;ය දැන්වීම් ලැයිස්තුගත කිරීම්වල ඉහළට ගෙන යයි. එය සෑම දිනකම ඔබේ දැන්වීම නැවත පළ කිරීම හා සමාන බලපෑමක් ඇති අතර වැඩි බැලීම් සඳහා ආකර්ෂණය කරයි. අමතර උත්සාහයකින් තොරව ඔබේ දැන්වීම වැඩි බැලීම් ලබා ගැනීමට, දිනපතා නැවුම් කිරීම සහිත දැන්වීම් දිනකට වරක් නැවුම් ආරම්භයක් ලබා දෙනු ලැබේ.</p>\r\n\r\n<p>සාමාජිකත්වය සමඟ ඔබේ ව්&zwj;යාපාරය පුළුල් කරන්න</p>\r\n\r\n<p>සාමාජිකත්වයන්ට ප්&zwj;රසාද Top Ad සහ Bump Up ප්&zwj;රවර්ධන ඇතුළත් වන අතර, ok2list.com හි ඔබේ ව්&zwj;යාපාරයට විශාල පැවැත්මක් ලබා දීම සඳහා අමතර විශේෂාංගවලින් පිරී ඇත.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `page_promotions`
--

CREATE TABLE `page_promotions` (
  `id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `description_sl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_terms_conditions`
--

INSERT INTO `page_terms_conditions` (`id`, `details_en`, `details_sl`, `rules_en`, `rules_sl`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p>නියම සහ කොන්දේසි<br />\r\nහැදින්වීම</p>\r\n\r\n<p>QS Week (Pvt.) Ltd යනු සීමිත වගකීම් සහිත සමාගමකි, එහි ලියාපදිංචි අංකය PV89070 (මෙතැන් සිට &quot;සමාගම&quot;) වන අතර www.ok2list.com වෙබ් අඩවිය හරහා ලුහුඬු දැන්වීම් සහ කතාබස් සේවා ඇතුළත් මාර්ගගත ලුහුබැඳීම් සේවාවක් සපයයි (මින් ඉදිරියට යොමු කෙරේ. &quot;වෙබ් අඩවිය&quot;).</p>\r\n\r\n<p>වෙබ් අඩවිය හරහා සපයනු ලබන සේවාවන් පහත දක්වා ඇති සැකසුම් නියමයන් සහ කොන්දේසි (මෙතැන් සිට &quot;කොන්දේසි&quot;) සමඟ පරිශීලක සහ දැන්වීම්කරුගේ අනුකූලතාවයට යටත් වේ.</p>\r\n\r\n<p>නියමයන් භාවිතා කරන්නේ කෙසේද</p>\r\n\r\n<p>පියවර 1: මෙම වෙබ් අඩවිය භාවිතා කිරීමට පෙර කොන්දේසි කියවා අවබෝධ කර ගැනීම පරිශීලකයාගේ වගකීමකි.<br />\r\nපියවර 2: මෙම වෙබ් අඩවිය භාවිතා කිරීමෙන්, පරිශීලකයා මෙම වෙබ් අඩවියේ කොන්දේසි වලට එකඟ වන අතර ඒවාට බැඳී සිටී.<br />\r\nපියවර 3: පරිශීලකයා කොන්දේසි වලට එකඟ නොවන්නේ නම්, එවැනි පරිශීලකයෙකු මෙම වෙබ් අඩවිය භාවිතා නොකරයි.<br />\r\nනියම සහ කොන්දේසි (&quot;නියම&quot;)</p>\r\n\r\n<p>මෙම නියමයන් ලියා යාවත්කාලීන කරන ලද්දේ 2019 ජනවාරි මාසයේදීය. අපගේ වෙබ් අඩවියේ නව නියමයන් ප්&zwj;රකාශයට පත් කිරීමෙන් ඕනෑම වේලාවක වෙබ් අඩවිය භාවිතා කිරීම සඳහා අපගේ ඕනෑම හෝ සියලුම භාවිත නියමයන් හෝ වෙනත් කොන්දේසි වෙනස් කිරීමට සමාගමට අයිතිය ඇත.</p>\r\n\r\n<p>අර්ථ දැක්වීම්:</p>\r\n\r\n<p>මෙම නියමයන් තුළ පහත සඳහන් වචන සහ ප්&zwj;රකාශනවලට පිළිවෙළින් පවරා ඇති අර්ථයන් තිබිය යුතුය;</p>\r\n\r\n<p>&ldquo;දැන්වීම්කරු&rdquo; යන්නෙන් අදහස් වන්නේ වෙබ් අඩවියේ අන්තර්ගතය උඩුගත කරන පුද්ගලයා හෝ පුද්ගලයන්ය.</p>\r\n\r\n<p>&quot;සමාගම&quot; යන්නෙන් අදහස් වන්නේ QS Week (Pvt) Ltd</p>\r\n\r\n<p>&ldquo;අන්තර්ගතය&rdquo; යන්නෙන් අදහස් වන්නේ රටේ සියලුම අදාළ නීතිවලට සම්පූර්ණයෙන්ම අනුකූල වන පරිදි වෙබ් අඩවියට ඇතුළත් කිරීම සඳහා උඩුගත කරන ලද (දැන්වීම්කරු විසින්) සියලුම පළ කිරීම්, පණිවිඩ, පෙළ, ගොනු, පින්තූර, ඡායාරූප, වීඩියෝ, ශබ්ද හෝ වෙනත් ද්&zwj;රව්&zwj;ය ය. සමාගම සහ වෙබ් අඩවිය කිසියම් නීතිවිරෝධී හෝ අන්තර්ගතයේ සාවද්&zwj;ය භාවයක් සඳහා කිසිදු වගකීමක් භාර නොගනී.</p>\r\n\r\n<p>&quot;පරිශීලක&quot; යන්නෙන් අදහස් වන්නේ වෙබ් අඩවියේ ඕනෑම අන්තර්ගතයක්, දත්තයක් හෝ තොරතුරක් භාවිතා කරන, බ්&zwj;රවුස් කරන හෝ ප්&zwj;රවේශ කරන පුද්ගලයා හෝ පුද්ගලයන්ය.</p>\r\n\r\n<p>&quot;වෙබ් අඩවිය&quot; යන්නෙන් අදහස් වන්නේ www.ok2list.com යන්නයි</p>\r\n\r\n<p>&ldquo;Watermark&rdquo; යන්නෙන් අදහස් වන්නේ, වෙළඳ ප්&zwj;රචාරකයාගේ අනුමැතියකින් තොරව රූප වෙනත් අරමුණු සඳහා භාවිත කිරීම වළක්වන (www.ok2list.com) සලකුණ රූපවල දිස් වීමයි.</p>\r\n\r\n<p>අන්තර්ගතය</p>\r\n\r\n<p>සියලුම පළ කිරීම්, පණිවිඩ, පෙළ, ලිපිගොනු, පින්තූර, ඡායාරූප, වීඩියෝ, ශබ්ද, හෝ වෙනත් ද්&zwj;රව්&zwj;ය (&quot;අන්තර්ගතය&quot;) වෙබ් අඩවිය හරහා සම්ප්&zwj;රේෂණය කරන ලද හෝ සබැඳි කර ඇති අතර, ඒවා දැන්වීම්කරුගේ සම්පූර්ණ වගකීම බව දැන්වීම්කරු එකඟ වේ. එවැනි අන්තර්ගතයක් ආරම්භ විය. වඩාත් නිශ්චිතව, ඔහු හෝ ඇය පළ කරන, විද්&zwj;යුත් තැපෑල හෝ වෙනත් ආකාරයකින් වෙබ් අඩවිය හරහා ලබා ගත හැකි සියලුම අන්තර්ගතයන් සඳහා දැන්වීම්කරු සම්පූර්ණයෙන්ම වගකිව යුතුය. වෙබ් අඩවිය හරහා ලබා ගත හැකි අන්තර්ගතයන් සමාගම විසින් පාලනය නොකරන බවත් ඒවාට වගකිව යුතු නොවන බවත්, වෙබ් අඩවිය භාවිතා කිරීමෙන්, අහිතකර, අශෝභන, සාවද්&zwj;ය, නොමඟ යවන හෝ වෙනත් ආකාරයකින් විරුද්ධ විය හැකි අන්තර්ගතයන්ට දැන්වීම්කරු නිරාවරණය විය හැකි බවට දැන්වීම්කරු එකඟ වේ. ප්&zwj;රචාරකයා ඔහු හෝ ඇය යම්කිසි අන්තර්ගතයක භාවිතය ඇගයීමට ලක් කළ යුතු බවටත්, ඒ හා සම්බන්ධ සියලු අවදානම් දරාගත යුතු බවටත් එකඟ වන අතර, ඔහු හෝ ඇය එම අන්තර්ගතය මත විශ්වාසය නොතැබිය යුතු අතර, කිසිම අවස්ථාවක වෙබ් අඩවිය අන්තර්ගතය පූර්ව-තිරීක්ෂණ හෝ අනුමත නොකරන නමුත්, වෙබ් අඩවිය හරහා ලබා ගත හැකි ඕනෑම අන්තර්ගතයක් ප්&zwj;රතික්ෂේප කිරීමට, මකා දැමීමට හෝ ගෙන යාමට, නියමවල ලිපිය හෝ ආත්මය උල්ලංඝනය කිරීම හෝ වෙනත් හේතුවක් නිසා වෙබ් අඩවියට එහි තනි අභිමතය පරිදි අයිතියක් ඇත (නමුත් වගකීමක් නොවේ).</p>\r\n\r\n<p>නීතියෙන් හෝ සද්භාවයෙන් එසේ කිරීමට අවශ්&zwj;ය නම්, වෙබ් අඩවියට එහි තනි අභිමතය පරිදි, අන්තර්ගතය සංරක්ෂණය හෝ හෙළිදරව් කිරීම මෙන්ම විද්&zwj;යුත් තැපැල් ලිපින, IP ලිපින, වේලා මුද්&zwj;රා, සහ වෙනත් පරිශීලක තොරතුරු ද කළ හැකි බව දැන්වීම්කරු පිළිගෙන එකඟ වේ. හෝ හෙළිදරව් කිරීම සාධාරණ ලෙස අවශ්&zwj;ය වේ: නීතිමය ක්&zwj;රියාවලියට අනුකූල වීම; නියමයන් ක්රියාත්මක කිරීම; ඕනෑම අන්තර්ගතයක් තෙවන පාර්ශ්වයන්ගේ අයිතිවාසිකම් උල්ලංඝනය කරන බවට ප්&zwj;රතිචාර දක්වන්න; හෝ වෙබ් අඩවියේ, එහි පරිශීලකයන්ගේ හෝ සාමාන්&zwj;ය ජනතාවගේ අයිතිවාසිකම්, දේපළ හෝ පුද්ගලික ආරක්ෂාව ආරක්ෂා කිරීම.</p>\r\n\r\n<p>ප්&zwj;රකාශන හිමිකම් නීති සහ ජාත්&zwj;යන්තර සම්මුතීන්ට අනුකූලව සාමූහික කාර්යයක් සහ/හෝ සම්පාදනයක් ලෙස ප්&zwj;රකාශන හිමිකම මගින් වෙබ් අඩවිය හරහා හෝ ප්&zwj;රදර්ශනය කෙරෙන අන්තර්ගතය ආරක්ෂා කෙරේ. ප්&zwj;රචාරකයා සහ පරිශීලකයා වෙබ් අඩවියෙන් අන්තර්ගතය ප්&zwj;රතිනිෂ්පාදනය කිරීම, අනුපිටපත් කිරීම හෝ පිටපත් නොකිරීමට එකඟ වන අතර, වෙබ් අඩවියේ ප්&zwj;රදර්ශනය කර ඇති ඕනෑම සහ සියලුම ප්&zwj;රකාශන හිමිකම් දැන්වීම්වලට අවනත වීමට එකඟ වේ.</p>\r\n\r\n<p>පරිශීලක, දැන්වීම්කරු හැසිරීම</p>\r\n\r\n<p>ප්&zwj;රචාරකයා සහ පරිශීලකයා වෙනත් ආකාරයකින් පළ නොකිරීමට එකඟ වන පරිදි අන්තර්ගතය ලබා ගත හැකිය:</p>\r\n\r\n<p>එනම් කාමුක දර්ශන, වැඩිහිටි, පරිණත හෝ ලිංගික දිශානතිය;<br />\r\nසූදුවට යොමු වන හෝ කැසිනෝ ආශ්&zwj;රිත;<br />\r\nනීතිවිරෝධී ඖෂධ, ඖෂධ උපකරණ හෝ බෙහෙත් වට්ටෝරු අලෙවි කිරීම ඇතුළත් වේ<br />\r\nඑයට අනවසරයෙන් ඇතුළුවීමේ/ක්&zwj;රැක් කිරීමේ තොරතුරු ඇතුළත් වේ.<br />\r\nප්&zwj;රචණ්ඩ අන්තර්ගතය;<br />\r\nදැන්වීම් හෝ දීමනා ක්ලික් කිරීම, සෙවීම් සිදු කිරීම, වෙබ් අඩවිවල සැරිසැරීම හෝ ඊමේල් කියවීම සඳහා පරිශීලකයින්ට වන්දි ලබා දෙන වැඩසටහන් සම්බන්ධ අන්තර්ගතය;<br />\r\nනීතිවිරෝධී, නීතිවිරෝධී ක්&zwj;රියාකාරකම් ප්&zwj;රවර්ධනය කරන හෝ අන් අයගේ නීත්&zwj;යානුකූල අයිතිවාසිකම් උල්ලංඝනය කරන වෙනත් ඕනෑම අන්තර්ගතයක්;<br />\r\nනිර්මාණකරුගේ හෝ වෙනත් භාණ්ඩවල අනුරූ හෝ අනුකරණය කරන නිෂ්පාදන විකිණීම;<br />\r\nආයුධ හෝ පතොරම් විකිණීම (උදා: ගිනි අවි, ගිනි අවි සංරචක, සටන් පිහි, ස්ටන් තුවක්කු);<br />\r\nඑය නීති විරෝධී, හානිකර, තර්ජනාත්මක, අපවාදාත්මක, හිරිහැර කරන, අපහාසාත්මක, අසභ්&zwj;ය,<br />\r\nනින්දා සහගත, වෙනත් කෙනෙකුගේ පෞද්ගලිකත්වය ආක්&zwj;රමණය කිරීම හෝ බාල වයස්කරුවන්ට ඕනෑම ආකාරයකින් හානි කිරීම;<br />\r\nආගම, ස්ත්&zwj;රී පුරුෂ භාවය, ජාතිය, වාර්ගිකත්වය, වයස හෝ ආබාධිත පදනම මත පුද්ගලයෙකුට හෝ පුද්ගලයන්ට හිරිහැර කිරීම, පහත් කිරීම, බිය ගැන්වීම හෝ වෛර කිරීම;<br />\r\nබව අපගමනය</p>', 'Posting an ad on ok2list.com is free! However, all ads must follow our rules:\r\n\r\nMake sure you post in the correct category.\r\nDo not post the same ad more than once or repost an ad within 48 hours.\r\nDo not upload pictures with watermarks.\r\nDo not post ads containing multiple items unless it\'s a package deal.\r\nDo not put your email or phone numbers in the title or description.', 'ok2list.com හි දැන්වීමක් පළ කිරීම නොමිලේ! කෙසේ වෙතත්, සියලුම දැන්වීම් අපගේ නීති අනුගමනය කළ යුතුය:\r\n\r\nඔබ නිවැරදි ප්‍රවර්ගයේ පළ කිරීමට වග බලා ගන්න.\r\nඑකම දැන්වීම එක වරකට වඩා පළ නොකරන්න හෝ පැය 48ක් ඇතුළත දැන්වීමක් නැවත පළ නොකරන්න.\r\nජල සලකුණු සහිත පින්තූර උඩුගත නොකරන්න.\r\nපැකේජ ගනුදෙනුවක් නම් මිස අයිතම කිහිපයක් අඩංගු දැන්වීම් පළ නොකරන්න.\r\nමාතෘකාවේ හෝ විස්තරයේ ඔබේ විද්‍යුත් තැපෑල හෝ දුරකථන අංක දමන්න එපා.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
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
  `group_name` varchar(255) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Brand Master Setup Table' ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='category master setup table' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_category`
--

INSERT INTO `prd_category` (`pk_no`, `parent_id`, `code`, `name`, `url_slug`, `name_bn`, `description`, `seo_des`, `logo`, `icon`, `banner`, `is_top`, `is_new`, `is_feature`, `hs_prefix`, `comments`, `is_active`, `is_delete`, `total_post`, `active_post`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `is_highlight`) VALUES
(1, 0, '11', 'Cars & Vehicles', 'cars-vehicles', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, 'category_log_5fe8202d6d53d.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-15 17:21:12', 1, '2022-12-13 15:32:12', 0),
(2, 0, '12', 'Electronics & Gadgets', 'electronics-gedgets', NULL, 'Find great deals for used electronics in Sri Lanka including mobile phones, computers, laptops, TVs, cameras and much more.', 'Find great deals for used electronics in Sri Lanka including mobile phones, computers, laptops, TVs, cameras and much more.', NULL, 'category_log_5fb2b58af0dc9.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:23:22', 1, '2022-12-13 15:32:56', 0),
(3, 0, '13', 'Property for Rent/Sell', 'property', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_5fe78321e6fb1.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 1, 1, '2020-11-16 17:24:29', 1, '2022-12-13 15:32:32', 1),
(4, 0, '14', 'Sports & responsive', 'sports-responsive', NULL, 'Buy and sell used musical instruments, sports gear and accessories, art and collectibles and items for kids here.', 'Buy and sell used musical instruments, sports gear and accessories, art and collectibles and items for kids here.', NULL, 'category_log_5fb2b656e349a.png', NULL, 0, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:26:46', 1, '2020-11-16 17:26:46', 0),
(5, 0, '15', 'Fashion & Beauty', 'fashion-beauty', NULL, 'Buy and sell clothing, garments, shoes and other personal items including handbags, perfumes etc.', 'Buy and sell clothing, garments, shoes and other personal items including handbags, perfumes etc.', NULL, 'category_log_5fb2b67d5307e.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-16 17:27:25', 1, '2022-12-13 15:32:59', 0),
(6, 0, '16', 'Pets & Animals', 'pets-animals', NULL, 'Search from the widest variety of pets in Srilanka. Select from dogs, puppies, cats, kittens, birds and other domesticated animals.', 'Search from the widest variety of pets in Srilanka. Select from dogs, puppies, cats, kittens, birds and other domesticated animals.', NULL, 'category_log_5fb2b70570133.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:29:41', 1, '2022-12-13 15:33:01', 0),
(7, 0, '17', 'Jobs & Work Overseas', 'jobs', NULL, 'Post and apply for jobs and career opportunities in Srilanka. Search for job vacancies in your city.', 'Post and apply for jobs and career opportunities in Srilanka. Search for job vacancies in your city.', NULL, 'category_log_5fe783bc456e6.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 2, 1, '2020-11-16 17:30:12', 1, '2022-12-13 15:32:34', 1),
(8, 0, '18', 'Home Appliances', 'home-appliances', NULL, 'Buy and sell new and used home appliances including furniture, kitchen items, gardening products and other items for your garden.', 'Buy and sell new and used home appliances including furniture, kitchen items, gardening products and other items for your garden.', NULL, 'category_log_5fe820fd53eb2.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 3, 1, '2020-11-16 17:30:59', 1, '2022-12-13 15:31:22', 0),
(9, 0, '19', 'Matrimony Services', 'matrimony-services', NULL, NULL, NULL, NULL, 'category_log_5fb2b77f7bad7.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:31:43', 1, '2020-12-26 19:03:47', 0),
(11, 0, '21', 'Miscellaneous', 'miscellaneous', NULL, NULL, NULL, NULL, 'category_log_5fb2b83daaa73.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 6, 1, '2020-11-16 17:34:53', 1, '2020-12-21 19:37:52', 0),
(12, 0, '22', 'Books & Magazines', 'books-magazines', NULL, NULL, NULL, NULL, 'category_log_5fb2b88671c88.png', NULL, 1, 0, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:36:06', 1, '2020-12-21 19:37:48', 0),
(13, 1, '23', 'Cars', 'cars--buses', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:41:37', 1, '2022-08-13 08:57:01', 0),
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
(29, 2, '39', 'TV & Video Accessories', 'tv-video-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:26', NULL, '2020-11-16 17:44:26', 0),
(30, 3, '40', 'Houses For Sale', 'houses', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:38', 1, '2022-08-12 19:18:43', 0),
(31, 3, '41', 'Room Annex Rentals', 'rooms', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:44:46', 1, '2022-08-12 19:21:30', 0),
(32, 3, '42', 'Commercial Property Rentals', 'plots-lands', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:00', 1, '2022-08-12 19:22:23', 0),
(33, 3, '43', 'Apartments Rentals', 'apartment-flats', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:27', 1, '2022-08-12 19:19:28', 0),
(34, 4, '44', 'All Hobbies, Sports & Kids', 'all-hobbies-sports--kids', NULL, NULL, NULL, NULL, 'category_log_6300f7527f82e.png', NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:05:55', 1, '2022-08-20 21:01:38', 0),
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
(85, 0, '95', 'Agriculture', 'agriculture', NULL, NULL, NULL, NULL, 'category_log_5fd8e50cbe19c.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:37:16', 1, '2022-12-13 15:30:51', 0),
(87, 85, '97', 'Crops, Seeds & Plants', 'crops-seeds--plants', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:39:38', NULL, '2020-11-16 18:39:38', 0),
(88, 85, '98', 'Farming Tools & Machinery', 'farming-tools--machinery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:39:51', NULL, '2020-11-16 18:39:51', 0),
(89, 85, '99', 'Other Agriculture', 'other-agriculture', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 18:40:03', NULL, '2020-11-16 18:40:03', 0),
(93, 1, '103', 'Rentals', 'car-rentals--auto-services', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:22:15', 1, '2022-08-12 20:01:21', 0),
(94, 0, '104', 'Essential', 'essential', NULL, NULL, NULL, NULL, 'category_log_5fe822230625e.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-17 20:33:00', 1, '2022-12-13 15:33:18', 0),
(95, 94, '105', 'Grocery', 'grocery', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:24', NULL, '2020-11-17 20:33:24', 0),
(96, 94, '106', 'Fruits & Vegetables', 'fruits--vegetables', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 4, 1, '2020-11-17 20:33:36', NULL, '2020-11-17 20:33:36', 0),
(97, 94, '107', 'Meat & Seafood', 'meat--seafood', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:33:50', NULL, '2020-11-17 20:33:50', 0),
(98, 94, '108', 'Baby Products', 'baby-products', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:06', NULL, '2020-11-17 20:34:06', 0),
(99, 94, '109', 'Healthcare', 'healthcare', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:19', NULL, '2020-11-17 20:34:19', 0),
(100, 94, '110', 'Household', 'household', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:39', NULL, '2020-11-17 20:34:39', 0),
(101, 94, '111', 'Other Essentials', 'other-essentials', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-17 20:34:50', NULL, '2020-11-17 20:34:50', 0),
(104, 0, '112', 'Mobiles', 'mobiles', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Srilanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, 'category_log_5fe786c5db223.png', NULL, 1, 1, 1, NULL, NULL, 0, 0, 0, 0, 1, 1, '2020-11-16 17:21:12', 1, '2022-08-12 09:55:56', 0),
(107, 3, '113', 'Commercial Properties', 'commercial-property', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2020-11-16 17:45:27', 1, '2022-08-12 19:23:02', 0),
(108, 104, '118', 'SIM Cards', 'sim-cards', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:04', NULL, '2021-01-17 19:00:04', 0),
(109, 104, '119', 'Mobile Phone Services', 'mobile-phone-services', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2021-01-17 19:00:17', NULL, '2021-01-17 19:00:17', 0),
(110, 2, '120', 'Desktop Computers', 'desktop-computers', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2021-01-17 19:00:49', NULL, '2021-01-17 19:00:49', 0),
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
(127, 0, '137', 'Services', 'services', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_63be5966d6bc0.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 1, 0, 8, 1, '2022-08-10 15:32:48', 1, '2023-01-11 12:08:30', 0),
(128, 0, '138', 'Education', 'education', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'category_log_62fcd51baff36.png', 'category_log_63be595a21ffe.png', 'category_log_62fb9b73b10dd.png', 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 7, 1, '2022-08-12 09:53:59', 1, '2023-01-11 12:08:18', 0),
(129, 2, '139', 'Mobiles Phones', 'mobiles', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 09:56:35', 1, '2022-08-12 20:06:04', 0),
(130, 0, '140', 'Business & Industry', 'business-industry', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, 'category_log_63be594c960d5.png', NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 8, 1, '2022-08-12 10:00:21', 1, '2023-01-11 12:08:04', 0),
(131, 130, '141', 'Other Business Services', 'other-business-services', NULL, 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', 'View listings for property in Sri Lanka. Find the cheapest rates for apartments, commercial and residential properties, as well as for land and plots.', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:03:46', NULL, '2022-08-12 11:03:46', 0),
(132, 130, '142', 'Industry Tools & Machinery', 'industry-tools-machinery', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:06:49', NULL, '2022-08-12 11:06:49', 0),
(133, 130, '143', 'Office Equipment, Supplies & Stationery', 'office-equipment-supplies-stationery', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:08:12', NULL, '2022-08-12 11:08:12', 0),
(134, 130, '144', 'Solar & Generators', 'solar-generators', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:08:41', NULL, '2022-08-12 11:08:41', 0),
(135, 130, '145', 'Raw Materials & Wholesale Lots', 'raw-materials-wholesale-lots', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:09:19', NULL, '2022-08-12 11:09:19', 0),
(136, 130, '146', 'Healthcare, Medical Equipment & Supplies', 'healthcare-medical-equipment-supplies', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:10:02', NULL, '2022-08-12 11:10:02', 0),
(137, 130, '147', 'Licenses & Titles', 'licenses-titles', NULL, 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery\r\n•	Other Business Services\r\n•	Raw Materials & Wholesale Lots\r\n•	Healthcare, Medical Equipment & Supplies\r\n•	Licences & Titles', 'View listings for Services in Sri Lanka. Find the quality Service provider who provides following services •	Industry Tools & Machinery\r\n•	Solar & Generators\r\n•	Office Equipment, Supplies & Stationery', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-12 11:10:26', NULL, '2022-08-12 11:10:26', 0),
(138, 127, '148', 'Trade Services', 'trade-services', NULL, 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', 'View listings for Services in Sri Lanka. Find quality services and services;  Trade Services, Domestic Services, Other Services, Events & Entertainment, Health & Wellbeing & Travel & Tourism', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-12 11:13:28', NULL, '2022-08-12 11:13:28', 0),
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
(156, 1, '166', 'Boats & Water Transport', 'boats-water-transport', NULL, 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', 'Buy and sell used cars, motorbikes and other vehicles in Sri Lanka. Choose from top brands including Toyota, Nissan, Honda and Suzuki.', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 4, 1, '2022-08-12 20:02:51', 1, '2022-08-12 20:03:11', 0),
(157, 0, '167', 'Hobby, Sport & Kids', 'hobby-sport-kids', NULL, NULL, NULL, 'category_log_62f89d79edcd6.png', 'category_log_63be595432716.png', 'category_log_62f89d79ede6d.png', 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:15:10', 1, '2023-01-11 12:08:12', 0),
(158, 3, '168', 'Land', 'land', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-14 12:16:45', 1, '2022-08-14 12:17:09', 0),
(159, 3, '169', 'House Rentals', 'house-rentals', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 1, '2022-08-14 12:18:13', 1, '2022-08-19 10:11:07', 0),
(160, 8, '170', 'Kitchen items', 'kitchen-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:30', NULL, '2022-08-14 12:19:30', 0),
(161, 8, '171', 'Other Home Items', 'other-home-items', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:35', NULL, '2022-08-14 12:19:35', 0),
(162, 8, '172', 'Building Material & Tools', 'building-material-tools', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:44', NULL, '2022-08-14 12:19:44', 0),
(163, 8, '173', 'Garden', 'garden', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:52', NULL, '2022-08-14 12:19:52', 0),
(164, 8, '174', 'Home Decor', 'home-decor', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:19:58', NULL, '2022-08-14 12:19:58', 0),
(165, 8, '175', 'Bathroom & Sanitary ware', 'bathroom-sanitary-ware', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:20:04', NULL, '2022-08-14 12:20:04', 0),
(166, 2, '176', 'Computer Accessories', 'computer-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:21:19', NULL, '2022-08-14 12:21:19', 0),
(167, 2, '177', 'Computers & Tablets', 'computers-tablets', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:21:29', NULL, '2022-08-14 12:21:29', 0),
(168, 2, '178', 'Mobile Phone Accessories', 'mobile-phone-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:21:40', NULL, '2022-08-14 12:21:40', 0),
(169, 2, '179', 'Electronic Home Appliances', 'electronic-home-appliances', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:24:57', NULL, '2022-08-14 12:24:57', 0),
(170, 2, '180', 'Air Conditions & Electrical fittings', 'air-conditions-electrical-fittings', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:25:03', NULL, '2022-08-14 12:25:03', 0),
(171, 2, '181', 'Cameras & Camcorders', 'cameras-camcorders', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:25:12', NULL, '2022-08-14 12:25:12', 0),
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
(183, 5, '193', 'Clothing', 'clothing', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:06', NULL, '2022-08-14 12:32:06', 0),
(184, 5, '194', 'Shoes & Footwear', 'shoes-footwear', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 1, 0, 0, 1, '2022-08-14 12:32:12', NULL, '2022-08-14 12:32:12', 0),
(185, 5, '195', 'Bags & Luggage', 'bags-luggage', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:16', NULL, '2022-08-14 12:32:16', 0),
(186, 5, '196', 'Sunglasses & Opticians', 'sunglasses-opticians', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 0, 1, '2022-08-14 12:32:20', NULL, '2022-08-14 12:32:20', 0),
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
(3, 51, 34, 51, '2022-12-19 15:37:55', NULL, '2022-12-19 15:37:55'),
(4, 2, 3, 2, '2023-01-12 07:10:58', NULL, '2023-01-12 07:10:58');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Brand Master Setup Table' ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_img_library`
--

INSERT INTO `prd_img_library` (`pk_no`, `f_prd_master_no`, `img_name`, `serial_no`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(12, 1, '928691673427659.jpg', 1, NULL, NULL, NULL, NULL),
(13, 2, '436001673429129.jpg', 1, NULL, NULL, NULL, NULL),
(14, 3, '549121673429274.jpg', 1, NULL, NULL, NULL, NULL),
(15, 4, '674731673429610.jpg', 1, NULL, NULL, NULL, NULL),
(16, 5, '899241673429680.jpg', 1, NULL, NULL, NULL, NULL),
(17, 6, '723301673429774.jpg', 1, NULL, NULL, NULL, NULL),
(18, 7, '609811673429864.jpg', 1, NULL, NULL, NULL, NULL),
(19, 8, '273341673429952.jpg', 1, NULL, NULL, NULL, NULL),
(20, 9, '78941673520496.jpg', 1, NULL, NULL, NULL, NULL),
(21, 10, '569821673520718.jpg', 1, NULL, NULL, NULL, NULL),
(22, 4, '704351673520862.jpg', 1, NULL, NULL, NULL, NULL),
(23, 11, '669111673521030.jpg', 1, NULL, NULL, NULL, NULL),
(24, 12, '865861673521860.jpg', 1, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prd_like_count`
--

INSERT INTO `prd_like_count` (`pk_no`, `prd_id`, `customer_id`, `counter`) VALUES
(1, 5, 2, 1),
(2, 3, 2, 1),
(3, 2, 2, 1),
(4, 4, 2, 1),
(5, 7, 2, 1),
(6, 8, 2, 1),
(7, 6, 2, 1);

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
  `search_key` longtext DEFAULT NULL,
  `doorstep_delivery` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prd_master`
--

INSERT INTO `prd_master` (`pk_no`, `ad_type`, `area_id`, `city_division`, `city_division_pk_no`, `area_url_slug`, `city_division_url_slug`, `customer_pk_no`, `main_category`, `f_cat_pk_no`, `cat_url_slug`, `f_scat_pk_no`, `scat_url_slug`, `code`, `ad_title`, `url_slug`, `f_brand`, `brand_name`, `f_model`, `model_name`, `prod_feature`, `price`, `price_unit`, `is_negotiable`, `price_to`, `vacanci`, `business_function`, `deadline`, `company_name`, `logo`, `description`, `edition`, `authenticity`, `using_condition`, `prod_type`, `mobile1`, `mobile2`, `is_hide_mobile1`, `is_hide_mobile2`, `model_year`, `registration_year`, `transmission`, `address`, `body_type`, `fuel_type`, `engine_capacity`, `kilometers_run`, `bed_no`, `bath_no`, `land_size`, `land_unit`, `house_size`, `house_unit`, `property_address`, `flat_size`, `gender`, `user_name`, `is_terms_condition`, `comments`, `is_active`, `approved_by`, `approved_at`, `created_by`, `created_at`, `updated_by`, `updated_at`, `total_view`, `is_delete`, `deleted_by`, `deleted_at`, `promotion`, `promotion_to`, `thumb`, `search_key`, `doorstep_delivery`) VALUES
(2, 'buy', 3, 'city', 9, 'ikeja', 'lagos', 1, 'general', 157, 'hobby-sport-kids', 176, 'sports-fitness', 102, 'Fitness Product', 'fitness-product', NULL, NULL, NULL, NULL, NULL, 280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'used', NULL, '01767671133', '01728863787', 0, 0, NULL, NULL, NULL, 'Bnani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony Mia', 0, NULL, 0, 1, '2023-01-26 14:48:30', NULL, '2023-01-11 10:25:29', NULL, '2023-01-25 13:54:47', 4, 0, NULL, NULL, 'Basic', NULL, NULL, 'ikeja lagos general sports-fitness Fitness Product  280 used0176767113301728863787BnaniLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1),
(4, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 2, 'electronics-gedgets', 110, 'desktop-computers', 104, 'Rangs limited', 'rangs-limited', NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '01767671133', '01545454545', 0, 0, NULL, NULL, NULL, 'dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony Mia', 0, NULL, 0, 1, '2023-01-26 15:11:30', NULL, '2023-01-11 10:33:30', NULL, '2023-01-12 11:53:07', 4, 0, NULL, NULL, 'Basic', NULL, NULL, 'kubanni-river calabar general desktop-computers Rangs limited  120 new0176767113301545454545dhakaLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1),
(5, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 12, 'books-magazines', 82, 'courses', 105, 'Literature', 'literature', NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '01524545455', '01545454545', 0, 0, NULL, NULL, NULL, 'dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony', 0, NULL, 0, 1, '2023-01-24 10:51:35', NULL, '2023-01-11 10:34:40', NULL, '2023-01-18 10:15:55', 8, 0, NULL, NULL, 'Basic', NULL, NULL, 'kubanni-river calabar general courses Literature  100 new0152454545501545454545dhakaLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0),
(6, 'sell', 3, 'city', 9, 'ikeja', 'lagos', 1, 'general', 5, 'fashion-beauty', 184, 'shoes-footwear', 106, 'Footwear shoe', 'footwear-shoe', NULL, 'apex', NULL, NULL, NULL, 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '01415454152', '01524584584', 0, 0, NULL, NULL, NULL, 'dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony', 0, NULL, 1, 1, '2023-01-26 15:37:34', NULL, '2023-01-11 10:36:14', NULL, '2023-01-24 20:51:35', 11, 0, NULL, NULL, 'Basic', NULL, '723301673429774.jpg', 'ikeja lagos general shoes-footwear Footwear shoe apex 220 new0141545415201524584584dhakaLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0),
(7, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 127, 'services', 138, 'trade-services', 107, 'International Traders', 'international-traders', NULL, NULL, NULL, NULL, NULL, 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, NULL, NULL, NULL, '02101541555', '02541545458', 0, 0, NULL, NULL, NULL, 'Gulsan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony', 0, NULL, 1, 1, '2023-01-11 10:41:37', NULL, '2023-01-11 10:37:44', NULL, '2023-01-29 00:55:16', 14, 0, NULL, NULL, 'Basic', NULL, '609811673429864.jpg', 'kubanni-river calabar general trade-services International Traders  220 0210154155502541545458GulsanLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0),
(8, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 94, 'essential', 96, 'fruits--vegetables', 108, 'Fruits & Vegetables', 'fruits-vegetables', NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '02415454545', '01544545454', 0, 0, NULL, NULL, NULL, 'dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony', 0, NULL, 1, 1, '2023-01-11 10:43:46', NULL, '2023-01-11 10:39:12', NULL, '2023-01-24 10:33:49', 10, 0, NULL, NULL, 'Basic', NULL, '273341673429952.jpg', 'kubanni-river calabar general fruits--vegetables Fruits & Vegetables  120 new0241545454501544545454dhakaLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0),
(9, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 2, 'electronics-gedgets', 110, 'desktop-computers', 109, 'Desktop Computers', 'desktop-computers', NULL, NULL, NULL, NULL, NULL, 230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '01767671133', '00121548488', 0, 0, NULL, NULL, NULL, 'Banani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony Mia', 0, NULL, 1, 1, '2023-01-26 14:48:21', NULL, '2023-01-12 11:48:15', NULL, '2023-01-12 12:05:50', 0, 0, NULL, NULL, 'Basic', NULL, '78941673520496.jpg', 'kubanni-river calabar general desktop-computers Desktop Computers  230 new0176767113300121548488BananiLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0),
(10, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 5, 'fashion-beauty', 42, 'mens-clothing-accessories', 110, 'Men\'s Clothing & Accessories', 'men-s-clothing-accessories', NULL, 'Infinity', NULL, NULL, NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', '76', '01767671133', '00115484858', 0, 0, NULL, NULL, NULL, 'Jatrabari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony Mia', 0, NULL, 0, NULL, NULL, NULL, '2023-01-12 11:51:58', NULL, '2023-01-12 11:51:58', 0, 0, NULL, NULL, 'Basic', NULL, NULL, 'kubanni-river calabar general mens-clothing-accessories Men\'s Clothing & Accessories Infinity 260 new0176767113300115484858JatrabariLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0),
(11, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 128, 'education', 146, 'textbooks', 111, 'Books & Magazines', 'books-magazines', NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '01767671133', '01524785485', 0, 0, NULL, NULL, NULL, 'dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony Mia', 0, NULL, 0, NULL, NULL, NULL, '2023-01-12 11:57:10', NULL, '2023-01-12 11:57:10', 0, 0, NULL, NULL, 'Basic', NULL, NULL, 'kubanni-river calabar general textbooks Books & Magazines  120 new0176767113301524785485dhakaLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1),
(12, 'sell', 1, 'city', 2, 'kubanni-river', 'calabar', 1, 'general', 157, 'hobby-sport-kids', 179, 'other-hobby-sport-kids-items', 112, 'Hobby, Sport & Kids items', 'hobby-sport-kids-items', NULL, NULL, NULL, NULL, NULL, 170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'original', 'new', NULL, '01767671133', '01325455251', 0, 0, NULL, NULL, NULL, 'Badda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rony Mia', 0, NULL, 0, NULL, NULL, NULL, '2023-01-12 12:11:00', NULL, '2023-01-12 12:11:00', 0, 0, NULL, NULL, 'Basic', NULL, NULL, 'kubanni-river calabar general other-hobby-sport-kids-items Hobby, Sport & Kids items  170 new0176767113301325455251BaddaLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Brand Master Setup Table' ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prd_type`
--

CREATE TABLE `prd_type` (
  `pk_no` int(11) NOT NULL,
  `cat_pk_no` int(10) DEFAULT NULL,
  `scat_pk_no` int(10) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `seller_id`, `stars`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 5, 'Best Local', 1, '2023-01-12 07:09:50', '2023-01-12 07:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL,
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
  `permissions` text NOT NULL,
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
  `meta_keyword` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `website_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verification` int(2) DEFAULT 0 COMMENT '0=No; 1=Yes;',
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
  `paystack_public_key` varchar(255) DEFAULT NULL,
  `paystack_secret_key` varchar(255) DEFAULT NULL,
  `paystack_curency` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `website_title`, `logo`, `favicon`, `copyright`, `meta_keyword`, `meta_description`, `website_email`, `email_verification`, `phone`, `address`, `map_address`, `section_one_name_en`, `section_one_name_sl`, `about_en`, `contact_us_en`, `terms_conditions_en`, `privacy_policy_en`, `sitemap_en`, `about_sl`, `contact_us_sl`, `terms_conditions_sl`, `privacy_policy_sl`, `sitemap_sl`, `section_two_en`, `section_two_sl`, `how_to_sell_fast_en`, `membership_en`, `promote_your_ad_en`, `promotions_en`, `faq_en`, `how_to_sell_fast_sl`, `membership_sl`, `promote_your_ad_sl`, `promotions_sl`, `faq_sl`, `section_three_name_en`, `section_three_name_sl`, `facebook_en`, `instagram_en`, `twitter_en`, `linkedin_en`, `whatsapp_en`, `youtube_en`, `facebook_sl`, `instagram_sl`, `twitter_sl`, `linkedin_sl`, `whatsapp_sl`, `youtube_sl`, `facebook_link`, `twitter_link`, `instagram_link`, `linkedin_link`, `whatsapp_link`, `youtube_link`, `section_four_en`, `section_four_sl`, `content_en`, `content_sl`, `app_mode`, `paystack_public_key`, `paystack_secret_key`, `paystack_curency`, `created_at`, `updated_at`) VALUES
(12, 'listorby', 'uploads/2022/12/1671873605-logo2.png', 'uploads/2022/06/1655658561-logo-02.jpg', 'Copyright @ All Rights Reserved OK2list.ng', 'listorby', 'listorby', 'info@listorby.org', 1, '1123456789', 'Nigeria, Abuja', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8069790.435797271!2d8.677456999999999!3d9.0338725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x104e0baf7da48d0d%3A0x99a8fe4168c50bc8!2sNigeria!5e0!3m2!1sen!2sbd!4v1673341934537!5m2!1sen!2sbd\" width=\"370\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'Quick Links', 'ඉක්මන් සබැඳි', 'About', 'Contact Us', 'Terms & Conditions', 'Privacy Policy', 'Sitemap', 'පිළිබඳ', 'අප අමතන්න', 'නියම සහ කොන්දේසි', 'රහස්යතා ප්රතිපත්තිය', 'අඩවි සිතියම', 'How to sell fast', 'ඉක්මනින් විකුණන්නේ කෙසේද', 'How to sell fast', 'Membership', 'Promote Your Ad', 'Promotions', 'FAQ', 'ඉක්මනින් විකුණන්නේ කෙසේද', 'සාමාජිකත්වය', 'ඔබේ සංස්කරණය ප්‍රවර්ධනය කරන්න', 'උසස්වීම්', 'පරතරය', 'Follow Us On', 'අපව අනුගමනය කරන්න සහ', 'Facebook', 'Instagram', 'Twitter', 'Linkedin', 'Whatsapp', 'Youtube', 'ෆේස්බුක්', 'ට්විටර්', 'ට්විටර්', 'Linkedin', 'Whatsapp', 'Youtube', NULL, NULL, NULL, NULL, NULL, NULL, 'Newsletter', 'පුවත් පත්‍රිකාව', 'Subscribe to our official Newsletter', 'අපගේ නිල පුවත් පත්‍රිකාවට දායක වන්න', 'live', 'pk_test_f36e0c1aa14497bc4fdf9081a7a02a4a8c5b5e06', 'sk_test_7b7133f89b8286fd9c08056641d2c42541faa5ea', 'ZAR', '2022-05-17 14:57:55', '2023-01-25 10:59:57');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sls_payments`
--

INSERT INTO `sls_payments` (`pk_no`, `f_customer_pk_no`, `transaction_id`, `status`, `tran_date`, `tran_id`, `val_id`, `amount`, `store_amount`, `bank_tran_id`, `card_type`, `emi_instalment`, `emi_amount`, `emi_description`, `emi_issuer`, `card_no`, `card_issuer`, `card_brand`, `card_issuer_country`, `card_issuer_country_code`, `APIConnect`, `validated_on`, `gw_version`, `payment_at`, `created_at`, `created_by`, `updated_at`, `updated_by`, `payment_type`, `f_prod_pk_no`, `f_promotion_details_no`, `f_package_pk_no`, `add_limit`, `expired_on`, `date`, `name`, `email`, `phone`, `billing_city`, `billing_state`, `zip_code`, `address`) VALUES
(1, 1, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-10 15:32:45', NULL, NULL, '2023-01-10 15:32:45', 1, '2023-01-10 15:32:45', NULL, NULL, NULL, NULL, 1, '8', '2023-02-10 15:32:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'mP9EnobIu9EF2lD', 'VALID', '2023-01-11', NULL, NULL, 5000.000, NULL, NULL, 'offline_payment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-11 10:45:08', NULL, '2023-01-11 10:45:08', '2023-01-11 10:45:08', 1, '2023-01-11 10:45:44', 1, 'package', NULL, NULL, 3, '50', '2023-03-11 10:45:08', NULL, 'Rony', 'ronymia.tech@gmail.com', '01990572321', 'dhaka', 'dhaka', '12345678', 'dhaka'),
(3, 2, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-12 06:58:26', NULL, NULL, '2023-01-12 06:58:26', 2, '2023-01-12 06:58:26', NULL, NULL, NULL, NULL, 1, '8', '2023-02-12 06:58:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-12 12:16:44', NULL, NULL, '2023-01-12 12:16:44', 3, '2023-01-12 12:16:44', NULL, NULL, NULL, NULL, 1, '8', '2023-02-12 12:16:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 4, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-24 11:01:17', NULL, NULL, '2023-01-24 11:01:17', 4, '2023-01-24 11:01:17', NULL, NULL, NULL, NULL, 1, '8', '2023-02-24 11:01:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 5, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-24 11:18:42', NULL, NULL, '2023-01-24 11:18:42', 5, '2023-01-24 11:18:42', NULL, NULL, NULL, NULL, 1, '8', '2023-02-24 11:18:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 6, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-24 20:48:03', NULL, NULL, '2023-01-24 20:48:03', 6, '2023-01-24 20:48:03', NULL, NULL, NULL, NULL, 1, '8', '2023-02-24 20:48:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 7, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 03:52:49', NULL, NULL, '2023-01-25 03:52:49', 7, '2023-01-25 03:52:49', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 03:52:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 8, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 05:57:29', NULL, NULL, '2023-01-25 05:57:29', 8, '2023-01-25 05:57:29', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 05:57:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 9, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 07:03:16', NULL, NULL, '2023-01-25 07:03:16', 9, '2023-01-25 07:03:16', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 07:03:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 10, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 07:36:02', NULL, NULL, '2023-01-25 07:36:02', 10, '2023-01-25 07:36:02', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 07:36:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 11, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 08:06:20', NULL, NULL, '2023-01-25 08:06:20', 11, '2023-01-25 08:06:20', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 08:06:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 12, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 08:13:42', NULL, NULL, '2023-01-25 08:13:42', 12, '2023-01-25 08:13:42', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 08:13:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 13, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 08:17:00', NULL, NULL, '2023-01-25 08:17:00', 13, '2023-01-25 08:17:00', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 08:17:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 14, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 08:18:41', NULL, NULL, '2023-01-25 08:18:41', 14, '2023-01-25 08:18:41', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 08:18:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 15, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 08:19:57', NULL, NULL, '2023-01-25 08:19:57', 15, '2023-01-25 08:19:57', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 08:19:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 16, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 08:22:47', NULL, NULL, '2023-01-25 08:22:47', 16, '2023-01-25 08:22:47', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 08:22:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 17, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-25 13:54:25', NULL, NULL, '2023-01-25 13:54:25', 17, '2023-01-25 13:54:25', NULL, NULL, NULL, NULL, 1, '8', '2023-02-25 13:54:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 18, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 04:04:15', NULL, NULL, '2023-01-26 04:04:15', 18, '2023-01-26 04:04:15', NULL, NULL, NULL, NULL, 1, '8', '2023-02-26 04:04:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 19, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 13:17:20', NULL, NULL, '2023-01-26 13:17:20', 19, '2023-01-26 13:17:20', NULL, NULL, NULL, NULL, 1, '8', '2023-02-26 13:17:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 20, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 13:18:05', NULL, NULL, '2023-01-26 13:18:05', 20, '2023-01-26 13:18:05', NULL, NULL, NULL, NULL, 1, '8', '2023-02-26 13:18:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 21, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 13:49:31', NULL, NULL, '2023-01-26 13:49:31', 21, '2023-01-26 13:49:31', NULL, NULL, NULL, NULL, 1, '8', '2023-02-26 13:49:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 22, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 15:39:27', NULL, NULL, '2023-01-26 15:39:27', 22, '2023-01-26 15:39:27', NULL, NULL, NULL, NULL, 1, '8', '2023-02-26 15:39:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 23, NULL, 'Free', NULL, NULL, NULL, 0.000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-26 15:47:37', NULL, NULL, '2023-01-26 15:47:37', 23, '2023-01-26 15:47:37', NULL, NULL, NULL, NULL, 1, '8', '2023-02-26 15:47:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `city_division` enum('city','division') NOT NULL,
  `city_pk_no` int(11) DEFAULT NULL,
  `division_pk_no` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
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
(1, 'city', 2, NULL, 'Kubanni River', NULL, 'kubanni-river', 1, NULL, NULL, 1, 0, 0, 0, NULL, '2023-01-10 15:44:27', NULL, '2023-01-10 15:44:27'),
(2, 'city', 11, NULL, 'Northwestern', NULL, 'northwestern', 2, NULL, NULL, 1, 0, 0, 0, NULL, '2023-01-10 15:47:48', NULL, '2023-01-10 15:47:48'),
(3, 'city', 9, NULL, 'Ikeja', NULL, 'ikeja', 4, NULL, NULL, 1, 0, 0, 0, NULL, '2023-01-10 16:05:09', NULL, '2023-01-10 16:05:09');

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
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ss_chat`
--

INSERT INTO `ss_chat` (`id`, `prd_pk_no`, `owner_pk_no`, `to_pk_no`, `from_pk_no`, `to_name`, `from_name`, `message`, `is_active`, `created_at`, `updated_at`, `created_by`, `updated_by`, `data_set`, `is_seen`) VALUES
(1, 4, 26, 26, 18, 'Rony', 'Rony', 'Hi, I am interested on your ads', 1, '2022-08-22 10:52:23', '2022-08-22 10:52:32', 18, NULL, 0, 1),
(2, 4, 26, 18, 26, 'Rony', 'Rony', 'sounds good', 1, '2022-08-22 10:52:52', '2022-08-22 11:30:13', 26, NULL, 0, 1),
(3, 26, 42, 42, 29, 'Masud', 'Rabin mia', 'fdsfdsf', 1, '2022-12-15 10:29:21', '2022-12-15 10:29:21', 29, NULL, 0, 0),
(4, 26, 42, 42, 29, 'Masud', 'Rabin mia', 'fsdfdsf', 1, '2022-12-15 10:29:25', '2022-12-15 10:29:25', 29, NULL, 0, 0),
(5, 35, 48, 48, 53, 'Masud Rana Tapu', 'user', 'hi', 1, '2023-01-04 10:09:29', '2023-01-04 10:09:29', 53, NULL, 0, 0),
(6, 7, 1, 1, 7, 'Rony Mia', 'Victor', 'hi', 1, '2023-01-29 00:55:27', '2023-01-29 00:55:27', 7, NULL, 0, 0);

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
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT 1,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ss_cities`
--

INSERT INTO `ss_cities` (`pk_no`, `country_pk_no`, `name`, `name_bn`, `url_slug`, `order_id`, `status`, `comments`, `is_active`, `total_post`, `active_post`, `created_by`, `created_at`, `updated_by`, `updated_at`, `image`) VALUES
(1, 1, 'Abuja', NULL, 'abuja', 1, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:08:25', NULL, '2023-01-10 15:08:25', NULL),
(2, 1, 'Calabar', NULL, 'calabar', 2, NULL, NULL, 1, 3, 0, 1, '2023-01-10 15:14:54', NULL, '2023-01-10 15:14:54', NULL),
(4, 1, 'Uyo', NULL, 'uyo', 3, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:16:32', NULL, '2023-01-10 15:16:32', NULL),
(5, 1, 'Katsina', NULL, 'katsina', 4, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:17:07', NULL, '2023-01-10 15:17:07', NULL),
(6, 1, 'Ado-Ekiti', NULL, 'ado-ekiti', 5, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:18:00', NULL, '2023-01-10 15:18:00', NULL),
(7, 1, 'Ibadan', NULL, 'ibadan', 6, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:20:22', NULL, '2023-01-10 15:20:22', NULL),
(8, 1, 'Benin City', NULL, 'benin-city', 7, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:20:56', NULL, '2023-01-10 15:20:56', NULL),
(9, 1, 'Lagos', NULL, 'lagos', 8, NULL, NULL, 1, 1, 0, 1, '2023-01-10 15:21:25', NULL, '2023-01-10 15:21:25', NULL),
(10, 1, 'Zaria', NULL, 'zaria', 9, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:22:08', NULL, '2023-01-10 15:22:08', NULL),
(11, 1, 'Gusau', NULL, 'gusau', 10, NULL, NULL, 1, 0, 0, 1, '2023-01-10 15:22:59', NULL, '2023-01-10 15:22:59', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_country`
--

CREATE TABLE `ss_country` (
  `pk_no` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `order_id` int(2) NOT NULL,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ss_country`
--

INSERT INTO `ss_country` (`pk_no`, `code`, `name`, `comments`, `is_active`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, '+234', 'Nigeria', NULL, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ss_currency`
--

CREATE TABLE `ss_currency` (
  `pk_no` int(11) NOT NULL,
  `code` varchar(4) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ss_customers`
--

CREATE TABLE `ss_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_type` varchar(40) DEFAULT 'Individual',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(124) DEFAULT NULL,
  `mobile1` varchar(11) DEFAULT NULL,
  `mobile2` varchar(11) DEFAULT NULL,
  `mobile1_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile2_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile1_otp_code` varchar(4) NOT NULL,
  `mobile2_otp_code` varchar(4) NOT NULL,
  `mobile1_otp_code_extime` datetime DEFAULT NULL,
  `mobile2_otp_code_extime` datetime DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `gender` varchar(124) DEFAULT NULL,
  `linkedin` varchar(124) DEFAULT NULL,
  `highest_education` varchar(124) DEFAULT NULL,
  `special_education` varchar(124) DEFAULT NULL,
  `highest_education_ins` varchar(124) DEFAULT NULL COMMENT 'highest_education_institution',
  `experience_year` decimal(2,2) DEFAULT NULL,
  `skill_summary` varchar(255) DEFAULT NULL,
  `about_me` varchar(1024) DEFAULT NULL,
  `current_industry` varchar(124) DEFAULT NULL,
  `current_function` varchar(124) DEFAULT NULL COMMENT 'Current Business Function',
  `current_designation` varchar(124) DEFAULT NULL,
  `job_started` datetime DEFAULT NULL,
  `job_notice_period` varchar(124) DEFAULT NULL COMMENT 'Notice period (in days)',
  `current_job_responsibility` varchar(1024) DEFAULT NULL,
  `current_salary` decimal(6,2) DEFAULT NULL COMMENT 'Current salary (per month) (Tk)',
  `cv` varchar(124) DEFAULT NULL COMMENT 'Supported file formats: DOC, DOCX, PDF, TIFF, JPG, PNG',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `alt_mobile_no` varchar(14) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `auth_id` bigint(20) UNSIGNED DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `profile_pic_url` varchar(255) DEFAULT NULL,
  `pic_mime_type` varchar(50) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `total_favorite` int(5) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `package_id` int(3) DEFAULT 1,
  `package_start_date` date DEFAULT NULL,
  `package_end_date` date DEFAULT NULL,
  `promotion` int(1) NOT NULL DEFAULT 0 COMMENT 'I want to receive news and promotion updates',
  `tc` int(1) NOT NULL DEFAULT 0 COMMENT 'Terms & Condition',
  `random_token` varchar(100) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ss_customers`
--

INSERT INTO `ss_customers` (`id`, `seller_type`, `name`, `email`, `mobile1`, `mobile2`, `mobile1_is_verified`, `mobile2_is_verified`, `mobile1_otp_code`, `mobile2_otp_code`, `mobile1_otp_code_extime`, `mobile2_otp_code_extime`, `area_id`, `is_active`, `is_delete`, `gender`, `linkedin`, `highest_education`, `special_education`, `highest_education_ins`, `experience_year`, `skill_summary`, `about_me`, `current_industry`, `current_function`, `current_designation`, `job_started`, `job_notice_period`, `current_job_responsibility`, `current_salary`, `cv`, `email_verified_at`, `password`, `remember_token`, `first_name`, `middle_name`, `last_name`, `alt_mobile_no`, `designation`, `auth_id`, `google_id`, `gym_id`, `profile_pic`, `profile_pic_url`, `pic_mime_type`, `user_type`, `total_post`, `total_favorite`, `status`, `created_at`, `updated_at`, `deleted_at`, `city`, `address`, `package_id`, `package_start_date`, `package_end_date`, `promotion`, `tc`, `random_token`, `is_verified`) VALUES
(1, 'Dealer', 'Rony Mia', 'ronymia.tech@gmail.com', '01767671133', NULL, 0, 0, '', '', '2023-01-12 11:15:39', '2023-01-12 11:15:39', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$XidltQxEDz4wf9r4mGHgf.z56ox3WnlX5pB10pQDY9gONUyGxcF22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'profile_11012023_1673444323.jpg', 'http://ok2list.webdevs4u.com/media/images/profile/profile_11012023_1673444323.jpg', NULL, 0, 10, 0, 1, '2023-01-10 20:32:45', '2023-01-12 12:14:39', NULL, 'Zaria', 'Bnani', 3, '2023-01-10', '2023-02-10', 0, 0, 'anpLohVQD0LqJd4WEWPRZcrrme5ysG', 1),
(2, 'Individual', 'Masud Rana Tapu', 'masudrana.tapu1998@gmail.com', NULL, NULL, 0, 0, '', '', '2023-01-12 06:04:21', '2023-01-12 06:04:21', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$wghOSpF3GJMYwyOYT66KXOmpePch6/.lTSjvLFbJFjxhTEqAZpCP2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-12 06:58:26', '2023-01-12 06:58:26', NULL, NULL, NULL, 1, '2023-01-12', '2023-02-12', 0, 0, 'BlmOzqoTLmDrGKh1PHBxqtresWbcNj', 1),
(3, 'Individual', 'nayeemsarwar', 'nayeemsarwar1275@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$1DnE81y.EW8biPqGSP02CO6oxUrkvtV2zkwPEbdyk/Y14zoSuFSWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-12 12:16:44', '2023-01-12 12:16:44', NULL, NULL, NULL, 1, '2023-01-12', '2023-02-12', 0, 0, 'NYaOALlAUL5fKJDxeF4LCxQZkAcNuS', 0),
(4, 'Individual', 'Rony', 'ronymia2211@gmail.com', NULL, NULL, 0, 0, '', '', '2023-01-24 05:18:10', '2023-01-24 05:18:10', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$3hTamK0ED8X8joQGJaETLO9BCCcglE9f4DqpDUf/CSDKwQhfXeJZm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-24 16:01:17', '2023-01-24 16:01:17', NULL, NULL, NULL, 1, '2023-01-24', '2023-02-24', 0, 0, '5sv01AFsRvysQ7KjsASekic3mnODNs', 1),
(6, 'Individual', 'Agbajiya Kehinde Zaccheaus', 'agbajiyakehinde@yahoo.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZHQBmD4HJbb5mlLbgcgHKeejJWD.lh9UuF/kc/o1sy3XllFgVlB6q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 01:48:03', '2023-01-25 01:48:03', NULL, NULL, NULL, 1, '2023-01-24', '2023-02-24', 0, 0, 'Yvx9drTmN1QNIs3XRAExPwG56iSPQW', 0),
(7, 'Individual', 'Victor', 'directorvictor@icloud.com', NULL, NULL, 0, 0, '', '', '2023-01-26 09:57:48', '2023-01-26 09:57:48', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$bvmSiu6LLVzCn7O2Z5Doyu/fcNFuqrWVap3/2Qt83Uj1zCpLaH/Kq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 08:52:49', '2023-01-25 08:52:49', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, '6KXpOK80Yjt0y7CCx7oXdSOhUQKLAx', 1),
(9, 'Individual', 'Rony', 'webdevsforu@gmail.com', NULL, NULL, 0, 0, '', '', '2023-01-25 01:30:20', '2023-01-25 01:30:20', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rmclXZGddRhM0pXQ4KTEkO8tAYUPCyU2uQ/.V5c1HTmmoo7D8K5K.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 12:03:16', '2023-01-25 12:03:16', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'Lmr5krgqBnJza7jA7FPkL9JYASblMK', 1),
(10, 'Individual', 'Jakir', 'jakir@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZKUGJDaAMnmPrk/wsVuK3.HckTAaHIc0HGWoEBMdMWKDS/wK8069a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 12:36:02', '2023-01-25 12:36:02', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 's0P9B0LZVp5ijYYUgCh2Q8tIxmhEsG', 0),
(11, 'Individual', 'Rony', 'arobilsss@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$5dkQaEZs4t9YZ1NQStLxqeo2c8FAwEzLJCiPRZLmxH1HA9ddGMKgy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 13:06:20', '2023-01-25 13:06:20', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'wyCalGYFT7LqeBdFW9cH9fN9IHOhMi', 0),
(12, 'Individual', 'Rony', 'arobilsssss@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$v9CGugOr1zDRrOSaoe.EN.4g0vIxdSo2wUFM29jp8KqeThAmzyE1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 13:13:41', '2023-01-25 13:13:41', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'i5S4s5SSpCKKqTCmK9WLj8pqFxB4KU', 0),
(13, 'Individual', 'Rony', 'arobil1@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$m4bUhdrc2xITiaj1h7BnuOX3vOErlhfzz6/6wzIvT/yX5FRFxv0ie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 13:17:00', '2023-01-25 13:17:00', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, '4W69XGC8W2J639iIIKitUx792PHPVy', 0),
(14, 'Individual', 'Rony', 'arobil2@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$PukVp9VsaD6O1WLZUQrdNuvAUfBynTlY7aqNa3VtuUv9orDUrWLgW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 13:18:41', '2023-01-25 13:18:41', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'RyGNGE9l16tBgTH3b7Qpsmwt08zl3s', 0),
(15, 'Individual', 'Rony', 'arobil3@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$S/DnSte4PYbk0eCmv5s5YepsHLwbTrVAr5AaWR79B1yK31VuDMnPe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 13:19:57', '2023-01-25 13:19:57', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'tR46iGL9eBXgete8VgAgoaaAVheV5O', 0),
(16, 'Individual', 'Rony', 'arobil5@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$/ZJv/edBMSnBTn9ugOgjNOZGaWE/65BCaBxtfUlnqWPSSbKdEQsxi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 13:22:47', '2023-01-25 13:22:47', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'rTd8XDD4aUO6vn2mGylgZZDcGS1mTZ', 0),
(17, 'Individual', 'Rony', 'arobil10@gmail.com', NULL, NULL, 0, 0, '', '', '2023-01-25 07:55:25', '2023-01-25 07:55:25', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$gowPUt9cEf.GuWfBYFWsWOUlInDDp6eb6.nncDgEiDHGLUWA2Cpim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-25 18:54:25', '2023-01-25 18:54:25', NULL, NULL, NULL, 1, '2023-01-25', '2023-02-25', 0, 0, 'Ws5SpNp6jSjfWT6rVGz4QYOCRwvIIz', 1),
(18, 'Individual', 'Rony', 'arobil22@gmail.com', NULL, NULL, 0, 0, '', '', '2023-01-25 22:05:15', '2023-01-25 22:05:15', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$hWF1KoX0QQ814.7JKy82M.h4G1hYKCF7r6cgorxRiEK./ecRbGVEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-26 09:04:15', '2023-01-26 09:04:15', NULL, NULL, NULL, 1, '2023-01-26', '2023-02-26', 0, 0, '2jwWSztDKySrmxPopnjfhBQg1bEjxO', 1),
(22, 'Individual', 'Jakir', 'jakir44@gmail.com', NULL, NULL, 0, 0, '', '', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$AqH76/5BFtDtgUZ4IfutjOgfbhirK2C.kVRFvVbf9Zyu9p/tBTbBa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-26 20:39:27', '2023-01-26 20:39:27', NULL, NULL, NULL, 1, '2023-01-26', '2023-02-26', 0, 0, 'FSHD9F9Lg7nfB9cGnCVxqDfGo69kVp', 0),
(23, 'Individual', 'Rony', 'arobil99@gmail.com', NULL, NULL, 0, 0, '', '', '2023-01-26 09:49:51', '2023-01-26 09:49:51', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$obdfqvi1RhQFTRT2rq8ETeElqXxCyRVNIHyncv4vjwkeT.VUHKQ1C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2023-01-26 20:47:37', '2023-01-26 20:47:37', NULL, NULL, NULL, 1, '2023-01-26', '2023-02-26', 0, 0, 'tKQBmnJztWLDXanY6GsBDuftKXBLNT', 1);

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
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT 1,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `active_post` int(10) NOT NULL DEFAULT 0,
  `created_by` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image` varchar(124) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ss_employment_history`
--

CREATE TABLE `ss_employment_history` (
  `pk_no` int(11) NOT NULL,
  `customer_pk_no` int(10) DEFAULT NULL,
  `institution_name` varchar(124) DEFAULT NULL,
  `industry` varchar(124) DEFAULT NULL,
  `business _function` varchar(124) DEFAULT NULL,
  `designation` varchar(124) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  `end_date` datetime NOT NULL DEFAULT current_timestamp(),
  `job_responsibility` varchar(1024) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ss_faq`
--

INSERT INTO `ss_faq` (`pk_no`, `question`, `answer`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `is_active`) VALUES
(26, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2023-01-11 12:15:21', '2023-01-11 12:15:55', NULL, 1, 1, 1),
(27, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2023-01-11 12:15:21', '2023-01-11 12:15:55', NULL, 1, 1, 1),
(28, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2023-01-11 12:15:21', '2023-01-11 12:15:55', NULL, 1, 1, 1),
(29, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2023-01-11 12:15:21', '2023-01-11 12:15:55', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ss_industry`
--

CREATE TABLE `ss_industry` (
  `pk_no` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
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
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) DEFAULT NULL,
  `url_slug` varchar(124) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
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
  `name` varchar(191) NOT NULL,
  `name_bn` varchar(191) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ss_packages`
--

INSERT INTO `ss_packages` (`pk_no`, `ad_limit_in_montrh`, `title`, `title_bn`, `price_per_month`, `support_duration`, `discount_on_promotion`, `package_duration`, `sms_feature`, `email_feature`, `shop_page`, `analytics`, `is_active`, `order_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 8, 'Free', NULL, 0, '24/7 Live Support', 15, '2', 0, 0, 0, 0, 1, 1, NULL, NULL, 1, '2022-08-31 19:03:06'),
(2, 4, 'Personal', NULL, 2000, '24/7 Live Support', 5, '1', 0, 1, 1, 1, 1, 2, NULL, NULL, 1, '2022-08-06 15:21:26'),
(3, 50, 'Business', NULL, 5000, '24/7 Live Support', 10, '2', 1, 1, 1, 1, 1, 3, NULL, NULL, NULL, NULL);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ss_shop`
--

INSERT INTO `ss_shop` (`pk_no`, `name`, `url_slug`, `address`, `contact`, `open_time`, `banner`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `is_active`, `customer_pk_no`) VALUES
(1, 'Raid Computer', NULL, 'Raid Computer, 2nd Floor, Natullabath Bus Stand, Sadar Road, Barishal', '01990572321', '10:00 am to 10:00 pm', '12348.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, '2023-01-11 10:47:52', '2023-01-11 10:53:44', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ss_subscribe`
--

CREATE TABLE `ss_subscribe` (
  `pk_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ss_subscribe`
--

INSERT INTO `ss_subscribe` (`pk_no`, `email`, `created_at`, `updated_at`) VALUES
(1, 'extra.muaz@gmail.com', '2022-08-09 23:35:56', '2022-08-09'),
(2, 'ahamed622@yahoo.com', '2022-08-24 18:17:01', '2022-08-24'),
(3, 'nayeemsarwar1275@gmail.com', '2023-01-12 12:13:26', '2023-01-12');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(255) NOT NULL,
  `client` varchar(255) NOT NULL,
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
  `seller_type` varchar(40) DEFAULT 'Individual Seller',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(124) DEFAULT NULL,
  `mobile1` varchar(11) DEFAULT NULL,
  `mobile2` varchar(11) DEFAULT NULL,
  `mobile1_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile2_is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `mobile1_otp_code` varchar(4) NOT NULL,
  `mobile2_otp_code` varchar(4) NOT NULL,
  `mobile1_otp_code_extime` datetime DEFAULT NULL,
  `mobile2_otp_code_extime` datetime DEFAULT NULL,
  `area_id` int(10) DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 0,
  `gender` varchar(124) DEFAULT NULL,
  `linkedin` varchar(124) DEFAULT NULL,
  `highest_education` varchar(124) DEFAULT NULL,
  `special_education` varchar(124) DEFAULT NULL,
  `highest_education_ins` varchar(124) DEFAULT NULL COMMENT 'highest_education_institution',
  `experience_year` decimal(2,2) DEFAULT NULL,
  `skill_summary` varchar(255) DEFAULT NULL,
  `about_me` varchar(1024) DEFAULT NULL,
  `current_industry` varchar(124) DEFAULT NULL,
  `current_function` varchar(124) DEFAULT NULL COMMENT 'Current Business Function',
  `current_designation` varchar(124) DEFAULT NULL,
  `job_started` datetime DEFAULT NULL,
  `job_notice_period` varchar(124) DEFAULT NULL COMMENT 'Notice period (in days)',
  `current_job_responsibility` varchar(1024) DEFAULT NULL,
  `current_salary` decimal(6,2) DEFAULT NULL COMMENT 'Current salary (per month) (Tk)',
  `cv` varchar(124) DEFAULT NULL COMMENT 'Supported file formats: DOC, DOCX, PDF, TIFF, JPG, PNG',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `alt_mobile_no` varchar(14) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `auth_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gym_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `profile_pic_url` varchar(255) DEFAULT NULL,
  `pic_mime_type` varchar(50) DEFAULT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `total_post` int(10) NOT NULL DEFAULT 0,
  `total_favorite` int(5) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `package_id` int(3) DEFAULT NULL,
  `package_start_date` date DEFAULT NULL,
  `package_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `mobile_no` varchar(14) NOT NULL,
  `code` varchar(255) NOT NULL,
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
  `name` varchar(255) NOT NULL,
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
  `workout_name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
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
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`),
  ADD UNIQUE KEY `languages_icon_unique` (`icon`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prd_ad_details`
--
ALTER TABLE `prd_ad_details`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prd_features`
--
ALTER TABLE `prd_features`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prd_img_library`
--
ALTER TABLE `prd_img_library`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `prd_like_count`
--
ALTER TABLE `prd_like_count`
  MODIFY `pk_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `prd_master`
--
ALTER TABLE `prd_master`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `prd_model`
--
ALTER TABLE `prd_model`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `pk_no` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ss_business_function`
--
ALTER TABLE `ss_business_function`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ss_chat`
--
ALTER TABLE `ss_chat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ss_cities`
--
ALTER TABLE `ss_cities`
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `pk_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
