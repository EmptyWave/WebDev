-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 27 2019 г., 16:24
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
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`brand_id`, `name`) VALUES
(1, 'apple'),
(2, 'asus'),
(3, 'dell'),
(4, 'ericsson'),
(5, 'fly'),
(6, 'htc'),
(7, 'huawei'),
(8, 'lenovo'),
(9, 'lg'),
(10, 'meizu'),
(11, 'nokia'),
(12, 'samsung');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `info` varchar(250) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `info`, `price`) VALUES
(1, 'Товар 1', 'Тут информация о товаре 1', 200),
(2, 'Товар 2', 'Тут информация о товаре 2', 300),
(3, 'Товар 3', 'Описание', 230),
(4, 'Товар 4', 'Описание этого товара', 4560),
(20, 'sdfsdf', 'myFirstGood', 1234),
(21, 'sdfsdf', 'myFirstGood', 1234),
(22, 'sdfsdf', 'myFirstGood', 1234),
(23, 'qwerwerwqrwqrwerwq', 'sdfsadf sf ds f df', 130),
(24, 'qwerwerwqrwqrwerwq', 'sdfsadf sf ds f df', 130),
(25, 'qwerwerwqrwqrwerwq', 'sdfsadf sf ds f df', 130),
(26, 'qwerwerwqrwqrwerwq', 'sdfsadf sf ds f df', 130),
(27, '123', '123', 123);

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `img-min` text NOT NULL,
  `img-max` text NOT NULL,
  `about` text NOT NULL,
  `price` double NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`id`, `name`, `img-min`, `img-max`, `about`, `price`, `category_id`) VALUES
