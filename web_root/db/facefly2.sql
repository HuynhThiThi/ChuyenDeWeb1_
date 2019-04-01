-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 05, 2019 lúc 02:14 PM
-- Phiên bản máy phục vụ: 10.1.35-MariaDB
-- Phiên bản PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fooflight`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airline_org`
--

CREATE TABLE `airline_org` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nation_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airline_org`
--

INSERT INTO `airline_org` (`id`, `name`, `code`, `nation_id`) VALUES
(1, 'VietNam Airlines', 'VNAL', 1),
(2, 'Vietject', 'QAL', 1),
(3, 'Jetstars', 'KAL', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airport`
--

CREATE TABLE `airport` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airport`
--

INSERT INTO `airport` (`id`, `name`, `code`, `city_id`) VALUES
(1, 'Tân Sơn Nhất', 'TSN', 1),
(2, 'Nội Bài', 'NBA', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

CREATE TABLE `city` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nation_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`id`, `name`, `code`, `nation_id`) VALUES
(1, 'Sài Gòn', 'SGN', 1),
(2, 'Hà Nội', 'HN', 1),
(3, 'Đã Nẵng', 'DNG', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight`
--

CREATE TABLE `flight` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_id` int(10) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `flight_type` int(10) UNSIGNED NOT NULL,
  `economy_seat_num` int(11) NOT NULL,
  `economy_premium_seat_num` int(11) NOT NULL,
  `bussiness_seat_num` int(11) NOT NULL,
  `departure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `return` timestamp NULL DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `transit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight`
--

