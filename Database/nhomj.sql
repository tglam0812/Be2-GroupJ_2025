-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th3 13, 2025 lúc 09:27 AM
-- Phiên bản máy phục vụ: 9.1.0
-- Phiên bản PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhomj`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `image`, `created_at`) VALUES
(1, 'Apple', 'apple.jpg', '2025-03-13 08:00:04'),
(2, 'Oppo', 'oppo.jpg', '2025-03-13 08:00:04'),
(3, 'Acer', 'acer.jpg', '2025-03-13 08:00:31'),
(4, 'SamSung', 'samsung.jpg', '2025-03-13 08:00:31'),
(5, 'Dell', 'dell.jpg', '2025-03-13 08:00:59'),
(6, 'Vivo', 'vivo.jpg', '2025-03-13 08:01:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  `stock_quantity` int UNSIGNED DEFAULT '0',
  `sold_quantity` int UNSIGNED DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int UNSIGNED DEFAULT '0',
  `is_featured` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sale` decimal(5,2) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `price`, `stock_quantity`, `sold_quantity`, `description`, `image`, `views`, `is_featured`, `created_at`, `updated_at`, `sale`, `category`) VALUES
(1, 'Iphone 11 ', 1, 12000000, 10, 50, 'Ra mắt năm 2019, iPhone 11 có màn hình Liquid Retina HD 6.1 inch, chip A13 Bionic, RAM 4GB và hệ thống camera kép 12MP với ống kính góc rộng và siêu rộng. Thiết bị này cải thiện thời lượng pin, hỗ trợ sạc nhanh và sạc không dây, cùng với khả năng chống nước và bụi IP68.', '11prm.jpg', 10000, 0, '2025-03-13 08:02:35', '2025-03-13 08:56:02', NULL, NULL),
(2, 'Iphone 7', 1, 8000000, 50, 80, 'Ra mắt năm 2016, iPhone 7 có màn hình 4.7 inch Retina HD, chip A10 Fusion, RAM 2GB và camera sau 12MP. Thiết bị này loại bỏ jack cắm tai nghe 3.5mm, giới thiệu khả năng chống nước và bụi đạt chuẩn IP67, cùng với nút Home cảm ứng lực.', 'iphone7.jpg', 150, 0, '2025-03-13 08:33:56', '2025-03-13 08:56:02', 20.00, NULL),
(3, 'Iphone 8', 1, 11000000, 40, 70, 'Ra mắt năm 2016, iPhone 7 có màn hình 4.7 inch Retina HD, chip A10 Fusion, RAM 2GB và camera sau 12MP. Thiết bị này loại bỏ jack cắm tai nghe 3.5mm, giới thiệu khả năng chống nước và bụi đạt chuẩn IP67, cùng với nút Home cảm ứng lực.', 'iphone8.jpg', 5000, 0, '2025-03-13 08:37:56', '2025-03-13 08:56:02', 10.00, NULL),
(4, 'Iphone X', 1, 13000000, 70, 100, 'Ra mắt năm 2017, iPhone X kỷ niệm 10 năm iPhone với thiết kế đột phá, màn hình OLED Super Retina 5.8 inch, chip A11 Bionic, RAM 3GB và camera kép 12MP. Thiết bị này giới thiệu Face ID thay thế Touch ID, cùng với thiết kế không viền và loại bỏ nút Home vật lý.', 'iphoneX.jpg', 1234, 0, '2025-03-13 08:39:03', '2025-03-13 08:56:02', NULL, NULL),
(5, 'Iphone 12', 1, 15000000, 95, 59, 'Ra mắt năm 2020, iPhone 12 có màn hình Super Retina XDR 6.1 inch, chip A14 Bionic, RAM 4GB và hệ thống camera kép 12MP. Thiết bị hỗ trợ 5G, giới thiệu MagSafe cho sạc không dây và phụ kiện, cùng với thiết kế cạnh phẳng và mặt gốm Ceramic Shield tăng độ bền.', 'iphone12.jpg', 25082, 0, '2025-03-13 08:40:38', '2025-03-13 08:56:02', 10.00, NULL),
(6, 'Iphone 13', 1, 16000000, 150, 56, 'Ra mắt năm 2021, iPhone 13 có màn hình Super Retina XDR 6.1 inch, chip A15 Bionic, RAM 4GB và hệ thống camera kép 12MP với cảm biến lớn hơn. Thiết bị cải thiện thời lượng pin, giảm kích thước notch và tăng cường khả năng chống nước và bụi IP68.', 'iphone13.jpg', 15032, 1, '2025-03-13 08:42:11', '2025-03-13 08:56:02', NULL, NULL),
(7, 'Iphone 14', 1, 17000000, 56, 50, 'Ra mắt năm 2022, iPhone 14 có màn hình Super Retina XDR 6.1 inch, chip A16 Bionic, RAM 6GB và hệ thống camera kép 12MP với cải tiến chụp thiếu sáng. Thiết bị giới thiệu tính năng gọi khẩn cấp qua vệ tinh và phát hiện tai nạn, cùng với cải thiện thời lượng pin và hỗ trợ Wi-Fi 6E.', 'iphone14.jpg', 52103, 1, '2025-03-13 08:43:58', '2025-03-13 08:56:02', 10.00, NULL),
(8, 'Iphone 15', 1, 18000000, 50, 100, 'Ra mắt năm 2023, iPhone 15 có màn hình Super Retina XDR 6.1 inch, chip A17 Bionic, RAM 6GB và hệ thống camera kép 12MP với công nghệ Photonic Engine. Thiết bị hỗ trợ 5G, Wi-Fi 6E, giới thiệu Dynamic Island và cải thiện thời lượng pin.', 'iphone15.jpg', 51240, 1, '2025-03-13 08:45:15', '2025-03-13 08:56:02', 30.00, NULL),
(9, 'Iphone 16', 1, 19000000, 40, 75, 'Ra mắt năm 2024, iPhone 16 có màn hình Super Retina XDR 6.1 inch, chip A18 Bionic, RAM 6GB và hệ thống camera kép 48MP với cảm biến lớn hơn. Thiết bị hỗ trợ 5G, Wi-Fi 7, giới thiệu nút Camera Control và cải thiện thời lượng pin.', 'iphone16.jpg', 15000, 1, '2025-03-13 08:51:37', '2025-03-13 08:56:02', 10.00, NULL),
(10, 'Oppo Find X5 Pro', 2, 22000000, 50, 10, 'Flagship cao cấp với màn hình AMOLED 6.7 inch, chip Snapdragon 8 Gen 1, RAM 12GB, camera 50MP.', 'findx5pro.jpg', 5000, 1, '2025-03-13 09:01:59', '2025-03-13 09:05:26', 5.00, NULL),
(11, 'Samsung Galaxy S22 Ultra', 4, 28000000, 40, 15, 'Màn hình Dynamic AMOLED 6.8 inch, bút S Pen, camera 108MP, chip Snapdragon 8 Gen 1.', 's22ultra.jpg', 12000, 1, '2025-03-13 09:01:59', '2025-03-13 09:05:38', 10.00, NULL),
(12, 'Acer Nitro 5 AN515', 3, 23000000, 30, 8, 'Laptop gaming với CPU Intel Core i7-12700H, RTX 3060, màn hình 144Hz.', 'nitro5an5.jpg', 8000, 0, '2025-03-13 09:01:59', '2025-03-13 09:15:47', 0.00, NULL),
(13, 'Dell XPS 15 9520', 5, 45000000, 20, 5, 'Ultrabook màn hình OLED 15 inch 3.5K, Intel Core i9, RAM 32GB, SSD 1TB.', 'xps15.jpg', 6000, 1, '2025-03-13 09:01:59', '2025-03-13 09:05:58', 2.00, NULL),
(14, 'Vivo X80 Pro', 6, 18000000, 60, 12, 'Camera ZEISS 50MP, Snapdragon 8 Gen 1, màn hình AMOLED 6.78 inch, pin 4700mAh.', 'x80pro.jpg', 15000, 1, '2025-03-13 09:01:59', '2025-03-13 09:06:06', 8.00, NULL),
(15, 'Oppo Reno10 Pro+', 2, 15000000, 40, 10, 'Oppo Reno10 Pro+ trang bị màn hình AMOLED 6.74 inch, chip Snapdragon 8+ Gen 1, camera tiềm vọng 64MP.', 'reno10proplus.jpg', 5200, 1, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 5.00, NULL),
(16, 'Oppo A78', 2, 5500000, 50, 15, 'Oppo A78 có màn hình LCD 6.56 inch, chip Dimensity 810, pin 5000mAh, hỗ trợ sạc nhanh 33W.', 'oppoa78.jpg', 3500, 0, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 2.00, NULL),
(17, 'Samsung Galaxy S23 Ultra', 4, 27000000, 25, 8, 'Flagship cao cấp của Samsung với màn hình Dynamic AMOLED 6.8 inch, bút S Pen, camera 200MP.', 's23ultra.jpg', 8000, 1, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 4.00, NULL),
(18, 'Samsung Galaxy A54', 4, 9500000, 55, 18, 'Galaxy A54 trang bị màn hình Super AMOLED 6.4 inch, chip Exynos 1380, camera chống rung OIS.', 'a54.jpg', 5000, 0, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 2.50, NULL),
(19, 'Acer Nitro 5', 3, 20000000, 15, 5, 'Laptop gaming phổ thông với CPU Intel Core i7, GPU RTX 3060, màn hình 144Hz.', 'nitro5.jpg', 4500, 1, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 4.50, NULL),
(20, 'Acer Swift 3', 3, 16000000, 25, 12, 'Laptop mỏng nhẹ với CPU Ryzen 7 5700U, màn hình IPS 14 inch, pin 12 giờ.', 'swift3.jpg', 3900, 0, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 3.00, NULL),
(21, 'Dell XPS 15', 5, 38000000, 12, 6, 'Laptop cao cấp với màn hình OLED 3.5K, Intel Core i9, RAM 32GB.', 'xps159520.jpg', 6000, 1, '2025-03-13 09:06:16', '2025-03-13 09:17:07', 5.50, NULL),
(22, 'Dell Inspiron 14', 5, 14000000, 30, 10, 'Laptop văn phòng với màn hình 14 inch, chip Intel Core i5, pin 10 giờ.', 'inspiron14.jpg', 3400, 0, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 2.50, NULL),
(23, 'Vivo V27 Pro', 6, 11000000, 35, 14, 'Vivo V27 Pro có màn hình AMOLED 6.78 inch, chip Dimensity 8200, camera selfie 50MP.', 'v27pro.jpg', 4000, 0, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 3.20, NULL),
(24, 'Vivo Y35', 6, 4800000, 60, 20, 'Vivo Y35 trang bị màn hình LCD 6.58 inch, Snapdragon 680, pin 5000mAh, sạc nhanh 44W.', 'y35.jpg', 2500, 0, '2025-03-13 09:06:16', '2025-03-13 09:06:16', 1.70, NULL),
(25, 'Oppo F25 Pro', 2, 8700000, 35, 12, 'Oppo F25 Pro sở hữu màn hình AMOLED 6.7 inch, chip MediaTek Dimensity 7050, pin 5000mAh.', 'oppo_f25_pro.jpg', 6200, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 4.00, NULL),
(26, 'Oppo A58', 2, 5000000, 45, 18, 'Oppo A58 trang bị màn hình 6.56 inch, chip MediaTek Helio G85, pin 5000mAh, hỗ trợ sạc nhanh 33W.', 'oppo_a58.jpg', 3100, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.00, NULL),
(27, 'Oppo Reno9 Z', 2, 9900000, 30, 10, 'Oppo Reno9 Z có thiết kế thời thượng, camera AI 64MP, chip Snapdragon 695 5G.', 'reno9_z.jpg', 4300, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 5.00, NULL),
(28, 'Oppo Find N3', 2, 32000000, 25, 5, 'Oppo Find N3 là mẫu điện thoại gập với màn hình AMOLED 7.1 inch, chip Snapdragon 8 Gen 2, pin 4800mAh.', 'find_n3.jpg', 7900, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 2.50, NULL),
(29, 'Oppo K10', 2, 6800000, 50, 20, 'Oppo K10 dùng chip Snapdragon 680, màn hình 6.59 inch, pin 5000mAh, camera 50MP.', 'oppo_k10.jpg', 2800, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 2.00, NULL),
(30, 'Oppo A98', 2, 7500000, 40, 17, 'Oppo A98 trang bị màn hình IPS LCD 6.72 inch, chip Snapdragon 695 5G, sạc nhanh 67W.', 'oppo_a98.jpg', 5100, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.50, NULL),
(31, 'Oppo Reno8 T', 2, 10500000, 28, 9, 'Oppo Reno8 T có camera 108MP, màn hình AMOLED 6.7 inch, pin 4800mAh.', 'reno8_t.jpg', 3800, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 6.00, NULL),
(32, 'Oppo F21 Pro', 2, 8900000, 35, 15, 'Oppo F21 Pro có thiết kế sang trọng, màn hình AMOLED 6.4 inch, camera AI 64MP.', 'f21_pro.jpg', 4500, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 4.50, NULL),
(33, 'Samsung Galaxy A54', 4, 10500000, 42, 20, 'Galaxy A54 sở hữu màn hình Super AMOLED 6.4 inch, chip Exynos 1380, pin 5000mAh.', 'galaxy_a54.jpg', 6700, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 5.00, NULL),
(34, 'Samsung Galaxy M14', 4, 8000000, 38, 15, 'Galaxy M14 có pin 6000mAh, màn hình 6.6 inch, chip Exynos 1330, hỗ trợ 5G.', 'galaxy_m14.jpg', 5400, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 4.00, NULL),
(35, 'Samsung Galaxy S23 FE', 4, 17500000, 30, 12, 'Galaxy S23 FE trang bị chip Snapdragon 8 Gen 1, màn hình Dynamic AMOLED 6.4 inch.', 'galaxy_s23_fe.jpg', 8600, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.50, NULL),
(36, 'Samsung Galaxy Z Flip5', 4, 28900000, 20, 5, 'Galaxy Z Flip5 là smartphone gập với màn hình 6.7 inch, Snapdragon 8 Gen 2.', 'z_flip5.jpg', 10200, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 2.00, NULL),
(37, 'Samsung Galaxy A24', 4, 6500000, 50, 18, 'Galaxy A24 có màn hình Super AMOLED 6.5 inch, chip MediaTek Helio G99.', 'galaxy_a24.jpg', 4600, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.00, NULL),
(38, 'Samsung Galaxy M04', 4, 4900000, 55, 22, 'Galaxy M04 có pin 5000mAh, chip MediaTek Helio P35, màn hình 6.5 inch.', 'galaxy_m04.jpg', 3200, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 2.50, NULL),
(39, 'Samsung Galaxy XCover 6 Pro', 4, 12000000, 25, 8, 'Galaxy XCover 6 Pro là điện thoại bền bỉ, chuẩn quân đội MIL-STD-810H.', 'xcover_6_pro.jpg', 7300, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 4.00, NULL),
(40, 'Samsung Galaxy S22 Ultra', 4, 27900000, 18, 6, 'Galaxy S22 Ultra có bút S Pen, màn hình 6.8 inch, chip Snapdragon 8 Gen 1.', 's22_ultra.jpg', 11800, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.00, NULL),
(41, 'Dell Inspiron 15', 5, 19000000, 20, 6, 'Dell Inspiron 15 có màn hình 15.6 inch, chip Intel Core i7-12650H.', 'inspiron_15.jpg', 3400, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 2.50, NULL),
(42, 'Dell XPS 13', 5, 32000000, 15, 5, 'Dell XPS 13 có thiết kế siêu mỏng, màn hình OLED 13.4 inch.', 'xps_13.jpg', 7200, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.00, NULL),
(43, 'Dell Latitude 5430', 5, 28000000, 18, 4, 'Dell Latitude 5430 hướng tới doanh nghiệp, pin lâu, chip Intel thế hệ 12.', 'latitude_5430.jpg', 5100, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.50, NULL),
(44, 'Vivo X90 Pro', 6, 21000000, 35, 12, 'Vivo X90 Pro có camera Zeiss 1 inch, màn hình AMOLED 6.78 inch, chip Dimensity 9200.', 'x90_pro.jpg', 5700, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 4.00, NULL),
(45, 'Vivo V29', 6, 9500000, 40, 14, 'Vivo V29 trang bị màn hình AMOLED 6.78 inch, chip Snapdragon 778G.', 'v29.jpg', 4800, 1, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.50, NULL),
(46, 'Vivo Y36', 6, 5900000, 50, 18, 'Vivo Y36 có màn hình 6.64 inch, chip Snapdragon 680, pin 5000mAh.', 'y36.jpg', 3800, 0, '2025-03-13 09:09:09', '2025-03-13 09:09:09', 3.00, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_expires` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `token_expires`, `created_at`, `updated_at`, `role`, `reset_token`, `reset_token_expires`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$6EYwphoaMHBbrbnl6FJDcePKXgOCulpcnTCj9jCmQVfXvYZ9H8ry6', 'faa6cecbb988c89079f6f9c714d96ab3719a7f76077fad1866da43244ea39903', '2025-01-09 08:16:00', '2024-11-19 10:54:14', '2024-12-18 09:29:56', 'admin', NULL, NULL),
(18, 'Khoa', 'mypyker@gmail.com', '$2y$10$Njl9IWGmltIooW7tF1P7W.SLT0NpEzLVANM9PF5poO/6AcTco7wCS', 'ca13b0fa55e26a549baf60289d885b8c2988cf718af6f9cb213bb9f946f19edf', '2025-01-13 23:47:56', '2024-12-14 16:13:59', '2024-12-14 16:47:56', 'user', NULL, NULL);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
