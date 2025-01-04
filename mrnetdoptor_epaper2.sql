-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 02, 2025 at 05:23 PM
-- Server version: 8.0.37
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrnetdoptor_epaper2`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int UNSIGNED NOT NULL,
  `ad_position` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ad_slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ad_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ad_size` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ad_status` tinyint NOT NULL DEFAULT '0',
  `active_from` date DEFAULT NULL,
  `active_upto` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `ad_position`, `ad_slug`, `ad_code`, `ad_size`, `ad_status`, `active_from`, `active_upto`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Epaper Header Top', 'epaper_header_top', '<img alt=\"ad728\" border=\"0\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1734943345333.png\" title=\"ad728\" width=\"1000\" height=\"150\">', '728x90', 0, NULL, '2024-12-29', 1, 3, '2017-01-03 22:09:17', '2024-12-29 16:29:47'),
(2, 'Epaper Header Bottom', 'epaper_header_bottom', '<img alt=\"ad728\" border=\"0\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1734946037143.png\" width=\"1050\" height=\"150\" title=\"ad728\">', '728x90', 1, '2024-12-29', NULL, 1, 3, '2017-02-03 23:23:09', '2024-12-29 16:07:56'),
(3, 'Modal Top', 'modal_top', '<img alt=\"ad728\" border=\"0\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1734864203406.png\" title=\"ad728\">', '728x90', 1, '2024-12-29', NULL, 1, 3, '2017-02-03 23:23:09', '2024-12-29 15:59:32'),
(4, 'Modal Bottom', 'modal_bottom', '<img alt=\"ad728\" border=\"0\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1734872840871.png\" title=\"ad728\">', '728x90', 1, '2024-12-29', NULL, 1, 3, '2017-02-03 23:23:09', '2024-12-29 16:05:50'),
(5, 'Sidebar Ad 1', 'sidebar_ad_1', '<img border=\"0\" data-original-height=\"250\" data-original-width=\"184\" height=\"250\" width=\"184\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1735219505790.png\">', '200 X any', 1, '2024-12-29', NULL, 1, 3, '2017-02-03 23:23:09', '2024-12-29 16:11:09'),
(6, 'Sidebar Ad 2', 'sidebar_ad_2', '<img border=\"0\" data-original-height=\"250\" data-original-width=\"184\" height=\"250\" width=\"184\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1735216315349.jpg\">', '200 X any', 0, NULL, '2024-12-29', 1, 3, '2017-02-03 23:23:09', '2024-12-29 16:20:33'),
(7, 'Sidebar Ad 3', 'sidebar_ad_3', '<img border=\"0\" data-original-height=\"250\" data-original-width=\"163\" height=\"250\" width=\"163\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1735221349303.jpg\">', '200 X any', 1, '2024-12-29', NULL, 1, 3, '2017-02-03 23:23:09', '2024-12-29 16:18:00'),
(11, 'Sidebar Ad 4', 'sidebar_ad_4', '<img border=\"0\" data-original-height=\"250\" data-original-width=\"163\" height=\"250\" width=\"163\" src=\"https://admin.dailyniropekkho.com/storage/ad_image/1735216315349.jpg\">', '200 X any', 1, '2024-12-29', NULL, 1, 3, '2017-02-03 23:23:09', '2024-12-29 16:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'প্রথম পাতা', 1, 1, 8, '2020-02-02 20:13:30', '2024-12-30 16:25:21'),
(2, 'খবর', 1, 1, 8, '2020-02-02 20:13:52', '2024-12-30 16:25:56'),
(3, 'বাণিজ্য', 1, 1, 8, '2020-02-02 20:14:11', '2024-12-30 16:26:28'),
(4, 'মতামত', 1, 1, 8, '2020-02-02 20:14:16', '2024-12-30 16:27:10'),
(5, 'গ্রাম বাংলা', 1, 3, 8, '2020-05-07 17:30:57', '2024-12-30 18:15:54'),
(7, 'খেলাধুলা', 1, 3, 8, '2024-07-08 11:48:49', '2024-12-30 16:28:22'),
(8, 'খবর', 1, 3, 8, '2024-07-08 11:48:57', '2024-12-30 16:29:06'),
(9, 'শেষ পাতা', 1, 3, 8, '2024-07-08 11:49:04', '2024-12-30 16:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `editions`
--

CREATE TABLE `editions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `editions`
--

INSERT INTO `editions` (`id`, `name`, `title`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'দৈনিক', 'nogor-edition', 1, 1, NULL, '2020-02-02 20:15:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2020_01`
--

CREATE TABLE `edition_pages_2020_01` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2020_02`
--

CREATE TABLE `edition_pages_2020_02` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2020_05`
--

CREATE TABLE `edition_pages_2020_05` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2024_07`
--

CREATE TABLE `edition_pages_2024_07` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2024_08`
--

CREATE TABLE `edition_pages_2024_08` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2024_10`
--

CREATE TABLE `edition_pages_2024_10` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2024_12`
--

CREATE TABLE `edition_pages_2024_12` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `edition_pages_2024_12`
--

INSERT INTO `edition_pages_2024_12` (`id`, `edition_id`, `page_id`) VALUES
(6, 1, 7),
(8, 1, 6),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 34);

-- --------------------------------------------------------

--
-- Table structure for table `edition_pages_2025_01`
--

