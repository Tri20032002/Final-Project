-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 12, 2024 lúc 01:19 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `id_taikhoan` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `noidung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `id_taikhoan`, `id_sanpham`, `noidung`) VALUES
(33, 5, 27, 'very good\r\n'),
(34, 25, 27, 'good');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ctdonhang`
--

CREATE TABLE `ctdonhang` (
  `id` int(11) NOT NULL,
  `id_donhang` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `gia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ctdonhang`
--

INSERT INTO `ctdonhang` (`id`, `id_donhang`, `id_sanpham`, `soluong`, `gia`) VALUES
(64, 56, 27, 1, 18900000),
(77, 66, 40, 1, 13990000),
(78, 66, 38, 1, 18990000),
(80, 68, 36, 1, 9490000),
(81, 68, 43, 1, 11790000),
(82, 68, 30, 1, 16490000),
(83, 68, 39, 1, 21990000),
(84, 69, 27, 2, 18900000),
(85, 70, 28, 1, 11490000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id_dm` int(11) NOT NULL,
  `danhmuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id_dm`, `danhmuc`) VALUES
(1, 'Acer'),
(3, 'HP'),
(5, 'MSI'),
(8, 'Lenovo'),
(9, 'ASUS'),
(21, 'Macbook');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `id_taikhoan` int(11) NOT NULL,
  `tongtien` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `diachi` text DEFAULT NULL,
  `thoigian` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `id_taikhoan`, `tongtien`, `status`, `diachi`, `thoigian`) VALUES
(66, 25, 32980000, 3, ' ', '26-12-2023 11:17:47'),
(68, 24, 59760000, 3, ' ', '26-12-2023 11:27:52'),
(69, 25, 37800000, 1, ' ', '09-01-2024 11:04:13'),
(70, 25, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(100) NOT NULL,
  `id_danhmuc` int(100) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `manhinh` varchar(255) NOT NULL,
  `hedieuhanh` varchar(255) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `gia` int(12) NOT NULL,
  `anh1` text NOT NULL,
  `anh2` text NOT NULL,
  `anh3` text NOT NULL,
  `chitiet` varchar(2500) NOT NULL,
  `mota` varchar(15000) NOT NULL,
  `luotxem` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `id_danhmuc`, `ten`, `manhinh`, `hedieuhanh`, `cpu`, `gia`, `anh1`, `anh2`, `anh3`, `chitiet`, `mota`, `luotxem`, `status`) VALUES
(27, 1, 'Laptop Acer Aspire 5 Gaming', ' 15.6', 'Windows 11 Home SL', 'i5, 13420H, 2.1GHz', 18900000, 'acer a1.jpg', 'acer a2.jpg', 'acer a3.jpg', 'A mid-range gaming laptop model from the Acer brand has just been released at Mobile World, possessing strong performance with high-performance Intel Gen 13 H series chip, 16 GB RAM, RTX discrete card and many more. modern features. Acer Aspire 5 Gaming A515 58GM 51LB i5 13420H Laptop (NX.KQ4SV.002) will definitely bring you great gaming and entertainment experiences.', 'A mid-range gaming laptop model from the Acer brand has just been released at Mobile World, possessing strong performance with high-performance Intel Gen 13 H series chip, 16 GB RAM, RTX discrete card and many more. modern features. Acer Aspire 5 Gaming A515 58GM 51LB i5 13420H Laptop (NX.KQ4SV.002) will definitely bring you great gaming and entertainment experiences.', 79, 0),
(28, 1, 'Laptop Acer Aspire 3 ', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i5, 1135G7, 2.4GHz', 11490000, 'acer b1.jpg', 'acer b2.jpg', 'acer b3.jpg', 'Acer Aspire 3 A315 58 589K i5 1135G7 laptop (NX.AM0SV.008) belongs to the mid-range study-office laptop line introduced by Acer to users with stable configuration parameters, good-looking appearance and especially low cost. affordable.', 'Acer Aspire 3 A315 58 589K i5 1135G7 laptop (NX.AM0SV.008) belongs to the mid-range study-office laptop line introduced by Acer to users with stable configuration parameters, good-looking appearance and especially low cost. affordable.', 11, 0),
(29, 1, 'Laptop Acer Gaming Nitro 5', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', ' i7, 12700H, 2.30 GHz', 25000000, 'acer c1.jpg', 'acer c2.jpg', 'acer c3.jpg', 'Experience the ultimate entertainment thanks to the performance of the high-performance Intel Core i7 H series chip and unique appearance, the Acer Gaming Nitro 5 AN515 58 769J i7 12700H (NH.QFHSV.003) laptop will definitely become your assistant. An effective tool for users in dramatic virtual battlefields or professional office and graphics tasks.', 'Experience the ultimate entertainment thanks to the performance of the high-performance Intel Core i7 H series chip and unique appearance, the Acer Gaming Nitro 5 AN515 58 769J i7 12700H (NH.QFHSV.003) laptop will definitely become your assistant. An effective tool for users in dramatic virtual battlefields or professional office and graphics tasks.', 15, 0),
(30, 1, 'Laptop Acer Aspire 7 Gaming', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', ' Ryzen, 55625U, 2.30 GHz', 16490000, 'acer d1.jpg', 'acer d2.jpg', 'acer d3.jpg', 'A gaming laptop that I believe gamers can easily conquer thanks to its ideal price but equipped with impressive technical specifications, the Acer Aspire 7 Gaming A715 43G R8GA R5 (NH. QHDSV.002) promises to conquer every battlefield with you.', 'A gaming laptop that I believe gamers can easily conquer thanks to its ideal price but equipped with impressive technical specifications, the Acer Aspire 7 Gaming A715 43G R8GA R5 (NH. QHDSV.002) promises to conquer every battlefield with you.', 5, 0),
(32, 3, 'Laptop HP 15s fq5229TU', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i3, 1215U, 1.2GHz', 11000000, 'hp a3.jpg', 'hp a1.jpg', 'hp a2.jpg', 'With an ideal price, you can own a study-office laptop model with stable performance, elegant appearance and modern features. HP 15s fq5229TU i3 1215U (8U237PA) laptop will definitely meet the daily working, studying and entertainment needs of students and employees.', 'With an ideal price, you can own a study-office laptop model with stable performance, elegant appearance and modern features. HP 15s fq5229TU i3 1215U (8U237PA) laptop will definitely meet the daily working, studying and entertainment needs of students and employees.', 3, 0),
(34, 1, 'Laptop Acer Aspire Vero AV15', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i5, 1155G7, 2.5GHz', 12990000, 'acer e3.jpg', 'acer e1.jpg', 'acer e2.jpg', 'Acer Aspire Vero AV15 51 58HB i5 1155G7 Laptop (NX.AYCSV.002) has a modern, sophisticated design and stable performance to smoothly operate all necessary daily tasks. This study-office laptop model is definitely a product you should not miss when choosing a laptop in the low-cost segment.', 'Acer Aspire Vero AV15 51 58HB i5 1155G7 Laptop (NX.AYCSV.002) has a modern, sophisticated design and stable performance to smoothly operate all necessary daily tasks. This study-office laptop model is definitely a product you should not miss when choosing a laptop in the low-cost segment.', 0, 0),
(35, 1, 'Laptop Acer Swift 3', ' 14\", QHD (2160 x 1440)', 'Windows 11 Home SL', ' i5, 1240P, 1.7GHz', 18490000, 'acer g3.jpg', 'acer g2.jpg', 'acer g1.jpg', 'Acer Swift 3 SF314 512 56QN i5 laptop (NX.K0FSV.002) is a formidable rookie in the study-office laptop segment with outstanding power from the advanced Intel Gen 12 chip and unique appearance. Minimalist, modern style.', 'Acer Swift 3 SF314 512 56QN i5 laptop (NX.K0FSV.002) is a formidable rookie in the study-office laptop segment with outstanding power from the advanced Intel Gen 12 chip and unique appearance. Minimalist, modern style.', 0, 0),
(36, 5, 'Laptop MSI Modern 14', '14\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i3, 1115G4, 3GHz', 9490000, 'msi a2.jpg', 'msi a1.jpg', 'msi a3.jpg', 'MSI Modern 14 C11M i3 1115G4 (011VN) Laptop is designed to meet the basic needs of users who need a computer capable of handling study and office tasks with good performance. stable.', 'MSI Modern 14 C11M i3 1115G4 (011VN) Laptop is designed to meet the basic needs of users who need a computer capable of handling study and office tasks with good performance. stable.', 3, 0),
(38, 3, 'Laptop HP Gaming VICTUS 15', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i5, 12450H, 2GHz', 18990000, 'hp e1.jpg', 'hp e2.jpg', 'hp e3.jpg', 'The Gaming Victus line is a unique gaming laptop model from design to performance from HP. With just a mid-range price, you can immediately own the HP Gaming VICTUS 15 fa1139TX i5 12450H (8Y6W3PA) laptop that can smoothly balance games as well as support optimal work.\r\nImpressive entertainment with a 15.6-inch screen with Full HD resolution (1920 x 1080) and IPS panel gives you a large frame, all-encompassing vision, and accurate color reproduction from all angles. Furthermore, the large screen not only helps you enjoy the game but also allows you to conveniently split the window when working.', 'The Gaming Victus line is a unique gaming laptop model from design to performance from HP. With just a mid-range price, you can immediately own the HP Gaming VICTUS 15 fa1139TX i5 12450H (8Y6W3PA) laptop that can smoothly balance games as well as support optimal work.\r\n', 3, 0),
(39, 3, 'Laptop HP Pavilion ', '14\", Full HD, (1920 x 1080)', 'Windows 11 Home SL', 'i5, 1335U, 1.3GHz', 21990000, 'hp g1.jpg', 'hp g2.jpg', 'hp g3.jpg', 'With outstanding performance power from the advanced Intel Gen 13 chip, simple yet modern appearance and unique design, the HP Pavilion X360 14 ek1049TU i5 1335U (80R27PA) laptop will be the perfect choice to meet your needs. Responds well to studying and working tasks as well as watching movies and playing entertainment games.\r\n\"Unique\" 2-in-1 design with 360-degree hinge\r\nThe first thing when looking at this machine is that it is not too different from typical HP Pavilion laptops, the outside is covered in a rose gold tone that is very suitable for girls, the familiar HP logo is covered in gloss. and place it in the middle of the back of the device. ', 'With outstanding performance power from the advanced Intel Gen 13 chip, simple yet modern appearance and unique design, the HP Pavilion X360 14 ek1049TU i5 1335U (80R27PA) laptop will be the perfect choice to meet your needs. Responds well to studying and working tasks as well as watching movies and playing entertainment games.\r\n', 4, 0),
(40, 5, 'Laptop MSI Modern 15', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i5, 1235U, 1.3GHz', 13990000, 'msi b1.jpg', 'msi b2.jpg', 'msi b3.jpg', 'MSI Modern 15 B12MO i5 1235U Laptop (625VN) brings your passion to the pace of a modern, dynamic lifestyle. Whether you are busy in the office or working in the classroom, the new generation Intel Core Alder lake processor will meet all your needs.\r\nIntel Core i5 1235U processor provides impressive performance with a maximum speed of up to 4.4 GHz thanks to Turbo Boost ensuring fast and smooth processing in multitasking tasks, from office work to multimedia processing.', 'MSI Modern 15 B12MO i5 1235U Laptop (625VN) brings your passion to the pace of a modern, dynamic lifestyle. Whether you are busy in the office or working in the classroom, the new generation Intel Core Alder lake processor will meet all your needs.\r\nIntel Core i5 1235U processor provides impressive performance with a maximum speed of up to 4.4 GHz thanks to Turbo Boost ensuring fast and smooth processing in multitasking tasks, from office work to multimedia processing.', 3, 0),
(41, 3, 'Laptop HP 240 G9 i5', '14\", Full HD, (1920 x 1080)', 'Windows 11 Home SL', 'i5, 1235U, 1.3GHz', 14890000, 'hp b1.jpg', 'hp b3.jpg', 'hp b2.jpg', 'If students are looking for a study-office laptop with a luxurious appearance but an affordable price, the HP 240 G9 i5 (6L1Y1PA) laptop is made for you.\r\nPossessing a modern 12th generation Intel Core i5 1235U CPU, this processor has more than enough power to handle Word files several dozen pages long or heavy Excel files, U series CPUs provide outstanding battery saving capabilities for the device. Laptops always accompany you after a long day of studying.', 'If students are looking for a study-office laptop with a luxurious appearance but an affordable price, the HP 240 G9 i5 (6L1Y1PA) laptop is made for you.\r\nPossessing a modern 12th generation Intel Core i5 1235U CPU, this processor has more than enough power to handle Word files several dozen pages long or heavy Excel files, U series CPUs provide outstanding battery saving capabilities for the device. Laptops always accompany you after a long day of studying.', 1, 0),
(42, 3, 'Laptop HP 240 G9 i3', '14\", Full HD, (1920 x 1080)', 'Windows 11 Home SL', 'i3, 1215U, 1.2GHz', 9990000, 'hp d1.jpg', 'hp d2.jpg', 'hp d3.jpg', 'Possessing an elegant, sophisticated appearance, stable performance for multi-tasking and a reasonable price are the advantages that make the HP 240 G9 i3 1215U (6L1X7PA) laptop an ideal study-office laptop. for students and office workers.\r\nSmoothly operate daily office and study multi-tasks on Word, Excel, Canva,.... as well as browse the web, watch movies, listen to music for entertainment thanks to the efficient response from the Intel Core chip i3 1215U and Intel UHD Graphics card.', 'Possessing an elegant, sophisticated appearance, stable performance for multi-tasking and a reasonable price are the advantages that make the HP 240 G9 i3 1215U (6L1X7PA) laptop an ideal study-office laptop. for students and office workers.\r\nSmoothly operate daily office and study multi-tasks on Word, Excel, Canva,.... as well as browse the web, watch movies, listen to music for entertainment thanks to the efficient response from the Intel Core chip i3 1215U and Intel UHD Graphics card.', 0, 0),
(43, 3, 'Laptop HP G10', '14\", Full HD, (1920 x 1080)', 'Windows 11 Home SL', 'Ryzen 5, 7520U, 2.8GHz', 11790000, 'hp h1.jpg', 'hp h2.jpg', 'hp h3.jpg', 'The HP 245 G10 R5 7520U (8F155PA) laptop model can be said to be the god of study-office laptops in its price range with a fairly stable configuration, large storage capacity, and lightweight, especially the ability to upgrade Optimal.\r\nStable, smooth performance on office tasks\r\nThis laptop model from HP is equipped with an AMD Ryzen 5 7520 designed specifically for office workers and students, so with its outstanding advantages, it will bring to this laptop. an ability to handle work well and smoothly in all office tasks such as editing documents, and performing spreadsheets on Word, Excel, etc. ', 'The HP 245 G10 R5 7520U (8F155PA) laptop model can be said to be the god of study-office laptops in its price range with a fairly stable configuration, large storage capacity, and lightweight, especially the ability to upgrade Optimal. Stable, smooth performance on office tasks\r\n\r\n', 3, 0),
(44, 5, 'Laptop MSI Gaming GF63', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i5, 12450H, 2GHz', 20990000, 'msi c1.jpg', 'msi c2.jpg', 'msi c3.jpg', 'MSI Gaming GF63 Thin 12VE i5 12450H Laptop (460VN) is a powerful national gaming laptop from appearance to internal power and especially has a discrete RTX 4050 graphics card that brings superiority in a price range of only approximately 20 million dong. The national gaming laptop with powerful performance in an impressive price range.\r\nIn the price range of 20 million, this machine, in my opinion, possesses a quite powerful processor and is much superior to other machines in the same price range.', 'MSI Gaming GF63 Thin 12VE i5 12450H Laptop (460VN) is a powerful national gaming laptop from appearance to internal power and especially has a discrete RTX 4050 graphics card that brings superiority in a price range of only approximately 20 million dong. The national gaming laptop with powerful performance in an impressive price range.\r\nIn the price range of 20 million, this machine, in my opinion, possesses a quite powerful processor and is much superior to other machines in the same price range.', 0, 0),
(45, 5, 'Laptop MSI Gaming Katana 15 ', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i7, 13620H, 2.4GHz', 25990000, 'msi d1.webp', 'msi d2.webp', 'msi d3.jpg', 'MSI Gaming Katana 15 B13VEK i7 13620H Laptop (252VN) not only possesses a powerful configuration but also has a beautiful rugged design. Equipment such as 13th generation CPU, NVIDIA RTX 40 series graphics card, and 144 Hz screen meet the gaming and graphics processing needs of users.', 'MSI Gaming Katana 15 B13VEK i7 13620H Laptop (252VN) not only possesses a powerful configuration but also has a beautiful rugged design. Equipment such as 13th generation CPU, NVIDIA RTX 40 series graphics card, and 144 Hz screen meet the gaming and graphics processing needs of users.', 0, 0),
(46, 5, 'Laptop MSI Gaming Bravo 15', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'Ryzen 5, 7535HS, 3.3GHz', 16490000, 'msi e1.jpg', 'msi e2.jpg', 'msi e3.jpg', 'MSI Gaming Bravo 15 B7ED R5 7535HS Laptop (010VN) is not only a regular mid-range gaming laptop, but also a reliable companion for gamers and creative enthusiasts. With its bold design, the device becomes a symbol of power and style, promising to create a great experience in every virtual arena.', 'MSI Gaming Bravo 15 B7ED R5 7535HS Laptop (010VN) is not only a regular mid-range gaming laptop, but also a reliable companion for gamers and creative enthusiasts. With its bold design, the device becomes a symbol of power and style, promising to create a great experience in every virtual arena.', 0, 0),
(47, 5, 'Laptop MSI Gaming Cyborg 15', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i7, 12650H, 2.30 GHz', 23990000, 'msi g1.webp', 'msi g3.webp', 'msi g2.webp', 'MSI Cyborg 15 A12VE i7 (240VN) laptop targets gamers and technology enthusiasts when fully equipped with the most advanced features to bring a great experience to users. MSI laptops are equipped with Intel Core i7 12650H processors for powerful performance that can handle multi-tasking smoothly and smoothly operate popular games at high configuration levels. RTX 40 series laptop with NVIDIA GeForce RTX 4050 6 GB graphics card, you will have a gaming and working experience with high resolution and impressive processing speed.', 'MSI Cyborg 15 A12VE i7 (240VN) laptop targets gamers and technology enthusiasts when fully equipped with the most advanced features to bring a great experience to users. ', 0, 0),
(48, 8, 'Laptop Lenovo Ideapad 3', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i3, 1215U, 1.2GHz', 9490000, 'lnv a1.jpg', 'lnv a2.jpg', 'lnv a3.jpg', 'With a balanced price, you can own a laptop for study and office work with stable performance, trendy appearance and many convenient features. Lenovo Ideapad 3 15IAU7 i3 1215U (82RK00RWVN) is a suitable choice, meeting the basic working and entertainment needs of students.', 'With a balanced price, you can own a laptop for study and office work with stable performance, trendy appearance and many convenient features. Lenovo Ideapad 3 15IAU7 i3 1215U (82RK00RWVN) is a suitable choice, meeting the basic working and entertainment needs of students.', 0, 0),
(49, 8, 'Laptop Lenovo Ideapad Slim 3', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i5, 12450H, 2.1GHz', 14690000, 'lnv b1.jpg', 'lnv b2.jpg', 'lnv b3.webp', 'Lenovo Ideapad Slim 3 15IAH8 i5 12450H Laptop (83ER000EVN) is a study-office laptop model with a powerful configuration with Intel H series chip, 16 GB RAM and a variety of modern technologies, promising to bring Users experience working and multimedia entertainment in an optimal and convenient way.', 'Lenovo Ideapad Slim 3 15IAH8 i5 12450H Laptop (83ER000EVN) is a study-office laptop model with a powerful configuration with Intel H series chip, 16 GB RAM and a variety of modern technologies, promising to bring Users experience working and multimedia entertainment in an optimal and convenient way.', 0, 0),
(50, 8, 'Laptop Lenovo Ideapad 5', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'i5, 1235U, 1.3GHz', 12190000, 'lnv c1.webp', 'lnv c2.png', 'lnv c3.jpg', 'Lenovo Ideapad 5 15IAL7 i5 1235U laptop (82SF005HVN) will be a formidable competitor in the study-office laptop segment when possessing outstanding performance power from the Intel Gen 12 processor and elegant appearance, always ready to accompany you everywhere.', 'Lenovo Ideapad 5 15IAL7 i5 1235U laptop (82SF005HVN) will be a formidable competitor in the study-office laptop segment when possessing outstanding performance power from the Intel Gen 12 processor and elegant appearance, always ready to accompany you everywhere.', 0, 0),
(51, 8, 'Laptop Lenovo V14', '14\", Full HD, (1920 x 1080)', 'Windows 11 Home SL', 'Ryzen 5, 5625U, 2.30 GHz', 9990000, 'lnv d1.jpg', 'lnv d2.jpg', 'lnv d3.jpg', 'Providing you with a full experience with work, study or multimedia entertainment activities along with owning an ideal price for students and working people. Lenovo V14 G3 ABA R5 5625U (82TU006SVN) is definitely a great choice for all types of users without needing to consider any additional conditions.', 'Providing you with a full experience with work, study or multimedia entertainment activities along with owning an ideal price for students and working people. Lenovo V14 G3 ABA R5 5625U (82TU006SVN) is definitely a great choice for all types of users without needing to consider any additional conditions.', 0, 0),
(52, 8, 'Laptop Lenovo Ideapad Gaming 3', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'Ryzen 5, 5500H, 3.3GHz', 15990000, 'lnv e1.jpg', 'lnv e2.webp', 'lnv e3.jpeg', 'A hot gaming laptop model with a mid-range price and powerful enough parameters for you to comfortably compete with popular games, serving entertainment or full work. Lenovo Ideapad Gaming 3 15ACH6 R5 5500H Laptop (82K2027PVN) will definitely not disappoint you with its value.', 'A hot gaming laptop model with a mid-range price and powerful enough parameters for you to comfortably compete with popular games, serving entertainment or full work. Lenovo Ideapad Gaming 3 15ACH6 R5 5500H Laptop (82K2027PVN) will definitely not disappoint you with its value.', 0, 0),
(53, 8, 'Laptop Lenovo LOQ Gaming', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i7, 13620H, 2.4GHz', 28990000, 'lnv g1.jpg', 'lnv g2.jpg', 'lnv g3.jpg', 'The super gaming laptop from Lenovo has a huge configuration with Intel i7 Gen 13 chip, RTX 40 series card and attractive aggressive design. Lenovo LOQ Gaming 15IRH8 i7 13620H Laptop (82XV00QXVN) will definitely be a better choice for gamers, bringing hours of top entertainment as well as fully meeting all daily needs. .', 'The super gaming laptop from Lenovo has a huge configuration with Intel i7 Gen 13 chip, RTX 40 series card and attractive aggressive design. Lenovo LOQ Gaming 15IRH8 i7 13620H Laptop (82XV00QXVN) will definitely be a better choice for gamers, bringing hours of top entertainment as well as fully meeting all daily needs. .', 0, 0),
(54, 9, 'Laptop Asus Vivobook Go ', ' 15.6\", Full HD (1920 x 1080)', 'Windows 11 Home SL', 'Ryzen 5, 7520U, 2.8GHz', 12990000, 'asus a1.jpg', 'asus a2.webp', 'asus a3.webp', 'Asus Vivobook Go 15 E1504FA R5 7520U (NJ776W) laptop has a luxurious design, strong performance and versatility, will definitely help you meet all daily work and study tasks effectively. most efficient and professional.\r\nWith the advanced AMD Ryzen 5 - 7520U processor, Asus Vivobook laptop gives you outstanding performance, the fastest response to text editing, web browsing, code running,... Integrated card Powerful AMD Radeon Graphics will help users smoothly perform graphics tasks, watch HD videos, process photos and even play hot games with average graphics levels.', 'Asus Vivobook Go 15 E1504FA R5 7520U (NJ776W) laptop has a luxurious design, strong performance and versatility, will definitely help you meet all daily work and study tasks effectively. most efficient and professional.\r\n', 0, 0),
(55, 9, 'Laptop Asus TUF Gaming F15', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i5, 11400H, 2.7GHz', 16990000, 'asus b1.jpg', 'asus b2.jpg', 'asus b3.jpg', 'With a powerful Intel Core i5 H-series processor and a 4 GB NVIDIA GeForce RTX 2050 discrete graphics card, the Asus TUF Gaming F15 FX506HF laptop is one of the great choices for gamers and multitasking users. services or related to graphics or engineering.\r\nWith an Intel Core i5 11400H processor with a speed of up to 4.5 GHz, this Asus TUF Gaming laptop ensures smooth operation and can handle multitasking tasks well, providing a great user experience in gaming. both work and entertainment, play games at a high configuration level.', 'With a powerful Intel Core i5 H-series processor and a 4 GB NVIDIA GeForce RTX 2050 discrete graphics card, the Asus TUF Gaming F15 FX506HF laptop is one of the great choices for gamers and multitasking users. services or related to graphics or engineering.\r\n', 0, 0),
(56, 9, 'Laptop Asus TUF Gaming F17', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i5, 11400H, 2.7GHz', 18990000, 'asus c1.webp', 'asus c2.jpeg', 'asus c3.jpg', 'Asus TUF Gaming F17 FX706HF i5 11400H Laptop (HX390W) - a gaming laptop from Asus with a cool appearance, impressive high performance packaged in an impressive 18 million price segment, especially with many usage needs. Applications from entertainment to office work or creativity are all \"over-suitable\".', 'Asus TUF Gaming F17 FX706HF i5 11400H Laptop (HX390W) - a gaming laptop from Asus with a cool appearance, impressive high performance packaged in an impressive 18 million price segment, especially with many usage needs. Applications from entertainment to office work or creativity are all \"over-suitable\".', 0, 0),
(57, 9, 'Laptop Asus Zenbook 14', '14\", 2.8K (2880 x 1800) - OLED, 90Hz', 'Windows 11 Home SL', 'i5, 1340P, 1.9GHz', 23990000, 'asus d3.png', 'asus d1.webp', 'asus d2.webp', 'Another high-end laptop model equipped with the 13th generation Intel processor is on sale at Mobile World, which is the Asus Zenbook 14 OLED UX3402VA i5 laptop (KM085W) with youthful design and impressive specifications. .\r\nThe new generation Intel Core i5 1340P processor is improved with Intel Thread Director technology with the ability to automatically direct power sources between P-Core performance cores and P-Core power-saving cores, thereby providing you experience smoother usage.', 'Another high-end laptop model equipped with the 13th generation Intel processor is on sale at Mobile World, which is the Asus Zenbook 14 OLED UX3402VA i5 laptop (KM085W) with youthful design and impressive specifications. .\r\nThe new generation Intel Core i5 1340P processor is improved with Intel Thread Director technology with the ability to automatically direct power sources between P-Core performance cores and P-Core power-saving cores, thereby providing you experience smoother usage.', 0, 0),
(58, 9, 'Laptop Asus Gaming TUF Dash ', ' 15.6\", Full HD (1920 x 1080), 144Hz', 'Windows 11 Home SL', 'i5, 12450H, 2GHz', 20990000, 'asus e1.webp', 'asus e2.jpg', 'asus e3.jpg', 'Asus Gaming TUF Dash F15 FX517ZE i5 (HN045W) Laptop not only conquers all virtual arenas with me thanks to its Intel Gen 12 processor and NVIDIA GeForce RTX 3050 Ti 4 GB discrete graphics card, but is also a graphics laptop - Ideal technicians, ready to assist you in handling all tasks.', 'Asus Gaming TUF Dash F15 FX517ZE i5 (HN045W) Laptop not only conquers all virtual arenas with me thanks to its Intel Gen 12 processor and NVIDIA GeForce RTX 3050 Ti 4 GB discrete graphics card, but is also a graphics laptop - Ideal technicians, ready to assist you in handling all tasks.', 0, 0),
(59, 9, 'Laptop Asus Vivobook 15 OLED', '15.6\", Full HD (1920 x 1080) OLED', 'Windows 11 Home SL', 'i7, 13700H, 2.4GHz', 20990000, 'asus g1.png', 'asus g2.jpg', 'asus g3.webp', 'Asus Vivobook 15 OLED A1505VA i7 13700H (L1338W) laptop with impressive processing performance from high-performance Intel H-series chip, elegant design, modern technology and a preferential price. This graphic-technical laptop model is definitely the perfect choice to meet multiple needs from design processing, work to entertainment for users.', 'Asus Vivobook 15 OLED A1505VA i7 13700H (L1338W) laptop with impressive processing performance from high-performance Intel H-series chip, elegant design, modern technology and a preferential price. This graphic-technical laptop model is definitely the perfect choice to meet multiple needs from design processing, work to entertainment for users.', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `anh` text NOT NULL,
  `mota` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `ten`, `link`, `anh`, `mota`) VALUES
(8, 'Macbook', 'detail.php?id=12', 'banner1x_img.jpg', 'Macbook');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `taikhoan` varchar(55) NOT NULL,
  `matkhau` varchar(50) NOT NULL,
  `hoten` varchar(100) NOT NULL,
  `anh` text NOT NULL,
  `sdt` text NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `phanquyen` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `taikhoan`, `matkhau`, `hoten`, `anh`, `sdt`, `diachi`, `phanquyen`, `status`) VALUES
(5, 'admin', 'admin', 'admin', '11111.jpg', '028.5445.1111', '475A D. Dien Bien Phu, Ward 25, Binh Thanh, Ho Chi Minh City', 1, 0),
(22, 'Demno1@gmail.com', 'Demno1', 'Demno1', 'mac-banner.jpg', '0987654321', 'hcm', 0, 0),
(23, 'bntv.0610@gmail.com', '123456', 'Vii', '', '0788930536', '', 0, 0),
(24, 'nguyentruonghk09@gmail.com', '123456', 'sinh', '', '0333333333', '', 0, 0),
(25, 'sinh@gmail.com', '123', 'sinh1', '', '043235432', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tlbinhluan`
--

CREATE TABLE `tlbinhluan` (
  `id` int(11) NOT NULL,
  `id_binhluan` int(11) NOT NULL,
  `noidung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id sản phẩm` (`id_sanpham`),
  ADD KEY `id tài khoản` (`id_taikhoan`);

--
-- Chỉ mục cho bảng `ctdonhang`
--
ALTER TABLE `ctdonhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_id_donhang` (`id_donhang`),
  ADD KEY `Fk_id_sanpham` (`id_sanpham`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id_dm`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_takhoan` (`id_taikhoan`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id danh mục` (`id_danhmuc`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tlbinhluan`
--
ALTER TABLE `tlbinhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id bình luận` (`id_binhluan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `ctdonhang`
--
ALTER TABLE `ctdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id_dm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `tlbinhluan`
--
ALTER TABLE `tlbinhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `fk_id_sanpham_bl` FOREIGN KEY (`id_sanpham`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `fk_id_taikhoan` FOREIGN KEY (`id_taikhoan`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `ctdonhang`
--
ALTER TABLE `ctdonhang`
  ADD CONSTRAINT `Fk_id_donhang` FOREIGN KEY (`id_donhang`) REFERENCES `donhang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_id_sanpham` FOREIGN KEY (`id_sanpham`) REFERENCES `sanpham` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`id_taikhoan`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `id danh mục` FOREIGN KEY (`id_danhmuc`) REFERENCES `danhmuc` (`id_dm`);

--
-- Các ràng buộc cho bảng `tlbinhluan`
--
ALTER TABLE `tlbinhluan`
  ADD CONSTRAINT `id bình luận` FOREIGN KEY (`id_binhluan`) REFERENCES `binhluan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
