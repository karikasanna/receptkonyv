-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Már 21. 13:42
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
-- Adatbázis: `receptkonyv`
--

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
(1, 'main', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(2, 'soup', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(3, 'dessert', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(4, 'salad', '2026-03-21 11:04:34', '2026-03-21 11:04:34');

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
(5, '2026_03_21_111259_create_recipes_table', 1);

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
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `img_source` varchar(255) NOT NULL DEFAULT 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ',
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `cat_id`, `img_source`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Non exercitationem harum.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Sint at vitae rerum dicta eaque sit cupiditate officia.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(2, 'Harum quia qui.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Fugit aut officiis unde quia molestiae omnis quia at nisi voluptates enim consequatur nesciunt.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(3, 'Omnis minima molestiae.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Perferendis dolore sapiente illo eum alias illum accusantium nulla alias voluptatem.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(4, 'Quas voluptates magnam.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Voluptatum sint voluptatum et ducimus consectetur veniam eius amet quasi iste.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(5, 'Soluta provident.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Repellat nobis voluptatem ut quasi fugit amet ipsam et veniam porro blanditiis.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(6, 'Culpa id quo.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Sed corrupti inventore eius repudiandae itaque esse ut provident ex at qui voluptas.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(7, 'Corporis voluptas et.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Et occaecati reprehenderit cumque sed et ut quidem vitae quae.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(8, 'Molestias et.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Placeat eaque quis quibusdam eum reiciendis enim.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(9, 'Adipisci voluptatem veniam.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Est neque ea et harum rerum est et minima in vel.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(10, 'Ipsum molestiae perspiciatis.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Alias iste hic distinctio velit doloremque tempore dolorem iure ex est aperiam laudantium.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(11, 'Veritatis est.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Explicabo perspiciatis dolores debitis atque et et dolore ad.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(12, 'Non modi.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Laborum beatae velit rerum et fugit alias et sint rerum velit dolor molestiae.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(13, 'Harum dolorem ratione.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Illum similique consequatur reiciendis exercitationem praesentium laudantium quod et illum.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(14, 'Voluptatem velit dolor.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Ducimus inventore error earum consequatur ea labore deleniti consequuntur molestiae excepturi placeat.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(15, 'Consequatur fuga necessitatibus.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Alias possimus voluptatem perspiciatis laudantium ut qui ut quia veniam et aperiam quis eos dolor.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(16, 'Totam sequi.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Omnis accusantium sit modi sunt ullam eos repudiandae.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(17, 'Nihil est.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Exercitationem eaque aut earum voluptate corporis provident omnis assumenda.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(18, 'Eligendi ut.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Unde rem ea ut optio ut suscipit sint.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(19, 'Voluptatem error cum.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Unde earum non vitae non nulla doloribus harum quis aut ut necessitatibus voluptatibus.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(20, 'Natus corporis.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Nulla quia occaecati consequatur sit distinctio repudiandae.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(21, 'Consequatur est.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Optio amet velit velit minima ducimus at sed eius quod qui.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(22, 'Quia perferendis.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Magni quae qui amet sunt non qui.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(23, 'Quod quia aut.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Minus et est enim commodi iure quo nam hic omnis excepturi odit.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(24, 'Dolores numquam dignissimos.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Nisi sed molestias tenetur similique quam quis rem ratione nesciunt rerum enim.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(25, 'Quo nobis.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Qui et aliquam optio culpa eos atque quis ipsa velit fugiat atque magni.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(26, 'Dignissimos doloremque.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Omnis quia magni reprehenderit architecto architecto non ducimus laudantium dolor.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(27, 'Suscipit magnam.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Voluptatem minus hic officia corrupti recusandae illum ab similique quaerat ut.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(28, 'Porro placeat.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Aut dolores accusantium quam itaque delectus qui maxime voluptatem enim ut.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(29, 'Vel sit.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Iste sunt consequatur nemo reprehenderit et unde ipsum optio voluptatem nulla atque.', '2026-03-21 11:04:34', '2026-03-21 11:04:34'),
(30, 'Recusandae ipsum.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Nihil eligendi est ex quia tempora natus nemo eum.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(31, 'Fugit optio.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Reprehenderit incidunt ea dolore soluta rerum repudiandae optio qui aperiam autem eius.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(32, 'Voluptatem deserunt ad.', 3, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Id et eveniet quaerat eos provident natus aut molestias.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(33, 'Quam sed alias.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Dicta quia praesentium ducimus consequatur nisi qui.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(34, 'Rerum vel.', 1, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Enim nobis nobis quasi tempora dolorem perferendis inventore harum enim ea quis non voluptas.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(35, 'Labore modi.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Culpa commodi ut aut molestiae beatae ut in quam repellat est ut.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(36, 'Repellat quidem et.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Saepe aut laboriosam eligendi atque magni odit accusantium laudantium.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(37, 'Dolore et.', 4, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Corrupti modi facere officia et culpa aspernatur possimus facere.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(38, 'Rerum rerum.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Ut quo rerum et incidunt ipsam repellat dolorem.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(39, 'Et sunt.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Non qui non voluptatem autem ut dolorem libero vel quo sunt ullam laborum corrupti.', '2026-03-21 11:04:35', '2026-03-21 11:04:35'),
(40, 'Ipsum repellat neque.', 2, 'https://unsplash.com/photos/avocado-tomatoes-eggs-mushrooms-spring-onions-and-leaves-uQs1802D0CQ', 'Accusamus et aliquam deleniti occaecati corrupti quam odio laborum commodi eligendi et aut dolores.', '2026-03-21 11:04:35', '2026-03-21 11:04:35');

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2026-03-21 11:04:34', '$2y$12$gOnc/dgqvHy5mVuifW/7t.QtdwIb.EjZzFEsYBCtQrksK/zyop/SC', '6ABy9z8QZm', '2026-03-21 11:04:34', '2026-03-21 11:04:34');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
