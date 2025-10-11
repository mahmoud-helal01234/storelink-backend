-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2025 at 02:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storelink_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us_content`
--

CREATE TABLE `about_us_content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(200) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `content_ar` varchar(500) NOT NULL,
  `content_en` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_companies_rates`
--

CREATE TABLE `base_companies_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `name_en` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_drivers_rates`
--

CREATE TABLE `base_drivers_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `name_en` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_orders_rates`
--

CREATE TABLE `base_orders_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `name_en` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `description_ar` varchar(100) NOT NULL,
  `description_en` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `description_ar`, `description_en`, `image`, `created_at`, `updated_at`) VALUES
(46, 'العروض', '', '', '', 'images/categories/1746654318750.png', '2025-05-08 01:45:18', '2025-05-08 01:45:18'),
(49, 'First category', '', '', '', 'images/categories/1746654318750.png', '2025-05-08 01:45:18', '2025-05-08 01:45:18'),
(50, 'category 1', 'category 1', 'category 2', 'category 1', 'images/categories/1759782358429.png', '2025-10-06 21:25:58', '2025-10-06 21:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories_countries`
--

CREATE TABLE `categories_countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `governorate_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `long` decimal(10,7) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`user_id`, `name`, `lat`, `long`, `address`) VALUES
(3, 'client', 30.1764390, 31.2092040, '');

-- --------------------------------------------------------

--
-- Table structure for table `clients_companies_rates`
--

CREATE TABLE `clients_companies_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `base_companies_rate_id` bigint(20) UNSIGNED NOT NULL,
  `value` enum('1','2','3','4','5') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_password_resets`
--

CREATE TABLE `clients_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(6) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_drivers_rates`
--

CREATE TABLE `client_drivers_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `base_companies_rate_id` bigint(20) UNSIGNED NOT NULL,
  `value` enum('1','2','3','4','5') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_general_offer_orders`
--

CREATE TABLE `client_general_offer_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(300) NOT NULL,
  `status` enum('waiting','done') NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `general_offer_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_locations`
--

CREATE TABLE `client_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `long` decimal(10,8) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `location_type` enum('apartment','house','office','other') NOT NULL,
  `street` varchar(50) NOT NULL,
  `building` varchar(10) NOT NULL,
  `floor` varchar(10) NOT NULL,
  `apartment` varchar(10) NOT NULL,
  `additional_instructions` varchar(200) NOT NULL,
  `detailed_address` varchar(200) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_locations`
--

INSERT INTO `client_locations` (`id`, `client_id`, `lat`, `long`, `phone_number`, `telephone`, `location_type`, `street`, `building`, `floor`, `apartment`, `additional_instructions`, `detailed_address`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 21.32433000, 21.32433000, '01097979112', '0242100212', 'apartment', 'eltahreer', '92', 'first', '2', 'te', '92 شارع القاضي متفرع من شارع التحرير', '2024-07-22 17:48:34', '2024-07-22 17:47:29', '2024-07-22 17:48:34'),
(2, 2, 21.32433000, 21.32433000, '01097979112', '024212321', 'house', 'eltahreer', '92', 'first', '2', 'te', '92 شارع القاضي متفرع من شارع التحرير', NULL, '2024-07-22 17:51:43', '2024-07-22 17:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `client_orders`
--

CREATE TABLE `client_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_type_id` bigint(20) UNSIGNED NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED NOT NULL,
  `client_location_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `logo_path` varchar(80) DEFAULT NULL,
  `cover_path` varchar(80) DEFAULT NULL,
  `orders_per_hour` int(11) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies_categories`
--

CREATE TABLE `companies_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies_deliver_to_cities`
--

CREATE TABLE `companies_deliver_to_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies_working_with_drivers_managers`
--

CREATE TABLE `companies_working_with_drivers_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `drivers_manager_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cooperation_with_us_reasons`
--

CREATE TABLE `cooperation_with_us_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(150) NOT NULL,
  `title_en` varchar(150) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `name_en` varchar(150) NOT NULL,
  `img_path` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_managers`
--

CREATE TABLE `country_managers` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_types`
--

CREATE TABLE `delivery_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `description_ar` varchar(200) NOT NULL,
  `description_en` varchar(200) NOT NULL,
  `added_value` double NOT NULL,
  `added_value_type` enum('percentage','constant') NOT NULL,
  `after_hours` varchar(4) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_app_clients`
--

CREATE TABLE `drivers_app_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `long` decimal(10,8) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_app_orders`
--

CREATE TABLE `drivers_app_orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_type` enum('normal','fast') NOT NULL,
  `drivers_app_client_id` bigint(20) UNSIGNED NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `discount_value_type` enum('constant','percentage') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_app_products`
--

CREATE TABLE `drivers_app_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_app_product_options`
--

CREATE TABLE `drivers_app_product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` double NOT NULL,
  `drivers_app_product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_managers`
--

