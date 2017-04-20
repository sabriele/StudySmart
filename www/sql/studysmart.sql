-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 13, 2015 at 11:25 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `studysmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `blocked`
--

CREATE TABLE IF NOT EXISTS `blocked` (
`id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
`id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `from`, `to`, `message`, `read`, `time`) VALUES
(1, 1, 6, 'Hey Adam! How were the holidays!', 1, '2015-04-09 08:37:50'),
(2, 6, 1, 'Hi Sab! Had a lot of work but it was real fun.', 1, '2015-04-09 08:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
`id` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post`, `by`, `time`) VALUES
(2, 4, 2, '2015-04-09 08:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`id` int(12) NOT NULL,
  `uid` int(32) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) CHARACTER SET latin1 NOT NULL,
  `value` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `uid`, `message`, `tag`, `type`, `value`, `time`, `public`, `likes`) VALUES
(3, 2, 'Hello class, welcome to our EE3017/IM2003 class on Computer Communications! I hope you all have an enriching experience over the next semester!', '', '', '', '2015-04-09 08:23:38', 1, 0),
(4, 1, 'Feeling nervous for my first day of school...', '', '', '', '2015-04-09 08:25:56', 1, 1),
(5, 3, 'Optic fibres are so pretty :)', '', 'picture', '784579775_1884320730_581732302.jpg', '2015-04-09 08:29:55', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
`id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `from`, `to`, `parent`, `child`, `type`, `read`, `time`) VALUES
(11, 1, 4, 0, 0, 4, 0, '2015-04-09 08:18:59'),
(13, 1, 2, 0, 0, 4, 0, '2015-04-09 08:21:48'),
(14, 1, 13, 0, 0, 4, 0, '2015-04-09 08:21:51'),
(17, 1, 9, 0, 0, 4, 0, '2015-04-09 08:21:52'),
(18, 1, 8, 0, 0, 4, 0, '2015-04-09 08:21:53'),
(19, 1, 6, 0, 0, 4, 0, '2015-04-09 08:21:53'),
(20, 1, 5, 0, 0, 4, 0, '2015-04-09 08:21:54'),
(21, 1, 3, 0, 0, 4, 0, '2015-04-09 08:30:14'),
(22, 1, 7, 0, 0, 4, 0, '2015-04-09 08:30:29'),
(23, 1, 12, 0, 0, 4, 0, '2015-04-09 08:30:31'),
(25, 2, 1, 4, 0, 2, 1, '2015-04-09 08:50:04'),
(26, 1, 10, 0, 0, 4, 0, '2015-04-09 21:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE IF NOT EXISTS `relations` (
`id` int(11) NOT NULL,
  `leader` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `leader`, `subscriber`, `time`) VALUES
(11, 4, 1, '2015-04-09 08:18:59'),
(13, 2, 1, '2015-04-09 08:21:48'),
(14, 13, 1, '2015-04-09 08:21:50'),
(17, 9, 1, '2015-04-09 08:21:52'),
(18, 8, 1, '2015-04-09 08:21:53'),
(19, 6, 1, '2015-04-09 08:21:53'),
(20, 5, 1, '2015-04-09 08:21:54'),
(21, 3, 1, '2015-04-09 08:30:14'),
(22, 7, 1, '2015-04-09 08:30:29'),
(23, 12, 1, '2015-04-09 08:30:31'),
(24, 10, 1, '2015-04-09 21:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
`id` int(12) NOT NULL,
  `post` varchar(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perpage` int(11) NOT NULL,
  `censor` varchar(2048) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `captcha` int(11) NOT NULL,
  `intervalm` int(11) NOT NULL,
  `intervaln` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `message` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `format` varchar(256) NOT NULL,
  `mail` int(11) NOT NULL,
  `sizemsg` int(11) NOT NULL,
  `formatmsg` varchar(256) NOT NULL,
  `cperpage` int(11) NOT NULL,
  `mprivacy` int(11) NOT NULL,
  `ilimit` int(11) NOT NULL,
  `climit` int(11) NOT NULL,
  `qperpage` tinyint(4) NOT NULL,
  `rperpage` int(11) NOT NULL,
  `uperpage` int(11) NOT NULL,
  `sperpage` int(11) NOT NULL,
  `nperpage` tinyint(4) NOT NULL,
  `nperwidget` tinyint(4) NOT NULL,
  `lperpost` int(11) NOT NULL,
  `conline` int(4) NOT NULL,
  `ronline` tinyint(4) NOT NULL,
  `mperpage` tinyint(4) NOT NULL,
  `verified` int(11) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notifications` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `chatr` int(11) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `sound_new_notification` tinyint(4) NOT NULL,
  `sound_new_chat` tinyint(4) NOT NULL,
  `smiles` tinyint(4) NOT NULL,
  `ad1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad4` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad5` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad6` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad7` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`title`, `theme`, `perpage`, `censor`, `captcha`, `intervalm`, `intervaln`, `time`, `message`, `size`, `format`, `mail`, `sizemsg`, `formatmsg`, `cperpage`, `mprivacy`, `ilimit`, `climit`, `qperpage`, `rperpage`, `uperpage`, `sperpage`, `nperpage`, `nperwidget`, `lperpost`, `conline`, `ronline`, `mperpage`, `verified`, `notificationl`, `notificationc`, `notifications`, `notificationd`, `notificationf`, `chatr`, `email_comment`, `email_like`, `email_new_friend`, `sound_new_notification`, `sound_new_chat`, `smiles`, `ad1`, `ad2`, `ad3`, `ad4`, `ad5`, `ad6`, `ad7`) VALUES