INSERT INTO `flight` (`id`, `org_id`, `from`, `to`, `flight_type`, `economy_seat_num`, `economy_premium_seat_num`, `bussiness_seat_num`, `departure`, `return`, `duration`, `transit`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 2, 30, 20, 10, '2018-12-31 21:30:00', '2019-01-02 00:30:00', 8, 5, NULL, NULL),
(2, 2, 2, 3, 1, 30, 20, 10, '2018-12-31 18:30:00', '2019-01-02 01:30:00', 2, 4, NULL, NULL),
(3, 3, 1, 2, 1, 30, 20, 10, '2019-01-01 02:30:00', '2019-01-01 18:30:00', 44, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_booking`
--

CREATE TABLE `flight_booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `flight_id` int(10) UNSIGNED NOT NULL,
  `departure` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flight_type` int(11) NOT NULL,
  `return` timestamp NULL DEFAULT NULL,
  `total_person` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flight_class_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_booking`
--

INSERT INTO `flight_booking` (`id`, `from`, `to`, `flight_id`, `departure`, `flight_type`, `return`, `total_person`, `user_id`, `flight_class_id`) VALUES
(1, 1, 2, 1, '2019-01-01 02:30:00', 1, '2019-01-02 02:30:00', 2, 1, 1),
(2, 1, 2, 1, '2019-01-01 02:30:00', 3, '2019-01-02 02:30:00', 4, 3, 3),
(3, 1, 2, 1, '2019-01-01 02:30:00', 1, '2019-01-02 02:30:00', 3, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_class`
--

CREATE TABLE `flight_class` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_class`
--

INSERT INTO `flight_class` (`id`, `name`) VALUES
(1, 'Bussiness'),
(2, 'Economy'),
(3, 'Economy Premium');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_type`
--

CREATE TABLE `flight_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_type`
--

INSERT INTO `flight_type` (`id`, `name`) VALUES
(1, 'One way'),
(2, 'Return');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(135, '2014_10_12_000000_create_users_table', 1),
(136, '2014_10_12_100000_create_password_resets_table', 1),
(137, '2019_02_01_135545_create_nation_table2', 1),
(138, '2019_02_08_085114_create_city_table', 1),
(139, '2019_02_09_135524_create_airport_table2', 1),
(140, '2019_02_09_150112_create_airline_org_table', 1),
(141, '2019_02_09_155848_create_flight_type_table', 1),
(142, '2019_02_10_153401_create_flight_class_table', 1),
(143, '2019_02_11_150418_create_flight_table', 1),
(144, '2019_02_20_074959_create_flight_booking_table', 1),
(145, '2019_03_05_152552_create_transit_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nation`
--

CREATE TABLE `nation` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nation`
--

INSERT INTO `nation` (`id`, `name`, `code`) VALUES
(1, 'Việt Nam', 'VN'),
(2, 'Korean', 'KR'),
(3, 'Qatar', 'QT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transit`
--

CREATE TABLE `transit` (
  `id` int(10) UNSIGNED NOT NULL,
  `transit_city_id` int(10) UNSIGNED NOT NULL,
  `transit_departure_date` timestamp NULL DEFAULT NULL,
  `transit_landing_date` timestamp NULL DEFAULT NULL,
  `transit_fl_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` timestamp NULL DEFAULT NULL,
  `attempt` int(11) DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `last_access`, `attempt`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Khach hang 1', 'kh1@gmail.com', 'kh1@gmail.com', '$2y$10$MQnQA/0.A4rJL7G7UPFqouyPqbfR0Ao2v1D1QwaZxtdUCx0rPPap.', NULL, 0, 1, '', '2019-03-05 08:36:27', '2019-03-05 08:36:27'),
(2, 'Khach hang 2', 'kh2@gmail.com', 'kh2@gmail.com', '$2y$10$bhc7wlCEwqEok5ooR9lvHu2K2W/2si9Yd9RUCPa/pizqC6TClDFpu', NULL, 0, 1, '', '2019-03-04 20:36:27', '2019-03-05 08:36:27'),
(3, 'Khach hang 3', 'kh3@gmail.com', 'kh3@gmail.com', '$2y$10$dHsgSNtBGr1OehcHQ6o/c.nrVImBj43MsLHxP6FIx082BKf7k73Aa', NULL, 0, 1, '', '2019-03-04 20:36:27', '2019-03-05 08:36:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `airline_org`
--
ALTER TABLE `airline_org`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airline_org_nation_id_foreign` (`nation_id`);

--
-- Chỉ mục cho bảng `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airport_city_id_foreign` (`city_id`);

--
-- Chỉ mục cho bảng `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_nation_id_foreign` (`nation_id`);

--
-- Chỉ mục cho bảng `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_org_id_foreign` (`org_id`),
  ADD KEY `flight_from_foreign` (`from`),
  ADD KEY `flight_to_foreign` (`to`);

--
-- Chỉ mục cho bảng `flight_booking`
--
ALTER TABLE `flight_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_booking_user_id_foreign` (`user_id`),
  ADD KEY `flight_booking_flight_class_id_foreign` (`flight_class_id`),
  ADD KEY `flight_booking_flight_id_foreign` (`flight_id`);

--
-- Chỉ mục cho bảng `flight_class`
--
ALTER TABLE `flight_class`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `flight_type`
--
ALTER TABLE `flight_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nation`
--
ALTER TABLE `nation`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Chỉ mục cho bảng `transit`
--
ALTER TABLE `transit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transit_transit_fl_id_foreign` (`transit_fl_id`),
  ADD KEY `transit_transit_city_id_foreign` (`transit_city_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `airline_org`
--
ALTER TABLE `airline_org`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `airport`
--
ALTER TABLE `airport`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `city`
--
ALTER TABLE `city`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flight_booking`
--
ALTER TABLE `flight_booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flight_class`
--
ALTER TABLE `flight_class`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flight_type`
--
ALTER TABLE `flight_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT cho bảng `nation`
--
ALTER TABLE `nation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `transit`
--
ALTER TABLE `transit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `airline_org`
--
ALTER TABLE `airline_org`
  ADD CONSTRAINT `airline_org_nation_id_foreign` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`id`);

--
-- Các ràng buộc cho bảng `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Các ràng buộc cho bảng `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_nation_id_foreign` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`id`);

--
-- Các ràng buộc cho bảng `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_from_foreign` FOREIGN KEY (`from`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `flight_org_id_foreign` FOREIGN KEY (`org_id`) REFERENCES `airline_org` (`id`),
  ADD CONSTRAINT `flight_to_foreign` FOREIGN KEY (`to`) REFERENCES `city` (`id`);

--
-- Các ràng buộc cho bảng `flight_booking`
--
ALTER TABLE `flight_booking`
  ADD CONSTRAINT `flight_booking_flight_class_id_foreign` FOREIGN KEY (`flight_class_id`) REFERENCES `flight_class` (`id`),
  ADD CONSTRAINT `flight_booking_flight_id_foreign` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`),
  ADD CONSTRAINT `flight_booking_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `transit`
--
ALTER TABLE `transit`
  ADD CONSTRAINT `transit_transit_city_id_foreign` FOREIGN KEY (`transit_city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `transit_transit_fl_id_foreign` FOREIGN KEY (`transit_fl_id`) REFERENCES `flight` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