CREATE TABLE `drivers_managers` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_locations`
--

CREATE TABLE `driver_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `long` decimal(10,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver_location_stop_points`
--

CREATE TABLE `driver_location_stop_points` (
  `driver_location_id` bigint(20) UNSIGNED NOT NULL,
  `to_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reason` enum('traffic','not_traffic') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `easy_orders`
--

CREATE TABLE `easy_orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `floating_social_links`
--

CREATE TABLE `floating_social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `name_ar` varchar(300) NOT NULL,
  `name_en` varchar(300) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `floating_social_links`
--

INSERT INTO `floating_social_links` (`id`, `img_path`, `link`, `name_ar`, `name_en`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'images/floating_social_links/1746488315272.png', 'https:facebookcom', 'فيسبوك1', 'facebook1', 1, NULL, '2025-05-06 00:38:35', '2025-05-06 00:38:53'),
(2, 'images/floating_social_links/1746488641847.png', 'https:facebookcom', 'فيسبوك', 'facebook', 1, NULL, '2025-05-06 00:44:01', '2025-05-06 00:44:01');

-- --------------------------------------------------------

--
-- Table structure for table `frequently_asked_questions`
--

CREATE TABLE `frequently_asked_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_ar` varchar(500) NOT NULL,
  `question_en` varchar(500) NOT NULL,
  `answer_ar` varchar(500) NOT NULL,
  `answer_en` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_offers`
--

CREATE TABLE `general_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `governorates`
--

CREATE TABLE `governorates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_page_content`
--

CREATE TABLE `home_page_content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section1_title_en` varchar(400) NOT NULL,
  `section1_title_ar` varchar(400) NOT NULL,
  `section1_sub_title_ar` text NOT NULL,
  `section1_sub_title_en` text NOT NULL,
  `section1_desc_en` varchar(2000) NOT NULL,
  `section1_desc_ar` varchar(2000) NOT NULL,
  `google_play_link` varchar(400) NOT NULL,
  `app_store_link` varchar(400) NOT NULL,
  `about_title_ar` varchar(500) NOT NULL,
  `about_title_en` varchar(500) NOT NULL,
  `about_description_en` varchar(2000) NOT NULL,
  `about_description_ar` varchar(2000) NOT NULL,
  `about_image` varchar(400) DEFAULT NULL,
  `services_title_en` varchar(400) NOT NULL,
  `services_title_ar` varchar(400) NOT NULL,
  `services_description_en` varchar(2000) NOT NULL,
  `services_description_ar` varchar(2000) NOT NULL,
  `our_clients_reviews_title_ar` varchar(400) NOT NULL,
  `our_clients_reviews_title_en` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_content`
--

INSERT INTO `home_page_content` (`id`, `section1_title_en`, `section1_title_ar`, `section1_sub_title_ar`, `section1_sub_title_en`, `section1_desc_en`, `section1_desc_ar`, `google_play_link`, `app_store_link`, `about_title_ar`, `about_title_en`, `about_description_en`, `about_description_ar`, `about_image`, `services_title_en`, `services_title_ar`, `services_description_en`, `services_description_ar`, `our_clients_reviews_title_ar`, `our_clients_reviews_title_en`) VALUES
(1, 'LAUNDRY SERVICES', 'خدمات غسيل', 'خلي الشياكة عليك والنظافة علينا', 'Keep it Stylish, We Keep it Clean', 'AquaCare Laundry offers professional cleaning and ironing services for clothes, bedding, and furniture, with top quality and reliable door-to-door delivery', 'أكوا كير لاندرى بتقدملك خدمات غسيل وكوي احترافية للملابس، الأطقم المنزلية، والأثاث، بأعلى جودة وتوصيل حتى باب بيتك', 'google_play_link', 'app_store_link', 'من نحن؟', 'Who We Are?', 'At AquaCare Laundry, we offer a full-service laundry experience combining top quality with true professionalism. Our mission is to keep your clothes, bedding, and home essentials fresh and spotless—effortlessly. Our expert team uses advanced technologies and safe products to maintain the softness and elegance of every item. We provide fast, reliable door-to-door delivery because your convenience is our priority', 'في أكوا كير لاندرى، بنقدّم تجربة غسيل وعناية متكاملة تجمع بين الجودة العالية والاحترافية. هدفنا إنك تستمتع بملابس وأطقم منزلية نظيفة ومنتعشة من غير تعب. فريقنا مدرّب على أعلى مستوى لاستخدام أحدث التقنيات والمواد الآمنة للحفاظ على نعومة وأناقة كل قطعة. بنقدّم خدمة توصيل سريعة وموثوقة لحد باب بيتك، لأن راحتك أولويتنا.', 'images/aboutImage/1746879063305.png', 'Our Services', 'خدماتنا', 'We offer a full range of laundry and care services, including clothes cleaning and ironing, bedding and bath care, and furniture cleaning, with fast, reliable door-to-door delivery to ensure your comfort', 'نقدّم مجموعة متكاملة من خدمات الغسيل والعناية تشمل غسيل وكوي الملابس، تنظيف أطقم الأسرّة ومستلزمات الحمّام، وتنظيف الأثاث، مع خدمة توصيل سريعة حتى باب بيتك لضمان راحتك', 'sda', 'What Our Clients Say About Us');

-- --------------------------------------------------------

--
-- Table structure for table `home_slider_images`
--

CREATE TABLE `home_slider_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `client_order_id` bigint(20) UNSIGNED NOT NULL,
  `drivers_app_order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_value` decimal(10,2) NOT NULL,
  `tax_value_type` enum('percentage','constant') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `discount_value_type` enum('percentage','constant') NOT NULL,
  `minimum_charge` decimal(5,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(38, 'default', '{\"uuid\":\"9af78949-471b-4042-8e95-1582b095ae72\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"86.99.108.144\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 1, 1746164906, 1732977417, 1732977417),
(39, 'default', '{\"uuid\":\"b33e88f4-8e95-40a0-a839-ac26bf4014db\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1d28:4f4c:54f9:d7d7:4278:dd39\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1732977566, 1732977566),
(40, 'default', '{\"uuid\":\"503565cd-e15f-40de-ae95-cf804199be8b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"31.219.136.16\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1732988491, 1732988491),
(41, 'default', '{\"uuid\":\"8f8b36c1-d1fc-4e09-b176-a8c4d711c30d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2001:8f8:1dad:e83c:4b8:3be:e39d:4b91\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1732988631, 1732988631),
(42, 'default', '{\"uuid\":\"b8fc83aa-3888-4d47-b50d-1012d109c085\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"68.183.192.221\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733018525, 1733018525),
(43, 'default', '{\"uuid\":\"24dec833-2c83-4a7c-a1e7-fa6e1b47c8c5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"41.68.68.228\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733021661, 1733021661),
(44, 'default', '{\"uuid\":\"64942420-3499-4326-94af-a4d2653585fc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"192.36.109.120\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:130:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/120.0.0.0 Safari\\/537.36 Viewer\\/99.9.8853.8\\\";}\"}}', 0, NULL, 1733023194, 1733023194),
(45, 'default', '{\"uuid\":\"1ecee1d2-356d-436e-8670-e98e5b876afc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733025282, 1733025282),
(46, 'default', '{\"uuid\":\"b570d291-d363-4b3c-b6ec-744b3195e9a7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"91.73.0.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733033028, 1733033028),
(47, 'default', '{\"uuid\":\"329e4e33-938d-4271-8222-6f9723435f32\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"91.73.0.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733033115, 1733033115),
(48, 'default', '{\"uuid\":\"77f94671-781b-4ea4-819d-6cbdceec66e8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:8f8:1db5:25a:fc10:92ac:bb9a:a25e\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733033690, 1733033690),
(49, 'default', '{\"uuid\":\"278cb66d-9432-4fc3-b634-c3cd18290bb3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2001:8f8:1dd3:668:1145:8787:9af:3c50\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733036328, 1733036328),
(50, 'default', '{\"uuid\":\"15c290e8-448a-4539-af69-2e4e62851531\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"5.195.116.50\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/343.0.695551749 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733039534, 1733039534),
(51, 'default', '{\"uuid\":\"e384f063-0a60-4fd4-94d9-e18ab7cf0a45\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2001:8f8:1b6d:589:91db:2d49:756a:bc5\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733039655, 1733039655),
(52, 'default', '{\"uuid\":\"17e4b26c-c528-4a1f-9d4c-44f6b3a205c7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b6d:d696:895e:3f0b:a882:86e4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733039882, 1733039882),
(53, 'default', '{\"uuid\":\"9245d082-76c9-4ea4-93b6-e7cef285c2e3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b6d:d696:895e:3f0b:a882:86e4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733039891, 1733039891),
(54, 'default', '{\"uuid\":\"e94b4bbd-77f3-4035-af78-a9ae9ff216f1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2001:8f8:1b6d:589:91db:2d49:756a:bc5\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733040006, 1733040006),
(55, 'default', '{\"uuid\":\"d6058e20-3239-4ddd-8118-9db155674081\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"94.202.130.251\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733040621, 1733040621),
(56, 'default', '{\"uuid\":\"c8ca655f-3447-4b71-9f00-94ab96b0e266\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"94.58.191.20\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733040888, 1733040888),
(57, 'default', '{\"uuid\":\"80ab68e4-0cb1-48ef-a9ea-22a4c652eb5f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"94.207.231.246\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.0.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733044386, 1733044386),
(58, 'default', '{\"uuid\":\"78467063-3bbb-42bc-8a04-2631d79dc614\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"167.99.39.37\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733047755, 1733047755),
(59, 'default', '{\"uuid\":\"ea7cc61a-b3bb-44f1-9bc9-5b316a61febc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a09:bac5:19:1478::20a:aa\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733048669, 1733048669),
(60, 'default', '{\"uuid\":\"bf403459-2bcb-4b3e-b98b-15d1396946f1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a09:bac5:19:1478::20a:aa\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733048970, 1733048970),
(61, 'default', '{\"uuid\":\"bd387e7b-e7b1-4731-938b-2d76cb907d65\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a09:bac5:19:1478::20a:aa\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733048971, 1733048971),
(62, 'default', '{\"uuid\":\"9a61afa1-3142-4516-a9ae-26a1d77b8ff2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a09:bac5:19:1478::20a:aa\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733048981, 1733048981),
(63, 'default', '{\"uuid\":\"6d5129a1-b738-475a-a4e0-08dabaa5a5ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a09:bac5:19:1478::20a:aa\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733048982, 1733048982),
(64, 'default', '{\"uuid\":\"58ece02b-3909-41bc-a069-0688994df006\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"185.202.220.178\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733052027, 1733052027),
(65, 'default', '{\"uuid\":\"6cb479e4-38e5-457b-bc56-e115881be815\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"2.49.68.21\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733053335, 1733053335),
(66, 'default', '{\"uuid\":\"14ab03cc-090f-44d4-b195-2e3ea36d538e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"5.195.235.46\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.5 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733054296, 1733054296),
(67, 'default', '{\"uuid\":\"66926fd9-ddae-4e38-ad92-1d076b934fce\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"87.200.38.229\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733059912, 1733059912),
(68, 'default', '{\"uuid\":\"e31e4e09-935d-4b83-a3bd-76f951498344\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.218.34\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.69 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733072701, 1733072701),
(69, 'default', '{\"uuid\":\"9777f91d-716d-43c3-85d1-f0ddba46b4f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:8f8:1dba:1898:f8f9:78ea:105:a216\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733080419, 1733080419),
(70, 'default', '{\"uuid\":\"ae4bec90-8ffd-48ec-b052-970256d80c3b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.88.37\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:122:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; Mozilla\\/5.0, Google-AdWords-Express) Chrome\\/131.0.6778.69 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733084321, 1733084321),
(71, 'default', '{\"uuid\":\"316be4e1-5135-4659-a5ff-3d1a83b570f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.98.104.241\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:107:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/534.24 (KHTML, like Gecko) Chrome\\/11.0.696.71 Safari\\/534.24\\\";}\"}}', 0, NULL, 1733091335, 1733091335),
(72, 'default', '{\"uuid\":\"11f592fa-6295-44d1-9dfc-993a2f8f774a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.98.104.241\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:107:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/534.24 (KHTML, like Gecko) Chrome\\/11.0.696.71 Safari\\/534.24\\\";}\"}}', 0, NULL, 1733092040, 1733092040),
(73, 'default', '{\"uuid\":\"1ed76b49-2afd-4346-b0b2-05cf09331056\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"128.140.115.58\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733095393, 1733095393),
(74, 'default', '{\"uuid\":\"f3ed9e54-44bf-4e72-9911-e6ed20cdf21e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"128.140.115.58\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko\\/20100101 Firefox\\/117.0\\\";}\"}}', 0, NULL, 1733095393, 1733095393),
(75, 'default', '{\"uuid\":\"73af3a76-6cd3-43b2-bca3-2053a76f986a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:17:\\\"2a12:5940:5433::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:126:\\\"Mozilla\\/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/84.0.4147.89 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733097182, 1733097182),
(76, 'default', '{\"uuid\":\"3ad66c72-7bdb-4553-90a9-8964723f03b0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.218.46\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.69 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733102376, 1733102376),
(77, 'default', '{\"uuid\":\"31f62f9f-2a3a-4c78-b9fe-b36d2a663375\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.73.64\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.69 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733102654, 1733102654),
(78, 'default', '{\"uuid\":\"1e3a7e5e-1685-447a-8d0e-a092c54ca110\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733113000, 1733113000),
(79, 'default', '{\"uuid\":\"2af4986d-1453-435f-96d4-0e895f51dedf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123033, 1733123033),
(80, 'default', '{\"uuid\":\"c6158e58-be75-41d2-bf3b-e6a3edc533f3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123153, 1733123153),
(81, 'default', '{\"uuid\":\"8d861f02-0905-4aa7-8ccc-4930ecab4d88\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123162, 1733123162),
(82, 'default', '{\"uuid\":\"a7642d7f-2877-4b91-ab7e-6fc341815c66\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123164, 1733123164),
(83, 'default', '{\"uuid\":\"1d72fd89-2bc9-4a40-8018-7830660634b5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123164, 1733123164),
(84, 'default', '{\"uuid\":\"7b97903f-1022-4ef9-b34b-1fa738446786\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123214, 1733123214),
(85, 'default', '{\"uuid\":\"4ef2033e-252c-4773-b475-97dd770fe07b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Linux; Android) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/88.0.4324.109 Safari\\/537.36 CrKey\\/1.54.248666\\\";}\"}}', 0, NULL, 1733123235, 1733123235),
(86, 'default', '{\"uuid\":\"f9e7cd01-0c5e-44cc-831e-c6e65bf17aae\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123246, 1733123246),
(87, 'default', '{\"uuid\":\"6016454f-b5c9-4f5d-afa4-15f71551b13f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123246, 1733123246),
(88, 'default', '{\"uuid\":\"d75bd56d-3631-4126-bdf7-a6a9c0cbf90a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123321, 1733123321),
(89, 'default', '{\"uuid\":\"9e39d58a-32d8-42ac-ac41-e5387bad99b7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.134.65.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733123322, 1733123322),
(90, 'default', '{\"uuid\":\"e25315a7-a9d8-4fb3-98bd-c1381844e3e6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:22:\\\"2a02:c206:3015:2326::1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/91.0.4472.114 Safari\\/537.36 Edg\\/91.0.864.54\\\";}\"}}', 0, NULL, 1733130224, 1733130224),
(91, 'default', '{\"uuid\":\"56ecfa57-fb69-4f83-9110-04cf84314727\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"151.254.197.217\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/343.0.695551749 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733134589, 1733134589),
(92, 'default', '{\"uuid\":\"a3aaa402-e29f-4cca-957c-6d6feb147e8a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.207.84.198\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733136413, 1733136413),
(93, 'default', '{\"uuid\":\"f16e7769-ba0d-46a6-8f46-794e64d2223b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.219.78.253\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:104:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733137851, 1733137851),
(94, 'default', '{\"uuid\":\"679f6427-c426-4e03-879d-3eb8083f7e0d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:2d63:aae9:f905:8f16:de40:aa70\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733141638, 1733141638),
(95, 'default', '{\"uuid\":\"b61c344e-156e-41d3-982a-180bcda90573\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"2.50.63.68\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.0.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733145233, 1733145233),
(96, 'default', '{\"uuid\":\"fef7530a-a552-4690-8355-c623fc769024\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"2.50.63.68\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.0.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733145277, 1733145277),
(97, 'default', '{\"uuid\":\"f2ce060d-efdc-4ca0-aa53-79bcb561996f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"139.59.39.34\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733148333, 1733148333),
(98, 'default', '{\"uuid\":\"b421567b-6afc-4765-b7cf-13cfabed213e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"86.98.212.166\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.4.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733148947, 1733148947),
(99, 'default', '{\"uuid\":\"4dd2e85d-cc6a-4236-8665-d36872d36c0a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"5.192.145.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733152440, 1733152440),
(100, 'default', '{\"uuid\":\"ca52073c-08dd-41d3-a411-0f34ee725349\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.70.201.116\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:105:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/44.0.2403.157 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733152442, 1733152442),
(101, 'default', '{\"uuid\":\"8fdcc5ff-8723-4f41-8a9b-2f9f293b5b09\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"124.70.203.191\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (Windows NT 6.8; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/76.0.1375.88 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733158626, 1733158626),
(102, 'default', '{\"uuid\":\"bb4938ca-37cf-4e64-8254-7717fcfc16d9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"54.36.149.96\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1733165273, 1733165273),
(103, 'default', '{\"uuid\":\"67f0ded6-974e-473b-9749-ec5cd0efc81c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.254.173.63\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1733172364, 1733172364),
(104, 'default', '{\"uuid\":\"bf89cea3-7afc-4bef-8a4f-753fc4f13eb0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.77.38\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.69 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733183763, 1733183763),
(105, 'default', '{\"uuid\":\"c6defc82-cee7-4746-b226-50cc42f5ff45\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.77.45\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.69 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733184610, 1733184610),
(106, 'default', '{\"uuid\":\"f76a58a9-af8b-4dae-a080-425a5746d0bf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.77.45\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733184611, 1733184611),
(107, 'default', '{\"uuid\":\"f14e33b4-22b5-41a3-aecb-34671422800b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"146.190.129.60\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733186525, 1733186525);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(108, 'default', '{\"uuid\":\"e3f16536-1790-4479-b0c3-35d73d95f6a5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733195982, 1733195982),
(109, 'default', '{\"uuid\":\"6c1ec80c-db06-4215-8393-8a26fc1ae8d4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"113.62.169.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733199156, 1733199156),
(110, 'default', '{\"uuid\":\"526d08e0-f079-4b27-92c6-a127a5d1cd0b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.205.20.208\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/343.0.695551749 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733228115, 1733228115),
(111, 'default', '{\"uuid\":\"2e5e94d8-d8e3-41c8-8b01-6af625017b1f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"176.203.227.121\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733228206, 1733228206),
(112, 'default', '{\"uuid\":\"7fbb98ec-0b51-48dd-b1d2-6db79184b275\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.90.202.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:122:\\\"Mozilla\\/5.0 (Linux; Android 11; SM-G998U) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/91.0.4472.124 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733229742, 1733229742),
(113, 'default', '{\"uuid\":\"3d1ea243-87f3-4a4f-b465-de24eccb1dd3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.220.161.119\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733235453, 1733235453),
(114, 'default', '{\"uuid\":\"4679c62c-c57e-4b2a-be41-0070cc931f70\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.220.161.119\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733235470, 1733235470),
(115, 'default', '{\"uuid\":\"191e405e-63d1-49bf-bc8e-957efc2b4288\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.220.161.119\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733235924, 1733235924),
(116, 'default', '{\"uuid\":\"eaa629c2-35fd-450f-994c-09c3bdaec9df\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:8f8:1735:2b9:5003:d3b9:cfc4:3b5d\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733239634, 1733239634),
(117, 'default', '{\"uuid\":\"48833910-686c-41a3-a04b-2764d7e0d9c6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:8f8:1735:2b9:5003:d3b9:cfc4:3b5d\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733239795, 1733239795),
(118, 'default', '{\"uuid\":\"f8856a9c-44de-4a1f-b6ad-e5ef0718ba37\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2607:5300:60:7e27::1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:80:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:118.0) Gecko\\/20100101 Firefox\\/118.0\\\";}\"}}', 0, NULL, 1733241152, 1733241152),
(119, 'default', '{\"uuid\":\"8d33882d-8e6a-4965-9d50-166b4ad48cf3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.218.42\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.69 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733267863, 1733267863),
(120, 'default', '{\"uuid\":\"df212061-b985-42da-9448-51fdfe97919f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733271705, 1733271705),
(121, 'default', '{\"uuid\":\"b85fc87c-0651-4402-b076-9118b350d928\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272168, 1733272168),
(122, 'default', '{\"uuid\":\"c6df9c22-40e5-40a5-93eb-98f95e29dcad\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272175, 1733272175),
(123, 'default', '{\"uuid\":\"427ef819-9e06-4bf2-a48c-0bf302940d3e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272214, 1733272214),
(124, 'default', '{\"uuid\":\"dcb45768-b539-4c44-aa72-8d3383155cd8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272225, 1733272225),
(125, 'default', '{\"uuid\":\"7f8b4733-99ca-443d-b873-fb5a9e258205\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272273, 1733272273),
(126, 'default', '{\"uuid\":\"9f1e839d-3467-49af-a70c-ce8b2a20f5cc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272341, 1733272341),
(127, 'default', '{\"uuid\":\"f7ade25f-fe45-46fb-85d6-a13d08a210b2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272356, 1733272356),
(128, 'default', '{\"uuid\":\"c66fc9de-7996-4352-a98a-7efc2b53bd48\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733272367, 1733272367),
(129, 'default', '{\"uuid\":\"a68bc33f-d699-4e87-a13e-ae65827085cb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1733272458, 1733272458),
(130, 'default', '{\"uuid\":\"98d550a3-7521-4d03-b9f3-3d2eadcaf074\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733275844, 1733275844),
(131, 'default', '{\"uuid\":\"93286845-9e4b-4b02-abce-b89ae276c97d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733281573, 1733281573),
(132, 'default', '{\"uuid\":\"51d17c85-41c4-4bb7-a139-fe579b5f60da\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1733281583, 1733281583),
(133, 'default', '{\"uuid\":\"72aa8346-5280-4eb8-aa87-08aab1a3c3c8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"154.178.217.108\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733281749, 1733281749),
(134, 'default', '{\"uuid\":\"9d1310ae-fa55-488a-bfc4-bccb2b5f5fec\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.190.19.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733281783, 1733281783),
(135, 'default', '{\"uuid\":\"02537da9-8b73-47eb-b1d2-fa54d5a2487d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"93.158.91.32\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/105.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733286201, 1733286201),
(136, 'default', '{\"uuid\":\"82846426-9121-43eb-8c3f-3c73635fa2db\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1d5f:a20a:24d0:408e:9d1c:afbd\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733289306, 1733289306),
(137, 'default', '{\"uuid\":\"02711e46-e4fe-4cc2-95d2-fa7d3fdcfe2b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1d5f:a20a:24d0:408e:9d1c:afbd\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733292802, 1733292802),
(138, 'default', '{\"uuid\":\"b7a82f2b-58be-418b-80db-4ac3a42b3c4e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1d5f:a20a:24d0:408e:9d1c:afbd\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733293379, 1733293379),
(139, 'default', '{\"uuid\":\"3c6db5af-55db-4a53-9e86-938fabdadda1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"135.148.195.6\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/112.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733296259, 1733296259),
(140, 'default', '{\"uuid\":\"c7c02488-4d4f-460b-b4a3-22ddd147bda1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"35.91.2.151\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:104:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733309127, 1733309127),
(141, 'default', '{\"uuid\":\"dee88e1c-0bfe-4ad3-859f-98b3751fb831\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"52.33.69.224\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:104:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733309135, 1733309135),
(142, 'default', '{\"uuid\":\"18335a4f-0bcb-40f6-81b6-86db93791f75\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.58.174.202\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/127.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733310134, 1733310134),
(143, 'default', '{\"uuid\":\"ca193e10-57d2-4185-8f1c-53cdbfa85a41\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"92.97.118.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/345.2.700885593 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733317113, 1733317113),
(144, 'default', '{\"uuid\":\"87a573fc-1bbb-471b-87ae-88e341b030c3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"137.226.113.44\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:46:\\\"Mozilla\\/5.0 researchscan.comsys.rwth-aachen.de\\\";}\"}}', 0, NULL, 1733317797, 1733317797),
(145, 'default', '{\"uuid\":\"822ac32a-37d5-46b7-9007-e4dbfc1ae825\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"5.195.107.146\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733319573, 1733319573),
(146, 'default', '{\"uuid\":\"afef8805-3a72-4a18-8f65-2c350ef8c104\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"94.207.97.36\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733324015, 1733324015),
(147, 'default', '{\"uuid\":\"76d9b524-9241-44ec-95ec-26f6ad0a1eec\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"94.207.97.36\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733324044, 1733324044),
(148, 'default', '{\"uuid\":\"e9212626-8f3b-4c7a-be06-7c34a834b069\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"94.207.97.36\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733324144, 1733324144),
(149, 'default', '{\"uuid\":\"52b9f824-a8fd-4c69-84c3-3fea6941e015\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.184.98.153\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733326862, 1733326862),
(150, 'default', '{\"uuid\":\"e025da9b-3240-4ad6-bcc2-2aa518ab31cc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"80.227.85.11\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.5 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733326999, 1733326999),
(151, 'default', '{\"uuid\":\"bb46ac42-e5fb-484d-915b-82d13a26afb6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.184.98.153\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733328373, 1733328373),
(152, 'default', '{\"uuid\":\"f821d051-27e1-430c-a51c-2867276e211f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.153.7.191\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733334869, 1733334869),
(153, 'default', '{\"uuid\":\"20d915dc-0d08-43b3-8940-a4330b7782a1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.53.111\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733351545, 1733351545),
(154, 'default', '{\"uuid\":\"b21e75ba-7e47-4145-9304-2252d4c941f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"165.232.117.14\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733360391, 1733360391),
(155, 'default', '{\"uuid\":\"157979b1-3e8b-49d3-a9c3-63fe751f3575\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.218.46\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733361790, 1733361790),
(156, 'default', '{\"uuid\":\"8cb56d6f-26c9-4763-91d6-5386f7f960c3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"34.1.26.164\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; BW\\/1.2; rb.gy\\/oupwis) Chrome\\/124.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733368306, 1733368306),
(157, 'default', '{\"uuid\":\"51da1ff5-af41-4b4a-852d-abb852758b34\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"34.1.26.164\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; BW\\/1.2; rb.gy\\/oupwis) Chrome\\/124.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733368311, 1733368311),
(158, 'default', '{\"uuid\":\"01bdc1b6-4170-4fc9-a0a7-7fa131704f65\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"34.1.26.164\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; BW\\/1.2; rb.gy\\/oupwis) Chrome\\/124.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733368312, 1733368312),
(159, 'default', '{\"uuid\":\"37ad3424-e839-4753-9768-c4e110338046\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"199.244.88.230\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/105.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733382051, 1733382051),
(160, 'default', '{\"uuid\":\"2fd56468-0c01-4ca0-a49b-b0d8d32537d3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1d56:7071:1da0:e67e:28c3:e47b\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733383098, 1733383098),
(161, 'default', '{\"uuid\":\"61ee077f-b8c0-49e1-b62f-8293df807739\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.135.135.57\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733390653, 1733390653),
(162, 'default', '{\"uuid\":\"0aecfde9-c1a1-43b8-941a-b307fae549e8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"196.150.0.223\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733393961, 1733393961),
(163, 'default', '{\"uuid\":\"e138bda8-35f5-4c88-a6c2-6784d4a83973\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2a00:f29:2e0:77a8:391c:9d3c:662c:a3e0\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_0 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733394353, 1733394353),
(164, 'default', '{\"uuid\":\"854da073-85b6-47a9-92a7-eb70cb1fc585\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2a00:f29:1f0:3387:2c1c:a128:3db0:73d1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733396246, 1733396246),
(165, 'default', '{\"uuid\":\"673d450c-3c5e-4c24-875b-a9665e737e61\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"80.227.87.182\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733396605, 1733396605),
(166, 'default', '{\"uuid\":\"5c7c9d76-a857-4fbb-89ae-c2611851a29e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733398503, 1733398503),
(167, 'default', '{\"uuid\":\"dc60e628-9c0a-4fb5-86bc-6290bad2869b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"191.102.130.220\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:43.0) Gecko\\/20100101 Firefox\\/43.0\\\";}\"}}', 0, NULL, 1733399306, 1733399306),
(168, 'default', '{\"uuid\":\"dd318ba3-3df1-4548-852f-dc45d77106fc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.200.97.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733400479, 1733400479),
(169, 'default', '{\"uuid\":\"0cee657a-4cbc-4525-9d7b-7266c2e99d7a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"5.30.19.37\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733400989, 1733400989),
(170, 'default', '{\"uuid\":\"1b306f8d-0f2e-4cf4-8985-8d97f14ea4ae\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:b17d:bc5c:c61d:5dd8\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.0.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733402051, 1733402051),
(171, 'default', '{\"uuid\":\"3ca6ce0f-5857-4165-af7d-08ef7151303f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.204.249.46\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733402191, 1733402191),
(172, 'default', '{\"uuid\":\"c37d2440-45ac-49f4-8b09-f25802e3e9b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"2.51.58.236\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.0.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733403424, 1733403424),
(173, 'default', '{\"uuid\":\"badee01e-d438-442a-8f05-6dd8b12b9389\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:cfdb:49cc:904d:d1d0:4c1e\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733404736, 1733404736),
(174, 'default', '{\"uuid\":\"ee39c863-fd23-4e58-93f4-202f4b2c7f83\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"123.207.198.35\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733405457, 1733405457),
(175, 'default', '{\"uuid\":\"70be6d3c-15f2-42ea-90cf-5a54dbb4c069\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"123.207.198.35\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733405471, 1733405471),
(176, 'default', '{\"uuid\":\"b08ef5b9-da6c-4b50-b5ce-968525a1b177\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"123.207.198.35\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733405636, 1733405636);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(177, 'default', '{\"uuid\":\"ebb3015f-8832-46af-a49e-cfd7414924a3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"196.128.73.215\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733405674, 1733405674),
(178, 'default', '{\"uuid\":\"f767994a-862e-4398-affa-9869d4861553\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:c1bc:4bdc:fe70:cb6e\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733406431, 1733406431),
(179, 'default', '{\"uuid\":\"4d47862c-7d87-4731-b394-7df2079571d3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"87.120.125.105\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:22:\\\"python-requests\\/2.28.1\\\";}\"}}', 0, NULL, 1733406671, 1733406671),
(180, 'default', '{\"uuid\":\"498be33a-4961-41f1-8e84-dd9ba88fc595\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"87.120.125.105\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/39.0.2171.95 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733406672, 1733406672),
(181, 'default', '{\"uuid\":\"a3fe08bb-7a92-44fd-a9ae-229b52ba5e94\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"87.120.125.105\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/39.0.2171.95 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733406673, 1733406673),
(182, 'default', '{\"uuid\":\"2ba8f848-688f-4679-83b4-01872fadedf8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"87.120.125.105\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/39.0.2171.95 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733406673, 1733406673),
(183, 'default', '{\"uuid\":\"4e35ba90-fbcf-4b40-8ea7-37806ddd48ba\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:192f:32d3:d17f:9db3:7848:13b3\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/345.2.700885593 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733411127, 1733411127),
(184, 'default', '{\"uuid\":\"c4baf074-4ef8-475c-b035-7937a83d3ea5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.79.74\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733412415, 1733412415),
(185, 'default', '{\"uuid\":\"8f7efce3-b996-4952-b7c4-d2b834ccdfd1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:81b3:d4b5:effa:b847\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733415477, 1733415477),
(186, 'default', '{\"uuid\":\"b48f69f7-a2ec-41e4-bea5-4eaadcb9de99\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.79.64\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733416577, 1733416577),
(187, 'default', '{\"uuid\":\"bb2db12b-8c28-40a0-b228-24f453a6dd1f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.79.66\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733416577, 1733416577),
(188, 'default', '{\"uuid\":\"aba02112-6df0-475a-b24b-314137657028\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"2.51.58.236\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.0.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733417906, 1733417906),
(189, 'default', '{\"uuid\":\"9013676c-2789-4f9b-9d15-acd954e0e312\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"113.200.73.7\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733418799, 1733418799),
(190, 'default', '{\"uuid\":\"c7428322-049f-4591-adeb-1eef3a3eb7ea\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"46.17.174.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko\\/20100101 Firefox\\/98.0\\\";}\"}}', 0, NULL, 1733418814, 1733418814),
(191, 'default', '{\"uuid\":\"48550cb8-7831-4cf5-bbd9-a3b9049e9dcb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"113.200.73.7\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733418860, 1733418860),
(192, 'default', '{\"uuid\":\"69a25e47-f15f-44ba-bdf3-04d974f61811\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.58\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1733419037, 1733419037),
(193, 'default', '{\"uuid\":\"c594b215-3506-4903-b9b3-751b2fb105aa\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.79.76\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733420372, 1733420372),
(194, 'default', '{\"uuid\":\"fa663288-43f1-40bc-87ac-3bd660fe156e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.79.75\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733420373, 1733420373),
(195, 'default', '{\"uuid\":\"00a9bd60-fb59-4e91-a0d5-fa6966abd51b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"172.241.247.37\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\"\\\";}\"}}', 0, NULL, 1733423341, 1733423341),
(196, 'default', '{\"uuid\":\"b185fdb5-c0d5-4a09-b02d-eed7d5ce2cc3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"23.106.192.197\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\\\"\\\";}\"}}', 0, NULL, 1733423346, 1733423346),
(197, 'default', '{\"uuid\":\"297b1bd4-93f9-41ee-8803-f5c56bf05dcd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:81b3:d4b5:effa:b847\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733425505, 1733425505),
(198, 'default', '{\"uuid\":\"9a7109b0-12dc-46dd-9995-c5b0e6a1865c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:81b3:d4b5:effa:b847\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733425519, 1733425519),
(199, 'default', '{\"uuid\":\"2f0718b2-2312-41f5-b392-c53890e0818b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:81b3:d4b5:effa:b847\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733425520, 1733425520),
(200, 'default', '{\"uuid\":\"5570eb93-2fa1-44ee-9110-9910d9d32319\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:81b3:d4b5:effa:b847\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733426549, 1733426549),
(201, 'default', '{\"uuid\":\"fbc82a3d-eaa6-4a5c-9433-c80942dd12e9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:81b3:d4b5:effa:b847\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:163:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit\\/601.2.4 (KHTML, like Gecko) Version\\/9.0.1 Safari\\/601.2.4 facebookexternalhit\\/1.1 Facebot Twitterbot\\/1.0\\\";}\"}}', 0, NULL, 1733426555, 1733426555),
(202, 'default', '{\"uuid\":\"b3e5936e-1054-4c77-b1a0-ed561efc60e2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:28:\\\"2a03:2880:22ff:10::face:b00c\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:73:\\\"facebookexternalhit\\/1.1 (+http:\\/\\/www.facebook.com\\/externalhit_uatext.php)\\\";}\"}}', 0, NULL, 1733426561, 1733426561),
(203, 'default', '{\"uuid\":\"0dc983bb-e221-45c3-a44b-cc1d3f8d3383\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"92.97.242.139\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733426582, 1733426582),
(204, 'default', '{\"uuid\":\"15e34427-08ad-4778-b0c2-2fca0e12a0a5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"85.215.161.43\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733436895, 1733436895),
(205, 'default', '{\"uuid\":\"b79efa7f-7124-4937-b93c-46a92a0fa1f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"212.14.105.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:71.0) Gecko\\/20100101 Firefox\\/71.0\\\";}\"}}', 0, NULL, 1733438415, 1733438415),
(206, 'default', '{\"uuid\":\"2a04e12a-d8d8-4acc-b5e6-0c89e1a85b28\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444767, 1733444767),
(207, 'default', '{\"uuid\":\"d86f5722-ac9c-4316-8f33-44b690c80473\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444814, 1733444814),
(208, 'default', '{\"uuid\":\"ba78d345-6feb-4adb-958d-e7f41f831fad\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.93.40\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:223:\\\"Mozilla\\/5.0 (Linux; Android 7.0; SM-G930V Build\\/NRD90M) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/59.0.3071.125 Mobile Safari\\/537.36 (compatible; Google-Read-Aloud; +https:\\/\\/support.google.com\\/webmasters\\/answer\\/1061943)\\\";}\"}}', 0, NULL, 1733444819, 1733444819),
(209, 'default', '{\"uuid\":\"4579b8f6-cdcb-42f5-9f19-f6108e9c49e3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.93.41\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:223:\\\"Mozilla\\/5.0 (Linux; Android 7.0; SM-G930V Build\\/NRD90M) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/59.0.3071.125 Mobile Safari\\/537.36 (compatible; Google-Read-Aloud; +https:\\/\\/support.google.com\\/webmasters\\/answer\\/1061943)\\\";}\"}}', 0, NULL, 1733444820, 1733444820),
(210, 'default', '{\"uuid\":\"e3260f57-8322-41d7-901a-5fc847e636b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"66.249.93.41\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:223:\\\"Mozilla\\/5.0 (Linux; Android 7.0; SM-G930V Build\\/NRD90M) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/59.0.3071.125 Mobile Safari\\/537.36 (compatible; Google-Read-Aloud; +https:\\/\\/support.google.com\\/webmasters\\/answer\\/1061943)\\\";}\"}}', 0, NULL, 1733444820, 1733444820),
(211, 'default', '{\"uuid\":\"9ca533bd-08a7-4be5-976e-c5f825c31770\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444867, 1733444867),
(212, 'default', '{\"uuid\":\"4d96c776-8ee9-442d-91e2-ad52a1acf4f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444874, 1733444874),
(213, 'default', '{\"uuid\":\"867357ea-7963-47f0-9d27-59a460c0b6b3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444949, 1733444949),
(214, 'default', '{\"uuid\":\"b87b774e-9417-44ad-af36-10d0bc592159\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444953, 1733444953),
(215, 'default', '{\"uuid\":\"266cd0fe-1c91-4c6c-a65a-a5ca4d2dd43e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733444954, 1733444954),
(216, 'default', '{\"uuid\":\"a7ef0d81-32fb-47df-a2e0-a8b14e8379a5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733445010, 1733445010),
(217, 'default', '{\"uuid\":\"4af9808a-4a2a-47dd-96d3-88b142f03fcb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733445010, 1733445010),
(218, 'default', '{\"uuid\":\"1700a6ae-c156-4d66-95c3-5a30af5cb551\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733445024, 1733445024),
(219, 'default', '{\"uuid\":\"fb630976-a4c6-444c-aa53-dc7f9f6d7e1f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.158.129.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733445041, 1733445041),
(220, 'default', '{\"uuid\":\"3fbbe1ba-3f1d-4165-9b06-f61b1acb346a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733452404, 1733452404),
(221, 'default', '{\"uuid\":\"3cca2844-e547-4237-98d0-807011cd4670\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:b112:b530:ffc0:78c0:be61\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733466921, 1733466921),
(222, 'default', '{\"uuid\":\"71053dfc-556f-464f-a224-129d1341df31\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"66.249.68.7\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html) Chrome\\/131.0.6778.69 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733467270, 1733467270),
(223, 'default', '{\"uuid\":\"dcfcbeec-a390-454d-b21f-34e56d03fd26\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2001:8f8:1927:ab6:20d4:5084:f2ba:1ff\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733468351, 1733468351),
(224, 'default', '{\"uuid\":\"4c05cd31-394a-4f6e-a8cb-e059c010a9af\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:193f:2562:2920:be03:a9ca:30b2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733469772, 1733469772),
(225, 'default', '{\"uuid\":\"a2314ea9-9e08-48e7-aa7e-29b9885d003c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.204.70.238\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/345.2.700885593 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733470103, 1733470103),
(226, 'default', '{\"uuid\":\"1745eb74-c8c9-4e0c-9544-b73d431c1c2b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.204.70.238\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/345.2.700885593 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733470134, 1733470134),
(227, 'default', '{\"uuid\":\"66a6472f-5dcb-400b-a31b-fb8930d59b9e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.204.70.238\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/345.2.700885593 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733470134, 1733470134),
(228, 'default', '{\"uuid\":\"de68c04d-96a6-4916-ad5e-7e7a31782fa4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.75.24.214\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733471159, 1733471159),
(229, 'default', '{\"uuid\":\"aeeb1cf7-e3fc-4837-95a3-1154adc3dc73\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"217.165.111.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733476173, 1733476173),
(230, 'default', '{\"uuid\":\"450025d2-ffd0-4c4f-aba0-949c7f9f88f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"223.15.245.170\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733478373, 1733478373),
(231, 'default', '{\"uuid\":\"b5514e3d-81e4-4ffc-b163-92cd95b2a1b5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"103.224.155.158\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:110:\\\"Mozilla\\/5.0 (X11; CrOS x86_64 14541.0.0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733480749, 1733480749),
(232, 'default', '{\"uuid\":\"64bb5b9b-8777-4710-bb44-5480a02d2888\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.228.54.156\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1733485831, 1733485831),
(233, 'default', '{\"uuid\":\"3a380ec6-0bf4-406c-ba86-fb9266350fe0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"91.74.32.14\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_5_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.5.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733486225, 1733486225),
(234, 'default', '{\"uuid\":\"9e6b1adc-568b-44ba-8c21-1578efc6a78a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1473:3d3c:ff84:37d7:b684:7028\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733486960, 1733486960),
(235, 'default', '{\"uuid\":\"9bfeba37-7f85-42df-a6ce-9b0aa9ef6de7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.62.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733487272, 1733487272),
(236, 'default', '{\"uuid\":\"e10727e5-5d51-4d2b-b891-e6554ecefceb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.62.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:135:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733487345, 1733487345),
(237, 'default', '{\"uuid\":\"de2644c4-8bd7-495c-a5d1-07ab19aeb3c4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.62.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:135:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733487362, 1733487362),
(238, 'default', '{\"uuid\":\"1820faf4-49ad-4481-843b-81500cedd4cf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.62.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:135:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733487369, 1733487369),
(239, 'default', '{\"uuid\":\"53beea93-2842-48b6-8023-c7db88eebfa5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.62.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733488116, 1733488116),
(240, 'default', '{\"uuid\":\"6a2bb532-5f87-453c-bacb-1c2fc86d139a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"41.68.193.245\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733488849, 1733488849),
(241, 'default', '{\"uuid\":\"8e0b84fa-24d3-4463-af01-e7c066588f75\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"41.68.193.245\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733488883, 1733488883),
(242, 'default', '{\"uuid\":\"99079464-6977-4a3a-91eb-dfcb15c27fee\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"41.68.193.245\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733488896, 1733488896),
(243, 'default', '{\"uuid\":\"bafc5a06-937d-4003-9877-2ba6995eeb29\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"185.220.68.203\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733492559, 1733492559),
(244, 'default', '{\"uuid\":\"d5bc9419-6d37-45dd-8906-fa1e89519793\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"196.157.98.93\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733498433, 1733498433);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(245, 'default', '{\"uuid\":\"4ff7da46-3329-4e14-8e6e-a8ce57fc0a22\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"74.125.150.3\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733498979, 1733498979),
(246, 'default', '{\"uuid\":\"96a4ad7d-cce2-4028-a961-0124c9260376\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"35.162.77.16\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/122.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733506694, 1733506694),
(247, 'default', '{\"uuid\":\"960337df-dd8b-4d21-8baa-edeb5eba3ee1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"3.95.20.13\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:25:\\\"Python\\/3.10 aiohttp\\/3.9.5\\\";}\"}}', 0, NULL, 1733527555, 1733527555),
(248, 'default', '{\"uuid\":\"9b38fb59-046a-480a-8dc6-b31e9f4667f9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"164.92.151.63\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733533226, 1733533226),
(249, 'default', '{\"uuid\":\"70857d48-4ea2-49ce-a256-e97deac797ae\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733534262, 1733534262),
(250, 'default', '{\"uuid\":\"e724ec05-87dc-42f8-9635-1bcb397c979b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"185.13.96.91\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:77:\\\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko\\/20100101 Firefox\\/115\\\";}\"}}', 0, NULL, 1733542995, 1733542995),
(251, 'default', '{\"uuid\":\"db195a98-7bf7-4ec1-a56e-2b83863ef24b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"47.128.119.183\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:148:\\\"Mozilla\\/5.0 (Linux; Android 5.0) AppleWebKit\\/537.36 (KHTML, like Gecko) Mobile Safari\\/537.36 (compatible; Bytespider; spider-feedback@bytedance.com)\\\";}\"}}', 0, NULL, 1733543106, 1733543106),
(252, 'default', '{\"uuid\":\"254f5edc-f55b-4f93-b278-3fb1104033c6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"159.89.111.196\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko\\/20100101 Firefox\\/40.1\\\";}\"}}', 0, NULL, 1733546413, 1733546413),
(253, 'default', '{\"uuid\":\"75387df8-5b8c-48b3-9d73-6afabff38f9d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1dbc:6b05:b85d:5dff:fe75:97ba\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733554818, 1733554818),
(254, 'default', '{\"uuid\":\"af69ac7a-4eb0-4f4c-adb6-816d14dc9f43\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"94.205.20.208\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) GSA\\/345.2.700885593 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733556649, 1733556649),
(255, 'default', '{\"uuid\":\"8b9b3e18-fd71-4432-941f-1d8c4d3f4818\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"87.200.82.254\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733558127, 1733558127),
(256, 'default', '{\"uuid\":\"9fb0bba1-98a5-440b-9e88-0fcafa06e8fe\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1b2f:a47e:bd9e:bebf:de0b:3548\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Safari\\/605.1.15\\\";}\"}}', 0, NULL, 1733560469, 1733560469),
(257, 'default', '{\"uuid\":\"f6b1011f-b19f-432f-a481-40504689249e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"74.125.150.6\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733561432, 1733561432),
(258, 'default', '{\"uuid\":\"ca95f62a-4bd4-4ae4-9277-4c19efdac8db\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"74.125.150.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733561627, 1733561627),
(259, 'default', '{\"uuid\":\"2a416c67-66a5-4121-922b-041c3c0d30f6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:1dbc:6b05:b85d:5dff:fe75:97ba\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733564291, 1733564291),
(260, 'default', '{\"uuid\":\"a31444f8-f141-4f6d-9c33-c3932639f500\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"83.111.90.164\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733565855, 1733565855),
(261, 'default', '{\"uuid\":\"2316d92e-ac08-4719-af6d-41d675c4e62d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"74.125.150.8\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733576568, 1733576568),
(262, 'default', '{\"uuid\":\"b690e23d-7638-4f59-85ce-2902bceaa9d3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"203.2.64.59\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733585841, 1733585841),
(263, 'default', '{\"uuid\":\"527ca746-8ba2-4514-a689-6d4c83206ec8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:18:\\\"2a00:6800:3:b9e::1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/91.0.4472.114 Safari\\/537.36 Edg\\/91.0.864.54\\\";}\"}}', 0, NULL, 1733592188, 1733592188),
(264, 'default', '{\"uuid\":\"5c6b9d8e-6a9a-4235-b411-6c9a8e535c07\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.220.161.119\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733602886, 1733602886),
(265, 'default', '{\"uuid\":\"2403240f-bcd9-4072-8c49-0ba017888ae7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.220.161.119\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733602906, 1733602906),
(266, 'default', '{\"uuid\":\"692b60f9-c422-49a8-8092-56f10a6cad5c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.188.227.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733621075, 1733621075),
(267, 'default', '{\"uuid\":\"c5f23cb2-8ca3-482c-962b-b3d669b43621\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.188.227.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733621142, 1733621142),
(268, 'default', '{\"uuid\":\"e2242974-0908-481c-995f-e90cbfa7a2d6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.188.227.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733621170, 1733621170),
(269, 'default', '{\"uuid\":\"755ee809-eece-40f4-9cc2-5988fa4762cb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"92.246.137.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:156:\\\"Mozilla\\/5.0 (Windows NT 15.0.0; Win64; x64; ) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.6367.60 Chrome\\/124.0.6367.60 Not-A.Brand\\/99  Safari\\/537.36\\\";}\"}}', 0, NULL, 1733624011, 1733624011),
(270, 'default', '{\"uuid\":\"4341227c-aad9-4f85-ba8b-f1a9f9559ee4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.215.38\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:122:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; Mozilla\\/5.0, Google-AdWords-Express) Chrome\\/131.0.6778.69 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733629870, 1733629870),
(271, 'default', '{\"uuid\":\"56b1d787-a144-40f3-b65b-3b08503c8ba6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.36.148.105\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1733631444, 1733631444),
(272, 'default', '{\"uuid\":\"192f554d-cfb3-4b75-9ae2-01078ccc7801\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"54.36.148.6\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1733637739, 1733637739),
(273, 'default', '{\"uuid\":\"4eea15c3-438b-41a7-ab42-ffdd11d0ae75\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.225.164.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733638557, 1733638557),
(274, 'default', '{\"uuid\":\"e548de39-f4de-4d11-b1dc-200550ec9d04\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"80.227.51.6\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733640437, 1733640437),
(275, 'default', '{\"uuid\":\"17c2ed5d-9749-46a5-9633-2c3bd11141ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.36.148.204\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1733641078, 1733641078),
(276, 'default', '{\"uuid\":\"3bd892b4-ae30-4582-b636-7059fb699eae\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"5.30.11.25\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733643785, 1733643785),
(277, 'default', '{\"uuid\":\"de68aea8-f108-431f-8e51-1363d1da4540\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:38:\\\"2001:8f8:2d14:b655:e17e:8845:f687:d394\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733645956, 1733645956),
(278, 'default', '{\"uuid\":\"9445bad0-82b1-42cf-9b63-e3b51642d3c4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"148.252.128.157\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.103 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733651829, 1733651829),
(279, 'default', '{\"uuid\":\"d9528272-2143-484f-8ef7-5be756678f34\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"54.200.193.116\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:104:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733656148, 1733656148),
(280, 'default', '{\"uuid\":\"d0b9adf6-a6c7-48e3-9554-54e408a5c701\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733657446, 1733657446),
(281, 'default', '{\"uuid\":\"a31a4462-6c1d-43b2-a0cc-89e81ddd96d2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"197.134.244.73\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733657824, 1733657824),
(282, 'default', '{\"uuid\":\"28328f81-0f63-45f2-83ab-f738a1efcf76\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.229\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733657847, 1733657847),
(283, 'default', '{\"uuid\":\"6a491fa1-f20a-4815-8203-fd261d921aed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.231\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:198:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/99.0.4844.84 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733657848, 1733657848),
(284, 'default', '{\"uuid\":\"809ab569-0a51-4d1a-9fc9-1a39e50c38b6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"74.125.150.3\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733674895, 1733674895),
(285, 'default', '{\"uuid\":\"20583893-0fdf-404d-b4e0-5e2bc8d1fd66\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"42.236.101.211\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/50.0.2661.102 Safari\\/537.36; 360Spider\\\";}\"}}', 0, NULL, 1733682364, 1733682364),
(286, 'default', '{\"uuid\":\"0281f531-973c-495c-ab4e-b854a46bdea8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"195.154.200.156\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733698626, 1733698626),
(287, 'default', '{\"uuid\":\"6789cd3b-a21d-4553-9540-6843e5d1fb08\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"147.182.168.236\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733703160, 1733703160),
(288, 'default', '{\"uuid\":\"81e044f8-89ff-423f-bed1-c80b9e373307\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"41.68.34.74\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733703652, 1733703652),
(289, 'default', '{\"uuid\":\"6a9ad96f-6105-4498-b188-e6edc657a741\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"41.68.34.74\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733703667, 1733703667),
(290, 'default', '{\"uuid\":\"1b2b6011-7888-4df9-ada6-f0b8c29b4aa8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"41.68.34.74\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733703730, 1733703730),
(291, 'default', '{\"uuid\":\"92422f93-4021-47fb-8260-a277ac7edc7f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733705470, 1733705470),
(292, 'default', '{\"uuid\":\"24b56864-ca18-4491-a43a-8fde11589394\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.233\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1733728905, 1733728905),
(293, 'default', '{\"uuid\":\"fda9396c-957d-4378-b8e8-141ba71e5306\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"123.187.240.242\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733742449, 1733742449),
(294, 'default', '{\"uuid\":\"37664f91-f042-4333-8f02-ac4444702a08\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"41.68.34.74\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733742710, 1733742710),
(295, 'default', '{\"uuid\":\"9a8f8c51-4443-4c9d-a368-94480cf31e47\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"121.5.231.252\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733768812, 1733768812),
(296, 'default', '{\"uuid\":\"ab206c9c-5681-408a-b57e-32a02fbc42a0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"157.55.39.193\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/116.0.1938.76 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733771692, 1733771692),
(297, 'default', '{\"uuid\":\"cc0d0a92-3a80-4ce6-bd3d-71acd0732e2a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"31.218.81.145\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733772597, 1733772597),
(298, 'default', '{\"uuid\":\"7d319ee9-b09b-4970-91c2-a6e9db1211d0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"31.218.81.145\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.73 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733772609, 1733772609),
(299, 'default', '{\"uuid\":\"db2787f3-b7fc-457c-bf51-4baf20de25b2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"52.80.18.29\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:116:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 8_1_1) AppleWebKit\\/556.50 (KHTML, like Gecko) Chrome\\/104.0.1367 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733785626, 1733785626),
(300, 'default', '{\"uuid\":\"376b66ee-45ed-4a17-b920-cf149883c77f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.223.193.173\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1733796672, 1733796672),
(301, 'default', '{\"uuid\":\"566f6d9b-833e-4ac0-88c2-ce2f3300d765\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"93.100.151.198\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:156:\\\"Mozilla\\/5.0 (Windows NT 10.0.0; Win64; x64; ) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.6367.93 Chrome\\/124.0.6367.93 Not-A.Brand\\/99  Safari\\/537.36\\\";}\"}}', 0, NULL, 1733799083, 1733799083),
(302, 'default', '{\"uuid\":\"d1f25fb7-a321-4d7f-b055-d17c54ab4088\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.217.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733807697, 1733807697),
(303, 'default', '{\"uuid\":\"62a7888e-1e88-4ad3-a50d-860eb14b42ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.72.236\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733811259, 1733811259),
(304, 'default', '{\"uuid\":\"568069fe-a3d2-46c2-9536-489d9405ad34\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"35.93.212.12\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:104:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733828027, 1733828027),
(305, 'default', '{\"uuid\":\"c3c83412-cf37-46ba-a114-35f9153562cb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"5.133.192.88\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/105.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733830304, 1733830304),
(306, 'default', '{\"uuid\":\"877f3fba-971d-48f0-a1a0-75ac65316bb9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733833163, 1733833163),
(307, 'default', '{\"uuid\":\"78d87223-727b-4054-9a5d-0bdecbf1468d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.23.215.174\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733836804, 1733836804),
(308, 'default', '{\"uuid\":\"7703d0fa-6264-43ea-88a6-45c02b7a1398\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.23.215.174\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733836805, 1733836805),
(309, 'default', '{\"uuid\":\"0c12cdd0-afc5-4f49-8ced-c800f614837f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"17.241.227.208\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:167:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.4 Safari\\/605.1.15 (Applebot\\/0.1; +http:\\/\\/www.apple.com\\/go\\/applebot)\\\";}\"}}', 0, NULL, 1733867640, 1733867640),
(310, 'default', '{\"uuid\":\"d526bcf9-9967-41c6-aa10-65b6b07e8187\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.153.71.12\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733871552, 1733871552),
(311, 'default', '{\"uuid\":\"3b74e72d-88a6-4883-adf7-12820f19246e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"45.55.61.58\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1733880342, 1733880342),
(312, 'default', '{\"uuid\":\"fb63b09b-2a38-4fae-a641-e874a04c7ba8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"116.97.154.181\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (X11; Linux i686) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36 Vivaldi\\/5.3.2679.68\\\";}\"}}', 0, NULL, 1733884101, 1733884101),
(313, 'default', '{\"uuid\":\"3865efa3-3a0d-473b-8cb2-e48464569bb3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"116.97.154.181\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (X11; Linux i686) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36 Vivaldi\\/5.3.2679.68\\\";}\"}}', 0, NULL, 1733884104, 1733884104),
(314, 'default', '{\"uuid\":\"ff9410ed-92c3-469e-95ec-d568f4e7959f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"116.97.154.181\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (X11; Linux i686) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36 Vivaldi\\/5.3.2679.68\\\";}\"}}', 0, NULL, 1733884105, 1733884105);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(315, 'default', '{\"uuid\":\"2585cc41-5250-4762-aa07-09f51b90ee94\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"116.97.154.181\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (X11; Linux i686) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/114.0.0.0 Safari\\/537.36 Vivaldi\\/5.3.2679.68\\\";}\"}}', 0, NULL, 1733884106, 1733884106),
(316, 'default', '{\"uuid\":\"d207a440-69d0-47f9-8b8a-d5f5ab09011a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733903612, 1733903612),
(317, 'default', '{\"uuid\":\"5b938e74-a3ef-4e89-beff-c6fe345f44bd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"197.42.238.162\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733907007, 1733907007),
(318, 'default', '{\"uuid\":\"1fa57b9b-948e-4307-8399-79f891ca8abc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:28:\\\"2a03:2880:31ff:18::face:b00c\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.103 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733922445, 1733922445),
(319, 'default', '{\"uuid\":\"3cd91d22-38fd-486e-9928-f79f78837708\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"137.226.113.44\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:46:\\\"Mozilla\\/5.0 researchscan.comsys.rwth-aachen.de\\\";}\"}}', 0, NULL, 1733922486, 1733922486),
(320, 'default', '{\"uuid\":\"9dd6af0e-b22d-4f71-80b0-fdf543139ced\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"137.226.113.44\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:46:\\\"Mozilla\\/5.0 researchscan.comsys.rwth-aachen.de\\\";}\"}}', 0, NULL, 1733922486, 1733922486),
(321, 'default', '{\"uuid\":\"f2399df5-bfe5-4027-97b0-9841a90b9fc4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"43.153.102.138\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1733931918, 1733931918),
(322, 'default', '{\"uuid\":\"26b95283-f38e-4797-b5aa-c1f827e84ffc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"70.106.240.10\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:121:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733935249, 1733935249),
(323, 'default', '{\"uuid\":\"0be27a0c-e180-4391-b10d-b1165a638624\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.211.208\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/58.0.3029.110 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733941902, 1733941902),
(324, 'default', '{\"uuid\":\"9bdea10d-b15d-4220-a86e-0396df52df72\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.70.110\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html) Chrome\\/131.0.6778.69 Safari\\/537.36\\\";}\"}}', 0, NULL, 1733950323, 1733950323),
(325, 'default', '{\"uuid\":\"eb3c02dd-1830-4d27-86d2-a49e3b271beb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.151.96\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1733955852, 1733955852),
(326, 'default', '{\"uuid\":\"f99dc6b3-869e-4830-8cac-033670f7253f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"172.241.244.131\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\"\\\";}\"}}', 0, NULL, 1733971985, 1733971985),
(327, 'default', '{\"uuid\":\"047db7b1-bd32-4aac-8a2e-b02c34f604bc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"172.241.245.93\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\"\\\";}\"}}', 0, NULL, 1733971986, 1733971986),
(328, 'default', '{\"uuid\":\"03b6eb0f-0bb7-48f7-8415-54640012aa22\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1733977285, 1733977285),
(329, 'default', '{\"uuid\":\"8881f0ae-c81c-4b18-b877-13bdf0c82da5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986872, 1733986872),
(330, 'default', '{\"uuid\":\"4ad43f77-a6b4-4627-b9ce-9331a4706184\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986872, 1733986872),
(331, 'default', '{\"uuid\":\"e7e4160f-d3aa-475f-a317-72737bdfc704\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986872, 1733986872),
(332, 'default', '{\"uuid\":\"7e576de4-2232-4140-bbd2-25ae8fd02d26\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986872, 1733986872),
(333, 'default', '{\"uuid\":\"78b98b79-0591-4469-9b97-26aa33cc7a47\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986872, 1733986872),
(334, 'default', '{\"uuid\":\"f2d43325-213d-4fb8-b81a-bfbc346a526f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986872, 1733986872),
(335, 'default', '{\"uuid\":\"f5aded8f-544f-40ed-9b14-4e218dc63542\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:26:\\\"Python\\/3.11 aiohttp\\/3.11.7\\\";}\"}}', 0, NULL, 1733986873, 1733986873),
(336, 'default', '{\"uuid\":\"6412a087-7dea-46b8-a46f-09facb87c229\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:26:\\\"Python\\/3.11 aiohttp\\/3.11.7\\\";}\"}}', 0, NULL, 1733986873, 1733986873),
(337, 'default', '{\"uuid\":\"07a8cacf-57a8-4c17-a362-bc985bb0d667\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:26:\\\"Python\\/3.11 aiohttp\\/3.11.7\\\";}\"}}', 0, NULL, 1733986873, 1733986873),
(338, 'default', '{\"uuid\":\"8f3db1fb-0fee-4d3c-a913-3aad3e66e006\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.22.193.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko\\/20100101 Firefox\\/52.0\\\";}\"}}', 0, NULL, 1733986873, 1733986873),
(339, 'default', '{\"uuid\":\"191e2135-57e2-457c-b78d-1efc454f84ea\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"44.244.154.93\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:73:\\\"Mozilla\\/5.0 (compatible; wpbot\\/1.2; +https:\\/\\/forms.gle\\/ajBaxygz9jSR8p8G9)\\\";}\"}}', 0, NULL, 1733996599, 1733996599),
(340, 'default', '{\"uuid\":\"8294a0b5-3703-4bb4-aac6-51de4076a848\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"46.17.174.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko\\/20100101 Firefox\\/98.0\\\";}\"}}', 0, NULL, 1734003102, 1734003102),
(341, 'default', '{\"uuid\":\"3530ca7d-5761-4173-b701-26ec0075f19f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.233\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734008133, 1734008133),
(342, 'default', '{\"uuid\":\"923e6c62-fdb1-49f3-8a37-af2e246010c0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.227\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:164:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; GoogleOther)\\\";}\"}}', 0, NULL, 1734009790, 1734009790),
(343, 'default', '{\"uuid\":\"e0f6c3a5-e00d-4e81-9e9e-62afb4cc2b61\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.242.218.56\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:25:\\\"Python\\/3.10 aiohttp\\/3.9.5\\\";}\"}}', 0, NULL, 1734012087, 1734012087),
(344, 'default', '{\"uuid\":\"043197a4-a630-4609-9e12-c30e8140488f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.72.236\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734013749, 1734013749),
(345, 'default', '{\"uuid\":\"a61d503d-62b9-44c6-9a9f-7b3b1ee65e52\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"106.54.200.247\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734023180, 1734023180),
(346, 'default', '{\"uuid\":\"609d305f-01c6-4f65-be69-57af3bbc964a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"36.111.67.189\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734024475, 1734024475),
(347, 'default', '{\"uuid\":\"15d507de-8756-454e-a769-275955eca666\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.66\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1734024799, 1734024799),
(348, 'default', '{\"uuid\":\"a5251498-611e-45de-b99f-784997e56e31\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.230\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734051774, 1734051774),
(349, 'default', '{\"uuid\":\"fdcee4dd-21ae-438f-93e6-810bd247a175\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.230\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734051775, 1734051775),
(350, 'default', '{\"uuid\":\"4290ae37-c484-42e3-9306-3601626fe5c9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"159.203.170.136\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734055551, 1734055551),
(351, 'default', '{\"uuid\":\"29fdd81d-239b-46fe-aaf3-9808e35a4c14\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.231\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734059121, 1734059121),
(352, 'default', '{\"uuid\":\"7453761d-f3a1-4b98-ae2f-a228f1195621\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.231\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734059121, 1734059121),
(353, 'default', '{\"uuid\":\"535686ed-2459-40e6-bdfd-66aec5b8bba0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.153.54.138\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734059586, 1734059586),
(354, 'default', '{\"uuid\":\"60ea6945-2462-46ab-8be6-7e371f026964\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"146.247.229.2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.3.1 Mobile\\/15E148 Safari\\/604\\\";}\"}}', 0, NULL, 1734060262, 1734060262),
(355, 'default', '{\"uuid\":\"e26bb86b-f36b-4319-8ee1-4713e25d5852\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:18:\\\"2a00:6800:3:b9e::1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/91.0.4472.114 Safari\\/537.36 Edg\\/91.0.864.54\\\";}\"}}', 0, NULL, 1734060883, 1734060883),
(356, 'default', '{\"uuid\":\"39f6bbb6-30a6-40f4-8e71-50562d4dec7a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.72.236\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734065604, 1734065604),
(357, 'default', '{\"uuid\":\"2c722f50-700a-40a6-bbbd-4340d5ad252b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734086710, 1734086710),
(358, 'default', '{\"uuid\":\"9b967686-dfd4-4731-a312-099da6ccbfe7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2001:bc8:1201:2b:ba2a:72ff:fed9:efeb\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:110:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.3\\\";}\"}}', 0, NULL, 1734086923, 1734086923),
(359, 'default', '{\"uuid\":\"de4da7fb-1ce5-4bca-b08c-1eafeb2b8aab\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.225\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734094926, 1734094926),
(360, 'default', '{\"uuid\":\"3b61c1c3-fad2-4226-bc97-22440781da53\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"172.245.217.173\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:123:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/38.0.2125.111 Safari\\/537.36 GD\\\";}\"}}', 0, NULL, 1734095299, 1734095299),
(361, 'default', '{\"uuid\":\"98428e7c-8d90-43be-98e1-1b445ac03949\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.36.148.203\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1734098173, 1734098173),
(362, 'default', '{\"uuid\":\"268534c3-32fe-4378-af7d-c2e3c802fb44\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.153.58.28\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734102803, 1734102803),
(363, 'default', '{\"uuid\":\"fe5925e2-52e1-4713-a0b5-c564bf172282\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.153.10.83\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734103493, 1734103493),
(364, 'default', '{\"uuid\":\"254ec5ea-8268-4dec-929b-9c3e99c2ce4e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"182.44.12.37\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734108847, 1734108847),
(365, 'default', '{\"uuid\":\"600cf5bb-c5e9-44a7-bbba-0c7a2326a37a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"77.74.177.114\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:153:\\\"Mozilla\\/5.0 (Linux; arm_64; Android 12; CPH2205) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/110.0.0.0 YaBrowser\\/23.3.3.86.00 SA\\/3 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734127452, 1734127452),
(366, 'default', '{\"uuid\":\"e430a745-7d7c-4c25-a78a-051c5b32ef07\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"106.75.137.178\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/101.0.4951.54 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734160044, 1734160044),
(367, 'default', '{\"uuid\":\"ed76672b-6304-43de-82f0-35be108360cd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"106.75.137.178\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734160051, 1734160051),
(368, 'default', '{\"uuid\":\"2a9cfe95-bbc9-4740-a5dd-8e2073a246ad\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734160887, 1734160887),
(369, 'default', '{\"uuid\":\"fd2080b6-eb32-44a6-8564-f8f1d397b1bc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.225.164.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734161735, 1734161735),
(370, 'default', '{\"uuid\":\"37aa8bc4-106e-4148-81b7-665e36473a08\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.71.33.100\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/127.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734175070, 1734175070),
(371, 'default', '{\"uuid\":\"d87416ea-7b29-4b47-be26-18e89ed813a2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.71.33.100\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/127.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734175917, 1734175917),
(372, 'default', '{\"uuid\":\"4baa76d5-7a38-418a-998b-a0b213292bdc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.100\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734177424, 1734177424),
(373, 'default', '{\"uuid\":\"849ce17d-73f2-4ae5-8099-187b9e10809d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.110\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734181472, 1734181472),
(374, 'default', '{\"uuid\":\"f9285365-6c7c-437e-9add-a6b9751bc1cc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:24:\\\"2a03:b0c0:1:d0::df1:d001\\\";}\"}}', 0, NULL, 1734189664, 1734189664),
(375, 'default', '{\"uuid\":\"99c5cb6b-bfb8-4347-bc45-d00a4ef428a3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:24:\\\"2a03:b0c0:3:d0::34e:b001\\\";}\"}}', 0, NULL, 1734189664, 1734189664),
(376, 'default', '{\"uuid\":\"eb0616d8-5ca4-439a-a1d6-40c0e384aee7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:24:\\\"2a03:b0c0:3:d0::34e:b001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:136:\\\"Mozilla\\/5.0 (Linux; Android 6.0; HTC One M9 Build\\/MRA58K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/52.0.2743.98 Mobile Safari\\/537.3\\\";}\"}}', 0, NULL, 1734189664, 1734189664),
(377, 'default', '{\"uuid\":\"9feceea3-553b-4049-8f97-b8e83ecc743d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:24:\\\"2a03:b0c0:1:d0::df1:d001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:136:\\\"Mozilla\\/5.0 (Linux; Android 6.0; HTC One M9 Build\\/MRA58K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/52.0.2743.98 Mobile Safari\\/537.3\\\";}\"}}', 0, NULL, 1734189664, 1734189664),
(378, 'default', '{\"uuid\":\"3cf5a542-282b-4d28-9162-a6e80ca940b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"154.28.229.61\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734189669, 1734189669),
(379, 'default', '{\"uuid\":\"5932b97b-775c-4caa-9a61-e07bf20e3752\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.28.229.100\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734189669, 1734189669),
(380, 'default', '{\"uuid\":\"5345567a-7faa-4a86-95ae-86af7af23dbf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"154.28.229.61\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734189681, 1734189681),
(381, 'default', '{\"uuid\":\"d653daf9-9d9f-4262-bb1f-22297f189815\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"104.197.69.115\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) HeadlessChrome\\/125.0.6422.60 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734189734, 1734189734),
(382, 'default', '{\"uuid\":\"4da8bacf-938d-45ef-a066-fcc4ff0e1366\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"205.169.39.110\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.61 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734189743, 1734189743),
(383, 'default', '{\"uuid\":\"b30a47e9-7462-41b3-ac23-9b562efb51d1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"205.169.39.110\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:114:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734189756, 1734189756),
(384, 'default', '{\"uuid\":\"f609e552-07fa-444e-bbee-b444a136bd02\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"205.169.39.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:116:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.5938.132 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734194664, 1734194664),
(385, 'default', '{\"uuid\":\"722ec098-c27d-4eda-9dc6-f6737a9cd6e7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"207.241.225.134\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (compatible; archive.org_bot +http:\\/\\/archive.org\\/details\\/archive.org_bot) Zeno\\/7597a01 warc\\/v0.8.54\\\";}\"}}', 0, NULL, 1734195515, 1734195515);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(386, 'default', '{\"uuid\":\"514b045b-1e04-477e-a809-2d8d88e91c47\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"124.222.8.47\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734195644, 1734195644),
(387, 'default', '{\"uuid\":\"582995e6-176d-4a57-ac71-883b9a051858\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"124.222.8.47\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734195925, 1734195925),
(388, 'default', '{\"uuid\":\"e690be6b-47c0-4ae2-96eb-e6c3db7b35a4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"124.222.8.47\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734195938, 1734195938),
(389, 'default', '{\"uuid\":\"505b07e8-228f-440f-8d53-093d59654c9b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.193.135.108\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/110.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734203252, 1734203252),
(390, 'default', '{\"uuid\":\"1b06d76e-9306-4b10-aa84-89d8a6e4266d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734221027, 1734221027),
(391, 'default', '{\"uuid\":\"898c8e9e-2ef9-4e00-8a7f-012d3c968d8c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"165.232.184.151\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734228067, 1734228067),
(392, 'default', '{\"uuid\":\"68ef8054-cbf3-4dda-88eb-68162f746822\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.216.18.162\\\";}\"}}', 0, NULL, 1734233087, 1734233087),
(393, 'default', '{\"uuid\":\"fed41218-49e9-4102-a058-7ad8d2a56016\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.216.18.162\\\";}\"}}', 0, NULL, 1734233089, 1734233089),
(394, 'default', '{\"uuid\":\"0ba32e4e-c61b-4e0f-888d-ad3f8948bf1f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.216.18.162\\\";}\"}}', 0, NULL, 1734233090, 1734233090),
(395, 'default', '{\"uuid\":\"34615acf-fb46-43b2-8de0-4be8b9b1f699\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"137.184.77.6\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734247665, 1734247665),
(396, 'default', '{\"uuid\":\"56de4bfe-f745-4fd8-b847-d6734293a867\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"171.244.43.14\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/122.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734253775, 1734253775),
(397, 'default', '{\"uuid\":\"0a46bda8-8262-436a-9510-e57bb6ead626\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.106\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734275909, 1734275909),
(398, 'default', '{\"uuid\":\"49bfdb1b-addf-4eeb-beef-f3406994afbc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.160.188\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:42:\\\"Mozilla\\/5.0 (compatible; Dataprovider.com)\\\";}\"}}', 0, NULL, 1734278632, 1734278632),
(399, 'default', '{\"uuid\":\"dbcf666e-7f16-4be8-8443-3085f01512cc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.160.188\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:42:\\\"Mozilla\\/5.0 (compatible; Dataprovider.com)\\\";}\"}}', 0, NULL, 1734278634, 1734278634),
(400, 'default', '{\"uuid\":\"3ecb040b-d8b3-4435-894c-b9e197703bee\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.160.188\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:42:\\\"Mozilla\\/5.0 (compatible; Dataprovider.com)\\\";}\"}}', 0, NULL, 1734278635, 1734278635),
(401, 'default', '{\"uuid\":\"8666dcdc-a686-4e71-8f4c-01843b9d00fa\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.160.188\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:42:\\\"Mozilla\\/5.0 (compatible; Dataprovider.com)\\\";}\"}}', 0, NULL, 1734278637, 1734278637),
(402, 'default', '{\"uuid\":\"d90c3f67-8e91-4256-a56d-c27ab1192e35\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.160.188\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:42:\\\"Mozilla\\/5.0 (compatible; Dataprovider.com)\\\";}\"}}', 0, NULL, 1734278638, 1734278638),
(403, 'default', '{\"uuid\":\"bb24c36d-e8a0-41d5-b5f5-bd23ce74d56d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.160.188\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:122:\\\"Mozilla\\/5.0 (Linux; Android 10; SM-G981B) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.162 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734278639, 1734278639),
(404, 'default', '{\"uuid\":\"cb4fe50e-0bbb-457e-83c1-316a6236ef4f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.56.150.211\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:42:\\\"Mozilla\\/5.0 (compatible; Dataprovider.com)\\\";}\"}}', 0, NULL, 1734278661, 1734278661),
(405, 'default', '{\"uuid\":\"576bdcf0-14d3-4a4f-8c40-aff9735e2a9a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"171.244.43.14\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/122.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734282691, 1734282691),
(406, 'default', '{\"uuid\":\"dca32eac-43eb-4f6f-98a3-21793eca4147\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.129.252.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734287514, 1734287514),
(407, 'default', '{\"uuid\":\"fd85494f-878d-471b-ac58-b81d5895af76\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.129.252.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734287520, 1734287520),
(408, 'default', '{\"uuid\":\"80285ec7-86d6-42c3-bf68-bcbef411bb74\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.36.148.162\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1734287561, 1734287561),
(409, 'default', '{\"uuid\":\"3e283afa-1500-46d7-b1c0-d8fbd9c56e85\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.216.18.162\\\";}\"}}', 0, NULL, 1734288115, 1734288115),
(410, 'default', '{\"uuid\":\"07a1f331-ae1e-4a17-9f2f-638a66472d07\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.216.18.162\\\";}\"}}', 0, NULL, 1734288117, 1734288117),
(411, 'default', '{\"uuid\":\"9ce3f890-8a35-441e-a213-11c7fb7e3bde\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.216.18.162\\\";}\"}}', 0, NULL, 1734288118, 1734288118),
(412, 'default', '{\"uuid\":\"c54e3b3d-9625-4ee3-b751-3d5ead8d1192\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"109.243.5.194\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.97 Safari\\/537.36 OPR\\/64.0.3417.92\\\";}\"}}', 0, NULL, 1734292714, 1734292714),
(413, 'default', '{\"uuid\":\"0c0f68ac-fdda-4cf5-8423-9bda0b41136b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"109.243.5.194\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.97 Safari\\/537.36 OPR\\/65.0.3467.48\\\";}\"}}', 0, NULL, 1734292715, 1734292715),
(414, 'default', '{\"uuid\":\"da9e7963-1c93-46f4-9685-f5b888327d13\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"109.243.5.194\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734292936, 1734292936),
(415, 'default', '{\"uuid\":\"de10e646-eaba-4774-aea6-07162787e5b3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"109.243.5.194\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64; rv:70.0) Gecko\\/20100101 Firefox\\/70.0\\\";}\"}}', 0, NULL, 1734292936, 1734292936),
(416, 'default', '{\"uuid\":\"a91d9098-f0fc-41fc-94a5-6ae2a7d41669\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.225\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:199:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734302463, 1734302463),
(417, 'default', '{\"uuid\":\"470fa753-4fda-48ba-ade3-321d3905ad23\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"113.62.169.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734316404, 1734316404),
(418, 'default', '{\"uuid\":\"8258a7fc-868e-4d13-855d-3c94e0b749c6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.69\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1734321574, 1734321574),
(419, 'default', '{\"uuid\":\"7edf8d39-37b9-4b01-9ec6-d119b742d6c4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.70.106\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.108 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734325422, 1734325422),
(420, 'default', '{\"uuid\":\"9647ef69-0f5f-4ea1-902a-6104d3bf0362\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734337016, 1734337016),
(421, 'default', '{\"uuid\":\"c2b7010b-231f-456e-ad6b-a8c4a4542d7a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"40.77.167.78\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; bingbot\\/2.0; +http:\\/\\/www.bing.com\\/bingbot.htm) Chrome\\/116.0.1938.76 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734346383, 1734346383),
(422, 'default', '{\"uuid\":\"47d2778c-c632-441f-a236-cab525eac445\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.57\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1734355098, 1734355098),
(423, 'default', '{\"uuid\":\"fff1b06e-200d-4c18-80ba-936c0cac9b2e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"157.245.81.92\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734364544, 1734364544),
(424, 'default', '{\"uuid\":\"cbf5a8bc-f34d-4b24-9485-8e54a527f54f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"13.59.34.111\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:10:\\\"curl\\/8.3.0\\\";}\"}}', 0, NULL, 1734364649, 1734364649),
(425, 'default', '{\"uuid\":\"8c39b7d2-f563-4eca-9b19-536f38e69099\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"203.33.203.148\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734370778, 1734370778),
(426, 'default', '{\"uuid\":\"66f58380-63ee-4967-aa9a-f6647349b3ba\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.129.252.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734376482, 1734376482),
(427, 'default', '{\"uuid\":\"4b613514-5018-4a9c-93e1-49bc51dfe32c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.129.252.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734376487, 1734376487),
(428, 'default', '{\"uuid\":\"627f8c5d-74a5-43cd-b6ad-a0625abe2488\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.129.252.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734376492, 1734376492),
(429, 'default', '{\"uuid\":\"fac03ae8-5f3d-45c5-b8c8-f6a4b3752d65\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.129.252.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734376500, 1734376500),
(430, 'default', '{\"uuid\":\"6dba587b-f863-4c3d-bf94-10193b3429d9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"197.134.48.173\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734376764, 1734376764),
(431, 'default', '{\"uuid\":\"ad224e51-276a-4c36-bc2c-d42e31028f1a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"5.133.192.136\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/105.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734377422, 1734377422),
(432, 'default', '{\"uuid\":\"c9d91d33-cf4a-4409-899e-eb5cfc2c9e1d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"206.189.141.39\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734381814, 1734381814),
(433, 'default', '{\"uuid\":\"50c77b22-27f4-434c-85d3-8117c65abae4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"69.167.30.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:126.0) Gecko\\/20100101 Firefox\\/126.0\\\";}\"}}', 0, NULL, 1734388521, 1734388521),
(434, 'default', '{\"uuid\":\"465d17fb-c3a7-481f-bb09-0fbfcf4ac5a2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"69.167.30.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) HeadlessChrome\\/111.0.5563.19 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734388522, 1734388522),
(435, 'default', '{\"uuid\":\"68c9f44e-efaa-4aad-a76c-286a0a540166\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734396536, 1734396536),
(436, 'default', '{\"uuid\":\"5f6f8061-a314-4577-9e27-4d9884d5b348\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"165.227.138.217\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734401701, 1734401701),
(437, 'default', '{\"uuid\":\"8148bb9e-1240-433d-8d48-e659fa6a42c6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"111.231.12.66\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734413001, 1734413001),
(438, 'default', '{\"uuid\":\"e8645ae3-6f43-4100-8e23-f92493c88774\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"111.231.12.66\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734413340, 1734413340),
(439, 'default', '{\"uuid\":\"f361b060-5426-4cca-b378-12587297120e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"124.225.164.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734424443, 1734424443),
(440, 'default', '{\"uuid\":\"afa502da-d6d9-42a6-97ce-61d047005975\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"87.120.127.253\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:130:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.4.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734435394, 1734435394),
(441, 'default', '{\"uuid\":\"f39ee721-449c-43b8-8ba1-3631510bbfa8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:36:\\\"2a00:f29:328:527:3da0:d7f2:ddc3:16e8\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:145:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/131.0.6778.134 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734448268, 1734448268),
(442, 'default', '{\"uuid\":\"55133756-c741-4d73-b902-f66562a11d85\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"101.91.148.219\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734474397, 1734474397),
(443, 'default', '{\"uuid\":\"467bef97-3e21-4273-b7a1-36f202e16244\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:9:\\\"3.68.89.5\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:121:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/101.0.4951.54 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734478666, 1734478666),
(444, 'default', '{\"uuid\":\"e84ded3b-a19d-483d-bb9b-532cf759c79f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734483092, 1734483092),
(445, 'default', '{\"uuid\":\"11f15d43-66ca-4aa5-b200-6c6cd414cee8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.103\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:216:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.85 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734511942, 1734511942),
(446, 'default', '{\"uuid\":\"67a42063-09f3-43c4-9531-42a44e2445d5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.133.91.48\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734523126, 1734523126),
(447, 'default', '{\"uuid\":\"9f654cef-af16-40b9-b0ec-31d716585a82\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.232\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.108 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734525744, 1734525744),
(448, 'default', '{\"uuid\":\"f4dbe73a-53b0-4cc6-a021-f82ec9356936\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.228\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734525869, 1734525869),
(449, 'default', '{\"uuid\":\"fbccefd4-0ed7-4e1a-9013-52820551f2c8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.228\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:198:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/99.0.4844.84 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734525869, 1734525869),
(450, 'default', '{\"uuid\":\"3d1b6633-70a6-49ef-9786-7611fd0acad5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"137.226.113.44\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:46:\\\"Mozilla\\/5.0 researchscan.comsys.rwth-aachen.de\\\";}\"}}', 0, NULL, 1734527517, 1734527517),
(451, 'default', '{\"uuid\":\"15470583-3aff-4540-827f-9aebfd5d3af3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"110.166.71.39\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734528669, 1734528669),
(452, 'default', '{\"uuid\":\"b651cd37-feeb-403d-99ee-9bf901826f38\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"54.36.148.7\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1734528734, 1734528734),
(453, 'default', '{\"uuid\":\"1ac11dee-027d-477a-8826-86fd4dedd763\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"207.241.225.134\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/1.1\\\";}\"}}', 0, NULL, 1734533177, 1734533177),
(454, 'default', '{\"uuid\":\"efbf74ac-d4b1-4cc7-a38a-62eabf22cd03\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"159.203.45.144\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734552124, 1734552124),
(455, 'default', '{\"uuid\":\"c23d3b05-7e26-42f1-97f3-c1236a75fc4a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"106.119.167.146\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734576659, 1734576659),
(456, 'default', '{\"uuid\":\"ddb7853e-1c4a-4c4d-86f2-7a13cb2414ca\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"23.83.88.91\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\"\\\";}\"}}', 0, NULL, 1734580991, 1734580991),
(457, 'default', '{\"uuid\":\"a5798181-31ee-4bc2-8dba-694d9b6d8f45\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"151.248.84.215\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\"\\\";}\"}}', 0, NULL, 1734580991, 1734580991),
(458, 'default', '{\"uuid\":\"80d6f57e-cab7-4f27-854e-2ce4db5a3f32\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734599031, 1734599031),
(459, 'default', '{\"uuid\":\"db15a942-79e2-4b1e-9ab7-486aaca76355\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"42.83.147.54\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko)Chrome\\/74.0.3729.169 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734617720, 1734617720);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(460, 'default', '{\"uuid\":\"09d5a6ca-f110-406b-b1b9-5b1c9c877560\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"42.83.147.54\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko)Chrome\\/74.0.3729.169 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734617721, 1734617721),
(461, 'default', '{\"uuid\":\"8d77eda5-d8d7-409a-a5c0-2ceaa3c26ebd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"46.17.174.192\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734617762, 1734617762),
(462, 'default', '{\"uuid\":\"ef1510c6-b764-4f72-aa18-964a780137fb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"199.244.88.230\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/105.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734621303, 1734621303),
(463, 'default', '{\"uuid\":\"d3fd1262-32df-4d8e-9cc7-240121c44449\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a01:239:296:ab00::1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:22:\\\"python-requests\\/2.32.3\\\";}\"}}', 0, NULL, 1734625758, 1734625758),
(464, 'default', '{\"uuid\":\"93119a6e-53bc-48e8-8272-89da88ae2ba2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"104.252.31.147\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/123.0.6312.52 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734625938, 1734625938),
(465, 'default', '{\"uuid\":\"000bb0fc-743d-4bf7-b887-7d07199980e7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"107.173.151.121\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/123.0.6312.52 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734626033, 1734626033),
(466, 'default', '{\"uuid\":\"d321df5d-b98d-4e3f-9cbc-b417e80045be\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:21:\\\"2a02:247a:26d:1000::1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/91.0.4472.114 Safari\\/537.36 Edg\\/91.0.864.54\\\";}\"}}', 0, NULL, 1734628674, 1734628674),
(467, 'default', '{\"uuid\":\"b627a0be-18af-4847-ae28-ae1c587dc2d0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.59\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1734628795, 1734628795),
(468, 'default', '{\"uuid\":\"16fbf976-9165-4c1c-a123-de40b07f33cd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.143.60.88\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734631824, 1734631824),
(469, 'default', '{\"uuid\":\"78c55a73-7b9f-433d-9785-369629da42ef\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.143.60.88\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734631885, 1734631885),
(470, 'default', '{\"uuid\":\"341d9506-89e8-4c82-969a-d6266967ef64\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.143.60.88\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734633426, 1734633426),
(471, 'default', '{\"uuid\":\"63337f11-cb07-4f9d-8b01-748ebd195f89\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.143.60.88\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:209:\\\"Mozilla\\/5.0 (Linux; Android 10; LIO-AN00 Build\\/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/78.0.3904.62 XWEB\\/2692 MMWEBSDK\\/200901 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734633445, 1734633445),
(472, 'default', '{\"uuid\":\"4a089665-3b0d-41ff-829c-c78036f52290\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734664762, 1734664762),
(473, 'default', '{\"uuid\":\"3876ab41-b838-49b8-a331-a8060966b575\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.109\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:217:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; AdsBot-Google-Mobile; +http:\\/\\/www.google.com\\/mobile\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734668021, 1734668021),
(474, 'default', '{\"uuid\":\"a06dd228-ad2c-4b15-b7f6-c9e1899d74a3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.230\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734673763, 1734673763),
(475, 'default', '{\"uuid\":\"ee182060-b4bf-4ce7-8c1d-71df7f0bbf6e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.228\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734673782, 1734673782),
(476, 'default', '{\"uuid\":\"3b5c0ec8-4063-483f-af8b-a80cd17642c3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"223.15.245.170\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734680655, 1734680655),
(477, 'default', '{\"uuid\":\"6f98726a-4e02-4862-8bbc-2c78cc4436ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.167.92.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:114:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/58.0.3029.110 Safari\\/537.3\\\";}\"}}', 0, NULL, 1734684675, 1734684675),
(478, 'default', '{\"uuid\":\"12d28136-b6d9-4ff9-b4c9-04c8de2b6cc2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:bc8:1201:61f:569f:35ff:fe0f:ddec\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:110:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.3\\\";}\"}}', 0, NULL, 1734692619, 1734692619),
(479, 'default', '{\"uuid\":\"fb72a000-881f-4e7e-884b-01544b730d87\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.226\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734702882, 1734702882),
(480, 'default', '{\"uuid\":\"8427f7e8-feeb-4d19-87fb-8bebfe137a6f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.224\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:198:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/99.0.4844.84 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734703005, 1734703005),
(481, 'default', '{\"uuid\":\"6f317b24-c654-43c4-a96c-a62fb68dd085\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.225\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734703006, 1734703006),
(482, 'default', '{\"uuid\":\"4d3cbb33-f926-438c-9cf2-e3c159fe39fc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.224\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734704404, 1734704404),
(483, 'default', '{\"uuid\":\"bbe659b4-e9f9-4e30-9cb9-d85bf872efc7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"42.236.12.240\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/50.0.2661.102 Safari\\/537.36; 360Spider\\\";}\"}}', 0, NULL, 1734704992, 1734704992),
(484, 'default', '{\"uuid\":\"a0237365-82bf-4a89-960f-edf57e3f7379\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"119.28.177.175\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734705239, 1734705239),
(485, 'default', '{\"uuid\":\"916ad9cd-91c0-4423-a45f-45d721dbc6ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"42.236.12.252\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/50.0.2661.102 Safari\\/537.36; 360Spider\\\";}\"}}', 0, NULL, 1734709725, 1734709725),
(486, 'default', '{\"uuid\":\"3d6e256c-cba1-4d6b-9bc7-05bd5de43577\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"124.70.203.191\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (Windows NT 5.9; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.2769.88 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734716286, 1734716286),
(487, 'default', '{\"uuid\":\"307b0ab4-afc8-4444-a810-249312a2e0ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2601:249:c81:9940:78f1:9dfb:1fdf:725d\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\\\";}\"}}', 0, NULL, 1734722173, 1734722173),
(488, 'default', '{\"uuid\":\"7f7a6fee-3c54-4247-a114-11e401fa023c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"106.119.167.146\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734729466, 1734729466),
(489, 'default', '{\"uuid\":\"7cf1800c-df6b-41c5-b88f-df4b74930c56\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"193.46.243.66\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:76:\\\"Mozilla\\/5.0 (compatible; t3versionsBot\\/1.0; +https:\\/\\/www.t3versions.com\\/bot)\\\";}\"}}', 0, NULL, 1734740856, 1734740856),
(490, 'default', '{\"uuid\":\"bae2f629-b8d5-403a-90f1-dfb75f75b6bf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"164.90.138.81\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734742183, 1734742183),
(491, 'default', '{\"uuid\":\"d36b8191-e1e1-44cb-b96c-ce814b3cb4f3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"18.140.70.228\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:147:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/98.0.4758.141 YaBrowser\\/22.3.3.852 Yowser\\/2.5 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734742599, 1734742599),
(492, 'default', '{\"uuid\":\"942f647d-593d-4314-a1c8-1694adfc2ebb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.233\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734753019, 1734753019),
(493, 'default', '{\"uuid\":\"24061864-59ce-41f6-b90f-ed43e21dac7b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.226\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734753089, 1734753089),
(494, 'default', '{\"uuid\":\"f7a0d47d-3f7b-4a09-946f-b66b6f8d2565\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"46.17.174.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko\\/20100101 Firefox\\/98.0\\\";}\"}}', 0, NULL, 1734769379, 1734769379),
(495, 'default', '{\"uuid\":\"0018d0cc-14a4-401a-b903-c7606f76d4db\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"192.36.109.108\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:110:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/121.0.0.0 Safari\\/537.3\\\";}\"}}', 0, NULL, 1734779426, 1734779426),
(496, 'default', '{\"uuid\":\"288b4b25-3d19-40d5-af2b-1d18214b2aac\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1734781146, 1734781146),
(497, 'default', '{\"uuid\":\"113de095-be82-4d9a-bbae-89c2cda19623\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734787453, 1734787453),
(498, 'default', '{\"uuid\":\"c73d0d0c-65d4-4ebd-a087-898584ebb684\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"18.206.58.174\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:105:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/44.0.2403.157 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734796759, 1734796759),
(499, 'default', '{\"uuid\":\"9a27ccdf-f82e-4407-a9a9-363716e9339c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.106\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734798543, 1734798543),
(500, 'default', '{\"uuid\":\"a0bbdfce-f02d-4f98-800b-022963492109\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"74.125.151.97\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734800248, 1734800248),
(501, 'default', '{\"uuid\":\"6053dc23-d532-4bc1-ae39-040cdf9e6fe9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"5.30.42.133\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734819308, 1734819308),
(502, 'default', '{\"uuid\":\"5fb65c83-cd62-4991-8dc6-017cff59a580\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.222.232.196\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734819312, 1734819312),
(503, 'default', '{\"uuid\":\"4fba5fc1-4818-45c0-95ff-934008536168\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"222.79.104.23\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734831269, 1734831269),
(504, 'default', '{\"uuid\":\"314654b3-78b3-4682-8ed9-334a72203db1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"65.19.141.115\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:121:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.6613.84 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734837215, 1734837215),
(505, 'default', '{\"uuid\":\"9caf3a37-13f6-472a-9680-0773af7db18d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734856941, 1734856941),
(506, 'default', '{\"uuid\":\"b1b43352-e1f6-4d3a-88a1-8119b5dfb035\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"44.243.113.205\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:104:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734865337, 1734865337),
(507, 'default', '{\"uuid\":\"720cc152-fc29-4234-a425-251d0fe93fc1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.64.231\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.6778.139 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1734868242, 1734868242),
(508, 'default', '{\"uuid\":\"69b4614c-2f99-4fb0-bfaf-9943f93465bd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"82.80.249.214\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:76:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko\\/20100101 Firefox\\/26.0\\\";}\"}}', 0, NULL, 1734874123, 1734874123),
(509, 'default', '{\"uuid\":\"62476690-af6a-48e2-9b28-ecd1aab89a00\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"82.80.249.159\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit\\/536.30.1 (KHTML, like Gecko) Version\\/6.0.5 Safari\\/536.30.1\\\";}\"}}', 0, NULL, 1734874181, 1734874181),
(510, 'default', '{\"uuid\":\"2e26761e-5262-45aa-a679-bc6c742ec1aa\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"82.80.249.159\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (Windows NT 5.1) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/31.0.1650.63 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734874206, 1734874206),
(511, 'default', '{\"uuid\":\"dba369ae-270c-4ce0-9fe6-ec4763f74da9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"82.80.249.159\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:108:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/31.0.1650.57 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734874209, 1734874209),
(512, 'default', '{\"uuid\":\"3ddeadb7-dc66-4d6b-8a9a-de754fc82d56\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"82.80.249.159\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko\\/20100101 Firefox\\/33.0\\\";}\"}}', 0, NULL, 1734874213, 1734874213),
(513, 'default', '{\"uuid\":\"e2c2604e-4262-4559-98f0-d315101db931\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"82.80.249.159\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:76:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:25.0) Gecko\\/20100101 Firefox\\/25.0\\\";}\"}}', 0, NULL, 1734874222, 1734874222),
(514, 'default', '{\"uuid\":\"398d24e4-5933-4e51-a1f6-54ee16240c9f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"182.42.105.144\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734887437, 1734887437),
(515, 'default', '{\"uuid\":\"8a000bcc-3ae3-4642-a072-b7d2b219284a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"42.236.17.41\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/50.0.2661.102 Safari\\/537.36; 360Spider\\\";}\"}}', 0, NULL, 1734896235, 1734896235),
(516, 'default', '{\"uuid\":\"4ae61da8-0f6e-47f3-87b2-cf2568f014b5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"42.236.101.249\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/50.0.2661.102 Safari\\/537.36; 360Spider\\\";}\"}}', 0, NULL, 1734913034, 1734913034),
(517, 'default', '{\"uuid\":\"19c81aaa-0ffa-4b90-9e3f-b66b13dda053\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"137.184.152.251\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:24:\\\"Mozilla\\/5.0 (compatible)\\\";}\"}}', 0, NULL, 1734913911, 1734913911),
(518, 'default', '{\"uuid\":\"b49fad1b-82ac-4192-9a12-50a2f6f80c4a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"5.133.192.140\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/105.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1734920217, 1734920217),
(519, 'default', '{\"uuid\":\"ce9e12f6-757d-43cc-b8c7-04995e8ff63f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.36.149.106\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1734930812, 1734930812),
(520, 'default', '{\"uuid\":\"10390602-1a6c-4cee-9144-79cb4ce67f4f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"54.36.148.38\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:66:\\\"Mozilla\\/5.0 (compatible; AhrefsBot\\/7.0; +http:\\/\\/ahrefs.com\\/robot\\/)\\\";}\"}}', 0, NULL, 1734941170, 1734941170),
(521, 'default', '{\"uuid\":\"6e5628ea-fd55-4016-81cc-d8fa4e5c914e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1734946829, 1734946829),
(522, 'default', '{\"uuid\":\"6b44f186-efaa-4b34-842c-e34e94846152\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:bc8:17c0:50a:46a8:42ff:fe1b:ca0b\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:110:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/124.0.0.0 Safari\\/537.3\\\";}\"}}', 0, NULL, 1734948014, 1734948014),
(523, 'default', '{\"uuid\":\"c408c631-d972-484a-8259-c01318f8c15d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.98.104.241\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:107:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/534.24 (KHTML, like Gecko) Chrome\\/11.0.696.71 Safari\\/534.24\\\";}\"}}', 0, NULL, 1734953365, 1734953365),
(524, 'default', '{\"uuid\":\"83468390-ebe6-4505-803e-f9939721611e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.98.104.241\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:107:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/534.24 (KHTML, like Gecko) Chrome\\/11.0.696.71 Safari\\/534.24\\\";}\"}}', 0, NULL, 1734954232, 1734954232),
(525, 'default', '{\"uuid\":\"6863f9c0-1f96-479f-9ff8-a1262ad0c856\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"125.75.66.97\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1734986525, 1734986525),
(526, 'default', '{\"uuid\":\"c86a2586-2442-4bd1-b984-0e21ac48f6e3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"74.125.151.100\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:50:\\\"AdsBot-Google (+http:\\/\\/www.google.com\\/adsbot.html)\\\";}\"}}', 0, NULL, 1734986908, 1734986908),
(527, 'default', '{\"uuid\":\"c2ea1b9c-d18d-467c-a647-7fe318a94ae5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1735002180, 1735002180),
(528, 'default', '{\"uuid\":\"59d005b0-7083-4c60-a6aa-b6b8876c542b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"69.160.160.52\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:143:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; Nicecrawler\\/1.1; +http:\\/\\/www.nicecrawler.com\\/) Chrome\\/90.0.4430.97 Safari\\/537.36\\\";}\"}}', 0, NULL, 1735002450, 1735002450),
(529, 'default', '{\"uuid\":\"0f826f12-d23b-41ca-89f4-2bafae71d2d5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"69.160.160.52\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:113:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) HeadlessChrome\\/80.0.3987.132 Safari\\/537.36\\\";}\"}}', 0, NULL, 1735002455, 1735002455);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(530, 'default', '{\"uuid\":\"aecf0a27-dd5b-4bc9-be39-d9223cf8743a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"69.160.160.52\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36\\\";}\"}}', 0, NULL, 1735002470, 1735002470),
(531, 'default', '{\"uuid\":\"8e8efe6c-320a-46f1-a276-71d88e7b0a1d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"69.160.160.52\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36\\\";}\"}}', 0, NULL, 1735002472, 1735002472),
(532, 'default', '{\"uuid\":\"11e1896d-cbc6-4816-be86-ce858a387c63\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"69.160.160.52\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:115:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36\\\";}\"}}', 0, NULL, 1735002473, 1735002473),
(533, 'default', '{\"uuid\":\"c063353b-f6e4-4158-83f6-62f2ca12639a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.73\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1735002693, 1735002693),
(534, 'default', '{\"uuid\":\"761b07e2-6263-4875-84b8-7163661ec652\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.152.52.62\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"curl\\/7.61.1\\\";}\"}}', 0, NULL, 1735006493, 1735006493),
(535, 'default', '{\"uuid\":\"a7fbce92-5795-4367-aa78-998160bfa47e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:9:\\\"127.0.0.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1744826442, 1744826442),
(536, 'default', '{\"uuid\":\"b8be6755-ac47-4233-90d3-20840303adf3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:9:\\\"127.0.0.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.0 Safari\\/605.1.15\\\";}\"}}', 0, NULL, 1744826486, 1744826486),
(537, 'default', '{\"uuid\":\"b58abf92-a302-497f-8e2f-1189880e973a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:9:\\\"127.0.0.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1744826590, 1744826590),
(538, 'default', '{\"uuid\":\"86abecd3-dca7-4228-9616-289f01fdeb96\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:9:\\\"127.0.0.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1746155772, 1746155772),
(539, 'default', '{\"uuid\":\"9c0737a4-de23-4663-ad3a-8d0b0856c4cb\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:71;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164901, 1746164901),
(540, 'default', '{\"uuid\":\"8ede24bc-b114-4a9a-97ac-222fd03ffb97\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:72;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164903, 1746164903),
(541, 'default', '{\"uuid\":\"977d6422-629c-4fc3-a5b6-1361e2b0fb36\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:73;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164915, 1746164915),
(542, 'default', '{\"uuid\":\"d3dafd95-7c4f-45c0-9acc-a16be7f39af2\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:74;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164916, 1746164916),
(543, 'default', '{\"uuid\":\"31f689c0-4eb7-4d53-b33c-1918f36ccbdd\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:75;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164917, 1746164917),
(544, 'default', '{\"uuid\":\"3d9bdf33-b1b8-4837-aa8f-29c04afb4457\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:76;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164918, 1746164918),
(545, 'default', '{\"uuid\":\"99a731a3-3c73-43ef-af0e-e3481c0934dc\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:77;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164919, 1746164919),
(546, 'default', '{\"uuid\":\"5b5d4160-fd81-48c0-8590-17b910da11dc\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:78;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164935, 1746164935),
(547, 'default', '{\"uuid\":\"c91b2c07-0a38-4d79-b51b-92c784770e7a\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:79;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164937, 1746164937),
(548, 'default', '{\"uuid\":\"d7282acf-7a30-402c-8b3f-644c3e338137\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:80;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164938, 1746164938),
(549, 'default', '{\"uuid\":\"ac35c6da-15b9-4a3f-920c-dfc59080c0ff\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:81;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164940, 1746164940),
(550, 'default', '{\"uuid\":\"68effaa3-a321-479b-8726-759bf380be2b\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:82;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164941, 1746164941),
(551, 'default', '{\"uuid\":\"500b2f60-0390-48db-a02a-1a0adfcdfd14\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:83;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164942, 1746164942),
(552, 'default', '{\"uuid\":\"60f196f0-f571-409b-a387-c969fe498071\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:84;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164943, 1746164943),
(553, 'default', '{\"uuid\":\"bf0a9de1-1c45-41df-ba85-ce7dfcdf6387\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:85;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164944, 1746164944),
(554, 'default', '{\"uuid\":\"e6c427a6-872a-4c98-995e-55220de39e91\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:86;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164944, 1746164944),
(555, 'default', '{\"uuid\":\"a8453d39-6a08-4375-9529-c01d579a901f\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:87;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164945, 1746164945),
(556, 'default', '{\"uuid\":\"87fa3350-6209-4fb1-b5f4-cda9728765ab\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:88;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164946, 1746164946),
(557, 'default', '{\"uuid\":\"1bf6e77d-e6dc-4242-859f-e4d16f66658c\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:89;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164947, 1746164947),
(558, 'default', '{\"uuid\":\"bf399899-a8ec-4dcc-9f0f-dd4c3ce668b9\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:90;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746164948, 1746164948),
(559, 'default', '{\"uuid\":\"30924a4a-05e0-4b9c-b76e-00821a04ee91\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:93;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746165706, 1746165706),
(560, 'default', '{\"uuid\":\"8fddb90c-27c8-455b-9459-b7a1fbb1434b\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:94;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Jalabyeh - Dry clean\\\";s:7:\\\"name_ar\\\";s:30:\\\"جلابية - دري كلين\\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Jalabyeh - Wash & Iron\\\";s:7:\\\"name_ar\\\";s:33:\\\"جلابية - غسيل و كوي\\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746165811, 1746165811),
(561, 'default', '{\"uuid\":\"5251824d-c0d8-418b-9988-6db524400ec0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"41.42.97.113\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1746646379, 1746646379),
(562, 'default', '{\"uuid\":\"02cda7eb-cc40-49f5-9e55-8e0374c60d2f\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:95;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:6:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}i:3;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Saree - \\\";s:7:\\\"name_ar\\\";s:11:\\\"ساري - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Saree - \\\";s:7:\\\"name_ar\\\";s:11:\\\"ساري - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}i:5;a:4:{s:7:\\\"name_en\\\";s:10:\\\"T-Shirt - \\\";s:7:\\\"name_ar\\\";s:15:\\\"تيشيرت - \\\";s:5:\\\"price\\\";d:2;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1746706703, 1746706703),
(563, 'default', '{\"uuid\":\"a3421545-df26-4503-86fe-76c4055c896d\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:96;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747182996, 1747182996);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(564, 'default', '{\"uuid\":\"0e6165ce-09a8-4915-94c6-d6c8b5b0e9a5\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:97;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747183303, 1747183303),
(565, 'default', '{\"uuid\":\"2b0b73f2-18cd-4bd1-a906-b44f3f658498\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:98;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:5:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:4;}i:3;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747183481, 1747183481),
(566, 'default', '{\"uuid\":\"437aa33f-9d1d-4496-b2e0-b28034cc2b04\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:99;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747183795, 1747183795),
(567, 'default', '{\"uuid\":\"4a48d5f6-542d-426c-9dd7-389f8e998eaf\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:100;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:5:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:3;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Carpet (Per Meter) - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سجاده (بالمتر) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:4;a:4:{s:7:\\\"name_en\\\";s:27:\\\"Irani Carpet (Per Meter) - \\\";s:7:\\\"name_ar\\\";s:41:\\\"سجاده ايراني (بالمتر) - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747183905, 1747183905),
(568, 'default', '{\"uuid\":\"85c3c056-dc4a-4af3-bd61-ff10c0f13449\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:101;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:7:{i:0;a:4:{s:7:\\\"name_en\\\";s:16:\\\"Sofa (2Seats) - \\\";s:7:\\\"name_ar\\\";s:24:\\\"كنبه مقعدين - \\\";s:5:\\\"price\\\";d:125;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Carpet (Per Meter) - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سجاده (بالمتر) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:2;}i:5;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Salwar Three Pieces - \\\";s:7:\\\"name_ar\\\";s:24:\\\"سالوار 3 قطع - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:2;}i:6;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Salwar Three Pieces - \\\";s:7:\\\"name_ar\\\";s:24:\\\"سالوار 3 قطع - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747184131, 1747184131),
(569, 'default', '{\"uuid\":\"49a85808-ba9d-4824-833d-4e9ce10e68c4\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:102;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:8:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:5;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:18:\\\"Plated Trousers - \\\";s:7:\\\"name_ar\\\";s:22:\\\"بنطال قماش - \\\";s:5:\\\"price\\\";d:4;s:8:\\\"quantity\\\";i:3;}i:5;a:4:{s:7:\\\"name_en\\\";s:14:\\\"Lungi\\/Wizar - \\\";s:7:\\\"name_ar\\\";s:13:\\\"لونجي - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}i:6;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Jogger - \\\";s:7:\\\"name_ar\\\";s:20:\\\"سروال قطن - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}i:7;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Jogger - \\\";s:7:\\\"name_ar\\\";s:20:\\\"سروال قطن - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747184261, 1747184261),
(570, 'default', '{\"uuid\":\"46f8fcda-7c82-44be-a0db-54d3e1179222\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:103;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Double) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (زوجي) - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Double) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (زوجي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Double) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (زوجي) - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747893525, 1747893525),
(571, 'default', '{\"uuid\":\"f43fdf00-158c-4046-8fce-e869c6762e18\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:104;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747893746, 1747893746),
(572, 'default', '{\"uuid\":\"9eadfcb1-4891-4445-8e11-7c7172a7a1f5\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:105;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747893766, 1747893766),
(573, 'default', '{\"uuid\":\"1273c31a-0726-4d40-ae9d-4273a78399aa\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:106;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747893919, 1747893919),
(574, 'default', '{\"uuid\":\"aa20a1e9-ba1f-4c08-b350-a992a85c53b3\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:107;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747894035, 1747894035),
(575, 'default', '{\"uuid\":\"bb6d15d4-1648-48b6-a479-a2274fd5555c\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:108;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747894579, 1747894579),
(576, 'default', '{\"uuid\":\"80d525b2-75af-43dd-bbf1-2ea4b6bd8ce9\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:109;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1747894649, 1747894649),
(577, 'default', '{\"uuid\":\"df5b2423-3111-469e-8472-206e80517484\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:110;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1748975198, 1748975198),
(578, 'default', '{\"uuid\":\"23732feb-48f0-4e2f-861d-971ddfda40a8\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:111;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Single) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (فردي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Bed Sheet (King) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (كبير) - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:4;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1748975253, 1748975253),
(579, 'default', '{\"uuid\":\"f53c3ba9-0eb7-4079-9592-c99b6088458a\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:112;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1748975267, 1748975267),
(580, 'default', '{\"uuid\":\"6f3d8ff8-15ed-4a7b-a08e-3c9696873279\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:113;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:6:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Jeans - \\\";s:7:\\\"name_ar\\\";s:22:\\\"بنطال جينز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Jeans - \\\";s:7:\\\"name_ar\\\";s:22:\\\"بنطال جينز - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:5;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1748975292, 1748975292),
(581, 'default', '{\"uuid\":\"3c1d7c4d-3dc0-4a8f-af82-d49868ea73cd\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:114;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1748975509, 1748975509),
(582, 'default', '{\"uuid\":\"926d8274-d54b-47c4-9aad-859d6b9f9b93\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:115;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:3;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1748980799, 1748980799),
(583, 'default', '{\"uuid\":\"04f2a41f-74c9-47a8-8460-26d77b253b57\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:116;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:32:\\\"Blackout Curtains (Per Meter) - \\\";s:7:\\\"name_ar\\\";s:39:\\\"ستاره حاجبه (بالمتر) - \\\";s:5:\\\"price\\\";d:25;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749017177, 1749017177),
(584, 'default', '{\"uuid\":\"c209e986-b846-45fa-b99c-a2fe6565f194\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:117;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:28:\\\"mahmoud.helal01234@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749042335, 1749042335),
(585, 'default', '{\"uuid\":\"f4683457-875e-4c1b-84b5-d370dde29670\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:118;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749230076, 1749230076),
(586, 'default', '{\"uuid\":\"0376f414-7118-4121-b6df-61849dd04e50\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:119;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749230567, 1749230567),
(587, 'default', '{\"uuid\":\"46b923f9-e083-4c0a-b3cb-72cac5ad598a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749268757, 1749268757),
(588, 'default', '{\"uuid\":\"f9e1ef42-7b33-48d3-b4e6-81d7e81c2639\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.57.180.151\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1749273637, 1749273637),
(589, 'default', '{\"uuid\":\"209c594b-dcbc-4ce8-a550-29c9b7c33775\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749274547, 1749274547),
(590, 'default', '{\"uuid\":\"4cf22e9f-6116-460d-b386-954da108dbcb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"206.168.34.205\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:70:\\\"Mozilla\\/5.0 (compatible; CensysInspect\\/1.1; +https:\\/\\/about.censys.io\\/)\\\";}\"}}', 0, NULL, 1749280927, 1749280927),
(591, 'default', '{\"uuid\":\"9c78964f-fb79-4e43-a4bd-5dd784241a8e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a0c:f040:0:2790::5e\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749282650, 1749282650),
(592, 'default', '{\"uuid\":\"7eccf22a-ac8d-4821-ae10-4d3aa487d25c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.232.194.190\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749282766, 1749282766),
(593, 'default', '{\"uuid\":\"c71ddc59-7f76-4d85-a15b-ad75ee88745b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"154.210.110.158\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749282780, 1749282780),
(594, 'default', '{\"uuid\":\"e57740c0-42e2-441f-aa30-43b80a5fe691\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"206.189.247.132\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749282889, 1749282889),
(595, 'default', '{\"uuid\":\"62effd22-1814-430b-99ee-406ed99d735a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"77.48.28.237\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Safari\\/537.36 Edg\\/132.0.0.0\\\";}\"}}', 0, NULL, 1749282890, 1749282890),
(596, 'default', '{\"uuid\":\"e2e9e994-020a-4fde-8b11-92115299410a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:27:\\\"2604:a880:400:d0::1df1:4001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36 Edg\\/130.0.0.0\\\";}\"}}', 0, NULL, 1749282890, 1749282890);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(597, 'default', '{\"uuid\":\"925c2e73-5c36-48c0-a380-f5aea928a04b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"179.61.197.21\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749283209, 1749283209),
(598, 'default', '{\"uuid\":\"a5860136-03df-4c1b-a86e-8ce4f7daf474\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:10:\\\"2.56.72.45\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:144:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/123.0.6312.52 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749283300, 1749283300),
(599, 'default', '{\"uuid\":\"e9fcc910-9c87-4ae4-9e04-eaf0a9a52967\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"188.245.193.111\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/122.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749283383, 1749283383),
(600, 'default', '{\"uuid\":\"0c696b3a-953b-4cd8-9528-52b4a4529e1e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:27:\\\"2604:a880:400:d0::1df1:4001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749283460, 1749283460),
(601, 'default', '{\"uuid\":\"12479beb-9d61-499b-8918-7a83739a8b53\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"124.209.68.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:147:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_1_2 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.1 Mobile\\/15E148 Safari\\/604.1 OPT\\/3.4.0\\\";}\"}}', 0, NULL, 1749283657, 1749283657),
(602, 'default', '{\"uuid\":\"9420ccf8-e63e-4044-ac7d-92434c3fd2b9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"124.209.68.27\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:147:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_1_2 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.1 Mobile\\/15E148 Safari\\/604.1 OPT\\/3.4.0\\\";}\"}}', 0, NULL, 1749283658, 1749283658),
(603, 'default', '{\"uuid\":\"c62564f7-05ed-448a-9513-791465473501\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"138.68.166.157\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:127:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/42.0.2311.135 Safari\\/537.36 Edge\\/12.246\\\";}\"}}', 0, NULL, 1749283685, 1749283685),
(604, 'default', '{\"uuid\":\"d50f1450-2812-497d-98ff-8a513e019cb7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"54.174.109.174\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:12:\\\"okhttp\\/4.9.2\\\";}\"}}', 0, NULL, 1749283754, 1749283754),
(605, 'default', '{\"uuid\":\"3c587bc3-5e50-4b60-b028-ef6721078a2d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"40.80.158.10\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/133.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749283760, 1749283760),
(606, 'default', '{\"uuid\":\"1918cbe6-b6ca-4e90-89b0-c1b7a973aa1f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:268:d20a:9112:20c:29ff:fe08:34c8\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749284016, 1749284016),
(607, 'default', '{\"uuid\":\"4e14f46e-c0b2-45ed-b577-75048991b6ce\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:37:\\\"2001:268:d20a:9112:20c:29ff:fe08:34c8\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749284017, 1749284017),
(608, 'default', '{\"uuid\":\"df627a83-c99c-474e-b06f-c0a02976f448\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"185.214.196.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749284963, 1749284963),
(609, 'default', '{\"uuid\":\"cec46a08-4ab7-4dcc-86ce-ebffa37a6c63\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"49.109.102.29\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/118.0.5993.69 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749285647, 1749285647),
(610, 'default', '{\"uuid\":\"d9a02355-5547-4a05-8ee1-3bce508bd4f7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"106.154.145.157\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:142:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/118.0.5993.69 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749285648, 1749285648),
(611, 'default', '{\"uuid\":\"6d8e5516-97f3-4d77-88ca-0c452a562f89\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"164.138.217.83\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\\\";}\"}}', 0, NULL, 1749286418, 1749286418),
(612, 'default', '{\"uuid\":\"3f1b9a7b-cadd-4b64-bc12-37054f372e83\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"65.130.1.114\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\\\";}\"}}', 0, NULL, 1749286420, 1749286420),
(613, 'default', '{\"uuid\":\"80563452-2913-4da3-a2a7-6097848b61f3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"146.70.176.254\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Safari\\/537.36 Edg\\/132.0.0.0\\\";}\"}}', 0, NULL, 1749286930, 1749286930),
(614, 'default', '{\"uuid\":\"8ae52c4e-2a13-4c74-ae60-16452e3ac885\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"81.151.176.229\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749286930, 1749286930),
(615, 'default', '{\"uuid\":\"cb79f5e4-f2e3-4e67-a98d-b42e9929217b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:24:\\\"2a03:b0c0:1:d0::e2b:d001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\\\";}\"}}', 0, NULL, 1749286930, 1749286930),
(616, 'default', '{\"uuid\":\"b4a35415-617e-48e4-8d6f-2a09af9df010\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"45.133.172.216\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749286930, 1749286930),
(617, 'default', '{\"uuid\":\"47cc6048-1f00-4b69-b731-9a8aa34238a3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"206.217.139.204\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749286930, 1749286930),
(618, 'default', '{\"uuid\":\"9146559a-7da4-4263-97ff-24c569af9cba\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:35:\\\"2a02:25b0:aaaa:aaaa:305f:22d2:9ca:0\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\\\";}\"}}', 0, NULL, 1749286930, 1749286930),
(619, 'default', '{\"uuid\":\"131214b9-ebc6-49e4-b8e0-bdb2ea1e4774\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:27:\\\"2604:a880:400:d0::1df1:4001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36 Edg\\/129.0.0.0\\\";}\"}}', 0, NULL, 1749286931, 1749286931),
(620, 'default', '{\"uuid\":\"4e0a27bb-fac6-49be-93de-9a2b3dbb4138\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"103.77.234.215\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749286932, 1749286932),
(621, 'default', '{\"uuid\":\"eec7ba84-3878-461b-a740-27d00c034c1c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"81.151.176.229\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749287110, 1749287110),
(622, 'default', '{\"uuid\":\"c6b0e39b-4a66-4d67-8401-d6f372577237\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"45.133.172.216\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.1.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749287192, 1749287192),
(623, 'default', '{\"uuid\":\"7b3c2479-20c3-4b7a-bd7a-c8d3b4325c60\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"212.143.94.254\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:114:\\\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/111.0.5563.65 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749287580, 1749287580),
(624, 'default', '{\"uuid\":\"e89a37fa-fd58-4498-a940-8a055e0befc3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"212.143.94.254\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:109:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) HeadlessChrome\\/122.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749287583, 1749287583),
(625, 'default', '{\"uuid\":\"50207c7e-51bb-42c7-a928-8bd1c8ab185b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"183.77.219.2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:141:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/83.0.4103.88 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749287948, 1749287948),
(626, 'default', '{\"uuid\":\"3f4b9c8c-644e-4d33-881c-f10ffc334483\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"183.77.219.2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:141:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) CriOS\\/83.0.4103.88 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749287950, 1749287950),
(627, 'default', '{\"uuid\":\"326f6312-aae7-4368-96ac-dccf746cd824\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"46.161.50.108\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/104.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749287955, 1749287955),
(628, 'default', '{\"uuid\":\"403e58e4-ee1d-40fe-b8b9-1322294015ab\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"27.93.34.18\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749290717, 1749290717),
(629, 'default', '{\"uuid\":\"486456f7-e79c-4324-9c1d-bb9d6ac1fabc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"27.93.34.18\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/16.6 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749290718, 1749290718),
(630, 'default', '{\"uuid\":\"fd83b671-1d2d-48cc-a55e-289b0465ef13\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.224.65.219\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749291558, 1749291558),
(631, 'default', '{\"uuid\":\"d16e84a1-8165-4598-b15b-48f4305e571f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749295485, 1749295485),
(632, 'default', '{\"uuid\":\"a061393f-a4ed-48fa-9057-4240871f18d4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"185.102.112.127\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:108:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/45.0.2454.85 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749307767, 1749307767),
(633, 'default', '{\"uuid\":\"c6b63dcf-0cf2-4760-9e5a-d2492e122755\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"185.102.112.127\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:108:\\\"Mozilla\\/5.0 (Windows NT 6.1; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/45.0.2454.85 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749307769, 1749307769),
(634, 'default', '{\"uuid\":\"835be694-17bd-4c7d-86ff-8bcf8933e5da\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749322155, 1749322155),
(635, 'default', '{\"uuid\":\"d6f2c167-16e7-4564-ac48-898da28ecc60\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"137.184.3.217\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"vercel-screenshot\\/1.0\\\";}\"}}', 0, NULL, 1749350722, 1749350722),
(636, 'default', '{\"uuid\":\"11d59ab6-f871-40cd-9f86-3956a4a5b91b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"64.23.208.67\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"vercel-screenshot\\/1.0\\\";}\"}}', 0, NULL, 1749350723, 1749350723),
(637, 'default', '{\"uuid\":\"71e70536-d1ff-4091-9599-2bf8ff18083d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749373298, 1749373298),
(638, 'default', '{\"uuid\":\"dceb4517-4979-44a9-84cf-b8269ab6042b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749374110, 1749374110),
(639, 'default', '{\"uuid\":\"d23f6576-331f-4206-be79-5a1a37fd851a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749379166, 1749379166),
(640, 'default', '{\"uuid\":\"5a769a53-25b8-4cd9-aea8-429ffea85b62\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749389098, 1749389098),
(641, 'default', '{\"uuid\":\"946f8014-77d3-4aaf-a4ba-82a661b6430b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"43.156.168.214\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749401885, 1749401885),
(642, 'default', '{\"uuid\":\"570984c8-ec66-4f71-ba5a-fd2e3884aaab\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"196.128.141.49\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749405294, 1749405294),
(643, 'default', '{\"uuid\":\"126c06f5-f77e-4d45-adbe-5554b071975e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"196.128.141.49\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749405301, 1749405301),
(644, 'default', '{\"uuid\":\"50cda436-3bf8-4251-84d2-d9700ad244d4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.183.15\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749431745, 1749431745),
(645, 'default', '{\"uuid\":\"8991b69e-9f0e-442a-b06c-321f02f62786\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.87.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.7049.114 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749434570, 1749434570),
(646, 'default', '{\"uuid\":\"7264c2ac-e01f-4b5d-94c5-18dea04ca9e3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.87.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.7049.114 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749434578, 1749434578),
(647, 'default', '{\"uuid\":\"a54e4284-df14-4aa5-bb05-44956e43506c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.87.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.7049.114 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1749434589, 1749434589),
(648, 'default', '{\"uuid\":\"59f30a15-33a8-4ba9-89a6-65c39a87e491\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749437856, 1749437856),
(649, 'default', '{\"uuid\":\"f29607cd-b3a4-4e63-a82f-5ebc93f61b6b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.254.91.173\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1749449047, 1749449047),
(650, 'default', '{\"uuid\":\"00353a3c-7ac7-4280-a792-1793703119e7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749456359, 1749456359),
(651, 'default', '{\"uuid\":\"28fb8cb3-877d-40ca-8541-682f7166983f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749458789, 1749458789),
(652, 'default', '{\"uuid\":\"67abd226-4121-4207-8af3-76d263ff43a0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749477654, 1749477654),
(653, 'default', '{\"uuid\":\"43f7a573-1b5a-419a-956b-5389db883464\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.78.111.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1749483614, 1749483614),
(654, 'default', '{\"uuid\":\"4cac4462-471d-415f-a59f-6633f9fc9af9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"167.99.186.73\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749521543, 1749521543),
(655, 'default', '{\"uuid\":\"15ef2b38-294f-4fbf-b3c1-a29bcef68b79\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749526015, 1749526015),
(656, 'default', '{\"uuid\":\"0768b294-eda1-4d86-a948-e6e25f98cdd5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749534806, 1749534806),
(657, 'default', '{\"uuid\":\"52d57a1a-31fe-46c6-b211-ffbfd8db2b7e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749536617, 1749536617),
(658, 'default', '{\"uuid\":\"5bb79e17-d41e-4df7-ba40-52f3a2e92327\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749562028, 1749562028),
(659, 'default', '{\"uuid\":\"be61f8e6-cd53-4f65-853d-21109a6b8d74\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.49\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1749579714, 1749579714),
(660, 'default', '{\"uuid\":\"a8078a7c-6435-42fe-87be-eec2dbf338bc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.246.219.91\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1749579933, 1749579933),
(661, 'default', '{\"uuid\":\"acc31990-2b3b-427d-ae80-2b6d905bf0cb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.49\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1749583601, 1749583601),
(662, 'default', '{\"uuid\":\"f6b082b1-9c74-4542-a733-2a7ac2123f7f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749607906, 1749607906),
(663, 'default', '{\"uuid\":\"439c0dd5-5d5f-45c7-a4bd-474e427e2b27\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"63.178.24.191\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:105:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/44.0.2403.157 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749636302, 1749636302),
(664, 'default', '{\"uuid\":\"b14c5dc9-36ba-426c-9ee5-7b287de982fe\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749645226, 1749645226),
(665, 'default', '{\"uuid\":\"7d4b7650-3cb6-4831-a288-2ce353dbd7d7\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:120;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:5:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}i:3;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749657357, 1749657357);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(666, 'default', '{\"uuid\":\"ccb3379a-7a9e-4394-96be-80f242bc897b\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:121;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749657455, 1749657455),
(667, 'default', '{\"uuid\":\"dae82398-7a14-46f7-baab-31898527a9aa\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:122;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Double) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (زوجي) - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Double) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (زوجي) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:21:\\\"Bed Sheet (Double) - \\\";s:7:\\\"name_ar\\\";s:33:\\\"ملايه سرير (زوجي) - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749657846, 1749657846),
(668, 'default', '{\"uuid\":\"32c194ee-1d45-4089-98c3-659b6281860b\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:123;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749657960, 1749657960),
(669, 'default', '{\"uuid\":\"29a4e6d0-98ba-4712-89ac-37d7ec77fd82\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:124;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749658077, 1749658077),
(670, 'default', '{\"uuid\":\"274d4b58-1b2d-41ff-b5fa-b986a180638e\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:125;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749658147, 1749658147),
(671, 'default', '{\"uuid\":\"0ba86b45-99f6-4c4f-a701-a395d0db15cd\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:126;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749658386, 1749658386),
(672, 'default', '{\"uuid\":\"fda5bdc1-628b-40e4-af82-456de8a35281\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:127;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749659165, 1749659165),
(673, 'default', '{\"uuid\":\"54229c23-c123-435b-b1a5-2f43ca1b4b6a\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:128;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749659307, 1749659307),
(674, 'default', '{\"uuid\":\"d5c9e268-e25f-4a63-a9ce-79341b907d05\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:129;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:3;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749659550, 1749659550),
(675, 'default', '{\"uuid\":\"cedf0a6e-cf62-4b97-a35e-98298dd0076e\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:130;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:3;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749659639, 1749659639),
(676, 'default', '{\"uuid\":\"c992e5de-737e-4c30-8393-726ce225a858\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:131;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749659877, 1749659877),
(677, 'default', '{\"uuid\":\"a453b817-fd80-4453-b4ac-0b6cbfd232cb\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:132;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:5:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:4;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:3;}i:3;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:4;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749660062, 1749660062),
(678, 'default', '{\"uuid\":\"c5999bb4-4a86-4b78-8c05-c7efb2b70377\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:133;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:6:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:4;s:8:\\\"quantity\\\";i:1;}i:5;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:13;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749660483, 1749660483),
(679, 'default', '{\"uuid\":\"65691d91-da1f-455a-ad45-cb9771a73e19\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"44.242.162.116\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:73:\\\"Mozilla\\/5.0 (compatible; wpbot\\/1.3; +https:\\/\\/forms.gle\\/ajBaxygz9jSR8p8G9)\\\";}\"}}', 0, NULL, 1749701480, 1749701480),
(680, 'default', '{\"uuid\":\"fabf4ea6-52ae-4d4f-b46f-7033d8e6cf1b\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:134;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749719082, 1749719082),
(681, 'default', '{\"uuid\":\"418416ed-8512-461b-a01e-61e554d51620\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749724028, 1749724028),
(682, 'default', '{\"uuid\":\"3a038d82-53ed-4e5f-96cb-42fdbd31548e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.156.156.96\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749726106, 1749726106),
(683, 'default', '{\"uuid\":\"73365f8c-ef2f-4b61-aa04-87308feade46\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:135;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:2:{i:0;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:5;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749731467, 1749731467),
(684, 'default', '{\"uuid\":\"c7611815-1efc-480f-b316-6c6d63ecb0bf\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:136;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:5;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749731534, 1749731534),
(685, 'default', '{\"uuid\":\"e5f3b6cc-38e5-4dc8-a5fc-e7b338f89087\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:137;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:1:{i:0;a:4:{s:7:\\\"name_en\\\";s:12:\\\"Kid Duvet - \\\";s:7:\\\"name_ar\\\";s:22:\\\"لحاف اطفال - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749731588, 1749731588),
(686, 'default', '{\"uuid\":\"031980ea-e87c-4bc1-bb31-c9c1cb8c6705\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:138;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749731616, 1749731616),
(687, 'default', '{\"uuid\":\"f59bdb4c-b6dd-4a63-89a5-94752534d535\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749738242, 1749738242),
(688, 'default', '{\"uuid\":\"2d20b2a8-2767-49dd-bb73-a3679791054d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.167.157.80\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749752501, 1749752501),
(689, 'default', '{\"uuid\":\"a132d1a1-f579-40a6-acf1-9c465c601a9c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.54\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1749784570, 1749784570),
(690, 'default', '{\"uuid\":\"c34df5db-cebb-4535-b58a-3b433412410e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.54\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1749784586, 1749784586),
(691, 'default', '{\"uuid\":\"39e7bf7b-146f-4de8-bc8d-98b810d4ddf1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749791644, 1749791644),
(692, 'default', '{\"uuid\":\"3ac7c1d6-8792-4ae3-9e01-0bbe4b3379b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"170.106.107.87\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749815048, 1749815048),
(693, 'default', '{\"uuid\":\"3d742939-541e-43ac-b0ea-fe25eb4771ec\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749820951, 1749820951),
(694, 'default', '{\"uuid\":\"eec74ded-96d6-4cb4-be3e-91538d59ec58\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.19.216\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749833465, 1749833465),
(695, 'default', '{\"uuid\":\"f0dcbc14-6e74-402d-8adf-e9d77b263b45\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.19.216\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749833474, 1749833474),
(696, 'default', '{\"uuid\":\"9dc921fa-b7c2-41b9-bcc2-02e40bd0242f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.190.19.216\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1749833484, 1749833484),
(697, 'default', '{\"uuid\":\"533415b0-bc10-48bb-a5f1-22e0512df9dc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"163.47.21.21\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36 Edg\\/129.0.0.0\\\";}\"}}', 0, NULL, 1749839323, 1749839323),
(698, 'default', '{\"uuid\":\"87499e19-dd09-437e-ac85-f1bddde8d88a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"106.161.65.206\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/131.0.0.0 Safari\\/537.36 Edg\\/131.0.0.0\\\";}\"}}', 0, NULL, 1749839324, 1749839324),
(699, 'default', '{\"uuid\":\"6997f8f9-1893-461c-94ad-124dac387750\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"103.108.92.93\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Safari\\/537.36 Edg\\/132.0.0.0\\\";}\"}}', 0, NULL, 1749839325, 1749839325),
(700, 'default', '{\"uuid\":\"026e0b5b-cc87-4c48-9299-e30041b6f35e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"103.77.234.221\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36 Edg\\/130.0.0.0\\\";}\"}}', 0, NULL, 1749839326, 1749839326),
(701, 'default', '{\"uuid\":\"09332d0c-cb5e-46fa-8559-6085a637d211\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749863938, 1749863938),
(702, 'default', '{\"uuid\":\"5c5050e1-dc3a-428e-8264-0e4a0c8bbbdb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.130.60.195\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749868754, 1749868754),
(703, 'default', '{\"uuid\":\"e5167353-1726-4097-886f-3d7c3479b5ed\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749891011, 1749891011),
(704, 'default', '{\"uuid\":\"715427cb-bb1d-4c13-8d0c-b10934892fb6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.131.36.84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1749917384, 1749917384),
(705, 'default', '{\"uuid\":\"f2450b82-e2b0-4613-bc98-590592f7f378\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:139;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:15:\\\"Sleeping Bag - \\\";s:7:\\\"name_ar\\\";s:20:\\\"كيس النوم - \\\";s:5:\\\"price\\\";d:40;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:32:\\\"Tablecloth Ornate (Per Meter) - \\\";s:7:\\\"name_ar\\\";s:52:\\\"مفرش ترابيزه مزغرف (بالمتر) - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749938449, 1749938449);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(706, 'default', '{\"uuid\":\"d60e46b6-8bdd-4554-b4be-f6b95e6f130c\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:140;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:5:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749938547, 1749938547),
(707, 'default', '{\"uuid\":\"0db8cd5d-59fc-465f-b0ab-a5f135e47d5e\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:141;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:4:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Kurta - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كورتا - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:2;}i:1;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Salwar Three Pieces - \\\";s:7:\\\"name_ar\\\";s:24:\\\"سالوار 3 قطع - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:2;}i:3;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Jeans - \\\";s:7:\\\"name_ar\\\";s:22:\\\"بنطال جينز - \\\";s:5:\\\"price\\\";d:7;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749938775, 1749938775),
(708, 'default', '{\"uuid\":\"3e46202c-c35c-48a9-98c1-b4b2afcebe06\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:142;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:3:{i:0;a:4:{s:7:\\\"name_en\\\";s:15:\\\"Casual Dress - \\\";s:7:\\\"name_ar\\\";s:13:\\\"فستان - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:5;}i:1;a:4:{s:7:\\\"name_en\\\";s:15:\\\"Casual Dress - \\\";s:7:\\\"name_ar\\\";s:13:\\\"فستان - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:14:\\\"Fancy Dress - \\\";s:7:\\\"name_ar\\\";s:28:\\\"فستان مناسبات - \\\";s:5:\\\"price\\\";d:40;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749938824, 1749938824),
(709, 'default', '{\"uuid\":\"939b2d9d-17c7-4400-8431-ad5a8889fe31\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:143;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:4:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:3;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:8;s:8:\\\"quantity\\\";i:3;}i:2;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:4;s:8:\\\"quantity\\\";i:3;}i:3;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:13;s:8:\\\"quantity\\\";i:3;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749939132, 1749939132),
(710, 'default', '{\"uuid\":\"e669aa73-c191-4bc9-8794-5f37570306fe\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:144;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:6:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:15;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Kameez - \\\";s:7:\\\"name_ar\\\";s:13:\\\"كاميز - \\\";s:5:\\\"price\\\";d:4;s:8:\\\"quantity\\\";i:2;}i:3;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:13;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:15:\\\"Jeans Jacket - \\\";s:7:\\\"name_ar\\\";s:20:\\\"ستره جينز - \\\";s:5:\\\"price\\\";d:13;s:8:\\\"quantity\\\";i:1;}i:5;a:4:{s:7:\\\"name_en\\\";s:9:\\\"Jacket - \\\";s:7:\\\"name_ar\\\";s:11:\\\"جاكت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749939188, 1749939188),
(711, 'default', '{\"uuid\":\"12a94fad-3c25-46e3-9147-fd5c61c25160\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:145;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:4:{i:0;a:4:{s:7:\\\"name_en\\\";s:8:\\\"Besht - \\\";s:7:\\\"name_ar\\\";s:11:\\\"بيشت - \\\";s:5:\\\"price\\\";d:20;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:13;s:8:\\\"quantity\\\";i:1;}i:2;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:19:\\\"Shirt\\/Polo Shirt - \\\";s:7:\\\"name_ar\\\";s:13:\\\"تيشرت - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749940081, 1749940081),
(712, 'default', '{\"uuid\":\"069b6325-9322-46d5-a094-b839ca32642c\",\"displayName\":\"App\\\\Mail\\\\NewOrderNotification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:29:\\\"App\\\\Mail\\\\NewOrderNotification\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:146;s:9:\\\"relations\\\";a:1:{i:0;s:6:\\\"client\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"items\\\";a:5:{i:0;a:4:{s:7:\\\"name_en\\\";s:10:\\\"Kandura - \\\";s:7:\\\"name_ar\\\";s:9:\\\"ثوب - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:1;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:13;s:8:\\\"quantity\\\";i:2;}i:2;a:4:{s:7:\\\"name_en\\\";s:20:\\\"Salwar Two-Pieces - \\\";s:7:\\\"name_ar\\\";s:28:\\\"سالوار قطعتين - \\\";s:5:\\\"price\\\";d:10;s:8:\\\"quantity\\\";i:1;}i:3;a:4:{s:7:\\\"name_en\\\";s:22:\\\"Salwar Three Pieces - \\\";s:7:\\\"name_ar\\\";s:24:\\\"سالوار 3 قطع - \\\";s:5:\\\"price\\\";d:12;s:8:\\\"quantity\\\";i:1;}i:4;a:4:{s:7:\\\"name_en\\\";s:18:\\\"Plated Trousers - \\\";s:7:\\\"name_ar\\\";s:22:\\\"بنطال قماش - \\\";s:5:\\\"price\\\";d:6;s:8:\\\"quantity\\\";i:2;}}s:13:\\\"discountValue\\\";i:0;s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"aquacarelaundry@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1749940964, 1749940964),
(713, 'default', '{\"uuid\":\"3f4170bb-bfd6-4257-9f07-216ea41856dd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"24.199.102.93\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"vercel-screenshot\\/1.0\\\";}\"}}', 0, NULL, 1749941224, 1749941224),
(714, 'default', '{\"uuid\":\"cbb4519b-6cd8-4a71-9040-8775a7c5c7b5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"64.23.158.209\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"vercel-screenshot\\/1.0\\\";}\"}}', 0, NULL, 1749941224, 1749941224),
(715, 'default', '{\"uuid\":\"2f56a61e-07cd-4994-a117-b007ce77575a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749963670, 1749963670),
(716, 'default', '{\"uuid\":\"1c8b2092-c5be-4a60-b6b1-a7ae275f4037\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1749991377, 1749991377),
(717, 'default', '{\"uuid\":\"2f5e0267-f7a9-46bf-b6b9-dfd299f3e277\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750044446, 1750044446),
(718, 'default', '{\"uuid\":\"71cdec30-1a04-47eb-a161-123bc68cf974\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750061161, 1750061161),
(719, 'default', '{\"uuid\":\"7f314330-6858-4e99-a7ea-558db104c3af\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750152151, 1750152151),
(720, 'default', '{\"uuid\":\"88948ab4-c5ce-40a9-9cfa-3bddf8805867\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750160132, 1750160132),
(721, 'default', '{\"uuid\":\"4f33794b-ff26-47b9-8724-2d0540034f1f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:16:\\\"2a0b:4142:d4b::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1750189254, 1750189254),
(722, 'default', '{\"uuid\":\"b71fe289-f402-4ec0-887c-f917e3fb1917\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750217660, 1750217660),
(723, 'default', '{\"uuid\":\"6290899a-80e1-476d-8361-64b196aa5476\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"134.209.177.25\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1750236012, 1750236012),
(724, 'default', '{\"uuid\":\"a6a2abe3-fb60-4c2f-9387-58cbdf8e7fcb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750239003, 1750239003),
(725, 'default', '{\"uuid\":\"e17404b0-619c-44fe-bf95-01b533306cb1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750304345, 1750304345),
(726, 'default', '{\"uuid\":\"d6c4aa5a-1c97-4fcb-9233-37951e72c43d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750344102, 1750344102),
(727, 'default', '{\"uuid\":\"45aac3f5-79ca-44be-bee6-22337293a218\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750400751, 1750400751),
(728, 'default', '{\"uuid\":\"a5c7b5f3-77d2-4a5e-95b2-531eab555e2a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750424212, 1750424212),
(729, 'default', '{\"uuid\":\"e89a2bc9-790c-4d6c-80c2-3bbf37b141a1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750503622, 1750503622),
(730, 'default', '{\"uuid\":\"94422519-95b2-484a-8735-78f5ec46591b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750512335, 1750512335),
(731, 'default', '{\"uuid\":\"9892fdeb-bb2b-454a-840d-69314e49852c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750571140, 1750571140),
(732, 'default', '{\"uuid\":\"ebade148-1474-4b41-a5a8-0e10ba11d7f8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750585132, 1750585132),
(733, 'default', '{\"uuid\":\"78ffe6cb-f19e-48d9-b69f-0bb9d35b6c71\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"138.197.44.39\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.2 Safari\\/605.1.15\\\";}\"}}', 0, NULL, 1750623483, 1750623483),
(734, 'default', '{\"uuid\":\"76b9c87c-a321-4dee-8585-082dc112ea14\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"129.226.174.80\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1750644889, 1750644889),
(735, 'default', '{\"uuid\":\"6d72faf0-6166-4b99-8622-f8a87f66bae9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750647380, 1750647380),
(736, 'default', '{\"uuid\":\"650f8356-1a6d-46da-8b51-a3cf64894a62\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"104.236.51.40\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:84:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:135.0) Gecko\\/20100101 Firefox\\/135.0\\\";}\"}}', 0, NULL, 1750652151, 1750652151),
(737, 'default', '{\"uuid\":\"ac31b7b4-d5ec-454b-9113-24c04dbc9492\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"138.197.39.78\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1750667013, 1750667013),
(738, 'default', '{\"uuid\":\"08675633-e775-4d31-94d2-0a54f1bd1ab7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.131.190.221\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1750667776, 1750667776),
(739, 'default', '{\"uuid\":\"8d8fca18-6271-447c-906e-be7e534eea49\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"157.245.211.241\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/129.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1750669402, 1750669402),
(740, 'default', '{\"uuid\":\"05106fab-9a19-4260-aa6b-d2c4895de177\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750684353, 1750684353),
(741, 'default', '{\"uuid\":\"69eab708-a612-47dd-b9ca-bbfbc81382b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750748587, 1750748587),
(742, 'default', '{\"uuid\":\"02ae6f3c-a5c8-4c32-acf0-c3469c054677\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750761550, 1750761550),
(743, 'default', '{\"uuid\":\"4dfae343-3151-4d8e-9d14-8a478c4af84a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750817141, 1750817141),
(744, 'default', '{\"uuid\":\"8f7d0855-4c3a-492e-a1ff-ce155aad7595\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"46.17.174.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:82:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko\\/20100101 Firefox\\/98.0\\\";}\"}}', 0, NULL, 1750843305, 1750843305),
(745, 'default', '{\"uuid\":\"46c00fbc-4179-4a57-bcc6-255494eb76b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750857059, 1750857059),
(746, 'default', '{\"uuid\":\"67a3cd73-07e6-4bc2-824c-dddcae3d960e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750900387, 1750900387),
(747, 'default', '{\"uuid\":\"ed0171fb-7958-4623-90e4-7f1a6667691e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1750923288, 1750923288),
(748, 'default', '{\"uuid\":\"ff31edb4-ebad-45b0-b420-b628be0ca579\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751005360, 1751005360),
(749, 'default', '{\"uuid\":\"405840f2-b6be-4b5d-84ef-ae701ddcb73c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751029218, 1751029218),
(750, 'default', '{\"uuid\":\"f61f4e06-1058-42a4-ac92-4138c429e72e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751093842, 1751093842),
(751, 'default', '{\"uuid\":\"40540cfa-8a86-429c-8242-fae03d75105a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751095519, 1751095519),
(752, 'default', '{\"uuid\":\"a6378d71-5519-4326-bba2-583ddfccb3b4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751165648, 1751165648),
(753, 'default', '{\"uuid\":\"54cf5938-3890-4f6c-96c3-28f8701169af\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751190963, 1751190963),
(754, 'default', '{\"uuid\":\"bf0995a7-d51f-469f-beb2-74b255feefa8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.186.213.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1751229909, 1751229909),
(755, 'default', '{\"uuid\":\"fabf8983-afde-46f3-94fd-4a8fab81c9cc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.186.213.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1751229913, 1751229913),
(756, 'default', '{\"uuid\":\"c3d375cf-ccb5-43d5-981d-9af9116271f2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.186.213.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1751229914, 1751229914),
(757, 'default', '{\"uuid\":\"cfd0c2b0-d8c4-45cb-8d4f-39df2723289c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.186.213.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1751229924, 1751229924),
(758, 'default', '{\"uuid\":\"67fb5e3a-6646-4fe3-937b-1d7c899a5dc4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"102.186.213.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"WhatsApp\\/2.23.20.0\\\";}\"}}', 0, NULL, 1751229926, 1751229926),
(759, 'default', '{\"uuid\":\"345395f3-cfd0-42a6-9304-048e408f04b7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.42.31.203\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.5 Safari\\/605.1.15\\\";}\"}}', 0, NULL, 1751229928, 1751229928),
(760, 'default', '{\"uuid\":\"2dd3e499-33c8-41e0-a446-b5d9c428d6bb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751250332, 1751250332),
(761, 'default', '{\"uuid\":\"7eb77200-b8d2-461f-9073-69c79a102123\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751284896, 1751284896),
(762, 'default', '{\"uuid\":\"760aa7cd-225e-405f-8c49-dd0a65d26896\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751328066, 1751328066),
(763, 'default', '{\"uuid\":\"766dda2d-e748-4c5e-8e49-a8aec68a2d87\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.42.31.203\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Dart\\/3.8 (dart:io)\\\";}\"}}', 0, NULL, 1751330992, 1751330992),
(764, 'default', '{\"uuid\":\"d5be5b89-a370-441a-8b29-357beee85551\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"197.42.31.203\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Dart\\/3.8 (dart:io)\\\";}\"}}', 0, NULL, 1751331592, 1751331592),
(765, 'default', '{\"uuid\":\"755390e7-f557-4920-94b7-03e2a40a088f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751332385, 1751332385),
(766, 'default', '{\"uuid\":\"86acfcd3-96c3-4ff2-a87a-0144a88a44ea\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751422274, 1751422274),
(767, 'default', '{\"uuid\":\"177d100d-ec95-4e8c-97ea-789efa16ef7c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751463071, 1751463071),
(768, 'default', '{\"uuid\":\"c1e0d851-d3d5-4e96-b05d-8e8f2c7aeada\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"167.99.191.66\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1751469077, 1751469077);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(769, 'default', '{\"uuid\":\"95bc6e3a-b010-4e4d-b505-802fde721316\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751509818, 1751509818),
(770, 'default', '{\"uuid\":\"9b986fe9-3e52-40a9-a4c5-054c47dc7edb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.159.144.16\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1751521100, 1751521100),
(771, 'default', '{\"uuid\":\"d2cf5f6e-1dcb-4414-954c-5ef54a999095\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:20:\\\"2a02:4780:a:c0de::84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751533938, 1751533938),
(772, 'default', '{\"uuid\":\"57d036f8-cacb-46f5-821b-cbc9d6708cdc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.131.36.84\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1751542267, 1751542267),
(773, 'default', '{\"uuid\":\"b8b16863-af74-4dc4-b2f8-66fec2ddb412\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.130.16.140\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1751562469, 1751562469),
(774, 'default', '{\"uuid\":\"fdaec935-7ddc-4379-9f11-c9bc2fa95df1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751627649, 1751627649),
(775, 'default', '{\"uuid\":\"443c57d0-0018-473d-b5ed-7eef47491855\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"35.204.140.171\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:35:\\\"Scrapy\\/2.12.0 (+https:\\/\\/scrapy.org)\\\";}\"}}', 0, NULL, 1751656943, 1751656943),
(776, 'default', '{\"uuid\":\"082dfe39-b75d-4aeb-bb0a-447269f8a629\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"205.169.39.26\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:99:\\\"Mozilla\\/5.0 (Windows NT 10.0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/106.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1751696748, 1751696748),
(777, 'default', '{\"uuid\":\"73dab1b2-209e-4f46-a451-f10931bec78d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:21:\\\"2a03:b0c0:3:d0::d1a:1\\\";}\"}}', 0, NULL, 1751702627, 1751702627),
(778, 'default', '{\"uuid\":\"6bdc47bf-55da-4a3c-ac29-55835a834bd7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a03:b0c0:2:d0::1713:9001\\\";}\"}}', 0, NULL, 1751702627, 1751702627),
(779, 'default', '{\"uuid\":\"a9e5b30a-5064-4c45-b6e1-044fa3d9a4d9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:21:\\\"2a03:b0c0:3:d0::d1a:1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:136:\\\"Mozilla\\/5.0 (Linux; Android 6.0; HTC One M9 Build\\/MRA58K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/52.0.2743.98 Mobile Safari\\/537.3\\\";}\"}}', 0, NULL, 1751702628, 1751702628),
(780, 'default', '{\"uuid\":\"26fdccc8-341e-4117-b4b5-c954eb146839\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:25:\\\"2a03:b0c0:2:d0::1713:9001\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:136:\\\"Mozilla\\/5.0 (Linux; Android 6.0; HTC One M9 Build\\/MRA58K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/52.0.2743.98 Mobile Safari\\/537.3\\\";}\"}}', 0, NULL, 1751702628, 1751702628),
(781, 'default', '{\"uuid\":\"07e7c5a6-d33d-46a7-9854-ff081ae80396\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.252.191.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1751703859, 1751703859),
(782, 'default', '{\"uuid\":\"bdad49e8-dd80-4941-ba27-8175cbbae1fe\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.134.91.17\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:80:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko\\/20100101 Firefox\\/112.0\\\";}\"}}', 0, NULL, 1751705659, 1751705659),
(783, 'default', '{\"uuid\":\"726d2136-99df-431e-b630-0fec7a7a1752\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751712230, 1751712230),
(784, 'default', '{\"uuid\":\"658c8c32-37f3-4feb-af97-0ee8bcb222be\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.28.229.156\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1751713553, 1751713553),
(785, 'default', '{\"uuid\":\"ae621167-9a27-432f-80f3-fe462506db53\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.28.229.156\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1751713580, 1751713580),
(786, 'default', '{\"uuid\":\"41f4c238-b329-453c-8413-83e554232428\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"20.171.207.211\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1751719788, 1751719788),
(787, 'default', '{\"uuid\":\"3570759a-9e41-4511-8e3e-8f24779261b8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"20.171.207.211\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1751719791, 1751719791),
(788, 'default', '{\"uuid\":\"eceb28ad-6a58-48c0-8cdb-7a7157fda07b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"20.171.207.211\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1751719794, 1751719794),
(789, 'default', '{\"uuid\":\"d560a6ea-7c8d-41d3-a8b7-475f280b1686\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"20.171.207.211\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1751719796, 1751719796),
(790, 'default', '{\"uuid\":\"1a651b28-d25e-4c6f-8e34-a5cbcf7e2031\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"165.232.110.237\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:70:\\\"Mozilla\\/5.0 (X11; Linux x86_64; rv:137.0) Gecko\\/20100101 Firefox\\/137.0\\\";}\"}}', 0, NULL, 1751746423, 1751746423),
(791, 'default', '{\"uuid\":\"8f5754b5-d126-46ad-a8ab-7370b3db0889\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751790470, 1751790470),
(792, 'default', '{\"uuid\":\"059cf3e5-55cb-4c62-b1e2-58ce1ec38ea7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.74.237.10\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1751828670, 1751828670),
(793, 'default', '{\"uuid\":\"95ed97d8-4455-48ff-99f2-a649ac4a65d4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751852719, 1751852719),
(794, 'default', '{\"uuid\":\"ef614eb5-04db-4207-9e5c-7d842d890461\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"138.197.169.122\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1751915630, 1751915630),
(795, 'default', '{\"uuid\":\"fa705384-7aaf-4beb-b658-1bc63d27fe17\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"35.237.248.35\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1751918596, 1751918596),
(796, 'default', '{\"uuid\":\"6aeb8b46-5609-46ac-a1e1-81425947f853\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.233.46\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1751920471, 1751920471),
(797, 'default', '{\"uuid\":\"c2775dd8-c419-4860-8ebf-7761ada89832\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"91.231.89.121\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko\\/20100101 Firefox\\/134.0\\\";}\"}}', 0, NULL, 1751922702, 1751922702),
(798, 'default', '{\"uuid\":\"aabf6ab0-e027-44dc-b781-9566e6e0aff5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1751939334, 1751939334),
(799, 'default', '{\"uuid\":\"89f89c20-fc2a-4e4b-be26-dd6e993daa62\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.165.70.220\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1751950540, 1751950540),
(800, 'default', '{\"uuid\":\"ad9942ef-c1d9-4819-a086-729f1adbaeef\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.134.91.17\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/14.1.3 Safari\\/605.1.15\\\";}\"}}', 0, NULL, 1751956221, 1751956221),
(801, 'default', '{\"uuid\":\"5e6aadd8-6fbc-43b5-bf97-405a5ab0e9a9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.135.144.81\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1751974383, 1751974383),
(802, 'default', '{\"uuid\":\"56e59582-dc8d-4f68-9e12-5728a0380ecb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752024263, 1752024263),
(803, 'default', '{\"uuid\":\"ce9e4a8a-3ffd-487b-aa34-ad5a3d7582ba\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"213.180.203.123\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:64:\\\"Mozilla\\/5.0 (compatible; YandexBot\\/3.0; +http:\\/\\/yandex.com\\/bots)\\\";}\"}}', 0, NULL, 1752025391, 1752025391),
(804, 'default', '{\"uuid\":\"b7b5d5e4-cbb5-4106-a8f2-e03cdd1718a3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"35.84.194.239\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:73:\\\"Mozilla\\/5.0 (compatible; wpbot\\/1.3; +https:\\/\\/forms.gle\\/ajBaxygz9jSR8p8G9)\\\";}\"}}', 0, NULL, 1752032300, 1752032300),
(805, 'default', '{\"uuid\":\"298ecfd6-5d0f-4517-aa33-62cbc41558b2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.140\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062019, 1752062019),
(806, 'default', '{\"uuid\":\"5b1d756f-8801-4caf-95e2-5f77195ba23d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062043, 1752062043),
(807, 'default', '{\"uuid\":\"34abdb6a-b3a3-45ce-9b9c-acb2770d7221\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.252.191.196\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062123, 1752062123),
(808, 'default', '{\"uuid\":\"7e10efad-39b5-43a9-9556-83c048a2682b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"103.196.9.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062124, 1752062124),
(809, 'default', '{\"uuid\":\"ef4dd67f-be80-4c98-b4db-bd46ea7ddb14\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"103.196.9.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062132, 1752062132),
(810, 'default', '{\"uuid\":\"c82f1032-80be-47fb-a233-2a2ce9af35cf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"154.28.229.178\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062910, 1752062910),
(811, 'default', '{\"uuid\":\"1ce49c5b-5860-4e1c-a78e-f023b10ea9ae\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.164.173.198\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062918, 1752062918),
(812, 'default', '{\"uuid\":\"210d54f3-f24d-4bbe-825b-468e53a505ba\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.164.173.198\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752062930, 1752062930),
(813, 'default', '{\"uuid\":\"604a7c41-d0bf-4a15-a217-fc748f34a1c2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"104.252.191.55\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752065736, 1752065736),
(814, 'default', '{\"uuid\":\"19410ca6-3d00-4b3c-9a76-cc8cee91ddb1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"103.4.251.67\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752065736, 1752065736),
(815, 'default', '{\"uuid\":\"90ea0eb5-b1eb-4a42-9379-00bf448b42db\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"103.4.251.67\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752065744, 1752065744),
(816, 'default', '{\"uuid\":\"31f17915-c67f-4b05-84d8-0938e56a997a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"45.55.222.0\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752091054, 1752091054),
(817, 'default', '{\"uuid\":\"88008d1e-500a-45d2-832f-a1658872de06\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.164.126.182\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752107328, 1752107328),
(818, 'default', '{\"uuid\":\"703c7c67-b73e-4594-80b0-417737a28761\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.164.126.182\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/116.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752107349, 1752107349),
(819, 'default', '{\"uuid\":\"3c3d08fc-e025-4f88-9b50-62f34aa234aa\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"103.4.251.98\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752107620, 1752107620),
(820, 'default', '{\"uuid\":\"df063658-9337-44f7-8352-159f1476c6c3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"103.4.251.98\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752107646, 1752107646),
(821, 'default', '{\"uuid\":\"0412e285-0ea1-4985-9279-e20cd2651b06\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.134.91.17\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko\\/20100101 Firefox\\/85.0\\\";}\"}}', 0, NULL, 1752146507, 1752146507),
(822, 'default', '{\"uuid\":\"19a87cc9-706e-4c7b-a1d5-62afb4433ba2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"91.231.89.121\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:78:\\\"Mozilla\\/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko\\/20100101 Firefox\\/134.0\\\";}\"}}', 0, NULL, 1752147512, 1752147512),
(823, 'default', '{\"uuid\":\"1790ade4-fcf8-4631-aac7-c42c664fcc6a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752150175, 1752150175),
(824, 'default', '{\"uuid\":\"5e32b0ed-6b2b-417d-85d1-db10958a5e61\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752152058, 1752152058),
(825, 'default', '{\"uuid\":\"48c5fe1e-b5df-46f5-b731-c90db8b5c3f8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752152073, 1752152073),
(826, 'default', '{\"uuid\":\"72ec90b2-ab7d-419e-b156-9a635a1bbf0c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"34.82.26.12\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1752161436, 1752161436),
(827, 'default', '{\"uuid\":\"d4c874a1-2541-492a-aea1-acc6878fb2dd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752205301, 1752205301),
(828, 'default', '{\"uuid\":\"0c0d409c-524e-41f5-b79d-d88a4b369e78\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.153.87.54\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1752247859, 1752247859),
(829, 'default', '{\"uuid\":\"ac3cce76-1798-43fa-b4b3-0fb345df92d6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.72.207.173\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1752251681, 1752251681),
(830, 'default', '{\"uuid\":\"0737fd85-2ac8-4da5-a7c5-07876ecf77b2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"165.22.78.36\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:70:\\\"Mozilla\\/5.0 (X11; Linux x86_64; rv:137.0) Gecko\\/20100101 Firefox\\/137.0\\\";}\"}}', 0, NULL, 1752260418, 1752260418),
(831, 'default', '{\"uuid\":\"a0d8577e-7d3a-4f8b-bab7-74ec97868f9a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"43.153.58.28\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1752290300, 1752290300),
(832, 'default', '{\"uuid\":\"53599879-974e-4128-94f2-eada0b73ed8f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752329303, 1752329303),
(833, 'default', '{\"uuid\":\"d62a3937-5227-482b-ab55-6b1b54b958e2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752365729, 1752365729),
(834, 'default', '{\"uuid\":\"4c972335-a650-4de7-a618-25f520de7886\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"167.99.190.204\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:70:\\\"Mozilla\\/5.0 (X11; Linux x86_64; rv:137.0) Gecko\\/20100101 Firefox\\/137.0\\\";}\"}}', 0, NULL, 1752435468, 1752435468),
(835, 'default', '{\"uuid\":\"449860a9-c3a1-4a2e-8391-569d2481daad\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752484292, 1752484292),
(836, 'default', '{\"uuid\":\"2d4d6e8f-c099-4d1c-bf95-aa96e89a401d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.140.182.19\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"Mozilla\\/5.0 zgrab\\/0.x\\\";}\"}}', 0, NULL, 1752519641, 1752519641),
(837, 'default', '{\"uuid\":\"6a2ffc92-076f-4afc-940c-2e9bbd4d5f70\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.140.182.19\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"Mozilla\\/5.0 zgrab\\/0.x\\\";}\"}}', 0, NULL, 1752519644, 1752519644),
(838, 'default', '{\"uuid\":\"f0c40f03-c132-4592-ba8d-590cb7f0c40d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752572858, 1752572858),
(839, 'default', '{\"uuid\":\"10c263ae-485f-4199-a81b-4ac0f1c1bc56\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752584796, 1752584796),
(840, 'default', '{\"uuid\":\"8680bd5b-e1bd-450b-bf71-d6cf36999c9a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752584809, 1752584809),
(841, 'default', '{\"uuid\":\"465c6afa-7257-4e32-affb-0ecc854c15dc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752667767, 1752667767),
(842, 'default', '{\"uuid\":\"7ffffdcd-8761-410d-9f57-21b27260e9cf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.85.195.170\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1752670119, 1752670119);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(843, 'default', '{\"uuid\":\"1749743d-3fe6-48fc-b1a0-0d506749afc9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"157.245.248.223\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1752689352, 1752689352),
(844, 'default', '{\"uuid\":\"0738eda5-2284-4a18-ac4c-18177ccf18d1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"34.145.157.68\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1752697246, 1752697246),
(845, 'default', '{\"uuid\":\"3a8afc9e-a663-4deb-a27c-9d1226ac691b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"35.245.154.17\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1752697379, 1752697379),
(846, 'default', '{\"uuid\":\"f178cf52-18de-4b84-904a-bc3f8f26bd06\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752742751, 1752742751),
(847, 'default', '{\"uuid\":\"a8b61000-c76f-4ea7-ad2b-6bf3613820fa\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.166.226.57\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1752763973, 1752763973),
(848, 'default', '{\"uuid\":\"a93dd085-62c1-46a0-a173-908671df137e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752826200, 1752826200),
(849, 'default', '{\"uuid\":\"03c096cd-a691-4160-a4bc-671e59a0e84d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.233.46\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1752859821, 1752859821),
(850, 'default', '{\"uuid\":\"17234d83-9f71-414c-9651-260f06a6a297\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"154.38.171.78\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/120.0.0.0 Safari\\/537.36 Edg\\/120.0.0.0\\\";}\"}}', 0, NULL, 1752861256, 1752861256),
(851, 'default', '{\"uuid\":\"878c341d-7d8d-4da4-b962-9711c2efcc7b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1752885706, 1752885706),
(852, 'default', '{\"uuid\":\"422e59d1-f7e2-4d40-bd99-1b8fb45c77c4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"43.166.130.123\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1752907076, 1752907076),
(853, 'default', '{\"uuid\":\"e38066d8-9cae-48a8-b715-d4fb4d61d12d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1753021803, 1753021803),
(854, 'default', '{\"uuid\":\"09f9186c-c50c-4a56-8426-fc544cc412e3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753078607, 1753078607),
(855, 'default', '{\"uuid\":\"9af98e88-d27d-4812-92c0-96ebac2a5ef7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.211.77.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/108.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753078632, 1753078632),
(856, 'default', '{\"uuid\":\"48774cc2-e2b4-489f-a5ec-d67d459c89cf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1753097226, 1753097226),
(857, 'default', '{\"uuid\":\"59af1ac1-40b8-4e6b-aab0-f44b25182d16\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1753187321, 1753187321),
(858, 'default', '{\"uuid\":\"d48509e2-9b98-4a63-a960-e5821cac5bc7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"49.51.196.42\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1753216567, 1753216567),
(859, 'default', '{\"uuid\":\"a4a4dcb9-d8f4-4e83-a7a4-052400b25224\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:19:\\\"2a02:4780:a:c0de::2\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/2.0\\\";}\"}}', 0, NULL, 1753272861, 1753272861),
(860, 'default', '{\"uuid\":\"feb040aa-0521-4f41-b1c1-770f6a1d6387\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"43.153.113.127\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1753285484, 1753285484),
(861, 'default', '{\"uuid\":\"f72f6769-0004-4ee0-b14c-12e60cc9e957\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"119.28.177.175\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1753309799, 1753309799),
(862, 'default', '{\"uuid\":\"320a8654-ecd4-4bf3-b317-f25164d21b19\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"20.171.207.124\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1753315461, 1753315461),
(863, 'default', '{\"uuid\":\"4914d83b-55d3-435b-b045-ef97c3c447b9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"20.171.207.124\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1753315465, 1753315465),
(864, 'default', '{\"uuid\":\"0aabefa5-f631-48c1-87d9-e41b0aa419fd\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"43.130.40.120\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:139:\\\"Mozilla\\/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/13.0.3 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1753332934, 1753332934),
(865, 'default', '{\"uuid\":\"b017caff-65d4-4cc6-ae49-ee6a4c5cc95b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"196.129.193.55\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753343538, 1753343538),
(866, 'default', '{\"uuid\":\"67550586-73ed-4986-a439-0bcb0d9a247b\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"196.129.193.55\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753343576, 1753343576),
(867, 'default', '{\"uuid\":\"2842677a-c4f3-4bb9-bccc-decd8b5979a8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.145.221\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753344759, 1753344759),
(868, 'default', '{\"uuid\":\"786bed9b-1d46-4f93-bde9-99a7fd51a1a0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.9.204.209\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:105:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/34.0.1847.137 Safari\\/4E423F\\\";}\"}}', 0, NULL, 1753345306, 1753345306),
(869, 'default', '{\"uuid\":\"5c4e93ab-86b3-4ae7-9df8-6c2765354bc9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753346204, 1753346204),
(870, 'default', '{\"uuid\":\"f33d0a8e-c771-45a0-aaa7-625a93f6d9b2\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"35.93.212.175\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:129:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.19582\\\";}\"}}', 0, NULL, 1753348385, 1753348385),
(871, 'default', '{\"uuid\":\"3eeaf46e-4d52-43c4-826e-065b2b790cbb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"35.93.212.175\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (Linux; Android 8.0.0; SM-G965U Build\\/R16NW) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.111 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753348385, 1753348385),
(872, 'default', '{\"uuid\":\"98c57ed8-7961-49bd-b8ec-e4f53c34d915\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"52.16.245.145\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux x86_64; rv:83.0) Gecko\\/20100101 Firefox\\/83.0\\\";}\"}}', 0, NULL, 1753352065, 1753352065),
(873, 'default', '{\"uuid\":\"4aeb8884-c316-4c86-8081-cb04485f93cf\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"52.16.245.145\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753352066, 1753352066),
(874, 'default', '{\"uuid\":\"9600f9b0-b6f3-4a13-bae6-a81fa8a85624\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"52.16.245.145\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:120:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/33.0.1750.152 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753352070, 1753352070),
(875, 'default', '{\"uuid\":\"3bcc7f70-80f3-4ea9-aa1b-91284b8497c8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"45.141.152.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753353859, 1753353859),
(876, 'default', '{\"uuid\":\"ab24dc7a-a619-4a72-867c-0cd026831468\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"35.91.95.114\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:129:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.19582\\\";}\"}}', 0, NULL, 1753355529, 1753355529),
(877, 'default', '{\"uuid\":\"a3a7f1da-7f7b-463e-bf59-999057829de6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"35.91.95.114\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:137:\\\"Mozilla\\/5.0 (Linux; Android 8.0.0; SM-G965U Build\\/R16NW) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.111 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753355540, 1753355540),
(878, 'default', '{\"uuid\":\"70f1fd98-b112-4879-bb5f-99bbfc42cd8a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753356103, 1753356103),
(879, 'default', '{\"uuid\":\"9a2e1874-9fec-4d40-be62-d7722465f360\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"194.233.88.108\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:114:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/58.0.3029.110 Safari\\/537.3\\\";}\"}}', 0, NULL, 1753357865, 1753357865),
(880, 'default', '{\"uuid\":\"452f6a82-9853-4085-ba7f-4ef7fd805f5c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"3.222.165.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:17:\\\"libcurl-agent\\/1.0\\\";}\"}}', 0, NULL, 1753358555, 1753358555),
(881, 'default', '{\"uuid\":\"bab50dd0-aaae-49b8-85fd-1658a1e3347e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"3.222.165.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:17:\\\"libcurl-agent\\/1.0\\\";}\"}}', 0, NULL, 1753358555, 1753358555),
(882, 'default', '{\"uuid\":\"35b987dc-31b6-44c3-91a5-865ef2937f72\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"3.222.165.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:17:\\\"libcurl-agent\\/1.0\\\";}\"}}', 0, NULL, 1753358555, 1753358555),
(883, 'default', '{\"uuid\":\"0fcda019-ad04-4f3c-a032-15496a315004\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"3.222.165.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:17:\\\"libcurl-agent\\/1.0\\\";}\"}}', 0, NULL, 1753358555, 1753358555),
(884, 'default', '{\"uuid\":\"6d4f1bf7-3b60-44c0-ba94-e5621f22a4df\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"3.222.165.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:17:\\\"libcurl-agent\\/1.0\\\";}\"}}', 0, NULL, 1753358555, 1753358555),
(885, 'default', '{\"uuid\":\"ab451c1a-b683-46d8-99b3-8684b5455b4e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"3.222.165.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:17:\\\"libcurl-agent\\/1.0\\\";}\"}}', 0, NULL, 1753358555, 1753358555),
(886, 'default', '{\"uuid\":\"cbb9f1ba-7115-4161-9a89-296ddadf0c9e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.57.180.154\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753362327, 1753362327),
(887, 'default', '{\"uuid\":\"73488f7d-0023-4fd9-a97b-c3e0d4082c36\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.134.91.17\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 (Fedora; Linux i686) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/123.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753370652, 1753370652),
(888, 'default', '{\"uuid\":\"8e33e277-79ad-4e09-83b7-f12890f66740\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"35.245.116.145\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1753385955, 1753385955),
(889, 'default', '{\"uuid\":\"de38c99d-a664-4859-bc75-33ee8838f339\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"52.34.228.235\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:116:\\\"Mozilla\\/5.0 (Windows NT 6.1) AppleWebKit\\/537.36 (KHTML, like Gecko) baidu.sogo.uc.Chrome\\/36.0.1985.125 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753405517, 1753405517),
(890, 'default', '{\"uuid\":\"24b7c626-326c-4a9b-98a4-0edae44cbb11\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"213.209.143.116\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:124.0) Gecko\\/20100101 Firefox\\/124.0\\\";}\"}}', 0, NULL, 1753418949, 1753418949),
(891, 'default', '{\"uuid\":\"c0457660-cbd8-4b7f-8581-c24940bbebf1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"213.152.176.252\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:18:\\\"Go-http-client\\/1.1\\\";}\"}}', 0, NULL, 1753419337, 1753419337),
(892, 'default', '{\"uuid\":\"40413f53-3837-4a7e-a3a1-9b449da9c918\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"194.163.152.77\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:105:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/63.0.3239.108 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753420902, 1753420902),
(893, 'default', '{\"uuid\":\"5e5d74be-3003-4046-9bf2-7455db17c366\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"149.57.180.69\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753433684, 1753433684),
(894, 'default', '{\"uuid\":\"2d26761e-cd8e-4ae5-b386-09a09018b515\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"185.247.137.142\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:85:\\\"Mozilla\\/5.0 (compatible; InternetMeasurement\\/1.0; +https:\\/\\/internet-measurement.com\\/)\\\";}\"}}', 0, NULL, 1753435415, 1753435415),
(895, 'default', '{\"uuid\":\"3be88b1f-83d6-403f-a1c8-d58f306aeb63\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"196.251.88.59\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:85:\\\"Mozilla\\/5.0 (Windows NT 5.2; rv:10.0.1) Gecko\\/20100101 Firefox\\/10.0.1 SeaMonkey\\/2.7.1\\\";}\"}}', 0, NULL, 1753440150, 1753440150),
(896, 'default', '{\"uuid\":\"1e04ce91-7c14-43dd-82af-720b2aa7afc0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"34.23.54.125\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:63:\\\"Mozilla\\/5.0 (compatible; CMS-Checker\\/1.0; +https:\\/\\/example.com)\\\";}\"}}', 0, NULL, 1753443170, 1753443170),
(897, 'default', '{\"uuid\":\"e10ad607-341e-4df6-a555-15320d1cb465\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"87.236.176.248\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:85:\\\"Mozilla\\/5.0 (compatible; InternetMeasurement\\/1.0; +https:\\/\\/internet-measurement.com\\/)\\\";}\"}}', 0, NULL, 1753446723, 1753446723),
(898, 'default', '{\"uuid\":\"3e721cb1-37b8-46f7-96e0-6a9ef245b6f3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"135.148.100.196\\\";}\"}}', 0, NULL, 1753453704, 1753453704),
(899, 'default', '{\"uuid\":\"01887585-cfa5-4958-abf5-07423dd5e3e5\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753455258, 1753455258),
(900, 'default', '{\"uuid\":\"246ba764-0fef-4f52-b3e8-b97843757b53\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"176.123.4.217\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:11:\\\"Mozilla\\/5.0\\\";}\"}}', 0, NULL, 1753458088, 1753458088),
(901, 'default', '{\"uuid\":\"a0f3a160-d1c6-497e-90e6-aaa67531f6fe\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"135.148.100.196\\\";}\"}}', 0, NULL, 1753458973, 1753458973),
(902, 'default', '{\"uuid\":\"7b65b921-4c87-4523-b39d-b3add0361479\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753460033, 1753460033),
(903, 'default', '{\"uuid\":\"fef34318-28ec-448e-befb-dac10503b59e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"176.9.158.217\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/132.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753461780, 1753461780),
(904, 'default', '{\"uuid\":\"10c42ea7-e9b5-4305-ae3f-7d4764b59142\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.201.168.79\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:125:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/120.0.0.0 Safari\\/537.36 Edg\\/120.0.0.0\\\";}\"}}', 0, NULL, 1753461798, 1753461798),
(905, 'default', '{\"uuid\":\"05c5a526-4698-49e0-b6a1-194732e0cf25\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"195.201.168.79\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/119.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753461800, 1753461800),
(906, 'default', '{\"uuid\":\"c62517b2-1757-40db-97d1-679a69314b6e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753473759, 1753473759),
(907, 'default', '{\"uuid\":\"97a28e97-440c-4c34-929e-8831f3b3c495\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"54.153.69.202\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753478268, 1753478268),
(908, 'default', '{\"uuid\":\"58102c20-e1e6-44e4-8dfd-9cd9ffa67a22\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"104.236.50.166\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753493414, 1753493414),
(909, 'default', '{\"uuid\":\"4955fe78-d8a0-48f5-9049-f54038c320f0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"35.89.125.109\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:126:\\\"Mozilla\\/5.0 (iPad; CPU OS 12_2 like Mac OS X) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/12.1 Mobile\\/15E148 Safari\\/604.1\\\";}\"}}', 0, NULL, 1753503848, 1753503848),
(910, 'default', '{\"uuid\":\"d63dc42c-de78-4a55-b9f2-5af0a8979aa3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"149.57.180.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753519911, 1753519911),
(911, 'default', '{\"uuid\":\"b4d2c6e7-f087-4d92-b269-25c373bfc7d0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.145.119\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753537091, 1753537091),
(912, 'default', '{\"uuid\":\"46107fe0-6e48-4e65-a88c-3a3c931ad6dc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.134.91.17\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:119:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/17.4.1 Safari\\/605.4.18\\\";}\"}}', 0, NULL, 1753601580, 1753601580),
(913, 'default', '{\"uuid\":\"c88e228a-e87a-4954-8391-7f55d4b6c761\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"54.82.20.172\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:141:\\\"Mozilla\\/5.0 (Linux; U; Android 4.0.3; de-de; Galaxy S II Build\\/GRJ22) AppleWebKit\\/534.30 (KHTML, like Gecko) Version\\/4.0 Mobile Safari\\/534.30\\\";}\"}}', 0, NULL, 1753606814, 1753606814),
(914, 'default', '{\"uuid\":\"e42f1d1f-a40d-4653-8e2b-7595bffe90fa\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"167.99.177.243\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753662077, 1753662077),
(915, 'default', '{\"uuid\":\"a06d3953-c39b-4361-af86-bdaefd7bc04a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"91.84.87.137\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:131:\\\"Mozilla\\/5.0 (Linux; Android 6.0; Nexus 5 Build\\/MRA58N) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1753689366, 1753689366),
(916, 'default', '{\"uuid\":\"06b68519-979c-4fa7-a620-3556e3139fa6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.145.230\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753692980, 1753692980);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(917, 'default', '{\"uuid\":\"be92b845-e082-4dd6-992c-c5cfdd7a10f9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.145.228\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753710746, 1753710746),
(918, 'default', '{\"uuid\":\"eb91bd9a-1af4-440d-a4ac-ad8f3128dff0\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.57.180.116\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753955811, 1753955811),
(919, 'default', '{\"uuid\":\"993f742e-223a-462e-9d9a-6f0b17e64cc4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"45.55.217.35\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/119.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1753959581, 1753959581),
(920, 'default', '{\"uuid\":\"0c399a4e-9e2d-4ee6-8d1b-f2d7fe3399b7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"149.57.180.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1753973832, 1753973832),
(921, 'default', '{\"uuid\":\"2b9f567b-5c2f-4aa3-93f1-6ab32eb48972\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"179.43.149.114\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:110:\\\"Mozilla\\/5.0 (Windows NT 10.0; WOW64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/74.0.3729.169 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754000559, 1754000559),
(922, 'default', '{\"uuid\":\"71c5647e-1a26-487c-9563-cd34dac7de11\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"102.188.97.88\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754033054, 1754033054),
(923, 'default', '{\"uuid\":\"9989d83f-1846-447b-8f97-05a299929fba\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"104.236.55.133\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/18.4 Safari\\/605.1.15\\\";}\"}}', 0, NULL, 1754080323, 1754080323),
(924, 'default', '{\"uuid\":\"3503f04e-de81-4c2d-a526-5911fe5a2f2c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"54.241.91.4\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754086606, 1754086606),
(925, 'default', '{\"uuid\":\"001d7a5b-2487-4108-9ffa-0a2e854466eb\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"198.235.24.179\\\";}\"}}', 0, NULL, 1754150515, 1754150515),
(926, 'default', '{\"uuid\":\"779a0df2-0955-4cac-b65e-48a9c1222179\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"198.235.24.131\\\";}\"}}', 0, NULL, 1754197261, 1754197261),
(927, 'default', '{\"uuid\":\"7c2200fe-11ce-4534-815a-1ed49ab4c728\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.57.180.176\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1754213770, 1754213770),
(928, 'default', '{\"uuid\":\"fc3989b0-a6e2-435a-9dc8-5ce62f881389\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.145.221\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1754231291, 1754231291),
(929, 'default', '{\"uuid\":\"a4ce2e2c-78a1-4644-849e-e368eaea933a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"165.232.145.93\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:70:\\\"Mozilla\\/5.0 (X11; Linux x86_64; rv:137.0) Gecko\\/20100101 Firefox\\/137.0\\\";}\"}}', 0, NULL, 1754289679, 1754289679),
(930, 'default', '{\"uuid\":\"7bb7d6dc-b6bb-4d96-8be1-66b384f339e6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"102.188.65.164\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754316632, 1754316632),
(931, 'default', '{\"uuid\":\"f75dcb91-38cb-46d1-a04b-377806a7dc60\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"159.89.190.6\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754357407, 1754357407),
(932, 'default', '{\"uuid\":\"5a248fba-ba94-4033-8420-25b781c680e3\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"104.236.199.238\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:80:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:131.0) Gecko\\/20100101 Firefox\\/131.0\\\";}\"}}', 0, NULL, 1754377783, 1754377783),
(933, 'default', '{\"uuid\":\"fde6ccf3-2ab9-432a-aa76-3a5d89aad3be\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"138.197.12.167\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/130.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754416831, 1754416831),
(934, 'default', '{\"uuid\":\"285a2333-94b8-4446-91f4-05b9c3c8cba8\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"135.148.100.196\\\";}\"}}', 0, NULL, 1754482328, 1754482328),
(935, 'default', '{\"uuid\":\"14a31982-cbba-4f44-9785-d3bc51b42327\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"149.57.180.31\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1754561060, 1754561060),
(936, 'default', '{\"uuid\":\"3aeef3b5-bda0-403f-9bf2-ca15485b50b1\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"23.27.145.104\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1754578098, 1754578098),
(937, 'default', '{\"uuid\":\"81c6b793-52a9-43b4-86dd-5ad92bd2bd69\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"13.56.138.25\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1754698751, 1754698751),
(938, 'default', '{\"uuid\":\"95439e02-667f-4aaa-8d5e-ef8ef6d6fb46\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"205.210.31.13\\\";}\"}}', 0, NULL, 1754777246, 1754777246),
(939, 'default', '{\"uuid\":\"4ddf5ff6-e320-4071-9f62-95796c5f60c6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"205.210.31.145\\\";}\"}}', 0, NULL, 1754788187, 1754788187),
(940, 'default', '{\"uuid\":\"76385441-2d8e-4646-a167-6d20255f60de\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"44.250.142.103\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:73:\\\"Mozilla\\/5.0 (compatible; wpbot\\/1.3; +https:\\/\\/forms.gle\\/ajBaxygz9jSR8p8G9)\\\";}\"}}', 0, NULL, 1754908149, 1754908149),
(941, 'default', '{\"uuid\":\"0b7f98d9-fc25-42fa-a617-90ca6a7f3a53\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"3.249.98.28\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:69:\\\"Mozilla\\/5.0 (compatible; NetcraftSurveyAgent\\/1.0; +info@netcraft.com)\\\";}\"}}', 0, NULL, 1754923320, 1754923320),
(942, 'default', '{\"uuid\":\"c6f11213-ff5e-4935-95c9-c95fbe283a02\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.140.182.19\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"Mozilla\\/5.0 zgrab\\/0.x\\\";}\"}}', 0, NULL, 1755084685, 1755084685),
(943, 'default', '{\"uuid\":\"064268a3-5a2e-494f-a69d-f77eea1ccc77\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.140.182.19\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"Mozilla\\/5.0 zgrab\\/0.x\\\";}\"}}', 0, NULL, 1755084685, 1755084685),
(944, 'default', '{\"uuid\":\"9aedd17c-6015-4e15-af84-555caaed52dc\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"205.169.39.13\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:116:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/117.0.5938.132 Safari\\/537.36\\\";}\"}}', 0, NULL, 1755156502, 1755156502),
(945, 'default', '{\"uuid\":\"2221e450-6e98-4f40-9be2-4c35bff89c0c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.101.91.215\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1755298992, 1755298992),
(946, 'default', '{\"uuid\":\"e79624cb-d1c2-47bc-ae28-4273266b201a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"164.92.211.98\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1755517695, 1755517695),
(947, 'default', '{\"uuid\":\"0193be60-9b00-4e18-8e99-3298b8e34f45\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:15:\\\"196.138.136.111\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:111:\\\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1755531559, 1755531559),
(948, 'default', '{\"uuid\":\"a66d368a-6869-4418-a168-86f7fb5cac1c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"68.183.59.114\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:117:\\\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/136.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1755554683, 1755554683),
(949, 'default', '{\"uuid\":\"70a0f1b9-4f2e-446d-b710-d14c84332d17\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"3.140.182.19\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"Mozilla\\/5.0 zgrab\\/0.x\\\";}\"}}', 0, NULL, 1755704295, 1755704295),
(950, 'default', '{\"uuid\":\"6957fd66-52b6-4952-acd3-016b4c4813e4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"3.101.76.68\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:101:\\\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/137.0.0.0 Safari\\/537.36\\\";}\"}}', 0, NULL, 1755904374, 1755904374),
(951, 'default', '{\"uuid\":\"203b4834-48c3-4480-a5df-5b02f8fba218\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:12:\\\"23.27.145.21\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1755944209, 1755944209),
(952, 'default', '{\"uuid\":\"79c9ea7b-817a-4c9b-8862-3743e8573f7c\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"205.210.31.57\\\";}\"}}', 0, NULL, 1755949458, 1755949458),
(953, 'default', '{\"uuid\":\"e1ea7755-c231-4aa2-b82b-878e2704651f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"161.35.224.159\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"vercel-screenshot\\/1.0\\\";}\"}}', 0, NULL, 1755966358, 1755966358),
(954, 'default', '{\"uuid\":\"bac19f26-3ea7-46fc-9ecb-bb0a5d694405\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:11:\\\"64.23.172.1\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:21:\\\"vercel-screenshot\\/1.0\\\";}\"}}', 0, NULL, 1755966358, 1755966358),
(955, 'default', '{\"uuid\":\"bc0ef71b-d97e-49ef-8030-1b8fa40b91a7\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"149.57.180.152\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:68:\\\"Mozilla\\/5.0 (X11; Linux i686; rv:109.0) Gecko\\/20100101 Firefox\\/120.0\\\";}\"}}', 0, NULL, 1755967351, 1755967351),
(956, 'default', '{\"uuid\":\"59198c9f-3a27-4c36-9c5e-f34a20cba287\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":1:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"198.235.24.165\\\";}\"}}', 0, NULL, 1755991161, 1755991161),
(957, 'default', '{\"uuid\":\"ef6184ff-387b-4d75-bf37-cc2d58cb5ba4\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:14:\\\"93.123.109.225\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:170:\\\"Mozilla\\/5.0 (Linux; Android 9; SAMSUNG SM-G960F Build\\/PPR1.180610.011) AppleWebKit\\/537.36 (KHTML, like Gecko) SamsungBrowser\\/8.2 Chrome\\/63.0.3239.111 Mobile Safari\\/537.36\\\";}\"}}', 0, NULL, 1755993194, 1755993194),
(958, 'default', '{\"uuid\":\"cf465996-c227-4507-a5a1-5dbf6b52f42d\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.30\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1756002283, 1756002283),
(959, 'default', '{\"uuid\":\"78577ec5-f5fa-40e4-ba1a-0627cca1559e\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.30\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1756002302, 1756002302),
(960, 'default', '{\"uuid\":\"e6347249-3afc-45b7-ad47-5fc8fe04734f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.30\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1756002308, 1756002308),
(961, 'default', '{\"uuid\":\"08c1cc81-9461-4d19-89fe-4a3a047f5af6\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.30\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1756002309, 1756002309),
(962, 'default', '{\"uuid\":\"188e52c5-6b7e-4829-9356-345ac7bfbd44\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"20.171.207.30\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:102:\\\"Mozilla\\/5.0 AppleWebKit\\/537.36 (KHTML, like Gecko; compatible; GPTBot\\/1.2; +https:\\/\\/openai.com\\/gptbot)\\\";}\"}}', 0, NULL, 1756002312, 1756002312),
(963, 'default', '{\"uuid\":\"28de928d-6d58-4152-8d1d-907df7765d14\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.129\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.7204.183 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1756022785, 1756022785),
(964, 'default', '{\"uuid\":\"3577957d-ee9b-4154-88a5-6d40064ace25\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:198:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/99.0.4844.84 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1756022809, 1756022809),
(965, 'default', '{\"uuid\":\"5333245d-7277-4917-abc6-44f305d4ae7a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:72:\\\"Mozilla\\/5.0 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1756022809, 1756022809),
(966, 'default', '{\"uuid\":\"94b905f7-8238-41a6-8c15-0f75a8b6022a\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.128\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.7204.183 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1756024503, 1756024503),
(967, 'default', '{\"uuid\":\"7ffbc272-4a25-486d-a2e7-89d585747473\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.130\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:200:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.7204.183 Mobile Safari\\/537.36 (compatible; Googlebot\\/2.1; +http:\\/\\/www.google.com\\/bot.html)\\\";}\"}}', 0, NULL, 1756026124, 1756026124),
(968, 'default', '{\"uuid\":\"252b9466-1f6d-443d-b6f5-038114f0c67f\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.129\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:165:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.7204.183 Mobile Safari\\/537.36 (compatible; GoogleOther)\\\";}\"}}', 0, NULL, 1756030442, 1756030442),
(969, 'default', '{\"uuid\":\"18920567-29f3-4b3e-b616-ace28a2f9ca9\",\"displayName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessSiteVisitJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\ProcessSiteVisitJob\\\":2:{s:5:\\\"\\u0000*\\u0000ip\\\";s:13:\\\"66.249.73.129\\\";s:12:\\\"\\u0000*\\u0000userAgent\\\";s:165:\\\"Mozilla\\/5.0 (Linux; Android 6.0.1; Nexus 5X Build\\/MMB29P) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.7204.183 Mobile Safari\\/537.36 (compatible; GoogleOther)\\\";}\"}}', 0, NULL, 1756032901, 1756032901);

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `description_ar` varchar(400) NOT NULL,
  `description_en` varchar(400) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`id`, `name_ar`, `name_en`, `img_path`, `active`, `description_ar`, `description_en`, `deleted_at`, `created_at`, `updated_at`) VALUES
(8, 'ملابس', 'Clothes', 'images/main_categories/1747062971224.png', 1, 'تنظيف وعناية احترافية لكل أنواع الملابس، بأعلى جودة تحافظ على أناقتك دائمًا.', 'Professional cleaning and care for all types of clothing, ensuring top quality and lasting elegance.', NULL, NULL, '2025-07-19 22:27:39'),
(9, 'مفروشات السرير وأقمشة الحمام', 'Bedding and bath linens', 'images/main_categories/1747063044958.png', 1, 'عناية متخصصة بأطقم الأسرّة ومستلزمات الحمّام لضمان الانتعاش والراحة والنعومة التي تدوم.', 'Expert care for bedding and bath essentials, delivering freshness, comfort, and lasting softness.', NULL, NULL, '2025-05-12 19:17:24'),
(10, 'الأثاث', 'Furniture', 'images/main_categories/1747063364529.png', 1, 'خدمة تنظيف وعناية شاملة للأثاث تضمن النظافة العميقة والحفاظ على مظهره الجديد.', 'Comprehensive cleaning and care for furniture, ensuring deep cleanliness and a fresh, like-new look.', NULL, NULL, '2025-05-12 19:22:44'),
(11, 'تيست كاتيجوري', 'New Category1', 'images/main_categories/1746634153502.jpg', 0, 'lorem', 'تيست', '2025-05-07 20:13:36', '2025-05-07 20:07:06', '2025-05-07 20:13:36');

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
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_11_20_154753_create_base_companies_rates_table', 1),
(5, '2023_11_20_155520_create_base_drivers_rates_table', 1),
(6, '2023_11_20_155705_create_base_orders_rates_table', 1),
(7, '2023_11_20_155816_create_categories_table', 1),
(8, '2023_11_20_162617_create_transportation_periods_table', 1),
(9, '2023_11_20_162807_create_transportation_periods_assigned_to_drivers_table', 1),
(10, '2023_11_20_175751_create_countries_table', 1),
(11, '2023_11_21_161143_create_clients_table', 1),
(12, '2023_11_21_170816_create_companies_table', 1),
(13, '2023_11_21_174421_create_orders_table', 1),
(14, '2023_11_21_175848_create_country_managers_table', 1),
(15, '2023_11_21_190111_create_drivers_app_clients_table', 1),
(16, '2023_11_21_190539_create_drivers_table', 1),
(17, '2023_11_21_191839_create_drivers_app_products_table', 1),
(18, '2023_11_21_192056_create_drivers_app_product_options_table', 1),
(19, '2023_11_21_192343_create_drivers_managers_table', 1),
(20, '2023_11_21_203149_create_governorates_table', 1),
(21, '2023_11_22_153533_create_about_us_content_table', 1),
(22, '2023_11_22_160445_create_categories_countries_table', 1),
(23, '2023_11_22_160638_create_cities_table', 1),
(24, '2023_11_22_162126_create_clients_companies_rates_table', 1),
(25, '2023_11_22_162713_create_clients_password_resets_table', 1),
(26, '2023_11_22_163625_create_client_drivers_rates_table', 1),
(27, '2023_11_22_163900_create_client_general_offer_orders_table', 1),
(28, '2023_11_22_164605_create_client_locations_table', 1),
(29, '2023_11_22_175105_create_companies_categories_table', 1),
(30, '2023_11_22_175238_create_companies_deliver_to_cities_table', 1),
(31, '2023_11_22_175507_create_companies_working_with_drivers_managers_table', 1),
(32, '2023_11_22_175622_create_cooperation_with_us_reasons_table', 1),
(33, '2023_11_22_180029_create_delivery_types_table', 1),
(34, '2023_11_22_191200_create_drivers_app_orders_table', 1),
(35, '2023_11_22_192507_create_driver_locations_table', 1),
(36, '2023_11_22_201459_create_driver_location_stop_points_table', 1),
(37, '2023_11_22_201847_create_products_table', 1),
(38, '2023_11_22_201850_create_easy_orders_table', 1),
(39, '2023_11_22_202419_create_product_options_table', 1),
(40, '2023_11_22_202906_create_frequently_asked_questions_table', 1),
(41, '2023_11_22_203022_create_general_offers_table', 1),
(42, '2023_11_22_203438_create_home_page_content_table', 1),
(43, '2023_11_22_203627_create_home_slider_images_table', 1),
(44, '2023_11_22_204544_create_nav_bar_footer_content_table', 1),
(45, '2023_11_22_205117_create_notifications_table', 1),
(46, '2023_11_22_205758_create_offers_page_content_table', 1),
(47, '2023_11_22_211428_create_orders_have_base_orders_rates_table', 1),
(48, '2023_11_22_211633_create_order_comments_table', 1),
(49, '2023_11_22_212008_create_order_items_table', 1),
(50, '2023_11_22_212228_create_order_locations_table', 1),
(51, '2023_11_22_212411_create_order_location_stop_points_table', 1),
(52, '2023_11_22_212552_create_order_steps_table', 1),
(53, '2023_11_23_151635_create_payment_methods_table', 1),
(54, '2023_11_23_153911_create_promo_codes_table', 1),
(55, '2023_11_23_155919_create_promo_codes_companies_table', 1),
(56, '2023_11_23_160035_create_promo_codes_countries_table', 1),
(57, '2023_11_23_160121_create_promo_codes_products_table', 1),
(58, '2023_11_23_160158_create_promo_code_offers_table', 1),
(59, '2023_11_23_160411_create_settings_table', 1),
(60, '2023_11_23_160718_create_slider_offers_table', 1),
(61, '2023_11_23_161038_create_social_links_table', 1),
(62, '2023_11_23_161256_create_statistics_tags_table', 1),
(63, '2023_11_23_161545_create_suggestion_box_table', 1),
(64, '2023_11_23_161630_create_system_products_table', 1),
(65, '2023_11_23_162337_create_system_product_options_table', 1),
(66, '2023_11_23_162500_create_terms_and_conditions_table', 1),
(67, '2023_11_23_163052_create_users_password_resets_table', 1),
(68, '2023_11_23_163158_create_user_device_tokens_table', 1),
(69, '2023_11_23_163311_create_wallet_credit_offers_table', 1),
(70, '2023_11_23_163618_create_wallet_history_table', 1),
(71, '2023_11_23_175313_create_client_orders_table', 1),
(72, '2023_11_24_203719_create_invoices_table', 1),
(73, '2023_11_24_204406_create_invoice_items_table', 1),
(74, '2023_11_26_175307_add_invoice_id_column_to_client_orders_table', 1),
(75, '2023_11_27_135149_add_general_offer_id_column_to_client_general_offer_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nav_bar_footer_content`
--

CREATE TABLE `nav_bar_footer_content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `whatsapp_number` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `facebook_link` varchar(100) NOT NULL,
  `instagram_link` varchar(100) NOT NULL,
  `twitter_link` varchar(100) NOT NULL,
  `footer_title_ar` varchar(100) NOT NULL,
  `footer_title_en` varchar(100) NOT NULL,
  `footer_content_ar` varchar(200) NOT NULL,
  `footer_content_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `body` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'notifications', 'notifications', '2024-09-09 23:27:50', NULL),
