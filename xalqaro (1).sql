-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 20 2021 г., 10:32
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `xalqaro`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `role`) VALUES
(1, 'Admin', '3BTLqlAnEEYER2XSkPm7NSK7L8M_pte9', '$2y$13$l2iylhkt1TE/QYnVjYkkxOu6kzZdlgu6mdDlFjjMl5Fk5a5GzgX3S', NULL, 'admin@urdu.uz', 10, 1631036288, 1631036288, 'm-ZTm14_HD4Utw3GyZFc85b8M0OOPuC4_1631036288', 'admin'),
(3, 'Elyor', 'njxDZbHNBjYVO8uX9skhfiNAkueaEqXx', '$2y$13$JgXT1WwdXBoLgo90fW8Eju63zMBIcbggAEqFhfOl0M9RXULbDvu9S', NULL, 'xalqaro@urdu.uz.', 10, 1632485727, 1632485727, 'AQB-WOvB0xuWpG1JHrdzIiTgh8QD_OzD_1632485726', 'xalqaro'),
(4, 'Muxxtor', 'CvD1ug0jOBC03voihTpmHB7JcOw9geWV', '$2y$13$e2P4BN7mTnXYBL8cnX9oQuDp4H/tO9uA.Qyt8FpcJtfRWwDCv1E/2', NULL, 'mux@urdu.uz', 10, 1632487080, 1632487080, '4x5tcY9TV2OPWwVchgHVHbDpb9HckEec_1632487079', 'xalqaro');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `structure_type` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'erkak', 10, '2021-09-07 16:00:34', '2021-09-07 16:00:34'),
(2, 'ayol', 10, '2021-09-07 16:00:40', '2021-09-07 16:00:40');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1631036275),
('m130524_201442_init', 1631036277),
('m190124_110200_add_verification_token_column_to_user_table', 1631036277),
('m210714_110338_create_state_table', 1631036277),
('m210714_110741_create_province_table', 1631036277),
('m210714_110809_create_regions_table', 1631036277),
('m210714_170728_create_gender_table', 1631036277),
('m210714_170900_create_profile_table', 1631036278),
('m210715_050505_create_relation_table', 1631036281),
('m210723_061504_create_admin_table', 1631036281),
('m210723_071346_create_verification_token_column_to_admin_table', 1631036281),
('m210824_082907_create_departments_table', 1631036283),
('m210906_103839_create_section_table', 1631036283);

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patronymic` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender_id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `diplom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transkriptlar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_of_graduation` int(11) NOT NULL,
  `sertifikat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass_seria` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass_num` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass_file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `patronymic`, `state_id`, `province_id`, `region_id`, `address`, `phone_1`, `phone_2`, `date_birth`, `email`, `gender_id`, `image`, `status`, `created_at`, `updated_at`, `diplom`, `transkriptlar`, `year_of_graduation`, `sertifikat`, `pass_seria`, `pass_num`, `pass_file`, `section_id`) VALUES
