-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: custsqlmoo15
-- Generation Time: Oct 09, 2019 at 09:32 PM
-- Server version: 5.6.41-84.1-log
-- PHP Version: 7.0.33-0ubuntu0.16.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xcreg3`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `ev_name` varchar(25) DEFAULT NULL,
  `ev_date` date DEFAULT NULL,
  `ev_reg_status` varchar(25) DEFAULT 'Open',
  `ev_contact_email` varchar(255) DEFAULT NULL,
  `ev_contact_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `ev_name`, `ev_date`, `ev_reg_status`, `ev_contact_email`, `ev_contact_phone`) VALUES
(4, 'LUTHERAN NATIONAL MS MEET', '2019-10-26', 'Closed', 'purduetom90@gmail.com', '2243555077');

-- --------------------------------------------------------

--
-- Table structure for table `pending_users`
--

CREATE TABLE `pending_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `school_name` varchar(50) NOT NULL,
  `req_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `races`
--

CREATE TABLE `races` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `distance` float(4,2) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'U',
  `description` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `races`
--

INSERT INTO `races` (`id`, `event_id`, `distance`, `sex`, `description`) VALUES
(16, 4, 2.00, 'G', 'GIRL\'S 2.0 MILE RACE'),
(17, 4, 2.00, 'B', 'BOY\'S 2.0 MILE RACE');

-- --------------------------------------------------------

--
-- Table structure for table `runners`
--

CREATE TABLE `runners` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `grade` tinyint(4) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `runners`
--

