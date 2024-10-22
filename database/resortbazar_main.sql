-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 13, 2024 at 01:12 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resortbazar_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `bravo_airline`
--

CREATE TABLE `bravo_airline` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_airport`
--

CREATE TABLE `bravo_airport` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_attrs`
--

CREATE TABLE `bravo_attrs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_in_filter_search` tinyint DEFAULT NULL,
  `position` smallint DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_in_single` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_attrs`
--

INSERT INTO `bravo_attrs` (`id`, `name`, `slug`, `service`, `hide_in_filter_search`, `position`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `display_type`, `hide_in_single`) VALUES
(1, 'Property type', 'property-type', 'hotel', NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', NULL, NULL),
(2, 'Facilities', 'facilities', 'hotel', NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', NULL, NULL),
(3, 'Hotel Service', 'hotel-service', 'hotel', NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15', NULL, NULL),
(4, 'Room Amenities', 'room-amenities', 'hotel_room', NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_attrs_translations`
--

CREATE TABLE `bravo_attrs_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_boats`
--

CREATE TABLE `bravo_boats` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `number` tinyint DEFAULT NULL,
  `price_per_hour` decimal(12,2) DEFAULT NULL,
  `price_per_day` decimal(12,2) DEFAULT NULL,
  `min_price` decimal(12,2) DEFAULT NULL,
  `enable_extra_price` tinyint DEFAULT NULL,
  `extra_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `max_guest` int DEFAULT NULL,
  `cabin` int DEFAULT NULL,
  `length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancel_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `review_score` decimal(2,1) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_state` tinyint DEFAULT '1',
  `enable_service_fee` tinyint DEFAULT NULL,
  `service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `min_day_before_booking` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `include` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exclude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_time_booking` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time_booking` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_boat_dates`
--

CREATE TABLE `bravo_boat_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `target_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price_per_hour` decimal(12,2) DEFAULT NULL,
  `price_per_day` decimal(12,2) DEFAULT NULL,
  `number` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_boat_term`
--

CREATE TABLE `bravo_boat_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_boat_translations`
--

CREATE TABLE `bravo_boat_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `specs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancel_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `include` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exclude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_bookings`
--

CREATE TABLE `bravo_bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `gateway` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `total_guests` int DEFAULT NULL,
  `currency` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` decimal(10,2) DEFAULT NULL,
  `deposit_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `commission_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_commission` decimal(10,2) DEFAULT NULL,
  `agent_commission_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vendor_service_fee_amount` decimal(8,2) DEFAULT NULL,
  `vendor_service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buyer_fees` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_before_fees` decimal(10,2) DEFAULT NULL,
  `paid_vendor` tinyint DEFAULT NULL,
  `object_child_id` bigint DEFAULT NULL,
  `number` smallint DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `pay_now` decimal(10,2) DEFAULT NULL,
  `wallet_credit_used` double DEFAULT NULL,
  `wallet_total_used` double DEFAULT NULL,
  `wallet_transaction_id` bigint DEFAULT NULL,
  `is_refund_wallet` tinyint DEFAULT NULL,
  `is_paid` tinyint DEFAULT NULL,
  `total_before_discount` decimal(10,2) DEFAULT '0.00',
  `coupon_amount` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_bookings`
--

INSERT INTO `bravo_bookings` (`id`, `code`, `vendor_id`, `agent_id`, `customer_id`, `payment_id`, `gateway`, `object_id`, `object_model`, `start_date`, `end_date`, `total`, `total_guests`, `currency`, `status`, `deposit`, `deposit_type`, `commission`, `commission_type`, `agent_commission`, `agent_commission_type`, `email`, `first_name`, `last_name`, `phone`, `address`, `address2`, `city`, `state`, `zip_code`, `country`, `customer_notes`, `vendor_service_fee_amount`, `vendor_service_fee`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `buyer_fees`, `total_before_fees`, `paid_vendor`, `object_child_id`, `number`, `paid`, `pay_now`, `wallet_credit_used`, `wallet_total_used`, `wallet_transaction_id`, `is_refund_wallet`, `is_paid`, `total_before_discount`, `coupon_amount`) VALUES
(1, '22090a71fa7373f5adc21f502a2e65eb', 4, NULL, 1, NULL, NULL, 10, 'hotel', NULL, NULL, '1600.00', 1, NULL, 'draft', '800.00', NULL, '0.00', '', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', 1, NULL, NULL, '2024-04-02 13:38:03', '2024-04-02 13:38:03', '', '1600.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1600.00', '0.00'),
(2, '3912889cc7f6c40a46a3a51053a43200', 4, NULL, 1, NULL, 'offline_payment', 10, 'hotel', NULL, NULL, '2050.00', 2, NULL, 'processing', '0.00', NULL, '0.00', '', '0.00', '', 'administrator@test.com', 'administrator', '01', '112 666 888', 'Tarakandi, Manohardi, Narsingdi, Dhaka', 'Recusandae Sit dolo', 'Tarakandi', 'Dhaka', '1650', 'BD', 'Hello', '0.00', '\"\"', 1, 1, NULL, '2024-04-02 13:44:43', '2024-04-02 13:45:21', '', '2050.00', NULL, NULL, NULL, NULL, '2050.00', 0, 0, NULL, NULL, NULL, '2050.00', '0.00'),
(3, '8b5265e0274b3133c6b91151fdebb21f', 1, NULL, NULL, NULL, NULL, 9, 'hotel', NULL, NULL, '900.00', 1, NULL, 'draft', '450.00', NULL, '90.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-02 17:51:20', '2024-04-02 17:51:20', '', '900.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '900.00', '0.00'),
(4, 'bfc686386f1839a0411e03109c7ddd1f', 4, NULL, 1, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '2155.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', 1, NULL, NULL, '2024-04-03 22:14:38', '2024-04-03 22:14:38', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(5, '7a94c9f64b64d29a5f8915866d0c933e', 4, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '42800.00', 1, NULL, 'draft', NULL, NULL, '4270.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-04 18:40:57', '2024-04-04 18:40:57', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '42700.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42700.00', '0.00'),
(6, '861e10620495afc9c790129f11dd95f4', 4, NULL, 1, NULL, 'offline_payment', 10, 'hotel', NULL, NULL, '21450.00', 1, NULL, 'processing', NULL, NULL, '2135.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', 'administrator@test.com', 'ResortBazar', 'Administrator', '112 666 888', 'Tarakandi, Manohardi, Narsingdi, Dhaka', 'Recusandae Sit dolo', 'Tarakandi', 'Dhaka', '1650', 'BD', NULL, '0.00', '\"\"', 1, 1, NULL, '2024-04-04 22:33:04', '2024-04-04 22:33:38', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21350.00', NULL, NULL, NULL, NULL, '21450.00', 0, 0, NULL, NULL, NULL, '21350.00', '0.00'),
(7, 'ac26cee47623441690352eee601995e7', 1, NULL, NULL, NULL, 'offline_payment', 10, 'hotel', NULL, NULL, '26650.00', 1, NULL, 'processing', NULL, NULL, '2655.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', 'melonmia@gmail.com', 'Melonmia', 'l', '01575583122', 'Chalana,charsindur,palash,Narsingdi', 'Recusandae Sit dolo', 'Charsindur', 'Dhaka', '1612', 'BD', 'fghjk', '0.00', '\"\"', 8, NULL, NULL, '2024-04-05 20:02:07', '2024-04-05 20:03:02', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '26550.00', NULL, NULL, NULL, NULL, '26650.00', 0, 0, NULL, NULL, NULL, '26550.00', '0.00'),
(8, '3a4fe80a2f30dcc16387532457c557b0', 6, NULL, 1, NULL, NULL, 12, 'hotel', NULL, NULL, '341700.00', 1, NULL, 'draft', NULL, NULL, '34160.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', 1, NULL, NULL, '2024-04-05 20:17:14', '2024-04-05 20:17:14', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '341600.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '341600.00', '0.00'),
(9, '329b37fa104813388ad8fdff757c6962', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21450.00', 1, NULL, 'draft', NULL, NULL, '2135.00', '{\"amount\":\"10\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-05 20:25:51', '2024-04-05 20:25:51', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21350.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21350.00', '0.00'),
(10, '6054e38821e4704e0a518f1c4aa1f2fa', 6, NULL, NULL, NULL, NULL, 12, 'hotel', NULL, NULL, '372500.00', 1, NULL, 'draft', NULL, NULL, '74480.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-05 20:37:17', '2024-04-05 20:37:17', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '372400.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '372400.00', '0.00'),
(11, '68cde377789c4e2448976c6f64e08ebb', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '318800.00', 1, NULL, 'draft', NULL, NULL, '63740.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-06 07:46:52', '2024-04-06 07:46:52', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '318700.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '318700.00', '0.00'),
(12, '4ebbd4e7ff9de6ad5e8769c795b2058f', 6, NULL, NULL, NULL, NULL, 12, 'hotel', NULL, NULL, '555500.00', 1, NULL, 'draft', NULL, NULL, '111080.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-06 07:47:16', '2024-04-06 07:47:16', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '555400.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '555400.00', '0.00'),
(13, '9fcfe0c666daa7608665b80c2adb3089', 6, NULL, NULL, NULL, NULL, 12, 'hotel', NULL, NULL, '1342100.00', 1, NULL, 'draft', NULL, NULL, '268400.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-06 07:47:57', '2024-04-06 07:47:57', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '1342000.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1342000.00', '0.00'),
(14, 'c1d447d0e4734f1dbbb4aea3e6663ba6', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '96000.00', 1, NULL, 'draft', NULL, NULL, '19180.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-06 09:13:36', '2024-04-06 09:13:36', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '95900.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '95900.00', '0.00'),
(15, '1420feb69ca9fdcb1bdf5edeae39445d', 11, NULL, NULL, NULL, 'offline_payment', 15, 'hotel', NULL, NULL, '73300.00', 2, NULL, 'processing', NULL, NULL, '14640.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', 'test@gmail.com', 'test name', '1', '1234567890', 'dhaka', 'metro', 'dhaka', NULL, NULL, 'BD', 'none', '0.00', '\"\"', 12, NULL, NULL, '2024-04-24 18:22:48', '2024-04-24 18:27:06', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '73200.00', NULL, NULL, NULL, NULL, '73300.00', 0, 0, NULL, NULL, NULL, '73200.00', '0.00'),
(16, '99f583ddd5937398f139e507ef1be7d3', 7, NULL, NULL, NULL, NULL, 14, 'hotel', NULL, NULL, '61100.00', 1, NULL, 'draft', NULL, NULL, '12200.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-24 18:29:32', '2024-04-24 18:29:32', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '61000.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '61000.00', '0.00'),
(17, 'c0f674ec5b8f3c7f1136fd73c5910453', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '42650.00', 2, NULL, 'draft', NULL, NULL, '8510.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-25 17:37:36', '2024-04-25 17:37:36', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '42550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42550.00', '0.00'),
(18, '547a5fede74201cc37ae720047786904', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '41600.00', 2, NULL, 'draft', NULL, NULL, '8300.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-25 17:41:32', '2024-04-25 17:41:32', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '41500.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '41500.00', '0.00'),
(19, '575f0bf1b20b92b8ddadf18e21ca0a31', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 03:23:12', '2024-04-26 03:23:12', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(20, '64f194b28101348447bd4d6249fcd700', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21300.00', 1, NULL, 'draft', NULL, NULL, '4240.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 03:53:26', '2024-04-26 03:53:26', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21200.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21200.00', '0.00'),
(21, '2326e2fad72fa437c66f328384eb2f9d', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21300.00', 1, NULL, 'draft', NULL, NULL, '4240.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 03:55:29', '2024-04-26 03:55:29', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21200.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21200.00', '0.00'),
(22, '5e0acc53eae09046f9f2233e011ae036', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '22000.00', 1, NULL, 'draft', NULL, NULL, '4380.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 03:57:20', '2024-04-26 03:57:20', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21900.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21900.00', '0.00'),
(23, 'ab9b29f976b26fb21bd343c94f709766', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21300.00', 1, NULL, 'draft', NULL, NULL, '4240.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:03:10', '2024-04-26 04:03:10', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21200.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21200.00', '0.00'),
(24, '76808af1562857d3abac6de1c665c628', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:06:33', '2024-04-26 04:06:33', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(25, 'b8a80c39b54bcfed7fcf9c7379d30e40', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:11:20', '2024-04-26 04:11:20', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(26, 'de03a66eff118368cf8e97ae2f6e6a86', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:11:25', '2024-04-26 04:11:25', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(27, 'f5dfbf0b8d05c27a345018f4c78ecbb9', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:12:12', '2024-04-26 04:12:12', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(28, '81af8dddfa65140aba43002c1b78982e', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:13:01', '2024-04-26 04:13:01', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(29, '996ea1d878350e966daaaa929c73b690', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:13:55', '2024-04-26 04:13:55', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(30, 'b3e3a29ecaec3f98a83360382715b450', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:15:56', '2024-04-26 04:15:56', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(31, '927497eaf652defeb40160eb2b90e6ff', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:16:52', '2024-04-26 04:16:52', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(32, 'e038256863e3c47764afe0ab3412cb59', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:17:08', '2024-04-26 04:17:08', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(33, '1001101e86bc6c753e61ced76b52fcad', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:18:47', '2024-04-26 04:18:47', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(34, 'b459fd421b64dca68e2af046c6def37b', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '32150.00', 1, NULL, 'draft', NULL, NULL, '6410.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:22:30', '2024-04-26 04:22:30', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '32050.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32050.00', '0.00'),
(35, 'e4c2b82897530488fac984370df36d33', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:23:44', '2024-04-26 04:23:44', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(36, '3744eaf2cb627dfc91f31467d2c2e758', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:28:32', '2024-04-26 04:28:32', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(37, '2e04c3b004ba10b4cb0dfd0c612b8719', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:30:03', '2024-04-26 04:30:03', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(38, '0a5d9c19e1cf69b5839966c528c01fdd', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:32:07', '2024-04-26 04:32:07', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(39, '124b6da0d6da9684ee86ac6b19943e6b', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 04:34:12', '2024-04-26 04:34:12', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(40, '730e2cc5afa566d4ee5f01f9f16550a6', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '21650.00', 1, NULL, 'draft', NULL, NULL, '4310.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-26 10:11:33', '2024-04-26 10:11:33', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '21550.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21550.00', '0.00'),
(41, 'd8062cc073fafa1423f86cb9d8280e89', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '322300.00', 1, NULL, 'draft', NULL, NULL, '64440.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-27 08:44:35', '2024-04-27 08:44:35', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '322200.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '322200.00', '0.00'),
(42, '07c0c30f01789bbda7d96fe63e67eac8', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '318800.00', 1, NULL, 'draft', NULL, NULL, '63740.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-27 08:49:17', '2024-04-27 08:49:17', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '318700.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '318700.00', '0.00'),
(43, 'de95c318a90bdb3bcc4fe9fda0701c41', 1, NULL, NULL, NULL, NULL, 10, 'hotel', NULL, NULL, '10800.00', 1, NULL, 'draft', NULL, NULL, '2140.00', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', NULL, NULL, NULL, '2024-04-27 08:56:06', '2024-04-27 08:56:06', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', '10700.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10700.00', '0.00'),
(44, 'cab2cc995fcc00b52ccfe6ec21130efe', 12, NULL, 1, NULL, NULL, 1, 'car', '2024-04-30 00:00:00', '2024-05-02 00:00:00', '5988.00', 1, NULL, 'draft', NULL, NULL, '1197.60', '{\"amount\":\"20\",\"type\":\"percent\"}', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', '\"\"', 1, NULL, NULL, '2024-04-29 16:07:25', '2024-04-29 16:07:25', '', '5988.00', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5988.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_booking_coupons`
--

CREATE TABLE `bravo_booking_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` bigint DEFAULT NULL,
  `booking_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `object_model` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_amount` decimal(10,2) DEFAULT '0.00',
  `coupon_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_booking_meta`
--

CREATE TABLE `bravo_booking_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_booking_meta`
--

INSERT INTO `bravo_booking_meta` (`id`, `booking_id`, `name`, `val`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'duration', NULL, NULL, NULL, NULL, NULL),
(2, 1, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(3, 1, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(4, 1, 'guests', '1', NULL, NULL, NULL, NULL),
(5, 1, 'adults', '1', NULL, NULL, NULL, NULL),
(6, 1, 'children', '0', NULL, NULL, NULL, NULL),
(7, 1, 'extra_price', '[{\"name\":\"Service VIP \",\"price\":\"200\",\"type\":\"one_time\",\"total\":\"200\"}]', NULL, NULL, NULL, NULL),
(8, 1, 'deposit_info', '{\"type\":\"percent\",\"amount\":\"50\",\"fomular\":\"default\"}', NULL, NULL, NULL, NULL),
(9, 2, 'duration', NULL, NULL, NULL, NULL, NULL),
(10, 2, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(11, 2, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(12, 2, 'guests', '2', NULL, NULL, NULL, NULL),
(13, 2, 'adults', '2', NULL, NULL, NULL, NULL),
(14, 2, 'children', '0', NULL, NULL, NULL, NULL),
(15, 2, 'extra_price', '[{\"name\":\"Service VIP \",\"price\":\"200\",\"type\":\"one_time\",\"total\":\"200\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(16, 2, 'deposit_info', '{\"type\":\"percent\",\"amount\":\"50\",\"fomular\":\"default\"}', NULL, NULL, NULL, NULL),
(17, 2, 'old_deposit', '1025.00', NULL, NULL, NULL, NULL),
(18, 2, 'locale', 'en', NULL, NULL, NULL, NULL),
(19, 2, 'how_to_pay', 'full', NULL, NULL, NULL, NULL),
(20, 3, 'duration', NULL, NULL, NULL, NULL, NULL),
(21, 3, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(22, 3, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(23, 3, 'guests', '1', NULL, NULL, NULL, NULL),
(24, 3, 'adults', '1', NULL, NULL, NULL, NULL),
(25, 3, 'children', '0', NULL, NULL, NULL, NULL),
(26, 3, 'extra_price', '[{\"name\":\"Service VIP \",\"price\":\"200\",\"type\":\"one_time\",\"total\":\"200\"}]', NULL, NULL, NULL, NULL),
(27, 3, 'deposit_info', '{\"type\":\"percent\",\"amount\":\"50\",\"fomular\":\"default\"}', NULL, NULL, NULL, NULL),
(28, 4, 'duration', NULL, NULL, NULL, NULL, NULL),
(29, 4, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(30, 4, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(31, 4, 'guests', '1', NULL, NULL, NULL, NULL),
(32, 4, 'adults', '1', NULL, NULL, NULL, NULL),
(33, 4, 'children', '0', NULL, NULL, NULL, NULL),
(34, 4, 'extra_price', '[{\"name\":\"Service VIP \",\"price\":\"200\",\"type\":\"one_time\",\"total\":\"200\"}]', NULL, NULL, NULL, NULL),
(35, 5, 'duration', NULL, NULL, NULL, NULL, NULL),
(36, 5, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(37, 5, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(38, 5, 'guests', '1', NULL, NULL, NULL, NULL),
(39, 5, 'adults', '1', NULL, NULL, NULL, NULL),
(40, 5, 'children', '0', NULL, NULL, NULL, NULL),
(41, 5, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(42, 6, 'duration', NULL, NULL, NULL, NULL, NULL),
(43, 6, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(44, 6, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(45, 6, 'guests', '1', NULL, NULL, NULL, NULL),
(46, 6, 'adults', '1', NULL, NULL, NULL, NULL),
(47, 6, 'children', '0', NULL, NULL, NULL, NULL),
(48, 6, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(49, 6, 'locale', 'en', NULL, NULL, NULL, NULL),
(50, 6, 'how_to_pay', '', NULL, NULL, NULL, NULL),
(51, 7, 'duration', NULL, NULL, NULL, NULL, NULL),
(52, 7, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(53, 7, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(54, 7, 'guests', '1', NULL, NULL, NULL, NULL),
(55, 7, 'adults', '1', NULL, NULL, NULL, NULL),
(56, 7, 'children', '0', NULL, NULL, NULL, NULL),
(57, 7, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"1 person\",\"price\":\"200\",\"type\":\"per_day\",\"total\":6200},{\"name\":\"2 person\",\"price\":\"300\",\"type\":\"per_day\",\"total\":9300}]', NULL, NULL, NULL, NULL),
(58, 7, 'locale', 'en', NULL, NULL, NULL, NULL),
(59, 7, 'how_to_pay', '', NULL, NULL, NULL, NULL),
(60, 8, 'duration', NULL, NULL, NULL, NULL, NULL),
(61, 8, 'base_price', '5000.00', NULL, NULL, NULL, NULL),
(62, 8, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(63, 8, 'guests', '1', NULL, NULL, NULL, NULL),
(64, 8, 'adults', '1', NULL, NULL, NULL, NULL),
(65, 8, 'children', '0', NULL, NULL, NULL, NULL),
(66, 8, 'extra_price', '[{\"name\":\"Room Service\",\"price\":\"100\",\"type\":\"per_day\",\"per_person\":\"on\",\"total\":6100}]', NULL, NULL, NULL, NULL),
(67, 9, 'duration', NULL, NULL, NULL, NULL, NULL),
(68, 9, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(69, 9, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(70, 9, 'guests', '1', NULL, NULL, NULL, NULL),
(71, 9, 'adults', '1', NULL, NULL, NULL, NULL),
(72, 9, 'children', '0', NULL, NULL, NULL, NULL),
(73, 9, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(74, 10, 'duration', NULL, NULL, NULL, NULL, NULL),
(75, 10, 'base_price', '5000.00', NULL, NULL, NULL, NULL),
(76, 10, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(77, 10, 'guests', '1', NULL, NULL, NULL, NULL),
(78, 10, 'adults', '1', NULL, NULL, NULL, NULL),
(79, 10, 'children', '0', NULL, NULL, NULL, NULL),
(80, 10, 'extra_price', '[{\"name\":\"Room Service\",\"price\":\"100\",\"type\":\"per_day\",\"per_person\":\"on\",\"total\":6100},{\"name\":\"1 person Extra\",\"price\":\"500\",\"type\":\"per_day\",\"total\":30500},{\"name\":\"Candle Light Dinner\",\"price\":\"300\",\"type\":\"one_time\",\"total\":\"300\"}]', NULL, NULL, NULL, NULL),
(81, 11, 'duration', NULL, NULL, NULL, NULL, NULL),
(82, 11, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(83, 11, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(84, 11, 'guests', '1', NULL, NULL, NULL, NULL),
(85, 11, 'adults', '1', NULL, NULL, NULL, NULL),
(86, 11, 'children', '0', NULL, NULL, NULL, NULL),
(87, 11, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(88, 12, 'duration', NULL, NULL, NULL, NULL, NULL),
(89, 12, 'base_price', '5000.00', NULL, NULL, NULL, NULL),
(90, 12, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(91, 12, 'guests', '1', NULL, NULL, NULL, NULL),
(92, 12, 'adults', '1', NULL, NULL, NULL, NULL),
(93, 12, 'children', '0', NULL, NULL, NULL, NULL),
(94, 12, 'extra_price', '[{\"name\":\"Room Service\",\"price\":\"100\",\"type\":\"per_day\",\"per_person\":\"on\",\"total\":9100},{\"name\":\"1 person Extra\",\"price\":\"500\",\"type\":\"per_day\",\"total\":45500},{\"name\":\"Candle Light Dinner\",\"price\":\"300\",\"type\":\"one_time\",\"total\":\"300\"}]', NULL, NULL, NULL, NULL),
(95, 13, 'duration', NULL, NULL, NULL, NULL, NULL),
(96, 13, 'base_price', '5000.00', NULL, NULL, NULL, NULL),
(97, 13, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(98, 13, 'guests', '1', NULL, NULL, NULL, NULL),
(99, 13, 'adults', '1', NULL, NULL, NULL, NULL),
(100, 13, 'children', '0', NULL, NULL, NULL, NULL),
(101, 13, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(102, 14, 'duration', NULL, NULL, NULL, NULL, NULL),
(103, 14, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(104, 14, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(105, 14, 'guests', '1', NULL, NULL, NULL, NULL),
(106, 14, 'adults', '1', NULL, NULL, NULL, NULL),
(107, 14, 'children', '0', NULL, NULL, NULL, NULL),
(108, 14, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(109, 15, 'duration', NULL, NULL, NULL, NULL, NULL),
(110, 15, 'base_price', NULL, NULL, NULL, NULL, NULL),
(111, 15, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(112, 15, 'guests', '2', NULL, NULL, NULL, NULL),
(113, 15, 'adults', '2', NULL, NULL, NULL, NULL),
(114, 15, 'children', '0', NULL, NULL, NULL, NULL),
(115, 15, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(116, 15, 'locale', 'en', NULL, NULL, NULL, NULL),
(117, 15, 'how_to_pay', '', NULL, NULL, NULL, NULL),
(118, 16, 'duration', NULL, NULL, NULL, NULL, NULL),
(119, 16, 'base_price', NULL, NULL, NULL, NULL, NULL),
(120, 16, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(121, 16, 'guests', '1', NULL, NULL, NULL, NULL),
(122, 16, 'adults', '1', NULL, NULL, NULL, NULL),
(123, 16, 'children', '0', NULL, NULL, NULL, NULL),
(124, 16, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(125, 17, 'duration', NULL, NULL, NULL, NULL, NULL),
(126, 17, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(127, 17, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(128, 17, 'guests', '2', NULL, NULL, NULL, NULL),
(129, 17, 'adults', '2', NULL, NULL, NULL, NULL),
(130, 17, 'children', '0', NULL, NULL, NULL, NULL),
(131, 17, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(132, 18, 'duration', NULL, NULL, NULL, NULL, NULL),
(133, 18, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(134, 18, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(135, 18, 'guests', '2', NULL, NULL, NULL, NULL),
(136, 18, 'adults', '2', NULL, NULL, NULL, NULL),
(137, 18, 'children', '0', NULL, NULL, NULL, NULL),
(138, 18, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(139, 19, 'duration', NULL, NULL, NULL, NULL, NULL),
(140, 19, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(141, 19, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(142, 19, 'guests', '1', NULL, NULL, NULL, NULL),
(143, 19, 'adults', '1', NULL, NULL, NULL, NULL),
(144, 19, 'children', '0', NULL, NULL, NULL, NULL),
(145, 19, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(146, 20, 'duration', NULL, NULL, NULL, NULL, NULL),
(147, 20, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(148, 20, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(149, 20, 'guests', '1', NULL, NULL, NULL, NULL),
(150, 20, 'adults', '1', NULL, NULL, NULL, NULL),
(151, 20, 'children', '0', NULL, NULL, NULL, NULL),
(152, 20, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(153, 21, 'duration', NULL, NULL, NULL, NULL, NULL),
(154, 21, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(155, 21, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(156, 21, 'guests', '1', NULL, NULL, NULL, NULL),
(157, 21, 'adults', '1', NULL, NULL, NULL, NULL),
(158, 21, 'children', '0', NULL, NULL, NULL, NULL),
(159, 21, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(160, 22, 'duration', NULL, NULL, NULL, NULL, NULL),
(161, 22, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(162, 22, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(163, 22, 'guests', '1', NULL, NULL, NULL, NULL),
(164, 22, 'adults', '1', NULL, NULL, NULL, NULL),
(165, 22, 'children', '0', NULL, NULL, NULL, NULL),
(166, 22, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(167, 23, 'duration', NULL, NULL, NULL, NULL, NULL),
(168, 23, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(169, 23, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(170, 23, 'guests', '1', NULL, NULL, NULL, NULL),
(171, 23, 'adults', '1', NULL, NULL, NULL, NULL),
(172, 23, 'children', '0', NULL, NULL, NULL, NULL),
(173, 23, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(174, 24, 'duration', NULL, NULL, NULL, NULL, NULL),
(175, 24, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(176, 24, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(177, 24, 'guests', '1', NULL, NULL, NULL, NULL),
(178, 24, 'adults', '1', NULL, NULL, NULL, NULL),
(179, 24, 'children', '0', NULL, NULL, NULL, NULL),
(180, 24, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(181, 25, 'duration', NULL, NULL, NULL, NULL, NULL),
(182, 25, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(183, 25, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(184, 25, 'guests', '1', NULL, NULL, NULL, NULL),
(185, 25, 'adults', '1', NULL, NULL, NULL, NULL),
(186, 25, 'children', '0', NULL, NULL, NULL, NULL),
(187, 25, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(188, 26, 'duration', NULL, NULL, NULL, NULL, NULL),
(189, 26, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(190, 26, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(191, 26, 'guests', '1', NULL, NULL, NULL, NULL),
(192, 26, 'adults', '1', NULL, NULL, NULL, NULL),
(193, 26, 'children', '0', NULL, NULL, NULL, NULL),
(194, 26, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(195, 27, 'duration', NULL, NULL, NULL, NULL, NULL),
(196, 27, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(197, 27, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(198, 27, 'guests', '1', NULL, NULL, NULL, NULL),
(199, 27, 'adults', '1', NULL, NULL, NULL, NULL),
(200, 27, 'children', '0', NULL, NULL, NULL, NULL),
(201, 27, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(202, 28, 'duration', NULL, NULL, NULL, NULL, NULL),
(203, 28, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(204, 28, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(205, 28, 'guests', '1', NULL, NULL, NULL, NULL),
(206, 28, 'adults', '1', NULL, NULL, NULL, NULL),
(207, 28, 'children', '0', NULL, NULL, NULL, NULL),
(208, 28, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(209, 29, 'duration', NULL, NULL, NULL, NULL, NULL),
(210, 29, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(211, 29, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(212, 29, 'guests', '1', NULL, NULL, NULL, NULL),
(213, 29, 'adults', '1', NULL, NULL, NULL, NULL),
(214, 29, 'children', '0', NULL, NULL, NULL, NULL),
(215, 29, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(216, 30, 'duration', NULL, NULL, NULL, NULL, NULL),
(217, 30, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(218, 30, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(219, 30, 'guests', '1', NULL, NULL, NULL, NULL),
(220, 30, 'adults', '1', NULL, NULL, NULL, NULL),
(221, 30, 'children', '0', NULL, NULL, NULL, NULL),
(222, 30, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(223, 31, 'duration', NULL, NULL, NULL, NULL, NULL),
(224, 31, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(225, 31, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(226, 31, 'guests', '1', NULL, NULL, NULL, NULL),
(227, 31, 'adults', '1', NULL, NULL, NULL, NULL),
(228, 31, 'children', '0', NULL, NULL, NULL, NULL),
(229, 31, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(230, 32, 'duration', NULL, NULL, NULL, NULL, NULL),
(231, 32, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(232, 32, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(233, 32, 'guests', '1', NULL, NULL, NULL, NULL),
(234, 32, 'adults', '1', NULL, NULL, NULL, NULL),
(235, 32, 'children', '0', NULL, NULL, NULL, NULL),
(236, 32, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(237, 33, 'duration', NULL, NULL, NULL, NULL, NULL),
(238, 33, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(239, 33, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(240, 33, 'guests', '1', NULL, NULL, NULL, NULL),
(241, 33, 'adults', '1', NULL, NULL, NULL, NULL),
(242, 33, 'children', '0', NULL, NULL, NULL, NULL),
(243, 33, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(244, 34, 'duration', NULL, NULL, NULL, NULL, NULL),
(245, 34, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(246, 34, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(247, 34, 'guests', '1', NULL, NULL, NULL, NULL),
(248, 34, 'adults', '1', NULL, NULL, NULL, NULL),
(249, 34, 'children', '0', NULL, NULL, NULL, NULL),
(250, 34, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(251, 35, 'duration', NULL, NULL, NULL, NULL, NULL),
(252, 35, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(253, 35, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(254, 35, 'guests', '1', NULL, NULL, NULL, NULL),
(255, 35, 'adults', '1', NULL, NULL, NULL, NULL),
(256, 35, 'children', '0', NULL, NULL, NULL, NULL),
(257, 35, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(258, 36, 'duration', NULL, NULL, NULL, NULL, NULL),
(259, 36, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(260, 36, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(261, 36, 'guests', '1', NULL, NULL, NULL, NULL),
(262, 36, 'adults', '1', NULL, NULL, NULL, NULL),
(263, 36, 'children', '0', NULL, NULL, NULL, NULL),
(264, 36, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(265, 37, 'duration', NULL, NULL, NULL, NULL, NULL),
(266, 37, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(267, 37, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(268, 37, 'guests', '1', NULL, NULL, NULL, NULL),
(269, 37, 'adults', '1', NULL, NULL, NULL, NULL),
(270, 37, 'children', '0', NULL, NULL, NULL, NULL),
(271, 37, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(272, 38, 'duration', NULL, NULL, NULL, NULL, NULL),
(273, 38, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(274, 38, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(275, 38, 'guests', '1', NULL, NULL, NULL, NULL),
(276, 38, 'adults', '1', NULL, NULL, NULL, NULL),
(277, 38, 'children', '0', NULL, NULL, NULL, NULL),
(278, 38, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(279, 39, 'duration', NULL, NULL, NULL, NULL, NULL),
(280, 39, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(281, 39, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(282, 39, 'guests', '1', NULL, NULL, NULL, NULL),
(283, 39, 'adults', '1', NULL, NULL, NULL, NULL),
(284, 39, 'children', '0', NULL, NULL, NULL, NULL),
(285, 39, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(286, 40, 'duration', NULL, NULL, NULL, NULL, NULL),
(287, 40, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(288, 40, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(289, 40, 'guests', '1', NULL, NULL, NULL, NULL),
(290, 40, 'adults', '1', NULL, NULL, NULL, NULL),
(291, 40, 'children', '0', NULL, NULL, NULL, NULL),
(292, 40, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(293, 41, 'duration', NULL, NULL, NULL, NULL, NULL),
(294, 41, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(295, 41, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(296, 41, 'guests', '1', NULL, NULL, NULL, NULL),
(297, 41, 'adults', '1', NULL, NULL, NULL, NULL),
(298, 41, 'children', '0', NULL, NULL, NULL, NULL),
(299, 41, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(300, 42, 'duration', NULL, NULL, NULL, NULL, NULL),
(301, 42, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(302, 42, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(303, 42, 'guests', '1', NULL, NULL, NULL, NULL),
(304, 42, 'adults', '1', NULL, NULL, NULL, NULL),
(305, 42, 'children', '0', NULL, NULL, NULL, NULL),
(306, 42, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(307, 43, 'duration', NULL, NULL, NULL, NULL, NULL),
(308, 43, 'base_price', '550.00', NULL, NULL, NULL, NULL),
(309, 43, 'sale_price', NULL, NULL, NULL, NULL, NULL),
(310, 43, 'guests', '1', NULL, NULL, NULL, NULL),
(311, 43, 'adults', '1', NULL, NULL, NULL, NULL),
(312, 43, 'children', '0', NULL, NULL, NULL, NULL),
(313, 43, 'extra_price', '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\",\"total\":\"100\"}]', NULL, NULL, NULL, NULL),
(314, 44, 'duration', NULL, NULL, NULL, NULL, NULL),
(315, 44, 'base_price', '998', NULL, NULL, NULL, NULL),
(316, 44, 'sale_price', '12333', NULL, NULL, NULL, NULL),
(317, 44, 'extra_price', '[]', NULL, NULL, NULL, NULL),
(318, 44, 'tmp_dates', '{\"2024-04-30\":{\"number\":127,\"price\":998,\"status\":true},\"2024-05-01\":{\"number\":127,\"price\":998,\"status\":true},\"2024-05-02\":{\"number\":127,\"price\":998,\"status\":true}}', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_booking_passengers`
--

CREATE TABLE `bravo_booking_passengers` (
  `id` bigint UNSIGNED NOT NULL,
  `flight_id` int DEFAULT NULL,
  `flight_seat_id` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `seat_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `id_card` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_model` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_booking_passengers`
--

INSERT INTO `bravo_booking_passengers` (`id`, `flight_id`, `flight_seat_id`, `booking_id`, `seat_type`, `email`, `first_name`, `last_name`, `phone`, `dob`, `price`, `id_card`, `object_model`, `object_id`, `create_user`, `update_user`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, NULL, 6, NULL, '', '', '', '', NULL, NULL, NULL, '', NULL, 1, NULL, '2024-04-04 22:33:38', '2024-04-04 22:33:38', NULL),
(2, NULL, NULL, 7, NULL, 'eloas@gmail.com', 'ELIAS BHUIYAN', 'l', '234567', NULL, NULL, NULL, '', NULL, 8, NULL, '2024-04-05 20:03:02', '2024-04-05 20:03:02', NULL),
(3, NULL, NULL, 15, NULL, '', '', '', '', NULL, NULL, NULL, '', NULL, 12, NULL, '2024-04-24 18:27:06', '2024-04-24 18:27:06', NULL),
(4, NULL, NULL, 15, NULL, 'sm@test.com', 'sm', 'shourov', '0168716071', NULL, NULL, NULL, '', NULL, 12, NULL, '2024-04-24 18:27:06', '2024-04-24 18:27:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_booking_payments`
--

CREATE TABLE `bravo_booking_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `object_model` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `booking_id` int DEFAULT NULL,
  `payment_gateway` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `converted_amount` decimal(10,2) DEFAULT NULL,
  `converted_currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `wallet_transaction_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_booking_payments`
--

INSERT INTO `bravo_booking_payments` (`id`, `code`, `object_id`, `object_model`, `meta`, `booking_id`, `payment_gateway`, `amount`, `currency`, `converted_amount`, `converted_currency`, `exchange_rate`, `status`, `logs`, `create_user`, `update_user`, `deleted_at`, `wallet_transaction_id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '6262305b6f61fe71a8e65f2108d7c3b9', 2, 'plan', NULL, NULL, 'offline_payment', '499.00', NULL, NULL, NULL, NULL, 'completed', '\"\"', 6, 1, NULL, NULL, '2024-04-05 18:36:13', '2024-04-05 20:29:22', 6);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_booking_payment_meta`
--

CREATE TABLE `bravo_booking_payment_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_booking_payment_meta`
--

INSERT INTO `bravo_booking_payment_meta` (`id`, `payment_id`, `name`, `val`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'user_request', '6', 6, NULL, '2024-04-05 18:36:13', '2024-04-05 18:36:13'),
(2, 1, 'annual', '0', 6, NULL, '2024-04-05 18:36:13', '2024-04-05 18:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_booking_time_slots`
--

CREATE TABLE `bravo_booking_time_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `booking_id` int DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `object_model` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration` double(255,2) DEFAULT NULL,
  `duration_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_cars`
--

CREATE TABLE `bravo_cars` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `number` tinyint DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `is_instant` tinyint DEFAULT '0',
  `enable_extra_price` tinyint DEFAULT NULL,
  `extra_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_by_days` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `passenger` tinyint DEFAULT '0',
  `gear` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `baggage` tinyint DEFAULT '0',
  `door` tinyint DEFAULT '0',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_state` tinyint DEFAULT '1',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `review_score` decimal(2,1) DEFAULT NULL,
  `enable_service_fee` tinyint DEFAULT NULL,
  `service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author_id` bigint DEFAULT NULL,
  `ical_import_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_day_before_booking` int DEFAULT NULL,
  `min_day_stays` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_cars`
--

INSERT INTO `bravo_cars` (`id`, `title`, `slug`, `content`, `image_id`, `banner_image_id`, `location_id`, `address`, `map_lat`, `map_lng`, `map_zoom`, `is_featured`, `gallery`, `video`, `faqs`, `number`, `price`, `sale_price`, `is_instant`, `enable_extra_price`, `extra_price`, `discount_by_days`, `passenger`, `gear`, `baggage`, `door`, `status`, `default_state`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `review_score`, `enable_service_fee`, `service_fee`, `author_id`, `ical_import_url`, `min_day_before_booking`, `min_day_stays`) VALUES
(1, 'New', 'new', '<p>New BMW S-12</p>', 157, 161, 1, 'Chalana,charsindur,palash,Narsingdi', NULL, NULL, 8, 1, NULL, NULL, NULL, 127, '998.00', '12333.00', NULL, NULL, NULL, NULL, 5, 'Auto', 4, 2, 'publish', 0, 1, 1, NULL, '2024-04-29 16:00:28', '2024-04-30 06:43:09', '5.0', NULL, NULL, NULL, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_car_dates`
--

CREATE TABLE `bravo_car_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `target_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `number` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_instant` tinyint DEFAULT '0',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_car_dates`
--

INSERT INTO `bravo_car_dates` (`id`, `target_id`, `start_date`, `end_date`, `price`, `number`, `active`, `note_to_customer`, `note_to_admin`, `is_instant`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-04-28 18:00:00', '2024-04-28 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:04:48', '2024-04-29 16:04:48'),
(2, 1, '2024-04-29 18:00:00', '2024-04-29 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:05:58', '2024-04-29 16:05:58'),
(3, 1, '2024-04-30 18:00:00', '2024-04-30 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:06:03', '2024-04-29 16:06:03'),
(4, 1, '2024-06-04 18:00:00', '2024-06-04 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:06:08', '2024-04-29 16:06:08'),
(5, 1, '2024-05-01 18:00:00', '2024-05-01 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:06:12', '2024-04-29 16:06:12'),
(6, 1, '2024-07-27 18:00:00', '2024-07-27 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:08:16', '2024-04-29 16:08:16'),
(7, 1, '2024-07-28 18:00:00', '2024-07-28 18:00:00', '998.00', 127, 1, NULL, NULL, NULL, 1, NULL, '2024-04-29 16:08:20', '2024-04-29 16:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_car_term`
--

CREATE TABLE `bravo_car_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_car_translations`
--

CREATE TABLE `bravo_car_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_contact`
--

CREATE TABLE `bravo_contact` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_contact`
--

INSERT INTO `bravo_contact` (`id`, `name`, `email`, `message`, `status`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'Aaliyah Kevin', 'kevin.aaliyah24@googlemail.com', 'Signal 2 Noise (S2N) is a daily investment newsletter sharing high probability trading signals researched by Michael Berman, Ph.D. a 30-year trading veteran.\r\n\r\nEnjoy a 30-day FREE trial with no credit card required at https://www.signal2noise.news/', 'sent', NULL, NULL, NULL, '2024-04-05 08:58:48', '2024-04-05 08:58:48', '6049103314'),
(2, 'Mike Kingsman', 'mikebreesy@gmail.com', 'Hi \r\n \r\nThis is Mike Kingsman\r\n \r\nLet me present you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your resortbazar.com SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Kingsman\r\n \r\nmike@strictlydigital.net', 'sent', NULL, NULL, NULL, '2024-04-06 12:20:48', '2024-04-06 12:20:48', '89728389788'),
(3, 'Irving Malin', 'irving.malin57@gmail.com', 'Hey, it\'s been a proper rollercoaster journey for me,\r\n\r\nbut finally I\'ve managed to build platform connecting ppl with mobile car valeters (think Uber Eats for car cleaning!). Came upon your site & thought you might like the idea.\r\n\r\nDw I\'m not about to sell you backlinks or a cheap website. lol\r\n\r\nIn 2 weeks I\'ve launched a full MVP - valeters can accept online bookings & payments (I take an 18% cut). Also I\'ve automated free listings for UK valeting companies, already indexed & ranking on Google.\r\n\r\nAs a fellow founder, I know you know the challenges with new companies. I\'m basically looking to raise £60k for 15% equity to fuel growth.\r\n\r\nIf keen, let\'s chat more on a call. No pressure tho. Worst case, we can swap founder war stories! Always appreciate advice.\r\n\r\nThanks for your time mate, I know it\'s precious!\r\n\r\nCheers,\r\nJack\r\njack@wearepython.com', 'sent', NULL, NULL, NULL, '2024-04-07 01:53:42', '2024-04-07 01:53:42', '1147279453'),
(4, 'Mike Keat', 'mikeZoolojeply@gmail.com', 'This service is perfect for boosting your local business\' visibility on the map in a specific location. \r\n \r\nWe provide Google Maps listing management, optimization, and promotion services that cover everything needed to rank in the Google 3-Pack. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/ranking-in-the-maps-means-sales/ \r\n \r\n \r\nThanks and Regards \r\nMike Keat\r\n \r\n \r\nPS: Want a ONE-TIME comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 'sent', NULL, NULL, NULL, '2024-04-09 14:21:23', '2024-04-09 14:21:23', '88848341457'),
(5, 'Phil Stewart', 'noreplyhere@aol.com', 'Want Your Ad Everywhere? Reach Millions Instantly! For less than $100 I can blast your message to website contact forms globally. Contact me via skype or email below for info\r\n\r\nP. Stewart\r\nEmail: r2h0fg@mail-to-form.xyz\r\nSkype: form-blasting', 'sent', NULL, NULL, NULL, '2024-04-15 23:21:01', '2024-04-15 23:21:01', '342-123-4456'),
(6, 'Mike Phillips', 'mikeVIONGEMN@gmail.com', 'Hi there \r\n \r\nJust checked your resortbazar.com baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Phillips\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 'sent', NULL, NULL, NULL, '2024-04-17 06:21:01', '2024-04-17 06:21:01', '81527233379'),
(7, 'Mike Russel', 'mikeGoxy@gmail.com', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Russel\r\n \r\nMonkey Digital', 'sent', NULL, NULL, NULL, '2024-04-18 20:12:05', '2024-04-18 20:12:05', '88224943829'),
(8, 'Dustie', 'qwtwptcmbj.m@sandcress.xyz', 'Dustie Primozic', 'sent', 9, NULL, NULL, '2024-04-20 16:38:04', '2024-04-20 16:38:04', '337-606-41-49'),
(9, 'Temeka Purdy', 'admin@charterunionfin.com', 'Do not stay out of business, or close down due to lack of Funding and finance. Your projects, businesses and financial needs is completely possible.\r\n\r\nYou can now fund your projects, businesses without worries of repayment as you can have ample amount of time to execute your projects and businesses and build up, grow financially, to achieve your complete set goals.\r\n\r\nAre you also a broker/consultant? Make life easy for various of your clients globlly to help provide funding for their various Businesses and Projects, edging them towards a better buiness and financial goals.\r\n\r\nChu Yeung\r\nCustomer Care Department\r\ninfo@charterunionfin.com\r\n+852 8199 9324', 'sent', NULL, NULL, NULL, '2024-04-24 00:30:36', '2024-04-24 00:30:36', '450141812'),
(10, 'Mike Berrington', 'mikepoirmmype@gmail.com', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Berrington', 'sent', NULL, NULL, NULL, '2024-04-25 06:22:10', '2024-04-25 06:22:10', '81489353899');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_coupons`
--

CREATE TABLE `bravo_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `min_total` double(8,2) DEFAULT NULL,
  `max_total` double(8,2) DEFAULT NULL,
  `services` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_for_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_limit` int DEFAULT NULL,
  `limit_per_user` int DEFAULT NULL,
  `image_id` bigint DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_coupon_services`
--

CREATE TABLE `bravo_coupon_services` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `object_model` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_enquiries`
--

CREATE TABLE `bravo_enquiries` (
  `id` bigint UNSIGNED NOT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vendor_id` bigint DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_enquiry_replies`
--

CREATE TABLE `bravo_enquiry_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_events`
--

CREATE TABLE `bravo_events` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ticket_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `duration` int DEFAULT NULL,
  `start_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `is_instant` tinyint DEFAULT '0',
  `enable_extra_price` tinyint DEFAULT NULL,
  `extra_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `review_score` decimal(2,1) DEFAULT NULL,
  `ical_import_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_state` tinyint DEFAULT '1',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enable_service_fee` tinyint DEFAULT NULL,
  `service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_event_dates`
--

CREATE TABLE `bravo_event_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `target_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `ticket_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_instant` tinyint DEFAULT '0',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_event_term`
--

CREATE TABLE `bravo_event_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_event_translations`
--

CREATE TABLE `bravo_event_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_flight`
--

CREATE TABLE `bravo_flight` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_score` decimal(2,1) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `duration` double(8,2) DEFAULT NULL,
  `min_price` decimal(12,2) DEFAULT NULL,
  `airport_to` int DEFAULT NULL,
  `airport_from` int DEFAULT NULL,
  `airline_id` int DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_flight_seat`
--

CREATE TABLE `bravo_flight_seat` (
  `id` bigint UNSIGNED NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `max_passengers` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  `seat_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `baggage_check_in` int DEFAULT NULL,
  `baggage_cabin` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_flight_term`
--

CREATE TABLE `bravo_flight_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotels`
--

CREATE TABLE `bravo_hotels` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `star_rate` smallint DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `check_in_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_full_day` smallint DEFAULT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `review_score` decimal(2,1) DEFAULT NULL,
  `ical_import_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_extra_price` tinyint DEFAULT NULL,
  `extra_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enable_service_fee` tinyint DEFAULT NULL,
  `service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author_id` bigint DEFAULT NULL,
  `min_day_before_booking` int DEFAULT NULL,
  `min_day_stays` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_hotels`
--

INSERT INTO `bravo_hotels` (`id`, `title`, `slug`, `content`, `image_id`, `banner_image_id`, `location_id`, `address`, `map_lat`, `map_lng`, `map_zoom`, `is_featured`, `gallery`, `video`, `policy`, `star_rate`, `price`, `check_in_time`, `check_out_time`, `allow_full_day`, `sale_price`, `status`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `review_score`, `ical_import_url`, `enable_extra_price`, `extra_price`, `enable_service_fee`, `service_fee`, `surrounding`, `author_id`, `min_day_before_booking`, `min_day_stays`) VALUES
(9, 'Parian Holiday Villas', 'parian-holiday-villas', '<p>Built in 1986, Hotel Stanford is a distinct addition to New York (NY) and a smart choice for travelers. The excitement of the city center is only 0 KM away. No less exceptional is the hotel’s easy access to the city’s myriad attractions and landmarks, such as Toto Music Studio, British Virgin Islands Tourist Board, L’Atelier Du Chocolat. Start and end in San Francisco! With the in-depth cultural tour Northern California Summer 2019, you have a 8 day tour package taking you through San Francisco, USA and 9 other destinations in USA. Northern California Summer 2019 includes accommodation as well as an expert guide, meals, transport and more.</p><h4>HIGHLIGHTS</h4><ul><li>Visit the Museum of Modern Art in Manhattan</li><li>See amazing works of contemporary art, including Vincent van Gogh\'s The Starry Night</li><li>Check out Campbell\'s Soup Cans by Warhol and The Dance (I) by Matisse</li><li>Behold masterpieces by Gauguin, Dali, Picasso, and Pollock</li><li>Enjoy free audio guides available in English, French, German, Italian, Spanish, Portuguese</li></ul>', 75, 94, 1, 'Regal Cinemas Battery Park', '19.161637', '72.997510', 12, 1, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '[{\"title\":\"Guarantee Policy\",\"content\":\"- A valid credit card will be required upon booking;\\r\\n- For credit card reservations, the same card(s) must be presented upon check in at the respective hotels;\\r\\n- Management reserves the right to cancel any reservations without notice if we are notified of any fraud or illegal activities associated with the full payments received.\"},{\"title\":\"Children Policy\",\"content\":\"- Child under 5-year old: free of charge.\\r\\n- Child from 5-year old to under 12-year old: surcharge $10\\/person\\/room\\/night.\\r\\n- Child from 12-year old or extra Adult: surcharge $15\\/person\\/room\\/night.\"},{\"title\":\"Cancellation\\/Amendment Policy\",\"content\":\"- If cancellation\\/amendment is made 72 hours prior to your arrival date, no fee will be charged.\\r\\n- If cancellation\\/amendment is made within 72 hours, including reservations made within 72 hours of your arrival, 1st night\\u2019s room rate and tax will be charged\\r\\n- In case of no-show, 100% room rate and tax will be charged.\\r\\n- Early Bird\\/Long Stay\\/Last Min\\/Package Rates are Non - changeable & Non - refundable\"},{\"title\":\"Late check-out policy\",\"content\":\"- Late check-out is subject to room availability\\r\\n- 12:00 to 17:00 check-out: 50% room rate surcharge\\r\\n- After 17:00 check-out: 100% room rate surcharge\"}]', 5, '550.00', '12:00AM', '11:00AM', NULL, NULL, 'draft', 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-04 23:20:34', '4.0', NULL, 1, '[{\"name\":\"Service VIP \",\"price\":\"200\",\"type\":\"one_time\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\"}]', NULL, NULL, NULL, 1, NULL, NULL),
(10, 'Dylan Hotel', 'dylan-hotel', '<p>Built in 1986, Hotel Stanford is a distinct addition to New York (NY) and a smart choice for travelers. The excitement of the city center is only 0 KM away. No less exceptional is the hotel&rsquo;s easy access to the city&rsquo;s myriad attractions and landmarks, such as Toto Music Studio, British Virgin Islands Tourist Board, L&rsquo;Atelier Du Chocolat. Start and end in San Francisco! With the in-depth cultural tour Northern California Summer 2019, you have a 8 day tour package taking you through San Francisco, USA and 9 other destinations in USA. Northern California Summer 2019 includes accommodation as well as an expert guide, meals, transport and more.</p>\r\n<h4>HIGHLIGHTS</h4>\r\n<ul>\r\n<li>Visit the Museum of Modern Art in Manhattan</li>\r\n<li>See amazing works of contemporary art, including Vincent van Gogh\'s The Starry Night</li>\r\n<li>Check out Campbell\'s Soup Cans by Warhol and The Dance (I) by Matisse</li>\r\n<li>Behold masterpieces by Gauguin, Dali, Picasso, and Pollock</li>\r\n<li>Enjoy free audio guides available in English, French, German, Italian, Spanish, Portuguese</li>\r\n</ul>', 64, 96, 2, 'house', '19.229727', '72.984470', 12, 1, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '[{\"title\":\"Guarantee Policy\",\"content\":\"- A valid credit card will be required upon booking;\\r\\n- For credit card reservations, the same card(s) must be presented upon check in at the respective hotels;\\r\\n- Management reserves the right to cancel any reservations without notice if we are notified of any fraud or illegal activities associated with the full payments received.\"},{\"title\":\"Children Policy\",\"content\":\"- Child under 5-year old: free of charge.\\r\\n- Child from 5-year old to under 12-year old: surcharge $10\\/person\\/room\\/night.\\r\\n- Child from 12-year old or extra Adult: surcharge $15\\/person\\/room\\/night.\"},{\"title\":\"Cancellation\\/Amendment Policy\",\"content\":\"- If cancellation\\/amendment is made 72 hours prior to your arrival date, no fee will be charged.\\r\\n- If cancellation\\/amendment is made within 72 hours, including reservations made within 72 hours of your arrival, 1st night\\u2019s room rate and tax will be charged\\r\\n- In case of no-show, 100% room rate and tax will be charged.\\r\\n- Early Bird\\/Long Stay\\/Last Min\\/Package Rates are Non - changeable & Non - refundable\"},{\"title\":\"Late check-out policy\",\"content\":\"- Late check-out is subject to room availability\\r\\n- 12:00 to 17:00 check-out: 50% room rate surcharge\\r\\n- After 17:00 check-out: 100% room rate surcharge\"}]', 5, '550.00', '12:00AM', '11:00AM', NULL, NULL, 'publish', 4, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:13:57', '5.0', NULL, 1, '[{\"name\":\"Service VIP\",\"price\":\"100\",\"type\":\"one_time\"},{\"name\":\"Breakfasts\",\"price\":\"100\",\"type\":\"one_time\"},{\"name\":\"1 person\",\"price\":\"200\",\"type\":\"per_day\"},{\"name\":\"2 person\",\"price\":\"300\",\"type\":\"per_day\"},{\"name\":null,\"price\":null,\"type\":\"one_time\"}]', NULL, NULL, NULL, 1, NULL, -1),
(12, 'Sailor Beach Resort', 'sailor-beach-resort', '<p>This is Resort Description</p>', NULL, 206, 2, 'Sugandha Beach Cox\'s Bazar', NULL, NULL, 8, NULL, NULL, NULL, NULL, 6, '5000.00', '12AM', '11AM', NULL, NULL, 'publish', 1, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 20:21:07', NULL, NULL, 1, '[{\"name\":\"Room Service\",\"price\":\"100\",\"type\":\"per_day\",\"per_person\":\"on\"},{\"name\":\"1 person Extra\",\"price\":\"500\",\"type\":\"per_day\"},{\"name\":\"Candle Light Dinner\",\"price\":\"300\",\"type\":\"one_time\"}]', NULL, NULL, NULL, 6, 1, 2),
(13, 'Hotel XYZ', 'hotel-xyz', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 206, 206, 2, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 4, NULL, '12', '11', NULL, NULL, 'publish', 6, 6, NULL, '2024-04-05 20:30:09', '2024-04-05 20:31:33', NULL, NULL, 1, '[{\"name\":\"Extra\",\"price\":\"496\",\"type\":\"one_time\"}]', NULL, NULL, NULL, 6, 1, 1),
(14, 'Hotel Air International', 'hotel-air-international', '<p>This is test Description</p>', 206, 214, 2, 'coxbazar', NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', 1, NULL, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(15, 'Hotel Singapore International', 'hotel-singapore-international', '<p>This is test hotel discription</p>', 218, 215, NULL, NULL, NULL, NULL, 8, NULL, '221,220,219,218,217,216,', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', 11, NULL, NULL, '2024-04-24 18:02:13', '2024-04-24 18:02:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_rooms`
--

CREATE TABLE `bravo_hotel_rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `number` smallint DEFAULT NULL,
  `beds` tinyint DEFAULT NULL,
  `size` int DEFAULT NULL,
  `adults` tinyint DEFAULT NULL,
  `children` tinyint DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ical_import_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_day_stays` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_hotel_rooms`
--

INSERT INTO `bravo_hotel_rooms` (`id`, `title`, `content`, `image_id`, `gallery`, `video`, `price`, `parent_id`, `number`, `beds`, `size`, `adults`, `children`, `status`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `ical_import_url`, `min_day_stays`) VALUES
(33, 'Room Kerama Islands', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 67, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 9, 5, 2, 200, 10, 4, 'publish', 1, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(34, 'Room Sheraton Hotel', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 69, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 9, 8, 3, 200, 5, 2, 'publish', 1, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(35, 'Double Room With Town View', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 64, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 9, 10, 5, 200, 8, 5, 'publish', 1, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(36, 'Standard Double Room', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 63, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 9, 6, 5, 200, 10, 5, 'publish', 1, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(37, 'Room Kerama Islands', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 67, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 10, 7, 4, 200, 8, 3, 'publish', 4, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(38, 'Room Sheraton Hotel', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 69, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 10, 5, 2, 200, 10, 1, 'publish', 4, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(39, 'Double Room With Town View', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 64, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 10, 5, 3, 200, 7, 3, 'publish', 4, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(40, 'Standard Double Room', 'Room Sheraton comprises of 1 Double Bed or 2 Twin Beds, 2 Bedside Tables, a Desk & Chair. The room is furnished with wall to wall carpeting, trendy furnishings and a balcony.Our ultramodern glass bathroom is equipped with hairdryer, magnifying shaving and make up mirror as well as all the amenities you could possible need during your stay.A Complimentary Bottle of Wine, Fresh Fruit and Mineral Water, are provided on arrival. Electric current: 220 Volts. Smoking rooms & inter-connecting rooms are also available.', 63, '97,98,99,100,101,102', 'https://www.youtube.com/watch?v=bhOiLfkChPo', '350.00', 10, 5, 5, 200, 5, 5, 'publish', 4, NULL, NULL, '2024-04-02 07:17:15', NULL, NULL, NULL),
(45, 'lake view', NULL, NULL, NULL, NULL, '3500.00', 10, 6, 2, 200, 4, 0, 'publish', 1, NULL, NULL, '2024-04-05 18:04:47', '2024-04-05 18:04:47', NULL, NULL),
(46, 'Regular Couple Room', NULL, 206, NULL, NULL, '5500.00', 12, 2, 1, 150, 2, 0, 'publish', 1, 1, NULL, '2024-04-05 18:59:04', '2024-04-05 20:05:16', NULL, NULL),
(47, 'Test', NULL, 206, NULL, NULL, '5500.00', 12, 1, 1, 0, 1, 0, 'publish', 1, 1, NULL, '2024-04-05 20:14:15', '2024-04-05 20:16:18', NULL, 0),
(48, 'Islan view', NULL, 212, '211,210,209,208,', NULL, '1200.00', 14, 1, 2, 160, 4, 0, 'publish', 1, NULL, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11', NULL, NULL),
(49, 'Lake view', NULL, 213, '209,208,', NULL, '1000.00', 14, 1, 1, 0, 2, 0, 'publish', 1, NULL, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48', NULL, NULL),
(50, 'room 1', NULL, 216, '221,220,219,218,217,', NULL, '1500.00', 15, 1, 2, 0, 4, 0, 'publish', 11, 11, NULL, '2024-04-24 18:03:50', '2024-04-24 18:04:50', NULL, NULL),
(51, 'room 2', NULL, 217, '216,217,220,221,', NULL, '1200.00', 15, 1, 2, 0, 2, 0, 'publish', 11, 11, NULL, '2024-04-24 18:06:03', '2024-04-24 18:06:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_room_bookings`
--

CREATE TABLE `bravo_hotel_room_bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `total_guests` int DEFAULT NULL,
  `adults` int DEFAULT NULL,
  `children` int DEFAULT NULL,
  `number` smallint DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_hotel_room_bookings`
--

INSERT INTO `bravo_hotel_room_bookings` (`id`, `room_id`, `parent_id`, `booking_id`, `start_date`, `end_date`, `total_guests`, `adults`, `children`, `number`, `price`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 37, 10, 1, '2024-04-09 13:38:03', '2024-04-13 13:38:03', 1, 1, 0, 1, '1400.00', 1, NULL, '2024-04-02 13:38:03', '2024-04-02 13:38:03'),
(2, 37, 10, 2, '2024-04-03 13:44:43', '2024-04-05 13:44:43', 1, 1, 0, 1, '1050.00', 1, NULL, '2024-04-02 13:44:43', '2024-04-02 13:44:43'),
(3, 38, 10, 2, '2024-05-01 13:44:43', '2024-05-04 13:44:43', 2, 1, 0, 1, '1050.00', 1, NULL, '2024-04-02 13:44:43', '2024-04-02 13:44:43'),
(4, 33, 9, 3, '2024-04-03 17:51:20', '2024-04-05 17:51:20', 1, 1, 0, 1, '700.00', NULL, NULL, '2024-04-02 17:51:20', '2024-04-02 17:51:20'),
(5, 37, 10, 4, '2024-06-03 22:14:38', '2024-08-03 22:14:38', 1, 1, 0, 1, '21350.00', 1, NULL, '2024-04-03 22:14:38', '2024-04-03 22:14:38'),
(6, 37, 10, 5, '2024-06-03 18:40:57', '2024-08-03 18:40:57', 1, 1, 0, 2, '42700.00', NULL, NULL, '2024-04-04 18:40:57', '2024-04-04 18:40:57'),
(7, 37, 10, 6, '2024-06-03 22:33:04', '2024-08-03 22:33:04', 1, 1, 0, 1, '21350.00', 1, NULL, '2024-04-04 22:33:04', '2024-04-04 22:33:04'),
(8, 38, 10, 7, '2024-05-04 20:02:07', '2024-06-04 20:02:07', 1, 1, 0, 1, '10850.00', NULL, NULL, '2024-04-05 20:02:07', '2024-04-05 20:02:07'),
(9, 47, 12, 8, '2024-08-03 20:17:14', '2024-10-03 20:17:14', 1, 1, 0, 1, '335500.00', 1, NULL, '2024-04-05 20:17:14', '2024-04-05 20:17:14'),
(10, 39, 10, 9, '2024-09-03 20:25:51', '2024-11-03 20:25:51', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-05 20:25:51', '2024-04-05 20:25:51'),
(11, 46, 12, 10, '2024-08-03 20:37:17', '2024-10-03 20:37:17', 1, 1, 0, 1, '335500.00', NULL, NULL, '2024-04-05 20:37:17', '2024-04-05 20:37:17'),
(12, 45, 10, 11, '2024-01-05 07:46:52', '2024-04-05 07:46:52', 1, 1, 0, 1, '318500.00', NULL, NULL, '2024-04-06 07:46:52', '2024-04-06 07:46:52'),
(13, 47, 12, 12, '2024-01-05 07:47:16', '2024-04-05 07:47:16', 1, 1, 0, 1, '500500.00', NULL, NULL, '2024-04-06 07:47:16', '2024-04-06 07:47:16'),
(14, 46, 12, 13, '2024-01-05 07:47:57', '2024-09-05 07:47:57', 1, 1, 0, 1, '1342000.00', NULL, NULL, '2024-04-06 07:47:57', '2024-04-06 07:47:57'),
(15, 37, 10, 14, '2024-07-04 09:13:37', '2025-04-04 09:13:37', 1, 1, 0, 1, '95900.00', NULL, NULL, '2024-04-06 09:13:37', '2024-04-06 09:13:37'),
(16, 51, 15, 15, '2026-04-03 18:22:49', '2026-06-03 18:22:49', 2, 2, 0, 1, '73200.00', NULL, NULL, '2024-04-24 18:22:49', '2024-04-24 18:22:49'),
(17, 49, 14, 16, '2026-04-03 18:29:32', '2026-06-03 18:29:32', 1, 1, 0, 1, '61000.00', NULL, NULL, '2024-04-24 18:29:32', '2024-04-24 18:29:32'),
(18, 37, 10, 17, '2024-07-05 17:37:36', '2024-09-05 17:37:36', 1, 1, 0, 1, '20650.00', NULL, NULL, '2024-04-25 17:37:36', '2024-04-25 17:37:36'),
(19, 38, 10, 17, '2025-01-05 17:37:36', '2025-03-05 17:37:36', 2, 1, 0, 1, '20650.00', NULL, NULL, '2024-04-25 17:37:36', '2024-04-25 17:37:36'),
(20, 38, 10, 18, '2024-12-05 17:41:32', '2025-03-05 17:41:32', 1, 1, 0, 1, '9800.00', NULL, NULL, '2024-04-25 17:41:32', '2024-04-25 17:41:32'),
(21, 39, 10, 18, '2025-02-05 17:41:32', '2025-03-05 17:41:32', 2, 1, 0, 1, '9800.00', NULL, NULL, '2024-04-25 17:41:32', '2024-04-25 17:41:32'),
(22, 37, 10, 19, '2024-06-05 03:23:12', '2024-08-05 03:23:12', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-26 03:23:12', '2024-04-26 03:23:12'),
(23, 37, 10, 20, '2024-01-05 03:53:26', '2024-03-05 03:53:26', 1, 1, 0, 1, '21000.00', NULL, NULL, '2024-04-26 03:53:26', '2024-04-26 03:53:26'),
(24, 37, 10, 21, '2024-01-05 03:55:29', '2024-03-05 03:55:29', 1, 1, 0, 1, '21000.00', NULL, NULL, '2024-04-26 03:55:29', '2024-04-26 03:55:29'),
(25, 37, 10, 22, '2024-12-05 03:57:20', '2025-02-05 03:57:20', 1, 1, 0, 1, '21700.00', NULL, NULL, '2024-04-26 03:57:20', '2024-04-26 03:57:20'),
(26, 37, 10, 23, '2024-01-05 04:03:10', '2024-03-05 04:03:10', 1, 1, 0, 1, '21000.00', NULL, NULL, '2024-04-26 04:03:10', '2024-04-26 04:03:10'),
(27, 37, 10, 24, '2026-04-05 04:06:33', '2026-07-05 04:06:33', 1, 1, 0, 1, '31850.00', NULL, NULL, '2024-04-26 04:06:33', '2024-04-26 04:06:33'),
(28, 37, 10, 29, '2026-04-05 04:13:55', '2026-07-05 04:13:55', 1, 1, 0, 1, '31850.00', NULL, NULL, '2024-04-26 04:13:55', '2024-04-26 04:13:55'),
(29, 37, 10, 33, '2026-04-05 04:18:47', '2026-06-05 04:18:47', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-26 04:18:47', '2024-04-26 04:18:47'),
(30, 37, 10, 34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 0, 1, '31850.00', NULL, NULL, '2024-04-26 04:22:30', '2024-04-26 04:22:30'),
(31, 37, 10, 35, '0000-00-00 00:00:00', '2026-06-05 04:23:44', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-26 04:23:44', '2024-04-26 04:23:44'),
(32, 38, 10, 36, '0000-00-00 00:00:00', '2026-07-05 04:28:32', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-26 04:28:32', '2024-04-26 04:28:32'),
(33, 37, 10, 37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-26 04:30:03', '2024-04-26 04:30:03'),
(34, 37, 10, 40, '2024-05-29 10:11:33', '2024-05-31 10:11:33', 1, 1, 0, 1, '21350.00', NULL, NULL, '2024-04-26 10:11:33', '2024-04-26 10:11:33'),
(35, 45, 10, 41, '2024-05-20 08:44:35', '2024-05-23 08:44:35', 1, 1, 0, 1, '322000.00', NULL, NULL, '2024-04-27 08:44:35', '2024-04-27 08:44:35'),
(36, 45, 10, 42, '2024-05-21 08:49:17', '2024-05-24 08:49:17', 1, 1, 0, 1, '318500.00', NULL, NULL, '2024-04-27 08:49:17', '2024-04-27 08:49:17'),
(37, 45, 10, 43, '2024-05-21 08:56:06', '2024-05-24 08:56:06', 1, 1, 0, 1, '10500.00', NULL, NULL, '2024-04-27 08:56:06', '2024-04-27 08:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_room_dates`
--

CREATE TABLE `bravo_hotel_room_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `target_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_instant` tinyint DEFAULT '0',
  `number` smallint DEFAULT NULL,
  `customer_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_hotel_room_dates`
--

INSERT INTO `bravo_hotel_room_dates` (`id`, `target_id`, `start_date`, `end_date`, `price`, `max_guests`, `active`, `note_to_customer`, `note_to_admin`, `is_instant`, `number`, `customer_name`, `phone_number`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 40, '2024-04-05 18:00:00', '2024-04-05 18:00:00', '450.00', NULL, 1, NULL, NULL, 0, 5, NULL, NULL, 1, NULL, '2024-04-04 22:19:40', '2024-04-04 22:19:40'),
(2, 40, '2024-04-06 18:00:00', '2024-04-06 18:00:00', '350.00', NULL, 1, NULL, NULL, 0, 5, NULL, NULL, 1, NULL, '2024-04-04 22:20:09', '2024-04-04 22:20:09'),
(3, 40, '2024-04-07 18:00:00', '2024-04-07 18:00:00', '550.00', NULL, 1, NULL, NULL, 0, 5, NULL, NULL, 1, NULL, '2024-04-04 22:21:56', '2024-04-04 22:21:56'),
(4, 40, '2024-04-14 18:00:00', '2024-04-14 18:00:00', '350.00', NULL, 1, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, '2024-04-04 22:50:38', '2024-04-04 22:50:38'),
(5, 38, '2024-04-05 18:00:00', '2024-04-05 18:00:00', '500.00', NULL, 1, NULL, NULL, 0, 5, NULL, NULL, 1, NULL, '2024-04-04 23:25:42', '2024-04-04 23:25:42'),
(6, 38, '2024-04-04 18:00:00', '2024-04-04 18:00:00', '350.00', NULL, 1, NULL, NULL, 0, 5, NULL, NULL, 1, NULL, '2024-04-04 23:25:52', '2024-04-04 23:25:52'),
(7, 37, '2024-04-05 18:00:00', '2024-04-05 18:00:00', '500.00', NULL, 1, NULL, NULL, 0, 7, NULL, NULL, 1, 1, '2024-04-05 09:03:58', '2024-04-05 09:14:40'),
(8, 45, '2024-04-10 18:00:00', '2024-04-10 18:00:00', '5000.00', NULL, 0, NULL, NULL, 0, 6, 'Robel Mia', '01906056366', 1, 1, '2024-04-05 18:49:13', '2024-04-07 09:05:42'),
(9, 45, '2024-04-11 18:00:00', '2024-04-11 18:00:00', '5000.00', NULL, 0, NULL, NULL, 0, 6, 'Robel Mia', '01906056366', 1, 1, '2024-04-05 18:49:20', '2024-04-07 09:05:42'),
(10, 45, '2024-03-30 18:00:00', '2024-03-30 18:00:00', '5000.00', NULL, 1, NULL, NULL, 0, 6, NULL, NULL, 1, NULL, '2024-04-06 06:15:59', '2024-04-06 06:15:59'),
(11, 45, '2024-04-05 18:00:00', '2024-04-05 18:00:00', '5000.00', NULL, 1, NULL, NULL, 0, 6, 'Melon mIA', '123456789', 1, 1, '2024-04-06 06:17:08', '2024-04-06 14:19:32'),
(12, 45, '2024-04-06 18:00:00', '2024-04-06 18:00:00', '5000.00', NULL, 1, NULL, NULL, 0, 6, NULL, NULL, 1, NULL, '2024-04-06 06:17:08', '2024-04-06 06:17:08'),
(13, 45, '2024-04-07 18:00:00', '2024-04-07 18:00:00', '5000.00', NULL, 1, NULL, NULL, 0, 6, NULL, NULL, 1, NULL, '2024-04-06 06:17:08', '2024-04-06 06:17:08'),
(14, 45, '2024-04-08 18:00:00', '2024-04-08 18:00:00', '5000.00', NULL, 0, NULL, NULL, 0, 6, 'Robel Mia', '01906056366', 1, 1, '2024-04-06 06:17:08', '2024-04-07 09:05:42'),
(15, 45, '2024-04-09 18:00:00', '2024-04-09 18:00:00', '5000.00', NULL, 0, NULL, NULL, 0, 6, 'Robel Mia', '01906056366', 1, 1, '2024-04-06 06:17:08', '2024-04-07 09:05:42'),
(16, 40, '2024-04-08 18:00:00', '2024-04-08 18:00:00', '350.00', NULL, 0, NULL, NULL, 0, 5, 'Robel Mia', '01906056399', 1, 1, '2024-04-07 09:06:43', '2024-04-07 09:07:02'),
(17, 40, '2024-04-09 18:00:00', '2024-04-09 18:00:00', '350.00', NULL, 0, NULL, NULL, 0, 5, 'Robel Mia', '01906056399', 1, 1, '2024-04-07 09:06:43', '2024-04-07 09:07:02'),
(18, 40, '2024-04-10 18:00:00', '2024-04-10 18:00:00', '350.00', NULL, 0, NULL, NULL, 0, 5, 'Robel Mia', '01906056399', 1, 1, '2024-04-07 09:06:43', '2024-04-07 09:07:02'),
(19, 40, '2024-04-11 18:00:00', '2024-04-11 18:00:00', '350.00', NULL, 0, NULL, NULL, 0, 5, 'Robel Mia', '01906056399', 1, 1, '2024-04-07 09:06:43', '2024-04-07 09:07:02'),
(20, 37, '2024-04-07 18:00:00', '2024-04-07 18:00:00', '350.00', NULL, 0, NULL, NULL, 0, 7, 'Mm', '0000', 1, NULL, '2024-04-07 12:01:07', '2024-04-07 12:01:07'),
(21, 37, '2024-04-10 18:00:00', '2024-04-10 18:00:00', '350.00', NULL, 0, NULL, NULL, 0, 7, 'M2', '6776', 1, NULL, '2024-04-07 12:01:23', '2024-04-07 12:01:23'),
(22, 51, '2024-04-27 18:00:00', '2024-04-27 18:00:00', '2200.00', NULL, 1, NULL, NULL, 0, 1, NULL, NULL, 11, 11, '2024-04-24 18:09:53', '2024-04-24 18:10:06'),
(23, 51, '2024-04-28 18:00:00', '2024-04-28 18:00:00', '2200.00', NULL, 1, NULL, NULL, 0, 1, NULL, NULL, 11, NULL, '2024-04-24 18:10:06', '2024-04-24 18:10:06'),
(24, 51, '2024-04-29 18:00:00', '2024-04-29 18:00:00', '2200.00', NULL, 1, NULL, NULL, 0, 1, NULL, NULL, 11, NULL, '2024-04-24 18:10:06', '2024-04-24 18:10:06'),
(25, 50, '2024-04-27 18:00:00', '2024-04-27 18:00:00', '1500.00', NULL, 0, NULL, NULL, 0, 1, NULL, NULL, 11, 11, '2024-04-24 18:10:38', '2024-04-24 18:13:58'),
(26, 50, '2024-04-28 18:00:00', '2024-04-28 18:00:00', '1500.00', NULL, 0, NULL, NULL, 0, 1, NULL, NULL, 11, 11, '2024-04-24 18:10:38', '2024-04-24 18:13:58'),
(27, 50, '2024-04-29 18:00:00', '2024-04-29 18:00:00', '1500.00', NULL, 0, NULL, NULL, 0, 1, NULL, NULL, 11, 11, '2024-04-24 18:10:38', '2024-04-24 18:13:58'),
(28, 51, '2024-04-30 18:00:00', '2024-04-30 18:00:00', '1200.00', NULL, 0, NULL, NULL, 0, 1, NULL, NULL, 1, NULL, '2024-04-25 15:36:36', '2024-04-25 15:36:36'),
(29, 51, '2024-05-27 18:00:00', '2024-05-27 18:00:00', '1200.00', NULL, 0, NULL, NULL, 0, 1, 'Melon', '098765432', 1, NULL, '2024-04-25 15:38:27', '2024-04-25 15:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_room_term`
--

CREATE TABLE `bravo_hotel_room_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_hotel_room_term`
--

INSERT INTO `bravo_hotel_room_term` (`id`, `term_id`, `target_id`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 25, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(2, 26, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(3, 27, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(4, 29, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(5, 25, 2, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(6, 27, 2, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(7, 28, 2, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(8, 25, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(9, 26, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(10, 27, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(11, 28, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(12, 29, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(13, 25, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(14, 26, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(15, 27, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(16, 28, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(17, 29, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(18, 25, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(19, 26, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(20, 27, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(21, 28, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(22, 29, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(23, 25, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(24, 26, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(25, 28, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(26, 29, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(27, 26, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(28, 27, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(29, 28, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(30, 29, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(31, 25, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(32, 26, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(33, 27, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(34, 28, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(35, 29, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(36, 25, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(37, 26, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(38, 27, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(39, 26, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(40, 28, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(41, 29, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(42, 25, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(43, 26, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(44, 27, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(45, 28, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(46, 29, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(47, 25, 12, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(48, 26, 12, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(49, 27, 12, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(50, 29, 12, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(51, 25, 13, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(52, 27, 13, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(53, 29, 13, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(54, 26, 14, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(55, 27, 14, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(56, 28, 14, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(57, 26, 15, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(58, 27, 15, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(59, 28, 15, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(60, 29, 15, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(61, 25, 16, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(62, 26, 16, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(63, 27, 16, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(64, 28, 16, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(65, 29, 16, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(66, 25, 17, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(67, 26, 17, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(68, 28, 17, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(69, 29, 17, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(70, 25, 18, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(71, 26, 18, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(72, 27, 18, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(73, 28, 18, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(74, 25, 19, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(75, 26, 19, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(76, 27, 19, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(77, 28, 19, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(78, 29, 19, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(79, 26, 20, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(80, 27, 20, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(81, 28, 20, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(82, 29, 20, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(83, 26, 21, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(84, 27, 21, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(85, 28, 21, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(86, 29, 21, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(87, 25, 22, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(88, 26, 22, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(89, 27, 22, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(90, 28, 22, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(91, 29, 22, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(92, 25, 23, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(93, 27, 23, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(94, 28, 23, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(95, 29, 23, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(96, 25, 24, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(97, 26, 24, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(98, 27, 24, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(99, 28, 24, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(100, 29, 24, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(101, 26, 25, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(102, 29, 25, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(103, 25, 26, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(104, 26, 26, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(105, 27, 26, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(106, 28, 26, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(107, 29, 26, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(108, 26, 27, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(109, 27, 27, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(110, 28, 27, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(111, 29, 27, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(112, 26, 28, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(113, 27, 28, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(114, 29, 28, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(115, 25, 29, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(116, 26, 29, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(117, 27, 29, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(118, 28, 29, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(119, 25, 30, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(120, 26, 30, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(121, 27, 30, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(122, 28, 30, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(123, 25, 31, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(124, 26, 31, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(125, 27, 31, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(126, 28, 31, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(127, 29, 31, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(128, 25, 32, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(129, 26, 32, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(130, 27, 32, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(131, 28, 33, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(132, 25, 34, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(133, 26, 34, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(134, 27, 34, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(135, 29, 34, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(136, 25, 35, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(137, 27, 35, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(138, 28, 35, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(139, 29, 35, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(140, 25, 36, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(141, 26, 36, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(142, 27, 36, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(143, 29, 36, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(144, 25, 37, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(145, 26, 37, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(146, 29, 37, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(147, 25, 38, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(148, 26, 38, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(149, 27, 38, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(150, 28, 38, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(151, 29, 38, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(152, 26, 39, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(153, 27, 39, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(154, 29, 39, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(155, 25, 40, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(156, 26, 40, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(157, 27, 40, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(158, 28, 40, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(159, 25, 41, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(160, 26, 41, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(161, 27, 41, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(162, 28, 41, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(163, 26, 42, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(164, 27, 42, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(165, 28, 42, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(166, 25, 43, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(167, 26, 43, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(168, 27, 43, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(169, 28, 43, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(170, 29, 43, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(171, 25, 44, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(172, 26, 44, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(173, 27, 44, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(174, 28, 44, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(175, 29, 44, NULL, NULL, '2024-04-02 07:17:16', '2024-04-02 07:17:16'),
(176, 26, 45, 1, NULL, '2024-04-05 18:04:47', '2024-04-05 18:04:47'),
(177, 27, 45, 1, NULL, '2024-04-05 18:04:47', '2024-04-05 18:04:47'),
(178, 28, 45, 1, NULL, '2024-04-05 18:04:47', '2024-04-05 18:04:47'),
(179, 25, 46, 1, NULL, '2024-04-05 18:59:04', '2024-04-05 18:59:04'),
(180, 26, 46, 1, NULL, '2024-04-05 18:59:04', '2024-04-05 18:59:04'),
(181, 27, 46, 1, NULL, '2024-04-05 18:59:04', '2024-04-05 18:59:04'),
(182, 28, 46, 1, NULL, '2024-04-05 18:59:04', '2024-04-05 18:59:04'),
(183, 29, 46, 1, NULL, '2024-04-05 18:59:04', '2024-04-05 18:59:04'),
(184, 25, 47, 1, NULL, '2024-04-05 20:14:15', '2024-04-05 20:14:15'),
(185, 26, 47, 1, NULL, '2024-04-05 20:14:16', '2024-04-05 20:14:16'),
(186, 27, 47, 1, NULL, '2024-04-05 20:14:16', '2024-04-05 20:14:16'),
(187, 28, 47, 1, NULL, '2024-04-05 20:14:16', '2024-04-05 20:14:16'),
(188, 29, 47, 1, NULL, '2024-04-05 20:14:16', '2024-04-05 20:14:16'),
(189, 25, 48, 1, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11'),
(190, 26, 48, 1, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11'),
(191, 27, 48, 1, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11'),
(192, 28, 48, 1, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11'),
(193, 29, 48, 1, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11'),
(194, 25, 49, 1, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48'),
(195, 26, 49, 1, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48'),
(196, 27, 49, 1, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48'),
(197, 28, 49, 1, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48'),
(198, 29, 49, 1, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48'),
(199, 25, 50, 11, NULL, '2024-04-24 18:05:16', '2024-04-24 18:05:16'),
(200, 26, 50, 11, NULL, '2024-04-24 18:05:16', '2024-04-24 18:05:16'),
(201, 27, 50, 11, NULL, '2024-04-24 18:05:16', '2024-04-24 18:05:16'),
(202, 28, 50, 11, NULL, '2024-04-24 18:05:16', '2024-04-24 18:05:16'),
(203, 29, 50, 11, NULL, '2024-04-24 18:05:16', '2024-04-24 18:05:16'),
(204, 25, 51, 11, NULL, '2024-04-24 18:07:09', '2024-04-24 18:07:09'),
(205, 26, 51, 11, NULL, '2024-04-24 18:07:09', '2024-04-24 18:07:09'),
(206, 27, 51, 11, NULL, '2024-04-24 18:07:09', '2024-04-24 18:07:09'),
(207, 28, 51, 11, NULL, '2024-04-24 18:07:09', '2024-04-24 18:07:09'),
(208, 29, 51, 11, NULL, '2024-04-24 18:07:09', '2024-04-24 18:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_room_translations`
--

CREATE TABLE `bravo_hotel_room_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_term`
--

CREATE TABLE `bravo_hotel_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_hotel_term`
--

INSERT INTO `bravo_hotel_term` (`id`, `term_id`, `target_id`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(2, 2, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(3, 3, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(4, 4, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(5, 5, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(6, 6, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(7, 7, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(8, 8, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(9, 9, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(10, 10, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(11, 1, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(12, 2, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(13, 3, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(14, 4, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(15, 5, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(16, 6, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(17, 7, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(18, 8, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(19, 9, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(20, 10, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(21, 1, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(22, 2, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(23, 3, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(24, 4, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(25, 5, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(26, 6, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(27, 7, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(28, 8, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(29, 9, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(30, 10, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(31, 1, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(32, 2, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(33, 3, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(34, 4, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(35, 6, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(36, 7, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(37, 8, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(38, 9, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(39, 10, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(40, 1, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(41, 2, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(42, 3, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(43, 4, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(44, 5, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(45, 6, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(46, 7, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(47, 8, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(48, 9, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(49, 10, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(50, 2, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(51, 3, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(52, 4, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(53, 5, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(54, 7, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(55, 8, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(56, 10, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(57, 1, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(58, 2, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(59, 3, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(60, 4, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(61, 5, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(62, 6, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(63, 8, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(64, 9, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(65, 10, 7, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(66, 1, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(67, 2, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(68, 4, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(69, 5, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(70, 6, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(71, 8, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(72, 9, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(73, 10, 8, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(74, 1, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(75, 3, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(76, 4, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(77, 5, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(78, 6, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(79, 7, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(80, 8, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(81, 9, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(82, 10, 9, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(84, 2, 10, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(89, 7, 10, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(93, 1, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(94, 3, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(95, 4, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(96, 5, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(97, 6, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(98, 7, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(99, 8, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(100, 9, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(101, 10, 11, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(102, 11, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(103, 12, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(104, 13, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(105, 14, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(106, 15, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(107, 16, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(108, 17, 1, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(109, 11, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(110, 12, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(111, 13, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(112, 14, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(113, 15, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(114, 16, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(115, 17, 2, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(116, 11, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(117, 12, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(118, 13, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(119, 14, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(120, 15, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(121, 16, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(122, 17, 3, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(123, 11, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(124, 12, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(125, 14, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(126, 15, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(127, 16, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(128, 17, 4, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(129, 11, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(130, 12, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(131, 13, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(132, 14, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(133, 15, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(134, 16, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(135, 17, 5, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(136, 11, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(137, 12, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(138, 13, 6, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(139, 14, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(140, 15, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(141, 16, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(142, 17, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(143, 11, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(144, 12, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(145, 13, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(146, 14, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(147, 15, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(148, 16, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(149, 17, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(150, 11, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(151, 12, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(152, 13, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(153, 14, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(154, 15, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(155, 16, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(156, 17, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(157, 11, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(158, 12, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(159, 13, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(160, 14, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(161, 15, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(162, 16, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(163, 11, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(164, 12, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(165, 13, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(166, 15, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(167, 16, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(168, 17, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(169, 11, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(170, 12, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(171, 13, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(172, 14, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(173, 15, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(174, 16, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(175, 18, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(176, 19, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(177, 21, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(178, 22, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(179, 23, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(180, 24, 1, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(181, 19, 2, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(182, 20, 2, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(183, 23, 2, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(184, 18, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(185, 20, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(186, 23, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(187, 24, 3, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(188, 18, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(189, 20, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(190, 21, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(191, 23, 4, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(192, 20, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(193, 21, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(194, 22, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(195, 23, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(196, 24, 5, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(197, 19, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(198, 20, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(199, 21, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(200, 22, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(201, 23, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(202, 24, 6, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(203, 19, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(204, 20, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(205, 21, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(206, 23, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(207, 24, 7, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(208, 18, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(209, 20, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(210, 21, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(211, 22, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(212, 24, 8, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(213, 18, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(214, 20, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(215, 21, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(216, 22, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(217, 23, 9, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(218, 18, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(219, 19, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(220, 20, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(221, 21, 10, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(222, 18, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(223, 20, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(224, 21, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(225, 23, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(226, 24, 11, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(227, 14, 10, 1, NULL, '2024-04-03 22:28:19', '2024-04-03 22:28:19'),
(228, 11, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(229, 12, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(230, 14, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(231, 15, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(232, 16, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(233, 18, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(234, 20, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(235, 22, 12, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 18:56:30'),
(236, 2, 12, 1, NULL, '2024-04-05 20:21:07', '2024-04-05 20:21:07'),
(237, 2, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(238, 11, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(239, 12, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(240, 13, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(241, 14, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(242, 15, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(243, 16, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(244, 17, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(245, 21, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(246, 22, 13, 6, NULL, '2024-04-05 20:31:33', '2024-04-05 20:31:33'),
(247, 7, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(248, 11, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(249, 12, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(250, 13, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(251, 18, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(252, 19, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(253, 20, 14, 1, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_hotel_translations`
--

CREATE TABLE `bravo_hotel_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_locations`
--

CREATE TABLE `bravo_locations` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `trip_ideas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gallery` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_locations`
--

INSERT INTO `bravo_locations` (`id`, `name`, `content`, `slug`, `image_id`, `map_lat`, `map_lng`, `map_zoom`, `status`, `_lft`, `_rgt`, `parent_id`, `create_user`, `update_user`, `deleted_at`, `origin_id`, `lang`, `created_at`, `updated_at`, `banner_image_id`, `trip_ideas`, `gallery`) VALUES
(1, 'Dhaka', 'New York, a city that doesnt sleep, as Frank Sinatra sang. The Big Apple is one of the largest cities in the United States and one of the most popular in the whole country and the world. Millions of tourists visit it every year attracted by its various iconic symbols and its wide range of leisure and cultural offer. New York is the birth place of new trends and developments in many fields such as art, gastronomy, technology,...', 'dhaka', 111, '48.856613', '2.352222', 12, 'publish', 1, 2, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 112, '\"[{\\\"title\\\":\\\"Experiencing the best jazz in Harlem, birthplace of bebop\\\",\\\"link\\\":\\\"#\\\",\\\"content\\\":\\\"New Orleans might be the home of jazz, but New York City is where many of the genre\\u2019s greats became stars \\u2013 and Harlem was at the heart of it.The neighborhood experienced a rebirth during the...\\\",\\\"image_id\\\":\\\"113\\\"},{\\\"title\\\":\\\"Reflections from the road: transformative \\u2018Big Trip\\u2019 experiences\\\",\\\"link\\\":\\\"#\\\",\\\"content\\\":\\\"Whether it\\u2019s a gap year after finishing school, a well-earned sabbatical from work or an overseas adventure in celebration of your retirement, a big trip is a rite of passage for every traveller, with myriad life lessons to be ...\\\",\\\"image_id\\\":\\\"114\\\"}]\"', NULL),
(2, 'Chittagong', NULL, 'chittagong', 107, '40.712776', '-74.005974', 12, 'publish', 3, 4, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', NULL, NULL, NULL),
(3, 'Khulna Division', NULL, 'khulna-division', 108, '36.778259', '-119.417931', 12, 'publish', 5, 6, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', NULL, NULL, NULL),
(4, 'Mymensingh Division', NULL, 'mymensingh-division', 109, '37.090240', '-95.712891', 12, 'publish', 7, 8, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', NULL, NULL, NULL),
(5, 'Rajshahi Division', NULL, 'rajshahi-division', 110, '34.052235', '-118.243683', 12, 'publish', 9, 10, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', NULL, NULL, NULL),
(6, 'Rangpur Division', NULL, 'rangpur-division', 106, '40.058323', '-74.405663', 12, 'publish', 11, 12, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', NULL, NULL, NULL),
(7, 'Sylhet Division', NULL, 'sylhet-division', 107, '37.774929', '-122.419418', 12, 'publish', 13, 14, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', NULL, NULL, NULL),
(8, 'Wellness', NULL, 'wellness', NULL, NULL, NULL, 8, 'publish', 15, 16, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-13 09:54:48', '2024-05-13 09:54:48', NULL, NULL, NULL),
(9, 'Shed Bulining', NULL, 'shed-bulining', NULL, NULL, NULL, 8, 'publish', 17, 18, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-13 09:54:54', '2024-05-13 09:54:54', NULL, NULL, NULL),
(10, 'Melon', NULL, 'melon', NULL, NULL, NULL, 8, 'publish', 19, 20, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-13 09:55:00', '2024-05-13 09:55:00', NULL, NULL, NULL),
(11, 'SHARMIN BEGUM', NULL, 'sharmin-begum', NULL, NULL, NULL, 8, 'publish', 21, 22, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-13 09:55:05', '2024-05-13 09:55:05', NULL, NULL, NULL),
(12, 'Sms Settings', NULL, 'sms-settings', NULL, NULL, NULL, 8, 'publish', 23, 24, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-13 09:55:10', '2024-05-13 09:55:10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_location_translations`
--

CREATE TABLE `bravo_location_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trip_ideas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_payouts`
--

CREATE TABLE `bravo_payouts` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_vendor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_process_by` int DEFAULT NULL,
  `pay_date` timestamp NULL DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_plans`
--

CREATE TABLE `bravo_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,2) DEFAULT NULL,
  `duration` int DEFAULT '0',
  `duration_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_price` decimal(12,2) DEFAULT NULL,
  `max_service` int DEFAULT '0',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `is_recommended` tinyint DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_plans`
--

INSERT INTO `bravo_plans` (`id`, `title`, `content`, `price`, `duration`, `duration_type`, `annual_price`, `max_service`, `status`, `role_id`, `is_recommended`, `deleted_at`, `create_user`, `update_user`, `created_at`, `updated_at`, `image_id`) VALUES
(1, 'Basic', '<ul><li>5 service posting</li><li>2 featured service</li><li>Service displayed for 20 days</li><li>Premium Support 24/7</li></ul>', '0.00', 99999, 'year', '0.00', 5, 'publish', 2, 0, NULL, 1, NULL, '2024-04-02 07:17:51', '2024-04-05 20:53:34', NULL),
(2, 'Standard', '<ul><li>5 service posting</li><li>2 featured service</li><li>Service displayed for 20 days</li><li>Premium Support 24/7</li></ul>', '499.00', 1, 'month', '1499.00', 20, 'draft', 2, 1, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-05 18:45:17', NULL),
(3, 'Extended', '<ul><li>5 service posting</li><li>2 featured service</li><li>Service displayed for 20 days</li><li>Premium Support 24/7</li></ul>', '799.00', 1, 'month', '1799.00', 50, 'draft', 2, 0, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-05 18:45:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_plan_trans`
--

CREATE TABLE `bravo_plan_trans` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_popups`
--

CREATE TABLE `bravo_popups` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'draft',
  `include_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exclude_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `schedule_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'day',
  `schedule_amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_popup_translations`
--

CREATE TABLE `bravo_popup_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_review`
--

CREATE TABLE `bravo_review` (
  `id` bigint UNSIGNED NOT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rate_number` int DEFAULT NULL,
  `author_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vendor_id` bigint DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_review`
--

INSERT INTO `bravo_review` (`id`, `object_id`, `object_model`, `title`, `content`, `rate_number`, `author_ip`, `status`, `publish_date`, `create_user`, `update_user`, `deleted_at`, `lang`, `created_at`, `updated_at`, `vendor_id`, `author_id`) VALUES
(1, 1, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 13, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 13),
(2, 1, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 12, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 12),
(3, 1, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 13, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 13),
(4, 1, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 9, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 9),
(5, 1, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 10, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 10),
(6, 2, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 14, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 14),
(7, 2, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 13, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 13),
(8, 2, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 9, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 9),
(9, 3, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 10, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 10),
(10, 3, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 8, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 8),
(11, 3, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 15, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 15),
(12, 3, 'hotel', 'Easy way to discover the city', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 8, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 8),
(13, 4, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 9, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 1, 9),
(14, 5, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 14, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 14),
(15, 5, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 7, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 7),
(16, 5, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 12, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 12),
(17, 6, 'hotel', 'Easy way to discover the city', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 8, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 8),
(18, 6, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 8, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 8),
(19, 6, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 9, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 9),
(20, 6, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 10, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 10),
(21, 6, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:13', 10, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13', 4, 10),
(22, 7, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 13, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 5, 13),
(23, 7, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 9, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 5, 9),
(24, 7, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 10, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 5, 10),
(25, 8, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 8, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 8),
(26, 8, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 9, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 9),
(27, 8, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 8, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 8),
(28, 9, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 11, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 1, 11),
(29, 9, 'hotel', 'Good location, quality should be better', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 11, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 1, 11),
(30, 10, 'hotel', 'Easy way to discover the city', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 13, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 4, 13),
(31, 11, 'hotel', 'Easy way to discover the city', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 15, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 15),
(32, 11, 'hotel', 'Beautiful spot with a lovely view', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 4, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 14, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 14),
(33, 11, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 7, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 7),
(34, 11, 'hotel', 'Nothing good this time', 'Eum eu sumo albucius perfecto, commodo torquatos consequuntur pro ut, id posse splendide ius. Cu nisl putent omittantur usu, mutat atomorum ex pro, ius nibh nonumy id. Nam at eius dissentias disputando, molestie mnesarchum complectitur per te', 5, '127.0.0.1', 'approved', '2024-04-02 13:17:14', 11, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14', 6, 11),
(35, 1, 'car', 'New', 'dsvcvc sdfsd sds sdfsdf sfsfd wsf', 5, '127.0.0.1', 'approved', NULL, 13, 1, NULL, NULL, '2024-04-29 17:30:22', '2024-04-29 17:31:53', NULL, 13);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_review_meta`
--

CREATE TABLE `bravo_review_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `review_id` int DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_review_meta`
--

INSERT INTO `bravo_review_meta` (`id`, `review_id`, `object_id`, `object_model`, `name`, `val`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(2, 1, 1, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(3, 1, 1, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(4, 1, 1, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(5, 1, 1, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(6, 2, 1, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(7, 2, 1, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(8, 2, 1, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(9, 2, 1, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(10, 2, 1, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(11, 3, 1, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(12, 3, 1, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(13, 3, 1, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(14, 3, 1, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(15, 3, 1, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(16, 4, 1, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(17, 4, 1, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(18, 4, 1, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(19, 4, 1, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(20, 4, 1, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(21, 5, 1, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(22, 5, 1, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(23, 5, 1, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(24, 5, 1, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(25, 5, 1, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(26, 6, 2, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(27, 6, 2, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(28, 6, 2, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(29, 6, 2, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(30, 6, 2, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(31, 7, 2, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(32, 7, 2, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(33, 7, 2, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(34, 7, 2, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(35, 7, 2, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(36, 8, 2, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(37, 8, 2, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(38, 8, 2, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(39, 8, 2, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(40, 8, 2, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(41, 9, 3, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(42, 9, 3, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(43, 9, 3, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(44, 9, 3, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(45, 9, 3, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(46, 10, 3, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(47, 10, 3, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(48, 10, 3, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(49, 10, 3, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(50, 10, 3, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(51, 11, 3, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(52, 11, 3, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(53, 11, 3, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(54, 11, 3, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(55, 11, 3, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(56, 12, 3, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(57, 12, 3, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(58, 12, 3, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(59, 12, 3, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(60, 12, 3, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(61, 13, 4, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(62, 13, 4, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(63, 13, 4, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(64, 13, 4, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(65, 13, 4, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(66, 14, 5, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(67, 14, 5, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(68, 14, 5, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(69, 14, 5, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(70, 14, 5, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(71, 15, 5, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(72, 15, 5, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(73, 15, 5, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(74, 15, 5, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(75, 15, 5, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(76, 16, 5, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(77, 16, 5, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(78, 16, 5, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(79, 16, 5, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(80, 16, 5, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(81, 17, 6, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(82, 17, 6, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(83, 17, 6, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(84, 17, 6, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(85, 17, 6, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(86, 18, 6, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(87, 18, 6, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(88, 18, 6, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(89, 18, 6, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(90, 18, 6, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(91, 19, 6, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(92, 19, 6, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(93, 19, 6, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(94, 19, 6, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(95, 19, 6, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(96, 20, 6, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(97, 20, 6, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(98, 20, 6, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(99, 20, 6, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(100, 20, 6, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(101, 21, 6, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(102, 21, 6, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(103, 21, 6, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(104, 21, 6, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(105, 21, 6, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(106, 22, 7, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(107, 22, 7, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(108, 22, 7, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(109, 22, 7, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(110, 22, 7, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(111, 23, 7, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(112, 23, 7, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(113, 23, 7, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(114, 23, 7, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(115, 23, 7, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(116, 24, 7, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(117, 24, 7, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(118, 24, 7, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(119, 24, 7, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(120, 24, 7, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(121, 25, 8, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(122, 25, 8, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(123, 25, 8, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(124, 25, 8, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(125, 25, 8, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(126, 26, 8, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(127, 26, 8, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(128, 26, 8, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(129, 26, 8, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(130, 26, 8, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(131, 27, 8, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(132, 27, 8, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(133, 27, 8, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(134, 27, 8, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(135, 27, 8, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(136, 28, 9, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(137, 28, 9, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(138, 28, 9, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(139, 28, 9, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(140, 28, 9, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(141, 29, 9, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(142, 29, 9, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(143, 29, 9, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(144, 29, 9, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(145, 29, 9, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(146, 30, 10, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(147, 30, 10, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(148, 30, 10, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(149, 30, 10, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(150, 30, 10, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(151, 31, 11, 'hotel', 'Sleep', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(152, 31, 11, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(153, 31, 11, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(154, 31, 11, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(155, 31, 11, 'hotel', 'Rooms', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(156, 32, 11, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(157, 32, 11, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(158, 32, 11, 'hotel', 'Service', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(159, 32, 11, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(160, 32, 11, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(161, 33, 11, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(162, 33, 11, 'hotel', 'Location', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(163, 33, 11, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(164, 33, 11, 'hotel', 'Clearness', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(165, 33, 11, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(166, 34, 11, 'hotel', 'Sleep', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(167, 34, 11, 'hotel', 'Location', '4', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(168, 34, 11, 'hotel', 'Service', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(169, 34, 11, 'hotel', 'Clearness', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(170, 34, 11, 'hotel', 'Rooms', '5', 1, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_seat_type`
--

CREATE TABLE `bravo_seat_type` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_seo`
--

CREATE TABLE `bravo_seo` (
  `id` bigint UNSIGNED NOT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_index` tinyint DEFAULT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_image` int DEFAULT NULL,
  `seo_share` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_seo`
--

INSERT INTO `bravo_seo` (`id`, `object_id`, `object_model`, `seo_index`, `seo_title`, `seo_desc`, `seo_image`, `seo_share`, `create_user`, `update_user`, `origin_id`, `lang`, `created_at`, `updated_at`) VALUES
(1, 10, 'page', 1, NULL, NULL, NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', 1, NULL, NULL, NULL, '2024-04-02 20:00:02', '2024-04-02 20:00:02'),
(2, 10, 'hotel', 1, NULL, NULL, NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', 1, 1, NULL, NULL, '2024-04-03 22:28:19', '2024-04-05 18:06:30'),
(3, 45, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-04-05 18:04:47', '2024-04-05 18:04:47'),
(4, 12, 'hotel', 1, NULL, NULL, NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', 1, 1, NULL, NULL, '2024-04-05 18:56:30', '2024-04-05 19:04:42'),
(5, 46, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2024-04-05 18:59:04', '2024-04-05 20:05:16'),
(6, 47, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, '2024-04-05 20:14:15', '2024-04-05 20:16:18'),
(7, 13, 'hotel', NULL, NULL, NULL, NULL, NULL, 6, 6, NULL, NULL, '2024-04-05 20:30:09', '2024-04-05 20:30:22'),
(8, 14, 'hotel', 1, NULL, NULL, NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', 1, NULL, NULL, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13'),
(9, 48, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-04-24 17:53:11', '2024-04-24 17:53:11'),
(10, 49, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-04-24 17:53:48', '2024-04-24 17:53:48'),
(11, 15, 'hotel', NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, '2024-04-24 18:02:13', '2024-04-24 18:02:13'),
(12, 50, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 11, 11, NULL, NULL, '2024-04-24 18:03:50', '2024-04-24 18:04:20'),
(13, 51, 'hotel_room', NULL, NULL, NULL, NULL, NULL, 11, 11, NULL, NULL, '2024-04-24 18:06:03', '2024-04-24 18:06:59'),
(14, 1, 'car', 1, NULL, NULL, NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', 1, 1, NULL, NULL, '2024-04-29 16:00:28', '2024-04-29 16:01:15'),
(15, 8, 'location', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-05-13 09:54:48', '2024-05-13 09:54:48'),
(16, 9, 'location', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-05-13 09:54:54', '2024-05-13 09:54:54'),
(17, 10, 'location', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-05-13 09:55:00', '2024-05-13 09:55:00'),
(18, 11, 'location', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-05-13 09:55:05', '2024-05-13 09:55:05'),
(19, 12, 'location', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-05-13 09:55:10', '2024-05-13 09:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_services`
--

CREATE TABLE `bravo_services` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `star_rate` tinyint DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `min_people` int DEFAULT NULL,
  `max_people` int DEFAULT NULL,
  `max_guests` int DEFAULT NULL,
  `review_score` int DEFAULT NULL,
  `min_day_before_booking` int DEFAULT NULL,
  `min_day_stays` int DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_services`
--

INSERT INTO `bravo_services` (`id`, `title`, `slug`, `category_id`, `location_id`, `address`, `map_lat`, `map_lng`, `is_featured`, `star_rate`, `price`, `sale_price`, `min_people`, `max_people`, `max_guests`, `review_score`, `min_day_before_booking`, `min_day_stays`, `object_id`, `object_model`, `status`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`, `author_id`) VALUES
(1, 'The May Fair Hotel', 'the-may-fair-hotel', NULL, 1, 'Paris Cinemas Battery', '19.277696', '72.887009', 0, 4, '550.00', NULL, NULL, NULL, NULL, 5, NULL, NULL, 11, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:20', '2024-04-02 07:17:49', '2024-04-02 07:20:20', 6),
(2, 'Dylan Hotel', 'dylan-hotel', NULL, 2, 'house', '19.229727', '72.984470', 1, 5, '550.00', NULL, NULL, NULL, NULL, 5, NULL, -1, 10, 'hotel', 'publish', 1, 1, NULL, '2024-04-02 07:17:49', '2024-04-05 18:13:57', 1),
(3, 'Parian Holiday Villas', 'parian-holiday-villas', NULL, 1, 'Regal Cinemas Battery Park', '19.161637', '72.997510', 1, 5, '550.00', NULL, NULL, NULL, NULL, 4, NULL, NULL, 9, 'hotel', 'draft', 1, NULL, NULL, '2024-04-02 07:17:49', '2024-04-04 23:20:34', 1),
(4, 'Stewart Hotel', 'stewart-hotel', NULL, 5, 'New York', '19.080542', '73.010551', 0, 5, '900.00', NULL, NULL, NULL, NULL, 4, NULL, NULL, 8, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 6),
(5, 'Crowne Plaza Hotel', 'crowne-plaza-hotel', NULL, 2, 'New York', '19.001355', '73.111444', 0, 5, '900.00', NULL, NULL, NULL, NULL, 5, NULL, NULL, 7, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 5),
(6, 'EnVision Hotel Boston', 'envision-hotel-boston', NULL, 3, 'New York', '18.873011', '72.975724', 0, 5, '700.00', NULL, NULL, NULL, NULL, 5, NULL, NULL, 6, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 4),
(7, 'Studio Allston Hotel', 'studio-allston-hotel', NULL, 5, 'New York', '18.972786', '72.819724', 0, 5, '500.00', NULL, NULL, NULL, NULL, 5, NULL, NULL, 5, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 4),
(8, 'Redac Gateway Hotel', 'redac-gateway-hotel', NULL, 1, 'Petit-Montrouge', '19.031217', '72.851982', 0, 5, '500.00', NULL, NULL, NULL, NULL, 4, NULL, NULL, 4, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 1),
(9, 'Castello Casole Hotel', 'castello-casole-hotel', NULL, 1, 'Petit-Montrouge', '19.077946', '72.838255', 0, 5, '350.00', NULL, NULL, NULL, NULL, 5, NULL, NULL, 3, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 1),
(10, 'Hotel WBF Hommachi', 'hotel-wbf-hommachi', NULL, 1, 'Porte de Vanves', '19.110390', '72.832764', 0, 5, '350.00', NULL, NULL, NULL, NULL, 4, NULL, NULL, 2, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 1),
(11, 'Hotel Stanford', 'hotel-stanford', NULL, 1, 'Arrondissement de Paris', '19.148665', '72.839670', 0, 5, '300.00', NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 'hotel', 'publish', NULL, NULL, '2024-04-02 07:20:52', '2024-04-02 07:17:50', '2024-04-02 07:20:52', 1),
(12, 'Sailor Beach Resort', 'sailor-beach-resort', NULL, 2, 'Sugandha Beach Cox\'s Bazar', NULL, NULL, NULL, 6, '5000.00', NULL, NULL, NULL, NULL, NULL, 1, 2, 12, 'hotel', 'publish', 1, 1, NULL, '2024-04-05 18:56:30', '2024-04-05 20:21:07', 6),
(13, 'Hotel XYZ', 'hotel-xyz', NULL, 2, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 13, 'hotel', 'publish', 6, 6, NULL, '2024-04-05 20:30:09', '2024-04-05 20:30:49', 6),
(14, 'Hotel Air International', 'hotel-air-international', NULL, 2, 'coxbazar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 'hotel', 'publish', 1, NULL, NULL, '2024-04-24 17:51:13', '2024-04-24 17:51:13', 7),
(15, 'Hotel Singapore International', 'hotel-singapore-international', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 'hotel', 'publish', 11, NULL, NULL, '2024-04-24 18:02:13', '2024-04-24 18:02:13', 11),
(16, 'New', 'new', NULL, 1, 'Chalana,charsindur,palash,Narsingdi', NULL, NULL, 1, NULL, '998.00', '12333.00', NULL, NULL, NULL, 5, 2, 2, 1, 'car', 'publish', 1, 1, NULL, '2024-04-29 16:00:28', '2024-04-30 06:43:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bravo_service_translations`
--

CREATE TABLE `bravo_service_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_spaces`
--

CREATE TABLE `bravo_spaces` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,2) DEFAULT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `is_instant` tinyint DEFAULT '0',
  `allow_children` tinyint DEFAULT '0',
  `allow_infant` tinyint DEFAULT '0',
  `max_guests` int DEFAULT NULL,
  `bed` int DEFAULT NULL,
  `bathroom` int DEFAULT NULL,
  `square` int DEFAULT NULL,
  `enable_extra_price` tinyint DEFAULT NULL,
  `extra_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_by_days` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_state` tinyint DEFAULT '1',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `review_score` decimal(2,1) DEFAULT NULL,
  `ical_import_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_service_fee` tinyint DEFAULT NULL,
  `service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author_id` bigint DEFAULT NULL,
  `min_day_before_booking` int DEFAULT NULL,
  `min_day_stays` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_space_dates`
--

CREATE TABLE `bravo_space_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `target_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_instant` tinyint DEFAULT '0',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_space_term`
--

CREATE TABLE `bravo_space_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_space_translations`
--

CREATE TABLE `bravo_space_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_terms`
--

CREATE TABLE `bravo_terms` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attr_id` int DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_terms`
--

INSERT INTO `bravo_terms` (`id`, `name`, `content`, `attr_id`, `slug`, `create_user`, `update_user`, `image_id`, `icon`, `origin_id`, `lang`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Apartments', NULL, 1, 'apartments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(2, 'Hotels', NULL, 1, 'hotels', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(3, 'Homestays', NULL, 1, 'homestays', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(4, 'Villas', NULL, 1, 'villas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(5, 'Boats', NULL, 1, 'boats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(6, 'Motels', NULL, 1, 'motels', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(7, 'Resorts', NULL, 1, 'resorts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(8, 'Lodges', NULL, 1, 'lodges', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(9, 'Holiday homes', NULL, 1, 'holiday-homes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(10, 'Cruises', NULL, 1, 'cruises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(11, 'Wake-up call', NULL, 2, 'wake-up-call', NULL, NULL, NULL, 'icofont-wall-clock', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(12, 'Car hire', NULL, 2, 'car-hire', NULL, NULL, NULL, 'icofont-car-alt-3', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(13, 'Bicycle hire', NULL, 2, 'bicycle-hire', NULL, NULL, NULL, 'icofont-bicycle-alt-2', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(14, 'Flat Tv', NULL, 2, 'flat-tv', NULL, NULL, NULL, 'icofont-imac', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(15, 'Laundry and dry cleaning', NULL, 2, 'laundry-and-dry-cleaning', NULL, NULL, NULL, 'icofont-recycle-alt', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(16, 'Internet – Wifi', NULL, 2, 'internet-wifi', NULL, NULL, NULL, 'icofont-wifi-alt', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(17, 'Coffee and tea', NULL, 2, 'coffee-and-tea', NULL, NULL, NULL, 'icofont-tea', NULL, NULL, NULL, '2024-04-02 07:17:14', '2024-04-02 07:17:14'),
(18, 'Havana Lobby bar', NULL, 3, 'havana-lobby-bar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(19, 'Fiesta Restaurant', NULL, 3, 'fiesta-restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(20, 'Hotel transport services', NULL, 3, 'hotel-transport-services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(21, 'Free luggage deposit', NULL, 3, 'free-luggage-deposit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(22, 'Laundry Services', NULL, 3, 'laundry-services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(23, 'Pets welcome', NULL, 3, 'pets-welcome', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(24, 'Tickets', NULL, 3, 'tickets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(25, 'Wake-up call', NULL, 4, 'wake-up-call-1', NULL, NULL, NULL, 'icofont-wall-clock', NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(26, 'Flat Tv', NULL, 4, 'flat-tv-1', NULL, NULL, NULL, 'icofont-imac', NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(27, 'Laundry and dry cleaning', NULL, 4, 'laundry-and-dry-cleaning-1', NULL, NULL, NULL, 'icofont-recycle-alt', NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(28, 'Internet – Wifi', NULL, 4, 'internet-wifi-1', NULL, NULL, NULL, 'icofont-wifi-alt', NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15'),
(29, 'Coffee and tea', NULL, 4, 'coffee-and-tea-1', NULL, NULL, NULL, 'icofont-tea', NULL, NULL, NULL, '2024-04-02 07:17:15', '2024-04-02 07:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `bravo_terms_translations`
--

CREATE TABLE `bravo_terms_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tours`
--

CREATE TABLE `bravo_tours` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_id` int DEFAULT NULL,
  `banner_image_id` int DEFAULT NULL,
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_lng` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_zoom` int DEFAULT NULL,
  `is_featured` tinyint DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `min_people` int DEFAULT NULL,
  `max_people` int DEFAULT NULL,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_state` tinyint DEFAULT '1',
  `enable_fixed_date` tinyint DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `last_booking_date` datetime DEFAULT NULL,
  `include` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exclude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `itinerary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `review_score` decimal(2,1) DEFAULT NULL,
  `ical_import_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_service_fee` tinyint DEFAULT NULL,
  `service_fee` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author_id` bigint DEFAULT NULL,
  `min_day_before_booking` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tour_category`
--

CREATE TABLE `bravo_tour_category` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tour_category_translations`
--

CREATE TABLE `bravo_tour_category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tour_dates`
--

CREATE TABLE `bravo_tour_dates` (
  `id` bigint UNSIGNED NOT NULL,
  `target_id` bigint DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `person_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_instant` tinyint DEFAULT '0',
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tour_meta`
--

CREATE TABLE `bravo_tour_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `tour_id` int DEFAULT NULL,
  `enable_person_types` tinyint DEFAULT NULL,
  `person_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enable_extra_price` tinyint DEFAULT NULL,
  `extra_price` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount_by_people` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enable_open_hours` tinyint DEFAULT NULL,
  `open_hours` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tour_term`
--

CREATE TABLE `bravo_tour_term` (
  `id` bigint UNSIGNED NOT NULL,
  `term_id` int DEFAULT NULL,
  `tour_id` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_tour_translations`
--

CREATE TABLE `bravo_tour_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faqs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `include` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exclude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `itinerary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `surrounding` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bravo_user_plan`
--

CREATE TABLE `bravo_user_plan` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `max_service` int DEFAULT '0',
  `price` decimal(12,2) DEFAULT NULL,
  `plan_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT '1',
  `user_id` bigint DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bravo_user_plan`
--

INSERT INTO `bravo_user_plan` (`id`, `plan_id`, `start_date`, `end_date`, `max_service`, `price`, `plan_data`, `status`, `user_id`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-04-05 18:36:13', '2024-05-05 18:36:13', 20, '499.00', '{\"id\":2,\"title\":\"Standard\",\"content\":\"<ul><li>5 service posting<\\/li><li>2 featured service<\\/li><li>Service displayed for 20 days<\\/li><li>Premium Support 24\\/7<\\/li><\\/ul>\",\"price\":\"499.00\",\"duration\":\"1\",\"duration_type\":\"month\",\"annual_price\":\"1499.00\",\"max_service\":\"20\",\"status\":\"draft\",\"role_id\":\"2\",\"is_recommended\":\"1\",\"deleted_at\":null,\"create_user\":null,\"update_user\":null,\"created_at\":\"2024-04-02T07:17:51.000000Z\",\"updated_at\":\"2024-04-05T18:45:17.000000Z\",\"image_id\":null,\"is_annual\":\"0\"}', 1, 6, 6, 1, '2024-04-05 18:36:13', '2024-04-05 20:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `favorite_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `to_id` bigint NOT NULL,
  `body` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_inbox`
--

CREATE TABLE `core_inbox` (
  `id` bigint UNSIGNED NOT NULL,
  `from_user` bigint DEFAULT NULL,
  `to_user` bigint DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `object_model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT '0',
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_inbox_messages`
--

CREATE TABLE `core_inbox_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `inbox_id` bigint DEFAULT NULL,
  `from_user` bigint DEFAULT NULL,
  `to_user` bigint DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` tinyint DEFAULT '0',
  `is_read` tinyint DEFAULT '0',
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_languages`
--

CREATE TABLE `core_languages` (
  `id` bigint UNSIGNED NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `last_build_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_languages`
--

INSERT INTO `core_languages` (`id`, `locale`, `name`, `flag`, `status`, `create_user`, `update_user`, `last_build_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'gb', 'publish', 1, NULL, NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `core_menus`
--

CREATE TABLE `core_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_menus`
--

INSERT INTO `core_menus` (`id`, `name`, `items`, `create_user`, `update_user`, `origin_id`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Main Menu', '[{\"name\":\"Home\",\"url\":\"\\/\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"Hotel\",\"url\":\"\\/hotel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[{\"name\":\"Hotel List\",\"url\":\"\\/hotel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"Hotel Map\",\"url\":\"\\/hotel?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"Hotel Detail\",\"url\":\"\\/hotel\\/parian-holiday-villas\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]}]},{\"name\":\"Pages\",\"url\":\"#\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[{\"name\":\"Plan\",\"url\":\"\\/plan\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"News List\",\"url\":\"\\/news\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"News Detail\",\"url\":\"\\/news\\/morning-in-the-northern-sea\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"Location Detail\",\"url\":\"\\/location\\/paris\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"name\":\"Become a vendor\",\"url\":\"\\/page\\/become-a-vendor\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]},{\"id\":10,\"name\":\"Become a agent\",\"class\":\"\",\"target\":\"\",\"open\":false,\"item_model\":\"Modules\\\\Page\\\\Models\\\\Page\",\"origin_name\":\"Page\",\"model_name\":\"Page\",\"_open\":false},{\"name\":\"Contact\",\"url\":\"\\/contact\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"is_removed\":true,\"_open\":false,\"children\":[]}]}]', 1, 1, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 20:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu_translations`
--

CREATE TABLE `core_menu_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_menu_translations`
--

INSERT INTO `core_menu_translations` (`id`, `origin_id`, `locale`, `items`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'ja', '[{\"name\":\"Home\",\"url\":\"\\/ja\\/\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Home Page\",\"url\":\"\\/ja\\/\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Page v2\",\"url\":\"\\/ja\\/page\\/home-page-v2\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Hotel\",\"url\":\"\\/ja\\/page\\/hotel\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Tour Agency\",\"url\":\"\\/ja\\/page\\/home-tour-agency\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Tour\",\"url\":\"\\/ja\\/page\\/tour\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Space\",\"url\":\"\\/ja\\/page\\/space\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Car\",\"url\":\"\\/ja\\/page\\/car\",\"item_model\":\"custom\",\"children\":[]}]},{\"name\":\"Hotel\",\"url\":\"\\/ja\\/hotel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Hotel List\",\"url\":\"\\/ja\\/hotel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Hotel Map\",\"url\":\"\\/ja\\/hotel?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Hotel Detail\",\"url\":\"\\/ja\\/hotel\\/parian-holiday-villas\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Tours\",\"url\":\"\\/ja\\/tour\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Tour List\",\"url\":\"\\/ja\\/tour\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Tour Map\",\"url\":\"\\/ja\\/tour?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Tour Detail\",\"url\":\"\\/ja\\/tour\\/paris-vacation-travel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Space\",\"url\":\"\\/ja\\/space\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Space List\",\"url\":\"\\/ja\\/space\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Space Map\",\"url\":\"\\/ja\\/space?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Space Detail\",\"url\":\"\\/ja\\/space\\/stay-greenwich-village\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Car\",\"url\":\"\\/ja\\/car\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Car List\",\"url\":\"\\/ja\\/car\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Car Map\",\"url\":\"\\/ja\\/car?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Car Detail\",\"url\":\"\\/ja\\/car\\/vinfast-lux-a20-plus\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Event\",\"url\":\"\\/ja\\/event\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Event List\",\"url\":\"\\/ja\\/event\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Event Map\",\"url\":\"\\/ja\\/event?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Event Detail\",\"url\":\"\\/ja\\/event\\/aspen-glade-weddings-events\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Flight\",\"url\":\"\\/ja\\/flight\",\"item_model\":\"custom\",\"model_name\":\"Custom\"},{\"name\":\"Boat\",\"url\":\"\\/ja\\/boat\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Boat List\",\"url\":\"\\/ja\\/boat\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Boat Map\",\"url\":\"\\/ja\\/boat?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Boat Detail\",\"url\":\"\\/ja\\/boat\\/blue-moon-yc-300\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Pages\",\"url\":\"#\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Plan\",\"url\":\"\\/ja\\/plan\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"News List\",\"url\":\"\\/ja\\/news\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"News Detail\",\"url\":\"\\/ja\\/news\\/morning-in-the-northern-sea\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Location Detail\",\"url\":\"\\/ja\\/location\\/paris\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Become a vendor\",\"url\":\"\\/ja\\/page\\/become-a-vendor\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Contact\",\"url\":\"\\/ja\\/contact\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]}]', 1, NULL, '2024-04-02 07:17:12', NULL),
(2, 1, 'egy', '[{\"name\":\"Home\",\"url\":\"\\/egy\\/\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Home Page\",\"url\":\"\\/egy\\/\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Page v2\",\"url\":\"\\/egy\\/page\\/home-page-v2\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Hotel\",\"url\":\"\\/egy\\/page\\/hotel\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Tour Agency\",\"url\":\"\\/egy\\/page\\/home-tour-agency\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Tour\",\"url\":\"\\/egy\\/page\\/tour\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Space\",\"url\":\"\\/egy\\/page\\/space\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Home Car\",\"url\":\"\\/egy\\/page\\/car\",\"item_model\":\"custom\",\"children\":[]}]},{\"name\":\"Hotel\",\"url\":\"\\/egy\\/hotel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Hotel List\",\"url\":\"\\/egy\\/hotel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Hotel Map\",\"url\":\"\\/egy\\/hotel?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Hotel Detail\",\"url\":\"\\/egy\\/hotel\\/parian-holiday-villas\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Tours\",\"url\":\"\\/egy\\/tour\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Tour List\",\"url\":\"\\/egy\\/tour\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Tour Map\",\"url\":\"\\/egy\\/tour?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Tour Detail\",\"url\":\"\\/egy\\/tour\\/paris-vacation-travel\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Space\",\"url\":\"\\/egy\\/space\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Space List\",\"url\":\"\\/egy\\/space\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Space Map\",\"url\":\"\\/egy\\/space?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Space Detail\",\"url\":\"\\/egy\\/space\\/stay-greenwich-village\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Car\",\"url\":\"\\/egy\\/car\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Car List\",\"url\":\"\\/egy\\/car\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Car Map\",\"url\":\"\\/egy\\/car?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Car Detail\",\"url\":\"\\/egy\\/car\\/vinfast-lux-a20-plus\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Event\",\"url\":\"\\/egy\\/event\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Event List\",\"url\":\"\\/egy\\/event\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Event Map\",\"url\":\"\\/egy\\/event?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Event Detail\",\"url\":\"\\/egy\\/event\\/aspen-glade-weddings-events\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Flight\",\"url\":\"\\/egy\\/flight\",\"item_model\":\"custom\",\"model_name\":\"Custom\"},{\"name\":\"Boat\",\"url\":\"\\/egy\\/boat\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Boat List\",\"url\":\"\\/egy\\/boat\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Boat Map\",\"url\":\"\\/egy\\/boat?_layout=map\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Boat Detail\",\"url\":\"\\/egy\\/boat\\/blue-moon-yc-300\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]},{\"name\":\"Pages\",\"url\":\"#\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[{\"name\":\"Plan\",\"url\":\"\\/egy\\/plan\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"News List\",\"url\":\"\\/egy\\/news\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"News Detail\",\"url\":\"\\/egy\\/news\\/morning-in-the-northern-sea\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]},{\"name\":\"Location Detail\",\"url\":\"\\/egy\\/location\\/paris\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Become a vendor\",\"url\":\"\\/egy\\/page\\/become-a-vendor\",\"item_model\":\"custom\",\"children\":[]},{\"name\":\"Contact\",\"url\":\"\\/egy\\/contact\",\"item_model\":\"custom\",\"model_name\":\"Custom\",\"children\":[]}]}]', 1, NULL, '2024-04-02 07:17:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_news`
--

CREATE TABLE `core_news` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `gallery` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_news_category`
--

CREATE TABLE `core_news_category` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_news_category_translations`
--

CREATE TABLE `core_news_category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_news_tag`
--

CREATE TABLE `core_news_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `news_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_news_translations`
--

CREATE TABLE `core_news_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_notifications`
--

CREATE TABLE `core_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `from_user` bigint DEFAULT NULL,
  `to_user` bigint DEFAULT NULL,
  `is_read` tinyint DEFAULT '0',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` bigint DEFAULT NULL,
  `target_parent_id` bigint DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_pages`
--

CREATE TABLE `core_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `show_template` tinyint DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_logo` int DEFAULT NULL,
  `author_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_pages`
--

INSERT INTO `core_pages` (`id`, `slug`, `title`, `content`, `short_desc`, `status`, `publish_date`, `image_id`, `template_id`, `show_template`, `create_user`, `update_user`, `deleted_at`, `origin_id`, `lang`, `created_at`, `updated_at`, `header_style`, `custom_logo`, `author_id`) VALUES
(1, 'home-page', 'Home Page', NULL, NULL, 'publish', NULL, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 17:39:40', NULL, NULL, 1),
(2, 'tour', 'Home Tour', NULL, NULL, 'publish', NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', NULL, NULL, NULL, 1),
(3, 'space', 'Home Space', NULL, NULL, 'publish', NULL, NULL, 3, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', NULL, NULL, NULL, 1),
(4, 'hotel', 'Home Hotel', NULL, NULL, 'publish', NULL, NULL, 4, 1, 1, 1, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-29 06:10:25', NULL, NULL, 1),
(5, 'become-a-vendor', 'Become a vendor', NULL, NULL, 'publish', NULL, NULL, 5, 1, 1, 1, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 20:00:37', NULL, NULL, 1),
(6, 'car', 'Home Car', NULL, NULL, 'publish', NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', NULL, NULL, NULL, 1),
(7, 'home-page-v2', 'Home Page v2', NULL, NULL, 'publish', NULL, NULL, 8, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', NULL, 'transparent', 201, 1),
(8, 'home-tour-agency', 'Home Tour Agency', NULL, NULL, 'publish', NULL, NULL, 7, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', NULL, 'transparent', 201, 1),
(9, 'privacy-policy', 'Privacy policy', '<h1>Privacy policy</h1>\r\n<p> This privacy policy (\"Policy\") describes how the personally identifiable information (\"Personal Information\") you may provide on the <a target=\"_blank\" href=\"http://dev.bookingcore.co\" rel=\"noreferrer noopener\">dev.bookingcore.co</a> website (\"Website\" or \"Service\") and any of its related products and services (collectively, \"Services\") is collected, protected and used. It also describes the choices available to you regarding our use of your Personal Information and how you can access and update this information. This Policy is a legally binding agreement between you (\"User\", \"you\" or \"your\") and this Website operator (\"Operator\", \"we\", \"us\" or \"our\"). By accessing and using the Website and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. This Policy does not apply to the practices of companies that we do not own or control, or to individuals that we do not employ or manage.</p>\r\n<h2>Automatic collection of information</h2>\r\n<p>When you open the Website, our servers automatically record information that your browser sends. This data may include information such as your device\'s IP address, browser type and version, operating system type and version, language preferences or the webpage you were visiting before you came to the Website and Services, pages of the Website and Services that you visit, the time spent on those pages, information you search for on the Website, access times and dates, and other statistics.</p>\r\n<p>Information collected automatically is used only to identify potential cases of abuse and establish statistical information regarding the usage and traffic of the Website and Services. This statistical information is not otherwise aggregated in such a way that would identify any particular user of the system.</p>\r\n<h2>Collection of personal information</h2>\r\n<p>You can access and use the Website and Services without telling us who you are or revealing any information by which someone could identify you as a specific, identifiable individual. If, however, you wish to use some of the features on the Website, you may be asked to provide certain Personal Information (for example, your name and e-mail address). We receive and store any information you knowingly provide to us when you create an account, publish content,  or fill any online forms on the Website. When required, this information may include the following:</p>\r\n<ul>\r\n<li>Personal details such as name, country of residence, etc.</li>\r\n<li>Contact information such as email address, address, etc.</li>\r\n<li>Account details such as user name, unique user ID, password, etc.</li>\r\n<li>Information about other individuals such as your family members, friends, etc.</li>\r\n</ul>\r\n<p>Some of the information we collect is directly from you via the Website and Services. However, we may also collect Personal Information about you from other sources such as public databases and our joint marketing partners. You can choose not to provide us with your Personal Information, but then you may not be able to take advantage of some of the features on the Website. Users who are uncertain about what information is mandatory are welcome to contact us.</p>\r\n<h2>Use and processing of collected information</h2>\r\n<p>In order to make the Website and Services available to you, or to meet a legal obligation, we need to collect and use certain Personal Information. If you do not provide the information that we request, we may not be able to provide you with the requested products or services. Any of the information we collect from you may be used for the following purposes:</p>\r\n<ul>\r\n<li>Create and manage user accounts</li>\r\n<li>Send administrative information</li>\r\n<li>Request user feedback</li>\r\n<li>Improve user experience</li>\r\n<li>Enforce terms and conditions and policies</li>\r\n<li>Run and operate the Website and Services</li>\r\n</ul>\r\n<p>Processing your Personal Information depends on how you interact with the Website and Services, where you are located in the world and if one of the following applies: (i) you have given your consent for one or more specific purposes; this, however, does not apply, whenever the processing of Personal Information is subject to European data protection law; (ii) provision of information is necessary for the performance of an agreement with you and/or for any pre-contractual obligations thereof; (iii) processing is necessary for compliance with a legal obligation to which you are subject; (iv) processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in us; (v) processing is necessary for the purposes of the legitimate interests pursued by us or by a third party.</p>\r\n<p> Note that under some legislations we may be allowed to process information until you object to such processing (by opting out), without having to rely on consent or any other of the following legal bases below. In any case, we will be happy to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Information is a statutory or contractual requirement, or a requirement necessary to enter into a contract.</p>\r\n<h2>Managing information</h2>\r\n<p>You are able to delete certain Personal Information we have about you. The Personal Information you can delete may change as the Website and Services change. When you delete Personal Information, however, we may maintain a copy of the unrevised Personal Information in our records for the duration necessary to comply with our obligations to our affiliates and partners, and for the purposes described below. If you would like to delete your Personal Information or permanently delete your account, you can do so by contacting us.</p>\r\n<h2>Disclosure of information</h2>\r\n<p> Depending on the requested Services or as necessary to complete any transaction or provide any service you have requested, we may share your information with your consent with our trusted third parties that work with us, any other affiliates and subsidiaries we rely upon to assist in the operation of the Website and Services available to you. We do not share Personal Information with unaffiliated third parties. These service providers are not authorized to use or disclose your information except as necessary to perform services on our behalf or comply with legal requirements. We may share your Personal Information for these purposes only with third parties whose privacy policies are consistent with ours or who agree to abide by our policies with respect to Personal Information. These third parties are given Personal Information they need only in order to perform their designated functions, and we do not authorize them to use or disclose Personal Information for their own marketing or other purposes.</p>\r\n<p>We will disclose any Personal Information we collect, use or receive if required or permitted by law, such as to comply with a subpoena, or similar legal process, and when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request.</p>\r\n<h2>Retention of information</h2>\r\n<p>We will retain and use your Personal Information for the period necessary to comply with our legal obligations, resolve disputes, and enforce our agreements unless a longer retention period is required or permitted by law. We may use any aggregated data derived from or incorporating your Personal Information after you update or delete it, but not in a manner that would identify you personally. Once the retention period expires, Personal Information shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after the expiration of the retention period.</p>\r\n<h2>The rights of users</h2>\r\n<p>You may exercise certain rights regarding your information processed by us. In particular, you have the right to do the following: (i) you have the right to withdraw consent where you have previously given your consent to the processing of your information; (ii) you have the right to object to the processing of your information if the processing is carried out on a legal basis other than consent; (iii) you have the right to learn if information is being processed by us, obtain disclosure regarding certain aspects of the processing and obtain a copy of the information undergoing processing; (iv) you have the right to verify the accuracy of your information and ask for it to be updated or corrected; (v) you have the right, under certain circumstances, to restrict the processing of your information, in which case, we will not process your information for any purpose other than storing it; (vi) you have the right, under certain circumstances, to obtain the erasure of your Personal Information from us; (vii) you have the right to receive your information in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that your information is processed by automated means and that the processing is based on your consent, on a contract which you are part of or on pre-contractual obligations thereof.</p>\r\n<h2>Privacy of children</h2>\r\n<p>We do not knowingly collect any Personal Information from children under the age of 18. If you are under the age of 18, please do not submit any Personal Information through the Website and Services. We encourage parents and legal guardians to monitor their children\'s Internet usage and to help enforce this Policy by instructing their children never to provide Personal Information through the Website and Services without their permission. If you have reason to believe that a child under the age of 18 has provided Personal Information to us through the Website and Services, please contact us. You must also be old enough to consent to the processing of your Personal Information in your country (in some countries we may allow your parent or guardian to do so on your behalf).</p>\r\n<h2>Cookies</h2>\r\n<p>The Website and Services use \"cookies\" to help personalize your online experience. A cookie is a text file that is placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you, and can only be read by a web server in the domain that issued the cookie to you.</p>\r\n<p>We may use cookies to collect, store, and track information for statistical purposes to operate the Website and Services. You have the ability to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. To learn more about cookies and how to manage them, visit <a target=\"_blank\" href=\"https://www.internetcookies.org\" rel=\"noreferrer noopener\">internetcookies.org</a></p>\r\n<h2>Do Not Track signals</h2>\r\n<p>Some browsers incorporate a Do Not Track feature that signals to websites you visit that you do not want to have your online activity tracked. Tracking is not the same as using or collecting information in connection with a website. For these purposes, tracking refers to collecting personally identifiable information from consumers who use or visit a website or online service as they move across different websites over time. How browsers communicate the Do Not Track signal is not yet uniform. As a result, the Website and Services are not yet set up to interpret or respond to Do Not Track signals communicated by your browser. Even so, as described in more detail throughout this Policy, we limit our use and collection of your personal information.</p>\r\n<h2>Email marketing</h2>\r\n<p>We offer electronic newsletters to which you may voluntarily subscribe at any time. We are committed to keeping your e-mail address confidential and will not disclose your email address to any third parties except as allowed in the information use and processing section or for the purposes of utilizing a third party provider to send such emails. We will maintain the information sent via e-mail in accordance with applicable laws and regulations.</p>\r\n<p>In compliance with the CAN-SPAM Act, all e-mails sent from us will clearly state who the e-mail is from and provide clear information on how to contact the sender. You may choose to stop receiving our newsletter or marketing emails by following the unsubscribe instructions included in these emails or by contacting us. However, you will continue to receive essential transactional emails.</p>\r\n<h2>Links to other resources</h2>\r\n<p>The Website and Services contain links to other resources that are not owned or controlled by us. Please be aware that we are not responsible for the privacy practices of such other resources or third parties. We encourage you to be aware when you leave the Website and Services and to read the privacy statements of each and every resource that may collect Personal Information.</p>\r\n<h2>Information security</h2>\r\n<p>We secure information you provide on computer servers in a controlled, secure environment, protected from unauthorized access, use, or disclosure. We maintain reasonable administrative, technical, and physical safeguards in an effort to protect against unauthorized access, use, modification, and disclosure of Personal Information in its control and custody. However, no data transmission over the Internet or wireless network can be guaranteed. Therefore, while we strive to protect your Personal Information, you acknowledge that (i) there are security and privacy limitations of the Internet which are beyond our control; (ii) the security, integrity, and privacy of any and all information and data exchanged between you and the Website and Services cannot be guaranteed; and (iii) any such information and data may be viewed or tampered with in transit by a third party, despite best efforts.</p>\r\n<h2>Data breach</h2>\r\n<p>In the event we become aware that the security of the Website and Services has been compromised or users Personal Information has been disclosed to unrelated third parties as a result of external activity, including, but not limited to, security attacks or fraud, we reserve the right to take reasonably appropriate measures, including, but not limited to, investigation and reporting, as well as notification to and cooperation with law enforcement authorities. In the event of a data breach, we will make reasonable efforts to notify affected individuals if we believe that there is a reasonable risk of harm to the user as a result of the breach or if notice is otherwise required by law. When we do, we will post a notice on the Website, send you an email.</p>\r\n<h2>Changes and amendments</h2>\r\n<p>We reserve the right to modify this Policy or its terms relating to the Website and Services from time to time in our discretion and will notify you of any material changes to the way in which we treat Personal Information. When we do, we will post a notification on the main page of the Website. We may also provide notice to you in other ways in our discretion, such as through contact information you have provided. Any updated version of this Policy will be effective immediately upon the posting of the revised Policy unless otherwise specified. Your continued use of the Website and Services after the effective date of the revised Policy (or such other act specified at that time) will constitute your consent to those changes. However, we will not, without your consent, use your Personal Information in a manner materially different than what was stated at the time your Personal Information was collected. Policy was created with <a style=\"color:inherit;\" target=\"_blank\" href=\"https://www.websitepolicies.com/privacy-policy-generator\" rel=\"noreferrer noopener\">WebsitePolicies</a>.</p>\r\n<h2>Acceptance of this policy</h2>\r\n<p>You acknowledge that you have read this Policy and agree to all its terms and conditions. By accessing and using the Website and Services you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to access or use the Website and Services.</p>\r\n<h2>Contacting us</h2>\r\n<p>If you would like to contact us to understand more about this Policy or wish to contact us concerning any matter relating to individual rights and your Personal Information, you may do so via the <a target=\"_blank\" href=\"http://dev.bookingcore.co/contact\" rel=\"noreferrer noopener\">contact form</a></p>\r\n<p>This document was last updated on October 6, 2020</p>', NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:13', NULL, NULL, 1),
(10, 'become-a-agent', 'Become a agent', NULL, NULL, 'publish', NULL, NULL, 9, 1, 1, 1, NULL, NULL, NULL, '2024-04-02 20:00:02', '2024-04-02 20:00:30', 'normal', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_translations`
--

CREATE TABLE `core_page_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_roles`
--

CREATE TABLE `core_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` decimal(8,2) DEFAULT NULL,
  `commission_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_roles`
--

INSERT INTO `core_roles` (`id`, `name`, `code`, `commission`, `commission_type`, `create_user`, `update_user`, `status`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'administrator', NULL, 'default', NULL, NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(2, 'vendor', 'vendor', NULL, 'default', NULL, NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(3, 'customer', 'customer', NULL, 'default', NULL, NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(4, 'Agent', 'agent', NULL, 'default', 1, NULL, NULL, '2024-04-02 07:25:05', '2024-04-02 07:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `core_role_permissions`
--

CREATE TABLE `core_role_permissions` (
  `id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_role_permissions`
--

INSERT INTO `core_role_permissions` (`id`, `role_id`, `permission`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'report_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(2, 1, 'contact_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(3, 1, 'newsletter_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(4, 1, 'language_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(5, 1, 'language_translation', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(6, 1, 'booking_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(7, 1, 'booking_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(8, 1, 'booking_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(9, 1, 'enquiry_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(10, 1, 'enquiry_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(11, 1, 'enquiry_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(12, 1, 'template_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(13, 1, 'template_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(14, 1, 'template_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(15, 1, 'template_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(16, 1, 'news_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(17, 1, 'news_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(18, 1, 'news_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(19, 1, 'news_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(20, 1, 'news_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(21, 1, 'role_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(22, 1, 'role_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(23, 1, 'role_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(24, 1, 'role_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(25, 1, 'role_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(26, 1, 'permission_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(27, 1, 'permission_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(28, 1, 'permission_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(29, 1, 'permission_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(30, 1, 'dashboard_access', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(31, 1, 'dashboard_vendor_access', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(32, 1, 'setting_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(33, 1, 'menu_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(34, 1, 'menu_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(35, 1, 'menu_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(36, 1, 'menu_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(37, 1, 'user_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(38, 1, 'user_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(39, 1, 'user_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(40, 1, 'user_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(41, 1, 'page_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(42, 1, 'page_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(43, 1, 'page_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(44, 1, 'page_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(45, 1, 'page_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(46, 1, 'setting_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(47, 1, 'media_upload', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(48, 1, 'media_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(49, 1, 'location_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(50, 1, 'location_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(51, 1, 'location_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(52, 1, 'location_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(53, 1, 'location_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(54, 1, 'review_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(55, 1, 'system_log_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(57, 1, 'social_manage_forum', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(58, 1, 'plugin_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(59, 1, 'vendor_payout_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(60, 1, 'vendor_payout_manage', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(61, 1, 'popup_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(62, 1, 'popup_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(63, 1, 'popup_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(64, 1, 'popup_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(65, 1, 'media_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(66, 1, 'booking_manual', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(67, 1, 'hotel_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(68, 1, 'hotel_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(69, 1, 'hotel_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(70, 1, 'hotel_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(71, 1, 'hotel_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(72, 1, 'hotel_manage_attributes', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(85, 1, 'event_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(86, 1, 'event_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(87, 1, 'event_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(88, 1, 'event_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(89, 1, 'event_manage_others', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(90, 1, 'event_manage_attributes', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(109, 1, 'agent_booking', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(110, 1, 'booking_manage_agent', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(111, 1, 'dashboard_agent_access', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(112, 1, 'coupon_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(113, 1, 'coupon_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(114, 1, 'coupon_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(115, 1, 'coupon_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(116, 2, 'media_upload', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(121, 2, 'dashboard_vendor_access', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(126, 2, 'hotel_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(127, 2, 'hotel_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(128, 2, 'hotel_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(129, 2, 'hotel_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(134, 2, 'event_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(135, 2, 'event_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(136, 2, 'event_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(137, 2, 'event_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(138, 2, 'news_view', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(139, 2, 'news_create', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(140, 2, 'news_update', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(141, 2, 'news_delete', NULL, NULL, '2024-04-02 07:17:11', '2024-04-02 07:17:11'),
(142, 2, 'enquiry_view', NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(143, 2, 'enquiry_update', NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(154, 4, 'booking_manage_agent', 1, NULL, '2024-04-02 07:26:49', '2024-04-02 07:26:49'),
(155, 4, 'dashboard_agent_access', 1, NULL, '2024-04-02 07:26:49', '2024-04-02 07:26:49'),
(156, 4, 'agent_booking', 1, NULL, '2024-04-02 07:26:49', '2024-04-02 07:26:49'),
(157, 1, 'theme_manage', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(158, 1, 'space_view', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(159, 1, 'space_create', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(160, 1, 'space_update', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(161, 1, 'space_delete', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(162, 1, 'space_manage_others', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(163, 1, 'space_manage_attributes', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(164, 1, 'tour_view', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(165, 1, 'tour_create', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(166, 1, 'tour_update', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(167, 1, 'tour_delete', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(168, 1, 'tour_manage_others', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(169, 1, 'tour_manage_attributes', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(170, 1, 'boat_view', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(171, 1, 'boat_create', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(172, 1, 'boat_update', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(173, 1, 'boat_delete', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(174, 1, 'boat_manage_others', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(175, 1, 'boat_manage_attributes', 1, NULL, '2024-04-28 18:02:39', '2024-04-28 18:02:39'),
(176, 1, 'car_view', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(177, 1, 'car_create', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(178, 1, 'car_update', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(179, 1, 'car_delete', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(180, 1, 'car_manage_others', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(181, 1, 'car_manage_attributes', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(182, 1, 'flight_view', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(183, 1, 'flight_create', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(184, 1, 'flight_update', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(185, 1, 'flight_delete', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(186, 1, 'flight_manage_others', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08'),
(187, 1, 'flight_manage_attributes', 1, NULL, '2024-04-29 15:59:08', '2024-04-29 15:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `core_settings`
--

CREATE TABLE `core_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `autoload` tinyint DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_settings`
--

INSERT INTO `core_settings` (`id`, `name`, `group`, `val`, `autoload`, `create_user`, `update_user`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'site_locale', 'general', 'en', NULL, 1, 1, NULL, NULL, '2024-04-02 12:02:29'),
(2, 'menu_locations', NULL, '{\"primary\":1}', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 19:13:09'),
(3, 'admin_email', NULL, 'contact@resortbazar.test', NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12'),
(4, 'email_from_name', NULL, 'Resort Bazar', NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12'),
(5, 'email_from_address', NULL, 'contact@resortbazar.test', NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12'),
(6, 'logo_id', NULL, '202', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(7, 'site_favicon', NULL, '204', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 20:14:57'),
(8, 'topbar_left_text', NULL, '<div class=\"socials\">\r\n<a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\r\n<a href=\"#\"><i class=\"fa fa-linkedin\"></i></a>\r\n<a href=\"#\"><i class=\"fa fa-google-plus\"></i></a>\r\n</div>\r\n<span class=\"line\"></span>\r\n<a href=\"mailto:contact@resortbazar.test\">contact@resortbazar.test</a>', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 18:10:04'),
(9, 'footer_text_left', NULL, '<p>Copyright &copy; 2019 by Resort Bazar</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 18:10:04'),
(10, 'footer_text_right', NULL, '<p>Resort Bazar</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(11, 'list_widget_footer', NULL, '[{\"title\":\"NEED HELP?\",\"size\":\"3\",\"content\":\"<div class=\\\"contact\\\">\\r\\n        <div class=\\\"c-title\\\">\\r\\n            Call Us\\r\\n        <\\/div>\\r\\n        <div class=\\\"sub\\\">\\r\\n            + 00 222 44 5678\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n    <div class=\\\"contact\\\">\\r\\n        <div class=\\\"c-title\\\">\\r\\n            Email for Us\\r\\n        <\\/div>\\r\\n        <div class=\\\"sub\\\">\\r\\n            hello@yoursite.com\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n    <div class=\\\"contact\\\">\\r\\n        <div class=\\\"c-title\\\">\\r\\n            Follow Us\\r\\n        <\\/div>\\r\\n        <div class=\\\"sub\\\">\\r\\n            <a href=\\\"#\\\">\\r\\n                <i class=\\\"icofont-facebook\\\"><\\/i>\\r\\n            <\\/a>\\r\\n            <a href=\\\"#\\\">\\r\\n               <i class=\\\"icofont-twitter\\\"><\\/i>\\r\\n            <\\/a>\\r\\n            <a href=\\\"#\\\">\\r\\n                <i class=\\\"icofont-youtube-play\\\"><\\/i>\\r\\n            <\\/a>\\r\\n        <\\/div>\\r\\n    <\\/div>\"},{\"title\":\"COMPANY\",\"size\":\"3\",\"content\":\"<ul>\\r\\n    <li><a href=\\\"#\\\">About Us<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Community Blog<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Rewards<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Work with Us<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Meet the Team<\\/a><\\/li>\\r\\n<\\/ul>\"},{\"title\":\"SUPPORT\",\"size\":\"3\",\"content\":\"<ul>\\r\\n    <li><a href=\\\"#\\\">Account<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Legal<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Contact<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Affiliate Program<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">Privacy Policy<\\/a><\\/li>\\r\\n<\\/ul>\"},{\"title\":\"SETTINGS\",\"size\":\"3\",\"content\":\"<ul>\\r\\n<li><a href=\\\"#\\\">Setting 1<\\/a><\\/li>\\r\\n<li><a href=\\\"#\\\">Setting 2<\\/a><\\/li>\\r\\n<\\/ul>\"}]', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(12, 'list_widget_footer_ja', NULL, '[{\"title\":\"\\u52a9\\u3051\\u304c\\u5fc5\\u8981\\uff1f\",\"size\":\"3\",\"content\":\"<div class=\\\"contact\\\">\\r\\n        <div class=\\\"c-title\\\">\\r\\n            \\u304a\\u96fb\\u8a71\\u304f\\u3060\\u3055\\u3044\\r\\n        <\\/div>\\r\\n        <div class=\\\"sub\\\">\\r\\n            + 00 222 44 5678\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n    <div class=\\\"contact\\\">\\r\\n        <div class=\\\"c-title\\\">\\r\\n            \\u90f5\\u4fbf\\u7269\\r\\n        <\\/div>\\r\\n        <div class=\\\"sub\\\">\\r\\n            hello@yoursite.com\\r\\n        <\\/div>\\r\\n    <\\/div>\\r\\n    <div class=\\\"contact\\\">\\r\\n        <div class=\\\"c-title\\\">\\r\\n            \\u30d5\\u30a9\\u30ed\\u30fc\\u3059\\u308b\\r\\n        <\\/div>\\r\\n        <div class=\\\"sub\\\">\\r\\n            <a href=\\\"#\\\">\\r\\n                <i class=\\\"icofont-facebook\\\"><\\/i>\\r\\n            <\\/a>\\r\\n            <a href=\\\"#\\\">\\r\\n                <i class=\\\"icofont-twitter\\\"><\\/i>\\r\\n            <\\/a>\\r\\n            <a href=\\\"#\\\">\\r\\n                <i class=\\\"icofont-youtube-play\\\"><\\/i>\\r\\n            <\\/a>\\r\\n        <\\/div>\\r\\n    <\\/div>\"},{\"title\":\"\\u4f1a\\u793e\",\"size\":\"3\",\"content\":\"<ul>\\r\\n    <li><a href=\\\"#\\\">\\u7d04, \\u7565<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u30b3\\u30df\\u30e5\\u30cb\\u30c6\\u30a3\\u30d6\\u30ed\\u30b0<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u5831\\u916c<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u3068\\u9023\\u643a<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u30c1\\u30fc\\u30e0\\u306b\\u4f1a\\u3046<\\/a><\\/li>\\r\\n<\\/ul>\"},{\"title\":\"\\u30b5\\u30dd\\u30fc\\u30c8\",\"size\":\"3\",\"content\":\"<ul>\\r\\n    <li><a href=\\\"#\\\">\\u30a2\\u30ab\\u30a6\\u30f3\\u30c8<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u6cd5\\u7684<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u63a5\\u89e6<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u30a2\\u30d5\\u30a3\\u30ea\\u30a8\\u30a4\\u30c8\\u30d7\\u30ed\\u30b0\\u30e9\\u30e0<\\/a><\\/li>\\r\\n    <li><a href=\\\"#\\\">\\u500b\\u4eba\\u60c5\\u5831\\u4fdd\\u8b77\\u65b9\\u91dd<\\/a><\\/li>\\r\\n<\\/ul>\"},{\"title\":\"\\u8a2d\\u5b9a\",\"size\":\"3\",\"content\":\"<ul>\\r\\n<li><a href=\\\"#\\\">\\u8a2d\\u5b9a1<\\/a><\\/li>\\r\\n<li><a href=\\\"#\\\">\\u8a2d\\u5b9a2<\\/a><\\/li>\\r\\n<\\/ul>\"}]', NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12'),
(13, 'page_contact_title', NULL, 'We\'d love to hear from you', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(14, 'page_contact_sub_title', NULL, 'Send us a message and we\'ll respond as soon as possible', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(15, 'page_contact_desc', NULL, '<h3>Resort Bazar</h3>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Tell. + 00 222 444 33</p>\r\n<p>Email. hello@yoursite.com</p>\r\n<p>1355 Market St, Suite 900San, Francisco, CA 94103 United States</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(16, 'page_contact_image', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 07:17:12', '2024-04-02 12:02:29'),
(17, 'api_app_layout', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12'),
(18, 'home_page_id', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-02 12:02:29'),
(19, 'page_contact_title_ja', NULL, 'あなたからの御一報をお待ち', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(20, 'page_contact_sub_title_ja', NULL, '私たちにメッセージを送ってください、私たちはできるだ', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(21, 'currency_main', NULL, 'bdt', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(22, 'currency_format', NULL, 'left', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(23, 'currency_decimal', NULL, '.', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(24, 'currency_thousand', NULL, ',', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(25, 'currency_no_decimal', NULL, '0', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(26, 'extra_currency', NULL, '[{\"currency_main\":\"eur\",\"currency_format\":\"left\",\"currency_thousand\":\",\",\"currency_decimal\":\".\",\"currency_no_decimal\":\"2\",\"rate\":\"0.902807\"},{\"currency_main\":\"jpy\",\"currency_format\":\"right_space\",\"currency_thousand\":\",\",\"currency_decimal\":\".\",\"currency_no_decimal\":\"0\",\"rate\":\"0.00917113\"}]', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(27, 'map_provider', NULL, 'gmap', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(28, 'map_gmap_key', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(29, 'g_offline_payment_enable', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(30, 'g_offline_payment_name', NULL, 'Offline Payment', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 18:44:03'),
(31, 'date_format', NULL, 'd/m/Y', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-02 12:02:29'),
(32, 'site_title', NULL, 'Resort Bazar', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-02 12:02:29'),
(33, 'site_timezone', NULL, 'Asia/Dhaka', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-02 12:02:29'),
(34, 'email_header', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:17:13', '2024-04-03 22:17:23'),
(35, 'email_footer', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:17:13', '2024-04-03 22:17:23'),
(36, 'enable_mail_user_registered', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(37, 'user_content_email_registered', NULL, '<h1 style=\"text-align: center\">Welcome!</h1>\n                    <h3>Hello [first_name] [last_name]</h3>\n                    <p>Thank you for signing up with Booking Core! We hope you enjoy your time with us.</p>\n                    <p>Regards,</p>\n                    <p>Booking Core</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(38, 'admin_enable_mail_user_registered', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(39, 'admin_content_email_user_registered', NULL, '<h3>Hello Administrator</h3>\n                    <p>We have new registration</p>\n                    <p>Full name: [first_name] [last_name]</p>\n                    <p>Email: [email]</p>\n                    <p>Regards,</p>\n                    <p>Booking Core</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(40, 'user_content_email_forget_password', NULL, '<h1>Hello!</h1>\n                    <p>You are receiving this email because we received a password reset request for your account.</p>\n                    <p style=\"text-align: center\">[button_reset_password]</p>\n                    <p>This password reset link expire in 60 minutes.</p>\n                    <p>If you did not request a password reset, no further action is required.\n                    </p>\n                    <p>Regards,</p>\n                    <p>Booking Core</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(41, 'email_driver', NULL, 'log', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(42, 'email_host', NULL, 'smtp.mailgun.org', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(43, 'email_port', NULL, '587', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(44, 'email_encryption', NULL, 'tls', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(45, 'email_username', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(46, 'email_password', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(47, 'email_mailgun_domain', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(48, 'email_mailgun_secret', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(49, 'email_mailgun_endpoint', NULL, 'api.mailgun.net', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(50, 'email_postmark_token', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(51, 'email_ses_key', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(52, 'email_ses_secret', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(53, 'email_ses_region', NULL, 'us-east-1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(54, 'email_sparkpost_secret', NULL, '', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(55, 'booking_enquiry_for_hotel', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(56, 'booking_enquiry_type_hotel', NULL, 'booking_and_enquiry', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(57, 'booking_enquiry_for_tour', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(58, 'booking_enquiry_type_tour', NULL, 'booking_and_enquiry', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(59, 'booking_enquiry_for_space', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(60, 'booking_enquiry_type_space', NULL, 'booking_and_enquiry', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(61, 'booking_enquiry_for_car', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(62, 'booking_enquiry_type_car', NULL, 'booking_and_enquiry', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(63, 'booking_enquiry_for_event', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(64, 'booking_enquiry_type_event', NULL, 'booking_and_enquiry', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(65, 'booking_enquiry_for_boat', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(66, 'booking_enquiry_type_boat', NULL, 'booking_and_enquiry', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(67, 'booking_enquiry_enable_mail_to_vendor', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(68, 'booking_enquiry_mail_to_vendor_content', NULL, '<h3>Hello [vendor_name]</h3>\n                            <p>You get new inquiry request from [email]</p>\n                            <p>Name :[name]</p>\n                            <p>Emai:[email]</p>\n                            <p>Phone:[phone]</p>\n                            <p>Content:[note]</p>\n                            <p>Service:[service_link]</p>\n                            <p>Regards,</p>\n                            <p>Booking Core</p>\n                            </div>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(69, 'booking_enquiry_enable_mail_to_admin', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(70, 'booking_enquiry_mail_to_admin_content', NULL, '<h3>Hello Administrator</h3>\n                            <p>You get new inquiry request from [email]</p>\n                            <p>Name :[name]</p>\n                            <p>Emai:[email]</p>\n                            <p>Phone:[phone]</p>\n                            <p>Content:[note]</p>\n                            <p>Service:[service_link]</p>\n                            <p>Vendor:[vendor_link]</p>\n                            <p>Regards,</p>\n                            <p>Booking Core</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(71, 'vendor_enable', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(72, 'vendor_commission_type', NULL, 'percent', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(73, 'vendor_commission_amount', NULL, '20', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(74, 'vendor_role', NULL, '2', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(75, 'role_verify_fields', NULL, '{\"phone\":{\"name\":\"Phone\",\"type\":\"text\",\"roles\":[\"1\",\"2\",\"3\"],\"required\":null,\"order\":null,\"icon\":\"fa fa-phone\"},\"id_card\":{\"name\":\"ID Card\",\"type\":\"file\",\"roles\":[\"1\",\"2\",\"3\"],\"required\":\"1\",\"order\":\"0\",\"icon\":\"fa fa-id-card\"},\"trade_license\":{\"name\":\"Trade License\",\"type\":\"multi_files\",\"roles\":[\"1\",\"3\"],\"required\":\"1\",\"order\":\"0\",\"icon\":\"fa fa-copyright\"}}', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(76, 'vendor_show_email', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(77, 'vendor_show_phone', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(78, 'enable_mail_vendor_registered', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(79, 'vendor_content_email_registered', NULL, '<h1 style=\"text-align: center;\">Welcome!</h1>\r\n<h3>Hello [first_name] [last_name]</h3>\r\n<p>Thank you for signing up with Booking Core! We hope you enjoy your time with us.</p>\r\n<p>Regards,</p>\r\n<p>Booking Core</p>', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(80, 'admin_enable_mail_vendor_registered', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(81, 'admin_content_email_vendor_registered', NULL, '<h3>Hello Administrator</h3>\r\n<p>An user has been registered as Vendor. Please check the information bellow:</p>\r\n<p>Full name: [first_name] [last_name]</p>\r\n<p>Email: [email]</p>\r\n<p>Registration date: [created_at]</p>\r\n<p>You can approved the request here: [link_approved]</p>\r\n<p>Regards,</p>\r\n<p>ResortBazar</p>', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(82, 'cookie_agreement_enable', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(83, 'cookie_agreement_button_text', NULL, 'Got it', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(84, 'cookie_agreement_content', NULL, '<p>This website requires cookies to provide all of its features. By using our website, you agree to our use of cookies. <a href=\'#\'>More info</a></p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(85, 'logo_invoice_id', NULL, '202', NULL, 1, NULL, NULL, '2024-04-02 07:17:13', '2024-04-03 22:17:23'),
(86, 'invoice_company_info', NULL, '<p><span style=\"font-size: 14pt;\"><strong>Resort Bazar Company</strong></span></p>\r\n<p>Ha Noi, Viet Nam</p>\r\n<p>www.resortbazar.com</p>', NULL, 1, NULL, NULL, '2024-04-02 07:17:13', '2024-04-03 22:17:23'),
(87, 'user_role', NULL, '3', NULL, NULL, NULL, NULL, '2024-04-02 07:17:13', '2024-04-02 07:17:13'),
(88, 'vendor_team_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-05 20:36:07'),
(89, 'user_plans_enable', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:17:13', '2024-04-28 17:21:31'),
(90, 'hotel_page_search_title', 'hotel', 'Search for hotel', NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'hotel_page_limit_item', 'hotel', '9', NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'hotel_page_search_banner', 'hotel', '92', NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'hotel_layout_item_search', 'hotel', 'list', NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'hotel_attribute_show_in_listing_page', 'hotel', '2', NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'hotel_layout_search', 'hotel', 'normal', NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'hotel_enable_review', 'hotel', '1', NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'hotel_review_approved', 'hotel', '0', NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'hotel_review_stats', 'hotel', '[{\"title\":\"Service\"},{\"title\":\"Organization\"},{\"title\":\"Friendliness\"},{\"title\":\"Area Expert\"},{\"title\":\"Safety\"}]', NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'hotel_booking_buyer_fees', 'hotel', '[{\"name\":\"Service fee\",\"desc\":\"This helps us run our platform and offer services like 24\\/7 support on your trip.\",\"name_ja\":\"\\u30b5\\u30fc\\u30d3\\u30b9\\u6599\",\"desc_ja\":\"\\u3053\\u308c\\u306b\\u3088\\u308a\\u3001\\u5f53\\u793e\\u306e\\u30d7\\u30e9\\u30c3\\u30c8\\u30d5\\u30a9\\u30fc\\u30e0\\u3092\\u5b9f\\u884c\\u3057\\u3001\\u65c5\\u884c\\u4e2d\\u306b\",\"price\":\"100\",\"type\":\"one_time\"}]', NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'hotel_map_search_fields', 'hotel', '[{\"field\":\"location\",\"attr\":null,\"position\":\"1\"},{\"field\":\"attr\",\"attr\":\"7\",\"position\":\"2\"},{\"field\":\"date\",\"attr\":null,\"position\":\"3\"},{\"field\":\"price\",\"attr\":null,\"position\":\"4\"},{\"field\":\"advance\",\"attr\":null,\"position\":\"5\"}]', NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'hotel_search_fields', 'hotel', '[{\"title\":\"Location\",\"field\":\"location\",\"size\":\"4\",\"position\":\"1\"},{\"title\":\"Check In - Out\",\"field\":\"date\",\"size\":\"4\",\"position\":\"2\"},{\"title\":\"Guests\",\"field\":\"guests\",\"size\":\"4\",\"position\":\"3\"}]', NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'update_to_110', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:48', '2024-04-02 07:17:48'),
(103, 'update_to_120', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:48', '2024-04-02 07:17:48'),
(104, 'update_to_130', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:48', '2024-04-02 07:17:48'),
(105, 'update_to_140', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:48', '2024-04-02 07:17:48'),
(106, 'update_to_150', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:48', '2024-04-02 07:17:48'),
(107, 'update_to_151', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:48', '2024-04-02 07:17:48'),
(108, 'update_to_160', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(109, 'tour_map_search_fields', 'tour', '', NULL, 1, 1, NULL, NULL, '2024-04-04 20:30:13'),
(110, 'tour_search_fields', 'tour', '', NULL, 1, 1, NULL, NULL, '2024-04-04 20:30:13'),
(111, 'space_search_fields', 'tour', '', NULL, 1, 1, NULL, NULL, '2024-04-04 20:29:30'),
(112, 'car_search_fields', 'car', '[{\"title\":\"Date\",\"field\":\"date\",\"attr\":null,\"size\":\"6\",\"position\":\"1\"},{\"title\":\"Location\",\"field\":\"location\",\"attr\":null,\"size\":\"6\",\"position\":\"2\"}]', NULL, 1, 1, NULL, NULL, '2024-04-29 16:04:05'),
(113, 'booking_enquiry_enable_mail_to_vendor_content', 'enquiry', '<h3>Hello [vendor_name]</h3>\r\n                        <p>You get new inquiry request from [email]</p>\r\n                        <p>Name :[name]</p>\r\n                        <p>Emai:[email]</p>\r\n                        <p>Phone:[phone]</p>\r\n                        <p>Content:[note]</p>\r\n                        <p>Service:[service_link]</p>\r\n                        <p>Regards,</p>\r\n                        <p>Booking Core</p>\r\n                        </div>', NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'booking_enquiry_enable_mail_to_admin_content', 'enquiry', '<h3>Hello Administrator</h3>\r\n                        <p>You get new inquiry request from [email]</p>\r\n                        <p>Name :[name]</p>\r\n                        <p>Emai:[email]</p>\r\n                        <p>Phone:[phone]</p>\r\n                        <p>Content:[note]</p>\r\n                        <p>Service:[service_link]</p>\r\n                        <p>Vendor:[vendor_link]</p>\r\n                        <p>Regards,</p>\r\n                        <p>Booking Core</p>', NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'update_to_170', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(116, 'wallet_credit_exchange_rate', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(117, 'wallet_deposit_rate', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(118, 'wallet_deposit_type', NULL, 'list', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(119, 'wallet_deposit_lists', NULL, '[{\"name\":\"100$\",\"amount\":100,\"credit\":100},{\"name\":\"Bonus 10%\",\"amount\":500,\"credit\":550},{\"name\":\"Bonus 15%\",\"amount\":1000,\"credit\":1150}]', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(120, 'wallet_new_deposit_admin_subject', NULL, 'New credit purchase', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(121, 'wallet_new_deposit_admin_content', NULL, '\n            <h1>Hello [first_name]!</h1>\n            <p>New order has been made:</p>\n            <p>User ID: [create_user]</p>\n            <p>Amount: [amount]</p>\n            <p>Credit: [credit]</p>\n            <p>Gateway: [payment_gateway]</p>\n            <p>Regards,<br>Resort Bazar</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(122, 'wallet_new_deposit_customer_subject', NULL, 'Thank you for your purchasing', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(123, 'wallet_new_deposit_customer_content', NULL, '\n            <h1>Hello [first_name]!</h1>\n            <p>New order has been made:</p>\n            <p>User ID: [create_user]</p>\n            <p>Amount: [amount]</p>\n            <p>Credit: [credit]</p>\n            <p>Gateway: [payment_gateway]</p>\n            <p>Regards,<br>Resort Bazar</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(124, 'wallet_update_deposit_admin_subject', NULL, 'Credit purchase updated', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(125, 'wallet_update_deposit_admin_content', NULL, '\r\n            <h1>Hello [first_name]!</h1>\r\n            <p>Order has been updated:</p>\r\n            <p>Order Status: <strong>[status_name]</strong></p>\r\n            <p>User ID: [create_user]</p>\r\n            <p>Amount: [amount]</p>\r\n            <p>Credit: [credit]</p>\r\n            <p>Gateway: [payment_gateway]</p>\r\n            <p>Regards,<br>Booking Core</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(126, 'wallet_update_deposit_customer_subject', NULL, 'Your credit purchase updated', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(127, 'wallet_update_deposit_customer_content', NULL, '\n            <h1>Hello [first_name]!</h1>\n            <p>Order has been updated:</p>\n            <p>Order Status: <strong>[status_name]</strong></p>\n            <p>User ID: [create_user]</p>\n            <p>Amount: [amount]</p>\n            <p>Credit: [credit]</p>\n            <p>Gateway: [payment_gateway]</p>\n            <p>Regards,<br>Resort Bazar</p>', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(128, 'update_to_182', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(129, 'update_to_190', NULL, '1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(130, 'update_to_200', NULL, '2.0.9', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(131, 'update_to_210', NULL, '2.1.0', NULL, NULL, NULL, NULL, '2024-04-02 07:17:49', '2024-04-02 07:17:49'),
(132, 'search_open_tab', NULL, 'current_tab', NULL, NULL, NULL, NULL, '2024-04-02 07:17:50', '2024-04-02 07:17:50'),
(133, 'map_clustering', NULL, 'on', NULL, NULL, NULL, NULL, '2024-04-02 07:17:50', '2024-04-02 07:17:50'),
(134, 'map_fit_bounds', NULL, 'on', NULL, NULL, NULL, NULL, '2024-04-02 07:17:50', '2024-04-02 07:17:50'),
(135, 'update_to_220', NULL, '2.2.0.1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:50', '2024-04-02 07:17:50'),
(136, 'update_to_230', NULL, '2.3.0', NULL, NULL, NULL, NULL, '2024-04-02 07:17:50', '2024-04-02 07:17:50'),
(137, 'update_to_240', NULL, '1.0.6', NULL, NULL, NULL, NULL, '2024-04-02 07:17:50', '2024-04-02 07:17:50'),
(138, 'user_plans_page_title', NULL, 'Pricing Packages', NULL, 1, 1, NULL, '2024-04-02 07:17:51', '2024-04-28 17:21:31'),
(139, 'user_plans_page_sub_title', NULL, 'Choose your pricing plan', NULL, 1, 1, NULL, '2024-04-02 07:17:51', '2024-04-28 17:21:31'),
(140, 'user_plans_sale_text', NULL, 'Save up to 10%', NULL, 1, 1, NULL, '2024-04-02 07:17:51', '2024-04-28 17:21:31'),
(141, 'update_to_250', NULL, '1.5.5', NULL, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-02 07:17:51'),
(142, 'update_to_300', NULL, '1.4', NULL, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-02 07:17:51'),
(143, 'update_to_310', NULL, '1.1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-02 07:17:51'),
(144, 'update_to_340', NULL, '1.0', NULL, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-02 07:17:51'),
(145, 'update_to_350', NULL, '1.1', NULL, NULL, NULL, NULL, '2024-04-02 07:17:51', '2024-04-02 07:17:51'),
(146, 'space_disable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-04 22:55:41'),
(147, 'space_page_search_title', NULL, 'Search for space', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(148, 'space_page_search_banner', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(149, 'space_layout_search', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(150, 'space_location_search_style', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(151, 'space_page_limit_item', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(152, 'space_enable_review', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(153, 'space_review_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(154, 'space_enable_review_after_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(155, 'space_review_number_per_page', NULL, '5', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(156, 'space_review_stats', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(157, 'space_page_list_seo_title', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(158, 'space_page_list_seo_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(159, 'space_page_list_seo_image', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(160, 'space_page_list_seo_share', NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(161, 'space_booking_buyer_fees', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(162, 'space_vendor_create_service_must_approved_by_admin', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(163, 'space_allow_vendor_can_change_their_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(164, 'space_allow_vendor_can_change_paid_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(165, 'space_allow_vendor_can_add_service_fee', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(166, 'space_map_search_fields', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-04 20:29:30'),
(167, 'space_allow_review_after_making_completed_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(168, 'space_deposit_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-04 20:29:30'),
(169, 'space_deposit_type', NULL, 'fixed', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(170, 'space_deposit_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(171, 'space_deposit_fomular', NULL, 'default', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(172, 'space_layout_map_option', NULL, 'map_left', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(173, 'space_icon_marker_map', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(174, 'space_booking_type', NULL, 'by_day', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(175, 'space_map_lat_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(176, 'space_map_lng_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(177, 'space_map_zoom_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(178, 'space_location_radius_value', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(179, 'space_location_radius_type', NULL, '3959', NULL, 1, 1, NULL, '2024-04-02 07:23:41', '2024-04-02 13:36:45'),
(180, 'car_disable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-04 22:55:49'),
(181, 'car_page_search_title', NULL, 'Search for car', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:52'),
(182, 'car_page_search_banner', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:52'),
(183, 'car_layout_search', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(184, 'car_location_search_style', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(185, 'car_page_limit_item', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(186, 'car_enable_review', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-29 17:28:15'),
(187, 'car_review_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(188, 'car_enable_review_after_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(189, 'car_review_number_per_page', NULL, '5', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(190, 'car_review_stats', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(191, 'car_page_list_seo_title', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(192, 'car_page_list_seo_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(193, 'car_page_list_seo_image', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(194, 'car_page_list_seo_share', NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(195, 'car_booking_buyer_fees', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(196, 'car_vendor_create_service_must_approved_by_admin', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(197, 'car_allow_vendor_can_change_their_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(198, 'car_allow_vendor_can_change_paid_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(199, 'car_allow_vendor_can_add_service_fee', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(200, 'car_map_search_fields', NULL, '[{\"field\":\"location\",\"attr\":null,\"position\":\"1\"},{\"field\":\"date\",\"attr\":null,\"position\":\"2\"}]', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-29 15:58:34'),
(201, 'car_allow_review_after_making_completed_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(202, 'car_deposit_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-04 20:29:46'),
(203, 'car_deposit_type', NULL, 'fixed', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(204, 'car_deposit_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(205, 'car_deposit_fomular', NULL, 'default', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(206, 'car_layout_map_option', NULL, 'map_left', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(207, 'car_icon_marker_map', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(208, 'car_map_lat_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(209, 'car_map_lng_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(210, 'car_map_zoom_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(211, 'car_location_radius_value', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(212, 'car_location_radius_type', NULL, '3959', NULL, 1, 1, NULL, '2024-04-02 07:23:51', '2024-04-02 13:36:53'),
(213, 'tour_disable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-04 22:56:00'),
(214, 'tour_page_search_title', NULL, 'Search for tour', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(215, 'tour_page_search_banner', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(216, 'tour_layout_search', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(217, 'tour_location_search_style', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(218, 'tour_page_limit_item', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(219, 'tour_enable_review', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(220, 'tour_review_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(221, 'tour_enable_review_after_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(222, 'tour_review_number_per_page', NULL, '5', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(223, 'tour_review_stats', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(224, 'tour_page_list_seo_title', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(225, 'tour_page_list_seo_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(226, 'tour_page_list_seo_image', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(227, 'tour_page_list_seo_share', NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(228, 'tour_booking_buyer_fees', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(229, 'tour_vendor_create_service_must_approved_by_admin', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(230, 'tour_allow_vendor_can_change_their_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(231, 'tour_allow_vendor_can_change_paid_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(232, 'tour_allow_vendor_can_add_service_fee', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(233, 'tour_allow_review_after_making_completed_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(234, 'tour_deposit_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-04 20:30:13'),
(235, 'tour_deposit_type', NULL, 'fixed', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(236, 'tour_deposit_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(237, 'tour_deposit_fomular', NULL, 'default', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(238, 'tour_layout_map_option', NULL, 'map_left', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(239, 'tour_icon_marker_map', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(240, 'tour_map_lat_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(241, 'tour_map_lng_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(242, 'tour_map_zoom_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(243, 'tour_location_radius_value', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(244, 'tour_location_radius_type', NULL, '3959', NULL, 1, 1, NULL, '2024-04-02 07:24:02', '2024-04-02 13:37:10'),
(245, 'flight_disable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-28 17:46:21'),
(246, 'flight_page_search_title', NULL, 'Search for flight', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(247, 'flight_page_search_banner', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(248, 'flight_layout_search', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(249, 'flight_location_search_style', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(250, 'flight_page_limit_item', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(251, 'flight_enable_review', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(252, 'flight_review_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(253, 'flight_enable_review_after_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:12', '2024-04-02 13:37:18'),
(254, 'flight_review_number_per_page', NULL, '5', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(255, 'flight_review_stats', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(256, 'flight_page_list_seo_title', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(257, 'flight_page_list_seo_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(258, 'flight_page_list_seo_image', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(259, 'flight_page_list_seo_share', NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(260, 'flight_booking_buyer_fees', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(261, 'flight_vendor_create_service_must_approved_by_admin', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(262, 'flight_allow_vendor_can_change_their_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(263, 'flight_allow_vendor_can_change_paid_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(264, 'flight_allow_vendor_can_add_service_fee', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(265, 'flight_search_fields', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-04 20:30:24'),
(266, 'flight_map_search_fields', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(267, 'flight_allow_review_after_making_completed_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(268, 'flight_deposit_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(269, 'flight_deposit_type', NULL, 'fixed', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(270, 'flight_deposit_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(271, 'flight_deposit_fomular', NULL, 'default', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(272, 'flight_layout_map_option', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(273, 'flight_icon_marker_map', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(274, 'flight_booking_type', NULL, 'by_day', NULL, 1, 1, NULL, '2024-04-02 07:24:13', '2024-04-02 13:37:18'),
(275, 'boat_disable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:30:32'),
(276, 'boat_page_search_title', NULL, 'Boat', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(277, 'boat_page_search_banner', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(278, 'boat_layout_search', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:31:21'),
(279, 'boat_location_search_style', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(280, 'boat_page_limit_item', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(281, 'boat_enable_review', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 18:04:10'),
(282, 'boat_review_approved', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:32:56'),
(283, 'boat_enable_review_after_booking', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:32:56'),
(284, 'boat_review_number_per_page', NULL, '5', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(285, 'boat_review_stats', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(286, 'boat_page_list_seo_title', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(287, 'boat_page_list_seo_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(288, 'boat_page_list_seo_image', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(289, 'boat_page_list_seo_share', NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(290, 'boat_booking_buyer_fees', NULL, '[{\"name\":\"dfgh\",\"desc\":\"rtyhj\",\"price\":\"34\",\"unit\":\"fixed\",\"type\":\"one_time\"}]', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:32:56'),
(291, 'boat_vendor_create_service_must_approved_by_admin', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 18:04:10'),
(292, 'boat_allow_vendor_can_change_their_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(293, 'boat_allow_vendor_can_change_paid_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(294, 'boat_allow_vendor_can_add_service_fee', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(295, 'boat_search_fields', NULL, '[{\"title\":\"ff\",\"field\":\"date\",\"attr\":null,\"size\":\"4\",\"position\":\"0\"},{\"title\":\"ertyh\",\"field\":\"location\",\"attr\":null,\"size\":\"4\",\"position\":\"1\"},{\"title\":\"edfrghj\",\"field\":null,\"attr\":null,\"size\":\"6\",\"position\":\"2\"}]', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 18:04:39'),
(296, 'boat_map_search_fields', NULL, '[{\"field\":\"location\",\"attr\":null,\"position\":\"1\"}]', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:37:30'),
(297, 'boat_allow_review_after_making_completed_booking', NULL, '[\"completed\"]', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-28 17:32:56'),
(298, 'boat_deposit_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-04 20:30:42'),
(299, 'boat_deposit_type', NULL, 'fixed', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(300, 'boat_deposit_amount', NULL, '0', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(301, 'boat_deposit_fomular', NULL, 'default', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(302, 'boat_layout_map_option', NULL, 'map_left', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(303, 'boat_icon_marker_map', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(304, 'boat_map_lat_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(305, 'boat_map_lng_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(306, 'boat_map_zoom_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(307, 'boat_location_radius_value', NULL, '1', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(308, 'boat_location_radius_type', NULL, '3959', NULL, 1, 1, NULL, '2024-04-02 07:24:23', '2024-04-02 13:37:30'),
(309, 'agent_enable', NULL, '1', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(310, 'agent_commission_type', NULL, 'percent', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(311, 'agent_commission_amount', NULL, '0', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(312, 'agent_auto_approved', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(313, 'agent_role', NULL, '4', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(314, 'agent_show_email', NULL, '1', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(315, 'agent_show_phone', NULL, '1', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(316, 'agent_payout_methods', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(317, 'agent_payout_booking_status', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(318, 'agent_term_conditions', NULL, '9', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(319, 'disable_payout', NULL, '', NULL, 1, 1, NULL, '2024-04-02 07:25:30', '2024-04-03 22:16:48'),
(320, 'enable_mail_agent_registered', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(321, 'agent_subject_email_registered', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(322, 'agent_content_email_registered', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(323, 'admin_enable_mail_agent_registered', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(324, 'admin_subject_email_agent_registered', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(325, 'admin_content_email_agent_registered', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(326, 'agent_team_enable', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(327, 'agent_team_auto_approved', NULL, '', NULL, 1, NULL, NULL, '2024-04-02 07:25:30', '2024-04-02 07:25:30'),
(328, 'event_disable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-28 17:36:13'),
(329, 'event_page_search_title', NULL, 'Event', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-28 17:36:13'),
(330, 'event_page_search_banner', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(331, 'event_layout_search', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24');
INSERT INTO `core_settings` (`id`, `name`, `group`, `val`, `autoload`, `create_user`, `update_user`, `lang`, `created_at`, `updated_at`) VALUES
(332, 'event_location_search_style', NULL, 'normal', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 13:37:02'),
(333, 'event_page_limit_item', NULL, '9', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(334, 'event_enable_review', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(335, 'event_review_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(336, 'event_enable_review_after_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(337, 'event_review_number_per_page', NULL, '5', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(338, 'event_review_stats', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(339, 'event_page_list_seo_title', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(340, 'event_page_list_seo_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(341, 'event_page_list_seo_image', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(342, 'event_page_list_seo_share', NULL, '{\"facebook\":{\"title\":null,\"desc\":null,\"image\":null},\"twitter\":{\"title\":null,\"desc\":null,\"image\":null}}', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(343, 'event_booking_buyer_fees', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(344, 'event_vendor_create_service_must_approved_by_admin', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(345, 'event_allow_vendor_can_change_their_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:24'),
(346, 'event_allow_vendor_can_change_paid_amount', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(347, 'event_allow_vendor_can_add_service_fee', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(348, 'event_search_fields', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-04 20:29:58'),
(349, 'event_map_search_fields', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(350, 'event_allow_review_after_making_completed_booking', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(351, 'event_deposit_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-04 20:29:58'),
(352, 'event_deposit_type', NULL, 'fixed', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(353, 'event_deposit_amount', NULL, '0', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(354, 'event_deposit_fomular', NULL, 'default', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(355, 'event_layout_map_option', NULL, 'map_left', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(356, 'event_booking_type', NULL, 'ticket', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(357, 'event_icon_marker_map', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(358, 'event_map_lat_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(359, 'event_map_lng_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(360, 'event_map_zoom_default', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(361, 'event_location_search_value', NULL, '', NULL, 1, 1, NULL, '2024-04-02 13:37:02', '2024-04-02 18:23:25'),
(362, 'site_desc', NULL, '', NULL, 1, 1, NULL, '2024-04-02 11:56:59', '2024-04-02 12:02:29'),
(363, 'site_first_day_of_the_weekin_calendar', NULL, '0', NULL, 1, 1, NULL, '2024-04-02 11:56:59', '2024-04-02 12:02:29'),
(364, 'site_enable_multi_lang', NULL, '', NULL, 1, 1, NULL, '2024-04-02 11:56:59', '2024-04-02 12:02:29'),
(365, 'enable_rtl', NULL, '', NULL, 1, 1, NULL, '2024-04-02 11:56:59', '2024-04-02 12:02:29'),
(366, 'home_hotel_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 11:56:59', '2024-04-02 12:02:29'),
(367, 'g_offline_payment_logo_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(368, 'g_offline_payment_payment_note', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(369, 'g_offline_payment_html', NULL, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(370, 'g_paypal_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(371, 'g_paypal_name', NULL, 'Paypal', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(372, 'g_paypal_logo_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(373, 'g_paypal_html', NULL, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(374, 'g_paypal_test', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(375, 'g_paypal_convert_to', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(376, 'g_paypal_exchange_rate', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(377, 'g_paypal_test_account', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(378, 'g_paypal_test_client_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(379, 'g_paypal_test_client_secret', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(380, 'g_paypal_account', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(381, 'g_paypal_client_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(382, 'g_paypal_client_secret', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(383, 'g_stripe_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(384, 'g_stripe_name', NULL, 'Stripe', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(385, 'g_stripe_logo_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(386, 'g_stripe_html', NULL, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(387, 'g_stripe_stripe_secret_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(388, 'g_stripe_stripe_publishable_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(389, 'g_stripe_stripe_enable_sandbox', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(390, 'g_stripe_stripe_test_secret_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(391, 'g_stripe_stripe_test_publishable_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(392, 'g_stripe_endpoint_secret', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(393, 'g_payrexx_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(394, 'g_payrexx_name', NULL, 'Payrexx Checkout', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(395, 'g_payrexx_logo_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(396, 'g_payrexx_html', NULL, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(397, 'g_payrexx_instance_name', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(398, 'g_payrexx_api_secret_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(399, 'g_paystack_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(400, 'g_paystack_name', NULL, 'Paystack', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:03'),
(401, 'g_paystack_logo_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(402, 'g_paystack_html', NULL, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(403, 'g_paystack_public_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(404, 'g_paystack_secret_key', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(405, 'g_paystack_payment_url', NULL, 'https://api.paystack.co', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(406, 'g_paystack_merchant_email', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(407, 'g_two_checkout_gateway_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(408, 'g_two_checkout_gateway_name', NULL, 'Two Checkout', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(409, 'g_two_checkout_gateway_logo_id', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(410, 'g_two_checkout_gateway_html', NULL, '<p>&nbsp;</p>\r\n<p>&nbsp;</p>', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(411, 'g_two_checkout_gateway_twocheckout_account_number', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(412, 'g_two_checkout_gateway_twocheckout_secret_word', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(413, 'g_two_checkout_gateway_twocheckout_enable_sandbox', NULL, '', NULL, 1, 1, NULL, '2024-04-02 18:06:46', '2024-04-05 18:44:04'),
(414, 'vendor_auto_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(415, 'vendor_payout_methods', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(416, 'vendor_payout_booking_status', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(417, 'vendor_term_conditions', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(418, 'vendor_subject_email_registered', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(419, 'admin_subject_email_vendor_registered', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(420, 'vendor_team_auto_approved', NULL, '', NULL, 1, 1, NULL, '2024-04-03 22:16:48', '2024-04-05 20:36:07'),
(421, 'booking_enable_recaptcha', NULL, '', NULL, 1, NULL, NULL, '2024-04-03 22:17:23', '2024-04-03 22:17:23'),
(422, 'booking_term_conditions', NULL, '', NULL, 1, NULL, NULL, '2024-04-03 22:17:23', '2024-04-03 22:17:23'),
(423, 'booking_guest_checkout', NULL, '1', NULL, 1, NULL, NULL, '2024-04-03 22:17:23', '2024-04-03 22:17:23'),
(424, 'booking_enable_ticket_guest_info', NULL, '1', NULL, 1, NULL, NULL, '2024-04-03 22:17:23', '2024-04-03 22:17:23'),
(425, 'enable_multi_user_plans', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(426, 'plan_new_payment_admin_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(427, 'plan_new_payment_admin_subject', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(428, 'plan_new_payment_admin_content', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(429, 'plan_update_payment_admin_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(430, 'plan_update_payment_admin_subject', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(431, 'plan_update_payment_admin_content', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(432, 'plan_new_payment_user_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(433, 'plan_new_payment_user_subject', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(434, 'plan_new_payment_user_content', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(435, 'plan_update_payment_user_enable', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(436, 'plan_update_payment_user_subject', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31'),
(437, 'plan_update_payment_user_content', NULL, '', NULL, 1, 1, NULL, '2024-04-23 16:16:26', '2024-04-28 17:21:31');

-- --------------------------------------------------------

--
-- Table structure for table `core_subscribers`
--

CREATE TABLE `core_subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_subscribers`
--

INSERT INTO `core_subscribers` (`id`, `email`, `first_name`, `last_name`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'qwtwptcmbj.c@sandcress.xyz', NULL, NULL, NULL, NULL, NULL, '2024-04-20 16:37:28', '2024-04-20 16:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `core_tags`
--

CREATE TABLE `core_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_tag_translations`
--

CREATE TABLE `core_tag_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_templates`
--

CREATE TABLE `core_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_templates`
--

INSERT INTO `core_templates` (`id`, `title`, `content`, `type_id`, `create_user`, `update_user`, `origin_id`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Home Page', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"660c0580e90a81.88303480\",\"660c0580e90b60.46739498\",\"660c0580e90b95.56030748\",\"660c0580e90bb6.19537822\",\"ae828augcqj8ak2qsncp\",\"660c0580e90bd9.49595331\",\"660c0580e90c11.75664478\",\"660c0580e90c35.05442461\",\"660c0580e90c52.62728127\",\"660c0580e90ca8.90249624\"],\"version\":\"1.1\",\"id\":\"ROOT\",\"component\":\"RegularBlock\",\"name\":\"\",\"model\":[]},\"660c0580e90a81.88303480\":{\"type\":\"form_search_all_service\",\"name\":\"Form Search All Service\",\"model\":{\"service_types\":[\"hotel\",\"space\",\"tour\",\"car\",\"event\",\"flight\",\"boat\"],\"title\":\"Hi There!\",\"sub_title\":\"Where would you like to go?\",\"bg_image\":205,\"style\":\"carousel\",\"list_slider\":[{\"_active\":true,\"bg_image\":47},{\"_active\":true,\"bg_image\":16}],\"title_for_hotel\":\"Resort/Hotel\",\"title_for_space\":\"House Boat\",\"video_url\":\"\",\"hide_form_search\":\"\",\"title_for_car\":\"Car\",\"title_for_event\":\"Event\",\"title_for_tour\":\"Tour\",\"title_for_flight\":\"Flight\",\"title_for_boat\":\"Ship\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c0580e90a81.88303480\"},\"660c0580e90b60.46739498\":{\"type\":\"offer_block\",\"name\":\"Offer Block\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"Up To 50% Discount 1st Booking\",\"desc\":\"Find Your Perfect Hotels Get the best<br>\\nprices on 5,00+ properties<br>\\nthe best prices on\",\"background_image\":\"\",\"link_title\":\"See Deals\",\"link_more\":\"#\",\"featured_text\":\"SUMMER SALE UPTO 60%\"},{\"_active\":true,\"title\":\"Newsletters\",\"desc\":\"Join for free and get our <br>\\ntailored newsletters full of <br>\\nhot travel deals.\",\"background_image\":\"\",\"link_title\":\"SHOP NOW\",\"link_more\":\"#\",\"featured_icon\":\"\",\"featured_text\":\"SUMMER SALE UPTO 60%\"}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c0580e90b60.46739498\"},\"660c0580e90b95.56030748\":{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"RESERVATION\",\"desc\":\"Perfect Recommendation For Your Next Trip\",\"number\":3,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":false,\"custom_ids\":[9,10,15,14,13,12],\"background_image\":108,\"link_title\":\"Contact Us\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c0580e90b95.56030748\"},\"660c0580e90bb6.19537822\":{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":[\"space\",\"hotel\",\"tour\",\"car\",\"event\",\"boat\"],\"title\":\"Top Destinations\",\"desc\":\"It is a long established fact that a reader\",\"number\":6,\"layout\":\"style_5\",\"order\":\"id\",\"order_by\":\"asc\",\"to_location_detail\":\"\",\"custom_ids\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c0580e90bb6.19537822\"},\"660c0580e90ca8.90249624\":{\"type\":\"testimonial\",\"name\":\"List Testimonial\",\"model\":{\"title\":\"Our happy clients\",\"list_item\":[{\"_active\":false,\"name\":\"Eva Hicks\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. \",\"number_star\":5,\"avatar\":1},{\"_active\":false,\"name\":\"Donald Wolf\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. \",\"number_star\":6,\"avatar\":2},{\"_active\":false,\"name\":\"Charlie Harrington\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui.\",\"number_star\":5,\"avatar\":3},{\"_active\":true,\"name\":\"ELIAS BHUIYAN\",\"desc\":\"dfg\",\"number_star\":5,\"avatar\":3}],\"style\":\"carousel\",\"number\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c0580e90ca8.90249624\"},\"ae828augcqj8ak2qsncp\":{\"type\":\"list_car\",\"name\":\"Car: List Items\",\"model\":{\"title\":\"Rent Car\",\"desc\":\"Convenient Car Rentals for Your Trip\",\"number\":3,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\",\"is_featured\":\"\",\"custom_ids\":\"\",\"background_image\":172,\"link_title\":\"SHOP NOW\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"parent\":\"ROOT\",\"id\":\"ae828augcqj8ak2qsncp\"}}', NULL, 1, 1, NULL, NULL, '2024-04-02 07:17:12', '2024-04-30 08:16:44'),
(2, 'Home Tour', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"6614fe1f029d26.24211556\",\"6614fe1f029d95.94664920\",\"6614fe1f029da1.40732728\",\"6614fe1f029db6.90557863\",\"6614fe1f029dc3.28897896\",\"6614fe1f029dd6.73955882\",\"6614fe1f029de9.42826167\"],\"version\":\"1.1\"},\"6614fe1f029d26.24211556\":{\"type\":\"form_search_tour\",\"name\":\"Tour: Form Search\",\"model\":{\"title\":\"Love where you\'re going\",\"sub_title\":\"Book incredible things to do around the world.\",\"bg_image\":20},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614fe1f029d95.94664920\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"1,000+ local guides\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":5},{\"_active\":false,\"title\":\"Handcrafted experiences\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":4},{\"_active\":false,\"title\":\"96% happy travelers\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":6}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614fe1f029da1.40732728\":{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"Trending Tours\",\"number\":5,\"style\":\"carousel\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614fe1f029db6.90557863\":{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"title\":\"Top Destinations\",\"number\":5,\"order\":\"id\",\"order_by\":\"desc\",\"service_type\":\"tour\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614fe1f029dc3.28897896\":{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"Local Experiences You\\u2019ll Love\",\"number\":8,\"style\":\"normal\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614fe1f029dd6.73955882\":{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"Know your city?\",\"sub_title\":\"Join 2000+ locals & 1200+ contributors from 3000 cities\",\"link_title\":\"Become Local Expert\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614fe1f029de9.42826167\":{\"type\":\"testimonial\",\"name\":\"List Testimonial\",\"model\":{\"title\":\"Our happy clients\",\"list_item\":[{\"_active\":false,\"name\":\"Eva Hicks\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. \",\"number_star\":5,\"avatar\":1},{\"_active\":false,\"name\":\"Donald Wolf\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. \",\"number_star\":6,\"avatar\":2},{\"_active\":false,\"name\":\"Charlie Harrington\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui.\",\"number_star\":5,\"avatar\":3}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"}}', NULL, 1, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-09 08:36:47'),
(3, 'Home Space', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"66144f7a263fe7.05611308\",\"66144f7a264035.17143518\",\"66144f7a264040.25499277\",\"66144f7a264058.98855954\",\"66144f7a264060.54084961\",\"66144f7a264074.17210520\"],\"version\":\"1.1\"},\"66144f7a263fe7.05611308\":{\"type\":\"form_search_space\",\"name\":\"Space: Form Search\",\"model\":{\"title\":\"Find your next rental\",\"sub_title\":\"Book incredible things to do around the world.\",\"bg_image\":61},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"66144f7a264035.17143518\":{\"type\":\"list_space\",\"name\":\"Space: List Items\",\"model\":{\"title\":\"Recommended Homes\",\"number\":5,\"style\":\"carousel\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"desc\":\"Homes highly rated for thoughtful design\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"66144f7a264040.25499277\":{\"type\":\"space_term_featured_box\",\"name\":\"Space: Term Featured Box\",\"model\":{\"title\":\"Find a Home Type\",\"desc\":\"It is a long established fact that a reader\",\"term_space\":[\"26\",\"27\",\"28\",\"29\",\"30\",\"31\"]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"66144f7a264058.98855954\":{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":\"space\",\"title\":\"Top Destinations\",\"number\":6,\"order\":\"id\",\"order_by\":\"desc\",\"layout\":\"style_2\",\"desc\":\"It is a long established fact that a reader\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"66144f7a264060.54084961\":{\"type\":\"list_space\",\"name\":\"Space: List Items\",\"model\":{\"title\":\" Rental Listing\",\"desc\":\"Homes highly rated for thoughtful design\",\"number\":4,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"66144f7a264074.17210520\":{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"Know your city?\",\"sub_title\":\"Join 2000+ locals & 1200+ contributors from 3000 cities\",\"link_title\":\"Become Local Expert\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"}}', NULL, 1, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-08 20:11:38'),
(4, 'Home Hotel', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"660c470a6f45f2.72989913\",\"660c470a6f4651.64193635\",\"660c470a6f4668.52324839\",\"660c470a6f4678.26474764\",\"660c470a6f4681.80384916\",\"660c470a6f4691.61702346\",\"660c470a6f46a3.68332376\"],\"version\":\"1.1\"},\"660c470a6f45f2.72989913\":{\"type\":\"form_search_hotel\",\"name\":\"Hotel: Form Search\",\"model\":{\"title\":\"Find Your Perfect Hotels\",\"sub_title\":\"Get the best prices on 20,000+ properties\",\"bg_image\":92},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470a6f4651.64193635\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"20,000+ properties\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":103,\"order\":null},{\"_active\":false,\"title\":\"Trust & Safety\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":104,\"order\":null},{\"_active\":true,\"title\":\"Best Price Guarantee\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":105,\"order\":null}],\"style\":\"normal\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470a6f4668.52324839\":{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"Last Minute Deals\",\"desc\":\"Hotel highly rated for thoughtful design\",\"number\":5,\"style\":\"carousel\",\"location_id\":\"\",\"order\":\"\",\"order_by\":\"\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470a6f4678.26474764\":{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":\"hotel\",\"title\":\"Top Destinations\",\"desc\":\"It is a long established fact that a reader\",\"number\":6,\"layout\":\"style_3\",\"order\":\"\",\"order_by\":\"\",\"to_location_detail\":false},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470a6f4681.80384916\":{\"type\":\"text\",\"name\":\"Text\",\"model\":{\"content\":\"<h2><span style=\\\"color: #1a2b48; font-family: Poppins, sans-serif; font-size: 28px; font-weight: 500; background-color: #ffffff;\\\">Why be a Local Expert<\\/span><\\/h2>\\n<div><span style=\\\"color: #5e6d77; font-family: Poppins, sans-serif; font-size: 10pt; background-color: #ffffff;\\\">Varius massa maecenas et id dictumst mattis<\\/span><\\/div>\",\"class\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470a6f4691.61702346\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"Earn an additional income\",\"sub_title\":\"Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":15,\"order\":null},{\"_active\":false,\"title\":\"Open your network\",\"sub_title\":\"Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":14,\"order\":null},{\"_active\":false,\"title\":\"Practice your language\",\"sub_title\":\"Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":13,\"order\":null}],\"style\":\"style3\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470a6f46a3.68332376\":{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"Bestseller Listing\",\"desc\":\"Hotel highly rated for thoughtful design\",\"number\":8,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"}}', NULL, 1, 1, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 11:57:30'),
(5, 'Become a vendor', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"660c47455373c7.93812035\",\"660c4745537407.02434542\",\"660c4745537420.62006050\",\"660c4745537435.96266279\",\"660c4745537444.98623317\",\"660c4745537457.39042847\",\"660c4745537462.49687318\"],\"version\":\"1.1\",\"id\":\"ROOT\",\"component\":\"RegularBlock\",\"name\":\"\",\"model\":[]},\"660c47455373c7.93812035\":{\"type\":\"vendor_register_form\",\"name\":\"Vendor Register Form\",\"model\":{\"title\":\"Become a vendor\",\"desc\":\"Join our community to unlock your greatest asset and welcome paying guests into your home.\",\"youtube\":\"https://www.youtube.com/watch?v=AmZ0WrEaf34\",\"bg_image\":11},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c47455373c7.93812035\"},\"660c4745537407.02434542\":{\"type\":\"text\",\"name\":\"Text\",\"model\":{\"content\":\"<h3><strong>How does it work?</strong></h3>\",\"class\":\"text-center\",\"padding\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c4745537407.02434542\"},\"660c4745537420.62006050\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"Sign up\",\"sub_title\":\"Click edit button to change this text  to change this text\",\"icon_image\":null,\"order\":null},{\"_active\":false,\"title\":\" Add your services\",\"sub_title\":\" Click edit button to change this text  to change this text\",\"icon_image\":null,\"order\":null},{\"_active\":true,\"title\":\"Get bookings\",\"sub_title\":\" Click edit button to change this text  to change this text\",\"icon_image\":null,\"order\":null}],\"style\":\"style2\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c4745537420.62006050\"},\"660c4745537435.96266279\":{\"type\":\"video_player\",\"name\":\"Video Player\",\"model\":{\"title\":\"Share the beauty of your city\",\"youtube\":\"https://www.youtube.com/watch?v=hHUbLv4ThOo\",\"bg_image\":12},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c4745537435.96266279\"},\"660c4745537444.98623317\":{\"type\":\"text\",\"name\":\"Text\",\"model\":{\"content\":\"<h3><strong>Why be a Local Expert</strong></h3>\",\"class\":\"text-center ptb60\",\"padding\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c4745537444.98623317\"},\"660c4745537457.39042847\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"Earn an additional income\",\"sub_title\":\" Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":15,\"order\":null},{\"_active\":true,\"title\":\"Open your network\",\"sub_title\":\" Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":14,\"order\":null},{\"_active\":true,\"title\":\"Practice your language\",\"sub_title\":\" Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":13,\"order\":null}],\"style\":\"style3\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c4745537457.39042847\"},\"660c4745537462.49687318\":{\"type\":\"faqs\",\"name\":\"FAQ List\",\"model\":{\"title\":\"FAQs\",\"list_item\":[{\"_active\":false,\"title\":\"How will I receive my payment?\",\"sub_title\":\" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\"},{\"_active\":true,\"title\":\"How do I upload products?\",\"sub_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\"},{\"_active\":true,\"title\":\"How do I update or extend my availabilities?\",\"sub_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\\n\"},{\"_active\":true,\"title\":\"How do I increase conversion rate?\",\"sub_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\"}],\"style\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\",\"id\":\"660c4745537462.49687318\"}}', NULL, 1, 1, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 20:10:44'),
(6, 'Home Car', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"6614bdcaef8ab9.79768177\",\"6614bdcaef8b07.60122529\",\"6614bdcaef8b21.19102819\",\"6614bdcaef8b36.78300883\",\"6614bdcaef8b46.49028688\",\"6614bdcaef8b59.69485403\"],\"version\":\"1.1\"},\"6614bdcaef8ab9.79768177\":{\"type\":\"form_search_car\",\"name\":\"Car: Form Search\",\"model\":{\"title\":\"Search Rental Car Deals\",\"sub_title\":\"Book better cars from local hosts across the US and around the world.\",\"bg_image\":122},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614bdcaef8b07.60122529\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"Free Cancellation\",\"sub_title\":\"Morbi semper fames lobortis ac\",\"icon_image\":103,\"order\":null},{\"_active\":true,\"title\":\"No Hidden Costs\",\"sub_title\":\"Morbi semper fames lobortis\",\"icon_image\":104,\"order\":null},{\"_active\":true,\"title\":\"24\\/7 Customer Care\",\"sub_title\":\"Morbi semper fames lobortis\",\"icon_image\":105,\"order\":null}],\"style\":\"normal\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614bdcaef8b21.19102819\":{\"type\":\"car_term_featured_box\",\"name\":\"Car: Term Featured Box\",\"model\":{\"title\":\"Browse by categories\",\"desc\":\"Book incredible things to do around the world.\",\"term_car\":[\"68\",\"67\",\"66\",\"65\",\"64\",\"63\",\"62\",\"61\"]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614bdcaef8b36.78300883\":{\"type\":\"list_car\",\"name\":\"Car: List Items\",\"model\":{\"title\":\"Trending used cars\",\"desc\":\"Book incredible things to do around the world.\",\"number\":8,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614bdcaef8b46.49028688\":{\"type\":\"how_it_works\",\"name\":\"How It Works\",\"model\":{\"title\":\"How does it work?\",\"list_item\":[{\"_active\":false,\"title\":\"Find The Car\",\"sub_title\":\"Lorem Ipsum is simply dummy text of the printing\",\"icon_image\":132,\"order\":null},{\"_active\":false,\"title\":\"Book It\",\"sub_title\":\"Lorem Ipsum is simply dummy text of the printing\",\"icon_image\":133,\"order\":null},{\"_active\":false,\"title\":\"Grab And Go\",\"sub_title\":\"Lorem Ipsum is simply dummy text of the printing\",\"icon_image\":134,\"order\":null}],\"background_image\":131},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"6614bdcaef8b59.69485403\":{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":[\"car\"],\"title\":\"Top destinations\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing\",\"number\":6,\"layout\":\"style_2\",\"order\":\"id\",\"order_by\":\"asc\",\"to_location_detail\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"}}', NULL, 1, NULL, NULL, NULL, '2024-04-02 07:17:12', '2024-04-09 04:02:18'),
(7, 'Home Tour Agency', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"660c470d2a13c3.73947978\",\"660c470d2a1409.38403523\",\"660c470d2a1411.53774812\",\"660c470d2a1428.53100334\",\"660c470d2a1431.75688401\",\"660c470d2a1449.50833912\",\"660c470d2a1452.83690322\",\"660c470d2a1462.32548030\",\"660c470d2a1478.61906549\"],\"version\":\"1.1\"},\"660c470d2a13c3.73947978\":{\"type\":\"form_search_tour\",\"name\":\"Tour: Form Search\",\"model\":{\"title\":\"Love where you\'re going\",\"sub_title\":\"Book incredible things to do around the world.\",\"bg_image\":20,\"style\":\"carousel_v2\",\"list_slider\":[{\"_active\":true,\"title\":\"Love where you\'re going\",\"desc\":\"Book incredible things to do around the world.\",\"bg_image\":199}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1409.38403523\":{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"Go to Venice\",\"number\":5,\"style\":\"carousel_simple\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"desc\":\"It is a long established fact that a reader will be distracted by the readable content of a page ...\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1411.53774812\":{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"Sale up for new year\",\"sub_title\":\"Curabitur blandit tempus\",\"link_title\":\"Read More\",\"link_more\":\"#\",\"bg_color\":\"\",\"style\":\"style_2\",\"bg_image\":196},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1428.53100334\":{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"Popular tour in the month\",\"number\":8,\"style\":\"carousel\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\",\"desc\":\"Local Experiences You\\u2019ll Love \",\"is_featured\":true},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1431.75688401\":{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"Enjoy your holiday\",\"sub_title\":\"Curabitur blandit tempus porttitor\",\"link_title\":\"Explore\",\"link_more\":\"#\",\"style\":\"style_3\",\"bg_color\":\"\",\"bg_image\":197},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1449.50833912\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"1,000+ local guides\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":183},{\"_active\":true,\"title\":\"Handcrafted experiences\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":187},{\"_active\":true,\"title\":\"96% happy travelers\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":185}],\"style\":\"style4\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1452.83690322\":{\"type\":\"box_category_tour\",\"name\":\"Tour: Box Category\",\"model\":{\"title\":\"Top activity\",\"desc\":\"One way to vertically center is to use my-auto\",\"list_item\":[{\"_active\":true,\"category_id\":\"4\",\"image_id\":189},{\"_active\":true,\"category_id\":\"3\",\"image_id\":190},{\"_active\":true,\"category_id\":\"2\",\"image_id\":191},{\"_active\":true,\"category_id\":\"1\",\"image_id\":192},{\"_active\":true,\"category_id\":\"2\",\"image_id\":190}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1462.32548030\":{\"type\":\"client_feedback\",\"name\":\"Client Feedback\",\"model\":{\"title\":\"\",\"image_id\":198,\"list_item\":[{\"_active\":false,\"title\":\"Babila Ebw\\u00e9l\\u00e9\",\"sub_title\":\"BookingCore\",\"desc\":\"We had 10 days. Iguazu Falls, Rio, and Paraty. We had Orico as a guide for the first 4 days...he was fabulous.  \"},{\"_active\":true,\"title\":\"DoQuan\",\"sub_title\":\"Travel\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\"}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c470d2a1478.61906549\":{\"type\":\"list_news\",\"name\":\"News: List Items\",\"model\":{\"title\":\"Recent Articles\",\"desc\":\" One way to vertically center is to use my-auto \",\"number\":3,\"category_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"}}', NULL, 1, 1, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 11:57:33'),
(8, 'Home Page v2', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"660c4707dec0a7.48032442\",\"660c4707dec0e0.13252606\",\"660c4707dec0f3.57603017\",\"660c4707dec102.74081036\",\"660c4707dec119.93965731\",\"660c4707dec124.98996019\",\"660c4707dec130.44893185\",\"660c4707dec144.81989220\",\"660c4707dec158.02844574\",\"660c4707dec166.89384416\",\"660c4707dec173.83688529\"],\"version\":\"1.1\"},\"660c4707dec0a7.48032442\":{\"type\":\"form_search_all_service\",\"name\":\"Form Search All Service\",\"model\":{\"title_for_car\":\"\",\"title_for_event\":\"\",\"title_for_hotel\":\"\",\"title_for_space\":\"\",\"title_for_tour\":\"\",\"service_types\":[\"hotel\",\"tour\",\"space\",\"event\",\"car\"],\"title\":\"\",\"sub_title\":\"\",\"style\":\"carousel_v2\",\"bg_image\":\"\",\"list_slider\":[{\"_active\":true,\"title\":\"The best tour experience\",\"desc\":\" Without the crowds\",\"bg_image\":194},{\"_active\":true,\"title\":\"The best tour experience\",\"desc\":\"This Place is Alive\",\"bg_image\":193}],\"hide_form_search\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec0e0.13252606\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"BEST SELECTION\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":184,\"order\":null},{\"_active\":true,\"title\":\"BEST PRICE GUARANTEE\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":186,\"order\":null},{\"_active\":true,\"title\":\"24\\/7 SUPPORT\",\"sub_title\":\"Morbi semper fames lobortis ac hac penatibus\",\"icon_image\":188,\"order\":null}],\"style\":\"style5\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec0f3.57603017\":{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"Hotel Best\",\"desc\":\"Morbi semper fames lobortis ac hac penatibus\",\"number\":\"\",\"style\":\"carousel\",\"location_id\":\"\",\"order\":\"\",\"order_by\":\"\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec102.74081036\":{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"Discount 50% Off\",\"sub_title\":\"Curabitur blandit tempus porttitor\",\"link_title\":\"Read More\",\"link_more\":\"#\",\"style\":\"style_2\",\"bg_color\":\"\",\"bg_image\":195},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec119.93965731\":{\"type\":\"space_term_featured_box\",\"name\":\"Space: Term Featured Box\",\"model\":{\"title\":\"Top Comfort Service\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\",\"term_space\":[\"27\",\"28\",\"29\",\"30\",\"31\",\"26\"]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec124.98996019\":{\"type\":\"list_space\",\"name\":\"Space: List Items\",\"model\":{\"title\":\"Service Featured Phoenix Resort\",\"desc\":\"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form\",\"number\":8,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"\",\"order_by\":\"\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec130.44893185\":{\"type\":\"client_feedback\",\"name\":\"Client Feedback\",\"model\":{\"image_id\":198,\"list_item\":[{\"_active\":true,\"title\":\"DoQuan\",\"sub_title\":\"Travel\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. \"},{\"_active\":true,\"title\":\"HoangAnh\",\"sub_title\":\"Travel\",\"desc\":\"Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. Faucibus tristique felis potenti ultrices ornare rhoncus semper hac facilisi Rutrum tellus lorem sem velit nisi non pharetra in dui. \"}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec144.81989220\":{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":[\"hotel\",\"space\",\"tour\"],\"title\":\"Travel Highlights\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\",\"number\":3,\"layout\":\"style_4\",\"order\":\"id\",\"order_by\":\"asc\",\"custom_ids\":\"\",\"to_location_detail\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec158.02844574\":{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"Viet Nam Travel\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\",\"number\":5,\"style\":\"normal\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":true},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec166.89384416\":{\"type\":\"list_news\",\"name\":\"News: List Items\",\"model\":{\"title\":\"Travel News\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\",\"number\":3,\"category_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false,\"parent\":\"ROOT\"},\"660c4707dec173.83688529\":{\"type\":\"vendor_list\",\"name\":\"List Vendor\",\"model\":{\"title\":\"Featured Vendor\",\"desc\":\"Lorem ipsum dolor sit amet elit, sed do eiusmod tempor\",\"number\":4,\"order\":\"id\",\"order_by\":\"desc\",\"custom_ids\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"parent\":\"ROOT\"}}', NULL, 1, 1, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 11:57:27'),
(9, 'Become a agent', '{\"ROOT\":{\"type\":\"root\",\"nodes\":[\"yfhj46bczqsqzxt1jicc\",\"c2evjty5uymkne0nposz\",\"spwhzcdr5caz428lkwza\"],\"version\":\"1.1\",\"parent\":\"ROOT\",\"id\":\"ROOT\",\"component\":\"RegularBlock\",\"name\":\"\",\"model\":[]},\"yfhj46bczqsqzxt1jicc\":{\"type\":\"agent_register_form\",\"name\":\"Agent Register Form\",\"model\":{\"title\":\"Become a agent\",\"desc\":\"Join our community to unlock your greatest asset and welcome paying guests into your home.\",\"youtube\":\"\",\"bg_image\":174},\"component\":\"RegularBlock\",\"open\":true,\"parent\":\"ROOT\"},\"c2evjty5uymkne0nposz\":{\"type\":\"text\",\"name\":\"Text\",\"model\":{\"content\":\"<h3 style=\\\"text-align: center;\\\"><strong>How does it work?</strong></h3>\",\"class\":\"\",\"padding\":{\"t\":\"100\",\"r\":\"\",\"b\":\"\",\"l\":\"100\"}},\"component\":\"RegularBlock\",\"open\":true,\"parent\":\"ROOT\"},\"spwhzcdr5caz428lkwza\":{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"Sign up\",\"sub_title\":\"Click edit button to change this text  to change this text\",\"icon_image\":null,\"order\":1},{\"_active\":true,\"title\":\"Verify Your Account\",\"sub_title\":\" Click edit button to change this text  to change this text\",\"icon_image\":null,\"order\":2},{\"_active\":true,\"title\":\"Get bookings\",\"sub_title\":\" Click edit button to change this text  to change this text\",\"icon_image\":null,\"order\":null}],\"style\":\"style2\"},\"component\":\"RegularBlock\",\"open\":true,\"parent\":\"ROOT\"}}', NULL, 1, 1, NULL, NULL, '2024-04-02 20:00:30', '2024-04-02 20:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `core_template_translations`
--

CREATE TABLE `core_template_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_template_translations`
--

INSERT INTO `core_template_translations` (`id`, `origin_id`, `locale`, `title`, `content`, `create_user`, `update_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'ja', 'Home Page', '[{\"type\":\"form_search_all_service\",\"name\":\"Form Search All Service\",\"model\":{\"service_types\":[\"hotel\",\"space\",\"tour\",\"car\",\"event\",\"flight\",\"boat\"],\"title\":\"こんにちは！\",\"sub_title\":\"どこに行きたい？\",\"bg_image\":16},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"offer_block\",\"name\":\"Offer Block\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"特別オファー\",\"desc\":\"最適なホテルを探す<br>\\n20,000以上の物件の価格<br>\\n上の最高の価格\",\"background_image\":17,\"link_title\":\"取引\",\"link_more\":\"#\",\"featured_text\":\"ホリデーセール\"},{\"_active\":true,\"title\":\"ニュースレター\",\"desc\":\"無料で参加して取得 <br>\\nに合わせたニュースレター<br>\\nホット旅行情報。\",\"background_image\":18,\"link_title\":\"サインアップ\",\"link_more\":\"/register\",\"featured_icon\":\"icofont-email\"},{\"_active\":true,\"title\":\"旅行のヒント\",\"desc\":\"旅行の専門家からのヒント <br>\\nあなたの次の<br>\\nより良い。\",\"background_image\":19,\"link_title\":\"サインアップ\",\"link_more\":\"/register\",\"featured_text\":null,\"featured_icon\":\"icofont-island-alt\"}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"ベストセラーリスト\",\"desc\":\"思慮深いデザインで高い評価を得ているホテル\",\"number\":4,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":[\"space\",\"hotel\",\"tour\"],\"title\":\"人気の目的地\",\"desc\":\"読者が\",\"number\":6,\"layout\":\"style_4\",\"order\":\"id\",\"order_by\":\"asc\",\"to_location_detail\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"最高のプロモーションツアー\",\"number\":6,\"style\":\"box_shadow\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":\"\",\"desc\":\"最も人気のある目的地\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_space\",\"name\":\"Space: List Items\",\"model\":{\"title\":\"賃貸物件\",\"desc\":\"思慮深いデザインで高い評価を受けている家\",\"number\":4,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_car\",\"name\":\"Car: List Items\",\"model\":{\"title\":\"Car Trending\",\"desc\":\"Book incredible things to do around the world.\",\"number\":8,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true},{\"type\":\"list_boat\",\"name\":\"Boat: List Items\",\"model\":{\"title\":\"Boat Listing\",\"desc\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry\",\"number\":4,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":\"\",\"custom_ids\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\": \"list_news\", \"name\": \"News: List Items\", \"model\": {\"title\": \"Read the latest from blog\", \"desc\": \"Contrary to popular belief\", \"number\": 6, \"category_id\": null, \"order\": \"id\", \"order_by\": \"asc\"}, \"component\": \"RegularBlock\", \"open\": true, \"is_container\": false},{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"あなたの街を知？\",\"sub_title\":\"3000以上の都市から2000人以上の地元民と\",\"link_title\":\"ローカルエ\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"testimonial\",\"name\":\"List Testimonial\",\"model\":{\"title\":\"私たちの幸せなクライアント\",\"list_item\":[{\"_active\":false,\"name\":\"Eva Hicks\",\"desc\":\"右ずへやん間申ゃ投法けゃイ仙一もと政情ルた食的て代下ずせに丈律ルラモト聞探チト棋90績ム的社ず置攻景リフノケ内兼唱堅ゃフぼ。場ルアハ美\",\"number_star\":5,\"avatar\":1},{\"_active\":false,\"name\":\"Donald Wolf\",\"desc\":\"右ずへやん間申ゃ投法けゃイ仙一もと政情ルた食的て代下ずせに丈律ルラモト聞探チト棋90績ム的社ず置攻景リフノケ内兼唱堅ゃフぼ。場ルアハ美\",\"number_star\":6,\"avatar\":2},{\"_active\":true,\"name\":\"Charlie Harrington\",\"desc\":\"右ずへやん間申ゃ投法けゃイ仙一もと政情ルた食的て代下ずせに丈律ルラモト聞探チト棋90績ム的社ず置攻景リフノケ内兼唱堅ゃフぼ。場ルアハ美\",\"number_star\":5,\"avatar\":3}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false}]', 1, NULL, '2024-04-02 07:17:12', NULL),
(2, 2, 'ja', 'Home Tour', '[{\"type\":\"form_search_tour\",\"name\":\"Tour: Form Search\",\"model\":{\"title\":\"どこへ行くのが大好き\",\"sub_title\":\"世界中で信じられないようなことを予約しましょう。\",\"bg_image\":20},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":true,\"title\":\"1,000+ ローカルガイド\",\"sub_title\":\"プロのツアーガイドとーガイドとーガイドと 験。 光の\",\"icon_image\":5},{\"_active\":true,\"title\":\"手作りの体験\",\"sub_title\":\"プロのツアーガイドとーガイドとーガイドと 験。 光の\",\"icon_image\":4},{\"_active\":true,\"title\":\"96% 幸せな旅行者\",\"sub_title\":\"プロのツアーガイドとーガイドとーガイドと 験。 光の\",\"icon_image\":6}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"トレンドツアー\",\"number\":5,\"style\":\"carousel\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"title\":\"人気の目的地\",\"number\":5,\"order\":\"id\",\"order_by\":\"desc\",\"service_type\":\"tour\",\"desc\":\"\",\"layout\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_tours\",\"name\":\"Tour: List Items\",\"model\":{\"title\":\"あなたが好きになるローカル体験\",\"number\":8,\"style\":\"normal\",\"category_id\":\"\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"っていますか？\",\"sub_title\":\"3000以上の都市から2000人以上の地元民と1200人以上の貢献者に参加する\",\"link_title\":\"ローカルエ\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"testimonial\",\"name\":\"List Testimonial\",\"model\":{\"title\":\"私たちの幸せなクライアント\",\"list_item\":[{\"_active\":false,\"name\":\"Eva Hicks\",\"desc\":\"融づ苦佐とき百配ほづあ禁安テクミ真覧チヱフ行乗ぱたば外味ナ演庭コヲ旅見ヨコ優成コネ治確はろね訪来終島抄がん。\",\"number_star\":5,\"avatar\":1},{\"_active\":false,\"name\":\"Donald Wolf\",\"desc\":\"融づ苦佐とき百配ほづあ禁安テクミ真覧チヱフ行乗ぱたば外味ナ演庭コヲ旅見ヨコ優成コネ治確はろね訪来終島抄がん。\",\"number_star\":6,\"avatar\":2},{\"_active\":true,\"name\":\"Charlie Harrington\",\"desc\":\"右ずへやん間申ゃ投法けゃイ仙一もと政情ルた食的て代下ずせに丈律ルラモト聞探チト棋90績ム的社ず置攻景リフノケ内兼唱堅ゃフぼ。場ルアハ美\",\"number_star\":5,\"avatar\":3}]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false}]', 1, NULL, '2024-04-02 07:17:12', NULL),
(3, 3, 'ja', 'Home Space', '[{\"type\":\"form_search_space\",\"name\":\"Space: Form Search\",\"model\":{\"title\":\"次のレンタルを探す\",\"sub_title\":\"世界中で信じられないようなことを予約しましょう。\",\"bg_image\":61},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_space\",\"name\":\"Space: List Items\",\"model\":{\"title\":\"おすすめの家\",\"number\":5,\"style\":\"carousel\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"desc\":\"思慮深いデザインで高い評価を受けている家\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"space_term_featured_box\",\"name\":\"Space: Term Featured Box\",\"model\":{\"title\":\"ホームタイプを見つける\",\"desc\":\"これは、読者はその長い既成の事実であります\",\"term_space\":[\"26\",\"27\",\"28\",\"29\",\"30\",\"31\"]},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":\"space\",\"title\":\"人気の目的地\",\"number\":6,\"order\":\"id\",\"order_by\":\"desc\",\"layout\":\"style_2\",\"desc\":\"これは、読者はその長い既成の事実であります\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_space\",\"name\":\"Space: List Items\",\"model\":{\"title\":\"賃貸物件\",\"desc\":\"思慮深いデザインで高い評価を受けている家\",\"number\":4,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"desc\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"call_to_action\",\"name\":\"Call To Action\",\"model\":{\"title\":\"っていますか？\",\"sub_title\":\"3000以上の都市から2000人以上の地元民と1200人以上の貢献者に参加する\",\"link_title\":\"ローカルエ\",\"link_more\":\"#\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false}]', 1, NULL, '2024-04-02 07:17:12', NULL),
(4, 4, 'ja', 'Home Hotel', '[{\"type\":\"form_search_hotel\",\"name\":\"Hotel: Form Search\",\"model\":{\"title\":\"最適なホテルを探す\",\"sub_title\":\"20,000以上のプロパティで最高の価格を取得\",\"bg_image\":92},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"20,000以上のプロパティ\",\"sub_title\":\"これは飢饉は常にlobortis交流pede Suspendisseたです\",\"icon_image\":103,\"order\":null},{\"_active\":false,\"title\":\"信頼と安全性\",\"sub_title\":\"これは飢饉は常にlobortis交流pede Suspendisseたです\",\"icon_image\":104,\"order\":null},{\"_active\":false,\"title\":\"ベストプライス保証\",\"sub_title\":\"これは飢饉は常にlobortis交流pede Suspendisseたです\",\"icon_image\":105,\"order\":null}],\"style\":\"normal\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"直前予約\",\"desc\":\"思慮深いデザインで高い評価を得ているホテル\",\"number\":5,\"style\":\"carousel\",\"location_id\":\"\",\"order\":\"\",\"order_by\":\"\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_locations\",\"name\":\"List Locations\",\"model\":{\"service_type\":\"hotel\",\"title\":\"人気の目的地\",\"desc\":\"それは長い間確立された事実であり、\",\"number\":6,\"layout\":\"style_3\",\"order\":\"\",\"order_by\":\"\",\"to_location_detail\":false},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"text\",\"name\":\"Text\",\"model\":{\"content\":\"<h2><span style=\\\"color: #1a2b48; font-family: Poppins, sans-serif; font-size: 28px; font-weight: 500; background-color: #ffffff;\\\">ローカルエキスパートになる理由</span></h2>\\n<div><span style=\\\"color: #5e6d77; font-family: Poppins, sans-serif; font-size: 10pt; background-color: #ffffff;\\\">様々な質量マエケナスとその格言不動産</span></div>\\n<div id=\\\"gtx-trans\\\" style=\\\"position: absolute; left: -118px; top: 55.8125px;\\\">\\n<div class=\\\"gtx-trans-icon\\\">&nbsp;</div>\\n</div>\",\"class\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_featured_item\",\"name\":\"List Featured Item\",\"model\":{\"list_item\":[{\"_active\":false,\"title\":\"追加の収入を得る\",\"sub_title\":\"Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":15,\"order\":null},{\"_active\":false,\"title\":\"ネットワークを開く\",\"sub_title\":\"Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":14,\"order\":null},{\"_active\":false,\"title\":\"あなたの言語を練習する\",\"sub_title\":\"Ut elit tellus, luctus nec ullamcorper mattis\",\"icon_image\":13,\"order\":null}],\"style\":\"style3\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false},{\"type\":\"list_hotel\",\"name\":\"Hotel: List Items\",\"model\":{\"title\":\"ベストセラーリスト\",\"desc\":\"思慮深いデザインで高い評価を得ているホテル\",\"number\":8,\"style\":\"normal\",\"location_id\":\"\",\"order\":\"id\",\"order_by\":\"asc\",\"is_featured\":\"\"},\"component\":\"RegularBlock\",\"open\":true,\"is_container\":false}]', 1, NULL, '2024-04-02 07:17:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_translations`
--

CREATE TABLE `core_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `last_build_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_vendor_plans`
--

CREATE TABLE `core_vendor_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_commission` int NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_vendor_plan_meta`
--

CREATE TABLE `core_vendor_plan_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_plan_id` int NOT NULL,
  `post_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` tinyint DEFAULT NULL,
  `maximum_create` int DEFAULT NULL,
  `auto_publish` tinyint DEFAULT NULL,
  `commission` int DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_transactions`
--

CREATE TABLE `credit_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `payment_id` bigint UNSIGNED DEFAULT NULL,
  `ref_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_user` bigint DEFAULT NULL,
  `update_user` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_category`
--

CREATE TABLE `location_category` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `origin_id` bigint DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_category`
--

INSERT INTO `location_category` (`id`, `name`, `icon_class`, `content`, `slug`, `status`, `_lft`, `_rgt`, `parent_id`, `create_user`, `update_user`, `deleted_at`, `origin_id`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Education', 'icofont-education', NULL, NULL, 'publish', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Health', 'fa fa-hospital-o', NULL, NULL, 'publish', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Transportation', 'fa fa-subway', NULL, NULL, 'publish', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location_category_translations`
--

CREATE TABLE `location_category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `origin_id` bigint DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint DEFAULT '0',
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `app_id` int DEFAULT NULL,
  `app_user_id` int DEFAULT NULL,
  `file_width` int DEFAULT NULL,
  `file_height` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `folder_id` bigint DEFAULT '0',
  `author_id` bigint DEFAULT NULL,
  `file_edit` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `file_name`, `file_path`, `file_size`, `file_type`, `file_extension`, `driver`, `is_private`, `create_user`, `update_user`, `deleted_at`, `app_id`, `app_user_id`, `file_width`, `file_height`, `created_at`, `updated_at`, `folder_id`, `author_id`, `file_edit`) VALUES
(1, 'avatar', 'demo/general/avatar.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(2, 'avatar-2', 'demo/general/avatar-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(3, 'avatar-3', 'demo/general/avatar-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(4, 'ico_adventurous', 'demo/general/ico_adventurous.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(5, 'ico_localguide', 'demo/general/ico_localguide.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(6, 'ico_maps', 'demo/general/ico_maps.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(7, 'ico_paymethod', 'demo/general/ico_paymethod.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(8, 'logo', 'demo/general/logo.svg', NULL, 'image/svg+xml', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(9, 'bg_contact', 'demo/general/bg-contact.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(10, 'favicon', 'demo/general/favicon.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(11, 'thumb-vendor-register', 'demo/general/thumb-vendor-register.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(12, 'bg-video-vendor-register1', 'demo/general/bg-video-vendor-register1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(13, 'ico_chat_1', 'demo/general/ico_chat_1.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(14, 'ico_friendship_1', 'demo/general/ico_friendship_1.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(15, 'ico_piggy-bank_1', 'demo/general/ico_piggy-bank_1.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(16, 'home-mix', 'demo/general/home-mix.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(17, 'image_home_mix_1', 'demo/general/image_home_mix_1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(18, 'image_home_mix_2', 'demo/general/image_home_mix_2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(19, 'image_home_mix_3', 'demo/general/image_home_mix_3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(20, 'banner-search', 'demo/tour/banner-search.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(21, 'tour-1', 'demo/tour/tour-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(22, 'tour-2', 'demo/tour/tour-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(23, 'tour-3', 'demo/tour/tour-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(24, 'tour-4', 'demo/tour/tour-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(25, 'tour-5', 'demo/tour/tour-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(26, 'tour-6', 'demo/tour/tour-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(27, 'tour-7', 'demo/tour/tour-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(28, 'tour-8', 'demo/tour/tour-8.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(29, 'tour-9', 'demo/tour/tour-9.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(30, 'tour-10', 'demo/tour/tour-10.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(31, 'tour-11', 'demo/tour/tour-11.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(32, 'tour-12', 'demo/tour/tour-12.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(33, 'tour-13', 'demo/tour/tour-13.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(34, 'tour-14', 'demo/tour/tour-14.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(35, 'tour-15', 'demo/tour/tour-15.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(36, 'tour-16', 'demo/tour/tour-16.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(37, 'gallery-1', 'demo/tour/gallery-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(38, 'gallery-2', 'demo/tour/gallery-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(39, 'gallery-3', 'demo/tour/gallery-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(40, 'gallery-4', 'demo/tour/gallery-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(41, 'gallery-5', 'demo/tour/gallery-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(42, 'gallery-6', 'demo/tour/gallery-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(43, 'gallery-7', 'demo/tour/gallery-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(44, 'banner-tour-1', 'demo/tour/banner-detail/banner-tour-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(45, 'banner-tour-2', 'demo/tour/banner-detail/banner-tour-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(46, 'banner-tour-3', 'demo/tour/banner-detail/banner-tour-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(47, 'banner-tour-4', 'demo/tour/banner-detail/banner-tour-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(48, 'banner-tour-5', 'demo/tour/banner-detail/banner-tour-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(49, 'banner-tour-6', 'demo/tour/banner-detail/banner-tour-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(50, 'banner-tour-7', 'demo/tour/banner-detail/banner-tour-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(51, 'banner-tour-8', 'demo/tour/banner-detail/banner-tour-8.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(52, 'banner-tour-9', 'demo/tour/banner-detail/banner-tour-9.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(53, 'banner-tour-10', 'demo/tour/banner-detail/banner-tour-10.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(54, 'banner-tour-11', 'demo/tour/banner-detail/banner-tour-11.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(55, 'banner-tour-12', 'demo/tour/banner-detail/banner-tour-12.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(56, 'banner-tour-13', 'demo/tour/banner-detail/banner-tour-13.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(57, 'banner-tour-14', 'demo/tour/banner-detail/banner-tour-14.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(58, 'banner-tour-15', 'demo/tour/banner-detail/banner-tour-15.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(59, 'banner-tour-16', 'demo/tour/banner-detail/banner-tour-16.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(60, 'banner-tour-17', 'demo/tour/banner-detail/banner-tour-17.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(61, 'banner-search-space', 'demo/space/banner-search-space.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(62, 'banner-search-space-2', 'demo/space/banner-search-space-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(63, 'space-1', 'demo/space/space-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(64, 'space-2', 'demo/space/space-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(65, 'space-3', 'demo/space/space-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(66, 'space-4', 'demo/space/space-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(67, 'space-5', 'demo/space/space-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(68, 'space-6', 'demo/space/space-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(69, 'space-7', 'demo/space/space-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(70, 'space-8', 'demo/space/space-8.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(71, 'space-9', 'demo/space/space-9.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(72, 'space-10', 'demo/space/space-10.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(73, 'space-11', 'demo/space/space-11.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(74, 'space-12', 'demo/space/space-12.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(75, 'space-13', 'demo/space/space-13.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(76, 'space-gallery-1', 'demo/space/gallery/space-gallery-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(77, 'space-gallery-2', 'demo/space/gallery/space-gallery-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(78, 'space-gallery-3', 'demo/space/gallery/space-gallery-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(79, 'space-gallery-4', 'demo/space/gallery/space-gallery-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(80, 'space-gallery-5', 'demo/space/gallery/space-gallery-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(81, 'space-gallery-6', 'demo/space/gallery/space-gallery-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(82, 'space-gallery-7', 'demo/space/gallery/space-gallery-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(83, 'space-single-1', 'demo/space/space-single-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(84, 'space-single-2', 'demo/space/space-single-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(85, 'space-single-3', 'demo/space/space-single-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(86, 'icon-space-box-1', 'demo/space/featured-box/icon-space-box-1.png', NULL, 'image/png', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(87, 'icon-space-box-2', 'demo/space/featured-box/icon-space-box-2.png', NULL, 'image/png', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(88, 'icon-space-box-3', 'demo/space/featured-box/icon-space-box-3.png', NULL, 'image/png', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(89, 'icon-space-box-4', 'demo/space/featured-box/icon-space-box-4.png', NULL, 'image/png', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(90, 'icon-space-box-5', 'demo/space/featured-box/icon-space-box-5.png', NULL, 'image/png', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(91, 'icon-space-box-6', 'demo/space/featured-box/icon-space-box-6.png', NULL, 'image/png', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(92, 'banner-search-hotel', 'demo/hotel/banner-search-hotel.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(93, 'hotel-featured-1', 'demo/hotel/hotel-featured-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(94, 'hotel-featured-2', 'demo/hotel/hotel-featured-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(95, 'hotel-featured-3', 'demo/hotel/hotel-featured-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(96, 'hotel-featured-4', 'demo/hotel/hotel-featured-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(97, 'hotel-gallery-1', 'demo/hotel/gallery/hotel-gallery-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(98, 'hotel-gallery-2', 'demo/hotel/gallery/hotel-gallery-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(99, 'hotel-gallery-3', 'demo/hotel/gallery/hotel-gallery-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(100, 'hotel-gallery-4', 'demo/hotel/gallery/hotel-gallery-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(101, 'hotel-gallery-5', 'demo/hotel/gallery/hotel-gallery-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(102, 'hotel-gallery-6', 'demo/hotel/gallery/hotel-gallery-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(103, 'hotel-icon-1', 'demo/hotel/hotel-icon-1.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(104, 'hotel-icon-2', 'demo/hotel/hotel-icon-2.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(105, 'hotel-icon-3', 'demo/hotel/hotel-icon-3.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(106, 'location-1', 'demo/location/location-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(107, 'location-2', 'demo/location/location-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(108, 'location-3', 'demo/location/location-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(109, 'location-4', 'demo/location/location-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(110, 'location-5', 'demo/location/location-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(111, 'location-6', 'demo/location/location-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(112, 'banner-location-1', 'demo/location/banner-detail/banner-location-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(113, 'trip-idea-1', 'demo/location/trip-idea/trip-idea-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(114, 'trip-idea-2', 'demo/location/trip-idea/trip-idea-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(115, 'news-1', 'demo/news/news-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(116, 'news-2', 'demo/news/news-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(117, 'news-3', 'demo/news/news-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(118, 'news-4', 'demo/news/news-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(119, 'news-5', 'demo/news/news-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(120, 'news-6', 'demo/news/news-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(121, 'news-7', 'demo/news/news-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(122, 'news-banner', 'demo/news/news-banner.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(123, 'banner-search-car', 'demo/car/banner-search-car.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(124, 'Convertibles', 'demo/car/terms/convertibles.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(125, 'Coupes', 'demo/car/terms/couple.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(126, 'Hatchbacks', 'demo/car/terms/hatchback.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(127, 'Minivans', 'demo/car/terms/minivans.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(128, 'Sedan', 'demo/car/terms/sedan.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(129, 'SUVs', 'demo/car/terms/suv.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(130, 'Trucks', 'demo/car/terms/trucks.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(131, 'Wagons', 'demo/car/terms/wagons.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(132, 'home-car-bg-1', 'demo/car/home-car-bg-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(133, 'number-1', 'demo/car/number-1.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(134, 'number-2', 'demo/car/number-2.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(135, 'number-3', 'demo/car/number-3.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(136, 'banner-car-single', 'demo/car/banner-single.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(137, 'Airbag', 'demo/car/feature/Airbag.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(138, 'FM Radio', 'demo/car/feature/Radio.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(139, 'Sensor', 'demo/car/feature/Sensor.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(140, 'Speed Km', 'demo/car/feature/Speed.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(141, 'Steering Wheel', 'demo/car/feature/Steering.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(142, 'Power Windows', 'demo/car/feature/Windows.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(143, 'car-1', 'demo/car/car-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(144, 'car-2', 'demo/car/car-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(145, 'car-3', 'demo/car/car-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(146, 'car-4', 'demo/car/car-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(147, 'car-5', 'demo/car/car-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(148, 'car-6', 'demo/car/car-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(149, 'car-7', 'demo/car/car-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(150, 'car-8', 'demo/car/car-8.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(151, 'car-9', 'demo/car/car-9.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(152, 'car-10', 'demo/car/car-10.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(153, 'car-11', 'demo/car/car-11.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(154, 'car-12', 'demo/car/car-12.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(155, 'car-gallery-1', 'demo/car/gallery-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(156, 'car-gallery-2', 'demo/car/gallery-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(157, 'car-gallery-3', 'demo/car/gallery-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(158, 'car-gallery-4', 'demo/car/gallery-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(159, 'car-gallery-5', 'demo/car/gallery-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(160, 'car-gallery-6', 'demo/car/gallery-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(161, 'car-gallery-7', 'demo/car/gallery-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(162, 'banner-search-event', 'demo/event/banner-search.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(163, 'event-1', 'demo/event/event-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(164, 'event-2', 'demo/event/event-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(165, 'event-3', 'demo/event/event-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(166, 'event-4', 'demo/event/event-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(167, 'event-5', 'demo/event/event-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(168, 'event-6', 'demo/event/event-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(169, 'event-7', 'demo/event/event-7.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(170, 'event-8', 'demo/event/event-8.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(171, 'event-9', 'demo/event/event-9.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(172, 'event-10', 'demo/event/event-10.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(173, 'event-11', 'demo/event/event-11.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(174, 'event-12', 'demo/event/event-12.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(175, 'gallery-event-1', 'demo/event/gallery-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(176, 'gallery-event-2', 'demo/event/gallery-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(177, 'gallery-event-3', 'demo/event/gallery-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(178, 'gallery-event-4', 'demo/event/gallery-4.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(179, 'gallery-event-5', 'demo/event/gallery-5.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(180, 'gallery-event-6', 'demo/event/gallery-6.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(181, 'banner-event-1', 'demo/event/banner-detail/banner-event-1.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(182, 'banner-event-2', 'demo/event/banner-detail/banner-event-2.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(183, 'banner-event-3', 'demo/event/banner-detail/banner-event-3.jpg', NULL, 'image/jpeg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(184, 'icon_global', 'demo/general/icon_global.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(185, 'icon_global_white', 'demo/general/icon_global_white.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(186, 'icon_price', 'demo/general/icon_price.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(187, 'icon_price_white', 'demo/general/icon_price_white.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(188, 'icon_support', 'demo/general/icon_support.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(189, 'icon_support_white', 'demo/general/icon_support_white.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(190, 'box-tour-1', 'demo/tour/box-tour-1.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(191, 'box-tour-2', 'demo/tour/box-tour-2.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(192, 'box-tour-3', 'demo/tour/box-tour-3.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(193, 'box-tour-4', 'demo/tour/box-tour-4.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(194, 'banner-new-1', 'demo/general/banner-new-1.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(195, 'banner-new-2', 'demo/general/banner-new-2.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(196, 'call-to-action-bg-1', 'demo/general/call-to-action-bg-1.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(197, 'call-to-action-bg-2', 'demo/general/call-to-action-bg-2.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(198, 'call-to-action-bg-3', 'demo/general/call-to-action-bg-3.png', NULL, 'image/png', 'png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(199, 'customer-feedback', 'demo/general/customer-feedback.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(200, 'customer-feedback-2', 'demo/general/customer-feedback-2.jpg', NULL, 'image/jpg', 'jpg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(201, 'logo-white', 'demo/general/logo_white.svg', NULL, 'image/svg', 'svg', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(202, 'resort-bazar-logo-211', '0000/1/2024/04/02/resort-bazar-logo-211.png', '3248', 'image/png', 'png', 'uploads', 0, 1, NULL, NULL, NULL, NULL, 211, 54, '2024-04-02 11:56:24', '2024-04-02 11:56:24', 0, 1, 0),
(203, 'download', '0000/1/2024/04/03/download.png', '4150', 'image/png', 'png', 'uploads', 0, 1, NULL, NULL, NULL, NULL, 424, 424, '2024-04-02 20:14:07', '2024-04-02 20:14:07', 0, 1, 0),
(204, 'resort-bazar-favicon1', '0000/1/2024/04/03/resort-bazar-favicon1.jpg', '64320', 'image/jpeg', 'jpg', 'uploads', 0, 1, NULL, NULL, NULL, NULL, 512, 512, '2024-04-02 20:14:48', '2024-04-02 20:14:48', 0, 1, 0),
(205, 'resortbazar-homepage-top-banner', '0000/1/2024/04/03/resortbazar-homepage-top-banner.jpg', '1434286', 'image/jpeg', 'jpg', 'uploads', 0, 1, NULL, NULL, NULL, NULL, 1920, 1195, '2024-04-03 07:08:14', '2024-04-03 07:08:14', 0, 1, 0),
(206, 'hotel-gallery-1-1', '0000/6/2024/04/06/hotel-gallery-1-1.jpg', '119257', 'image/jpeg', 'jpg', 'uploads', 0, 6, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-05 18:34:44', '2024-04-05 18:34:44', 0, 6, 0),
(207, 'robel-air-international', '0000/10/2024/04/23/robel-air-international.jpg', '181947', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1900, 600, '2024-04-23 04:36:39', '2024-04-23 04:36:39', 0, 10, 0),
(208, 'robel-hotel-gallery-5', '0000/10/2024/04/23/robel-hotel-gallery-5.jpg', '47313', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1280, 599, '2024-04-23 04:37:04', '2024-04-23 04:37:04', 0, 10, 0),
(209, 'hotel-gallery-6', '0000/10/2024/04/23/hotel-gallery-6.jpg', '78597', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-23 04:37:05', '2024-04-23 04:37:05', 0, 10, 0),
(210, 'robel-hotel-gallery-4', '0000/10/2024/04/23/robel-hotel-gallery-4.jpg', '61354', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-23 04:37:06', '2024-04-23 04:37:06', 0, 10, 0),
(211, 'hotel-gallery-3', '0000/10/2024/04/23/hotel-gallery-3.jpg', '86356', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-23 04:37:07', '2024-04-23 04:37:07', 0, 10, 0),
(212, 'robel-hotel-gallery-1', '0000/10/2024/04/23/robel-hotel-gallery-1.jpg', '119257', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-23 04:37:07', '2024-04-23 04:37:07', 0, 10, 0),
(213, 'robel-hotel-gallery-2', '0000/10/2024/04/23/robel-hotel-gallery-2.jpg', '201979', 'image/jpeg', 'jpg', 'uploads', 0, 10, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-23 04:37:09', '2024-04-23 04:37:09', 0, 10, 0),
(214, 'robel-air-international', '0000/1/2024/04/24/robel-air-international.jpg', '181947', 'image/jpeg', 'jpg', 'uploads', 0, 1, NULL, NULL, NULL, NULL, 1900, 600, '2024-04-24 17:43:53', '2024-04-24 17:43:53', 0, 1, 0),
(215, 'robel-air-international', '0000/11/2024/04/25/robel-air-international.jpg', '181947', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1900, 600, '2024-04-24 18:01:22', '2024-04-24 18:01:22', 0, 11, 0),
(216, 'robel-hotel-gallery-5', '0000/11/2024/04/25/robel-hotel-gallery-5.jpg', '47313', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1280, 599, '2024-04-24 18:01:40', '2024-04-24 18:01:40', 0, 11, 0),
(217, 'robel-hotel-gallery-4', '0000/11/2024/04/25/robel-hotel-gallery-4.jpg', '61354', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-24 18:01:40', '2024-04-24 18:01:40', 0, 11, 0),
(218, 'hotel-gallery-3', '0000/11/2024/04/25/hotel-gallery-3.jpg', '86356', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-24 18:01:41', '2024-04-24 18:01:41', 0, 11, 0),
(219, 'hotel-gallery-6', '0000/11/2024/04/25/hotel-gallery-6.jpg', '78597', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-24 18:01:41', '2024-04-24 18:01:41', 0, 11, 0),
(220, 'robel-hotel-gallery-1', '0000/11/2024/04/25/robel-hotel-gallery-1.jpg', '119257', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-24 18:01:41', '2024-04-24 18:01:41', 0, 11, 0),
(221, 'robel-hotel-gallery-2', '0000/11/2024/04/25/robel-hotel-gallery-2.jpg', '201979', 'image/jpeg', 'jpg', 'uploads', 0, 11, NULL, NULL, NULL, NULL, 1280, 600, '2024-04-24 18:01:42', '2024-04-24 18:01:42', 0, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint DEFAULT '0',
  `user_id` bigint DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_03_17_114820_create_table_core_pages', 1),
(5, '2019_03_17_140539_create_media_files_table', 1),
(6, '2019_03_20_072502_create_bravo_tours', 1),
(7, '2019_03_20_081256_create_core_news_category_table', 1),
(8, '2019_03_27_081940_create_core_setting_table', 1),
(9, '2019_03_28_101009_create_bravo_booking_table', 1),
(10, '2019_03_28_165911_create_booking_meta_table', 1),
(11, '2019_03_29_093236_update_bookings_table', 1),
(12, '2019_04_01_045229_create_user_meta_table', 1),
(13, '2019_04_01_150630_create_menu_table', 1),
(14, '2019_04_02_150630_create_core_news_table', 1),
(15, '2019_04_03_073553_bravo_tour_category', 1),
(16, '2019_04_03_080159_bravo_location', 1),
(17, '2019_04_05_143248_create_core_templates_table', 1),
(18, '2019_04_18_152537_create_bravo_tours_meta_table', 1),
(19, '2019_05_07_085430_create_core_languages_table', 1),
(20, '2019_05_07_085442_create_core_translations_table', 1),
(21, '2019_05_17_074008_create_bravo_review', 1),
(22, '2019_05_17_074048_create_bravo_review_meta', 1),
(23, '2019_05_17_113042_create_tour_attrs_table', 1),
(24, '2019_05_21_084235_create_bravo_contact_table', 1),
(25, '2019_05_28_152845_create_core_subscribers_table', 1),
(26, '2019_06_17_142338_bravo_seo', 1),
(27, '2019_07_03_070406_update_from_1_0_to_1_1', 1),
(28, '2019_07_08_075436_create_core_vendor_plans', 1),
(29, '2019_07_08_083733_create_vendors_plan_payments', 1),
(30, '2019_07_11_083501_update_from_110_to_120', 1),
(31, '2019_07_30_072809_create_flight_table', 1),
(32, '2019_07_30_072809_create_space_table', 1),
(33, '2019_07_30_072809_create_tour_dates_table', 1),
(34, '2019_08_05_031018_create_core_vendor_plan_meta_table', 1),
(35, '2019_08_09_163909_create_inbox_table', 1),
(36, '2019_08_16_094354_update_from_120_to_130', 1),
(37, '2019_08_19_000000_create_failed_jobs_table', 1),
(38, '2019_08_20_162106_create_table_user_upgrade_requests', 1),
(39, '2019_09_13_070650_update_from_130_to_140', 1),
(40, '2019_09_20_072809_create_hotel_table', 1),
(41, '2019_10_22_151319_create_car_table', 1),
(42, '2019_11_05_092516_update_from_140_to_150', 1),
(43, '2019_11_18_085024_update_from_150_to_151', 1),
(44, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(45, '2020_03_09_102753_update_from_151_to_160', 1),
(46, '2020_04_02_150631_create_core_tags_table', 1),
(47, '2020_04_05_101016_create_event_table', 1),
(48, '2020_05_16_073120_update_from_160_to_170', 1),
(49, '2020_11_23_092238_create_notifications_table', 1),
(50, '2021_03_19_102157_update_190', 1),
(51, '2021_03_19_102157_update_core_190', 1),
(52, '2021_04_02_150632_create_core_tag_new_table', 1),
(53, '2021_04_20_102158_update_from_190_to_200', 1),
(54, '2021_08_22_173931_create_role_table', 1),
(55, '2021_09_16_072809_create_coupon_table', 1),
(56, '2021_09_28_174324_create_jobs_table', 1),
(57, '2021_09_29_041836_create_user_plan_table', 1),
(58, '2021_10_26_151319_create_boat_table', 1),
(59, '2022_02_08_072809_create_popup_table', 1),
(60, '2022_02_14_134137_create_bravo_booking_payment_meta', 1),
(61, '2022_02_28_999999_add_active_status_to_users', 1),
(62, '2022_02_28_999999_add_dark_mode_to_users', 1),
(63, '2022_02_28_999999_add_messenger_color_to_users', 1),
(64, '2022_02_28_999999_create_favorites_table', 1),
(65, '2022_02_28_999999_create_messages_table', 1),
(66, '2022_03_01_002101_update_user_table', 1),
(67, '2022_03_15_040235_update_241_to_242', 1),
(68, '2022_03_23_042635_update_242_to_243', 1),
(69, '2022_07_11_085656_create_enquiry_reply_table', 1),
(70, '2022_07_13_082318_create_media_folder_table', 1),
(71, '2022_07_25_132120_create_vendor_team', 1),
(72, '2022_07_31_132706_update_to_250', 1),
(73, '2022_10_19_140925_update_to_300', 1),
(74, '2023_01_05_095322_update_core_to_300', 1),
(75, '2023_03_10_095941_update_expires_at_personal_access_tokens', 1),
(76, '2023_08_23_035453_update_core_to_342', 1),
(77, '2023_09_26_154450_update_core_to_350', 1),
(78, '2023_11_09_081405_create_user_wallet_table', 1),
(79, '2024_02_15_180145_add_column_bravo_booking_table', 1),
(80, '2024_02_15_180145_add_column_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `for_admin` tinyint(1) DEFAULT '0',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `for_admin`, `read_at`, `created_at`, `updated_at`) VALUES
('00403dbf-3f25-4870-b31c-952dd3fd29a5', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 12, '{\"id\":\"00403dbf-3f25-4870-b31c-952dd3fd29a5\",\"for_admin\":0,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/user\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-29 16:07:20', '2024-04-29 16:07:20'),
('0180fb0f-1377-4751-860a-b84c8206506a', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"0180fb0f-1377-4751-860a-b84c8206506a\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 16:07:20', '2024-05-13 10:29:13'),
('04ccfb8e-0194-4ae9-9d3f-3f175d496da0', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 12, '{\"id\":\"04ccfb8e-0194-4ae9-9d3f-3f175d496da0\",\"for_admin\":1,\"notification\":{\"id\":15,\"event\":\"BookingCreatedEvent\",\"to\":\"admin\",\"name\":\"test name 1\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/report\\/booking\",\"type\":\"hotel\",\"message\":\"test name 1 has created new Booking\"}}', 1, '2024-04-29 15:41:06', '2024-04-24 18:27:06', '2024-04-29 15:41:06'),
('0a76e266-adc0-4a9e-81ce-b8ed15df05c4', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 7, '{\"id\":\"0a76e266-adc0-4a9e-81ce-b8ed15df05c4\",\"for_admin\":1,\"notification\":{\"id\":7,\"name\":\"xyz it\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/userUpgradeRequest\",\"type\":\"user_upgrade_request\",\"message\":\"xyz it has requested to become a vendor\"}}', 1, '2024-04-05 19:56:47', '2024-04-05 19:54:35', '2024-04-05 19:56:47'),
('0aaa0a8b-23a5-4aed-bc58-fd6578a6afb3', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"0aaa0a8b-23a5-4aed-bc58-fd6578a6afb3\",\"for_admin\":1,\"notification\":{\"id\":6,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=6\",\"type\":\"hotel\",\"message\":\"EnVision Hotel Boston has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('0f298fa2-2b99-49fe-8443-8e1e059920c7', 'App\\Notifications\\AdminChannelServices', 'App\\User', 8, '{\"id\":\"0f298fa2-2b99-49fe-8443-8e1e059920c7\",\"for_admin\":1,\"notification\":{\"id\":8,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"Melonmia l\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=8\",\"type\":\"user\",\"message\":\"Melonmia l has been registered\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:03:02', '2024-04-29 15:41:06'),
('1baf6450-b7b2-4f7a-9cdf-2ca136fe1aa4', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 8, '{\"id\":\"1baf6450-b7b2-4f7a-9cdf-2ca136fe1aa4\",\"for_admin\":1,\"notification\":{\"id\":7,\"event\":\"BookingCreatedEvent\",\"to\":\"admin\",\"name\":\"Melonmia l\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/report\\/booking\",\"type\":\"hotel\",\"message\":\"Melonmia l has created new Booking\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:03:02', '2024-04-29 15:41:06'),
('242c1287-bd83-44c8-aa18-0219cb2a7796', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 11, '{\"id\":\"242c1287-bd83-44c8-aa18-0219cb2a7796\",\"for_admin\":1,\"notification\":{\"id\":15,\"event\":\"CreatedServicesEvent\",\"to\":\"admin\",\"name\":\"Sm Shourob\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel\\/edit\\/15\",\"type\":\"hotel\",\"message\":\"Sm Shourob has created hotel Hotel Singapore International\"}}', 1, '2024-04-29 15:41:06', '2024-04-24 18:02:13', '2024-04-29 15:41:06'),
('252a38bf-96ec-41f6-8b23-3ca64a6952b6', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"252a38bf-96ec-41f6-8b23-3ca64a6952b6\",\"for_admin\":1,\"notification\":{\"id\":2,\"event\":\"BookingCreatedEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"https:\\/\\/bdix.one\\/images\\/avatar.png\",\"link\":\"https:\\/\\/bdix.one\\/admin\\/module\\/report\\/booking\",\"type\":\"hotel\",\"message\":\"administrator 01 has created new Booking\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 13:45:21', '2024-04-05 17:47:09'),
('30e921ef-434d-4d4c-ab3e-d6d6974e2158', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"30e921ef-434d-4d4c-ab3e-d6d6974e2158\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 16:05:31', '2024-05-13 10:29:13'),
('364817ce-2c9e-4f55-9589-6d44fa2439ab', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"364817ce-2c9e-4f55-9589-6d44fa2439ab\",\"for_admin\":1,\"notification\":{\"id\":9,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=9\",\"type\":\"hotel\",\"message\":\"Parian Holiday Villas was updated to Draft by Resort Bazar\"}}', 1, '2024-04-05 17:47:09', '2024-04-04 23:20:34', '2024-04-05 17:47:09'),
('3906bc3b-c3c0-4263-ace9-9be66a654548', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"3906bc3b-c3c0-4263-ace9-9be66a654548\",\"for_admin\":1,\"notification\":{\"id\":11,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=11\",\"type\":\"hotel\",\"message\":\"The May Fair Hotel has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:22', '2024-04-05 17:47:09'),
('391f60d4-9f8f-457f-ab2a-2760c6ace48d', 'App\\Notifications\\PrivateChannelServices', 'Modules\\User\\Models\\User', 11, '{\"id\":\"391f60d4-9f8f-457f-ab2a-2760c6ace48d\",\"for_admin\":0,\"notification\":{\"id\":11,\"event\":\"VendorApproved\",\"to\":\"vendor\",\"name\":\"Sm Shourob\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/dashboard\",\"type\":\"user_upgrade_request\",\"message\":\"Your upgrade request has approved already\"}}', 0, NULL, '2024-04-24 17:58:02', '2024-04-24 17:58:02'),
('407055f3-bc2e-4da0-8296-fb379824d776', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"407055f3-bc2e-4da0-8296-fb379824d776\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:07:05', '2024-04-29 15:41:06'),
('42caf434-5387-4487-9d24-c1a305881992', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 6, '{\"id\":\"42caf434-5387-4487-9d24-c1a305881992\",\"for_admin\":0,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-05 20:21:07', '2024-04-05 20:21:07'),
('45e45696-9b62-423a-852c-796f12459e00', 'App\\Notifications\\AdminChannelServices', 'App\\User', 12, '{\"id\":\"45e45696-9b62-423a-852c-796f12459e00\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"test name 1\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=12\",\"type\":\"user\",\"message\":\"test name 1 has been registered\"}}', 1, '2024-04-29 15:41:06', '2024-04-24 18:27:05', '2024-04-29 15:41:06'),
('46e86e8e-1491-4917-bdc1-ff0344c702c6', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 6, '{\"id\":\"46e86e8e-1491-4917-bdc1-ff0344c702c6\",\"for_admin\":0,\"notification\":{\"id\":6,\"event\":\"UpdatePlanRequest\",\"to\":\"customer\",\"name\":\"Sailor beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/my-plan\",\"type\":\"plan\",\"message\":\"Your plan request has been approved\"}}', 0, NULL, '2024-04-05 20:29:22', '2024-04-05 20:29:22'),
('47af28a3-a764-4ea2-a23e-660500ccbafe', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"47af28a3-a764-4ea2-a23e-660500ccbafe\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=1\",\"type\":\"hotel\",\"message\":\"Hotel Stanford has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('49440e78-bf1d-480a-a320-d2c603087e2c', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 6, '{\"id\":\"49440e78-bf1d-480a-a320-d2c603087e2c\",\"for_admin\":1,\"notification\":{\"id\":6,\"name\":\"Sailor Beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/userUpgradeRequest\",\"type\":\"user_upgrade_request\",\"message\":\"Sailor Beach Resort has requested to become a vendor\"}}', 1, '2024-04-05 18:21:53', '2024-04-05 18:19:31', '2024-04-05 18:21:53'),
('4a0e03c2-a067-4e85-afbc-e7896122dba4', 'App\\Notifications\\AdminChannelServices', 'App\\User', 5, '{\"id\":\"4a0e03c2-a067-4e85-afbc-e7896122dba4\",\"for_admin\":1,\"notification\":{\"id\":5,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"Ashraful Amin\",\"avatar\":\"https:\\/\\/www.resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/www.resortbazar.com\\/admin\\/module\\/user?s=5\",\"type\":\"user\",\"message\":\"Ashraful Amin has been registered\"}}', 1, '2024-04-04 16:30:17', '2024-04-03 20:23:18', '2024-04-04 16:30:17'),
('53fdce99-3ed7-4f3f-bd4e-e7084ebae68a', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 6, '{\"id\":\"53fdce99-3ed7-4f3f-bd4e-e7084ebae68a\",\"for_admin\":0,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-05 19:04:42', '2024-04-05 19:04:42'),
('5562552f-69b5-48fd-8e22-63002330756d', 'App\\Notifications\\PrivateChannelServices', 'Modules\\User\\Models\\User', 10, '{\"id\":\"5562552f-69b5-48fd-8e22-63002330756d\",\"for_admin\":0,\"notification\":{\"id\":10,\"event\":\"VendorApproved\",\"to\":\"vendor\",\"name\":\"Robel Air International\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/dashboard\",\"type\":\"user_upgrade_request\",\"message\":\"Your upgrade request has approved already\"}}', 0, NULL, '2024-04-23 04:34:21', '2024-04-23 04:34:21'),
('5a770b1c-5dc0-40f7-9be1-264931b6b232', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"5a770b1c-5dc0-40f7-9be1-264931b6b232\",\"for_admin\":1,\"notification\":{\"id\":2,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=2\",\"type\":\"hotel\",\"message\":\"Hotel WBF Hommachi has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('5db63638-4c1c-4569-b4aa-4e43581e44e8', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 11, '{\"id\":\"5db63638-4c1c-4569-b4aa-4e43581e44e8\",\"for_admin\":1,\"notification\":{\"id\":11,\"name\":\"Sm Shourob\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/userUpgradeRequest\",\"type\":\"user_upgrade_request\",\"message\":\"Sm Shourob has requested to become a vendor\"}}', 1, '2024-04-24 17:57:56', '2024-04-24 17:56:50', '2024-04-24 17:57:56'),
('61031ad3-ad11-4c3b-8b6e-7300c5c4cb26', 'App\\Notifications\\AdminChannelServices', 'App\\User', 7, '{\"id\":\"61031ad3-ad11-4c3b-8b6e-7300c5c4cb26\",\"for_admin\":1,\"notification\":{\"id\":7,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"xyz it\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=7\",\"type\":\"user\",\"message\":\"xyz it has been registered\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 19:54:07', '2024-04-29 15:41:06'),
('633d125e-10d0-4145-a87a-c69992e6e422', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 6, '{\"id\":\"633d125e-10d0-4145-a87a-c69992e6e422\",\"for_admin\":1,\"notification\":{\"id\":6,\"event\":\"CreatePlanRequest\",\"name\":\"Sailor Beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"to\":\"admin\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/plan-report\",\"type\":\"plan\",\"message\":\"Sailor Beach Resort has created a plan request\"}}', 1, '2024-04-05 18:37:14', '2024-04-05 18:36:13', '2024-04-05 18:37:14'),
('6c991c7f-0dc7-4e48-9693-7bbed99234a6', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 6, '{\"id\":\"6c991c7f-0dc7-4e48-9693-7bbed99234a6\",\"for_admin\":0,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-05 19:05:18', '2024-04-05 19:05:18'),
('7205ee11-e448-4e81-8cd9-875a9fd58bf0', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"7205ee11-e448-4e81-8cd9-875a9fd58bf0\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 19:04:42', '2024-04-29 15:41:06'),
('730e44d0-549e-4fbd-bc0b-4eed1b2d8e9c', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"730e44d0-549e-4fbd-bc0b-4eed1b2d8e9c\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 19:05:18', '2024-04-29 15:41:06'),
('7f040b8e-52c5-4852-b5cc-a7f2853a651d', 'App\\Notifications\\AdminChannelServices', 'App\\User', 6, '{\"id\":\"7f040b8e-52c5-4852-b5cc-a7f2853a651d\",\"for_admin\":1,\"notification\":{\"id\":6,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"Sailor Beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=6\",\"type\":\"user\",\"message\":\"Sailor Beach Resort has been registered\"}}', 1, '2024-04-05 18:40:21', '2024-04-05 18:18:26', '2024-04-05 18:40:21'),
('81a2fdac-9ede-4b5a-b3e6-a50dab0c00c4', 'App\\Notifications\\AdminChannelServices', 'App\\User', 11, '{\"id\":\"81a2fdac-9ede-4b5a-b3e6-a50dab0c00c4\",\"for_admin\":1,\"notification\":{\"id\":11,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"Sm Shourob\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=11\",\"type\":\"user\",\"message\":\"Sm Shourob has been registered\"}}', 1, '2024-04-29 15:41:06', '2024-04-24 17:56:35', '2024-04-29 15:41:06'),
('82839ba4-9b58-417a-9ba2-deb751f6c3c2', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"82839ba4-9b58-417a-9ba2-deb751f6c3c2\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 17:22:27', '2024-05-13 10:29:13'),
('85a6002b-4a18-44a2-9f7c-91fb5b9d85f0', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"85a6002b-4a18-44a2-9f7c-91fb5b9d85f0\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 1, '2024-05-13 10:29:13', '2024-04-30 06:43:10', '2024-05-13 10:29:13'),
('873dc712-a31f-4ec0-865b-e80766a56930', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 6, '{\"id\":\"873dc712-a31f-4ec0-865b-e80766a56930\",\"for_admin\":0,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-05 20:07:05', '2024-04-05 20:07:05'),
('89102d62-5513-4eeb-96f9-576572bda002', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"89102d62-5513-4eeb-96f9-576572bda002\",\"for_admin\":1,\"notification\":{\"id\":7,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=7\",\"type\":\"hotel\",\"message\":\"Crowne Plaza Hotel has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('8abf7d45-caae-487b-9179-841e8485f08e', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 6, '{\"id\":\"8abf7d45-caae-487b-9179-841e8485f08e\",\"for_admin\":1,\"notification\":{\"id\":13,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Sailor beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=13\",\"type\":\"hotel\",\"message\":\"Hotel XYZ was updated to Publish by Sailor beach Resort\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:30:22', '2024-04-29 15:41:06'),
('8ffbc755-9e53-40a8-9f3a-fb5b5287976e', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"8ffbc755-9e53-40a8-9f3a-fb5b5287976e\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"CreatedServicesEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel\\/edit\\/12\",\"type\":\"hotel\",\"message\":\"Resort Bazar has created hotel Sailor Beach Resort\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 18:56:30', '2024-04-29 15:41:06'),
('90041a7b-be29-4ab3-acd0-0bfdfcc7a927', 'App\\Notifications\\AdminChannelServices', 'App\\User', 6, '{\"id\":\"90041a7b-be29-4ab3-acd0-0bfdfcc7a927\",\"for_admin\":1,\"notification\":{\"id\":6,\"event\":\"UpdatePlanRequest\",\"name\":\"Sailor beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"to\":\"admin\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/plan?s=6\",\"type\":\"plan\",\"message\":\"Sailor beach Resort plan request has been approved\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:29:22', '2024-04-29 15:41:06'),
('9645bb0c-6939-4a87-af96-24645c4b07bb', 'App\\Notifications\\AdminChannelServices', 'App\\User', 10, '{\"id\":\"9645bb0c-6939-4a87-af96-24645c4b07bb\",\"for_admin\":1,\"notification\":{\"id\":10,\"name\":\"Robel Air International\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/userUpgradeRequest\",\"type\":\"user_upgrade_request\",\"message\":\"Robel Air International has requested to become a vendor\"}}', 1, '2024-04-23 04:34:15', '2024-04-23 04:31:54', '2024-04-23 04:34:15'),
('9c2ee054-7f1b-499e-b7e9-9d4a44a56865', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"9c2ee054-7f1b-499e-b7e9-9d4a44a56865\",\"for_admin\":1,\"notification\":{\"id\":8,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=8\",\"type\":\"hotel\",\"message\":\"Stewart Hotel has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('a5dd50aa-006b-42a4-86ca-84a44e61d80a', 'App\\Notifications\\PrivateChannelServices', 'App\\Models\\User', 6, '{\"id\":\"a5dd50aa-006b-42a4-86ca-84a44e61d80a\",\"for_admin\":0,\"notification\":{\"id\":6,\"event\":\"CreatePlanRequest\",\"to\":\"customer\",\"name\":\"Sailor Beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/my-plan\",\"type\":\"plan\",\"message\":\"Your has created a plan request\"}}', 0, NULL, '2024-04-05 18:36:13', '2024-04-05 18:36:13'),
('ab17a940-8ebf-4b4a-b63c-8d1e0f5a8262', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 11, '{\"id\":\"ab17a940-8ebf-4b4a-b63c-8d1e0f5a8262\",\"for_admin\":0,\"notification\":{\"id\":15,\"event\":\"BookingCreatedEvent\",\"to\":\"vendor\",\"name\":\"test name 1\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/vendor\\/booking-report\",\"type\":\"hotel\",\"message\":\"test name 1 has created new Booking\"}}', 0, NULL, '2024-04-24 18:27:06', '2024-04-24 18:27:06'),
('af2be375-3ac2-48a4-8de9-7b586a9ac5fe', 'App\\Notifications\\AdminChannelServices', 'App\\User', 4, '{\"id\":\"af2be375-3ac2-48a4-8de9-7b586a9ac5fe\",\"for_admin\":1,\"notification\":{\"id\":4,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"MD Adil Ahnaf\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=4\",\"type\":\"user\",\"message\":\"MD Adil Ahnaf has been registered\"}}', 1, '2024-04-04 18:23:04', '2024-04-03 18:30:41', '2024-04-04 18:23:04'),
('b2fdd333-8238-45ed-907e-344b808c705f', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 4, '{\"id\":\"b2fdd333-8238-45ed-907e-344b808c705f\",\"for_admin\":0,\"notification\":{\"id\":10,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/hotel?id=10\",\"type\":\"hotel\",\"message\":\"Dylan Hotel was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-03 22:28:20', '2024-04-03 22:28:20'),
('bb3fa783-433e-4d06-a308-54998dd428c2', 'App\\Notifications\\AdminChannelServices', 'App\\User', 9, '{\"id\":\"bb3fa783-433e-4d06-a308-54998dd428c2\",\"for_admin\":1,\"notification\":{\"id\":9,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"Dustie Dustie\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user?s=9\",\"type\":\"user\",\"message\":\"Dustie Dustie has been registered\"}}', 1, '2024-04-29 15:41:06', '2024-04-20 16:38:01', '2024-04-29 15:41:06'),
('bc94d242-38ef-4430-a0ff-2d6f55c6603c', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"bc94d242-38ef-4430-a0ff-2d6f55c6603c\",\"for_admin\":1,\"notification\":{\"id\":5,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=5\",\"type\":\"hotel\",\"message\":\"Studio Allston Hotel has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('c51a6203-5931-48e7-ad1e-e3cb41b786d4', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 13, '{\"id\":\"c51a6203-5931-48e7-ad1e-e3cb41b786d4\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"CreateReviewEvent\",\"to\":\"admin\",\"name\":\"MELON L\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/review\",\"type\":\"car\",\"message\":\"MELON L has created a Review New on New\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 17:30:22', '2024-05-13 10:29:13'),
('c68da744-8dc7-42e6-8ab2-18ca5050b356', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 6, '{\"id\":\"c68da744-8dc7-42e6-8ab2-18ca5050b356\",\"for_admin\":1,\"notification\":{\"id\":13,\"event\":\"CreatedServicesEvent\",\"to\":\"admin\",\"name\":\"Sailor beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel\\/edit\\/13\",\"type\":\"hotel\",\"message\":\"Sailor beach Resort has created hotel Hotel XYZ\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:30:09', '2024-04-29 15:41:06'),
('c7119a67-238f-4f62-941f-08d32fde6049', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"c7119a67-238f-4f62-941f-08d32fde6049\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 16:01:15', '2024-05-13 10:29:13'),
('caba61cc-e61b-44a4-accd-d2f16e71e7a1', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"caba61cc-e61b-44a4-accd-d2f16e71e7a1\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 17:22:54', '2024-05-13 10:29:13'),
('cdfa1be3-c475-484e-92d0-b538c8278ccb', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 6, '{\"id\":\"cdfa1be3-c475-484e-92d0-b538c8278ccb\",\"for_admin\":1,\"notification\":{\"id\":13,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Sailor beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=13\",\"type\":\"hotel\",\"message\":\"Hotel XYZ was updated to Publish by Sailor beach Resort\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:31:33', '2024-04-29 15:41:06'),
('d1b554bb-6d13-45f1-9d25-af6b88cf1deb', 'App\\Notifications\\PrivateChannelServices', 'Modules\\User\\Models\\User', 6, '{\"id\":\"d1b554bb-6d13-45f1-9d25-af6b88cf1deb\",\"for_admin\":0,\"notification\":{\"id\":6,\"event\":\"VendorApproved\",\"to\":\"vendor\",\"name\":\"Sailor Beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/dashboard\",\"type\":\"user_upgrade_request\",\"message\":\"Your upgrade request has approved already\"}}', 0, NULL, '2024-04-05 18:21:47', '2024-04-05 18:21:47'),
('d51a5772-4159-4e6b-9efa-ce38aa008755', 'App\\Notifications\\AdminChannelServices', 'App\\User', 13, '{\"id\":\"d51a5772-4159-4e6b-9efa-ce38aa008755\",\"for_admin\":1,\"notification\":{\"id\":13,\"event\":\"SendMailUserRegistered\",\"to\":\"admin\",\"name\":\"MELON L\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/user?s=13\",\"type\":\"user\",\"message\":\"MELON L has been registered\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 17:30:02', '2024-05-13 10:29:13'),
('d932ed00-2acb-41df-9598-a25fd9acaaac', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"d932ed00-2acb-41df-9598-a25fd9acaaac\",\"for_admin\":1,\"notification\":{\"id\":10,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=10\",\"type\":\"hotel\",\"message\":\"Dylan Hotel was updated to Publish by Resort Bazar\"}}', 1, '2024-04-05 18:40:21', '2024-04-05 18:13:57', '2024-04-05 18:40:21'),
('ddd22a79-d92f-40a3-b2a7-9de8276ec679', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"ddd22a79-d92f-40a3-b2a7-9de8276ec679\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:14:25', '2024-04-29 15:41:06'),
('e35e8626-1fab-4eff-96e6-0be70b79f8ae', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"e35e8626-1fab-4eff-96e6-0be70b79f8ae\",\"for_admin\":1,\"notification\":{\"id\":6,\"event\":\"BookingCreatedEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/report\\/booking\",\"type\":\"hotel\",\"message\":\"Resort Bazar has created new Booking\"}}', 1, '2024-04-05 17:47:09', '2024-04-04 22:33:38', '2024-04-05 17:47:09'),
('e4447d00-16fe-4762-baa8-8d767977d791', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 4, '{\"id\":\"e4447d00-16fe-4762-baa8-8d767977d791\",\"for_admin\":0,\"notification\":{\"id\":6,\"event\":\"BookingCreatedEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/vendor\\/booking-report\",\"type\":\"hotel\",\"message\":\"Resort Bazar has created new Booking\"}}', 0, NULL, '2024-04-04 22:33:38', '2024-04-04 22:33:38'),
('e5d54aa0-ec4e-4a54-940b-1b08d5b7558d', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 6, '{\"id\":\"e5d54aa0-ec4e-4a54-940b-1b08d5b7558d\",\"for_admin\":1,\"notification\":{\"id\":13,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Sailor beach Resort\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=13\",\"type\":\"hotel\",\"message\":\"Hotel XYZ was updated to Publish by Sailor beach Resort\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:30:49', '2024-04-29 15:41:06'),
('e7826fa9-531c-415d-9ae9-b98a589bd11e', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"e7826fa9-531c-415d-9ae9-b98a589bd11e\",\"for_admin\":1,\"notification\":{\"id\":4,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=4\",\"type\":\"hotel\",\"message\":\"Redac Gateway Hotel has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('ea0d746d-a3c8-41a0-a314-23afbb17e2ef', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"ea0d746d-a3c8-41a0-a314-23afbb17e2ef\",\"for_admin\":1,\"notification\":{\"id\":10,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=10\",\"type\":\"hotel\",\"message\":\"Dylan Hotel was updated to Publish by Resort Bazar\"}}', 1, '2024-04-03 22:38:37', '2024-04-03 22:28:20', '2024-04-03 22:38:37'),
('ed7582da-e1af-4968-b00f-7c3d16c664ab', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 6, '{\"id\":\"ed7582da-e1af-4968-b00f-7c3d16c664ab\",\"for_admin\":0,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-05 20:14:25', '2024-04-05 20:14:25'),
('ef8f57ac-2e40-427c-95de-ef6d7b183aa0', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"ef8f57ac-2e40-427c-95de-ef6d7b183aa0\",\"for_admin\":1,\"notification\":{\"id\":14,\"event\":\"CreatedServicesEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel\\/edit\\/14\",\"type\":\"hotel\",\"message\":\"Resort Bazar has created hotel Hotel Air International\"}}', 1, '2024-04-29 15:41:06', '2024-04-24 17:51:13', '2024-04-29 15:41:06'),
('f0f3f9d9-00bf-4336-8cc6-6e07eb1cf25c', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"f0f3f9d9-00bf-4336-8cc6-6e07eb1cf25c\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"CreatedServicesEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/admin\\/module\\/car\\/edit\\/1\",\"type\":\"car\",\"message\":\"Resort Bazar has created car New\"}}', 1, '2024-05-13 10:29:13', '2024-04-29 16:00:30', '2024-05-13 10:29:13'),
('f3190176-6a59-4ca5-a74b-b2fde102e4e9', 'App\\Notifications\\AdminChannelServices', 'App\\User', 1, '{\"id\":\"f3190176-6a59-4ca5-a74b-b2fde102e4e9\",\"for_admin\":1,\"notification\":{\"id\":1,\"event\":\"UserSubscriberSubmit\",\"to\":\"admin\",\"name\":\"Someone\",\"avatar\":\"\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/user\\/subscriber\",\"type\":\"subscriber\",\"message\":\"You have just gotten a new Subscriber\"}}', 1, '2024-04-29 15:41:06', '2024-04-20 16:37:28', '2024-04-29 15:41:06'),
('f3a187f9-a1b6-4d27-9995-82044e46673e', 'App\\Notifications\\PrivateChannelServices', 'App\\User', 12, '{\"id\":\"f3a187f9-a1b6-4d27-9995-82044e46673e\",\"for_admin\":0,\"notification\":{\"id\":1,\"event\":\"UpdatedServiceEvent\",\"to\":\"vendor\",\"name\":\"Resort Bazar\",\"avatar\":\"http:\\/\\/bookingmain.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingmain.test\\/user\\/car?id=1\",\"type\":\"car\",\"message\":\"New was updated to Publish by Resort Bazar\"}}', 0, NULL, '2024-04-29 16:05:31', '2024-04-29 16:05:31'),
('f49b4866-383f-4527-852c-3bf2d2ae5543', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"f49b4866-383f-4527-852c-3bf2d2ae5543\",\"for_admin\":1,\"notification\":{\"id\":3,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"administrator 01\",\"avatar\":\"http:\\/\\/bookingcore1.test\\/images\\/avatar.png\",\"link\":\"http:\\/\\/bookingcore1.test\\/admin\\/module\\/hotel?id=3\",\"type\":\"hotel\",\"message\":\"Castello Casole Hotel has been deleted by administrator 01\"}}', 1, '2024-04-05 17:47:09', '2024-04-02 07:20:52', '2024-04-05 17:47:09'),
('fadc7562-cbba-447f-88ae-31fd4a207ab1', 'App\\Notifications\\PrivateChannelServices', 'Modules\\User\\Models\\User', 7, '{\"id\":\"fadc7562-cbba-447f-88ae-31fd4a207ab1\",\"for_admin\":0,\"notification\":{\"id\":7,\"event\":\"VendorApproved\",\"to\":\"vendor\",\"name\":\"xyz it\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/user\\/dashboard\",\"type\":\"user_upgrade_request\",\"message\":\"Your upgrade request has approved already\"}}', 0, NULL, '2024-04-05 19:56:51', '2024-04-05 19:56:51'),
('fb6ece94-53e3-43ea-985b-2834d8bfbb64', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"fb6ece94-53e3-43ea-985b-2834d8bfbb64\",\"for_admin\":1,\"notification\":{\"id\":10,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=10\",\"type\":\"hotel\",\"message\":\"Dylan Hotel was updated to Publish by Resort Bazar\"}}', 1, '2024-04-05 18:40:21', '2024-04-05 18:06:30', '2024-04-05 18:40:21'),
('fca14b63-194d-4c6f-a974-1691e2660c8c', 'App\\Notifications\\AdminChannelServices', 'App\\Models\\User', 1, '{\"id\":\"fca14b63-194d-4c6f-a974-1691e2660c8c\",\"for_admin\":1,\"notification\":{\"id\":12,\"event\":\"UpdatedServiceEvent\",\"to\":\"admin\",\"name\":\"Resort Bazar\",\"avatar\":\"https:\\/\\/resortbazar.com\\/images\\/avatar.png\",\"link\":\"https:\\/\\/resortbazar.com\\/admin\\/module\\/hotel?id=12\",\"type\":\"hotel\",\"message\":\"Sailor Beach Resort was updated to Publish by Resort Bazar\"}}', 1, '2024-04-29 15:41:06', '2024-04-05 20:21:07', '2024-04-29 15:41:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `avatar_id` bigint DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_score` decimal(2,1) DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `vendor_commission_amount` int DEFAULT NULL,
  `vendor_commission_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_commission` int DEFAULT NULL,
  `agent_commission_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `need_update_pw` tinyint DEFAULT '0',
  `role_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_gateway` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_guests` int DEFAULT NULL,
  `locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_submit_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` smallint DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2180f3',
  `stripe_customer_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_before_fees` decimal(10,2) DEFAULT NULL,
  `credit_balance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `business_name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `address`, `address2`, `phone`, `birthday`, `city`, `state`, `country`, `zip_code`, `last_login_at`, `avatar_id`, `bio`, `status`, `review_score`, `create_user`, `update_user`, `vendor_commission_amount`, `vendor_commission_type`, `agent_commission`, `agent_commission_type`, `need_update_pw`, `role_id`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `payment_gateway`, `total_guests`, `locale`, `user_name`, `verify_submit_status`, `is_verified`, `active_status`, `dark_mode`, `messenger_color`, `stripe_customer_id`, `total_before_fees`, `credit_balance`) VALUES
(1, 'ResortBazar Administrator', 'ResortBazar', 'Administrator', 'Resort Bazar', 'administrator@test.com', '2024-04-02 07:17:11', '$2y$10$zH3FcidHriJxxsZU4eHBV.hvxxovNvPcDyNZul1RlVPRN5lKWD85q', NULL, NULL, 'Tarakandi, Manohardi, Narsingdi, Dhaka', 'Recusandae Sit dolo', '112 666 888', NULL, 'Tarakandi', 'Dhaka', 'BD', 1650, NULL, NULL, '<p>I am Administrator</p>', 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, '4LZgTPjXkUWckC94VaEvsiXNiNAlr73jZKqqgWbFcklIRw25QPWl59HC9zzV', '2024-04-02 07:17:11', '2024-04-02 20:02:31', NULL, NULL, NULL, 'resortbazar', NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(2, 'Vendor 01', 'Vendor', '01', NULL, 'vendor@test.com', '2024-04-02 07:17:12', '$2y$10$4dVz/Nsr5NGYiP8CvYdr5OorzGsg.Zx2OlWhQeA85uSEdoU/p/y4K', NULL, NULL, NULL, NULL, '112 666 888', NULL, 'Dhaka', NULL, 'BD', NULL, NULL, NULL, 'We\'re designers who have fallen in love with creating spaces for others to reflect, reset, and create. We split our time between two deserts (the Mojave, and the Sonoran). We love the way the heat sinks into our bones, the vibrant sunsets, and the wildlife we get to call our neighbors.', 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(3, 'Customer 01', 'Customer', '01', NULL, 'customer@test.com', '2024-04-02 07:17:12', '$2y$10$EA/KfGYfMUA1hrM0Tgr1UeHWIcD9JD4OwTKszytS7vee9B4vJCPn2', NULL, NULL, NULL, NULL, '112 666 888', NULL, 'Dhaka', NULL, 'BD', NULL, NULL, NULL, 'We\'re designers who have fallen in love with creating spaces for others to reflect, reset, and create. We split our time between two deserts (the Mojave, and the Sonoran). We love the way the heat sinks into our bones, the vibrant sunsets, and the wildlife we get to call our neighbors.', 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, '2024-04-02 07:17:12', '2024-04-02 07:17:12', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(4, 'MD Adil Ahnaf', 'MD Adil', 'Ahnaf', NULL, 'smarthubagency32@gmail.com', NULL, '$2y$10$v/eQyqb1wdgRU/WWc.YfYuLqXDV8ZLr/GNPixpIG/5XbyyoB9xTZe', NULL, NULL, NULL, NULL, '01956958783', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, NULL, '2024-04-03 18:30:41', '2024-04-03 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(5, 'Ashraful Amin', 'Ashraful', 'Amin', NULL, 'ashrafulamin001@gmail.com', NULL, '$2y$10$SxwNEAl3XlM2M33nhQPKGOdsCYZLrJN8snRJ4LlglB2ivmvLpZPyK', NULL, NULL, NULL, NULL, '01998788774', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, NULL, '2024-04-03 20:23:17', '2024-04-03 20:23:18', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(6, 'Sailor Beach Resort', 'Sailor Beach', 'Resort', 'Sailor beach Resort', 'sailor@gmail.com', NULL, '$2y$10$R1qC0vPaj8xl1fnN5Wvl/uMox28ybWdNv76xjGw2cjtaHhgP9M462', NULL, NULL, NULL, NULL, '01990959494', NULL, NULL, NULL, 'BD', NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 'NjvBjwdReeebX8kkVLZMyYQ9gmRCSE64Lz20X4yZHGA9tD0BnZCJ8aTaEDZo', '2024-04-05 18:18:26', '2024-04-05 18:38:24', NULL, NULL, NULL, 'sailor', NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(7, 'xyz it', 'xyz', 'it', NULL, 'xyz@gmail.com', NULL, '$2y$10$S9LSd/QajAwZJINVVp4.P.wKuK90Yh2mOIzQmibblWirGiEJcnG26', NULL, NULL, NULL, NULL, '016754441473', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, '2024-04-05 19:54:07', '2024-04-05 19:56:51', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(8, 'Melonmia l', 'Melonmia', 'l', NULL, 'melonmia@gmail.com', NULL, '$2y$10$cgrJvvpmNK9sbYQI5G7uzOGVLM5jKF1hmiP/L7n7KQ2LnwJNEt4lm', NULL, NULL, 'Chalana,charsindur,palash,Narsingdi', 'Recusandae Sit dolo', '01575583122', NULL, 'Charsindur', 'Dhaka', 'BD', 1612, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, NULL, '2024-04-05 20:03:02', '2024-04-05 20:03:02', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(9, 'Dustie Dustie', 'Dustie', 'Dustie', NULL, 'qwtwptcmbj.w@sandcress.xyz', NULL, '$2y$10$simGePPPnEbtNqkWODo3nObhf8HjL.qkupGA5myVbb1KdEd..Lpn2', NULL, NULL, NULL, NULL, '141-689-06-67', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, NULL, '2024-04-20 16:38:01', '2024-04-20 16:38:01', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(10, 'Robel Mia', 'Robel', 'Mia', 'Robel Air International', 'robelofficial247@gmail.com', NULL, '$2y$10$tDDzRp3Vr9mfzOdv4AwsZ.omCNOJAiwgfhoibU26EwAE0DpJ3uTYy', NULL, NULL, 'khilkhet', NULL, '01949497020', '1970-01-01', 'Dhaka', 'Dhaka', 'BD', 1213, NULL, NULL, '', 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, '2024-04-23 04:31:54', '2024-04-23 04:34:21', NULL, NULL, NULL, 'robelairinternational', NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(11, 'Sm Shourob', 'Sm', 'Shourob', NULL, 'smshourob@gmail.com', NULL, '$2y$10$fSJrnJcnXAReJCLB7BDfbOiOzR6rUU3p3ovmjcFO4H3pQhpJv6E/S', NULL, NULL, NULL, NULL, '01775797085', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, '2024-04-24 17:56:35', '2024-04-24 17:58:02', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(12, 'test name 1', 'test name', '1', NULL, 'test@gmail.com', NULL, '$2y$10$EJVKz0KYY3vJYHr8yRSkWeuc6icpno8e8QdPRonAMDW5MGRZGTbz6', NULL, NULL, 'dhaka', 'metro', '1234567890', NULL, 'dhaka', NULL, 'BD', NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, NULL, '2024-04-24 18:27:05', '2024-04-24 18:27:06', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL),
(13, 'MELON L', 'MELON', 'L', NULL, 'gmailcom@gmail.com', NULL, '$2y$10$L..kF8i4PPVv9ffLAVR8leUE58QpleD4yrhDvkYXzDNFoFdOAGvc2', NULL, NULL, NULL, NULL, '2345678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'publish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, NULL, '2024-04-29 17:30:01', '2024-04-29 17:30:02', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '#2180f3', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_upgrade_request`
--

CREATE TABLE `user_upgrade_request` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `role_request` int DEFAULT NULL,
  `approved_time` datetime DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_upgrade_request`
--

INSERT INTO `user_upgrade_request` (`id`, `user_id`, `role_request`, `approved_time`, `status`, `approved_by`, `create_user`, `update_user`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 6, 2, '2024-04-06 00:21:47', 'approved', 1, 6, 1, NULL, '2024-04-05 18:19:31', '2024-04-05 18:21:47'),
(2, 7, 2, '2024-04-06 01:56:51', 'approved', 1, 7, 1, NULL, '2024-04-05 19:54:35', '2024-04-05 19:56:51'),
(3, 10, 2, '2024-04-23 10:34:21', 'approved', 1, 1, NULL, NULL, '2024-04-23 04:31:54', '2024-04-23 04:34:21'),
(4, 11, 2, '2024-04-24 23:58:02', 'approved', 1, 11, 1, NULL, '2024-04-24 17:56:50', '2024-04-24 17:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_wishlist`
--

CREATE TABLE `user_wishlist` (
  `id` bigint UNSIGNED NOT NULL,
  `object_id` int DEFAULT NULL,
  `object_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors_plan_payments`
--

CREATE TABLE `vendors_plan_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` int NOT NULL,
  `amount` int NOT NULL,
  `payment_gateway` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_trial` int NOT NULL,
  `price_per` enum('onetime','per_time') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onetime',
  `price_unit` enum('day','month','year') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'day',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_team`
--

CREATE TABLE `vendor_team` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint NOT NULL,
  `member_id` bigint NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `update_user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bravo_airline`
--
ALTER TABLE `bravo_airline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_airport`
--
ALTER TABLE `bravo_airport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_airport_code_unique` (`code`);

--
-- Indexes for table `bravo_attrs`
--
ALTER TABLE `bravo_attrs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_attrs_translations`
--
ALTER TABLE `bravo_attrs_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_attrs_translations_origin_id_locale_unique` (`origin_id`,`locale`);

--
-- Indexes for table `bravo_boats`
--
ALTER TABLE `bravo_boats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_boats_slug_index` (`slug`);

--
-- Indexes for table `bravo_boat_dates`
--
ALTER TABLE `bravo_boat_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_boat_term`
--
ALTER TABLE `bravo_boat_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_boat_translations`
--
ALTER TABLE `bravo_boat_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_boat_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_bookings`
--
ALTER TABLE `bravo_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_booking_coupons`
--
ALTER TABLE `bravo_booking_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_booking_meta`
--
ALTER TABLE `bravo_booking_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_booking_passengers`
--
ALTER TABLE `bravo_booking_passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_booking_passengers_booking_id_index` (`booking_id`),
  ADD KEY `bravo_booking_passengers_object_model_object_id_index` (`object_model`,`object_id`);

--
-- Indexes for table `bravo_booking_payments`
--
ALTER TABLE `bravo_booking_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_booking_payment_meta`
--
ALTER TABLE `bravo_booking_payment_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_booking_payment_meta_payment_id_name_index` (`payment_id`,`name`);

--
-- Indexes for table `bravo_booking_time_slots`
--
ALTER TABLE `bravo_booking_time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_cars`
--
ALTER TABLE `bravo_cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_cars_slug_index` (`slug`);

--
-- Indexes for table `bravo_car_dates`
--
ALTER TABLE `bravo_car_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_car_term`
--
ALTER TABLE `bravo_car_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_car_translations`
--
ALTER TABLE `bravo_car_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_car_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_contact`
--
ALTER TABLE `bravo_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_coupons`
--
ALTER TABLE `bravo_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_coupons_code_unique` (`code`);

--
-- Indexes for table `bravo_coupon_services`
--
ALTER TABLE `bravo_coupon_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_enquiries`
--
ALTER TABLE `bravo_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_enquiry_replies`
--
ALTER TABLE `bravo_enquiry_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_enquiry_replies_parent_id_index` (`parent_id`);

--
-- Indexes for table `bravo_events`
--
ALTER TABLE `bravo_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_events_slug_index` (`slug`);

--
-- Indexes for table `bravo_event_dates`
--
ALTER TABLE `bravo_event_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_event_term`
--
ALTER TABLE `bravo_event_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_event_translations`
--
ALTER TABLE `bravo_event_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_event_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_flight`
--
ALTER TABLE `bravo_flight`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_flight_seat`
--
ALTER TABLE `bravo_flight_seat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_flight_term`
--
ALTER TABLE `bravo_flight_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_hotels`
--
ALTER TABLE `bravo_hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_hotels_slug_index` (`slug`);

--
-- Indexes for table `bravo_hotel_rooms`
--
ALTER TABLE `bravo_hotel_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_hotel_room_bookings`
--
ALTER TABLE `bravo_hotel_room_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_hotel_room_dates`
--
ALTER TABLE `bravo_hotel_room_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_hotel_room_term`
--
ALTER TABLE `bravo_hotel_room_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_hotel_room_translations`
--
ALTER TABLE `bravo_hotel_room_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_hotel_room_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_hotel_term`
--
ALTER TABLE `bravo_hotel_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_hotel_translations`
--
ALTER TABLE `bravo_hotel_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_hotel_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_locations`
--
ALTER TABLE `bravo_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_locations__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `bravo_location_translations`
--
ALTER TABLE `bravo_location_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_location_translations_origin_id_locale_unique` (`origin_id`,`locale`);

--
-- Indexes for table `bravo_payouts`
--
ALTER TABLE `bravo_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_plans`
--
ALTER TABLE `bravo_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_plan_trans`
--
ALTER TABLE `bravo_plan_trans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_plan_trans_origin_id_locale_unique` (`origin_id`,`locale`),
  ADD KEY `bravo_plan_trans_locale_index` (`locale`);

--
-- Indexes for table `bravo_popups`
--
ALTER TABLE `bravo_popups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_popup_translations`
--
ALTER TABLE `bravo_popup_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_popup_translations_origin_id_locale_unique` (`origin_id`,`locale`),
  ADD KEY `bravo_popup_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_review`
--
ALTER TABLE `bravo_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_review_meta`
--
ALTER TABLE `bravo_review_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_seat_type`
--
ALTER TABLE `bravo_seat_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_seat_type_code_unique` (`code`);

--
-- Indexes for table `bravo_seo`
--
ALTER TABLE `bravo_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_services`
--
ALTER TABLE `bravo_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_services_slug_index` (`slug`);

--
-- Indexes for table `bravo_service_translations`
--
ALTER TABLE `bravo_service_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_service_translations_origin_id_locale_unique` (`origin_id`,`locale`);

--
-- Indexes for table `bravo_spaces`
--
ALTER TABLE `bravo_spaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_spaces_slug_index` (`slug`);

--
-- Indexes for table `bravo_space_dates`
--
ALTER TABLE `bravo_space_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_space_term`
--
ALTER TABLE `bravo_space_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_space_translations`
--
ALTER TABLE `bravo_space_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_space_translations_locale_index` (`locale`);

--
-- Indexes for table `bravo_terms`
--
ALTER TABLE `bravo_terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_terms_translations`
--
ALTER TABLE `bravo_terms_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_terms_translations_origin_id_locale_unique` (`origin_id`,`locale`);

--
-- Indexes for table `bravo_tours`
--
ALTER TABLE `bravo_tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_tours_slug_index` (`slug`);

--
-- Indexes for table `bravo_tour_category`
--
ALTER TABLE `bravo_tour_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bravo_tour_category__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `bravo_tour_category_translations`
--
ALTER TABLE `bravo_tour_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_tour_category_translations_origin_id_locale_unique` (`origin_id`,`locale`);

--
-- Indexes for table `bravo_tour_dates`
--
ALTER TABLE `bravo_tour_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_tour_meta`
--
ALTER TABLE `bravo_tour_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_tour_term`
--
ALTER TABLE `bravo_tour_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bravo_tour_translations`
--
ALTER TABLE `bravo_tour_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bravo_tour_translations_origin_id_locale_unique` (`origin_id`,`locale`),
  ADD KEY `bravo_tour_translations_slug_index` (`slug`);

--
-- Indexes for table `bravo_user_plan`
--
ALTER TABLE `bravo_user_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_inbox`
--
ALTER TABLE `core_inbox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_inbox_messages`
--
ALTER TABLE `core_inbox_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_languages`
--
ALTER TABLE `core_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_menus`
--
ALTER TABLE `core_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_menu_translations`
--
ALTER TABLE `core_menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_menu_translations_locale_index` (`locale`);

--
-- Indexes for table `core_news`
--
ALTER TABLE `core_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_news_category`
--
ALTER TABLE `core_news_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_news_category__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `core_news_category_translations`
--
ALTER TABLE `core_news_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_news_category_translations_locale_index` (`locale`);

--
-- Indexes for table `core_news_tag`
--
ALTER TABLE `core_news_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_news_translations`
--
ALTER TABLE `core_news_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_news_translations_locale_index` (`locale`);

--
-- Indexes for table `core_notifications`
--
ALTER TABLE `core_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_pages`
--
ALTER TABLE `core_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_pages_slug_index` (`slug`);

--
-- Indexes for table `core_page_translations`
--
ALTER TABLE `core_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_page_translations_origin_id_locale_unique` (`origin_id`,`locale`),
  ADD KEY `core_page_translations_locale_index` (`locale`);

--
-- Indexes for table `core_roles`
--
ALTER TABLE `core_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_role_permissions`
--
ALTER TABLE `core_role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_role_permissions_role_id_permission_unique` (`role_id`,`permission`);

--
-- Indexes for table `core_settings`
--
ALTER TABLE `core_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_subscribers`
--
ALTER TABLE `core_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_tags`
--
ALTER TABLE `core_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_tag_translations`
--
ALTER TABLE `core_tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_tag_translations_locale_index` (`locale`);

--
-- Indexes for table `core_templates`
--
ALTER TABLE `core_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_template_translations`
--
ALTER TABLE `core_template_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_template_translations_locale_index` (`locale`);

--
-- Indexes for table `core_translations`
--
ALTER TABLE `core_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_vendor_plans`
--
ALTER TABLE `core_vendor_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_vendor_plan_meta`
--
ALTER TABLE `core_vendor_plan_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_transactions`
--
ALTER TABLE `credit_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_transactions_user_id_index` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `location_category`
--
ALTER TABLE `location_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_category__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `location_category_translations`
--
ALTER TABLE `location_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location_category_translations_origin_id_locale_unique` (`origin_id`,`locale`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_folders_parent_id_name_unique` (`parent_id`,`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_upgrade_request`
--
ALTER TABLE `user_upgrade_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors_plan_payments`
--
ALTER TABLE `vendors_plan_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_team`
--
ALTER TABLE `vendor_team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bravo_airline`
--
ALTER TABLE `bravo_airline`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_airport`
--
ALTER TABLE `bravo_airport`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_attrs`
--
ALTER TABLE `bravo_attrs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bravo_attrs_translations`
--
ALTER TABLE `bravo_attrs_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_boats`
--
ALTER TABLE `bravo_boats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_boat_dates`
--
ALTER TABLE `bravo_boat_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_boat_term`
--
ALTER TABLE `bravo_boat_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_boat_translations`
--
ALTER TABLE `bravo_boat_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_bookings`
--
ALTER TABLE `bravo_bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `bravo_booking_coupons`
--
ALTER TABLE `bravo_booking_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_booking_meta`
--
ALTER TABLE `bravo_booking_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `bravo_booking_passengers`
--
ALTER TABLE `bravo_booking_passengers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bravo_booking_payments`
--
ALTER TABLE `bravo_booking_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bravo_booking_payment_meta`
--
ALTER TABLE `bravo_booking_payment_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bravo_booking_time_slots`
--
ALTER TABLE `bravo_booking_time_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_cars`
--
ALTER TABLE `bravo_cars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bravo_car_dates`
--
ALTER TABLE `bravo_car_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bravo_car_term`
--
ALTER TABLE `bravo_car_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_car_translations`
--
ALTER TABLE `bravo_car_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_contact`
--
ALTER TABLE `bravo_contact`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bravo_coupons`
--
ALTER TABLE `bravo_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_coupon_services`
--
ALTER TABLE `bravo_coupon_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_enquiries`
--
ALTER TABLE `bravo_enquiries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_enquiry_replies`
--
ALTER TABLE `bravo_enquiry_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_events`
--
ALTER TABLE `bravo_events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_event_dates`
--
ALTER TABLE `bravo_event_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_event_term`
--
ALTER TABLE `bravo_event_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_event_translations`
--
ALTER TABLE `bravo_event_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_flight`
--
ALTER TABLE `bravo_flight`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_flight_seat`
--
ALTER TABLE `bravo_flight_seat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_flight_term`
--
ALTER TABLE `bravo_flight_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_hotels`
--
ALTER TABLE `bravo_hotels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bravo_hotel_rooms`
--
ALTER TABLE `bravo_hotel_rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `bravo_hotel_room_bookings`
--
ALTER TABLE `bravo_hotel_room_bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `bravo_hotel_room_dates`
--
ALTER TABLE `bravo_hotel_room_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bravo_hotel_room_term`
--
ALTER TABLE `bravo_hotel_room_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `bravo_hotel_room_translations`
--
ALTER TABLE `bravo_hotel_room_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_hotel_term`
--
ALTER TABLE `bravo_hotel_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `bravo_hotel_translations`
--
ALTER TABLE `bravo_hotel_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_locations`
--
ALTER TABLE `bravo_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bravo_location_translations`
--
ALTER TABLE `bravo_location_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_payouts`
--
ALTER TABLE `bravo_payouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_plans`
--
ALTER TABLE `bravo_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bravo_plan_trans`
--
ALTER TABLE `bravo_plan_trans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_popups`
--
ALTER TABLE `bravo_popups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_popup_translations`
--
ALTER TABLE `bravo_popup_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_review`
--
ALTER TABLE `bravo_review`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `bravo_review_meta`
--
ALTER TABLE `bravo_review_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `bravo_seat_type`
--
ALTER TABLE `bravo_seat_type`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_seo`
--
ALTER TABLE `bravo_seo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `bravo_services`
--
ALTER TABLE `bravo_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bravo_service_translations`
--
ALTER TABLE `bravo_service_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_spaces`
--
ALTER TABLE `bravo_spaces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_space_dates`
--
ALTER TABLE `bravo_space_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_space_term`
--
ALTER TABLE `bravo_space_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_space_translations`
--
ALTER TABLE `bravo_space_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_terms`
--
ALTER TABLE `bravo_terms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bravo_terms_translations`
--
ALTER TABLE `bravo_terms_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tours`
--
ALTER TABLE `bravo_tours`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tour_category`
--
ALTER TABLE `bravo_tour_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tour_category_translations`
--
ALTER TABLE `bravo_tour_category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tour_dates`
--
ALTER TABLE `bravo_tour_dates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tour_meta`
--
ALTER TABLE `bravo_tour_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tour_term`
--
ALTER TABLE `bravo_tour_term`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_tour_translations`
--
ALTER TABLE `bravo_tour_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bravo_user_plan`
--
ALTER TABLE `bravo_user_plan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ch_messages`
--
ALTER TABLE `ch_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_inbox`
--
ALTER TABLE `core_inbox`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_inbox_messages`
--
ALTER TABLE `core_inbox_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_languages`
--
ALTER TABLE `core_languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_menus`
--
ALTER TABLE `core_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_menu_translations`
--
ALTER TABLE `core_menu_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_news`
--
ALTER TABLE `core_news`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_news_category`
--
ALTER TABLE `core_news_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_news_category_translations`
--
ALTER TABLE `core_news_category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_news_tag`
--
ALTER TABLE `core_news_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_news_translations`
--
ALTER TABLE `core_news_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_notifications`
--
ALTER TABLE `core_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_pages`
--
ALTER TABLE `core_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `core_page_translations`
--
ALTER TABLE `core_page_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_roles`
--
ALTER TABLE `core_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_role_permissions`
--
ALTER TABLE `core_role_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `core_settings`
--
ALTER TABLE `core_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `core_subscribers`
--
ALTER TABLE `core_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_tags`
--
ALTER TABLE `core_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_tag_translations`
--
ALTER TABLE `core_tag_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_templates`
--
ALTER TABLE `core_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `core_template_translations`
--
ALTER TABLE `core_template_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_translations`
--
ALTER TABLE `core_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_vendor_plans`
--
ALTER TABLE `core_vendor_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_vendor_plan_meta`
--
ALTER TABLE `core_vendor_plan_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_transactions`
--
ALTER TABLE `credit_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_category`
--
ALTER TABLE `location_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `location_category_translations`
--
ALTER TABLE `location_category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_upgrade_request`
--
ALTER TABLE `user_upgrade_request`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_wishlist`
--
ALTER TABLE `user_wishlist`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors_plan_payments`
--
ALTER TABLE `vendors_plan_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_team`
--
ALTER TABLE `vendor_team`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