(4, 'Husan', 'Urunov', 'Umar O\'g\'li', 1, 28, 395, 'Vatanparvar 117-uy', '+99899-357-64-42', '+99899-317-40-37', '1996-04-28', 'urunov.husan.506@mail.ru', 1, 'uploads/2021-09/613b3921564b0.jpg', 1, '2021-09-10 10:53:21', '2021-09-10 10:53:21', 'diplom/2021-09/613b392156b74.docx', 'transript/2021-09/613b392156e50.docx', 2021, '', 'KA', '0401109', 'password/2021-09/613b392156cf4.docx', 4),
(5, 'Shahriza', 'Sobirova', 'Toxir qizi', 1, 13, 178, 'Sovot ko\'chasi 13-uy', '+99894-230-02-94', '+99894-233-02-94', '1994-02-11', 'sobirovashahriza@mail.ru', 2, 'uploads/2021-09/613b3f2d3ed9a.jpg', 1, '2021-09-10 11:19:09', '2021-09-10 11:19:09', 'diplom/2021-09/613b3f2d3f3bc.docx', 'transript/2021-09/613b3f2d3f5de.docx', 2018, '', 'AB', '0365914', 'password/2021-09/613b3f2d3f4e7.docx', 4),
(6, 'Azamat', 'Yaqubov', 'Ro\'zibayevich', 1, 27, 376, 'Ne\'mat ko\'chasi 46-uy', '+99894-237-40-43', '+99897-428-11-86', '1990-05-07', 'azanatyaqubov_1990@mail.ru', 1, 'uploads/2021-09/613b40a5f11da.jpg', 1, '2021-09-10 11:25:25', '2021-09-10 11:25:25', 'diplom/2021-09/613b40a5f1807.pdf', 'transript/2021-09/613b40a5f19ee.pdf', 2013, '', 'AA', '9740254', 'password/2021-09/613b40a5f1914.pdf', 4),
(7, 'Jaloladdin', 'Yusupov', 'Jamoladdin o\'g\'li', 1, 27, 375, 'Gulchechak ko\'chasi 79-uy', '+99899-021-98-97', '+99897-362-21-73', '1997-08-28', 'yusupovjalol28@gmail.com', 1, 'uploads/2021-09/613b41c4261e2.jpg', 1, '2021-09-10 11:30:12', '2021-09-10 11:30:12', 'diplom/2021-09/613b41c426843.pdf', 'transript/2021-09/613b41c426a97.pdf', 2021, '', 'AA', '4079498', 'password/2021-09/613b41c426987.pdf', 4),
(8, 'Azizbek', 'Matyaqubov', 'Bahodir o\'g\'li', 1, 27, 378, 'Ma\'naviyat ko\'chasi 60-uy', '+99833-177-57-66', '+99894-218-18-17', '1995-04-15', 'azizbekmyu@gmailcom._', 1, 'uploads/2021-09/613b4413c3508.jpg', 1, '2021-09-10 11:40:03', '2021-09-10 11:40:03', 'diplom/2021-09/613b4413c3b44.docx', 'transript/2021-09/613b4413c3d14.docx', 2021, '', 'AC', '0726329', 'password/2021-09/613b4413c3c3b.docx', 4),
(9, 'Ro\'zmetov', 'Ibrat', 'Erkinbayevich', 1, 27, 381, 'Shirsholi maxallasi Ulug\'vor ko\'cha 3-uy', '+99888-858-81-85', '+99894-235-96-69', '1990-09-09', 'rozmetov.ibrat@bk.ru', 1, 'uploads/2021-09/613f5d12e6a3f.jpg', 1, '2021-09-13 14:15:46', '2021-09-13 14:15:46', 'diplom/2021-09/613f5d12e7091.pdf', 'transript/2021-09/613f5d12e7259.pdf', 2021, '', 'AA', '2128899', 'password/2021-09/613f5d12e717b.pdf', 7),
(10, 'Dilshod', 'Umarov', 'Mahsudbek', 1, 27, 383, 'Urganch shahar Navröz shaharchasi Quruvchilar köchasi 56-uy 4 -yölak', '+99897-457-75-76', '', '1996-07-21', 'ddilshod919@gmail.com', 1, 'uploads/2021-09/613f845cc9f43.jpg', 1, '2021-09-13 17:03:24', '2021-09-13 17:03:24', 'diplom/2021-09/613f845cca598.pdf', 'transript/2021-09/613f845cca77c.pdf', 2020, '', 'AB', '3443091', 'password/2021-09/613f845cca6a2.pdf', 7),
(11, 'Hikmatbek', 'Qadamboyev', 'Qudratbek O\'g\'li', 1, 27, 383, 'Alpomish 3uy', '+99899-106-03-19', '+99894-230-01-01', '2004-12-03', 'tillobek544@gmail.com', 1, 'uploads/2021-09/6140357ea30e0.jpg', 1, '2021-09-14 05:39:10', '2021-09-14 05:39:10', 'diplom/2021-09/6140357ea36aa.pdf', 'transript/2021-09/6140357ea38a4.pdf', 2021, '', 'AD', '0022292', 'password/2021-09/6140357ea37bb.pdf', 2),
(12, 'Olloshukur', 'Abdullaev', 'Ataboy o\'g\'li', 1, 27, 377, 'Muhomon qishlog\'i', '+99899-501-50-76', '', '2002-01-15', 'mustafoa45@gmail.com', 1, 'uploads/2021-09/61417c15003b5.png', 1, '2021-09-15 04:52:36', '2021-09-15 04:52:36', 'diplom/2021-09/61417c15009d7.pdf', 'transript/2021-09/61417c1500b9c.pdf', 2020, '', 'AC', '0315169', 'password/2021-09/61417c1500ac5.pdf', 1),
(13, 'Надирбек', 'Илхамбаев', 'Бахтияр', 1, 13, 177, 'Туркистан махалласи', '+99890-432-81-16', '', '2003-10-02', 'nodirbekilhomboev@gmail.com', 1, 'uploads/2021-09/6141f03fb54f6.pdf', 1, '2021-09-15 13:08:15', '2021-09-15 13:08:15', 'diplom/2021-09/6141f03fb5b7c.pdf', 'transript/2021-09/6141f03fb5d60.jpg', 2021, '', 'AC', '2717989', 'password/2021-09/6141f03fb5c7a.pdf', 2),
(14, 'Dilshod', 'Umarov', 'Mahsudbek', 1, 27, 383, 'Urganch shahar Navröz shaharchasi Quruvchilar köchasi 56-uy 4 -yölak', '+99897-457-75-76', '', '1996-07-21', 'ddilshod919@gmail.com', 1, 'uploads/2021-09/6141f3fdc7977.pdf', 1, '2021-09-15 13:24:13', '2021-09-15 13:24:13', 'diplom/2021-09/6141f3fdc7f65.pdf', 'transript/2021-09/6141f3fdc8134.pdf', 2020, '', 'AB', '3443091', 'password/2021-09/6141f3fdc8059.pdf', 7),
(15, 'Dilshod', 'Umarov', 'Mahsudbek', 1, 27, 383, 'Urganch shahar Navröz shaharchasi Quruvchilar köchasi 56-uy 4 -yölak', '+99897-457-75-76', '', '1996-07-21', 'ddilshod919@gmail.com', 1, 'uploads/2021-09/6141f40ae5ab4.pdf', 1, '2021-09-15 13:24:26', '2021-09-15 13:24:26', 'diplom/2021-09/6141f40ae6009.pdf', 'transript/2021-09/6141f40ae6167.pdf', 2020, '', 'AB', '3443091', 'password/2021-09/6141f40ae60c1.pdf', 7),
(16, 'Iqboloy', 'Baxtiyorova', 'Baxtiyor qizi', 1, 13, 173, 'Yangi boģ kòchasi 10-uy', '+99899-947-52-67', '+99899-451-52-67', '1999-08-24', '', 2, 'uploads/2021-09/6141fba482155.jpg', 1, '2021-09-15 13:56:52', '2021-09-15 13:56:52', 'diplom/2021-09/6141fba482775.jpg', 'transript/2021-09/6141fba48295d.jpg', 2018, '', 'AB', '4268029', 'password/2021-09/6141fba482867.jpg', 1),
(17, 'Saida', 'Raximbaeva', 'Yarashbek Qizi', 1, 27, 381, 'Urganch kocha 10 uy', '+99899-559-91-65', '+99899-387-61-61', '2002-09-28', 'abdullaevyarashbek@gmail.com', 2, 'uploads/2021-09/6141fc3f99cbc.jpg', 1, '2021-09-15 13:59:27', '2021-09-15 13:59:27', 'diplom/2021-09/6141fc3f9a2c2.jpg', 'transript/2021-09/6141fc3f9a482.jpg', 2020, '', 'AC', '1608376', 'password/2021-09/6141fc3f9a3ac.jpg', 1),
(18, 'Ixtiyor', 'Abduraxmonov', 'Baxtiyor ogli', 1, 13, 179, 'Navo kocha 2 uy', '+99891-428-12-13', '+99891-275-39-57', '1998-03-16', 'ixtiyoreshmat98@gmail.com', 1, 'uploads/2021-09/6141fef3398c1.jpg', 1, '2021-09-15 14:10:59', '2021-09-15 14:10:59', 'diplom/2021-09/6141fef339e6b.pdf', 'transript/2021-09/6141fef33a02b.pdf', 2017, '', 'AA', '9959047', 'password/2021-09/6141fef339f50.pdf', 2),
(19, 'Davronbek', 'Tangriyev', 'Baxramovich', 1, 13, 178, 'Gandimyon mahallasi Tinchlik ko\'chasi 1-uy', '+99891-431-47-04', '+99891-437-96-33', '1995-09-22', 'davrontangriyev@gmail.com', 1, 'uploads/2021-09/614226313f92b.pdf', 1, '2021-09-15 16:58:25', '2021-09-15 16:58:25', 'diplom/2021-09/614226313ffe0.pdf', 'transript/2021-09/61422631402b6.pdf', 2020, '', 'AA', '8060706', 'password/2021-09/6142263140160.pdf', 5),
(20, 'Sadoqat', 'Vohidova', 'Barot qizi', 1, 9, 121, 'Obod-yurt maxallasi Gulshan ko\'chasi 3 uy 7 xonadon', '+99893-815-87-97', '+99894-161-51-01', '2001-08-06', 'sadoqat.vahidova.612@gmail.com', 2, 'uploads/2021-09/6142ebe8ac6f0.jpg', 1, '2021-09-16 07:02:00', '2021-09-16 07:02:00', 'diplom/2021-09/6142ebe8acda3.pdf', 'transript/2021-09/6142ebe8acf78.jpg', 2021, 'sertifikat/2021-09/6142ebe8ad098.jpg', 'AB', '7791574', 'password/2021-09/6142ebe8ace96.pdf', 1),
(21, 'Kutliyeva ', 'Feruzaxon', 'Yusupovna', 1, 27, 384, 'G\'azchi mahallasi 13/7', '+98891-275-53-07', '+99891-997-57-17', '1991-04-13', 'kutlievaferuzahon@gmail.com', 2, 'uploads/2021-09/6142ee92628fc.jpg', 1, '2021-09-16 07:13:22', '2021-09-16 07:13:22', 'diplom/2021-09/6142ee9262f09.pdf', 'transript/2021-09/6142ee92c29bd.pdf', 2021, 'sertifikat/2021-09/6142ee92c2b5e.pdf', 'AA', '2127328', 'password/2021-09/6142ee9262ff6.pdf', 6),
(22, 'Azizbek ', 'Atabaev ', 'Adilbek o\'g\'li ', 1, 27, 376, 'Bo\'ston mahallasi Al-Beruniy Al-Beruniy ko\'chasi 4-yo\'lak 12-uy ', '+99891-435-55-57', '+99891-277-23-98', '1995-04-13', 'aatabaev.121@gmail.com', 1, 'uploads/2021-09/6142f2b1ce664.jpg', 1, '2021-09-16 07:30:57', '2021-09-16 07:30:57', 'diplom/2021-09/6142f2b1cecf1.jpg', 'transript/2021-09/6142f2b1ceebc.jpg', 2015, '', 'AC', '0303509', 'password/2021-09/6142f2b1ceddf.jpg', 2),
(23, 'Gulhayo', 'Malikova', 'Abdusalom qizi', 1, 9, 118, 'Chamanzor mahalla Nihol 12 uy', '+99899-100-37-10', '+99899-100-38-10', '1999-02-01', 'mansurovamahliyo54@gmail.com', 2, 'uploads/2021-09/6142f52d4f12f.jpg', 1, '2021-09-16 07:41:33', '2021-09-16 07:41:33', 'diplom/2021-09/6142f52d4f78b.pdf', 'transript/2021-09/6142f52d4f977.pdf', 2018, '', 'AA', '9128248', 'password/2021-09/6142f52d4f88d.pdf', 1),
(24, 'Xurshid', 'Usmonqulov', 'Rustam', 1, 3, 36, 'Oybek MFY Usmon nosir k\'chasi 3-uy', '+99628-291-4_-__', '', '2005-03-11', 'xusmonqulov6@gmail.com', 1, 'uploads/2021-09/6142f5cf25f8a.jpg', 1, '2021-09-16 07:44:15', '2021-09-16 07:44:15', 'diplom/2021-09/6142f5cf265e6.jpg', 'transript/2021-09/6142f5cf267e4.jpg', 2021, '', 'AC', '2848957', 'password/2021-09/6142f5cf266f9.jpg', 1),
(25, 'Севинч', 'Мавланова', 'Алишер ', 1, 3, 32, 'Dostlik MFY', '+99894-191-62-63', '+99893-296-90-69', '2002-08-03', 'sevinchmavlanova0@gmail.com', 2, 'uploads/2021-09/6142fbcde5de1.jpg', 1, '2021-09-16 08:09:49', '2021-09-16 08:09:49', 'diplom/2021-09/6142fbcde6406.jpg', 'transript/2021-09/6142fbcde65d3.jpg', 2021, '', 'AC', '1586002', 'password/2021-09/6142fbcde64f6.jpg', 1),
(26, 'Zafar', 'Boliyev', 'Nemat o\'g\'li', 1, 7, 88, 'Shombuloq mfy ', '+99897-288-67-62', '+99893-996-53-92', '1992-07-29', 'xayetivtemur@gmail.com', 1, 'uploads/2021-09/614303489e2c7.jpg', 1, '2021-09-16 08:41:44', '2021-09-16 08:41:44', 'diplom/2021-09/614303489ea36.zip', 'transript/2021-09/614303489ec9b.zip', 2011, '', 'AA', '3780788', 'password/2021-09/614303489eb51.jpg', 1),
(27, 'Suxrob', 'Almardanov', 'Abduxoliqovich', 1, 8, 100, 'Chuqurqishloq mahallasi', '+99890-994-98-79', '+99890-994-98-79', '1993-08-20', 'azizakhmadjanooff@gmail.com', 1, 'uploads/2021-09/614304df83b01.jpg', 1, '2021-09-16 08:48:31', '2021-09-16 08:48:31', 'diplom/2021-09/614304df84216.pdf', 'transript/2021-09/614304df8459c.pdf', 2018, '', 'AA', '1897576', 'password/2021-09/614304df84400.pdf', 6),
(28, 'Oxunjon ', 'Yangiboyev ', 'Pahlovonovich', 1, 13, 175, 'Bekabod', '+99888-459-12-00', '+99897-451-51-05', '1998-04-12', '', 1, 'uploads/2021-09/614307579d292.jpg', 1, '2021-09-16 08:59:03', '2021-09-16 08:59:03', 'diplom/2021-09/614307579d8e8.pdf', 'transript/2021-09/614307579db04.pdf', 2017, '', 'AA', '7914215', 'password/2021-09/614307579d9f8.jpg', 2),
(29, 'Saida', 'Raximbaeva', 'Yarashbek Qizi', 1, 13, 180, 'Urganch kocha 10-uy', '+99899-559-91-65', '+99897-513-65-43', '2002-09-28', 'abdullaevyarashbek@gmail.com', 2, 'uploads/2021-09/61432a9a83878.jpg', 1, '2021-09-16 11:29:30', '2021-09-16 11:29:30', 'diplom/2021-09/61432a9a83f9a.jpg', 'transript/2021-09/61432a9a84192.jpg', 2020, '', 'AC', '1608376', 'password/2021-09/61432a9a840a7.jpg', 1),
(30, 'Saida', 'Raximbaeva', 'Yarashbek Qizi', 1, 13, 180, 'Urganch kocha 10 uy', '+99899-559-91-65', '+99899-387-61-61', '2002-09-28', 'abdullaevyarashbek@gmail.com', 2, 'uploads/2021-09/61432bbea1224.jpg', 1, '2021-09-16 11:34:22', '2021-09-16 11:34:22', 'diplom/2021-09/61432bbea1986.jpg', 'transript/2021-09/61432bbea1b78.jpg', 2020, '', 'AC', '1608376', 'password/2021-09/61432bbea1a91.jpg', 1),
(31, 'Shixnazar', 'Rustamov', 'Alisher', 1, 13, 178, 'A yusupov33', '+99890-077-49-97', '+99899-962-33-76', '2003-12-07', 'rustamovsihnazar2@gmail.com', 1, 'uploads/2021-09/61432f1a04fa3.jpg', 1, '2021-09-16 11:48:42', '2021-09-16 11:48:42', 'diplom/2021-09/61432f1a055ca.jpg', 'transript/2021-09/61432f1a0579c.jpg', 2021, '', 'AD', '0104528', 'password/2021-09/61432f1a056c2.jpg', 2),
(32, 'Sarvinoz', 'Rustamova', 'Alisher qizi', 1, 13, 172, 'Beshariq qishlog\'i Nurli maskan mahalla Oltin ko\'l ko\'cha 11-uy', '+99893-868-16-11', '+99890-078-78-75', '1998-11-16', 'srustamova664@gmail.com', 2, 'uploads/2021-09/61433c50726f9.pdf', 1, '2021-09-16 12:45:04', '2021-09-16 12:45:04', 'diplom/2021-09/61433c5072f73.pdf', 'transript/2021-09/61433c507325b.pdf', 2021, '', 'AA', '8505375', 'password/2021-09/61433c50730fb.pdf', 6),
(33, 'Arslon', 'Xudayberganov', 'Olimboy og\'li', 1, 27, 383, 'Урганч шахар Аэропорт 1уй. Кв 41', '+99891-999-67-22', '+99999-733-49-26', '1993-11-24', 'aslankhudajberganov@gmail.com', 1, 'uploads/2021-09/6143401d8f705.jpg', 1, '2021-09-16 13:01:17', '2021-09-16 13:01:17', 'diplom/2021-09/6143401d8fda3.pdf', 'transript/2021-09/6143401d8ff77.pdf', 2013, '', 'AB', '4233911', 'password/2021-09/6143401d8fe9a.pdf', 4),
(34, 'Shaxnozabonu', 'Qodirova', 'Omonboyqizi', 1, 13, 174, 'Xosiyon qishloği', '+99899-507-93-18', '+99899-268-09-16', '2002-09-16', 'qodirovashahnozabonu39@gmail.com', 2, 'uploads/2021-09/614356f85e49b.jpg', 1, '2021-09-16 14:38:48', '2021-09-16 14:38:48', 'diplom/2021-09/614356f85ea94.jpg', 'transript/2021-09/614356f85ec75.jpg', 2020, '', 'AC', '2878670', 'password/2021-09/614356f85eb83.jpg', 1),
(35, 'Nozima', 'Xolmatova', 'Nozima', 1, 11, 135, 'Qora qoʻyli MFY Oltin kuz koʻchasi 32-uy', '+99894-941-27-03', '+99894-350-55-29', '2003-03-27', 'xolmatovanozima@gmailcom._', 2, 'uploads/2021-09/61435fcca9d43.pdf', 1, '2021-09-16 15:16:28', '2021-09-16 15:16:28', 'diplom/2021-09/61435fccaa329.pdf', 'transript/2021-09/61435fccaa4ed.pdf', 2020, '', 'AC', '2110454', 'password/2021-09/61435fccaa410.pdf', 1),
(36, 'Shaxnozabonu', 'Qodirova', 'Omonboyqizi', 1, 13, 174, 'Xosiyon qishloģi', '+99899-507-93-18', '+99899-268-09-16', '2002-09-16', 'qodirovashahnozabonu39@gmail.com', 2, 'uploads/2021-09/61436082ec4b5.jpg', 1, '2021-09-16 15:19:30', '2021-09-16 15:19:30', 'diplom/2021-09/61436082ecaa1.jpg', 'transript/2021-09/61436082ecd99.jpg', 2020, '', 'AC', '2878670', 'password/2021-09/61436082ecc51.jpg', 1),
(37, 'Temur', 'Yaqubov', 'Umid o\'g\'li', 1, 13, 177, 'Qoraqosh qishlog\'i', '+99893-469-43-14', '+79964-712-99-4_', '2001-04-12', 'yaqubovtemur@mail.ru', 1, 'uploads/2021-09/614378a8b2c7c.jpg', 1, '2021-09-16 17:02:32', '2021-09-16 17:02:32', 'diplom/2021-09/614378a8b3458.pdf', 'transript/2021-09/614378a8b3731.pdf', 2020, '', 'AB', '7154084', 'password/2021-09/614378a8b35e0.pdf', 2),
(38, 'Bexzod', 'Qo‘chqarov', 'Davronbek o‘g‘li', 1, 13, 173, 'Birlashgan qishlog‘i', '+99899-743-26-66', '+99899-094-09-76', '1999-12-11', '', 1, 'uploads/2021-09/61437cec89416.jpg', 1, '2021-09-16 17:20:44', '2021-09-16 17:20:44', 'diplom/2021-09/61437cec89af2.jpg', 'transript/2021-09/61437cec89cef.jpg', 2019, '', 'AB', '3311585', 'password/2021-09/61437cec89c09.jpg', 2),
(39, 'Shixnazar', 'Rustamov', 'Alisher', 1, 13, 183, 'A.yusupov33', '+99890-077-49-97', '+99899-962-33-76', '2003-12-07', 'rustamovsihnazar2@gmail.com', 1, 'uploads/2021-09/614399aa565d3.jpg', 1, '2021-09-16 19:23:22', '2021-09-16 19:23:22', 'diplom/2021-09/614399aa56c03.pdf', 'transript/2021-09/614399aa56de9.pdf', 2021, '', 'AD', '0104528', 'password/2021-09/614399aa56cfc.pdf', 2),
(40, 'Abdurahmon', 'Mirzayev', 'Rashid O\'g\'li', 1, 1, 15, '3-kichik daxa 9uy 18honadon', '+99899-720-77-25', '+99893-781-77-25', '2002-12-26', 'rayyonam15@gmail.com', 1, 'uploads/2021-09/61439e459f9ee.jpg', 1, '2021-09-16 19:43:01', '2021-09-16 19:43:01', 'diplom/2021-09/61439e459ffee.pdf', 'transript/2021-09/61439e45a01be.pdf', 2019, '', 'AC', '1573899', 'password/2021-09/61439e45a00e5.pdf', 3),
(41, 'Otabek', 'Kurbanbayev', 'Xakimbek o\'g\'li', 1, 13, 174, 'Gozovot', '+99888-517-21-29', '+99888-856-07-03', '1996-09-24', 'qurbonboyevotabek2@gmail.com', 1, 'uploads/2021-09/6143acaf86094.jpg', 1, '2021-09-16 20:44:31', '2021-09-16 20:44:31', 'diplom/2021-09/6143acaf866a7.pdf', 'transript/2021-09/6143acaf86867.pdf', 2021, '', 'AB', '8632168', 'password/2021-09/6143acaf86790.pdf', 6),
(42, 'Zafar', 'Boliyev', 'Nemat o\'g\'li ', 1, 7, 88, 'Shombuloq mfy ', '+99897-288-67-62', '+99893-996-53-92', '1992-07-29', 'xayetivtemur@gmail.com', 1, 'uploads/2021-09/6144294cdb6d6.jpg', 1, '2021-09-17 05:36:12', '2021-09-17 05:36:12', 'diplom/2021-09/6144294cdbdcd.pdf', 'transript/2021-09/6144294cdbfcd.zip', 2011, '', 'AA', '3780788', 'password/2021-09/6144294cdbeea.pdf', 1),
(43, 'Abdulla', 'Urinboyev', 'Zivaddin', 1, 13, 173, 'Dosinbiy', '+99894-143-33-35', '', '1998-04-15', 'abdullaurinboyev@mail.ru', 1, 'uploads/2021-09/614439ce096c2.jpg', 1, '2021-09-17 06:46:38', '2021-09-17 06:46:38', 'diplom/2021-09/614439ce09ce7.jpg', 'transript/2021-09/614439ce09ee5.jpg', 2021, '', 'AA', '7188138', 'password/2021-09/614439ce09df8.jpg', 5),
(44, 'Dilfuza', 'Nurmetova', 'Po\'lat qizi', 1, 13, 173, 'Olg\'a qishlog\'i', '+99894-312-37-04', '+99894-524-37-73', '2002-05-30', 'dilfuzanurmetova28@gmail.com', 2, 'uploads/2021-09/61443ee22223d.jpg', 1, '2021-09-17 07:08:18', '2021-09-17 07:08:18', 'diplom/2021-09/61443ee2228cb.pdf', 'transript/2021-09/61443ee222b13.pdf', 2020, '', 'AC', '1951171', 'password/2021-09/61443ee222a0c.jpg', 1),
(45, 'Dilfuza', 'Nurmetova', 'Po\'lat qizi', 1, 13, 173, 'Olg\'a qishlog\'i', '+99894-312-37-04', '+99894-524-37-73', '2002-05-30', 'dilfuzanurmetova28@gmail.com', 2, 'uploads/2021-09/6144416c04d26.jpg', 1, '2021-09-17 07:19:08', '2021-09-17 07:19:08', 'diplom/2021-09/6144416c053ba.pdf', 'transript/2021-09/6144416c057db.pdf', 2020, '', 'AC', '1951171', 'password/2021-09/6144416c055f5.jpg', 1),
(46, 'Dilfuza', 'Nurmetova', 'Po\'lat qizi', 1, 13, 173, 'Olg\'a qishlog\'i', '+99894-312-37-04', '+99894-524-37-73', '2002-05-30', 'dilfuzanurmetova28@gmail.com', 2, 'uploads/2021-09/614442b2d6297.jpg', 1, '2021-09-17 07:24:34', '2021-09-17 07:24:34', 'diplom/2021-09/614442b2d691c.pdf', 'transript/2021-09/614442b2d6b2c.pdf', 2020, '', 'AC', '1951171', 'password/2021-09/614442b2d6a2d.jpg', 1),
(47, 'Muazzam', 'Tursunaliyeva', 'Karimjon qizi', 1, 26, 359, 'Begat qishlog\'i', '+99888-815-05-02', '+99891-326-32-36', '2002-02-05', 'tursunaliyevamuazzam4@gmail.com', 2, 'uploads/2021-09/614445f21be20.jpg', 1, '2021-09-17 07:38:26', '2021-09-17 07:38:26', 'diplom/2021-09/614445f21c5ce.pdf', 'transript/2021-09/614445f21c7de.pdf', 2020, '', 'AB', '9542127', 'password/2021-09/614445f21c6ea.pdf', 1),
(48, 'Azizbek ', 'Atabaev ', 'Adilbek o\'g\'li ', 1, 27, 376, 'Bo\'ston mahallasi Al-Beruniy Al-Beruniy ko\'chasi 4-yo\'lak 12-uy ', '+99891-435-55-57', '+99891-277-23-98', '1995-04-13', 'aatabaev.121@gmail.com', 1, 'uploads/2021-09/61444ba06bec9.jpg', 1, '2021-09-17 08:02:40', '2021-09-17 08:02:40', 'diplom/2021-09/61444ba06c511.pdf', 'transript/2021-09/61444ba06c720.pdf', 2015, '', 'AC', '0303509', 'password/2021-09/61444ba06c62f.pdf', 2),
(49, 'Azizbek ', 'Atabaev ', 'Adilbek o\'g\'li ', 1, 27, 376, 'Bo\'ston mahallasi Al-Beruniy Al-Beruniy ko\'chasi 4-yo\'lak 12-uy ', '+99891-435-55-5_', '+99891-277-23-98', '1995-04-13', 'aatabaev.121@gmail.com', 1, 'uploads/2021-09/61446619d6dbd.pdf', 1, '2021-09-17 09:55:37', '2021-09-17 09:55:37', 'diplom/2021-09/61446619d7589.pdf', 'transript/2021-09/61446619d7833.pdf', 2015, '', 'AC', '0303509', 'password/2021-09/61446619d76f2.pdf', 2),
(50, 'Mehrojiddin', 'Mustafoyev', 'Muzaffar o‘g‘li', 1, 18, 249, 'B.Qaychili qishlogi 15-a uy', '+99899-458-92-44', '+99894-697-20-21', '1997-04-22', 'm-biologiya@mail.ru', 1, 'uploads/2021-09/61446df468bb2.jpg', 1, '2021-09-17 10:29:08', '2021-09-17 10:29:08', 'diplom/2021-09/61446df469630.pdf', 'transript/2021-09/61446df469938.pdf', 2021, '', 'AC', '0889460', 'password/2021-09/61446df4697e6.pdf', 8),
(51, 'Ixtiyor', 'Abduraxmonov', 'Baxtiyor ogli', 1, 10, 124, '17kv, 25dom, 58kv', '+99891-428-12-13', '+99891-275-39-57', '1998-03-16', '', 1, 'uploads/2021-09/6144a1358389a.jpg', 1, '2021-09-17 14:07:49', '2021-09-17 14:07:49', 'diplom/2021-09/6144a13583ef2.pdf', 'transript/2021-09/6144a135840e7.pdf', 2017, '', 'AA', '9959047', 'password/2021-09/6144a13583ff6.pdf', 2),
(52, 'Jahongir', 'Yo\'ldashev', 'Nazarboy o\'g\'li', 1, 13, 173, 'Xorazm viloyati Gurlan tumani Olg\'a qishlog\'i Sovunchi mahallasi marifat ko\'cha 12 uy', '+99899-062-15-24', '+99899-960-15-24', '2004-06-02', '', 1, 'uploads/2021-09/6144a73ff13aa.pdf', 1, '2021-09-17 14:33:35', '2021-09-17 14:33:35', 'diplom/2021-09/6144a73ff19fa.pdf', 'transript/2021-09/6144a73ff1be8.pdf', 2021, '', 'AC', '3123407', 'password/2021-09/6144a73ff1af6.pdf', 1),
(53, 'Jahongir', 'Yo\'ldashev', 'Nazarboy o\'g\'li', 1, 13, 173, 'Xorazm viloyati Gurlan tumani olg\'a qishlog\'i sovunchi mahallasi marifat ko‘cha 12 uy', '+99899-062-15-24', '+99899-960-15-24', '2004-06-02', '', 1, 'uploads/2021-09/6144a88aa6a68.pdf', 1, '2021-09-17 14:39:06', '2021-09-17 14:39:06', 'diplom/2021-09/6144a88aa7295.pdf', 'transript/2021-09/6144a88aa77c2.pdf', 2021, '', 'AC', '3123407', 'password/2021-09/6144a88aa754b.pdf', 1),
(54, 'Karimboy', 'Djumaniyazov', 'Qurbonboy', 1, 27, 375, 'Yangilik mahallasi, P.Maxmud ko\'chasi, 63-uy', '+99897-604-25-77', '+99862-327-42-45', '2003-05-20', 'karimboydjumaniyozov@gmail.com', 1, 'uploads/2021-09/6144c0ba54bbb.jpg', 1, '2021-09-17 16:22:18', '2021-09-17 16:22:18', 'diplom/2021-09/6144c0ba55229.pdf', 'transript/2021-09/6144c0ba554e9.pdf', 2021, '', 'AC', '2025579', 'password/2021-09/6144c0ba553fb.pdf', 1),
(55, 'Mahfuza', 'Atajanova', 'Murodbekovna', 1, 13, 183, 'R Jumaniyozov 1-uy', '+99890-726-18-19', '+99890-726-18-19', '2001-04-19', 'atadjanovamaxfuza@_._', 2, 'uploads/2021-09/6144ce8faef3c.jpg', 1, '2021-09-17 17:21:19', '2021-09-17 17:21:19', 'diplom/2021-09/6144ce8faf5e6.jpg', 'transript/2021-09/6144ce8faf7fd.jpg', 2019, '', 'AB', '6686740', 'password/2021-09/6144ce8faf712.jpg', 1),
(56, 'Ергашжон', 'Сапойев', 'Шерзад огли', 1, 13, 175, 'Охунбайев ката бог махала 15 уй', '+99893-863-99-00', '+99899-967-50-67', '1999-12-25', '', 1, 'uploads/2021-09/6144f02ec125d.jpg', 1, '2021-09-17 19:44:46', '2021-09-17 19:44:46', 'diplom/2021-09/6144f02ec18a4.jpg', 'transript/2021-09/6144f02f050c7.jpg', 2018, '', 'AB', '3956341', 'password/2021-09/6144f02ec19ae.jpg', 2),
(57, 'Ергашжон', 'Сапойев', 'Шерзод огли', 1, 13, 175, 'Ахунбабайев', '+99893-863-99-00', '+99899-967-50-67', '1999-12-25', '', 1, 'uploads/2021-09/6144f1421f810.jpg', 1, '2021-09-17 19:49:22', '2021-09-17 19:49:22', 'diplom/2021-09/6144f1421fe5e.jpg', 'transript/2021-09/6144f1422003f.jpg', 2021, '', 'AB', '3956341', 'password/2021-09/6144f1421ff5b.jpg', 3),
(58, 'ILXOM', 'JO\'RAYEV', 'RIXSIVOY O\'G\'LI', 1, 10, 132, 'DOMBIRABOT 3TOR 33 UY ', '+99890-010-96-93', '+99890-167-01-61', '1998-06-09', 'ilxomj6rayev98@gmail.com', 1, 'uploads/2021-09/61457bd98d095.jpg', 1, '2021-09-18 05:40:41', '2021-09-18 05:40:41', 'diplom/2021-09/61457bd98d724.jpg', 'transript/2021-09/61457bd98d92b.jpg', 2017, '', 'AA', '6282388', 'password/2021-09/61457bd98d849.jpg', 8),
(59, 'UMIDBEK', 'OTAMURATOV', 'TULQINBEK O\'G\'LI', 1, 13, 175, 'X.OBIDOV 19', '+99890-433-13-34', '+99893-749-25-21', '1998-12-19', 'umidotomurotov@gmail.com', 1, 'uploads/2021-09/61458fcef2bdc.pdf', 1, '2021-09-18 07:05:50', '2021-09-18 07:05:50', 'diplom/2021-09/61458fcef3215.pdf', 'transript/2021-09/61458fcef33e8.pdf', 2021, '', 'AA', '8638289', 'password/2021-09/61458fcef3306.pdf', 6),
(60, 'Shahboz', 'Normurodov', 'Vahob', 1, 4, 51, 'Umr bunyodkori MFY', '+99891-452-60-42', '+99833-452-60-42', '2002-12-18', 'shahboznormurodov3@gmail.com', 1, 'uploads/2021-09/6145aa9ace6e6.jpg', 1, '2021-09-18 09:00:10', '2021-09-18 09:00:10', 'diplom/2021-09/6145aa9aced39.jpg', 'transript/2021-09/6145aa9acef1f.jpg', 2021, '', 'AC', '1628213', 'password/2021-09/6145aa9acee34.jpg', 2),
(61, 'Сирожиддин', 'Зарпуллайев', 'Зарпулла', 1, 7, 82, 'Полван арик махаласи ', '+99899-357-62-68', '', '2021-09-21', 'sirojiddin@gmail.uz', 1, 'uploads/2021-09/6145ab3a72ed9.jpg', 1, '2021-09-18 09:02:50', '2021-09-18 09:02:50', 'diplom/2021-09/6145ab3a7360c.jpg', 'transript/2021-09/6145ab3a7381f.jpg', 2021, '', 'AA', '5361715', 'password/2021-09/6145ab3a7372c.jpg', 4),
(62, 'Shahboz', 'Normurodov', 'Vahob', 1, 18, 252, 'Umr bunyodkori MFY', '+99891-452-60-42', '+99833-452-60-42', '2002-12-18', 'shahboznormurodov3@gmail.com', 1, 'uploads/2021-09/6145abf144ccb.jpg', 1, '2021-09-18 09:05:53', '2021-09-18 09:05:53', 'diplom/2021-09/6145abf145362.jpg', 'transript/2021-09/6145abf145704.jpg', 2021, '', 'AC', '1628213', 'password/2021-09/6145abf145564.jpg', 2),
(63, 'Saliyeva', 'Sabrina', 'Timurovna', 1, 9, 121, 'Binokor mahalla, Bastakor 23/1', '+99899-608-72-41', '+99867-350-13-21', '2003-10-05', 'saliyevasabrina3@gmail.com', 2, 'uploads/2021-09/6145bb66b62e4.jpg', 1, '2021-09-18 10:11:50', '2021-09-18 10:11:50', 'diplom/2021-09/6145bb66b69a8.pdf', 'transript/2021-09/6145bb66b6b88.pdf', 2021, '', 'AC', '2290666', 'password/2021-09/6145bb66b6aa0.pdf', 1),
(64, 'Sitora', 'Kulmatova', 'Ilxomiddin', 1, 11, 149, 'F.Xojayev 90', '+99893-160-48-59', '+99893-668-36-73', '2003-11-05', 'kulmatovasitora5@gmail.com', 2, 'uploads/2021-09/6145f4b8d0883.jpg', 1, '2021-09-18 14:16:24', '2021-09-18 14:16:24', 'diplom/2021-09/6145f4b8d0e25.pdf', 'transript/2021-09/6145f4b8d0f92.pdf', 2020, 'sertifikat/2021-09/6145f4b8d1168.pdf', 'AC', '2612739', 'password/2021-09/6145f4b8d0ee5.pdf', 2),
(65, 'Arslon', 'Xudayberganov', 'Olimboy og\'li', 1, 27, 383, 'Урганч шахар Аэропорт 1уй. Кв 41', '+99891-999-67-22', '+99899-733-49-26', '1993-11-24', 'aslankhugajberganov@gmail.com', 1, 'uploads/2021-09/61461664d6285.jpg', 1, '2021-09-18 16:40:04', '2021-09-18 16:40:04', 'diplom/2021-09/61461664d6927.pdf', 'transript/2021-09/61461664d6b0c.pdf', 2013, '', 'AB', '4233911', 'password/2021-09/61461664d6a2b.pdf', 1),
(66, 'Javlonbek ', 'Ibragimov ', 'Jalol o‘g‘li ', 1, 4, 50, 'Xo‘jamuborak qishog‘i', '+99899-684-64-65', '+99891-561-47-10', '2000-02-01', 'javlonbekibragimov0102@gmail.com', 1, 'uploads/2021-09/614638e1bd145.jpg', 1, '2021-09-18 19:07:13', '2021-09-18 19:07:13', 'diplom/2021-09/614638e1bd854.pdf', 'transript/2021-09/614638e1bdaa4.pdf', 2019, '', 'AB', '7212022', 'password/2021-09/614638e1bd990.pdf', 2),
(67, 'Севинч', 'Мавланова', 'Алишер ', 1, 3, 32, 'Dostlik MFY', '+99894-191-62-63', '+99893-296-90-69', '2002-08-03', 'sevinchmavlanova0@gmail.com', 2, 'uploads/2021-09/61465a55d28e1.jpg', 1, '2021-09-18 21:29:57', '2021-09-18 21:29:57', 'diplom/2021-09/61465a55d2f55.jpg', 'transript/2021-09/61465a55d3174.jpg', 2020, '', 'AC', '1586002', 'password/2021-09/61465a55d308c.jpg', 1),
(68, 'Jurayeva', 'Madina', 'Sultonovna', 1, 5, 66, 'Нурфшон 12-36', '+99899-331-85-04', '+99891-308-77-24', '2003-11-15', 'mjurayeva.495gmail.com@_._', 2, 'uploads/2021-09/6146a2b2d344b.jpg', 1, '2021-09-19 02:38:42', '2021-09-19 02:38:42', 'diplom/2021-09/6146a2b2d3aa0.pdf', 'transript/2021-09/6146a2b2d3e59.pdf', 2021, '', 'AC', '2784960', 'password/2021-09/6146a2b2d3cbe.pdf', 2),
(69, 'Xusanboy', 'Abadboyev', 'Anvar õg\'li', 1, 13, 175, 'Anjirchi MFY', '+99899-674-77-50', '+99833-466-05-65', '2003-11-26', 'abadboyevxusanboy@gmail.com', 1, 'uploads/2021-09/6146e1371bb9b.jpg', 1, '2021-09-19 07:05:27', '2021-09-19 07:05:27', 'diplom/2021-09/6146e1371c1a9.jpg', 'transript/2021-09/6146e1371c38e.jpg', 2021, '', 'AC', '3090192', 'password/2021-09/6146e1371c2a9.jpg', 2),
(70, 'FAYZULLO', 'ABDUMOMINOV', 'NUMONJON UGLI', 1, 15, 205, 'Pillakor MFY', '+99899-230-10-30', '', '2002-03-30', '', 1, 'uploads/2021-09/614758d3a7262.jpg', 1, '2021-09-19 15:35:47', '2021-09-19 15:35:47', 'diplom/2021-09/614758d3a7907.jpg', 'transript/2021-09/614758d3a7b22.jpg', 2019, '', 'AB', '9488414', 'password/2021-09/614758d3a7a23.jpg', 2),
(71, 'Boburjon ', 'Isoqov', 'Mirzohaydar o\'g\'li', 1, 9, 118, 'Qoraqum MFY Hosil-42', '+99899-472-29-96', '+99899-472-29-96', '1996-01-24', 'issakoov96@gmail.com', 1, 'uploads/2021-09/614814adc8cd0.bmp', 1, '2021-09-20 04:57:17', '2021-09-20 04:57:17', 'diplom/2021-09/614814adc92f8.jpg', 'transript/2021-09/614814adc94f2.jpg', 2015, '', 'BG', '0224049', 'password/2021-09/614814adc93ff.jpg', 2),
(72, 'Izzatbek', 'Xalillayev', 'Ilhom óģli', 1, 27, 374, 'Kamalak 34-uy', '+99894-464-66-26', '+99893-757-42-03', '2021-07-13', 'izzatbekxalillayev@_._', 1, 'uploads/2021-09/61482b1abd9f1.jpg', 1, '2021-09-20 06:32:58', '2021-09-20 06:32:58', 'diplom/2021-09/61482b1abe125.mp4', 'transript/2021-09/61482b1abe34d.mp4', 2021, '', 'AC', '2713152', 'password/2021-09/61482b1abe23e.jpg', 2),
(73, 'Azizbek ', 'Atabaev ', 'Adilbek o\'g\'li ', 1, 27, 376, 'Bo\'ston mahallasi Al-Beruniy Al-Beruniy ko\'chasi 4-yo\'lak 12-uy ', '+99891-435-55-57', '+99891-277-23-98', '1995-04-13', 'aatabaev.121@gmail.com', 1, 'uploads/2021-09/61485fd75db38.pdf', 1, '2021-09-20 10:17:59', '2021-09-20 10:17:59', 'diplom/2021-09/61485fd75e1cc.pdf', 'transript/2021-09/61485fd75e448.pdf', 2015, '', 'AC', '0303509', 'password/2021-09/61485fd75e32c.pdf', 2),
(74, 'Sherzodbek', 'Botirov', 'Ermamat o\'g\'li', 1, 12, 167, 'Qorasoy MFY', '+99891-118-29-66', '', '1997-09-01', 'asiprint@yandex.ru', 1, 'uploads/2021-09/6148601cad66d.jpg', 1, '2021-09-20 10:19:08', '2021-09-20 10:19:08', 'diplom/2021-09/6148601cadc60.pdf', 'transript/2021-09/6148601cade50.pdf', 1997, '', 'AA', '3898308', 'password/2021-09/6148601cadd6b.pdf', 4),
(75, 'Azizbek ', 'Atabaev ', 'Adilbek o\'g\'li ', 1, 27, 376, 'Bo\'ston mahallasi Al-Beruniy Al-Beruniy ko\'chasi 4-yo\'lak 12-uy ', '+99891-435-55-57', '+99891-277-23-98', '1995-04-13', 'aatabaev.121@gmail.com', 1, 'uploads/2021-09/614860a3e12fa.pdf', 1, '2021-09-20 10:21:23', '2021-09-20 10:21:23', 'diplom/2021-09/614860a3e18db.pdf', 'transript/2021-09/614860a3e1ab0.pdf', 2015, '', 'AC', '0303509', 'password/2021-09/614860a3e19d1.pdf', 2),
(76, 'Sherzodbek', 'Botirov', 'Ermamat o\'g\'li', 1, 12, 167, 'Qorasoy MFY', '+99891-118-29-66', '', '1997-09-01', 'asiprint@yandex.ru', 1, 'uploads/2021-09/61486169d8b48.jpg', 1, '2021-09-20 10:24:41', '2021-09-20 10:24:41', 'diplom/2021-09/61486169d918c.pdf', 'transript/2021-09/61486169d93ef.pdf', 2021, '', 'AA', '3898308', 'password/2021-09/61486169d929a.pdf', 1),
(77, 'G\'IYOS', 'RAJABBOYEV', 'ILYOS O\'G\'LI', 1, 2, 26, 'XAZARMAN MFY', '+99893-688-70-82', '+99899-021-47-33', '2001-07-12', 'ismatmexmonov1982@mail.ru', 1, 'uploads/2021-09/61486f175039c.png', 1, '2021-09-20 11:23:03', '2021-09-20 11:23:03', 'diplom/2021-09/61486f175097e.pdf', 'transript/2021-09/61486f1750b97.pdf', 2019, '', 'AB', '7437508', 'password/2021-09/61486f1750aa7.pdf', 2),
(78, 'Oliyajon', 'Jumabayeva', 'Davlatnazar qizi', 1, 27, 381, 'Gullangbog\' QFY Vakillar MFY', '+99897-787-16-12', '+99897-789-08-04', '1995-01-05', 'farrux.zaripov@list.ru', 2, 'uploads/2021-09/61488c383bf95.jpg', 1, '2021-09-20 13:27:20', '2021-09-20 13:27:20', 'diplom/2021-09/61488c383c6c6.pdf', 'transript/2021-09/61488c383c8fb.pdf', 2021, '', 'AA', '5973236', 'password/2021-09/61488c383c7f5.pdf', 8),
(79, 'Nurislom', 'Xo\'janov', 'Botir o\'g\'li', 1, 9, 114, 'Soyibobod QFY Do\'stlik 21', '+99899-480-08-25', '+99897-245-47-64', '2003-04-19', 'xojanovnurislom@gmail.com', 1, 'uploads/2021-09/61489bd08ffd5.jpg', 1, '2021-09-20 14:33:52', '2021-09-20 14:33:52', 'diplom/2021-09/61489bd090645.pdf', 'transript/2021-09/61489bd09085d.pdf', 2021, '', 'AC', '1868220', 'password/2021-09/61489bd090747.pdf', 2),
(80, 'Nurislom', 'Xo\'janov', 'Botir o\'g\'li', 1, 9, 114, 'Soyibobod QFY Do\'stlik 21', '+99899-480-08-25', '+99897-245-47-64', '2003-04-19', 'xojanovnurislom@gmail.com', 1, 'uploads/2021-09/61489ccebf084.jpg', 1, '2021-09-20 14:38:06', '2021-09-20 14:38:06', 'diplom/2021-09/61489ccebf7b7.pdf', 'transript/2021-09/61489ccebfa18.pdf', 2021, '', 'AC', '1868220', 'password/2021-09/61489ccebf8fe.pdf', 2),
(81, 'Azizbek ', 'Atabaev ', 'Adilbek o\'g\'li ', 1, 27, 376, 'Bo\'ston mahallasi Al-Beruniy Al-Beruniy ko\'chasi 4-yo\'lak 12-uy ', '+99891-435-55-57', '+99891-277-23-98', '1995-04-13', 'aatabaev.121@gmail.com', 1, 'uploads/2021-09/6148cf7bdddf4.pdf', 1, '2021-09-20 18:14:19', '2021-09-20 18:14:19', 'diplom/2021-09/6148cf7bde52a.pdf', 'transript/2021-09/6148cf7bde73b.pdf', 2015, '', 'AC', '0303509', 'password/2021-09/6148cf7bde654.pdf', 2),
(82, 'Mahmud', 'Abdullayev', 'Ravshanovich', 1, 13, 182, 'Urganch shahar Navro\'z ko\'chasi 12-uy 2-yo\'lak', '+99893-746-85-87', '+99899-965-97-97', '1997-06-09', 'abdullayevmahmud9797@gmail.com', 1, 'uploads/2021-09/6148d501128c6.jpg', 1, '2021-09-20 18:37:53', '2021-09-20 18:37:53', 'diplom/2021-09/6148d50113141.jpg', 'transript/2021-09/6148d50113533.jpg', 2016, 'sertifikat/2021-09/6148d50113649.jpg', 'AA', '1922552', 'password/2021-09/6148d5011338d.jpg', 2),
(83, 'Bekchanova', 'Dilarom', 'Umarjanovna', 1, 27, 383, 'Samarqand ko\'chasi 240-uy', '+99893-750-15-80', '+99897-211-65-44', '1991-03-12', 'rahm4nbergan@gmail.com', 2, 'uploads/2021-09/6149b59bc940a.png', 1, '2021-09-21 10:36:11', '2021-09-21 10:36:11', 'diplom/2021-09/6149b59bc9a18.pdf', 'transript/2021-09/6149b59bc9c0b.pdf', 2015, '', 'AB', '2878283', 'password/2021-09/6149b59bc9b2b.pdf', 5),
(84, 'Asadbek', 'Qalandarov', 'Faxriddin o\'g\'li', 1, 13, 177, 'Vatanparvar mahallasi Xorazm ko\'chasi 57-uy', '+99897-608-30-77', '+99897-608-30-77', '2002-02-22', 'rozmetovfaxriddin212@gmail.com', 1, 'uploads/2021-09/6149ccca366aa.pdf', 1, '2021-09-21 12:15:06', '2021-09-21 12:15:06', 'diplom/2021-09/6149ccca36cb9.pdf', 'transript/2021-09/6149ccca36e9e.pdf', 2020, '', 'AC', '1371699', 'password/2021-09/6149ccca36db8.pdf', 1),
(85, 'Mavlonbek', 'Rahimov', 'Dovud O\'g\'li', 1, 13, 183, 'Таза-Баг улица', '+99890-078-77-17', '', '2001-07-08', 'mavlonrakhimov08@gmail.com', 1, 'uploads/2021-09/6149d092467e0.jpeg', 1, '2021-09-21 12:31:14', '2021-09-21 12:31:14', 'diplom/2021-09/6149d09246dd8.jpeg', 'transript/2021-09/6149d09246fa3.jpeg', 2019, '', 'AB', '7199630', 'password/2021-09/6149d09246ec7.jpeg', 2),
(86, 'Shohruh ', 'Musurmonov ', 'Oybek ', 1, 3, 40, 'Egizbuloq mfy orishli qishlog‘i ', '+99891-199-30-08', '+99893-827-69-00', '2001-12-10', 'shohruhmusurmonov61@gmail.com', 1, 'uploads/2021-09/614acdef6af4d.jpg', 1, '2021-09-22 06:32:15', '2021-09-22 06:32:15', 'diplom/2021-09/614acdef6b6b5.jpg', 'transript/2021-09/614acdef6b90a.jpg', 2020, '', 'AB', '8359973', 'password/2021-09/614acdef6b7de.jpg', 3),
(87, 'Shohruh ', 'Musurmonov ', 'Oybek ', 1, 3, 40, 'Egizbuloq mfy orishli qishlog‘i ', '+99891-199-30-08', '+99893-827-69-00', '2001-12-10', 'shohruhmusurmonov61@gmail.com', 1, 'uploads/2021-09/614ace11e98bb.jpg', 1, '2021-09-22 06:32:49', '2021-09-22 06:32:49', 'diplom/2021-09/614ace11e9eef.jpg', 'transript/2021-09/614ace11ea0e3.jpg', 2020, '', 'AB', '8359973', 'password/2021-09/614ace11e9ff1.jpg', 3),
(88, 'Shohruh ', 'Musurmonov ', 'Oybek ', 1, 3, 40, 'Egizbuloq mfy orishli qishlog‘i ', '+99891-199-30-08', '+99893-827-69-00', '2001-12-10', 'shohruhmusurmonov61@gmail.com', 1, 'uploads/2021-09/614ace2030c9a.jpg', 1, '2021-09-22 06:33:04', '2021-09-22 06:33:04', 'diplom/2021-09/614ace2031304.jpg', 'transript/2021-09/614ace20314fa.jpg', 2020, '', 'AB', '8359973', 'password/2021-09/614ace2031405.jpg', 3),
(89, 'Shaxnozabonu', 'Qodirova', 'Omonboyqizi', 1, 13, 174, 'Xosiyon qishloği', '+99899-507-93-18', '+99899-268-09-16', '2002-09-16', 'qodirovasjahnozabonu39@gmail.com', 2, 'uploads/2021-09/614ae7fb349b1.jpg', 1, '2021-09-22 08:23:23', '2021-09-22 08:23:23', 'diplom/2021-09/614ae7fb34fb9.jpg', 'transript/2021-09/614ae7fb3518d.jpg', 2020, '', 'AC', '2878670', 'password/2021-09/614ae7fb350a9.jpg', 1),
(90, 'Jahongir', 'Xudoyberganov', 'Shonazar', 1, 13, 173, 'Amu sohili 36-uy', '+99897-517-11-53', '+99899-505-55-04', '2003-09-24', 'shonazarxudoyberganov77@gmail.com', 1, 'uploads/2021-09/614b195f7ea0f.jpg', 1, '2021-09-22 11:54:07', '2021-09-22 11:54:07', 'diplom/2021-09/614b19600038b.heic', 'transript/2021-09/614b1960369ad.heic', 2021, '', 'AC', '2505670', 'password/2021-09/614b19601e5ab.jpg', 2),
(91, 'Madrahim', 'Shuhratov', 'Xazrat o\'gli', 1, 13, 175, 'Bog\'dorchi 27 uy', '+99893-752-75-15', '+99893-619-11-88', '2003-03-09', 'atushshuhratov@gmail._', 1, 'uploads/2021-09/614b1cef1d2b5.jpg', 1, '2021-09-22 12:09:19', '2021-09-22 12:09:19', 'diplom/2021-09/614b1cef1d8aa.jpg', 'transript/2021-09/614b1cef1da81.jpg', 2021, '', 'AC', '2676767', 'password/2021-09/614b1cef1d9a4.jpg', 2),
(92, 'Shirin', 'Abdushukurova', 'Baxtiyor qizi', 1, 8, 100, 'Gulobot mahallasi', '+99893-655-03-04', '+99893-655-03-04', '2000-10-26', 'shirinaabdushukurova@gmail.com', 2, 'uploads/2021-09/614b62d7c5f67.pdf', 1, '2021-09-22 17:07:35', '2021-09-22 17:07:35', 'diplom/2021-09/614b62d7c6568.pdf', 'transript/2021-09/614b62d7c675d.pdf', 2020, '', 'AB', '6070081', 'password/2021-09/614b62d7c6679.pdf', 1),
(93, 'SUXROB', 'POLVANBAYEV', 'KARIMBOY O\'G\'LI', 1, 13, 178, 'RAVOT QISHLOG\'I, DASHYOQ MAHALLASI, RAVOT KO\'CHASI 24-UY', '+99899-575-69-31', '+99899-734-09-40', '2004-02-26', 'ruzimatovomonboy@gmail.com', 1, 'uploads/2021-09/614c6578bcdfe.pdf', 1, '2021-09-23 11:31:04', '2021-09-23 11:31:04', 'diplom/2021-09/614c6578bd3dd.pdf', 'transript/2021-09/614c6578bd7a2.pdf', 2021, '', 'AC', '2775743', 'password/2021-09/614c6578bd5eb.pdf', 1),
(94, 'SUXROB', 'POLVANBAYEV', 'KARIMBOY O\'G\'LI', 1, 13, 178, 'RAVOT QISHLOG\'I, DASHYOQ MAHALLASI, RAVOT KO\'CHASI 24-UY', '+99899-575-69-31', '+99899-734-09-40', '2004-02-26', 'ruzimatovomonboy@gmail.com', 1, 'uploads/2021-09/614c662b97b73.pdf', 1, '2021-09-23 11:34:03', '2021-09-23 11:34:03', 'diplom/2021-09/614c662b98175.pdf', 'transript/2021-09/614c662b98338.pdf', 2021, '', 'AC', '2775743', 'password/2021-09/614c662b98267.pdf', 2),
(95, 'Shahzodabegim', 'Tursunboyeva', 'Dilmurod qizi', 1, 11, 146, 'Mevazor maxalla Turon kochasi', '+99897-885-81-00', '+99897-447-81-00', '2004-01-30', 'tursunboyevashahzodabegim@gmail.com', 2, 'uploads/2021-09/614c6767d0fd3.pdf', 1, '2021-09-23 11:39:19', '2021-09-23 11:39:19', 'diplom/2021-09/614c6767d15f5.pdf', 'transript/2021-09/614c6767d17ac.pdf', 2021, '', 'AC', '2709553', 'password/2021-09/614c6767d16d2.pdf', 2),
(96, 'RASULBEK', 'IBROXIMOV', 'QUVONDIQ O\'G\'LI', 1, 27, 381, 'Qarmish qishlog\'i, Tabarruk ko\'cha 16-uy', '+99833-045-10-45', '+99897-605-15-45', '1998-02-24', 'ibroximovrasulbek1045@gmail.com', 1, 'uploads/2021-09/614d742944577.jpg', 1, '2021-09-24 06:46:01', '2021-09-24 06:46:01', 'diplom/2021-09/614d742944c13.pdf', 'transript/2021-09/614d742944df7.pdf', 2017, '', 'AA', '5519538', 'password/2021-09/614d742944d10.pdf', 2),
(97, 'Shoxsanam', 'Atabayeva', 'Maxmudjonovna', 1, 27, 384, 'Sangar 20 uy', '+99891-426-48-50', '+99891-427-07-42', '1995-10-28', 'www102820@gmail.com', 2, 'uploads/2021-09/614d81b516669.pdf', 1, '2021-09-24 07:43:49', '2021-09-24 07:43:49', 'diplom/2021-09/614d81b516e23.pdf', 'transript/2021-09/614d81b51701e.pdf', 2019, 'sertifikat/2021-09/614d81b5170f8.pdf', 'AA', '3916278', 'password/2021-09/614d81b516f41.pdf', 6),
(98, 'Muhriddin ', 'Jumaniyazov', 'Rasul o\'g\'li', 1, 13, 177, 'qirk-yop qishloqi', '+99897-459-20-39', '+99888-858-21-75', '2001-03-21', 'jumaniyozovjumaniyozov0707@gmail.com', 1, 'uploads/2021-09/614db72a7b0ed.pdf', 1, '2021-09-24 11:31:54', '2021-09-24 11:31:54', 'diplom/2021-09/614db72a7bf40.pdf', 'transript/2021-09/614db72a7c141.pdf', 2020, '', 'AB', '6320751', 'password/2021-09/614db72a7c043.pdf', 3),
(99, 'Muhriddin ', 'Jumaniyazov', 'Rasul o\'g\'li', 1, 27, 378, 'qirk-yop qishloqi', '+99897-459-20-39', '+99888-858-21-75', '2001-03-21', 'jumaniyozovjumaniyoz0707@gmail.com.', 1, 'uploads/2021-09/614db8bec6ed6.pdf', 1, '2021-09-24 11:38:38', '2021-09-24 11:38:38', 'diplom/2021-09/614db8bec7588.pdf', 'transript/2021-09/614db8bec776e.pdf', 2020, '', 'AB', '6320751', 'password/2021-09/614db8bec768d.pdf', 2),
(100, 'Abdurashidxon', 'Gafforov', 'Mansur', 1, 7, 92, 'Pochvon', '+99899-079-45-38', '+99899-073-45-38', '2002-06-21', 'abdurashidxon48@gmail.com._', 1, 'uploads/2021-09/614ea0243e29a.jpg', 1, '2021-09-25 04:05:56', '2021-09-25 04:05:56', 'diplom/2021-09/614ea0243e94f.jpg', 'transript/2021-09/614ea0243eb5d.jpg', 2019, '', 'AC', '1250279', 'password/2021-09/614ea0243ea5f.jpg', 1),
(101, 'Zafarbek', 'Normatov', 'Azimboy o\'g\'li', 1, 13, 181, 'Ko\'cha Bobur', '+99899-547-73-19', '+99890-578-61-21', '2002-05-17', 'realmadirit18@gmail.com.', 1, 'uploads/2021-09/614eaba04ac21.jpg', 1, '2021-09-25 04:54:56', '2021-09-25 04:54:56', 'diplom/2021-09/614eaba04b2a0.jpg', 'transript/2021-09/614eaba04b49c.jpg', 2021, 'sertifikat/2021-09/614eaba04b588.jpg', 'AC', '1327795', 'password/2021-09/614eaba04b3a4.jpg', 3),
(102, 'Zafarbek', 'Normatov', 'Azimboy', 1, 13, 181, 'Bobur koʻchasi', '+99899-547-73-19', '', '2002-05-17', 'fizika2110@gmail.com', 1, 'uploads/2021-09/614edf9d31244.jpg', 1, '2021-09-25 08:36:45', '2021-09-25 08:36:45', 'diplom/2021-09/614edf9d31887.jpg', 'transript/2021-09/614edf9d31a60.jpg', 2020, '', 'AC', '1327795', 'password/2021-09/614edf9d31980.jpg', 3),
(103, 'Asadbek', 'Qalandarov', 'Faxriddin', 1, 13, 177, 'Vatanparvar mahallasi Xorazm ko\'chasi 57-uy', '+99897-608-30-77', '', '2002-02-22', 'rozmetovfaxriddin212@gmail.com', 1, 'uploads/2021-09/614ee71e69c6d.pdf', 1, '2021-09-25 09:08:46', '2021-09-25 09:08:46', 'diplom/2021-09/614ee71e6a2c4.pdf', 'transript/2021-09/614ee71e6a4c0.pdf', 2020, '', 'AC', '1371699', 'password/2021-09/614ee71e6a3b9.jpg', 1),
(104, 'Elbrus', 'Torebayev', 'Polatbay uli', 1, 28, 400, 'Ornek MFY A. Dinaliyev kuchasi 31 uy', '+99897-228-92-96', '+99897-353-13-02', '1996-01-23', 'elbatorebayev@gmail.com', 1, 'uploads/2021-09/6150c9f938d1f.jpg', 1, '2021-09-26 19:28:57', '2021-09-26 19:28:57', 'diplom/2021-09/6150c9f94c939.pdf', 'transript/2021-09/6150c9f959fb1.pdf', 2021, '', 'KA', '0795621', 'password/2021-09/6150c9f953b94.pdf', 5),
(105, 'Elbrus', 'Torebayev', 'Polatbay uli', 1, 28, 400, 'Ornek MFY A. Dinaliyev kuchasi 31 uy', '+99897-228-92-96', '+99897-353-13-02', '1996-01-23', 'elbatorebayev@gmail.com', 1, 'uploads/2021-09/6150ca2dbf980.jpg', 1, '2021-09-26 19:29:49', '2021-09-26 19:29:49', 'diplom/2021-09/6150ca2dbff49.pdf', 'transript/2021-09/6150ca2dc00fe.pdf', 2021, '', 'KA', '0795621', 'password/2021-09/6150ca2dc002f.pdf', 5),
(106, 'Elbrus', 'Torebayev', 'Polatbay uli', 1, 28, 400, 'Ornek MFY A. Dinaliyev kuchasi 31 uy', '+99897-228-92-96', '+99897-353-13-02', '1996-01-23', 'elbatorebayev@gmail.com', 1, 'uploads/2021-09/6150cb7a8d130.jpg', 1, '2021-09-26 19:35:22', '2021-09-26 19:35:22', 'diplom/2021-09/6150cb7a8d75b.pdf', 'transript/2021-09/6150cb7a8d932.pdf', 2019, 'sertifikat/2021-09/6150cb7a8da00.pdf', 'KA', '0795621', 'password/2021-09/6150cb7a8d851.pdf', 5),
(107, 'ELBRUS', 'TOREBAYEV', 'POLATBAY ULI', 1, 28, 400, 'ORNEK MFY A. DINALIYEV KUCHASI 31 UY', '+99897-228-92-96', '+99897-353-13-02', '1996-01-23', 'elbatorebayev@gmail.com', 1, 'uploads/2021-09/6150ce77cd1be.jpg', 1, '2021-09-26 19:48:07', '2021-09-26 19:48:07', 'diplom/2021-09/6150ce77cd7cf.pdf', 'transript/2021-09/6150ce77cd9ae.pdf', 2019, '', 'KA', '0795621', 'password/2021-09/6150ce77cd8c0.pdf', 5),
(108, 'Abdunabi', 'Bozarov', 'Abdulloxon o\'g\'li', 1, 6, 76, 'Namangan mfy', '+99893-673-91-66', '+99893-673-91-66', '1997-05-29', '', 1, 'uploads/2021-09/61515a3cb4433.jpg', 1, '2021-09-27 05:44:28', '2021-09-27 05:44:28', 'diplom/2021-09/61515a3cb4ad9.pdf', 'transript/2021-09/61515a3cb4d2c.pdf', 2021, '', 'AA', '9398899', 'password/2021-09/61515a3cb4bf8.jpg', 4),
(110, 'Jamshid ', 'Sultanov', 'Otabek og\'li', 1, 13, 178, 'Arvuk qishlog\'i', '+99899-969-58-54', '+99899-708-89-63', '2001-06-20', 'shuhrat.qurbanbayev@mail.ru', 1, 'uploads/2021-09/61529f9a3a3c4.jpg', 1, '2021-09-28 04:52:42', '2021-09-28 04:52:42', 'diplom/2021-09/61529f9a3ac30.pdf', 'transript/2021-09/61529f9a3aef6.pdf', 2020, '', 'AB', '7047147', 'password/2021-09/61529f9a3ad9f.pdf', 2),
(111, 'Nematov', 'Farruxjon', 'Qosimovich', 1, 7, 87, 'Sarbozor MFY', '+99899-123-32-97', '+99899-065-06-33', '1997-07-26', 'islombekxojamberdiyev24@gmail.com', 1, 'uploads/2021-09/6152c994e786a.jpg', 1, '2021-09-28 07:51:48', '2021-09-28 07:51:48', 'diplom/2021-09/6152c994e820e.jpg', 'transript/2021-09/6152c994e8438.jpg', 2015, '', 'AA', '7949860', 'password/2021-09/6152c994e832d.jpg', 2),
(112, 'Shuxratbek', 'Erkinov', 'Umrbek O\'g\'li', 1, 27, 379, 'Elobod 55', '+99899-623-19-77', '+99893-922-83-01', '2002-10-19', 'axmedovumrbek1977@gmail.com', 1, 'uploads/2021-09/615450be91b5c.pdf', 1, '2021-09-29 11:40:46', '2021-09-29 11:40:46', 'diplom/2021-09/615450be921eb.pdf', 'transript/2021-09/615450be923c5.pdf', 2019, '', 'AC', '1825755', 'password/2021-09/615450be922e4.pdf', 2),
(113, 'Abdullohjon', 'Rizoqulov', 'Zarifjon ogli', 1, 9, 112, '1-boyovut Istiqlol maxalla Fazogir 7', '+99890-020-78-77', '+99890-153-63-87', '2003-11-24', 'abdullohrizoqulov@gmail.com', 1, 'uploads/2021-09/615453019d8d5.jpg', 1, '2021-09-29 11:50:25', '2021-09-29 11:50:25', 'diplom/2021-09/615453019de96.jpg', 'transript/2021-09/615453019e054.jpg', 2021, '', 'AC', '2467771', 'password/2021-09/615453019df7e.jpg', 3),
(114, 'Madrahim', 'Shuhratov', 'Xazrat og\'li', 1, 27, 376, 'Bog\'dorchi mahallasi shifo nur ko\'chasi 27 uy', '+99893-619-11-88', '+99893-752-75-15', '2003-03-09', '_@atushshuhratov._', 1, 'uploads/2021-09/61545ed9dd7de.jpg', 1, '2021-09-29 12:40:57', '2021-09-29 12:40:57', 'diplom/2021-09/61545ed9ddebb.pdf', 'transript/2021-09/61545ed9de0b8.pdf', 2021, '', 'AC', '2576767', 'password/2021-09/61545ed9ddfc3.pdf', 2),
(115, 'Alibek', 'Sapaxanov', 'Ergash o\'g\'li', 1, 13, 181, 'B\'zqal\'a qishloq', '+99893-466-01-75', '+99893-750-33-76', '2003-06-22', '', 1, 'uploads/2021-09/61547eeb952f4.jpg', 1, '2021-09-29 14:57:47', '2021-09-29 14:57:47', 'diplom/2021-09/61547eeb95995.pdf', 'transript/2021-09/61547eeb95b82.pdf', 2021, '', 'AC', '2103915', 'password/2021-09/61547eeb95a8d.pdf', 3),
(116, 'Zilola', 'Matkarimova', 'Zakirjon qizi', 1, 13, 178, 'Baxtli oilalar 28', '+99897-514-99-69', '+99891-435-67-37', '2001-11-28', '', 2, 'uploads/2021-09/615573973d4db.jpg', 1, '2021-09-30 08:21:43', '2021-09-30 08:21:43', 'diplom/2021-09/615573973daa6.jpg', 'transript/2021-09/615573973dc90.jpg', 2021, '', 'AB', '8495770', 'password/2021-09/615573973dbae.jpg', 2),
(117, 'Raxmatjon', 'Iskandarov', 'Rustam o\'g\'li', 1, 27, 374, 'Xorazm viloyati Gurlan tumani Vazir qishlog\'i', '+99894-235-16-22', '', '2003-06-07', '', 1, 'uploads/2021-09/61557e696ab8b.jpg', 1, '2021-09-30 09:07:53', '2021-09-30 09:07:53', 'diplom/2021-09/61557e696b151.pdf', 'transript/2021-09/61557e696b325.pdf', 2021, '', 'AC', '2379656', 'password/2021-09/61557e696b249.pdf', 2),
(118, 'Sirojbek', 'Nazarboyev', 'Ravshanbek o\'g\'li', 1, 13, 173, 'Xorazm viloyati Gurlan tumani Vazir qishlog\'i', '+99893-320-83-43', '', '2003-04-13', '', 1, 'uploads/2021-09/615580da900e6.jpg', 1, '2021-09-30 09:18:18', '2021-09-30 09:18:18', 'diplom/2021-09/615580da9086b.pdf', 'transript/2021-09/615580da90a97.pdf', 2021, '', 'AC', '2913139', 'password/2021-09/615580da90992.pdf', 2),
(119, 'Raxmatjon', 'Iskandarov', 'Rustam o\'g\'li', 1, 13, 173, 'Xorazm viloyati Gurlan tumani Vazir qishlog\'i', '+99894-235-16-22', '', '2003-06-07', '', 1, 'uploads/2021-09/6155822a976af.jpg', 1, '2021-09-30 09:23:54', '2021-09-30 09:23:54', 'diplom/2021-09/6155822a97de2.pdf', 'transript/2021-09/6155822a98041.pdf', 2021, '', 'AC', '2379656', 'password/2021-09/6155822a97f46.pdf', 2),
(120, 'Javoxir', 'Qo\'chqorov', 'Jumamurot o\'g\'li', 1, 13, 175, 'Chakkasholikor besh ayvon mahallasi', '+99893-090-30-72', '+99893-093-53-55', '2002-09-11', '_@javabotjava._', 1, 'uploads/2021-09/6155a06fef618.pdf', 1, '2021-09-30 11:33:03', '2021-09-30 11:33:03', 'diplom/2021-09/6155a06fefc06.pdf', 'transript/2021-09/6155a06fefdc9.pdf', 2020, '', 'AC', '0303303', 'password/2021-09/6155a06fefcef.pdf', 2),
(121, 'Maxliyo', 'Reyimova', 'Baxrom', 1, 28, 399, 'Boģyap', '+99583-102-4_-__', '+99888-354-10-24', '2021-10-24', 'reyimovamahliyo7@gmoilcom._', 2, 'uploads/2021-09/6155ac2987241.jpg', 1, '2021-09-30 12:23:05', '2021-09-30 12:23:05', 'diplom/2021-09/6155ac29879ae.jpg', 'transript/2021-09/6155ac2987b7f.jpg', 2021, '', 'KA', '1249109', 'password/2021-09/6155ac2987aa5.jpg', 1),
(122, 'Maxliyo', 'Reyimova', 'Baxrom', 1, 28, 399, 'Boģyap', '+99899-583-10-24', '+99888-354-10-24', '2021-10-24', 'reyimovamahliyo7@gmoilcom._', 2, 'uploads/2021-09/6155b079a838d.jpg', 1, '2021-09-30 12:41:29', '2021-09-30 12:41:29', 'diplom/2021-09/6155b079a89ac.jpg', 'transript/2021-09/6155b079a8b8c.jpg', 2021, '', 'KA', '1249109', 'password/2021-09/6155b079a8a9c.jpg', 1),
(123, 'Boytora', 'Eshqoziyev', 'Anorqul ogli', 1, 3, 35, 'Qiziloy', '+99894-001-22-61', '+99893-396-39-40', '2002-11-12', 'eboytora@mail.com', 1, 'uploads/2021-09/6155d82e45d71.png', 1, '2021-09-30 15:30:54', '2021-09-30 15:30:54', 'diplom/2021-09/6155d82e46399.jpg', 'transript/2021-09/6155d82e4656a.jpg', 2020, '', 'AC', '0308177', 'password/2021-09/6155d82e4648d.jpg', 2),
(124, 'Izzatbek', 'Ortiqov', 'Ro\'zmatovich', 1, 13, 182, '8-mart 62 uy', '+99893-745-11-55', '+99893-468-95-95', '2001-08-26', 'sherzodd.0303@gmail.com', 1, 'uploads/2021-09/6155e2b969c7f.pdf', 1, '2021-09-30 16:15:53', '2021-09-30 16:15:53', 'diplom/2021-09/6155e2b96a270.pdf', 'transript/2021-09/6155e2b96a43c.pdf', 2019, '', 'AB', '7814330', 'password/2021-09/6155e2b96a35f.pdf', 2),
(125, 'Akbar', 'Sharipovich', 'Ilxomovich', 1, 13, 182, 'Proektnaya 173, 102 uy', '+99897-401-76-76', '', '1994-07-30', 'sharipoff.aa@gmail.com', 1, 'uploads/2021-10/6157065326913.jpg', 1, '2021-10-01 13:00:02', '2021-10-01 13:00:02', 'diplom/2021-10/6157065335431.pdf', 'transript/2021-10/615706533580e.pdf', 2017, '', 'AA', '1840663', 'password/2021-10/615706533569b.pdf', 5),
(126, 'Jamshid', 'Raximboyev', 'Hamidjon', 1, 13, 173, 'Vazir qishlogʻi esabi mahallasi iftixor2 koʻchasi 1-uy', '+99888-452-36-37', '', '2000-02-22', 'raximboyevjamshid2000@gmail.com._', 1, 'uploads/2021-10/61572b2bc4696.jpg', 1, '2021-10-01 15:37:15', '2021-10-01 15:37:15', 'diplom/2021-10/61572b2bc4c77.pdf', 'transript/2021-10/61572b2bc4e38.pdf', 2019, '', 'AB', '5914880', 'password/2021-10/61572b2bc4d6f.pdf', 1),
(127, 'Xursandbek', 'To\'raboyev', 'Jasurbek', 1, 13, 179, 'Shorchilar 1-uy', '+99899-592-02-45', '+99833-737-93-90', '2021-11-04', 'xursandbektoraboyev5@gmail.com', 1, 'uploads/2021-10/61573a35c33c3.pdf', 1, '2021-10-01 16:41:25', '2021-10-01 16:41:25', 'diplom/2021-10/61573a35c3b48.pdf', 'transript/2021-10/61573a35c3e84.pdf', 2021, '', 'AC', '2167538', 'password/2021-10/61573a35c3d2d.pdf', 3);
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `patronymic`, `state_id`, `province_id`, `region_id`, `address`, `phone_1`, `phone_2`, `date_birth`, `email`, `gender_id`, `image`, `status`, `created_at`, `updated_at`, `diplom`, `transkriptlar`, `year_of_graduation`, `sertifikat`, `pass_seria`, `pass_num`, `pass_file`, `section_id`) VALUES
(128, 'Xursandbek', 'To\'raboyev', 'Jasurbek', 1, 13, 179, 'Shorchilar 1-uy', '+99899-592-02-45', '+99833-737-93-90', '2002-11-04', 'xursandbektoraboyev5@gmail.com', 1, 'uploads/2021-10/61573bad914a0.pdf', 1, '2021-10-01 16:47:41', '2021-10-01 16:47:41', 'diplom/2021-10/61573bad91bf0.pdf', 'transript/2021-10/61573bad91ddd.pdf', 2021, '', 'AC', '2167538', 'password/2021-10/61573bad91d05.pdf', 3),
(129, 'Shuxrat', 'Erkinov', 'Umrbek', 1, 13, 183, 'Elobod', '+99899-623-19-77', '+99893-922-83-01', '2002-10-19', 'axmedovumrbek1977@gmail.com', 1, 'uploads/2021-10/61582d1c05a66.pdf', 1, '2021-10-02 09:57:48', '2021-10-02 09:57:48', 'diplom/2021-10/61582d1c06015.pdf', 'transript/2021-10/61582d1c061b6.pdf', 2019, '', 'AC', '1825755', 'password/2021-10/61582d1c060eb.pdf', 2),
(130, 'Atabaeva', 'Shoxsanam', 'Maxmudjonovna', 1, 27, 384, 'Xiva. Sangar 20uy', '+99833-282-10-28', '+99891-426-48-50', '1995-10-28', 'www102820@gmail.com', 2, 'uploads/2021-10/615860d6a5f55.pdf', 1, '2021-10-02 13:38:30', '2021-10-02 13:38:30', 'diplom/2021-10/615860d6a6504.pdf', 'transript/2021-10/615860d6a66c0.pdf', 2019, 'sertifikat/2021-10/615860d6a678a.pdf', 'AA', '3916278', 'password/2021-10/615860d6a65e9.pdf', 6),
(131, 'Atabaeva', 'Shoxsanam', 'Maxmudjonovna', 1, 27, 384, 'Xiva. Sangar 20uy', '+99833-282-10-28', '+99891-426-48-50', '1995-10-28', 'www102820@gmail.com', 2, 'uploads/2021-10/6158614a89bf6.pdf', 1, '2021-10-02 13:40:26', '2021-10-02 13:40:26', 'diplom/2021-10/6158614a8a1c8.pdf', 'transript/2021-10/6158614a8a36a.pdf', 2019, 'sertifikat/2021-10/6158614a8a431.pdf', 'AA', '3916278', 'password/2021-10/6158614a8a2a2.pdf', 6),
(132, 'Шихназар', 'Рустамов', 'Алишер угли', 1, 27, 384, 'О.Юсупова кучаси 33 уй', '+99890-077-49-97', '+99899-962-33-76', '2003-12-07', 'sihnazarrustamov83@gmail.com', 1, 'uploads/2021-10/61586c1f0871f.pdf', 1, '2021-10-02 14:26:39', '2021-10-02 14:26:39', 'diplom/2021-10/61586c1f08d29.pdf', 'transript/2021-10/61586c1f08ed7.pdf', 2021, '', 'AD', '0104528', 'password/2021-10/61586c1f08e06.pdf', 2),
(133, 'Hasanboy', 'Ro\'zmatov', 'Bahrom o\'g\'li', 1, 13, 182, 'Xonqa ko\'chasi 113-uy 15-xonadon', '+99897-363-61-61', '+99893-748-47-78', '2004-03-02', 'muborak3636161@gmal.com._', 1, 'uploads/2021-10/61587da1ec513.jpg', 1, '2021-10-02 15:41:21', '2021-10-02 15:41:21', 'diplom/2021-10/61587da1ecc20.jpg', 'transript/2021-10/61587da1ece8c.jpg', 2021, '', 'AC', '2849084', 'password/2021-10/61587da1ecd6e.jpg', 2),
(134, 'Xursandbek', 'To\'raboyev', 'Jasurbek', 1, 13, 179, 'Shorchilar 1-uy', '+99899-592-02-45', '+99833-737-93-90', '2002-11-04', 'xursandbektoraboyev5@gmail.com', 1, 'uploads/2021-10/61589a98f105d.pdf', 1, '2021-10-02 17:44:56', '2021-10-02 17:44:56', 'diplom/2021-10/61589a98f1723.pdf', 'transript/2021-10/61589a98f1937.pdf', 2021, '', 'AC', '2167538', 'password/2021-10/61589a98f1830.pdf', 3),
(135, 'Gulhayo', 'Latipova', 'Ikromovna', 1, 13, 182, 'Iftixor 17', '+99894-023-99-33', '', '2000-02-28', '', 2, 'uploads/2021-10/615a8c7295934.jpg', 1, '2021-10-04 05:09:06', '2021-10-04 05:09:06', 'diplom/2021-10/615a8c7295ffd.jpg', 'transript/2021-10/615a8c7296222.jpg', 2021, '', 'AB', '5162801', 'password/2021-10/615a8c7296112.pdf', 2),
(136, 'Xursandbek', 'To`raboyev', 'Jasurbek o`g`li', 1, 13, 179, 'Sho`rchilar ko`chasi 1uy', '+99899-592-02-45', '+99833-737-93-90', '2002-11-04', 'xursandbektoraboyev5@gmail.com', 1, 'uploads/2021-10/615a8e5dab301.jpg', 1, '2021-10-04 05:17:17', '2021-10-04 05:17:17', 'diplom/2021-10/615a8e5dab8e5.pdf', 'transript/2021-10/615a8e5daba9d.pdf', 2021, '', 'AC', '2167538', 'password/2021-10/615a8e5dab9cf.pdf', 3),
(137, 'Elyor', 'Fayzullayev', 'Bakberganovich', 1, 27, 380, 'Chiğatoyqala qishloği Navröz mahallasi Tashabbus 1-berk köchasi 15-uy', '+99833-566-77-76', '+99891-571-96-99', '1996-11-23', 'elyorfayzullayev05@mail.com', 1, 'uploads/2021-10/615a92a3416bd.jpg', 1, '2021-10-04 05:35:31', '2021-10-04 05:35:31', 'diplom/2021-10/615a92a341e15.pdf', 'transript/2021-10/615a92a342046.pdf', 2020, '', 'AA', '3026518', 'password/2021-10/615a92a341f35.jpg', 5),
(138, 'Ergashjon', 'Sapayev', 'Sherzad o\'g\'li', 1, 13, 175, 'Qoramon qishloq', '+99899-967-50-67', '+99893-863-99-00', '1999-12-25', 'polvonnazaryakubov@gmail.com', 1, 'uploads/2021-10/615aa1ca8813c.jpg', 1, '2021-10-04 06:40:10', '2021-10-04 06:40:10', 'diplom/2021-10/615aa1ca88890.pdf', 'transript/2021-10/615aa1ca88a6a.pdf', 2018, '', 'AB', '3956341', 'password/2021-10/615aa1ca88994.pdf', 2),
(139, 'Oyshajon', 'Shonazarova', 'Elbek qizi', 1, 10, 128, 'Qoraqamish 1/3', '+99899-981-00-19', '+99899-871-00-19', '2003-09-10', 'yec_ntm2018@umail.uz', 2, 'uploads/2021-10/615ac8bc4922a.pdf', 1, '2021-10-04 09:26:20', '2021-10-04 09:26:20', 'diplom/2021-10/615ac8bc4987b.pdf', 'transript/2021-10/615ac8bc49a3e.pdf', 2021, '', 'AC', '2680826', 'password/2021-10/615ac8bc4996d.pdf', 1),
(140, 'Jamshidbek', 'Bobojonov', 'Rashid o\'g\'li', 1, 13, 177, 'Sog\'lom avlod 5 a uy', '+99893-281-55-65', '', '2003-08-15', 'jamshidbobojonov05@gmail.com', 1, 'uploads/2021-10/615ade7070611.jpg', 1, '2021-10-04 10:58:56', '2021-10-04 10:58:56', 'diplom/2021-10/615ade7070c4b.jpg', 'transript/2021-10/615ade7070e3d.jpg', 2020, '', 'AC', '2165236', 'password/2021-10/615ade7070d2f.jpg', 2),
(141, ' Sardorbek ', 'Egamov', 'Muzaffarovich', 1, 13, 172, 'Bog\'ot tumani Qulonqorobog\' qishlog\'i', '+99897-511-41-11', '+99899-969-03-35', '1996-12-05', 'madaminovamohira97@gmail.com', 1, 'uploads/2021-10/615ae1f1dec2f.pdf', 1, '2021-10-04 11:13:53', '2021-10-04 11:13:53', 'diplom/2021-10/615ae1f1df31f.pdf', 'transript/2021-10/615ae1f1df723.pdf', 2021, '', 'AA', '0691693', 'password/2021-10/615ae1f1df57a.pdf', 5),
(142, 'Alisher', 'Atajanov', 'Yuldashboyevich', 1, 27, 376, 'Qoramon qishlog\'i', '+99899-564-54-14', '', '1987-07-22', 'testtv527@gmail.com', 1, 'uploads/2021-10/615aec5917798.jpg', 1, '2021-10-04 11:58:17', '2021-10-04 11:58:17', 'diplom/2021-10/615aec5917e28.pdf', 'transript/2021-10/615aec591802a.pdf', 2011, '', 'AA', '9954710', 'password/2021-10/615aec5917f2f.jpg', 5),
(143, 'Islombek', 'Eshmurodov', 'Ozod o\'g\'li', 1, 27, 381, 'Po\'rsang mahalla Charog\'bon ko\'cha 29-uy', '+99897-452-01-79', '+99895-046-16-65', '2003-11-03', 'sodiqovozodbekk@gmail.com', 1, 'uploads/2021-10/615af09702b7e.jpg', 1, '2021-10-04 12:16:23', '2021-10-04 12:16:23', 'diplom/2021-10/615af097031ac.pdf', 'transript/2021-10/615af09703371.pdf', 2021, '', 'AD', '0050250', 'password/2021-10/615af0970329c.jpg', 2),
(144, 'Islombek', 'Eshmurodov', 'Ozod o\'g\'li', 1, 13, 180, 'Po\'rsang mahalla Charog\'bon ko\'cha 29-uy', '+99897-452-01-79', '+99895-046-16-65', '2003-11-03', 'sodiqovozodbekk@gmail.com', 1, 'uploads/2021-10/615afed152e48.jpg', 1, '2021-10-04 13:17:05', '2021-10-04 13:17:05', 'diplom/2021-10/615afed15345d.pdf', 'transript/2021-10/615afed15362f.pdf', 2021, '', 'AD', '0050250', 'password/2021-10/615afed15354c.pdf', 2),
(145, 'Shoxsanam', 'Atabayeva', 'Maxmudjonovna', 1, 13, 183, 'Sanger 20 uy', '+99891-426-48-50', '+99833-282-10-28', '1995-10-28', 'www102820@gmail.com', 2, 'uploads/2021-10/615b0ee6078d9.pdf', 1, '2021-10-04 14:25:42', '2021-10-04 14:25:42', 'diplom/2021-10/615b0ee607f49.pdf', 'transript/2021-10/615b0ee6083d4.pdf', 2019, 'sertifikat/2021-10/615b0ee6084be.pdf', 'AA', '3916278', 'password/2021-10/615b0ee608054.pdf', 6),
(146, 'Xayrulla', 'Qadamboyev', 'Rasulbek', 1, 13, 175, 'Chandirqiyot', '+99899-957-52-53', '+99833-743-11-91', '2000-11-28', 'xayrulloqadamboyev@gmail.com', 1, 'uploads/2021-10/615b21adc7539.pdf', 1, '2021-10-04 15:45:49', '2021-10-04 15:45:49', 'diplom/2021-10/615b21adc7b6c.pdf', 'transript/2021-10/615b21adc7d54.pdf', 2019, '', 'AB', '7207681', 'password/2021-10/615b21adc7c6b.pdf', 2),
(147, 'Fayzulla', 'Matqurbanov', 'Rajabovich', 1, 13, 174, 'Xosiyon qishloq Jasorat 103', '+99899-961-69-16', '+99890-133-39-35', '1992-01-20', 'fmrking_1992@mail.ru', 1, 'uploads/2021-10/615bf98c5196c.jpg', 1, '2021-10-05 07:06:52', '2021-10-05 07:06:52', 'diplom/2021-10/615bf98c51fc7.pdf', 'transript/2021-10/615bf98c52185.pdf', 2017, '', 'AA', '3631383', 'password/2021-10/615bf98c520ae.pdf', 4),
(148, 'Shodiya ', 'Raximova ', 'Maxmudjonovna ', 1, 13, 173, 'Vazir qishlog\'I Chinorlar 35', '+99897-211-23-66', '+99899-253-97-16', '1997-07-16', 'shodiyaraximova070@mail.com', 2, 'uploads/2021-10/615bfb0977cb2.jpg', 1, '2021-10-05 07:13:13', '2021-10-05 07:13:13', 'diplom/2021-10/615bfb0978337.pdf', 'transript/2021-10/615bfb0978637.pdf', 2020, '', 'AA', '8857925', 'password/2021-10/615bfb09784f0.pdf', 6),
(149, 'Oysara', 'Quchqarova', 'Baxtiyarovna', 1, 13, 182, 'Paxlavon Mahmud 1 uy pr3', '+99894-311-32-85', '+99893-746-99-62', '1976-10-05', 'arslon.jumaniyozov@bk.ru', 2, 'uploads/2021-10/615c41475539a.jpg', 1, '2021-10-05 12:12:55', '2021-10-05 12:12:55', 'diplom/2021-10/615c4147559e7.pdf', 'transript/2021-10/615c414755bb3.pdf', 2019, '', 'AA', '3435112', 'password/2021-10/615c414755ad6.pdf', 7),
(150, 'Shaxodat', 'Matrasulova', 'Zakirovna', 1, 27, 379, 'Xiva tuman Sayot MFY', '+99899-428-94-14', '+99893-092-97-92', '1994-10-14', 'safarboyev1997@bk.ru', 2, 'uploads/2021-10/615c46348876b.pdf', 1, '2021-10-05 12:33:56', '2021-10-05 12:33:56', 'diplom/2021-10/615c463488dd6.pdf', 'transript/2021-10/615c463488f9a.pdf', 2021, '', 'AA', '2128288', 'password/2021-10/615c463488ec2.pdf', 8),
(151, 'Xalima', 'Boltayeva', 'Baxtiyorovna', 1, 27, 376, 'Chakkasholikor QFY Shermatlar MFY Yoshlik ko\'chasi 6-uy', '+99899-683-39-34', '+99893-755-55-35', '1996-07-14', 'khalima.boltayeva@bk.ru', 2, 'uploads/2021-10/615c54b9a6114.jpg', 1, '2021-10-05 13:35:53', '2021-10-05 13:35:53', 'diplom/2021-10/615c54b9a6953.pdf', 'transript/2021-10/615c54b9a6c1f.pdf', 2015, '', 'AA', '7094693', 'password/2021-10/615c54b9a6ad9.pdf', 1),
(152, 'Shaxodat', 'Matrasulova', 'Zakirovna', 1, 27, 379, 'Xiva tuman Sayot MFY', '+99899-428-94-14', '+99893-092-97-92', '1994-10-14', 'safarboyev1997@bk.ru', 2, 'uploads/2021-10/615c670135037.pdf', 1, '2021-10-05 14:53:53', '2021-10-05 14:53:53', 'diplom/2021-10/615c6701356b2.pdf', 'transript/2021-10/615c670135883.pdf', 2021, '', 'AA', '2128288', 'password/2021-10/615c6701357a7.pdf', 8),
(153, 'RAHMONOV', 'DILSHODBEK', 'CHORI O\'G\'LI', 1, 8, 107, 'Boyqishloq MFY', '+99894-262-28-64', '+99894-331-20-31', '2003-05-16', 'hakimodilov683@gmail.com', 1, 'uploads/2021-10/615c682bef1d5.jpg', 1, '2021-10-05 14:58:51', '2021-10-05 14:58:51', 'diplom/2021-10/615c682bef811.docx', 'transript/2021-10/615c682bef9ee.jpg', 2021, '', 'AC', '2312575', 'password/2021-10/615c682bef906.docx', 2),
(154, 'RAHMONOV', 'DILSHODBEK', 'CHORI O\'G\'LI', 1, 22, 308, 'Boyqishloq MFY', '+99894-262-28-64', '+99894-331-20-31', '2003-05-16', 'hakimodilov683@gmail.com', 1, 'uploads/2021-10/615c69b6cc185.jpg', 1, '2021-10-05 15:05:26', '2021-10-05 15:05:26', 'diplom/2021-10/615c69b6cc7c8.docx', 'transript/2021-10/615c69b6cc99a.jpg', 2003, '', 'AC', '2312575', 'password/2021-10/615c69b6cc8bb.docx', 2),
(155, 'Dilshod', 'Egamkulov', 'Normamatovich', 1, 11, 133, 'Fayzullayev kochasi-15', '+99890-035-87-13', '+99897-003-13-40', '1987-03-13', 'm-biologiya@mail.ru', 1, 'uploads/2021-10/615d344d3908e.jpg', 1, '2021-10-06 05:29:49', '2021-10-06 05:29:49', 'diplom/2021-10/615d344d396fd.jpg', 'transript/2021-10/615d344d398dd.jpg', 2009, '', 'AA', '0372360', 'password/2021-10/615d344d397fd.jpg', 7),
(156, 'Dilshod', 'Egamkulov', 'Normamatovich', 1, 25, 334, 'Fayzullayev kochasi-15', '+99890-035-87-13', '+99899-838-41-19', '1987-03-13', 'm-biologiya@mail.ru', 1, 'uploads/2021-10/615d35ab30a84.jpg', 1, '2021-10-06 05:35:39', '2021-10-06 05:35:39', 'diplom/2021-10/615d35ab31122.jpg', 'transript/2021-10/615d35ab31310.jpg', 2009, '', 'AA', '0372360', 'password/2021-10/615d35ab31225.jpg', 3),
(157, 'Abdunabi', ' Bozarov', 'Abdulloxon o\'g\'li', 1, 6, 76, 'Ziyo maskani ko\'cha,22-uy', '+99893-673-91-66', '+99893-673-91-66', '1997-05-29', 'abdunabibozarov2905@gmail.com', 1, 'uploads/2021-10/615d46d89625a.jpg', 1, '2021-10-06 06:48:56', '2021-10-06 06:48:56', 'diplom/2021-10/615d46d8968e9.pdf', 'transript/2021-10/615d46d896c28.pdf', 2021, '', 'AA', '9398899', 'password/2021-10/615d46d896ac5.pdf', 6),
(158, 'Abdunabi', 'Bozarov', 'Abdulloxon o\'g\'li', 1, 6, 76, 'Ziyo maskani ko\'cha,22-uy', '+99893-673-91-66', '+99893-673-91-66', '1997-05-29', 'abdunabibozarov2905@gmail.com', 1, 'uploads/2021-10/615d47ddb13c6.jpg', 1, '2021-10-06 06:53:17', '2021-10-06 06:53:17', 'diplom/2021-10/615d47ddb1a26.pdf', 'transript/2021-10/615d47ddb1bdd.pdf', 2021, '', 'AA', '9398899', 'password/2021-10/615d47ddb1b0b.pdf', 6),
(159, 'MA\'SUD', 'Axmedov', 'Shodiyorovich', 1, 11, 133, 'AMIR TEMUR KO\'CHASI 38 UY', '+99890-112-17-45', '+99890-113-17-45', '2003-08-29', 'axmedov@gmail.com', 1, 'uploads/2021-10/615db9d405f7d.jpg', 1, '2021-10-06 14:59:32', '2021-10-06 14:59:32', 'diplom/2021-10/615db9d4065e1.jpg', 'transript/2021-10/615db9d4067a5.jpg', 2021, 'sertifikat/2021-10/615db9d40687b.jpg', 'AC', '2971272', 'password/2021-10/615db9d4066cd.jpg', 2),
(160, 'Siroj', 'Baxtiyorov', 'Hamdam o\'g\'li', 1, 27, 383, 'O\'zb ovozi 86', '+99890-433-11-62', '+99891-425-51-65', '1997-10-11', 'exxtazzy9595@gmail.com', 1, 'uploads/2021-10/615df753b1345.jpg', 1, '2021-10-06 19:21:55', '2021-10-06 19:21:55', 'diplom/2021-10/615df753b1a78.pdf', 'transript/2021-10/615df753b1c4b.pdf', 2020, '', 'AA', '3290576', 'password/2021-10/615df753b1b71.pdf', 5),
(161, 'Siroj', 'Baxtiyorov', 'Hamdam o\'g\'li', 1, 27, 383, 'O\'zb ovozi 86', '+99890-433-11-62', '+99891-425-51-65', '1997-10-11', 'exxtazzy9595@gmail.com', 1, 'uploads/2021-10/615df8178a85b.jpg', 1, '2021-10-06 19:25:11', '2021-10-06 19:25:11', 'diplom/2021-10/615df8178ae4d.pdf', 'transript/2021-10/615df8178b018.pdf', 2020, '', 'AA', '3290576', 'password/2021-10/615df8178af3e.pdf', 5),
(162, 'UCHQUN', 'RAXIMOV', 'ALIMBAYEVICH', 1, 13, 172, 'URGANCH SHAXAR PROEKTNAYA 173 90/40', '+99899-967-37-38', '+99897-702-92-70', '1985-01-28', 'raximovdostmuxammad@gmail.com', 1, 'uploads/2021-10/615edb8fcaa6d.jpg', 1, '2021-10-07 11:35:43', '2021-10-07 11:35:43', 'diplom/2021-10/615edb8fcb0e1.pdf', 'transript/2021-10/615edb8fcb2b7.pdf', 2014, '', 'AB', '1530585', 'password/2021-10/615edb8fcb1c9.pdf', 6),
(163, 'Jamshid', 'Raximboev', 'Hamidjon o\'g\'li', 1, 13, 173, 'Vazir qishlog\'i, Esabiy mahallasi', '+99888-452-36-37', '', '2000-02-22', 'raximboevjamshid2000@gmail.ru', 1, 'uploads/2021-10/615feb655b878.pdf', 1, '2021-10-08 06:55:33', '2021-10-08 06:55:33', 'diplom/2021-10/615feb655bea9.pdf', 'transript/2021-10/615feb655c09a.pdf', 2019, '', 'AB', '5914880', 'password/2021-10/615feb655bfac.pdf', 1),
(164, 'Nazokat', 'Kalantarova', 'Kadambayevna', 1, 13, 175, 'Ch.Sholikor', '+99893-746-10-35', '', '1984-02-23', '', 2, 'uploads/2021-10/616016edb3e1c.jpg', 1, '2021-10-08 10:01:17', '2021-10-08 10:01:17', 'diplom/2021-10/616016edb4468.pdf', 'transript/2021-10/616016edb462e.pdf', 2005, '', 'AA', '4877674', 'password/2021-10/616016edb4548.pdf', 6),
(165, 'Iroda', 'Sadullayeva', 'Bahrom qizi', 1, 13, 173, 'Bunyodkor 53 uy', '+99893-285-55-16', '', '2001-05-19', '', 1, 'uploads/2021-10/61601f2e2cb19.jpg', 1, '2021-10-08 10:36:30', '2021-10-08 10:36:30', 'diplom/2021-10/61601f2e2d253.jpg', 'transript/2021-10/61601f2e2d42d.jpg', 2019, '', 'AB', '7636755', 'password/2021-10/61601f2e2d34e.jpg', 2),
(166, 'Iroda', 'Sadullayeva', 'Bahrom qizi', 1, 13, 173, 'Bunyodkor 53 uy', '+99893-285-55-16', '', '2001-06-19', '', 2, 'uploads/2021-10/6160219c953ae.jpg', 1, '2021-10-08 10:46:52', '2021-10-08 10:46:52', 'diplom/2021-10/6160219c95a25.jpg', 'transript/2021-10/6160219c95dfb.jpg', 2019, '', 'AB', '7636755', 'password/2021-10/6160219c95c36.jpg', 2),
(167, 'oybek', 'mirzaabdullaev', 'odiljonovich', 1, 6, 72, 'Chodak', '+99899-641-14-44', '+99894-640-07-97', '1997-03-07', 'mirazaabdulayev@bk.ru', 1, 'uploads/2021-10/616026c7ec2d3.jpg', 1, '2021-10-08 11:08:55', '2021-10-08 11:08:55', 'diplom/2021-10/616026c7ec921.pdf', 'transript/2021-10/616026c7ecb0e.pdf', 2016, '', 'AA', '2844181', 'password/2021-10/616026c7eca1a.pdf', 3),
(168, 'Jamshid', 'Raximboyev', 'Hamidjon oʻgʻli', 1, 13, 173, 'Vazir qishlogʻi esabi mahallasi iftixor2 koʻchasi 1-uy', '+99888-452-36-37', '', '2000-02-22', 'raximboyevjamshid2000@gmail.com', 1, 'uploads/2021-10/6160307f2f6d5.pdf', 1, '2021-10-08 11:50:23', '2021-10-08 11:50:23', 'diplom/2021-10/6160307f30012.pdf', 'transript/2021-10/6160307f30250.pdf', 2019, '', 'AB', '5914880', 'password/2021-10/6160307f30139.pdf', 1),
(169, 'Shaxnozabonu', 'Qodirova', 'Omonboyqizi', 1, 13, 174, 'Xosiyon qishloği', '+99899-507-93-18', '+99899-268-09-16', '2002-09-16', 'qodirovashahnozaonu39@gmail.com', 2, 'uploads/2021-10/616060bdc5fd8.jpg', 1, '2021-10-08 15:16:13', '2021-10-08 15:16:13', 'diplom/2021-10/616060bdc65f3.jpg', 'transript/2021-10/616060bdc67a9.jpg', 2020, '', 'AC', '2878670', 'password/2021-10/616060bdc66d7.jpg', 1),
(170, 'Sultonposhsha', 'Atajonova', 'Xudayshukirovna', 1, 13, 182, 'Xorazm viloyat Urganch Shahar PRAEKTNAYA 414A XONADON 170', '+99891-570-87-88', '+99899-967-16-08', '1998-01-09', 'poshsha98@gmail.com', 2, 'uploads/2021-10/6161547ce5734.jpg', 1, '2021-10-09 08:36:12', '2021-10-09 08:36:12', 'diplom/2021-10/6161547ce5d7b.pdf', 'transript/2021-10/6161547ce5f48.pdf', 2020, '', 'AA', '4036281', 'password/2021-10/6161547ce5e6e.pdf', 7),
(171, 'Shoxida', 'Duschanova', 'Baxramovna', 1, 27, 384, 'R.Sharipov 1', '+99891-275-41-18', '+99897-512-12-52', '1987-07-04', 'bnunik9@gmail.com', 2, 'uploads/2021-10/61616aace0d32.pdf', 1, '2021-10-09 10:10:52', '2021-10-09 10:10:52', 'diplom/2021-10/61616aace13ea.pdf', 'transript/2021-10/61616aace1616.pdf', 2011, '', 'AC', '2496852', 'password/2021-10/61616aace1504.pdf', 6),
(172, 'Латофат', 'Бобожонова', 'Давронбек кизи', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61618954efa91.pdf', 1, '2021-10-09 12:21:40', '2021-10-09 12:21:40', 'diplom/2021-10/61618954f00b6.pdf', 'transript/2021-10/61618954f0293.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61618954f0198.pdf', 1),
(173, 'Mahliyo', 'Gulmirzayeva', 'Aminboy qizi', 1, 27, 383, '4 mkr-n 53/3 18 kv', '+99891-572-14-24', '+99894-230-36-00', '2004-11-01', 'abdullayevaminbay0676@mail.ru', 2, 'uploads/2021-10/61618a8f4069a.pdf', 1, '2021-10-09 12:26:55', '2021-10-09 12:26:55', 'diplom/2021-10/61618a8f40c9d.pdf', 'transript/2021-10/61618a8f40e6a.pdf', 2021, '', 'AD', '0265721', 'password/2021-10/61618a8f40d95.pdf', 2),
(174, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/616195b6992b2.pdf', 1, '2021-10-09 13:14:30', '2021-10-09 13:14:30', 'diplom/2021-10/616195b6998dc.pdf', 'transript/2021-10/616195b699aaa.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/616195b6999ce.pdf', 1),
(175, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/616197c308945.pdf', 1, '2021-10-09 13:23:15', '2021-10-09 13:23:15', 'diplom/2021-10/616197c308f70.pdf', 'transript/2021-10/616197c309129.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/616197c30905a.pdf', 1),
(176, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627cc9c75d0.pdf', 1, '2021-10-10 05:40:25', '2021-10-10 05:40:25', 'diplom/2021-10/61627cc9c7bf8.pdf', 'transript/2021-10/61627cc9c7dd1.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627cc9c7cf2.pdf', 2),
(177, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f054b236.pdf', 1, '2021-10-10 05:49:57', '2021-10-10 05:49:57', 'diplom/2021-10/61627f054b854.pdf', 'transript/2021-10/61627f054ba14.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f054b937.pdf', 3),
(178, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f060d751.pdf', 1, '2021-10-10 05:49:58', '2021-10-10 05:49:58', 'diplom/2021-10/61627f060dd7d.pdf', 'transript/2021-10/61627f060df3d.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f060de67.pdf', 3),
(179, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f0659d0c.pdf', 1, '2021-10-10 05:49:58', '2021-10-10 05:49:58', 'diplom/2021-10/61627f065a320.pdf', 'transript/2021-10/61627f065a590.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f065a466.pdf', 3),
(180, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f0669110.pdf', 1, '2021-10-10 05:49:58', '2021-10-10 05:49:58', 'diplom/2021-10/61627f06697e0.pdf', 'transript/2021-10/61627f06699a8.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f06698d3.pdf', 3),
(181, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f076ccc2.pdf', 1, '2021-10-10 05:49:59', '2021-10-10 05:49:59', 'diplom/2021-10/61627f076d2ea.pdf', 'transript/2021-10/61627f076d4e5.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f076d40d.pdf', 3),
(182, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f0809ac0.pdf', 1, '2021-10-10 05:50:00', '2021-10-10 05:50:00', 'diplom/2021-10/61627f080a1bc.pdf', 'transript/2021-10/61627f080a53d.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f080a391.pdf', 3),
(183, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f094e659.pdf', 1, '2021-10-10 05:50:01', '2021-10-10 05:50:01', 'diplom/2021-10/61627f094ec78.pdf', 'transript/2021-10/61627f094ee4e.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f094ed5c.pdf', 3),
(184, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f0ac6a86.pdf', 1, '2021-10-10 05:50:02', '2021-10-10 05:50:02', 'diplom/2021-10/61627f0ac710c.pdf', 'transript/2021-10/61627f0ac72cc.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f0ac71f5.pdf', 3),
(185, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f0bd5964.pdf', 1, '2021-10-10 05:50:03', '2021-10-10 05:50:03', 'diplom/2021-10/61627f0bd5f8d.pdf', 'transript/2021-10/61627f0bd613a.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f0bd6062.pdf', 3),
(186, 'Latofat', 'Bobojonova', 'Davronbek qizi', 1, 13, 176, 'Xorazm viloyati Hazorasp tumani', '+99833-670-67-68', '+99899-964-45-68', '1996-04-15', 'bobojonovalatofat@gmail.com', 2, 'uploads/2021-10/61627f3011d1a.pdf', 1, '2021-10-10 05:50:40', '2021-10-10 05:50:40', 'diplom/2021-10/61627f301234b.pdf', 'transript/2021-10/61627f3012509.pdf', 2015, '', 'AA', '8232682', 'password/2021-10/61627f3012431.pdf', 3),
(187, 'Akmal', 'Rimbayev', 'Qosimboy o\'g\'li', 1, 13, 173, 'Birlashgan qishlog\'i', '+99894-316-77-61', '+99894-311-77-61', '1997-03-06', 'rimboyevakmal97@gmail.com', 1, 'uploads/2021-10/6162afad937dc.pdf', 1, '2021-10-10 09:17:33', '2021-10-10 09:17:33', 'diplom/2021-10/6162afad93dfc.pdf', 'transript/2021-10/6162afad93fc7.pdf', 2021, '', 'AA', '2143968', 'password/2021-10/6162afad93ee7.pdf', 7),
(188, 'Akmal', 'Rimbayev', 'Qosimboy o\'g\'li', 1, 13, 173, 'Birlashgan qishlog\'i', '+99894-316-77-61', '+99894-311-77-61', '1997-03-06', 'rimboyevakmal97@gmail.com', 1, 'uploads/2021-10/6162b6b166a1d.pdf', 1, '2021-10-10 09:47:29', '2021-10-10 09:47:29', 'diplom/2021-10/6162b6b16705e.pdf', 'transript/2021-10/6162b6b167242.pdf', 2021, '', 'AA', '2143968', 'password/2021-10/6162b6b167158.pdf', 7),
(189, 'Sunnatullo', 'Egamberdiyev', 'Qobulovich', 1, 13, 176, 'Muxomon mahallasi ', '+99899-041-36-05', '+99893-284-36-05', '1995-01-04', '', 1, 'uploads/2021-10/6162d6ba27955.jpg', 1, '2021-10-10 12:04:10', '2021-10-10 12:04:10', 'diplom/2021-10/6162d6ba27fb2.pdf', 'transript/2021-10/6162d6ba281bc.pdf', 2021, '', 'AB', '0247671', 'password/2021-10/6162d6ba280af.pdf', 7),
(190, 'Mavlonkek', 'Raximov', 'Dovud o`g`li', 1, 27, 384, 'Qibla tozabog` Mahallasi tosh darvoza ko`chasi 7 uy', '+99890-078-77-17', '+99890-090-03-34', '2001-07-08', 'mavlonrakhimov08@gmail.com', 1, 'uploads/2021-10/6162ded253b38.pdf', 1, '2021-10-10 12:38:42', '2021-10-10 12:38:42', 'diplom/2021-10/6162ded25418d.pdf', 'transript/2021-10/6162ded25435a.pdf', 2019, '', 'AB', '7199619', 'password/2021-10/6162ded254279.pdf', 2),
(191, 'Mavlonkek', 'Raximov', 'Dovud o`g`li', 1, 13, 183, 'Qibla tozabog` Mahallasi tosh darvoza ko`chasi 7 uy', '+99890-078-77-17', '+99890-090-03-34', '2001-07-08', 'mavlonrakhimov08@gmail.com', 1, 'uploads/2021-10/6162dfca0004d.pdf', 1, '2021-10-10 12:42:49', '2021-10-10 12:42:49', 'diplom/2021-10/6162dfca00685.pdf', 'transript/2021-10/6162dfca00994.pdf', 2019, '', 'AB', '7199630', 'password/2021-10/6162dfca0077a.pdf', 3),
(192, 'Mavlonkek', 'Raximov', 'Dovud o`g`li', 1, 27, 384, 'Qibla tozabog` Mahallasi tosh darvoza ko`chasi 7 uy', '+99890-078-77-17', '+99890-090-03-34', '2001-07-08', 'mavlonrakhimov08@gmail.com', 1, 'uploads/2021-10/6162e0808890e.pdf', 1, '2021-10-10 12:45:52', '2021-10-10 12:45:52', 'diplom/2021-10/6162e08088f87.pdf', 'transript/2021-10/6162e08089164.pdf', 2019, '', 'AB', '7199690', 'password/2021-10/6162e0808907f.pdf', 1),
(193, 'Avazjon', 'Saidova', 'Saxibjanovna', 1, 13, 182, 'Amir Temir 145', '+99899-565-29-21', '+99897-856-21-21', '1999-04-21', 'aymiii.saidova@gmail.com', 2, 'uploads/2021-10/616324a9beb1e.jpg', 1, '2021-10-10 17:36:41', '2021-10-10 17:36:41', 'diplom/2021-10/616324a9bf165.jpg', 'transript/2021-10/616324a9bf420.jpg', 2018, '', 'AB', '1055491', 'password/2021-10/616324a9bf331.jpg', 2),
(194, 'Hurrambek', 'Matyakubov', 'Jumaniyozovich', 1, 13, 175, 'Qaychili mahallasi erkinlik 149-uy', '+99899-967-20-96', '+99890-579-34-89', '1996-08-20', 'hurrambek_0372@gmail.com', 1, 'uploads/2021-10/61655bae50eb3.jpg', 1, '2021-10-12 09:55:58', '2021-10-12 09:55:58', 'diplom/2021-10/61655bae6961f.pdf', 'transript/2021-10/61655baeaa88f.pdf', 2019, '', 'AA', '0410106', 'password/2021-10/61655bae837bc.pdf', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `province`
--

INSERT INTO `province` (`id`, `name`, `status`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Andijon viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(2, 'Buxoro viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(3, 'Jizzax viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(4, 'Qashqadaryo viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(5, 'Navoiy viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(6, 'Namangan viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(7, 'Samarqand viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(8, 'Surxondaryo viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(9, 'Sirdaryo viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(10, 'Toshkent shahri', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(11, 'Toshkent viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(12, 'Farg\'ona viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(13, 'Xorazm viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(14, 'Qoraqalpog\'iston Resp.', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(15, 'Andijon viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(16, 'Buxoro viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(17, 'Jizzax viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(18, 'Qashqadaryo viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(19, 'Navoiy viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(20, 'Namangan viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(21, 'Samarqand viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(22, 'Surxondaryo viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(23, 'Sirdaryo viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(24, 'Toshkent shahri', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(25, 'Toshkent viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(26, 'Farg\'ona viloyati', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(27, 'Xorazm viloyati', 1, 1, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(28, 'Qoraqalpog\'iston Resp.', 1, 1, '2021-09-07 16:00:48', '2021-09-07 16:00:48');

-- --------------------------------------------------------

--
-- Структура таблицы `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `regions`
--

INSERT INTO `regions` (`id`, `name`, `status`, `province_id`, `created_at`, `updated_at`) VALUES
(1, 'Oltinko\'l tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(2, 'Andijon tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(3, 'Baliqchi tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(4, 'Bo\'z tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(5, 'Buloqboshi tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(6, 'Jalaquduq tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(7, 'Izboskan tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(8, 'Ulug\'nor tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(9, 'Qo\'rg\'ontepa tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(10, 'Asaka tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(11, 'Marxamat tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(12, 'Shaxrixon tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(13, 'Paxtaobod tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(14, 'Xo\'jaobod tumani', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(15, 'Andijon shahri', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(16, 'Xonobod shahri', 1, 1, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(17, 'Olot tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(18, 'Buxoro tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(19, 'Vobkent tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(20, 'G\'ijduvon tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(21, 'Kogon tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(22, 'Qorako\'l tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(23, 'Qorovulbozor tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(24, 'Peshku tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(25, 'Romitan tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(26, 'Jondor tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(27, 'Shofirkon tumani', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(28, 'Buxoro shahri', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(29, 'Kogon shahri', 1, 2, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(30, 'Arnasoy tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(31, 'Baxmal tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(32, 'G\'allaorol tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(33, 'Sharof Rashidov tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(34, 'Do\'stlik tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(35, 'Zomin tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(36, 'Zarbdor tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(37, 'Mirzacho\'l tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(38, 'Zafarobod tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(39, 'Paxtakor tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(40, 'Forish tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(41, 'Yangiobod tumani', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(42, 'Jizzax shahri', 1, 3, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(43, 'G\'uzor tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(44, 'Dehqonobod tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(45, 'Qamashi tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(46, 'Qarshi tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(47, 'Koson tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(48, 'Kitob tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(49, 'Mirishkor tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(50, 'Muborak tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(51, 'Nishon tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(52, 'Kasbi tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(53, 'Chiroqchi tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(54, 'Shahrisabz tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(55, 'Yakkabog\' tumani', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(56, 'Qarshi shahri', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(57, 'Shaxrisabz shahri', 1, 4, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(58, 'Konimex tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(59, 'Qiziltepa tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(60, 'Navbahor tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(61, 'Karmana tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(62, 'Nurota tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(63, 'Tomdi tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(64, 'Uchquduq tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(65, 'Xatirchi tumani', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(66, 'Navoiy shahri', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(67, 'Zarafshon shahri', 1, 5, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(68, 'Mingbuloq tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(69, 'Kosonsoy tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(70, 'Namangan tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(71, 'Norin tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(72, 'Pop tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(73, 'To\'raqo\'rg\'on tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(74, 'Uychi tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(75, 'Uchqo\'rg\'on tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(76, 'Chortoq tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(77, 'Chust tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(78, 'Yangiqo\'rg\'on tumani', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(79, 'Namangan shahri', 1, 6, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(80, 'Oqdaryo tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(81, 'Bulung\'ur tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(82, 'Jomboy tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(83, 'Ishtixon tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(84, 'Kattaqo\'rg\'on tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(85, 'Qo\'shrabot tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(86, 'Narpay tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(87, 'Payariq tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(88, 'Pastdarg\'om tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(89, 'Paxtachi tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(90, 'Samarqand tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(91, 'Nurobod tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(92, 'Urgut tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(93, 'Tayloq tumani', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(94, 'Samarqand shahri', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(95, 'Kattaqo\'rg\'on shahri', 1, 7, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(96, 'Oltinsoy tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(97, 'Angor tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(98, 'Boysun tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(99, 'Muzrabot tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(100, 'Denov tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(101, 'Jarqo\'rg\'on tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(102, 'Qumqo\'rg\'on tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(103, 'Qiziriq tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(104, 'Sariosiyo tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(105, 'Termiz tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(106, 'Uzun tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(107, 'Sherobod tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(108, 'Sho\'rchi tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(109, 'Bandixon tumani', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(110, 'Termiz shahri', 1, 8, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(111, 'Oqoltin tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(112, 'Boyovut tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(113, 'Sayxunobod tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(114, 'Guliston tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(115, 'Sardoba tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(116, 'Mirzaobod tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(117, 'Sirdaryo tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(118, 'Xovos tumani', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(119, 'Guliston shahri', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(120, 'Shirin shahri', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(121, 'Yangier shahri', 1, 9, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(122, 'Uchtepa tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(123, 'Bektemir tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(124, 'Yunusobod tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(125, 'Mirzo Ulug\'bek tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(126, 'Mirobod tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(127, 'Shayxontoxur tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(128, 'Olmazor tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(129, 'Sirg\'ali tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(130, 'Yakkasaroy tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(131, 'Yashnobod tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(132, 'Chilonzor tumani', 1, 10, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(133, 'Oqqo\'rg\'on tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(134, 'Ohangaron tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(135, 'Bekobod tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(136, 'Bo\'stonliq tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(137, 'Bo\'ka tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(138, 'Quyichirchiq tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(139, 'Zangiota tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(140, 'Yuqorichirchiq tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(141, 'Qibray tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(142, 'Parkent tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(143, 'Pskent tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(144, 'O\'rtachirchiq tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(145, 'Chinoz tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(146, 'Yangiyo\'l tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(147, 'Toshkent tumani', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(148, 'Nurafshon shahri', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(149, 'Olmaliq shahri', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(150, 'Angren shahri', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(151, 'Bekobod shahri', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(152, 'Chirchiq shahri', 1, 11, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(153, 'Oltiariq tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(154, 'Qo\'shtepa tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(155, 'Bog\'dod tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(156, 'Buvayda tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(157, 'Beshariq tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(158, 'Quva tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(159, 'Uchko\'prik tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(160, 'Rishton tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(161, 'So\'x tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(162, 'Toshloq tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(163, 'O\'zbekiston tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(164, 'Farg\'ona tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(165, 'Dang\'ara tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(166, 'Furqat tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(167, 'Yozyovon tumani', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(168, 'Farg\'ona shahri', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(169, 'Qo\'qon shahri', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(170, 'Quvasoy shahri', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(171, 'Marg\'ilon shahri', 1, 12, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(172, 'Bog\'ot tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(173, 'Gurlan tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(174, 'Qo\'shko\'pir tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(175, 'Urganch tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(176, 'Xazorasp tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(177, 'Xonqa tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(178, 'Xiva tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(179, 'Shovot tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(180, 'Yangiariq tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(181, 'Yangibozor tumani', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(182, 'Urganch shahri', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(183, 'Xiva shahri', 1, 13, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(184, 'Amudaryo tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(185, 'Beruniy tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(186, 'Qorao\'zak tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(187, 'Kegeyli tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(188, 'Qo\'ng\'irot tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(189, 'Qanliko\'l tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(190, 'Mo\'ynoq tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(191, 'Nukus tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(192, 'Taxiatosh tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(193, 'Taxtako\'pir tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(194, 'To\'rtko\'l tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(195, 'Xo\'jayli tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(196, 'Chimboy tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(197, 'Shumanay tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(198, 'Ellikkala tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(199, 'Nukus shahri', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(200, 'Taxiatosh shahri', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(201, 'Bo\'zatov tumani', 1, 14, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(202, 'Oltinko\'l tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(203, 'Andijon tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(204, 'Baliqchi tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(205, 'Bo\'z tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(206, 'Buloqboshi tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(207, 'Jalaquduq tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(208, 'Izboskan tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(209, 'Ulug\'nor tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(210, 'Qo\'rg\'ontepa tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(211, 'Asaka tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(212, 'Marxamat tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(213, 'Shaxrixon tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(214, 'Paxtaobod tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(215, 'Xo\'jaobod tumani', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(216, 'Andijon shahri', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(217, 'Xonobod shahri', 1, 15, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(218, 'Olot tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(219, 'Buxoro tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(220, 'Vobkent tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(221, 'G\'ijduvon tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(222, 'Kogon tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(223, 'Qorako\'l tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(224, 'Qorovulbozor tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(225, 'Peshku tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(226, 'Romitan tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(227, 'Jondor tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(228, 'Shofirkon tumani', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(229, 'Buxoro shahri', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(230, 'Kogon shahri', 1, 16, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(231, 'Arnasoy tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(232, 'Baxmal tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(233, 'G\'allaorol tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(234, 'Sharof Rashidov tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(235, 'Do\'stlik tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(236, 'Zomin tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(237, 'Zarbdor tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(238, 'Mirzacho\'l tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(239, 'Zafarobod tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(240, 'Paxtakor tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(241, 'Forish tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(242, 'Yangiobod tumani', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(243, 'Jizzax shahri', 1, 17, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(244, 'G\'uzor tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(245, 'Dehqonobod tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(246, 'Qamashi tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(247, 'Qarshi tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(248, 'Koson tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(249, 'Kitob tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(250, 'Mirishkor tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(251, 'Muborak tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(252, 'Nishon tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(253, 'Kasbi tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(254, 'Chiroqchi tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(255, 'Shahrisabz tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(256, 'Yakkabog\' tumani', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(257, 'Qarshi shahri', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(258, 'Shaxrisabz shahri', 1, 18, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(259, 'Konimex tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(260, 'Qiziltepa tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(261, 'Navbahor tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(262, 'Karmana tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(263, 'Nurota tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(264, 'Tomdi tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(265, 'Uchquduq tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(266, 'Xatirchi tumani', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(267, 'Navoiy shahri', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(268, 'Zarafshon shahri', 1, 19, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(269, 'Mingbuloq tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(270, 'Kosonsoy tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(271, 'Namangan tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(272, 'Norin tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(273, 'Pop tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(274, 'To\'raqo\'rg\'on tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(275, 'Uychi tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(276, 'Uchqo\'rg\'on tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(277, 'Chortoq tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(278, 'Chust tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(279, 'Yangiqo\'rg\'on tumani', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(280, 'Namangan shahri', 1, 20, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(281, 'Oqdaryo tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(282, 'Bulung\'ur tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(283, 'Jomboy tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(284, 'Ishtixon tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(285, 'Kattaqo\'rg\'on tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(286, 'Qo\'shrabot tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(287, 'Narpay tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(288, 'Payariq tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(289, 'Pastdarg\'om tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(290, 'Paxtachi tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(291, 'Samarqand tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(292, 'Nurobod tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(293, 'Urgut tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(294, 'Tayloq tumani', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(295, 'Samarqand shahri', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(296, 'Kattaqo\'rg\'on shahri', 1, 21, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(297, 'Oltinsoy tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(298, 'Angor tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(299, 'Boysun tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(300, 'Muzrabot tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(301, 'Denov tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(302, 'Jarqo\'rg\'on tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(303, 'Qumqo\'rg\'on tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(304, 'Qiziriq tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(305, 'Sariosiyo tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(306, 'Termiz tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(307, 'Uzun tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(308, 'Sherobod tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(309, 'Sho\'rchi tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(310, 'Bandixon tumani', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(311, 'Termiz shahri', 1, 22, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(312, 'Oqoltin tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(313, 'Boyovut tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(314, 'Sayxunobod tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(315, 'Guliston tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(316, 'Sardoba tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(317, 'Mirzaobod tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(318, 'Sirdaryo tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(319, 'Xovos tumani', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(320, 'Guliston shahri', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(321, 'Shirin shahri', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(322, 'Yangier shahri', 1, 23, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(323, 'Uchtepa tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(324, 'Bektemir tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(325, 'Yunusobod tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(326, 'Mirzo Ulug\'bek tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(327, 'Mirobod tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(328, 'Shayxontoxur tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(329, 'Olmazor tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(330, 'Sirg\'ali tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(331, 'Yakkasaroy tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(332, 'Yashnobod tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(333, 'Chilonzor tumani', 1, 24, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(334, 'Oqqo\'rg\'on tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(335, 'Ohangaron tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(336, 'Bekobod tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(337, 'Bo\'stonliq tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(338, 'Bo\'ka tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(339, 'Quyichirchiq tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(340, 'Zangiota tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(341, 'Yuqorichirchiq tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(342, 'Qibray tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(343, 'Parkent tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(344, 'Pskent tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(345, 'O\'rtachirchiq tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(346, 'Chinoz tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(347, 'Yangiyo\'l tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(348, 'Toshkent tumani', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(349, 'Nurafshon shahri', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(350, 'Olmaliq shahri', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(351, 'Angren shahri', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(352, 'Bekobod shahri', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(353, 'Chirchiq shahri', 1, 25, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(354, 'Oltiariq tumani', 1, 26, '2021-09-07 16:00:47', '2021-09-07 16:00:47'),
(355, 'Qo\'shtepa tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(356, 'Bog\'dod tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(357, 'Buvayda tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(358, 'Beshariq tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(359, 'Quva tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(360, 'Uchko\'prik tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(361, 'Rishton tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(362, 'So\'x tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(363, 'Toshloq tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(364, 'O\'zbekiston tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(365, 'Farg\'ona tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(366, 'Dang\'ara tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(367, 'Furqat tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(368, 'Yozyovon tumani', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(369, 'Farg\'ona shahri', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(370, 'Qo\'qon shahri', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(371, 'Quvasoy shahri', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(372, 'Marg\'ilon shahri', 1, 26, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(373, 'Bog\'ot tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(374, 'Gurlan tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(375, 'Qo\'shko\'pir tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(376, 'Urganch tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(377, 'Xazorasp tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(378, 'Xonqa tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(379, 'Xiva tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(380, 'Shovot tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(381, 'Yangiariq tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(382, 'Yangibozor tumani', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(383, 'Urganch shahri', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(384, 'Xiva shahri', 1, 27, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(385, 'Amudaryo tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(386, 'Beruniy tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(387, 'Qorao\'zak tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(388, 'Kegeyli tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(389, 'Qo\'ng\'irot tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(390, 'Qanliko\'l tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(391, 'Mo\'ynoq tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(392, 'Nukus tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(393, 'Taxiatosh tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(394, 'Taxtako\'pir tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(395, 'To\'rtko\'l tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(396, 'Xo\'jayli tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(397, 'Chimboy tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(398, 'Shumanay tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(399, 'Ellikkala tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(400, 'Nukus shahri', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(401, 'Taxiatosh shahri', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48'),
(402, 'Bo\'zatov tumani', 1, 28, '2021-09-07 16:00:48', '2021-09-07 16:00:48');

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `code` varchar(150) DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `form_education` varchar(100) DEFAULT NULL,
  `edu_lang` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id`, `code`, `direction`, `university`, `quota`, `form_education`, `edu_lang`, `duration`, `type`, `created_at`, `updated_at`) VALUES
(1, '5120102', 'Filologiya va tillarni o\'qitish: rus tili', 'Astraxan davlat universiteti', 20, 'kunduzgi', 'rus', '2+2', 'bakalavr', 1631036385, 1631036385),
(2, '5230900', 'Bug\'alteriya hisobi va audit (tarmoqlar bo\'yicha)', 'Astraxan davlat universiteti', 50, 'kunduzgi', 'rus', '2+2', 'bakalavr', 1631036464, 1631036464),
(3, '5340100', 'Аrxitektura (turlari bo\'yicha)', 'Belarus milliy texnika universiteti', 25, 'kunduzgi', 'rus', '2,5+2', 'bakalavr', 1631036519, 1631036519),
(4, '5А120302', 'Tarix (yo\'nalishlar va faoliyat turi bo\'yicha)', 'Аltay davlat universiteti', 6, 'kunduzgi', 'rus', '1+1', 'magistr', 1631036557, 1631036558),
(5, '5А230701', 'Bank ishi (faoliyat turlari bo\'yicha)', 'Astraxan davlat universiteti', 10, 'kunduzgi', 'rus', '1+1', 'magistr', 1631036598, 1631036598),
(6, '5A120201', 'Qiyosiy tilshunoslik, lingvistik tarjimashunoslik (tillar boʼyicha)', 'Astraxan davlat universiteti', 10, 'kunduzgi', 'rus', '1+1', 'magistr', 1631036633, 1631036633),
(7, '5А321001', 'Oziq-ovqat mahsulotlarini ishlab chiqarish va qayta ishlash texnologiyasi (mahsulot turlari bo\'yicha)', 'Mogilev davlat oziq-ovqat universiteti', 20, 'kunduzgi', 'rus', '1+1', 'magistr', 1631036740, 1631036740),
(8, '5A320401', 'Kimyoviy texnologiya (ishlab chiqarish turlari bo ;yicha)', 'Belorusiya davlat texnologik universiteti', 10, 'kunduzgi', 'rus', '1+1', 'magistr', 1631036776, 1631036776);

-- --------------------------------------------------------

--
-- Структура таблицы `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `state`
--

INSERT INTO `state` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Uzbekistan', 10, '2021-09-07 16:00:44', '2021-09-07 16:00:44');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_index_1` (`parent`),
  ADD KEY `departments_index_2` (`created_by`),
  ADD KEY `departments_index_3` (`updated_by`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_index_1` (`section_id`),
  ADD KEY `profile_index_2` (`province_id`),
  ADD KEY `profile_index_3` (`region_id`),
  ADD KEY `profile_index_5` (`gender_id`);

--
-- Индексы таблицы `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_index_1` (`state_id`);

--
-- Индексы таблицы `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_index_1` (`province_id`);

--
-- Индексы таблицы `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT для таблицы `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT для таблицы `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_fk_1` FOREIGN KEY (`parent`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departments_fk_2` FOREIGN KEY (`created_by`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departments_fk_3` FOREIGN KEY (`updated_by`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_fk_1` FOREIGN KEY (`section_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profile_fk_2` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profile_fk_3` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profile_fk_5` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `province_fk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `region_fk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
