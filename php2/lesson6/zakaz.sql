-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 07 2019 г., 01:47
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
-- База данных: `gbphp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz`
--

CREATE TABLE `zakaz` (
  `order_id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `order_info` text NOT NULL,
  `order_data` text NOT NULL,
  `order_state` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `zakaz`
--

INSERT INTO `zakaz` (`order_id`, `user_id`, `order_info`, `order_data`, `order_state`) VALUES
(1, NULL, '[{\"name\":\"Валерий Федорович Гусь\",\"phone\":\"+7913313133\",\"address\":\"г.Москва ул.123 д.1452\"}]', '[{\"price\":\"300\",\"name\":\"Товар 2\",\"count\":1}]', 2),
(2, NULL, '[{\"name\":\"Валерий Федорович НеГусь\",\"phone\":\"+8505656433\",\"address\":\"г.Москва ул.122 д.1452\"}]', '[{\"price\":\"300\",\"name\":\"Товар 2\",\"count\":2},{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":3}]', 3),
(3, 2, '[{\"name\":\"НеГусь Кто-то Петрович\",\"phone\":\"+9999999999\",\"address\":\"Где-то в Москве\"}]', '[{\"price\":\"130\",\"name\":\"qwerwerwqrwqrwerwq\",\"count\":1},{\"price\":\"123\",\"name\":\"123\",\"count\":1}]', 2),
(4, NULL, '[{\"name\":\"Почти Нормальное ФИО\",\"phone\":\"+78993566265\",\"address\":\"г.Существующий\"}]', '[{\"price\":\"4560\",\"name\":\"Товар 4\",\"count\":2}]', 1),
(7, 0, '[{\"name\":\"asd\",\"phone\":\"asd\",\"address\":\"asd\"}]', '[{\"price\":\"4560\",\"name\":\"Товар 4\",\"count\":1}]', 1),
(8, 1, '[{\"name\":\"34\",\"phone\":\"42\",\"address\":\"24\"}]', '[{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":1}]', 1),
(9, 0, '[{\"name\":\"34\",\"phone\":\"42\",\"address\":\"24\"}]', '[{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":1}]', 1),
(10, 1, '[{\"name\":\"432424\",\"phone\":\"234234\",\"address\":\"242\"}]', '[{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":1}]', 1),
(11, 0, '[{\"name\":\"12345\",\"phone\":\"+asfasfaf\",\"address\":\"afqwfqfaqf\"}]', '[{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":1}]', 1),
(12, 0, '[{\"name\":\"12345\",\"phone\":\"+asfasfaf\",\"address\":\"afqwfqfaqf\"}]', '[{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":1}]', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
