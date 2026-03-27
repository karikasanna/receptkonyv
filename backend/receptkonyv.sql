-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 27. 22:38
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `konyvtar`
--
CREATE DATABASE IF NOT EXISTS `konyvtar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `konyvtar`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author` varchar(255) NOT NULL,
  `title` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`id`, `author`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Karl Marx', 'Tőke', '2026-02-21 15:49:42', '2026-02-21 15:49:42'),
(2, 'Stephen King', 'Ragyogás', '2026-02-21 15:49:42', '2026-02-21 15:49:42'),
(3, 'Kissné Szalai Gréta', 'Sed incidunt est consectetur eius quis.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(4, 'Hegedüs Hanga', 'Est incidunt eum rerum velit sequi perspiciatis.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(5, 'Borbély Olivérné', 'Dignissimos saepe vel assumenda provident dolor.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(6, 'Prof. Feketéné Angéla', 'Neque id ipsa sed non.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(7, 'Farkas Judit PhD', 'In atque repellendus dolor amet.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(8, 'Oláhné Németh Jázmin', 'Veniam aut aut fugit non sit dolores quas hic.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(9, 'Ifj. Varga Márton', 'Dolorem et fugit quasi qui iure molestiae.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(10, 'Dr. Papp Barna', 'Non cupiditate assumenda voluptas eius provident omnis.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(11, 'Katona-Rácz Mirella', 'Et nisi aliquam eius ipsum sunt occaecati.', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(12, 'László-Simon Johanna', 'Enim amet vero ut magni vel voluptatem.', '2026-02-21 15:49:43', '2026-02-21 15:49:43');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `copies`
--

CREATE TABLE `copies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `hardcovered` tinyint(1) NOT NULL DEFAULT 1,
  `publication` year(4) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `copies`
--

INSERT INTO `copies` (`id`, `book_id`, `hardcovered`, `publication`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2000', 0, '2026-02-21 15:49:42', '2026-02-21 15:49:42'),
(2, 2, 1, '2020', 2, '2026-02-21 15:49:42', '2026-02-21 15:49:42');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `jobs`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `lendings`
--

CREATE TABLE `lendings` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `copy_id` bigint(20) UNSIGNED NOT NULL,
  `start` date NOT NULL DEFAULT '2026-02-21',
  `end` date DEFAULT NULL,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `lendings`
--

INSERT INTO `lendings` (`user_id`, `copy_id`, `start`, `end`, `warnings`, `created_at`, `updated_at`) VALUES
(3, 1, '1999-03-07', NULL, 3, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(3, 2, '2004-05-06', NULL, 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(4, 2, '1995-08-18', NULL, 3, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(6, 1, '2010-02-10', NULL, 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(6, 1, '2025-11-27', NULL, 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(8, 1, '1988-03-17', NULL, 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(9, 1, '1984-09-06', NULL, 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(10, 1, '1980-04-17', NULL, 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(10, 2, '1984-10-23', NULL, 3, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(11, 1, '2016-08-16', NULL, 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_24_160043_create_books_table', 1),
(5, '2025_09_24_161105_create_copies_table', 1),
(6, '2025_10_08_154306_create_lendings_table', 1),
(7, '2025_10_08_170819_create_personal_access_tokens_table', 1),
(8, '2025_11_19_162805_create_reservations_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', '50a26f370b1e14d090849e4370a258d65a5e87720e87961c35d57e9863e2d7c9', '[\"*\"]', NULL, NULL, '2026-02-21 15:55:47', '2026-02-21 15:55:47');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservations`
--

CREATE TABLE `reservations` (
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start` date NOT NULL DEFAULT '2026-02-21',
  `message` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `reservations`
--

INSERT INTO `reservations` (`book_id`, `user_id`, `start`, `message`, `created_at`, `updated_at`) VALUES
(2, 1, '1990-02-18', 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(4, 2, '1986-10-14', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(4, 2, '2018-04-30', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(4, 7, '1992-02-11', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(6, 4, '2022-09-03', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(7, 9, '2007-08-12', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(11, 4, '1981-11-14', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(12, 5, '1975-04-13', 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(12, 5, '2020-11-11', 1, '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(12, 7, '2009-06-02', 0, '2026-02-21 15:49:43', '2026-02-21 15:49:43');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@teszt.com', NULL, '$2y$12$XBLneEwreK.ItJIaaiqwmetXyfgewb/g5eO6c/POgz4OnVT8yZw9m', 0, NULL, '2026-02-21 15:49:41', '2026-02-21 15:49:41'),
(2, 'Teszt1', 'teszt@teszt.com', NULL, '$2y$12$khnetPWMhsZLsp7S4HKaZOSuZGLkySG2WViOiyrwJMRRYcsLItswy', 1, NULL, '2026-02-21 15:49:42', '2026-02-21 15:49:42'),
(3, 'Dr. Norbert Rippin MD', 'ferry.terrence@example.net', '2026-02-21 15:49:42', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 2, '8szDetZDOa', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(4, 'Faustino Feil', 'thoeger@example.com', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 0, 'e3mQ3IcRJL', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(5, 'Emiliano Muller', 'mccullough.gabriel@example.com', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 0, 'hqiwEwrcoy', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(6, 'Alessia Bailey', 'jermaine.schimmel@example.net', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 1, '58gNyGYV2a', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(7, 'Prof. Tyreek Schneider', 'jaiden49@example.net', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 1, 'qr2F7jl7TQ', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(8, 'Hazle Hane', 'myrtie.murazik@example.org', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 0, 'bcqJuPEZcI', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(9, 'Dr. Heather Gulgowski DDS', 'lind.sarah@example.org', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 2, 'iQHxzeUFAl', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(10, 'Neha Howe', 'angela63@example.net', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 1, 'U3RwqNymb4', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(11, 'Dr. Sedrick Hessel III', 'paige29@example.net', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 2, 'Ftt2Fep4XN', '2026-02-21 15:49:43', '2026-02-21 15:49:43'),
(12, 'Prof. Sarah Rogahn PhD', 'omohr@example.org', '2026-02-21 15:49:43', '$2y$12$uQJhj9DKUvFg3znYb7IUv.8r1lsNnofGlkAKxqxLk3fxyb6LV2GcS', 1, '8C8yhD5UEg', '2026-02-21 15:49:43', '2026-02-21 15:49:43');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `copies`
--
ALTER TABLE `copies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `copies_book_id_foreign` (`book_id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- A tábla indexei `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `lendings`
--
ALTER TABLE `lendings`
  ADD PRIMARY KEY (`user_id`,`copy_id`,`start`),
  ADD KEY `lendings_copy_id_foreign` (`copy_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- A tábla indexei `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`book_id`,`user_id`,`start`),
  ADD KEY `reservations_user_id_foreign` (`user_id`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `copies`
--
ALTER TABLE `copies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Megkötések a táblához `lendings`
--
ALTER TABLE `lendings`
  ADD CONSTRAINT `lendings_copy_id_foreign` FOREIGN KEY (`copy_id`) REFERENCES `copies` (`id`),
  ADD CONSTRAINT `lendings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Adatbázis: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- A tábla adatainak kiíratása `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"konyvtar\",\"table\":\"users\"},{\"db\":\"szakdoga\",\"table\":\"books\"}]');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- A tábla adatainak kiíratása `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-02-21 16:52:05', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"hu\"}');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- A tábla indexei `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- A tábla indexei `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- A tábla indexei `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- A tábla indexei `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- A tábla indexei `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- A tábla indexei `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- A tábla indexei `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- A tábla indexei `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- A tábla indexei `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- A tábla indexei `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- A tábla indexei `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- A tábla indexei `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- A tábla indexei `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Adatbázis: `receptkonyv`
--
CREATE DATABASE IF NOT EXISTS `receptkonyv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `receptkonyv`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'főétel', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(2, 'leves', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(3, 'desszert', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(4, 'saláta', '2026-03-27 20:13:23', '2026-03-27 20:13:23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `jobs`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_21_111152_create_categories_table', 1),
(5, '2026_03_21_111259_create_recipes_table', 1),
(6, '2026_03_21_120553_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `img_source` varchar(255) NOT NULL DEFAULT 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `cat_id`, `img_source`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Vel voluptatem.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Ut ex nihil ea dolorum eos repellat est vel consequuntur cupiditate rerum maiores natus est.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(2, 'Quia est eos.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Aperiam cumque ut necessitatibus ut ut ea sunt ratione perferendis.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(3, 'Dolor minima.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Vel et commodi rerum non ad nam optio perspiciatis illum soluta et quam molestiae.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(4, 'Itaque quas.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Temporibus accusantium nulla impedit quidem omnis incidunt.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(5, 'Ducimus repellat earum.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Placeat velit voluptates debitis autem quam itaque molestiae rerum eveniet aspernatur.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(6, 'Ipsum modi quia.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Quasi adipisci culpa nisi sed repudiandae error sit dolores placeat.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(7, 'Et qui aut.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Et eligendi eligendi nobis est et dolores distinctio veniam dolor culpa veniam doloremque mollitia possimus.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(8, 'Et ullam debitis.', 1, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Doloribus et consectetur quo sunt natus aut repellat occaecati consequatur.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(9, 'Alias ut.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Neque rerum rerum consequatur quae consequatur eos.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(10, 'Consequatur id iste.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Porro in repellat qui incidunt fugiat et est consectetur necessitatibus.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(11, 'Quibusdam quia et.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Nam a neque nulla dolor et impedit iste.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(12, 'Sapiente ab et.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Ipsum voluptas sed temporibus quia accusamus odit magni voluptas sint rerum corrupti laboriosam fugiat.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(13, 'Doloribus alias.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Doloremque assumenda sequi quas praesentium ut odit nihil rerum quasi minima dolorem esse.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(14, 'Culpa animi cum.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Vel porro doloremque rerum optio modi qui ut.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(15, 'Nihil qui.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Voluptates eum qui ex et et dolorem ex tenetur sed et laudantium fugit.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(16, 'Nostrum omnis dolores.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Quibusdam enim fuga voluptatibus aut laboriosam reiciendis corporis vel aliquam voluptatibus aliquam atque qui.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(17, 'Mollitia nesciunt et.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Ipsam qui illo nam libero sed labore magnam quam.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(18, 'Excepturi voluptas.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Soluta modi consequuntur et quia ipsum reprehenderit ipsa ea tenetur.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(19, 'Voluptate voluptate labore.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Aut vero odio quidem ipsa rerum voluptates eum id ullam sapiente dolorem incidunt enim.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(20, 'Doloremque similique.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Laudantium quisquam architecto alias iste magni laboriosam ut rerum dolor soluta quas.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(21, 'Aut modi.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Hic temporibus nihil et dignissimos quo consequuntur iusto eius accusamus quis minima sequi reiciendis.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(22, 'Quisquam voluptatem sed.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Ipsa doloribus nulla velit mollitia ut facere.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(23, 'Quia eum.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Voluptates non totam unde qui exercitationem ut maxime itaque.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(24, 'Est nostrum.', 1, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Eum quo consequatur et est animi maxime maxime mollitia sapiente suscipit consequatur.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(25, 'Ab nobis dolorem.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Molestias id culpa est adipisci doloremque nihil cumque consequatur qui.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(26, 'Veritatis soluta.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Earum qui cum doloremque soluta iure blanditiis non nam sed quidem ad.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(27, 'Quia laudantium unde.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Porro iusto magnam doloremque architecto facilis aut modi laboriosam.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(28, 'Sed et tempore.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Laborum eum velit eos rem ut repudiandae dolorum libero.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(29, 'Adipisci quis.', 4, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Dolores autem ea sequi aut occaecati vitae quia nam.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(30, 'In aut fuga.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Id aperiam iste ullam est nihil expedita sit sed ad libero delectus.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(31, 'Dicta ea est.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Architecto et voluptatem similique laboriosam fuga non mollitia consequatur porro vel asperiores.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(32, 'Et rerum.', 1, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Fugiat impedit sunt omnis iste ipsum est minus iste facilis mollitia et repellendus pariatur.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(33, 'Sit veniam dolores.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Qui sapiente ut quo quam incidunt ut sit assumenda accusantium.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(34, 'Autem odio.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Dicta et esse modi ad eveniet quasi sequi id nulla tenetur laboriosam modi perspiciatis.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(35, 'Animi voluptatem cupiditate.', 2, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Dolor incidunt minus sit necessitatibus aut eum quasi expedita iusto.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(36, 'Non fuga.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Sunt quae temporibus eaque voluptatum rerum quis nam rerum aliquid nulla.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(37, 'Recusandae blanditiis.', 1, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Est ut officia cum consectetur et aspernatur.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(38, 'Voluptate vitae sit.', 1, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Molestias in in et animi quam sint harum quo quae omnis.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(39, 'Aliquid aliquam ut.', 3, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Eum quia autem omnis architecto commodi tempora sequi iste deleniti unde.', '2026-03-27 20:13:23', '2026-03-27 20:13:23'),
(40, 'Debitis fugiat.', 1, 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 'Fuga nemo quo incidunt consequatur laboriosam nisi et qui quaerat.', '2026-03-27 20:13:23', '2026-03-27 20:13:23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
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
-- A tábla adatainak kiíratása `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4R3jxL1Q99wUuj42fi3H7TQ7z7nhciSv5q2qrMWy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3poN2JVNkZnTXZPemIyZnpKOVlualFwWUVGSG1mNnN1UWp1T094aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774646045);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
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
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2026-03-27 20:13:23', '$2y$12$qi4GFao15j3Osg3tsDeDQeKLUWKwEeXyjnoz0AsArnxE5xvQiMwqe', 'EbMpVueSgb', '2026-03-27 20:13:23', '2026-03-27 20:13:23');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- A tábla indexei `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- A tábla indexei `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_cat_id_foreign` (`cat_id`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);
--
-- Adatbázis: `szakdoga`
--
CREATE DATABASE IF NOT EXISTS `szakdoga` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `szakdoga`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `age_groups`
--

CREATE TABLE `age_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `age_groups`
--

INSERT INTO `age_groups` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, '6-10 éves kor', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(2, '3-6 éves kor', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(3, '0-3 éves kor', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(4, '3-6 éves kor', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(5, '10-14 éves kor', '2026-03-14 10:16:05', '2026-03-14 10:16:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `authors`
--

INSERT INTO `authors` (`id`, `name`, `book_id`, `nationality`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Presley Durgan V', 1, 'Mauritius', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(2, 'Moises Hilpert', 2, 'Albania', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(3, 'Jeffry Ruecker', 3, 'Mayotte', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(4, 'Dr. Andre Stehr DDS', 4, 'French Polynesia', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(5, 'Vickie Cruickshank', 5, 'Heard Island and McDonald Islands', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(6, 'Rae McKenzie', 6, 'Russian Federation', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(7, 'Addie Watsica', 7, 'Mauritius', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(8, 'Kieran Bechtelar III', 8, 'Nicaragua', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(9, 'Miss Bethany Gerlach', 9, 'Antarctica (the territory South of 60 deg S)', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(10, 'Gennaro Will MD', 10, 'Equatorial Guinea', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(11, 'Rupert Thompson', 11, 'Saudi Arabia', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(12, 'Dr. Deonte Kris III', 12, 'Martinique', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(13, 'Cedrick Carter', 13, 'Faroe Islands', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(14, 'Noel Heaney', 14, 'Azerbaijan', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(15, 'Yadira Ortiz', 15, 'Iraq', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(16, 'Prof. Fay Rohan', 16, 'Isle of Man', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(17, 'Dr. Retta Marvin DVM', 17, 'Guatemala', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(18, 'Tyrique Mueller', 18, 'Timor-Leste', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(19, 'Tiffany Reichert', 19, 'Lithuania', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(20, 'Dr. Tyra Berge', 20, 'Djibouti', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(21, 'Viviane Herzog', 21, 'Samoa', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(22, 'Gunner Douglas', 22, 'Comoros', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(23, 'Ronaldo Schaden', 23, 'Saint Martin', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(24, 'Elinore Deckow', 24, 'Korea', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(25, 'Jed Streich', 25, 'New Caledonia', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(26, 'Conrad McGlynn', 26, 'Iraq', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(27, 'Quinn Jacobs', 27, 'Kiribati', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(28, 'Jordon Wolff', 28, 'Lebanon', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(29, 'Marques Lynch', 29, 'New Caledonia', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(30, 'Jody Orn', 30, 'Antigua and Barbuda', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(31, 'Lambert Beer', 31, 'Argentina', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(32, 'Minnie Leuschke', 32, 'Uzbekistan', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(33, 'Oral Dach', 33, 'Ghana', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(34, 'Jaida Blanda', 34, 'Cambodia', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(35, 'Etha Hickle', 35, 'Gambia', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(36, 'Dr. Joanne Swift', 36, 'Timor-Leste', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(37, 'Cooper McCullough', 37, 'Guatemala', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(38, 'Prof. Noe Walker DDS', 38, 'Azerbaijan', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(39, 'Jean Jenkins', 39, 'Belgium', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(40, 'Wyman Willms Sr.', 40, 'Greenland', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(41, 'Maya Lockman DVM', 41, 'Guinea', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(42, 'Jammie Kuphal', 42, 'Christmas Island', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(43, 'Uriel Mayert', 43, 'Netherlands', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(44, 'Anita Roberts', 44, 'Cameroon', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(45, 'Ruthie Lang', 45, 'Vietnam', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(46, 'Prof. Rylee Kunze', 46, 'Puerto Rico', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(47, 'Ryley Jaskolski', 47, 'Mayotte', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(48, 'Dora Schuppe', 48, 'Ukraine', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(49, 'Alessia Keeling', 49, 'Haiti', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(50, 'Lurline Connelly', 50, 'Norway', '2026-03-14 10:16:05', '2026-03-14 10:16:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `length` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `publication_date` date NOT NULL,
  `agegroup_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL DEFAULT 3490,
  `content` text NOT NULL,
  `inventory` int(11) NOT NULL,
  `image_link` varchar(255) NOT NULL DEFAULT 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`id`, `length`, `title`, `publication_date`, `agegroup_id`, `price`, `content`, `inventory`, `image_link`, `created_at`, `updated_at`) VALUES
(1, 151, 'Molestias a iure est non dicta.', '2007-08-07', 2, 5438, 'Exercitationem in aliquam impedit repellendus atque dolores sunt et dolor excepturi molestiae omnis nemo corrupti aspernatur molestias non commodi quia impedit tempore commodi tenetur illum deserunt aliquid molestiae unde distinctio blanditiis odio sint nihil praesentium est voluptatem repudiandae error magnam libero aliquid qui sit dolore voluptas atque asperiores aliquam doloremque rerum explicabo sequi labore et sed ab numquam eveniet sit rerum aut consequuntur iste cum in sint cumque.', 11, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 11:11:00'),
(2, 361, 'Et nihil provident rem vel.', '1976-05-20', 4, 1249, 'Voluptas dicta ea fuga repudiandae repellendus voluptatum praesentium sit et ducimus dicta harum repudiandae sit quam magni ut ut qui laboriosam accusamus modi incidunt impedit nisi aliquam non unde asperiores nam nam odio quos accusantium tempora deserunt eligendi odit facilis adipisci deserunt ad optio et.', 14, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:57:05'),
(3, 127, 'Et assumenda laudantium ipsam iusto in.', '2013-05-10', 3, 8210, 'Et voluptas occaecati voluptatum nemo laboriosam dolor qui ut sit deleniti eos sequi consequatur odit ut magnam perspiciatis ut id at et est possimus vero dolorem quisquam dignissimos eum est odio ea eveniet eveniet reprehenderit non beatae debitis sapiente libero ratione molestiae possimus consequatur alias dolorem perferendis nesciunt porro excepturi qui soluta molestiae facere.', 5, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(4, 456, 'Dolores ut reprehenderit commodi dolorem eligendi.', '2002-07-31', 5, 3655, 'Dolorum mollitia illo nulla doloremque aut illum et aliquid porro quia perspiciatis ad molestias et ipsa laborum repellat accusamus culpa error explicabo rem molestiae quia unde aspernatur voluptate consequatur quod dolorem occaecati ullam rerum recusandae explicabo autem quae qui in id sunt nobis doloremque quae dignissimos dolor cupiditate repellat velit consequatur voluptatem facere consequatur debitis corporis ad nam voluptatem adipisci incidunt corporis harum rem reprehenderit ab voluptatibus.', 6, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(5, 415, 'Quis veritatis aliquid iste.', '2017-01-16', 4, 2327, 'Ut maiores et tenetur id qui deserunt modi consequatur natus aperiam molestiae eveniet libero sunt sed quis expedita et enim minima pariatur ut dolores labore ea accusamus dolor sint aut iste at perferendis praesentium molestiae cumque iusto ea nesciunt non qui dolorem et velit omnis sed optio repellat qui.', 5, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(6, 107, 'A aut nulla.', '2000-10-05', 2, 3511, 'Ipsa enim sit voluptas animi enim aut odio nesciunt nisi est natus odit placeat dolorem maiores recusandae porro et aliquid minima voluptatem consequuntur qui in nostrum quam necessitatibus qui officia dolorum officia perferendis saepe unde quidem quidem explicabo et eaque labore enim dolores impedit est itaque deleniti cum et optio ipsum molestiae consequatur assumenda aut consequuntur corporis distinctio autem culpa sint nesciunt et aperiam architecto ea quibusdam ipsa.', 13, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(7, 295, 'Alias repellat tempore corporis.', '1992-07-31', 4, 1068, 'Quo vitae est sunt ab repudiandae illo deleniti aut consequatur incidunt et quia error voluptates accusantium est debitis qui facere aspernatur dolorem ut sit nulla quia neque sit quidem minus soluta eveniet voluptatem cum.', 2, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(8, 266, 'Minus suscipit rerum eum.', '2011-02-13', 4, 4023, 'Eum molestiae maiores quod dolor voluptas qui aut repellat mollitia vel omnis veniam sapiente reiciendis alias voluptates velit ut beatae velit porro temporibus excepturi quisquam quidem velit quidem consequatur ab atque deserunt ea eum culpa facilis dolorum voluptate natus voluptas nisi aut debitis mollitia ut nihil excepturi et officiis libero eaque.', 21, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(9, 199, 'Culpa voluptate hic eaque aut qui.', '1985-12-11', 4, 2405, 'Eveniet perferendis suscipit minus ullam facere quaerat suscipit aut laudantium voluptate eum aut corporis qui rerum labore odio modi voluptatum est in libero amet harum voluptate consequuntur velit quas sed facilis voluptas ullam odio exercitationem laborum dolorem earum labore beatae nostrum velit cum quaerat inventore eveniet libero ut quod vero repellat voluptatem maiores veniam aut ducimus aliquid autem accusantium.', 19, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(10, 354, 'Minima blanditiis at in delectus.', '1970-06-06', 5, 7017, 'Eos unde quas excepturi animi dolores et vel distinctio perferendis enim enim animi nam et earum repudiandae repellat explicabo quibusdam hic ut aliquam ut voluptatibus tenetur magnam eveniet velit inventore veritatis perferendis quo animi blanditiis eos ut perferendis officiis qui aut a facilis omnis sint.', 14, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(11, 462, 'Quibusdam ipsam nulla.', '2016-03-02', 3, 2501, 'Ut voluptas placeat et delectus asperiores tenetur illo consequatur voluptas aspernatur sint nemo recusandae perferendis eligendi dolor quia ea ipsum incidunt aspernatur ut quaerat quaerat quas in sed vitae ipsa doloribus atque iure qui dolorem ea nisi enim quia nostrum ut veritatis minima omnis enim corrupti cupiditate praesentium quod molestiae molestiae nisi aliquam odio excepturi quia vel.', 22, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(12, 479, 'Doloremque doloremque et facere.', '1982-03-03', 1, 8752, 'Nihil quos sed sit illo impedit aut enim possimus in consequuntur enim soluta ut explicabo dignissimos eveniet nesciunt earum quibusdam temporibus quidem perferendis dolorum veritatis harum id facere enim nam eveniet aut aspernatur et corporis aliquid et quidem dignissimos exercitationem accusantium deleniti quis praesentium et mollitia enim facilis.', 14, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(13, 444, 'Impedit distinctio ratione impedit.', '2007-03-31', 2, 8701, 'Suscipit inventore velit veritatis rerum quis cumque et laudantium dolorem aut totam sunt vero et consequatur aliquid ipsa placeat repudiandae voluptatum modi suscipit molestias dolor qui voluptate ipsam suscipit est accusamus ipsam dolorem quibusdam qui esse at quas maxime cupiditate omnis sunt explicabo minima pariatur et aliquid aliquam facilis.', 25, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(14, 283, 'Sint eum cupiditate quo rem.', '1993-10-05', 1, 5200, 'Placeat iusto eos ratione ea ab et maiores aut nihil mollitia ea rerum necessitatibus qui laborum nobis ipsum dolor voluptatum nisi quaerat doloribus similique doloribus quidem rerum sed voluptatem placeat aut perferendis ad nesciunt voluptatibus culpa rerum nostrum rerum qui fugit eum iusto velit qui iure optio omnis velit omnis non voluptatem quo quo aut fuga sint quibusdam quia quia est ea ad saepe et dolorum nobis et voluptatem.', 23, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(15, 305, 'Non ad eum sunt sit architecto.', '1977-12-15', 4, 5029, 'Quas adipisci in qui sunt eaque sapiente nihil accusamus rerum non ut distinctio non non sint et debitis quas voluptas placeat officia sed vel quos blanditiis sint odit rerum est alias explicabo vel suscipit.', 5, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(16, 143, 'Sunt voluptatibus exercitationem voluptate dicta rerum.', '1984-01-03', 2, 3746, 'Voluptatem dolor voluptate et eius quisquam perspiciatis voluptate voluptatem voluptatem sit sequi sequi soluta facere id eveniet facilis sit alias non ut at officia quidem sed autem aut ea expedita adipisci nemo eligendi nostrum alias recusandae magnam.', 17, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(17, 515, 'Sed veniam optio aspernatur sapiente perspiciatis.', '1993-10-11', 1, 6289, 'Exercitationem omnis omnis ut voluptatem iusto praesentium totam doloremque et veritatis sequi perspiciatis natus voluptatibus maiores architecto velit fugit vero omnis deleniti necessitatibus iusto aut magnam voluptatem quis et numquam autem accusamus et at quidem laboriosam tenetur amet voluptas dolorem quisquam voluptas et magni eos velit nihil.', 1, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(18, 308, 'Omnis vel tempore similique.', '2016-05-15', 2, 6914, 'Ea modi possimus similique dolor veritatis magnam molestias iure non qui necessitatibus consequuntur et quos ex asperiores provident esse quaerat voluptatibus quidem corporis vel temporibus vitae velit amet assumenda et sit aliquid quis odio.', 22, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(19, 327, 'Commodi ratione id impedit facilis.', '1998-03-15', 1, 6514, 'Deleniti et ipsum tempore saepe voluptatem libero et nihil voluptatum qui maxime ad sint et et numquam mollitia aut neque ipsum nam atque quisquam assumenda ipsum veniam alias ipsa veritatis magnam quaerat assumenda voluptas adipisci molestiae dicta facere expedita molestiae animi et quis velit quasi exercitationem sit et voluptatem ea reprehenderit itaque eius quod cum.', 0, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:19:23'),
(20, 74, 'Quis occaecati sed dignissimos perferendis.', '1997-03-06', 1, 5233, 'Provident id quia assumenda rerum blanditiis nisi dolorem suscipit aperiam dolor fuga qui fuga et ea animi dicta maxime in similique rem sequi deserunt quod aut ut eum quia excepturi quam distinctio et sed.', 12, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(21, 222, 'Aut voluptatem fugiat nihil vel.', '2000-10-13', 3, 4718, 'Sunt est ratione sed debitis libero id sit sit voluptatum blanditiis ullam molestiae dolor rerum omnis ea nisi earum rem aut et quia dicta corrupti natus labore amet perspiciatis ipsa est nobis incidunt aut eum.', 6, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 12:07:02'),
(22, 535, 'Voluptate in odit vel nesciunt.', '1985-03-01', 4, 2577, 'Dolorem mollitia quibusdam officiis expedita dolores beatae sit veniam fugit vel at earum similique est velit quae velit dolorem et enim qui dolores architecto quam voluptatem ducimus illum quia et rerum voluptatum minima expedita est inventore omnis voluptates quas esse dolore excepturi dolorum.', 10, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(23, 312, 'Et eaque voluptates sint quam dolores.', '1998-01-04', 1, 6042, 'Nulla est deleniti voluptatem nam dicta provident deleniti minus totam asperiores sit illo minus totam eum et similique odio animi voluptate atque cum iure labore ad fugiat ducimus unde ipsa est officia accusamus quidem perspiciatis ea sit odit dolorem quam ex est beatae dicta enim laborum nihil molestiae aut provident non sed delectus magnam voluptatum odit.', 14, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(24, 296, 'Adipisci harum cumque aut tempora.', '1970-09-29', 2, 6088, 'Sed ullam incidunt aut perspiciatis officiis iusto quam tempore commodi eum consectetur assumenda pariatur aut unde voluptatem repudiandae dolor consequatur ipsam rerum perferendis qui et odio aut voluptas esse ut officiis suscipit.', 5, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(25, 40, 'Molestias deserunt error accusamus nihil.', '1976-03-04', 4, 5857, 'Odio et molestiae vitae omnis quae ipsum necessitatibus saepe sit qui est cum et voluptate accusantium ullam eveniet rerum et numquam non reiciendis molestiae non laborum quibusdam esse veniam tempora voluptas ut et mollitia cum perspiciatis dicta optio repellendus officiis blanditiis vero non aut quasi quo quasi ut doloremque dolores labore in nisi non nihil quisquam architecto aut aliquid repudiandae animi exercitationem nostrum accusamus natus tempora.', 8, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(26, 114, 'Voluptatum itaque nihil.', '2002-05-29', 2, 7947, 'Ducimus omnis perspiciatis consequatur itaque voluptatem sunt expedita consequatur natus deserunt dolor sunt autem nobis necessitatibus hic dolor aperiam accusantium consequatur eaque fuga voluptas ipsum eligendi laborum maiores accusantium sed dolorem quaerat est.', 4, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(27, 308, 'Nam repudiandae illum.', '2002-11-10', 5, 1907, 'Numquam porro nihil sit magnam ab ipsa odit laborum labore necessitatibus nostrum omnis tempore commodi libero nostrum laudantium debitis eaque harum quis velit omnis et sunt ab voluptatum ipsam cumque est rerum.', 3, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(28, 96, 'Nobis quasi quidem quidem dicta.', '1986-01-28', 5, 3714, 'Asperiores dolorem ut quis vel vero necessitatibus error error id sed iure qui aliquid aut ullam est maiores ut et non quibusdam asperiores ipsam eius dicta reiciendis minus minima ducimus rerum voluptas voluptas minima et eius quia assumenda rerum eum doloremque nam consequatur facilis ducimus vel aut et ad modi voluptatum eum similique beatae enim alias quas qui repellendus nisi ut aliquam sit voluptatum rerum laudantium molestias et aliquam deleniti.', 17, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(29, 483, 'Nulla facere ad perspiciatis.', '1977-01-07', 4, 7566, 'Quisquam et nisi consequatur velit dolorum aut voluptatum ut culpa iste omnis aut consequatur consequatur provident est explicabo fugiat atque modi ut eligendi aut omnis delectus corporis quibusdam et sit voluptas quod maiores error id natus officia ut aut.', 14, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(30, 485, 'Maiores voluptate officiis maxime eos.', '2008-07-15', 1, 5740, 'Sint ullam id delectus enim tenetur maiores vel iusto maiores id dolore odio omnis accusantium officiis ea consequuntur accusantium ab suscipit a omnis nesciunt magni autem possimus dolorum voluptatum aut deserunt est ea rerum.', 15, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(31, 215, 'Ea dolor et quae.', '1986-06-01', 1, 3354, 'Molestiae beatae error voluptatibus ipsa atque dolores sint doloribus aut molestiae eum est quis sed est ex voluptatem quo soluta excepturi maxime ut tempore ipsum laborum est qui enim libero rerum rerum amet sapiente rerum rerum dignissimos ipsa quasi ipsum omnis qui qui sint ut rem at error voluptas commodi officia corporis itaque est nihil autem in ad quae iste placeat iste deleniti perspiciatis repudiandae delectus id illo blanditiis qui sint.', 21, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(32, 234, 'Excepturi eligendi non distinctio magnam.', '1986-05-22', 1, 5474, 'Rerum ducimus sint aut maxime quia iure quam distinctio modi est dignissimos aspernatur aut rerum eaque fuga praesentium itaque doloribus earum facere nihil ipsum dicta magni optio modi asperiores nulla beatae velit neque ut eos animi.', 8, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(33, 139, 'Sit temporibus voluptatibus aut ullam.', '1986-06-23', 1, 7387, 'Nemo perspiciatis soluta cumque aliquid ut et dolor et blanditiis animi laudantium mollitia pariatur rerum ut repudiandae et dolorem aut vel eligendi est dolor et soluta vero qui perspiciatis quaerat officia qui in velit ducimus enim ab sunt recusandae molestias omnis voluptatem quam non nemo dolores debitis qui vitae et dolorem aut inventore quas.', 15, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(34, 153, 'Reprehenderit laudantium ut aspernatur quia.', '1983-02-02', 3, 2173, 'Praesentium aperiam autem debitis qui deserunt aperiam reprehenderit reprehenderit vitae possimus id ea placeat corrupti laboriosam architecto voluptate totam dolorem et modi reprehenderit ut eos ut aut eos nam dolore accusantium aut et deserunt dicta tempora hic.', 7, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(35, 240, 'Est aut rerum delectus laudantium.', '2010-03-14', 1, 8578, 'Aut eos assumenda dolorem odit reiciendis officia voluptatem repudiandae id aut et distinctio accusamus dolores fuga accusantium assumenda sequi quo praesentium aut rem eum eos id velit soluta deserunt sapiente sed rem ipsam voluptate et nihil veritatis qui ut et cupiditate distinctio necessitatibus laudantium non.', 25, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(36, 47, 'Rem et voluptatibus.', '1999-02-16', 4, 2798, 'Minima porro quia quia est quasi laborum omnis laboriosam fugiat ut repellendus inventore eaque fugiat assumenda sed quibusdam ea quia ex eos repellat consequatur velit voluptas accusamus voluptatem sequi explicabo est et velit nam ea beatae fugit voluptas odit est sit accusantium necessitatibus recusandae consectetur qui quod voluptates fuga sit ipsam odit quasi voluptates tenetur dolorem molestiae.', 8, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(37, 306, 'Dolorem commodi quia optio.', '2000-08-21', 2, 2728, 'Molestias vitae deserunt commodi vel ipsa consectetur illum aut in aut quisquam fuga inventore ea eveniet illo architecto sunt est ex sunt dolor error repellendus eaque et cupiditate corporis expedita laborum nihil repellendus est fuga eos est omnis voluptatum necessitatibus suscipit repudiandae cum quisquam consequatur dignissimos beatae debitis aut illum vero facilis repudiandae atque molestiae libero error sed laboriosam libero tenetur omnis molestias et minima molestias ad sint.', 4, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(38, 272, 'Est eius et temporibus sit.', '1997-03-24', 1, 8498, 'Nihil ab veniam fuga voluptatibus et ducimus culpa et omnis at fugiat corrupti velit possimus ut eius aliquam vero dignissimos consequuntur omnis quidem accusamus quis qui eos et qui necessitatibus facere deserunt voluptas unde maxime consequatur accusamus qui molestiae ut provident dolorum nulla vel magnam sequi et illum et perferendis ipsum a ad sit sint ipsam voluptatem dolores dicta et deleniti possimus totam.', 16, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(39, 301, 'Velit expedita voluptatem aut.', '1995-08-15', 3, 5469, 'At labore illo ut est veniam velit fuga quam quis cumque ratione delectus sit placeat laudantium occaecati corrupti sunt eum accusamus eligendi praesentium beatae alias voluptas dicta a deserunt eos sunt quia et vel illo non nesciunt ullam saepe praesentium rerum sequi enim qui repudiandae qui aut voluptatem dignissimos est ex sed eum dolorem quis unde repellat qui occaecati.', 12, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(40, 88, 'Nesciunt deleniti excepturi similique ipsum cupiditate.', '2009-07-26', 1, 6501, 'Similique commodi sed eos ut qui et earum nisi dolorem nisi debitis blanditiis consectetur nisi consectetur qui vero error sed quo voluptates quisquam impedit voluptas numquam ad facere consectetur et accusantium et debitis neque excepturi maxime quo commodi ut provident ipsam possimus nam ratione beatae et eius temporibus soluta quas labore.', 8, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(41, 77, 'At in officia consequatur.', '2019-07-11', 4, 1264, 'Unde quos odio cupiditate qui iure commodi reiciendis molestiae voluptatum voluptatem architecto eligendi in dolores et voluptatem unde ullam quidem id aut aliquid voluptas omnis ducimus ducimus ut eligendi quis sint aliquid ex et hic facilis et sit nostrum blanditiis numquam nulla nesciunt eum consequatur et nihil quia amet amet voluptatem dolores neque est pariatur voluptas illum exercitationem.', 17, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(42, 217, 'Qui perferendis corporis eos quaerat consequatur.', '1970-12-09', 5, 6081, 'Impedit deleniti eos quod et aperiam accusantium explicabo fugit eos nemo ad similique in molestiae reprehenderit eum in rerum esse alias quod dolorem quis sit qui dolores laborum praesentium eaque ex cupiditate ut distinctio possimus magnam quia provident eum laudantium aut suscipit eum libero vero occaecati in non ab velit eos ad dolores voluptatem quo dolores similique a ut est distinctio dolorum.', 25, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(43, 539, 'Placeat pariatur velit.', '2007-03-27', 3, 6123, 'Aut architecto nisi qui temporibus porro esse voluptatem rerum itaque aut reprehenderit provident maiores ipsam odit quia et qui possimus cum aut nostrum eius voluptatem est aut hic unde suscipit cum earum consectetur ut praesentium voluptas ipsum temporibus earum hic cupiditate ipsum laudantium dolorem fugiat nulla quis voluptatem consectetur culpa odit dolores id ab vel minus earum nihil atque quos quo sint illum sed ab possimus explicabo dolores iure ipsum.', 11, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(44, 477, 'Sed et quod quis rerum perferendis.', '1975-03-19', 5, 6743, 'Sed suscipit quam qui aspernatur nobis natus ea et asperiores sequi voluptatem mollitia ullam omnis nihil consequatur vel est ea voluptatem dolores error cum eius voluptas molestiae eos nesciunt alias magnam veritatis ut et consequatur qui facilis omnis consectetur illo quo autem blanditiis minus minus sit ipsa pariatur ut aperiam numquam quam quo nam aut unde molestias qui saepe ut qui excepturi reiciendis et et.', 22, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(45, 376, 'Perferendis nostrum vitae maiores odit.', '2006-05-02', 5, 7979, 'Ab quia nesciunt non vitae et hic praesentium eum debitis sed soluta numquam fugiat tempore accusamus eos molestiae rerum enim sequi et ipsa molestiae et repellat delectus pariatur est accusantium veritatis ex non eos temporibus voluptate aut et voluptate soluta sed earum debitis corporis veritatis voluptas distinctio est ipsam iste voluptas necessitatibus doloremque quae illo voluptas dolorem ipsum.', 2, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(46, 486, 'Omnis dolore iure ad possimus rerum.', '2018-04-14', 4, 3664, 'Temporibus vel aliquam consequatur rem dignissimos aut accusantium temporibus eos sunt qui voluptatem fugiat eius velit vel sint delectus dolor debitis repudiandae esse reprehenderit est voluptas voluptas eos id veritatis aut eos distinctio nostrum qui cum unde iste optio sed et beatae aliquid reprehenderit quaerat sapiente assumenda nisi recusandae voluptate neque eaque dolores corporis ducimus consequatur magni numquam explicabo quis.', 25, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(47, 363, 'Sequi exercitationem accusantium.', '2019-10-31', 2, 3189, 'Deleniti perspiciatis est omnis sint cupiditate est dolorem illo omnis quibusdam dolorem pariatur perferendis in atque culpa eveniet aspernatur voluptates veritatis nesciunt et nesciunt dolorum sunt sed itaque et vel quia odit.', 6, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(48, 212, 'Sed dolor quidem iusto.', '1975-02-03', 4, 3073, 'Quasi similique perspiciatis qui porro aut praesentium rerum et neque illo aut quis exercitationem in provident consequuntur harum recusandae molestias nisi eius quos autem nam sit animi tempore sunt provident fugiat harum expedita et aperiam aut est optio alias ut laudantium quia dicta eveniet aliquam et dolor earum tempora voluptatem velit ipsum exercitationem ea aut in.', 22, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(49, 354, 'Rerum earum mollitia illo.', '2020-08-09', 1, 7998, 'Et eaque consequatur quibusdam vitae aut quis aut in dolores quo commodi repudiandae aut aperiam totam at nihil eos quibusdam ut perspiciatis vitae eaque dolores sit vitae et rerum velit quaerat qui enim sed iste asperiores quo corporis ullam dolorum commodi molestiae laudantium consequuntur necessitatibus.', 8, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(50, 522, 'Non sunt quasi distinctio officiis.', '2015-12-31', 2, 3358, 'Est unde id odio explicabo sed tenetur hic qui minus delectus aliquid molestiae aut dolorem eum qui deserunt rem laboriosam voluptatem aperiam iure omnis ad dolor dolores iusto earum facere ea sequi necessitatibus eaque est atque iusto aliquid quos laborum in vel consequatur quae maxime alias aut corporis.', 3, 'https://moly.hu/system/covers/big/covers_727156.jpg?1646505059', '2026-03-14 10:16:05', '2026-03-14 10:16:05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `carts`
--

INSERT INTO `carts` (`id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 3),
(2, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 4),
(3, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 5),
(4, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 6),
(5, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 7),
(6, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 8),
(7, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 9),
(8, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 10),
(9, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 11),
(10, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 12),
(11, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 13),
(12, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 14),
(13, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 15),
(14, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 16),
(15, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 17),
(16, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 18),
(17, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 19),
(18, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 20),
(19, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 21),
(20, '2026-03-14 10:16:05', '2026-03-14 10:16:05', 22),
(21, '2026-03-14 10:18:56', '2026-03-14 10:18:56', 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `vat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `price`, `quantity`, `book_id`, `vat_id`, `created_at`, `updated_at`) VALUES
(7, 21, 1249, 1, 2, 1, '2026-03-17 21:39:12', '2026-03-17 21:39:12');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `invoice_number`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 10, 'BB/20260314/238778', 139409, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(2, 17, 'BB/20260314/511576', 9760, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(3, 39, 'BB/20260314/776392', 13746, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(4, 25, 'BB/20260314/548487', 80243, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(5, 27, 'BB/20260314/429561', 101560, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(6, 17, 'BB/20260314/357811', 32960, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(7, 40, 'BB/20260314/770914', 49363, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(8, 18, 'BB/20260314/372361', 89337, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(9, 23, 'BB/20260314/994885', 54840, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(10, 17, 'BB/20260314/240699', 83073, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(11, 1, 'BB/20260314/057908', 105831, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(12, 8, 'BB/20260314/158943', 40095, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(13, 5, 'BB/20260314/932619', 5504, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(14, 30, 'BB/20260314/064605', 36719, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(15, 11, 'BB/20260314/627567', 32317, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(16, 20, 'BB/20260314/344908', 40070, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(17, 26, 'BB/20260314/286768', 128878, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(18, 2, 'BB/20260314/872407', 130841, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(19, 9, 'BB/20260314/936293', 143923, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(20, 2, 'BB/20260314/331141', 46125, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(21, 29, 'BB/20260314/840299', 129800, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(22, 40, 'BB/20260314/921605', 12263, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(23, 13, 'BB/20260314/156266', 98570, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(24, 3, 'BB/20260314/701025', 134251, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(25, 4, 'BB/20260314/557122', 61932, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(26, 1, 'BB/20260314/059153', 65461, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(27, 21, 'BB/20260314/475993', 28850, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(28, 2, 'BB/20260314/539682', 115127, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(29, 19, 'BB/20260314/164194', 118557, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(30, 27, 'BB/20260314/927396', 109393, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(31, 2, 'BB/20260314/118313', 56926, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(32, 36, 'BB/20260314/423273', 69318, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(33, 23, 'BB/20260314/488750', 143534, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(34, 8, 'BB/20260314/202734', 117385, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(35, 1, 'BB/20260314/348044', 9192, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(36, 11, 'BB/20260314/655481', 98125, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(37, 39, 'BB/20260314/237504', 58616, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(38, 1, 'BB/20260314/506960', 38350, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(39, 25, 'BB/20260314/490249', 64908, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(40, 9, 'BB/20260314/393972', 108090, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(41, 41, 'BB/20260314/042698', 6514, '2026-03-14 10:19:23', '2026-03-14 10:19:23'),
(42, 42, 'BB/20260314/028919', 2498, '2026-03-14 10:57:05', '2026-03-14 10:57:05'),
(43, 43, 'BB/20260314/028924', 0, '2026-03-14 10:59:18', '2026-03-14 10:59:18'),
(44, 44, 'BB/20260314/086677', 9436, '2026-03-14 12:07:02', '2026-03-14 12:07:02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jobs`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_08_212926_create_age_groups_table', 1),
(5, '2025_11_09_212810_create_books_table', 1),
(6, '2025_11_10_211000_create_v_a_t_s_table', 1),
(7, '2025_11_10_211759_create_carts_table', 1),
(8, '2025_11_10_211826_create_orders_table', 1),
(9, '2025_11_10_211943_create_cart_items_table', 1),
(10, '2025_11_10_212003_create_order_items_table', 1),
(11, '2025_11_10_212751_create_invoices_table', 1),
(12, '2025_11_10_212844_create_authors_table', 1),
(13, '2026_01_01_210135_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `orders`
--

INSERT INTO `orders` (`id`, `date`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2026-01-10', 'ok', 20, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(2, '2026-01-07', 'ok', 11, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(3, '2026-01-27', 'fa', 19, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(4, '2026-03-12', 'fa', 1, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(5, '2026-02-11', 'lz', 17, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(6, '2026-03-02', 'be', 13, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(7, '2026-03-08', 'be', 4, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(8, '2026-01-14', 'fa', 11, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(9, '2026-01-16', 'lz', 18, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(10, '2026-01-23', 'be', 21, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(11, '2026-02-24', 'lz', 10, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(12, '2026-02-13', 'ok', 20, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(13, '2026-02-19', 'lz', 9, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(14, '2026-03-06', 'be', 9, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(15, '2026-03-13', 'fa', 4, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(16, '2026-02-08', 'ok', 16, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(17, '2026-02-12', 'be', 19, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(18, '2026-01-25', 'ok', 19, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(19, '2026-01-29', 'be', 3, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(20, '2026-02-14', 'ok', 2, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(21, '2026-02-12', 'be', 5, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(22, '2026-01-30', 'lz', 14, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(23, '2026-02-23', 'ok', 2, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(24, '2026-01-17', 'ok', 13, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(25, '2026-01-16', 'lz', 17, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(26, '2026-01-18', 'be', 15, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(27, '2026-03-14', 'lz', 4, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(28, '2026-01-05', 'be', 2, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(29, '2026-01-03', 'ok', 20, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(30, '2026-02-03', 'fa', 15, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(31, '2026-02-21', 'be', 9, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(32, '2026-01-27', 'ok', 9, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(33, '2026-01-23', 'lz', 15, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(34, '2026-01-24', 'ok', 3, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(35, '2026-03-11', 'ok', 18, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(36, '2026-01-29', 'ok', 19, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(37, '2026-02-17', 'ok', 19, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(38, '2026-01-19', 'be', 21, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(39, '2026-01-07', 'lz', 20, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(40, '2026-02-03', 'ok', 16, '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(41, '2026-03-14', 'be', 2, '2026-03-14 10:19:23', '2026-03-14 11:45:46'),
(42, '2026-03-14', 'be', 2, '2026-03-14 10:57:05', '2026-03-14 10:57:05'),
(43, '2026-03-14', 'be', 2, '2026-03-14 10:59:17', '2026-03-14 10:59:17'),
(44, '2026-03-14', 'be', 2, '2026-03-14 12:07:02', '2026-03-14 12:07:02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `vat_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `order_items`
--

INSERT INTO `order_items` (`id`, `price`, `quantity`, `vat_id`, `book_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 2465, 6, 1, 32, 29, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(2, 9130, 7, 2, 16, 16, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(3, 12754, 3, 1, 29, 5, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(4, 2102, 7, 2, 6, 32, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(5, 13656, 5, 2, 39, 5, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(6, 11675, 3, 2, 39, 15, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(7, 12082, 7, 2, 49, 12, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(8, 7517, 5, 2, 19, 18, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(9, 5989, 9, 1, 6, 31, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(10, 14684, 8, 1, 26, 25, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(11, 9529, 7, 1, 36, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(12, 12640, 8, 1, 22, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(13, 4596, 3, 2, 46, 14, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(14, 13291, 2, 2, 17, 23, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(15, 4494, 3, 2, 45, 22, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(16, 5709, 1, 1, 46, 28, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(17, 10537, 2, 2, 35, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(18, 4828, 8, 2, 22, 9, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(19, 11215, 3, 1, 43, 31, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(20, 4260, 10, 2, 41, 14, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(21, 8339, 8, 1, 26, 6, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(22, 12435, 8, 1, 43, 39, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(23, 7575, 2, 1, 18, 33, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(24, 7454, 3, 1, 22, 36, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(25, 9539, 8, 2, 46, 33, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(26, 5709, 7, 2, 47, 12, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(27, 4753, 9, 2, 46, 29, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(28, 3900, 4, 1, 17, 17, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(29, 9807, 3, 2, 3, 27, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(30, 13401, 9, 1, 42, 37, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(31, 13882, 3, 2, 34, 17, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(32, 4136, 4, 1, 4, 18, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(33, 1069, 1, 2, 32, 18, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(34, 2719, 8, 1, 30, 7, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(35, 1285, 10, 1, 45, 23, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(36, 3106, 9, 2, 15, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(37, 3775, 1, 2, 12, 30, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(38, 4095, 9, 2, 32, 5, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(39, 1176, 9, 2, 31, 2, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(40, 4350, 10, 2, 25, 11, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(41, 4046, 6, 1, 20, 22, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(42, 14904, 10, 2, 8, 29, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(43, 4556, 4, 1, 36, 26, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(44, 14639, 5, 1, 45, 39, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(45, 2890, 9, 2, 38, 10, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(46, 5537, 3, 2, 28, 27, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(47, 5167, 5, 1, 36, 2, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(48, 9072, 5, 1, 10, 29, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(49, 9010, 3, 2, 12, 4, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(50, 11214, 8, 2, 13, 20, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(51, 12841, 4, 1, 10, 36, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(52, 6657, 4, 1, 8, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(53, 9248, 1, 2, 47, 30, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(54, 3781, 2, 1, 37, 16, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(55, 11145, 8, 1, 49, 17, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(56, 9927, 7, 2, 43, 22, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(57, 1086, 6, 1, 13, 18, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(58, 4506, 8, 2, 30, 15, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(59, 5244, 1, 1, 13, 31, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(60, 7389, 5, 2, 22, 6, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(61, 14782, 5, 2, 38, 24, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(62, 9131, 1, 2, 1, 4, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(63, 1064, 4, 1, 28, 1, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(64, 11491, 4, 1, 24, 10, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(65, 9661, 8, 1, 47, 5, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(66, 8106, 4, 1, 6, 36, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(67, 5333, 5, 2, 8, 12, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(68, 4659, 5, 2, 38, 6, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(69, 1274, 2, 2, 40, 30, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(70, 14149, 2, 1, 44, 13, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(71, 13858, 4, 2, 30, 1, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(72, 6818, 7, 1, 22, 6, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(73, 12584, 2, 2, 44, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(74, 12187, 2, 2, 25, 25, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(75, 11471, 9, 1, 50, 23, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(76, 2170, 2, 2, 25, 14, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(77, 8987, 4, 2, 40, 22, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(78, 2910, 7, 1, 35, 24, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(79, 1729, 10, 2, 17, 38, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(80, 12945, 10, 2, 34, 3, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(81, 10150, 4, 1, 50, 35, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(82, 1542, 2, 2, 50, 32, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(83, 1293, 2, 2, 19, 40, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(84, 2857, 9, 2, 34, 36, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(85, 14406, 7, 2, 28, 27, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(86, 13576, 4, 1, 46, 11, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(87, 11327, 10, 2, 33, 25, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(88, 7501, 6, 1, 50, 40, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(89, 2386, 5, 2, 29, 20, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(90, 13940, 3, 2, 17, 32, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(91, 9902, 9, 1, 35, 13, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(92, 7255, 9, 1, 13, 13, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(93, 14478, 5, 1, 3, 20, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(94, 3657, 4, 2, 3, 20, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(95, 13985, 5, 2, 9, 23, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(96, 8891, 9, 2, 9, 1, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(97, 9845, 7, 2, 19, 33, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(98, 12605, 3, 2, 32, 31, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(99, 3659, 8, 2, 10, 25, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(100, 8351, 4, 1, 22, 26, '2026-03-14 10:16:06', '2026-03-14 10:16:06'),
(101, 6514, 1, 1, 19, 41, '2026-03-14 10:19:23', '2026-03-14 10:19:23'),
(102, 1249, 2, 1, 2, 42, '2026-03-14 10:57:05', '2026-03-14 10:57:05'),
(103, 4718, 2, 1, 21, 44, '2026-03-14 12:07:02', '2026-03-14 12:07:02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `authorization` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `authorization`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin1', 'admin@teszt.hu', NULL, '$2y$12$DkZS5y.A5DV6nq5MSZ4l3emYxl5v1mNkrbfFSVFrjoZZB5qKGR1ae', 1, NULL, '2026-03-14 10:16:03', '2026-03-14 10:16:03', NULL),
(2, 'TesztUser1', 'ustest@teszt.hu', NULL, '$2y$12$N6Ted7.gLSmXaAYIp03wd.qd1F7WfjhIkqTA/cDDTYoZavGv3eWdu', 0, NULL, '2026-03-14 10:16:03', '2026-03-14 10:16:03', NULL),
(3, 'Prof. Winston McKenzie', 'sroob@example.org', '2026-03-14 10:16:04', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, '3wbkROSAJX', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(4, 'Ms. Kara Ruecker', 'xkling@example.net', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'rVVOdn77D8', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(5, 'Henry Durgan DVM', 'roel.smitham@example.com', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'zQpmsNnTgW', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(6, 'Alessandro Durgan', 'orlo80@example.net', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'xbHJjViJMj', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(7, 'Juliet Hammes', 'vanessa.dare@example.net', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'LhbUPKPSoL', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(8, 'Winifred Dietrich', 'mario96@example.com', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'hTRSigOkd2', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(9, 'Sienna Kozey', 'vstreich@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'Xxc125fRHP', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(10, 'Dr. Aubrey Ullrich', 'thiel.braden@example.net', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'bA8TfPWZPj', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(11, 'Andreanne Dickinson V', 'tlegros@example.net', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'y1sMdgEq8f', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(12, 'Allene Kuphal', 'mercedes82@example.com', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 's7R58IKZV3', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(13, 'Joshua Conroy', 'joyce.will@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'chAzJ8opyd', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(14, 'Ms. Evalyn Volkman V', 'kbergstrom@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'HjA9lU0cC1', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(15, 'Kobe Brekke', 'sonia20@example.com', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, '34nWdv0qeB', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(16, 'Oswaldo Ullrich', 'lenore.gislason@example.net', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'vtRwOZmMnk', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(17, 'Dr. Jules Rosenbaum', 'murl.ward@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'C3Hci9ntuy', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(18, 'Dee Hodkiewicz', 'zreichel@example.com', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'TEUVQtwQYS', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(19, 'Antone Kovacek', 'therese.dubuque@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, '6wCDxoSW0o', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(20, 'Dr. Adaline Goodwin II', 'hackett.zaria@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'uFjbkFUpsP', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(21, 'Bradley Sporer MD', 'gbruen@example.org', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'OH6FyroJ8o', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL),
(22, 'Mr. Theodore Wolf DDS', 'destini.kirlin@example.com', '2026-03-14 10:16:05', '$2y$12$s.O9KcP/SuAFPzmGmVKopute4iWRjbJrDklq5CJQbVYBSTaDVCngi', 0, 'kbs0uOUC9X', '2026-03-14 10:16:05', '2026-03-14 10:16:05', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `v_a_t_s`
--

CREATE TABLE `v_a_t_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat_value` int(11) NOT NULL,
  `starting_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `v_a_t_s`
--

INSERT INTO `v_a_t_s` (`id`, `vat_value`, `starting_date`, `created_at`, `updated_at`) VALUES
(1, 0, '2022-03-16', '2026-03-14 10:16:05', '2026-03-14 10:16:05'),
(2, 27, '2009-11-22', '2026-03-14 10:16:05', '2026-03-14 10:16:05');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authors_book_id_unique` (`book_id`);

--
-- A tábla indexei `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_agegroup_id_foreign` (`agegroup_id`);

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_user_id_unique` (`user_id`);

--
-- A tábla indexei `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_book_id_foreign` (`book_id`),
  ADD KEY `cart_items_vat_id_foreign` (`vat_id`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- A tábla indexei `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- A tábla indexei `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_vat_id_foreign` (`vat_id`),
  ADD KEY `order_items_book_id_foreign` (`book_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A tábla indexei `v_a_t_s`
--
ALTER TABLE `v_a_t_s`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT a táblához `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `v_a_t_s`
--
ALTER TABLE `v_a_t_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_agegroup_id_foreign` FOREIGN KEY (`agegroup_id`) REFERENCES `age_groups` (`id`);

--
-- Megkötések a táblához `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_items_vat_id_foreign` FOREIGN KEY (`vat_id`) REFERENCES `v_a_t_s` (`id`);

--
-- Megkötések a táblához `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_vat_id_foreign` FOREIGN KEY (`vat_id`) REFERENCES `v_a_t_s` (`id`);
--
-- Adatbázis: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
