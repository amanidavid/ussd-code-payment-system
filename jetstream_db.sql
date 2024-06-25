-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 09:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jetstream_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDailyPayments` ()   BEGIN
    SELECT DATE(created_at) as date, SUM(amount) as total_amount
    FROM payments
    GROUP BY DATE(created_at);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_tax` (`amount` FLOAT) RETURNS DECIMAL(10,2)  BEGIN
    DECLARE tax DECIMAL(10, 2);
    DECLARE tax_rate DECIMAL(3, 2);

    -- Set the tax rate as 10% (0.1 in decimal form)
    SET tax_rate = 0.1;

    -- Calculate tax
    SET tax = amount * tax_rate;

    RETURN tax;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_05_15_095101_create_sessions_table', 1),
(7, '2024_05_15_105616_create_permission_tables', 2),
(8, '2024_05_23_002304_create_payments_table', 3),
(9, '2024_06_19_025838_add_transaction', 4),
(10, '2024_06_19_042711_create_tra_table', 5),
(11, '2024_06_19_042824_create_tras_table', 5),
(12, '2024_06_19_051130_drop_foreign_key_from_tras_table', 6),
(13, '2024_06_19_052201_create_taxcharges_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(20) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `status`, `phoneNumber`, `amount`, `transaction_id`, `created_at`, `updated_at`) VALUES
(8, 'paid', '+255757515621', 10, NULL, '2024-06-09 12:37:42', '2024-06-09 12:37:42'),
(9, 'paid', '+255757515621', 10, NULL, '2024-06-09 12:45:13', '2024-06-09 12:45:13'),
(10, 'paid', '+255624750766', 10, NULL, '2024-06-09 13:45:05', '2024-06-09 13:45:05'),
(11, 'paid', '+255624750766', 10, NULL, '2024-06-09 14:00:46', '2024-06-09 14:00:46'),
(12, 'paid', '+255624750766', 10, NULL, '2024-06-10 05:51:51', '2024-06-10 05:51:51'),
(13, 'paid', '+255715329962', 10, NULL, '2024-06-10 06:00:20', '2024-06-10 06:00:20'),
(14, 'paid', '+255620711848', 12, '858061d9887f4cb0', '2024-06-19 00:22:41', '2024-06-19 00:22:41'),
(15, 'paid', '+255620711848', 13, 'a1e48ed63aab4cb0', '2024-06-19 00:24:05', '2024-06-19 00:24:05'),
(16, 'paid', '+255620711848', 11, '350a1f9720ae6e96', '2024-06-19 02:25:56', '2024-06-19 02:25:56'),
(17, 'paid', '+255620711848', 18, 'ae2ccbc6631b1fbd', '2024-06-19 02:28:37', '2024-06-19 02:28:37'),
(18, 'paid', '+255620711848', 10, '96382ee41fbe309a', '2024-06-19 14:06:48', '2024-06-19 14:06:48'),
(19, 'paid', '+255620711848', 10, '368485c75893fdb5', '2024-06-19 15:02:10', '2024-06-19 15:02:10'),
(20, 'paid', '+255620711848', 13, '151c6b49204415ad', '2024-06-19 22:55:39', '2024-06-19 22:55:39'),
(21, 'paid', '+255788524948', 9, 'd030e1543d2b6b52', '2024-06-20 06:14:45', '2024-06-20 06:14:45'),
(22, 'paid', '+255620711848', 10, '43f892893d6f9a87', '2024-06-20 07:38:37', '2024-06-20 07:38:37'),
(23, 'paid', '+255629249757', 135, '571d551aeb769c5e', '2024-06-20 10:06:48', '2024-06-20 10:06:48'),
(24, 'paid', '+255629249757', 180, '0a89c80439fbf7e5', '2024-06-20 10:10:44', '2024-06-20 10:10:44'),
(25, 'paid', '+255715329962', 90, '853a6035d2640514', '2024-06-23 13:39:00', '2024-06-23 13:39:00');

--
-- Triggers `payments`
--
DELIMITER $$
CREATE TRIGGER `before_payment_insert` BEFORE INSERT ON `payments` FOR EACH ROW BEGIN
    DECLARE tax DECIMAL(10, 2);
    SET tax = calculate_tax(NEW.amount);

    INSERT INTO taxcharges (tax_charges, amount, created_at, updated_at)
    VALUES (tax, NEW.amount, NOW(), NOW());

    SET NEW.amount = NEW.amount - tax;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `payment_details_view`
-- (See below for the actual view)
--
CREATE TABLE `payment_details_view` (
`amount` decimal(10,0)
,`transaction_id` varchar(20)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Student', 'web', '2024-05-21 09:24:34', '2024-05-21 09:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('06p05kj6lG6XaVnhW6iKbv9mg8qk0UyUSSgOGVxw', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicFpYQ2xlREVtUXJPUzMxSU01SHZvRnY5OVg3YzR1bkszM050eHlpRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718889035),
('0ZhPgOPCgVXVGOwamXCBUZSVgfwsI1TPjdpKaKv1', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoienY0cEVtTWJvUWc1ZTRhZ3hhNVNQVzVYVDdqZkwyN3pwMHBVYXk4MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDFzLk5xQzZENWU4WGVobWY5RlhyaU9scnUwNFdNdE9FRThsN2tUOWZUQ0RtUm1rdlRnWkV1Ijt9', 1718889080),
('280m0sC1zO02NFZlN4TrpxZH5vKCcHBO4b4RtQRE', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid1U1djVJOFA2WWNQNWNqQWs4MFZWZGh0a3RYa28wUkF6VllrTm1EdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160665),
('37inUNfTsOP16nllGdbzHvAMZigp4G2nm9rxt0dS', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmdxRDJzYXh1MXhSZ2I2cEF2bk5nQ0hMU01aNEduNzB0WmRUeFF6UiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718879878),
('4MevhXQ5cMF1cPACzPoIqA940Tx8g130AthFSDN9', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieWhVUFRydzZEM0k2MmY5YkRSQ2VWZFNiTVd4TXlCcXQ1bG1RU1l3dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718879918),
('5iriFMil4TUHMPc1abJs7xGEXFNdYdPMoMkhn6Gp', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaThtRWZ2N2o2ZmplZFY2QUw0Y2dxSXlkekI0VFN1bFdubDV1ZDRKTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160614),
('6JP0yiQwYbgsnRehpgxxUxaGNlX1OclX2cfnT13r', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSGxLWlY5ZU1weUthdzA2Ylh2U3Bmb1d1MHJrczlSUkZ3RXFuUXFrMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718879891),
('6VKfsvIMgaHyU8EjkinAUSK1kYD8YmpFcdCCBlQW', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMDdPNkNqdWNTbFlIQ0FaS1czcURMTHB5ekFtd3IyNkZtTmJsNFc3biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160310),
('B3ya0lBBxU2WVvP9ZaIgkHMpE4APSXPUTFd4QCQR', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiS1pmbFc1RzUyemVuVVhLdzdvZEU5ZjhiQWxzd2drY29ISGo5RGVBViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718874887),
('DMPobp4mMtlppxZfLeOMzaSr8mZGJdc0Q556RMNy', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieENsOVFvdUlMWlBBWjNzRElISDhxWWx3MWtVTjRNd2cwb1lwQVRKOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718874866),
('ea82rB2nrG3k9wY6TTJxJlIGZ3GrQMbawXMUc5vm', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQkJvOUp1WEdqRTJDMWxUcmtmMmxvcG9DYVdtR1VwT3E4NGR1OUJ6VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160716),
('EIL0COQLrLYgZE5BOymmdIvk5Tgq2gvXl0fBSrMJ', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTVk4cFdrZk5jRnJRQnUyOUlSdEtGZEZNT0doM0REaVZDUXhUNlp4bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718889027),
('eKjPhAFVhHXP1hwCpENBCOAWd6w699t6rEdQaZIA', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicm9DSk02elpvYTlHeExCbk8xem5OTU51VklNVlRyZzJ1djMxU0trMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718888791),
('ghHcCHERZdGfVKdoHEi5MkUt6wtoZqKd7kkk1hOj', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMjJRVElRQWl2ZEswMTJSZXFEWHZjTkI3c3p2OE41VVRaTk9wQUlFWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160735),
('GI5TdBhnDLHHQak53ylJ6aJwV1bzJ6SITATD7RwK', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaTJuNFd1bnJSTXNnZ3puYm9KcWFxbFE1V2plOFFlRUlGcnBkeTFsRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718879873),
('IsOU2iYq4U7eNyBAGTLG4Rf4DA6LtdCaxOzHTGLt', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN2JWMk1sMmx1NXVyT1ZlVTlCUGZrTFZBUjRaS1RHTUhHemEzZEJHayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718874871),
('JvDXIKr2s5iAX8scBG9cyKpic7I74OLG4OGP4j3G', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic25hQkxxSENSRmdET3ZkMnBNTGdLOE1MdGE5bHBjeE44N1ZZQWN2WCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718888787),
('jZ5GxO0cZzas5bQe0B2G4Lr1gW3okcrVM8i4d1lc', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZjFIN0t6VGFhNGVSdENzMFNieHFlRVFEeXZENkZEOGJSSFd6dERSbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718874861),
('KaXXkYO3IEL6zXCgIrGwZQd8XjkfYTbSZWG8x13I', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVXhrOEZ3M2FUMjh6d0dlZ2FlbHUzNjlmdUFjOHh1VmZBOWNGVFpRciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718888632),
('KhnEkmn7Z7yrXavln4Wb91DT7oFuRFJ04Bsyo2A4', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiS2Y1d2diQnM1bGxWRDBXQzRqeE9kdmdmdDMzSWVGZlZ4NlhDRnIzTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718889045),
('kIeOlY5dZxQNwED2U8k1GGgGnmBbjk2XSGZXrEmb', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibWR0ZGpBZnpxU2dhNWVuMFVHMWhGMVRTVXV6bm9RaEVOQzM0ZGRPRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718889040),
('LdP437dhTKYpoqDPZa2syulweSnTOPU07YLeWgrN', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicHVlNlpsTXpnV2wwTU9uYVNZeVB1QWVRVFVwZWNrbTRsSkhJYmdQcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160728),
('NDTectaYkH8ULeQmgk7JCiveJpTRni6ZrsoZLvKn', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV3psalE2ZXBnaFlBY1RnaTFEM0V3OGlaQllJekk4ZWh0NnRndEpYbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160722),
('NiqgTpzCTZaytsDlVr79P3yJYyHDVqlcFbIqKusS', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSXh3S3l5STZMQW5WNnZyRXNMZWI0WjRhS1o0QmE3TnZKMVF3V085NyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718888782),
('OlAiodYJYyz3tthzDy0xC6Yf7AAAlOy3DZnWJLyv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib05mY0hYcEhVOGV6ME5LUjNWOU1odjRUa2lzc2l1ajZRblphMG5wWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYmUwLTE5Ny0yNTAtMjA0LTE5Lm5ncm9rLWZyZWUuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160293),
('oOje47I5UeAJgrYjp3VDUEaqMHACw5D58lpJD9jh', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU0ROU3c2NXdVWFhGVnFRTnF5N3gyblRkMmVicHZQYTB0UG5SaVl5YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718888811),
('P4BOkEsUXeihEXMmjlYikhZO7Pk4HKQ1ZEWkdZJS', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidEE0WnExR0VKSmpqWllzN1ZicWdQRmVjdjdYdE5RN2t5eWVydWg0bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160745),
('rdc3Exz5YxKUwIbj2pCtanDn74sy8D4ptrDUpVap', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU2kxdmRmaUd3bTAzaGVZd29SaTV3WFJhcnRrcEM2TDEyak13Q1hQVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718879868),
('RV0ZeKxi1kDekZsT5gNUYmb9gK56ldx7FVRAvTt5', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTjFjSUtKYWxtM0ZHeVI0d1BBa05UUUpCQTd2RWd2aTdKWTBoQTNFTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718874880),
('S7506j3AaiPuArgrWOMcXgRodtCJsXXgoRhDEYDh', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGQzV3BpWTNOU1BQem1hV284TVZSRG9ONUl6VW9saWZiaFlFM3dDRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160627),
('sDT2n3dQnpgk1d14Cfmgfdys8M2aNK7x07bQpEFX', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZExWVENyUE9EaDhjRVM5Y3RKRTRHM01LSW1FZWFuS3pZbHdrb0dCQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719160604),
('TuoQ4TK9vo3y37EvW7zKUb4O1D6SsPtF7PQxCCi4', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRHFadmt3Q0J3bVNWRElUNGpwUUowVUhpY0swUGhNb2k0S0pkNjFEbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718888804),
('wEeXllQu5FNv8g2rILWxVNc1kdK4g1Yd2iKWpMt6', NULL, '127.0.0.1', 'at-ussd-api/1.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNnc3RWlGUTA4alY3OXdiMWJrWlJZNTB1Qmx3YlFyQXJqQUVrNDlWNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718889031);

-- --------------------------------------------------------

--
-- Table structure for table `taxcharges`
--

CREATE TABLE `taxcharges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_charges` decimal(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxcharges`
--

INSERT INTO `taxcharges` (`id`, `tax_charges`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1.20, 12.00, '2024-06-19 05:25:56', '2024-06-19 05:25:56'),
(2, 2.00, 20.00, '2024-06-19 05:28:37', '2024-06-19 05:28:37'),
(3, 1.10, 11.00, '2024-06-19 17:06:48', '2024-06-19 17:06:48'),
(4, 1.10, 11.00, '2024-06-19 18:02:10', '2024-06-19 18:02:10'),
(5, 1.40, 14.00, '2024-06-20 01:55:39', '2024-06-20 01:55:39'),
(6, 1.00, 10.00, '2024-06-20 09:14:45', '2024-06-20 09:14:45'),
(7, 1.10, 11.00, '2024-06-20 10:38:37', '2024-06-20 10:38:37'),
(8, 15.00, 150.00, '2024-06-20 13:06:49', '2024-06-20 13:06:49'),
(9, 20.00, 200.00, '2024-06-20 13:10:44', '2024-06-20 13:10:44'),
(10, 10.00, 100.00, '2024-06-23 16:39:01', '2024-06-23 16:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'amani', 'amani@gmail.com', NULL, '$2y$10$1s.NqC6D5e8Xehmf9FXriOlru04WMtOEE8l7kT9fTCDmRmkvTgZEu', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 05:53:37', '2024-05-21 05:53:37'),
(2, 'kelvin', 'kelvin@gmail.com', NULL, '$2y$10$kmGQJwXfXGlY68YAL.ORneb6ggAuFITs.OCmhBhPXgiAH.mCtYQ/q', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-21 07:21:11', '2024-05-21 07:21:11');

-- --------------------------------------------------------

--
-- Structure for view `payment_details_view`
--
DROP TABLE IF EXISTS `payment_details_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payment_details_view`  AS SELECT `payments`.`amount` AS `amount`, `payments`.`transaction_id` AS `transaction_id`, `payments`.`created_at` AS `created_at` FROM `payments` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `taxcharges`
--
ALTER TABLE `taxcharges`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxcharges`
--
ALTER TABLE `taxcharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