(2, 1, 'notifications', 'notifications', '2024-09-09 23:27:50', NULL),
(3, 1, 'notifications', 'notifications', '2024-09-09 23:27:50', NULL),
(4, 1, 'notifications', 'notifications', '2024-09-09 23:27:50', NULL),
(5, 1, 'notifications', 'notifications', '2024-09-09 23:27:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offers_page_content`
--

CREATE TABLE `offers_page_content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(200) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `second_title_ar` varchar(150) NOT NULL,
  `second_title_en` varchar(150) NOT NULL,
  `logo_path` varchar(100) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `google_play_link` varchar(100) NOT NULL,
  `app_store_link` varchar(100) NOT NULL,
  `content_ar` varchar(500) NOT NULL,
  `content_en` varchar(500) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `old_clients`
--

CREATE TABLE `old_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `access_token` text NOT NULL,
  `provider` varchar(100) NOT NULL,
  `provider_id` varchar(50) NOT NULL,
  `provider_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `old_clients`
--

INSERT INTO `old_clients` (`id`, `name`, `avatar`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `access_token`, `provider`, `provider_id`, `provider_name`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mahmoud Helal', NULL, '01097979112', 'client433@test.com', NULL, '$2y$10$DBCJdWG8VgfTlP98LE8tzejp5jAzXRdgXE522WSxi6SSWhUzy9VWu', NULL, '', '', '', '', 1, NULL, '2024-07-21 17:46:26', '2024-07-21 17:46:26'),
(2, 'Ahmed Emad', NULL, '01129922002', 'client@test.com', NULL, '$2y$10$qAUmYBeLtGcIzQn3VuZV4ekx9B8fA9YMj.yWDsRilGOMs7omTvf8y', NULL, '', '', '', '', 1, NULL, '2024-07-21 22:07:20', '2024-07-21 22:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name_ar`, `name_en`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'غسيل', 'wash', '2025-05-05 21:46:38', '2025-05-07 17:42:09', '2025-05-07 17:42:09'),
(2, 'تقليدي', 'Traditional', '2025-05-05 23:09:46', '2025-05-07 17:02:12', '2025-05-07 17:02:12'),
(3, '2تقليدي', '2Traditional', '2025-05-05 23:09:59', '2025-05-07 17:02:16', '2025-05-07 17:02:16'),
(4, 'تنظيف جاف', 'Dry Clean', '2025-05-07 17:43:01', '2025-05-07 17:43:01', NULL),
(5, 'غسيل', 'Washing', '2025-05-07 17:43:23', '2025-05-07 17:43:23', NULL),
(6, 'كوي', 'Pressing', '2025-05-07 17:44:01', '2025-05-07 17:44:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('in_cart','pending','processing','in_delivery','delivered','canceled','returned') NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `promo_code_id` int(10) UNSIGNED DEFAULT NULL,
  `promo_code_discount` decimal(10,2) DEFAULT NULL,
  `delivery_charge` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `long` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `client_id`, `store_id`, `price`, `promo_code_id`, `promo_code_discount`, `delivery_charge`, `total_price`, `lat`, `long`, `created_at`, `updated_at`) VALUES
