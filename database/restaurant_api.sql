-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Sep 2023 pada 08.17
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant_api`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id`, `sales_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2023-09-02 20:04:30', '2023-09-02 20:04:30'),
(2, 1, 1, 2, '2023-09-02 20:04:30', '2023-09-02 20:04:30'),
(3, 2, 1, 1, '2023-09-02 23:13:34', '2023-09-02 23:13:34'),
(4, 2, 2, 2, '2023-09-02 23:13:34', '2023-09-02 23:13:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_details`
--

CREATE TABLE `cart_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `variant_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cart_details`
--

INSERT INTO `cart_details` (`id`, `cart_id`, `variant_product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-09-02 20:04:30', '2023-09-02 20:04:30'),
(2, 1, 2, '2023-09-02 20:04:30', '2023-09-02 20:04:30'),
(3, 3, 1, '2023-09-02 23:13:34', '2023-09-02 23:13:34'),
(4, 3, 2, '2023-09-02 23:13:34', '2023-09-02 23:13:34'),
(5, 4, 1, '2023-09-02 23:13:34', '2023-09-02 23:13:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `inventories`
--

INSERT INTO `inventories` (`id`, `name`, `price`, `amount`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'gula', 15000, 20, 'kg', '2023-09-02 19:31:47', '2023-09-02 19:31:47'),
(2, 'garam', 10000, 25, 'kg', '2023-09-02 19:32:06', '2023-09-02 19:32:06'),
(3, 'tepung maizena', 18000, 5, 'kg', '2023-09-02 19:32:40', '2023-09-02 19:32:40'),
(4, 'tepung terigu', 18000, 15, 'kg', '2023-09-02 19:32:56', '2023-09-02 19:32:56'),
(5, 'tepung tapioka', 16000, 15, 'kg', '2023-09-02 19:33:11', '2023-09-02 19:33:11'),
(6, 'penyedap rasa', 5000, 50, 'pcs', '2023-09-02 19:34:15', '2023-09-02 19:34:15'),
(7, 'coklat bubuk', 50000, 50, 'pcs', '2023-09-02 19:34:50', '2023-09-02 19:34:50'),
(8, 'matcha bubuk', 40000, 50, 'pcs', '2023-09-02 19:35:03', '2023-09-02 19:35:03'),
(9, 'susu UHT', 40000, 50, 'pcs', '2023-09-02 19:35:23', '2023-09-02 19:35:23'),
(10, 'green tea bubuk', 40000, 50, 'pcs', '2023-09-02 19:36:24', '2023-09-02 19:36:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_02_013831_create_inventories_table', 1),
(6, '2023_09_02_021308_create_products_table', 1),
(7, '2023_09_02_021828_create_variant_products_table', 1),
(8, '2023_09_02_122440_create_sales_table', 1),
(9, '2023_09_02_122514_create_carts_table', 1),
(10, '2023_09_02_122542_create_cart_details_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Croffle', 'dibuat dari croissant yang dibentuk seperti waffle', 40000, '2023-09-02 19:42:08', '2023-09-02 19:42:08'),
(2, 'Roti Bakar', 'Roti Bakar', 30000, '2023-09-02 19:43:23', '2023-09-02 19:43:23'),
(3, 'Beef Bowl', 'nasi yang disajikan di dalam mangkuk dan diberi topping tumisan daging sebagai lauk', 65000, '2023-09-02 19:54:09', '2023-09-02 19:54:09'),
(4, 'Cinnamon Roll', 'pastry yang terbuat dari gula, mentega, dan kayu manis', 35000, '2023-09-02 19:55:30', '2023-09-02 19:55:30'),
(5, 'Smoothies', 'minuman bertesktur cair dari sari buah atau sayur tanpa ampas', 42000, '2023-09-02 19:58:37', '2023-09-02 19:58:37'),
(6, 'onion ring', 'onion ring', 32000, '2023-09-02 22:22:01', '2023-09-02 22:22:01'),
(7, 'Puding Cery', 'Puding with Cery', 32000, '2023-09-02 22:23:02', '2023-09-02 22:23:02'),
(8, 'Creme Brulee', 'hidangan penutup tradisional dari Prancis yang terdiri dari krim manis yang lembut dengan lapisan gula karamel yang renyah di atasnya', 42000, '2023-09-02 22:23:51', '2023-09-02 22:23:51'),
(9, 'Havermut Yogurt', 'Havermut Yogurt', 42000, '2023-09-02 22:24:54', '2023-09-02 22:24:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `payment_method` enum('OVO','DANA','Shopee_pay','Gopay') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `total_price`, `payment_method`, `created_at`, `updated_at`) VALUES
(1, 142000, 'OVO', '2023-09-02 20:04:29', '2023-09-02 20:04:30'),
(2, 132000, 'OVO', '2023-09-02 23:13:34', '2023-09-02 23:13:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'davaa', 'davaa@mail.com', NULL, '$2y$10$M2YWDv1hNy0hEOSrFXaKOetS/oR23kjS6NQMTPG3jA3T/wxP9W3TC', NULL, '2023-09-02 19:21:04', '2023-09-02 19:21:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `variant_products`
--

CREATE TABLE `variant_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_name` varchar(255) NOT NULL,
  `additional_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `variant_products`
--

INSERT INTO `variant_products` (`id`, `product_id`, `variant_name`, `additional_price`, `created_at`, `updated_at`) VALUES
(1, 1, 'saus cokelat', 10000, '2023-09-02 19:44:53', '2023-09-02 19:44:53'),
(2, 1, 'es krim', 12000, '2023-09-02 19:45:11', '2023-09-02 19:45:11'),
(3, 1, 'sirup maple', 12000, '2023-09-02 19:45:27', '2023-09-02 19:45:27'),
(5, 2, 'keju coklat', 12000, '2023-09-02 19:47:20', '2023-09-02 19:47:20'),
(6, 2, 'milo', 10000, '2023-09-02 19:47:41', '2023-09-02 19:47:41'),
(7, 2, 'oreo susu', 10000, '2023-09-02 19:47:53', '2023-09-02 19:47:53'),
(8, 3, 'woku', 10000, '2023-09-02 19:59:48', '2023-09-02 19:59:48'),
(9, 3, 'rendang', 10000, '2023-09-02 20:00:12', '2023-09-02 20:00:12'),
(10, 4, 'Maple & Bacon', 12000, '2023-09-02 20:02:03', '2023-09-02 20:02:03'),
(11, 4, 'Moka Pepermin', 10000, '2023-09-02 20:02:33', '2023-09-02 20:02:33'),
(12, 5, 'Orange Glow', 10000, '2023-09-02 20:03:27', '2023-09-02 20:03:27'),
(13, 5, 'Yogurt Strawberry', 5000, '2023-09-02 20:03:54', '2023-09-02 20:03:54');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_sales_id_foreign` (`sales_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_details_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_details_variant_product_id_foreign` (`variant_product_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `variant_products`
--
ALTER TABLE `variant_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_products_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `variant_products`
--
ALTER TABLE `variant_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `cart_details_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_details_variant_product_id_foreign` FOREIGN KEY (`variant_product_id`) REFERENCES `variant_products` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `variant_products`
--
ALTER TABLE `variant_products`
  ADD CONSTRAINT `variant_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
