-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 04:37 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosmetics-store`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(66) NOT NULL,
  `slug` varchar(66) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Vichy', 'vichy', 'Vichy', '2021-04-27 05:49:20', '2021-04-27 05:49:20'),
(2, 'Innidfree', 'innidfree', 'Innidfree', '2021-04-27 05:49:20', '2021-04-27 05:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-05-04 02:52:44', '2021-05-04 02:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`id`, `cart_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 1, 5, 6, '2021-05-04 04:11:32', '2021-05-04 04:11:32'),
(4, 1, 6, 1, '2021-05-04 04:11:32', '2021-05-04 04:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(66) NOT NULL,
  `slug` varchar(66) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Nước hoa nam', 'nuoc-hoa-nam', '2021-04-27 05:47:44', '2021-04-27 05:47:44'),
(2, NULL, 'Trang Điểm Mặt', 'trang-diem-mat', '2021-04-27 05:47:44', '2021-04-27 05:47:44'),
(3, NULL, 'Nước hoa nữ', 'nuoc-hoa-nu', '2021-04-27 05:47:44', '2021-04-27 05:47:44'),
(4, NULL, 'Son môi', 'son-moi', '2021-04-27 05:47:44', '2021-04-27 05:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `rating` smallint(1) NOT NULL DEFAULT 0,
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0ab1c80df848f9da2eb947f5d4babd8d311fffe9be14fd706d4ab58ca274ce116129c20b7ab93aad', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 11:33:38', '2021-04-28 11:33:38', '2021-04-29 18:33:37'),
('0c974676a1c16b431327b97c2c5127e300c874862aa9ff4b939c51c393bea97db9b22eb12aff2f34', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 03:14:26', '2021-04-28 03:14:26', '2021-04-29 10:14:25'),
('1e4b7aae96a805dfaede1ca970d6c6bbb918a12d9cd438348c9cf218f8b2c78843ff0839ee8bce40', 2, 1, 'Personal Access Token', '[]', 0, '2021-05-04 02:53:59', '2021-05-04 02:53:59', '2021-05-05 09:53:59'),
('28731975d769651238b609e80101270abd8eeaa1f7419baf0a2163fae38433636f0f77faa40ea54e', 3, 1, 'Personal Access Client', '[]', 0, '2021-04-28 06:43:26', '2021-04-28 06:43:26', '2021-04-29 13:43:25'),
('2f67b5a4949b34757533e48878b38796bcf537513c341a937c630cc996c4e790a92d5511544a1ab0', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 06:44:48', '2021-04-28 06:44:48', '2021-04-29 13:44:48'),
('5b10d8f7243ce65b326c0870f3479f92a82bd33632496487a6a19a242c8e0b722f9e02a8dac67f2d', 2, 1, 'Personal Access Token', '[]', 0, '2021-05-03 06:29:16', '2021-05-03 06:29:16', '2021-05-04 13:29:15'),
('8b0adfbd06e165109c502776dce5e882218f04d9a0d0ec6dda1ed8e63796e46f95c4769be2107246', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 11:34:32', '2021-04-28 11:34:32', '2021-04-29 18:34:32'),
('90f4d482b4e9e805bc0e531ee4bed02b8667935aadb965d2861b52cc25c0c665918cdd8dcb386921', 3, 1, 'Personal Access Client', '[]', 0, '2021-04-28 03:23:47', '2021-04-28 03:23:47', '2021-04-29 10:23:46'),
('94d7555cc20263a123753eb1ef7938f30afe0af4305a7a5655b633bf6d03644c790a925577d333e7', 4, 1, 'Personal Access Client', '[]', 0, '2021-04-28 03:39:48', '2021-04-28 03:39:48', '2021-04-29 10:39:47'),
('9fb1c5319a89ea62d6d8d32901fccf26e059ef94625d43f08650726bbd311844df91680a3586daf5', 2, 1, 'Personal Access Token', '[]', 0, '2021-05-03 06:11:07', '2021-05-03 06:11:07', '2021-05-04 13:11:06'),
('b94322c2d2e1d5f72a0377c9da06602377bd12aeb22362576891e1dd0631064bb57b55891cb0b014', 1, 1, 'Personal Access Token', '[]', 0, '2021-04-27 04:32:39', '2021-04-27 04:32:39', '2021-04-28 11:32:39'),
('d47cb3be658da16e6bdbb9c9e97d41f281b5ecf57d6a8d6fa28ecde4f94c63bd10a8ee895452a218', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 03:13:41', '2021-04-28 03:13:41', '2021-04-29 10:13:41'),
('deb1fd81a2f51cccec7bd500ceb4c53582c1e4d8b6e21cd37e1efadb7221e9583babe3d42cc05102', 1, 1, 'Personal Access Token', '[]', 0, '2021-05-04 02:54:10', '2021-05-04 02:54:10', '2021-05-05 09:54:10'),
('e78b2c709902ccf165a1d389b41474a5e8a76aa6dcfb58d8e63d063704ce402749d6bb42a79d2c04', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 06:42:58', '2021-04-28 06:42:58', '2021-04-29 13:42:58'),
('fa9c51733a9f6c3608bfbab780cfdca6728aefc373c8caed8efb3c568dcda5bdd2488e9ff1ed6434', 3, 1, 'Personal Access Client', '[]', 0, '2021-05-03 05:15:11', '2021-05-03 05:15:11', '2021-05-04 12:15:10'),
('fc0fcc5ca1e705317736bf26b593de0363f59ccbc50ef257dcc7434f2d5fd7ae3bef208d73fafe06', 2, 1, 'Personal Access Token', '[]', 0, '2021-04-28 04:58:22', '2021-04-28 04:58:22', '2021-04-29 11:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'CosmeticsStore Personal Access Client', 'uRhG53JbTidXtWgC04QeoIkVhOjydgSvinn3VoE4', NULL, 'http://localhost', 1, 0, 0, '2021-04-27 04:18:49', '2021-04-27 04:18:49'),
(2, NULL, 'CosmeticsStore Password Grant Client', 'aKkj20jk3LZNGiRKiQ0Pc8Tq8kDxAKZSSBWnKbLw', 'users', 'http://localhost', 0, 1, 0, '2021-04-27 04:18:49', '2021-04-27 04:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-27 04:18:49', '2021-04-27 04:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `shipping` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`shipping` >= 0),
  `promo` varchar(50) DEFAULT NULL,
  `first_name` varchar(66) NOT NULL,
  `last_name` varchar(66) NOT NULL,
  `email` varchar(66) NOT NULL,
  `phone_number` varchar(66) DEFAULT NULL,
  `address` varchar(666) DEFAULT NULL,
  `district` varchar(666) DEFAULT NULL,
  `ward` varchar(666) DEFAULT NULL,
  `city` varchar(666) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `shipping`, `promo`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `district`, `ward`, `city`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '50000', NULL, 'sss', 'dddd', 'wd@dsfs.com', '011111111', 'dawd', 'dwdwd', 'wdwdwd', 'hcm', '2021-05-04 03:40:38', '2021-05-04 03:40:38'),
(2, 1, 0, '50000', NULL, 'sss', 'dddd', 'wd@dsfs.com', '011111111', 'dawd', 'dwdwd', 'wdwdwd', 'hcm', '2021-05-04 03:41:17', '2021-05-04 03:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`price` >= 0),
  `quantity` int(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '4200000', 1, '2021-05-04 03:40:38', '2021-05-04 03:40:38'),
(2, 6, 2, '4200000', 1, '2021-05-04 03:41:17', '2021-05-04 03:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(666) NOT NULL,
  `slug` varchar(166) NOT NULL,
  `excerpt` varchar(666) DEFAULT NULL,
  `content` text NOT NULL,
  `price` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`price` >= 0),
  `discount` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`discount` >= 0),
  `quantity` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `brand_id`, `title`, `slug`, `excerpt`, `content`, `price`, `discount`, `quantity`, `published`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Phấn Trang Điểm Đa Năng Odbo MakeUp Series', 'phan-trang-diem-da-nang-odbo-makeup-series-od1021', 'Phấn Trang Điểm Đa Năng Odbo MakeUp Series', 'Phấn Trang Điểm Đa Năng Odbo MakeUp Series', '200000', '40000', 66, 1, '2021-04-27 13:11:35', '2021-04-27 13:11:35', '2021-04-27 13:11:35'),
(2, 1, 2, 'Nước Hoa Nam Venus Global Beauty Laura Anné', 'nuoc-hoa-nam-venus-global-beauty-laura-anne-eau-de-parfum-50ml', 'Nước Hoa Nam Venus Global Beauty Laura Anné', 'Nước Hoa Nam Venus Global Beauty Laura Anné', '300000', '50000', 20, 1, '2021-04-27 13:11:35', '2021-04-27 13:11:35', '2021-04-27 13:11:35'),
(3, 2, 1, 'Má Hồng Odbo Happy Everyday Pocket Blusher', 'ma-hong-odbo-happy-everyday-pocket-blusher-od103', 'Má Hồng Odbo Happy Everyday Pocket Blusher', 'Má Hồng Odbo Happy Everyday Pocket Blusher', '100000', '10000', 100, 1, '2021-04-28 13:11:35', '2021-04-28 13:11:35', '2021-04-28 13:11:35'),
(4, 3, 1, 'Nước Hoa Dạng Lăn Victoria\'s Secret', 'nuoc-hoa-dang-lan-victorias-secret-eau-de-parfum-rollerball-7ml', 'Nước Hoa Dạng Lăn Victoria\'s Secret', 'Nước Hoa Dạng Lăn Victoria\'s Secret', '280000', '30000', 46, 1, '2021-04-28 13:11:35', '2021-04-28 13:11:35', '2021-05-03 02:39:25'),
(5, 3, 2, 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'nuoc-hoa-nu-venus-global-beauty-laura-anne-perfume-50ml', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', '180000', '25000', 63, 1, '2021-04-28 13:11:35', '2021-04-27 13:11:35', '2021-04-27 15:24:10'),
(6, 4, 1, 'Son Christian Louboutin Collection Limited Edition', 'son-christian-louboutin-collection-limited-edition', 'Son Christian Louboutin Collection Limited Edition', 'Son Christian Louboutin Collection Limited Edition', '4300000', '100000', 100, 1, '2021-04-28 13:11:35', '2021-04-27 13:11:35', '2021-05-04 03:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(666) NOT NULL,
  `image_url` varchar(666) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `title`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Odbo---Makeup-OD1021.jpg', 'Odbo---Makeup-OD1021.jpg', '2021-04-27 05:54:11', '2021-04-27 05:54:11'),
(2, 4, 'very-sexy-night-recovered-recovered-recovered-22112019111005.jpg', 'very-sexy-night-recovered-recovered-recovered-22112019111005.jpg', '2021-04-27 05:54:11', '2021-04-28 07:00:07'),
(3, 2, 'nh-nam-04122019093133.jpg', 'nh-nam-04122019093133.jpg', '2021-04-27 05:54:11', '2021-04-28 06:59:58'),
(4, 3, 'Happy-Everyday-Pocket-Blusher.png', 'Happy-Everyday-Pocket-Blusher.png', '2021-04-27 05:54:11', '2021-04-27 05:54:11'),
(5, 5, 'nuoc-hoa-min-versace-eau-de-toilette-5ml-beauty-garden.jpg', 'nuoc-hoa-min-versace-eau-de-toilette-5ml-beauty-garden.jpg', '2021-04-27 05:54:11', '2021-04-27 05:54:11'),
(6, 6, 'son-christian-louboutin-collection-limited-edition-beauty-garden-1.jpg', 'son-christian-louboutin-collection-limited-edition-beauty-garden-1.jpg', '2021-04-27 05:54:11', '2021-04-27 05:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-27 06:23:45', '2021-04-27 06:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(66) NOT NULL,
  `image_url` varchar(666) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(666) NOT NULL,
  `slug` varchar(66) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Kem', 'kem', '2021-04-27 05:54:11', '2021-04-27 05:54:11'),
(2, 'Dưỡng da', 'duong-da', '2021-04-27 05:54:11', '2021-04-27 05:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facebook_id` varchar(66) DEFAULT NULL,
  `google_id` varchar(66) DEFAULT NULL,
  `first_name` varchar(66) NOT NULL,
  `last_name` varchar(66) NOT NULL,
  `user_name` varchar(66) NOT NULL,
  `email` varchar(66) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(666) NOT NULL,
  `remember_token` varchar(666) DEFAULT NULL,
  `auth_token` varchar(6666) DEFAULT NULL,
  `phone_number` varchar(66) DEFAULT NULL,
  `address` varchar(666) DEFAULT NULL,
  `district` varchar(666) DEFAULT NULL,
  `ward` varchar(666) DEFAULT NULL,
  `city` varchar(666) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `avatar` varchar(666) DEFAULT NULL,
  `intro` tinytext DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facebook_id`, `google_id`, `first_name`, `last_name`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `auth_token`, `phone_number`, `address`, `district`, `ward`, `city`, `gender`, `avatar`, `intro`, `profile`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Thuc', 'Nguyen', 'de4th-zone', 'de4th-zone@gmail.com', NULL, '$2y$10$AXAAo3xcY5YLbL985bnl3eR5TPGReNck6UB5doI5gnOiY0CXPyFHG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-27 04:31:58', '2021-04-27 04:31:58'),
(2, NULL, NULL, 'Thuc', 'Nguyen', 'thucdaik', 'thucdaik@gmail.com', NULL, '$2y$10$Ae/rMD8kMXaR4rREp4qhiuLE7wFi/niqbGHxk78O0UoF0AjOQ238.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-28 03:09:08', '2021-04-28 03:09:08'),
(3, '1122003211597038', NULL, 'Thức', 'Nguyễn', 'fb_1122003211597038', 'nhtanonymous@gmail.com', NULL, '$2y$10$VGD4XWJPZ0YsxnNb7pZRYewHLqr5Ln.I9kLke0XWu154oPJfQi9Qi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1122003211597038&height=50&width=50&ext=1622172227&hash=AeSqf7y0K20viqmV3R0', NULL, NULL, '2021-04-28 03:23:47', '2021-04-28 03:23:47'),
(4, NULL, '106928172396818798217', 'Hidden', '666', 'gg_106928172396818798217', 'admjnwapviip@gmail.com', NULL, '$2y$10$LsZnXCAhDmRZ9whrqL697en47XVwOzIsyrWm4OX2V9LM4uHlJ.Qz6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a-/AOh14GhA2bQHuCdcM33KMpoZqWwCCrbImXnxvIUwboPP=s96-c', NULL, NULL, '2021-04-28 03:39:48', '2021-04-28 03:39:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_brand_slug` (`slug`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_cart_user_id` (`user_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_c_p_cart_id` (`cart_id`),
  ADD KEY `idx_c_p_product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_category_slug` (`slug`),
  ADD KEY `idx_category_parent_id` (`parent_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comment_product_id` (`product_id`),
  ADD KEY `idx_comment_parent_id` (`parent_id`),
  ADD KEY `fk_comment_user` (`user_id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_user_id` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_o_p_order_id` (`order_id`),
  ADD KEY `idx_o_p_product_id` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_product_slug` (`slug`),
  ADD KEY `idx_product_category_id` (`category_id`),
  ADD KEY `idx_product_brand_id` (`brand_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_p_i_product` (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `idx_p_t_product_id` (`product_id`),
  ADD KEY `idx_p_t_tag_id` (`tag_id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_tag_slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_u_user_name` (`user_name`),
  ADD UNIQUE KEY `unq_u_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `fk_c_p_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `fk_c_p_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_o_p_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `fk_o_p_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_p_i_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `fk_p_t_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_t_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
