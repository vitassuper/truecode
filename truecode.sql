-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 16 2019 г., 19:59
-- Версия сервера: 5.6.41
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `truecode`
--

-- --------------------------------------------------------

--
-- Структура таблицы `headers`
--

CREATE TABLE `headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `headers`
--

INSERT INTO `headers` (`id`, `type`, `value`, `url`, `created_at`, `updated_at`) VALUES
(1, 'logo', '/images/code.png', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `url`, `type`, `created_at`, `updated_at`) VALUES
(2, '/storage/uploads/stone_1563281239.png', 'local', '2019-07-16 09:47:19', '2019-07-16 09:47:19'),
(3, '/storage/uploads/stick_1563288662.png', 'local', '2019-07-16 11:51:02', '2019-07-16 11:51:02');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_07_16_115426_create_images_table', 2),
(17, '2019_06_28_174945_create_posts_table', 3),
(18, '2019_07_12_083027_create_headers_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `image_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(2, 'Текст для заголовка номер 3', 3, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(3, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(4, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(5, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(6, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(7, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(8, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(9, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(10, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(11, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(12, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(13, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(14, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(15, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(16, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(17, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(18, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(19, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(20, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(21, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(22, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(23, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(24, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(25, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(26, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(27, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(28, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(29, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(30, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(31, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(32, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(33, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(34, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(35, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(36, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(37, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(38, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(39, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(40, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(41, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(42, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(43, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(44, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(45, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(46, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(47, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(48, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(49, 'Текст для заголовка номер 3', 1, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL),
(50, 'Текст для заголовка номер 3', 2, 'Описание преимущества описание преимущества описание преимущества описание преимущества', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `value`, `public_name`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'guest', NULL, NULL),
(2, 'admin', 'admin', NULL, NULL),
(3, 'moderator', 'moderator', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role_id`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'petya', '$2y$10$z76dbINtu3BbyA.s0TCDgOgii4DxaZ79t9IUZbG9ePoQhufPUoQBe', 2, NULL, '2019-07-12 09:49:19', '2019-07-12 09:49:19'),
(2, 'petya12', '$2y$10$OKemq1LbZ4fyV3I/rJkxs.auqk5q89tXd.cOxK2sTbLvaVJEJMq3W', 1, NULL, '2019-07-12 09:49:39', '2019-07-12 09:49:39');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `headers`
--
ALTER TABLE `headers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `headers_type_unique` (`type`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_image_id_index` (`image_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_value_unique` (`value`),
  ADD UNIQUE KEY `roles_public_name_unique` (`public_name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `headers`
--
ALTER TABLE `headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