('IM2003', 'default', 10, '', 0, 10000, 10000, 0, 500, 3145728, 'png,jpg,gif', 1, 2097152, 'png,jpg,gif', 3, 1, 9, 500, 25, 20, 20, 10, 50, 30, 5, 600, 10, 10, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`idu` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(128) NOT NULL,
  `bio` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `facebook` varchar(256) NOT NULL,
  `twitter` varchar(128) NOT NULL,
  `gplus` varchar(256) NOT NULL,
  `image` varchar(128) NOT NULL,
  `private` int(11) NOT NULL,
  `salted` varchar(256) NOT NULL,
  `background` varchar(256) NOT NULL,
  `cover` varchar(128) NOT NULL,
  `verified` int(11) NOT NULL,
  `privacy` int(11) NOT NULL DEFAULT '1',
  `gender` tinyint(4) NOT NULL,
  `online` int(11) NOT NULL,
  `offline` tinyint(4) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notifications` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `sound_new_notification` tinyint(4) NOT NULL,
  `sound_new_chat` tinyint(4) NOT NULL,
  `born` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idu`, `username`, `password`, `email`, `first_name`, `last_name`, `location`, `website`, `bio`, `date`, `facebook`, `twitter`, `gplus`, `image`, `private`, `salted`, `background`, `cover`, `verified`, `privacy`, `gender`, `online`, `offline`, `notificationl`, `notificationc`, `notifications`, `notificationd`, `notificationf`, `email_comment`, `email_like`, `email_new_friend`, `sound_new_notification`, `sound_new_chat`, `born`) VALUES
(1, 'sabriele', 'e10adc3949ba59abbe56e057f20f883e', 'sabriele@gmail.com', 'Sabrina', 'Tjeng', '', '', '', '2015-03-28', '', '', '', '1822846113_1932759779_308096084.JPG', 0, 'cffd0deb0a32b3dc473e390a45ccabe3', '', 'default.png', 0, 1, 0, 1428914085, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(2, 'xgshao', 'e10adc3949ba59abbe56e057f20f883e', 'xgshao@ntu.edu.sg', 'Michelle', 'Shao Xu Guang', '', '', '', '2015-04-09', '', '', '', '2024770853_1279935236_1386698929.png', 0, '', '', 'default.png', 1, 1, 0, 1428569410, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(3, 'ychen26', 'e10adc3949ba59abbe56e057f20f883e', 'ychen26@e.ntu.edu.sg', 'Yuji', 'Chen', '', '', '', '2015-04-09', '', '', '', '1188607091_1393410643_1443234994.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428568198, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(4, 'ngke0011', 'e10adc3949ba59abbe56e057f20f883e', 'ngke0011@e.ntu.edu.sg', 'Ke Cheng', 'Ng', '', '', '', '2015-04-09', '', '', '', '1571798187_1111063869_1366378192.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565138, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(5, 'hftan1', 'e10adc3949ba59abbe56e057f20f883e', 'hftan1@e.ntu.edu.sg', 'Hao Feng', 'Tan', '', '', '', '2015-04-09', '', '', '', '500043490_1048937430_28042808.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565190, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(6, 'bachew1', 'e10adc3949ba59abbe56e057f20f883e', 'bachew1@e.ntu.edu.sg', 'Adam', 'Chew Beng Aik', '', '', '', '2015-04-09', '', '', '', '850950960_2139950542_178774525.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428568801, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(7, 'epshum', 'e10adc3949ba59abbe56e057f20f883e', 'epshum@ntu.edu.sg', 'Perry', 'Shum Ping', '', '', '', '2015-04-09', '', '', '', '504521329_1399228831_1552972429.jpg', 0, '', '', 'default.png', 1, 1, 0, 1428615516, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(8, 'xu0009an', 'e10adc3949ba59abbe56e057f20f883e', 'xu0009an@e.ntu.edu.sg', 'Jinan', 'Xu', '', '', '', '2015-04-09', '', '', '', '1765000878_363709024_428721120.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565361, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(9, 'e110055', 'e10adc3949ba59abbe56e057f20f883e', 'e110055@e.ntu.edu.sg', 'Baiyang', 'Shuo', '', '', '', '2015-04-09', '', '', '', '1036393150_1595206192_648443022.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565395, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(10, 'zzhao006', 'e10adc3949ba59abbe56e057f20f883e', 'zzhao006@e.ntu.edu.sg', 'Ziping', 'Zhao', '', '', '', '2015-04-09', '', '', '', '1862726326_778960578_1281484709.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565433, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(11, 'qwang4', 'e10adc3949ba59abbe56e057f20f883e', 'qwang4@e.ntu.edu.sg', 'Wang', 'Qing', '', '', '', '2015-04-09', '', '', '', '722059807_312591854_1847135170.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565477, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(12, 'gewe0002', 'e10adc3949ba59abbe56e057f20f883e', 'gewe0002@e.ntu.edu.sg', 'Ge', 'Weitong', '', '', '', '2015-04-09', '', '', '', '260628644_33700284_1415860071.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565508, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01'),
(13, 'nguy0125', 'e10adc3949ba59abbe56e057f20f883e', 'nguy0125@e.ntu.edu.sg', 'Nguyen', 'Tru Trang', '', '', '', '2015-04-09', '', '', '', '810209418_1849368911_1548089613.jpg', 0, '', '', 'default.png', 0, 1, 0, 1428565540, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2015-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocked`
--
ALTER TABLE `blocked`
 ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD UNIQUE KEY `id` (`idu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `blocked`
--
ALTER TABLE `blocked`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `idu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
