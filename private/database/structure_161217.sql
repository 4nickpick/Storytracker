-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 17, 2016 at 04:31 AM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `npickeri_storytracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `bug_reports`
--

CREATE TABLE IF NOT EXISTS `bug_reports` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `current_page` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `problem` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `aliases` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_content`
--

CREATE TABLE IF NOT EXISTS `characters_content` (
  `characters_id` int(11) NOT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_events`
--

CREATE TABLE IF NOT EXISTS `characters_events` (
  `id` int(11) NOT NULL,
  `characters_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `time` varchar(63) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_fields`
--

CREATE TABLE IF NOT EXISTS `characters_fields` (
  `id` int(11) NOT NULL,
  `groups_id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_groups`
--

CREATE TABLE IF NOT EXISTS `characters_groups` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_meta`
--

CREATE TABLE IF NOT EXISTS `characters_meta` (
  `characters_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_to_plot_events`
--

CREATE TABLE IF NOT EXISTS `characters_to_plot_events` (
  `characters_id` int(11) NOT NULL,
  `plot_events_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters_to_stories`
--

CREATE TABLE IF NOT EXISTS `characters_to_stories` (
  `characters_id` int(11) NOT NULL,
  `stories_id` int(11) NOT NULL,
  `priority` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` tinyint(3) NOT NULL,
  `roles_id` tinyint(3) NOT NULL,
  `module` varchar(15) NOT NULL,
  `tab` varchar(31) DEFAULT NULL,
  `verb` varchar(63) DEFAULT NULL,
  `own` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(11) unsigned NOT NULL,
  `users_id` int(11) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  `caption` mediumtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pictures_to_characters`
--

CREATE TABLE IF NOT EXISTS `pictures_to_characters` (
  `pictures_id` int(11) NOT NULL,
  `characters_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `cover_photo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pictures_to_plot_events`
--

CREATE TABLE IF NOT EXISTS `pictures_to_plot_events` (
  `pictures_id` int(11) NOT NULL,
  `plot_events_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `cover_photo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pictures_to_settings`
--

CREATE TABLE IF NOT EXISTS `pictures_to_settings` (
  `pictures_id` int(11) NOT NULL,
  `settings_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `cover_photo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `picture_files`
--

CREATE TABLE IF NOT EXISTS `picture_files` (
  `id` int(10) unsigned NOT NULL,
  `pictures_id` int(11) unsigned NOT NULL,
  `original` tinyint(1) NOT NULL DEFAULT '0',
  `width` int(11) unsigned NOT NULL,
  `height` int(11) unsigned NOT NULL,
  `content_type` varchar(63) NOT NULL DEFAULT 'image/png'
) ENGINE=InnoDB AUTO_INCREMENT=23034 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `plot_events`
--

CREATE TABLE IF NOT EXISTS `plot_events` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `summary` longtext,
  `outline` longtext
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plot_events_to_stories`
--

CREATE TABLE IF NOT EXISTS `plot_events_to_stories` (
  `plot_events_id` int(11) NOT NULL,
  `stories_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relationship_charts`
--

CREATE TABLE IF NOT EXISTS `relationship_charts` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `priority` int(11) NOT NULL,
  `series_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relationship_chart_connections`
--

CREATE TABLE IF NOT EXISTS `relationship_chart_connections` (
  `id` int(11) NOT NULL,
  `charts_id` int(11) NOT NULL,
  `nodes1_id` int(11) NOT NULL,
  `nodes2_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `content` longtext
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relationship_chart_nodes`
--

CREATE TABLE IF NOT EXISTS `relationship_chart_nodes` (
  `id` int(11) NOT NULL,
  `relationship_charts_id` int(11) NOT NULL,
  `characters_id` int(11) NOT NULL,
  `top` int(11) NOT NULL,
  `left` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE IF NOT EXISTS `series` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `users_id` int(11) NOT NULL,
  `is_series` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `aliases` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_content`
--

CREATE TABLE IF NOT EXISTS `settings_content` (
  `settings_id` int(11) NOT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_fields`
--

CREATE TABLE IF NOT EXISTS `settings_fields` (
  `id` int(11) NOT NULL,
  `groups_id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_groups`
--

CREATE TABLE IF NOT EXISTS `settings_groups` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_meta`
--

CREATE TABLE IF NOT EXISTS `settings_meta` (
  `fields_id` int(11) NOT NULL,
  `settings_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_to_plot_events`
--

CREATE TABLE IF NOT EXISTS `settings_to_plot_events` (
  `settings_id` int(11) NOT NULL,
  `plot_events_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings_to_stories`
--

CREATE TABLE IF NOT EXISTS `settings_to_stories` (
  `settings_id` int(11) NOT NULL,
  `stories_id` int(11) NOT NULL,
  `priority` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE IF NOT EXISTS `stories` (
  `id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `description` text NOT NULL,
  `synopsis` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `roles_id` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `pictures_id` int(11) unsigned DEFAULT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `nick_name` varchar(63) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `salt` char(10) NOT NULL,
  `password_retrieval_key` char(20) NOT NULL,
  `address` varchar(63) DEFAULT NULL,
  `city` varchar(31) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `phone` text,
  `last_login` datetime DEFAULT NULL,
  `approved` int(11) NOT NULL DEFAULT '0',
  `referral` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bug_reports`
--
ALTER TABLE `bug_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`), ADD KEY `full_name` (`full_name`), ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `characters_content`
--
ALTER TABLE `characters_content`
  ADD PRIMARY KEY (`characters_id`);

--
-- Indexes for table `characters_events`
--
ALTER TABLE `characters_events`
  ADD PRIMARY KEY (`id`), ADD KEY `characters_id` (`characters_id`);

--
-- Indexes for table `characters_fields`
--
ALTER TABLE `characters_fields`
  ADD PRIMARY KEY (`id`), ADD KEY `groups_id` (`groups_id`);

--
-- Indexes for table `characters_groups`
--
ALTER TABLE `characters_groups`
  ADD PRIMARY KEY (`id`), ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `characters_meta`
--
ALTER TABLE `characters_meta`
  ADD PRIMARY KEY (`characters_id`,`fields_id`), ADD KEY `characters_id` (`characters_id`), ADD KEY `fields_id` (`fields_id`);

--
-- Indexes for table `characters_to_plot_events`
--
ALTER TABLE `characters_to_plot_events`
  ADD KEY `characters_id` (`characters_id`), ADD KEY `plot_events_id` (`plot_events_id`);

--
-- Indexes for table `characters_to_stories`
--
ALTER TABLE `characters_to_stories`
  ADD UNIQUE KEY `characters_id` (`characters_id`,`stories_id`), ADD KEY `characters_id_2` (`characters_id`), ADD KEY `stories_id` (`stories_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `key` (`module`,`verb`,`tab`,`own`,`roles_id`), ADD KEY `fk_permissions_roles1_idx` (`roles_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures_to_characters`
--
ALTER TABLE `pictures_to_characters`
  ADD UNIQUE KEY `pictures_id` (`pictures_id`,`characters_id`);

--
-- Indexes for table `pictures_to_plot_events`
--
ALTER TABLE `pictures_to_plot_events`
  ADD UNIQUE KEY `pictures_id` (`pictures_id`,`plot_events_id`);

--
-- Indexes for table `pictures_to_settings`
--
ALTER TABLE `pictures_to_settings`
  ADD UNIQUE KEY `pictures_id` (`pictures_id`,`settings_id`);

--
-- Indexes for table `picture_files`
--
ALTER TABLE `picture_files`
  ADD PRIMARY KEY (`id`), ADD KEY `width` (`width`), ADD KEY `height` (`height`), ADD KEY `fk_picture_files_pictures1_idx` (`pictures_id`);

--
-- Indexes for table `plot_events`
--
ALTER TABLE `plot_events`
  ADD PRIMARY KEY (`id`), ADD KEY `series_id` (`series_id`), ADD KEY `event` (`event`);

--
-- Indexes for table `plot_events_to_stories`
--
ALTER TABLE `plot_events_to_stories`
  ADD UNIQUE KEY `plot_events_id` (`plot_events_id`,`stories_id`), ADD KEY `plot_events_id_2` (`plot_events_id`), ADD KEY `stories_id` (`stories_id`);

--
-- Indexes for table `relationship_charts`
--
ALTER TABLE `relationship_charts`
  ADD PRIMARY KEY (`id`), ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `relationship_chart_connections`
--
ALTER TABLE `relationship_chart_connections`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `chart_and_nodes_unique` (`charts_id`,`nodes1_id`,`nodes2_id`), ADD KEY `charts_id` (`charts_id`), ADD KEY `nodes1_id` (`nodes1_id`), ADD KEY `nodes2_id` (`nodes2_id`);

--
-- Indexes for table `relationship_chart_nodes`
--
ALTER TABLE `relationship_chart_nodes`
  ADD PRIMARY KEY (`id`), ADD KEY `relationship_charts_id` (`relationship_charts_id`), ADD KEY `characters_id` (`characters_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`), ADD KEY `name` (`name`), ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`), ADD KEY `series_id` (`series_id`), ADD KEY `full_name` (`full_name`);

--
-- Indexes for table `settings_content`
--
ALTER TABLE `settings_content`
  ADD UNIQUE KEY `settings_id` (`settings_id`);

--
-- Indexes for table `settings_fields`
--
ALTER TABLE `settings_fields`
  ADD PRIMARY KEY (`id`), ADD KEY `groups_id` (`groups_id`);

--
-- Indexes for table `settings_groups`
--
ALTER TABLE `settings_groups`
  ADD PRIMARY KEY (`id`), ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `settings_meta`
--
ALTER TABLE `settings_meta`
  ADD PRIMARY KEY (`fields_id`,`settings_id`);

--
-- Indexes for table `settings_to_plot_events`
--
ALTER TABLE `settings_to_plot_events`
  ADD UNIQUE KEY `settings_id` (`settings_id`,`plot_events_id`);

--
-- Indexes for table `settings_to_stories`
--
ALTER TABLE `settings_to_stories`
  ADD UNIQUE KEY `settings_id` (`settings_id`,`stories_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`), ADD KEY `series_id` (`series_id`), ADD KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_users_Roles_idx` (`roles_id`), ADD KEY `fk_users_pictures1_idx` (`pictures_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bug_reports`
--
ALTER TABLE `bug_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=698;
--
-- AUTO_INCREMENT for table `characters_events`
--
ALTER TABLE `characters_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `characters_fields`
--
ALTER TABLE `characters_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=636;
--
-- AUTO_INCREMENT for table `characters_groups`
--
ALTER TABLE `characters_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=379;
--
-- AUTO_INCREMENT for table `picture_files`
--
ALTER TABLE `picture_files`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23034;
--
-- AUTO_INCREMENT for table `plot_events`
--
ALTER TABLE `plot_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `relationship_charts`
--
ALTER TABLE `relationship_charts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `relationship_chart_connections`
--
ALTER TABLE `relationship_chart_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=445;
--
-- AUTO_INCREMENT for table `relationship_chart_nodes`
--
ALTER TABLE `relationship_chart_nodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=393;
--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `settings_fields`
--
ALTER TABLE `settings_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=336;
--
-- AUTO_INCREMENT for table `settings_groups`
--
ALTER TABLE `settings_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