CREATE TABLE `edition_pages_2025_01` (
  `id` int UNSIGNED NOT NULL,
  `edition_id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `edition_pages_2025_01`
--

INSERT INTO `edition_pages_2025_01` (`id`, `edition_id`, `page_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `images_2020_01`
--

CREATE TABLE `images_2020_01` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_2020_02`
--

CREATE TABLE `images_2020_02` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_2020_05`
--

CREATE TABLE `images_2020_05` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_2024_07`
--

CREATE TABLE `images_2024_07` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_2024_08`
--

CREATE TABLE `images_2024_08` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_2024_10`
--

CREATE TABLE `images_2024_10` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images_2024_12`
--

CREATE TABLE `images_2024_12` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `images_2024_12`
--

INSERT INTO `images_2024_12` (`id`, `page_id`, `image`, `coords`, `relation`, `related_page_no`, `related_image_id`, `image_status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(28, 6, 'page6770f664dd9bd.png-67714c2ebabe6.jpg', '109,96,610,380', 'no', '', '', '0', 8, NULL, '2024-12-29 19:18:38', NULL),
(33, 18, 'page677237d398c61.jpeg-67723db6b7ed9.jpg', '28.369462770971,154.13125,428.18096135721,195.65', 'next', '1', '', '0', 8, NULL, '2024-12-30 12:29:10', NULL),
(34, 18, 'page677237d398c61.jpeg-67723ddba6b8f.jpg', '29.029217719133,195.65,161.63996229972,456.1375', 'next', '1', '', '0', 8, NULL, '2024-12-30 12:29:47', NULL),
(35, 18, 'page677237d398c61.jpeg-67723df2ba403.jpg', '160.32045240339,193.94375,430.81998114986,327.03125', 'next', '1', '36', '1', 8, NULL, '2024-12-30 12:30:10', NULL),
(36, 19, 'page6772393eea0e3.jpeg-67723e66ae3cf.jpg', '20.845341018252,308.83125,153.98655139289,892.36875', 'previous', '1', '35', '1', 8, NULL, '2024-12-30 12:32:06', NULL),
(37, 18, 'page677237d398c61.jpeg-67723ec18f9e9.jpg', '163.6192271442,326.4625,430.1602262017,456.70625', 'next', '1', '38', '1', 8, NULL, '2024-12-30 12:33:37', NULL),
(38, 19, 'page6772393eea0e3.jpeg-67723f0f76ad0.jpg', '155.33141210375,67.68125,283.76560999039,158.1125', 'previous', '1', '37', '1', 8, NULL, '2024-12-30 12:34:55', NULL),
(41, 18, 'page677237d398c61.jpeg-677240d45a661.jpg', '28.369462770971,457.84375,109.51932139491,758.14375', 'next', '1', '47', '1', 8, 8, '2024-12-30 12:42:28', '2024-12-30 12:50:36'),
(42, 19, 'page6772393eea0e3.jpeg-67724116b8418.jpg', '287.12776176753,640.4125,417.57925072046,792.26875', 'previous', '1', '41', '1', 8, NULL, '2024-12-30 12:43:34', NULL),
(48, 19, 'page6772393eea0e3.jpeg-677248eea894c.jpg', '285.11047070125,793.40625,414.88952929875,891.8', 'previous', '1', '43', '1', 8, NULL, '2024-12-30 13:17:02', NULL),
(50, 19, 'page6772393eea0e3.jpeg-6772498c95d89.jpg', '418.25168107589,64.26875,548.03073967339,891.8', 'previous', '2', '49', '1', 8, 8, '2024-12-30 13:19:40', '2024-12-30 13:40:08'),
(52, 18, 'page677237d398c61.jpeg-67724ceddf763.jpg', '347.03110273327,458.4125,430.81998114986,779.75625', 'next', '1', '53', '1', 8, NULL, '2024-12-30 13:34:05', NULL),
(53, 19, 'page6772393eea0e3.jpeg-67724d2347d79.jpg', '550.04803073967,67.68125,679.15465898175,432.81875', 'previous', '1', '52', '1', 8, NULL, '2024-12-30 13:34:59', NULL),
(54, 18, 'page677237d398c61.jpeg-67724d98d1abd.jpg', '427.52120640905,611.975,672.29029217719,894.075', 'next', '1', '55', '1', 8, NULL, '2024-12-30 13:36:56', NULL),
(55, 19, 'page6772393eea0e3.jpeg-67724dd737ba3.jpg', '548.70317002882,432.81875,679.15465898175,763.83125', 'previous', '1', '54', '1', 8, NULL, '2024-12-30 13:37:59', NULL),
(56, 19, 'page6772393eea0e3.jpeg-67724ebd2118b.jpg', '153.98655139289,158.1125,283.76560999039,892.9375', 'next', '2', '57', '1', 8, NULL, '2024-12-30 13:41:49', NULL),
(57, 19, 'page6772393eea0e3.jpeg-67724edbf4152.jpg', '282.42074927954,67.68125,416.90682036503,639.84375', 'previous', '2', '56', '1', 8, NULL, '2024-12-30 13:42:19', NULL),
(58, 18, 'page677237d398c61.jpeg-6772522a2b077.jpg', '26.390197926484,15.35625,108.85956644675,153.5625', 'next', '1', '59', '1', 8, NULL, '2024-12-30 13:56:25', NULL),
(59, 19, 'page6772393eea0e3.jpeg-6772524864329.jpg', '20.845341018252,67.68125,151.96926032661,309.96875', 'previous', '1', '58', '1', 8, NULL, '2024-12-30 13:56:56', NULL),
(61, 24, 'page677239d05f4c5.jpeg-677253654170c.jpg', '20.845341018252,72.23125,149.95196926033,650.65', 'previous', '8', '66', '1', 8, 8, '2024-12-30 14:01:40', '2024-12-30 14:07:20'),
(66, 25, 'page677239e7eebec.jpeg-67725468a2a0e.jpg', '26.052889324192,81.33125,353.7708129285,284.94375', 'next', '8', '61', '1', 8, 8, '2024-12-30 14:06:00', '2024-12-30 14:07:20'),
(67, 18, 'page677237d398c61.jpeg-677259655a808.jpg', '103.58152686145,15.35625,673.60980207352,154.7', 'no', '', '', '0', 8, NULL, '2024-12-30 14:27:17', NULL),
(70, 18, 'page677237d398c61.jpeg-67725a63ac259.jpg', '347.69085768143,779.75625,428.18096135721,891.8', 'no', '', '', '0', 8, NULL, '2024-12-30 14:31:31', NULL),
(71, 18, 'page677237d398c61.jpeg-67725a6d5b9be.jpg', '25.07068803016,759.28125,106.2205466541,892.36875', 'no', '', '', '0', 8, NULL, '2024-12-30 14:31:41', NULL),
(72, 18, 'page677237d398c61.jpeg-67727921c1780.jpg', '437.41753063148,159.81875,667.01225259189,604.58125', 'next', '1', '73', '1', 8, NULL, '2024-12-30 16:42:41', NULL),
(73, 19, 'page6772393eea0e3.jpeg-6772794fc9f1a.jpg', '154.65898174832,65.40625,414.88952929875,890.09375', 'previous', '1', '72', '1', 8, NULL, '2024-12-30 16:43:27', NULL),
(74, 18, 'page677237d398c61.jpeg-677279a287169.jpg', '105.56079170594,455.56875,348.35061262959,894.64375', 'next', '1', '75', '1', 8, NULL, '2024-12-30 16:44:50', NULL),
(75, 19, 'page6772393eea0e3.jpeg-677279cb43f6d.jpg', '284.43804034582,65.975,546.01344860711,891.8', 'previous', '1', '74', '1', 8, NULL, '2024-12-30 16:45:31', NULL),
(76, 25, 'page677239e7eebec.jpeg-67727b5f143a0.jpg', '348.28599412341,73.36875,432.61508325171,287.21875', 'next', '8', '77', '1', 8, NULL, '2024-12-30 16:52:15', NULL),
(77, 24, 'page677239d05f4c5.jpeg-67727b98d34e4.jpg', '22.190201729107,67.68125,283.09317963497,892.9375', 'previous', '8', '76', '1', 8, NULL, '2024-12-30 16:53:12', NULL),
(78, 25, 'page677239e7eebec.jpeg-67727beb121d0.jpg', '30.852105778648,2.84375,673.94711067581,70.525', 'no', '', '', '0', 8, NULL, '2024-12-30 16:54:35', NULL),
(79, 25, 'page677239e7eebec.jpeg-67727c3713e91.jpg', '189.22624877571,286.65,433.98628795299,448.175', 'no', '', '', '0', 8, NULL, '2024-12-30 16:55:50', NULL),
(80, 25, 'page677239e7eebec.jpeg-67727c511a143.jpg', '28.795298726738,289.49375,189.91185112635,455', 'next', '8', '81', '1', 8, NULL, '2024-12-30 16:56:17', NULL),
(81, 24, 'page677239d05f4c5.jpeg-67727c8071f27.jpg', '155.33141210375,297.45625,283.76560999039,481.1625', 'previous', '8', '80', '1', 8, NULL, '2024-12-30 16:57:04', NULL),
(82, 25, 'page677239e7eebec.jpeg-67727e5ab8b7e.jpg', '433.98628795299,77.35,675.31831537708,454.43125', 'next', '8', '83', '1', 8, NULL, '2024-12-30 17:04:58', NULL),
(83, 24, 'page677239d05f4c5.jpeg-67727e98ed1ab.jpg', '153.31412103746,481.1625,284.43804034582,596.61875', 'previous', '8', '82', '1', 8, NULL, '2024-12-30 17:06:00', NULL),
(84, 25, 'page677239e7eebec.jpeg-677280a54300b.jpg', '28.795298726738,456.70625,268.75612144956,656.90625', 'next', '8', '85', '1', 8, NULL, '2024-12-30 17:14:45', NULL),
(85, 24, 'page677239d05f4c5.jpeg-67728105c45b8.jpg', '153.31412103746,596.61875,280.40345821326,681.3625', 'previous', '8', '84', '1', 8, NULL, '2024-12-30 17:16:21', NULL),
(86, 25, 'page677239e7eebec.jpeg-677281c561c6a.jpg', '268.07051909892,456.1375,350.34280117532,658.6125', 'next', '8', '87', '1', 8, NULL, '2024-12-30 17:19:33', NULL),
(87, 24, 'page677239d05f4c5.jpeg-677282435523c.jpg', '155.33141210375,681.3625,283.09317963497,805.91875', 'previous', '8', '86', '1', 8, NULL, '2024-12-30 17:21:39', NULL),
(88, 25, 'page677239e7eebec.jpeg-67728299cbdd9.jpg', '353.08521057786,457.84375,593.04603330069,657.475', 'next', '8', '89', '1', 8, NULL, '2024-12-30 17:23:05', NULL),
(89, 24, 'page677239d05f4c5.jpeg-677282fc1056b.jpg', '149.95196926033,65.975,420.9414024976,891.8', 'previous', '8', '88', '1', 8, NULL, '2024-12-30 17:24:44', NULL),
(90, 25, 'page677239e7eebec.jpeg-677283399700b.jpg', '596.47404505387,456.1375,674.63271302644,657.475', 'next', '8', '91', '1', 8, NULL, '2024-12-30 17:25:45', NULL),
(91, 24, 'page677239d05f4c5.jpeg-677283979e494.jpg', '285.78290105668,303.14375,414.88952929875,706.95625', 'previous', '8', '90', '1', 8, NULL, '2024-12-30 17:27:19', NULL),
(92, 25, 'page677239e7eebec.jpeg-677283f2e222a.jpg', '16.454456415279,657.475,110.3819784525,865.6375', 'next', '8', '93', '1', 8, NULL, '2024-12-30 17:28:50', NULL),
(93, 24, 'page677239d05f4c5.jpeg-677284265577a.jpg', '286.4553314121,706.3875,414.21709894332,841.75', 'previous', '8', '92', '1', 8, NULL, '2024-12-30 17:29:42', NULL),
(94, 25, 'page677239e7eebec.jpeg-6772847338713.jpg', '105.58276199804,660.31875,353.7708129285,867.34375', 'next', '8', '95', '1', 8, NULL, '2024-12-30 17:30:59', NULL),
(95, 24, 'page677239d05f4c5.jpeg-677284d6b56c1.jpg', '283.09317963497,71.09375,679.15465898175,890.09375', 'previous', '8', '94', '1', 8, NULL, '2024-12-30 17:32:38', NULL),
(96, 25, 'page677239e7eebec.jpeg-67728512413bd.jpg', '347.60039177277,660.31875,436.72869735553,869.05', 'next', '8', '97', '1', 8, NULL, '2024-12-30 17:33:38', NULL),
(97, 24, 'page677239d05f4c5.jpeg-6772857c2db1d.jpg', '418.92411143132,125.69375,546.68587896254,193.94375', 'previous', '8', '96', '1', 8, NULL, '2024-12-30 17:35:24', NULL),
(98, 25, 'page677239e7eebec.jpeg-677286285656f.jpg', '433.30068560235,659.18125,597.15964740451,864.5', 'next', '8', '99', '1', 8, NULL, '2024-12-30 17:38:16', NULL),
(99, 24, 'page677239d05f4c5.jpeg-67728667c5801.jpg', '418.92411143132,192.80625,545.34101825168,476.6125', 'previous', '8', '98', '1', 8, NULL, '2024-12-30 17:39:19', NULL),
(100, 25, 'page677239e7eebec.jpeg-677286c956e9e.jpg', '598.53085210578,658.6125,677.37512242899,865.6375', 'next', '8', '101', '1', 8, NULL, '2024-12-30 17:40:57', NULL),
(101, 24, 'page677239d05f4c5.jpeg-67728700e7441.jpg', '417.57925072046,477.18125,548.70317002882,585.24375', 'previous', '8', '100', '1', 8, NULL, '2024-12-30 17:41:52', NULL),
(102, 20, 'page6772395cb8e5b.jpeg-677287b53d628.jpg', '12.788461538462,14.7875,677.78846153846,68.81875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:44:53', NULL),
(103, 20, 'page6772395cb8e5b.jpeg-677287c016534.jpg', '512.21153846154,67.68125,678.46153846154,273', 'no', '', '', '0', 8, NULL, '2024-12-30 17:45:04', NULL),
(104, 20, 'page6772395cb8e5b.jpeg-677287cb0d313.jpg', '428.07692307692,68.81875,518.26923076923,273', 'no', '', '', '0', 8, NULL, '2024-12-30 17:45:15', NULL),
(105, 20, 'page6772395cb8e5b.jpeg-677287dc9d2be.jpg', '98.942307692308,69.3875,432.11538461538,270.725', 'no', '', '', '0', 8, NULL, '2024-12-30 17:45:32', NULL),
(106, 20, 'page6772395cb8e5b.jpeg-677287f9d66f0.jpg', '22.211538461538,68.25,101.63461538462,453.29375', 'no', '', '', '0', 8, NULL, '2024-12-30 17:46:01', NULL),
(107, 20, 'page6772395cb8e5b.jpeg-677288032633b.jpg', '102.30769230769,275.84375,265.19230769231,452.725', 'no', '', '', '0', 8, NULL, '2024-12-30 17:46:11', NULL),
(108, 20, 'page6772395cb8e5b.jpeg-6772880b262d2.jpg', '267.88461538462,280.39375,350.67307692308,449.3125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:46:19', NULL),
(109, 20, 'page6772395cb8e5b.jpeg-67728811cec02.jpg', '346.63461538462,277.55,594.32692307692,452.725', 'no', '', '', '0', 8, NULL, '2024-12-30 17:46:25', NULL),
(110, 20, 'page6772395cb8e5b.jpeg-6772881a86957.jpg', '597.69230769231,278.6875,676.44230769231,451.5875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:46:34', NULL),
(111, 20, 'page6772395cb8e5b.jpeg-6772883446999.jpg', '18.846153846154,452.725,683.17307692308,478.8875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:47:00', NULL),
(112, 20, 'page6772395cb8e5b.jpeg-6772884425418.jpg', '20.865384615385,478.31875,349.32692307692,751.31875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:47:16', NULL),
(113, 20, 'page6772395cb8e5b.jpeg-67728850d94f9.jpg', '347.98076923077,480.59375,432.78846153846,750.75', 'no', '', '', '0', 8, NULL, '2024-12-30 17:47:28', NULL),
(114, 20, 'page6772395cb8e5b.jpeg-6772887bdca7f.jpg', '434.13461538462,480.59375,683.84615384615,725.725', 'no', '', '', '0', 8, NULL, '2024-12-30 17:48:11', NULL),
(115, 20, 'page6772395cb8e5b.jpeg-67728886d1763.jpg', '434.13461538462,729.70625,514.23076923077,888.95625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:48:22', NULL),
(116, 20, 'page6772395cb8e5b.jpeg-6772889bd786f.jpg', '516.25,730.84375,682.5,889.525', 'no', '', '', '0', 8, NULL, '2024-12-30 17:48:43', NULL),
(117, 20, 'page6772395cb8e5b.jpeg-677288abdaf07.jpg', '20.865384615385,757.00625,183.75,888.95625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:48:59', NULL),
(118, 20, 'page6772395cb8e5b.jpeg-677288b5164f8.jpg', '185.76923076923,756.4375,430.09615384615,888.3875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:49:08', NULL),
(119, 21, 'page677239781741b.jpeg-6772891475095.jpg', '22.190201729107,10.2375,678.48222862632,66.54375', 'no', '', '', '0', 8, NULL, '2024-12-30 17:50:44', NULL),
(120, 21, 'page677239781741b.jpeg-6772891e0e0a5.jpg', '355.71565802113,180.8625,677.80979827089,356.60625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:50:54', NULL),
(121, 21, 'page677239781741b.jpeg-6772892d8b59b.jpg', '22.190201729107,65.975,242.07492795389,460.11875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:51:09', NULL),
(122, 21, 'page677239781741b.jpeg-6772893a1f818.jpg', '246.78194044188,68.81875,685.87896253602,464.66875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:51:22', NULL),
(123, 21, 'page677239781741b.jpeg-6772894b65576.jpg', '21.517771373679,462.9625,683.86167146974,495.38125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:51:39', NULL),
(124, 21, 'page677239781741b.jpeg-6772895e23b69.jpg', '20.845341018252,499.3625,186.26320845341,711.50625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:51:58', NULL),
(125, 21, 'page677239781741b.jpeg-6772897491d5a.jpg', '187.60806916427,499.3625,266.95485110471,711.50625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:52:20', NULL),
(126, 21, 'page677239781741b.jpeg-6772897f8e61e.jpg', '267.62728146013,498.79375,595.77329490874,713.2125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:52:31', NULL),
(127, 21, 'page677239781741b.jpeg-6772898ccba61.jpg', '597.1181556196,498.79375,683.18924111431,713.2125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:52:44', NULL),
(128, 21, 'page677239781741b.jpeg-677289a8c9413.jpg', '20.845341018252,714.91875,103.55427473583,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:53:12', NULL),
(129, 21, 'page677239781741b.jpeg-677289b3c779d.jpg', '105.57156580211,715.4875,350.33621517771,890.6625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:53:23', NULL),
(130, 21, 'page677239781741b.jpeg-677289c28262c.jpg', '351.68107588857,715.4875,433.04514889529,890.6625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:53:38', NULL),
(131, 21, 'page677239781741b.jpeg-677289d437349.jpg', '433.71757925072,714.91875,678.48222862632,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:53:56', NULL),
(132, 22, 'page677239981b59e.jpeg-67728a4bbb179.jpg', '16.153846153846,22.18125,678.46153846154,69.3875', 'no', '', '', '0', 8, NULL, '2024-12-30 17:55:55', NULL),
(133, 22, 'page677239981b59e.jpeg-67728a556f4ca.jpg', '18.846153846154,72.8,102.30769230769,394.14375', 'no', '', '', '0', 8, NULL, '2024-12-30 17:56:05', NULL),
(134, 22, 'page677239981b59e.jpeg-67728a62898b9.jpg', '102.30769230769,69.95625,429.42307692308,356.0375', 'no', '', '', '0', 8, NULL, '2024-12-30 17:56:18', NULL),
(135, 22, 'page677239981b59e.jpeg-67728a6c55a17.jpg', '431.44230769231,71.09375,513.55769230769,367.4125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:56:28', NULL),
(136, 22, 'page677239981b59e.jpeg-67728a7803269.jpg', '513.55769230769,68.25,677.11538461538,365.70625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:56:39', NULL),
(137, 22, 'page677239981b59e.jpeg-67728a8fc3a7a.jpg', '348.65384615385,360.5875,431.44230769231,520.40625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:57:03', NULL),
(138, 22, 'page677239981b59e.jpeg-67728a9f76e04.jpg', '19.519230769231,397.55625,103.65384615385,671.125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:57:19', NULL),
(139, 22, 'page677239981b59e.jpeg-67728ab00ed8b.jpg', '103.65384615385,357.74375,349.32692307692,672.2625', 'no', '', '', '0', 8, NULL, '2024-12-30 17:57:36', NULL),
(140, 22, 'page677239981b59e.jpeg-67728ac521a28.jpg', '433.46153846154,367.4125,598.36538461538,522.68125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:57:57', NULL),
(141, 22, 'page677239981b59e.jpeg-67728ae621bca.jpg', '597.69230769231,367.98125,677.78846153846,702.975', 'no', '', '', '0', 8, NULL, '2024-12-30 17:58:30', NULL),
(142, 22, 'page677239981b59e.jpeg-67728af5e1ac7.jpg', '597.69230769231,704.1125,677.11538461538,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-30 17:58:45', NULL),
(143, 22, 'page677239981b59e.jpeg-67728e862afb9.jpg', '18.846153846154,671.69375,266.53846153846,892.9375', 'no', '', '', '0', 8, NULL, '2024-12-30 18:13:58', NULL),
(144, 22, 'page677239981b59e.jpeg-67728e9bb81bb.jpg', '267.21153846154,672.83125,348.65384615385,891.8', 'no', '', '', '0', 8, NULL, '2024-12-30 18:14:19', NULL),
(145, 22, 'page677239981b59e.jpeg-67728eb5b613e.jpg', '350.67307692308,520.975,596.34615384615,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-30 18:14:45', NULL),
(146, 23, 'page677239b1e4d3c.jpeg-67728f41d13ac.jpg', '20.172910662824,17.0625,677.80979827089,67.68125', 'no', '', '', '0', 8, NULL, '2024-12-30 18:17:05', NULL),
(147, 23, 'page677239b1e4d3c.jpeg-67728f50431ed.jpg', '131.79634966378,125.125,238.71277617675,203.6125', 'no', '', '', '0', 8, NULL, '2024-12-30 18:17:20', NULL),
(148, 23, 'page677239b1e4d3c.jpeg-67728f5fa4cb4.jpg', '20.845341018252,67.1125,350.33621517771,222.95', 'no', '', '', '0', 8, NULL, '2024-12-30 18:17:35', NULL),
(149, 23, 'page677239b1e4d3c.jpeg-67728f66840b4.jpg', '351.68107588857,69.3875,432.37271853987,252.525', 'no', '', '', '0', 8, NULL, '2024-12-30 18:17:42', NULL),
(150, 23, 'page677239b1e4d3c.jpeg-67728f73341e3.jpg', '429.68299711816,63.7,675.79250720461,218.96875', 'no', '', '', '0', 8, NULL, '2024-12-30 18:17:55', NULL),
(151, 23, 'page677239b1e4d3c.jpeg-67728f844d1a7.jpg', '19.500480307397,221.8125,348.99135446686,449.88125', 'no', '', '', '0', 8, NULL, '2024-12-30 18:18:12', NULL),
(152, 23, 'page677239b1e4d3c.jpeg-67728f8d65e5a.jpg', '350.33621517771,252.525,432.37271853987,449.88125', 'no', '', '', '0', 8, NULL, '2024-12-30 18:18:21', NULL),
(153, 23, 'page677239b1e4d3c.jpeg-67728fa99e0e4.jpg', '433.04514889529,67.1125,676.46493756004,447.0375', 'no', '', '', '0', 8, NULL, '2024-12-30 18:18:49', NULL),
(154, 23, 'page677239b1e4d3c.jpeg-67728fb5723c0.jpg', '20.172910662824,452.725,678.48222862632,487.41875', 'no', '', '', '0', 8, NULL, '2024-12-30 18:19:01', NULL),
(155, 23, 'page677239b1e4d3c.jpeg-67728fc619e56.jpg', '21.517771373679,489.125,314.02497598463,890.6625', 'no', '', '', '0', 8, NULL, '2024-12-30 18:19:18', NULL),
(156, 23, 'page677239b1e4d3c.jpeg-67728fd161d88.jpg', '312.00768491835,488.55625,433.04514889529,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-30 18:19:29', NULL),
(157, 23, 'page677239b1e4d3c.jpeg-67728fe341884.jpg', '436.40730067243,488.55625,677.13736791547,671.69375', 'no', '', '', '0', 8, NULL, '2024-12-30 18:19:47', NULL),
(158, 23, 'page677239b1e4d3c.jpeg-67728feef15d8.jpg', '431.70028818444,672.2625,679.82708933718,888.95625', 'no', '', '', '0', 8, NULL, '2024-12-30 18:19:58', NULL),
(159, 25, 'page677239e7eebec.jpeg-677370e086d9b.jpg', '28.795298726738,869.05,676.68952007835,890.09375', 'no', '', '', '0', 8, NULL, '2024-12-31 10:19:44', NULL),
(160, 26, 'page677375e3b36f1.jpeg-677379f8958a9.jpg', '19.241706161137,15.35625,104.17061611374,154.7', 'next', '1', '174', '1', 8, NULL, '2024-12-31 10:58:32', NULL),
(161, 26, 'page677375e3b36f1.jpeg-67737a0f19c5e.jpg', '104.83412322275,18.76875,669.47867298578,155.8375', 'no', '', '', '0', 8, NULL, '2024-12-31 10:58:55', NULL),
(162, 26, 'page677375e3b36f1.jpeg-67737a54b18e9.jpg', '349.00473933649,156.40625,671.4691943128,299.1625', 'no', '', '', '0', 8, NULL, '2024-12-31 11:00:04', NULL),
(163, 26, 'page677375e3b36f1.jpeg-67737a74408b1.jpg', '24.549763033175,159.25,347.01421800948,457.275', 'next', '1', '175', '1', 8, NULL, '2024-12-31 11:00:35', NULL),
(164, 26, 'page677375e3b36f1.jpeg-67737a8f723ce.jpg', '348.34123222749,300.86875,429.28909952607,499.3625', 'no', '', '', '0', 8, NULL, '2024-12-31 11:01:03', NULL),
(165, 26, 'page677375e3b36f1.jpeg-67737abe7cfe6.jpg', '428.62559241706,300.3,670.14218009479,610.26875', 'next', '1', '177', '1', 8, NULL, '2024-12-31 11:01:50', NULL),
(166, 26, 'page677375e3b36f1.jpeg-67737ad16e2c9.jpg', '349.00473933649,497.0875,428.62559241706,609.13125', 'no', '', '', '0', 8, NULL, '2024-12-31 11:02:09', NULL),
(167, 26, 'page677375e3b36f1.jpeg-67737af815189.jpg', '23.886255924171,456.1375,103.50710900474,756.4375', 'next', '1', '178', '1', 8, NULL, '2024-12-31 11:02:48', NULL),
(168, 26, 'page677375e3b36f1.jpeg-67737b05d19ce.jpg', '21.895734597156,757.00625,103.50710900474,892.36875', 'next', '1', '', '0', 8, NULL, '2024-12-31 11:03:01', NULL),
(169, 26, 'page677375e3b36f1.jpeg-67737b1ac1766.jpg', '103.50710900474,610.8375,350.3317535545,891.8', 'next', '1', '', '0', 8, NULL, '2024-12-31 11:03:22', NULL),
(170, 26, 'page677375e3b36f1.jpeg-67737b35f0224.jpg', '104.17061611374,459.55,347.67772511848,611.975', 'next', '1', '176', '1', 8, NULL, '2024-12-31 11:03:49', NULL),
(171, 26, 'page677375e3b36f1.jpeg-67737b8f2a522.jpg', '591.84834123223,611.975,670.14218009479,891.23125', 'next', '1', '181', '1', 8, NULL, '2024-12-31 11:05:19', NULL),
(172, 26, 'page677375e3b36f1.jpeg-67737b9ca78c9.jpg', '358.29383886256,620.50625,579.90521327014,754.73125', 'no', '', '', '0', 8, NULL, '2024-12-31 11:05:32', NULL),
(173, 26, 'page677375e3b36f1.jpeg-67737bc11b901.jpg', '350.3317535545,613.68125,590.52132701422,891.8', 'next', '1', '179', '1', 8, NULL, '2024-12-31 11:06:09', NULL),
(174, 27, 'page67737635565d1.jpeg-67737ccea997b.jpg', '24.207492795389,69.3875,151.96926032661,279.825', 'previous', '1', '160', '1', 8, NULL, '2024-12-31 11:10:38', NULL),
(175, 27, 'page67737635565d1.jpeg-67737d267e392.jpg', '23.535062439962,280.9625,150.62439961575,892.9375', 'previous', '1', '163', '1', 8, NULL, '2024-12-31 11:12:06', NULL),
(176, 27, 'page67737635565d1.jpeg-67737d4c85720.jpg', '153.98655139289,66.54375,285.78290105668,295.75', 'previous', '1', '170', '1', 8, NULL, '2024-12-31 11:12:44', NULL),
(177, 27, 'page67737635565d1.jpeg-677391d270ece.jpg', '153.31412103746,67.1125,414.21709894332,890.09375', 'previous', '1', '165', '1', 8, NULL, '2024-12-31 12:40:17', NULL),
(178, 27, 'page67737635565d1.jpeg-6773923327bf9.jpg', '287.12776176753,335.5625,412.87223823247,823.55', 'previous', '1', '167', '1', 8, NULL, '2024-12-31 12:41:55', NULL),
(179, 27, 'page67737635565d1.jpeg-6773928470be7.jpg', '417.57925072046,67.1125,677.13736791547,891.23125', 'previous', '1', '173', '1', 8, NULL, '2024-12-31 12:43:16', NULL),
(181, 27, 'page67737635565d1.jpeg-67739313eaaeb.jpg', '550.04803073967,474.90625,679.82708933718,599.4625', 'previous', '1', '171', '1', 8, NULL, '2024-12-31 12:45:39', NULL),
(182, 27, 'page67737635565d1.jpeg-6773933ec2c61.jpg', '547.35830931796,598.89375,680.4995196926,894.64375', 'previous', '1', '', '0', 8, NULL, '2024-12-31 12:46:22', NULL),
(183, 28, 'page677376e0e622b.jpeg-67739621da6ac.jpg', '18.155619596542,18.2,678.48222862632,67.68125', 'no', '', '', '0', 8, NULL, '2024-12-31 12:58:41', NULL),
(184, 28, 'page677376e0e622b.jpeg-6773965e93c9a.jpg', '106.91642651297,69.95625,431.02785782901,452.15625', 'no', '', '', '0', 8, NULL, '2024-12-31 12:59:42', NULL),
(185, 28, 'page677376e0e622b.jpeg-677396748b703.jpg', '18.828049951969,70.525,104.89913544669,254.23125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:00:04', NULL),
(186, 28, 'page677376e0e622b.jpeg-677396835be14.jpg', '19.500480307397,255.9375,104.22670509126,452.15625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:00:19', NULL),
(187, 28, 'page677376e0e622b.jpeg-67739690f20e2.jpg', '433.71757925072,70.525,513.73679154659,238.875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:00:32', NULL),
(188, 28, 'page677376e0e622b.jpeg-677396a8091b6.jpg', '516.4265129683,71.09375,677.13736791547,237.7375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:00:56', NULL),
(189, 28, 'page677376e0e622b.jpeg-677396b819367.jpg', '433.71757925072,238.30625,692.6032660903,448.74375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:01:12', NULL),
(190, 28, 'page677376e0e622b.jpeg-677396cea08d2.jpg', '22.862632084534,453.8625,677.13736791547,477.18125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:01:34', NULL),
(191, 28, 'page677376e0e622b.jpeg-677396e1bdc28.jpg', '22.862632084534,478.31875,267.62728146013,750.75', 'no', '', '', '0', 8, NULL, '2024-12-31 13:01:53', NULL),
(192, 28, 'page677376e0e622b.jpeg-677396f4ebfdb.jpg', '268.97214217099,478.8875,347.646493756,750.18125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:02:12', NULL),
(193, 28, 'page677376e0e622b.jpeg-6773983411d40.jpg', '350.33621517771,478.8875,595.77329490874,681.93125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:07:31', NULL),
(194, 28, 'page677376e0e622b.jpeg-677398458a726.jpg', '597.1181556196,478.8875,677.13736791547,681.93125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:07:49', NULL),
(195, 28, 'page677376e0e622b.jpeg-67739855be118.jpg', '22.190201729107,751.8875,104.89913544669,890.6625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:08:05', NULL),
(196, 28, 'page677376e0e622b.jpeg-6773986148d4a.jpg', '227.95389048991,791.7,348.99135446686,841.18125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:08:17', NULL),
(197, 28, 'page677376e0e622b.jpeg-6773986edb732.jpg', '106.24399615754,753.025,348.99135446686,890.09375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:08:30', NULL),
(198, 28, 'page677376e0e622b.jpeg-677398d20e08d.jpg', '351.00864553314,684.775,431.02785782901,889.525', 'no', '', '', '0', 8, NULL, '2024-12-31 13:10:10', NULL),
(199, 28, 'page677376e0e622b.jpeg-677398e610786.jpg', '432.37271853987,683.6375,678.48222862632,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:10:30', NULL),
(200, 29, 'page677377a9b2700.jpeg-6773990f2a460.jpg', '20.172910662824,14.7875,679.15465898175,65.975', 'no', '', '', '0', 8, NULL, '2024-12-31 13:11:11', NULL),
(201, 29, 'page677377a9b2700.jpeg-677399220efaf.jpg', '20.172910662824,67.1125,243.41978866475,463.53125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:11:29', NULL),
(202, 29, 'page677377a9b2700.jpeg-67739932a36b0.jpg', '244.09221902017,67.68125,676.46493756004,460.6875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:11:46', NULL),
(203, 29, 'page677377a9b2700.jpeg-6773994010d40.jpg', '20.845341018252,462.9625,679.82708933718,496.51875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:11:59', NULL),
(204, 29, 'page677377a9b2700.jpeg-677399590fe21.jpg', '22.190201729107,496.51875,186.93563880884,745.0625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:12:24', NULL),
(205, 29, 'page677377a9b2700.jpeg-67739966ed5f2.jpg', '186.26320845341,499.93125,267.62728146013,713.2125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:12:38', NULL),
(206, 29, 'page677377a9b2700.jpeg-677399728d308.jpg', '266.28242074928,499.3625,596.44572526417,713.78125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:12:50', NULL),
(207, 29, 'page677377a9b2700.jpeg-6773997d43969.jpg', '597.79058597502,497.65625,678.48222862632,713.2125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:13:01', NULL),
(208, 29, 'page677377a9b2700.jpeg-6773998a2859a.jpg', '22.190201729107,748.475,186.93563880884,892.9375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:13:13', NULL),
(209, 29, 'page677377a9b2700.jpeg-67739995bad61.jpg', '186.93563880884,717.19375,431.02785782901,891.8', 'no', '', '', '0', 8, NULL, '2024-12-31 13:13:25', NULL),
(210, 29, 'page677377a9b2700.jpeg-677399a04ced2.jpg', '431.02785782901,717.19375,514.40922190202,892.36875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:13:36', NULL),
(211, 29, 'page677377a9b2700.jpeg-677399b2bb7f6.jpg', '515.75408261287,722.88125,680.4995196926,889.525', 'no', '', '', '0', 8, NULL, '2024-12-31 13:13:54', NULL),
(212, 30, 'page677377c870b2b.jpeg-67739c1f1132b.jpg', '18.828049951969,17.63125,677.80979827089,68.81875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:24:14', NULL),
(213, 30, 'page677377c870b2b.jpeg-67739c2ebb4eb.jpg', '20.172910662824,66.54375,349.66378482229,408.3625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:24:30', NULL),
(214, 30, 'page677377c870b2b.jpeg-67739c3b2b207.jpg', '441.78674351585,74.50625,667.72334293948,199.63125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:24:42', NULL),
(215, 30, 'page677377c870b2b.jpeg-67739c5040e42.jpg', '351.00864553314,71.09375,431.70028818444,346.9375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:25:04', NULL),
(216, 30, 'page677377c870b2b.jpeg-67739c68ba896.jpg', '431.02785782901,68.25,677.80979827089,576.14375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:25:28', NULL),
(217, 30, 'page677377c870b2b.jpeg-67739c7c406e8.jpg', '350.33621517771,349.2125,432.37271853987,573.86875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:25:48', NULL),
(218, 30, 'page677377c870b2b.jpeg-67739ca4be083.jpg', '19.500480307397,410.06875,102.8818443804,574.4375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:26:28', NULL),
(219, 30, 'page677377c870b2b.jpeg-67739cb6d1e27.jpg', '103.55427473583,408.3625,348.99135446686,572.73125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:26:46', NULL),
(220, 30, 'page677377c870b2b.jpeg-67739d1d4420b.jpg', '20.845341018252,576.14375,184.24591738713,890.6625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:28:28', NULL),
(221, 30, 'page677377c870b2b.jpeg-67739fa4ed6ef.jpg', '186.26320845341,577.85,266.95485110471,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:39:16', NULL),
(222, 30, 'page677377c870b2b.jpeg-67739fb9ba595.jpg', '267.62728146013,575.575,513.73679154659,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:39:37', NULL),
(223, 30, 'page677377c870b2b.jpeg-67739fc970fe4.jpg', '515.75408261287,577.85,679.15465898175,885.54375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:39:53', NULL),
(224, 31, 'page677377ecc634e.jpeg-67739fe4a3aa4.jpg', '20.172910662824,17.63125,678.48222862632,65.40625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:40:20', NULL),
(225, 31, 'page677377ecc634e.jpeg-67739ff42975e.jpg', '22.862632084534,67.68125,347.646493756,243.99375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:40:35', NULL),
(226, 31, 'page677377ecc634e.jpeg-6773a006d4f4e.jpg', '22.862632084534,66.54375,348.31892411143,448.175', 'no', '', '', '0', 8, NULL, '2024-12-31 13:40:54', NULL),
(227, 31, 'page677377ecc634e.jpeg-6773a011eabf8.jpg', '348.31892411143,65.40625,432.37271853987,276.4125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:41:05', NULL),
(228, 31, 'page677377ecc634e.jpeg-6773a01f5da3e.jpg', '432.37271853987,67.68125,675.79250720461,276.4125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:41:19', NULL),
(229, 31, 'page677377ecc634e.jpeg-6773a03842c67.jpg', '355.71565802113,275.84375,597.1181556196,449.88125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:41:44', NULL),
(230, 31, 'page677377ecc634e.jpeg-6773a0469c7ad.jpg', '595.77329490874,275.84375,677.13736791547,451.5875', 'no', '', '', '0', 8, NULL, '2024-12-31 13:41:58', NULL),
(231, 31, 'page677377ecc634e.jpeg-6773a05c71e86.jpg', '22.862632084534,451.5875,677.13736791547,488.55625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:42:20', NULL),
(232, 31, 'page677377ecc634e.jpeg-6773a06c1f4b3.jpg', '21.517771373679,488.55625,404.80307396734,692.7375', 'no', '', '', '0', 8, NULL, '2024-12-31 13:42:36', NULL),
(233, 31, 'page677377ecc634e.jpeg-6773a077a6a11.jpg', '403.45821325648,489.125,677.80979827089,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:42:47', NULL),
(234, 31, 'page677377ecc634e.jpeg-6773a084b8bc0.jpg', '149.2795389049,695.0125,400.76849183477,890.6625', 'no', '', '', '0', 8, NULL, '2024-12-31 13:43:00', NULL),
(235, 31, 'page677377ecc634e.jpeg-6773a0a5d42fd.jpg', '21.517771373679,696.15,144.57252641691,891.23125', 'no', '', '', '0', 8, NULL, '2024-12-31 13:43:33', NULL),
(246, 34, 'page6773788ba0476.jpeg-6773a49e7184c.jpg', '28.02734375,16.49375,674.70703125,73.36875', 'no', '', '', '0', 8, NULL, '2024-12-31 14:00:30', NULL),
(247, 34, 'page6773788ba0476.jpeg-6773a4bdbc2d0.jpg', '27.34375,75.075,350,284.94375', 'next', '8', '264', '1', 8, NULL, '2024-12-31 14:01:01', NULL),
(248, 34, 'page6773788ba0476.jpeg-6773a629496d3.jpg', '352.05078125,73.9375,431.34765625,284.94375', 'next', '8', '265', '1', 8, NULL, '2024-12-31 14:07:05', NULL),
(249, 34, 'page6773788ba0476.jpeg-6773a63f168cf.jpg', '433.3984375,75.075,674.0234375,453.29375', 'next', '8', '267', '1', 8, NULL, '2024-12-31 14:07:26', NULL),
(251, 34, 'page6773788ba0476.jpeg-6773a68a2ce52.jpg', '25.9765625,287.21875,267.96875,454.43125', 'next', '8', '', '0', 8, NULL, '2024-12-31 14:08:42', NULL),
(252, 34, 'page6773788ba0476.jpeg-6773a864d2ca5.jpg', '270.703125,287.7875,430.6640625,453.29375', 'next', '8', '266', '1', 8, NULL, '2024-12-31 14:16:36', NULL),
(253, 34, 'page6773788ba0476.jpeg-6773a8abd88bf.jpg', '29.39453125,455.56875,267.96875,656.3375', 'next', '8', '268', '1', 8, NULL, '2024-12-31 14:17:47', NULL),
(254, 34, 'page6773788ba0476.jpeg-6773a8d7ee294.jpg', '270.01953125,455.56875,348.6328125,657.475', 'next', '8', '269', '1', 8, NULL, '2024-12-31 14:18:31', NULL),
(255, 34, 'page6773788ba0476.jpeg-6773a8ee0f6b5.jpg', '352.05078125,454.43125,593.359375,655.76875', 'next', '8', '270', '1', 8, NULL, '2024-12-31 14:18:53', NULL),
(256, 34, 'page6773788ba0476.jpeg-6773a9028c5b2.jpg', '596.77734375,455,675.390625,657.475', 'next', '8', '271', '1', 8, NULL, '2024-12-31 14:19:14', NULL),
(257, 34, 'page6773788ba0476.jpeg-6773a90f740b1.jpg', '29.39453125,658.04375,105.2734375,865.6375', 'next', '8', '272', '1', 8, NULL, '2024-12-31 14:19:27', NULL),
(258, 34, 'page6773788ba0476.jpeg-6773a9205e31a.jpg', '107.32421875,658.04375,352.05078125,865.06875', 'next', '8', '274', '1', 8, NULL, '2024-12-31 14:19:44', NULL),
(259, 34, 'page6773788ba0476.jpeg-6773a93773ddb.jpg', '353.41796875,658.04375,432.71484375,864.5', 'next', '8', '275', '1', 8, NULL, '2024-12-31 14:20:07', NULL),
(260, 34, 'page6773788ba0476.jpeg-6773a94503955.jpg', '434.765625,656.90625,592.67578125,865.06875', 'next', '8', '276', '1', 8, NULL, '2024-12-31 14:20:20', NULL),
(261, 34, 'page6773788ba0476.jpeg-6773a958933ff.jpg', '596.09375,659.75,672.65625,864.5', 'next', '8', '277', '1', 8, NULL, '2024-12-31 14:20:40', NULL),
(262, 34, 'page6773788ba0476.jpeg-6773a98a5e3df.jpg', '28.02734375,867.34375,674.0234375,891.23125', 'next', '8', '', '0', 8, NULL, '2024-12-31 14:21:30', NULL),
(263, 32, 'page677378035c6f7.jpeg-6773ab83081eb.jpg', '20.865384615385,8.53125,680.48076923077,68.25', 'no', '', '', '0', 8, NULL, '2024-12-31 14:29:55', NULL),
(264, 32, 'page677378035c6f7.jpeg-6773aba38af7c.jpg', '21.538461538462,67.1125,150.09615384615,638.1375', 'previous', '8', '247', '1', 8, NULL, '2024-12-31 14:30:27', NULL),
(265, 32, 'page677378035c6f7.jpeg-6773ac0f03e5f.jpg', '22.211538461538,69.3875,280.67307692308,890.6625', 'previous', '8', '248', '1', 8, NULL, '2024-12-31 14:32:14', NULL),
(266, 32, 'page677378035c6f7.jpeg-6773ac9430386.jpg', '153.46153846154,590.93125,280.67307692308,669.9875', 'previous', '8', '252', '1', 8, NULL, '2024-12-31 14:34:28', NULL),
(267, 32, 'page677378035c6f7.jpeg-6773acccd9d62.jpg', '154.80769230769,668.85,282.01923076923,833.21875', 'previous', '8', '249', '1', 8, NULL, '2024-12-31 14:35:24', NULL),
(268, 32, 'page677378035c6f7.jpeg-6773ad2883363.jpg', '153.46153846154,69.3875,414.61538461538,890.09375', 'previous', '8', '253', '1', 8, NULL, '2024-12-31 14:36:56', NULL),
(269, 32, 'page677378035c6f7.jpeg-6773ad4d01939.jpg', '286.73076923077,240.58125,414.61538461538,335.5625', 'previous', '8', '254', '1', 8, NULL, '2024-12-31 14:37:32', NULL),
(270, 32, 'page677378035c6f7.jpeg-6773ad6e6256d.jpg', '287.40384615385,332.71875,414.61538461538,466.94375', 'previous', '8', '255', '1', 8, NULL, '2024-12-31 14:38:06', NULL),
(271, 32, 'page677378035c6f7.jpeg-6773ad875138a.jpg', '286.05769230769,466.94375,414.61538461538,627.9', 'previous', '8', '256', '1', 8, NULL, '2024-12-31 14:38:31', NULL),
(272, 32, 'page677378035c6f7.jpeg-6773adb508deb.jpg', '286.05769230769,627.9,413.94230769231,801.9375', 'previous', '8', '257', '1', 8, NULL, '2024-12-31 14:39:17', NULL),
(274, 32, 'page677378035c6f7.jpeg-6773ae3396047.jpg', '284.71153846154,71.09375,544.51923076923,890.6625', 'previous', '8', '258', '1', 8, NULL, '2024-12-31 14:41:23', NULL),
(275, 32, 'page677378035c6f7.jpeg-6773ae5d3dbf6.jpg', '417.98076923077,328.7375,545.19230769231,425.425', 'previous', '8', '259', '1', 8, NULL, '2024-12-31 14:42:05', NULL),
(276, 32, 'page677378035c6f7.jpeg-6773ae758e014.jpg', '417.98076923077,425.99375,547.21153846154,576.7125', 'previous', '8', '260', '1', 8, NULL, '2024-12-31 14:42:29', NULL),
(277, 32, 'page677378035c6f7.jpeg-6773aea215373.jpg', '417.30769230769,576.14375,546.53846153846,748.475', 'previous', '8', '261', '1', 8, NULL, '2024-12-31 14:43:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images_2025_01`
--

CREATE TABLE `images_2025_01` (
  `id` int UNSIGNED NOT NULL,
  `page_id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `relation` enum('no','next','previous') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_page_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `related_image_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `images_2025_01`
--

INSERT INTO `images_2025_01` (`id`, `page_id`, `image`, `coords`, `relation`, `related_page_no`, `related_image_id`, `image_status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'page6774dbd999a4f.jpeg-6774dc6cad86c.jpg', '25.779036827195,17.0625,672.89896128423,155.8375', 'no', '', '', '0', 8, NULL, '2025-01-01 12:10:52', NULL),
(2, 1, 'page6774dbd999a4f.jpeg-6774ddacbf912.jpg', '25.779036827195,154.13125,430.31161473088,455', 'next', '2', '3', '1', 8, NULL, '2025-01-01 12:16:12', NULL),
(3, 2, 'page6774dd3aa3a70.jpeg-6774de5badf71.jpg', '20.865384615385,64.8375,287.40384615385,896.35', 'previous', '1', '2', '1', 8, NULL, '2025-01-01 12:19:07', NULL),
(4, 1, 'page6774dbd999a4f.jpeg-6774df6cecd33.jpg', '431.63361661945,156.975,511.61473087819,453.29375', 'next', '2', '5', '1', 8, NULL, '2025-01-01 12:23:40', NULL),
(5, 2, 'page6774dd3aa3a70.jpeg-6774dfd4cf302.jpg', '154.13461538462,419.16875,286.05769230769,814.45', 'previous', '1', '4', '1', 8, NULL, '2025-01-01 12:25:24', NULL),
(6, 1, 'page6774dbd999a4f.jpeg-6774e04c33393.jpg', '516.90273843248,159.25,678.18696883853,449.88125', 'next', '2', '7', '1', 8, NULL, '2025-01-01 12:27:24', NULL),
(7, 2, 'page6774dd3aa3a70.jpeg-6774e06f5f606.jpg', '23.557692307692,67.68125,151.44230769231,481.1625', 'previous', '1', '6', '1', 8, NULL, '2025-01-01 12:27:59', NULL),
(8, 1, 'page6774dbd999a4f.jpeg-6774e0dc7287c.jpg', '25.118035882908,455.56875,268.36638338055,716.05625', 'next', '2', '9', '1', 8, NULL, '2025-01-01 12:29:48', NULL),
(9, 2, 'page6774dd3aa3a70.jpeg-6774e1429010f.jpg', '152.11538461538,66.54375,547.88461538462,896.35', 'previous', '1', '8', '1', 8, NULL, '2025-01-01 12:31:30', NULL),
(10, 1, 'page6774dbd999a4f.jpeg-6774e15b7ea0c.jpg', '269.02738432483,455.56875,349.66949952786,714.35', 'next', '2', '11', '1', 8, NULL, '2025-01-01 12:31:55', NULL),
(11, 2, 'page6774dd3aa3a70.jpeg-6774e18a5a4e5.jpg', '418.65384615385,547.1375,547.21153846154,744.49375', 'previous', '1', '10', '1', 8, NULL, '2025-01-01 12:32:42', NULL),
(12, 1, 'page6774dbd999a4f.jpeg-6774e1b07749a.jpg', '350.33050047214,455.56875,591.59584513692,713.78125', 'next', '2', '13', '1', 8, NULL, '2025-01-01 12:33:20', NULL),
(13, 2, 'page6774dd3aa3a70.jpeg-6774e1f5acf16.jpg', '418.65384615385,66.54375,675.09615384615,895.78125', 'previous', '1', '12', '1', 8, NULL, '2025-01-01 12:34:29', NULL),
(14, 1, 'page6774dbd999a4f.jpeg-6774e21d0e6fa.jpg', '592.9178470255,455.56875,674.88196411709,714.35', 'next', '2', '15', '1', 8, NULL, '2025-01-01 12:35:08', NULL),
(15, 2, 'page6774dd3aa3a70.jpeg-6774e25cd1913.jpg', '548.55769230769,674.5375,687.21153846154,894.075', 'previous', '1', '14', '1', 8, NULL, '2025-01-01 12:36:12', NULL),
(16, 2, 'page6774dd3aa3a70.jpeg-6774e571a7fea.jpg', '24.230769230769,67.68125,150.76923076923,481.73125', 'no', '', '', '0', 8, NULL, '2025-01-01 12:49:21', NULL),
(17, 3, 'page6774e34856c8a-6774e6de64240.jpg', '21.538461538462,68.81875,100.28846153846,275.275', 'no', '', '', '0', 8, NULL, '2025-01-01 12:55:26', NULL),
(18, 2, 'page6774dd3aa3a70.jpeg-67751d5d9b835.jpg', '22.884615384615,67.1125,150.09615384615,481.1625', 'previous', '1', '', '0', 8, NULL, '2025-01-01 16:47:57', NULL),
(19, 3, 'page6774e34856c8a-67751db90aa21.jpg', '19.519230769231,69.3875,102.98076923077,274.1375', 'no', '', '', '0', 8, NULL, '2025-01-01 16:49:29', NULL),
(20, 3, 'page6774e34856c8a-67751df492172.jpg', '101.63461538462,69.3875,431.44230769231,274.1375', 'no', '', '', '0', 8, NULL, '2025-01-01 16:50:28', NULL),
(21, 3, 'page6774e34856c8a-67751dff0e32a.jpg', '432.11538461538,68.81875,514.23076923077,271.8625', 'no', '', '', '0', 8, NULL, '2025-01-01 16:50:38', NULL),
(22, 3, 'page6774e34856c8a-67751e0b893b7.jpg', '514.90384615385,68.25,687.21153846154,273', 'no', '', '', '0', 8, NULL, '2025-01-01 16:50:51', NULL),
(23, 3, 'page6774e34856c8a-67751e18d4444.jpg', '19.519230769231,276.98125,267.21153846154,449.3125', 'no', '', '', '0', 8, NULL, '2025-01-01 16:51:04', NULL),
(24, 3, 'page6774e34856c8a-67751e29602de.jpg', '267.21153846154,276.4125,348.65384615385,449.88125', 'no', '', '', '0', 8, NULL, '2025-01-01 16:51:21', NULL),
(25, 3, 'page6774e34856c8a-67751e3c079c2.jpg', '348.65384615385,276.4125,596.34615384615,450.45', 'next', '', '', '0', 8, NULL, '2025-01-01 16:51:40', NULL),
(26, 3, 'page6774e34856c8a-67751e4839059.jpg', '595,275.84375,687.21153846154,452.725', 'no', '', '', '0', 8, NULL, '2025-01-01 16:51:52', NULL),
(27, 3, 'page6774e34856c8a-67751e60bb036.jpg', '15.480769230769,480.025,267.21153846154,754.73125', 'no', '', '', '0', 8, NULL, '2025-01-01 16:52:16', NULL),
(28, 3, 'page6774e34856c8a-67751e6fdbb33.jpg', '266.53846153846,480.025,350,753.59375', 'no', '', '', '0', 8, NULL, '2025-01-01 16:52:31', NULL),
(29, 3, 'page6774e34856c8a-67751f43607ce.jpg', '349.32692307692,480.59375,687.21153846154,755.3', 'no', '', '', '0', 8, NULL, '2025-01-01 16:56:03', NULL),
(30, 3, 'page6774e34856c8a-67751f5fc700f.jpg', '16.153846153846,754.1625,102.30769230769,892.36875', 'no', '', '', '0', 8, NULL, '2025-01-01 16:56:31', NULL),
(31, 3, 'page6774e34856c8a-67751f7a20938.jpg', '102.30769230769,754.73125,432.11538461538,891.23125', 'no', '', '', '0', 8, NULL, '2025-01-01 16:56:58', NULL),
(32, 3, 'page6774e34856c8a-67751f874fdb6.jpg', '430.76923076923,753.59375,515.57692307692,890.09375', 'no', '', '', '0', 8, NULL, '2025-01-01 16:57:11', NULL),
(33, 3, 'page6774e34856c8a-67751f90e2085.jpg', '514.23076923077,754.73125,687.21153846154,890.09375', 'no', '', '', '0', 8, NULL, '2025-01-01 16:57:20', NULL),
(34, 4, 'page6774e36cd4c83-67752015a8f58.jpg', '22.211538461538,138.775,185.76923076923,464.1', 'no', '', '', '0', 8, NULL, '2025-01-01 16:59:33', NULL),
(35, 4, 'page6774e36cd4c83-67752039f1491.jpg', '189.13461538462,138.20625,239.61538461538,464.1', 'no', '', '', '0', 8, NULL, '2025-01-01 17:00:09', NULL),
(36, 4, 'page6774e36cd4c83-677520656ffff.jpg', '246.34615384615,66.54375,695.96153846154,464.1', 'no', '', '', '0', 8, NULL, '2025-01-01 17:00:52', NULL),
(37, 4, 'page6774e36cd4c83-677520784bbfa.jpg', '23.557692307692,495.95,267.21153846154,768.38125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:01:12', NULL),
(38, 4, 'page6774e36cd4c83-6775208775560.jpg', '267.21153846154,496.51875,349.32692307692,765.5375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:01:27', NULL),
(39, 4, 'page6774e36cd4c83-67752095b979d.jpg', '348.65384615385,496.51875,597.01923076923,697.2875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:01:41', NULL),
(40, 4, 'page6774e36cd4c83-677520a3de0aa.jpg', '596.34615384615,496.51875,687.21153846154,696.71875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:01:55', NULL),
(41, 4, 'page6774e36cd4c83-677520aeec271.jpg', '349.32692307692,697.2875,432.11538461538,891.8', 'no', '', '', '0', 8, NULL, '2025-01-01 17:02:06', NULL),
(42, 4, 'page6774e36cd4c83-677520bc56044.jpg', '431.44230769231,696.71875,687.21153846154,892.36875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:02:20', NULL),
(43, 4, 'page6774e36cd4c83-677520c722e83.jpg', '101.63461538462,768.38125,350,890.6625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:02:31', NULL),
(44, 4, 'page6774e36cd4c83-677520d311b8c.jpg', '22.884615384615,768.38125,107.01923076923,890.6625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:02:42', NULL),
(45, 5, 'page6774e38c3bf27-677520f601bf6.jpg', '24.808429118774,69.3875,103.92720306513,333.2875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:03:17', NULL),
(46, 5, 'page6774e38c3bf27-677521022ad0d.jpg', '105.26819923372,70.525,431.80076628352,331.58125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:03:29', NULL),
(47, 5, 'page6774e38c3bf27-6775210e8a157.jpg', '431.13026819923,71.09375,512.93103448276,331.58125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:03:42', NULL),
(48, 5, 'page6774e38c3bf27-6775211f11d4c.jpg', '513.60153256705,70.525,683.23754789272,332.71875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:03:59', NULL),
(49, 5, 'page6774e38c3bf27-6775213f4d3cc.jpg', '23.467432950192,334.99375,267.52873563218,553.39375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:04:31', NULL),
(50, 5, 'page6774e38c3bf27-6775214b57e6b.jpg', '267.52873563218,334.425,350.67049808429,552.825', 'no', '', '', '0', 8, NULL, '2025-01-01 17:04:43', NULL),
(51, 5, 'page6774e38c3bf27-6775215785e0e.jpg', '350.67049808429,333.2875,596.74329501916,553.39375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:04:55', NULL),
(52, 5, 'page6774e38c3bf27-677521665d382.jpg', '597.41379310345,332.71875,684.5785440613,648.375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:05:10', NULL),
(53, 5, 'page6774e38c3bf27-67752173c7e40.jpg', '22.7969348659,554.53125,186.39846743295,751.8875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:05:23', NULL),
(54, 5, 'page6774e38c3bf27-677521863df29.jpg', '186.39846743295,553.9625,271.55172413793,729.1375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:05:42', NULL),
(55, 5, 'page6774e38c3bf27-67752198b1fc7.jpg', '272.22222222222,553.39375,597.41379310345,891.23125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:06:00', NULL),
(56, 5, 'page6774e38c3bf27-677521a542980.jpg', '596.74329501916,646.66875,684.5785440613,890.6625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:06:13', NULL),
(57, 5, 'page6774e38c3bf27-677521afc64b5.jpg', '185.72796934866,727.43125,273.5632183908,891.8', 'no', '', '', '0', 8, NULL, '2025-01-01 17:06:23', NULL),
(58, 5, 'page6774e38c3bf27-677521bfaf108.jpg', '22.126436781609,748.475,186.39846743295,892.9375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:06:39', NULL),
(59, 6, 'page6774e3b928171-677521e055987.jpg', '20.845341018252,66.54375,348.99135446686,317.3625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:07:12', NULL),
(60, 6, 'page6774e3b928171-677521eabfef3.jpg', '348.31892411143,66.54375,431.70028818444,270.725', 'no', '', '', '0', 8, NULL, '2025-01-01 17:07:22', NULL),
(61, 6, 'page6774e3b928171-677521f4777aa.jpg', '431.02785782901,67.1125,686.55139289145,246.8375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:07:32', NULL),
(62, 6, 'page6774e3b928171-677521fe269d8.jpg', '21.517771373679,317.3625,348.99135446686,451.01875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:07:42', NULL),
(63, 6, 'page6774e3b928171-6775220ab60a8.jpg', '347.646493756,269.01875,431.70028818444,452.725', 'no', '', '', '0', 8, NULL, '2025-01-01 17:07:54', NULL),
(64, 6, 'page6774e3b928171-67752216a22db.jpg', '431.02785782901,246.26875,596.44572526417,452.725', 'no', '', '', '0', 8, NULL, '2025-01-01 17:08:06', NULL),
(65, 6, 'page6774e3b928171-6775222c73c07.jpg', '596.44572526417,246.8375,683.86167146974,452.15625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:08:28', NULL),
(66, 6, 'page6774e3b928171-6775224174328.jpg', '20.172910662824,486.28125,348.99135446686,892.9375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:08:49', NULL),
(67, 6, 'page6774e3b928171-6775224e7d1af.jpg', '348.31892411143,485.7125,686.55139289145,702.975', 'no', '', '', '0', 8, NULL, '2025-01-01 17:09:02', NULL),
(68, 6, 'page6774e3b928171-6775225b8a6bd.jpg', '348.99135446686,698.99375,681.84438040346,893.50625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:09:15', NULL),
(69, 7, 'page6774e3dea71ae-677522755e7c2.jpg', '18.225650916104,67.68125,149.85535197686,268.45', 'no', '', '', '0', 8, NULL, '2025-01-01 17:09:41', NULL),
(70, 7, 'page6774e3dea71ae-6775228a5890b.jpg', '18.900675024108,267.88125,149.85535197686,510.7375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:10:02', NULL),
(71, 7, 'page6774e3dea71ae-677522b842712.jpg', '18.225650916104,509.6,150.53037608486,890.09375', 'next', '7', '72', '1', 8, NULL, '2025-01-01 17:10:48', NULL),
(72, 7, 'page6774e3dea71ae-677522c894a40.jpg', '149.85535197686,67.68125,282.16007714561,149.0125', 'previous', '7', '71', '1', 8, NULL, '2025-01-01 17:11:04', NULL),
(73, 7, 'page6774e3dea71ae-677522dccd12b.jpg', '149.18032786885,146.7375,281.48505303761,249.1125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:11:24', NULL),
(74, 7, 'page6774e3dea71ae-677522eb6b6f6.jpg', '149.18032786885,248.54375,282.16007714561,729.70625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:11:39', NULL),
(75, 7, 'page6774e3dea71ae-677522f477956.jpg', '149.85535197686,726.8625,284.18514946962,853.125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:11:48', NULL),
(76, 7, 'page6774e3dea71ae-677523014e709.jpg', '149.85535197686,850.85,286.21022179364,889.525', 'next', '7', '77', '1', 8, NULL, '2025-01-01 17:12:01', NULL),
(77, 7, 'page6774e3dea71ae-67752312d89b7.jpg', '282.16007714561,68.81875,415.81485053038,173.46875', 'previous', '7', '76', '1', 8, NULL, '2025-01-01 17:12:18', NULL),
(78, 7, 'page6774e3dea71ae-6775231daec85.jpg', '280.1350048216,172.9,416.48987463838,216.125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:12:29', NULL),
(79, 7, 'page6774e3dea71ae-67752329a2628.jpg', '280.1350048216,215.55625,414.46480231437,394.14375', 'no', '', '', '0', 8, NULL, '2025-01-01 17:12:41', NULL),
(80, 7, 'page6774e3dea71ae-67752338ea133.jpg', '281.48505303761,393.00625,415.13982642237,579.55625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:12:56', NULL),
(81, 7, 'page6774e3dea71ae-677523422dca3.jpg', '280.8100289296,578.41875,415.81485053038,652.35625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:13:06', NULL),
(82, 7, 'page6774e3dea71ae-6775234b17d9e.jpg', '280.8100289296,650.65,416.48987463838,699.5625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:13:15', NULL),
(83, 7, 'page6774e3dea71ae-67752359daa88.jpg', '281.48505303761,697.85625,414.46480231437,890.09375', 'next', '7', '84', '1', 8, NULL, '2025-01-01 17:13:29', NULL),
(84, 7, 'page6774e3dea71ae-67752369e0a23.jpg', '414.46480231437,68.81875,547.44455159113,190.53125', 'previous', '7', '83', '1', 8, NULL, '2025-01-01 17:13:45', NULL),
(85, 7, 'page6774e3dea71ae-677523769cc8f.jpg', '546.76952748312,68.81875,689.19961427194,191.66875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:13:58', NULL),
(86, 7, 'page6774e3dea71ae-677523815229a.jpg', '413.78977820636,189.39375,547.44455159113,385.6125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:14:09', NULL),
(87, 7, 'page6774e3dea71ae-6775238ae8775.jpg', '546.76952748312,191.1,689.19961427194,386.18125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:14:18', NULL),
(88, 7, 'page6774e3dea71ae-677523957cb50.jpg', '413.78977820636,384.475,689.19961427194,575.575', 'no', '', '', '0', 8, NULL, '2025-01-01 17:14:29', NULL),
(89, 7, 'page6774e3dea71ae-677523a018dc5.jpg', '413.11475409836,573.3,689.19961427194,736.53125', 'no', '', '', '0', 8, NULL, '2025-01-01 17:14:40', NULL),
(90, 7, 'page6774e3dea71ae-677523a85e9b6.jpg', '412.43972999036,734.825,689.19961427194,894.075', 'no', '', '', '0', 8, NULL, '2025-01-01 17:14:48', NULL),
(91, 8, 'page6774e4057c67d-677523c240dd0.jpg', '23.084384093113,73.36875,348.30261881668,287.7875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:15:14', NULL),
(92, 8, 'page6774e4057c67d-677523cfd477a.jpg', '346.94471387003,73.36875,429.77691561591,287.21875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:15:27', NULL),
(93, 8, 'page6774e4057c67d-677523dca4125.jpg', '23.084384093113,286.65,429.77691561591,456.70625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:15:40', NULL),
(94, 8, 'page6774e4057c67d-677523f08351f.jpg', '429.09796314258,72.8,675.55771096023,456.70625', 'no', '', '', '0', 8, NULL, '2025-01-01 17:16:00', NULL),
(95, 8, 'page6774e4057c67d-677523fceed04.jpg', '23.76333656644,456.70625,268.18622696411,660.31875', 'no', '', '', '0', 8, NULL, '2025-01-01 17:16:12', NULL),
(96, 7, 'page6774e3dea71ae-6775246167b59.jpg', '148.50530376085,247.975,282.16007714561,728.56875', 'next', '8', '97', '1', 8, NULL, '2025-01-01 17:17:53', NULL),
(97, 8, 'page6774e4057c67d-6775247edd268.jpg', '266.82832201746,455.56875,351.69738118332,661.45625', 'previous', '7', '96', '1', 8, NULL, '2025-01-01 17:18:22', NULL),
(98, 7, 'page6774e3dea71ae-677524a51a8f0.jpg', '149.18032786885,726.29375,281.48505303761,851.9875', 'next', '8', '99', '1', 8, NULL, '2025-01-01 17:19:01', NULL),
(99, 8, 'page6774e4057c67d-677524bc25f72.jpg', '351.01842870999,455.56875,591.3676042677,658.04375', 'previous', '7', '98', '1', 8, NULL, '2025-01-01 17:19:24', NULL),
(100, 7, 'page6774e3dea71ae-677524dd3d2ab.jpg', '280.1350048216,651.21875,412.43972999036,697.2875', 'next', '8', '101', '1', 8, NULL, '2025-01-01 17:19:57', NULL),
(101, 8, 'page6774e4057c67d-677524f2caf9f.jpg', '590.00969932105,455.56875,674.19980601358,660.31875', 'previous', '7', '100', '1', 8, NULL, '2025-01-01 17:20:18', NULL),
(102, 7, 'page6774e3dea71ae-6775251c54911.jpg', '151.88042430087,68.81875,414.46480231437,894.075', 'next', '8', '103', '1', 8, NULL, '2025-01-01 17:21:00', NULL),
(103, 8, 'page6774e4057c67d-6775252f26a3d.jpg', '23.76333656644,659.18125,107.27449078564,866.775', 'previous', '7', '102', '1', 8, NULL, '2025-01-01 17:21:19', NULL),
(104, 7, 'page6774e3dea71ae-677525599d48c.jpg', '281.48505303761,216.69375,415.13982642237,394.7125', 'next', '8', '105', '1', 8, NULL, '2025-01-01 17:22:01', NULL),
(105, 8, 'page6774e4057c67d-6775257242d49.jpg', '106.59553831232,659.75,349.66052376334,866.775', 'previous', '7', '104', '1', 8, NULL, '2025-01-01 17:22:26', NULL),
(106, 7, 'page6774e3dea71ae-67752598bb342.jpg', '282.16007714561,393.00625,415.13982642237,579.55625', 'next', '8', '107', '1', 8, NULL, '2025-01-01 17:23:04', NULL),
(107, 8, 'page6774e4057c67d-677525b4eb70f.jpg', '349.66052376334,657.475,428.41901066925,866.775', 'previous', '7', '106', '1', 8, NULL, '2025-01-01 17:23:32', NULL),
(108, 7, 'page6774e3dea71ae-677525d715117.jpg', '281.48505303761,578.41875,413.78977820636,652.35625', 'next', '8', '109', '1', 8, NULL, '2025-01-01 17:24:07', NULL),
(109, 8, 'page6774e4057c67d-677525f1c6727.jpg', '427.74005819593,656.90625,591.3676042677,866.20625', 'previous', '7', '108', '1', 8, NULL, '2025-01-01 17:24:33', NULL),
(110, 7, 'page6774e3dea71ae-6775261628c6e.jpg', '280.1350048216,172.9,414.46480231437,217.83125', 'next', '8', '111', '1', 8, NULL, '2025-01-01 17:25:09', NULL),
(111, 8, 'page6774e4057c67d-6775262ad5b86.jpg', '590.68865179437,658.6125,673.52085354025,867.34375', 'previous', '7', '110', '1', 8, NULL, '2025-01-01 17:25:30', NULL),
(112, 9, 'page67763c546a3cf.jpeg-67763d5f1aaa2.jpg', '112.66272189349,155.6953125,436.56804733728,454.2890625', 'next', '2', '116', '1', 8, NULL, '2025-01-02 13:16:46', NULL),
(113, 9, 'page67763c546a3cf.jpeg-67763d83dfaa6.jpg', '436.56804733728,155.6953125,680.94674556213,348.359375', 'no', '', '', '0', 8, NULL, '2025-01-02 13:17:23', NULL),
(114, 9, 'page67763c546a3cf.jpeg-67763dae359c1.jpg', '435.73964497041,347.6484375,517.75147928994,609.984375', 'next', '2', '127', '1', 8, NULL, '2025-01-02 13:18:06', NULL),
(115, 9, 'page67763c546a3cf.jpeg-67763dc4e1dbb.jpg', '516.92307692308,347.6484375,680.94674556213,608.5625', 'next', '2', '126', '1', 8, NULL, '2025-01-02 13:18:28', NULL),
(116, 10, 'page67763c64edefb.jpeg-67763e6314b81.jpg', '22.716346153846,67.5390625,283.53365384615,891.515625', 'previous', '1', '112', '1', 8, NULL, '2025-01-02 13:21:07', NULL),
(117, 9, 'page67763c546a3cf.jpeg-67763f32bba46.jpg', '33.136094674556,19.1953125,112.66272189349,417.3203125', 'next', '2', '125', '1', 8, NULL, '2025-01-02 13:24:34', NULL),
(118, 9, 'page67763c546a3cf.jpeg-67763f487c33a.jpg', '33.136094674556,416.609375,113.49112426036,757.1484375', 'next', '2', '129', '1', 8, NULL, '2025-01-02 13:24:56', NULL),
(119, 9, 'page67763c546a3cf.jpeg-67763f5b59262.jpg', '353.72781065089,454.2890625,436.56804733728,673.2578125', 'next', '2', '128', '1', 8, NULL, '2025-01-02 13:25:15', NULL),
(120, 9, 'page67763c546a3cf.jpeg-67763f6c37574.jpg', '112.66272189349,454.2890625,354.55621301775,611.40625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:25:32', NULL),
(121, 9, 'page67763c546a3cf.jpeg-67763f8990ab7.jpg', '112.66272189349,609.984375,355.38461538462,892.9375', 'next', '2', '130', '1', 8, NULL, '2025-01-02 13:26:01', NULL),
(122, 9, 'page67763c546a3cf.jpeg-67763f9b35279.jpg', '354.55621301775,672.546875,436.56804733728,892.2265625', 'next', '2', '131', '1', 8, NULL, '2025-01-02 13:26:19', NULL),
(123, 9, 'page67763c546a3cf.jpeg-67763fba4bef2.jpg', '435.73964497041,609.984375,671.83431952663,890.8046875', 'next', '2', '132', '1', 8, NULL, '2025-01-02 13:26:50', NULL),
(124, 9, 'page67763c546a3cf.jpeg-67763fc6ae33f.jpg', '111.00591715976,19.1953125,681.77514792899,154.2734375', 'no', '', '', '0', 8, NULL, '2025-01-02 13:27:02', NULL),
(125, 10, 'page67763c64edefb.jpeg-67763fff59075.jpg', '18.509615384615,68.25,150.60096153846,182', 'previous', '1', '117', '1', 8, NULL, '2025-01-02 13:27:59', NULL),
(126, 10, 'page67763c64edefb.jpeg-67764049915e5.jpg', '154.80769230769,255.2265625,283.53365384615,696.71875', 'previous', '1', '115', '1', 8, NULL, '2025-01-02 13:29:13', NULL),
(127, 10, 'page67763c64edefb.jpeg-67764089f1f87.jpg', '150.60096153846,68.25,417.30769230769,891.515625', 'previous', '1', '114', '1', 8, NULL, '2025-01-02 13:30:17', NULL),
(128, 10, 'page67763c64edefb.jpeg-677640c06cbc5.jpg', '283.53365384615,421.5859375,413.94230769231,743.640625', 'previous', '1', '119', '1', 8, NULL, '2025-01-02 13:31:12', NULL),
(129, 10, 'page67763c64edefb.jpeg-6776434fefd6a.jpg', '283.53365384615,742.9296875,413.94230769231,845.3046875', 'previous', '1', '118', '1', 8, NULL, '2025-01-02 13:42:07', NULL),
(130, 10, 'page67763c64edefb.jpeg-6776437e9997c.jpg', '283.53365384615,68.25,549.39903846154,894.359375', 'previous', '1', '121', '1', 8, NULL, '2025-01-02 13:42:54', NULL),
(131, 10, 'page67763c64edefb.jpeg-677643c23223f.jpg', '413.94230769231,410.2109375,545.19230769231,895.0703125', 'previous', '1', '122', '1', 8, NULL, '2025-01-02 13:44:02', NULL),
(132, 10, 'page67763c64edefb.jpeg-67764449963a6.jpg', '546.875,68.25,680.64903846154,892.2265625', 'previous', '1', '123', '1', 8, NULL, '2025-01-02 13:46:17', NULL),
(133, 11, 'page67763c72e09eb.jpeg-67764503e1d01.jpg', '16.766467065868,69.671875,100.59880239521,309.96875', 'no', '', '', '0', 8, NULL, '2025-01-02 13:49:23', NULL),
(134, 11, 'page67763c72e09eb.jpeg-67764537091fc.jpg', '98.083832335329,66.828125,508.8622754491,312.1015625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:50:15', NULL),
(135, 11, 'page67763c72e09eb.jpeg-6776454c40d5a.jpg', '508.02395209581,67.5390625,674.0119760479,312.1015625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:50:36', NULL),
(136, 11, 'page67763c72e09eb.jpeg-677645663805d.jpg', '16.766467065868,314.234375,182.75449101796,452.8671875', 'no', '', '', '0', 8, NULL, '2025-01-02 13:51:02', NULL),
(137, 15, 'page67763cd67cdd3.jpeg-6776457dc4740.jpg', '20.192307692308,68.25,151.44230769231,218.96875', 'next', '8', '139', '1', 8, NULL, '2025-01-02 13:51:25', NULL),
(138, 11, 'page67763c72e09eb.jpeg-6776457ed9f1e.jpg', '181.91616766467,313.5234375,263.23353293413,451.4453125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:51:26', NULL),
(139, 16, 'page67763ce77c7a1.jpeg-67764582b28d5.jpg', '20.563035495716,74.6484375,349.57160342717,287.21875', 'previous', '7', '137', '1', 8, NULL, '2025-01-02 13:51:30', NULL),
(140, 11, 'page67763c72e09eb.jpeg-6776458e6079d.jpg', '261.55688622754,314.234375,510.53892215569,451.4453125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:51:42', NULL),
(141, 11, 'page67763c72e09eb.jpeg-677645a00214e.jpg', '510.53892215569,313.5234375,671.49700598802,452.15625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:51:59', NULL),
(142, 15, 'page67763cd67cdd3.jpeg-677645a27c404.jpg', '20.192307692308,220.390625,152.28365384615,400.2578125', 'next', '8', '143', '1', 8, NULL, '2025-01-02 13:52:02', NULL),
(143, 16, 'page67763ce77c7a1.jpeg-677645acc8331.jpg', '340.14687882497,75.359375,431.82374541004,287.21875', 'previous', '7', '142', '1', 8, NULL, '2025-01-02 13:52:12', NULL),
(144, 11, 'page67763c72e09eb.jpeg-677645bd28a79.jpg', '13.413173652695,479.8828125,265.74850299401,747.1953125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:52:29', NULL),
(145, 11, 'page67763c72e09eb.jpeg-677645dc69880.jpg', '341.19760479042,480.59375,681.55688622754,898.625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:53:00', NULL),
(146, 15, 'page67763cd67cdd3.jpeg-677646023efe9.jpg', '21.875,403.1015625,152.28365384615,659.0390625', 'next', '8', '147', '1', 8, NULL, '2025-01-02 13:53:38', NULL),
(147, 16, 'page67763ce77c7a1.jpeg-6776460d7c4fa.jpg', '21.419828641371,289.3515625,180.78335373317,455.7109375', 'previous', '7', '146', '1', 8, NULL, '2025-01-02 13:53:49', NULL),
(148, 11, 'page67763c72e09eb.jpeg-67764619296c1.jpg', '262.39520958084,482.7265625,347.06586826347,673.2578125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:54:01', NULL),
(149, 11, 'page67763c72e09eb.jpeg-6776462d05edf.jpg', '261.55688622754,671.125,346.22754491018,897.203125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:54:20', NULL),
(150, 16, 'page67763ce77c7a1.jpeg-6776463e50c85.jpg', '179.92656058752,287.9296875,430.96695226438,453.578125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:54:38', NULL),
(151, 11, 'page67763c72e09eb.jpeg-67764642ae0ad.jpg', '96.407185628743,744.3515625,264.07185628743,895.78125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:54:42', NULL),
(152, 11, 'page67763c72e09eb.jpeg-6776465105d0d.jpg', '14.251497005988,745.0625,101.4371257485,891.515625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:54:57', NULL),
(153, 15, 'page67763cd67cdd3.jpeg-67764691dedc8.jpg', '20.192307692308,659.75,152.28365384615,729.421875', 'next', '8', '154', '1', 8, NULL, '2025-01-02 13:56:01', NULL),
(154, 16, 'page67763ce77c7a1.jpeg-677646974dd9c.jpg', '430.11015911873,76.78125,676.86658506732,452.15625', 'previous', '7', '153', '1', 8, NULL, '2025-01-02 13:56:07', NULL),
(155, 12, 'page67763c92ec742.jpeg-677646a289ec7.jpg', '17.604790419162,133.65625,241.4371257485,464.953125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:56:18', NULL),
(156, 12, 'page67763c92ec742.jpeg-677646b5552af.jpg', '243.95209580838,67.5390625,680.71856287425,464.2421875', 'no', '', '', '0', 8, NULL, '2025-01-02 13:56:37', NULL),
(157, 15, 'page67763cd67cdd3.jpeg-677646be8c08f.jpg', '20.192307692308,729.421875,152.28365384615,890.09375', 'next', '8', '158', '1', 8, NULL, '2025-01-02 13:56:46', NULL),
(158, 16, 'page67763ce77c7a1.jpeg-677646d391bb5.jpg', '21.419828641371,456.421875,263.89228886169,657.6171875', 'previous', '7', '157', '1', 8, NULL, '2025-01-02 13:57:07', NULL),
(159, 12, 'page67763c92ec742.jpeg-677646e8352f4.jpg', '21.796407185629,499.078125,105.62874251497,681.078125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:57:28', NULL),
(160, 15, 'page67763cd67cdd3.jpeg-677646f71af0a.jpg', '151.44230769231,67.5390625,283.53365384615,279.3984375', 'next', '8', '162', '1', 8, NULL, '2025-01-02 13:57:42', NULL),
(161, 12, 'page67763c92ec742.jpeg-677646fbc6d60.jpg', '105.62874251497,496.9453125,348.74251497006,759.28125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:57:47', NULL),
(162, 16, 'page67763ce77c7a1.jpeg-6776470497dc1.jpg', '263.89228886169,455.7109375,345.2876376989,660.4609375', 'previous', '7', '160', '1', 8, NULL, '2025-01-02 13:57:56', NULL),
(163, 12, 'page67763c92ec742.jpeg-6776470a9b3b2.jpg', '348.74251497006,500.5,431.73652694611,698.140625', 'no', '', '', '0', 8, NULL, '2025-01-02 13:58:02', NULL),
(164, 12, 'page67763c92ec742.jpeg-677647194bdca.jpg', '431.73652694611,500.5,676.52694610778,665.4375', 'no', '', '', '0', 8, NULL, '2025-01-02 13:58:17', NULL),
(165, 15, 'page67763cd67cdd3.jpeg-677647214a8b9.jpg', '150.60096153846,277.9765625,284.375,470.640625', 'next', '8', '167', '1', 8, NULL, '2025-01-02 13:58:25', NULL),
(166, 12, 'page67763c92ec742.jpeg-67764728f20c7.jpg', '18.443113772455,680.3671875,104.79041916168,889.3828125', 'no', '', '', '0', 8, NULL, '2025-01-02 13:58:32', NULL),
(167, 16, 'page67763ce77c7a1.jpeg-6776472eb7d96.jpg', '345.2876376989,455,593.7576499388,659.75', 'previous', '7', '165', '1', 8, NULL, '2025-01-02 13:58:38', NULL),
(168, 12, 'page67763c92ec742.jpeg-677647354a9c0.jpg', '101.4371257485,759.28125,349.58083832335,892.9375', 'no', '', '', '0', 8, NULL, '2025-01-02 13:58:45', NULL),
(169, 12, 'page67763c92ec742.jpeg-6776474143bac.jpg', '347.90419161677,698.8515625,430.05988023952,890.8046875', 'no', '', '', '0', 8, NULL, '2025-01-02 13:58:57', NULL),
(170, 12, 'page67763c92ec742.jpeg-67764754848f8.jpg', '435.08982035928,666.859375,591.85628742515,887.9609375', 'no', '', '', '0', 8, NULL, '2025-01-02 13:59:16', NULL),
(171, 15, 'page67763cd67cdd3.jpeg-6776475c01d64.jpg', '148.07692307692,469.9296875,285.21634615385,616.3828125', 'next', '8', '173', '1', 8, NULL, '2025-01-02 13:59:23', NULL),
(172, 12, 'page67763c92ec742.jpeg-6776477cf1730.jpg', '593.53293413174,665.4375,678.20359281437,893.6484375', 'no', '', '', '0', 8, NULL, '2025-01-02 13:59:56', NULL),
(173, 16, 'page67763ce77c7a1.jpeg-67764783044ba.jpg', '590.33047735618,455.7109375,670.86903304774,658.328125', 'previous', '7', '171', '1', 8, NULL, '2025-01-02 14:00:02', NULL),
(174, 13, 'page67763cac3d482.jpeg-677647a070763.jpg', '21.033653846154,69.671875,105.16826923077,331.296875', 'no', '', '', '0', 8, NULL, '2025-01-02 14:00:32', NULL),
(175, 15, 'page67763cd67cdd3.jpeg-677647aa03f0e.jpg', '150.60096153846,615.671875,284.375,757.859375', 'next', '8', '176', '1', 8, NULL, '2025-01-02 14:00:42', NULL),
(176, 16, 'page67763ce77c7a1.jpeg-677647ba6cd06.jpg', '20.563035495716,656.1953125,101.95838433293,869.4765625', 'previous', '7', '175', '1', 8, NULL, '2025-01-02 14:00:58', NULL),
(177, 13, 'page67763cac3d482.jpeg-677647bfdf320.jpg', '100.96153846154,66.1171875,434.97596153846,352.625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:01:03', NULL),
(178, 13, 'page67763cac3d482.jpeg-677647ce5a4eb.jpg', '432.45192307692,68.25,514.90384615385,352.625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:01:18', NULL),
(179, 13, 'page67763cac3d482.jpeg-677647e163f1d.jpg', '513.22115384615,69.671875,680.64903846154,352.625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:01:37', NULL),
(180, 13, 'page67763cac3d482.jpeg-677647ff4c851.jpg', '21.033653846154,333.4296875,104.32692307692,666.859375', 'no', '', '', '0', 8, NULL, '2025-01-02 14:02:07', NULL),
(181, 13, 'page67763cac3d482.jpeg-6776481166658.jpg', '101.80288461538,352.625,351.68269230769,649.0859375', 'no', '', '', '0', 8, NULL, '2025-01-02 14:02:25', NULL),
(182, 13, 'page67763cac3d482.jpeg-677648268c1fc.jpg', '347.47596153846,351.9140625,434.13461538462,545.2890625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:02:46', NULL),
(183, 15, 'page67763cd67cdd3.jpeg-67764829eb224.jpg', '151.44230769231,68.9609375,413.10096153846,892.9375', 'next', '8', '184', '1', 8, NULL, '2025-01-02 14:02:49', NULL),
(184, 16, 'page67763ce77c7a1.jpeg-6776483604050.jpg', '101.10159118727,657.6171875,345.2876376989,868.765625', 'previous', '7', '183', '1', 8, NULL, '2025-01-02 14:03:01', NULL),
(185, 13, 'page67763cac3d482.jpeg-6776484363076.jpg', '429.92788461538,353.3359375,599.03846153846,543.15625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:03:15', NULL),
(186, 13, 'page67763cac3d482.jpeg-6776485119e7e.jpg', '594.83173076923,355.46875,681.49038461538,714.4921875', 'no', '', '', '0', 8, NULL, '2025-01-02 14:03:29', NULL),
(187, 13, 'page67763cac3d482.jpeg-67764863564a3.jpg', '356.73076923077,546.7109375,589.78365384615,892.2265625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:03:47', NULL),
(188, 13, 'page67763cac3d482.jpeg-6776486b92691.jpg', '596.51442307692,717.3359375,679.80769230769,892.2265625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:03:55', NULL),
(189, 15, 'page67763cd67cdd3.jpeg-6776486d5a3ad.jpg', '285.21634615385,559.5078125,414.78365384615,801.2265625', 'next', '8', '190', '1', 8, NULL, '2025-01-02 14:03:57', NULL),
(190, 16, 'page67763ce77c7a1.jpeg-67764879cbc94.jpg', '343.57405140759,659.0390625,428.39657282742,868.0546875', 'previous', '7', '189', '1', 8, NULL, '2025-01-02 14:04:09', NULL),
(191, 13, 'page67763cac3d482.jpeg-6776487d2add3.jpg', '103.48557692308,653.3515625,267.54807692308,891.515625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:04:13', NULL),
(192, 13, 'page67763cac3d482.jpeg-6776488a97256.jpg', '267.54807692308,651.21875,350.84134615385,892.9375', 'no', '', '', '0', 8, NULL, '2025-01-02 14:04:26', NULL),
(193, 13, 'page67763cac3d482.jpeg-6776489be8a2f.jpg', '19.350961538462,666.859375,106.00961538462,892.2265625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:04:43', NULL),
(194, 15, 'page67763cd67cdd3.jpeg-677648b1cb06c.jpg', '283.53365384615,799.8046875,413.94230769231,853.125', 'next', '8', '195', '1', 8, NULL, '2025-01-02 14:05:05', NULL),
(195, 16, 'page67763ce77c7a1.jpeg-677648bc4b68b.jpg', '427.53977968176,659.0390625,590.33047735618,868.0546875', 'previous', '7', '194', '1', 8, NULL, '2025-01-02 14:05:16', NULL),
(196, 14, 'page67763cbd6cb48.jpeg-677648c40558c.jpg', '20.192307692308,66.828125,270.91346153846,451.4453125', 'no', '', '', '0', 8, NULL, '2025-01-02 14:05:24', NULL),
(197, 14, 'page67763cbd6cb48.jpeg-677648d76d118.jpg', '267.54807692308,66.828125,350.84134615385,451.4453125', 'no', '', '', '0', 8, NULL, '2025-01-02 14:05:43', NULL),
(198, 14, 'page67763cbd6cb48.jpeg-67764905748b7.jpg', '350.84134615385,67.5390625,597.35576923077,281.53125', 'no', '', '', '0', 8, NULL, '2025-01-02 14:06:29', NULL),
(199, 15, 'page67763cd67cdd3.jpeg-6776490a75301.jpg', '283.53365384615,852.4140625,413.10096153846,892.9375', 'next', '8', '201', '1', 8, NULL, '2025-01-02 14:06:34', NULL),
(200, 14, 'page67763cbd6cb48.jpeg-67764910455ad.jpg', '597.35576923077,66.1171875,683.17307692308,282.953125', 'no', '', '', '0', 8, NULL, '2025-01-02 14:06:40', NULL),
(201, 16, 'page67763ce77c7a1.jpeg-677649121f11b.jpg', '590.33047735618,656.1953125,672.58261933905,867.34375', 'previous', '7', '199', '1', 8, NULL, '2025-01-02 14:06:42', NULL),
(202, 14, 'page67763cbd6cb48.jpeg-6776491d245fc.jpg', '354.20673076923,284.375,675.60096153846,447.1796875', 'no', '', '', '0', 8, NULL, '2025-01-02 14:06:53', NULL),
(203, 15, 'page67763cd67cdd3.jpeg-67764933a4528.jpg', '413.94230769231,69.671875,684.01442307692,472.0625', 'no', '', '', '0', 8, NULL, '2025-01-02 14:07:15', NULL),
(204, 14, 'page67763cbd6cb48.jpeg-67764944a3a50.jpg', '439.18269230769,491.96875,673.07692307692,885.828125', 'no', '', '', '0', 8, NULL, '2025-01-02 14:07:32', NULL),
(205, 15, 'page67763cd67cdd3.jpeg-677649639434e.jpg', '414.78365384615,476.328125,679.80769230769,889.3828125', 'no', '', '', '0', 8, NULL, '2025-01-02 14:08:03', NULL),
(206, 14, 'page67763cbd6cb48.jpeg-677649740e2dd.jpg', '19.350961538462,486.9921875,433.29326923077,890.09375', 'no', '', '', '0', 8, NULL, '2025-01-02 14:08:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int NOT NULL,
  `online` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `logo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `footer` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `copyright` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `details` varchar(200) NOT NULL DEFAULT 'details',
  `updated_at` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `epapper_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_tag` longtext,
  `facebook` longtext,
  `twitter` longtext,
  `youtube` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `online`, `logo`, `footer`, `copyright`, `details`, `updated_at`, `epapper_name`, `meta_description`, `meta_tag`, `facebook`, `twitter`, `youtube`) VALUES
(11, 'https://dailyniropekkho.com/', 'logo.webp', 'অফিস : স্কাইভিউ ট্রেড ভ্যালি, ১৪ তলা, ৬৬ ভি.আই.পি রোড, নয়াপল্টন, ঢাকা-১০০, বাংলাদেশ ।\r\nমোবাইল : ২৪৮৩২২৬২৩\r\nই-মেইল- dailyniropekkho@gmail.com', '       স্বত্ব © দৈনিক নিরপেক্ষ লিমিটেড ২০২৪\r\n', 'details', '2024-12-29 17:32:11', 'The Daily Niropekkho ePaper', 'The Daily Niropekkho ePaper ', 'The Daily Niropekkho ePaper', 'https://www.facebook.com/DailyNiropekkho', '#', 'https://www.youtube.com/@DailyNiropekkho.official');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_01_09_090724_create_editions_table', 1),
('2017_01_11_053351_create_categories_table', 1),
('2017_01_11_053427_create_pages_table', 1),
('2017_01_11_053438_create_images_table', 1),
('2017_01_07_092802_create_edition_pages_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages_2020_01`
--

CREATE TABLE `pages_2020_01` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_2020_02`
--

CREATE TABLE `pages_2020_02` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_2020_05`
--

CREATE TABLE `pages_2020_05` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_2024_07`
--

CREATE TABLE `pages_2024_07` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_2024_08`
--

CREATE TABLE `pages_2024_08` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_2024_10`
--

CREATE TABLE `pages_2024_10` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_2024_12`
--

CREATE TABLE `pages_2024_12` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pages_2024_12`
--

INSERT INTO `pages_2024_12` (`id`, `publish_date`, `image`, `page_number`, `category_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(6, '2024-12-29', 'page6770f664dd9bd.png', 1, 1, 1, 3, 3, '2024-12-29 13:12:36', '2024-12-29 13:27:15'),
(7, '2024-12-29', 'page6770f8b91f6fb.png', 2, 2, 1, 3, 3, '2024-12-29 13:22:33', '2024-12-29 13:27:09'),
(9, '2024-12-29', 'page6770fc00b82cb.png', 3, 15, 1, 3, NULL, '2024-12-29 13:36:32', NULL),
(10, '2024-12-29', 'page6770fc77ad091.png', 4, 4, 1, 3, NULL, '2024-12-29 13:38:31', NULL),
(11, '2024-12-29', 'page6770fd34e9cbe.png', 5, 5, 1, 3, NULL, '2024-12-29 13:41:40', NULL),
(12, '2024-12-29', 'page6770fd800b710.png', 6, 3, 1, 3, NULL, '2024-12-29 13:42:56', NULL),
(13, '2024-12-29', 'page6770fe2a01bfd.png', 7, 7, 1, 3, NULL, '2024-12-29 13:45:46', NULL),
(14, '2024-12-29', 'page6770feb48f9bc.png', 8, 16, 1, 3, NULL, '2024-12-29 13:48:04', NULL),
(15, '2024-12-29', 'page6770ffcd0ef8c.png', 9, 8, 1, 3, NULL, '2024-12-29 13:52:45', NULL),
(16, '2024-12-29', 'page677105d1f03c3.png', 10, 8, 1, 3, NULL, '2024-12-29 14:18:25', NULL),
(17, '2024-12-29', 'page677106da136e3.png', 11, 8, 1, 3, NULL, '2024-12-29 14:22:50', NULL),
(18, '2024-12-30', 'page677237d398c61.jpeg', 1, 1, 1, 8, NULL, '2024-12-30 12:04:03', NULL),
(19, '2024-12-30', 'page6772393eea0e3.jpeg', 2, 2, 1, 8, NULL, '2024-12-30 12:10:06', NULL),
(20, '2024-12-30', 'page6772395cb8e5b.jpeg', 3, 3, 1, 8, NULL, '2024-12-30 12:10:36', NULL),
(21, '2024-12-30', 'page677239781741b.jpeg', 4, 4, 1, 8, NULL, '2024-12-30 12:11:04', NULL),
(22, '2024-12-30', 'page677239981b59e.jpeg', 5, 5, 1, 8, 8, '2024-12-30 12:11:36', '2024-12-30 18:53:33'),
(23, '2024-12-30', 'page677239b1e4d3c.jpeg', 6, 7, 1, 8, NULL, '2024-12-30 12:12:01', NULL),
(24, '2024-12-30', 'page677239d05f4c5.jpeg', 7, 8, 1, 8, NULL, '2024-12-30 12:12:32', NULL),
(25, '2024-12-30', 'page677239e7eebec.jpeg', 8, 9, 1, 8, NULL, '2024-12-30 12:12:55', NULL),
(26, '2024-12-31', 'page677375e3b36f1.jpeg', 1, 1, 1, 8, NULL, '2024-12-31 10:41:07', NULL),
(27, '2024-12-31', 'page67737635565d1.jpeg', 2, 2, 1, 8, NULL, '2024-12-31 10:42:29', NULL),
(28, '2024-12-31', 'page677376e0e622b.jpeg', 3, 3, 1, 8, NULL, '2024-12-31 10:45:20', NULL),
(29, '2024-12-31', 'page677377a9b2700.jpeg', 4, 4, 1, 8, NULL, '2024-12-31 10:48:41', NULL),
(30, '2024-12-31', 'page677377c870b2b.jpeg', 5, 5, 1, 8, NULL, '2024-12-31 10:49:12', NULL),
(31, '2024-12-31', 'page677377ecc634e.jpeg', 6, 7, 1, 8, NULL, '2024-12-31 10:49:48', NULL),
(32, '2024-12-31', 'page677378035c6f7.jpeg', 7, 8, 1, 8, NULL, '2024-12-31 10:50:11', NULL),
(34, '2024-12-31', 'page6773788ba0476.jpeg', 8, 9, 1, 8, NULL, '2024-12-31 10:52:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages_2025_01`
--

CREATE TABLE `pages_2025_01` (
  `id` int UNSIGNED NOT NULL,
  `publish_date` date NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pages_2025_01`
--

INSERT INTO `pages_2025_01` (`id`, `publish_date`, `image`, `page_number`, `category_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '2025-01-01', 'page6774dbd999a4f.jpeg', 1, 1, 1, 8, NULL, '2025-01-01 12:08:25', NULL),
(2, '2025-01-01', 'page6774dd3aa3a70.jpeg', 2, 2, 1, 8, NULL, '2025-01-01 12:14:18', NULL),
(3, '2025-01-01', 'page6774e34856c8a.jpg', 3, 3, 1, 8, NULL, '2025-01-01 12:40:08', NULL),
(4, '2025-01-01', 'page6774e36cd4c83.jpg', 4, 4, 1, 8, NULL, '2025-01-01 12:40:44', NULL),
(5, '2025-01-01', 'page6774e38c3bf27.jpg', 5, 5, 1, 8, NULL, '2025-01-01 12:41:16', NULL),
(6, '2025-01-01', 'page6774e3b928171.jpg', 6, 7, 1, 8, NULL, '2025-01-01 12:42:01', NULL),
(7, '2025-01-01', 'page6774e3dea71ae.jpg', 7, 8, 1, 8, NULL, '2025-01-01 12:42:38', NULL),
(8, '2025-01-01', 'page6774e4057c67d.jpg', 8, 9, 1, 8, NULL, '2025-01-01 12:43:17', NULL),
(9, '2025-01-02', 'page67763c546a3cf.jpeg', 1, 1, 1, 8, NULL, '2025-01-02 13:12:20', NULL),
(10, '2025-01-02', 'page67763c64edefb.jpeg', 2, 2, 1, 8, NULL, '2025-01-02 13:12:36', NULL),
(11, '2025-01-02', 'page67763c72e09eb.jpeg', 3, 3, 1, 8, NULL, '2025-01-02 13:12:50', NULL),
(12, '2025-01-02', 'page67763c92ec742.jpeg', 4, 4, 1, 8, NULL, '2025-01-02 13:13:22', NULL),
(13, '2025-01-02', 'page67763cac3d482.jpeg', 5, 5, 1, 8, NULL, '2025-01-02 13:13:48', NULL),
(14, '2025-01-02', 'page67763cbd6cb48.jpeg', 6, 7, 1, 8, NULL, '2025-01-02 13:14:05', NULL),
(15, '2025-01-02', 'page67763cd67cdd3.jpeg', 7, 8, 1, 8, NULL, '2025-01-02 13:14:30', NULL),
(16, '2025-01-02', 'page67763ce77c7a1.jpeg', 8, 9, 1, 8, NULL, '2025-01-02 13:14:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publish_dates`
--

CREATE TABLE `publish_dates` (
  `id` int NOT NULL,
  `publish_date` date DEFAULT NULL,
  `status` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `publish_dates`
--

INSERT INTO `publish_dates` (`id`, `publish_date`, `status`) VALUES
(1, '2020-02-03', NULL),
(2, '2020-02-07', NULL),
(3, '2020-02-08', NULL),
(4, '2020-05-07', NULL),
(5, '2024-07-07', NULL),
(6, '2024-07-07', NULL),
(7, '2024-07-07', NULL),
(8, '2024-07-08', NULL),
(9, '2024-07-08', NULL),
(10, '2024-07-25', NULL),
(11, '2024-07-26', NULL),
(12, '2024-08-27', NULL),
(13, '2024-10-01', NULL),
(14, '2024-10-01', NULL),
(15, '2024-10-01', NULL),
(16, '2024-10-01', NULL),
(17, '2024-12-24', NULL),
(18, '2024-12-24', NULL),
(19, '2024-12-29', 1),
(20, '2024-12-29', 1),
(21, '2024-12-29', 1),
(22, '2024-12-29', 1),
(23, '2024-12-29', 1),
(24, '2024-12-30', 1),
(25, '2024-12-30', 1),
(26, '2024-12-31', 1),
(27, '2024-12-31', 1),
(28, '2025-01-01', 1),
(29, '2025-01-01', 1),
(30, '2025-01-01', 1),
(31, '2025-01-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` enum('admin','operator') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `login_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `login_status`, `user_status`, `user_image`, `mobile`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'system', 'system@email.com', '$2y$10$jznSTP27dpRkXMfSkvQtl.aUq4vQVDj9k0q7iUquBMzOgyQ8RWgUa', 'admin', '0', '1', '', NULL, NULL, NULL, '2024-07-06 21:16:51', NULL),
(8, 'COO', 'coodoptor@gmail.com', '$2y$10$SpJ2M.s1.wsga8/zzBNoQuJLY767uUs7RDQkg2B5e1fhkKXw3CPTq', 'admin', '0', '1', '', NULL, NULL, '1sJ94CJXQFJydkylOlc1pVLhNDEratOmn9jTSnq4lOtWoKUwWSp7wp2EMlZ3', '2024-12-29 15:00:32', '2024-12-29 19:01:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `editions`
--
ALTER TABLE `editions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2020_01`
--
ALTER TABLE `edition_pages_2020_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2020_02`
--
ALTER TABLE `edition_pages_2020_02`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2020_05`
--
ALTER TABLE `edition_pages_2020_05`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2024_07`
--
ALTER TABLE `edition_pages_2024_07`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2024_08`
--
ALTER TABLE `edition_pages_2024_08`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2024_10`
--
ALTER TABLE `edition_pages_2024_10`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2024_12`
--
ALTER TABLE `edition_pages_2024_12`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edition_pages_2025_01`
--
ALTER TABLE `edition_pages_2025_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2020_01`
--
ALTER TABLE `images_2020_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2020_02`
--
ALTER TABLE `images_2020_02`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2020_05`
--
ALTER TABLE `images_2020_05`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2024_07`
--
ALTER TABLE `images_2024_07`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2024_08`
--
ALTER TABLE `images_2024_08`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2024_10`
--
ALTER TABLE `images_2024_10`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2024_12`
--
ALTER TABLE `images_2024_12`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_2025_01`
--
ALTER TABLE `images_2025_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2020_01`
--
ALTER TABLE `pages_2020_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2020_02`
--
ALTER TABLE `pages_2020_02`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2020_05`
--
ALTER TABLE `pages_2020_05`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2024_07`
--
ALTER TABLE `pages_2024_07`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2024_08`
--
ALTER TABLE `pages_2024_08`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2024_10`
--
ALTER TABLE `pages_2024_10`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2024_12`
--
ALTER TABLE `pages_2024_12`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_2025_01`
--
ALTER TABLE `pages_2025_01`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `publish_dates`
--
ALTER TABLE `publish_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `editions`
--
ALTER TABLE `editions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `edition_pages_2020_01`
--
ALTER TABLE `edition_pages_2020_01`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edition_pages_2020_02`
--
ALTER TABLE `edition_pages_2020_02`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `edition_pages_2020_05`
--
ALTER TABLE `edition_pages_2020_05`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `edition_pages_2024_07`
--
ALTER TABLE `edition_pages_2024_07`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `edition_pages_2024_08`
--
ALTER TABLE `edition_pages_2024_08`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `edition_pages_2024_10`
--
ALTER TABLE `edition_pages_2024_10`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `edition_pages_2024_12`
--
ALTER TABLE `edition_pages_2024_12`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `edition_pages_2025_01`
--
ALTER TABLE `edition_pages_2025_01`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `images_2020_01`
--
ALTER TABLE `images_2020_01`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_2020_02`
--
ALTER TABLE `images_2020_02`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `images_2020_05`
--
ALTER TABLE `images_2020_05`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_2024_07`
--
ALTER TABLE `images_2024_07`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `images_2024_08`
--
ALTER TABLE `images_2024_08`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `images_2024_10`
--
ALTER TABLE `images_2024_10`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `images_2024_12`
--
ALTER TABLE `images_2024_12`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `images_2025_01`
--
ALTER TABLE `images_2025_01`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pages_2020_01`
--
ALTER TABLE `pages_2020_01`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages_2020_02`
--
ALTER TABLE `pages_2020_02`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pages_2020_05`
--
ALTER TABLE `pages_2020_05`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages_2024_07`
--
ALTER TABLE `pages_2024_07`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pages_2024_08`
--
ALTER TABLE `pages_2024_08`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages_2024_10`
--
ALTER TABLE `pages_2024_10`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages_2024_12`
--
ALTER TABLE `pages_2024_12`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pages_2025_01`
--
ALTER TABLE `pages_2025_01`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `publish_dates`
--
ALTER TABLE `publish_dates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
