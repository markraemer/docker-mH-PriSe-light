CREATE DATABASE  IF NOT EXISTS `mhealth_apps` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mhealth_apps`;
-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 21, 2017 at 10:44 AM
-- Server version: 5.5.54-0+deb8u1
-- PHP Version: 5.6.29-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mhealth_apps`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE IF NOT EXISTS `addons` (
  `name` varchar(100) NOT NULL,
  `addon_type` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `package` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `am`
--

CREATE TABLE IF NOT EXISTS `am` (
  `package` varchar(100) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `asin` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `rating` float(10,2) DEFAULT NULL,
  `popularity` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `mom` varchar(50) DEFAULT NULL,
  `pripol` varchar(500) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analysis`
--

CREATE TABLE IF NOT EXISTS `analysis` (
  `package` varchar(80) NOT NULL COMMENT 'Package name as extracted from apk',
  `Type` varchar(20) DEFAULT NULL COMMENT 'DIABETS, BP OR BOTH',
  `pripol_in_app` int(1) DEFAULT NULL,
  `path_to_exports` varchar(150) DEFAULT NULL COMMENT 'path to exported data in smart phone',
  `safety_check_bp` int(1) DEFAULT NULL COMMENT '0 = no, 1 = yes, 2 = NA (not applicable)',
  `safety_check_gl` int(1) DEFAULT NULL COMMENT '0 = no, 1 = yes, 2 = NA (not applicable)',
  `safety_check_pulse` int(1) DEFAULT NULL COMMENT '0 = no, 1 = yes, 2 = NA (not applicable)',
  `export_SD` int(1) DEFAULT NULL,
  `export_mail` int(1) DEFAULT NULL,
  `export_web_native` int(1) DEFAULT NULL,
  `export_other` varchar(100) DEFAULT NULL,
  `authentication` int(1) DEFAULT NULL COMMENT 'Additional Authentication over pin / password for app given',
  `wipe` int(1) DEFAULT NULL COMMENT 'wipe after deletion, 0 = no, 1=yes',
  `comment` text COMMENT 'any addition comment'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
`id` int(5) NOT NULL,
  `label` varchar(512) NOT NULL,
  `package` varchar(80) NOT NULL COMMENT 'Package name as extracted from apk',
  `version` varchar(255) DEFAULT NULL,
  `versioncode` varchar(100) DEFAULT NULL COMMENT 'Version Code out of manifest',
  `filesize` int(15) DEFAULT NULL COMMENT 'File size in Byte',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of last change',
  `path_to_icon` varchar(50) DEFAULT NULL,
  `path_to_apk` varchar(500) DEFAULT NULL COMMENT 'full path to apk file',
  `comment` text COMMENT 'any addition comment'
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apps`
--

INSERT INTO `apps` (`id`, `label`, `package`, `version`, `versioncode`, `filesize`, `timestamp`, `path_to_icon`, `path_to_apk`, `comment`) VALUES
(349, 'HAPI Connect', 'com.hapiconnect', '1.2.8_US_server', '8', 3261464, '2016-07-08 16:54:41', 'res/drawable-mdpi-v4/ic_launcher.png', '/media/exthdd/apps/com.hapiconnect/com.hapiconnect.apk', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_attsuf`
--

CREATE TABLE IF NOT EXISTS `app_attsuf` (
`id` int(11) NOT NULL,
  `package` varchar(50) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `class` varchar(200) NOT NULL,
  `permission` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_perm`
--

CREATE TABLE IF NOT EXISTS `app_perm` (
  `id_app` int(11) NOT NULL,
  `id_perm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE IF NOT EXISTS `certificates` (
  `package` varchar(80) NOT NULL COMMENT 'Package name as extracted from apk',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of last change',
  `cert_version` int(1) DEFAULT NULL,
  `cert_sig_algo` varchar(40) DEFAULT NULL,
  `cert_issuer` varchar(200) DEFAULT NULL,
  `cert_subject` varchar(200) DEFAULT NULL,
  `cert_nb` varchar(50) DEFAULT '0000-00-00 00:00:00' COMMENT 'validity: not before',
  `cert_na` varchar(50) DEFAULT '0000-00-00 00:00:00' COMMENT 'validity not after',
  `cert_pka` varchar(50) DEFAULT NULL,
  `cert_pkl` int(5) DEFAULT NULL,
  `cert_sn` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `code_analysis`
--

CREATE TABLE IF NOT EXISTS `code_analysis` (
  `package` varchar(80) NOT NULL,
  `debuggable` varchar(1) DEFAULT NULL COMMENT 'App set as debuggable in manifest',
  `contentprovider_used` varchar(1) DEFAULT NULL,
  `contentprovider_accessible` varchar(1) DEFAULT NULL,
  `contentprovider_gives_medical_app` varchar(1) DEFAULT NULL,
  `malware` int(1) DEFAULT NULL COMMENT 'Identified as malware or pup'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='stores results of source code analysis';

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
`id` int(11) NOT NULL,
  `vendor` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `package` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `release_date` varchar(20) NOT NULL,
  `price` float NOT NULL COMMENT 'price at release in GBP',
  `android` int(1) NOT NULL,
  `ios` int(1) NOT NULL,
  `windows` int(1) NOT NULL,
  `plugin` int(1) NOT NULL,
  `wifi` int(1) NOT NULL,
  `bluetooth` int(1) NOT NULL,
  `ant` int(1) NOT NULL,
  `url` varchar(300) NOT NULL,
  `short_url` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `vendor`, `model`, `package`, `type`, `release_date`, `price`, `android`, `ios`, `windows`, `plugin`, `wifi`, `bluetooth`, `ant`, `url`, `short_url`) VALUES
(1, 'HAPI', 'Connected Scale', 'com.hapiconnect', 'Scale', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `experiments`
--

CREATE TABLE IF NOT EXISTS `experiments` (
`id` int(11) NOT NULL,
  `device` int(11) NOT NULL,
  `package` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_case` varchar(45) NOT NULL,
  `comment` text,
  `log_folder` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experiments`
--

INSERT INTO `experiments` (`id`, `device`, `package`, `time`, `test_case`, `comment`, `log_folder`) VALUES
(393, 1, 'com.hapiconnect', '2016-07-21 15:19:03', 'av1_data_trans', 'test run to collect data from app only; registered, paired and executed measurements; on device firewall was limitting data collection to app only', '/mnt/data/experiments/com.hapiconnect/av1_data_trans/2016-07-21_15:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `experiments_details`
--

CREATE TABLE IF NOT EXISTS `experiments_details` (
`id` int(11) NOT NULL,
  `experiment` int(11) NOT NULL,
  `test_step` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `rating` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `experiment_overview`
--
CREATE TABLE IF NOT EXISTS `experiment_overview` (
`id` int(11)
,`package` varchar(50)
,`device` int(11)
,`time` timestamp
,`test_case` varchar(45)
,`c1` text
,`test_step` varchar(50)
,`rating` varchar(45)
,`c2` text
);
-- --------------------------------------------------------

--
-- Table structure for table `experiment_test_cases`
--

CREATE TABLE IF NOT EXISTS `experiment_test_cases` (
  `name` varchar(100) NOT NULL,
  `short_desc` text NOT NULL,
  `long_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experiment_test_cases`
--

INSERT INTO `experiment_test_cases` (`name`, `short_desc`, `long_desc`) VALUES
('av1_data_trans', 'testing attacks on the data communication such as replay attacks', 'any kind of attacks on network traffic such as session steeling, replay or broad casting attacks'),
('av2_mobile_device', 'mobile device related software and firmware tests', ''),
('av3_mobile_app', 'various android vulnerabilities such as SSL implementations, content loading, over privileged apps, intents', ''),
('av4_third_party', 'forging fitness results for financial gain', ''),
('av5_sensor_device', 'on device software and firmware related tests', ''),
('av6_web_application', 'vendor-supplied web applications for data storage, analysis and information sharing', ''),
('sol_arch', 'solution architecture with general comments on data collection and flow', 'collect some data using the sensor device and show it on the device itself\r\nif data is synchronised to a web server provide some information on that process\r\nwhat is the characteristics of the collected data');

-- --------------------------------------------------------

--
-- Table structure for table `experiment_test_steps`
--

CREATE TABLE IF NOT EXISTS `experiment_test_steps` (
  `name` varchar(50) NOT NULL,
  `test_case` varchar(50) NOT NULL,
  `short_desc` varchar(100) NOT NULL,
  `rating` text NOT NULL,
  `long_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experiment_test_steps`
--

INSERT INTO `experiment_test_steps` (`name`, `test_case`, `short_desc`, `rating`, `long_desc`) VALUES
('av1_inject', 'av1_data_trans', 'inject new data to the stream', 'vulnerable: 1 / not vulnerable: 0', 'injecting data to the stream which is purely created by an attacker and not generated by the benign origin'),
('av1_replay', 'av1_data_trans', 'finding some way to replay information to the server', 'vulnerable: 1 / not vulnerable: 0', 'can information be captured and replayed to the server?\r\nis the server accepting such information?\r\nsession steeling and tampering?\r\nsome kind of CSRF attacks which will write information to a victims account and which details are required to capture in order to enable such attacks?'),
('av1_ssl', 'av1_data_trans', 'is using SSL', 'not using SSL: 1 / using SSL: 0', NULL),
('av1_ssl_forg', 'av1_data_trans', 'secure and correct implementation of communication encryption', 'vulnerable: 1 / not vulnerable: 0', 'analysing for any flaws in SSL implementations or no-SSL\r\n\r\nthis step tries to forge a new certificate, so that if certificate validation is not correctly implemented in the application, the forged certificate will be accepted and an attacker can spoof data'),
('av1_ssl_forg_ca', 'av1_data_trans', 'in addition to data_com_ssl_forg the trusted CA certificate is installed', 'vulnerable: 1 / not vulnerable: 0', 'this attack can only be defeated by certificate pinning\r\n\r\notherwise an attacker will be able to spoof on data'),
('av1_tamper', 'av1_data_trans', 'tampering the data before it can reach the server defeating input validation', 'not vulnerable: 0 / upper limit e.g. weight: 1 / no limit or validation: 2', 'tampering data before it can reach the server by intercepting requests;\r\n\r\ndoes the server employ input validation on the web service?\r\n\r\nfind ways to harm data integrity'),
('av2_export_backup', 'av2_mobile_device', 'data is being backed up using the android backup command', 'data not encrypted: 2 / data in backup encrypted: 1 / no data stored: 0 ', 'is there any not encrypted data as part of the backups\r\n\r\nincludes SQLite databases\r\n\r\ncache files or log files'),
('av2_export_logging', 'av2_mobile_device', 'investigate the Android log for unencrypted information', 'information available: 1 / no information: 0', 'using ADB logcat enables access to a phones log files and these can potentially hold unencrypted logging information'),
('av3_code_comment', 'av3_mobile_app', 'any comment on the code', 'informational', 'while manually investigating the code any comment required to be documented goes in here'),
('av3_data_coll', 'av3_mobile_app', 'data collected and send by the mobile app', 'informational', 'which data is being collected by the phone and send to any kind of web server\r\nthis includes the data the mobile app might have received from the sensor device'),
('av3_data_leakage', 'av3_mobile_app', 'identifiable for the user or the phone that is being collected', 'no data leaked: 0 / complies with privacy policy: 1 / data leaked beyond privacy policy: 2', 'data can include any unique identifier for Android such as IMEI, MAC, advertising ID and others'),
('av3_data_wipe', 'av3_mobile_app', 'can data be wiped from the mobile application', 'unsecure feature: 1 / secure feature: 0', NULL),
('av3_export_cloud', 'av3_mobile_app', 'data being exported somewhere into the cloud (dropbox et al)', 'unsecure feature: 1 / secure feature: 0', NULL),
('av3_export_sdcard', 'av3_mobile_app', 'can data be exported to SD card or other locations on device and is that data encrypted', 'unsecure feature: 1 / secure feature: 0', NULL),
('av3_export_social', 'av3_mobile_app', 'export variants to social media and data encryption while exporting', 'unsecure feature: 1 / secure feature: 0', NULL),
('av3_pwd_change_freq', 'av3_mobile_app', 'password change period (must) and frequency (can)', 'no period or frequency: 2 / either one: 1 / both: 0', 'this should enforce changing passwords and prevent users from changing passwords to frequently; frequently passwords might bypass history requirements'),
('av3_pwd_change_policy', 'av3_mobile_app', 'password policy enforced on password change', 'no policy: 0 / min characters: 1 / mixed charsets: 2', 'which password policy is applied on password change\r\nwhat are the characteristics'),
('av3_pwd_change_reuse', 'av3_mobile_app', 'can a password be reused and how much difference is required', 'yes, unlimited: 0 / no, but history can be bypassed (see change freq): 1 / no without limitation: 2', NULL),
('av3_reg_acc_verif', 'av3_mobile_app', 'email account verification or two factor authentication', 'none: 2 / email account verification: 1 / two factor authentication 0', NULL),
('av3_reg_data_input', 'av3_mobile_app', 'Specifies the data fields and types which are required as inputs', 'informational', NULL),
('av3_reg_data_validation', 'av3_mobile_app', 'Comments on data validation during user registration: weight, heitght, email...', 'data not validated: 1 / data is validated: 0', NULL),
('av3_reg_pripol_link', 'av3_mobile_app', 'link to privacy policy or any kind of information on such topic', 'no link or information: 1 / link available: 0', NULL),
('av3_reg_pwd_policy', 'av3_mobile_app', 'is a password policy enforced', 'no policy: 2 / min characters: 1 / mixed charsets: 0', 'a password policy can be characterised as follows\r\n- minimum length\r\n- character sets (lower, upper, digit, special)\r\n- well-known patterns (date of birth, username, family name)'),
('av4_data_leakage', 'av4_third_party', 'data leakage to third party services', 'no data leaked: 0 / complies with privacy policy: 1 / data leaked beyond privacy policy: 2', 'names the service and describes the characteristics of the data being leaked to that service'),
('av5_data_coll', 'av5_sensor_device', 'characteristics of data collected by the sensor', 'informational', 'which data is collected by the sensor and transmitted'),
('av5_pairing_process', 'av5_sensor_device', 'pairing process between sensor and phone', 'informational', 'describes the pairing process between the sensor and phone towards security features such as pin based pairing and other BLE protocol features;\r\nmany devices omit the correct bluetooth paring and instantaneously communicate via BLE '),
('av5_swfw_update', 'av5_sensor_device', 'update cycle related issues', 'vulnerable: 1 / not vulnerable: 0', 'firmware may be captured or replaced'),
('av5_wifi_ssl', 'av5_sensor_device', 'ssl usage by sensor device', '0 - correct ssl usage / 1 - vulnerable ssl usage / 2 - no ssl usage', NULL),
('av6_csrf', 'av6_web_application', 'basic CSRF attack', 'vulnerable: 1 / not vulnerable: 0', NULL),
('av6_data_input', 'av6_web_application', 'data input via web UI and validation', 'data not validated: 1 / data is validated: 0', NULL),
('av6_data_wipe', 'av6_web_application', 'wipe and delete data from the web account', 'insecure feature: 1 / secure feature: 0', NULL),
('av6_export_cloud', 'av6_web_application', 'data being exported somewhere into the cloud (dropbox et al)', 'insecure feature: 1 / secure feature: 0', NULL),
('av6_export_disk', 'av6_web_application', 'can data be exported to SD card or other locations on device and is that data encrypted', 'insecure feature: 1 / secure feature: 0', NULL),
('av6_export_social', 'av6_web_application', 'export variants to social media and data encryption while exporting', 'insecure feature: 1 / secure feature: 0', NULL),
('av6_pri_pol', 'av6_web_application', 'pirvacy poclicy linked and available', 'no link or information: 1 / link available: 0', ''),
('av6_pwd_change_freq', 'av6_web_application', 'password change period (must) and frequency (can)', 'no period or frequency: 2 / either one: 1 / both: 0', 'this should enforce changing passwords and prevent users from changing passwords to frequently; frequently passwords might bypass history requirements'),
('av6_pwd_change_policy', 'av6_web_application', 'password policy enforced on password change', 'no policy: 2 / min characters: 1 / mixed charsets: 0', 'which password policy is applied on password change\r\nwhat are the characteristics'),
('av6_pwd_change_reuse', 'av6_web_application', 'can a password be reused and how much difference is required', 'yes, unlimited: 0 / no, but history can be bypassed (see change freq): 1 / no without limitation: 2', NULL),
('av6_reg_acc_verif', 'av6_web_application', 'email account verification or two factor authentication', 'none: 2 / email account verification: 1 / two factor authentication 0', NULL),
('av6_reg_data_input', 'av6_web_application', 'Specifies the data fields and types which are required as inputs', 'informational', NULL),
('av6_reg_data_validation', 'av6_web_application', 'Comments on data validation during user registration: weight, heitght, email...', 'data not validated: 1 / data is validated: 0', NULL),
('av6_reg_pripol_link', 'av6_web_application', 'link to privacy policy or any kind of information on such topic', 'no link or information: 1 / link available: 0', NULL),
('av6_reg_pwd_policy', 'av6_web_application', 'is a password policy enforced', 'no policy: 2 / min characters: 1 / mixed charsets: 0', 'a password policy can be characterised as follows\r\n- minimum length\r\n- character sets (lower, upper, digit, special)\r\n- well-known patterns (date of birth, username, family name)'),
('av6_sql_injection', 'av6_web_application', 'inject sql queries to learn information from the server', 'vulnerable: 1 / not vulnerable: 0', NULL),
('av6_xss', 'av6_web_application', 'basic xss attacks on the web page with a select statement', 'vulnerable: 1 / not vulnerable: 0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `ip_address` varchar(15) NOT NULL,
  `country_code` varchar(3) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `zip_code` varchar(8) DEFAULT NULL,
  `log` decimal(16,8) NOT NULL,
  `lat` decimal(16,8) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ip_address`, `country_code`, `state`, `city`, `zip_code`, `log`, `lat`, `time`) VALUES
('174.142.38.101', 'CA', 'Quebec', 'Montreal', 'H3E', -73.55010000, 45.45940000, '2017-01-20 14:29:04'),
('184.73.242.146', 'US', 'Virginia', 'Ashburn', '20149', -77.47280000, 39.04810000, '2017-01-20 14:28:39'),
('54.243.55.41', 'US', 'Virginia', 'Ashburn', '20149', -77.47280000, 39.04810000, '2017-01-20 14:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `mallodroid`
--

CREATE TABLE IF NOT EXISTS `mallodroid` (
  `package` varchar(100) NOT NULL,
  `mallo_text` text NOT NULL,
  `vuln_in` int(11) DEFAULT NULL COMMENT '1 = vuln in 3rd party, 2 = vuln in own code, 3 = both',
  `vuln_package` varchar(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `malware`
--

CREATE TABLE IF NOT EXISTS `malware` (
  `package` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tool` varchar(45) NOT NULL,
  `result` varchar(45) NOT NULL,
  `logfile` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obfuscation`
--

CREATE TABLE IF NOT EXISTS `obfuscation` (
  `package` varchar(200) NOT NULL,
  `score` varchar(45) NOT NULL,
  `native_score` varchar(45) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
`id` int(11) NOT NULL,
  `name` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pripol`
--

CREATE TABLE IF NOT EXISTS `pripol` (
  `package` varchar(80) NOT NULL,
  `URL` varchar(100) DEFAULT NULL COMMENT 'stores URL of privacy policy, uses -none- if not found',
  `NumWords` int(6) DEFAULT NULL,
  `NumChars` int(6) DEFAULT NULL COMMENT 'stores number of non white space chars',
  `version` varchar(100) DEFAULT NULL,
  `Country` varchar(3) DEFAULT NULL,
  `AP` varchar(6) DEFAULT NULL COMMENT 'Accountability Principle: Data Controller named / detailed contact data given in privacy policy? (E-Mail only => partly)',
  `SSP` varchar(6) DEFAULT NULL COMMENT 'Security Safeguards Principle: security safeguards described?',
  `OP` varchar(6) DEFAULT NULL COMMENT 'Openness Principle: Types of Data collected described?',
  `PSP` varchar(6) DEFAULT NULL COMMENT 'Purpose Specification Principle: Purpose of data collection and usage of data described?',
  `IPP` varchar(6) DEFAULT NULL COMMENT 'Individual Participation Principle: rights of the individual described',
  `intUsage` varchar(6) DEFAULT NULL COMMENT 'Medical Data can be used for other internal purposes like  for marketing, research',
  `3rdPartyStorage` varchar(6) DEFAULT NULL COMMENT 'Data stored by third party',
  `Merger` varchar(6) DEFAULT NULL COMMENT 'Medical Data passed on in case of merger or acquisition',
  `3rdPartyForward` varchar(6) DEFAULT NULL COMMENT 'Medical Data can  be passed on to  other 3rd parties (other than required by law)',
  `quotes` longtext,
  `comments` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='stores results of privacy policy comparison';

-- --------------------------------------------------------

--
-- Table structure for table `urls`
--

CREATE TABLE IF NOT EXISTS `urls` (
  `package` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `host` varchar(200) NOT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `analysis` varchar(1) NOT NULL COMMENT 'd-dynamic or s-static',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_case` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `urls`
--

INSERT INTO `urls` (`package`, `url`, `host`, `hostname`, `organization`, `analysis`, `time`, `test_case`) VALUES
('com.hapiconnect', 'http://174.142.38.101/healthcenter-personal/personal/account_service/is_loginname_available', '174.142.38.101', 'hapi.lhealthcenter.com', 'AS32613 iWeb Technologies Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans'),
('com.hapiconnect', 'http://174.142.38.101/healthcenter-personal/personal/account_service/login?signature=7da20e902d4feaa8a46be040b1dfb76436d6659a&timestamp=1467993564869&nonce=75837&', '174.142.38.101', 'hapi.lhealthcenter.com', 'AS32613 iWeb Technologies Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans'),
('com.hapiconnect', 'http://174.142.38.101/healthcenter-personal/personal/sync_record_service/download?signature=c8dd91f6b5abae2285aa2b60f3382b6d7fd1caac&timestamp=1467993565268&nonce=17076&sessionId=b20762a2caab4f88ac234', '174.142.38.101', 'hapi.lhealthcenter.com', 'AS32613 iWeb Technologies Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans'),
('com.hapiconnect', 'http://174.142.38.101/userfiles/hapiconnect/hapiconnect/2016/06/03/e12a2297e3ba4a58a6f5dd6c8d8bf00e/json/1467994987531-58fd8fac734249568762f8857608eb4b.zip', '174.142.38.101', 'hapi.lhealthcenter.com', 'AS32613 iWeb Technologies Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans'),
('com.hapiconnect', 'http://174.142.38.101/websocket-message/connect?sessionId=b20762a2caab4f88ac23427a010ba013&appserver=http://hapi.lhealthcenter.com/healthcenter-personal', '174.142.38.101', 'hapi.lhealthcenter.com', 'AS32613 iWeb Technologies Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans'),
('com.hapiconnect', 'https://184.73.242.146/spi/v2/platforms/android/apps/com.hapiconnect/settings?icon_hash=b68d88b385782926b962c83bfe33eb5a3ad1d262&display_version=1.2.8_US_server&source=1&instance=9441840b375cdad7632f8', '184.73.242.146', 'settings.crashlytics.com', 'AS14618 Amazon.com, Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans'),
('com.hapiconnect', 'https://54.243.55.41/spi/v2/events', '54.243.55.41', 'e.crashlytics.com', 'AS14618 Amazon.com, Inc.', 'd', '2016-07-21 15:19:03', 'av1_data_trans');

-- --------------------------------------------------------

--
-- Table structure for table `urls_ssl`
--

CREATE TABLE IF NOT EXISTS `urls_ssl` (
  `url` varchar(200) NOT NULL,
  `rating` varchar(200) NOT NULL,
  `report_url` varchar(300) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `urls_ssl`
--

INSERT INTO `urls_ssl` (`url`, `rating`, `report_url`, `timestamp`) VALUES
('hapi.lhealthcenter.com', 'analysis failed', 'https://www.ssllabs.com/ssltest/analyze.html?d=hapi.lhealthcenter.com', '2017-01-20 14:48:05');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_addons`
--
CREATE TABLE IF NOT EXISTS `view_addons` (
`package` varchar(80)
,`addons` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_app_perm`
--
CREATE TABLE IF NOT EXISTS `view_app_perm` (
`package` varchar(80)
,`permissions` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_malware`
--
CREATE TABLE IF NOT EXISTS `view_malware` (
`package` varchar(50)
,`results` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_obfuscation`
--
CREATE TABLE IF NOT EXISTS `view_obfuscation` (
`package` varchar(200)
,`concat('score: ', score, '\n native score: ', native_score)` varchar(112)
);
-- --------------------------------------------------------

--
-- Table structure for table `web_security`
--

CREATE TABLE IF NOT EXISTS `web_security` (
  `package` varchar(80) NOT NULL,
  `WebServerURL` varchar(100) NOT NULL,
  `Protocolused` varchar(10) NOT NULL COMMENT 'HTTP, HTTPS, Both',
  `MinimumPasswordLength` int(2) DEFAULT NULL COMMENT 'Number of characters',
  `SamplePassworrd` varchar(20) DEFAULT NULL COMMENT 'Example of valid password',
  `PasswordinCleartext` varchar(3) DEFAULT NULL COMMENT 'Password transmitted in Cleartext',
  `MedicalDatainCleartext` varchar(3) DEFAULT NULL COMMENT 'Medical Data in Cleartext (text or pictures)',
  `Comments` longtext,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Saves results of web security analysis';

-- --------------------------------------------------------

--
-- Structure for view `experiment_overview`
--
DROP TABLE IF EXISTS `experiment_overview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `experiment_overview` AS select `e`.`id` AS `id`,`e`.`package` AS `package`,`e`.`device` AS `device`,`e`.`time` AS `time`,`e`.`test_case` AS `test_case`,`e`.`comment` AS `c1`,`d`.`test_step` AS `test_step`,`d`.`rating` AS `rating`,`d`.`comment` AS `c2` from (`experiments` `e` left join `experiments_details` `d` on((`e`.`id` = `d`.`experiment`))) order by `e`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `view_addons`
--
DROP TABLE IF EXISTS `view_addons`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_addons` AS select `addons`.`package` AS `package`,group_concat(`addons`.`name` separator '
') AS `addons` from `addons` group by `addons`.`package`;

-- --------------------------------------------------------

--
-- Structure for view `view_app_perm`
--
DROP TABLE IF EXISTS `view_app_perm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_app_perm` AS select `a`.`package` AS `package`,group_concat(`p`.`name` separator '
') AS `permissions` from ((`apps` `a` join `app_perm` `ap` on((`a`.`id` = `ap`.`id_app`))) join `permissions` `p` on((`ap`.`id_perm` = `p`.`id`))) group by `a`.`package`;

-- --------------------------------------------------------

--
-- Structure for view `view_malware`
--
DROP TABLE IF EXISTS `view_malware`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_malware` AS select `malware`.`package` AS `package`,group_concat(`malware`.`tool`,': ',`malware`.`result` separator '
') AS `results` from `malware` group by `malware`.`package`;

-- --------------------------------------------------------

--
-- Structure for view `view_obfuscation`
--
DROP TABLE IF EXISTS `view_obfuscation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_obfuscation` AS select `obfuscation`.`package` AS `package`,concat('score: ',`obfuscation`.`score`,'\nnative score: ',`obfuscation`.`native_score`) AS `concat('score: ', score, '\n native score: ', native_score)` from `obfuscation`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
 ADD UNIQUE KEY `unique_entry` (`package`,`name`,`addon_type`);

--
-- Indexes for table `am`
--
ALTER TABLE `am`
 ADD PRIMARY KEY (`package`), ADD KEY `package` (`package`);

--
-- Indexes for table `analysis`
--
ALTER TABLE `analysis`
 ADD UNIQUE KEY `Package` (`package`), ADD KEY `package name` (`package`);

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `package name` (`package`);

--
-- Indexes for table `app_attsuf`
--
ALTER TABLE `app_attsuf`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_app_attsuf_1_idx` (`package`);

--
-- Indexes for table `app_perm`
--
ALTER TABLE `app_perm`
 ADD PRIMARY KEY (`id_app`,`id_perm`), ADD KEY `id_app` (`id_app`), ADD KEY `id_perm` (`id_perm`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
 ADD UNIQUE KEY `package name` (`package`);

--
-- Indexes for table `code_analysis`
--
ALTER TABLE `code_analysis`
 ADD UNIQUE KEY `package` (`package`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `fk_devices_1_idx` (`package`);

--
-- Indexes for table `experiments`
--
ALTER TABLE `experiments`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `index4` (`device`,`package`,`time`,`test_case`), ADD KEY `exp_pkg_idx` (`package`), ADD KEY `fk_experiments_2_idx` (`test_case`);

--
-- Indexes for table `experiments_details`
--
ALTER TABLE `experiments_details`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_edetails_2_idx` (`test_step`), ADD KEY `fk_edetails_1` (`experiment`);

--
-- Indexes for table `experiment_test_cases`
--
ALTER TABLE `experiment_test_cases`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `experiment_test_steps`
--
ALTER TABLE `experiment_test_steps`
 ADD PRIMARY KEY (`name`), ADD KEY `fk_experiment_test_steps_1_idx` (`test_case`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`ip_address`);

--
-- Indexes for table `mallodroid`
--
ALTER TABLE `mallodroid`
 ADD KEY `package` (`package`);

--
-- Indexes for table `malware`
--
ALTER TABLE `malware`
 ADD PRIMARY KEY (`package`,`tool`);

--
-- Indexes for table `obfuscation`
--
ALTER TABLE `obfuscation`
 ADD PRIMARY KEY (`package`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uname` (`name`(100));

--
-- Indexes for table `pripol`
--
ALTER TABLE `pripol`
 ADD PRIMARY KEY (`package`);

--
-- Indexes for table `urls`
--
ALTER TABLE `urls`
 ADD PRIMARY KEY (`package`,`url`,`test_case`), ADD KEY `fk_urls_1_idx` (`test_case`);

--
-- Indexes for table `urls_ssl`
--
ALTER TABLE `urls_ssl`
 ADD PRIMARY KEY (`url`);

--
-- Indexes for table `web_security`
--
ALTER TABLE `web_security`
 ADD UNIQUE KEY `package` (`package`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=350;
--
-- AUTO_INCREMENT for table `app_attsuf`
--
ALTER TABLE `app_attsuf`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `experiments`
--
ALTER TABLE `experiments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=394;
--
-- AUTO_INCREMENT for table `experiments_details`
--
ALTER TABLE `experiments_details`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `addons`
--
ALTER TABLE `addons`
ADD CONSTRAINT `addons_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `am`
--
ALTER TABLE `am`
ADD CONSTRAINT `am_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `analysis`
--
ALTER TABLE `analysis`
ADD CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_attsuf`
--
ALTER TABLE `app_attsuf`
ADD CONSTRAINT `fk_app_attsuf_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `code_analysis`
--
ALTER TABLE `code_analysis`
ADD CONSTRAINT `code_analysis_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
ADD CONSTRAINT `fk_devices_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `experiments`
--
ALTER TABLE `experiments`
ADD CONSTRAINT `fk_experiments_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_experiments_2` FOREIGN KEY (`test_case`) REFERENCES `experiment_test_cases` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `experiments_details`
--
ALTER TABLE `experiments_details`
ADD CONSTRAINT `fk_edetails_1` FOREIGN KEY (`experiment`) REFERENCES `experiments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_edetails_2` FOREIGN KEY (`test_step`) REFERENCES `experiment_test_steps` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experiment_test_steps`
--
ALTER TABLE `experiment_test_steps`
ADD CONSTRAINT `fk_experiment_test_steps_1` FOREIGN KEY (`test_case`) REFERENCES `experiment_test_cases` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `mallodroid`
--
ALTER TABLE `mallodroid`
ADD CONSTRAINT `mallodroid_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obfuscation`
--
ALTER TABLE `obfuscation`
ADD CONSTRAINT `fk_new_table_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pripol`
--
ALTER TABLE `pripol`
ADD CONSTRAINT `pripol_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `urls`
--
ALTER TABLE `urls`
ADD CONSTRAINT `fk_urls_1` FOREIGN KEY (`test_case`) REFERENCES `experiment_test_cases` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `urls_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `web_security`
--
ALTER TABLE `web_security`
ADD CONSTRAINT `web_security_ibfk_1` FOREIGN KEY (`package`) REFERENCES `apps` (`package`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