(149, 'processing', 3, 2, 0.00, NULL, NULL, 0.00, 0.00, NULL, NULL, '2025-10-02 16:02:15', '2025-10-02 16:02:15'),
(150, 'returned', 3, 2, 0.00, NULL, NULL, 0.00, 0.00, NULL, NULL, '2025-10-02 16:03:46', '2025-10-10 17:27:42'),
(161, 'in_cart', 3, 2, 0.00, NULL, NULL, 0.00, 0.00, NULL, NULL, '2025-10-06 22:27:33', '2025-10-06 23:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `orders_have_base_orders_rates`
--

CREATE TABLE `orders_have_base_orders_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `base_order_rate_id` bigint(20) UNSIGNED NOT NULL,
  `value` enum('1','2','3','4','5') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(500) NOT NULL,
  `show_for_client` enum('yes','no') NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(337, 149, 485, NULL, 6),
(338, 150, 485, NULL, 4),
(352, 161, 484, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_locations`
--

CREATE TABLE `order_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `long` decimal(10,8) NOT NULL,
  `status` enum('in_delivery','in_pickup') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_location_stop_points`
--

CREATE TABLE `order_location_stop_points` (
  `order_location_id` bigint(20) UNSIGNED NOT NULL,
  `to_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reason` enum('traffic','not_traffic') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_steps`
--

CREATE TABLE `order_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `title_en` varchar(100) NOT NULL,
  `description_ar` varchar(500) NOT NULL,
  `description_en` varchar(500) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(50) NOT NULL,
  `title_en` varchar(50) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `price_units`
--

CREATE TABLE `price_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ar` varchar(10) NOT NULL,
  `name_en` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `description_en` varchar(500) NOT NULL,
  `description_ar` varchar(500) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `store_id`, `name_en`, `name_ar`, `description_en`, `description_ar`, `image`, `price`, `offer_price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(346, 32, 1, 'ثوب', '', 'Kandura', '', 'images/products/1746626581849.png', 0.00, NULL, NULL, '2025-05-07 18:03:01', '2025-05-07 18:03:01'),
(347, 32, NULL, 'بيشت', '', 'Besht', '', 'images/products/1746626755227.png', 0.00, NULL, NULL, '2025-05-07 18:05:55', '2025-05-07 18:05:55'),
(348, 32, NULL, 'كاميز', '', 'Kameez', '', 'images/products/1746626898356.png', 0.00, NULL, NULL, '2025-05-07 18:08:18', '2025-05-07 18:08:18'),
(349, 32, NULL, 'كورتا', '', 'Kurta', '', 'images/products/1746626961352.png', 0.00, NULL, NULL, '2025-05-07 18:09:21', '2025-05-07 18:09:21'),
(350, 32, NULL, 'سالوار قطعتين', '', 'Salwar Two-Pieces', '', 'images/products/1746627142103.png', 0.00, NULL, NULL, '2025-05-07 18:12:22', '2025-05-07 18:12:22'),
(351, 32, NULL, 'سالوار 3 قطع', '', 'Salwar Three Pieces', '', 'images/products/1746627245892.png', 0.00, NULL, NULL, '2025-05-07 18:14:05', '2025-05-07 18:14:05'),
(352, 32, NULL, 'تيشرت', '', 'Shirt/Polo Shirt', '', 'images/products/1746627314234.png', 0.00, NULL, NULL, '2025-05-07 18:15:14', '2025-05-07 18:15:14'),
(353, 32, NULL, 'بنطال جينز', '', 'Jeans', '', 'images/products/1746627449410.png', 0.00, NULL, NULL, '2025-05-07 18:17:29', '2025-05-07 18:17:29'),
(354, 32, NULL, 'شورت', '', 'Short', '', 'images/products/1746627512258.png', 0.00, NULL, NULL, '2025-05-07 18:18:32', '2025-05-07 18:18:32'),
(355, 32, NULL, 'بنطال قماش', '', 'Plated Trousers', '', 'images/products/1746627594339.png', 0.00, NULL, NULL, '2025-05-07 18:19:54', '2025-05-07 18:19:54'),
(356, 32, NULL, 'لونجي', '', 'Lungi/Wizar', '', 'images/products/1746627703519.png', 0.00, NULL, NULL, '2025-05-07 18:21:43', '2025-05-07 18:21:43'),
(357, 32, NULL, 'سروال قطن', '', 'Jogger', '', 'images/products/1746627779347.png', 0.00, NULL, NULL, '2025-05-07 18:22:59', '2025-05-07 18:22:59'),
(358, 32, NULL, 'بدله قطعتين', '', 'Suit Two-Pieces', '', 'images/products/1746627849256.png', 0.00, NULL, NULL, '2025-05-07 18:24:09', '2025-05-07 18:24:09'),
(359, 32, NULL, 'بدله 3 قطع', '', 'Suit Three-Pieces', '', 'images/products/1746627982730.png', 0.00, NULL, NULL, '2025-05-07 18:26:22', '2025-05-07 18:26:22'),
(360, 32, NULL, 'جاكت بدله', '', 'Suit Jacket', '', 'images/products/1746628043303.png', 0.00, NULL, NULL, '2025-05-07 18:27:23', '2025-05-07 18:27:23'),
(361, 32, NULL, 'بيجامه', '', 'Pyjama', '', 'images/products/1746628105894.png', 0.00, NULL, NULL, '2025-05-07 18:28:25', '2025-05-07 18:28:25'),
(362, 32, NULL, 'بنطال بيجامه', '', 'Pyjama Pants', '', 'images/products/1746628177304.png', 0.00, NULL, NULL, '2025-05-07 18:29:37', '2025-05-07 18:29:37'),
(363, 32, NULL, 'تيشيرت داخلي', '', 'Undershirt', '', 'images/products/1746628261688.png', 0.00, NULL, NULL, '2025-05-07 18:31:01', '2025-05-07 18:31:01'),
(364, 32, NULL, 'ملابس داخليه', '', 'Boxer', '', 'images/products/1746628329332.png', 0.00, NULL, NULL, '2025-05-07 18:32:09', '2025-05-07 18:32:09'),
(365, 32, NULL, 'بلوفر', '', 'Sweater/Pullover', '', 'images/products/1746630959500.png', 0.00, NULL, NULL, '2025-05-07 19:15:59', '2025-05-07 19:15:59'),
(366, 32, NULL, 'ستره', '', 'Jacket', '', 'images/products/1746631170949.png', 0.00, NULL, NULL, '2025-05-07 19:19:30', '2025-05-07 19:19:30'),
(367, 32, NULL, 'ستره جلد', '', 'Lather Jacket', '', 'images/products/1746631255406.png', 0.00, NULL, NULL, '2025-05-07 19:20:55', '2025-05-07 19:20:55'),
(368, 32, NULL, 'ستره جينز', '', 'Jeans Jacket', '', 'images/products/1746631326593.png', 0.00, NULL, NULL, '2025-05-07 19:22:06', '2025-05-07 19:22:06'),
(369, 32, NULL, 'ستره', '', 'Gilet/Vets', '', 'images/products/1746631467729.png', 0.00, NULL, NULL, '2025-05-07 19:24:27', '2025-05-07 19:24:27'),
(370, 32, NULL, 'بلطو', '', 'Coat', '', 'images/products/1746631522699.png', 0.00, NULL, NULL, '2025-05-07 19:25:22', '2025-05-07 19:25:22'),
(371, 32, NULL, 'بلطو طويل', '', 'Over Coat', '', 'images/products/1746631628589.png', 0.00, NULL, NULL, '2025-05-07 19:27:08', '2025-05-07 19:27:08'),
(372, 32, NULL, 'غوترا', '', 'Gutra', '', 'images/products/1746631747860.png', 0.00, NULL, NULL, '2025-05-07 19:29:07', '2025-05-07 19:29:07'),
(373, 32, NULL, 'رابطه عنق', '', 'Tie', '', 'images/products/1746631798265.png', 0.00, NULL, NULL, '2025-05-07 19:29:58', '2025-05-07 19:29:58'),
(374, 33, NULL, 'عبايه', '', 'Abaya', '', 'images/products/1746632239805.png', 0.00, NULL, NULL, '2025-05-07 19:37:19', '2025-05-07 19:37:19'),
(375, 33, NULL, 'ساري', '', 'Saree', '', 'images/products/1746632293354.png', 0.00, NULL, NULL, '2025-05-07 19:38:13', '2025-05-07 19:38:13'),
(376, 33, NULL, 'قفطان', '', 'Kaftan', '', 'images/products/1746632355148.png', 0.00, NULL, NULL, '2025-05-07 19:39:15', '2025-05-07 19:39:15'),
(377, 33, NULL, 'بلوزه', '', 'Blouse', '', 'images/products/1746632423249.png', 0.00, NULL, NULL, '2025-05-07 19:40:23', '2025-05-07 19:40:23'),
(378, 33, NULL, 'بلوزه حرير', '', 'Silk Blouse', '', 'images/products/1746632486496.png', 0.00, NULL, NULL, '2025-05-07 19:41:26', '2025-05-07 19:41:26'),
(379, 33, NULL, 'فستان', '', 'Casual Dress', '', 'images/products/1746632598788.png', 0.00, NULL, NULL, '2025-05-07 19:43:18', '2025-05-07 19:43:18'),
(380, 33, NULL, 'فستان رسمي', '', 'Formal Dress', '', 'images/products/1746632663491.png', 0.00, NULL, NULL, '2025-05-07 19:44:23', '2025-05-07 19:44:23'),
(381, 33, NULL, 'فستان ليلي', '', 'Evening Dress', '', 'images/products/1746632764984.png', 0.00, NULL, NULL, '2025-05-07 19:46:04', '2025-05-07 19:46:04'),
(382, 33, NULL, 'فستان مناسبات', '', 'Fancy Dress', '', 'images/products/1746632823153.png', 0.00, NULL, NULL, '2025-05-07 19:47:03', '2025-05-07 19:47:03'),
(383, 33, NULL, 'تنوره', '', 'Skirt', '', 'images/products/1746632917927.png', 0.00, NULL, NULL, '2025-05-07 19:48:37', '2025-05-07 19:51:28'),
(384, 33, NULL, 'تنورة مطويه', '', 'Plated Skirt', '', 'images/products/1746633063746.png', 0.00, NULL, NULL, '2025-05-07 19:51:03', '2025-05-07 19:51:03'),
(385, 33, NULL, 'كارديجان', '', 'Cardigan', '', 'images/products/1746633231603.png', 0.00, NULL, NULL, '2025-05-07 19:53:51', '2025-05-07 19:53:51'),
(386, 33, NULL, 'ستره جينز', '', 'Jeans Jacket', '', 'images/products/1746633291791.png', 0.00, NULL, NULL, '2025-05-07 19:54:51', '2025-05-07 19:54:51'),
(387, 33, NULL, 'جاكت', '', 'Jacket', '', 'images/products/1746633359543.png', 0.00, NULL, NULL, '2025-05-07 19:55:59', '2025-05-07 19:55:59'),
(388, 33, NULL, 'جلباب', '', 'Jalabya', '', 'images/products/1746633419632.png', 0.00, NULL, NULL, '2025-05-07 19:56:59', '2025-05-07 19:56:59'),
(389, 33, NULL, 'بيجامه', '', 'Pyjama', '', 'images/products/1746633475258.png', 0.00, NULL, NULL, '2025-05-07 19:57:55', '2025-05-07 19:57:55'),
(390, 33, NULL, 'بنطال بيجامه', '', 'Pyjama Pants', '', 'images/products/1746633677212.png', 0.00, NULL, NULL, '2025-05-07 20:01:17', '2025-05-07 20:01:17'),
(391, 33, NULL, 'تيشيرت داخلي', '', 'Undershirt', '', 'images/products/1746633756902.png', 0.00, NULL, NULL, '2025-05-07 20:02:36', '2025-05-07 20:02:36'),
(392, 33, NULL, 'قميص نوم قصير', '', 'Short Night Gowm', '', 'images/products/1746633862819.png', 0.00, NULL, NULL, '2025-05-07 20:04:22', '2025-05-07 20:04:22'),
(393, 33, NULL, 'قميص نوم', '', 'Night Gowm', '', 'images/products/1746633921209.png', 0.00, NULL, NULL, '2025-05-07 20:05:21', '2025-05-07 20:05:21'),
(394, 33, NULL, 'صدريه', '', 'Bra', '', 'images/products/1746633957723.png', 0.00, NULL, NULL, '2025-05-07 20:05:57', '2025-05-07 20:05:57'),
(395, 33, NULL, 'ملابس داخليه', '', 'Panty', '', 'images/products/1746634005569.png', 0.00, NULL, NULL, '2025-05-07 20:06:45', '2025-05-07 20:06:45'),
(396, 33, NULL, 'حجاب', '', 'Hijab', '', 'images/products/1746634052982.png', 0.00, NULL, NULL, '2025-05-07 20:07:32', '2025-05-07 20:07:32'),
(397, 33, NULL, 'نقاب', '', 'Niqab', '', 'images/products/1746634126762.png', 0.00, NULL, NULL, '2025-05-07 20:08:46', '2025-05-07 20:08:46'),
(398, 33, NULL, 'شال', '', 'Shaal', '', 'images/products/1746634194341.png', 0.00, NULL, NULL, '2025-05-07 20:09:54', '2025-05-07 20:09:54'),
(399, 34, NULL, 'تيشيرت', '', 'T-Shirt', '', 'images/products/1746634283106.png', 0.00, NULL, NULL, '2025-05-07 20:11:23', '2025-05-07 20:11:23'),
(400, 34, NULL, 'بلوفر', '', 'Sweater/Pullover', '', 'images/products/1746634387293.png', 0.00, NULL, NULL, '2025-05-07 20:13:07', '2025-05-07 20:13:07'),
(401, 34, NULL, 'بنطال', '', 'Pants', '', 'images/products/1746634559145.png', 0.00, NULL, NULL, '2025-05-07 20:15:59', '2025-05-07 20:15:59'),
(402, 34, NULL, 'شورت', '', 'Short', '', 'images/products/1746634643763.png', 0.00, NULL, NULL, '2025-05-07 20:17:23', '2025-05-07 20:17:23'),
(403, 34, NULL, 'فستان', '', 'Dress', '', 'images/products/1746634827202.png', 0.00, NULL, NULL, '2025-05-07 20:20:27', '2025-05-07 20:20:27'),
(404, 34, NULL, 'فستان مناسبات', '', 'Fancy Dress', '', 'images/products/1746634935813.png', 0.00, NULL, NULL, '2025-05-07 20:22:15', '2025-05-07 20:22:15'),
(405, 34, NULL, 'ثوب', '', 'Kandura', '', 'images/products/1746635043848.png', 0.00, NULL, NULL, '2025-05-07 20:24:03', '2025-05-07 20:24:03'),
(406, 34, NULL, 'عبايه', '', 'Abaya', '', 'images/products/1746635091122.png', 0.00, NULL, NULL, '2025-05-07 20:24:51', '2025-05-07 20:24:51'),
(407, 34, NULL, 'جاكت', '', 'Jacket', '', 'images/products/1746635160648.png', 0.00, NULL, NULL, '2025-05-07 20:26:00', '2025-05-07 20:26:00'),
(408, 34, NULL, 'بالطو', '', 'Coat', '', 'images/products/1746635375937.png', 0.00, NULL, NULL, '2025-05-07 20:29:35', '2025-05-07 20:29:35'),
(409, 34, NULL, 'غوترا', '', 'Gutra', '', 'images/products/1746637915733.png', 0.00, NULL, NULL, '2025-05-07 21:11:55', '2025-05-07 21:11:55'),
(410, 34, NULL, 'زي مدرسي', '', 'School Uniform', '', 'images/products/1746638006786.png', 0.00, NULL, NULL, '2025-05-07 21:13:26', '2025-05-07 21:13:26'),
(411, 34, NULL, 'دميه', '', 'Toy', '', 'images/products/1746638219744.png', 0.00, NULL, NULL, '2025-05-07 21:16:59', '2025-05-07 21:16:59'),
(412, 35, NULL, 'اسدال', '', 'Prayer Clothes', '', 'images/products/1746638637813.png', 0.00, NULL, NULL, '2025-05-07 21:23:57', '2025-05-07 21:23:57'),
(413, 35, NULL, 'ملابس الاحرام', '', 'Ihram Clothes', '', 'images/products/1746638705124.png', 0.00, NULL, NULL, '2025-05-07 21:25:05', '2025-05-07 21:25:05'),
(414, 35, NULL, 'جوارب', '', 'Socks', '', 'images/products/1746638797709.png', 0.00, NULL, NULL, '2025-05-07 21:26:37', '2025-05-07 21:26:37'),
(415, 35, NULL, 'منديل', '', 'Handkerchief', '', 'images/products/1746638903941.png', 0.00, NULL, NULL, '2025-05-07 21:28:23', '2025-05-07 21:28:23'),
(416, 35, NULL, 'كاب', '', 'Cap', '', 'images/products/1746638948419.png', 0.00, NULL, NULL, '2025-05-07 21:29:08', '2025-05-07 21:29:08'),
(417, 35, NULL, 'بدله رياضيه', '', 'Tracksuit', '', 'images/products/1746639038561.png', 0.00, NULL, NULL, '2025-05-07 21:30:38', '2025-05-07 21:30:38'),
(418, 35, NULL, 'بدله ظابط', '', 'Officer Uniform Suit', '', 'images/products/1746639247867.png', 0.00, NULL, NULL, '2025-05-07 21:34:07', '2025-05-07 21:34:07'),
(419, 35, NULL, 'بنطال زي الظابط', '', 'Officer Uniform Pants', '', 'images/products/1746639342949.png', 0.00, NULL, NULL, '2025-05-07 21:35:42', '2025-05-07 21:35:42'),
(420, 35, NULL, 'كاب زي الظابط', '', 'Officer Uniform Cap', '', 'images/products/1746639424443.png', 0.00, NULL, NULL, '2025-05-07 21:37:04', '2025-05-07 21:37:04'),
(421, 35, NULL, 'بالطو الطبيب', '', 'Doctor Coat', '', 'images/products/1746639477435.png', 0.00, NULL, NULL, '2025-05-07 21:37:57', '2025-05-07 21:37:57'),
(422, 35, NULL, 'بدله المرجل', '', 'Boiler Suit', '', 'images/products/1746639564856.png', 0.00, NULL, NULL, '2025-05-07 21:39:24', '2025-05-07 21:39:24'),
(423, 35, NULL, 'بدله السفاري', '', 'Safari Suit', '', 'images/products/1746639622651.png', 0.00, NULL, NULL, '2025-05-07 21:40:22', '2025-05-07 21:40:22'),
(424, 35, NULL, 'روب التخرج', '', 'Graduation Robe', '', 'images/products/1746639684197.png', 0.00, NULL, NULL, '2025-05-07 21:41:24', '2025-05-07 21:41:24'),
(425, 35, NULL, 'سالوبت', '', 'Dungaree', '', 'images/products/1746639876421.png', 0.00, NULL, NULL, '2025-05-07 21:44:36', '2025-05-07 21:44:36'),
(426, 36, NULL, 'ملايه سرير (فردي)', '', 'Bed Sheet (Single)', '', 'images/products/1746658573336.png', 0.00, NULL, NULL, '2025-05-08 00:48:06', '2025-05-08 02:56:13'),
(427, 36, NULL, 'ملايه سرير (زوجي)', '', 'Bed Sheet (Double)', '', 'images/products/1746658608388.png', 0.00, NULL, NULL, '2025-05-08 01:16:06', '2025-05-08 02:56:48'),
(428, 46, NULL, 'غسيل و طي', '', 'Wash & Fold', '', 'images/products/1746654472736.png', 0.00, NULL, NULL, '2025-05-08 01:47:52', '2025-05-08 01:47:52'),
(429, 46, NULL, 'غسيل وكي', '', 'Wash & Press', '', 'images/products/1746654578998.png', 0.00, NULL, NULL, '2025-05-08 01:49:38', '2025-05-08 01:49:38'),
(430, 46, NULL, 'كي', '', 'Pressing', '', 'images/products/1746654639622.png', 0.00, NULL, NULL, '2025-05-08 01:50:39', '2025-05-08 01:50:39'),
(431, 36, NULL, 'ملايه سرير (كبيره)', '', 'Bed Sheet (King)', '', 'images/products/1746655056683.png', 0.00, NULL, '2025-05-08 03:51:16', '2025-05-08 01:57:36', '2025-05-08 03:51:16'),
(432, 36, NULL, 'ملايه سرير (كبير)', '', 'Bed Sheet (King)', '', 'images/products/1746658784512.png', 0.00, NULL, NULL, '2025-05-08 02:59:44', '2025-05-08 02:59:44'),
(433, 36, NULL, 'طقم ملايه سرير (فردي)', '', 'Bed Sheet Set (Single)', '', 'images/products/1746659137877.png', 0.00, NULL, NULL, '2025-05-08 03:02:27', '2025-05-08 03:05:37'),
(434, 36, NULL, 'طقم ملايه سرير (زوجي)', '', 'Bed Sheet Set (Double)', '', 'images/products/1746659109416.png', 0.00, NULL, NULL, '2025-05-08 03:05:09', '2025-05-08 03:05:09'),
(435, 36, NULL, 'لحاف (فردي)', '', 'Duvet (Single)', '', 'images/products/1746660655930.png', 0.00, NULL, NULL, '2025-05-08 03:30:55', '2025-05-08 03:30:55'),
(436, 36, NULL, 'لحاف زوجي', '', 'Duvet (Double)', '', 'images/products/1746660784326.png', 0.00, NULL, NULL, '2025-05-08 03:33:04', '2025-05-08 03:33:04'),
(437, 36, NULL, 'لحاف ضخم', '', 'Duvet Jumbo', '', 'images/products/1746660911583.png', 0.00, NULL, NULL, '2025-05-08 03:35:11', '2025-05-08 03:35:11'),
(438, 36, NULL, 'لحاف اطفال', '', 'Kid Duvet', '', 'images/products/1746661022902.png', 0.00, NULL, NULL, '2025-05-08 03:37:02', '2025-05-08 03:37:02'),
(439, 36, NULL, 'بطانيه (فردي)', '', 'Blanket (Single)', '', 'images/products/1746661119405.png', 0.00, NULL, NULL, '2025-05-08 03:38:39', '2025-05-08 03:38:39'),
(440, 36, NULL, 'بطانيه (زوجي)', '', 'Blanket (Double)', '', 'images/products/1746661231972.png', 0.00, NULL, NULL, '2025-05-08 03:40:31', '2025-05-08 03:40:31'),
(441, 37, NULL, 'منشفه كبيره', '', 'Bath Towel (Large)', '', 'images/products/1746661334334.png', 0.00, NULL, NULL, '2025-05-08 03:42:14', '2025-05-08 03:42:14'),
(442, 37, NULL, 'منشفه متوسطه', '', 'Bath Towel (Medium)', '', 'images/products/1746661463508.png', 0.00, NULL, NULL, '2025-05-08 03:44:23', '2025-05-08 03:44:23'),
(443, 37, NULL, 'منشفه صغيره', '', 'Bath Towel (Small)', '', 'images/products/1746661575629.png', 0.00, NULL, NULL, '2025-05-08 03:46:15', '2025-05-08 03:46:15'),
(444, 37, NULL, 'منشفه يد', '', 'Hand Towel', '', 'images/products/1746661647440.png', 0.00, NULL, NULL, '2025-05-08 03:47:27', '2025-05-08 03:47:27'),
(445, 37, NULL, 'روب حمام', '', 'Bath Rob', '', 'images/products/1746661768144.png', 0.00, NULL, NULL, '2025-05-08 03:49:28', '2025-05-08 03:49:28'),
(446, 36, NULL, 'بطانيه اطفال', '', 'Kid Blanket', '', 'images/products/1746662020824.png', 0.00, NULL, NULL, '2025-05-08 03:53:40', '2025-05-08 03:53:40'),
(447, 38, NULL, 'مشايه حمام كبيره', '', 'Bath Mat (Large)', '', 'images/products/1746708787161.png', 0.00, NULL, NULL, '2025-05-08 16:53:07', '2025-05-08 16:53:07'),
(448, 38, NULL, 'مشايه حمام متوسطه', '', 'Bath Mat (Medium)', '', 'images/products/1746709257791.png', 0.00, NULL, NULL, '2025-05-08 17:00:57', '2025-05-08 17:00:57'),
(449, 38, NULL, 'مشايه حمام صغيره', '', 'Bath Mat (Small)', '', 'images/products/1746709311415.png', 0.00, NULL, NULL, '2025-05-08 17:01:51', '2025-05-08 17:01:51'),
(450, 38, NULL, 'مشايه الباب', '', 'Doormat', '', 'images/products/1746710054911.png', 0.00, NULL, NULL, '2025-05-08 17:14:14', '2025-05-08 17:14:14'),
(451, 39, NULL, 'غطاء كنبه (كبير)', '', 'Sofa Cover (Large)', '', 'images/products/1746710586135.png', 0.00, NULL, NULL, '2025-05-08 17:23:06', '2025-05-08 17:23:06'),
(452, 39, NULL, 'غطاء كنبه (متوسط)', '', 'Sofa Cover (Medium)', '', 'images/products/1746710657763.png', 0.00, NULL, NULL, '2025-05-08 17:24:17', '2025-05-08 17:24:17'),
(453, 39, NULL, 'غطاء كنبه (صغير)', '', 'Sofa Cover (Small)', '', 'images/products/1746710750260.png', 0.00, NULL, NULL, '2025-05-08 17:25:50', '2025-05-08 17:25:50'),
(454, 39, NULL, 'غطاء لحاف', '', 'Duvet Cover', '', 'images/products/1746710881498.png', 0.00, NULL, NULL, '2025-05-08 17:28:01', '2025-05-08 17:28:01'),
(455, 39, NULL, 'غطاء لحاف (كبير)', '', 'Duvet Cover (Double)', '', 'images/products/1746710985631.png', 0.00, NULL, NULL, '2025-05-08 17:29:45', '2025-05-08 17:29:45'),
(456, 39, NULL, 'غطاء مخده', '', 'Pillow Case', '', 'images/products/1746711279243.png', 0.00, NULL, NULL, '2025-05-08 17:34:39', '2025-05-08 17:34:39'),
(457, 39, NULL, 'غطاء كوشن (كبير)', '', 'Cushion Cover (Large)', '', 'images/products/1746711385612.png', 0.00, NULL, NULL, '2025-05-08 17:36:25', '2025-05-08 17:36:25'),
(458, 39, NULL, 'غطاء كوشن (متوسط)', '', 'Cushion Cover (Medium)', '', 'images/products/1746711443675.png', 0.00, NULL, NULL, '2025-05-08 17:37:23', '2025-05-08 17:37:23'),
(459, 39, NULL, 'غطاء كوشن (صغير)', '', 'Cushion Cover (Small)', '', 'images/products/1746711493449.png', 0.00, NULL, NULL, '2025-05-08 17:38:13', '2025-05-08 17:38:13'),
(460, 40, NULL, 'مرتبه اطفال', '', 'Baby Mattress', '', 'images/products/1746711547246.png', 0.00, NULL, NULL, '2025-05-08 17:39:07', '2025-05-08 17:39:07'),
(461, 40, NULL, 'مرتبه (فردي)', '', 'Single Mattress', '', 'images/products/1746711605352.png', 0.00, NULL, NULL, '2025-05-08 17:40:05', '2025-05-08 17:40:05'),
(462, 40, NULL, 'مرتبه كبيره', '', 'King Mattress', '', 'images/products/1746711713406.png', 0.00, NULL, NULL, '2025-05-08 17:41:53', '2025-05-08 17:41:53'),
(463, 41, NULL, 'كنبه مقعدين', '', 'Sofa (2Seats)', '', 'images/products/1746712412209.png', 0.00, NULL, NULL, '2025-05-08 17:53:32', '2025-05-08 17:53:32'),
(464, 41, NULL, 'كنبه (3مقاعد)', '', 'Sofa (3Seat)', '', 'images/products/1746712485938.png', 0.00, NULL, NULL, '2025-05-08 17:54:45', '2025-05-08 17:54:45'),
(465, 41, NULL, 'ركنه', '', 'Sofa Corner', '', 'images/products/1746712530811.png', 0.00, NULL, NULL, '2025-05-08 17:55:30', '2025-05-08 17:55:30'),
(466, 42, NULL, 'سجاده (بالمتر)', '', 'Carpet (Per Meter)', '', 'images/products/1746712606136.png', 0.00, NULL, NULL, '2025-05-08 17:56:46', '2025-05-08 17:56:46'),
(467, 42, NULL, 'سجاده ايراني (بالمتر)', '', 'Irani Carpet (Per Meter)', '', 'images/products/1746712677776.png', 0.00, NULL, NULL, '2025-05-08 17:57:57', '2025-05-08 17:57:57'),
(468, 42, NULL, 'سجاده حرير (بالمتر)', '', 'Silk Carpet (Per Meter)', '', 'images/products/1746712740328.png', 0.00, NULL, NULL, '2025-05-08 17:59:00', '2025-05-08 17:59:00'),
(469, 43, NULL, 'ستاره حاجبه (بالمتر)', '', 'Blackout Curtains (Per Meter)', '', 'images/products/1746712825179.png', 0.00, NULL, NULL, '2025-05-08 18:00:25', '2025-05-08 18:00:25'),
(470, 43, NULL, 'ستاره شيفون (بالمتر)', '', 'Chiffon Curtains (Per Meter)', '', 'images/products/1746712897289.png', 0.00, NULL, NULL, '2025-05-08 18:01:37', '2025-05-08 18:01:37'),
(471, 44, NULL, 'كوشن (كبيره)', '', 'Cushion (Large)', '', 'images/products/1746714366614.png', 0.00, NULL, NULL, '2025-05-08 18:26:06', '2025-05-08 18:26:06'),
(472, 44, NULL, 'كوشن (متوسطه)', '', 'Cushion (Medium)', '', 'images/products/1746714457179.png', 0.00, NULL, NULL, '2025-05-08 18:27:37', '2025-05-08 18:27:37'),
(473, 44, NULL, 'كوشن (صغيره)', '', 'Cushion (Small)', '', 'images/products/1746714553539.png', 0.00, NULL, NULL, '2025-05-08 18:29:13', '2025-05-08 18:29:13'),
(474, 44, NULL, 'مخده', '', 'Pillow', '', 'images/products/1746714614629.png', 0.00, NULL, NULL, '2025-05-08 18:30:14', '2025-05-08 18:30:14'),
(475, 44, NULL, 'مفرش ترابيزه (بالمتر)', '', 'Tablecloth (Per Meter)', '', 'images/products/1746714714497.png', 0.00, NULL, NULL, '2025-05-08 18:31:54', '2025-05-08 18:31:54'),
(476, 44, NULL, 'مفرش ترابيزه مزغرف (بالمتر)', '', 'Tablecloth Ornate (Per Meter)', '', 'images/products/1746714855979.png', 0.00, NULL, NULL, '2025-05-08 18:34:15', '2025-05-08 18:34:15'),
(477, 45, NULL, 'كيس النوم', '', 'Sleeping Bag', '', 'images/products/1746715014858.png', 0.00, NULL, NULL, '2025-05-08 18:36:54', '2025-06-05 00:17:11'),
(478, 32, NULL, 'تيست', '', 'test', '', 'images/products/1747939095337.png', 0.00, NULL, '2025-05-22 22:48:30', '2025-05-22 22:38:15', '2025-05-22 22:48:30'),
(479, 32, NULL, 'شيلا', '', 'Shela', '', '', 0.00, NULL, NULL, '2025-06-06 20:54:28', '2025-06-06 20:54:28'),
(480, 41, NULL, 'تيست', '', 'Test', '', 'images/products/1749346640116.jpg', 0.00, NULL, '2025-06-08 06:45:13', '2025-06-08 05:37:20', '2025-06-08 06:45:13'),
(481, 47, NULL, 'تيشيرت', '', 'T-shirt', '', 'images/products/1752950099213.jpeg', 0.00, NULL, '2025-07-19 22:35:28', '2025-07-19 22:34:59', '2025-07-19 22:35:28'),
(482, 46, 1, 'شيلا', '', '10', '', 'D:\\oss\\xampp\\tmp\\php8935.tmp', 9.00, 5.00, NULL, '2025-10-01 05:32:25', '2025-10-01 05:32:25'),
(483, 46, 1, 'شيلا', '', '10', '', 'D:\\oss\\xampp\\tmp\\phpCF1C.tmp', 9.00, 5.00, NULL, '2025-10-01 09:48:01', '2025-10-01 09:48:01'),
(484, 46, 2, 'شيلا1', '', '101', '', 'images/products/1759308518378.png', 15.00, 10.00, NULL, '2025-10-01 09:48:38', '2025-10-01 10:01:22'),
(485, 49, 2, 'شيلا', '', '10', '', 'images/products/1759320182755.png', 9.00, 5.00, NULL, '2025-10-01 13:03:02', '2025-10-01 13:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `discounted_price` double(10,8) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `price`, `discounted_price`, `deleted_at`, `created_at`, `updated_at`, `option_id`) VALUES
(853, 346, 12.00, NULL, NULL, '2025-05-07 18:03:01', '2025-05-07 18:03:01', 4),
(854, 346, 10.00, NULL, NULL, '2025-05-07 18:03:01', '2025-05-07 18:03:01', 5),
(855, 346, 6.00, NULL, NULL, '2025-05-07 18:03:01', '2025-05-07 18:03:01', 6),
(856, 347, 20.00, NULL, NULL, '2025-05-07 18:05:55', '2025-05-07 18:05:55', 4),
(857, 347, 15.00, NULL, NULL, '2025-05-07 18:05:55', '2025-05-07 18:05:55', 5),
(858, 347, 8.00, NULL, NULL, '2025-05-07 18:05:55', '2025-05-07 18:05:55', 6),
(859, 348, 7.00, NULL, NULL, '2025-05-07 18:08:18', '2025-05-07 18:08:18', 4),
(860, 348, 6.00, NULL, NULL, '2025-05-07 18:08:18', '2025-05-07 18:08:18', 5),
(861, 348, 4.00, NULL, NULL, '2025-05-07 18:08:18', '2025-05-07 18:08:18', 6),
(862, 349, 7.00, NULL, NULL, '2025-05-07 18:09:21', '2025-05-07 18:09:21', 4),
(863, 349, 6.00, NULL, NULL, '2025-05-07 18:09:21', '2025-05-07 18:09:21', 5),
(864, 349, 4.00, NULL, NULL, '2025-05-07 18:09:21', '2025-05-07 18:09:21', 6),
(865, 350, 13.00, NULL, NULL, '2025-05-07 18:12:22', '2025-05-07 18:12:22', 4),
(866, 350, 10.00, NULL, NULL, '2025-05-07 18:12:22', '2025-05-07 18:12:22', 5),
(867, 350, 7.00, NULL, NULL, '2025-05-07 18:12:22', '2025-05-07 18:12:22', 6),
(868, 351, 15.00, NULL, NULL, '2025-05-07 18:14:05', '2025-05-07 18:14:05', 4),
(869, 351, 12.00, NULL, NULL, '2025-05-07 18:14:05', '2025-05-07 18:14:05', 5),
(870, 351, 8.00, NULL, NULL, '2025-05-07 18:14:05', '2025-05-07 18:14:05', 6),
(871, 352, 6.00, NULL, NULL, '2025-05-07 18:15:14', '2025-05-07 18:15:14', 4),
(872, 352, 5.00, NULL, NULL, '2025-05-07 18:15:14', '2025-05-07 18:15:14', 5),
(873, 352, 3.00, NULL, NULL, '2025-05-07 18:15:14', '2025-05-07 18:15:14', 6),
(874, 353, 7.00, NULL, NULL, '2025-05-07 18:17:29', '2025-05-07 18:17:29', 4),
(875, 353, 6.00, NULL, NULL, '2025-05-07 18:17:29', '2025-05-07 18:17:29', 5),
(876, 353, 4.00, NULL, NULL, '2025-05-07 18:17:29', '2025-05-07 18:17:29', 6),
(877, 354, 5.00, NULL, NULL, '2025-05-07 18:18:32', '2025-05-07 18:18:32', 4),
(878, 354, 4.00, NULL, NULL, '2025-05-07 18:18:32', '2025-05-07 18:18:32', 5),
(879, 354, 3.00, NULL, NULL, '2025-05-07 18:18:32', '2025-05-07 18:18:32', 6),
(880, 355, 7.00, NULL, NULL, '2025-05-07 18:19:54', '2025-05-07 18:19:54', 4),
(881, 355, 6.00, NULL, NULL, '2025-05-07 18:19:54', '2025-05-07 18:19:54', 5),
(882, 355, 4.00, NULL, NULL, '2025-05-07 18:19:54', '2025-05-07 18:19:54', 6),
(883, 356, 7.00, NULL, NULL, '2025-05-07 18:21:43', '2025-05-07 18:21:43', 4),
(884, 356, 6.00, NULL, NULL, '2025-05-07 18:21:43', '2025-05-07 18:21:43', 5),
(885, 356, 4.00, NULL, NULL, '2025-05-07 18:21:43', '2025-05-07 18:21:43', 6),
(886, 357, 7.00, NULL, NULL, '2025-05-07 18:22:59', '2025-05-07 18:22:59', 4),
(887, 357, 6.00, NULL, NULL, '2025-05-07 18:22:59', '2025-05-07 18:22:59', 5),
(888, 357, 4.00, NULL, NULL, '2025-05-07 18:22:59', '2025-05-07 18:22:59', 6),
(889, 358, 20.00, NULL, NULL, '2025-05-07 18:24:09', '2025-05-07 18:24:09', 4),
(890, 358, 10.00, NULL, NULL, '2025-05-07 18:24:09', '2025-05-07 18:24:09', 6),
(891, 359, 25.00, NULL, NULL, '2025-05-07 18:26:22', '2025-05-07 18:26:22', 4),
(892, 359, 15.00, NULL, NULL, '2025-05-07 18:26:22', '2025-05-07 18:26:22', 6),
(893, 360, 14.00, NULL, NULL, '2025-05-07 18:27:23', '2025-05-07 18:27:23', 4),
(894, 360, 7.00, NULL, NULL, '2025-05-07 18:27:23', '2025-05-07 18:27:23', 6),
(895, 361, 10.00, NULL, NULL, '2025-05-07 18:28:25', '2025-05-07 18:28:25', 4),
(896, 361, 8.00, NULL, NULL, '2025-05-07 18:28:25', '2025-05-07 18:28:25', 5),
(897, 361, 6.00, NULL, NULL, '2025-05-07 18:28:25', '2025-05-07 18:28:25', 6),
(898, 362, 7.00, NULL, NULL, '2025-05-07 18:29:37', '2025-05-07 18:29:37', 4),
(899, 362, 6.00, NULL, NULL, '2025-05-07 18:29:37', '2025-05-07 18:29:37', 5),
(900, 362, 4.00, NULL, NULL, '2025-05-07 18:29:37', '2025-05-07 18:29:37', 6),
(901, 363, 4.00, NULL, NULL, '2025-05-07 18:31:01', '2025-05-07 18:31:01', 4),
(902, 363, 3.00, NULL, NULL, '2025-05-07 18:31:01', '2025-05-07 18:31:01', 5),
(903, 363, 2.00, NULL, NULL, '2025-05-07 18:31:01', '2025-05-07 18:31:01', 6),
(904, 364, 3.00, NULL, NULL, '2025-05-07 18:32:09', '2025-05-07 18:32:09', 4),
(905, 364, 3.00, NULL, NULL, '2025-05-07 18:32:09', '2025-05-07 18:32:09', 5),
(906, 365, 10.00, NULL, NULL, '2025-05-07 19:15:59', '2025-05-07 19:15:59', 4),
(907, 365, 8.00, NULL, NULL, '2025-05-07 19:15:59', '2025-05-07 19:15:59', 5),
(908, 365, 5.00, NULL, NULL, '2025-05-07 19:15:59', '2025-05-07 19:15:59', 6),
(909, 366, 20.00, NULL, NULL, '2025-05-07 19:19:30', '2025-05-07 19:19:30', 4),
(910, 366, 17.00, NULL, NULL, '2025-05-07 19:19:30', '2025-05-07 19:19:30', 5),
(911, 366, 12.00, NULL, NULL, '2025-05-07 19:19:30', '2025-05-07 19:19:30', 6),
(912, 367, 50.00, NULL, NULL, '2025-05-07 19:20:55', '2025-05-07 19:20:55', 4),
(913, 368, 10.00, NULL, NULL, '2025-05-07 19:22:06', '2025-05-07 19:22:06', 4),
(914, 368, 10.00, NULL, NULL, '2025-05-07 19:22:06', '2025-05-07 19:22:06', 5),
(915, 368, 6.00, NULL, NULL, '2025-05-07 19:22:06', '2025-05-07 19:22:06', 6),
(916, 369, 10.00, NULL, NULL, '2025-05-07 19:24:27', '2025-05-07 19:24:27', 4),
(917, 369, 8.00, NULL, NULL, '2025-05-07 19:24:27', '2025-05-07 19:24:27', 5),
(918, 369, 5.00, NULL, NULL, '2025-05-07 19:24:27', '2025-05-07 19:24:27', 6),
(919, 370, 25.00, NULL, NULL, '2025-05-07 19:25:22', '2025-05-07 19:25:22', 4),
(920, 371, 30.00, NULL, NULL, '2025-05-07 19:27:08', '2025-05-07 19:27:08', 4),
(921, 372, 7.00, NULL, NULL, '2025-05-07 19:29:07', '2025-05-07 19:29:07', 4),
(922, 372, 6.00, NULL, NULL, '2025-05-07 19:29:07', '2025-05-07 19:29:07', 5),
(923, 372, 4.00, NULL, NULL, '2025-05-07 19:29:07', '2025-05-07 19:29:07', 6),
(924, 373, 5.00, NULL, NULL, '2025-05-07 19:29:58', '2025-05-07 19:29:58', 4),
(925, 374, 18.00, NULL, NULL, '2025-05-07 19:37:19', '2025-05-07 19:37:19', 4),
(926, 374, 15.00, NULL, NULL, '2025-05-07 19:37:19', '2025-05-07 19:37:19', 5),
(927, 374, 7.00, NULL, NULL, '2025-05-07 19:37:19', '2025-05-07 19:37:19', 6),
(928, 375, 20.00, NULL, NULL, '2025-05-07 19:38:13', '2025-05-07 19:38:13', 4),
(929, 375, 15.00, NULL, NULL, '2025-05-07 19:38:13', '2025-05-07 19:38:13', 5),
(930, 375, 8.00, NULL, NULL, '2025-05-07 19:38:13', '2025-05-07 19:38:13', 6),
(931, 376, 15.00, NULL, NULL, '2025-05-07 19:39:15', '2025-05-07 19:39:15', 4),
(932, 376, 15.00, NULL, NULL, '2025-05-07 19:39:15', '2025-05-07 19:39:15', 5),
(933, 376, 8.00, NULL, NULL, '2025-05-07 19:39:15', '2025-05-07 19:39:15', 6),
(934, 377, 7.00, NULL, NULL, '2025-05-07 19:40:23', '2025-05-07 19:40:23', 4),
(935, 377, 6.00, NULL, NULL, '2025-05-07 19:40:23', '2025-05-07 19:40:23', 5),
(936, 377, 3.50, NULL, NULL, '2025-05-07 19:40:23', '2025-05-07 19:40:23', 6),
(937, 378, 8.00, NULL, NULL, '2025-05-07 19:41:26', '2025-05-07 19:41:26', 4),
(938, 378, 7.00, NULL, NULL, '2025-05-07 19:41:26', '2025-05-07 19:41:26', 5),
(939, 378, 5.00, NULL, NULL, '2025-05-07 19:41:26', '2025-05-07 19:41:26', 6),
(940, 379, 12.00, NULL, NULL, '2025-05-07 19:43:18', '2025-05-07 19:43:18', 4),
(941, 379, 10.00, NULL, NULL, '2025-05-07 19:43:18', '2025-05-07 19:43:18', 5),
(942, 379, 5.00, NULL, NULL, '2025-05-07 19:43:18', '2025-05-07 19:43:18', 6),
(943, 380, 20.00, NULL, NULL, '2025-05-07 19:44:23', '2025-05-07 19:44:23', 4),
(944, 380, 10.00, NULL, NULL, '2025-05-07 19:44:23', '2025-05-07 19:44:23', 5),
(945, 380, 10.00, NULL, NULL, '2025-05-07 19:44:23', '2025-05-07 19:44:23', 6),
(946, 381, 20.00, NULL, NULL, '2025-05-07 19:46:04', '2025-05-07 19:46:04', 4),
(947, 381, 15.00, NULL, NULL, '2025-05-07 19:46:04', '2025-05-07 19:46:04', 5),
(948, 381, 10.00, NULL, NULL, '2025-05-07 19:46:04', '2025-05-07 19:46:04', 6),
(949, 382, 60.00, NULL, NULL, '2025-05-07 19:47:03', '2025-05-07 19:47:03', 4),
(950, 382, 40.00, NULL, NULL, '2025-05-07 19:47:03', '2025-05-07 19:47:03', 5),
(951, 382, 25.00, NULL, NULL, '2025-05-07 19:47:03', '2025-05-07 19:47:03', 6),
(952, 383, 8.00, NULL, '2025-05-07 19:51:28', '2025-05-07 19:48:37', '2025-05-07 19:51:28', 4),
(953, 383, 6.00, NULL, '2025-05-07 19:51:28', '2025-05-07 19:48:37', '2025-05-07 19:51:28', 5),
(954, 383, 3.00, NULL, '2025-05-07 19:51:28', '2025-05-07 19:48:37', '2025-05-07 19:51:28', 6),
(955, 384, 10.00, NULL, NULL, '2025-05-07 19:51:03', '2025-05-07 19:51:03', 4),
(956, 384, 8.00, NULL, NULL, '2025-05-07 19:51:03', '2025-05-07 19:51:03', 5),
(957, 384, 5.00, NULL, NULL, '2025-05-07 19:51:03', '2025-05-07 19:51:03', 6),
(958, 383, 8.00, NULL, NULL, '2025-05-07 19:51:28', '2025-05-07 19:51:28', 4),
(959, 383, 6.00, NULL, NULL, '2025-05-07 19:51:28', '2025-05-07 19:51:28', 5),
(960, 383, 3.00, NULL, NULL, '2025-05-07 19:51:28', '2025-05-07 19:51:28', 6),
(961, 385, 8.00, NULL, NULL, '2025-05-07 19:53:51', '2025-05-07 19:53:51', 4),
(962, 385, 6.00, NULL, NULL, '2025-05-07 19:53:51', '2025-05-07 19:53:51', 5),
(963, 385, 4.00, NULL, NULL, '2025-05-07 19:53:51', '2025-05-07 19:53:51', 6),
(964, 386, 13.00, NULL, NULL, '2025-05-07 19:54:51', '2025-05-07 19:54:51', 4),
(965, 386, 11.00, NULL, NULL, '2025-05-07 19:54:51', '2025-05-07 19:54:51', 5),
(966, 386, 7.00, NULL, NULL, '2025-05-07 19:54:51', '2025-05-07 19:54:51', 6),
(967, 387, 20.00, NULL, NULL, '2025-05-07 19:55:59', '2025-05-07 19:55:59', 4),
(968, 387, 15.00, NULL, NULL, '2025-05-07 19:55:59', '2025-05-07 19:55:59', 5),
(969, 387, 10.00, NULL, NULL, '2025-05-07 19:55:59', '2025-05-07 19:55:59', 6),
(970, 388, 8.00, NULL, NULL, '2025-05-07 19:56:59', '2025-05-07 19:56:59', 4),
(971, 388, 6.00, NULL, NULL, '2025-05-07 19:56:59', '2025-05-07 19:56:59', 5),
(972, 388, 5.00, NULL, NULL, '2025-05-07 19:56:59', '2025-05-07 19:56:59', 6),
(973, 389, 12.00, NULL, NULL, '2025-05-07 19:57:55', '2025-05-07 19:57:55', 4),
(974, 389, 10.00, NULL, NULL, '2025-05-07 19:57:55', '2025-05-07 19:57:55', 5),
(975, 389, 8.00, NULL, NULL, '2025-05-07 19:57:55', '2025-05-07 19:57:55', 6),
(976, 390, 8.00, NULL, NULL, '2025-05-07 20:01:17', '2025-05-07 20:01:17', 4),
(977, 390, 7.00, NULL, NULL, '2025-05-07 20:01:17', '2025-05-07 20:01:17', 5),
(978, 390, 6.00, NULL, NULL, '2025-05-07 20:01:17', '2025-05-07 20:01:17', 6),
(979, 391, 4.00, NULL, NULL, '2025-05-07 20:02:36', '2025-05-07 20:02:36', 4),
(980, 391, 3.00, NULL, NULL, '2025-05-07 20:02:36', '2025-05-07 20:02:36', 5),
(981, 391, 2.00, NULL, NULL, '2025-05-07 20:02:36', '2025-05-07 20:02:36', 6),
(982, 392, 8.00, NULL, NULL, '2025-05-07 20:04:22', '2025-05-07 20:04:22', 4),
(983, 392, 7.00, NULL, NULL, '2025-05-07 20:04:22', '2025-05-07 20:04:22', 5),
(984, 392, 4.00, NULL, NULL, '2025-05-07 20:04:22', '2025-05-07 20:04:22', 6),
(985, 393, 10.00, NULL, NULL, '2025-05-07 20:05:21', '2025-05-07 20:05:21', 4),
(986, 393, 8.00, NULL, NULL, '2025-05-07 20:05:21', '2025-05-07 20:05:21', 5),
(987, 393, 6.00, NULL, NULL, '2025-05-07 20:05:21', '2025-05-07 20:05:21', 6),
(988, 394, 3.00, NULL, NULL, '2025-05-07 20:05:57', '2025-05-07 20:05:57', 4),
(989, 394, 3.00, NULL, NULL, '2025-05-07 20:05:57', '2025-05-07 20:05:57', 5),
(990, 395, 3.00, NULL, NULL, '2025-05-07 20:06:45', '2025-05-07 20:06:45', 4),
(991, 395, 3.00, NULL, NULL, '2025-05-07 20:06:45', '2025-05-07 20:06:45', 5),
(992, 396, 7.00, NULL, NULL, '2025-05-07 20:07:32', '2025-05-07 20:07:32', 4),
(993, 396, 6.00, NULL, NULL, '2025-05-07 20:07:32', '2025-05-07 20:07:32', 5),
(994, 396, 4.00, NULL, NULL, '2025-05-07 20:07:32', '2025-05-07 20:07:32', 6),
(995, 397, 5.00, NULL, NULL, '2025-05-07 20:08:46', '2025-05-07 20:08:46', 4),
(996, 397, 4.00, NULL, NULL, '2025-05-07 20:08:46', '2025-05-07 20:08:46', 5),
(997, 397, 3.00, NULL, NULL, '2025-05-07 20:08:46', '2025-05-07 20:08:46', 6),
(998, 398, 6.00, NULL, NULL, '2025-05-07 20:09:54', '2025-05-07 20:09:54', 4),
(999, 398, 5.00, NULL, NULL, '2025-05-07 20:09:54', '2025-05-07 20:09:54', 5),
(1000, 398, 4.00, NULL, NULL, '2025-05-07 20:09:54', '2025-05-07 20:09:54', 6),
(1001, 399, 5.00, NULL, NULL, '2025-05-07 20:11:23', '2025-05-07 20:11:23', 4),
(1002, 399, 3.00, NULL, NULL, '2025-05-07 20:11:23', '2025-05-07 20:11:23', 5),
(1003, 399, 2.00, NULL, NULL, '2025-05-07 20:11:23', '2025-05-07 20:11:23', 6),
(1004, 400, 6.00, NULL, NULL, '2025-05-07 20:13:07', '2025-05-07 20:13:07', 4),
(1005, 400, 4.00, NULL, NULL, '2025-05-07 20:13:07', '2025-05-07 20:13:07', 5),
(1006, 400, 2.00, NULL, NULL, '2025-05-07 20:13:07', '2025-05-07 20:13:07', 6),
(1007, 401, 5.00, NULL, NULL, '2025-05-07 20:15:59', '2025-05-07 20:15:59', 4),
(1008, 401, 3.00, NULL, NULL, '2025-05-07 20:15:59', '2025-05-07 20:15:59', 5),
(1009, 401, 2.00, NULL, NULL, '2025-05-07 20:15:59', '2025-05-07 20:15:59', 6),
(1010, 402, 4.00, NULL, NULL, '2025-05-07 20:17:23', '2025-05-07 20:17:23', 4),
(1011, 402, 2.00, NULL, NULL, '2025-05-07 20:17:23', '2025-05-07 20:17:23', 5),
(1012, 402, 1.00, NULL, NULL, '2025-05-07 20:17:23', '2025-05-07 20:17:23', 6),
(1013, 403, 10.00, NULL, NULL, '2025-05-07 20:20:27', '2025-05-07 20:20:27', 4),
(1014, 403, 5.00, NULL, NULL, '2025-05-07 20:20:27', '2025-05-07 20:20:27', 5),
(1015, 403, 3.00, NULL, NULL, '2025-05-07 20:20:27', '2025-05-07 20:20:27', 6),
(1016, 404, 11.00, NULL, NULL, '2025-05-07 20:22:15', '2025-05-07 20:22:15', 4),
(1017, 404, 6.00, NULL, NULL, '2025-05-07 20:22:15', '2025-05-07 20:22:15', 5),
(1018, 404, 4.00, NULL, NULL, '2025-05-07 20:22:15', '2025-05-07 20:22:15', 6),
(1019, 405, 8.00, NULL, NULL, '2025-05-07 20:24:03', '2025-05-07 20:24:03', 4),
(1020, 405, 6.00, NULL, NULL, '2025-05-07 20:24:03', '2025-05-07 20:24:03', 5),
(1021, 405, 4.00, NULL, NULL, '2025-05-07 20:24:03', '2025-05-07 20:24:03', 6),
(1022, 406, 9.00, NULL, NULL, '2025-05-07 20:24:51', '2025-05-07 20:24:51', 4),
(1023, 406, 7.00, NULL, NULL, '2025-05-07 20:24:51', '2025-05-07 20:24:51', 5),
(1024, 406, 5.00, NULL, NULL, '2025-05-07 20:24:51', '2025-05-07 20:24:51', 6),
(1025, 407, 7.00, NULL, NULL, '2025-05-07 20:26:00', '2025-05-07 20:26:00', 4),
(1026, 407, 5.00, NULL, NULL, '2025-05-07 20:26:00', '2025-05-07 20:26:00', 5),
(1027, 407, 3.00, NULL, NULL, '2025-05-07 20:26:00', '2025-05-07 20:26:00', 6),
(1028, 408, 10.00, NULL, NULL, '2025-05-07 20:29:35', '2025-05-07 20:29:35', 4),
(1029, 408, 3.00, NULL, NULL, '2025-05-07 20:29:35', '2025-05-07 20:29:35', 5),
(1030, 408, 2.00, NULL, NULL, '2025-05-07 20:29:35', '2025-05-07 20:29:35', 6),
(1031, 409, 5.00, NULL, NULL, '2025-05-07 21:11:55', '2025-05-07 21:11:55', 4),
(1032, 409, 3.00, NULL, NULL, '2025-05-07 21:11:55', '2025-05-07 21:11:55', 5),
(1033, 409, 2.00, NULL, NULL, '2025-05-07 21:11:55', '2025-05-07 21:11:55', 6),
(1034, 410, 9.00, NULL, NULL, '2025-05-07 21:13:26', '2025-05-07 21:13:26', 4),
(1035, 410, 6.00, NULL, NULL, '2025-05-07 21:13:26', '2025-05-07 21:13:26', 5),
(1036, 410, 3.00, NULL, NULL, '2025-05-07 21:13:26', '2025-05-07 21:13:26', 6),
(1037, 411, 10.00, NULL, NULL, '2025-05-07 21:16:59', '2025-05-07 21:16:59', 4),
(1038, 412, 10.00, NULL, NULL, '2025-05-07 21:23:57', '2025-05-07 21:23:57', 4),
(1039, 412, 5.00, NULL, NULL, '2025-05-07 21:23:57', '2025-05-07 21:23:57', 5),
(1040, 412, 3.00, NULL, NULL, '2025-05-07 21:23:57', '2025-05-07 21:23:57', 6),
(1041, 413, 12.00, NULL, NULL, '2025-05-07 21:25:05', '2025-05-07 21:25:05', 4),
(1042, 413, 10.00, NULL, NULL, '2025-05-07 21:25:05', '2025-05-07 21:25:05', 5),
(1043, 413, 6.00, NULL, NULL, '2025-05-07 21:25:05', '2025-05-07 21:25:05', 6),
(1044, 414, 2.00, NULL, NULL, '2025-05-07 21:26:37', '2025-05-07 21:26:37', 5),
(1045, 414, 1.00, NULL, NULL, '2025-05-07 21:26:37', '2025-05-07 21:26:37', 6),
(1046, 415, 3.00, NULL, NULL, '2025-05-07 21:28:23', '2025-05-07 21:28:23', 4),
(1047, 415, 2.00, NULL, NULL, '2025-05-07 21:28:23', '2025-05-07 21:28:23', 5),
(1048, 415, 1.00, NULL, NULL, '2025-05-07 21:28:23', '2025-05-07 21:28:23', 6),
(1049, 416, 5.00, NULL, NULL, '2025-05-07 21:29:08', '2025-05-07 21:29:08', 4),
(1050, 417, 7.00, NULL, NULL, '2025-05-07 21:30:38', '2025-05-07 21:30:38', 4),
(1051, 417, 6.00, NULL, NULL, '2025-05-07 21:30:38', '2025-05-07 21:30:38', 5),
(1052, 417, 4.00, NULL, NULL, '2025-05-07 21:30:38', '2025-05-07 21:30:38', 6),
(1053, 418, 15.00, NULL, NULL, '2025-05-07 21:34:07', '2025-05-07 21:34:07', 4),
(1054, 418, 12.00, NULL, NULL, '2025-05-07 21:34:07', '2025-05-07 21:34:07', 5),
(1055, 418, 5.00, NULL, NULL, '2025-05-07 21:34:07', '2025-05-07 21:34:07', 6),
(1056, 419, 8.00, NULL, NULL, '2025-05-07 21:35:42', '2025-05-07 21:35:42', 4),
(1057, 419, 6.00, NULL, NULL, '2025-05-07 21:35:42', '2025-05-07 21:35:42', 5),
(1058, 419, 3.00, NULL, NULL, '2025-05-07 21:35:42', '2025-05-07 21:35:42', 6),
(1059, 420, 3.00, NULL, NULL, '2025-05-07 21:37:04', '2025-05-07 21:37:04', 4),
(1060, 420, 2.00, NULL, NULL, '2025-05-07 21:37:04', '2025-05-07 21:37:04', 5),
(1061, 420, 1.00, NULL, NULL, '2025-05-07 21:37:04', '2025-05-07 21:37:04', 6),
(1062, 421, 8.00, NULL, NULL, '2025-05-07 21:37:57', '2025-05-07 21:37:57', 4),
(1063, 421, 6.00, NULL, NULL, '2025-05-07 21:37:57', '2025-05-07 21:37:57', 5),
(1064, 421, 4.00, NULL, NULL, '2025-05-07 21:37:57', '2025-05-07 21:37:57', 6),
(1065, 422, 12.00, NULL, NULL, '2025-05-07 21:39:24', '2025-05-07 21:39:24', 4),
(1066, 422, 8.00, NULL, NULL, '2025-05-07 21:39:24', '2025-05-07 21:39:24', 5),
(1067, 422, 5.00, NULL, NULL, '2025-05-07 21:39:24', '2025-05-07 21:39:24', 6),
(1068, 423, 15.00, NULL, NULL, '2025-05-07 21:40:22', '2025-05-07 21:40:22', 4),
(1069, 423, 10.00, NULL, NULL, '2025-05-07 21:40:22', '2025-05-07 21:40:22', 5),
(1070, 423, 5.00, NULL, NULL, '2025-05-07 21:40:22', '2025-05-07 21:40:22', 6),
(1071, 424, 12.00, NULL, NULL, '2025-05-07 21:41:24', '2025-05-07 21:41:24', 4),
(1072, 424, 8.00, NULL, NULL, '2025-05-07 21:41:24', '2025-05-07 21:41:24', 5),
(1073, 424, 5.00, NULL, NULL, '2025-05-07 21:41:24', '2025-05-07 21:41:24', 6),
(1074, 425, 12.00, NULL, NULL, '2025-05-07 21:44:36', '2025-05-07 21:44:36', 4),
(1075, 425, 8.00, NULL, NULL, '2025-05-07 21:44:36', '2025-05-07 21:44:36', 5),
(1076, 425, 5.00, NULL, NULL, '2025-05-07 21:44:36', '2025-05-07 21:44:36', 6),
(1077, 426, 8.00, NULL, '2025-05-08 02:56:13', '2025-05-08 00:48:06', '2025-05-08 02:56:13', 4),
(1078, 426, 6.00, NULL, '2025-05-08 02:56:13', '2025-05-08 00:48:06', '2025-05-08 02:56:13', 5),
(1079, 426, 5.00, NULL, '2025-05-08 02:56:13', '2025-05-08 00:48:06', '2025-05-08 02:56:13', 6),
(1080, 427, 10.00, NULL, '2025-05-08 02:56:48', '2025-05-08 01:16:06', '2025-05-08 02:56:48', 4),
(1081, 427, 8.00, NULL, '2025-05-08 02:56:48', '2025-05-08 01:16:06', '2025-05-08 02:56:48', 5),
(1082, 427, 6.00, NULL, '2025-05-08 02:56:48', '2025-05-08 01:16:06', '2025-05-08 02:56:48', 6),
(1083, 428, 60.00, NULL, '2025-05-17 23:03:42', '2025-05-08 01:47:52', '2025-05-17 23:03:42', 5),
(1084, 429, 110.00, NULL, '2025-05-17 23:04:10', '2025-05-08 01:49:38', '2025-05-17 23:04:10', 4),
(1085, 430, 80.00, NULL, '2025-05-17 23:04:35', '2025-05-08 01:50:39', '2025-05-17 23:04:35', 6),
(1086, 431, 15.00, NULL, '2025-05-08 03:51:16', '2025-05-08 01:57:36', '2025-05-08 03:51:16', 4),
(1087, 431, 8.00, NULL, '2025-05-08 03:51:16', '2025-05-08 01:57:36', '2025-05-08 03:51:16', 5),
(1088, 431, 5.00, NULL, '2025-05-08 03:51:16', '2025-05-08 01:57:36', '2025-05-08 03:51:16', 6),
(1089, 426, 8.00, NULL, NULL, '2025-05-08 02:56:13', '2025-05-08 02:56:13', 4),
(1090, 426, 6.00, NULL, NULL, '2025-05-08 02:56:13', '2025-05-08 02:56:13', 5),
(1091, 426, 5.00, NULL, NULL, '2025-05-08 02:56:13', '2025-05-08 02:56:13', 6),
(1092, 427, 10.00, NULL, NULL, '2025-05-08 02:56:48', '2025-05-08 02:56:48', 4),
(1093, 427, 8.00, NULL, NULL, '2025-05-08 02:56:48', '2025-05-08 02:56:48', 5),
(1094, 427, 6.00, NULL, NULL, '2025-05-08 02:56:48', '2025-05-08 02:56:48', 6),
(1095, 432, 15.00, NULL, NULL, '2025-05-08 02:59:44', '2025-05-08 02:59:44', 4),
(1096, 432, 8.00, NULL, NULL, '2025-05-08 02:59:44', '2025-05-08 02:59:44', 5),
(1097, 432, 5.00, NULL, NULL, '2025-05-08 02:59:44', '2025-05-08 02:59:44', 6),
(1098, 433, 22.00, NULL, '2025-05-08 03:05:37', '2025-05-08 03:02:27', '2025-05-08 03:05:37', 4),
(1099, 433, 20.00, NULL, '2025-05-08 03:05:37', '2025-05-08 03:02:27', '2025-05-08 03:05:37', 5),
(1100, 433, 12.00, NULL, '2025-05-08 03:05:37', '2025-05-08 03:02:27', '2025-05-08 03:05:37', 6),
(1101, 434, 27.00, NULL, NULL, '2025-05-08 03:05:09', '2025-05-08 03:05:09', 4),
(1102, 434, 25.00, NULL, NULL, '2025-05-08 03:05:09', '2025-05-08 03:05:09', 5),
(1103, 434, 12.00, NULL, NULL, '2025-05-08 03:05:09', '2025-05-08 03:05:09', 6),
(1104, 433, 22.00, NULL, NULL, '2025-05-08 03:05:37', '2025-05-08 03:05:37', 4),
(1105, 433, 20.00, NULL, NULL, '2025-05-08 03:05:37', '2025-05-08 03:05:37', 5),
(1106, 433, 12.00, NULL, NULL, '2025-05-08 03:05:37', '2025-05-08 03:05:37', 6),
(1107, 435, 25.00, NULL, NULL, '2025-05-08 03:30:55', '2025-05-08 03:30:55', 4),
(1108, 436, 35.00, NULL, NULL, '2025-05-08 03:33:04', '2025-05-08 03:33:04', 4),
(1109, 437, 40.00, NULL, NULL, '2025-05-08 03:35:11', '2025-05-08 03:35:11', 4),
(1110, 438, 15.00, NULL, NULL, '2025-05-08 03:37:02', '2025-05-08 03:37:02', 4),
(1111, 438, 10.00, NULL, NULL, '2025-05-08 03:37:02', '2025-05-08 03:37:02', 5),
(1112, 439, 20.00, NULL, NULL, '2025-05-08 03:38:39', '2025-05-08 03:38:39', 4),
(1113, 439, 15.00, NULL, NULL, '2025-05-08 03:38:39', '2025-05-08 03:38:39', 5),
(1114, 440, 30.00, NULL, NULL, '2025-05-08 03:40:31', '2025-05-08 03:40:31', 4),
(1115, 440, 25.00, NULL, NULL, '2025-05-08 03:40:31', '2025-05-08 03:40:31', 5),
(1116, 441, 5.00, NULL, NULL, '2025-05-08 03:42:14', '2025-05-08 03:42:14', 4),
(1117, 441, 5.00, NULL, NULL, '2025-05-08 03:42:14', '2025-05-08 03:42:14', 5),
(1118, 442, 4.00, NULL, NULL, '2025-05-08 03:44:23', '2025-05-08 03:44:23', 4),
(1119, 442, 4.00, NULL, NULL, '2025-05-08 03:44:23', '2025-05-08 03:44:23', 5),
(1120, 443, 3.00, NULL, NULL, '2025-05-08 03:46:15', '2025-05-08 03:46:15', 4),
(1121, 443, 3.00, NULL, NULL, '2025-05-08 03:46:15', '2025-05-08 03:46:15', 5),
(1122, 444, 2.00, NULL, NULL, '2025-05-08 03:47:27', '2025-05-08 03:47:27', 4),
(1123, 444, 2.00, NULL, NULL, '2025-05-08 03:47:27', '2025-05-08 03:47:27', 5),
(1124, 445, 6.00, NULL, NULL, '2025-05-08 03:49:28', '2025-05-08 03:49:28', 4),
(1125, 445, 5.00, NULL, NULL, '2025-05-08 03:49:28', '2025-05-08 03:49:28', 5),
(1126, 446, 15.00, NULL, NULL, '2025-05-08 03:53:40', '2025-05-08 03:53:40', 4),
(1127, 446, 10.00, NULL, NULL, '2025-05-08 03:53:40', '2025-05-08 03:53:40', 5),
(1128, 447, 15.00, NULL, NULL, '2025-05-08 16:53:07', '2025-05-08 16:53:07', 4),
(1129, 448, 12.50, NULL, NULL, '2025-05-08 17:00:57', '2025-05-08 17:00:57', 4),
(1130, 449, 10.00, NULL, NULL, '2025-05-08 17:01:51', '2025-05-08 17:01:51', 4),
(1131, 450, 15.00, NULL, NULL, '2025-05-08 17:14:14', '2025-05-08 17:14:14', 5),
(1132, 451, 50.00, NULL, NULL, '2025-05-08 17:23:06', '2025-05-08 17:23:06', 5),
(1133, 452, 40.00, NULL, NULL, '2025-05-08 17:24:17', '2025-05-08 17:24:17', 5),
(1134, 453, 30.00, NULL, NULL, '2025-05-08 17:25:50', '2025-05-08 17:25:50', 5),
(1135, 454, 8.00, NULL, NULL, '2025-05-08 17:28:01', '2025-05-08 17:28:01', 4),
(1136, 454, 6.00, NULL, NULL, '2025-05-08 17:28:01', '2025-05-08 17:28:01', 5),
(1137, 454, 5.00, NULL, NULL, '2025-05-08 17:28:01', '2025-05-08 17:28:01', 6),
(1138, 455, 10.00, NULL, NULL, '2025-05-08 17:29:45', '2025-05-08 17:29:45', 4),
(1139, 455, 8.00, NULL, NULL, '2025-05-08 17:29:45', '2025-05-08 17:29:45', 5),
(1140, 455, 6.00, NULL, NULL, '2025-05-08 17:29:45', '2025-05-08 17:29:45', 6),
(1141, 456, 4.00, NULL, NULL, '2025-05-08 17:34:39', '2025-05-08 17:34:39', 4),
(1142, 456, 3.00, NULL, NULL, '2025-05-08 17:34:39', '2025-05-08 17:34:39', 5),
(1143, 456, 2.00, NULL, NULL, '2025-05-08 17:34:39', '2025-05-08 17:34:39', 6),
(1144, 457, 5.00, NULL, NULL, '2025-05-08 17:36:25', '2025-05-08 17:36:25', 5),
(1145, 458, 4.00, NULL, NULL, '2025-05-08 17:37:23', '2025-05-08 17:37:23', 5),
(1146, 459, 3.00, NULL, NULL, '2025-05-08 17:38:13', '2025-05-08 17:38:13', 5),
(1147, 460, 45.00, NULL, NULL, '2025-05-08 17:39:07', '2025-05-08 17:39:07', 5),
(1148, 461, 75.00, NULL, NULL, '2025-05-08 17:40:05', '2025-05-08 17:40:05', 5),
(1149, 462, 170.00, NULL, NULL, '2025-05-08 17:41:53', '2025-05-08 17:41:53', 5),
(1150, 463, 125.00, NULL, '2025-05-17 23:01:04', '2025-05-08 17:53:32', '2025-05-17 23:01:04', 5),
(1151, 464, 160.00, NULL, '2025-05-17 23:01:46', '2025-05-08 17:54:45', '2025-05-17 23:01:46', 5),
(1152, 465, 175.00, NULL, '2025-05-17 23:02:32', '2025-05-08 17:55:30', '2025-05-17 23:02:32', 5),
(1153, 466, 15.00, NULL, NULL, '2025-05-08 17:56:46', '2025-05-08 17:56:46', 5),
(1154, 467, 20.00, NULL, NULL, '2025-05-08 17:57:57', '2025-05-08 17:57:57', 5),
(1155, 468, 25.00, NULL, NULL, '2025-05-08 17:59:00', '2025-05-08 17:59:00', 5),
(1156, 469, 25.00, NULL, NULL, '2025-05-08 18:00:25', '2025-05-08 18:00:25', 5),
(1157, 470, 15.00, NULL, NULL, '2025-05-08 18:01:37', '2025-05-08 18:01:37', 5),
(1158, 471, 10.00, NULL, NULL, '2025-05-08 18:26:06', '2025-05-08 18:26:06', 5),
(1159, 472, 8.00, NULL, NULL, '2025-05-08 18:27:37', '2025-05-08 18:27:37', 5),
(1160, 473, 5.00, NULL, NULL, '2025-05-08 18:29:13', '2025-05-08 18:29:13', 5),
(1161, 474, 15.00, NULL, NULL, '2025-05-08 18:30:14', '2025-05-08 18:30:14', 4),
(1162, 475, 7.00, NULL, NULL, '2025-05-08 18:31:54', '2025-05-08 18:31:54', 5),
(1163, 476, 8.00, NULL, NULL, '2025-05-08 18:34:15', '2025-05-08 18:34:15', 5),
(1164, 477, 40.00, NULL, '2025-05-08 18:37:19', '2025-05-08 18:36:54', '2025-05-08 18:37:19', 4),
(1165, 477, 40.00, NULL, '2025-06-05 00:15:41', '2025-05-08 18:37:19', '2025-06-05 00:15:41', 4),
(1166, 463, 70.00, NULL, NULL, '2025-05-17 23:01:04', '2025-05-17 23:01:04', 5),
(1167, 464, 100.00, NULL, NULL, '2025-05-17 23:01:46', '2025-05-17 23:01:46', 5),
(1168, 465, 150.00, NULL, NULL, '2025-05-17 23:02:32', '2025-05-17 23:02:32', 5),
(1169, 428, 70.00, NULL, NULL, '2025-05-17 23:03:42', '2025-05-17 23:03:42', 5),
(1170, 429, 120.00, NULL, NULL, '2025-05-17 23:04:10', '2025-05-17 23:04:10', 4),
(1171, 430, 90.00, NULL, NULL, '2025-05-17 23:04:35', '2025-05-17 23:04:35', 6),
(1172, 478, 100.00, NULL, '2025-05-22 22:48:23', '2025-05-22 22:38:15', '2025-05-22 22:48:23', 4),
(1173, 478, 100.00, NULL, '2025-05-22 22:48:30', '2025-05-22 22:48:23', '2025-05-22 22:48:30', 4),
(1174, 477, 40.00, NULL, '2025-06-05 00:17:11', '2025-06-05 00:15:41', '2025-06-05 00:17:11', 4),
(1175, 477, 40.00, NULL, NULL, '2025-06-05 00:17:11', '2025-06-05 00:17:11', 4),
(1176, 479, 10.00, NULL, NULL, '2025-06-06 20:54:28', '2025-06-06 20:54:28', 4),
(1177, 479, 10.00, NULL, NULL, '2025-06-06 20:54:28', '2025-06-06 20:54:28', 5),
(1178, 480, 15.00, 10.00000000, '2025-06-08 05:38:57', '2025-06-08 05:37:20', '2025-06-08 05:38:57', 4),
(1179, 480, 20.00, 14.00000000, '2025-06-08 05:38:57', '2025-06-08 05:37:20', '2025-06-08 05:38:57', 5),
(1180, 480, 10.00, 8.00000000, '2025-06-08 05:38:57', '2025-06-08 05:37:20', '2025-06-08 05:38:57', 6),
(1181, 480, 15.00, 9.00000000, '2025-06-08 05:40:37', '2025-06-08 05:38:57', '2025-06-08 05:40:37', 4),
(1182, 480, 20.00, 14.00000000, '2025-06-08 05:40:37', '2025-06-08 05:38:57', '2025-06-08 05:40:37', 5),
(1183, 480, 10.00, 8.00000000, '2025-06-08 05:40:37', '2025-06-08 05:38:57', '2025-06-08 05:40:37', 6),
(1184, 480, 15.00, 11.00000000, '2025-06-08 06:40:47', '2025-06-08 05:40:37', '2025-06-08 06:40:47', 4),
(1185, 480, 20.00, 14.00000000, '2025-06-08 06:40:47', '2025-06-08 05:40:37', '2025-06-08 06:40:47', 5),
(1186, 480, 10.00, 8.00000000, '2025-06-08 06:40:47', '2025-06-08 05:40:37', '2025-06-08 06:40:47', 6),
(1187, 480, 15.00, 11.00000000, '2025-06-08 06:45:13', '2025-06-08 06:40:47', '2025-06-08 06:45:13', 4),
(1188, 480, 20.00, 14.00000000, '2025-06-08 06:45:13', '2025-06-08 06:40:47', '2025-06-08 06:45:13', 5),
(1189, 480, 10.00, 8.00000000, '2025-06-08 06:45:13', '2025-06-08 06:40:47', '2025-06-08 06:45:13', 6),
(1190, 481, 12.00, 8.00000000, '2025-07-19 22:35:28', '2025-07-19 22:34:59', '2025-07-19 22:35:28', 4);

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(7) NOT NULL,
  `discount_type` enum('constant','percentage') NOT NULL DEFAULT 'percentage',
  `value` float NOT NULL,
  `expiration_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `store_id`, `code`, `discount_type`, `value`, `expiration_datetime`, `created_at`, `updated_at`) VALUES
(3, 2, 'F67892', 'percentage', 40, '2025-10-23 07:54:02', '2025-10-01 04:43:58', '2025-10-06 22:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes_companies`
--

CREATE TABLE `promo_codes_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes_countries`
--

CREATE TABLE `promo_codes_countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes_old`
--

CREATE TABLE `promo_codes_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `value_type` enum('percentage','constant') NOT NULL,
  `type` enum('countries','companies','products') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes_products`
--

CREATE TABLE `promo_codes_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_code_offers`
--

CREATE TABLE `promo_code_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_code_id` bigint(20) UNSIGNED NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name_ar`, `name_en`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'جى فى سى', 'JVC', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(2, 'بزنس باي', 'Business Bay', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(3, 'أب تاون برج خليفة', 'Uptown Burj Khalifa', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(4, 'دبي مارينا', 'Dubai Marina', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(5, 'بالم جميرا', 'Palm Jumeira', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(6, 'تلال دبي', 'Dubai Hills', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(7, 'البرشا جنوب', 'Barsha South', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(8, 'البرشا', 'Albarsha', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(9, 'مردف', 'Mirdif', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL),
(10, 'الورقا', 'Alwarqa', 1, '2024-12-02 07:03:44', '2024-12-02 07:03:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `review` varchar(500) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `order_id`, `review`, `rating`, `created_at`, `updated_at`) VALUES
(8, 151, 'best store and service used ever!!', 5, '2025-10-04 12:41:06', '2025-10-04 12:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min_order_price` int(11) NOT NULL,
  `first_order_cash_back_value` double NOT NULL,
  `first_order_cash_back_value_type` enum('percentage','constant') NOT NULL,
  `invitation_code_owner_cash_value` double NOT NULL,
  `invitation_code_owner_cash_value_type` enum('percentage','constant') NOT NULL,
  `invitation_code_user_cash_value` double NOT NULL,
  `invitation_code_user_cash_value_type` enum('percentage','constant') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `min_order_price`, `first_order_cash_back_value`, `first_order_cash_back_value_type`, `invitation_code_owner_cash_value`, `invitation_code_owner_cash_value_type`, `invitation_code_user_cash_value`, `invitation_code_user_cash_value_type`, `deleted_at`) VALUES
(1, 50, 100, 'constant', 20, 'percentage', 20, 'percentage', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_visits`
--

CREATE TABLE `site_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `platform` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_visits`
--

INSERT INTO `site_visits` (`id`, `ip_address`, `city`, `region`, `country`, `latitude`, `longitude`, `browser`, `platform`, `created_at`, `updated_at`) VALUES
(1, '197.134.121.225', 'Cairo', 'Cairo Governorate', 'Egypt', 30.05070000, 31.24890000, '0', '0', '2025-05-02 06:48:05', '2025-05-02 06:48:05'),
(2, '197.134.121.225', 'Cairo', 'Cairo Governorate', 'Egypt', 30.05070000, 31.24890000, '0', '0', '2025-05-02 06:48:06', '2025-05-02 06:48:06'),
(3, '197.134.121.225', 'Cairo', 'Cairo Governorate', 'Egypt', 30.05070000, 31.24890000, '0', '0', '2025-05-02 06:48:06', '2025-05-02 06:48:06'),
(4, '197.134.121.225', 'Cairo', 'Cairo Governorate', 'Egypt', 30.05070000, 31.24890000, '0', '0', '2025-05-02 06:48:07', '2025-05-02 06:48:07'),
(5, '2a02:4780:a:c0de::84', 'Manchester', 'England', 'United Kingdom', 53.48090000, -2.23740000, '0', '0', '2025-05-02 06:48:08', '2025-05-02 06:48:08'),
(6, '66.249.88.43', '', '', 'United States', 37.75100000, -97.82200000, '0', '0', '2025-05-02 06:48:08', '2025-05-02 06:48:08'),
(7, '74.125.218.40', '', '', 'United States', 37.75100000, -97.82200000, '0', '0', '2025-05-02 06:48:09', '2025-05-02 06:48:09'),
(8, '2001:8f8:1d6f:62d:c52b:aa7b:6e46:1d03', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:09', '2025-05-02 06:48:09'),
(9, '86.99.79.74', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:10', '2025-05-02 06:48:10'),
(10, '2001:8f8:1dd5:2071:450d:920c:4c4d:e8a4', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:11', '2025-05-02 06:48:11'),
(11, '94.204.69.10', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:12', '2025-05-02 06:48:12'),
(12, '2001:8f8:1d6f:62d:c52b:aa7b:6e46:1d03', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:12', '2025-05-02 06:48:12'),
(13, '87.200.161.101', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:13', '2025-05-02 06:48:13'),
(14, '31.218.38.1', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:14', '2025-05-02 06:48:14'),
(15, '2001:8f8:1d28:4f4c:54f9:d7d7:4278:dd39', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:15', '2025-05-02 06:48:15'),
(16, '81.17.122.114', 'Mumbai', 'Maharashtra', 'India', 19.07480000, 72.88560000, '0', '0', '2025-05-02 06:48:15', '2025-05-02 06:48:15'),
(17, '83.111.90.100', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:16', '2025-05-02 06:48:16'),
(18, '2a00:f28:4c1:b86d:41a0:952a:1bc6:d0a3', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:16', '2025-05-02 06:48:16'),
(19, '74.125.218.42', '', '', 'United States', 37.75100000, -97.82200000, '0', '0', '2025-05-02 06:48:17', '2025-05-02 06:48:17'),
(20, '2a00:f29:229:c68:2d0d:1c78:6216:2ba6', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:17', '2025-05-02 06:48:17'),
(21, '2a09:bac1:240:18::20a:a0', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:18', '2025-05-02 06:48:18'),
(22, '35.92.95.19', 'Boardman', 'Oregon', 'United States', 45.84010000, -119.70500000, '0', '0', '2025-05-02 06:48:18', '2025-05-02 06:48:18'),
(23, '44.244.249.174', 'Boardman', 'Oregon', 'United States', 45.84010000, -119.70500000, '0', '0', '2025-05-02 06:48:19', '2025-05-02 06:48:19'),
(24, '2001:8f8:1dd3:c48c:180c:55b9:57da:9f3e', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:19', '2025-05-02 06:48:19'),
(25, '2001:8f8:1763:20a0:5bd9:a958:f1c3:aad0', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:20', '2025-05-02 06:48:20'),
(26, '5.195.173.133', 'Abu Dhabi', 'Abu Dhabi', 'United Arab Emirates', 24.45420000, 54.40600000, '0', '0', '2025-05-02 06:48:20', '2025-05-02 06:48:20'),
(27, '2.50.44.237', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:21', '2025-05-02 06:48:21'),
(28, '87.200.248.121', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:21', '2025-05-02 06:48:21'),
(29, '66.249.93.36', '', '', 'United States', 37.75100000, -97.82200000, '0', '0', '2025-05-02 06:48:22', '2025-05-02 06:48:22'),
(30, '66.249.93.35', '', '', 'United States', 37.75100000, -97.82200000, '0', '0', '2025-05-02 06:48:22', '2025-05-02 06:48:22'),
(31, '66.249.93.40', '', '', 'United States', 37.75100000, -97.82200000, '0', '0', '2025-05-02 06:48:23', '2025-05-02 06:48:23'),
(32, '107.173.160.181', 'Los Angeles', 'California', 'United States', 34.05440000, -118.24400000, '0', '0', '2025-05-02 06:48:23', '2025-05-02 06:48:23'),
(33, '2001:8f8:1a65:2b80:4cc4:482a:66f3:2661', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:24', '2025-05-02 06:48:24'),
(34, '2001:8f8:192f:3961:5c74:d79c:3675:8a14', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:24', '2025-05-02 06:48:24'),
(35, '5.194.13.109', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:25', '2025-05-02 06:48:25'),
(36, '31.219.87.148', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:25', '2025-05-02 06:48:25'),
(37, '86.99.108.144', 'Dubai', 'Dubai', 'United Arab Emirates', 25.07340000, 55.29790000, '0', '0', '2025-05-02 06:48:26', '2025-05-02 06:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `slider_offers`
--

CREATE TABLE `slider_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `name_ar` varchar(265) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `is_floating` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `img_path`, `link`, `active`, `name_ar`, `name_en`, `is_floating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'images/social_links/1747186793933.png', 'https://www.facebook.com/profile.php?id=61575820508995&sk=about', 1, 'فيس', 'Facebook', 1, NULL, '2025-05-06 00:37:12', '2025-05-14 05:39:53'),
(7, 'images/social_links/1747186817335.png', 'https://wa.me/971544428081', 1, 'واتساب', 'Whatsapp', 1, NULL, '2025-05-12 18:59:00', '2025-05-14 05:40:17'),
(8, 'images/social_links/1747182654309.jpg', 'https://www.wufikatuzivuw.com', 1, 'Minus laudantium pr', 'Aut dolores est cill', 1, '2025-05-14 04:31:05', '2025-05-14 04:30:54', '2025-05-14 04:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `statistics_tags`
--

CREATE TABLE `statistics_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `title_en` varchar(100) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `percentage` double NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `logo_img_path` varchar(100) NOT NULL,
  `cover_img_path` varchar(100) NOT NULL,
  `delivery_charge` decimal(10,2) NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  `long` decimal(9,6) NOT NULL,
  `address` varchar(255) NOT NULL,
  `first_phone_number` varchar(13) NOT NULL,
  `second_phone_number` varchar(13) NOT NULL,
  `whatsapp_number` varchar(13) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`user_id`, `name_en`, `name_ar`, `logo_img_path`, `cover_img_path`, `delivery_charge`, `lat`, `long`, `address`, `first_phone_number`, `second_phone_number`, `whatsapp_number`, `created_at`, `updated_at`) VALUES
(2, 'first store', '', 'images/dsa.jpg', 'images/dsa.jpg', 20.00, 30.177509, 31.209921, '', '201239012', '201239012', '201239012', '2025-10-01 02:57:47', '2025-10-04 14:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_category`
--

INSERT INTO `store_category` (`id`, `store_id`, `category_id`) VALUES
(4, 2, 49);

-- --------------------------------------------------------

--
-- Table structure for table `suggestion_box`
--

CREATE TABLE `suggestion_box` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_products`
--

CREATE TABLE `system_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_product_options`
--

CREATE TABLE `system_product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `system_product_id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(200) NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `description_ar` text NOT NULL,
  `description_en` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transportation_periods`
--

CREATE TABLE `transportation_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `from` time NOT NULL,
  `to` time NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transportation_periods_assigned_to_drivers`
--

CREATE TABLE `transportation_periods_assigned_to_drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `transportation_period_id` bigint(20) UNSIGNED NOT NULL,
  `capacity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `role` enum('admin','store','client') NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `active`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$10$dTL0MwiD7O5oeGpKGa0.GOUt2G.qY4H3eqsMpXp.wZRHTWQmJ1lu.', 'admin', 1, NULL, NULL, NULL, NULL),
(2, 'store', 'store@store.com', NULL, '$2y$10$dTL0MwiD7O5oeGpKGa0.GOUt2G.qY4H3eqsMpXp.wZRHTWQmJ1lu.', 'store', 1, NULL, NULL, NULL, '2025-10-09 19:41:05'),
(3, 'client', 'client@client.com', NULL, '$2y$10$dTL0MwiD7O5oeGpKGa0.GOUt2G.qY4H3eqsMpXp.wZRHTWQmJ1lu.', 'client', 1, NULL, NULL, NULL, '2025-10-09 19:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `users_password_resets`
--

CREATE TABLE `users_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_device_tokens`
--

CREATE TABLE `user_device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `device_token` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_device_tokens`
--

INSERT INTO `user_device_tokens` (`id`, `user_id`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'rsada', '2024-10-28 21:27:59', '2024-10-28 21:27:59'),
(2, 1, '73960f62-31a0-4239-a96d-ce8327354ad0', '2024-10-28 21:28:02', '2024-10-28 21:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_credit_offers`
--

CREATE TABLE `wallet_credit_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `description_ar` varchar(200) NOT NULL,
  `description_en` varchar(200) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `value_type` enum('constant','percentage') NOT NULL,
  `min_amount` double NOT NULL,
  `max_amount` double NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

CREATE TABLE `wallet_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us_content`
--
ALTER TABLE `about_us_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_companies_rates`
--
ALTER TABLE `base_companies_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_drivers_rates`
--
ALTER TABLE `base_drivers_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_orders_rates`
--
ALTER TABLE `base_orders_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_countries`
--
ALTER TABLE `categories_countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_countries_category_id_foreign` (`category_id`),
  ADD KEY `categories_countries_country_id_foreign` (`country_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_governorate_id_foreign` (`governorate_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `clients_companies_rates`
--
ALTER TABLE `clients_companies_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_companies_rates_client_id_foreign` (`client_id`),
  ADD KEY `clients_companies_rates_company_id_foreign` (`company_id`),
  ADD KEY `clients_companies_rates_base_companies_rate_id_foreign` (`base_companies_rate_id`);

--
-- Indexes for table `clients_password_resets`
--
ALTER TABLE `clients_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_password_resets_client_id_foreign` (`client_id`);

--
-- Indexes for table `client_drivers_rates`
--
ALTER TABLE `client_drivers_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_drivers_rates_client_id_foreign` (`client_id`),
  ADD KEY `client_drivers_rates_company_id_foreign` (`company_id`),
  ADD KEY `client_drivers_rates_base_companies_rate_id_foreign` (`base_companies_rate_id`);

--
-- Indexes for table `client_general_offer_orders`
--
ALTER TABLE `client_general_offer_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_general_offer_orders_client_id_foreign` (`client_id`),
  ADD KEY `client_general_offer_orders_general_offer_id_foreign` (`general_offer_id`),
  ADD KEY `client_general_offer_orders_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_locations_client_id_foreign` (`client_id`);

--
-- Indexes for table `client_orders`
--
ALTER TABLE `client_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_orders_client_id_foreign` (`client_id`),
  ADD KEY `client_orders_company_id_foreign` (`company_id`),
  ADD KEY `client_orders_delivery_type_id_foreign` (`delivery_type_id`),
  ADD KEY `client_orders_promo_code_id_foreign` (`promo_code_id`),
  ADD KEY `client_orders_client_location_id_foreign` (`client_location_id`),
  ADD KEY `client_orders_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD KEY `companies_user_id_foreign` (`user_id`),
  ADD KEY `companies_country_id_foreign` (`country_id`);

--
-- Indexes for table `companies_categories`
--
ALTER TABLE `companies_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_categories_company_id_foreign` (`company_id`),
  ADD KEY `companies_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `companies_deliver_to_cities`
--
ALTER TABLE `companies_deliver_to_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_deliver_to_cities_company_id_foreign` (`company_id`),
  ADD KEY `companies_deliver_to_cities_city_id_foreign` (`city_id`);

--
-- Indexes for table `companies_working_with_drivers_managers`
--
ALTER TABLE `companies_working_with_drivers_managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cooperation_with_us_reasons`
--
ALTER TABLE `cooperation_with_us_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_managers`
--
ALTER TABLE `country_managers`
  ADD KEY `country_managers_user_id_foreign` (`user_id`),
  ADD KEY `country_managers_country_id_foreign` (`country_id`);

--
-- Indexes for table `delivery_types`
--
ALTER TABLE `delivery_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD KEY `drivers_user_id_foreign` (`user_id`),
  ADD KEY `drivers_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `drivers_app_clients`
--
ALTER TABLE `drivers_app_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_app_clients_user_id_foreign` (`user_id`);

--
-- Indexes for table `drivers_app_orders`
--
ALTER TABLE `drivers_app_orders`
  ADD KEY `drivers_app_orders_order_id_foreign` (`order_id`),
  ADD KEY `drivers_app_orders_user_id_foreign` (`user_id`),
  ADD KEY `drivers_app_orders_drivers_app_client_id_foreign` (`drivers_app_client_id`);

--
-- Indexes for table `drivers_app_products`
--
ALTER TABLE `drivers_app_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_app_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `drivers_app_product_options`
--
ALTER TABLE `drivers_app_product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drivers_app_product_options_drivers_app_product_id_foreign` (`drivers_app_product_id`);

--
-- Indexes for table `drivers_managers`
--
ALTER TABLE `drivers_managers`
  ADD KEY `drivers_managers_user_id_foreign` (`user_id`),
  ADD KEY `drivers_managers_country_id_foreign` (`country_id`);

--
-- Indexes for table `driver_locations`
--
ALTER TABLE `driver_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_locations_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `driver_location_stop_points`
--
ALTER TABLE `driver_location_stop_points`
  ADD KEY `driver_location_stop_points_driver_location_id_foreign` (`driver_location_id`);

--
-- Indexes for table `easy_orders`
--
ALTER TABLE `easy_orders`
  ADD KEY `easy_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floating_social_links`
--
ALTER TABLE `floating_social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frequently_asked_questions`
--
ALTER TABLE `frequently_asked_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_offers`
--
ALTER TABLE `general_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `governorates_country_id_foreign` (`country_id`);

--
-- Indexes for table `home_page_content`
--
ALTER TABLE `home_page_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_slider_images`
--
ALTER TABLE `home_slider_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_client_order_id_foreign` (`client_order_id`),
  ADD KEY `invoices_drivers_app_order_id_foreign` (`drivers_app_order_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nav_bar_footer_content`
--
ALTER TABLE `nav_bar_footer_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `offers_page_content`
--
ALTER TABLE `offers_page_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `old_clients`
--
ALTER TABLE `old_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_have_base_orders_rates`
--
ALTER TABLE `orders_have_base_orders_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_have_base_orders_rates_order_id_foreign` (`order_id`),
  ADD KEY `orders_have_base_orders_rates_base_order_rate_id_foreign` (`base_order_rate_id`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`),
  ADD KEY `order_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_options_id_foreign` (`product_id`);

--
-- Indexes for table `order_locations`
--
ALTER TABLE `order_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_locations_order_id_foreign` (`order_id`),
  ADD KEY `order_locations_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `order_location_stop_points`
--
ALTER TABLE `order_location_stop_points`
  ADD KEY `order_location_stop_points_order_location_id_foreign` (`order_location_id`);

--
-- Indexes for table `order_steps`
--
ALTER TABLE `order_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `price_units`
--
ALTER TABLE `price_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_options_product_id_foreign` (`product_id`),
  ADD KEY `product_options_option_id_foreign` (`option_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes_companies`
--
ALTER TABLE `promo_codes_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_codes_companies_promo_code_id_foreign` (`promo_code_id`),
  ADD KEY `promo_codes_companies_order_id_foreign` (`order_id`);

--
-- Indexes for table `promo_codes_countries`
--
ALTER TABLE `promo_codes_countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_codes_countries_promo_code_id_foreign` (`promo_code_id`),
  ADD KEY `promo_codes_countries_country_id_foreign` (`country_id`);

--
-- Indexes for table `promo_codes_old`
--
ALTER TABLE `promo_codes_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_codes_code_unique` (`code`);

--
-- Indexes for table `promo_codes_products`
--
ALTER TABLE `promo_codes_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_codes_products_promo_code_id_foreign` (`promo_code_id`),
  ADD KEY `promo_codes_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `promo_code_offers`
--
ALTER TABLE `promo_code_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_code_offers_promo_code_id_foreign` (`promo_code_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_visits`
--
ALTER TABLE `site_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_offers`
--
ALTER TABLE `slider_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics_tags`
--
ALTER TABLE `statistics_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `store_category`
--
ALTER TABLE `store_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_products`
--
ALTER TABLE `system_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_products_category_id_foreign` (`category_id`);

--
-- Indexes for table `system_product_options`
--
ALTER TABLE `system_product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_product_options_system_product_id_foreign` (`system_product_id`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transportation_periods`
--
ALTER TABLE `transportation_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportation_periods_user_id_foreign` (`user_id`);

--
-- Indexes for table `transportation_periods_assigned_to_drivers`
--
ALTER TABLE `transportation_periods_assigned_to_drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transportation_periods_assigned_to_drivers_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_password_resets`
--
ALTER TABLE `users_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_password_resets_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_device_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_credit_offers`
--
ALTER TABLE `wallet_credit_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_history_client_id_foreign` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us_content`
--
ALTER TABLE `about_us_content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_companies_rates`
--
ALTER TABLE `base_companies_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_drivers_rates`
--
ALTER TABLE `base_drivers_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_orders_rates`
--
ALTER TABLE `base_orders_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `categories_countries`
--
ALTER TABLE `categories_countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_companies_rates`
--
ALTER TABLE `clients_companies_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_password_resets`
--
ALTER TABLE `clients_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_drivers_rates`
--
ALTER TABLE `client_drivers_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_general_offer_orders`
--
ALTER TABLE `client_general_offer_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_locations`
--
ALTER TABLE `client_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_orders`
--
ALTER TABLE `client_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies_categories`
--
ALTER TABLE `companies_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies_deliver_to_cities`
--
ALTER TABLE `companies_deliver_to_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies_working_with_drivers_managers`
--
ALTER TABLE `companies_working_with_drivers_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cooperation_with_us_reasons`
--
ALTER TABLE `cooperation_with_us_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_types`
--
ALTER TABLE `delivery_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers_app_clients`
--
ALTER TABLE `drivers_app_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers_app_products`
--
ALTER TABLE `drivers_app_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers_app_product_options`
--
ALTER TABLE `drivers_app_product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver_locations`
--
ALTER TABLE `driver_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floating_social_links`
--
ALTER TABLE `floating_social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `frequently_asked_questions`
--
ALTER TABLE `frequently_asked_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_offers`
--
ALTER TABLE `general_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_page_content`
--
ALTER TABLE `home_page_content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_slider_images`
--
ALTER TABLE `home_slider_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=970;

--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `nav_bar_footer_content`
--
ALTER TABLE `nav_bar_footer_content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `offers_page_content`
--
ALTER TABLE `offers_page_content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `old_clients`
--
ALTER TABLE `old_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `orders_have_base_orders_rates`
--
ALTER TABLE `orders_have_base_orders_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `order_locations`
--
ALTER TABLE `order_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_steps`
--
ALTER TABLE `order_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_units`
--
ALTER TABLE `price_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1191;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promo_codes_companies`
--
ALTER TABLE `promo_codes_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes_countries`
--
ALTER TABLE `promo_codes_countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes_old`
--
ALTER TABLE `promo_codes_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes_products`
--
ALTER TABLE `promo_codes_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_code_offers`
--
ALTER TABLE `promo_code_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_visits`
--
ALTER TABLE `site_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `slider_offers`
--
ALTER TABLE `slider_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `statistics_tags`
--
ALTER TABLE `statistics_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_category`
--
ALTER TABLE `store_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suggestion_box`
--
ALTER TABLE `suggestion_box`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_products`
--
ALTER TABLE `system_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_product_options`
--
ALTER TABLE `system_product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transportation_periods`
--
ALTER TABLE `transportation_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transportation_periods_assigned_to_drivers`
--
ALTER TABLE `transportation_periods_assigned_to_drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_password_resets`
--
ALTER TABLE `users_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wallet_credit_offers`
--
ALTER TABLE `wallet_credit_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_history`
--
ALTER TABLE `wallet_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories_countries`
--
ALTER TABLE `categories_countries`
  ADD CONSTRAINT `categories_countries_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_countries_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_governorate_id_foreign` FOREIGN KEY (`governorate_id`) REFERENCES `governorates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clients_companies_rates`
--
ALTER TABLE `clients_companies_rates`
  ADD CONSTRAINT `clients_companies_rates_base_companies_rate_id_foreign` FOREIGN KEY (`base_companies_rate_id`) REFERENCES `base_companies_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clients_companies_rates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clients_companies_rates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clients_password_resets`
--
ALTER TABLE `clients_password_resets`
  ADD CONSTRAINT `clients_password_resets_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_drivers_rates`
--
ALTER TABLE `client_drivers_rates`
  ADD CONSTRAINT `client_drivers_rates_base_companies_rate_id_foreign` FOREIGN KEY (`base_companies_rate_id`) REFERENCES `base_companies_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_drivers_rates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_drivers_rates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_general_offer_orders`
--
ALTER TABLE `client_general_offer_orders`
  ADD CONSTRAINT `client_general_offer_orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_general_offer_orders_general_offer_id_foreign` FOREIGN KEY (`general_offer_id`) REFERENCES `general_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_general_offer_orders_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_locations`
--
ALTER TABLE `client_locations`
  ADD CONSTRAINT `client_locations_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_orders`
--
ALTER TABLE `client_orders`
  ADD CONSTRAINT `client_orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_orders_client_location_id_foreign` FOREIGN KEY (`client_location_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_orders_delivery_type_id_foreign` FOREIGN KEY (`delivery_type_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_orders_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_orders_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies_categories`
--
ALTER TABLE `companies_categories`
  ADD CONSTRAINT `companies_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies_deliver_to_cities`
--
ALTER TABLE `companies_deliver_to_cities`
  ADD CONSTRAINT `companies_deliver_to_cities_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_deliver_to_cities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `country_managers`
--
ALTER TABLE `country_managers`
  ADD CONSTRAINT `country_managers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_app_clients`
--
ALTER TABLE `drivers_app_clients`
  ADD CONSTRAINT `drivers_app_clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_app_orders`
--
ALTER TABLE `drivers_app_orders`
  ADD CONSTRAINT `drivers_app_orders_drivers_app_client_id_foreign` FOREIGN KEY (`drivers_app_client_id`) REFERENCES `drivers_app_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drivers_app_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drivers_app_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_app_products`
--
ALTER TABLE `drivers_app_products`
  ADD CONSTRAINT `drivers_app_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_app_product_options`
--
ALTER TABLE `drivers_app_product_options`
  ADD CONSTRAINT `drivers_app_product_options_drivers_app_product_id_foreign` FOREIGN KEY (`drivers_app_product_id`) REFERENCES `drivers_app_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_managers`
--
ALTER TABLE `drivers_managers`
  ADD CONSTRAINT `drivers_managers_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drivers_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_locations`
--
ALTER TABLE `driver_locations`
  ADD CONSTRAINT `driver_locations_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_location_stop_points`
--
ALTER TABLE `driver_location_stop_points`
  ADD CONSTRAINT `driver_location_stop_points_driver_location_id_foreign` FOREIGN KEY (`driver_location_id`) REFERENCES `driver_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `easy_orders`
--
ALTER TABLE `easy_orders`
  ADD CONSTRAINT `easy_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `governorates`
--
ALTER TABLE `governorates`
  ADD CONSTRAINT `governorates_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_client_order_id_foreign` FOREIGN KEY (`client_order_id`) REFERENCES `client_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_drivers_app_order_id_foreign` FOREIGN KEY (`drivers_app_order_id`) REFERENCES `drivers_app_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders_have_base_orders_rates`
--
ALTER TABLE `orders_have_base_orders_rates`
  ADD CONSTRAINT `orders_have_base_orders_rates_base_order_rate_id_foreign` FOREIGN KEY (`base_order_rate_id`) REFERENCES `base_orders_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_have_base_orders_rates_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_locations`
--
ALTER TABLE `order_locations`
  ADD CONSTRAINT `order_locations_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_locations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_location_stop_points`
--
ALTER TABLE `order_location_stop_points`
  ADD CONSTRAINT `order_location_stop_points_order_location_id_foreign` FOREIGN KEY (`order_location_id`) REFERENCES `order_locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_codes_companies`
--
ALTER TABLE `promo_codes_companies`
  ADD CONSTRAINT `promo_codes_companies_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promo_codes_companies_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes_old` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_codes_countries`
--
ALTER TABLE `promo_codes_countries`
  ADD CONSTRAINT `promo_codes_countries_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promo_codes_countries_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes_old` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_codes_products`
--
ALTER TABLE `promo_codes_products`
  ADD CONSTRAINT `promo_codes_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promo_codes_products_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes_old` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promo_code_offers`
--
ALTER TABLE `promo_code_offers`
  ADD CONSTRAINT `promo_code_offers_promo_code_id_foreign` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes_old` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `system_products`
--
ALTER TABLE `system_products`
  ADD CONSTRAINT `system_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `system_product_options`
--
ALTER TABLE `system_product_options`
  ADD CONSTRAINT `system_product_options_system_product_id_foreign` FOREIGN KEY (`system_product_id`) REFERENCES `system_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transportation_periods`
--
ALTER TABLE `transportation_periods`
  ADD CONSTRAINT `transportation_periods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transportation_periods_assigned_to_drivers`
--
ALTER TABLE `transportation_periods_assigned_to_drivers`
  ADD CONSTRAINT `transportation_periods_assigned_to_drivers_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_password_resets`
--
ALTER TABLE `users_password_resets`
  ADD CONSTRAINT `users_password_resets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  ADD CONSTRAINT `user_device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallet_history`
--
ALTER TABLE `wallet_history`
  ADD CONSTRAINT `wallet_history_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `old_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
