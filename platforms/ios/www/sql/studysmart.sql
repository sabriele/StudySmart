SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'a5ff20e027ef3106d327a99321fb0313');

-- --------------------------------------------------------

--
-- Table structure for table `blocked`
--

CREATE TABLE IF NOT EXISTS `blocked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) CHARACTER SET latin1 NOT NULL,
  `value` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE IF NOT EXISTS `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leader` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `post` varchar(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
('studysmart', 'default', 10, '', 1, 10000, 10000, 0, 500, 2097152, 'png,jpg,gif', 1, 2097152, 'png,jpg,gif', 3, 1, 9, 500, 10, 20, 20, 10, 100, 3, 5, 600, 10, 10, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idu` int(11) NOT NULL AUTO_INCREMENT,
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
  `born` date NOT NULL,
  UNIQUE KEY `id` (`idu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