(1, 'Mango People T-shirt 1', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(2, 'Mango People T-shirt 2', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(3, 'Mango People T-shirt 3', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(4, 'Mango People T-shirt 4', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(5, 'Mango People T-shirt 5', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(6, 'Mango People T-shirt 6', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(7, 'Mango People T-shirt 7', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(8, 'Mango People T-shirt 8', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(9, 'Mango People T-shirt 9', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(10, 'Mango People T-shirt 10', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(11, 'Mango People T-shirt 11', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(12, 'Mango People T-shirt 12', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(13, 'Mango People T-shirt 13', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(14, 'Mango People T-shirt 14', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(15, 'Mango People T-shirt 15', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(16, 'Mango People T-shirt 16', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(17, 'Mango People T-shirt 17', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(18, 'Mango People T-shirt 18', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(19, 'Mango People T-shirt 19', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(20, 'Mango People T-shirt 20', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(21, 'Mango People T-shirt 21', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(22, 'Mango People T-shirt 22', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(23, 'Mango People T-shirt 23', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(24, 'Mango People T-shirt 24', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(25, 'Mango People T-shirt 25', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(26, 'Mango People T-shirt 26', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(27, 'Mango People T-shirt 27', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(28, 'Mango People T-shirt 28', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(29, 'Mango People T-shirt 29', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(30, 'Mango People T-shirt 30', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(31, 'Mango People T-shirt 31', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(32, 'Mango People T-shirt 32', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(33, 'Mango People T-shirt 33', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(34, 'Mango People T-shirt 34', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(35, 'Mango People T-shirt 35', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(36, 'Mango People T-shirt 36', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(37, 'Mango People T-shirt 37', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(38, 'Mango People T-shirt 38', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(39, 'Mango People T-shirt 39', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(40, 'Mango People T-shirt 40', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(41, 'Mango People T-shirt 41', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(42, 'Mango People T-shirt 42', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(43, 'Mango People T-shirt 43', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(44, 'Mango People T-shirt 44', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(45, 'Mango People T-shirt 45', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(46, 'Mango People T-shirt 46', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(47, 'Mango People T-shirt 47', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(48, 'Mango People T-shirt 48', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(49, 'Mango People T-shirt 49', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(50, 'Mango People T-shirt 50', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(51, 'Mango People T-shirt 51', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(52, 'Mango People T-shirt 52', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(53, 'Mango People T-shirt 53', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(54, 'Mango People T-shirt 54', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(55, 'Mango People T-shirt 55', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(56, 'Mango People T-shirt 56', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(57, 'Mango People T-shirt 57', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(58, 'Mango People T-shirt 58', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(59, 'Mango People T-shirt 59', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(60, 'Mango People T-shirt 60', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(61, 'Mango People T-shirt 61', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(62, 'Mango People T-shirt 62', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(63, 'Mango People T-shirt 63', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(64, 'Mango People T-shirt 64', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(65, 'Mango People T-shirt 65', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(66, 'Mango People T-shirt 66', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(67, 'Mango People T-shirt 67', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(68, 'Mango People T-shirt 68', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(69, 'Mango People T-shirt 69', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(70, 'Mango People T-shirt 70', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(71, 'Mango People T-shirt 71', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(72, 'Mango People T-shirt 72', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(73, 'Mango People T-shirt 73', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(74, 'Mango People T-shirt 74', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(75, 'Mango People T-shirt 75', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(76, 'Mango People T-shirt 76', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(77, 'Mango People T-shirt 77', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(78, 'Mango People T-shirt 78', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(79, 'Mango People T-shirt 79', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(80, 'Mango People T-shirt 80', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(81, 'Mango People T-shirt 81', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(82, 'Mango People T-shirt 82', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(83, 'Mango People T-shirt 83', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(84, 'Mango People T-shirt 84', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(85, 'Mango People T-shirt 85', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(86, 'Mango People T-shirt 86', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(87, 'Mango People T-shirt 87', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(88, 'Mango People T-shirt 88', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(89, 'Mango People T-shirt 89', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(90, 'Mango People T-shirt 90', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(91, 'Mango People T-shirt 91', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(92, 'Mango People T-shirt 92', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(93, 'Mango People T-shirt 93', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(94, 'Mango People T-shirt 94', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(95, 'Mango People T-shirt 95', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(96, 'Mango People T-shirt 96', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6),
(97, 'Mango People T-shirt 97', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.49, 6),
(98, 'Mango People T-shirt 98', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(99, 'Mango People T-shirt 99', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(100, 'Mango People T-shirt 100', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 3.99, 6),
(101, 'Mango People T-shirt 101', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.99, 6),
(102, 'Mango People T-shirt 102', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.49, 6),
(103, 'Mango People T-shirt 103', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.29, 6),
(104, 'Mango People T-shirt 104', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 4.99, 6),
(105, 'Mango People T-shirt 105', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 6.49, 6),
(106, 'Mango People T-shirt 106', 'http://placehold.it/260x220', 'http://placehold.it/360x400', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', 5.99, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(255) NOT NULL,
  `brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `brand_id`) VALUES
(1, 'iPhone 5S', 24277, 1),
(2, 'iPhone 6', 15539, 1),
(3, 'IPhone 6 Plus', 17896, 1),
(4, 'iPhone 6S', 16987, 1),
(5, 'iPhone 6S Plus', 21947, 1),
(6, 'IPhone 7', 5729, 1),
(7, 'IPhone 7 Plus', 28799, 1),
(8, 'iPhone SE', 3637, 1),
(9, 'ZenFone 5', 11897, 2),
(10, 'ZenFone 5 Lite', 19085, 2),
(11, 'ZenFone 6', 14896, 2),
(12, 'ZenFone C ZC451CG', 26005, 2),
(13, 'ZenFone Go', 20562, 2),
(14, 'ZenFone Go ZC500TG', 4219, 2),
(15, 'ZenFone Selfie ZD551KL', 11814, 2),
(16, 'ZenFone Zoom', 5152, 2),
(17, 'Streak 5', 27392, 3),
(18, 'Venue', 9175, 3),
(19, 'R520', 21361, 4),
(20, 'R600', 12373, 4),
(21, 'SH888', 20781, 4),
(22, 'T10S', 6752, 4),
(23, 'T18s', 27155, 4),
(24, 'T20s', 8780, 4),
(25, 'T28s', 15550, 4),
(26, 'T29', 21372, 4),
(27, 'T39', 25806, 4),
(28, 'T65', 10445, 4),
(29, 'T66', 20283, 4),
(30, 'T68', 24239, 4),
(31, 'TH688', 16264, 4),
(32, 'Turbo IQ285', 26122, 5),
(33, 'V09', 10331, 5),
(34, 'V100', 15245, 5),
(35, 'V107', 13582, 5),
(36, 'V150', 21774, 5),
(37, 'V25', 8779, 5),
(38, 'V40', 16965, 5),
(39, 'V60', 5472, 5),
(40, 'W1', 9240, 5),
(41, 'Z300', 24133, 5),
(42, 'Touch Viva', 17564, 6),
(43, 'Touch2', 20528, 6),
(44, 'TyTN', 22715, 6),
(45, 'TyTN II', 6689, 6),
(46, 'TyTN Pro', 25347, 6),
(47, 'Velocity4G', 28563, 6),
(48, 'Wildfire', 23057, 6),
(49, 'Wildfire S', 8514, 6),
(50, 'Windows Phone 8s', 25714, 6),
(51, 'Windows Phone 8x', 20741, 6),
(52, 'u1280', 28038, 7),
(53, 'U7520', 28927, 7),
(54, 'U8110', 26409, 7),
(55, 'U8230', 17362, 7),
(56, 'U8500', 21255, 7),
(57, 'Vision U8850', 14976, 7),
(58, 'Y3 U03', 8154, 7),
(59, 'Y5C', 12448, 7),
(60, 'Y6', 17013, 7),
(61, 'S820', 5407, 8),
(62, 'S930', 3700, 8),
(63, 'Sisley S90', 5829, 8),
(64, 'Vibe P1', 20356, 8),
(65, 'Vibe P1m', 16067, 8),
(66, 'Vibe S1', 23486, 8),
(67, 'Vibe Shot', 17818, 8),
(68, 'Vibe X2 Pro', 24802, 8),
(69, 'Vibe Z', 9157, 8),
(70, 'Vibe Z2', 19911, 8),
(71, 'VX8500', 13904, 9),
(72, 'VX9800', 23829, 9),
(73, 'W3000', 29167, 9),
(74, 'W510', 12278, 9),
(75, 'W5300', 8708, 9),
(76, 'W7000', 15206, 9),
(77, 'W7020', 9599, 9),
(78, 'Wine Smart H410', 21501, 9),
(79, 'X Power K220DS', 11825, 9),
(80, 'Zero H650K', 23451, 9),
(81, 'M8', 6128, 10),
(82, 'M9', 18780, 10),
(83, 'Metal', 8112, 10),
(84, 'MX', 21528, 10),
(85, 'MX2', 22739, 10),
(86, 'MX3', 5140, 10),
(87, 'MX4 Pro', 25093, 10),
(88, 'MX4 Ubuntu Edition', 4479, 10),
(89, 'MX5', 4953, 10),
(90, 'PRO 5', 5048, 10),
(91, 'Pro 6', 21451, 10),
(92, 'U10', 6967, 10),
(93, 'U20', 29397, 10),
(94, 'X2-00', 19494, 11),
(95, 'X2-01', 5220, 11),
(96, 'X2-02', 21752, 11),
(97, 'X2-05', 14633, 11),
(98, 'X3', 28629, 11),
(99, 'X3-02', 13037, 11),
(100, 'X6', 8195, 11),
(101, 'X7', 27367, 11),
(102, 'XL Dual sim', 15012, 11),
(103, 'Z105', 25229, 12),
(104, 'Z130', 5338, 12),
(105, 'Z140', 3007, 12),
(106, 'Z150', 22709, 12),
(107, 'Z350', 26872, 12),
(108, 'Z400', 19898, 12),
(109, 'Z500', 18833, 12),
(110, 'Z510', 9822, 12),
(111, 'Z540', 24467, 12),
(112, 'Z550', 16198, 12),
(113, 'Z700', 5982, 12),
(114, 'Z710', 20295, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `userID` int(11) NOT NULL,
  `review` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `userID`, `review`, `date`) VALUES
(4, 'Admin', 123, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', '2019-02-03 20:59:42'),
(6, 'Admin', 123, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At delectus, doloremque enim ex natus perferendis repellendus sequi voluptates! Consectetur consequatur fuga iste nostrum! Accusantium, impedit, veritatis! Accusantium quasi quisquam ullam.', '2019-02-03 20:59:54'),
(8, 'Admin', 123, '123qwerty', '2019-02-04 23:24:45');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `user_login` varchar(30) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_password`, `user_name`, `user_type`) VALUES
(1, 'demus', '$2y$10$fd2mWDjVXJbucVKZ2/kzjuaX4DqEKW8RKLqrhyQ9Dyn8LUlRrYLxa', 'dima', 1),
(2, 'EmptyWave', '$2y$10$IMx.CSDosqHKvkM69/PQfeTWKbkWVbu4SDP0ZRA/16A5I5sGhuN0u', 'Дмитрий', 9);

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
(2, NULL, '[{\"name\":\"Валерий Федорович НеГусь\",\"phone\":\"+8505656433\",\"address\":\"г.Москва ул.122 д.1452\"}]', '[{\"price\":\"300\",\"name\":\"Товар 2\",\"count\":2},{\"price\":\"230\",\"name\":\"Товар 3\",\"count\":3}]', 4),
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
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_login` (`user_login`);

--
-- Индексы таблицы `zakaz`
--
ALTER TABLE `zakaz`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `zakaz`
--
ALTER TABLE `zakaz`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