INSERT INTO `runners` (`id`, `school_id`, `event_id`, `race_id`, `sex`, `grade`, `first_name`, `last_name`) VALUES
(1, 59, 4, 17, 'B', 6, 'OWEN', 'WEEDEN'),
(2, 97, 4, 16, 'G', 6, 'CLAIRE', 'WILLE'),
(3, 97, 4, 16, 'G', 8, 'JOSIE', 'GEHRKE'),
(4, 97, 4, 16, 'G', 8, 'ABBY', 'BOPPRE'),
(5, 97, 4, 16, 'G', 6, 'BRAYLEIGH', 'SUMNER'),
(6, 97, 4, 16, 'G', 7, 'LEAH', 'VIESSELMANN'),
(7, 97, 4, 16, 'G', 5, 'GRACE', 'ZVARRA'),
(8, 97, 4, 16, 'G', 6, 'ELLIE', 'FEDERL'),
(9, 97, 4, 16, 'G', 5, 'ISABELLA', 'BLUMA'),
(10, 97, 4, 16, 'G', 6, 'ANNA', 'HANSEN'),
(11, 76, 4, 16, 'G', 5, 'CORA', 'HALVORSEN'),
(12, 76, 4, 16, 'G', 8, 'LAUREN', 'DAPELO'),
(13, 76, 4, 16, 'G', 5, 'HALEY', 'SHADA'),
(14, 151, 4, 16, 'G', 8, 'CLAIRE', 'OLSON');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`) VALUES
(50, 'ABIDING SAVIOR, ST LOUIS, MO'),
(11, 'BETHANY, NAPERVILLE, IL'),
(51, 'BETHEL, MORTON, IL'),
(52, 'BETHLEHEM, CARSON CITY, NV'),
(131, 'BETHLEHEM, MENOMONEE FALLS, WI'),
(53, 'BETHLEHEM, SHEBOYGAN, WI'),
(54, 'CENTRAL, ST PAUL, MN'),
(55, 'CHRIST COMMUNITY, KIRKWOOD, MO'),
(56, 'CHRIST THE KING, SOUTHGATE, MI'),
(39, 'CHRISTIAN LIBERTY, ALNGTN HTS, IL'),
(57, 'CONCORDIA, PEORIA, IL'),
(2, 'COOPER, BUFFALO GROVE, IL'),
(58, 'CROSS, YORKVILLE, IL'),
(134, 'CROWN OF LIFE CHRISTIAN ACADEMY, FORT ATKINSON, WI'),
(140, 'DECATUR LUTH SCHOOL ASC, DECATUR, IL'),
(143, 'DIVINE REDEEMER, HARTLAND, WI'),
(135, 'EASTSIDE, MADISON, WI'),
(146, 'EMANUEL, HAMBURG, MN'),
(59, 'FIRST IMMANUEL, CEDARBURG, WI'),
(60, 'GRACE, MENOMONEE FALLS, WI'),
(15, 'GRACE, RIVER FOREST, IL'),
(136, 'GUARDIAN LUTH, DEARBORN, MI'),
(61, 'HALES CORNERS LUTHERAN, WI'),
(127, 'IMMANUEL CHRISTIAN ACADEMY, BROKEN ARROW, OK'),
(62, 'IMMANUEL, BATAVIA, IL'),
(63, 'IMMANUEL, BELVIDERE, IL'),
(64, 'IMMANUEL, BROOKFIELD, WI'),
(36, 'IMMANUEL, CRYSTAL LAKE, IL'),
(65, 'IMMANUEL, EAST DUNDEE, IL'),
(66, 'IMMANUEL, MACOMB, MI'),
(4, 'IMMANUEL, PALATINE, IL'),
(67, 'IMMANUEL, SEYMOUR, IN'),
(68, 'IMMANUEL, ST CHARLES, MO'),
(69, 'IMMANUEL, WASHINGTON, MO'),
(70, 'KING OF KINGS, ROSEVILLE, MN'),
(34, 'LATIN SCHOOL OF CHICAGO, IL'),
(137, 'LEBANON, WATERTOWN, WI'),
(3, 'LINCOLN, MT. PROSPECT, IL'),
(150, 'LIONS PARK, MT PROSPECT, IL'),
(42, 'LONDON, BUFFALO GROVE, IL'),
(71, 'LOVING SHEPHERD, MILWAUKEE, WI'),
(72, 'LUTHERRUN, FT WAYNE, IN'),
(73, 'MORNING STAR, JACKSON, WI'),
(74, 'MT CALVARY, WAUKESHA, WI'),
(125, 'OLD ST MARY\'S, CHICAGO'),
(27, 'OUR LADY PERPETUAL HELP, GLNVW, IL'),
(37, 'OUR LADY WAYSIDE, ARLNGTN HTS, IL'),
(75, 'OUR REDEEMER, DELAVAN, WI'),
(76, 'OUR REDEEMER, WAUWATOSA, WI'),
(77, 'OUR SAVIOR, GRAFTON, WI'),
(78, 'OUR SAVIOR, LANSING, MI'),
(79, 'OUR SAVIOR, SPRINGFIELD, IL'),
(80, 'OUR SHEPHERD, AVON, IN'),
(81, 'OUR SHEPHERD, BIRMINGHAM, MI'),
(82, 'PEACE, HARTFORD, WI'),
(147, 'PEACE, SUN PRAIRIE, WI'),
(40, 'QUEST ACADEMY, PALATINE, IL'),
(139, 'REDEEMER CHRISTIAN ACADEMY, WAYZATA, MN'),
(10, 'RIVER TRAILS, MT. PROSPECT, IL'),
(9, 'ROOSEVELT, RIVER FOREST, IL'),
(26, 'SACRED HEART, CHICAGO, IL'),
(13, 'SOUTH, ARLINGTON HEIGHTS, IL'),
(19, 'ST ANDREW\'S, PARK RIDGE, IL'),
(41, 'ST CLEMENT, CHICAGO, IL'),
(8, 'ST EMILY, MT. PROSPECT, IL'),
(83, 'ST JOHN, CAMPBELLSPORT, WI'),
(84, 'ST JOHN, CHAMPAIGN, IL'),
(138, 'ST JOHN, CHASKA, MN'),
(85, 'ST JOHN, CORCORAN, MN'),
(86, 'ST JOHN, ELK RIVER, MN'),
(142, 'ST JOHN, FRASER, MI'),
(7, 'ST JOHN, LOMBARD, IL'),
(87, 'ST JOHN, MUKWONAGO, WI'),
(88, 'ST JOHN, RED BUD, IL'),
(89, 'ST JOHN, ROCHESTER, MI'),
(90, 'ST JOHN, WAUWATOSA, WI'),
(91, 'ST JOHN, WEST BEND, WI'),
(92, 'ST LORENZ, FRANKENMUTH, MI'),
(17, 'ST MARGARET MARY, ALGONQUIN, IL'),
(93, 'ST MARK, GREEN BAY, WI'),
(28, 'ST MARY, WOODSTOCK, IL'),
(149, 'ST MARYS, BUFFALO GROVE, IL'),
(130, 'ST MATTHEW, OCONOMOWOC, WI'),
(94, 'ST MATTHEW, WALLED LAKE, MI'),
(95, 'ST MICHAELS, RICHVILLE, MI'),
(24, 'ST PAUL LUTH, MT. PROSPECT, IL'),
(96, 'ST PAUL, ANN ARBOR, MI'),
(145, 'ST PAUL, EAST TROY, WI'),
(151, 'ST PAUL, FRANKLIN, WI'),
(97, 'ST PAUL, GRAFTON, WI'),
(98, 'ST PAUL, JACKSON, MO'),
(99, 'ST PAUL, JANESVILLE, WI'),
(100, 'ST PAUL, LAKE MILLS, WI'),
(144, 'ST PAUL, MUSKEGO, WI'),
(101, 'ST PAUL, OCONOMOWOC, WI'),
(102, 'ST PAUL, WEST ALLIS, WI'),
(1, 'ST PETER, ARLINGTON HEIGHTS, IL'),
(129, 'ST PETER, COLUMBUS, IN'),
(104, 'ST PETER, EASTPOINTE, MI'),
(14, 'ST PETER, GENEVA, IL'),
(105, 'ST PETER, MACOMB, MI'),
(20, 'ST PETER, SCHAUMBURG, IL'),
(22, 'ST RAYMOND, MT. PROSPECT, IL'),
(106, 'STAR BETHLEHEM, NEW BERLIN, WI'),
(21, 'THOMAS, ARLINGTON HEIGHTS, IL'),
(6, 'TIMOTHY CHRISTIAN, ELMHURST, IL'),
(107, 'TRINITY 1ST, MINNEAPOLIS, MN'),
(108, 'TRINITY ACADEMY, HUDSON, WI'),
(109, 'TRINITY LONE OAK, EAGAN, MN'),
(35, 'TRINITY LUTH, ROSELLE, IL'),
(25, 'TRINITY OAKS CHRISTIAN, CARY, IL'),
(110, 'TRINITY ST LUKE, WATERTOWN, WI'),
(111, 'TRINITY, BLOOMINGTON, IL'),
(148, 'TRINITY, CEDAR RAPIDS, IA'),
(112, 'TRINITY, CLINTON TOWNSHIP,  MI'),
(126, 'TRINITY, DAVENPORT, IA'),
(113, 'TRINITY, EDWARDSVILLE, IL'),
(114, 'TRINITY, JEFFERSON CITY, MO'),
(115, 'TRINITY, MONROE, MI'),
(133, 'TRINITY, REESE, MI'),
(116, 'TRINITY, SHEBOYGAN, ,WI'),
(117, 'TRINITY, STEWARDSON, IL'),
(118, 'TRINITY, UTICA, MI'),
(128, 'TRINITY, WACONIA, MN'),
(119, 'TRINITY, WEST BEND, WI'),
(38, 'WEST LAKE CHRISTIAN, GRAYS LK, IL'),
(120, 'WESTSIDE, MIDDLETON, WI'),
(124, 'WIER HOME SCHOOL BENSENVILLE, IL'),
(121, 'WISCONSIN LUTHERAN, RACINE, WI'),
(122, 'ZION, BELLEVILLE, IL'),
(141, 'ZION, HARTLAND, WI'),
(23, 'ZION, MARENGO, IL'),
(123, 'ZION, ST CHARLES, MO');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `role` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `reset_code` bigint(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `num_logins` int(11) DEFAULT '0',
  `login_date` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `school_id`, `role`, `status`, `email`, `reset_code`, `password`, `num_logins`, `login_date`) VALUES
(0, 0, 'Admin', 'Active', 'admin@admin', 0, '$2y$10$Aab8mtCmbCdUYxg54dRHM./8uCCasj0s8FpRMwtNx/KRxA.m/wfyq', 1, '2019-09-04 21:02:50'),
(1, 0, 'Admin', 'Active', 'purduetom90@gmail.com', 1536619085, '$2y$10$CPiKN.faLkjCG4t4T8Aev.1L.oxbNbwUrLCHGydhVSpPnGT70MQea', 491, '2019-10-09 20:44:07'),
(2, 1, 'NonAdmin', 'Active', 'jeffrey_rodgers@hotmail.com', 0, '$2y$10$z8PJUSdAgFWQh9.ZKG4r8OMrMP0pFeFTc7hYxd6092Ak5EGW/lama', 17, '2019-09-24 21:12:05'),
(5, 6, 'NonAdmin', 'Active', 'snoeyink@timothychristian.com', 0, '$2y$10$o4KCWmbXKPKLheb4Qwmope7LPDcNXDTZv1uIfFJVEdGvxfgvajyCa', 11, '2019-09-28 08:25:06'),
(7, 34, 'NonAdmin', 'Active', 'dvandermeulen@latinschool.org', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(8, 25, 'NonAdmin', 'Active', 'lduzey@trinity-oaks.org', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(9, 7, 'NonAdmin', 'Active', 'tom.kalal@stjohnslombard.org', 0, '$2y$10$N5Nnt1OJnT4Oq0JO3d20bOFupcTMTQ5Grm2wPVAalgUr9zJCOKtoO', 1, '2018-10-12 10:10:22'),
(10, 9, 'NonAdmin', 'Active', 'starrshine7@sbcglobal.net', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(11, 11, 'NonAdmin', 'Active', 'r2kumba@wowway.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(12, 2, 'NonAdmin', 'Active', 'timothy.thiessen@ccsd21.org', 0, '$2y$10$Qc.YJ/W5yoUAngZIq.8mRO5EQ8AWjTa4aOJl31lqP0KCkyTKz528m', 6, '2019-09-30 11:47:24'),
(13, 21, 'NonAdmin', 'Active', 'tricia.moore@d214.org', 0, '$2y$10$4ztdyXhntVVPrs0A0amu8e9Vp/DfF57hKh3Q4msCnzb.jkdfRAdqG', 3, '2018-10-12 10:10:22'),
(14, 24, 'NonAdmin', 'Active', 'eyoung@saint-paul.org', 0, '$2y$10$ovuWejpxAniF5.40so8sdOk4jCIgQeFJDRBQcn4aZnCLeYIBVDVHW', 5, '2019-09-23 16:26:39'),
(15, 14, 'NonAdmin', 'Active', 'torkstaa66@sbcglobal.net', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(16, 19, 'NonAdmin', 'Active', 'aarriazola@sbcglobal.net', 0, '$2y$10$ZaMejepV6aM9vKmbE1DW4eNnG9LgEdFZ6MbX9raA94FVGuvL/AHLe', 3, '2018-10-12 10:10:22'),
(17, 10, 'NonAdmin', 'Active', 'blasoski@rtsd26.org', 0, '$2y$10$XMSpiYtzG0DhI.qSl3sVBelMyO3.wbr/NUYr2WfPW0CetHJ.bzqSq', 13, '2019-09-27 11:18:21'),
(18, 4, 'NonAdmin', 'Active', 'spedtchr300@gmail.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(19, 22, 'NonAdmin', 'Active', 'tomandpadra@comcast.net', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(20, 35, 'NonAdmin', 'Active', 'scheiwerobert@trinityroselle.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(21, 36, 'NonAdmin', 'Active', 'amyshulfer@comcast.net', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(22, 23, 'NonAdmin', 'Active', 'zionathletics@gmail.com', 0, '$2y$10$.QleeB0V7trbL7dZ/6A9rOGTq0TOOwEAuAMm/4yKnO85x1DdktlSi', 7, '2019-09-26 18:30:42'),
(23, 17, 'NonAdmin', 'Active', 'stephenthomas.smmsports@gmail.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(24, 28, 'NonAdmin', 'Active', 'wwstoll@att.net', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(25, 3, 'NonAdmin', 'Active', 'sshaffer@d57.org', 0, '$2y$10$7SqNWds1irLlJGEjkE1kMeOdOeej/2GemubGKSTxUhn4zLMJo5Ity', 7, '2019-09-24 21:19:15'),
(26, 27, 'NonAdmin', 'Active', 'kaksamitowski@olph-il.org', 0, '$2y$10$BxaZt9sGyesHl2NMpFcUbODbNzxvMAY1sfrFjAEZYGUkhpfprLbGe', 9, '2019-09-28 08:51:07'),
(27, 8, 'NonAdmin', 'Active', 'terber1064@gmail.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(28, 37, 'NonAdmin', 'Active', 'athleticdirector@olwschool.org', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(29, 15, 'NonAdmin', 'Active', 'richard.alan.brooks@gmail.com', 0, '$2y$10$SABmVeaxoITQbzIYYJLV2e4h2Zt4o8H3XxCxGtFA.GiLQvy97TEAK', 6, '2018-10-16 13:43:54'),
(30, 13, 'NonAdmin', 'Active', 'dfrintner@sd25.org', 0, '$2y$10$Ekod7MIBAy.CtFAPxgNxK.uGAH7Myp/Fe9XdOxHPSxawbJ5JRjzDq', 1, '2018-10-12 10:10:22'),
(31, 26, 'NonAdmin', 'Active', 'distancestar12@gmail.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(32, 20, 'NonAdmin', 'Active', 'mwilcox@stpeterlcms.org', 0, '$2y$10$myejuPVU6eeyFow7P7HJn.dEJkZZeNdBttS0MBofGCQc/gDEeq6dC', 4, '2019-09-24 08:51:10'),
(34, 38, 'NonAdmin', 'Active', 'kperry@westlakechristian.org', 0, '$2y$10$8ESUp7wzysxuGpLSEiuwce60F1hdk5oox6rOA.FJ2RwhfwTXmLTcC', 2, '2018-10-12 10:10:22'),
(35, 35, 'NonAdmin', 'Active', 'juanita.berdis@trinityroselle.com', 0, '$2y$10$skX4b/gYxKshPI/y.w5.Q.cJXx4gt.ioxP/Te3.AOlxMDwqb9FZZW', 5, '2018-10-14 14:54:52'),
(36, 17, 'NonAdmin', 'Active', 'sas.manaois@comcast.net', 0, '$2y$10$qlh9oMpqd/fQzuzH1de1hOTGWr3vgSZGP97IxanDVlxlgJZGiO7BC', 9, '2018-10-12 10:10:22'),
(37, 14, 'NonAdmin', 'Active', 'bridgetfors44@gmail.com', 0, '$2y$10$EdRny3XNYFi8GwEL5T3T7.I8DCkGV2tqyGThsyzqe7RyXPKWiUqDm', 2, '2019-09-22 21:53:23'),
(38, 39, 'NonAdmin', 'Active', 'natalie.salsgiver@christianliberty.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(39, 9, 'NonAdmin', 'Active', 'starrl@district90.org', 0, '$2y$10$Qeu.zk295woLSLB7LT4pTuxlBqcBXjhdfmFp.oixPpshCTcvZX54a', 9, '2019-09-26 10:09:59'),
(40, 40, 'NonAdmin', 'Active', 'louise.schenck@questacademy.org', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(41, 41, 'NonAdmin', 'Active', 'joan.jablonski@gmail.com', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(42, 42, 'NonAdmin', 'Active', 'laurie.scafidi@ccsd21.org', 0, '$2y$10$t4Zz6TnJF86jMnJGjAVS6OPSxC8goOJT0ZTYw84W9ZyKni6Sy/CUy', 0, '2018-10-12 10:10:22'),
(43, 0, 'Admin', 'Active', 'craig@racelighthouse.com', 0, '$2y$10$cjgrIWJ98U8sUAjpsIBqKOZeLY6P6rVbbmqvwc4biZjmZT0UsA1le', 0, '2018-09-27 14:06:38'),
(46, 57, 'NonAdmin', 'Active', 'amonkemeyer@concordiapeoria.com', 0, '$2y$10$TrrW65NtfhvxGoO1Bu6ILOyAoAcErbcdeWWPnCPnabbHVKDT3tddO', 0, '2018-10-12 10:10:22'),
(47, 56, 'NonAdmin', 'Active', 'andreamcc@rocketmail.com', 0, '$2y$10$e6/VCBXUsVIecNmxQ15svuPcdxWT.9IWKg3To.78Eg7KzBCwk3Meq', 0, '0000-00-00 00:00:00'),
(48, 100, 'NonAdmin', 'Active', 'arndtp@live.com', 0, '$2y$10$W70CtYr8FManMK5Zj6VMW.xNOJ.y7leonAAxjNTHJjSi4jtO7JuHC', 0, '0000-00-00 00:00:00'),
(49, 112, 'NonAdmin', 'Active', 'athletics@trinityct.org', 0, '$2y$10$5U1.EexJhowTRJ/XcTwbWuhsf4zPGuKWUeTeTG6Is/wAR.RjO7TiS', 4, '2018-10-15 09:02:36'),
(50, 55, 'NonAdmin', 'Active', 'balbers@ccls-stlouis.org', 0, '$2y$10$I9PTUZV50A0YoGkW1/2UX.j.QWPZcD5fw7ADLDKirxTdCQKyE1AWe', 2, '2018-10-17 00:45:08'),
(51, 101, 'NonAdmin', 'Active', 'ben@splco.org', 0, '$2y$10$KQs08flMtLfXvQPRt942..OohC9bNCFbgJfOJrl3WvkPuYpmAtnaS', 0, '0000-00-00 00:00:00'),
(52, 82, 'NonAdmin', 'Active', 'bknoeck5@hotmail.com', 0, '$2y$10$BeoKog/U6CdavGwnpf/SuesXAHTBSAnn6FmCGPffpbOTZ8d0Y7GS.', 1, '2018-10-12 22:55:26'),
(54, 101, 'NonAdmin', 'Active', 'brn@splco.org', 0, '$2y$10$fakceI6EHcho1q/kTGm2CeY/W7Mcz0qv21EVmPYxcaXfX/LbworH2', 0, '0000-00-00 00:00:00'),
(56, 97, 'NonAdmin', 'Active', 'celia.shaughnessy@ascension.org', 0, '$2y$10$NsTuw1Ts7OVi5Sy1wzeHq.JVNYaJxD4KuAxtQsyutZ92vElGYbXGa', 0, '0000-00-00 00:00:00'),
(57, 95, 'NonAdmin', 'Active', 'choeppner@stmichaelsrichville.org', 0, '$2y$10$Mz/EZ4X6kAGav0dJ9GT98..9E4o6aN3zMy8DyUULhq/UvbrTzP.gS', 3, '2018-10-14 14:02:53'),
(58, 78, 'NonAdmin', 'Active', 'ckonieczny7@gmail.com', 0, '$2y$10$jomQNlFsB3kXMRYuspdzmOx9T/.OPcxXfXIlq4GL8Gxof.zXdtMk6', 0, '0000-00-00 00:00:00'),
(59, 96, 'NonAdmin', 'Active', 'cohara@stpaulannarbor.org', 0, '$2y$10$k0KBeA4099BwpLZaReY.S.EjGK4404Sg1DBeyrxKUTYoHOklvjS/.', 3, '2018-10-15 08:12:55'),
(60, 73, 'NonAdmin', 'Active', 'conlon30@aol.com', 0, '$2y$10$c3VPsoVk12FP3W2IiKxZ5.9vD03184Xewd5dBiq2od8GKtv.nO1K6', 2, '2018-10-13 22:04:18'),
(61, 98, 'NonAdmin', 'Active', 'corneliuskarla@gmail.com', 0, '$2y$10$62GREO05syynia5sgHWkiOYUL7XxPhPzO9eKHlbJczC/2qBrteUJu', 0, '0000-00-00 00:00:00'),
(62, 90, 'NonAdmin', 'Active', 'dan.ebeling@wlc.edu', 0, '$2y$10$vcaHRGu6UiddgR7bIN/kQu9PhFHJ.V7DftyzUkgcOkcuD5o2xfHQa', 0, '0000-00-00 00:00:00'),
(63, 83, 'NonAdmin', 'Active', 'danjan9@frontier.com', 0, '$2y$10$WTFD.hrl3MwrEHeEJPRGXe6w2ZTDzCm4VFInWrB/m83uPE.UjpPja', 0, '0000-00-00 00:00:00'),
(64, 113, 'NonAdmin', 'Active', 'daveredden50@gmail.com', 0, '$2y$10$s5TQLAuhNisaYSEWXdbRBeAVbZsVXP2I3Tq9QOhhNCr8PK7nEp3XS', 0, '2018-10-12 10:10:22'),
(65, 106, 'NonAdmin', 'Active', 'dbloomquist@starofbethlehem.org', 0, '$2y$10$E2fqNADeAccxvo5AJJ.gRupRokX1Wmbg0/eRNxMH/QS8bbCVfPip6', 1, '2018-10-11 22:01:04'),
(66, 118, 'NonAdmin', 'Active', 'dheck@trinityutica.com', 0, '$2y$10$qr7d5Pe2YV3mzzNe6juQQOe2fNiHkHvzd3nlbSDu3hQhEIlNNz8AC', 0, '0000-00-00 00:00:00'),
(67, 23, 'NonAdmin', 'Active', 'diane.hinck@luthed.org', 0, '$2y$10$5Pl9.8tlIM4Ajcc7DWYFTenUzKl0ADIBWQyyikKA7zynPfX1gFYcS', 0, '2018-10-12 10:10:22'),
(68, 7, 'NonAdmin', 'Active', 'dickerson2105@gmail.com', 0, '$2y$10$sfdmdh651VavSaAMu0Ymte3oMfngmPoZQYiNuEZtSddrDPZZ3HvDq', 2, '2019-09-23 17:20:34'),
(69, 66, 'NonAdmin', 'Active', 'dkirchhoff@immlutheran.org', 0, '$2y$10$CjTz99lfeL7W6zEODuIj2O7Zi5MRGN7KjK.rU71K/CBntvFEFpXry', 0, '0000-00-00 00:00:00'),
(70, 108, 'NonAdmin', 'Active', 'dladuevargas@msn.com', 0, '$2y$10$ErGHa9oHq85nHian2dMJ1u.T5oixPnqPtND2L4eWWWEbheUI3TSjG', 2, '2018-10-19 13:00:43'),
(71, 87, 'NonAdmin', 'Active', 'drkellywolf@gmail.com', 0, '$2y$10$cw6z0/mARF1UZcSlECNX6eC9RgRBY8YWrRYPeeN6oOSNhlvSDnGLG', 3, '2018-10-17 12:05:14'),
(72, 91, 'NonAdmin', 'Active', 'drose@stjohnswestbend.org', 0, '$2y$10$AuAvW1oyZqkmKx/H0iPl6eVXNBNc/AzTaN6qX1JN2yNhttQ3uE/1q', 0, '0000-00-00 00:00:00'),
(73, 59, 'NonAdmin', 'Active', 'eeverts@fils.org', 0, '$2y$10$3ondeG.1fZSBcSb9710Eqe8kw16O/YjsT0s8DsgEsEMc.ypJrH12G', 2, '2019-10-07 10:10:37'),
(74, 85, 'NonAdmin', 'Active', 'erikabeck16@hotmail.com', 0, '$2y$10$bzdetkoB7FtQSbxCEh944O0olQ2PzLsJpZEnfTNIRK6enKOkt54Z6', 0, '0000-00-00 00:00:00'),
(75, 79, 'NonAdmin', 'Active', 'f16ratt@mac.com', 0, '$2y$10$akGhvOIzva0bHAOYiiVr4eC8lZE45JSj.8IAxnzgZ1dK8nBlkelO.', 0, '2018-10-12 10:10:22'),
(76, 50, 'NonAdmin', 'Active', 'gmeier@abidingsaviorlutheran.org', 0, '$2y$10$r4/o4JOd5MmfXRQ5OlHDNOGN77SgBSY5WodhPECLszG4rm3UiefXi', 0, '0000-00-00 00:00:00'),
(77, 74, 'NonAdmin', 'Active', 'grebernick@mountcalvarywaukesha.org', 0, '$2y$10$Seq2YoyeprqQpnVNlEVuUOvkEqr.cbLuiVmxKeNU.CG1jbss/UDdq', 1, '2018-10-12 01:31:59'),
(78, 54, 'NonAdmin', 'Active', 'gundermanns@yahoo.com', 0, '$2y$10$iCXRYil5wD8X/7eZtUlzUuH2QwWM.70sDABpDTpDU9MDJo5H.2IUS', 1, '2018-10-15 01:12:00'),
(79, 107, 'NonAdmin', 'Active', 'iobserver0777@gmail.com', 0, '$2y$10$sDvKNjMRVCnu1FWcjzEJ2egJi9WaNMHbWJJFwRbhYQ8sOt4rcoCJm', 0, '0000-00-00 00:00:00'),
(80, 115, 'NonAdmin', 'Active', 'jboldt@trinitylutheranmonroe.org', 0, '$2y$10$YCp9s/OJdiOB6qUpanNJoOAEKDWnB9GenPKH5pe0UeUpXI5wkwidO', 4, '2018-10-16 14:23:37'),
(81, 71, 'NonAdmin', 'Active', 'jcschopper@yahoo.com', 0, '$2y$10$UzM1P3a48IU6NJOSHf9YhuAIAjLCissO2oMN8SS.lGGh/q4hFIfQ2', 0, '0000-00-00 00:00:00'),
(82, 76, 'NonAdmin', 'Active', 'jenean.cherney@orlctosa.org', 0, '$2y$10$iZ/Rx5M9k0cxLyBN2Gr/le8gQu/JRlJbMl3NrWDXT7l03L47SZHai', 2, '2019-10-08 12:44:36'),
(83, 104, 'NonAdmin', 'Active', 'jfrat974@gmail.com', 0, '$2y$10$wonFQZjUIDgrZawWrigX9u1yfqXqV3miuV2ZTI/KvIMU8dQXtmX3m', 0, '0000-00-00 00:00:00'),
(84, 117, 'NonAdmin', 'Active', 'jgurgel.trinity@gmail.com', 0, '$2y$10$8hHP3VgpaAajrxxMLBdu8e.LQSwUND8mlR5a0sKrVn3oyVpdXraKy', 7, '2018-10-16 17:57:57'),
(85, 92, 'NonAdmin', 'Active', 'jhoard@tds.net', 0, '$2y$10$AU9/Fx/XA7xJIyT8tw0LZOm9kauIhc8HQHI0S3C77PeQc5WpVRjDK', 0, '0000-00-00 00:00:00'),
(86, 51, 'NonAdmin', 'Active', 'jjacob733@gmail.com', 0, '$2y$10$HN5vTRP2dZ2hxXqmhmYdZu17MFmFMDPHg51/0lfTcWIAaJ2ZCHOxW', 3, '2018-10-15 22:35:01'),
(87, 60, 'NonAdmin', 'Active', 'jjelinski@gracemenomoneefalls.org', 0, '$2y$10$iicgm13ExprbjvCxlguuNuBB2xfxBDNmyEfysSXvnCjxksjikc.Bi', 0, '0000-00-00 00:00:00'),
(88, 88, 'NonAdmin', 'Active', 'jkfehr@htc.net', 0, '$2y$10$UdoXaWaQxkzasTnPCPY56Obddnamzr8xEVkbUbjw3ne6q3fvstT/u', 0, '2018-10-12 10:10:22'),
(89, 110, 'NonAdmin', 'Active', 'jmatthies@tslwels.org', 0, '$2y$10$qUx1AtX.HfJntlC8IUGI/O.61B91yQhLPOC5AyNeMIEpCl.aqDwZ.', 3, '2019-10-06 11:52:48'),
(90, 72, 'NonAdmin', 'Active', 'jsmith@esmeagles.com', 0, '$2y$10$V5SfS2rBqKwF46VGVAN0pekEX/ZA0HbzHb1/R5vjes9L/aviyFqNu', 0, '0000-00-00 00:00:00'),
(91, 75, 'NonAdmin', 'Active', 'kcollins@orlcs.org', 0, '$2y$10$EfZ6EH9RrL5VQMW1T77HQOI9LTMGW6d4/.3/6M9XZPpiuvujkJyFO', 0, '0000-00-00 00:00:00'),
(92, 65, 'NonAdmin', 'Active', 'kevinbecker@immanuel-ed.org', 0, '$2y$10$4Nu7OzLFBoYojdfksndLBO.W7TVyvw.PguVxaVvMX7zkeHOT4GUhO', 5, '2019-09-24 11:55:47'),
(93, 84, 'NonAdmin', 'Active', 'kgilbert@stjohnls.com', 0, '$2y$10$RnTzIGxnlGRsKK2SM8pQ8ObJtbEp94CBA3DL63Fi9ZWW.4oOYj/le', 8, '2018-10-16 20:40:31'),
(94, 64, 'NonAdmin', 'Active', 'kkaelberer@immanuelbrookfield.org', 0, '$2y$10$BMpT5vTVLvflMwgBkBj9ZejO.pYu9HGyXu25cPNxVOHL.HHVGlIri', 0, '0000-00-00 00:00:00'),
(95, 105, 'NonAdmin', 'Active', 'kmay@splcs.net', 0, '$2y$10$yDgAiLENz7Z6skTvkQuqIO9ZFjz5N/l.MCw823sAZDt1uDJ4FqFia', 4, '2018-10-17 19:55:41'),
(96, 86, 'NonAdmin', 'Active', 'kuhna001@gmail.com', 0, '$2y$10$39fOEGbE/tagqzTdUVj9Ye2pA7lrko.xsVXqMxd2Ck813ZyakKsE.', 0, '0000-00-00 00:00:00'),
(97, 111, 'NonAdmin', 'Active', 'kurtbusse@trinluth.org', 0, '$2y$10$ThlkM4onlkw54b3hVn8am.MUy/LmHvyOmKZgNvufGydrHgFIkU/2.', 2, '2018-10-16 15:30:13'),
(98, 109, 'NonAdmin', 'Active', 'laura.stennes@tloschool.org', 0, '$2y$10$P0X0MSmO49tWMtYUTfaQM.RSEs15TX6ESDAgAUHYPTeCoevfUkYnC', 0, '0000-00-00 00:00:00'),
(99, 53, 'NonAdmin', 'Active', 'lbajus@excel.net', 0, '$2y$10$LdkmAV0NuaJYAQBpklB8HOadEj58zbWjrv7Iv/kiypm75Nh52anAK', 0, '0000-00-00 00:00:00'),
(100, 93, 'NonAdmin', 'Active', 'linda.maxwell@bellin.org', 0, '$2y$10$Vpjt2fU6aeeWpsaCfCQ5SesZTIaVDU59nSQdsaGcd0A9OOrA2eu7K', 0, '0000-00-00 00:00:00'),
(101, 122, 'NonAdmin', 'Active', 'mark.goerger@illinois.gov', 1539558922, '$2y$10$709foLzllv7PTKEDztMnteAlqFN8ppj9nxvpum.7L9OaKs18f5UOa', 0, '2018-10-14 18:45:22'),
(102, 68, 'NonAdmin', 'Active', 'mdeines3@gmail.com', 0, '$2y$10$IAMM4JgYf5NfID41ZxZZKOEjPo5itFpByFeN/OzjBSZ/y1xyMieX.', 0, '0000-00-00 00:00:00'),
(103, 99, 'NonAdmin', 'Active', 'mfenrick@stpaulsjanesville.com', 0, '$2y$10$x2sA7fcsjJvimlH44NeLOuh0ii2oCKyx6tgUlk3Fc/LpOx6ILViHe', 1, '2018-10-08 21:43:29'),
(104, 94, 'NonAdmin', 'Active', 'millspaugh.jamie@gmail.com', 0, '$2y$10$k/GHQTGZf2EVZ0tEl4ZssOgbpHRfhrbAR.VMA68q1wrBCUPxx3pJy', 1, '2018-10-15 19:39:53'),
(105, 97, 'NonAdmin', 'Active', 'mountainwille@gmail.com', 0, '$2y$10$ObSfhxcD4draeZR3wh.h/OMzDZJhUSGKSkwy27w/xz.jXl/jGd7nS', 4, '2019-10-07 12:16:27'),
(106, 81, 'NonAdmin', 'Active', 'nkelso@ourshepherd.net', 0, '$2y$10$4Nlrz0IPWPvkskqlIcdhYeumZUYdvRft9jH1.2Y9z1mhlsv6bmiGS', 0, '0000-00-00 00:00:00'),
(107, 63, 'NonAdmin', 'Active', 'oettingat@yahoo.com', 0, '$2y$10$JbEXzJmKd1hv9oMqolq8k.wu/BUrUD27rVwUGVMKie6cPDJ622dkW', 0, '2018-10-12 10:10:22'),
(108, 77, 'NonAdmin', 'Active', 'oslsad@oursaviorgrafton.org', 0, '$2y$10$MC9V36ibK0szNPKkMBsTMemr0cBXEdRk2UlF/c0A/uwydbcCp4dxC', 2, '2018-10-09 17:00:32'),
(109, 52, 'NonAdmin', 'Active', 'pastormaschke@gmail.com', 0, '$2y$10$wk79sY9Nof5DefRpZ5LejuH6VUOk1gz.aNYw6Ke.APpt00KNLafty', 4, '2018-10-17 23:26:20'),
(110, 121, 'NonAdmin', 'Active', 'paul.patterson@wlsracine.org', 0, '$2y$10$okZV8angX6InhO0ZbAvU7.w/XK4PGax09dVjpFFmJCeeDd1Lu61tG', 3, '2018-10-11 15:06:52'),
(111, 120, 'NonAdmin', 'Active', 'paulbmanning@yahoo.com', 0, '$2y$10$j1XklJE3h8ude8fdHnEZ9.l.Ad8XhuyEsEx7Kv7TT.fdKhuN/pG1C', 0, '0000-00-00 00:00:00'),
(112, 61, 'NonAdmin', 'Active', 'pdoherty@hcl.org', 0, '$2y$10$iipkWtyG.BFcrfREmY7z8uwOZYciNieFEV2F687JNAJRJZ7foB4PW', 1, '2018-10-11 13:04:04'),
(113, 67, 'NonAdmin', 'Active', 'polosteph@hotmail.com', 0, '$2y$10$TOGW3EFwBVTgAvpE/01MQOcvtcB6nq2xGBUoiGCdTNzfM334EiGt6', 3, '2018-10-01 16:23:19'),
(114, 80, 'NonAdmin', 'Active', 'rachel.burris4@gmail.com', 0, '$2y$10$gNA2d3NwfDkkueS8HyP67.WdAyaMMnI2.I.6Q6Gvoh5D9f9V9Y5Oi', 0, '0000-00-00 00:00:00'),
(115, 77, 'NonAdmin', 'Active', 'raddatbj@gmail.com', 0, '$2y$10$IK3HA.0uJIz6q3lj.0dglOeheIqdTAa3sEgACYMjhpUZqdH6pjFlu', 0, '0000-00-00 00:00:00'),
(116, 123, 'NonAdmin', 'Active', 'reitzjay@gmail.com', 0, '$2y$10$AGdkwRiV5bZgUpNkTtlK/uRHKxDDTcdLYSO/WaNbxPpAFmmtkkdUK', 2, '2018-10-15 22:02:27'),
(117, 78, 'NonAdmin', 'Active', 'rengelbrecht@oursaviorlansing.org', 0, '$2y$10$xSLoK5POiv0q8sPOLvnfX.1uta3p0JqmleXlJtagkC69FQ5LMssae', 2, '2018-10-14 15:31:45'),
(118, 92, 'NonAdmin', 'Active', 'rkknoll@yahoo.com', 0, '$2y$10$fIuDAUwzqkZXqSD4yTZI3eQ8vHg0DLE7Nhro9jkAtYBKMw.rV2k3G', 0, '0000-00-00 00:00:00'),
(119, 92, 'NonAdmin', 'Active', 'rob.e.hayes@gmail.com', 0, '$2y$10$CRl13ZnKW8pMcCWEdrFv6Oryv.uBeJC2soCarlvogWWs3U1lXdnSa', 1, '2018-10-07 10:45:58'),
(120, 70, 'NonAdmin', 'Active', 'robbandtp@hotmail.com', 0, '$2y$10$1sxqs8oECgxuMA.ldC.NdeCHZkTOgV6dzuMtLOuG37nLosce5ZpG6', 1, '2018-10-15 01:32:58'),
(121, 58, 'NonAdmin', 'Active', 'ronningfamily@rocketmail.com', 0, '$2y$10$UDzgUsTWgT4rkjngNSSCXeVPXU3TVQzukHa1i9eWRipJAflvtIe8C', 2, '2018-10-18 14:24:45'),
(122, 36, 'NonAdmin', 'Active', 'runningcoachamy@yahoo.com', 0, '$2y$10$QBX.IWLoQB2SdOIv.vBupenRwVSh4ERIukMIraY14L0zN6hFPcf.K', 0, '2018-10-12 10:10:22'),
(123, 107, 'NonAdmin', 'Active', 'schield.tfl@gmail.com', 0, '$2y$10$GeOyHpMizclw4EouubNf7.HvxzYIKzUfLD/.nLI3WN.0DQ0gXF.5O', 2, '2018-10-16 08:32:40'),
(124, 119, 'NonAdmin', 'Active', 'smmeasner@yahoo.com', 0, '$2y$10$0jyEhy.A9os5qwu1oc.ItO5sufQOQ9fNE/WMiUoGy/e3ZmC4im.C2', 0, '0000-00-00 00:00:00'),
(125, 102, 'NonAdmin', 'Active', 'snmoravec@gmail.com', 0, '$2y$10$mQIiNJ5bkUhs87KDwpDsf.qqk5xYwK8Kc4ix1lUouBQn6CW6M.rJC', 0, '0000-00-00 00:00:00'),
(126, 81, 'NonAdmin', 'Active', 'spanose@ourshepherd.net', 0, '$2y$10$wpAg/3QSeFRJBfqzmBekNOZ7e4.EWhacoVnNKXKnAXrbuIjd32Tui', 2, '2018-10-16 11:08:21'),
(127, 69, 'NonAdmin', 'Active', 'ssprung@mvr3.k12.mo.us', 0, '$2y$10$y5H63USf5ihw2FXhyq41O.Gj/LEkX28DF8fDB6IFCSxNXDDbRqqei', 0, '0000-00-00 00:00:00'),
(128, 116, 'NonAdmin', 'Active', 'stenklyft@trinitysheboygan.org', 0, '$2y$10$KSZNIzi0gZL42pAnIpA4HuAtlaQmioLwq36JpNAlh2Ex73OJ1pw3G', 0, '0000-00-00 00:00:00'),
(129, 89, 'NonAdmin', 'Active', 'tbauer@stjohnrochester.org', 0, '$2y$10$VwZLOExVD5YyUbIsRLDQd.hcBTa9vRynFy2cn0Yb.ZQGqpjALT.6K', 20, '2018-10-20 12:19:09'),
(130, 90, 'NonAdmin', 'Active', 'the_mcevoys@sbcglobal.net', 0, '$2y$10$l5WYJ1LVqtSBfy7tPPBA/e1amo207frpomQKJLXLav2RB0Np5pvkS', 0, '0000-00-00 00:00:00'),
(131, 114, 'NonAdmin', 'Active', 'tkmorris@infin.net', 0, '$2y$10$sG62aZFhuwz0kTuKyvetNOQE5OahU2ikxv.vubn9rkyZdtaRVblWa', 2, '2018-10-16 14:20:36'),
(132, 118, 'NonAdmin', 'Active', 'tsiekmann@trinityutica.com', 0, '$2y$10$EXzEUOhtlPLeKi0rQtEZ5OS8PL0ByS8gPf3ICsAGcMGLDIOFq57Ca', 0, '0000-00-00 00:00:00'),
(133, 62, 'NonAdmin', 'Active', 'wertdl@gmail.com', 0, '$2y$10$70s5Fgnp86enTvAU9WqpxO9f5qRHWqOT/H0fZ..5Q7ism5SlxC7FG', 3, '2018-10-14 19:24:54'),
(134, 11, 'NonAdmin', 'Active', 'r2kumba@gmail.com', 0, '$2y$10$1vxp1tciN77nL9XuVKve8e/OxIGYWXLClkUerOQiRB1sWTpGic7Pe', 8, '2019-09-21 17:39:35'),
(135, 34, 'NonAdmin', 'Active', 'michelleparekh@mac.com', 0, '$2y$10$aPJGf4UYYms.us4j1tbiKuPY5Z2j3Se26FWVqee8Iz89.XdZRlF3m', 3, '2018-10-12 10:10:22'),
(137, 124, 'NonAdmin', 'Active', 'tjwier@gmail.com', 0, '$2y$10$0Oyfwa0fB2sBKH8xEE./eOjwqC8nyDpHwuE0rqqJJl10294XCuNku', 2, '2019-09-12 15:18:30'),
(138, 125, 'NonAdmin', 'Active', 'fit91@sbcglobal.net', 0, '$2y$10$iG5NixCbJ326t4dvfaGs..tp59Kp/ZIRS1yJVWUkKNSQ6Az.nEM3S', 4, '2018-09-28 15:04:06'),
(139, 65, 'NonAdmin', 'Active', 'teacherbecker@hotmail.com', 0, '$2y$10$Hc9MzXvBEDTfJfAHHYqYpOk4BXVXKo6Yiu5zZlSrNla24ipROPsxC', 2, '2018-10-16 09:45:06'),
(140, 4, 'NonAdmin', 'Active', 'cassandergiessen@gmail.com', 0, '$2y$10$2yEpZljXGGCPSZtugkxZpeMyUhmwiJJV2MZPvWTB97Aogygs2.fbq', 10, '2019-09-29 21:01:13'),
(141, 27, 'NonAdmin', 'Active', 'dzimmer@fleetfeetchicago.com', 0, '$2y$10$MUnhJj0tijA1bXX80SJ9XuZ7orOfCRNVvHZVgNfqaDwgYXu33C9Qm', 1, '2018-10-12 10:10:22'),
(142, 8, 'NonAdmin', 'Active', 'bergs96@comcast.net', 0, '$2y$10$/p6MOciVpZmdZF60tv3jfeDEzW2Y3IfST1GDqRe8LeVzg.oBWBmt2', 1, '2018-10-12 10:10:22'),
(143, 21, 'NonAdmin', 'Active', 'mkrzetowski@sd25.org', 0, '$2y$10$VnNfUXmfFyBJn/WivCVVLOEBI5VrZQ03dv68wUQVYGtaVrVq25ige', 3, '2018-10-12 10:10:22'),
(144, 1, 'NonAdmin', 'Active', 'nonadmin@nonadmin', 0, '$2y$10$oBFNOO4nP1ll0h95ZnDg2ecFegoNfzGeIVaX16kdBFGf6.2BFOQAi', 10, '2018-10-12 10:10:22'),
(145, 126, 'NonAdmin', 'Active', 'timothy.leibold@trinitydavenport.org', 1570646806, '$2y$10$rVW8ME0a7LoLmnRa0oI1XucWNlghnClcxr7guw30GvTDDBt6Dvuq6', 3, '2019-10-09 14:16:47'),
(146, 127, 'NonAdmin', 'Active', 'cswaim@icaba.org', 0, '$2y$10$wBgT5/OQ93RB0yR6.Ijoo.FR7x6IvYQAFP8j63yYnqQNAH07KutkC', 1, '2018-10-03 14:31:35'),
(147, 128, 'NonAdmin', 'Active', 'ronanenson@gmail.com', 0, '$2y$10$84wC0EDOUw3Mq3XSp4A93.I0HJ25rgNoLfk.YSWapuTWaYG8idEWO', 3, '2018-10-13 12:57:38'),
(148, 129, 'NonAdmin', 'Active', 'bwb4d1@gmail.com', 0, '$2y$10$Gr/CT/8qsunmrhx6DcI0zuIa4T9lDTDcv8769PFFvm8/p0FxffWl.', 2, '2018-10-08 14:41:29'),
(149, 130, 'NonAdmin', 'Active', 'eziel@smls.org', 0, '$2y$10$SWmBECxTn9RQQWPWTl/1Y.ozYn4r2zb..KrC4pk3Ofp158iklSjUS', 1, '2018-10-07 09:43:14'),
(150, 131, 'NonAdmin', 'Active', 'jschopper@bethlehem-wels.org', 0, '$2y$10$5dhvRXL/bb73IbQV3DlbDeVg2AQMs9ygHemGhLCKd.P581JaVmsgq', 13, '2019-10-07 06:19:16'),
(151, 67, 'NonAdmin', 'Active', 'pmb180@yahoo.com', 0, '$2y$10$VP/5vFAHXj3rIYWaicShae.NdRgqsnnCkpPerDhz6hRvCJwtfnIpS', 1, '2018-10-09 13:03:38'),
(152, 67, 'NonAdmin', 'Active', 'cat221973@hotmail.com', 0, '$2y$10$ITieQyDqsGN5v06oX9Pn/ex8IvoBYia4SGLs9q4UImes4VHocNW0m', 1, '2018-10-09 16:32:54'),
(153, 133, 'NonAdmin', 'Active', 'mreinbold23@gmail.com', 0, '$2y$10$6O7Ywc/CTBS3YBaxDDBbluPOxlTSnfKvZSwFsvYSQWYGtTkBmFwBu', 2, '2018-10-16 09:49:42'),
(154, 93, 'NonAdmin', 'Active', 'michael.w.hennig@gmail.com', 0, '$2y$10$QefTGmIkOCfQ0n72gdSXvuEj4gc5ZRlmNSaQqf3YR3KRwxjrHYdQa', 2, '2018-10-16 14:18:06'),
(155, 134, 'NonAdmin', 'Active', 'jennifer.ertman@crownoflifeacademy.org', 0, '$2y$10$TrgyDcfyBAaVOlBYzVmJHeGvZlLDZm/0XY1amR09D9TeKqXiRYlju', 5, '2018-10-21 17:54:52'),
(156, 90, 'NonAdmin', 'Active', 'kyle.bitter@sjtosa.org', 0, '$2y$10$uYKYj2Ne4ZxWIJDgJnsBr.M/rWGuCINif1XBjgZH1pntU0ZaWeoam', 1, '2018-10-09 23:00:12'),
(157, 135, 'NonAdmin', 'Active', 'kwilson@eastsidelutheran.org', 0, '$2y$10$0XBQYwQ5sacCq7GAxhEd.eA/5LfQWVzEdV/4U7Jg/qFlNpNUep8v2', 2, '2018-10-10 14:49:44'),
(158, 136, 'NonAdmin', 'Active', 'karen.collins@guardianlutheran.org', 0, '$2y$10$ZlC31KVgwZVuwCzQyalIsOUDPpf1Rg5zvM.El/ZjHYymHJHZ988du', 1, '2018-10-12 13:21:49'),
(159, 105, 'NonAdmin', 'Active', 'kmay1080@sbcglobal.net', 0, '$2y$10$699EEz4fVeIZa2Fgb3hzcO9AA/cEE3eG6dvHfiV9giuiYHV0iicgu', 0, '0000-00-00 00:00:00'),
(160, 66, 'NonAdmin', 'Active', 'starkeys@sbcglobal.net', 0, '$2y$10$N73ICG7RGjuTrDzcWHpYvOZHvnic0NYcUhG/puO3R/bQb7fnQopdG', 0, '0000-00-00 00:00:00'),
(161, 66, 'NonAdmin', 'Active', 'tstarkey@immlutheran.org', 0, '$2y$10$OFJfMZpYaPgVpaklQMghSeqAhOPOL3SG2WZC9sUXXJVYBOgrDR4.a', 2, '2018-10-14 13:03:03'),
(162, 137, 'NonAdmin', 'Active', 'witananna@gmail.com', 0, '$2y$10$zrJEiEBKGOUbTQ54yFo76.Q9spAmCJp.qK5dXsNideYa5KlajW.P6', 1, '2018-10-13 13:28:54'),
(163, 138, 'NonAdmin', 'Active', 'jana.beckendorf@stjohns-chaska.org', 0, '$2y$10$JHQP2TDlYJCayYZ/o0QWzu4VSRQf8pcDkUH5wa3Gt1lF42fZEc7uO', 4, '2018-10-16 16:46:11'),
(164, 56, 'NonAdmin', 'Active', 'bvoelz@ctk.me', 0, '$2y$10$ixUJM6tM41P0SpATO7sQ6e7Xhpt7A9G65WiY8DQbEa7EP00jNzU/m', 2, '2018-10-14 14:51:43'),
(165, 68, 'NonAdmin', 'Active', 'cegger@immanuelstcharles.com', 0, '$2y$10$uDJIURxuQ8Fi2FDcUTYPQu.QYkoouP/xoXrb0ygU/EmtCwnkAdmW6', 1, '2018-10-14 19:15:55'),
(166, 68, 'NonAdmin', 'Active', 'cegger@immanuelstcharles.org', 0, '$2y$10$ztsWbx91L5glwoydxEVKc.aIS/RydlfK7JOYrp45madrHDknq37Vy', 2, '2018-10-17 00:47:12'),
(167, 139, 'NonAdmin', 'Active', 'youth@redeemerwayzata.org', 0, '$2y$10$fnAdeijzqFMWPamkkKBWDe9VKmr8.5GZPnecEXyQvuGZYz0p.WgEm', 6, '2018-10-18 13:05:05'),
(168, 140, 'NonAdmin', 'Active', 'aelawsoncb@gmail.com', 0, '$2y$10$CPRUG6rSUeC2oahSa25V8.rgSkBooOA9D5ERcit.4EaO748eI0QlK', 1, '2018-10-14 18:40:26'),
(169, 122, 'NonAdmin', 'Active', 'ygoerger@yahoo.com', 0, '$2y$10$VN5gQIp38z0vx.boVaZKfuu/5Gyy6PDx5BGJDLR5mv.z.qSEzzOB6', 4, '2018-10-18 09:05:43'),
(170, 141, 'NonAdmin', 'Active', 'awendl@sbcglobal.net', 0, '$2y$10$d8ppADLBqD1wro8I2f.o6Ofg2u0rCk.8ujPT65QqiE17iifU2EDJ6', 4, '2018-10-18 12:46:13'),
(171, 88, 'NonAdmin', 'Active', 'jpalm@stjohnsredbud.org', 0, '$2y$10$jqNhOORI8R0H8n7uiMi2Ge8lEdWmUrC9I/c.IkFBhSfBMlY.SV2ku', 1, '2018-10-14 21:54:06'),
(172, 142, 'NonAdmin', 'Active', 'aswazey@stjohnfraser.org', 0, '$2y$10$HL7NZcWSsGzwXD81i/X4J.5GYT8D0kUlDnEstPv0FlehGQ4Ixf2.y', 1, '2018-10-14 22:54:29'),
(173, 143, 'NonAdmin', 'Active', 'angela.bahr@drlc.org', 0, '$2y$10$Vtp8.4tvM3B4xlqFTOHwzOMZzsJGIvyOjMttY5ek2TTzCgVw2ceqa', 2, '2018-10-18 14:27:11'),
(174, 69, 'NonAdmin', 'Active', 'rethemeyer@yahoo.com', 0, '$2y$10$91BhbWSfuxjEAn1eNTIPAuPMfvvodAudACAqL/ZSrhRos/4orb5LG', 3, '2018-10-17 10:42:58'),
(175, 7, 'NonAdmin', 'Active', 'tkalal@sjleagles.com', 0, '$2y$10$EzS4n7qgmRPxFShPCVJEJukS6o/sxmJ9jx1PVap.LvSS7HUQYb0lq', 1, '2018-10-15 12:07:25'),
(176, 109, 'NonAdmin', 'Active', 'school@tloschool.org', 0, '$2y$10$JuqVGuw5IyrmmAOV/LFUle7gw3ZWKW9zK13oDJr59S4RvwxWPHUR2', 2, '2018-10-15 15:02:32'),
(177, 70, 'NonAdmin', 'Active', 'nschmidtke@kingofkingsroseville.org', 0, '$2y$10$6uWkSX/d5Z3YpOKwT1MD7uXL8bhw6zWwLtDqE2Kfz5g3rm3eB3Qdq', 1, '2018-10-16 08:33:28'),
(178, 144, 'NonAdmin', 'Active', 'bills@edstrom.com', 0, '$2y$10$KNppziMcU9A4NQY.XLRBx.2AlGs1yCZQBWRSYIL7Jxy8fAFxWMjpO', 2, '2018-10-15 21:37:54'),
(179, 145, 'NonAdmin', 'Active', 'tclauer@wi.rr.com', 0, '$2y$10$uCZ1GfBRmhy5gtJvRPzvmuHhRno.kynYxHp.P.o16D7zAmauZytf2', 2, '2018-10-15 20:14:06'),
(180, 146, 'NonAdmin', 'Active', 'karjan@bethel.edu', 0, '$2y$10$g8.lbfTW4LSKUUXX//0gpuIY4APYDdVPnKJa.eS0QtZrkzZdgK5ky', 3, '2018-10-20 08:15:09'),
(181, 144, 'NonAdmin', 'Active', 'eazov@wi.rr.com', 0, '$2y$10$qWUYwGThBFc76L7.D1GIlODw55sOSRLS9W5KDmFEa8x2VrNkTZz2O', 3, '2018-10-17 00:10:58'),
(182, 147, 'NonAdmin', 'Active', 'jimmy.pingel@gmail.com', 0, '$2y$10$aBfdv0/MXDq0gQw5.QUZZ.opPwqJKJqdbcVitjFdUG/eBCf9Y7oHO', 1, '2018-10-15 21:58:48'),
(183, 144, 'NonAdmin', 'Active', 'annaedlb@yahoo.com', 1540054952, '$2y$10$Rxl7TZr/Wmng5elDRfHzD.Zw15hcKb1rUVzrYK/RqgWqdKHRyTjAu', 1, '2018-10-20 12:32:32'),
(184, 148, 'NonAdmin', 'Active', 'muellerm@trinitycr.org', 0, '$2y$10$CyKiRa6A8YfIZXDdXP3PFehkhENtnyoQ5gz4qmWtDm4idyIU0M6C2', 1, '2018-10-16 14:35:06'),
(185, 67, 'NonAdmin', 'Active', 'damonwcampbell@gmail.com', 0, '$2y$10$ZhtaILJ/PpMDV0JlIaMQmeFcqoDzCxz3wu1YeLAp4x7agI/amr7wK', 1, '2018-10-16 21:16:19'),
(186, 1, 'NonAdmin', 'Active', 'thomas.hoffman@infinite.com', 0, '$2y$10$3WLjc8s0mtAJO/q7WwdDG.RPL28Y4cbBKZXFOPYgbXkYLamZTsPkm', 2, '2019-10-09 15:47:58'),
(187, 149, 'NonAdmin', 'Active', 'crosscountry@stmarybg.org', 0, '$2y$10$PLwN3/6AEwdlQp/2Gc1/Ce98fWcHuRQdPhyapu4lwZwnUgvoaU6wW', 0, '2019-08-28 12:22:10'),
(188, 150, 'NonAdmin', 'Active', 'mskelton1@aol.com', 0, '$2y$10$Y85/ILIDvsbXoYXUpR1vP.8r84kdY5fZE3.iFS.CDzJd9PaJ3NLZm', 2, '2019-09-04 16:18:05'),
(189, 58, 'NonAdmin', 'Active', 'daffyrn@msn.com', 0, '$2y$10$w0aIt.OewySZDrHIpRTd3u2AsApaDaxv5MWylOeYTsVYcq610r/.u', 7, '2019-09-28 19:14:16'),
(190, 17, 'NonAdmin', 'Active', 'saintmargaretmaryad@gmail.com', 0, '$2y$10$lmKoPrnEOqhHCk3z3OjlCejFugv0Nz/nT/LOTnzk30EbehX8hYeuC', 15, '2019-09-29 18:51:17'),
(191, 35, 'NonAdmin', 'Active', 'sydni.schmelter@trinityroselle.com', 0, '$2y$10$qYVPCk0nUn7JbANhVTPh8e6Q5WiPGPyarAQbTyXu/R2y57oWqbb0S', 2, '2019-09-23 09:18:21'),
(192, 13, 'NonAdmin', 'Active', 'svassos@sd25.org', 0, '$2y$10$S/E4YtAMDvf4Xtz.2Y9ROOv6vyn3it8IWJUmh7JTKTYQH1XiS/3oW', 6, '2019-09-28 22:44:35'),
(193, 19, 'NonAdmin', 'Active', 'mkress@standrewslutheranschool.org', 0, '$2y$10$UDUilXomWaa58aVRXWNfO.rmXaH9KkyFxZ9czyyQuCv8V/RAfTTk.', 2, '2019-09-23 13:49:13'),
(194, 15, 'NonAdmin', 'Active', 'kwashburn@graceriverforest.org', 0, '$2y$10$9i4VbVxF7cL9bAuPLoDjq.dtxyoqR5a1mg9J.OhR0f3DDQrUqu7cS', 3, '2019-09-27 09:39:33'),
(195, 40, 'NonAdmin', 'Active', 'lorena.diaz@questacademy.org', 0, '$2y$10$V8frpk79oftFQvmP0poUE.r4PkYcjOdBNKG6bWktqKXlMvBAqHnQe', 3, '2019-09-26 13:17:39'),
(196, 128, 'NonAdmin', 'Active', 'njeffries@trinitywaconia.org', 0, '$2y$10$Dg29tKfQsyDxus7d5.74UuZe7Bk1p292qs2TEmgo.FEZq2BXY/Wau', 0, '0000-00-00 00:00:00'),
(197, 151, 'NonAdmin', 'Active', 'stephaniejegen@aol.com', 0, '$2y$10$4YwyPMw1eECH3nAMuuhIW.EvzFWcu/Ha14hHIJ2g8tAnFM6JZKnxq', 1, '2019-10-08 09:42:47'),
(198, 82, 'NonAdmin', 'Active', 'jennilauer@gmail.com', 0, '$2y$10$/7rClr89rcs4gYYrHpH/Zu40gQgyTKvns1cPusYDayKvwlsaig73W', 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ev_name` (`ev_name`),
  ADD UNIQUE KEY `ev_date` (`ev_date`);

--
-- Indexes for table `pending_users`
--
ALTER TABLE `pending_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`,`description`);

--
-- Indexes for table `runners`
--
ALTER TABLE `runners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_id` (`school_id`,`event_id`,`first_name`,`last_name`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `runners`
--
ALTER TABLE `runners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1280;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
