/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : zencart

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-08-08 18:36:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address_book`
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES ('1', '1', 'm', 'JustaDemo', 'Bill', 'Smith', '123 Any Avenue', '', '12345', 'Here', '', '223', '12');

-- ----------------------------
-- Table structure for `address_format`
-- ----------------------------
DROP TABLE IF EXISTS `address_format`;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_format
-- ----------------------------
INSERT INTO `address_format` VALUES ('1', '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country');
INSERT INTO `address_format` VALUES ('2', '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country');
INSERT INTO `address_format` VALUES ('3', '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
INSERT INTO `address_format` VALUES ('4', '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
INSERT INTO `address_format` VALUES ('5', '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
INSERT INTO `address_format` VALUES ('6', '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country');
INSERT INTO `address_format` VALUES ('7', '$postcode$cr$country $state $city$cr$streets$cr$company$cr$firstname $lastname', '$city / $country');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(255) NOT NULL DEFAULT '',
  `prev_pass1` varchar(255) NOT NULL DEFAULT '',
  `prev_pass2` varchar(255) NOT NULL DEFAULT '',
  `prev_pass3` varchar(255) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'qbmay@qq.com', '1', '$2y$10$XBiJKhppTjv/bLTaEuk7nOxMMGjoHozlxSb0tS3ceHcCMsCEwBpRS', '$2y$10$LgFmbgxXHpxwx2qpv13GwOA.EMBGucbbUEjgsH3BO8qG5KO13vube', '', '', '2018-08-08 12:35:41', '', '2018-08-08 12:33:56', '2018-08-08 12:35:41', '127.0.0.1', '0', '0', '2018-08-08 12:35:09', '127.0.0.1');

-- ----------------------------
-- Table structure for `admin_activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_activity_log`;
CREATE TABLE `admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  `logmessage` mediumtext NOT NULL,
  `severity` varchar(9) NOT NULL DEFAULT 'info',
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`),
  KEY `idx_severity_zen` (`severity`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_activity_log
-- ----------------------------
INSERT INTO `admin_activity_log` VALUES ('1', '2018-08-08 12:34:50', '0', 'Log found to be empty. Logging started.', '', '127.0.0.1', '0', '', '', 'Log found to be empty. Logging started.', 'notice');
INSERT INTO `admin_activity_log` VALUES ('2', '2018-08-08 12:34:50', '0', '', null, '127.0.0.1', '1', '', '', 'Updated database schema to allow for tracking [severity] in logs. NOTE: Severity levels before this date did not draw extra attention to add/remove of admin users or payment modules (CRUD operations), so old occurrences will have severity of INFO; new occurrences will have the severity of WARNING.', 'notice');
INSERT INTO `admin_activity_log` VALUES ('3', '2018-08-08 12:34:51', '0', 'alert_page.php ', '', '127.0.0.1', '0', '', 0x8B8E0500, 'Accessed page [alert_page.php]', 'info');
INSERT INTO `admin_activity_log` VALUES ('4', '2018-08-08 12:34:51', '0', 'alert_page.php ', '', '127.0.0.1', '1', '', 0x8B8E0500, 'Deleted admin pages for page keys: configImageHandler4', 'warning');
INSERT INTO `admin_activity_log` VALUES ('5', '2018-08-08 12:34:51', '0', 'alert_page.php ', '', '127.0.0.1', '1', '', 0x8B8E0500, 'Registered new admin menu page \\\"configImageHandler4\\\"', 'warning');
INSERT INTO `admin_activity_log` VALUES ('6', '2018-08-08 12:34:51', '0', 'alert_page.php ', '', '127.0.0.1', '1', '', 0x8B8E0500, 'Registered new admin menu page \\\"configUltimateSEO\\\"', 'warning');
INSERT INTO `admin_activity_log` VALUES ('7', '2018-08-08 12:35:04', '0', 'login.php ', 'camefrom=template_select.php&page=1&tID=1&action=save', '127.0.0.1', '0', '', 0x8B8E0500, 'Accessed page [login.php] with action=save. Review page_parameters and postdata for details.', 'info');
INSERT INTO `admin_activity_log` VALUES ('8', '2018-08-08 12:35:08', '0', 'login.php admin', 'camefrom=template_select.php&page=1&tID=1&action=save', '127.0.0.1', '0', '', 0x25C83B0E80200C00D0BB7476C08652F12C24A6FC1206601026E3DD25717CEF0189B5B4AB494D70FE800DEEE96B192BDC64C3DE4DCA44EB258CD2DBFAD8830A8194466B30C783AD376234474D987847EBE1FD00, 'Accessed page [login.php] with action=doc0cc5042962fd879b6a647d452e7129b. Review page_parameters and postdata for details.', 'info');
INSERT INTO `admin_activity_log` VALUES ('9', '2018-08-08 12:35:17', '0', 'login.php ', '', '127.0.0.1', '0', '', 0xAB564A4CC9CDCC8BCF4BCC4DD54D36484E36353031B234334A4BB130B74C324B3433314F3131354A353734B24C52B282A856D2512A2E4DCACD2C010AC4949A9B9927C5949AA6999A02C513934B32F3F380E245C5044DAB0500, 'Accessed page [login.php] with action=rsc0cc5042962fd879b6a647d452e7129b. Review page_parameters and postdata for details.', 'info');
INSERT INTO `admin_activity_log` VALUES ('10', '2018-08-08 12:35:41', '0', 'login.php ', '', '127.0.0.1', '0', '', 0xAB564A4CC9CDCC8BCF4BCC4DD54D36484E36353031B234334A4BB130B74C324B3433314F3131354A353734B24C52B282A856D2512A2E4DCACD2C010AC4949A9B9927C5949AA6999A02C513934B32F3F380E245C5044DAB0500, 'Accessed page [login.php] with action=rsc0cc5042962fd879b6a647d452e7129b. Review page_parameters and postdata for details.', 'info');
INSERT INTO `admin_activity_log` VALUES ('11', '2018-08-08 12:35:41', '0', 'login.php ', '', '127.0.0.1', '1', '', 0xAB564A4CC9CDCC8BCF4BCC4DD54D36484E36353031B234334A4BB130B74C324B3433314F3131354A353734B24C52B282A856D2512A2E4DCACD2C010AC4949A9B9927C5949AA6999A02C513934B32F3F380E245C5044DAB0500, 'Account password change saved.', 'warning');
INSERT INTO `admin_activity_log` VALUES ('12', '2018-08-08 12:35:41', '1', 'index.php', '', '127.0.0.1', '0', '', 0x8B8E0500, 'Accessed page [index.php]', 'info');
INSERT INTO `admin_activity_log` VALUES ('13', '2018-08-08 12:35:48', '1', 'template_select.php', '', '127.0.0.1', '0', '', 0x8B8E0500, 'Accessed page [template_select.php]', 'info');
INSERT INTO `admin_activity_log` VALUES ('14', '2018-08-08 12:35:54', '1', 'template_select.php', 'page=1&tID=1&action=edit', '127.0.0.1', '0', '', 0x8B8E0500, 'Accessed page [template_select.php] with action=edit. Review page_parameters and postdata for details.', 'info');
INSERT INTO `admin_activity_log` VALUES ('15', '2018-08-08 12:35:57', '1', 'template_select.php', 'page=1&tID=1&action=save', '127.0.0.1', '0', '', 0xAB56CAC953B2524A2ECA2C2E498C4FCA294D55AA0500, 'Accessed page [template_select.php] with action=save. Review page_parameters and postdata for details.', 'info');
INSERT INTO `admin_activity_log` VALUES ('16', '2018-08-08 12:36:10', '1', 'template_select.php', 'page=1&tID=1&action=edit', '127.0.0.1', '0', '', 0x8B8E0500, 'Accessed page [template_select.php] with action=edit. Review page_parameters and postdata for details.', 'info');

-- ----------------------------
-- Table structure for `admin_menus`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus` (
  `menu_key` varchar(255) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menus
-- ----------------------------
INSERT INTO `admin_menus` VALUES ('access', 'BOX_HEADING_ADMIN_ACCESS', '10');
INSERT INTO `admin_menus` VALUES ('catalog', 'BOX_HEADING_CATALOG', '2');
INSERT INTO `admin_menus` VALUES ('configuration', 'BOX_HEADING_CONFIGURATION', '1');
INSERT INTO `admin_menus` VALUES ('customers', 'BOX_HEADING_CUSTOMERS', '4');
INSERT INTO `admin_menus` VALUES ('extras', 'BOX_HEADING_EXTRAS', '11');
INSERT INTO `admin_menus` VALUES ('gv', 'BOX_HEADING_GV_ADMIN', '9');
INSERT INTO `admin_menus` VALUES ('localization', 'BOX_HEADING_LOCALIZATION', '6');
INSERT INTO `admin_menus` VALUES ('modules', 'BOX_HEADING_MODULES', '3');
INSERT INTO `admin_menus` VALUES ('reports', 'BOX_HEADING_REPORTS', '7');
INSERT INTO `admin_menus` VALUES ('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', '5');
INSERT INTO `admin_menus` VALUES ('tools', 'BOX_HEADING_TOOLS', '8');

-- ----------------------------
-- Table structure for `admin_pages`
-- ----------------------------
DROP TABLE IF EXISTS `admin_pages`;
CREATE TABLE `admin_pages` (
  `page_key` varchar(255) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(255) NOT NULL DEFAULT '',
  `page_params` varchar(255) NOT NULL DEFAULT '',
  `menu_key` varchar(255) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_pages
-- ----------------------------
INSERT INTO `admin_pages` VALUES ('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', '6');
INSERT INTO `admin_pages` VALUES ('backup_mysql', 'BOX_TOOLS_BACKUP_MYSQL', 'FILENAME_BACKUP_MYSQL', '', 'tools', 'Y', '17');
INSERT INTO `admin_pages` VALUES ('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', '22');
INSERT INTO `admin_pages` VALUES ('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', '11');
INSERT INTO `admin_pages` VALUES ('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', '16');
INSERT INTO `admin_pages` VALUES ('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', '5');
INSERT INTO `admin_pages` VALUES ('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', '24');
INSERT INTO `admin_pages` VALUES ('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', '10');
INSERT INTO `admin_pages` VALUES ('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', '25');
INSERT INTO `admin_pages` VALUES ('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', '21');
INSERT INTO `admin_pages` VALUES ('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', '15');
INSERT INTO `admin_pages` VALUES ('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', '12');
INSERT INTO `admin_pages` VALUES ('configImageHandler4', 'BOX_TOOLS_IMAGE_HANDLER', 'FILENAME_IMAGE_HANDLER', '', 'tools', 'Y', '14');
INSERT INTO `admin_pages` VALUES ('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', '23');
INSERT INTO `admin_pages` VALUES ('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', '18');
INSERT INTO `admin_pages` VALUES ('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', '9');
INSERT INTO `admin_pages` VALUES ('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', '20');
INSERT INTO `admin_pages` VALUES ('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', '17');
INSERT INTO `admin_pages` VALUES ('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', '7');
INSERT INTO `admin_pages` VALUES ('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', '14');
INSERT INTO `admin_pages` VALUES ('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', '13');
INSERT INTO `admin_pages` VALUES ('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', '6');
INSERT INTO `admin_pages` VALUES ('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', '8');
INSERT INTO `admin_pages` VALUES ('configUltimateSEO', 'SEO_CONFIGURATION_GROUP_TITLE', 'FILENAME_CONFIGURATION', 'gID=33', 'configuration', 'Y', '33');
INSERT INTO `admin_pages` VALUES ('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', '19');
INSERT INTO `admin_pages` VALUES ('configZenLightbox', 'BOX_CONFIGURATION_ZEN_LIGHTBOX', 'FILENAME_CONFIGURATION', 'gID=32', 'configuration', 'Y', '32');
INSERT INTO `admin_pages` VALUES ('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', '1');
INSERT INTO `admin_pages` VALUES ('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', '12');
INSERT INTO `admin_pages` VALUES ('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', '10');
INSERT INTO `admin_pages` VALUES ('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', '7');
INSERT INTO `admin_pages` VALUES ('easyPopulate', 'BOX_TOOLS_EASY_POPULATE', 'FILENAME_EASYPOPULATE', '', 'tools', 'Y', '14');
INSERT INTO `admin_pages` VALUES ('easyPopulateConfig', 'BOX_CONFIGURATION_EASY_POPULATE', 'FILENAME_CONFIGURATION', 'gID=31', 'configuration', 'Y', '26');
INSERT INTO `admin_pages` VALUES ('emailArchive', 'BOX_TOOLS_EMAIL_ARCHIVE_MANAGER', 'FILENAME_EMAIL_HISTORY', '', 'tools', 'Y', '20');
INSERT INTO `admin_pages` VALUES ('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', '11');
INSERT INTO `admin_pages` VALUES ('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', '13');
INSERT INTO `admin_pages` VALUES ('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', '5');
INSERT INTO `admin_pages` VALUES ('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', '7');
INSERT INTO `admin_pages` VALUES ('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', '10');
INSERT INTO `admin_pages` VALUES ('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', '5');
INSERT INTO `admin_pages` VALUES ('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', '5');
INSERT INTO `admin_pages` VALUES ('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', '8');
INSERT INTO `admin_pages` VALUES ('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', '5');
INSERT INTO `admin_pages` VALUES ('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', '9');
INSERT INTO `admin_pages` VALUES ('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', '6');
INSERT INTO `admin_pages` VALUES ('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', '16');
INSERT INTO `admin_pages` VALUES ('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', '15');
INSERT INTO `admin_pages` VALUES ('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', '17');
INSERT INTO `admin_pages` VALUES ('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('Quick Updates', 'BOX_CATALOG_QUICK_UPDATES', 'FILENAME_QUICK_UPDATES', '', 'catalog', 'Y', '103');
INSERT INTO `admin_pages` VALUES ('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', '3');
INSERT INTO `admin_pages` VALUES ('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', '5');
INSERT INTO `admin_pages` VALUES ('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', '11');
INSERT INTO `admin_pages` VALUES ('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', '14');
INSERT INTO `admin_pages` VALUES ('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', '6');
INSERT INTO `admin_pages` VALUES ('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', '12');
INSERT INTO `admin_pages` VALUES ('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', '13');
INSERT INTO `admin_pages` VALUES ('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', '9');
INSERT INTO `admin_pages` VALUES ('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', '4');
INSERT INTO `admin_pages` VALUES ('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', '5');
INSERT INTO `admin_pages` VALUES ('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', '1');
INSERT INTO `admin_pages` VALUES ('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', '2');
INSERT INTO `admin_pages` VALUES ('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', '7');
INSERT INTO `admin_pages` VALUES ('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', '2');

-- ----------------------------
-- Table structure for `admin_pages_to_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_pages_to_profiles`;
CREATE TABLE `admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_pages_to_profiles
-- ----------------------------
INSERT INTO `admin_pages_to_profiles` VALUES ('1', 'easyPopulate');

-- ----------------------------
-- Table structure for `admin_profiles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_profiles`;
CREATE TABLE `admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_profiles
-- ----------------------------
INSERT INTO `admin_profiles` VALUES ('1', 'Superuser');

-- ----------------------------
-- Table structure for `authorizenet`
-- ----------------------------
DROP TABLE IF EXISTS `authorizenet`;
CREATE TABLE `authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorizenet
-- ----------------------------

-- ----------------------------
-- Table structure for `banners`
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(64) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES ('1', 'Zen Cart 中文社区', 'http://www.zen-cart.cn', 'banners/zencart_cn_logo.gif', 'Wide-Banners', '', '0', null, null, '2004-01-11 20:59:12', null, '1', '1', '1', '0');
INSERT INTO `banners` VALUES ('2', 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125zen_logo.gif', 'SideBox-Banners', '', '0', null, null, '2004-01-11 20:59:12', null, '1', '1', '1', '0');
INSERT INTO `banners` VALUES ('3', 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/125x125_zen_logo.gif', 'SideBox-Banners', '', '0', null, null, '2004-01-11 20:59:12', null, '1', '1', '1', '0');
INSERT INTO `banners` VALUES ('4', '还考虑什么? 现在就装一个吧!', 'http://www.zen-cart.com', 'banners/think_anim.gif', 'Wide-Banners', '', '0', null, null, '2004-01-12 20:53:18', null, '1', '1', '1', '0');
INSERT INTO `banners` VALUES ('5', 'Zen Cart the art of e-commerce', 'http://www.zen-cart.com', 'banners/bw_zen_88wide.gif', 'BannersAll', '', '0', null, null, '2005-05-13 10:54:38', null, '1', '1', '1', '10');
INSERT INTO `banners` VALUES ('6', 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/big-book-ad.gif', 'Wide-Banners', '', '0', null, null, '2007-02-10 00:00:00', null, '1', '1', '1', '1');
INSERT INTO `banners` VALUES ('7', 'eStart Your Web Store with Zen Cart(R)', 'http://www.zen-cart.com/book', 'banners/tall-book.gif', 'SideBox-Banners', '', '0', null, null, '2007-02-10 00:00:00', null, '1', '1', '1', '1');
INSERT INTO `banners` VALUES ('8', 'Zen Cart 中文社区', 'http://www.zen-cart.cn', 'banners/logo-zencart-cn-125.gif', 'BannersAll', '', '0', null, null, '2005-12-10 00:00:00', null, '1', '1', '1', '15');

-- ----------------------------
-- Table structure for `banners_history`
-- ----------------------------
DROP TABLE IF EXISTS `banners_history`;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banners_history
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'categories/category_hardware.gif', '0', '1', '2003-12-23 03:18:19', '2004-05-21 00:32:17', '1');
INSERT INTO `categories` VALUES ('2', 'categories/category_software.gif', '0', '2', '2003-12-23 03:18:19', '2004-05-22 21:14:57', '1');
INSERT INTO `categories` VALUES ('3', 'categories/category_dvd_movies.gif', '0', '3', '2003-12-23 03:18:19', '2004-05-21 00:22:39', '1');
INSERT INTO `categories` VALUES ('4', 'categories/subcategory_graphic_cards.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('5', 'categories/subcategory_printers.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('6', 'categories/subcategory_monitors.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('7', 'categories/subcategory_speakers.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('8', 'categories/subcategory_keyboards.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('9', 'categories/subcategory_mice.gif', '1', '0', '2003-12-23 03:18:19', '2004-05-21 00:34:10', '1');
INSERT INTO `categories` VALUES ('10', 'categories/subcategory_action.gif', '3', '0', '2003-12-23 03:18:19', '2004-05-21 00:39:17', '1');
INSERT INTO `categories` VALUES ('11', 'categories/subcategory_science_fiction.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('12', 'categories/subcategory_comedy.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('13', 'categories/subcategory_cartoons.gif', '3', '0', '2003-12-23 03:18:19', '2004-05-21 00:23:13', '1');
INSERT INTO `categories` VALUES ('14', 'categories/subcategory_thriller.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('15', 'categories/subcategory_drama.gif', '3', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('16', 'categories/subcategory_memory.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('17', 'categories/subcategory_cdrom_drives.gif', '1', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('18', 'categories/subcategory_simulation.gif', '2', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('19', 'categories/subcategory_action_games.gif', '2', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('20', 'categories/subcategory_strategy.gif', '2', '0', '2003-12-23 03:18:19', null, '1');
INSERT INTO `categories` VALUES ('21', 'categories/gv_25.gif', '0', '4', '2003-12-23 03:18:19', '2004-05-21 00:26:06', '1');
INSERT INTO `categories` VALUES ('22', 'categories/box_of_color.gif', '0', '5', '2003-12-23 03:18:19', '2004-05-21 00:28:43', '1');
INSERT INTO `categories` VALUES ('23', 'waybkgnd.gif', '0', '500', '2003-12-28 02:26:19', '2003-12-29 23:21:35', '1');
INSERT INTO `categories` VALUES ('24', 'categories/category_free.gif', '0', '600', '2003-12-28 11:48:46', '2004-01-02 19:13:45', '1');
INSERT INTO `categories` VALUES ('25', 'sample_image.gif', '0', '515', '2003-12-31 02:39:17', '2004-01-24 01:49:12', '1');
INSERT INTO `categories` VALUES ('27', 'sample_image.gif', '49', '10', '2004-01-04 14:13:08', '2004-01-24 16:16:23', '1');
INSERT INTO `categories` VALUES ('28', 'sample_image.gif', '0', '510', '2004-01-04 17:13:47', '2004-01-05 23:54:23', '1');
INSERT INTO `categories` VALUES ('31', 'sample_image.gif', '48', '30', '2004-01-04 23:16:46', '2004-01-24 01:48:29', '1');
INSERT INTO `categories` VALUES ('32', 'sample_image.gif', '48', '40', '2004-01-05 01:34:56', '2004-01-24 01:48:36', '1');
INSERT INTO `categories` VALUES ('33', 'categories/subcategory.gif', '0', '700', '2004-01-05 02:08:31', '2004-05-20 10:35:31', '1');
INSERT INTO `categories` VALUES ('34', 'categories/subcategory.gif', '33', '10', '2004-01-05 02:08:50', '2004-05-20 10:35:57', '1');
INSERT INTO `categories` VALUES ('35', 'categories/subcategory.gif', '33', '20', '2004-01-05 02:09:01', '2004-01-24 00:07:33', '1');
INSERT INTO `categories` VALUES ('36', 'categories/subcategory.gif', '33', '30', '2004-01-05 02:09:12', '2004-01-24 00:07:41', '1');
INSERT INTO `categories` VALUES ('37', 'categories/subcategory.gif', '35', '10', '2004-01-05 02:09:28', '2004-01-24 00:22:39', '1');
INSERT INTO `categories` VALUES ('38', 'categories/subcategory.gif', '35', '20', '2004-01-05 02:09:39', '2004-01-24 00:22:46', '1');
INSERT INTO `categories` VALUES ('39', 'categories/subcategory.gif', '35', '30', '2004-01-05 02:09:49', '2004-01-24 00:22:53', '1');
INSERT INTO `categories` VALUES ('40', 'categories/subcategory.gif', '34', '10', '2004-01-05 02:17:27', '2004-05-20 10:36:19', '1');
INSERT INTO `categories` VALUES ('41', 'categories/subcategory.gif', '36', '10', '2004-01-05 02:21:02', '2004-01-24 00:23:04', '1');
INSERT INTO `categories` VALUES ('42', 'categories/subcategory.gif', '36', '30', '2004-01-05 02:21:14', '2004-01-24 00:23:18', '1');
INSERT INTO `categories` VALUES ('43', 'categories/subcategory.gif', '34', '20', '2004-01-05 02:21:29', '2004-01-24 00:21:37', '1');
INSERT INTO `categories` VALUES ('44', 'categories/subcategory.gif', '36', '20', '2004-01-05 02:21:47', '2004-01-24 00:23:11', '1');
INSERT INTO `categories` VALUES ('45', 'sample_image.gif', '48', '10', '2004-01-05 23:54:56', '2004-01-24 01:48:22', '1');
INSERT INTO `categories` VALUES ('46', 'sample_image.gif', '50', '10', '2004-01-06 00:01:48', '2004-01-24 01:39:56', '1');
INSERT INTO `categories` VALUES ('47', 'sample_image.gif', '48', '20', '2004-01-06 03:09:57', '2004-01-24 01:48:05', '1');
INSERT INTO `categories` VALUES ('48', 'sample_image.gif', '0', '1000', '2004-01-07 02:24:07', '2004-01-07 02:44:26', '1');
INSERT INTO `categories` VALUES ('49', 'sample_image.gif', '0', '1100', '2004-01-07 02:27:31', '2004-01-07 02:44:34', '1');
INSERT INTO `categories` VALUES ('50', 'sample_image.gif', '0', '1200', '2004-01-07 02:28:18', '2004-01-07 02:47:19', '1');
INSERT INTO `categories` VALUES ('51', 'sample_image.gif', '50', '20', '2004-01-07 02:33:55', '2004-01-24 01:40:05', '1');
INSERT INTO `categories` VALUES ('52', 'sample_image.gif', '49', '20', '2004-01-24 16:09:35', '2004-01-24 16:16:33', '1');
INSERT INTO `categories` VALUES ('53', 'categories/subcategory.gif', '0', '1500', '2004-04-25 23:07:41', null, '1');
INSERT INTO `categories` VALUES ('54', 'categories/subcategory.gif', '0', '1510', '2004-04-26 12:02:35', '2004-05-20 11:45:20', '1');
INSERT INTO `categories` VALUES ('55', 'categories/subcategory.gif', '54', '0', '2004-04-28 01:48:47', '2004-05-20 11:45:51', '1');
INSERT INTO `categories` VALUES ('56', 'categories/subcategory.gif', '54', '0', '2004-04-28 01:49:16', '2004-04-28 01:53:14', '1');
INSERT INTO `categories` VALUES ('57', 'categories/subcategory.gif', '54', '0', '2004-05-01 01:29:13', null, '1');
INSERT INTO `categories` VALUES ('58', 'categories/subcategory.gif', '54', '110', '2004-05-02 12:35:02', '2004-05-18 10:46:13', '1');
INSERT INTO `categories` VALUES ('60', 'categories/subcategory.gif', '54', '0', '2004-05-02 23:45:21', null, '1');
INSERT INTO `categories` VALUES ('61', 'categories/subcategory.gif', '54', '100', '2004-05-18 10:13:46', '2004-05-18 10:46:02', '1');
INSERT INTO `categories` VALUES ('62', 'sample_image.gif', '0', '1520', '2003-12-23 03:18:19', '2004-05-22 21:14:57', '1');
INSERT INTO `categories` VALUES ('63', 'categories/subcategory.gif', '0', '1530', '2003-12-23 03:18:19', '2004-07-12 17:45:24', '1');
INSERT INTO `categories` VALUES ('64', 'categories/subcategory.gif', '0', '1550', '2004-07-12 15:22:27', null, '1');

-- ----------------------------
-- Table structure for `categories_description`
-- ----------------------------
DROP TABLE IF EXISTS `categories_description`;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories_description
-- ----------------------------
INSERT INTO `categories_description` VALUES ('1', '1', 'Hardware', 'We offer a variety of Hardware from printers to graphics cards and mice to keyboards.');
INSERT INTO `categories_description` VALUES ('1', '2', '硬件', '我们提供各种各样的硬件，从打印机到显卡、鼠标、键盘等。');
INSERT INTO `categories_description` VALUES ('2', '1', 'Software', 'Select from an exciting list of software titles. <br /><br />Not seeing a title that you are looking for?');
INSERT INTO `categories_description` VALUES ('2', '2', '软件', '选择各款软件。<br /><br />没看到您想要的吗?');
INSERT INTO `categories_description` VALUES ('3', '1', 'DVD Movies', 'We offer a variety of DVD movies enjoyable for the whole family.<br /><br />Please browse the various categories to find your favorite movie today!');
INSERT INTO `categories_description` VALUES ('3', '2', '影视', '我们提供各种DVD电影，老少皆宜。<br /><br />请查看分类目录。');
INSERT INTO `categories_description` VALUES ('4', '1', 'Graphics Cards', '');
INSERT INTO `categories_description` VALUES ('4', '2', '显卡', '');
INSERT INTO `categories_description` VALUES ('5', '1', 'Printers', '');
INSERT INTO `categories_description` VALUES ('5', '2', '打印机', '');
INSERT INTO `categories_description` VALUES ('6', '1', 'Monitors', '');
INSERT INTO `categories_description` VALUES ('6', '2', '显示器', '');
INSERT INTO `categories_description` VALUES ('7', '1', 'Speakers', '');
INSERT INTO `categories_description` VALUES ('7', '2', '音箱', '');
INSERT INTO `categories_description` VALUES ('8', '1', 'Keyboards', '');
INSERT INTO `categories_description` VALUES ('8', '2', '键盘', '');
INSERT INTO `categories_description` VALUES ('9', '1', 'Mice', 'Pick the right mouse for your individual computer needs!<br /><br />Contact Us if you are looking for a particular mouse that we do not currently have in stock.');
INSERT INTO `categories_description` VALUES ('9', '2', '鼠标', '选择适合您的鼠标!<br /><br />如果您没有找到想要的鼠标，请联系我们。');
INSERT INTO `categories_description` VALUES ('10', '1', 'Action', '<p>Get into the action with our Action collection of DVD movies!<br /><br />Don\'t miss the excitement and order your\'s today!<br /><br /></p>');
INSERT INTO `categories_description` VALUES ('10', '2', '动作', '<p>动作大片！<br /><br />不要错过精彩片断，现在就购买！<br /><br /></p>');
INSERT INTO `categories_description` VALUES ('11', '1', 'Science Fiction', '');
INSERT INTO `categories_description` VALUES ('11', '2', '科幻', '');
INSERT INTO `categories_description` VALUES ('12', '1', 'Comedy', '');
INSERT INTO `categories_description` VALUES ('12', '2', '喜剧', '');
INSERT INTO `categories_description` VALUES ('13', '1', 'Cartoons', 'Something you can enjoy with children of all ages!');
INSERT INTO `categories_description` VALUES ('13', '2', '卡通', '适于各年龄段的儿童!');
INSERT INTO `categories_description` VALUES ('14', '1', 'Thriller', '');
INSERT INTO `categories_description` VALUES ('14', '2', '惊险', '');
INSERT INTO `categories_description` VALUES ('15', '1', 'Drama', '');
INSERT INTO `categories_description` VALUES ('15', '2', '戏剧', '');
INSERT INTO `categories_description` VALUES ('16', '1', 'Memory', '');
INSERT INTO `categories_description` VALUES ('16', '2', '内存', '');
INSERT INTO `categories_description` VALUES ('17', '1', 'CDROM Drives', '');
INSERT INTO `categories_description` VALUES ('17', '2', '光驱', '');
INSERT INTO `categories_description` VALUES ('18', '1', 'Simulation', '');
INSERT INTO `categories_description` VALUES ('18', '2', '模拟', '');
INSERT INTO `categories_description` VALUES ('19', '1', 'Action', '');
INSERT INTO `categories_description` VALUES ('19', '2', '动作', '');
INSERT INTO `categories_description` VALUES ('20', '1', 'Strategy', '');
INSERT INTO `categories_description` VALUES ('20', '2', '策略', '');
INSERT INTO `categories_description` VALUES ('21', '1', 'Gift Certificates', 'Send a Gift Certificate today!<br /><br />Gift Certificates are good for anything in the store.');
INSERT INTO `categories_description` VALUES ('21', '2', '礼券', '现在就发送礼券!<br /><br />礼券适用于商店内的任何商品。');
INSERT INTO `categories_description` VALUES ('22', '1', 'Big Linked', 'All of these products are &quot;Linked Products&quot;.<br /><br />This means that they appear in more than one Category.<br /><br />However, you only have to maintain the product in one place.<br /><br />The Master Product is used for pricing purposes.');
INSERT INTO `categories_description` VALUES ('22', '2', '链接商品', '所有这些商品都是&quot;链接&quot;商品。<br /><br />表明他们出现在不止一个分类中。<br /><br />但您只要在一个地方进行维护。<br /><br />主商品用于定价。');
INSERT INTO `categories_description` VALUES ('23', '1', 'Test Examples', '');
INSERT INTO `categories_description` VALUES ('23', '2', '测试样品', '');
INSERT INTO `categories_description` VALUES ('24', '1', 'Free Call Stuff', '');
INSERT INTO `categories_description` VALUES ('24', '2', '免费赠品', '');
INSERT INTO `categories_description` VALUES ('25', '1', 'Test 10% by Attrib', '');
INSERT INTO `categories_description` VALUES ('25', '2', '属性九折测试', '');
INSERT INTO `categories_description` VALUES ('27', '1', '$5.00 off', '');
INSERT INTO `categories_description` VALUES ('27', '2', '优惠5元', '');
INSERT INTO `categories_description` VALUES ('28', '1', 'Test 10%', '');
INSERT INTO `categories_description` VALUES ('28', '2', '九折测试', '');
INSERT INTO `categories_description` VALUES ('31', '1', '10% off Skip', '');
INSERT INTO `categories_description` VALUES ('31', '2', '忽略九折', '');
INSERT INTO `categories_description` VALUES ('32', '1', '10% off Price', '');
INSERT INTO `categories_description` VALUES ('32', '2', '原价九折', '');
INSERT INTO `categories_description` VALUES ('33', '1', 'A Top Level Cat', '<p>This is a top level category description.</p>');
INSERT INTO `categories_description` VALUES ('33', '2', '总分类', '<p>总分类的说明。</p>');
INSERT INTO `categories_description` VALUES ('34', '1', 'SubLevel 2 A', 'This is a sublevel category description.');
INSERT INTO `categories_description` VALUES ('34', '2', '子分类 2A', '子分类2A的说明。');
INSERT INTO `categories_description` VALUES ('35', '1', 'SubLevel 2 B', '');
INSERT INTO `categories_description` VALUES ('35', '2', '子分类 2B', '子分类2B的说明。');
INSERT INTO `categories_description` VALUES ('36', '1', 'SubLevel 2 C', '');
INSERT INTO `categories_description` VALUES ('36', '2', '子分类 2C', '子分类2C的说明。');
INSERT INTO `categories_description` VALUES ('37', '1', 'Sub Sub Cat 2B1', '');
INSERT INTO `categories_description` VALUES ('37', '2', '子分类 2B1', '子分类2B1的说明。');
INSERT INTO `categories_description` VALUES ('38', '1', 'Sub Sub Cat 2B2', '');
INSERT INTO `categories_description` VALUES ('38', '2', '子分类 2B2', '子分类2B2的说明。');
INSERT INTO `categories_description` VALUES ('39', '1', 'Sub Sub Cat 2B3', '');
INSERT INTO `categories_description` VALUES ('39', '2', '子分类 2B3', '子分类2B3的说明。');
INSERT INTO `categories_description` VALUES ('40', '1', 'Sub Sub Cat 2A1', 'This is a sub-sub level category description.');
INSERT INTO `categories_description` VALUES ('40', '2', '子分类 2A1', '子分类2A1的说明。');
INSERT INTO `categories_description` VALUES ('41', '1', 'Sub Sub Cat 2C1', '');
INSERT INTO `categories_description` VALUES ('41', '2', '子分类 2C1', '子分类2C1的说明。');
INSERT INTO `categories_description` VALUES ('42', '1', 'Sub Sub Cat 2C3', '');
INSERT INTO `categories_description` VALUES ('42', '2', '子分类 2C3', '子分类2C3的说明。');
INSERT INTO `categories_description` VALUES ('43', '1', 'Sub Sub Cat 2A2', '');
INSERT INTO `categories_description` VALUES ('43', '2', '子分类 2A2', '子分类2A2的说明。');
INSERT INTO `categories_description` VALUES ('44', '1', 'Sub Sub Cat 2C2', '');
INSERT INTO `categories_description` VALUES ('44', '2', '子分类 2C2', '子分类2C2的说明。');
INSERT INTO `categories_description` VALUES ('45', '1', '10% off', '');
INSERT INTO `categories_description` VALUES ('45', '2', '九折', '');
INSERT INTO `categories_description` VALUES ('46', '1', 'Set $100', '');
INSERT INTO `categories_description` VALUES ('46', '2', '促销价100元', '');
INSERT INTO `categories_description` VALUES ('47', '1', '10% off Attrib', '');
INSERT INTO `categories_description` VALUES ('47', '2', '属性九折', '');
INSERT INTO `categories_description` VALUES ('48', '1', 'Sale Percentage', '');
INSERT INTO `categories_description` VALUES ('48', '2', '促销商品', '');
INSERT INTO `categories_description` VALUES ('49', '1', 'Sale Deduction', '');
INSERT INTO `categories_description` VALUES ('49', '2', '减价商品', '');
INSERT INTO `categories_description` VALUES ('50', '1', 'Sale New Price', '');
INSERT INTO `categories_description` VALUES ('50', '2', '促销价格', '');
INSERT INTO `categories_description` VALUES ('51', '1', 'Set $100 Skip', '');
INSERT INTO `categories_description` VALUES ('51', '2', '促销价100元无条件', '');
INSERT INTO `categories_description` VALUES ('52', '1', '$5.00 off Skip', '');
INSERT INTO `categories_description` VALUES ('52', '2', '优惠5元 无条件', '');
INSERT INTO `categories_description` VALUES ('53', '1', 'Big Unlinked', '');
INSERT INTO `categories_description` VALUES ('53', '2', '无链接商品', '');
INSERT INTO `categories_description` VALUES ('54', '1', 'New v1.2', '<p>The New Products show many of the newest features that have been added to Zen Cart.<br /><br />Take the time to review these and the other Demo Products to better understand all the options and features that Zen Cart has to offer.</p>');
INSERT INTO `categories_description` VALUES ('54', '2', '新特性商品', '<p>新商品演示了Zen Cart新增的很多功能。<br /><br />花点时间看看演示商品，更好地了解Zen Cart提供的所有选项和功能。</p>');
INSERT INTO `categories_description` VALUES ('55', '1', 'Discount Qty', '<p>Discount Quantities can be set for Products or on the individual attributes.<br /><br />Discounts on the Product do NOT reflect on the attributes price.<br /><br />Only discounts based on Special and Sale Prices are applied to attribute prices.</p>');
INSERT INTO `categories_description` VALUES ('55', '2', '批量优惠', '<p>批量优惠可以应用在商品或单个属性上。<br /><br />用于商品的优惠不影响属性价格。<br /><br />仅特价和促销的优惠应用于属性价格。</p>');
INSERT INTO `categories_description` VALUES ('56', '1', 'Attributes', '');
INSERT INTO `categories_description` VALUES ('56', '2', '属性', '');
INSERT INTO `categories_description` VALUES ('57', '1', 'Text Pricing', '');
INSERT INTO `categories_description` VALUES ('57', '2', '文字价格', '');
INSERT INTO `categories_description` VALUES ('58', '1', 'Real Sale', '');
INSERT INTO `categories_description` VALUES ('58', '2', '销售', '');
INSERT INTO `categories_description` VALUES ('60', '1', 'Downloads', '');
INSERT INTO `categories_description` VALUES ('60', '2', '下载', '');
INSERT INTO `categories_description` VALUES ('61', '1', 'Real', '');
INSERT INTO `categories_description` VALUES ('61', '2', '实物', '');
INSERT INTO `categories_description` VALUES ('62', '1', 'Music', '');
INSERT INTO `categories_description` VALUES ('62', '2', '音乐', '');
INSERT INTO `categories_description` VALUES ('63', '1', 'Documents', 'Documents can now be added to the category tree. For example you may want to add servicing/Technical documents. Or use Documents as an integrated FAQ system on your site. The implemetation here is fairly spartan, but could be expanded to offer PDF downloads, links to purchaseable download files. The possibilities are endless and left to your imagination.');
INSERT INTO `categories_description` VALUES ('63', '2', '文档', '现在可以添加文档到分类目录。例如，增加服务/技术文档，或用作集成常见问答栏目。结构很简单，但可以扩展为提供PDF下载、链接到购买下载文件，用途非常广泛。');
INSERT INTO `categories_description` VALUES ('64', '1', 'Mixed Product Types', 'This is a category with mixed product types.\r\n\r\nThis includes both products and documents. There are two types of documents - Documents that are for reading and Documents that are for reading and purchasing.');
INSERT INTO `categories_description` VALUES ('64', '2', '混合商品类型', '本分类含不同类型的商品。\r\n\r\n包含普通商品和文档商品。两种类型的文档 - 供阅读的文档和可阅读并购买的文档。');

-- ----------------------------
-- Table structure for `configuration`
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configuration
-- ----------------------------
INSERT INTO `configuration` VALUES ('1', '商店名称', 'STORE_NAME', '我的商店', '商店名称', '1', '1', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('2', '店主', 'STORE_OWNER', 'lirui', '店主的名字', '1', '2', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('3', '客服电话', 'STORE_TELEPHONE_CUSTSERVICE', '', '请输入客服电话，可能用于支付处理。', '1', '3', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('4', '国家或地区', 'STORE_COUNTRY', '44', '商店所在的国家或地区 <br /><br /><strong>备注: 请记住更新商店所在地区。</strong>', '1', '6', null, '2018-08-08 12:33:56', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(');
INSERT INTO `configuration` VALUES ('5', '地区', 'STORE_ZONE', '131', '商店所在地区', '1', '7', null, '2018-08-08 12:33:56', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list(');
INSERT INTO `configuration` VALUES ('6', '预售商品排序', 'EXPECTED_PRODUCTS_SORT', 'desc', '预售商品方框的排序.', '1', '8', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'asc\', \'desc\'), ');
INSERT INTO `configuration` VALUES ('7', '预售商品排序字段', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', '预售商品方框的排序字段.', '1', '9', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), ');
INSERT INTO `configuration` VALUES ('8', '使用缺省语言货币', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'true', '自动转换到选择语言的相应货币', '1', '10', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('9', '语言选择', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', '商店缺省的语言选择为商店的设置，还是用户浏览器中的设置？<br /><br />Default: 商店的缺省设置', '1', '11', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'Default\', \'Browser\'), ');
INSERT INTO `configuration` VALUES ('10', '使用搜索引擎友好的URLs (还在开发中)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', '6', '12', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('11', '添加商品后显示购物车', 'DISPLAY_CART', 'true', '添加商品后显示购物车 (或退回原来的状态)', '1', '14', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('12', '缺省搜索操作', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', '缺省搜索操作', '1', '17', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'and\', \'or\'), ');
INSERT INTO `configuration` VALUES ('13', '商店地址和电话', 'STORE_NAME_ADDRESS', '商店名称\r\n 地址\r\n 国家\r\n 电话', '商店名称, 地址和电话号码, 用于打印文件和在线显示', '1', '7', null, '2018-08-08 12:33:56', null, 'zen_cfg_textarea(');
INSERT INTO `configuration` VALUES ('14', '显示分类计数', 'SHOW_COUNTS', 'false', '递归计算分类中商品数量', '1', '19', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('15', '税收小数位', 'TAX_DECIMAL_PLACES', '0', '税收金额的小数位', '1', '20', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('16', '显示含税价格', 'DISPLAY_PRICE_WITH_TAX', 'false', '显示含税价格 (True) 或 最后再加税 (False)', '1', '21', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('17', '在管理页面中显示含税价格', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', '在管理页面中(发票), 显示含税价格 (True) 或 最后再加税 (False)', '1', '21', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('18', '商品税的计算', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', '计算商品税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址', '1', '21', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `configuration` VALUES ('19', '运费税的计算', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', '计算运费税的基准. 选项为<br />Shipping - 基于送货地址<br />Billing 基于客户帐单地址<br />Store - 如果Billing/Shipping地区和商店所在地区相同, 采用商店的地址 - 货运模块可以覆盖该设置', '1', '21', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `configuration` VALUES ('20', '销售税显示', 'STORE_TAX_DISPLAY_STATUS', '0', '即使金额为零也显示销售税<br />0= 否<br />1= 是', '1', '21', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('21', '分开显示税项', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', '如果有多个税项，结帐时每个税项单独显示一行', '1', '22', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('22', 'PA-DSS 管理页面 Session 超时设置?', 'PADSS_ADMIN_SESSION_TIMEOUT_ENFORCED', '1', 'PA-DSS 规范要求管理页面在15分钟没有操作时关闭。<strong>禁用后网站不符合 PA-DSS 规范。</strong>', '1', '30', '2018-08-08 12:33:56', '2018-08-08 12:33:56', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO `configuration` VALUES ('23', 'PA-DSS 高强度密码设置?', 'PADSS_PWD_EXPIRY_ENFORCED', '1', 'PA-DSS 规范要求管理员密码90天必须修改，且不能使用最近4次密码。<strong>禁用后网站不符合 PA-DSS 规范。</strong>', '1', '30', '2018-08-08 12:33:56', '2018-08-08 12:33:56', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO `configuration` VALUES ('24', 'PA-DSS Ajax 结帐?', 'PADSS_AJAX_CHECKOUT', '1', 'PA-DSS 兼容要求支付模块使用 ajax 生成结帐确认页面。<strong>禁用后网站不符合 PA-DSS 规范。</strong>', '1', '30', '2018-08-08 12:33:56', '2018-08-08 12:33:56', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),');
INSERT INTO `configuration` VALUES ('25', '管理对话超时秒数', 'SESSION_TIMEOUT_ADMIN', '900', '输入以秒为单位的时间。<br />PCI 兼容要求最大不超过 900 。<br /> 默认=900<br />例如: 900= 15 分钟<br /><br />备注: 时间太短会导致添加/编辑商品时超时', '1', '40', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('26', '管理设置最大进程执行时间', 'GLOBAL_SET_TIME_LIMIT', '60', '输入以秒为单位的时间, 管理设置最大进程执行时间。<br />缺省=60 秒<br />例如: 60= 1 分钟<br /><br />备注: 仅当您进程执行时间有问题时, 才需要修改该时间限制', '1', '42', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('27', '显示是否有新版本', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', '自动显示是否有Zen Cart新版本。打开该选项有时会降低管理页面打开时间。(显示于登录后的主索引页面和服务器信息页面)', '1', '44', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('28', '商店模式', 'STORE_STATUS', '0', '商店模式<br />0= 正常<br />1= 商品展示, 不显示价格<br />2= 商品展示, 显示价格', '1', '25', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('29', '服务器运行时数', 'DISPLAY_SERVER_UPTIME', 'true', '显示服务器运行时数在某些服务器上会导致日志文件中有错误记录。(true = 显示, false = 不显示)', '1', '46', '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('30', '丢失页面检测', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart能够检测不存在的页面并自动调转到索引页面。调试时可关闭该选项。<br /><br /><strong>缺省=On</strong><br />On = 如有不存在的页面，调整到\'index\'<br />Off = 不检测不存在的页面<br />Page Not Found = 显示页面不存在的提示页面', '1', '48', '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),');
INSERT INTO `configuration` VALUES ('31', 'cURL代理服务器状态', 'CURL_PROXY_REQUIRED', 'False', '您的cURL是否使用代理服务器?', '6', '50', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('32', 'cURL代理服务器地址', 'CURL_PROXY_SERVER_DETAILS', '', '如果您的主机需要通过cURL使用代理服务器，在这里输入地址。<br />格式: 地址:端口<br />例如: 127.0.0.1:3128', '6', '51', null, '2018-08-08 12:33:56', null, null);
INSERT INTO `configuration` VALUES ('33', 'HTML编辑器', 'HTML_EDITOR_PREFERENCE', 'NONE', '请选择用于管理电子邮件、电子商情和商品简介的文本编辑器。', '1', '110', null, '2018-08-08 12:33:56', null, 'zen_cfg_pull_down_htmleditors(');
INSERT INTO `configuration` VALUES ('34', '打开phpBB链接?', 'PHPBB_LINKS_ENABLED', 'false', 'Zen Cart的新帐号要和您的(已安装)phpBB论坛同步吗?', '1', '120', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('35', '显示分类计数 - 管理员', 'SHOW_COUNTS_ADMIN', 'true', '在管理页面显示分类计数吗?', '1', '19', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('36', '显示分类的链接状态', 'SHOW_CATEGORY_PRODUCTS_LINKED_STATUS', 'true', '显示分类产品链接状态?', '1', '19', null, '2018-08-08 12:33:56', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('37', '货币兑换比率', 'CURRENCY_UPLIFT_RATIO', '1.05', '自动更新汇率时，需要使用的\"额外\"比率是多少？<br />例如: 从汇率服务器更新银行汇率后，您要在银行汇率基础上增加多少比例来设置给客户的汇率？<br /><br /><strong>缺省: 1.05 </strong><br />将公布的银行汇率乘以1.05作为商店的汇率。', '1', '55', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('38', '名字', 'ENTRY_FIRST_NAME_MIN_LENGTH', '1', '名字最少字数', '2', '1', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('39', '姓氏', 'ENTRY_LAST_NAME_MIN_LENGTH', '1', '姓氏最少字数', '2', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('40', '生日', 'ENTRY_DOB_MIN_LENGTH', '10', '生日最少字数', '2', '3', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('41', '电子邮件', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', '电子邮件地址最少字数', '2', '4', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('42', '地址', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '4', '地址最少字数', '2', '5', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('43', '公司', 'ENTRY_COMPANY_MIN_LENGTH', '0', '公司名称最少字数', '2', '6', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('44', '邮编', 'ENTRY_POSTCODE_MIN_LENGTH', '4', '邮编最少字数', '2', '7', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('45', '城市', 'ENTRY_CITY_MIN_LENGTH', '2', '城市最少字数', '2', '8', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('46', '省份', 'ENTRY_STATE_MIN_LENGTH', '2', '省份最少字数', '2', '9', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('47', '电话号码', 'ENTRY_TELEPHONE_MIN_LENGTH', '6', '电话号码最少字数', '2', '10', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('48', '密码', 'ENTRY_PASSWORD_MIN_LENGTH', '7', '密码最少字数', '2', '11', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('49', '信用卡持卡人姓名', 'CC_OWNER_MIN_LENGTH', '2', '信用卡持卡人姓名最少字数', '2', '12', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('50', '信用卡号', 'CC_NUMBER_MIN_LENGTH', '10', '信用卡号码最少字数', '2', '13', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('51', '信用卡CVV校验码', 'CC_CVV_MIN_LENGTH', '3', '信用卡CVV校验码最少字数', '2', '13', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('52', '商品评论文字', 'REVIEW_TEXT_MIN_LENGTH', '1', '商品评论文字最少字数', '2', '14', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('53', '畅销商品', 'MIN_DISPLAY_BESTSELLERS', '1', '成为畅销商品的最小销售数量', '2', '15', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('54', '同时购买商品', 'MIN_DISPLAY_ALSO_PURCHASED', '1', '显示为客户同时购买商品的最少数量', '2', '16', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('55', '昵称', 'ENTRY_NICK_MIN_LENGTH', '1', '昵称最少字数', '2', '1', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('56', '地址簿条目', 'MAX_ADDRESS_BOOK_ENTRIES', '5', '每个客户地址簿中最多允许的条目', '3', '1', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('57', '管理页面每页搜索结果', 'MAX_DISPLAY_SEARCH_RESULTS', '20', '管理页面搜索结果的商品数量', '3', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('58', '前/后页导航页链接', 'MAX_DISPLAY_PAGE_LINKS', '5', '导航链接显示的数目的数量', '3', '3', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('59', '首页新进商品数量', 'MAX_DISPLAY_NEW_PRODUCTS', '9', '显示在首页的新进商品数量', '3', '4', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('60', '首页推荐商品数量', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '9', '显示在首页的推荐商品数量', '3', '5', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('61', '首页特价商品数量', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '10', '显示在首页的特价商品数量', '3', '6', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('62', '预售商品数量', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', '显示的预售商品数量', '3', '7', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('63', '特价商品列表数量', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '6', '特价商品列表每页显示的商品数量', '3', '8', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('64', '新进商品列表数量', 'MAX_DISPLAY_PRODUCTS_NEW', '10', '新进商品列表每页显示的商品数量', '3', '9', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('65', '推荐商品列表数量', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', '推荐商品列表每页显示的商品数量', '3', '29', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('66', '所有商品列表数量', 'MAX_DISPLAY_PRODUCTS_ALL', '10', '所有商品列表每页显示的商品数量', '3', '11', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('67', '分类商品列表数量', 'MAX_DISPLAY_PRODUCTS_LISTING', '10', '分类商品列表每页显示的商品数量', '3', '12', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('68', '畅销商品数量', 'MAX_DISPLAY_BESTSELLERS', '10', '畅销商品数量', '3', '13', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('69', '同时购买商品数量', 'MAX_DISPLAY_ALSO_PURCHASED', '6', '\'客户同时购买的商品\'方框中显示的商品数量', '3', '14', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('70', '边框中随机推荐商品数量', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', '在边框中显示的随机推荐商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '15', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('71', '边框中随机新进商品数量', 'MAX_RANDOM_SELECT_NEW', '3', '在边框中显示的随机新进商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '16', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('72', '边框中随机特价商品数量', 'MAX_RANDOM_SELECT_SPECIALS', '2', '在边框中显示的随机特价商品的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '17', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('73', '边框中随机商品评论数量', 'MAX_RANDOM_SELECT_REVIEWS', '1', '在边框中显示的随机商品评论的数量<br />输入在本边框中同时显示的商品数量。<br /><br />本边框中显示多少商品?', '3', '18', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('74', '每页商品评论数量', 'MAX_DISPLAY_NEW_REVIEWS', '6', '每页显示的商品评论数量', '3', '19', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('75', '厂商列表 - 滚动栏大小/样式', 'MAX_MANUFACTURERS_LIST', '3', '滚动栏窗口里显示的厂商数目。如果设为1或0显示下拉菜单', '3', '20', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('76', '厂商列表 - 检验商品存在', 'PRODUCTS_MANUFACTURERS_STATUS', '1', '要显示厂商名字，保证至少存在一个有效商品<br /><br />提示: 当该开关为开启时，如果有很多商品或厂商，会影响网站速度<br />0= 关 1= 开', '3', '21', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('77', '音乐类型列表 - 滚动栏大小/样式', 'MAX_MUSIC_GENRES_LIST', '3', '滚动栏窗口里显示的音乐类型数目. 如果设为1或0会显示下拉菜单。', '3', '22', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('78', '唱片公司列表 - 滚动栏大小/样式', 'MAX_RECORD_COMPANY_LIST', '3', '滚动栏窗口里显示的唱片公司数目. 如果设为1或0会显示下拉菜单。', '3', '23', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('79', '唱片公司名称长度', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', '用于唱片公司栏; 唱片公司名称显示的最大长度. 太长的名字会被截断.', '3', '24', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('80', '音乐类型名称长度', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', '用于音乐类型栏; 音乐类型名称显示的最大长度. 太长的名字会被截断.', '3', '25', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('81', '厂商名字长度', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', '用于厂商栏; 厂商名字显示的最大长度. 太长的名字会被截断.', '3', '26', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('82', '每行分类数目', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', '每行分类数目', '3', '27', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('83', '最近购买边框- 备注: 边框已关闭', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', '最近购买边框中显示的商品数量', '3', '28', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('84', '每页显示的客户订单数', 'MAX_DISPLAY_ORDER_HISTORY', '10', '\'我的帐号\'订单历史中显示的订单数目', '3', '29', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('85', '客户页显示最大客户数', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', '3', '30', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('86', '订单页显示最大订单数', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', '3', '31', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('87', '分析系统页面显示的商品数', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', '3', '32', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('88', '最大分类商品显示列表', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', '每页显示的商品数目', '3', '33', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('89', '商品属性 - 选项名称和值的显示', 'MAX_ROW_LISTS_OPTIONS', '10', '显示在商品属性页面的选项名称和值的数量', '3', '34', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('90', '商品属性 - 属性数量的显示', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', '显示在商品属性控制页面的属性数量', '3', '35', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('91', '商品属性 - 下载管理显示', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', '下载管理页面显示的下载数量', '3', '36', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('92', '推荐商品 - 显示在管理页面的数量', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', '管理页面下每屏的推荐商品数量', '3', '37', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('93', '新进商品的定义', 'SHOW_NEW_PRODUCTS_LIMIT', '0', '新进商品列表的定义<br />0= 所有商品<br />1= 当前月份<br />7= 7 天<br />14= 14 天<br />30= 30 天<br />60= 60 天<br />90= 90 天<br />120= 120 天', '3', '40', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ');
INSERT INTO `configuration` VALUES ('94', '显示语言图标的数目', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', '语言边框中每行显示的语言图标的数目', '3', '50', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('95', '最大文件上传大小', 'MAX_FILE_UPLOAD_SIZE', '2048000', '允许上传文件的大小<br />缺省= 2048000', '3', '60', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('96', '允许上传的文件名后缀', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', '列出允许客户上传到您网站的文件类型 (文件名后缀)。用逗号(,)分开。不要包含点(.)。<br /><br />建议设置: \"jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip\"', '3', '61', null, '2018-08-08 12:33:57', null, 'zen_cfg_textarea(');
INSERT INTO `configuration` VALUES ('97', '管理订单下显示的订单内容', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', '最多订单内容数<br />0 = 无限制', '3', '65', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('98', '管理页面显示的PayPal IPN的数量', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', '管理页面显示PayPal IPN的数量<br />缺省为20', '3', '66', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('99', '商品链接多个分类的显示', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', '商品链接到多个分类的管理界面下，显示的列数<br />3 = 缺省', '3', '70', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('100', '简易页面的显示数量', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', '简易页面的显示数量<br />20 = 缺省', '3', '71', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('101', '小图像宽度', 'SMALL_IMAGE_WIDTH', '100', '小图像象素宽度', '4', '1', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('102', '小图像高度', 'SMALL_IMAGE_HEIGHT', '80', '小图像象素高度', '4', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('103', '标题图像宽度 - 管理页面', 'HEADING_IMAGE_WIDTH', '57', '管理页面的标题图像象素宽度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像', '4', '3', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('104', '标题图像高度 - 管理页面', 'HEADING_IMAGE_HEIGHT', '40', '管理页面的标题图像象素高度<br />说明: 该值调整管理页面的间距，或可用在管理页面增加标题图像', '4', '4', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('105', '子分类图像宽度', 'SUBCATEGORY_IMAGE_WIDTH', '100', '子分类图像象素宽度', '4', '5', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('106', '子分类图像高度', 'SUBCATEGORY_IMAGE_HEIGHT', '57', '子分类图像象素高度', '4', '6', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('107', '计算图像尺寸', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', '是否计算图像尺寸?', '4', '7', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('108', '显示缺少的图像', 'IMAGE_REQUIRED', 'true', '显示缺少的图像。适合调试。', '4', '8', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('109', '图像 - 购物车状态', 'IMAGE_SHOPPING_CART_STATUS', '1', '是否在购物车中显示商品图像?<br />0= 否 1= 是', '4', '9', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('110', '图像 - 购物车宽度', 'IMAGE_SHOPPING_CART_WIDTH', '50', '缺省 = 50', '4', '10', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('111', '图像 - 购物车高度', 'IMAGE_SHOPPING_CART_HEIGHT', '40', '缺省 = 40', '4', '11', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('112', '分类图像宽度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_WIDTH', '57', '商品信息页面的分类图标的象素宽度', '4', '13', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('113', '分类图像高度 - 商品信息页面', 'CATEGORY_ICON_IMAGE_HEIGHT', '40', '商品信息页面的分类图标的象素高度', '4', '14', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('114', '含子分类的分类图像宽度', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', '含子分类的分类图像宽度', '4', '15', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('115', '含子分类的分类图像高度', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '85', '含子分类的分类图像高度', '4', '16', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('116', '商品信息 - 图像宽度', 'MEDIUM_IMAGE_WIDTH', '150', '商品信息图像的象素宽度', '4', '20', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('117', '商品信息 - 图像高度', 'MEDIUM_IMAGE_HEIGHT', '120', '商品信息图像的象素高度', '4', '21', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('118', '商品信息 - 中图像后缀', 'IMAGE_SUFFIX_MEDIUM', '_MED', '商品信息 - 中图像后缀<br />缺省 = _MED', '4', '22', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('119', '商品信息 - 大图像后缀', 'IMAGE_SUFFIX_LARGE', '_LRG', '商品信息 - 大图像后缀<br />缺省 = _LRG', '4', '23', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('120', '商品信息 - 每行附加图像数目', 'IMAGES_AUTO_ADDED', '3', '商品信息 - 每行附加图像数目<br />缺省 = 3', '4', '30', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('121', '图像 - 商品列表宽度', 'IMAGE_PRODUCT_LISTING_WIDTH', '100', '缺省 = 100', '4', '40', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('122', '图像 - 商品列表高度', 'IMAGE_PRODUCT_LISTING_HEIGHT', '80', '缺省 = 80', '4', '41', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('123', '图像 - 新进商品列表宽度', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '100', '缺省 = 100', '4', '42', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('124', '图像 - 新进商品列表高度', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '80', '缺省 = 80', '4', '43', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('125', '图像 - 新进商品宽度', 'IMAGE_PRODUCT_NEW_WIDTH', '100', '缺省 = 100', '4', '44', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('126', '图像 - 新进商品高度', 'IMAGE_PRODUCT_NEW_HEIGHT', '80', '缺省 = 80', '4', '45', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('127', '图像 - 推荐商品宽度', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '100', '缺省 = 100', '4', '46', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('128', '图像 - 推荐商品高度', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '80', '缺省 = 80', '4', '47', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('129', '图像 - 所有商品列表宽度', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '100', '缺省 = 100', '4', '48', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('130', '图像 - 所有商品列表高度', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '80', '缺省 = 80', '4', '49', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('131', '商品图像 - 缺省图象状态', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', '如果商品没有图像，是否使用缺省图象<br />0= 否<br />1= 是', '4', '60', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('132', '商品图像 - 缺省图象', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', '如果商品没有图像，使用的缺省图象的文件名<br />缺省 = no_picture.gif', '4', '61', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('133', '图像 - 商品和分类使用同比例的图像', 'PROPORTIONAL_IMAGES_STATUS', '1', '商品和分类使用同比例的图像吗?<br /><br />提示: 图像比例中不要设置高度或宽度为0<br />0= 关 1= 开', '4', '75', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('134', '称呼字段', 'ACCOUNT_GENDER', 'true', '创建帐号时显示性别选择字段，用于发送电子邮件时的称呼。', '5', '1', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('135', '生日字段', 'ACCOUNT_DOB', 'true', '创建帐号时显示生日字段<br />说明: 生日字段的最小值设置为空时，该字段为可选项<br />生日字段的最小值>0时为必选项', '5', '2', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('136', '公司字段', 'ACCOUNT_COMPANY', 'false', '创建帐号时显示公司字段', '5', '3', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('137', '地址行二', 'ACCOUNT_SUBURB', 'true', '创建帐号时显示地址行二字段', '5', '4', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('138', '省份', 'ACCOUNT_STATE', 'true', '创建帐号时显示省份字段', '5', '5', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('139', '省份 - 总是显示下拉菜单？', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', '省份总是显示为下拉菜单吗？', '5', '5', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('140', '创建帐号时的缺省国家', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', '设置新建帐号时的默认国家：<br />默认为美国', '5', '6', null, '2018-08-08 12:33:57', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none(');
INSERT INTO `configuration` VALUES ('141', '传真号码', 'ACCOUNT_FAX_NUMBER', 'true', '创建帐号时显示传真号码字段', '5', '10', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('142', '显示电子商情选择框', 'ACCOUNT_NEWSLETTER_STATUS', '1', '显示电子商情选择框<br />0= 否<br />1= 显示未选择<br />2= 显示已选择<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章</strong>', '5', '45', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('143', '缺省电子邮件格式', 'ACCOUNT_EMAIL_PREFERENCE', '0', '设置客户缺省电子邮件格式<br />0= 文本<br />1= HTML<br /><strong>提示: 将该值缺省为接受也许会违反您所在国或地区的规章。</strong>', '5', '46', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('144', '商品通知', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', '结帐时是否提示客户商品通知<br />0= 不提示<br />1= 提示 (除非已选择全局通知)<br /><br />提示: 边框要另外关闭', '5', '50', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('145', '购物模式 - 查看商品和价格', 'CUSTOMERS_APPROVAL', '0', '客户是否需要批准后才能购物<br />0= 不需要<br />1= 登录后才能浏览<br />2= 可以浏览，但登录后才显示价格<br />3= 演示用途<br /><br />建议选项 2 用于防止Spiders，如果您希望客户登录后才能查看价格。', '5', '55', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('146', '客户批准模式 - 授权等待中', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', '客户是否需要授权后才能购物<br />0= 不需要授权<br />1= 授权后才能浏览<br />2= 可以浏览，但授权后才显示价格<br />3= 客户可以浏览商品和价格，但需要授权后才可购物<br /><br />推荐使用选项 2 或 3 防止Spiders', '5', '65', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('147', '客户授权: 文件名', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', '客户授权的文件名<br />提示: 不要包含后缀<br />缺省=customers_authorization', '5', '66', null, '2018-08-08 12:33:57', null, '');
INSERT INTO `configuration` VALUES ('148', '客户授权: 隐藏页眉', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', '客户授权: 隐藏页眉 <br />(true=隐藏 false=显示)', '5', '67', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('149', '客户授权: 隐藏左栏目', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', '客户授权: 隐藏左栏目 <br />(true=隐藏 false=显示)', '5', '68', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('150', '客户授权: 隐藏右栏目', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', '客户授权: 隐藏右栏目 <br />(true=隐藏 false=显示)', '5', '69', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('151', '客户授权: 隐藏页脚', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', '客户授权: 隐藏页脚 <br />(true=隐藏 false=显示)', '5', '70', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('152', '客户授权: 隐藏价格', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', '客户授权: 隐藏价格 <br />(true=隐藏 false=显示)', '5', '71', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('153', '客户推荐模式', 'CUSTOMERS_REFERRAL_STATUS', '0', '客户推荐代码创建于<br />0= 关闭<br />1= 用户使用的第一张优惠券的号码<br />2= 客户可以在创建帐号时添加，如果为空可以编辑<br /><br />提示: 一旦客户推荐号码设置好，只能在客户管理下修改', '5', '80', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('154', '已安装支付模块', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php', '支付模块文件名用分号隔开。自动更新，无需编辑。(例如: freecharger.php;cod.php;paypal.php)', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('155', '已安装总额计算模块', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', '总额计算模块文件名用分号分开。自动更新，无需编辑。(例如: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('156', '已安装配送模块', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', '配送模块文件名用分号分开。自动更新，无需编辑。(例如: ups.php;flat.php;item.php)', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('157', '启用免运费模块', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', '要启用免运费模块吗?', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('158', '商店提货', 'MODULE_SHIPPING_STOREPICKUP_LOCATIONS_LIST', '自行提货', '输入以分号(;)分开的地点列表。<br>可以在每个地点后加上逗号和数字来设定一个手续费。如果没有设定数字，将使用下一个设置的运费值。<br><br>例如:<br>121 Main Street;20 Church Street<br>Sunnyside,4.00;Lee Park,5.00;High Street,0.00<br>Dallas;Tulsa,5.00;Phoenix,0.00<br>多语言请参考本模块语言文件中的说明。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('159', '免运费成本', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', '免运费成本?', '6', '6', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('160', '手续费', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', '免运费手续费。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('161', '税率', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', '免运费手续费税率。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('162', '免运费地区', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', '如果免运费，仅限于该地区。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES ('163', '显示排序', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', '显示排序。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('164', '商店提货', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', '使用商店提货?', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('165', '商店提货费用', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', '商店提货费用。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('166', '税率', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', '商店提货处理费税率。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('167', '税率基准', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), ');
INSERT INTO `configuration` VALUES ('168', '配送地区', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES ('169', '显示排序', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', '显示的排序。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('170', '按件计价', 'MODULE_SHIPPING_ITEM_STATUS', 'True', '使用按件计价吗?', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('171', '运输费用', 'MODULE_SHIPPING_ITEM_COST', '2.50', '运输费用随订单内件数的增加而增加的配送方式。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('172', '手续费', 'MODULE_SHIPPING_ITEM_HANDLING', '0', '此配送方式的手续费。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('173', '税率', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', '此运费用下面的税率。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('174', '税率基准', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `configuration` VALUES ('175', '配送地区', 'MODULE_SHIPPING_ITEM_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式.', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES ('176', '显示排序', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', '显示的顺序。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('177', '启用免费商品模块', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', '您接受商品免费吗?', '6', '1', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('178', '显示排序.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', '显示的顺序。低的显示在前。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('179', '支付地区', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', '如果选择地区则仅限该地区使用此支付方式。', '6', '2', null, '2018-08-08 12:33:57', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES ('180', '设置订单状态', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', '设置该支付方式下订单状态为', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES ('181', '打开PayPal支付模块', 'MODULE_PAYMENT_PAYPAL_STATUS', 'True', '您要使用PayPal支付方式吗?', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('182', '商业编号', 'MODULE_PAYMENT_PAYPAL_BUSINESS_ID', 'admin@localhost', '您的PayPal帐号的主要电子邮件地址<br />说明：该地址必须与PayPal上设置的主要电子邮件地址<strong>完全一致</strong>，并且要注意<strong>大小写</strong>。', '6', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('183', '交易货币', 'MODULE_PAYMENT_PAYPAL_CURRENCY', 'Selected Currency', '随订单发送到PayPal的货币<br />说明: 如果选择了非PayPal支持的货币，将自动转换为美元。', '6', '3', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'Selected Currency\', \'Only USD\', \'Only AUD\', \'Only CAD\', \'Only EUR\', \'Only GBP\', \'Only CHF\', \'Only CZK\', \'Only DKK\', \'Only HKD\', \'Only HUF\', \'Only JPY\', \'Only NOK\', \'Only NZD\', \'Only PLN\', \'Only SEK\', \'Only SGD\', \'Only THB\', \'Only MXN\', \'Only ILS\', \'Only PHP\', \'Only TWD\', \'Only BRL\', \'Only MYR\'), ');
INSERT INTO `configuration` VALUES ('184', '付款地区', 'MODULE_PAYMENT_PAYPAL_ZONE', '0', '如果选择了付款地区，仅该地区可以使用该支付模块。', '6', '4', null, '2018-08-08 12:33:57', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES ('185', '设置通知状态', 'MODULE_PAYMENT_PAYPAL_PROCESSING_STATUS_ID', '1', '设置通过该支付方式付款，但还没有完成的订单状态为<br />(推荐状态\'等待中\')', '6', '5', null, '2018-08-08 12:33:57', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES ('186', '设置订单状态', 'MODULE_PAYMENT_PAYPAL_ORDER_STATUS_ID', '2', '设置通过该支付方式付款的订单状态<br />(推荐\'处理中\')', '6', '6', null, '2018-08-08 12:33:57', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES ('187', '退款订单状态', 'MODULE_PAYMENT_PAYPAL_REFUND_ORDER_STATUS_ID', '1', '设置通过该支付方式退款的订单状态<br />(推荐\'等待中\')', '6', '7', null, '2018-08-08 12:33:57', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES ('188', '显示顺序', 'MODULE_PAYMENT_PAYPAL_SORT_ORDER', '0', '显示顺序：小的显示在前。', '6', '8', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('189', '地址替代', 'MODULE_PAYMENT_PAYPAL_ADDRESS_OVERRIDE', '1', '如果设置为 1，Zen Cart输入的地址会替代客户在PayPal上储存的地址。客户将看到Zen Cart的地址，但不能修改。<br />(如地址不正确，PayPal将认为没有提交地址或者override=0)<br />0=不覆盖<br />1=ZC地址替代PayPal地址', '6', '18', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\',\'1\'), ');
INSERT INTO `configuration` VALUES ('190', '送货地址选项', 'MODULE_PAYMENT_PAYPAL_ADDRESS_REQUIRED', '2', '送货地址。如果设置为 0，将提示您的客户输入送货地址。如果设置为 1，将不提示客户输入送货地址。如果设置为 2，客户必须输入送货地址。<br />0=提示<br />1=不询问<br />2=必须<br /><br /><strong>提示: 如果允许客户输入自己的送货地址，您一定要核对PayPal确认信息上地址无误。使用Website Payments Standard (IPN), Zen Cart 不知道客户是否会选择和订单上不同的送货地址。</strong>', '6', '20', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\',\'1\',\'2\'), ');
INSERT INTO `configuration` VALUES ('191', '购物车商品清单', 'MODULE_PAYMENT_PAYPAL_DETAILED_CART', 'No', '要向PayPal传递详细的商品清单吗? 如设置为True，将传递详细的购物清单', '6', '22', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'No\',\'Yes\'), ');
INSERT INTO `configuration` VALUES ('192', '页面风格', 'MODULE_PAYMENT_PAYPAL_PAGE_STYLE', 'Primary', '定制付款页面的风格。页面风格的值是您添加或编辑页面风格时输入的名字。您可以在PayPal网址上，添加或修改客户定制的付款页面风格，位于我的帐号选项下面。如果您要使用主要风格，设置为\"primary.\" 如果要使用缺省风格，设置为\"paypal\".', '6', '25', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('193', 'PayPal服务的模式<br /><br />缺省:<br /><code>www.paypal.com/cgi-bin/webscr</code><br />或者<br /><code>www.paypal.com/us/cgi-bin/webscr</code><br />or for the UK,<br /><code>www.paypal.com/uk/cgi-bin/webscr</code>', 'MODULE_PAYMENT_PAYPAL_HANDLER', 'www.paypal.com/cgi-bin/webscr', '选择PayPal正式交易的网址', '6', '73', null, '2018-08-08 12:33:57', null, '');
INSERT INTO `configuration` VALUES ('194', 'PDT Token (Payment Data Transfer)', 'MODULE_PAYMENT_PAYPAL_PDTTOKEN', '', '在这里输入PDT Token值，在处理结束后立刻激活交易。', '6', '25', null, '2018-08-08 12:33:57', 'zen_cfg_password_display', null);
INSERT INTO `configuration` VALUES ('195', '调试模式', 'MODULE_PAYMENT_PAYPAL_IPN_DEBUG', 'Off', '打开调试模式吗? <br />说明: 会发送大量用于调试的邮件!<br />记录文件位于/includes/modules/payment/paypal/logs 目录<br />电子邮件发送到店主的邮箱。<br />不建议使用邮件选项。<br /><strong>通常设置为OFF。</strong>', '6', '71', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'Off\',\'Log File\',\'Log and Email\'), ');
INSERT INTO `configuration` VALUES ('196', '调试电子邮件地址', 'MODULE_PAYMENT_PAYPAL_DEBUG_EMAIL_ADDRESS', 'admin@localhost', '用于接收调试信息的电子邮件地址', '6', '72', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('197', '含税', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', '计算时含税?', '6', '6', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('198', '该模块已安装', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', '6', '1', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\'), ');
INSERT INTO `configuration` VALUES ('199', '显示排序', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', '显示的顺序.', '6', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('200', '含运费', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', '计算时含运费?', '6', '5', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('201', '重算税价', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', '重新计算税', '6', '7', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), ');
INSERT INTO `configuration` VALUES ('202', '税率', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', '团体优惠时使用税率.', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('203', '使用固定运费', 'MODULE_SHIPPING_FLAT_STATUS', 'True', '您要使用固定运费吗?', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('204', '配送费用', 'MODULE_SHIPPING_FLAT_COST', '5.00', '所有订单都收取该费用。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('205', '税率种类', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', '采用下面的运费税种。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('206', '税率基准', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', '运费税的计算方法。选项为<br />Shipping - 基于客户的送货地址<br />Billing 基于客户的帐单地址<br />Store - 如果帐单/送货地区和商店所在地区相同，采用商店地址', '6', '0', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ');
INSERT INTO `configuration` VALUES ('207', '配送地区', 'MODULE_SHIPPING_FLAT_ZONE', '0', '如果选择了地区，只有该地区才使用该配送方式。', '6', '0', null, '2018-08-08 12:33:57', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(');
INSERT INTO `configuration` VALUES ('208', '显示排序', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', '显示的顺序', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('209', '缺省货币', 'DEFAULT_CURRENCY', 'USD', '缺省货币', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('210', '缺省语言', 'DEFAULT_LANGUAGE', 'gb', '缺省语言', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('211', '缺省的新订单状态', 'DEFAULT_ORDERS_STATUS_ID', '1', '新建一个订单时，订单状态为该值。', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('212', '显示管理configuration_key', 'ADMIN_CONFIGURATION_KEY_ON', '0', '设置为1将在配置页面下显示configuration_key的名称', '6', '0', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('213', '始发国家或地区', 'SHIPPING_ORIGIN_COUNTRY', '44', '选择计算运费的始发国家或地区。', '7', '1', null, '2018-08-08 12:33:57', 'zen_get_country_name', 'zen_cfg_pull_down_country_list(');
INSERT INTO `configuration` VALUES ('214', '邮编', 'SHIPPING_ORIGIN_ZIP', 'NONE', '输入商店邮编，用于运费计算。', '7', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('215', '最大包裹重量', 'SHIPPING_MAX_WEIGHT', '50', '邮递公司对单件包裹的最大重量限制。', '7', '3', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('216', '小包裹包装材料 - 百分比+重量', 'SHIPPING_BOX_WEIGHT', '0:3', '输入小包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0', '7', '4', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('217', '大包裹包装材料 - 百分比+重量', 'SHIPPING_BOX_PADDING', '10:0', '输入大包裹的包装材料重量<br />例子: 10% + 1克 10:1<br />10% + 0克 10:0<br />0% + 5克 0:5<br />0% + 0克 0:0', '7', '5', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('218', '显示箱数和重量', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', '显示货物重量和箱数?<br /><br />0= 否<br />1= 只显示箱数<br />2= 只显示重量<br />3= 箱数和重量', '7', '15', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('219', '运费估价显示', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= 否<br />1= 在购物车上显示按钮<br />2= 在购物车页面显示列表', '7', '20', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('220', '在发票管理中显示订单说明', 'ORDER_COMMENTS_INVOICE', '1', '在发票管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', '7', '25', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('221', '在装箱单管理中显示订单说明', 'ORDER_COMMENTS_PACKING_SLIP', '1', '在装箱单管理中要显示订单说明吗?<br />0= 不显示<br />1= 只显示客户的第一个说明<br />2= 订单的所有说明', '7', '26', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('222', '无重量商品免运费', 'ORDER_WEIGHT_ZERO_STATUS', '0', '如果订单商品重量为零，免运费吗?<br />0= 否<br />1= 是<br /><br />提示: 免运费时，打开免运费模块，这只会在免运费时显示。', '7', '15', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('223', '显示商品图像', 'PRODUCT_LIST_IMAGE', '1', '要显示商品图像吗?', '8', '1', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('224', '显示厂商名字', 'PRODUCT_LIST_MANUFACTURER', '0', '要显示商品厂商名字吗?', '8', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('225', '显示商品型号', 'PRODUCT_LIST_MODEL', '0', '要显示商品型号吗?', '8', '3', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('226', '显示商品名称', 'PRODUCT_LIST_NAME', '2', '要显示商品名称吗?', '8', '4', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('227', '显示商品价格/加入购物车', 'PRODUCT_LIST_PRICE', '3', '要显示商品价格/添加到购物车吗?', '8', '5', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('228', '显示商品数量', 'PRODUCT_LIST_QUANTITY', '0', '要显示商品数量吗?', '8', '6', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('229', '显示商品重量', 'PRODUCT_LIST_WEIGHT', '0', '要显示商品重量吗?', '8', '7', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('230', '商品价格/添加到购物车方框的宽度', 'PRODUCTS_LIST_PRICE_WIDTH', '125', '定义商品价格/添加到购物车方框的宽度<br />缺省= 125', '8', '8', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('231', '显示分类/厂商过滤 (0=关; 1=开)', 'PRODUCT_LIST_FILTER', '1', '要显示分类/厂商过滤吗?', '8', '9', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('232', '前/后分页导航条 (1-页面顶部, 2-页面底部, 3-同时)', 'PREV_NEXT_BAR_LOCATION', '3', '设置前/后分页导航条的位置', '8', '10', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('233', '显示商品列表缺省排序', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', '商品列表缺省排序<br />提示: 留空为商品排序。按照您指定的顺序排序商品列表。例如: 2a', '8', '15', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('234', '显示添加到购物车按钮 (0=关; 1=开; 2=开，且可以输入数量)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', '要显示添加到购物车按钮吗?<br /><br /><strong>说明:</strong> 如果采用选项2，请关闭下面的多个商品数量方框', '8', '20', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('235', '显示多个商品数量方框状态和设置按钮位置', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '8', '25', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('236', '显示商品介绍', 'PRODUCT_LIST_DESCRIPTION', '150', '要显示商品介绍吗?<br /><br />0= 否<br />150= 建议长度, 或输入显示的最多字数', '8', '30', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('237', '商品列表升序标记', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', '用于表示升序的标记<br />缺省 = +', '8', '40', null, '2018-08-08 12:33:57', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('238', '商品列表降序标记', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', '用于表示降序的标记<br />缺省 = -', '8', '41', null, '2018-08-08 12:33:57', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('239', '商品列表中显示字母过滤选择', 'PRODUCT_LIST_ALPHA_SORTER', 'true', '在商品列表中显示字母过滤的选择吗?', '8', '50', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('240', '显示商品列表子分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', '在商品列表中显示子分类图像吗?', '8', '52', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('241', '显示商品列表总分类图像', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', '在商品列表中显示总分类图像吗?', '8', '53', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('242', '导航显示子分类', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', '经由总分类导航时显示子分类<br /><br />0= 否<br />1= 是', '8', '60', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('243', '检查库存', 'STOCK_CHECK', 'true', '检查库存是否足够', '9', '1', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('244', '减少库存', 'STOCK_LIMITED', 'true', '按照订单从库存中自动减少商品', '9', '2', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('245', '允许结帐', 'STOCK_ALLOW_CHECKOUT', 'true', '即使库存不够，也允许客户结帐', '9', '3', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('246', '显示缺货', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', '在屏幕上提示客户商品库存量不足', '9', '4', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('247', '重新进货', 'STOCK_REORDER_LEVEL', '5', '定义何时需要重新进货', '9', '5', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('248', '缺货时, 商品的状态为', 'SHOW_PRODUCTS_SOLD_OUT', '0', '显示商品缺货<br /><br />0= 设置商品状态为关闭<br />1= 设置商品状态为打开', '9', '10', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('249', '用缺货图标代替加入购物车按钮', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', '不显示加入购物车按钮，而显示缺货图标<br /><br />0= 否<br />1= 是', '9', '11', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('250', '数量小数位', 'QUANTITY_DECIMALS', '0', '商品数量允许几位小数?<br /><br />0= 不允许', '9', '15', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('251', '购物车上显示 - 复选框或删除按钮', 'SHOW_SHOPPING_CART_DELETE', '3', '在购物车上显示，复选框或删除按钮<br /><br />1= 只显示删除按钮<br />2= 只显示复选框<br />3= 同时显示删除按钮和复选框', '9', '20', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('252', '购物车上显示 - 更新购物车按钮的位置', 'SHOW_SHOPPING_CART_UPDATE', '3', '在购物车上显示更新购物车按钮，位于:<br /><br />1= 每个数量框后面<br />2= 所有商品下面<br />3= 同时显示在每个数量框后面和所有商品下面', '9', '22', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('253', '在空购物车页面显示新进商品', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', '在空购物车页面显示新进商品<br />0= 否或设置显示顺序', '9', '30', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('254', '在空购物车页面显示推荐商品', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', '在空购物车页面显示推荐商品<br />0= 否或设置显示顺序', '9', '31', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('255', '在空购物车页面显示特价商品', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', '在空购物车页面显示特价商品<br />0= 否或设置显示顺序', '9', '32', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('256', '在空购物车页面显示预售商品', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', '在空购物车页面显示预售商品<br />0= 否或设置显示顺序', '9', '33', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('257', '登录时提醒合并购物车', 'SHOW_SHOPPING_CART_COMBINED', '1', '客户登录时，如果以前购物车中有商品，将于现有购物车中的商品合并。<br /><br />要提醒客户吗?<br /><br />0= OFF, 不提醒<br />1= Yes 提醒并转到购物车页面<br />2= Yes 提醒，但不转到购物车页面', '9', '35', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('258', '记录页面解析时间', 'STORE_PAGE_PARSE_TIME', 'false', '保存(到文件)解析页面的时间', '10', '1', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('259', '日志路径', 'STORE_PAGE_PARSE_TIME_LOG', 'E:/web/zen/cache/page_parse_time.log', '页面解析时间的日志目录和文件名', '10', '2', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('260', '日志时间格式', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', '时间格式', '10', '3', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('261', '显示页面解析时间', 'DISPLAY_PAGE_PARSE_TIME', 'false', '在每个页面底部显示页面解析时间<br />(说明: 显示解析时间并不要求保存。)', '10', '4', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('262', '保存数据库查询', 'STORE_DB_TRANSACTIONS', 'false', '保存数据库查询到系统的 /logs/ 目录。注意，这有可能严重影响系统性能并用光硬盘空间。', '10', '5', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('263', '电子邮件发送方式', 'EMAIL_TRANSPORT', 'PHP', '设置发送邮件的方式。<br /><strong>PHP</strong>为缺省方式，采用内置的PHP处理方式。<br />采用Windows和MacOS的服务器要修改该设置为<strong>SMTP</strong>。<br /><br /><strong>SMTPAUTH</strong>仅在服务器要求SMTP验证时使用，同时要设置SMTPAUTH的相应参数。<br /><br /><strong>sendmail</strong>用于linux/unix主机，使用主机上的sendmail程序<br /><strong>\"sendmail-f\"</strong>仅当服务器要求 -f 参数发送邮件，这个安全措施可以防止欺骗，但如果邮件服务器未设置使用该选项，会出错。<br /><br /><strong>Qmail</strong>用于linux/unix主机的Qmail邮件功能 /var/qmail/bin/sendmail', '12', '1', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),');
INSERT INTO `configuration` VALUES ('264', 'SMTP帐号邮箱', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', '输入邮箱帐号名 (me@mydomain.com) 。这是SMTP授权帐号名。<br />仅在使用SMTPAUTH时需要。', '12', '101', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('265', 'SMTP帐号密码', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', '输入SMTP邮箱的密码。<br />仅在使用SMTPAUTH时需要。', '12', '101', null, '2018-08-08 12:33:57', 'zen_cfg_password_display', null);
INSERT INTO `configuration` VALUES ('266', 'SMTP主机', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', '输入SMTP邮件服务器的DNS名字<br />例如: mail.mydomain.com<br />或 55.66.77.88', '12', '101', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('267', 'SMTP服务器端口', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', '输入SMTP邮件服务器端口号', '12', '101', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('268', '在文本格式邮件中转换货币符号', 'CURRENCIES_TRANSLATIONS', '', '文本格式邮件中使用什么货币符号转换？', '12', '120', null, '2003-11-21 00:00:00', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('269', '电子邮件换行', 'EMAIL_LINEFEED', 'LF', '定义分开邮件头的换行符', '12', '2', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'LF\', \'CRLF\'),');
INSERT INTO `configuration` VALUES ('270', '使用 HTML 邮件', 'EMAIL_USE_HTML', 'false', '是否使用 HTML 格式发送电子邮件', '12', '3', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('271', '通过DNS核对电子邮件地址', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', '是否通过DNS核对电子邮件地址', '6', '6', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('272', '发送电子邮件', 'SEND_EMAILS', 'true', '是否发出电子邮件', '12', '5', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('273', '电子邮件存档', 'EMAIL_ARCHIVE', 'false', '如果您在发邮件时，需要保存复制件，设置为 \"true\"。', '12', '6', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('274', '电子邮件出错信息', 'EMAIL_FRIENDLY_ERRORS', 'false', '如果邮件失败，是否显示错误信息?  设置为false将显示PHP错误信息. 仅在调试时设置为false.', '12', '7', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('275', '用于显示的店主邮件地址', 'STORE_OWNER_EMAIL_ADDRESS', 'qbmay@qq.com', '商店店主的电子邮件，显示给客户的联系方式。', '12', '10', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('276', '发件人邮件地址', 'EMAIL_FROM', 'qbmay@qq.com', '缺省的电子邮件发送人地址，在管理模块下输入邮件时可修改。', '12', '11', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('277', '电子邮件必须从现有域名发送', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', '您的邮件服务器是否要求所有发出的邮件发送地址为你现有的域名？<br /><br />该设置通常用于防止欺骗和垃圾邮件。如果设置为Yes，所有邮件的发送地址为上面设置的发件人邮件地址。', '12', '11', null, '0001-01-01 00:00:00', null, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO `configuration` VALUES ('278', '管理员邮件格式', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', '请选择管理员电子邮件格式', '12', '12', null, '0001-01-01 00:00:00', null, 'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), ');
INSERT INTO `configuration` VALUES ('279', '发送订单确认电子邮件的复件到', 'SEND_EXTRA_ORDER_EMAILS_TO', 'qbmay@qq.com', '发送订单确认电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '12', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('280', '发送创建帐号电子邮件的复件 - 状态', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', '是否发送创建帐号电子邮件的复件<br />0= 否 1= 是', '12', '13', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('281', '发送创建帐号电子邮件的复件到', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', 'qbmay@qq.com', '发送创建帐号电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '14', null, '2018-08-08 12:33:57', null, null);
INSERT INTO `configuration` VALUES ('282', '发送客户发送礼券的电子邮件的复件 - 状态', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', '是否发送客户发送礼券的电子邮件的复件<br />0= 否 1= 是', '12', '17', null, '2018-08-08 12:33:57', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('283', '发送客户发送礼券的电子邮件的复件到', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', 'qbmay@qq.com', '发送客户发送礼券的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '18', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('284', '发送客户管理礼券邮件的电子邮件的复件 - 状态', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', '是否发送客户管理礼券邮件的电子邮件的复件<br />0= 否 1= 是', '12', '19', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('285', '发送客户管理礼券邮件的电子邮件的复件到', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', 'qbmay@qq.com', '发送客户管理礼券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '20', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('286', '发送客户管理优惠券邮件的电子邮件的复件 - 状态', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', '是否发送客户管理优惠券邮件的电子邮件的复件<br />0= 否 1= 是', '12', '21', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('287', '发送客户管理优惠券邮件的电子邮件的复件到', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', 'qbmay@qq.com', '发送客户管理优惠券邮件的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '22', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('288', '发送管理订单状态的电子邮件的复件 - 状态', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', '是否发送管理订单状态的电子邮件的复件<br />0= 否 1= 是', '12', '23', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('289', '发送管理订单状态的电子邮件的复件到', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', 'qbmay@qq.com', '发送管理订单状态的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '24', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('290', '发送等待审核的电子邮件的复件 - 状态', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', '是否发送等待审核的电子邮件的复件<br />0= 否 1= 是', '12', '25', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('291', '发送等待审核的电子邮件的复件到', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', 'qbmay@qq.com', '发送等待审核的电子邮件的复件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '26', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('292', '设置 \"联系我们\" 电子邮件下拉列表', 'CONTACT_US_LIST', '', '设置\"联系我们\"页面上列出的电子邮件地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;<br />仅有一个邮件地址时，不要输入，采用店主邮件地址', '12', '40', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea(');
INSERT INTO `configuration` VALUES ('293', '联系我们 - 显示商店名称和地址', 'CONTACT_US_STORE_NAME_ADDRESS', '1', '包含商店名称和地址<br />0= 否 1= 是', '12', '50', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('294', '商品库存提醒', 'SEND_LOWSTOCK_EMAIL', '0', '当商品处于低库存时，是否发送电子邮件<br />0= 否<br />1= 是', '12', '60', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('295', '发送库存提醒邮件到', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', 'qbmay@qq.com', '当商品处于低库存时，发送电子邮件到以下地址，格式为：名字一 &lt;email@address1&gt;, 名字二 &lt;email@address2&gt;', '12', '61', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('296', '显示退订电子商情链接', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', '是否在[信息]边框中，显示退订电子商情的链接？', '12', '70', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('297', '显示客户选择计数', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', '显示接收人名单时，是否显示计数？<br /><em>(如果有很多客户，这会影响速度)</em>', '12', '90', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('298', '允许下载', 'DOWNLOAD_ENABLED', 'true', '打开商品下载功能', '13', '1', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('299', '重定向下载', 'DOWNLOAD_BY_REDIRECT', 'true', '使用浏览器的重定向下载。在非Unix系统上关闭该功能。<br /><br />提示: 重定向打开时，将/pub设为777', '13', '2', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('300', '分块下载', 'DOWNLOAD_IN_CHUNKS', 'false', '如果关闭重定向下载，而您的PHP内存限制的设置低于8 MB，您可能需要打开该选项，使文件分块发送到浏览器。<br /><br />重定向下载打开时没有作用。', '13', '2', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('301', '下载有效期 (天数)', 'DOWNLOAD_MAX_DAYS', '7', '设置下载有效天数。0 表示无限制。', '13', '3', null, '2018-08-08 12:33:58', null, '');
INSERT INTO `configuration` VALUES ('302', '允许下载次数 - 每件商品', 'DOWNLOAD_MAX_COUNT', '5', '设置允许下载次数。0 表示不允许下载。', '13', '4', null, '2018-08-08 12:33:58', null, '');
INSERT INTO `configuration` VALUES ('303', '下载控制更新状态值', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', '哪个订单状态重置下载天数和下载次数 - 缺省为 4', '13', '10', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('304', '下载控制订单状态值 >= 最低状态', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', '下载控制订单状态值 - 缺省 >= 2<br /><br />是否允许下载取决于订单的状态，订单状态高于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最低值。', '13', '12', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('305', '下载控制订单状态值 <= 最高状态', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', '下载控制订单状态值 - 缺省 <= 4<br /><br />是否允许下载取决于订单的状态，订单状态低于该值的可以下载。订单状态由支付方式设定。这里设置该范围的最高值。', '13', '13', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('306', '允许属性定价', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', '允许属性定价', '13', '25', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('307', '允许批量优惠', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', '允许批量优惠', '13', '26', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('308', '允许属性图像', 'ATTRIBUTES_ENABLED_IMAGES', 'true', '允许属性图像', '13', '28', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('309', '允许按词或字定价', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', '允许按词或字定价', '13', '35', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('310', '文字价格 - 空格免费', 'TEXT_SPACES_FREE', '1', '文字定价时，空格免费<br /><br />0= 否 1= 是', '13', '36', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('311', '只读选项类型 - 忽略添加到购物车', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', '当一个商品属性为只读时，是否显示添加到购物车按钮?<br />0= 不显示<br />1= 显示', '13', '37', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('312', '打开GZip压缩', 'GZIP_LEVEL', '0', '0= 否 1= 是', '14', '1', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('313', 'Session 目录', 'SESSION_WRITE_DIRECTORY', 'E:/web/zen/cache', '指向 configure.php 文件中 DIR_FS_SQL_CACHE 设定的目录。', '15', '1', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('314', 'Cookie域名', 'SESSION_USE_FQDN', 'True', '如果选True，域名全称用于保存cookie, 例如：www.mydomain.com。如果选False，仅用域名的部分，例如：mydomain.com。如果您不确定，可以选True。', '15', '2', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('315', '强制使用Cookie', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', '15', '2', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('316', '检查SSL Sessions编号', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', '15', '3', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('317', '检查用户代理', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', '15', '4', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('318', '检查IP地址', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', '15', '5', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('319', '阻止机器人Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', '15', '6', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('320', '重建Sessions', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', '15', '7', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('321', 'IP到主机名转换', 'SESSION_IP_TO_HOST_ADDRESS', 'false', '转换IP地址为主机名<br /><br />提示: 在某些服务器上，会降低session初始化的速度或电子邮件执行时间。', '15', '10', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('322', '兑现代码长度', 'SECURITY_CODE_LENGTH', '10', '输入兑现代码长度<br />越长越安全', '16', '1', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('323', '缺省的金额为零的订单状态', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', '当订单的余额为零, 订单状态为', '16', '0', null, '2018-08-08 12:33:58', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES ('324', '新客户的优惠券编号', 'NEW_SIGNUP_DISCOUNT_COUPON', '', '选择优惠券<br />', '16', '75', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_coupon_id(');
INSERT INTO `configuration` VALUES ('325', '新客户的礼券金额', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', '没有就留空<br />或输入金额，如 10 表示 10.00元', '16', '76', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('326', '优惠券每页数量', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', '每页显示的优惠券数量', '16', '81', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('327', '优惠券分析页面上每页数量', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', '分析页面显示的优惠券数量', '16', '81', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('328', '接受信用卡 - VISA', 'CC_ENABLED_VISA', '1', '接受VISA 0= 否 1= 是', '17', '1', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('329', '接受信用卡 - MasterCard', 'CC_ENABLED_MC', '1', '接受MasterCard 0= 否 1= 是', '17', '2', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('330', '接受信用卡 - AmericanExpress', 'CC_ENABLED_AMEX', '0', '接受AmericanExpress 0= 否 1= 是', '17', '3', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('331', '接受信用卡 - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', '接受Diners Club 0= 否 1= 是', '17', '4', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('332', '接受信用卡 - Discover Card', 'CC_ENABLED_DISCOVER', '0', '接受Discover卡 0= 否 1= 是', '17', '5', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('333', '接受信用卡 - JCB', 'CC_ENABLED_JCB', '0', '接受JCB 0= 否 1= 是', '17', '6', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('334', '接受信用卡 - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', '接受澳大利亚银行卡 0= 否 1= 是', '17', '7', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('335', '接受信用卡 - SOLO', 'CC_ENABLED_SOLO', '0', '接受SOLO 0= 否 1= 是', '17', '8', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('336', '接受信用卡 - Switch', 'CC_ENABLED_SWITCH', '0', '接受SWITCH 0= 否 1= 是', '17', '9', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('337', '接受信用卡 - Maestro', 'CC_ENABLED_MAESTRO', '0', '接受MAESTRO 0= 否 1= 是', '17', '10', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('338', '接受信用卡 - 付款时显示', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', '付款页面是否显示接受信用卡?<br />0= 不显示<br />1= 显示文字<br />2= 显示图像<br /><br />备注: 图像和文字必须在相关信用卡的数据库和语言文件中同时定义.', '17', '50', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('339', '该模块已安装', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('340', '显示排序', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:40', null, null);
INSERT INTO `configuration` VALUES ('341', '购买队列', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', '您要将购买礼券排队吗?', '6', '3', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('342', '含运费', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', '计算时含运费', '6', '5', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('343', '含税', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', '计算时含税。', '6', '6', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('344', '重算税价', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', '重新计算税', '6', '7', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO `configuration` VALUES ('345', '税率种类', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', '接受礼券时，使用以下的税率种类。', '6', '0', null, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('346', '含税金额', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', '加入帐号时，在购买的礼券上加税', '6', '8', null, '2003-10-30 22:16:40', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('347', '设置订单状态', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', '设置用礼券全额付款时订单的状态', '6', '0', null, '2018-08-08 12:33:58', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses(');
INSERT INTO `configuration` VALUES ('348', '该模块已安装', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:43', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('349', '显示排序', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:43', null, null);
INSERT INTO `configuration` VALUES ('350', '收取低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', '您要收取低额订单费用吗?', '6', '3', null, '2003-10-30 22:16:43', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('351', '收取低额订单费的订单金额', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', '总金额低于该值的订单收取低额订单费。', '6', '4', null, '2003-10-30 22:16:43', 'currencies->format', null);
INSERT INTO `configuration` VALUES ('352', '低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', '按百分比收取 - 包含符号 % 例如: 10%<br />收取固定金额 - 例如: 输入 5 表示 5.00元', '6', '5', null, '2003-10-30 22:16:43', '', null);
INSERT INTO `configuration` VALUES ('353', '低额订单费适用的送货地区', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', '该送货地区收取低额订单费。', '6', '6', null, '2003-10-30 22:16:43', null, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO `configuration` VALUES ('354', '税率种类', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', '低额订单费使用下面的税率种类。', '6', '7', null, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('355', '虚拟商品无低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', '购物车中只有虚拟商品时，不收取低额订单费', '6', '8', null, '2004-04-20 22:16:43', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('356', '礼券无低额订单费', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', '购物车中只有礼券时，不收取低额订单费', '6', '9', null, '2004-04-20 22:16:43', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('357', '该模块已安装', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:46', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('358', '显示排序', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:46', null, null);
INSERT INTO `configuration` VALUES ('359', '允许免运费', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', '您要免运费吗?', '6', '3', null, '2003-10-30 22:16:46', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('360', '免运费的订单金额', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', '当订单总金额大于设值时，免运费。', '6', '4', null, '2003-10-30 22:16:46', 'currencies->format', null);
INSERT INTO `configuration` VALUES ('361', '免运费的送货地区', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', '当送货地区为该地区时，免运费。', '6', '5', null, '2003-10-30 22:16:46', null, 'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),');
INSERT INTO `configuration` VALUES ('362', '该模块已安装', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:49', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('363', '显示排序', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:49', null, null);
INSERT INTO `configuration` VALUES ('364', '该模块已安装', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:52', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('365', '显示排序', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:52', null, null);
INSERT INTO `configuration` VALUES ('366', '该模块已安装', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:55', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('367', '显示排序', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:55', null, null);
INSERT INTO `configuration` VALUES ('368', '税率种类', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', '优惠券采用下面的税类。', '6', '0', null, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes(');
INSERT INTO `configuration` VALUES ('369', '含税', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', '计算时含税。', '6', '6', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('370', '显示排序', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', '显示的顺序。', '6', '2', null, '2003-10-30 22:16:36', null, null);
INSERT INTO `configuration` VALUES ('371', '含运费', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', '计算时含运费', '6', '5', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('372', '该模块已安装', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', '6', '1', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'true\'),');
INSERT INTO `configuration` VALUES ('373', '重算税价', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', '重新计算税', '6', '7', null, '2003-10-30 22:16:36', null, 'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),');
INSERT INTO `configuration` VALUES ('374', '管理员演示', 'ADMIN_DEMO', '0', '是否打开管理员演示？<br />0= 否 1= 是', '6', '0', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('375', '商品选项类型选择', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', '该数字表示选择的商品选项', '0', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('376', '文字商品选项类型', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', '文字商品选项类型数值', '6', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('377', '单选按钮商品选项类型', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', '单选按钮商品选项类型数值', '6', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('378', '多选商品选项类型', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', '多选商品选项类型数值', '6', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('379', '文件商品选项类型', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', '文件商品选项类型数值', '6', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('380', '文字和文件商品选项类型的编号', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', '文字和文件商品选项类型的编号数值', '6', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('381', '上传前缀', 'UPLOAD_PREFIX', 'upload_', '用于区分上传选项和其它选项的前缀', '0', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('382', '文字前缀', 'TEXT_PREFIX', 'txt_', '用于区分文字选项值和其它选项值的前缀', '0', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('383', '只读选项类型', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', '只读选项类型数值', '6', null, '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('384', 'login mode https', 'SSLPWSTATUSCHECK', '', '系统设置，不要修改。', '6', '99', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('385', '商品信息 - 商品选项名称排序', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', '商品信息选项名称排序<br />0= 排序, 选项名称<br />1= 选项名称', '18', '35', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('386', '商品信息 - 商品选项属性值排序', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', '商品信息选项属性值排序<br />0= 排序, 价格<br />1= 排序, 选项值名称', '18', '36', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('387', '商品信息 - 在属性图像下显示选项值名称', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', '商品信息 - 在属性图像下显示选项值名称?<br />0= 否 1= 是', '18', '41', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('388', '商品信息 - 显示优惠', 'SHOW_SALE_DISCOUNT_STATUS', '1', '商品信息 - 是否显示优惠？<br />0= 否 1= 是', '18', '45', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('389', '商品信息 - 优惠价格的显示格式', 'SHOW_SALE_DISCOUNT', '1', '商品信息 - 优惠价格的显示格式:<br />1= 显示百分比 2= 显示金额', '18', '46', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('390', '商品信息 - 显示优惠百分比的小数位', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', '商品信息 - 优惠格式显示为百分比时的小数位:<br />缺省= 0', '18', '47', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('391', '商品信息 - 免费图像或文字', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', '商品信息 - 是否在价格上显示免费字样的图像或文字<br />0= 文字<br />1= 图像', '18', '50', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('392', '商品信息 - 价格面议图像或文字', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', '商品信息 - 是否在价格上显示价格面议字样的图像或文字<br />0= 文字<br />1= 图像', '18', '51', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('393', '商品数量方框 - 添加新商品', 'PRODUCTS_QTY_BOX_STATUS', '1', '添加新商品时，缺省的数量方框显示状态?<br /><br />0= 否<br />1= 是<br />提示: 打开时，会显示数量方框，缺省的[添加到购物车]数量为 1', '18', '55', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('394', '商品评论请求批准', 'REVIEWS_APPROVAL', '1', '商品评论需要批准吗?<br /><br />提示: 当评论状态为关闭时，也不会显示<br /><br />0= 否 1= 是', '18', '62', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('395', '元标签 - 标题含商品型号', 'META_TAG_INCLUDE_MODEL', '1', '在Meta标签标题中包含商品型号吗?<br /><br />0= 否 1= 是', '18', '69', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('396', '元标签 - 标题含商品价格', 'META_TAG_INCLUDE_PRICE', '1', '在Meta标签标题中包含商品价格吗?<br /><br />0= 否 1= 是', '18', '70', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('397', '元标签的描述字段字数', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', '设置元标签的描述字段字数，缺省 50:', '18', '71', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('398', '每行显示的同时购买商品数', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '3', '每行显示的同时购买商品数<br />0= 关 或设置排序', '18', '72', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `configuration` VALUES ('399', '导航条 - 位置', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', '导航条位置<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '18', '21', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'页面顶部\'), array(\'id\'=>\'2\', \'text\'=>\'页面底部\'), array(\'id\'=>\'3\', \'text\'=>\'同时\')),');
INSERT INTO `configuration` VALUES ('400', '导航条 - 排序', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', '商品的显示顺序<br />0= 商品编号<br />1= 商品名称<br />2= 商品型号<br />3= 价格, 名称<br />4= 价格, 型号<br />5= 名称, 型号<br />6= 商品排序', '18', '22', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'商品编号\'), array(\'id\'=>\'1\', \'text\'=>\'商品名称\'), array(\'id\'=>\'2\', \'text\'=>\'商品型号\'), array(\'id\'=>\'3\', \'text\'=>\'价格 - 名称\'), array(\'id\'=>\'4\', \'text\'=>\'价格 - 型号\'), array(\'id\'=>\'5\', \'text\'=>\'名称 - 型号\'), array(\'id\'=>\'6\', \'text\'=>\'商品排序\')),');
INSERT INTO `configuration` VALUES ('401', '导航条 - 按钮和图像', 'SHOW_PREVIOUS_NEXT_STATUS', '0', '是否显示按钮和图像:<br />0= 否<br />1= 是', '18', '20', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'是\')),');
INSERT INTO `configuration` VALUES ('402', '导航条 - 按钮和图像设置', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', '显示按钮和图像的设置<br />0= 仅显示按钮<br />1= 按钮和商品图像<br />2= 仅显示商品图像', '18', '21', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'仅显示按钮\'), array(\'id\'=>\'1\', \'text\'=>\'按钮和商品图像\'), array(\'id\'=>\'2\', \'text\'=>\'仅显示商品图像\')),');
INSERT INTO `configuration` VALUES ('403', '导航条 - 图像宽度?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', '上一个/下一个 图像宽度?', '18', '22', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('404', '导航条 - 图像高度?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', '上一个/下一个 图像高度?', '18', '23', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('405', '分类导航条的位置', 'PRODUCT_INFO_CATEGORIES', '1', '商品的分类图像和名称位于导航条的上面<br />0= 否<br />1= 左对齐<br />2= 中间对齐<br />3= 右对齐', '18', '20', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'否\'), array(\'id\'=>\'1\', \'text\'=>\'左对齐\'), array(\'id\'=>\'2\', \'text\'=>\'中间对齐\'), array(\'id\'=>\'3\', \'text\'=>\'右对齐\')),');
INSERT INTO `configuration` VALUES ('406', '分类导航条的名称和图像', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', '商品分类图像和名称<br />0= 总是显示商品分类图像和名称<br />1= 只显示名称<br />2= 当非空时显示商品分类图像和名称', '18', '20', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'分类和图像\'), array(\'id\'=>\'1\', \'text\'=>\'仅分类\'), array(\'id\'=>\'2\', \'text\'=>\'非空时分类和图像\')),');
INSERT INTO `configuration` VALUES ('407', '栏目宽度 - 左栏目', 'BOX_WIDTH_LEFT', '170px', '左栏目边框的宽度<br />可以输入 px<br />缺省 = 150px', '19', '1', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `configuration` VALUES ('408', '栏目宽度 - 右栏目', 'BOX_WIDTH_RIGHT', '140px', '右栏目边框的宽度<br />可以输入 px<br />缺省 = 150px', '19', '2', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `configuration` VALUES ('409', '导航条分割符', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;::&nbsp;', '输入导航条分隔符<br />提示: 空格用 &amp;nbsp; <br />缺省 = &amp;nbsp;::&amp;nbsp;', '19', '3', null, '2003-11-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('410', '导航条', 'DEFINE_BREADCRUMB_STATUS', '1', '是否显示导航条<br />0= 关<br />1= 开<br />2= 仅不显示在首页', '19', '4', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('411', '畅销商品 - 数目填充', 'BEST_SELLERS_FILLER', '&nbsp;', '用什么分割数字?<br />缺省 = &amp;nbsp;', '19', '5', null, '2003-11-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('412', '畅销商品 - 截断商品名称', 'BEST_SELLERS_TRUNCATE', '35', '商品名称截断长度?<br />缺省 = 35', '19', '6', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `configuration` VALUES ('413', '畅销商品 - 截断商品名称后面加上 ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', '截断商品名称时，后面加上 ...<br />缺省 = true', '19', '7', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('414', '购物车边框', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', '是否显示购物车边框<br />0= 总是显示<br />1= 满的时候<br />2= 满的时候，但查看购物车时不显示', '19', '8', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('415', '分类栏 - 显示特价商品链接', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', '在分类边框中显示特价商品链接', '19', '9', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('416', '分类栏 - 显示新进商品链接', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', '在分类边框中显示新进商品链接', '19', '10', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('417', '分类栏 - 显示推荐商品链接', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', '在分类边框中显示推荐商品链接', '19', '11', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('418', '分类栏 - 显示所有商品链接', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', '在分类边框中显示所有商品链接', '19', '12', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('419', '左边栏目状态 - 全局', 'COLUMN_LEFT_STATUS', '1', '显示左栏目, 除非有文件替代<br />0= 左栏目总是关闭<br />1= 左栏目打开，除非有文件替代', '19', '15', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('420', '右边栏目状态 - 全局', 'COLUMN_RIGHT_STATUS', '1', '显示右栏目, 除非有文件替代<br />0= 右栏目总是关闭<br />1= 右栏目打开, 除非有文件替代', '19', '16', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('421', '栏目宽度 - 左', 'COLUMN_WIDTH_LEFT', '170px', '左边栏目的宽度<br />可以输入 px<br />缺省 = 150px', '19', '20', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `configuration` VALUES ('422', '栏目宽度 - 右', 'COLUMN_WIDTH_RIGHT', '140px', '右边栏目的宽度<br />可以输入 px<br />缺省 = 150px', '19', '21', null, '2003-11-21 22:16:36', null, null);
INSERT INTO `configuration` VALUES ('423', '分类分割符', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', '分类名称之间显示分割符吗?<br />0= 否<br />1= 是', '19', '24', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('424', '分类名称和计数之间的分割符', 'CATEGORIES_SEPARATOR', '', '分类名称和计数间的分割符是?<br />缺省 = -&amp;gt;', '19', '25', null, '2003-11-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('425', '分类名称和子分类之间的分割符', 'CATEGORIES_SEPARATOR_SUBS', '', '分类名称和子分类之间的分割符是?<br />缺省 = |_&amp;nbsp;', '19', '26', null, '2004-03-25 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('426', '分类计数前缀', 'CATEGORIES_COUNT_PREFIX', '&nbsp;(', '计数要加前缀吗?<br />缺省= (', '19', '27', null, '2003-01-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('427', '分类计数后缀', 'CATEGORIES_COUNT_SUFFIX', ')', '计算后缀是?<br />缺省= )', '19', '28', null, '2003-01-21 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('428', '分类子分类缩排', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', '子分类的缩进为?<br />缺省= &nbsp;&nbsp;', '19', '29', null, '2004-06-24 22:16:36', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('429', '没有商品的分类', 'CATEGORIES_COUNT_ZERO', '0', '显示商品数量为零的分类吗?<br />0= 否<br />1= 是', '19', '30', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('430', '分隔分类边框', 'CATEGORIES_SPLIT_DISPLAY', 'True', '按商品类型分隔分类边框', '19', '31', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('431', '购物车 - 显示总计', 'SHOW_TOTALS_IN_CART', '1', '是否在购物车上显示总计<br />0= 否<br />1= 是: 件数 重量 金额<br />2= 是: 件数 重量 金额，重量为零时不显示<br />3= 是: 件数 金额', '19', '31', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('432', '顾客欢迎词 - 显示在首页', 'SHOW_CUSTOMER_GREETING', '1', '在首页上显示顾客欢迎词<br />0= 否<br />1= 是', '19', '40', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('433', '分类 - 总是显示在首页', 'SHOW_CATEGORIES_ALWAYS', '0', '首页显示分类<br />0= 否<br />1= 是<br />首页显示的分类可以是主分类或一个特定子分类', '19', '45', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('434', '首页 - 显示分类', 'CATEGORIES_START_MAIN', '0', '0= 主分类<br />或输入分类编号<br />提示: 也可以使用子分类，例如: 3_10', '19', '46', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('435', '分类 - 显示子分类', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', '总是显示分类和子分类<br />0= 否, 只显示总分类<br />1= 是, 选择时总是显示分类和子分类', '19', '47', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('436', '广告显示组 - 标题位置 1', 'SHOW_BANNERS_GROUP_SET1', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 1，您要使用哪个广告组?<br />没有就留空', '19', '55', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('437', '广告显示组 - 标题位置 2', 'SHOW_BANNERS_GROUP_SET2', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 2，您要使用哪个广告组?<br />没有就留空', '19', '56', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('438', '广告显示组 - 标题位置 3', 'SHOW_BANNERS_GROUP_SET3', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在标题位置 3，您要使用哪个广告组?<br />没有就留空', '19', '57', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('439', '广告显示组 - 页脚位置 1', 'SHOW_BANNERS_GROUP_SET4', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 1，您要使用哪个广告组?<br />没有就留空', '19', '65', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('440', '广告显示组 - 页脚位置 2', 'SHOW_BANNERS_GROUP_SET5', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />在页脚位置 2，您要使用哪个广告组?<br />没有就留空', '19', '66', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('441', '广告显示组 - 页脚位置 3', 'SHOW_BANNERS_GROUP_SET6', '', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 Wide-Banners<br /><br />在页脚位置 3，您要使用哪个广告组?<br />没有就留空', '19', '67', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('442', '广告显示组 - 边框 banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏，您要使用哪个广告组?<br />没有就留空', '19', '70', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('443', '广告显示组 - 边框 banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', '广告显示组可以是一个广告组或多个广告组<br /><br />多个广告组，输入广告组名，用<strong>:</strong>分开<br /><br />例如: Wide-Banners:SideBox-Banners<br /><br />缺省组为 SideBox-Banners<br /><br />在边框的广告栏2，您要使用哪个广告组?<br />没有就留空', '19', '71', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('444', '广告显示组 - 边框 banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', '所有广告边框栏只可以设置一个广告组<br /><br />缺省组为 BannersAll<br /><br />在边框的所有广告栏，您要使用哪个广告组?<br />没有就留空', '19', '72', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('445', '页脚 - 显示IP地址', 'SHOW_FOOTER_IP', '1', '在页脚显示客户IP地址吗<br />0= 否<br />1= 是', '19', '80', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('446', '商品优惠数量 - 添加多少空白优惠?', 'DISCOUNT_QTY_ADD', '5', '在商品价格上添加多少空白优惠?', '19', '90', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('447', '商品优惠数量 - 每行显示多少?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', '商品信息页面每行显示多少优惠?', '19', '95', null, '2018-08-08 12:33:58', '', '');
INSERT INTO `configuration` VALUES ('448', '分类/商品显示顺序', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', '分类/商品显示顺序<br />0= 分类/商品显示顺序/名称<br />1= 分类/商品名称<br />2= 商品型号<br />3= 商品数量+, 商品名称<br />4= 商品数量-, 商品名称<br />5= 商品价格+, 商品名称<br />6= 商品价格-, 商品名称', '19', '100', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ');
INSERT INTO `configuration` VALUES ('449', '选项名称和内容全局添加、复制和删除', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', '选项名称和内容全局添加、复制和删除<br />0= 隐藏<br />1= 显示<br />(默认=1)', '19', '110', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('450', '分类标签菜单 打开/关闭', 'CATEGORIES_TABS_STATUS', '0', '分类标签<br />在页眉显示商店的分类目录，自己发挥想象力。<br />0= 隐藏分类标签<br />1= 显示分类标签', '19', '112', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('451', '网站地图 - 是否包含我的帐号链接', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', '网站地图上是否显示到我的帐号的链接<br />说明: 搜索引擎会尝试索引该页面，通常不会转向安全页面，因为索引登录页面并无好处。<br /><br />缺省: false', '19', '115', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'Yes\', \'No\'), ');
INSERT INTO `configuration` VALUES ('452', '跳过单个商品的分类', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', '跳过单个商品的分类<br />如果设置为True，客户点击单个商品的分类时，Zen Cart将直接显示商品页面。<br />缺省: True', '19', '120', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('453', '分开登录页面', 'USE_SPLIT_LOGIN_MODE', 'False', '登录页面有两种显示模式: 分页模式 或 同页模式<br />分页模式，点击按钮后进入注册页面。同页模式，注册页面显示在登录之下。<br />缺省: True', '19', '121', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('454', 'CSS按钮', 'IMAGE_USE_CSS_BUTTONS', 'No', 'CSS按钮<br />使用CSS按钮替代图像(GIF/JPG)<br />按钮格式在stylesheet文件中定义。', '19', '147', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'No\', \'Yes\'), ');
INSERT INTO `configuration` VALUES ('455', '<strong>关闭维护中: 开/关</strong>', 'DOWN_FOR_MAINTENANCE', 'false', '网站维护中 <br />(true=是 false=否)', '20', '1', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('456', '网站维护中: 文件名', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', '网站维护中: 文件名 <br />备注: 不含后缀<br />缺省=down_for_maintenance', '20', '2', null, '2018-08-08 12:33:58', null, '');
INSERT INTO `configuration` VALUES ('457', '网站维护中: 隐藏页眉', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', '网站维护中: 隐藏页眉 <br />(true=隐藏 false=显示)', '20', '3', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('458', '网站维护中: 隐藏左栏目', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', '网站维护中: 隐藏左栏目 <br />(true=隐藏 false=显示)', '20', '4', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('459', '网站维护中: 隐藏右栏目', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', '网站维护中: 隐藏右栏目 <br />(true=隐藏 false=显示)', '20', '5', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('460', '网站维护中: 隐藏页脚', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', '网站维护中: 隐藏页脚 <br />(true=隐藏 false=显示)', '20', '6', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('461', '网站维护中: 隐藏价格', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', '网站维护中: 隐藏价格 <br />(true=隐藏 false=显示)', '20', '7', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('462', '关闭维护中 (不包括该IP地址)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', '您的IP地址(管理员)', '网站维护时，该地址仍然可以访问网站 (例如网管)<br />要输入多个地址，用逗号分开。如果您不知道IP地址，可以查看商店界面的页脚。', '20', '8', '2003-03-21 13:43:22', '2003-03-21 21:20:07', null, null);
INSERT INTO `configuration` VALUES ('463', '关闭维护前发布通知: 开/关', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', '是否在网站维护前给出提醒信息<br />(true=是 false=否)<br />如果您将\'网站维护中: 开/关\'设为开，该值自动设为否', '20', '9', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('464', '维护前的通知日期和小时', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '2003/05/15  2-3 PM', '输入网站维护的日期和时间', '20', '10', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, null);
INSERT INTO `configuration` VALUES ('465', '显示网站管理员开始维护', 'DISPLAY_MAINTENANCE_TIME', 'false', '显示网管何时开始维护 <br />(true=是 false=否)<br />', '20', '11', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('466', '显示网站维护时段', 'DISPLAY_MAINTENANCE_PERIOD', 'false', '显示网站维护时段 <br />(true=是 false=否)<br />', '20', '12', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('467', '网站维护时段', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', '输入网站维护时段(小时:分钟)', '20', '13', '2003-03-21 13:08:25', '2003-03-21 11:42:47', null, null);
INSERT INTO `configuration` VALUES ('468', '结帐时确认顾客须知中条款', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'true', '结帐时显示客户必须同意的顾客须知中的条款。', '11', '1', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('469', '创建帐号时确认隐私声明', 'DISPLAY_PRIVACY_CONDITIONS', 'true', '创建帐号时显示客户必须同意的隐私声明。', '11', '2', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('470', '显示商品图像', 'PRODUCT_NEW_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '1', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('471', '显示商品数量', 'PRODUCT_NEW_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '2', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('472', '显示商品马上购买按钮', 'PRODUCT_NEW_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '3', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('473', '显示商品名称', 'PRODUCT_NEW_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '4', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('474', '显示商品型号', 'PRODUCT_NEW_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '5', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('475', '显示厂商名字', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '6', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('476', '显示商品价格', 'PRODUCT_NEW_LIST_PRICE', '2402', '要显示商品价格吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '7', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('477', '显示商品重量', 'PRODUCT_NEW_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '8', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('478', '显示商品加入日期', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '21', '9', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('479', '显示商品简介', 'PRODUCT_NEW_LIST_DESCRIPTION', '150', '商品简介显示的字数<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', '21', '10', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('480', '商品显示缺省排序', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', '显示新进商品的缺省排序是什么?<br />缺省 = 6 日期由新到旧<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', '21', '11', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO `configuration` VALUES ('481', '商品缺省的新组编号', 'PRODUCT_NEW_LIST_GROUP_ID', '21', '警告: 仅在新进商品组编号与缺省的21不同时，才修改该值。<br />新进商品组的编号是什么?', '21', '12', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('482', '显示多个商品数量方框并设定按钮位置', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '21', '25', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('483', '屏蔽预售商品', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', '要在边框和中框的新进商品列表中屏蔽预售商品吗?<br />0= 否<br />1= 是', '21', '30', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('484', '显示商品图像', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '1', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('485', '显示商品数量', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '2', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('486', '显示商品马上购买按钮', 'PRODUCT_FEATURED_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '3', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('487', '显示商品名称', 'PRODUCT_FEATURED_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '4', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('488', '显示商品型号', 'PRODUCT_FEATURED_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '5', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('489', '显示厂商名字', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '6', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('490', '显示商品价格', 'PRODUCT_FEATURED_LIST_PRICE', '2402', '要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '7', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('491', '显示商品重量', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '8', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('492', '显示商品加入日期', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '22', '9', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('493', '显示商品简介', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '150', '商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', '22', '10', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('494', '商品显示缺省排序', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', '显示推荐商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', '22', '11', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO `configuration` VALUES ('495', '推荐商品的缺省组编号', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', '警告: 仅在推荐商品组编号与缺省的22不同时，才修改该值<br />推荐商品组的编号是什么?', '22', '12', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('496', '显示多个商品数量方框并设定按钮位置', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '22', '25', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('497', '显示商品图像', 'PRODUCT_ALL_LIST_IMAGE', '1102', '要显示商品图像吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '1', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('498', '显示商品数量', 'PRODUCT_ALL_LIST_QUANTITY', '1202', '要显示商品数量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '2', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('499', '显示商品马上购买按钮', 'PRODUCT_ALL_BUY_NOW', '1300', '要显示商品的立购买按钮吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '3', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('500', '显示商品名称', 'PRODUCT_ALL_LIST_NAME', '2101', '要显示商品名称吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '4', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('501', '显示商品型号', 'PRODUCT_ALL_LIST_MODEL', '2201', '要显示商品型号吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '5', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('502', '显示厂商名字', 'PRODUCT_ALL_LIST_MANUFACTURER', '2302', '要显示商品的厂商名字吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '6', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('503', '显示商品价格', 'PRODUCT_ALL_LIST_PRICE', '2402', '要显示商品价格吗<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '7', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('504', '显示商品重量', 'PRODUCT_ALL_LIST_WEIGHT', '2502', '要显示商品重量吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '8', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('505', '显示商品加入日期', 'PRODUCT_ALL_LIST_DATE_ADDED', '2601', '要显示商品的加入日期吗?<br /><br />0= 否<br />第一位数字 左边还是右边<br />第二、三位数字 排序顺序<br />第四位数字 之后的空行数<br />', '23', '9', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('506', '显示商品简介', 'PRODUCT_ALL_LIST_DESCRIPTION', '150', '商品简介显示的字数?<br /><br />0= 不显示<br />150= 建议字数，或者输入要显示的最多字数', '23', '10', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('507', '商品显示缺省排序', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', '显示所有商品的缺省排序是什么?<br />缺省 = 1 为商品名称<br /><br />1= 商品名称<br />2= 商品介绍<br />3= 价格由低到高, 商品名称<br />4= 价格由高到低, 商品名称<br />5= 型号<br />6= 加入日期降序<br />7= 加入日期<br />8= 商品排序', '23', '11', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ');
INSERT INTO `configuration` VALUES ('508', '商品缺省的所有组编号', 'PRODUCT_ALL_LIST_GROUP_ID', '23', '警告: 仅在所有商品组编号与缺省的23不同时，才修改该值<br />所有商品组的编号是什么?', '23', '12', null, '2018-08-08 12:33:58', null, null);
INSERT INTO `configuration` VALUES ('509', '显示多个商品数量方框并设定按钮位置', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', '要显示添加多个商品数量方框并设定按钮位置吗?<br />0= 否<br />1= 页面顶部<br />2= 页面底部<br />3= 同时', '23', '25', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ');
INSERT INTO `configuration` VALUES ('510', '在首页上显示新进商品', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '1', '在首页上显示新进商品<br />0= 否 或设置排序顺序', '24', '65', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('511', '在首页上显示推荐商品', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品<br />0= 否 或设置排序顺序', '24', '66', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('512', '在首页上显示特价商品', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品<br />0= 否 或设置排序顺序', '24', '67', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('513', '在首页上显示预售商品', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '4', '在首页上显示预售商品<br />0= 否 或设置排序顺序', '24', '68', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('514', '在首页上显示新进商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', '在首页上显示新进商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '70', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('515', '在首页上显示推荐商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '71', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('516', '在首页上显示特价商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '72', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('517', '在首页上显示预售商品 - 分类及子分类', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', '在首页上显示预售商品 - 分类和子分类<br />0= 否 或设置排序顺序', '24', '73', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('518', '在首页上显示新进商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', '在首页上显示新进商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '75', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('519', '在首页上显示推荐商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', '在首页上显示推荐商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '76', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('520', '在首页上显示特价商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', '在首页上显示特价商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '77', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('521', '在首页上显示预售商品 - 错误和丢失商品页', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', '在首页上显示预售商品 - 错误和丢失商品<br />0= 否 或设置排序顺序', '24', '78', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('522', '显示新进商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '1', '在商品列表下显示新进商品<br />0= 否 或设置排序顺序', '24', '85', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('523', '显示推荐商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '2', '在商品列表下显示推荐商品<br />0= 否 或设置排序顺序', '24', '86', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('524', '显示特价商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '3', '在商品列表下显示特价商品<br />0= 否 或设置排序顺序', '24', '87', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('525', '显示预售商品 - 商品列表下', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '4', '在商品列表下显示推荐商品<br />0= 否 或设置排序顺序', '24', '88', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ');
INSERT INTO `configuration` VALUES ('526', '新进商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '3', '每行显示的新进商品数', '24', '95', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `configuration` VALUES ('527', '推荐商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '3', '每行显示的推荐商品数', '24', '96', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `configuration` VALUES ('528', '特价商品每行列数', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '3', '每行显示的特价商品数', '24', '97', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ');
INSERT INTO `configuration` VALUES ('529', '过滤当前主分类的商品列表', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', '显示当前主分类的商品列表，还是显示所有分类中的商品?<br />0= 关闭过滤 1=打开过滤 ', '24', '100', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'), ');
INSERT INTO `configuration` VALUES ('530', '定义首页文字', 'DEFINE_MAIN_PAGE_STATUS', '1', '是否使用首页文字的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '60', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('531', '定义联系我们', 'DEFINE_CONTACT_US_STATUS', '1', '是否使用联系我们的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '61', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('532', '定义隐私声明', 'DEFINE_PRIVACY_STATUS', '1', '是否使用隐私声明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '62', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('533', '定义发货付款须知', 'DEFINE_SHIPPINGINFO_STATUS', '1', '是否使用发货付款须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '63', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('534', '定义顾客须知', 'DEFINE_CONDITIONS_STATUS', '1', '是否使用顾客须知的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '64', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('535', '定义成功结帐页面', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', '是否使用成功结帐页的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '65', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('536', '定义优惠券说明', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', '是否使用优惠券说明的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '66', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('537', '定义网站地图', 'DEFINE_SITE_MAP_STATUS', '1', '是否使用网站地图的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '67', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('538', '定义Page-Not-Found', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', '使用定义页面下的Defined Page-Not-Found的文字?<br />0= 关闭定义文字<br />1= 打开定义文字', '25', '67', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('539', '定义页面二', 'DEFINE_PAGE_2_STATUS', '1', '是否使用页面二的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '82', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('540', '定义页面三', 'DEFINE_PAGE_3_STATUS', '1', '是否使用页面三的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '83', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('541', '定义页面四', 'DEFINE_PAGE_4_STATUS', '1', '是否使用页面四的链接/文字<br />0= 链接 是, 文字 否<br />1= 链接 是, 文字 是<br />2= 链接 否, 文字 是<br />3= 链接 否, 文字 否', '25', '84', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),');
INSERT INTO `configuration` VALUES ('542', '简易页面 - 页眉', 'EZPAGES_STATUS_HEADER', '1', '在全局范围打开/关闭简易页面的页眉<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', '30', '10', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('543', '简易页面 - 页脚', 'EZPAGES_STATUS_FOOTER', '1', '在全局范围打开/关闭简易页面的页脚<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', '30', '11', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('544', '简易页面 - 边框', 'EZPAGES_STATUS_SIDEBOX', '1', '在全局范围打开/关闭简易页面的边框<br />0 = 关闭<br />1 = 打开<br />2= 打开，仅限管理员IP，位于网站维护菜单<br />说明: 仅对管理员可见', '30', '12', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('545', '简易页面页眉分隔符', 'EZPAGES_SEPARATOR_HEADER', '::', '简易页面页眉分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;', '30', '20', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('546', '简易页面页脚分隔符', 'EZPAGES_SEPARATOR_FOOTER', '::', '简易页面页脚分隔符<br />缺省 = &amp;nbsp;::&amp;nbsp;', '30', '21', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('547', '简易页面导航按钮', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', '是否在简易页面上显示导航按钮<br />0=否 (无按钮)<br />1=\"继续\"<br />2=\"上一页/继续/下一页\"<br /><br />缺省: 2', '30', '30', null, '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ');
INSERT INTO `configuration` VALUES ('548', '简易页面目录', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', '打开简易页面章节的目录吗?<br />0= OFF<br />1= ON', '30', '35', '2018-08-08 12:33:58', '2018-08-08 12:33:58', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('549', '简易页面中不显示页眉的页面', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', '简易页面中不显示商店的页眉的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 1,5,2<br />或留空。', '30', '40', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('550', '简易页面中不显示页脚的页面', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', '简易页面中不显示商店的页脚的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,7<br />或留空。', '30', '41', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('551', '简易页面中不显示左栏目的页面', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的左栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 21<br />或留空。', '30', '42', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('552', '简易页面中不显示右栏目的页面', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', '简易页面中不显示商店的右栏目(边框)的页面。<br />页编号用逗号分隔，不带空格<br />页编号可以从管理页面－工具－简易页面菜单中获得。<br />例如: 3,82,13<br />或留空。', '30', '43', null, '2018-08-08 12:33:58', null, 'zen_cfg_textarea_small(');
INSERT INTO `configuration` VALUES ('553', '上传目录', 'EASYPOPULATE_CONFIG_TEMP_DIR', 'tempEP/', '上传目录的名称(默认: tempEP/)', '31', '0', null, '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('554', '上传文件日期格式', 'EASYPOPULATE_CONFIG_FILE_DATE_FORMAT', 'y-m-d', '选择上传文件日期格式，通常由MS Excel生成。上传文件的RAW日期 (例如 2005-09-26 09:00:00) 不受影响，会照样上传。', '31', '1', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\"m-d-y\", \"d-m-y\", \"y-m-d\"),');
INSERT INTO `configuration` VALUES ('555', '默认时间格式', 'EASYPOPULATE_CONFIG_DEFAULT_RAW_TIME', '09:00:00', '如果上传文件中没有指定时间，将使用该值。适合指定特价在某个时间后生效。(默认: 09:00:00)', '31', '2', null, '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('556', '分批导入的数据量', 'EASYPOPULATE_CONFIG_SPLIT_MAX', '300', '缺省的分割上传文件的记录数目。用于防止大量上传时出现的超时。(默认: 300)', '31', '3', null, '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('557', '最大分类深度', 'EASYPOPULATE_CONFIG_MAX_CATEGORY_LEVELS', '7', '商店的最大分类深度，决定下载文件中分类的栏目数量 (默认: 7)', '31', '4', null, '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('558', '上传/下载价格含税', 'EASYPOPULATE_CONFIG_PRICE_INC_TAX', 'false', '选择价格是否含税。', '31', '5', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\"true\", \"false\"),');
INSERT INTO `configuration` VALUES ('559', '数量为零的产品不激活', 'EASYPOPULATE_CONFIG_ZERO_QTY_INACTIVE', 'false', '批量上传时，如果产品数量为零，产品状态设置为未激活。(默认: false)', '31', '6', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\"true\", \"false\"),');
INSERT INTO `configuration` VALUES ('560', '换行的智能标签替换', 'EASYPOPULATE_CONFIG_SMART_TAGS', 'true', '上传文件中描述字段，回车符和换行符转换为HTML换行，防止格式错误(默认: true)', '31', '7', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\"true\", \"false\"),');
INSERT INTO `configuration` VALUES ('561', '高级智能标签', 'EASYPOPULATE_CONFIG_ADV_SMART_TAGS', 'false', '描述字段采用高级格式化，标题加粗、添加列表等。在ADMIN/easypopulate.php文件中设置 (默认: false)', '31', '8', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\"true\", \"false\"),');
INSERT INTO `configuration` VALUES ('562', '调试记录', 'EASYPOPULATE_CONFIG_DEBUG_LOGGING', 'true', '生成调试记录 (默认: true)', '31', '9', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\"true\", \"false\"),');
INSERT INTO `configuration` VALUES ('563', '自定义产品字段', 'EASYPOPULATE_CONFIG_CUSTOM_FIELDS', '', '输入用逗号分割的产品数据表里的字段名称，将自动增加到导入、导出文件(例如: products_length, products_width). 请确认这些字段存在 PRODUCTS 表中。', '31', '10', null, '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('564', '商品列表 - 排列方式', 'PRODUCT_LISTING_LAYOUT_STYLE', 'rows', '选择排列方式:<br />每个产品一行(rows) 还是每行显示多个产品(columns)<br />如果允许顾客自己选择排列方式，这里设定默认值。', '8', '41', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'rows\', \'columns\'),');
INSERT INTO `configuration` VALUES ('565', '商品列表 - 每行列数', 'PRODUCT_LISTING_COLUMNS_PER_ROW', '3', '选择商品列表中每行显示的商品数目，缺省为3', '8', '42', null, '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('566', '商品列表 - 排列方式 - 顾客控制', 'PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER', '0', '是否允许顾客选择排列方式 (0=否, 1=是):', '8', '43', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('567', '商品列表 - 显示排序', 'PRODUCT_LISTING_GRID_SORT', '0', '是否允许顾客选择排序 (0=否, 1=是):', '8', '44', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'0\', \'1\'),');
INSERT INTO `configuration` VALUES ('568', '<b>图片展示</b>', 'ZEN_LIGHTBOX_STATUS', 'true', '<br />如果设置为 true，以下页面的产品图片将启用图片展示效果:<br /><br />- document_general_info<br />- document_product_info<br />- page (简易页面)<br />- product_free_shipping_info<br />- product_info<br />- product_music_info<br />- product_reviews<br />- product_reviews_info<br />- product_reviews_write<br /><br /><b>默认: true</b>', '32', '100', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('569', '透明度', 'ZEN_LIGHTBOX_OVERLAY_OPACITY', '0.8', '<br />设置透明度。<br /><br /><b>默认: 0.8</b>', '32', '101', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'0\', \'0.1\', \'0.2\', \'0.3\', \'0.4\', \'0.5\', \'0.6\', \'0.7\', \'0.8\', \'0.9\', \'1\'), ');
INSERT INTO `configuration` VALUES ('570', '背景淡出时长', 'ZEN_LIGHTBOX_OVERLAY_FADE_DURATION', '400', '<br />控制背景淡出时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', '32', '102', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('571', '变化尺寸时长', 'ZEN_LIGHTBOX_RESIZE_DURATION', '400', '<br />设定变换图片尺寸的速度。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', '32', '103', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('572', '变换尺寸', 'ZEN_LIGHTBOX_RESIZE_TRANSITION', 'false', '<br />允许设定展示图片的大小。<br /><br /><b>默认: false</b><br />', '32', '104', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('573', '初始化宽度', 'ZEN_LIGHTBOX_INITIAL_WIDTH', '250', '<br />显示图片的宽度。<br /><br />说明: 以点为单位。<br /><br /><b>默认: 250</b><br />', '32', '105', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('574', '初始化高度', 'ZEN_LIGHTBOX_INITIAL_HEIGHT', '250', '<br />显示图片的高度。<br /><br />说明: 以点为单位。<br /><br /><b>默认: 250</b><br />', '32', '106', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('575', '图片淡出时长', 'ZEN_LIGHTBOX_IMAGE_FADE_DURATION', '400', '<br />设定图片淡出时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', '32', '107', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('576', '动态标题时长', 'ZEN_LIGHTBOX_CAPTION_ANIMATION_DURATION', '400', '<br />设定动态标题的时长。<br /><br />说明: 以毫秒为单位。<br /><br /><b>默认: 400</b><br />', '32', '108', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('577', '显示图片计数', 'ZEN_LIGHTBOX_COUNTER', 'true', '<br />设置为true时显示图片计数(图片标题下面)。<br /><br /><b>默认: true</b>', '32', '109', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('578', '点击图片关闭窗口', 'ZEN_LIGHTBOX_CLOSE_IMAGE', 'false', '<br />设置为true时，点击图片关闭窗口。<br /><br /><b>默认: false</b>', '32', '110', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('579', '点击背景关闭窗口', 'ZEN_LIGHTBOX_CLOSE_OVERLAY', 'false', '<br />设置为true时，点击背景关闭窗口。<br /><br /><b>默认: false</b>', '32', '111', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('580', '显示翻页按钮', 'ZEN_LIGHTBOX_PREV_NEXT', 'false', '<br />设置为true时，总是显示前后翻页按钮。说明: 点击图片关闭窗口设置为TRUE时，本参数无效。<br /><br /><b>默认: false</b>', '32', '112', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('581', '<b>键盘翻页</b>', 'ZEN_LIGHTBOX_KEYBOARD_NAVIGATION', 'true', '<br />设置为true时，可以用键盘控制翻页。<br /><br /><b>默认: true</b>', '32', '200', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO `configuration` VALUES ('582', '关闭展示', 'ZEN_LIGHTBOX_ESCAPE_KEYS', '27,88,67', '<br />下面的所有按键都可关闭图片展示。<br /><br />说明: 仅可以输入<a href=\"http://en.wikipedia.org/wiki/ASCII\" target=\"_blank\">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 27,88,67</b><br />', '32', '201', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('583', '上一张', 'ZEN_LIGHTBOX_PREVIOUS_KEYS', '37,80', '<br />这些按键显示上一张图片。<br /><br />说明: 仅可以输入<a href=\"http://en.wikipedia.org/wiki/ASCII\" target=\"_blank\">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 37,80</b><br />', '32', '202', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('584', '下一张', 'ZEN_LIGHTBOX_NEXT_KEYS', '39,78', '<br />这些按键显示下一张图片。<br /><br />说明: 仅可以输入<a href=\"http://en.wikipedia.org/wiki/ASCII\" target=\"_blank\">ASCII</a>十进制值，多个值用逗号分开。<br /><br /><b>默认: 39,78</b><br />', '32', '203', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('585', '<b>图库模式</b>', 'ZEN_LIGHTBOX_GALLERY_MODE', 'true', '<br />设置为true时，使用前后按钮快速显示附加图片。<br /><br /><b>默认: true</b>', '32', '300', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('586', '商品主图', 'ZEN_LIGHTBOX_GALLERY_MAIN_IMAGE', 'true', '<br />设置为true时，图库中包含商品主图。<br /><br /><b>默认: true</b>', '32', '301', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('587', '<b>支持简易页面</b>', 'ZEN_LIGHTBOX_EZPAGES', 'true', '<br />设置为true时，所有简易页面的链接图片启用图片展示效果。<br /><br /><b>默认: true</b>', '32', '400', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, 'zen_cfg_select_option(array(\'true\', \'false\'),');
INSERT INTO `configuration` VALUES ('588', '文件类型', 'ZEN_LIGHTBOX_FILE_TYPES', 'jpg,png,gif', '<br />简易页面上的以下图片类型启用图片展示效果。<br /><br /><b>默认: jpg,png,gif</b><br />', '32', '401', '2018-08-08 12:34:01', '2018-08-08 12:34:01', null, null);
INSERT INTO `configuration` VALUES ('589', 'Use root path for cookie path', 'SESSION_USE_ROOT_COOKIE_PATH', 'False', 'Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>', '15', '999', null, '0001-01-01 00:00:00', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('590', 'Add period prefix to cookie domain', 'SESSION_ADD_PERIOD_PREFIX', 'True', 'Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>', '15', '999', null, '0001-01-01 00:00:00', null, 'zen_cfg_select_option(array(\'True\', \'False\'), ');
INSERT INTO `configuration` VALUES ('591', 'IH 调整图像大小', 'IH_RESIZE', 'no', 'Zen-Cart的缺省设置为 -no-，要打开自动调整图像大小，设置为 -yes-。--说明: 如果选择 -no-, 所有图像管理相关的设置会失效，包括: 图像文件类型选择、背景颜色、压缩、弹出图像和水印-- 如果要使用ImageMagick，请在<em>includes/extra_configures/bmz_image_handler_conf.php</em>中设定<strong>convert</strong>文件的路径。', '4', '1001', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'yes\',\'no\'),');
INSERT INTO `configuration` VALUES ('592', 'IH 小图像文件类型', 'SMALL_IMAGE_FILETYPE', 'no_change', '可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，小图像采用与上传的图像相同的后缀。', '4', '1011', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),');
INSERT INTO `configuration` VALUES ('593', 'IH 小图像背景', 'SMALL_IMAGE_BACKGROUND', '255:255:255', '如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-', '4', '1021', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('594', 'IH 小图像压缩质量', 'SMALL_IMAGE_QUALITY', '85', '设定期望的JPG小图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。', '4', '1031', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('595', 'IH 小图像水印', 'WATERMARK_SMALL_IMAGES', 'no', '如果小图像要显示水印，设置为 -yes-', '4', '1041', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'no\',\'yes\'),');
INSERT INTO `configuration` VALUES ('596', 'IH 放大小图像', 'ZOOM_SMALL_IMAGES', 'yes', '如果要在鼠标移动到小图像上时，显示放大的图像，设置为 -yes-', '4', '1051', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'no\',\'yes\'),');
INSERT INTO `configuration` VALUES ('597', 'IH 小图像放大尺寸', 'ZOOM_IMAGE_SIZE', 'Medium', '如果小图像放大为中图，设置为 -Medium-，如果要放大为大图，设置为 -Large-', '4', '1061', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'Medium\',\'Large\'),');
INSERT INTO `configuration` VALUES ('598', 'IH 中图像文件类型', 'MEDIUM_IMAGE_FILETYPE', 'no_change', '可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，中图像采用与上传的图像相同的后缀。', '4', '1071', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),');
INSERT INTO `configuration` VALUES ('599', 'IH 中图像背景', 'MEDIUM_IMAGE_BACKGROUND', '255:255:255', '如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-', '4', '1081', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('600', 'IH 中图像压缩质量', 'MEDIUM_IMAGE_QUALITY', '85', '设定期望的JPG中图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。', '4', '1091', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('601', 'IH 中图像水印', 'WATERMARK_MEDIUM_IMAGES', 'no', '如果中图像要显示水印，设置为 -yes-', '4', '1101', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'no\',\'yes\'),');
INSERT INTO `configuration` VALUES ('602', 'IH 大图像文件类型', 'LARGE_IMAGE_FILETYPE', 'no_change', '可选择 -jpg-, -gif- 或 -png-。Internet Explorer v6.0 以下版本不能正常显示透明背景的 -png- 图像。虽然 -png- 非常适合透明背景的图片，但是如果要支持旧版的IE，最好设置为 -gif-。较大的图像请使用 -jpg- 或者 -png-。zen-cart的默认方式是 -no_change-，大图像采用与上传的图像相同的后缀。', '4', '1111', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),');
INSERT INTO `configuration` VALUES ('603', 'IH 大图像背景', 'LARGE_IMAGE_BACKGROUND', '255:255:255', '如果上传的是透明背景图像，该颜色将替代图片的透明部分。保持透明设置为 -transparent-', '4', '1121', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('604', 'IH 大图像压缩质量', 'LARGE_IMAGE_QUALITY', '85', '设定期望的JPG大图像质量，数字值从0到100。值越高图像质量越好，图像文件也越大。缺省为85，通常可以满足要求。', '4', '1131', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('605', 'IH 大图像水印', 'WATERMARK_LARGE_IMAGES', 'no', '如果大图像要显示水印，设置为 -yes-', '4', '1141', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'no\',\'yes\'),');
INSERT INTO `configuration` VALUES ('606', 'IH 大图像最大宽度', 'LARGE_IMAGE_MAX_WIDTH', '750', '设置大图像的最大宽度。如果宽度和高度为空或0，将不会自动调整大图像的大小。', '4', '1151', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('607', 'IH 大图像最大高度', 'LARGE_IMAGE_MAX_HEIGHT', '550', '设置大图像的最大高度。如果宽度和高度为空或0，将不会自动调整大图像的大小。', '4', '1161', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('608', 'IH 水印位置', 'WATERMARK_GRAVITY', 'Center', '选择水印在图像中的位置，默认为 <strong>Center</Strong>.', '4', '1171', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, 'zen_cfg_select_option(array(\'Center\',\'NorthWest\',\'North\',\'NorthEast\',\'East\',\'SouthEast\',\'South\',\'SouthWest\',\'West\'),');
INSERT INTO `configuration` VALUES ('609', '图像管理版本', 'IH_VERSION', '4.3.2', '仅保存图像管理版本，但不显示在配置菜单中。', '0', '10000', '2018-08-08 12:34:51', '2018-08-08 12:34:51', null, null);
INSERT INTO `configuration` VALUES ('610', '网址优化版本', 'USU_VERSION', '2.212', '已安装版本', '33', '0', '2018-08-08 12:34:51', '2018-08-08 12:34:51', '', 'zen_cfg_select_option(array(\\\'2.212\\\'),');
INSERT INTO `configuration` VALUES ('611', '启用网址优化吗?', 'SEO_ENABLED', 'true', '全局控制开启还是关闭网址优化模块。', '33', '1', null, '2018-08-08 12:34:51', '', 'zen_cfg_select_option(array(\\\'true\\\', \\\'false\\\'),');
INSERT INTO `configuration` VALUES ('612', '生成 cPath 参数', 'SEO_URL_CPATH', 'auto', 'Zen Cart 默认在产品页面使用 cPath 参数，用以保证链接产品在相应的分类。自动模式下，如果不需要可以删除 cPath。', '33', '2', null, '2018-08-08 12:34:51', 'usu_check_cpath_option', 'zen_cfg_select_option(array(\\\'enable-auto\\\', \\\'disable\\\'),');
INSERT INTO `configuration` VALUES ('613', '网址重写后缀', 'SEO_URL_END', '.html', '在这里输入网址重写后的后缀。例如 \'.html\', \'.htm\', 也可以留空', '33', '3', null, '2018-08-08 12:34:51', '', '');
INSERT INTO `configuration` VALUES ('614', '重写网址的格式', 'SEO_URL_FORMAT', 'original', '选择一种格式。<br /><b>Original:</b><br /><i>Categories:</i> category-name-c-34<br /><i>Products:</i> product-name-p-54<br /><br /><b>Category Parent:</b><br /><i>Categories:</i> parent-category-name-c-34<br /><i>Products:</i> parent-product-name-p-54', '33', '4', null, '2018-08-08 12:34:51', 'usu_check_url_format_option', 'zen_cfg_select_option(array(\\\'enable-original\\\', \\\'enable-parent\\\'),');
INSERT INTO `configuration` VALUES ('615', '显示分类为目录', 'SEO_URL_CATEGORY_DIR', 'short', '选择一种格式。<br /><b>Off:</b> 禁用显示分类为目录<br /><br /><b>Short:</b> 使用\'重写网址的格式\'的设置<b>Full:</b> 使用完整的分类路径<br /><br />', '33', '5', null, '2018-08-08 12:34:51', 'usu_check_category_dir_option', 'zen_cfg_select_option(array(\\\'disable\\\', \\\'enable-short\\\', \\\'enable-full\\\'),');
INSERT INTO `configuration` VALUES ('616', '输入网址的 PCRE 过滤规则', 'SEO_URLS_FILTER_PCRE', '', 'This setting uses PCRE rules to filter generated urls.<br><br>The format <b>MUST</b> be in the form: <b>find1=>replace1,find2=>replace2</b>. This filter is run before character conversions and stripping of special characters. If you want a dash - in your URLS, use a single space. Also note you must double escape back slashes.', '33', '6', null, '2018-08-08 12:34:51', '', '');
INSERT INTO `configuration` VALUES ('617', '输入特殊字符转换', 'SEO_URLS_FILTER_CHARS', '', 'This setting will replace a single byte character with another single byte character.<br><br>The format <b>MUST</b> be in the form: <b>char=>conv,char2=>conv2</b>', '33', '7', null, '2018-08-08 12:34:51', '', '');
INSERT INTO `configuration` VALUES ('618', '网址中排除的字符', 'SEO_URLS_REMOVE_CHARS', 'punctuation', 'This allows you remove certain problematic characters from the generated URLs.<br /><br /><i>non-alphanumerical:</i> removes all non-alphanumerical characters<br /><i>punctuation:</i> removes all punctuation characters', '33', '8', null, '2018-08-08 12:34:51', 'usu_check_remove_chars_option', 'zen_cfg_select_option(array(\\\'enable-non-alphanumerical\\\', \\\'enable-punctuation\\\'),');
INSERT INTO `configuration` VALUES ('619', '过滤太短的单词', 'SEO_URLS_FILTER_SHORT_WORDS', '0', 'This setting will filter words less than or equal to the value from the URL.', '33', '9', null, '2018-08-08 12:34:51', '', '');
INSERT INTO `configuration` VALUES ('620', '输入允许重写的页面', 'SEO_URLS_ONLY_IN', 'index, product_info, product_music_info, document_general_info, document_product_info, product_free_shipping_info, products_new, products_all, shopping_cart, featured_products, specials, contact_us, conditions, privacy, reviews, shippinginfo, faqs_all, site_map, gv_faq, discount_coupon, page, page_2, page_3, page_4', 'You can limit the pages which will be rewritten by specifying them here. If no pages are specified all pages will be rewritten. <br><br>The format is comma delimited and <b>MUST</b> be in the form: <b>page1,page2,page3</b> or <b>page1, page2, page3</b>', '33', '10', null, '2018-08-08 12:34:51', '', '');
INSERT INTO `configuration` VALUES ('621', '选择网址重写引擎', 'SEO_REWRITE_TYPE', 'rewrite', '选择使用的网址优化引擎。', '33', '11', null, '2018-08-08 12:34:51', '', 'zen_cfg_select_option(array(\\\'rewrite\\\'),');
INSERT INTO `configuration` VALUES ('622', '启用自动转向?', 'SEO_USE_REDIRECT', 'false', '旧网址到新网址自动跳转，发送 301 页头。', '33', '12', null, '2018-08-08 12:34:51', '', 'zen_cfg_select_option(array(\\\'true\\\', \\\'false\\\'),');
INSERT INTO `configuration` VALUES ('623', '启用网址优化缓存减少查询次数?', 'SEO_USE_CACHE_GLOBAL', 'true', '全局设置开关缓存。', '33', '13', null, '2018-08-08 12:34:51', 'usu_check_cache_options', 'zen_cfg_select_option(array(\\\'enable\\\', \\\'disable\\\'),');
INSERT INTO `configuration` VALUES ('624', '启用产品缓存?', 'SEO_USE_CACHE_PRODUCTS', 'true', '开关产品缓存。', '33', '14', null, '2018-08-08 12:34:51', 'usu_check_cache_options', 'zen_cfg_select_option(array(\\\'enable-products\\\', \\\'disable-products\\\'),');
INSERT INTO `configuration` VALUES ('625', '启用分类缓存?', 'SEO_USE_CACHE_CATEGORIES', 'true', '开关分类缓存。', '33', '15', null, '2018-08-08 12:34:51', 'usu_check_cache_options', 'zen_cfg_select_option(array(\\\'enable-categories\\\', \\\'disable-categories\\\'),');
INSERT INTO `configuration` VALUES ('626', '启用厂家缓存?', 'SEO_USE_CACHE_MANUFACTURERS', 'true', '开关厂家缓存。', '33', '16', null, '2018-08-08 12:34:51', 'usu_check_cache_options', 'zen_cfg_select_option(array(\\\'enable-manufacturers\\\', \\\'disable-manufacturers\\\'),');
INSERT INTO `configuration` VALUES ('627', '启用简易页面缓存?', 'SEO_USE_CACHE_EZ_PAGES', 'true', '开关简易页面缓存。', '33', '17', null, '2018-08-08 12:34:51', 'usu_check_cache_options', 'zen_cfg_select_option(array(\\\'enable-ez_pages\\\', \\\'disable-ez_pages\\\'),');
INSERT INTO `configuration` VALUES ('628', '重置网址优化缓存', 'SEO_URLS_CACHE_RESET', 'false', '重置网址优化的缓存数据。', '33', '18', null, '2018-08-08 12:34:51', 'usu_reset_cache_data', 'zen_cfg_select_option(array(\\\'true\\\', \\\'false\\\'),');

-- ----------------------------
-- Table structure for `configuration_group`
-- ----------------------------
DROP TABLE IF EXISTS `configuration_group`;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configuration_group
-- ----------------------------
INSERT INTO `configuration_group` VALUES ('1', '基本设置', '商店的基本情况', '1', '1');
INSERT INTO `configuration_group` VALUES ('2', '最小值', '功能/数据的最小值', '2', '1');
INSERT INTO `configuration_group` VALUES ('3', '最大值', '功能/数据的最大值', '3', '1');
INSERT INTO `configuration_group` VALUES ('4', '图像参数', '图像参数', '4', '1');
INSERT INTO `configuration_group` VALUES ('5', '客户资料', '客户帐号选项配置', '5', '1');
INSERT INTO `configuration_group` VALUES ('6', '模块选项', '在配置中不可见', '6', '0');
INSERT INTO `configuration_group` VALUES ('7', '配送参数', '配送参数选项', '7', '1');
INSERT INTO `configuration_group` VALUES ('8', '商品列表', '商品列表配置选项', '8', '1');
INSERT INTO `configuration_group` VALUES ('9', '库存选项', '库存配置选项', '9', '1');
INSERT INTO `configuration_group` VALUES ('10', '日志选项', '日志配置选项', '10', '1');
INSERT INTO `configuration_group` VALUES ('11', '条款选项', '条款选项', '16', '1');
INSERT INTO `configuration_group` VALUES ('12', '电子邮件', '电子邮件的基本设置', '12', '1');
INSERT INTO `configuration_group` VALUES ('13', '属性设置', '商品属性设置', '13', '1');
INSERT INTO `configuration_group` VALUES ('14', 'GZip压缩', 'GZip压缩选项', '14', '1');
INSERT INTO `configuration_group` VALUES ('15', 'Sessions', 'Sessions选项', '15', '1');
INSERT INTO `configuration_group` VALUES ('16', '礼券和优惠券', '礼券和优惠券', '16', '1');
INSERT INTO `configuration_group` VALUES ('17', '信用卡', '接受的信用卡', '17', '1');
INSERT INTO `configuration_group` VALUES ('18', '商品信息', '商品信息显示选项', '18', '1');
INSERT INTO `configuration_group` VALUES ('19', '布局设置', '布局选项', '19', '1');
INSERT INTO `configuration_group` VALUES ('20', '网站维护', '网站维护选项', '20', '1');
INSERT INTO `configuration_group` VALUES ('21', '新进商品', '新进商品列表', '21', '1');
INSERT INTO `configuration_group` VALUES ('22', '推荐商品', '推荐商品列表', '22', '1');
INSERT INTO `configuration_group` VALUES ('23', '所有商品', '所有商品列表', '23', '1');
INSERT INTO `configuration_group` VALUES ('24', '商品索引', '商品索引页面', '24', '1');
INSERT INTO `configuration_group` VALUES ('25', '定义页面', '定义首页和其它HTML页面', '25', '1');
INSERT INTO `configuration_group` VALUES ('30', '简易页面设置', '简易页面设置', '30', '1');
INSERT INTO `configuration_group` VALUES ('31', '批量商品管理', '批量商品管理设置', '31', '1');
INSERT INTO `configuration_group` VALUES ('32', '图片展示', '图片展示设置', '32', '1');
INSERT INTO `configuration_group` VALUES ('33', '网址优化', '网址优化选项', '33', '1');

-- ----------------------------
-- Table structure for `counter`
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------
INSERT INTO `counter` VALUES ('20180808', '1');

-- ----------------------------
-- Table structure for `counter_history`
-- ----------------------------
DROP TABLE IF EXISTS `counter_history`;
CREATE TABLE `counter_history` (
  `startdate` char(8) NOT NULL,
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter_history
-- ----------------------------
INSERT INTO `counter_history` VALUES ('20180808', '1', '1');

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'Afghanistan', 'AF', 'AFG', '1', '1');
INSERT INTO `countries` VALUES ('2', 'Albania', 'AL', 'ALB', '1', '1');
INSERT INTO `countries` VALUES ('3', 'Algeria', 'DZ', 'DZA', '1', '1');
INSERT INTO `countries` VALUES ('4', 'American Samoa', 'AS', 'ASM', '1', '1');
INSERT INTO `countries` VALUES ('5', 'Andorra', 'AD', 'AND', '1', '1');
INSERT INTO `countries` VALUES ('6', 'Angola', 'AO', 'AGO', '1', '1');
INSERT INTO `countries` VALUES ('7', 'Anguilla', 'AI', 'AIA', '1', '1');
INSERT INTO `countries` VALUES ('8', 'Antarctica', 'AQ', 'ATA', '1', '1');
INSERT INTO `countries` VALUES ('9', 'Antigua and Barbuda', 'AG', 'ATG', '1', '1');
INSERT INTO `countries` VALUES ('10', 'Argentina', 'AR', 'ARG', '1', '1');
INSERT INTO `countries` VALUES ('11', 'Armenia', 'AM', 'ARM', '1', '1');
INSERT INTO `countries` VALUES ('12', 'Aruba', 'AW', 'ABW', '1', '1');
INSERT INTO `countries` VALUES ('13', 'Australia', 'AU', 'AUS', '7', '1');
INSERT INTO `countries` VALUES ('14', 'Austria', 'AT', 'AUT', '5', '1');
INSERT INTO `countries` VALUES ('15', 'Azerbaijan', 'AZ', 'AZE', '1', '1');
INSERT INTO `countries` VALUES ('16', 'Bahamas', 'BS', 'BHS', '1', '1');
INSERT INTO `countries` VALUES ('17', 'Bahrain', 'BH', 'BHR', '1', '1');
INSERT INTO `countries` VALUES ('18', 'Bangladesh', 'BD', 'BGD', '1', '1');
INSERT INTO `countries` VALUES ('19', 'Barbados', 'BB', 'BRB', '1', '1');
INSERT INTO `countries` VALUES ('20', 'Belarus', 'BY', 'BLR', '1', '1');
INSERT INTO `countries` VALUES ('21', 'Belgium', 'BE', 'BEL', '5', '1');
INSERT INTO `countries` VALUES ('22', 'Belize', 'BZ', 'BLZ', '1', '1');
INSERT INTO `countries` VALUES ('23', 'Benin', 'BJ', 'BEN', '1', '1');
INSERT INTO `countries` VALUES ('24', 'Bermuda', 'BM', 'BMU', '1', '1');
INSERT INTO `countries` VALUES ('25', 'Bhutan', 'BT', 'BTN', '1', '1');
INSERT INTO `countries` VALUES ('26', 'Bolivia', 'BO', 'BOL', '1', '1');
INSERT INTO `countries` VALUES ('27', 'Bosnia and Herzegowina', 'BA', 'BIH', '1', '1');
INSERT INTO `countries` VALUES ('28', 'Botswana', 'BW', 'BWA', '1', '1');
INSERT INTO `countries` VALUES ('29', 'Bouvet Island', 'BV', 'BVT', '1', '1');
INSERT INTO `countries` VALUES ('30', 'Brazil', 'BR', 'BRA', '1', '1');
INSERT INTO `countries` VALUES ('31', 'British Indian Ocean Territory', 'IO', 'IOT', '1', '1');
INSERT INTO `countries` VALUES ('32', 'Brunei Darussalam', 'BN', 'BRN', '1', '1');
INSERT INTO `countries` VALUES ('33', 'Bulgaria', 'BG', 'BGR', '1', '1');
INSERT INTO `countries` VALUES ('34', 'Burkina Faso', 'BF', 'BFA', '1', '1');
INSERT INTO `countries` VALUES ('35', 'Burundi', 'BI', 'BDI', '1', '1');
INSERT INTO `countries` VALUES ('36', 'Cambodia', 'KH', 'KHM', '1', '1');
INSERT INTO `countries` VALUES ('37', 'Cameroon', 'CM', 'CMR', '1', '1');
INSERT INTO `countries` VALUES ('38', 'Canada', 'CA', 'CAN', '2', '1');
INSERT INTO `countries` VALUES ('39', 'Cape Verde', 'CV', 'CPV', '1', '1');
INSERT INTO `countries` VALUES ('40', 'Cayman Islands', 'KY', 'CYM', '1', '1');
INSERT INTO `countries` VALUES ('41', 'Central African Republic', 'CF', 'CAF', '1', '1');
INSERT INTO `countries` VALUES ('42', 'Chad', 'TD', 'TCD', '1', '1');
INSERT INTO `countries` VALUES ('43', 'Chile', 'CL', 'CHL', '1', '1');
INSERT INTO `countries` VALUES ('44', 'China', 'CN', 'CHN', '1', '1');
INSERT INTO `countries` VALUES ('45', 'Christmas Island', 'CX', 'CXR', '1', '1');
INSERT INTO `countries` VALUES ('46', 'Cocos (Keeling) Islands', 'CC', 'CCK', '1', '1');
INSERT INTO `countries` VALUES ('47', 'Colombia', 'CO', 'COL', '1', '1');
INSERT INTO `countries` VALUES ('48', 'Comoros', 'KM', 'COM', '1', '1');
INSERT INTO `countries` VALUES ('49', 'Congo', 'CG', 'COG', '1', '1');
INSERT INTO `countries` VALUES ('50', 'Cook Islands', 'CK', 'COK', '1', '1');
INSERT INTO `countries` VALUES ('51', 'Costa Rica', 'CR', 'CRI', '1', '1');
INSERT INTO `countries` VALUES ('52', 'Cote D\'Ivoire', 'CI', 'CIV', '1', '1');
INSERT INTO `countries` VALUES ('53', 'Croatia', 'HR', 'HRV', '1', '1');
INSERT INTO `countries` VALUES ('54', 'Cuba', 'CU', 'CUB', '1', '1');
INSERT INTO `countries` VALUES ('55', 'Cyprus', 'CY', 'CYP', '1', '1');
INSERT INTO `countries` VALUES ('56', 'Czech Republic', 'CZ', 'CZE', '1', '1');
INSERT INTO `countries` VALUES ('57', 'Denmark', 'DK', 'DNK', '1', '1');
INSERT INTO `countries` VALUES ('58', 'Djibouti', 'DJ', 'DJI', '1', '1');
INSERT INTO `countries` VALUES ('59', 'Dominica', 'DM', 'DMA', '1', '1');
INSERT INTO `countries` VALUES ('60', 'Dominican Republic', 'DO', 'DOM', '1', '1');
INSERT INTO `countries` VALUES ('61', 'Timor-Leste', 'TL', 'TLS', '1', '1');
INSERT INTO `countries` VALUES ('62', 'Ecuador', 'EC', 'ECU', '1', '1');
INSERT INTO `countries` VALUES ('63', 'Egypt', 'EG', 'EGY', '1', '1');
INSERT INTO `countries` VALUES ('64', 'El Salvador', 'SV', 'SLV', '1', '1');
INSERT INTO `countries` VALUES ('65', 'Equatorial Guinea', 'GQ', 'GNQ', '1', '1');
INSERT INTO `countries` VALUES ('66', 'Eritrea', 'ER', 'ERI', '1', '1');
INSERT INTO `countries` VALUES ('67', 'Estonia', 'EE', 'EST', '1', '1');
INSERT INTO `countries` VALUES ('68', 'Ethiopia', 'ET', 'ETH', '1', '1');
INSERT INTO `countries` VALUES ('69', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '1', '1');
INSERT INTO `countries` VALUES ('70', 'Faroe Islands', 'FO', 'FRO', '1', '1');
INSERT INTO `countries` VALUES ('71', 'Fiji', 'FJ', 'FJI', '1', '1');
INSERT INTO `countries` VALUES ('72', 'Finland', 'FI', 'FIN', '1', '1');
INSERT INTO `countries` VALUES ('73', 'France', 'FR', 'FRA', '1', '1');
INSERT INTO `countries` VALUES ('75', 'French Guiana', 'GF', 'GUF', '1', '1');
INSERT INTO `countries` VALUES ('76', 'French Polynesia', 'PF', 'PYF', '1', '1');
INSERT INTO `countries` VALUES ('77', 'French Southern Territories', 'TF', 'ATF', '1', '1');
INSERT INTO `countries` VALUES ('78', 'Gabon', 'GA', 'GAB', '1', '1');
INSERT INTO `countries` VALUES ('79', 'Gambia', 'GM', 'GMB', '1', '1');
INSERT INTO `countries` VALUES ('80', 'Georgia', 'GE', 'GEO', '1', '1');
INSERT INTO `countries` VALUES ('81', 'Germany', 'DE', 'DEU', '5', '1');
INSERT INTO `countries` VALUES ('82', 'Ghana', 'GH', 'GHA', '1', '1');
INSERT INTO `countries` VALUES ('83', 'Gibraltar', 'GI', 'GIB', '1', '1');
INSERT INTO `countries` VALUES ('84', 'Greece', 'GR', 'GRC', '1', '1');
INSERT INTO `countries` VALUES ('85', 'Greenland', 'GL', 'GRL', '1', '1');
INSERT INTO `countries` VALUES ('86', 'Grenada', 'GD', 'GRD', '1', '1');
INSERT INTO `countries` VALUES ('87', 'Guadeloupe', 'GP', 'GLP', '1', '1');
INSERT INTO `countries` VALUES ('88', 'Guam', 'GU', 'GUM', '1', '1');
INSERT INTO `countries` VALUES ('89', 'Guatemala', 'GT', 'GTM', '1', '1');
INSERT INTO `countries` VALUES ('90', 'Guinea', 'GN', 'GIN', '1', '1');
INSERT INTO `countries` VALUES ('91', 'Guinea-bissau', 'GW', 'GNB', '1', '1');
INSERT INTO `countries` VALUES ('92', 'Guyana', 'GY', 'GUY', '1', '1');
INSERT INTO `countries` VALUES ('93', 'Haiti', 'HT', 'HTI', '1', '1');
INSERT INTO `countries` VALUES ('94', 'Heard and Mc Donald Islands', 'HM', 'HMD', '1', '1');
INSERT INTO `countries` VALUES ('95', 'Honduras', 'HN', 'HND', '1', '1');
INSERT INTO `countries` VALUES ('96', 'Hong Kong', 'HK', 'HKG', '1', '1');
INSERT INTO `countries` VALUES ('97', 'Hungary', 'HU', 'HUN', '1', '1');
INSERT INTO `countries` VALUES ('98', 'Iceland', 'IS', 'ISL', '1', '1');
INSERT INTO `countries` VALUES ('99', 'India', 'IN', 'IND', '1', '1');
INSERT INTO `countries` VALUES ('100', 'Indonesia', 'ID', 'IDN', '1', '1');
INSERT INTO `countries` VALUES ('101', 'Iran (Islamic Republic of)', 'IR', 'IRN', '1', '1');
INSERT INTO `countries` VALUES ('102', 'Iraq', 'IQ', 'IRQ', '1', '1');
INSERT INTO `countries` VALUES ('103', 'Ireland', 'IE', 'IRL', '1', '1');
INSERT INTO `countries` VALUES ('104', 'Israel', 'IL', 'ISR', '1', '1');
INSERT INTO `countries` VALUES ('105', 'Italy', 'IT', 'ITA', '1', '1');
INSERT INTO `countries` VALUES ('106', 'Jamaica', 'JM', 'JAM', '1', '1');
INSERT INTO `countries` VALUES ('107', 'Japan', 'JP', 'JPN', '1', '1');
INSERT INTO `countries` VALUES ('108', 'Jordan', 'JO', 'JOR', '1', '1');
INSERT INTO `countries` VALUES ('109', 'Kazakhstan', 'KZ', 'KAZ', '1', '1');
INSERT INTO `countries` VALUES ('110', 'Kenya', 'KE', 'KEN', '1', '1');
INSERT INTO `countries` VALUES ('111', 'Kiribati', 'KI', 'KIR', '1', '1');
INSERT INTO `countries` VALUES ('112', 'Korea, Democratic People\'s Republic of', 'KP', 'PRK', '1', '1');
INSERT INTO `countries` VALUES ('113', 'Korea, Republic of', 'KR', 'KOR', '1', '1');
INSERT INTO `countries` VALUES ('114', 'Kuwait', 'KW', 'KWT', '1', '1');
INSERT INTO `countries` VALUES ('115', 'Kyrgyzstan', 'KG', 'KGZ', '1', '1');
INSERT INTO `countries` VALUES ('116', 'Lao People\'s Democratic Republic', 'LA', 'LAO', '1', '1');
INSERT INTO `countries` VALUES ('117', 'Latvia', 'LV', 'LVA', '1', '1');
INSERT INTO `countries` VALUES ('118', 'Lebanon', 'LB', 'LBN', '1', '1');
INSERT INTO `countries` VALUES ('119', 'Lesotho', 'LS', 'LSO', '1', '1');
INSERT INTO `countries` VALUES ('120', 'Liberia', 'LR', 'LBR', '1', '1');
INSERT INTO `countries` VALUES ('121', 'Libya', 'LY', 'LBY', '1', '1');
INSERT INTO `countries` VALUES ('122', 'Liechtenstein', 'LI', 'LIE', '1', '1');
INSERT INTO `countries` VALUES ('123', 'Lithuania', 'LT', 'LTU', '1', '1');
INSERT INTO `countries` VALUES ('124', 'Luxembourg', 'LU', 'LUX', '1', '1');
INSERT INTO `countries` VALUES ('125', 'Macao', 'MO', 'MAC', '1', '1');
INSERT INTO `countries` VALUES ('126', 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', '1', '1');
INSERT INTO `countries` VALUES ('127', 'Madagascar', 'MG', 'MDG', '1', '1');
INSERT INTO `countries` VALUES ('128', 'Malawi', 'MW', 'MWI', '1', '1');
INSERT INTO `countries` VALUES ('129', 'Malaysia', 'MY', 'MYS', '1', '1');
INSERT INTO `countries` VALUES ('130', 'Maldives', 'MV', 'MDV', '1', '1');
INSERT INTO `countries` VALUES ('131', 'Mali', 'ML', 'MLI', '1', '1');
INSERT INTO `countries` VALUES ('132', 'Malta', 'MT', 'MLT', '1', '1');
INSERT INTO `countries` VALUES ('133', 'Marshall Islands', 'MH', 'MHL', '1', '1');
INSERT INTO `countries` VALUES ('134', 'Martinique', 'MQ', 'MTQ', '1', '1');
INSERT INTO `countries` VALUES ('135', 'Mauritania', 'MR', 'MRT', '1', '1');
INSERT INTO `countries` VALUES ('136', 'Mauritius', 'MU', 'MUS', '1', '1');
INSERT INTO `countries` VALUES ('137', 'Mayotte', 'YT', 'MYT', '1', '1');
INSERT INTO `countries` VALUES ('138', 'Mexico', 'MX', 'MEX', '1', '1');
INSERT INTO `countries` VALUES ('139', 'Micronesia, Federated States of', 'FM', 'FSM', '1', '1');
INSERT INTO `countries` VALUES ('140', 'Moldova', 'MD', 'MDA', '1', '1');
INSERT INTO `countries` VALUES ('141', 'Monaco', 'MC', 'MCO', '1', '1');
INSERT INTO `countries` VALUES ('142', 'Mongolia', 'MN', 'MNG', '1', '1');
INSERT INTO `countries` VALUES ('143', 'Montserrat', 'MS', 'MSR', '1', '1');
INSERT INTO `countries` VALUES ('144', 'Morocco', 'MA', 'MAR', '1', '1');
INSERT INTO `countries` VALUES ('145', 'Mozambique', 'MZ', 'MOZ', '1', '1');
INSERT INTO `countries` VALUES ('146', 'Myanmar', 'MM', 'MMR', '1', '1');
INSERT INTO `countries` VALUES ('147', 'Namibia', 'NA', 'NAM', '1', '1');
INSERT INTO `countries` VALUES ('148', 'Nauru', 'NR', 'NRU', '1', '1');
INSERT INTO `countries` VALUES ('149', 'Nepal', 'NP', 'NPL', '1', '1');
INSERT INTO `countries` VALUES ('150', 'Netherlands', 'NL', 'NLD', '5', '1');
INSERT INTO `countries` VALUES ('151', 'Netherlands Antilles', 'AN', 'ANT', '1', '1');
INSERT INTO `countries` VALUES ('152', 'New Caledonia', 'NC', 'NCL', '1', '1');
INSERT INTO `countries` VALUES ('153', 'New Zealand', 'NZ', 'NZL', '1', '1');
INSERT INTO `countries` VALUES ('154', 'Nicaragua', 'NI', 'NIC', '1', '1');
INSERT INTO `countries` VALUES ('155', 'Niger', 'NE', 'NER', '1', '1');
INSERT INTO `countries` VALUES ('156', 'Nigeria', 'NG', 'NGA', '1', '1');
INSERT INTO `countries` VALUES ('157', 'Niue', 'NU', 'NIU', '1', '1');
INSERT INTO `countries` VALUES ('158', 'Norfolk Island', 'NF', 'NFK', '1', '1');
INSERT INTO `countries` VALUES ('159', 'Northern Mariana Islands', 'MP', 'MNP', '1', '1');
INSERT INTO `countries` VALUES ('160', 'Norway', 'NO', 'NOR', '1', '1');
INSERT INTO `countries` VALUES ('161', 'Oman', 'OM', 'OMN', '1', '1');
INSERT INTO `countries` VALUES ('162', 'Pakistan', 'PK', 'PAK', '1', '1');
INSERT INTO `countries` VALUES ('163', 'Palau', 'PW', 'PLW', '1', '1');
INSERT INTO `countries` VALUES ('164', 'Panama', 'PA', 'PAN', '1', '1');
INSERT INTO `countries` VALUES ('165', 'Papua New Guinea', 'PG', 'PNG', '1', '1');
INSERT INTO `countries` VALUES ('166', 'Paraguay', 'PY', 'PRY', '1', '1');
INSERT INTO `countries` VALUES ('167', 'Peru', 'PE', 'PER', '1', '1');
INSERT INTO `countries` VALUES ('168', 'Philippines', 'PH', 'PHL', '1', '1');
INSERT INTO `countries` VALUES ('169', 'Pitcairn', 'PN', 'PCN', '1', '1');
INSERT INTO `countries` VALUES ('170', 'Poland', 'PL', 'POL', '1', '1');
INSERT INTO `countries` VALUES ('171', 'Portugal', 'PT', 'PRT', '1', '1');
INSERT INTO `countries` VALUES ('172', 'Puerto Rico', 'PR', 'PRI', '1', '1');
INSERT INTO `countries` VALUES ('173', 'Qatar', 'QA', 'QAT', '1', '1');
INSERT INTO `countries` VALUES ('174', 'Reunion', 'RE', 'REU', '1', '1');
INSERT INTO `countries` VALUES ('175', 'Romania', 'RO', 'ROU', '1', '1');
INSERT INTO `countries` VALUES ('176', 'Russian Federation', 'RU', 'RUS', '1', '1');
INSERT INTO `countries` VALUES ('177', 'Rwanda', 'RW', 'RWA', '1', '1');
INSERT INTO `countries` VALUES ('178', 'Saint Kitts and Nevis', 'KN', 'KNA', '1', '1');
INSERT INTO `countries` VALUES ('179', 'Saint Lucia', 'LC', 'LCA', '1', '1');
INSERT INTO `countries` VALUES ('180', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1', '1');
INSERT INTO `countries` VALUES ('181', 'Samoa', 'WS', 'WSM', '1', '1');
INSERT INTO `countries` VALUES ('182', 'San Marino', 'SM', 'SMR', '1', '1');
INSERT INTO `countries` VALUES ('183', 'Sao Tome and Principe', 'ST', 'STP', '1', '1');
INSERT INTO `countries` VALUES ('184', 'Saudi Arabia', 'SA', 'SAU', '1', '1');
INSERT INTO `countries` VALUES ('185', 'Senegal', 'SN', 'SEN', '1', '1');
INSERT INTO `countries` VALUES ('186', 'Seychelles', 'SC', 'SYC', '1', '1');
INSERT INTO `countries` VALUES ('187', 'Sierra Leone', 'SL', 'SLE', '1', '1');
INSERT INTO `countries` VALUES ('188', 'Singapore', 'SG', 'SGP', '4', '1');
INSERT INTO `countries` VALUES ('189', 'Slovakia (Slovak Republic)', 'SK', 'SVK', '1', '1');
INSERT INTO `countries` VALUES ('190', 'Slovenia', 'SI', 'SVN', '1', '1');
INSERT INTO `countries` VALUES ('191', 'Solomon Islands', 'SB', 'SLB', '1', '1');
INSERT INTO `countries` VALUES ('192', 'Somalia', 'SO', 'SOM', '1', '1');
INSERT INTO `countries` VALUES ('193', 'South Africa', 'ZA', 'ZAF', '1', '1');
INSERT INTO `countries` VALUES ('194', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '1', '1');
INSERT INTO `countries` VALUES ('195', 'Spain', 'ES', 'ESP', '3', '1');
INSERT INTO `countries` VALUES ('196', 'Sri Lanka', 'LK', 'LKA', '1', '1');
INSERT INTO `countries` VALUES ('197', 'St. Helena', 'SH', 'SHN', '1', '1');
INSERT INTO `countries` VALUES ('198', 'St. Pierre and Miquelon', 'PM', 'SPM', '1', '1');
INSERT INTO `countries` VALUES ('199', 'Sudan', 'SD', 'SDN', '1', '1');
INSERT INTO `countries` VALUES ('200', 'Suriname', 'SR', 'SUR', '1', '1');
INSERT INTO `countries` VALUES ('201', 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '1', '1');
INSERT INTO `countries` VALUES ('202', 'Swaziland', 'SZ', 'SWZ', '1', '1');
INSERT INTO `countries` VALUES ('203', 'Sweden', 'SE', 'SWE', '5', '1');
INSERT INTO `countries` VALUES ('204', 'Switzerland', 'CH', 'CHE', '1', '1');
INSERT INTO `countries` VALUES ('205', 'Syrian Arab Republic', 'SY', 'SYR', '1', '1');
INSERT INTO `countries` VALUES ('206', 'Taiwan', 'TW', 'TWN', '1', '1');
INSERT INTO `countries` VALUES ('207', 'Tajikistan', 'TJ', 'TJK', '1', '1');
INSERT INTO `countries` VALUES ('208', 'Tanzania, United Republic of', 'TZ', 'TZA', '1', '1');
INSERT INTO `countries` VALUES ('209', 'Thailand', 'TH', 'THA', '1', '1');
INSERT INTO `countries` VALUES ('210', 'Togo', 'TG', 'TGO', '1', '1');
INSERT INTO `countries` VALUES ('211', 'Tokelau', 'TK', 'TKL', '1', '1');
INSERT INTO `countries` VALUES ('212', 'Tonga', 'TO', 'TON', '1', '1');
INSERT INTO `countries` VALUES ('213', 'Trinidad and Tobago', 'TT', 'TTO', '1', '1');
INSERT INTO `countries` VALUES ('214', 'Tunisia', 'TN', 'TUN', '1', '1');
INSERT INTO `countries` VALUES ('215', 'Turkey', 'TR', 'TUR', '1', '1');
INSERT INTO `countries` VALUES ('216', 'Turkmenistan', 'TM', 'TKM', '1', '1');
INSERT INTO `countries` VALUES ('217', 'Turks and Caicos Islands', 'TC', 'TCA', '1', '1');
INSERT INTO `countries` VALUES ('218', 'Tuvalu', 'TV', 'TUV', '1', '1');
INSERT INTO `countries` VALUES ('219', 'Uganda', 'UG', 'UGA', '1', '1');
INSERT INTO `countries` VALUES ('220', 'Ukraine', 'UA', 'UKR', '1', '1');
INSERT INTO `countries` VALUES ('221', 'United Arab Emirates', 'AE', 'ARE', '1', '1');
INSERT INTO `countries` VALUES ('222', 'United Kingdom', 'GB', 'GBR', '6', '1');
INSERT INTO `countries` VALUES ('223', 'United States', 'US', 'USA', '2', '1');
INSERT INTO `countries` VALUES ('224', 'United States Minor Outlying Islands', 'UM', 'UMI', '1', '1');
INSERT INTO `countries` VALUES ('225', 'Uruguay', 'UY', 'URY', '1', '1');
INSERT INTO `countries` VALUES ('226', 'Uzbekistan', 'UZ', 'UZB', '1', '1');
INSERT INTO `countries` VALUES ('227', 'Vanuatu', 'VU', 'VUT', '1', '1');
INSERT INTO `countries` VALUES ('228', 'Vatican City State (Holy See)', 'VA', 'VAT', '1', '1');
INSERT INTO `countries` VALUES ('229', 'Venezuela', 'VE', 'VEN', '1', '1');
INSERT INTO `countries` VALUES ('230', 'Viet Nam', 'VN', 'VNM', '1', '1');
INSERT INTO `countries` VALUES ('231', 'Virgin Islands (British)', 'VG', 'VGB', '1', '1');
INSERT INTO `countries` VALUES ('232', 'Virgin Islands (U.S.)', 'VI', 'VIR', '1', '1');
INSERT INTO `countries` VALUES ('233', 'Wallis and Futuna Islands', 'WF', 'WLF', '1', '1');
INSERT INTO `countries` VALUES ('234', 'Western Sahara', 'EH', 'ESH', '1', '1');
INSERT INTO `countries` VALUES ('235', 'Yemen', 'YE', 'YEM', '1', '1');
INSERT INTO `countries` VALUES ('236', 'Serbia', 'RS', 'SRB', '1', '1');
INSERT INTO `countries` VALUES ('238', 'Zambia', 'ZM', 'ZMB', '1', '1');
INSERT INTO `countries` VALUES ('239', 'Zimbabwe', 'ZW', 'ZWE', '1', '1');
INSERT INTO `countries` VALUES ('240', 'Aaland Islands', 'AX', 'ALA', '1', '1');
INSERT INTO `countries` VALUES ('241', 'Palestine, State of', 'PS', 'PSE', '1', '1');
INSERT INTO `countries` VALUES ('242', 'Montenegro', 'ME', 'MNE', '1', '1');
INSERT INTO `countries` VALUES ('243', 'Guernsey', 'GG', 'GGY', '1', '1');
INSERT INTO `countries` VALUES ('244', 'Isle of Man', 'IM', 'IMN', '1', '1');
INSERT INTO `countries` VALUES ('245', 'Jersey', 'JE', 'JEY', '1', '1');
INSERT INTO `countries` VALUES ('246', 'South Sudan', 'SS', 'SSD', '1', '1');

-- ----------------------------
-- Table structure for `coupons`
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupons
-- ----------------------------

-- ----------------------------
-- Table structure for `coupons_description`
-- ----------------------------
DROP TABLE IF EXISTS `coupons_description`;
CREATE TABLE `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupons_description
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_email_track`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_email_track`;
CREATE TABLE `coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_email_track
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_gv_customer`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_gv_customer`;
CREATE TABLE `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_gv_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_gv_queue`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_gv_queue`;
CREATE TABLE `coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_gv_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_redeem_track`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_redeem_track`;
CREATE TABLE `coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_redeem_track
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon_restrict`
-- ----------------------------
DROP TABLE IF EXISTS `coupon_restrict`;
CREATE TABLE `coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon_restrict
-- ----------------------------

-- ----------------------------
-- Table structure for `currencies`
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES ('1', 'US Dollar', 'USD', '$', '', '.', ',', '2', '1.00000000', '2018-08-08 12:33:59');
INSERT INTO `currencies` VALUES ('2', '人民币', 'CNY', '', '元', '.', '', '2', '1.00000000', '2018-08-08 12:33:59');
INSERT INTO `currencies` VALUES ('3', 'Euro', 'EUR', '&euro;', '', '.', ',', '2', '0.09692550', '2018-08-08 12:33:59');
INSERT INTO `currencies` VALUES ('4', 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', '0.06997200', '2018-08-08 12:33:59');
INSERT INTO `currencies` VALUES ('5', 'Canadian Dollar', 'CAD', '$', '', '.', ',', '2', '0.14287770', '2018-08-08 12:33:59');
INSERT INTO `currencies` VALUES ('6', 'Australian Dollar', 'AUD', '$', '', '.', ',', '2', '0.16222499', '2018-08-08 12:33:59');

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(255) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'm', 'Bill', 'Smith', '2001-01-01 00:00:00', 'root@localhost.com', '', '1', '12345', '', 'd95e8fa7f20a009372eb3477473fcd34:1c', '0', '0', 'TEXT', '0', '', '', '0');

-- ----------------------------
-- Table structure for `customers_basket`
-- ----------------------------
DROP TABLE IF EXISTS `customers_basket`;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers_basket
-- ----------------------------

-- ----------------------------
-- Table structure for `customers_basket_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `customers_basket_attributes`;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers_basket_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for `customers_info`
-- ----------------------------
DROP TABLE IF EXISTS `customers_info`;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers_info
-- ----------------------------
INSERT INTO `customers_info` VALUES ('1', '0001-01-01 00:00:00', '0', '2004-01-21 01:35:28', '0001-01-01 00:00:00', '0');

-- ----------------------------
-- Table structure for `db_cache`
-- ----------------------------
DROP TABLE IF EXISTS `db_cache`;
CREATE TABLE `db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of db_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `email_archive`
-- ----------------------------
DROP TABLE IF EXISTS `email_archive`;
CREATE TABLE `email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `ezpages`
-- ----------------------------
DROP TABLE IF EXISTS `ezpages`;
CREATE TABLE `ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `pages_html_text` mediumtext,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_lang_id_zen` (`languages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ezpages
-- ----------------------------
INSERT INTO `ezpages` VALUES ('1', '1', '', 'index.php?main_page=shippinginfo', '', null, '0', '1', '1', '1', '0', '35', '30', '10', '0', '0', '10');
INSERT INTO `ezpages` VALUES ('2', '1', '', 'index.php?main_page=contact_us', '', null, '0', '1', '0', '0', '0', '80', '90', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('3', '1', '', '', '', null, '1', '1', '0', '0', '20', '20', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('4', '1', '', 'index.php?main_page=featured_products', '', null, '1', '0', '0', '0', '60', '0', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('5', '1', '', 'index.php?main_page=site_map', '', null, '0', '0', '1', '0', '0', '70', '70', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('6', '1', '', 'index.php?main_page=privacy', '', null, '0', '1', '1', '0', '0', '40', '40', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('7', '1', '', 'index.php?main_page=unsubscribe', '', null, '0', '1', '0', '0', '0', '75', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('8', '1', '', '', '', null, '0', '1', '0', '0', '0', '60', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('9', '1', '', 'index.php', '', null, '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('10', '1', '', 'index.php?main_page=products_new', '', null, '1', '0', '0', '0', '55', '0', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('11', '1', '', 'index.php?main_page=conditions', '', null, '0', '1', '1', '0', '0', '30', '20', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('12', '1', '', 'index.php?main_page=specials', '', null, '1', '0', '0', '0', '80', '0', '0', '0', '0', '0', '0');
INSERT INTO `ezpages` VALUES ('13', '1', '', 'index.php?main_page=create_account', '', null, '1', '0', '0', '0', '90', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `ezpages_content`
-- ----------------------------
DROP TABLE IF EXISTS `ezpages_content`;
CREATE TABLE `ezpages_content` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `pages_html_text` text,
  PRIMARY KEY (`pc_id`),
  KEY `idx_ezpages_content` (`pages_id`,`languages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ezpages_content
-- ----------------------------
INSERT INTO `ezpages_content` VALUES ('1', '1', '2', '发货付款', '');
INSERT INTO `ezpages_content` VALUES ('2', '1', '1', 'Shipping', '');
INSERT INTO `ezpages_content` VALUES ('3', '2', '2', '联系我们', '');
INSERT INTO `ezpages_content` VALUES ('4', '2', '1', 'Contact Us', '');
INSERT INTO `ezpages_content` VALUES ('5', '3', '2', '本店新闻', '演示商店正式开张<br /><br />所有商品都是演示用途，本站非营业网站<br /><br />下单仅限于测试各项功能');
INSERT INTO `ezpages_content` VALUES ('6', '3', '1', 'News', 'This store is for demo purpose only. No order will be processed.');
INSERT INTO `ezpages_content` VALUES ('7', '4', '2', '推荐商品', '');
INSERT INTO `ezpages_content` VALUES ('8', '4', '1', 'Featured Products', '');
INSERT INTO `ezpages_content` VALUES ('9', '5', '2', '网站地图', '');
INSERT INTO `ezpages_content` VALUES ('10', '5', '1', 'Site Map', '');
INSERT INTO `ezpages_content` VALUES ('11', '6', '2', '隐私声明', '');
INSERT INTO `ezpages_content` VALUES ('12', '6', '1', 'Privacy', '');
INSERT INTO `ezpages_content` VALUES ('13', '7', '2', '电子商情', '');
INSERT INTO `ezpages_content` VALUES ('14', '7', '1', 'Newsletter', '');
INSERT INTO `ezpages_content` VALUES ('15', '8', '2', '公司简介', '');
INSERT INTO `ezpages_content` VALUES ('16', '8', '1', 'About Us', '');
INSERT INTO `ezpages_content` VALUES ('17', '9', '2', '首页', '');
INSERT INTO `ezpages_content` VALUES ('18', '9', '1', 'Home', '');
INSERT INTO `ezpages_content` VALUES ('19', '10', '2', '新进商品', '');
INSERT INTO `ezpages_content` VALUES ('20', '10', '1', 'New Products', '');
INSERT INTO `ezpages_content` VALUES ('21', '11', '2', '顾客须知', '');
INSERT INTO `ezpages_content` VALUES ('22', '11', '1', 'Conditions of Use', '');
INSERT INTO `ezpages_content` VALUES ('23', '12', '2', '特价商品', '');
INSERT INTO `ezpages_content` VALUES ('24', '12', '1', 'Specials', '');
INSERT INTO `ezpages_content` VALUES ('25', '13', '2', '注册', '');
INSERT INTO `ezpages_content` VALUES ('26', '13', '1', 'Register', '');

-- ----------------------------
-- Table structure for `featured`
-- ----------------------------
DROP TABLE IF EXISTS `featured`;
CREATE TABLE `featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of featured
-- ----------------------------
INSERT INTO `featured` VALUES ('1', '34', '2004-02-21 16:34:31', '2004-02-21 16:34:31', '0001-01-01', '2004-02-21 16:34:31', '1', '0001-01-01');
INSERT INTO `featured` VALUES ('2', '8', '2004-02-21 17:04:54', '2004-02-21 22:31:52', '2004-02-27', '2004-04-25 22:50:50', '0', '2004-02-21');
INSERT INTO `featured` VALUES ('3', '12', '2004-02-21 17:10:49', '2004-02-21 17:10:49', '0001-01-01', '2004-02-21 17:10:49', '1', '0001-01-01');
INSERT INTO `featured` VALUES ('4', '27', '2004-02-21 22:30:53', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `featured` VALUES ('5', '26', '2004-02-21 22:31:24', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `featured` VALUES ('6', '40', '2004-05-13 22:50:33', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `featured` VALUES ('7', '171', '2004-07-12 15:47:22', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `featured` VALUES ('8', '172', '2004-07-12 15:47:29', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `featured` VALUES ('9', '168', '2004-07-12 15:47:37', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `featured` VALUES ('10', '169', '2004-07-12 15:47:45', null, '0001-01-01', null, '1', '0001-01-01');

-- ----------------------------
-- Table structure for `files_uploaded`
-- ----------------------------
DROP TABLE IF EXISTS `files_uploaded`;
CREATE TABLE `files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Must always have either a sesskey or customers_id';

-- ----------------------------
-- Records of files_uploaded
-- ----------------------------

-- ----------------------------
-- Table structure for `geo_zones`
-- ----------------------------
DROP TABLE IF EXISTS `geo_zones`;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of geo_zones
-- ----------------------------
INSERT INTO `geo_zones` VALUES ('1', '北京', '北京本地税率区', null, '2018-08-08 12:34:00');

-- ----------------------------
-- Table structure for `get_terms_to_filter`
-- ----------------------------
DROP TABLE IF EXISTS `get_terms_to_filter`;
CREATE TABLE `get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of get_terms_to_filter
-- ----------------------------
INSERT INTO `get_terms_to_filter` VALUES ('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name');
INSERT INTO `get_terms_to_filter` VALUES ('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name');
INSERT INTO `get_terms_to_filter` VALUES ('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- ----------------------------
-- Table structure for `group_pricing`
-- ----------------------------
DROP TABLE IF EXISTS `group_pricing`;
CREATE TABLE `group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_pricing
-- ----------------------------
INSERT INTO `group_pricing` VALUES ('1', 'VIP客户', '10.00', null, '2004-04-29 00:21:04');

-- ----------------------------
-- Table structure for `languages`
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES ('1', 'English', 'en', 'icon.gif', 'english', '20');
INSERT INTO `languages` VALUES ('2', '简体中文', 'gb', 'icon.gif', 'schinese', '10');

-- ----------------------------
-- Table structure for `layout_boxes`
-- ----------------------------
DROP TABLE IF EXISTS `layout_boxes`;
CREATE TABLE `layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of layout_boxes
-- ----------------------------
INSERT INTO `layout_boxes` VALUES ('1', 'default_template_settings', 'banner_box_all.php', '1', '1', '5', '0', '0');
INSERT INTO `layout_boxes` VALUES ('2', 'default_template_settings', 'banner_box.php', '1', '0', '300', '1', '127');
INSERT INTO `layout_boxes` VALUES ('3', 'default_template_settings', 'banner_box2.php', '1', '1', '15', '1', '15');
INSERT INTO `layout_boxes` VALUES ('4', 'default_template_settings', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('5', 'default_template_settings', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('6', 'default_template_settings', 'currencies.php', '1', '1', '80', '60', '1');
INSERT INTO `layout_boxes` VALUES ('7', 'default_template_settings', 'document_categories.php', '1', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('8', 'default_template_settings', 'ezpages.php', '1', '1', '-1', '2', '1');
INSERT INTO `layout_boxes` VALUES ('9', 'default_template_settings', 'featured.php', '1', '0', '45', '0', '0');
INSERT INTO `layout_boxes` VALUES ('10', 'default_template_settings', 'information.php', '1', '0', '50', '40', '1');
INSERT INTO `layout_boxes` VALUES ('11', 'default_template_settings', 'languages.php', '1', '1', '70', '50', '1');
INSERT INTO `layout_boxes` VALUES ('12', 'default_template_settings', 'manufacturers.php', '1', '0', '30', '20', '1');
INSERT INTO `layout_boxes` VALUES ('13', 'default_template_settings', 'manufacturer_info.php', '1', '1', '35', '95', '1');
INSERT INTO `layout_boxes` VALUES ('14', 'default_template_settings', 'more_information.php', '1', '0', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('15', 'default_template_settings', 'music_genres.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('16', 'default_template_settings', 'order_history.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('17', 'default_template_settings', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('18', 'default_template_settings', 'record_companies.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('19', 'default_template_settings', 'reviews.php', '1', '0', '40', '0', '0');
INSERT INTO `layout_boxes` VALUES ('20', 'default_template_settings', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('21', 'default_template_settings', 'search_header.php', '0', '0', '0', '0', '1');
INSERT INTO `layout_boxes` VALUES ('22', 'default_template_settings', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('23', 'default_template_settings', 'specials.php', '1', '1', '45', '0', '0');
INSERT INTO `layout_boxes` VALUES ('24', 'default_template_settings', 'whats_new.php', '1', '0', '20', '0', '0');
INSERT INTO `layout_boxes` VALUES ('25', 'default_template_settings', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('26', 'template_default', 'banner_box_all.php', '1', '1', '5', '0', '0');
INSERT INTO `layout_boxes` VALUES ('27', 'template_default', 'banner_box.php', '1', '0', '300', '1', '127');
INSERT INTO `layout_boxes` VALUES ('28', 'template_default', 'banner_box2.php', '1', '1', '15', '1', '15');
INSERT INTO `layout_boxes` VALUES ('29', 'template_default', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('30', 'template_default', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('31', 'template_default', 'currencies.php', '1', '1', '80', '60', '1');
INSERT INTO `layout_boxes` VALUES ('32', 'template_default', 'ezpages.php', '1', '1', '-1', '2', '1');
INSERT INTO `layout_boxes` VALUES ('33', 'template_default', 'featured.php', '1', '0', '45', '0', '0');
INSERT INTO `layout_boxes` VALUES ('34', 'template_default', 'information.php', '1', '0', '50', '40', '1');
INSERT INTO `layout_boxes` VALUES ('35', 'template_default', 'languages.php', '1', '1', '70', '50', '1');
INSERT INTO `layout_boxes` VALUES ('36', 'template_default', 'manufacturers.php', '1', '0', '30', '20', '1');
INSERT INTO `layout_boxes` VALUES ('37', 'template_default', 'manufacturer_info.php', '1', '1', '35', '95', '1');
INSERT INTO `layout_boxes` VALUES ('38', 'template_default', 'more_information.php', '1', '0', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('39', 'template_default', 'my_broken_box.php', '1', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('40', 'template_default', 'order_history.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('41', 'template_default', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('42', 'template_default', 'reviews.php', '1', '0', '40', '0', '0');
INSERT INTO `layout_boxes` VALUES ('43', 'template_default', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('44', 'template_default', 'search_header.php', '0', '0', '0', '0', '1');
INSERT INTO `layout_boxes` VALUES ('45', 'template_default', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('46', 'template_default', 'specials.php', '1', '1', '45', '0', '0');
INSERT INTO `layout_boxes` VALUES ('47', 'template_default', 'whats_new.php', '1', '0', '20', '0', '0');
INSERT INTO `layout_boxes` VALUES ('48', 'template_default', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('49', 'classic', 'banner_box.php', '1', '0', '300', '1', '127');
INSERT INTO `layout_boxes` VALUES ('50', 'classic', 'banner_box2.php', '1', '1', '15', '1', '15');
INSERT INTO `layout_boxes` VALUES ('51', 'classic', 'banner_box_all.php', '1', '1', '5', '0', '0');
INSERT INTO `layout_boxes` VALUES ('52', 'classic', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('53', 'classic', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('54', 'classic', 'currencies.php', '1', '1', '80', '60', '1');
INSERT INTO `layout_boxes` VALUES ('55', 'classic', 'document_categories.php', '1', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('56', 'classic', 'ezpages.php', '1', '1', '-1', '2', '1');
INSERT INTO `layout_boxes` VALUES ('57', 'classic', 'featured.php', '1', '0', '45', '0', '0');
INSERT INTO `layout_boxes` VALUES ('58', 'classic', 'information.php', '1', '0', '50', '40', '1');
INSERT INTO `layout_boxes` VALUES ('59', 'classic', 'languages.php', '1', '1', '70', '50', '1');
INSERT INTO `layout_boxes` VALUES ('60', 'classic', 'manufacturers.php', '1', '0', '30', '20', '1');
INSERT INTO `layout_boxes` VALUES ('61', 'classic', 'manufacturer_info.php', '1', '1', '35', '95', '1');
INSERT INTO `layout_boxes` VALUES ('62', 'classic', 'more_information.php', '1', '0', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('63', 'classic', 'music_genres.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('64', 'classic', 'order_history.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('65', 'classic', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('66', 'classic', 'record_companies.php', '1', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('67', 'classic', 'reviews.php', '1', '0', '40', '0', '0');
INSERT INTO `layout_boxes` VALUES ('68', 'classic', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('69', 'classic', 'search_header.php', '0', '0', '0', '0', '1');
INSERT INTO `layout_boxes` VALUES ('70', 'classic', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('71', 'classic', 'specials.php', '1', '1', '45', '0', '0');
INSERT INTO `layout_boxes` VALUES ('72', 'classic', 'whats_new.php', '1', '0', '20', '0', '0');
INSERT INTO `layout_boxes` VALUES ('73', 'classic', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('74', 'lite_blue', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('75', 'lite_blue', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('76', 'lite_blue', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('77', 'lite_blue', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('78', 'lite_blue', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('79', 'lite_blue', 'currencies.php', '1', '1', '90', '0', '0');
INSERT INTO `layout_boxes` VALUES ('80', 'lite_blue', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('81', 'lite_blue', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('82', 'lite_blue', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('83', 'lite_blue', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('84', 'lite_blue', 'languages.php', '1', '1', '100', '0', '0');
INSERT INTO `layout_boxes` VALUES ('85', 'lite_blue', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('86', 'lite_blue', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('87', 'lite_blue', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('88', 'lite_blue', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('89', 'lite_blue', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('90', 'lite_blue', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('91', 'lite_blue', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('92', 'lite_blue', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('93', 'lite_blue', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('94', 'lite_blue', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('95', 'lite_blue', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('96', 'lite_blue', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('97', 'lite_blue', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('98', 'lite_blue', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('99', 'lite_green', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('100', 'lite_green', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('101', 'lite_green', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('102', 'lite_green', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('103', 'lite_green', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('104', 'lite_green', 'currencies.php', '1', '1', '90', '0', '0');
INSERT INTO `layout_boxes` VALUES ('105', 'lite_green', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('106', 'lite_green', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('107', 'lite_green', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('108', 'lite_green', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('109', 'lite_green', 'languages.php', '1', '1', '100', '0', '0');
INSERT INTO `layout_boxes` VALUES ('110', 'lite_green', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('111', 'lite_green', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('112', 'lite_green', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('113', 'lite_green', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('114', 'lite_green', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('115', 'lite_green', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('116', 'lite_green', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('117', 'lite_green', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('118', 'lite_green', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('119', 'lite_green', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('120', 'lite_green', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('121', 'lite_green', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('122', 'lite_green', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('123', 'lite_green', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('124', 'lite_grey', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('125', 'lite_grey', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('126', 'lite_grey', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('127', 'lite_grey', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('128', 'lite_grey', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('129', 'lite_grey', 'currencies.php', '1', '1', '90', '0', '0');
INSERT INTO `layout_boxes` VALUES ('130', 'lite_grey', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('131', 'lite_grey', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('132', 'lite_grey', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('133', 'lite_grey', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('134', 'lite_grey', 'languages.php', '1', '1', '100', '0', '0');
INSERT INTO `layout_boxes` VALUES ('135', 'lite_grey', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('136', 'lite_grey', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('137', 'lite_grey', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('138', 'lite_grey', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('139', 'lite_grey', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('140', 'lite_grey', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('141', 'lite_grey', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('142', 'lite_grey', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('143', 'lite_grey', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('144', 'lite_grey', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('145', 'lite_grey', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('146', 'lite_grey', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('147', 'lite_grey', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('148', 'lite_grey', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('149', 'lite_orange', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('150', 'lite_orange', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('151', 'lite_orange', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('152', 'lite_orange', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('153', 'lite_orange', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('154', 'lite_orange', 'currencies.php', '1', '1', '90', '0', '0');
INSERT INTO `layout_boxes` VALUES ('155', 'lite_orange', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('156', 'lite_orange', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('157', 'lite_orange', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('158', 'lite_orange', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('159', 'lite_orange', 'languages.php', '1', '1', '100', '0', '0');
INSERT INTO `layout_boxes` VALUES ('160', 'lite_orange', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('161', 'lite_orange', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('162', 'lite_orange', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('163', 'lite_orange', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('164', 'lite_orange', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('165', 'lite_orange', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('166', 'lite_orange', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('167', 'lite_orange', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('168', 'lite_orange', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('169', 'lite_orange', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('170', 'lite_orange', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('171', 'lite_orange', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('172', 'lite_orange', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('173', 'lite_orange', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('174', 'lite_red', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('175', 'lite_red', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('176', 'lite_red', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('177', 'lite_red', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('178', 'lite_red', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('179', 'lite_red', 'currencies.php', '1', '1', '90', '0', '0');
INSERT INTO `layout_boxes` VALUES ('180', 'lite_red', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('181', 'lite_red', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('182', 'lite_red', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('183', 'lite_red', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('184', 'lite_red', 'languages.php', '1', '1', '100', '0', '0');
INSERT INTO `layout_boxes` VALUES ('185', 'lite_red', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('186', 'lite_red', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('187', 'lite_red', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('188', 'lite_red', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('189', 'lite_red', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('190', 'lite_red', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('191', 'lite_red', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('192', 'lite_red', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('193', 'lite_red', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('194', 'lite_red', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('195', 'lite_red', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('196', 'lite_red', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('197', 'lite_red', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('198', 'lite_red', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('199', 'pure_black_free', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('200', 'pure_black_free', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('201', 'pure_black_free', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('202', 'pure_black_free', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('203', 'pure_black_free', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('204', 'pure_black_free', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('205', 'pure_black_free', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('206', 'pure_black_free', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('207', 'pure_black_free', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('208', 'pure_black_free', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('209', 'pure_black_free', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('210', 'pure_black_free', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('211', 'pure_black_free', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('212', 'pure_black_free', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('213', 'pure_black_free', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('214', 'pure_black_free', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('215', 'pure_black_free', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('216', 'pure_black_free', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('217', 'pure_black_free', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('218', 'pure_black_free', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('219', 'pure_black_free', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('220', 'pure_black_free', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('221', 'pure_black_free', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('222', 'pure_black_free', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('223', 'pure_black_free', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('224', 'pure_blue_free', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('225', 'pure_blue_free', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('226', 'pure_blue_free', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('227', 'pure_blue_free', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('228', 'pure_blue_free', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('229', 'pure_blue_free', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('230', 'pure_blue_free', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('231', 'pure_blue_free', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('232', 'pure_blue_free', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('233', 'pure_blue_free', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('234', 'pure_blue_free', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('235', 'pure_blue_free', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('236', 'pure_blue_free', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('237', 'pure_blue_free', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('238', 'pure_blue_free', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('239', 'pure_blue_free', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('240', 'pure_blue_free', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('241', 'pure_blue_free', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('242', 'pure_blue_free', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('243', 'pure_blue_free', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('244', 'pure_blue_free', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('245', 'pure_blue_free', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('246', 'pure_blue_free', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('247', 'pure_blue_free', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('248', 'pure_blue_free', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('249', 'pure_green_free', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('250', 'pure_green_free', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('251', 'pure_green_free', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('252', 'pure_green_free', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('253', 'pure_green_free', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('254', 'pure_green_free', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('255', 'pure_green_free', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('256', 'pure_green_free', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('257', 'pure_green_free', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('258', 'pure_green_free', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('259', 'pure_green_free', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('260', 'pure_green_free', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('261', 'pure_green_free', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('262', 'pure_green_free', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('263', 'pure_green_free', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('264', 'pure_green_free', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('265', 'pure_green_free', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('266', 'pure_green_free', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('267', 'pure_green_free', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('268', 'pure_green_free', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('269', 'pure_green_free', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('270', 'pure_green_free', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('271', 'pure_green_free', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('272', 'pure_green_free', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('273', 'pure_green_free', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('274', 'pure_orange_free', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('275', 'pure_orange_free', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('276', 'pure_orange_free', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('277', 'pure_orange_free', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('278', 'pure_orange_free', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('279', 'pure_orange_free', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('280', 'pure_orange_free', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('281', 'pure_orange_free', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('282', 'pure_orange_free', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('283', 'pure_orange_free', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('284', 'pure_orange_free', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('285', 'pure_orange_free', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('286', 'pure_orange_free', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('287', 'pure_orange_free', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('288', 'pure_orange_free', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('289', 'pure_orange_free', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('290', 'pure_orange_free', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('291', 'pure_orange_free', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('292', 'pure_orange_free', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('293', 'pure_orange_free', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('294', 'pure_orange_free', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('295', 'pure_orange_free', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('296', 'pure_orange_free', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('297', 'pure_orange_free', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('298', 'pure_orange_free', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('299', 'pure_red_free', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('300', 'pure_red_free', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('301', 'pure_red_free', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('302', 'pure_red_free', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('303', 'pure_red_free', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('304', 'pure_red_free', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('305', 'pure_red_free', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('306', 'pure_red_free', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('307', 'pure_red_free', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('308', 'pure_red_free', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('309', 'pure_red_free', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('310', 'pure_red_free', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('311', 'pure_red_free', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('312', 'pure_red_free', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('313', 'pure_red_free', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('314', 'pure_red_free', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('315', 'pure_red_free', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('316', 'pure_red_free', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('317', 'pure_red_free', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('318', 'pure_red_free', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('319', 'pure_red_free', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('320', 'pure_red_free', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('321', 'pure_red_free', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('322', 'pure_red_free', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('323', 'pure_red_free', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('324', 'abagon', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('325', 'abagon', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('326', 'abagon', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('327', 'abagon', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('328', 'abagon', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('329', 'abagon', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('330', 'abagon', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('331', 'abagon', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('332', 'abagon', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('333', 'abagon', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('334', 'abagon', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('335', 'abagon', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('336', 'abagon', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('337', 'abagon', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('338', 'abagon', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('339', 'abagon', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('340', 'abagon', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('341', 'abagon', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('342', 'abagon', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('343', 'abagon', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('344', 'abagon', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('345', 'abagon', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('346', 'abagon', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('347', 'abagon', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('348', 'abagon', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('349', 'crista_blue', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('350', 'crista_blue', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('351', 'crista_blue', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('352', 'crista_blue', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('353', 'crista_blue', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('354', 'crista_blue', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('355', 'crista_blue', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('356', 'crista_blue', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('357', 'crista_blue', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('358', 'crista_blue', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('359', 'crista_blue', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('360', 'crista_blue', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('361', 'crista_blue', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('362', 'crista_blue', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('363', 'crista_blue', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('364', 'crista_blue', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('365', 'crista_blue', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('366', 'crista_blue', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('367', 'crista_blue', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('368', 'crista_blue', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('369', 'crista_blue', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('370', 'crista_blue', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('371', 'crista_blue', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('372', 'crista_blue', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('373', 'crista_blue', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('374', 'crista_grey', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('375', 'crista_grey', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('376', 'crista_grey', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('377', 'crista_grey', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('378', 'crista_grey', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('379', 'crista_grey', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('380', 'crista_grey', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('381', 'crista_grey', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('382', 'crista_grey', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('383', 'crista_grey', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('384', 'crista_grey', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('385', 'crista_grey', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('386', 'crista_grey', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('387', 'crista_grey', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('388', 'crista_grey', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('389', 'crista_grey', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('390', 'crista_grey', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('391', 'crista_grey', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('392', 'crista_grey', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('393', 'crista_grey', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('394', 'crista_grey', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('395', 'crista_grey', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('396', 'crista_grey', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('397', 'crista_grey', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('398', 'crista_grey', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('399', 'crista_pink', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('400', 'crista_pink', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('401', 'crista_pink', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('402', 'crista_pink', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('403', 'crista_pink', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('404', 'crista_pink', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('405', 'crista_pink', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('406', 'crista_pink', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('407', 'crista_pink', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('408', 'crista_pink', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('409', 'crista_pink', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('410', 'crista_pink', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('411', 'crista_pink', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('412', 'crista_pink', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('413', 'crista_pink', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('414', 'crista_pink', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('415', 'crista_pink', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('416', 'crista_pink', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('417', 'crista_pink', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('418', 'crista_pink', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('419', 'crista_pink', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('420', 'crista_pink', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('421', 'crista_pink', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('422', 'crista_pink', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('423', 'crista_pink', 'whos_online.php', '1', '1', '200', '200', '1');
INSERT INTO `layout_boxes` VALUES ('424', 'crista_violet', 'banner_box.php', '0', '0', '300', '1', '0');
INSERT INTO `layout_boxes` VALUES ('425', 'crista_violet', 'banner_box2.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('426', 'crista_violet', 'banner_box_all.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('427', 'crista_violet', 'best_sellers.php', '1', '1', '30', '70', '1');
INSERT INTO `layout_boxes` VALUES ('428', 'crista_violet', 'categories.php', '1', '0', '10', '10', '1');
INSERT INTO `layout_boxes` VALUES ('429', 'crista_violet', 'currencies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('430', 'crista_violet', 'document_categories.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('431', 'crista_violet', 'ezpages.php', '1', '1', '15', '5', '1');
INSERT INTO `layout_boxes` VALUES ('432', 'crista_violet', 'featured.php', '1', '0', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('433', 'crista_violet', 'information.php', '0', '1', '5', '40', '1');
INSERT INTO `layout_boxes` VALUES ('434', 'crista_violet', 'languages.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('435', 'crista_violet', 'manufacturers.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('436', 'crista_violet', 'manufacturer_info.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('437', 'crista_violet', 'more_information.php', '0', '0', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('438', 'crista_violet', 'music_genres.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('439', 'crista_violet', 'order_history.php', '1', '1', '25', '0', '0');
INSERT INTO `layout_boxes` VALUES ('440', 'crista_violet', 'product_notifications.php', '1', '1', '55', '85', '1');
INSERT INTO `layout_boxes` VALUES ('441', 'crista_violet', 'record_companies.php', '0', '1', '0', '0', '0');
INSERT INTO `layout_boxes` VALUES ('442', 'crista_violet', 'reviews.php', '1', '1', '50', '0', '0');
INSERT INTO `layout_boxes` VALUES ('443', 'crista_violet', 'search.php', '1', '1', '10', '0', '0');
INSERT INTO `layout_boxes` VALUES ('444', 'crista_violet', 'search_header.php', '0', '0', '0', '30', '1');
INSERT INTO `layout_boxes` VALUES ('445', 'crista_violet', 'shopping_cart.php', '1', '1', '20', '30', '1');
INSERT INTO `layout_boxes` VALUES ('446', 'crista_violet', 'specials.php', '1', '0', '55', '0', '0');
INSERT INTO `layout_boxes` VALUES ('447', 'crista_violet', 'whats_new.php', '1', '0', '30', '0', '0');
INSERT INTO `layout_boxes` VALUES ('448', 'crista_violet', 'whos_online.php', '1', '1', '200', '200', '1');

-- ----------------------------
-- Table structure for `manufacturers`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturers
-- ----------------------------
INSERT INTO `manufacturers` VALUES ('1', 'Matrox', 'manufacturers/manufacturer_matrox.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('2', 'Microsoft', 'manufacturers/manufacturer_microsoft.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('3', 'Warner', 'manufacturers/manufacturer_warner.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('4', 'Fox', 'manufacturers/manufacturer_fox.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('5', 'Logitech', 'manufacturers/manufacturer_logitech.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('6', 'Canon', 'manufacturers/manufacturer_canon.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('7', 'Sierra', 'manufacturers/manufacturer_sierra.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('8', 'GT Interactive', 'manufacturers/manufacturer_gt_interactive.gif', '2003-12-23 03:18:19', null);
INSERT INTO `manufacturers` VALUES ('9', 'Hewlett Packard', 'manufacturers/manufacturer_hewlett_packard.gif', '2003-12-23 03:18:19', null);

-- ----------------------------
-- Table structure for `manufacturers_info`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturers_info`;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturers_info
-- ----------------------------
INSERT INTO `manufacturers_info` VALUES ('1', '1', 'http://www.matrox.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('1', '2', 'http://www.matrox.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('2', '1', 'http://www.microsoft.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('2', '2', 'http://www.microsoft.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('3', '1', 'http://www.warner.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('3', '2', 'http://www.warner.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('4', '1', 'http://www.fox.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('4', '2', 'http://www.fox.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('5', '1', 'http://www.logitech.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('5', '2', 'http://www.logitech.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('6', '1', 'http://www.canon.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('6', '2', 'http://www.canon.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('7', '1', 'http://www.sierra.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('7', '2', 'http://www.sierra.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('8', '1', 'http://www.infogrames.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('8', '2', 'http://www.infogrames.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('9', '1', 'http://www.hewlettpackard.com', '0', null);
INSERT INTO `manufacturers_info` VALUES ('9', '2', 'http://www.hewlettpackard.com', '0', null);

-- ----------------------------
-- Table structure for `media_clips`
-- ----------------------------
DROP TABLE IF EXISTS `media_clips`;
CREATE TABLE `media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_clips
-- ----------------------------
INSERT INTO `media_clips` VALUES ('1', '1', '1', 'thehunter.mp3', '2004-06-01 20:57:43', '0000-00-00 00:00:00');
INSERT INTO `media_clips` VALUES ('6', '2', '1', 'thehunter.mp3', '2004-07-13 00:45:09', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `media_manager`
-- ----------------------------
DROP TABLE IF EXISTS `media_manager`;
CREATE TABLE `media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_manager
-- ----------------------------
INSERT INTO `media_manager` VALUES ('1', 'Russ Tippins - The Hunter', '2004-06-01 20:57:43', '2004-06-01 20:42:53');
INSERT INTO `media_manager` VALUES ('2', 'Help!', '2004-07-13 01:01:14', '2004-07-12 17:57:45');

-- ----------------------------
-- Table structure for `media_to_products`
-- ----------------------------
DROP TABLE IF EXISTS `media_to_products`;
CREATE TABLE `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_to_products
-- ----------------------------
INSERT INTO `media_to_products` VALUES ('1', '166');
INSERT INTO `media_to_products` VALUES ('2', '169');

-- ----------------------------
-- Table structure for `media_types`
-- ----------------------------
DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media_types
-- ----------------------------
INSERT INTO `media_types` VALUES ('1', 'MP3', '.mp3');

-- ----------------------------
-- Table structure for `meta_tags_categories_description`
-- ----------------------------
DROP TABLE IF EXISTS `meta_tags_categories_description`;
CREATE TABLE `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meta_tags_categories_description
-- ----------------------------

-- ----------------------------
-- Table structure for `meta_tags_products_description`
-- ----------------------------
DROP TABLE IF EXISTS `meta_tags_products_description`;
CREATE TABLE `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meta_tags_products_description
-- ----------------------------

-- ----------------------------
-- Table structure for `music_genre`
-- ----------------------------
DROP TABLE IF EXISTS `music_genre`;
CREATE TABLE `music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_genre
-- ----------------------------
INSERT INTO `music_genre` VALUES ('1', '摇滚', '2004-06-01 20:53:26', null);
INSERT INTO `music_genre` VALUES ('2', '爵士', '2004-06-01 20:53:45', null);

-- ----------------------------
-- Table structure for `newsletters`
-- ----------------------------
DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsletters
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_products`
-- ----------------------------
DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_products
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_products_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `orders_products_attributes`;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_products_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_products_download`
-- ----------------------------
DROP TABLE IF EXISTS `orders_products_download`;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_products_download
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_status`
-- ----------------------------
DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_status
-- ----------------------------
INSERT INTO `orders_status` VALUES ('3', '1', 'Delivered');
INSERT INTO `orders_status` VALUES ('1', '1', 'Pending');
INSERT INTO `orders_status` VALUES ('2', '1', 'Processing');
INSERT INTO `orders_status` VALUES ('4', '1', 'Update');
INSERT INTO `orders_status` VALUES ('2', '2', '处理中');
INSERT INTO `orders_status` VALUES ('3', '2', '已发货');
INSERT INTO `orders_status` VALUES ('4', '2', '已更新');
INSERT INTO `orders_status` VALUES ('1', '2', '等待中');

-- ----------------------------
-- Table structure for `orders_status_history`
-- ----------------------------
DROP TABLE IF EXISTS `orders_status_history`;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_status_history
-- ----------------------------

-- ----------------------------
-- Table structure for `orders_total`
-- ----------------------------
DROP TABLE IF EXISTS `orders_total`;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_total
-- ----------------------------

-- ----------------------------
-- Table structure for `paypal`
-- ----------------------------
DROP TABLE IF EXISTS `paypal`;
CREATE TABLE `paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paypal
-- ----------------------------

-- ----------------------------
-- Table structure for `paypal_payment_status`
-- ----------------------------
DROP TABLE IF EXISTS `paypal_payment_status`;
CREATE TABLE `paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paypal_payment_status
-- ----------------------------
INSERT INTO `paypal_payment_status` VALUES ('1', 'Completed');
INSERT INTO `paypal_payment_status` VALUES ('2', 'Pending');
INSERT INTO `paypal_payment_status` VALUES ('3', 'Failed');
INSERT INTO `paypal_payment_status` VALUES ('4', 'Denied');
INSERT INTO `paypal_payment_status` VALUES ('5', 'Refunded');
INSERT INTO `paypal_payment_status` VALUES ('6', 'Canceled_Reversal');
INSERT INTO `paypal_payment_status` VALUES ('7', 'Reversed');

-- ----------------------------
-- Table structure for `paypal_payment_status_history`
-- ----------------------------
DROP TABLE IF EXISTS `paypal_payment_status_history`;
CREATE TABLE `paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paypal_payment_status_history
-- ----------------------------

-- ----------------------------
-- Table structure for `paypal_session`
-- ----------------------------
DROP TABLE IF EXISTS `paypal_session`;
CREATE TABLE `paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paypal_session
-- ----------------------------

-- ----------------------------
-- Table structure for `paypal_testing`
-- ----------------------------
DROP TABLE IF EXISTS `paypal_testing`;
CREATE TABLE `paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paypal_testing
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '1', '31', 'MG200MMS', 'matrox/mg200mms.gif', '299.9900', '0', '2003-11-03 12:32:17', '2004-04-26 23:57:34', null, '23', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '299.9900', '4', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('2', '1', '31', 'MG400-32MB', 'matrox/mg400-32mb.gif', '499.9900', '0', '2003-11-03 12:32:17', null, null, '23', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.9900', '4', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('3', '1', '500', 'MSIMPRO', 'microsoft/msimpro.gif', '49.9900', '0', '2003-11-03 12:32:17', null, null, '7', '1', '1', '2', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '39.9900', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('4', '1', '12', 'DVD-RPMK', 'dvd/replacement_killers.gif', '42.0000', '0', '2003-11-03 12:32:17', null, null, '23', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '42.0000', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('5', '1', '15', 'DVD-BLDRNDC', 'dvd/blade_runner.gif', '35.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:44:28', null, '7', '1', '1', '3', '2', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '30.0000', '11', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('6', '1', '8', 'DVD-MATR', 'dvd/the_matrix.gif', '39.9900', '0', '2018-04-30 12:34:20', '2003-12-23 00:48:28', null, '7', '1', '1', '3', '2', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '30.0000', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('7', '1', '500', 'DVD-YGEM', 'dvd/youve_got_mail.gif', '34.9900', '0', '2003-11-03 12:32:17', '2004-04-27 14:53:17', null, '7', '1', '1', '3', '5', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '34.9900', '12', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('8', '1', '499', 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '0', '2003-11-03 12:32:17', '2004-04-27 14:52:54', null, '7', '1', '1', '3', '6', '1', '1', '0', '0', '0', '0', '0', '1', '0', '10', '1', '1', '35.9900', '13', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('9', '1', '10', 'DVD-UNSG', 'dvd/under_siege.gif', '29.9900', '0', '2003-11-03 12:32:17', '2004-05-17 13:35:27', null, '7', '1', '1', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('10', '1', '9', 'DVD-UNSG2', 'dvd/under_siege2.gif', '29.9900', '0', '2003-11-03 12:32:17', null, null, '7', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('11', '1', '10', 'DVD-FDBL', 'dvd/fire_down_below.gif', '29.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:43:40', null, '7', '1', '1', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('12', '1', '9', 'DVD-DHWV', 'dvd/die_hard_3.gif', '39.9900', '0', '2003-11-03 12:32:17', '2004-05-16 00:34:33', null, '7', '1', '1', '4', '6', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '39.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('13', '1', '10', 'DVD-LTWP', 'dvd/lethal_weapon.gif', '34.9900', '0', '2003-11-03 12:32:17', '2004-04-27 00:07:35', null, '7', '1', '1', '3', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '34.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('14', '1', '9', 'DVD-REDC', 'dvd/red_corner.gif', '32.0000', '0', '2003-11-03 12:32:17', '2003-12-23 00:47:39', null, '7', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '32.0000', '15', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('15', '1', '9', 'DVD-FRAN', 'dvd/frantic.gif', '35.0000', '0', '2003-11-03 12:32:17', '2003-12-23 00:43:55', null, '7', '1', '1', '3', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '35.0000', '14', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('16', '1', '9', 'DVD-CUFI', 'dvd/courage_under_fire.gif', '38.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:42:57', '2018-08-20 12:34:20', '7', '1', '1', '4', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '29.9900', '15', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('17', '1', '10', 'DVD-SPEED', 'dvd/speed.gif', '39.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:47:51', null, '7', '1', '1', '4', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '39.9900', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('18', '1', '10', 'DVD-SPEED2', 'dvd/speed_2.gif', '42.0000', '0', '2003-11-03 12:32:17', null, null, '7', '1', '1', '4', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '42.0000', '10', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('19', '1', '10', 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', '49.9900', '0', '2018-04-30 12:34:20', '2003-12-23 00:49:00', null, '7', '1', '1', '4', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '49.9900', '12', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('20', '1', '8', 'DVD-BELOVED', 'dvd/beloved.gif', '54.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:42:34', null, '7', '1', '1', '3', '2', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '54.9900', '15', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('21', '1', '16', 'PC-SWAT3', 'sierra/swat_3.gif', '79.9900', '0', '2003-11-03 12:32:17', '2004-04-27 14:51:00', null, '7', '1', '1', '7', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '79.9900', '18', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('22', '1', '13', 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', '89.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:49:29', null, '7', '1', '1', '8', '9', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '89.9900', '19', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('23', '1', '16', 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', '99.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:48:50', null, '10', '1', '1', '8', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '99.9900', '20', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('24', '1', '16', 'PC-DISC', 'gt_interactive/disciples.gif', '90.0000', '0', '2003-11-03 12:32:17', '2003-12-23 00:43:24', null, '8', '1', '1', '8', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '90.0000', '20', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('25', '1', '16', 'MSINTKB', 'microsoft/intkeyboardps2.gif', '69.9900', '0', '2003-11-03 12:32:17', '2004-01-04 03:02:41', null, '8', '1', '1', '2', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '69.9900', '8', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('26', '1', '9', 'MSIMEXP', 'microsoft/imexplorer.gif', '64.9500', '0', '2003-11-03 12:32:17', '2004-05-03 01:47:47', null, '8', '1', '1', '2', '17', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '64.9500', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('27', '1', '70', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.9900', '0', '2003-11-03 12:32:17', '2003-12-23 00:45:03', null, '45', '1', '1', '9', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.9900', '5', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('28', '1', '999', 'GIFT005', 'gift_certificates/gv_5.gif', '5.0000', '1', '2003-11-03 12:32:17', '2004-01-10 02:57:18', null, '0', '1', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '5.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('29', '1', '985', 'GIFT 010', 'gift_certificates/gv_10.gif', '10.0000', '1', '2003-11-03 12:32:17', '2003-12-28 14:51:36', null, '0', '1', '0', '0', '15', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '10.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('30', '1', '992', 'GIFT025', 'gift_certificates/gv_25.gif', '25.0000', '1', '2003-11-03 12:32:17', null, null, '0', '1', '0', '0', '8', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '25.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('31', '1', '997', 'GIFT050', 'gift_certificates/gv_50.gif', '50.0000', '1', '2003-11-03 12:32:17', null, null, '0', '1', '0', '0', '4', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '50.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('32', '1', '995', 'GIFT100', 'gift_certificates/gv_100.gif', '100.0000', '1', '2003-11-03 12:32:17', null, null, '0', '1', '0', '0', '5', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '100.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('34', '1', '796', 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '0', '2018-07-19 12:34:20', '2004-01-01 14:16:01', '2018-09-10 12:34:20', '7', '1', '1', '3', '5', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '35.9900', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('36', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2003-12-24 14:29:11', '2004-01-03 01:51:12', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.0000', '25', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('39', '1', '997', 'TESTFREE', 'free.gif', '100.0000', '0', '2003-12-25 16:33:13', '2004-01-11 02:29:16', null, '1', '1', '1', '0', '3', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('40', '1', '999', 'TESTCALL', 'call_for_price.jpg', '100.0000', '0', '2003-12-25 17:42:15', '2004-01-04 13:08:08', '2018-09-04 12:34:20', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '100.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('41', '1', '999', 'TESTCALL', 'call_for_price.jpg', '100.0000', '0', '2003-12-25 19:13:35', '2004-09-27 13:33:33', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '100.0000', '28', '0', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('42', '1', '998', 'TESTFREE', 'free.gif', '100.0000', '0', '2003-12-25 19:14:16', '2003-12-25 19:15:00', null, '1', '1', '1', '0', '1', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('43', '1', '999', 'TESTFREEATTRIB', 'free.gif', '100.0000', '0', '2003-12-25 20:44:06', '2004-01-21 16:23:29', null, '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('44', '1', '999', 'TESTMINUNITSNOMIX', 'sample_image.gif', '100.0000', '0', '2003-12-25 21:38:59', '2004-01-22 13:15:41', null, '1', '1', '1', '0', '0', '4', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '90.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('46', '1', '981', 'TESTMINUNITSMIX', 'sample_image.gif', '100.0000', '0', '2003-12-25 21:53:07', '2003-12-29 02:00:50', null, '1', '1', '1', '0', '18', '4', '2', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('47', '1', '9996', 'GIFT', 'gift_certificates/gv.gif', '0.0000', '1', '2018-07-19 12:34:20', '2004-09-29 20:11:51', null, '0', '1', '0', '0', '4', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '5.0000', '21', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('48', '1', '9990', 'TEST1', '1_small.jpg', '39.0000', '0', '2003-12-28 02:27:47', '2004-01-11 02:56:37', null, '1', '1', '1', '0', '10', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '39.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('49', '1', '900', 'TEST2', '2_small.jpg', '20.0000', '0', '2003-12-28 02:28:42', '2003-12-29 23:00:27', null, '0.5', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '20.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('50', '1', '1000', 'TEST3', '3_small.jpg', '75.0000', '0', '2003-12-28 02:29:37', '2003-12-29 23:01:04', null, '1.5', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '75.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('51', '1', '998', 'Free1', 'b_g_grid.gif', '25.0000', '0', '2003-12-28 11:51:05', '2004-01-21 17:03:32', null, '10', '1', '1', '0', '2', '1', '1', '0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('52', '1', '997', 'Free2', 'b_p_grid.gif', '0.0000', '1', '2003-12-28 12:24:58', '2004-01-21 17:01:18', null, '2', '1', '1', '0', '2', '1', '1', '0', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('53', '1', '991', 'MINUNITSMIX', 'b_c_grid.gif', '25.0000', '0', '2003-12-28 23:26:44', '2004-01-11 02:22:35', null, '1', '1', '1', '0', '6', '6', '3', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '20.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('54', '1', '991', 'MINUNITSNOMIX', 'waybkgnd.gif', '25.0000', '0', '2003-12-29 23:19:13', '2004-01-11 02:23:08', null, '1', '1', '1', '0', '0', '6', '3', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('55', '1', '991', 'MINUNITSMIXSALE', 'b_b_grid.gif', '25.0000', '0', '2003-12-31 11:11:46', '2004-01-11 02:26:28', null, '1', '1', '1', '0', '0', '6', '3', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('56', '1', '991', 'MINUNITSNOMIXSALE', 'b_w_grid.gif', '25.0000', '0', '2003-12-31 11:13:08', '2004-01-11 02:26:49', null, '1', '1', '1', '0', '0', '6', '3', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '25.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('57', '1', '998', 'TESTFREEALL', 'free.gif', '0.0000', '0', '2018-05-30 12:34:20', '2004-01-21 16:55:19', null, '1', '1', '1', '0', '1', '1', '1', '0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '0.0000', '24', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('59', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2003-12-31 14:36:57', '2003-12-31 14:37:05', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '300.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('60', '1', '699', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.7500', '0', '2004-01-02 01:34:55', '2004-01-02 01:41:37', null, '45', '1', '1', '9', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.7500', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('61', '1', '699', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.7500', '0', '2004-01-02 01:44:09', '2004-01-02 01:45:45', null, '45', '1', '1', '9', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '499.7500', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('74', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2004-01-02 15:34:49', '2004-01-02 15:35:17', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '399.2000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('76', '1', '1000', 'Test25-10', 'test_demo.jpg', '100.0000', '0', '2004-01-03 23:08:33', null, null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '75.0000', '28', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('78', '1', '1000', 'Test25-10AttrAll', 'test_demo.jpg', '0.0000', '0', '2004-01-04 01:09:46', '2004-01-04 01:30:12', null, '0', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '112.5000', '25', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('79', '1', '1000', 'Test25-AttrAll', 'test_demo.jpg', '0.0000', '0', '2004-01-04 01:28:52', '2004-01-04 01:33:55', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '150.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('80', '1', '1000', 'Test25', 'test_demo.jpg', '100.0000', '0', '2004-01-04 01:31:06', '2004-01-04 13:35:47', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('82', '1', '1000', 'Test120-5', 'test_demo.jpg', '120.0000', '0', '2004-01-04 14:50:38', '2004-01-04 17:09:03', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '115.0000', '27', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('83', '1', '1000', 'Test120-90-5', 'test_demo.jpg', '120.0000', '0', '2004-01-04 15:01:53', '2004-01-06 10:02:11', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '85.0000', '27', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('84', '1', '999', 'Test120', 'test_demo.jpg', '120.0000', '0', '2004-01-04 15:05:10', '2004-01-06 15:27:39', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '120.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('85', '1', '1000', 'Test90', 'test_demo.jpg', '120.0000', '0', '2004-01-04 15:19:00', '2004-01-06 10:00:35', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('88', '1', '1000', 'Test120-90-10-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-05 00:14:31', '2004-01-06 09:58:08', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '31', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('89', '1', '1000', 'Test120-90-10-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-05 00:41:40', '2004-01-06 09:57:42', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '108.0000', '31', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('90', '1', '999', 'Test120-90-10', 'test_demo.jpg', '120.0000', '0', '2004-01-05 23:55:18', '2004-01-06 00:08:58', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '45', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('92', '1', '1000', 'Test120-90off-10', 'test_demo.jpg', '120.0000', '0', '2004-01-05 23:58:54', '2004-01-06 00:09:28', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '120.0000', '45', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('93', '1', '1000', 'Test120-New100', 'test_demo.jpg', '120.0000', '0', '2004-01-06 00:02:32', '2004-01-06 00:04:25', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '46', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('94', '1', '1000', 'Test120-25-New100', 'test_demo.jpg', '120.0000', '0', '2004-01-06 00:04:31', '2004-01-06 00:07:08', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '46', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('95', '1', '1000', 'Test120-25-New100-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-07 02:35:44', '2004-01-07 02:37:27', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '51', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('96', '1', '1000', 'Test120-New100-Off-Skip', 'test_demo.jpg', '120.0000', '0', '2004-01-07 02:36:52', '2004-01-07 02:37:29', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '100.0000', '51', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('97', '1', '1000', 'Test120-90-10-Price', 'test_demo.jpg', '120.0000', '0', '2004-01-07 11:26:34', '2004-01-07 11:27:24', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '108.0000', '32', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('98', '1', '1000', 'Test120-90off-10-Price', 'test_demo.jpg', '120.0000', '0', '2004-01-07 11:28:16', '2004-01-07 11:29:57', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '108.0000', '32', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('99', '1', '997', 'FreeShipping', 'small_00.jpg', '25.0000', '0', '2004-01-07 13:27:30', '2004-01-21 01:48:48', null, '5', '1', '1', '0', '3', '1', '1', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('100', '1', '700', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '0.0000', '0', '2004-01-08 14:06:13', '2004-01-08 14:06:50', null, '45', '1', '1', '9', '0', '1', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '374.2500', '25', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('101', '1', '1000', 'Test120-90off-10', 'test_demo.jpg', '0.0000', '0', '2004-01-08 14:11:32', '2004-01-08 14:17:09', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '80.0000', '47', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('104', '1', '1000', 'HIDEQTY', '1_small.jpg', '75.0000', '0', '2004-01-11 03:02:51', '2004-01-22 11:21:36', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '75.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('105', '1', '999', 'MAXSAMPLE-1', 'waybkgnd.gif', '50.0000', '0', '2004-01-11 14:10:59', '2004-01-11 14:36:00', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '1', '0', '0', '0', '50.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('106', '1', '1000', 'MAXSAMPLE-3', 'waybkgnd.gif', '50.0000', '0', '2004-01-11 14:36:08', '2004-01-11 15:32:56', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '3', '0', '0', '0', '50.0000', '22', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('107', '1', '995', 'FreeShippingNoWeight', 'small_00.jpg', '25.0000', '0', '2004-01-21 01:41:22', '2004-01-21 02:01:54', null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('108', '1', '0', 'SoldOut', 'small_00.jpg', '25.0000', '0', '2004-01-21 01:53:20', null, null, '3', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('109', '1', '1000', 'HIDEQTYBOX', '1_small.jpg', '75.0000', '0', '2004-01-21 22:01:20', '2004-01-22 11:21:12', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '1', '0', '0', '0', '75.0000', '23', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('110', '1', '1000', 'Test120-5SKIP', 'test_demo.jpg', '120.0000', '0', '2004-01-24 16:09:52', '2004-01-24 16:15:25', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '115.0000', '52', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('111', '1', '1000', 'Test120-90-5SKIP', 'test_demo.jpg', '120.0000', '0', '2004-01-24 16:10:12', '2004-01-24 16:15:27', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '90.0000', '52', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('112', '1', '998', 'Test2', '', '25.0000', '0', '2004-04-26 02:24:57', '2004-04-26 02:25:44', null, '1', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '2', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('113', '1', '994', 'Test4', '', '25.0000', '0', '2004-04-26 02:25:03', '2004-04-26 02:25:35', null, '1', '1', '1', '0', '6', '1', '1', '0', '0', '0', '1', '0', '1', '0', '4', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('114', '1', '998', 'Test5', '', '25.0000', '0', '2004-04-26 02:25:53', '2004-04-26 02:26:15', null, '1', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '5', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('115', '1', '999', 'Test1', '', '25.0000', '0', '2004-04-26 02:26:23', '2004-05-06 21:50:19', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '1', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('116', '1', '997', 'Test8', '', '25.0000', '0', '2004-04-26 02:26:54', '2004-04-26 02:27:18', null, '1', '1', '1', '0', '3', '1', '1', '0', '0', '0', '1', '0', '1', '0', '8', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('117', '1', '995', 'Test3', '', '25.0000', '0', '2004-04-26 02:27:24', '2004-10-03 12:20:14', null, '1', '1', '1', '0', '5', '1', '1', '0', '0', '0', '1', '0', '1', '0', '3', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('118', '1', '999', 'Test10', '', '25.0000', '0', '2004-04-26 02:27:52', '2004-04-26 02:28:14', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '10', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('119', '1', '1000', 'Test6', '', '25.0000', '0', '2004-04-26 02:28:22', '2004-10-06 18:26:25', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '6', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('120', '1', '1000', 'Test7', '', '25.0000', '0', '2004-04-26 02:29:03', '2004-04-26 02:29:23', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '7', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('121', '1', '999', 'Test12', '', '25.0000', '0', '2004-04-26 02:29:36', '2004-04-28 13:02:47', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '12', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('122', '1', '998', 'Test9', '', '25.0000', '0', '2004-04-26 02:30:12', '2004-04-26 02:30:32', null, '1', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '9', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('123', '1', '999', 'Test11', '', '25.0000', '0', '2004-04-26 02:30:41', '2004-04-26 02:31:04', null, '1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '11', '0', '0', '25.0000', '53', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('127', '1', '1000', 'Normal', 'small_00.jpg', '15.0000', '0', '2004-04-28 01:51:35', '2004-04-28 14:23:29', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '0', '15.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('130', '1', '1000', 'Special', '2_small.jpg', '15.0000', '0', '2004-04-28 02:19:53', '2004-10-06 00:05:34', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '1', '10.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('131', '1', '1000', 'PERWORDREQ', '', '0.0000', '0', '2018-06-19 12:34:20', '2004-05-07 21:30:23', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '5.0000', '57', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('132', '1', '997', 'GolfClub', '9_small.jpg', '0.0000', '0', '2004-05-02 12:36:12', '2004-05-02 18:04:36', null, '1', '1', '1', '0', '3', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '14.4500', '58', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('133', '1', '1000', 'DOWNLOAD2', '2_small.jpg', '49.9900', '0', '2018-08-01 12:34:20', '2004-05-03 00:06:58', null, '0', '1', '1', '0', '2', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '49.9900', '60', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('134', '1', '1000', 'PERLETTERREQ', '', '0.0000', '0', '2018-06-19 12:34:20', '2004-05-07 21:29:50', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '5.0000', '57', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('154', '1', '10000', 'ROPE', '9_small.jpg', '1.0000', '0', '2004-05-16 21:08:08', '2004-07-12 17:18:46', null, '0', '1', '1', '0', '0', '10', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '1.0000', '58', '0', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('155', '1', '1000', 'PRICEFACTOR', 'sample_image.gif', '10.0000', '0', '2004-05-17 23:03:10', '2004-07-12 17:21:04', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '10.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('156', '1', '1000', 'PRICEFACTOROFF', 'sample_image.gif', '10.0000', '0', '2004-05-17 23:05:24', '2004-05-17 23:10:12', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '10.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('157', '1', '1000', 'PRICEFACTOROFFATTR', 'sample_image.gif', '10.0000', '0', '2004-05-17 23:10:18', '2004-05-17 23:13:48', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '10.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('158', '1', '1000', 'ONETIME', 'b_b_grid.gif', '45.0000', '0', '2004-05-17 23:22:08', null, null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '45.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('159', '1', '10000', 'ATTQTYPRICE', 'b_c_grid.gif', '25.0000', '0', '2004-05-17 23:29:31', '2004-05-17 23:49:56', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '25.0000', '56', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('160', '1', '997', 'GolfClub', '9_small.jpg', '0.0000', '0', '2018-06-19 12:34:20', '2004-05-18 10:15:16', null, '1', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '14.4500', '61', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('165', '1', '10000', 'ROPE', '9_small.jpg', '1.0000', '0', '2004-05-18 10:42:50', '2004-07-12 17:18:12', null, '0', '1', '1', '0', '0', '10', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '1.0000', '61', '0', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('166', '2', '10000', 'RTBHUNTER', 'sooty.jpg', '4.9900', '0', '2018-08-01 12:34:20', '2004-05-18 10:43:00', null, '3', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '3.0000', '62', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('167', '3', '0', '', '', '0.0000', '0', '2004-05-18 10:42:50', '2004-10-06 00:39:10', null, '0', '1', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0000', '63', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('168', '1', '1000', 'PGT', 'samples/1_small.jpg', '3.9500', '0', '2018-08-08 12:34:20', '2004-07-12 16:26:08', null, '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '10', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('169', '2', '1000', 'PMT', 'samples/2_small.jpg', '3.9500', '0', '2018-08-08 12:34:20', '2004-07-12 16:29:01', null, '1', '1', '1', null, '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '20', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('170', '3', '0', '', 'samples/3_small.jpg', '0.0000', '0', '2018-08-08 12:34:20', '2004-09-27 23:11:25', null, '0', '1', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '30', '0', '0', '0.0000', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('171', '4', '1000', 'DPT', 'samples/4_small.jpg', '0.9346', '0', '2018-08-01 12:34:20', '2004-07-12 17:46:49', null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '40', '0', '0', '0.9300', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('172', '5', '1000', 'PFS', 'samples/5_small.jpg', '3.9500', '0', '2018-08-01 12:34:20', '2004-07-12 23:08:43', null, '5', '1', '0', '0', '0', '1', '1', '0', '0', '0', '1', '1', '1', '0', '50', '0', '0', '3.9500', '64', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('173', '1', '1000', 'Book', 'b_g_grid.gif', '0.0000', '0', '2004-09-24 23:54:34', '2004-09-26 02:50:59', null, '0', '1', '1', '0', '0', '1', '1', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '52.5000', '61', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('174', '1', '999', 'TESTCALL', 'call_for_price.jpg', '0.0000', '0', '2018-05-30 12:34:20', '2004-09-27 13:28:54', '2018-08-25 12:34:20', '1', '1', '1', '0', '0', '1', '1', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.0000', '24', '0', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('175', '1', '1000', 'Normal', '1_small.jpg', '60.0000', '0', '2004-09-27 23:32:52', '2004-10-05 17:13:20', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '60.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('176', '1', '1000', 'Normal', 'small_00.jpg', '100.0000', '0', '2004-10-05 16:45:25', '2004-10-05 16:47:22', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '0', '100.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('177', '1', '1000', 'Special', '2_small.jpg', '100.0000', '0', '2004-10-05 16:47:45', '2004-10-06 00:05:48', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '1', '1', '75.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('178', '1', '1000', 'Normal', '1_small.jpg', '60.0000', '0', '2004-10-05 16:54:52', '2004-10-05 17:15:02', null, '2', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '50.0000', '55', '1', '0', '0', '0', '0', '0');
INSERT INTO `products` VALUES ('179', '1', '1000', 'DOWNLOAD1', '1_small.jpg', '39.0000', '0', '2004-10-06 00:08:33', '2004-10-06 00:18:51', null, '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '39.0000', '60', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `products_attributes`
-- ----------------------------
DROP TABLE IF EXISTS `products_attributes`;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_attributes
-- ----------------------------
INSERT INTO `products_attributes` VALUES ('1', '1', '4', '1', '0.0000', '', '10', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('2', '1', '4', '2', '50.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('3', '1', '4', '3', '70.0000', '+', '30', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('4', '1', '3', '5', '0.0000', '+', '10', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('5', '1', '3', '6', '100.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('6', '2', '4', '3', '10.0000', '-', '30', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('7', '2', '4', '4', '0.0000', '+', '40', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('8', '2', '3', '6', '0.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('9', '2', '3', '7', '120.0000', '+', '30', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('10', '26', '3', '8', '0.0000', '+', '20', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('11', '26', '3', '9', '6.0000', '+', '10', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('26', '22', '5', '10', '0.0000', '+', '10', '0', '7', '-', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('27', '22', '5', '13', '0.0000', '+', '1000', '0', '0', '', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('38', '34', '1', '15', '0.4000', '+', '50', '0', '0', '', '0', '0', '1', 'attributes/a_bugs_life_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('39', '34', '1', '16', '0.1000', '+', '10', '0', '0.1', '', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('40', '34', '1', '17', '0.3000', '+', '30', '0', '0.1', '', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('41', '34', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('42', '34', '2', '19', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('43', '34', '2', '20', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('44', '34', '2', '18', '0.0000', '+', '30', '0', '0', '+', '0', '1', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('45', '34', '6', '14', '36.9900', '+', '30', '0', '9', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('46', '34', '6', '22', '1.0000', '+', '20', '0', '2', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('47', '34', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('48', '34', '5', '24', '1.0000', '+', '10', '0', '2', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('52', '34', '10', '0', '0.5000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('53', '34', '9', '0', '0.7500', '+', '0', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('54', '34', '11', '0', '1.0000', '+', '0', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('55', '34', '8', '0', '0.2500', '+', '0', '0', '0', '+', '0', '0', '1', null, '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('56', '34', '7', '0', '0.2500', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('63', '34', '13', '34', '1.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('64', '34', '13', '36', '2.0000', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('65', '34', '13', '35', '5.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('85', '34', '1', '25', '0.2000', '+', '20', '0', '0.1', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('86', '34', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('87', '34', '1', '27', '0.0000', '+', '60', '0', '0.1', '+', '0', '0', '1', 'attributes/a_bugs_life_purple.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('88', '34', '1', '28', '0.0000', '+', '70', '0', '0', '+', '0', '0', '1', 'attributes/a_bugs_life_brown.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('89', '34', '1', '30', '0.0000', '+', '90', '0', '0', '+', '0', '0', '1', 'attributes/a_bugs_life_white.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('90', '34', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/a_bugs_life_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('101', '36', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('102', '36', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('103', '36', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('104', '36', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('105', '36', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('106', '36', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('119', '43', '1', '16', '5.0000', '+', '10', '1', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('120', '43', '1', '17', '6.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('121', '43', '1', '29', '7.0000', '+', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('122', '43', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('123', '43', '2', '18', '1.0000', '+', '30', '1', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('124', '43', '2', '20', '2.0000', '+', '40', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('125', '44', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('126', '44', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('127', '44', '1', '29', '0.0000', '+', '80', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('128', '44', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('129', '44', '2', '18', '1.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('130', '44', '2', '20', '2.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('137', '46', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('138', '46', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('139', '46', '1', '29', '0.0000', '+', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('140', '46', '2', '21', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('141', '46', '2', '18', '1.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('142', '46', '2', '20', '2.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('143', '44', '2', '37', '0.0000', '+', '5', '0', '0', '+', '1', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('144', '46', '2', '37', '0.0000', '+', '5', '1', '0', '+', '1', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('160', '47', '14', '38', '5.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('161', '47', '14', '39', '10.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('162', '47', '14', '41', '15.0000', '+', '15', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('163', '47', '14', '43', '100.0000', '+', '100', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('164', '47', '14', '40', '25.0000', '+', '25', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('165', '47', '14', '42', '50.0000', '+', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('306', '48', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('307', '48', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('308', '48', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('309', '48', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('310', '48', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('311', '48', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('390', '50', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('391', '50', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('392', '50', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('393', '50', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('394', '50', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('395', '50', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('396', '53', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('397', '53', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('398', '53', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('399', '53', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('400', '53', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('401', '53', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('402', '49', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('403', '49', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('404', '49', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('405', '49', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('406', '49', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('407', '49', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('410', '54', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('411', '54', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('412', '54', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('413', '54', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('414', '54', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('415', '54', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('417', '46', '13', '34', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('418', '46', '13', '35', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('419', '46', '13', '36', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('420', '46', '13', '44', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('421', '43', '1', '45', '0.0000', '+', '5', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('422', '36', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('425', '55', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('426', '55', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('427', '55', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('428', '55', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('429', '55', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('430', '55', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('431', '56', '1', '31', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', 'attributes/color_silver.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('432', '56', '1', '15', '0.0000', '+', '50', '0', '0', '+', '0', '0', '1', 'attributes/color_blue.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('433', '56', '6', '23', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('434', '56', '6', '14', '19.9900', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('435', '56', '6', '22', '4.9900', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('436', '56', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '1', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('444', '59', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('445', '59', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('446', '59', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('447', '59', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('448', '59', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('449', '59', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('450', '59', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('451', '60', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('452', '60', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('453', '60', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('454', '60', '1', '29', '10.0000', '+', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('455', '60', '1', '30', '0.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('456', '60', '1', '15', '20.0000', '+', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('457', '60', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('458', '61', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('459', '61', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('460', '61', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('461', '61', '1', '29', '10.0000', '+', '80', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('462', '61', '1', '30', '0.0000', '', '90', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('463', '61', '1', '15', '20.0000', '+', '50', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('464', '61', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('482', '74', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('483', '74', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('484', '74', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('485', '74', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('486', '74', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('487', '74', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('488', '74', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('496', '46', '10', '0', '0.7500', '+', '0', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('497', '46', '9', '0', '0.5000', '+', '0', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('498', '46', '11', '0', '0.2500', '+', '0', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('499', '76', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('500', '76', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('501', '76', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('502', '76', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('503', '76', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('504', '76', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('505', '76', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('506', '76', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('507', '76', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('508', '78', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('509', '78', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('510', '78', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('511', '78', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('512', '78', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('513', '78', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('514', '78', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('515', '78', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('516', '78', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('517', '79', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('518', '79', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('519', '79', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('520', '79', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('521', '79', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('522', '79', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('523', '79', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('524', '79', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('525', '79', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('526', '80', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('527', '80', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('528', '80', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('529', '80', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('530', '80', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('531', '80', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('532', '80', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('533', '80', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('534', '80', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('562', '84', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('563', '84', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('564', '84', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('565', '84', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('566', '84', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('567', '84', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('568', '84', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('569', '84', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('570', '84', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('571', '85', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('572', '85', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('573', '85', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('574', '85', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('575', '85', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('576', '85', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('577', '85', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('578', '85', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('579', '85', '13', '36', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('661', '84', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('662', '84', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('663', '84', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('668', '84', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('669', '84', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('671', '84', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('672', '84', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('673', '82', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('674', '82', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('675', '82', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('676', '82', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('677', '82', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('678', '82', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('679', '82', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('680', '82', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('681', '82', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('682', '82', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('683', '82', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('684', '82', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('685', '82', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('686', '82', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('687', '82', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('688', '82', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('689', '83', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('690', '83', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('691', '83', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('692', '83', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('693', '83', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('694', '83', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('695', '83', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('696', '83', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('697', '83', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('698', '83', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('699', '83', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('700', '83', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('701', '83', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('702', '83', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('703', '83', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('704', '83', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('705', '93', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('706', '93', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('707', '93', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('708', '93', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('709', '93', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('710', '93', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('711', '93', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('712', '93', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('713', '93', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('714', '93', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('715', '93', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('716', '93', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('717', '93', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('718', '93', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('719', '93', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('720', '93', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('721', '94', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('722', '94', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('723', '94', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('724', '94', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('725', '94', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('726', '94', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('727', '94', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('728', '94', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('729', '94', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('730', '94', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('731', '94', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('732', '94', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('733', '94', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('734', '94', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('735', '94', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('736', '94', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('801', '90', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('802', '90', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('803', '90', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('804', '90', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('805', '90', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('806', '90', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('807', '90', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('808', '90', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('809', '90', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('810', '90', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('811', '90', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('812', '90', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('813', '90', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('814', '90', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('815', '90', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('816', '90', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('817', '92', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('818', '92', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('819', '92', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('820', '92', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('821', '92', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('822', '92', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('823', '92', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('824', '92', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('825', '92', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('826', '92', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('827', '92', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('828', '92', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('829', '92', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('830', '92', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('831', '92', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('832', '92', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('865', '88', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('866', '88', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('867', '88', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('868', '88', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('869', '88', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('870', '88', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('871', '88', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('872', '88', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('873', '88', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('874', '88', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('875', '88', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('876', '88', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('877', '88', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('878', '88', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('879', '88', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('880', '88', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('881', '89', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('882', '89', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('883', '89', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('884', '89', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('885', '89', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('886', '89', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('887', '89', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('888', '89', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('889', '89', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('890', '89', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('891', '89', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('892', '89', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('893', '89', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('894', '89', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('895', '89', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('896', '89', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('897', '95', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('898', '95', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('899', '95', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('900', '95', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('901', '95', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('902', '95', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('903', '95', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('904', '95', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('905', '95', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('906', '95', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('907', '95', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('908', '95', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('909', '95', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('910', '95', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('911', '95', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('912', '95', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('913', '96', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('914', '96', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('915', '96', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('916', '96', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('917', '96', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('918', '96', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('919', '96', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('920', '96', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('921', '96', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('922', '96', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('923', '96', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('924', '96', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('925', '96', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('926', '96', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('927', '96', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('928', '96', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('929', '97', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('930', '97', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('931', '97', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('932', '97', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('933', '97', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('934', '97', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('935', '97', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('936', '97', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('937', '97', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('938', '97', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('939', '97', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('940', '97', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('941', '97', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('942', '97', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('943', '97', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('944', '97', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('945', '98', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('946', '98', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('947', '98', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('948', '98', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('949', '98', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('950', '98', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('951', '98', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('952', '98', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('953', '98', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('954', '98', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('955', '98', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('956', '98', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('957', '98', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('958', '98', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('959', '98', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('960', '98', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('962', '100', '4', '3', '100.0000', '+', '30', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('963', '100', '4', '2', '75.0000', '+', '20', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('964', '100', '4', '1', '50.0000', '+', '10', '0', '1', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('965', '100', '1', '29', '519.0000', '', '80', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('966', '100', '1', '30', '499.0000', '', '90', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('967', '100', '1', '15', '539.0000', '', '50', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('968', '100', '4', '46', '0.0000', '+', '5', '0', '0', '+', '0', '1', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('969', '101', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('970', '101', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('971', '101', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('972', '101', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('973', '101', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('974', '101', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('975', '101', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('976', '101', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('977', '101', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('978', '101', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('979', '101', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('980', '101', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('981', '101', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('982', '101', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('983', '101', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('984', '101', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('987', '109', '5', '10', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('988', '109', '5', '52', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('990', '110', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('991', '110', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('992', '110', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('993', '110', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('994', '110', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('995', '110', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('996', '110', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('997', '110', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('998', '110', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('999', '110', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1000', '110', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1001', '110', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1002', '110', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1003', '110', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1004', '110', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1005', '110', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1006', '111', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '0', '1', 'attributes/color_red.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1007', '111', '1', '25', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', 'attributes/color_orange.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1008', '111', '1', '17', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', 'attributes/color_yellow.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1009', '111', '2', '21', '50.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1010', '111', '2', '20', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1011', '111', '2', '18', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1012', '111', '13', '35', '75.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1013', '111', '13', '34', '100.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1014', '111', '13', '36', '40.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1015', '111', '1', '26', '40.0000', '+', '40', '0', '0', '+', '0', '0', '1', 'attributes/color_green.gif', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1016', '111', '2', '19', '40.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1017', '111', '13', '47', '50.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1018', '111', '13', '48', '0.0000', '+', '5', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1019', '111', '15', '49', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1020', '111', '15', '50', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1021', '111', '15', '51', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, null, '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1025', '131', '10', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0500', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1027', '131', '1', '16', '5.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1028', '131', '1', '26', '5.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1029', '131', '1', '17', '5.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1030', '131', '9', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0500', '3', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1031', '132', '16', '53', '14.4500', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1032', '132', '16', '54', '14.4500', '+', '40', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1033', '132', '16', '55', '14.4500', '+', '50', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1034', '132', '16', '56', '14.4500', '+', '60', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1035', '132', '16', '57', '14.4500', '+', '90', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1036', '132', '16', '58', '14.4500', '+', '200', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1037', '132', '16', '61', '14.4500', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1038', '132', '16', '59', '14.4500', '+', '70', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1039', '132', '16', '60', '14.4500', '+', '80', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1040', '133', '5', '10', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1041', '133', '17', '62', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1042', '133', '17', '63', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1043', '133', '5', '64', '0.0000', '+', '100', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1044', '133', '5', '52', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1045', '134', '10', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0200', '0', '1');
INSERT INTO `products_attributes` VALUES ('1046', '134', '1', '16', '5.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1047', '134', '1', '26', '5.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1048', '134', '1', '17', '5.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '1');
INSERT INTO `products_attributes` VALUES ('1049', '134', '9', '0', '0.0000', '+', '0', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0200', '3', '1');
INSERT INTO `products_attributes` VALUES ('1050', '154', '18', '65', '0.0000', '+', '10', '0', '0.25', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1051', '154', '18', '66', '1.5000', '+', '20', '0', '0.75', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1052', '155', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '1.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1053', '155', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '2.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1054', '155', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '3.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1055', '156', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1056', '156', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '2.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1057', '156', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '3.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1058', '157', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '1.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1059', '157', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '2.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1060', '157', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '3.0000', '1.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1061', '158', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '5.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1062', '158', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1063', '158', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '15.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1064', '159', '1', '16', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1:11,3:10.00,6:9.00,9:8.00,12:7.00,15:6.00', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1065', '159', '1', '26', '0.0000', '+', '40', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3:11.00,6:10.00,9:9.00,12:8.00,15:7.00', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1066', '159', '1', '17', '0.0000', '+', '30', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3:10.50,6:9.50,9:8.50,12:7.50,15:6.50', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1069', '160', '16', '53', '14.4500', '+', '30', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1070', '160', '16', '54', '14.4500', '+', '40', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1071', '160', '16', '55', '14.4500', '+', '50', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1072', '160', '16', '56', '14.4500', '+', '60', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1073', '160', '16', '57', '14.4500', '+', '90', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1074', '160', '16', '58', '14.4500', '+', '200', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1075', '160', '16', '61', '14.4500', '+', '20', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1076', '160', '16', '59', '14.4500', '+', '70', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1077', '160', '16', '60', '14.4500', '+', '80', '0', '1', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1088', '171', '17', '63', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1089', '171', '17', '62', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1090', '165', '18', '65', '0.0000', '+', '10', '0', '0.25', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1091', '165', '18', '66', '1.5000', '+', '20', '0', '0.75', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1092', '172', '19', '67', '0.0000', '+', '10', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1093', '173', '5', '10', '20.0000', '', '10', '0', '0', '+', '0', '0', '0', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1094', '173', '5', '64', '20.0000', '', '100', '0', '0', '+', '0', '0', '0', '', '0', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1095', '173', '5', '68', '52.5000', '', '5', '0', '1', '', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1096', '175', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1097', '175', '1', '26', '100.0000', '+', '40', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1098', '178', '1', '16', '100.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1099', '178', '1', '26', '100.0000', '+', '40', '0', '0', '+', '0', '0', '0', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1100', '179', '17', '63', '0.0000', '+', '20', '0', '0', '+', '0', '0', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');
INSERT INTO `products_attributes` VALUES ('1103', '179', '17', '62', '0.0000', '+', '10', '0', '0', '+', '0', '1', '1', '', '1', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', '0', '0.0000', '0', '0');

-- ----------------------------
-- Table structure for `products_attributes_download`
-- ----------------------------
DROP TABLE IF EXISTS `products_attributes_download`;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_attributes_download
-- ----------------------------
INSERT INTO `products_attributes_download` VALUES ('26', 'unreal.zip', '7', '3');
INSERT INTO `products_attributes_download` VALUES ('1040', 'test.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1041', 'test2.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1042', 'test2.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1043', 'test.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1044', 'test.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1088', 'ms_word_sample.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1089', 'pdf_sample.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1093', 'test.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1094', 'test2.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1100', 'ms_word_sample.zip', '7', '5');
INSERT INTO `products_attributes_download` VALUES ('1103', 'pdf_sample.zip', '7', '5');

-- ----------------------------
-- Table structure for `products_description`
-- ----------------------------
DROP TABLE IF EXISTS `products_description`;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_description
-- ----------------------------
INSERT INTO `products_description` VALUES ('1', '1', 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', '0');
INSERT INTO `products_description` VALUES ('1', '2', 'Matrox G200 MMS', 'Matrox 的芯片技术在新的 Tech Source GFX 200 系列发挥功能，采用首创以一张 PCI 图形卡支持基于Sun Microsystems Solaris平台，支持多达四个 DVI 数字液晶显示屏。GFX 200 系列，有 16 MB（支持两个显示屏）或 32 MB（支持四个显示屏）SGRAM 可选择。以 Matrox G200 多屏幕显示系列的技术为基础，此技术也广受金融界认可，并支持金融界权威公司如 Barclays、富达投资和路透社等。', 'www.matrox.com/mga/products/g200_mms/home.cfm', '0');
INSERT INTO `products_description` VALUES ('2', '1', 'Matrox G400 32MB', 'Dramatically Different High Performance Graphics<br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br />Key features:<ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', '0');
INSERT INTO `products_description` VALUES ('2', '2', 'Matrox G400 32MB', 'G400显卡绝对是显卡历史上永恒的经典产品，其优良的2D画质在如今都是出类拔萃的！也正因为如此，它也成为许多2D作图用户的首选显卡。在很多二手产品论坛上，G400都是炙手可热的东西。G400采用SGRAM显存，容量为16M或32M，AGP-4X接口，对2D画质要求很高或对Matrox显卡情有独衷的朋友可以关注一下。', 'www.matrox.com/mga/products/mill_g400/home.htm', '0');
INSERT INTO `products_description` VALUES ('3', '1', 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', '0');
INSERT INTO `products_description` VALUES ('3', '2', '人体工程学鼠标', '人体工程学鼠标又分标准外壳和半透明外壳两种，这些鼠标功能相同，不过手感不同，人体工程学鼠标比较顺手。不加载专用的驱动程序也可以使用滚轮功能。专用的驱动程序可以通过网络获得目前的最新版本。', 'www.microsoft.com/hardware/mouse/intellimouse.asp', '0');
INSERT INTO `products_description` VALUES ('4', '1', 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', '0');
INSERT INTO `products_description` VALUES ('4', '2', '替身杀手', '地区代码: 2 (日本, 欧洲, 中东, 南非).<br />语言: 英语, 德语.<br />子标题: 英语, 德语, 西班牙语.<br />音频: 杜比环绕 5.1<br />图像格式: 16:9 宽屏<br />长度: (约) 80 分钟.<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.replacement-killers.com', '0');
INSERT INTO `products_description` VALUES ('5', '1', 'Blade Runner - Director\'s Cut Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', '0');
INSERT INTO `products_description` VALUES ('5', '2', '银翼杀手 - 导演剪辑版 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).<br />语言: 英语, 德语.<br />子标题: 英语, 德语, 西班牙语.<br />音频: 杜比环绕 5.1。<br />图像格式: 16:9 宽屏<br />长度: (约) 112 分钟.<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.bladerunner.com', '0');
INSERT INTO `products_description` VALUES ('6', '1', 'The Matrix Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch.\r\n<br />\r\nAudio: Dolby Surround.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 131 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', '0');
INSERT INTO `products_description` VALUES ('6', '2', '黑客帝国 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语.\r\n<br />\r\n音频: 杜比环绕\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 131 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕', 'www.thematrix.com', '0');
INSERT INTO `products_description` VALUES ('7', '1', 'You\'ve Got Mail Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch, Spanish. <br />Subtitles: English, Deutsch, Spanish, French, Nordic, Polish. <br />Audio: Dolby Digital 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 115 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', '0');
INSERT INTO `products_description` VALUES ('7', '2', '电子情书 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语, 西班牙语. <br />子标题: 英语, 德语, 西班牙语, 法语, 北欧, 波兰. <br />音频: 杜比环绕 5.1。<br />图像格式: 16:9 宽屏 <br />长度: (约) 115 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.youvegotmail.com', '0');
INSERT INTO `products_description` VALUES ('8', '1', 'A Bug\'s Life Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Digital 5.1 / Dolby Surround Stereo. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 91 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', '0');
INSERT INTO `products_description` VALUES ('8', '2', '虫虫危机 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比数码 5.1 / 杜比环绕立体声。<br />图像格式: 16:9 宽屏 <br />长度: (约) 91 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', 'www.abugslife.com', '0');
INSERT INTO `products_description` VALUES ('9', '1', 'Under Siege Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 98 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('9', '2', '潜龙轰天 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比环绕 5.1. <br />图像格式: 16:9 宽屏 <br />长度: (约) 98 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('10', '1', 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 98 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('10', '2', '潜龙轰天2 - 暴走潜龙', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />语言: 英语, 德语.\r\n<br />子标题: 英语, 德语, 西班牙语.\r\n<br />音频: 杜比环绕 5.1。\r\n<br />图像格式: 16:9 宽屏\r\n<br />长度: (约) 98 分钟.\r\n<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('11', '1', 'Fire Down Below Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('11', '2', '枪口朝下 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 100 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('12', '1', 'Die Hard With A Vengeance Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa). <br />Languages: English, Deutsch. <br />Subtitles: English, Deutsch, Spanish. <br />Audio: Dolby Surround 5.1. <br />Picture Format: 16:9 Wide-Screen. <br />Length: (approx) 122 minutes. <br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('12', '2', '虎胆龙威 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非). <br />语言: 英语, 德语. <br />子标题: 英语, 德语, 西班牙语. <br />音频: 杜比环绕 5.1。 <br />图像格式: 16:9 宽屏 <br />长度: (约) 122 分钟. <br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('13', '1', 'Lethal Weapon Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 100 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('13', '2', '致命武器 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 100 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('14', '1', 'Red Corner Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 117 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('14', '2', '红色角落 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 117 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('15', '1', 'Frantic Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 115 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('15', '2', '惊狂记 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 115 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('16', '1', 'Courage Under Fire Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('16', '2', '生死豪情 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 112 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('17', '1', 'Speed Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 112 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('17', '2', '生死时速 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 112 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('18', '1', 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br />\nLanguages: English, Deutsch.\r<br />\nSubtitles: English, Deutsch, Spanish.\r<br />\nAudio: Dolby Surround 5.1.\r<br />\nPicture Format: 16:9 Wide-Screen.\r<br />\nLength: (approx) 120 minutes.\r<br />\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('18', '2', '生死时速2: 海上惊情', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />语言: 英语, 德语.\r\n<br />子标题: 英语, 德语, 西班牙语.\r\n<br />音频: 杜比环绕 5.1。\r\n<br />图像格式: 16:9 宽屏\r\n<br />长度: (约) 120 分钟.\r\n<br />其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('19', '1', 'There\'s Something About Mary Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 114 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('19', '2', '我为玛丽狂 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 114 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('20', '1', 'Beloved Linked', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Surround 5.1.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 164 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '0');
INSERT INTO `products_description` VALUES ('20', '2', '真爱 链接', '地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比环绕 5.1。\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 164 分钟.\r\n<br />\r\n其它: 交互式菜单, 字幕, 子标题 (多种语言).', '', '0');
INSERT INTO `products_description` VALUES ('21', '1', 'SWAT 3: Close Quarters Battle Linked', 'Windows 95/98<br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and &quot;When needed&quot; to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', '0');
INSERT INTO `products_description` VALUES ('21', '2', '洛城特警3: 精英编辑版 链接', 'Windows 95/98<br /><br />公元2005年，洛杉矶。洛城警局SWAT特勤小组受命保护参加签订废除核武条约的各国领袖，并瓦解恐怖份子的破坏计划。<br /><br />在这个版本中，除了原先的游戏主程序外，还包含了六个新的单人任务，以及原先缺乏的多人联机模式，再加上一堆新增功能及对象，让玩家自由设定进行任务的环境。而如果你已经厌倦了每次都扮演维持秩序的警察，这次可以来点不一样的，在精英版中，玩家除了可以担任特勤小组的警官外，还可以扮演专伺破坏的恐怖份子。', 'www.swat3.com', '0');
INSERT INTO `products_description` VALUES ('22', '1', 'Unreal Tournament Linked', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', '0');
INSERT INTO `products_description` VALUES ('22', '2', '虚幻竞技场 链接', '《虚幻竞技场》加入了许多单人游戏要素，证明开发小组也开始重视游戏的单人部分就像游戏一直注重的联机部分一样。就像Rein与游戏的制作小组成员Jeff Morris说的那样，虽然游戏的剧情方面虽然不会像《战争机器》那样引人入胜，但是可以让玩家了解整个故事的背景。整个虚幻竞技场的故事建立于未来的Super Bowl。统治企业为了平息手下员工的不满情绪，建立了一个格斗竞技场为员工提供消遣。而玩家则扮演一位年轻小伙子，为了向杀害他全家的公司报仇而义无反顾的进入了竞技场。', 'www.unrealtournament.net', '0');
INSERT INTO `products_description` VALUES ('23', '1', 'The Wheel Of Time Linked', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.', 'www.wheeloftime.com', '0');
INSERT INTO `products_description` VALUES ('23', '2', '时空之轮 链接', '《时空之轮》是用《Unreal》的游戏引擎制作，亦即是说该游戏是一支第一身射击游戏。至于游戏的背景，则是著名作家RobertJordan笔下的神话世界。在Jordan笔下的世界中，人类因一时大意而放走了为祸世上的魔王DarkOne，而更惨的是，用以镇压DarkOne的封印亦在动乱中失去了。在数千年后，失落的封印重新被四股敌对的势力发现，遂展开了封印的争夺战。<br /><br />游戏内的法术共计四十种，可大约分为攻击、防守、移动和恢复能源多种，较诸一般射击游戏只靠枪炮去砍杀多姿多采得多了，而且开发小组亦体会到其他游戏的法术系统做得不平衡，形成「只靠一种法术便能过版」的情况，故在设计时亦着重法术间的平衡。举个例来说，一些法术准确度虽高，但其准备时间却要长得多，所以这些法术只可对付一些HP值低的敌人，务求一击便可将之打败。但趟若敌人的HP值高，用同一种法术时便会被人在攻击空档时反击，造成损伤。', 'www.wheeloftime.com', '0');
INSERT INTO `products_description` VALUES ('24', '1', 'Disciples: Sacred Lands Linked', 'A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.', '', '0');
INSERT INTO `products_description` VALUES ('24', '2', '圣战群英传: 神圣国度 链接', '游戏的概念与《英雄无敌III》非常相似。开始时玩家拥有自己的城堡和一些资源，当然还有英雄。你的任务就是派遣英雄在地图上清除异己，并且占领各种矿藏，象是水晶、黄金等等。然后用资源建立起来强大的军队与敌人作战从而获得胜利。游戏的进行方式是很传统的那种回合制，就是玩家走一步，对手走一步的那种。凡是玩过《英雄无敌III》的玩家玩起《神圣国度》应该非常容易上手，很快就可以进入角色，但在其中你又必定能够享受到许多全新的乐趣。', '', '0');
INSERT INTO `products_description` VALUES ('25', '1', 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', '0');
INSERT INTO `products_description` VALUES ('25', '2', '微软键盘', '特别设计10个快捷功能键，拥有多个可自定义的热键', '', '0');
INSERT INTO `products_description` VALUES ('26', '1', 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', '0');
INSERT INTO `products_description` VALUES ('26', '2', '微软鼠标', '人体工程学：支持 即插即用：支持 适用操作系统：与PC和Mac操作系统兼容 其它特性：Microsoft 光学感应技术', 'www.microsoft.com/hardware/mouse/explorer.asp', '0');
INSERT INTO `products_description` VALUES ('27', '1', 'Hewlett Packard LaserJet 1100Xi Linked', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('27', '2', '惠普激打1100Xi 链接', '惠普打印机在激打领域是典范。新的惠普激打1100Xi每分钟打印8页，分辨率600dpi，支持Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2及DOS。通过外接打印服务器支持网络打印。', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('28', '1', 'Gift Certificate $  5.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `products_description` VALUES ('28', '2', '礼券5元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', '0');
INSERT INTO `products_description` VALUES ('29', '1', 'Gift Certificate $ 10.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `products_description` VALUES ('29', '2', '礼券10元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', '0');
INSERT INTO `products_description` VALUES ('30', '1', 'Gift Certificate $ 25.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `products_description` VALUES ('30', '2', '礼券25元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', '0');
INSERT INTO `products_description` VALUES ('31', '1', 'Gift Certificate $ 50.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `products_description` VALUES ('31', '2', '礼券50元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', '0');
INSERT INTO `products_description` VALUES ('32', '1', 'Gift Certificate $100.00', 'Purchase a Gift Certificate today to share with your family, friends or business associates!', '', '0');
INSERT INTO `products_description` VALUES ('32', '2', '礼券100元', '现在就购买礼券，和您的家人、朋友或商业伙伴分享！', '', '0');
INSERT INTO `products_description` VALUES ('34', '1', 'A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition', 'A Bug\'s Life \"Multi Pak\" Special 2003 Collectors Edition\r\n<br />\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).\r\n<br />\r\nLanguages: English, Deutsch.\r\n<br />\r\nSubtitles: English, Deutsch, Spanish.\r\n<br />\r\nAudio: Dolby Digital 5.1 / Dolby Surround Stereo.\r\n<br />\r\nPicture Format: 16:9 Wide-Screen.\r\n<br />\r\nLength: (approx) 91 minutes.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', '0');
INSERT INTO `products_description` VALUES ('34', '2', '虫虫危机 多款2003特别收藏版', '虫虫危机 多款2003特别收藏版\r\n<br />\r\n地区代码: 2 (日本, 欧洲, 中东, 南非).\r\n<br />\r\n语言: 英语, 德语.\r\n<br />\r\n子标题: 英语, 德语, 西班牙语.\r\n<br />\r\n音频: 杜比数码5.1 / 杜比环绕立体声.\r\n<br />\r\n图像格式: 16:9 宽屏\r\n<br />\r\n长度: (约) 91 分钟.\r\n<br />\r\nOther: Interactive Menus, Chapter Selection, 子标题 (多种语言).', 'www.abugslife.com', '0');
INSERT INTO `products_description` VALUES ('36', '1', 'Hewlett Packard - by attributes SALE', 'The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('36', '2', '惠普 - 属性促销', '本商品价格为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色499.99元<br />\r\n黑色519元<br />\r\n蓝色539元<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('39', '1', 'A Free Product', 'This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nWhile this is a FREE product, this does have Shipping.', '', '0');
INSERT INTO `products_description` VALUES ('39', '2', '免费商品', '免费商品，同时有特价。\r\n<br /><br />\r\n\r\n本商品显示原价、特价，最后是免费。\r\n<br /><br />\r\n\r\n这是免费商品，但是需要运费。', '', '0');
INSERT INTO `products_description` VALUES ('40', '1', 'A Call for Price Product', 'This is a Call for Price product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />', '', '0');
INSERT INTO `products_description` VALUES ('40', '2', '价格面议商品', '价格面议商品，同时有特价。\r\n<br />\r\n\r\n本商品显示原价、特价，最后是价格面议。不能购买本商品。\r\n<br />', '', '0');
INSERT INTO `products_description` VALUES ('41', '1', 'A Call for Price Product SALE', 'This is a Call for Price product that is also on special and has a Sale price via Sale Maker.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons automatically change to Call for Price, which is defined as: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\nThis link will take the customer to the Contact Us page.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('41', '2', '价格面议 促销', '价格面议商品，有特价、有促销。\r\n<br /><br />\r\n\r\n显示原价、特价及价格面议。不能购买本商品。\r\n<br /><br />\r\n\r\n购买商品按钮自动改为价格面议，定义为: TEXT_CALL_FOR_PRICE\r\n<br /><br />\r\n\r\n这个链接将转到联系我们页面。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('42', '1', 'A Free Product - SALE', 'This is a free product that is also on special.\r\n<br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br />', '', '0');
INSERT INTO `products_description` VALUES ('42', '2', '免费商品 + 促销', '免费商品，同时有特价。\r\n<br />\r\n\r\n本商品设定了价格、特价，但同时又设定为免费。\r\n<br />', '', '0');
INSERT INTO `products_description` VALUES ('43', '1', 'A Free Product with Attributes', 'This is a free product that is also on special.\r\n<br /><br />\r\n\r\nThis should show as having a price, special price but then be free.\r\n<br /><br />\r\n\r\nAttributes can be added that can optionally be set to free or not free\r\n<br /><br />\r\n\r\nThe Color Red attribute is priced at $5.00 but marked as a Free Attribute when the Product is Free\r\n<br /><br />\r\n\r\nThe Size Medium attribute is priced at $1.00 but marked as a Free Attribute when Product is Free', '', '0');
INSERT INTO `products_description` VALUES ('43', '2', '带属性的免费商品', '免费商品，同时有特价。\r\n<br /><br />\r\n\r\n本商品设定了价格、特价，但同时又设定为免费。\r\n<br /><br />\r\n\r属性可以设置为免费或不免费\r\n<br /><br />\r\n\r\n红色属性定价为5元，但设置为商品免费时属性也免费\r\n<br /><br />\r\n\r\n尺寸中号定价为1元，但设置为商品免费时属性也免费', '', '0');
INSERT INTO `products_description` VALUES ('44', '1', 'A Mixed OFF Product with Attributes', 'This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is OFF this means you CANNOT mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nThe Size Option Value: Select from Below ... is a Display Only Attribute. \r\n<br /><br />\r\n\r\nThis means that the product cannot be added to the Shopping Cart if that Option Value is selected. If it is still selected, then an error is triggered when the Add to Cart is pressed with a warning to the customer on what the error is.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.', '', '0');
INSERT INTO `products_description` VALUES ('44', '2', '带属性的不可混合商品', '本商品含属性、最少购买数量、数量单位。\r\n<br /><br />\r\n\r\n允许属性混合设置为否，也就是说不可以混合购买不同属性的商品以达到最低购买数量和数量单位的要求。\r\n<br /><br />\r\n\r\n尺寸选项: 请选择... 是仅用于显示的属性。\r\n<br /><br />\r\n\r\n必须选择其中的一个选项，否则添加到购物车时，会报错。\r\n<br /><br />\r\n\r\n如有错误就不能结帐。', '', '0');
INSERT INTO `products_description` VALUES ('46', '1', 'A Mixed ON Product with Attributes', 'This product has attributes and a minimum qty and units.\r\n<br /><br />\r\n\r\nMixed is ON this means you CAN mix attributes to make the minimums and units.\r\n<br /><br />\r\n\r\nSelect from Below is a Display Only Attribute. This means that it cannot be added to the cart. If it is, then an error is triggered.\r\n<br /><br />\r\n\r\nNo checkout is allowed when errors exist.', '', '0');
INSERT INTO `products_description` VALUES ('46', '2', '带属性的可混合商品', '本商品含属性、最少购买数量、数量单位。\r\n<br /><br />\r\n\r\n允许属性混合设置为是，也就是说可以混合购买不同属性的商品以达到最低购买数量和数量单位的要求。\r\n<br /><br />\r\n\r\n尺寸选项: 请选择... 是仅用于显示的属性。\r\n<br /><br />\r\n\r\n必须选择其中的一个选项，否则添加到购物车时，会报错。\r\n<br /><br />\r\n\r\n如有错误就不能结帐。', '', '0');
INSERT INTO `products_description` VALUES ('47', '1', 'Gift Certificates by attributes', 'Priced by Attributes Gift Certificates.', '', '0');
INSERT INTO `products_description` VALUES ('47', '2', '按属性定价的礼券', '按属性定价的礼券。', '', '0');
INSERT INTO `products_description` VALUES ('48', '1', 'Test 1', 'This is a test product for copying and deleting attributes.\r\n<br /><br />\r\nAll of the images for this product are in the main /images directory and /large directory.\r\n<br /><br />\r\nThe main products_image is called 1_small.jpg\r\n<br /><br />\r\nThere are additional images for this product that will auto load located in /images called:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\nThe large additional images are in /images/large called:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\nThe naming conventions for the additional images do not require that they be numeric. Using the numberic system helps establish the sort order of the images and how they will display.\r\n<br /><br />\r\n\r\nWhat is important is that all the additional images be located in the same directory and start with the same name: 1_small and end in the same extenion: .jpg\r\n<br /><br />\r\n\r\nThe additional large images need to be located in the /large directory and use the same name plus the Large image suffix, defined in the Admin ... Images ... in this case _LRG\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('48', '2', '测试一', '复制和删除属性的测试商品。\r\n<br /><br />\r\n本商品的所有图片位于/images及/images/large 目录。\r\n<br /><br />\r\n主图片为1_small.jpg\r\n<br /><br />\r\n/images 中的附加图片也会自动显示:<br />\r\n1_small_01.jpg<br />\r\n1_small_02.jpg<br />\r\n1_small_03.jpg<br />\r\n<br />\r\n大图位于/images/large:<br />\r\n1_small_01_LRG.jpg<br />\r\n1_small_02_LRG.jpg<br />\r\n1_small_03_LRG.jpg<br />\r\n\r\n<br /><br />\r\n\r\n附加图片的命名不一定要数字，用数字只是为了能按顺序显示这些图片。\r\n<br /><br />\r\n\r\n重要的是附加图片必须位于同一个目录，并且文件名的开头相同: 1_small，而且文件后缀一致: .jpg\r\n<br /><br />\r\n\r\n附加的大图片必须位于/large目录，并采用相同的名称和大图片后缀，在管理页面－商店设置－图象参数中设置，目前设置为 _LRG\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('49', '1', 'Test 2', 'This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the Attributes from the Test 1 product to Test 2.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does have a Large image located in /large\r\n<br /><br />\r\n\r\nThis uses the same name: 2_small plus the large image suffix _LRG plus the matching extension .jpg to give the new name: /images/large/2_small_LRG.jpg\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('49', '2', '测试二', '复制和删除属性的测试商品。\r\n<br /><br />\r\n\r\n本商品属性通过管理页面 ... 商品管理 ... 属性控制 ... 从 测试一 复制商品属性到 测试二。\r\n<br /><br />\r\n\r\n本商品没有附加图片。\r\n<br /><br />\r\n\r\n没有大图片在/large中\r\n<br /><br />\r\n\r\n采用相同的命名: 2_small 、大图片后缀 _LRG 以及相同的后缀 .jpg 生成新的名字: /images/large/2_small_LRG.jpg\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('50', '1', 'Test 3', 'This is a test product for copying and deleting attributes.\r\n<br /><br />\r\n\r\nThis was made using the Attributes Copy to Product in the new Admin ... Catalog ... Attributes Controller ... and copying the attributes from the Test 2 product to Test 3.\r\n<br /><br />\r\n\r\nThis product does not have any additional images.\r\n<br /><br />\r\n\r\nIt does NOT have a Large image located in /large\r\n<br /><br />\r\n\r\nThis means that when you click on the image for enlarge, unless the original image is larger than the small image settings you will see the same image in the popup.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('50', '2', '测试三', '复制和删除属性的测试商品。\r\n<br /><br />\r\n\r\n本商品属性通过管理页面 ... 商品管理 ... 属性控制 ... 从 测试二 复制商品属性到 测试三。\r\n<br /><br />\r\n\r\n本商品没有附加图片。\r\n<br /><br />\r\n\r\n没有大图片在/large中\r\n<br /><br />\r\n\r\n点击放大时，除非原图比小图片大，否则弹出窗口中的图片是一样的。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('51', '1', 'Free Ship & Payment Virtual weight 10', 'Free Shipping and Payment\r\n<br /><br />\r\n\r\nThe Price is set to 25.00 ... but what makes it Free is that this product has been marked as:\r\n<br />\r\nProduct is Free: Yes\r\n<br /><br />\r\n\r\nThis would allow the product to be listed with a price, but the actual charge is $0.00\r\n<br /><br />\r\n\r\nThe weight is set to 10 but could be set to 0. What really makes it truely Free Shipping is that it has been marked to be Always Free Shipping.\r\n<br /><br />\r\n\r\nAlways Free shipping is set to: Yes<br />\r\nThis will not charge for shipping, but requres a shipping address.\r\n<br /><br />\r\n\r\nBecause there is no shipping and the price is 0, the Zen Cart Free Charge comes up for the payment module and the other payment modules vanish.\r\n<br /><br />\r\n\r\nYou can change the text on the Zen Cart Free Charge module to read as you would prefer.\r\n<br /><br />\r\n\r\nNote: if you add products that incur a charge or shipping charge, then the Zen Cart Free Charge payment module will vanish and the regular payment modules will show.', '', '0');
INSERT INTO `products_description` VALUES ('51', '2', '全免商品 重量10', '免费商品\r\n<br /><br />\r\n\r商品价格为25元 ... 免费是因为本商品设置中:\r\n<br />\r\n免费商品: 是\r\n<br /><br />\r\n\r\n这样商品有显示价格，但实际价格为0\r\n<br /><br />\r\n\r\n重量设置为10，也可以设置为0。免运费是因为设置了免运费为是\r\n<br /><br />\r\n\r\n免运费设置为: 是<br />\r\n不需要运费，但是需要送货地址。\r\n<br /><br />\r\n\r\n因为价格为0且免运费，Zen Cart将显示免费模块而不显示其它支付模块。\r\n<br /><br />\r\n\r\n可以自己修改Zen Cart免费模块的文字。\r\n<br /><br />\r\n\r\n说明: 如果添加了其它收费商品或需要运费，Zen Cart免费模块将不显示，而显示通用的支付模块。', '', '0');
INSERT INTO `products_description` VALUES ('52', '1', 'Free Ship & Payment Virtual', 'Product Price is set to 0\r\n<br /><br />\r\n\r\nPayment weight is set to 2 ...\r\n<br /><br />\r\n\r\nVirtual is ON ... this will skip shipping address\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('52', '2', '全免商品 虚拟商品', '商品价格为0\r\n<br /><br />\r\n\r\n重量设置为2 ...\r\n<br /><br />\r\n\r\n虚拟商品设置为是 ... 将不用输入配送地址\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('53', '1', 'Min and Units MIX', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON', '', '0');
INSERT INTO `products_description` VALUES ('53', '2', '最少数量及属性混合', '本商品设置最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为是', '', '0');
INSERT INTO `products_description` VALUES ('54', '1', 'Min and Units NOMIX', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF', '', '0');
INSERT INTO `products_description` VALUES ('54', '2', '最少购买和数量单位 非混合', '本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为否', '', '0');
INSERT INTO `products_description` VALUES ('55', '1', 'Min and Units MIX - Sale', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to ON\r\n<br /><br />\r\n\r\nThis product has been placed on Sale via Sale Maker', '', '0');
INSERT INTO `products_description` VALUES ('55', '2', '最少购买和数量单位 混合 - 促销', '本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为是\r\n<br /><br />\r\n\r\n本商品有促销', '', '0');
INSERT INTO `products_description` VALUES ('56', '1', 'Min and Units NOMIX - Sale', 'This product is purchased based on minimums and units.\r\n<br /><br />\r\n\r\nThe Min is set to 6 and the units is set to 3\r\n<br /><br />\r\n\r\nQuantity Minimums and Units are designed to more or less force the customer to make purchases of a Minimum Quantity ... and if need be, in Units.\r\n<br /><br />\r\n\r\nThis product can only be purchased if you buy at least 6 ... and after that in units of 3 ... 9, 12, 15, 18, etc.\r\n<br /><br />\r\n\r\nIf you do not purchase it in the right Quantity, you will not be able to checkout.\r\n<br /><br />\r\n\r\nWhen adding to the cart, the quantity box on the product_info page is \"smart\". It will adjust itself based on what is in the cart.\r\n<br /><br />\r\n\r\nThe Add to Cart buttons are also smart on New Products and Product Listing ... these also will adjust what is added to the cart.\r\n<br /><br />\r\n\r\nFor example: If there is 1 in the cart, the next use of Add to Cart will add 5 more to make the Minimum of 6. Add again and 3 more will be added to keep the Units correct.\r\n<br /><br />\r\n\r\nProduct Quantity Min/Unit Mix is for when a product has attributes.\r\n<br /><br />\r\n\r\nIf Mix is ON then a mix of attributes options may be used to make up the Quantity Minimum and Units. This means you can mix 1 blue, 3 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nIf the Mix is OFF then you may not mix 2 blue, 2 silver and 2 green to get 6.\r\n<br /><br />\r\n\r\nThis product has the Product Qty Min/Unit Mix set to OFF\r\n<br /><br />\r\n\r\nThis product has been put on Sale via Sale Maker.', '', '0');
INSERT INTO `products_description` VALUES ('56', '2', '最少购买和数量单位 非混合 - 促销', '本商品设置了最少购买数量和数量单位。\r\n<br /><br />\r\n\r\n最少购买数量设置为6，数量单位设置为3\r\n<br /><br />\r\n\r\n最少购买数量和数量单位，用于限制客户购买商品的数量，以及数量单位。\r\n<br /><br />\r\n\r\n本商品最少需要购买6件，且数量必须为 3 ... 9, 12, 15, 18, 等等。\r\n<br /><br />\r\n\r\n如果购买数量不正确，将无法结帐。\r\n<br /><br />\r\n\r\n添加到购物车时，商品页面的数量方框很\"聪明\"，会根据购物车中的商品自动调整。\r\n<br /><br />\r\n\r\n新进商品和商品列表下的添加到购物车按钮也很聪明 ... 也会自动调整添加到购物车中的商品。\r\n<br /><br />\r\n\r\n例如: 如果购物车中有1件商品，点击添加到购物车按钮，将添加5件以满足最少6件的购买数量。再次点添加按钮，将增加3件，以满足数量单位的要求。\r\n<br /><br />\r\n\r\n允许属性混合适用有属性的商品。\r\n<br /><br />\r\n\r\n如果允许混合，那么将允许不同属性的商品混合以达到最低购买数量和数量单位的要求。例如，可以混合1件蓝色、3件银色、2件绿色的来购买最少6件商品。\r\n<br /><br />\r\n\r\n如果不允许混合，那就不能混合2件蓝色、2件银色、2件绿色的来购买最低6件商品。\r\n<br /><br />\r\n\r\n本商品设置允许属性混合为否\r\n<br /><br />\r\n\r\n本商品有促销', '', '0');
INSERT INTO `products_description` VALUES ('57', '1', 'A Free Product - All', 'This is a free product where there are no prices at all.\r\n<br /><br />\r\n\r\nThe Always Free Shipping is also turned ON.\r\n<br /><br />\r\n\r\nIf this is bought separately, the Zen Cart Free Charge payment module will show if there is no charges on shipping.\r\n<br /><br />\r\n\r\nIf other products are purchased with a price or shipping charge, then the Zen Cart Free Charge payment module will not show and the shipping will be applied accordingly.', '', '0');
INSERT INTO `products_description` VALUES ('57', '2', '免费商品 - 所有', '免费商品，没有价格。\r\n<br /><br />\r\n\r\n免运费也打开。\r\n<br /><br />\r\n\r\n如果单独购买，Zen Cart免运费支付模块会显示是否免运费。\r\n<br /><br />\r\n\r\n如果购买了其它有价商品或有运费，那么Zen Cart不会显示免运费支付模块，需要支付相应运费。', '', '0');
INSERT INTO `products_description` VALUES ('59', '1', 'Hewlett Packard - by attributes', 'The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('59', '2', '惠普 - 属性定价', '本商品价格设置为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('60', '1', 'Hewlett Packard - Sale with Attributes on Sale', 'The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked to be discounted also.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('60', '2', '惠普 - 促销包括属性', '本商品价格设置为499.75元\r\n<br /><br />\r\n\r\n促销减价10%\r\n<br /><br />\r\n\r\n属性也设置为优惠。\r\n<br /><br />\r\n\r\n优惠前:<br />\r\n蓝色 +20元<br />\r\n黑色 +10元<br />\r\n白色 原价\r\n<br /><br />\r\n\r\n4M +50元<br />\r\n8M +75元<br />\r\n16M +100元\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('61', '1', 'Hewlett Packard - Sale with Attributes NOT on Sale', 'The Product Price is set to 499.75\r\n<br /><br />\r\n\r\nA Sale Maker Discount of 10% is applied.\r\n<br /><br />\r\n\r\nThe attribute are marked NOT to be discounted.\r\n<br /><br />\r\n\r\nPrior to the discount being applied:<br />\r\nBlue +$20.00<br />\r\nBlack +$10.00<br />\r\nWhite $0.00\r\n<br /><br />\r\n\r\n4 meg +$50.00<br />\r\n8 meg +$75.00<br />\r\n16 meg +$100.00\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('61', '2', '惠普 - 促销不包括属性', '本商品价格设置为499.75元\r\n<br /><br />\r\n\r\n促销减价10%\r\n<br /><br />\r\n\r\n属性设置为没有优惠。\r\n<br /><br />\r\n\r\n优惠前:<br />\r\n蓝色 +20元<br />\r\n黑色 +10元<br />\r\n白色 原价\r\n<br /><br />\r\n\r\n4M +50元<br />\r\n8M +75元<br />\r\n16M +100元\r\n<br /><br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('74', '1', 'Hewlett Packard - by attributes with Special% no SALE', 'The Product Price is set to 0.00 Special is set to 20%\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are, their prices before the Special discount is applied:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00\r\n<br /><br />\r\n\r\nThe Specials Price is a flat $100 discount. This $100 discount is applied to all attributes marked attributes_discounted Yes.', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('74', '2', '惠普 - 属性定价 特价 无促销', '本商品价格设置为0 特价设置为20%\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色 499.99元<br />\r\n黑色 519元<br />\r\n蓝色 539元\r\n<br /><br />\r\n\r\n特价为100元优惠。这100元优惠应用于所有设置为优惠的属性。', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('76', '1', 'TEST 25% special 10% Sale', 'Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('76', '2', '测试 25%特价 10%促销', '原价100元\r\n<br /><br />\r\n特价25%\r\n<br /><br />\r\n促销10%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('78', '1', 'TEST 25% special 10% Sale Attribute Priced', 'Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />\r\nSale is 10%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('78', '2', '测试 25%特价 10%促销 属性定价', '属性定价 - 商品价格设置为0\r\n<br /><br />\r\n所有属性含价格。\r\n\r\n<br /><br />\r\n原价0\r\n<br /><br />\r\n特价25%\r\n<br /><br />\r\n促销10%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('79', '1', 'TEST 25% Special Attribute Priced', 'Priced by Attributes - Product price is set to $0.00\r\n<br /><br />\r\nAll attributes are marked to make the price.\r\n\r\n<br /><br />\r\nProduct is $0\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('79', '2', '测试 25%特价 属性定价', '属性定价 - 商品价格设置为0\r\n<br /><br />\r\n所有属性含价格。\r\n\r\n<br /><br />\r\n原价0\r\n<br /><br />\r\n特价25%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('80', '1', 'TEST 25% Special', 'Product is $100.00\r\n<br /><br />\r\nSpecial is 25%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('80', '2', '测试 25%特价', '原价100元\r\n<br /><br />\r\n特价25%\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('82', '1', 'TEST $120 Sale -$5.00', 'Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('82', '2', '测试120元 促销-5元', '原价120元\r\n<br /><br />\r\n促销-5元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('83', '1', 'TEST $120 Special $90.00 Sale -$5.00', 'Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25%\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('83', '2', '测试120元 特价90元 促销-5元', '原价120元\r\n<br /><br />\r\n\r\n特价90元或25%\r\n<br /><br />\r\n\r\n促销-5元\r\n<br /><br />\r\n\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('84', '1', 'TEST $120', 'Product is $120\r\n<br /><br />\r\n\r\nThere is no special and no sale on this product.\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75<br />\r\n- Green $40\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nX-Small $40.00<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- None<br /> \r\n- Embossed Collector\'s Tin $40.00<br />\r\n- Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nFeatures: <br />\r\nQuality Design<br />\r\nCustom Handling<br />\r\nSame Day Shipping<br />\r\n<br /><br />\r\n\r\nNOTE: Select from below ... is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\n\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\n\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />\r\n\r\nNOTE: None is similar to Display Only, but this can be used when for when no option value is required.\r\n<br /><br />\r\n\r\nIts value is set the value to $0.00 and it is NOT marked Display Only. \r\n<br /><br />\r\n\r\nBecause its value is $0.00 if included in the Attributes Based Price on products Priced by Attributes, this Options group would not have any value included in the calculated price.\r\n<br /><br />\r\n\r\nNOTE: The Option Name: Featured is a READ ONLY Option Type\r\n<br /><br />\r\nThis can be for repeatative information or anything that occures on many products but functions like an attribute in setting up the information. It does not get added to the Shopping Cart nor display on the Order. They should be marked exclude from Attribute Based Price.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('84', '2', '测试120元', '原价120元\r\n<br /><br />\r\n\r\n无特价，无促销。\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元<br />\r\n- 绿色40元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n特小号40元<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 无<br /> \r\n- 礼物盒40元<br />\r\n- 收藏盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n特色: <br />\r\n设计精美<br />\r\n客户定制<br />\r\n当日发货<br />\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />\r\n\r\n说明: 无类似仅显示，但能用在非必选项中。\r\n<br /><br />\r\n\r\n价格设置为0，未选择仅显示。\r\n<br /><br />\r\n\r\n因为价格为0，如果用在属性基价给商品定价，本选项的值为0\r\n<br /><br />\r\n\r\n说明: 选项名: 特色 是只读选项\r\n<br /><br />\r\n用于显示商品信息，但不显示在购物车或订单中，不能用于计算属性基价。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('85', '1', 'TEST $120 Special $90', 'Product is $120\r\n<br /><br />\r\n\r\nThere is a $90.00 or 25% Special and no sale on this product.\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('85', '2', '测试120元 特价90元', '原价120元\r\n<br /><br />\r\n\r\n特价90元或25% 无促销。\r\n<br /><br />\r\n\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('88', '1', 'TEST $120 Sale Special $90 Skip', 'Product is $120\r\n<br /><br />\r\nSpecial is $105\r\n<br /><br />\r\nSale Price is $90 or 25% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('88', '2', '测试120元 促销 特价90元 无条件', '商品价格120元\r\n<br /><br />\r\n特价105元\r\n<br /><br />\r\n促销价90元或25% - 不含特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('89', '1', 'TEST $120 Sale 10% Special off Skip', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10% - Skip Products with Specials\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('89', '2', '测试120元 促销10% 无特价 无条件', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n促销10% - 不含特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('90', '1', 'TEST $120 Sale 10% Special', 'Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('90', '2', '测试120元 促销10% 有特价', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n促销 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('92', '1', 'TEST $120 Sale 10% Special off', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('92', '2', '测试120元 促销10% 无特价', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('93', '1', 'TEST $120 Special off Sale New Price $100', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('93', '2', '测试120元 无特价 促销价100元', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('94', '1', 'TEST $120 Special 25% Sale New Price $100', 'Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('94', '2', '测试120元 特价25% 促销价100元', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('95', '1', 'TEST $120 Special 25% Sale New Price $100 Skip Specials', 'Product is $120\r\n<br /><br />\r\nSpecial 25% or $90\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('95', '2', '测试120元 特价25% 促销价100元 不含特价', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('96', '1', 'TEST $120 Special off Sale New Price $100 Skip Specials', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is New Price $100\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nAttributes are not affected by the Sale Discount Price when a New Price is used.\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('96', '2', '测试120元 无特价 促销价100元 不含特价', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n新价格100元\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n采用新价格时，属性不受促销价影响\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('97', '1', 'TEST $120 Sale 10% Special - Apply to price', 'Product is $120\r\n<br /><br />\r\nSpecial is 25% or $90\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('97', '2', '测试120元 促销10% 有特价 - 原价基础上', '商品价格120元\r\n<br /><br />\r\n特价25%或90元\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('98', '1', 'TEST $120 Sale 10% Special off - Apply to Price', 'Product is $120\r\n<br /><br />\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('98', '2', '测试120元 促销10% 无特价 - 原价基础上', '商品价格120元\r\n<br /><br />\r\n无特价\r\n<br /><br />\r\n实际优惠 10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100号\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('99', '1', 'Free Shipping Product with Weight', 'This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 5\r\n<br /><br />\r\n\r\nWhile the weight is set to 5, it has the Always Free Shipping set to YES and the Free Shipping Module is installed.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('99', '2', '有重量免运费商品', '本商品免运费。\r\n<br /><br />\r\n\r\n重量设置为5\r\n<br /><br />\r\n\r\n重量设置为5，但是免运费设置为是，免运费模块已安装。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('100', '1', 'Hewlett Packard - by attributes SALE with Special', 'The Product Price is set to 0.00\r\n<br /><br />\r\n\r\nThe Product Priced by Attributes is set to YES\r\n<br /><br />\r\n\r\nThe attribute prices are defined without the price prefix of +\r\n<br /><br />\r\n\r\nThe Display Price is made up of the lowest attribute price from each Option Name group.\r\n<br /><br />\r\n\r\nIf there had been a Product Price, this would have been added together to the lowest attributes price from each of the Option Name groups to make up the display price.\r\n<br /><br />\r\n\r\nThe price prefix of the + is not used as we are not \"adding\" to the display price.\r\n<br /><br />\r\n\r\nThe Colors attributes are set for the discount to be applied, their prices before the discount are:<br />\r\nWhite $499.99<br />\r\nBlack $519.00<br />\r\nBlue $539.00<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('100', '2', '惠普- 属性允许优惠 有特价', '商品价格设置为0\r\n<br /><br />\r\n\r\n商品由属性定价设置为是\r\n<br /><br />\r\n\r\n属性价格定义不带前缀+\r\n<br /><br />\r\n\r\n显示价格根据每个选项组的最低属性价格决定。\r\n<br /><br />\r\n\r\n如果已有商品价格，显示价格将为现有基本价格加上每个最低属性价格。\r\n<br /><br />\r\n\r\n没有使用价格前缀+，因为不是在显示价格基础上增加。\r\n<br /><br />\r\n\r\n颜色属性设置为允许优惠，优惠前价格为:<br />\r\n白色499.99元<br />\r\n黑色519元<br />\r\n蓝色539元<br />', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '0');
INSERT INTO `products_description` VALUES ('101', '1', 'TEST $120 Sale 10% Special off', 'Product is Priced by Attributes.\r\n<br /><br />\r\n\r\nAttribute Option Group: Color and Size are used for pricing by marking these as Included in Base Price.\r\n<br /><br />\r\n\r\nGift Options has everything marked included in base price also, but because None is set to $0.00 that groups lowest price is $0.00 so it is not affecting the Base Price.\r\n<br /><br />\r\n\r\nIf None was not part of this group and you did not want to include those prices, you would mark all of the Gift Option Attributes to NOT be included in the Base Price.\r\n<br /><br />\r\n\r\nProduct Product is $0.00\r\n<br /><br />\r\n\r\nSpecial does not exist\r\n<br /><br />\r\nSale Price is 10%\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('101', '2', '测试120元 促销10% 无特价', '商品根据属性定价。\r\n<br /><br />\r\n\r\n属性选项: 颜色和尺寸包含在基价计算中\r\n<br /><br />\r\n\r\n礼物选项也包含在基价计算中，但因为 无 设置为0，这个选项的最低价格为0，所以不影响基价。\r\n<br /><br />\r\n\r\n如果 无 不是一个选项而你不想包含这些价格，可以设置所有的礼物选项属性不包含在基价计算中。\r\n<br /><br />\r\n\r\n商品价格为0\r\n<br /><br />\r\n\r\n无特价\r\n<br /><br />\r\n促销10%\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('104', '1', 'Hide Quantity Box', 'This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nThis will add 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nBecause the Image name is: 1_small.jpg<br />\r\nand stored in the /images directory ...\r\n<br /><br />\r\n\r\nThe other matching images will show:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\nThe matching large images from /images/large will show:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\nA matching image must begin with the same exact name as the Product Image and end in the same extension.\r\n<br /><br />\r\n\r\nThese will then auto load.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('104', '2', '隐藏数量方框', '本商品在添加到购物车时，不显示数量方框。\r\n<br /><br />\r\n\r\n点击添加到购物车时，将增加一件本商品到购物车中。\r\n<br /><br />\r\n\r\n说明: 如果将显示数量方框设置为否，除非最大购买数量同时设置为1，否则点击添加到购物车按钮时，会增加一件商品。如果最大购买数量设置为1，那么一个订单最多只能有一件本商品。\r\n<br /><br />\r\n\r\n因为图象名为: 1_small.jpg<br />\r\n且保存在/images 目录 ...\r\n<br /><br />\r\n\r\n将自动显示其它匹配的图片:\r\n<br /><br />\r\n/images/1_small_00.jpg<br />\r\n/images/1_small_02.jpg<br />\r\n/images/1_small_03.jpg\r\n<br /><br />\r\n\r\n也将显示匹配的位于 /images/large 目录的大图片:\r\n<br /><br />\r\n/images/large/1_small_00_LRG.jpg<br />\r\n/images/large/1_small_02_LRG.jpg<br />\r\n/images/large/1_small_03_LRG.jpg\r\n<br /><br />\r\n\r\n附加图片的文件名开头必须和商品图片的名称一致，后缀也必须一致。\r\n<br /><br />\r\n\r\n这些图片会自动显示。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('105', '1', 'A Maximum Sample of 1', 'This product only allows Quantity 1 because the Products Qty Maximum is set to 1.\r\n<br /><br />\r\n\r\nThis means there will be no Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 1 to the Shopping Cart.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('105', '2', '最多一件', '本商品只允许购买1件，因为商品最大购买数量设置为1。\r\n<br /><br />\r\n\r\n表明将不显示数量方框。\r\n<br /><br />\r\n\r\n添加商品按钮将不会添加超过1件本商品到购物车\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('106', '1', 'A Maximum Sample of 3', 'This product only allows Quantity 1 because the Products Qty Maximum is set to 3.\r\n<br /><br />\r\n\r\nThis means there will be a Quantity box.\r\n<br /><br />\r\n\r\nAdd button will not add more than a total of 3 to the Shopping Cart.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('106', '2', '最多三件', '本商品只允许购买3件，因为商品最大购买数量设置为3。\r\n<br /><br />\r\n\r\n表明将显示数量方框。\r\n<br /><br />\r\n\r\n添加商品按钮将不会添加超过3件本商品到购物车\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('107', '1', 'Free Shipping Product without Weight', 'This product has Free Shipping.\r\n<br /><br />\r\n\r\nThe weight is set to 0\r\n<br /><br />\r\n\r\nIt has the Always Free Shipping set to NO and the Free Shipping Module is installed but it will still ship for Free.\r\n<br /><br />\r\n\r\nIn the Configruation settings for Shipping/Packaging ... Order Free Shipping 0 Weight Status has been defined to be Free Shipping.\r\n<br /><br />\r\n\r\nNOTE: if that setting is changed, then this product will NOT ship for free, even though the weight is set to 0.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('107', '2', '无重量免运费商品', '本商品免运费。\r\n<br /><br />\r\n\r\n重量设置为0\r\n<br /><br />\r\n\r\n免运费设置为否，免运费模块已安装，仍然为免运费。\r\n<br /><br />\r\n\r\n在商店设置－配送参数 ... 零重量商品免运费设置为是。\r\n<br /><br />\r\n\r\n说明: 如果修改该设置，那么即使商品重量为零，也不会免运费。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('108', '1', 'A Sold Out Product', 'This product is Sold Out because the product quantity is <= 0\r\n<br /><br />\r\n\r\nBecause the Configuration Settings in Stock are defined that Sold Out Products are not disabled and Sold Out cannot be purchased, the add to cart buttons are changed to either the large or small Sold Out image.\r\n<br /><br />\r\n\r\nIf you change the Configuration Settings in Stock, then you will be able to purchase this product, even though it is Sold Out.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('108', '2', '缺货商品', '本商品缺货，因为商品数量 <= 0\r\n<br /><br />\r\n\r\n商店设置－库存选项中，缺货商品的状态为打开，允许结帐设置为否，添加商品按钮变成商品缺货图标。\r\n<br /><br />\r\n\r\n如果修改商店设置－库存选项，可以设置为即使缺货，也能购买。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('109', '1', 'Hide Quantity Box Methods', 'This product does not show the Quantity Box when Adding to the Shopping Cart.\r\n<br /><br />\r\n\r\nWhile Quantity Box Shows is set to YES, the Product Qty Max has been set to 1\r\n\r\nThis will add only 1 to the Shopping Cart when Add to Cart is hit.\r\n<br /><br />\r\n\r\nThe reason for this is that this is a download. As a download, there is never a reason to allow more than quantity 1 to be ordered.\r\n<br /><br />\r\n\r\nNOTE: If using Quantity Box Shows set to NO, unless Qty Max is also set to 1 then each time the Add to Cart is clicked the current cart quantity is updated by 1. If Qty Max is set to 1 then no more than 1 will be able to be added to the Shopping Cart per order.\r\n<br /><br />\r\n\r\nTwo methods are available to trigger the Hide Quantity Box.\r\n<br /><br />\r\n\r\nMethod 1: Set Quantity Box Shows to NO\r\n<br /><br />\r\n\r\nMethod 2: Set Qty Maximum to 1\r\n<br /><br />\r\n\r\nIn either case, you will only be able to add qty 1 to the shopping cart and the quantity box will not show.\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('109', '2', '隐藏数量方框的方法', '本商品加入购物车时，不显示数量方框。\r\n<br /><br />\r\n\r\n当显示数量方框设置为是时，商品的最大购买数量被设置为1。\r\n\r\n点击添加到购物车按钮时，只会添加一件商品。\r\n<br /><br />\r\n\r\n因为这是下载类商品，下载类商品不需要购买多件。\r\n<br /><br />\r\n\r\n说明: 如果将显示数量方框设置为否，除非最大购买数量同时设置为1，否则点击添加到购物车按钮时，会增加一件商品。如果最大购买数量设置为1，那么一个订单最多只能有一件本商品。\r\n<br /><br />\r\n\r\n有两种方法用于隐藏数量方框。\r\n<br /><br />\r\n\r\n方法一: 设置显示数量方框为否\r\n<br /><br />\r\n\r\n方法二: 设置最大购买数量为1\r\n<br /><br />\r\n\r\n两种方式都只能购买一件本商品，同时不显示数量方框。\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('110', '1', 'TEST $120 Sale -$5.00 Skip', 'Product is $120\r\n<br /><br />\r\nSale is -$5.00\r\n<br /><br />\r\nSpecials are skipped\r\n<br /><br />\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('110', '2', '测试120元 促销-5元 忽略特价', '原价120元\r\n<br /><br />\r\n促销-5元\r\n<br /><br />\r\n忽略特价\r\n<br /><br />\r\n\r\n属性:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('111', '1', 'TEST $120 Special $90.00 Sale -$5.00 Skip', 'Product is $120\r\n<br /><br />\r\n\r\nSpecial $90.00 or 25% - Specials are Skipped\r\n<br /><br />\r\n\r\nSale is -$5.00\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\nColor:<br />\r\n- Red $100.00<br />\r\n- Orange $50.00<br />\r\n- Yellow $75\r\n<br /><br />\r\n\r\nSize:<br />\r\nSelect from Below:<br />\r\nSmall $50.00<br />\r\nMedium $75.00<br />\r\nLarge $100.00\r\n<br /><br />\r\n\r\nGift Options:<br />\r\n- Dated Collector\'s Tin $50.00<br />\r\n- Autographed Memorabila Card $75.00<br />\r\n- Wrapping $100.00\r\n<br /><br />\r\n\r\nNOTE: Select from below is defined as a Display Only Attribute and NOT to be included in the base price. \r\n<br /><br />\r\nThe Display Only means, the customer may NOT select this option value. If they do not selected another option value, then the product cannot be added to the shopping cart.\r\n<br /><br />\r\nThe NOT included in base price means, if this product were priced by attributes, it would not be include. The reason for this is so that the lowest price of this group will be the Small at $50.00 and not Select from Below at $0.00\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('111', '2', '测试120元 特价90元 促销-5元 忽略特价', '原价120元\r\n<br /><br />\r\n\r\n特价90元或25% - 忽略特价\r\n<br /><br />\r\n\r\n促销-5元\r\n<br /><br />\r\n\r\n\r\nAttributes:<br />\r\n颜色:<br />\r\n- 红色100元<br />\r\n- 橙色50元<br />\r\n- 黄色75元\r\n<br /><br />\r\n\r\n尺寸:<br />\r\n请选择:<br />\r\n小号50元<br />\r\n中号75元<br />\r\n大号100元\r\n<br /><br />\r\n\r\n礼物选项:<br />\r\n- 礼物盒50元<br />\r\n- 亲笔签名卡75元<br />\r\n- 包装100元\r\n<br /><br />\r\n\r\n说明: 请选择... 是仅用于显示的选项，不计算基价。\r\n<br /><br />\r\n仅用于显示的选项，客户不能选择。只有选择另外一个选项，商品才能添加到购物车中。\r\n<br /><br />\r\n不计算基价表明，如果商品由属性定价，将不含该项。这样该组最低价格为小号50元而不是请选择的0元\r\n<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('112', '1', 'Test Two', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('112', '2', '测试二', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('113', '1', 'Test Four', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('113', '2', '测试四', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('114', '1', 'Test Five', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('114', '2', '测试五', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('115', '1', 'Test One', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('115', '2', '测试一', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('116', '1', 'Test Eight', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('116', '2', '测试八', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('117', '1', '<strong>Test<br /> Three</strong>', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('117', '2', '测试三', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('118', '1', 'Test Ten', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('118', '2', '测试十', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('119', '1', 'Test Six', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('119', '2', '测试六', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('120', '1', 'Test Seven', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('120', '2', '测试七', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('121', '1', 'Test Twelve', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('121', '2', '测试十二', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('122', '1', 'Test Nine', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('122', '2', '测试九', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('123', '1', 'Test Eleven', 'This is a test product to fill this category with more 12 randomly entered products to envoke the split page results on products that are not linked, have no specials, sales, etc.', '', '0');
INSERT INTO `products_description` VALUES ('123', '2', '测试十一', '测试商品，当一个分类中商品数超过12时，分页显示未链接、无特价、无促销的商品等。', '', '0');
INSERT INTO `products_description` VALUES ('127', '1', 'Normal Product', '<p>This is a normal product priced at $15</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `products_description` VALUES ('127', '2', '普通商品', '<p>这是普通商品15元</p><p>设置了数量优惠。</p><p>数量优惠在商品价格管理菜单中设置。</p>', '', '0');
INSERT INTO `products_description` VALUES ('130', '1', 'Special Product', '<p>This is a Special product priced at $15 with a $10 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `products_description` VALUES ('130', '2', '特价商品', '<p>特价商品，原价15元，特价10元</p><p>批量优惠已设置，将在特价基础上优惠。</p><p>数量优惠在商品价格管理菜单中设置。</p>', '', '0');
INSERT INTO `products_description` VALUES ('131', '1', 'Per word - required', '<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.05 per word with 3 words Free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>', '', '0');
INSERT INTO `products_description` VALUES ('131', '2', '按词收费 - 必填', '<p>商品由属性定价</p><p>选项名的第一行设置为文本</p><p>属性设置为必填</p><p>价格为每词0.05元</p><p>选项名的第二行设置为文本</p><p>属性设置为必填</p><p>价格为每词0.05元，前3个词免费</p><p>颜色为单选，缺省为红色。</p>', '', '0');
INSERT INTO `products_description` VALUES ('132', '1', 'Golf Clubs', '<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>', '', '0');
INSERT INTO `products_description` VALUES ('132', '2', '高尔夫球杆', '<p>商品价格设置为0，商品重量设置为1</p><p>同时设置了属性定价</p><p>由属性定价，每根球杆14.45元，重量加1。</p><p>这样每增加一根球杆，商品重量增加1克。</p><p>在商品简介、购物车、订单、电子邮件及帐号记录中球杆都按照属性排序。</p>', '', '0');
INSERT INTO `products_description` VALUES ('133', '1', 'Multiple Downloads', '<p>This product is set up to have multiple downloads.</p><p>The Product Price is $49.99</p><p>The attributes are setup with two Option Names, one for each download to allow for two downloads at the same time.</p><p>The first Download is listed under:</p><p>Option Name: Version<br />Option Value: Download Windows - English<br />Option Value: Download Windows - Spanish<br />Option Value: DownloadMAC - English<br /></p><p>The second Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value:MS Word- English</p>', '', '0');
INSERT INTO `products_description` VALUES ('133', '2', '多个下载', '<p>本商品设置为包含多个下载。</p><p>本商品价格49.99元</p><p>属性设置为两个选项名称，每个下载一个，可以同时下载两个文件。</p><p>第一个下载是:</p><p>选项名: 版本<br />选项值: 下载Windows - 英语<br />选项值: 下载Windows - 西班牙语<br />选项值: 下载MAC - 英语<br /></p><p>第二个下载是:</p><p>选项名: 文档<br />选项值: PDF - 英语<br />选项值: MS Word- 英语</p>', '', '0');
INSERT INTO `products_description` VALUES ('134', '1', 'Per letter - required', '<p>Product is priced by attribute</p><p>The Option Name Line 1 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter</p><p>The Option Name Line2 is setup as Text</p><p>The attribute is added to the product as Required</p><p>The pricing is $0.02 per letter with 3 letters free</p><p>The Colors are set up as radio buttons and Red is the Default.</p>', '', '0');
INSERT INTO `products_description` VALUES ('134', '2', '按字收费 - 必填', '<p>商品由属性定价</p><p>选项名的第一行设置为文本</p><p>属性设置为必填</p><p>价格为每字0.02元</p><p>选项名的第二行设置为文本</p><p>属性设置为必填</p><p>价格为每字0.02元，前3个字免费</p><p>颜色为单选，缺省为红色。</p>', '', '0');
INSERT INTO `products_description` VALUES ('154', '1', 'Rope', '<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>', '', '0');
INSERT INTO `products_description` VALUES ('154', '2', '绳子', '<p>绳子按尺或码出售，最少购买10尺或10码</p><p>商品价格1元<br />商品重量为0</p><p>选项值:<br />每尺原价，重0.25克<br />每码加1.5元，重0.75克</p>', '', '0');
INSERT INTO `products_description` VALUES ('155', '1', 'Price Factor', '<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor</p><p>Red is $10<br />Yellow is $20<br />Green is $30</p><p>This makes the total price $10 + the price factor of the attribute.</p>', '', '0');
INSERT INTO `products_description` VALUES ('155', '2', '价格因素', '<p>本商品价格为10元</p><p>属性中设置了价格因素</p><p>红色10元<br />黄色20元<br />绿色30元</p><p>因此，最终价格为 商品价格 + 价格因素 * 商品价格</p>', '', '0');
INSERT INTO `products_description` VALUES ('156', '1', 'Price Factor Offset', '<p>This product is priced at $10.00</p><p>The attributes are priced using the Price Factor and Price Factor Offset</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price $10 + the price factor * $10 - price factor offset * $10 for the attributes.</p>', '', '0');
INSERT INTO `products_description` VALUES ('156', '2', '价格因素调整', '<p>本商品价格为10元</p><p>属性中设置了价格因素和价格因素调整</p><p>红色为10元 (0元)<br />黄色为20元 (10元)<br />绿色为30元 (20元)</p><p>价格因素调整设置为1，最终价格为 商品价格 + 价格因素 * 商品价格 - 价格因素调整 * 商品价格</p>', '', '0');
INSERT INTO `products_description` VALUES ('157', '1', 'Price Factor Offset by Attribute', '<p>This product is priced at $10.00</p><p>It is marked Price by Attributes.</p><p>The attributes are priced using the Price Factor and Price Factor Offset. </p><p>The actual Product Price is used just to compute the Price Factor.</p><p>Red is $10 ($0)<br />Yellow is $20 ($10)<br />Green is $30 ($20)</p><p>The Price Factor Offset is set to 1 to take out the price of the Product Price then make the total price the price factor * $10 - price factor offset * $10 for the attributes.</p>', '', '0');
INSERT INTO `products_description` VALUES ('157', '2', '属性的价格因素调整', '<p>本商品价格为10元</p><p>商品根据属性定价。</p><p>属性由价格因素、价格因素调整定价。</p><p>商品价格仅用于计算价格因素。</p><p>红色为10元 (0元)<br />黄色为20元 (10元)<br />绿色为30元 (20元)</p><p>价格因素调整设置为1，最终价格为 商品价格 + 价格因素 * 商品价格 - 价格因素调整 * 商品价格</p>', '', '0');
INSERT INTO `products_description` VALUES ('158', '1', 'One Time Charge', '<p>This product is $45 with a one time charge set on the colors.</p><p>Red $5<br />Yellow is $10<br />Green is $15</p>', '', '0');
INSERT INTO `products_description` VALUES ('158', '2', '基本费', '<p>本商品设置为颜色加45元。</p><p>红色另加5元<br />黄色另加10元<br />绿色另加15元</p>', '', '0');
INSERT INTO `products_description` VALUES ('159', '1', 'Attribute Quantity Discount', '<p>Attribute qty discounts are attribute prices based on qty ordered.</p><p>Enter them as: </p><p>Red:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>Yellow<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>Green:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>A table will also show on the page to display these discounts as well as an indicator that qty discounts are available.</p>', '', '0');
INSERT INTO `products_description` VALUES ('159', '2', '属性批量优惠', '<p>属性批量优惠是根据购买的商品数量设置不同的优惠。</p><p>演示设置: </p><p>红色:<br />3:10.00,6:9.00,9:8.00,12:7.00,15:6.00</p><p>黄色<br />3:10.50,6:9.50,9:8.50,12:7.50,15:6.50</p><p>绿色:<br />3:11.00,6:10.00,9:9.00,12:8.00,15:7.00</p><p>优惠金额、批量的数量将以表格形式显示。</p>', '', '0');
INSERT INTO `products_description` VALUES ('160', '1', 'Golf Clubs', '<p>Products Price is set to 0 and Products Weight is set to 1</p><p>This is marked Price by Attributes</p><p>This is priced by attribute at 14.45 per club with an added weight of 1 on the attributes.</p><p>This will make the shipping weight 1lb for the product plus 1lb for each attribute (club) added.</p><p>The attributes are sorted so the clubs read in order on the Product Info, Shopping Cart, Order, Email and Account History.</p>', '', '0');
INSERT INTO `products_description` VALUES ('160', '2', '高尔夫球杆', '<p>商品价格设置为0，重量为1</p><p>同时设置了属性定价</p><p>每根球杆14.45元，重量加1。</p><p>这样每增加一根球杆，商品重量增加1克。</p><p>在商品简介、购物车、订单、电子邮件及帐号记录中球杆都按照属性排序。</p>', '', '0');
INSERT INTO `products_description` VALUES ('165', '1', 'Rope', '<p>Rope is sold by foot or yard with a minimum length of 10 feet or 10 yards</p><p>Product Price of $1.00<br />Product Weight of 0</p><p>Option Values:<br />per foot $0.00 weight .25<br />per yard $1.50 weight .75</p>', '', '0');
INSERT INTO `products_description` VALUES ('165', '2', '绳子', '<p>绳子按尺或码出售，最少购买10尺或10码</p><p>商品价格1元<br />商品重量为0</p><p>选项值:<br />每尺原价，重0.25克<br />每码加1.5元，重0.75克</p>', '', '0');
INSERT INTO `products_description` VALUES ('166', '1', 'Russ Tippins Band - The Hunter', '', '', '0');
INSERT INTO `products_description` VALUES ('166', '2', 'Russ Tippins Band - The Hunter', '', '', '0');
INSERT INTO `products_description` VALUES ('167', '1', 'Test Document', 'This is a test document', '', '0');
INSERT INTO `products_description` VALUES ('167', '2', '测试文档', '这是测试文档', '', '0');
INSERT INTO `products_description` VALUES ('168', '1', 'Sample of Product General Type', 'Product General Type are your regular products.\r\n\r\nThere are no special needs or layout issues to work with.', '', '0');
INSERT INTO `products_description` VALUES ('168', '2', '商品样品 普通类型', '普通商品类型用于普通商品。\r\n\r\n不需要特别修改。', '', '0');
INSERT INTO `products_description` VALUES ('169', '1', 'Sample of Product Music Type', 'The Product Music Type is specially designed for music media.\r\n\r\nThis can offer a lot more flexibility than the Product General.', '', '0');
INSERT INTO `products_description` VALUES ('169', '2', '商品样品 音乐类型', '音乐类型用于音乐类商品。\r\n\r\n比普通商品更灵活。', '', '0');
INSERT INTO `products_description` VALUES ('170', '1', 'Sample of Document General Type', 'Document General Type is used for Products that are actually Documents.\r\n\r\nThese cannot be added to the cart but can be configured for the Document Sidebox. If your Document Sidebox is not showing, go to the Layout Controller and turn it on for your template.', '', '0');
INSERT INTO `products_description` VALUES ('170', '2', '文档样品 普通类型', '文档普通类型用于文档类商品。\r\n\r\n不能购买，可以显示在文档边框中。如果需要显示文档边框，可以在 工具－外观控制 中打开。', '', '0');
INSERT INTO `products_description` VALUES ('171', '1', 'Sample of Document Product Type', 'Document Product Type is used for Documents that are also available for sale. <br /><br />You might wish to display brief peices of the Document then offer it for sale. <br /><br />This Product Type is also handy for downloadable Documents or Documents available either on CD or by download. <br /><br />The Document Product Type could be used in the Document Sidebox or the Categories Sidebox depending on how you configure its master categories id. <br /><br />This product has also been added as a linked product to the Document Category. This will allow it to show in both the Category and Document Sidebox. While not marked specifically for the master product type id related to the Product Types, it now is in a Product Type set for Document General so it will show in both boxes.', '', '0');
INSERT INTO `products_description` VALUES ('171', '2', '文档样品 商品类型', '文档商品类型用于可出售类文档。<br /><br />可以显示部分文档内容并出售。<br /><br />本商品类型也可以用于下载类文档。<br /><br />文档商品类型可以用在文档边框或商品分类边框，取决于主分类id的设置。<br /><br />本商品也链接到文档分类目录下，这样可以同时显示在文档分类边框和商品分类边框。', '', '0');
INSERT INTO `products_description` VALUES ('172', '1', 'Sample of Product Free Shipping Type', '<p>Product Free Shipping can be setup to highlight the Free Shipping aspect of the product. <br /><br />These pages include a Free Shipping Image on them. <br /><br />You can define the ALWAYS_FREE_SHIPPING_ICON in the language file. This can be Text, Image, Text/Image Combo or nothing. <br /><br />The weight does not matter on Always Free Shipping if you set Always Free Shipping to Yes. <br /><br />Be sure to have the Free Shipping Module Turned on! Otherwise, if this is the only product in the cart, it will not be able to be shipped. <br /><br />Notice that this is defined with a weight of 5lbs. But because of the Always Free Shipping being set to Y there will be no shipping charges for this product. <br /><br />You do not have to use the Product Free Shipping product type just to use Always Free Shipping. But the reason you may want to do this is so that the layout of the Product Free Shipping product info page can be layout specifically for the Free Shipping aspect of the product. <br /><br />This includes a READONLY attribute for Option Name: Shipping and Option Value: Free Shipping Included. READONLY attributes do not show on the options for the order.</p>', '', '0');
INSERT INTO `products_description` VALUES ('172', '2', '商品样品 免运费', '<p>商品可以设置为免运费<br /><br />将显示免运费图标。<br /><br />在语言文件中定义ALWAYS_FREE_SHIPPING_ICON。可以为文字、图片、文字/图片混合或者什么也不显示。<br /><br />设置免运费时，商品重量多少都没关系。<br /><br />确认免运费配送模块打开! 否则，如果只有免运费商品，将无法结帐。<br /><br />注意本商品重量5克。由于设置为免运费，所以运费为零。<br /><br />不必使用免运费商品类型，只要设置商品为免运费。如果你想特别设置免运费类商品的显示页面，才需要使用免运费商品类型。<br /><br />包括一个只读选项: 运费，选项值: 免运费。只读选项不在订单中显示。</p>', '', '0');
INSERT INTO `products_description` VALUES ('173', '1', 'Book', 'This Book is sold as a Book that is shipped to the customer or as a Download.<br /><br />\r\n\r\nOnly the Book itself is on Special. The Downloadable versions are not on Special.<br /><br />\r\n\r\nThis Book under Categories/Products is set to:<br /><br />\r\n\r\nProduct Priced by Attributes: Yes<br />\r\nProducts Price: 0.00<br />\r\nWeight: 0<br /><br />\r\n\r\nAn Option Name of: Version (type is dropdown)<br /><br />\r\nOption Values of: Book Hard Cover<br /><br />\r\nDownload: MAC English<br /><br />\r\nDownload: Windows English<br /><br />\r\n\r\nThe Attributes are set as:<br />\r\nOption Name: Version<br />\r\nOption Value: Book Hard Cover<br />\r\nPrice Prefix is blank<br />\r\nPrice: 52.50<br />\r\nWeight Prefix is blank\r\nWeight: 1<br />\r\nInclude in Base Price When Priced by Attributes Yes<br />\r\nApply Discounts Used by Product Special/Sale: Yes<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: MAC English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nOption Name: Version<br />\r\nOption Value: Download: Windows: English<br />\r\nPrice Prefix is blank<br />\r\nPrice: 20.00<br />\r\nWeight: 0<br />\r\nInclude in Base Price When Priced by Attributes No<br />\r\nApply Discounts Used by Product Special/Sale: No<br /><br />\r\n\r\nIt is on Special for $47.50<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('173', '2', '书', '本书可以邮寄或下载。<br /><br />\r\n\r\n邮寄有特价，下载无特价。<br /><br />\r\n\r\n在分类/商品中设置为:<br /><br />\r\n\r\n商品由属性定价: 是<br />\r\n商品价格: 0元<br />\r\n重量: 0<br /><br />\r\n\r\n选项名: 版本 (下拉菜单)<br /><br />\r\n选项值: 硬壳封面<br /><br />\r\n下载: MAC 英语<br /><br />\r\n下载: Windows 英语<br /><br />\r\n\r\n属性设置为:<br />\r\n选项名: 版本<br />\r\n选项值: 硬壳封面<br />\r\n价格前缀为空<br />\r\n价格: 52.50元<br />\r\n重量前缀为空<br />\r\n重量: 1<br />\r\n由属性定价时包含在基价中: 是<br />\r\n应用优惠于特价/促销: 是<br /><br />\r\n\r\n选项名: 版本<br />\r\n选项值: 下载: MAC 英语<br />\r\n价格前缀为空<br />\r\n价格: 20元<br />\r\n重量: 0\r\n由属性定价时不包含在基价中<br />\r\n由属性定价时不包含在基价中: 否<br /><br />\r\n\r\n选项名: 版本<br />\r\n选项值: 下载: Windows: 英语<br />\r\n价格前缀为空<br />\r\n价格: 20元<br />\r\n重量: 0<br />\r\n由属性定价时包含在基价中: 否<br />\r\n应用优惠于特价/促销: 否<br /><br />\r\n\r\n特价47.50元<br /><br />', '', '0');
INSERT INTO `products_description` VALUES ('174', '1', 'A Call No Price', 'This is a Call for Price product with no price<br />\r\n\r\nThis should show as having a price, special price but then be Call for Price. This means you cannot buy it.\r\n<br />', '', '0');
INSERT INTO `products_description` VALUES ('174', '2', '价格面议 无价格', '价格面议商品，无价格<br />\r\n\r\n本商品显示原价、特价，最后是价格面议。不能购买本商品。\r\n<br />', '', '0');
INSERT INTO `products_description` VALUES ('175', '1', 'Qty Discounts by 1', '<p>This is a normal product priced at $60</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>', '', '0');
INSERT INTO `products_description` VALUES ('175', '2', '递增批量优惠', '<p>这是普通商品，价格60元</p><p>批量优惠基于原价。</p><p>批量优惠在商品价格管理中设置。</p><p>每多购买一件商品，有不同的优惠</p><p>说明: 属性不继承批量优惠。</p><p>属性继承特价或促销。可以设置每个属性，包含商品的特价或促销。</p><p>红色100元，设置为继承特价但不继承批量优惠。</p><p>绿色100元，设置为不继承特价，不继承批量优惠。</p>', '', '0');
INSERT INTO `products_description` VALUES ('176', '1', 'Normal Product by the dozen', '<p>This is a normal product priced at $100</p><p>There are quantity discounts setup which will be discounted from the Products Price by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `products_description` VALUES ('176', '2', '普通商品12件', '<p>这是普通商品，价格100元</p><p>批量优惠基于原价，数量12件。</p><p>批量优惠在商品价格管理中设置。</p>', '', '0');
INSERT INTO `products_description` VALUES ('177', '1', 'Special Product by the dozen', '<p>This is a Special product priced at $100 with a $75 Special</p><p>There are quantity discounts setup which will be discounted from the Special Price discounted by the dozen.</p><p>Discounts are added on the Products Price Manager.</p>', '', '0');
INSERT INTO `products_description` VALUES ('177', '2', '特价商品12件', '<p>这是特价商品，原价100元，特价75元</p><p>批量优惠基于特价，数量12件。</p><p>批量优惠在商品价格管理中设置。</p>', '', '0');
INSERT INTO `products_description` VALUES ('178', '1', 'Qty Discounts by 1 Special', '<p>This is a normal product priced at $60 with a special of $50</p><p>There are quantity discounts setup which will be discounted from the Products Price.</p><p>Discounts are added on the Products Price Manager.</p><p>The Discounts are offered in increments of 1.</p><p>Note: Attributes do not inherit the Discount Qty discounts.</p><p>Attributes will inherit Discounts from Specials or sales. This can be customized per attribute by marking the Attribute to Include Product Price Special or Sale Discounts.</p><p>Red is $100.00 and marked to include the Price to Special discount but will not inherit the Discount Qty discount.</p><p>Green is $100 and marked not to include the Price to Special discount and will not inherit the Discount Qty discount.</p>', '', '0');
INSERT INTO `products_description` VALUES ('178', '2', '递增批量优惠 有特价', '<p>这是普通商品，价格60元，特价50元</p><p>批量优惠基于原价。</p><p>批量优惠在商品价格管理中设置。</p><p>每多购买一件商品，有不同的优惠</p><p>说明: 属性不继承批量优惠。</p><p>属性继承特价或促销。可以设置每个属性，包含商品的特价或促销。</p><p>红色100元，设置为继承特价但不继承批量优惠。</p><p>绿色100元，设置为不继承特价，不继承批量优惠。</p>', '', '0');
INSERT INTO `products_description` VALUES ('179', '1', 'Single Download', '<p>This product is set up to have a single download.</p><p>The Product Price is $39.99</p><p>The attributes are setup with 1 Option Name, for the download to allow for one download but of various types.</p><p>The Download is listed under:</p><p>Option Name: Documentation<br />Option Value: PDF - English<br />Option Value: MS Word - English</p>', '', '0');
INSERT INTO `products_description` VALUES ('179', '2', '单个下载', '<p>本商品设置为单个下载。</p><p>商品价格39.99元</p><p>属性含1个选项名，允许多种类型的下载。</p><p>下载为:</p><p>选项名: 文档<br />选项值: PDF - 英语<br />选项值: MS Word - 英语</p>', '', '0');

-- ----------------------------
-- Table structure for `products_discount_quantity`
-- ----------------------------
DROP TABLE IF EXISTS `products_discount_quantity`;
CREATE TABLE `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_discount_quantity
-- ----------------------------
INSERT INTO `products_discount_quantity` VALUES ('4', '127', '12', '10.0000');
INSERT INTO `products_discount_quantity` VALUES ('3', '127', '9', '8.0000');
INSERT INTO `products_discount_quantity` VALUES ('2', '127', '6', '7.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '8', '3', '10.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '127', '3', '5.0000');
INSERT INTO `products_discount_quantity` VALUES ('4', '130', '12', '10.0000');
INSERT INTO `products_discount_quantity` VALUES ('3', '130', '9', '8.0000');
INSERT INTO `products_discount_quantity` VALUES ('2', '130', '6', '7.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '130', '3', '5.0000');
INSERT INTO `products_discount_quantity` VALUES ('9', '175', '9', '10.0000');
INSERT INTO `products_discount_quantity` VALUES ('8', '175', '8', '9.0000');
INSERT INTO `products_discount_quantity` VALUES ('7', '175', '7', '8.0000');
INSERT INTO `products_discount_quantity` VALUES ('6', '175', '6', '7.0000');
INSERT INTO `products_discount_quantity` VALUES ('5', '175', '5', '6.0000');
INSERT INTO `products_discount_quantity` VALUES ('4', '175', '4', '5.0000');
INSERT INTO `products_discount_quantity` VALUES ('3', '175', '3', '4.0000');
INSERT INTO `products_discount_quantity` VALUES ('2', '175', '2', '3.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '175', '10', '11.0000');
INSERT INTO `products_discount_quantity` VALUES ('3', '178', '3', '4.0000');
INSERT INTO `products_discount_quantity` VALUES ('2', '178', '2', '3.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '178', '10', '11.0000');
INSERT INTO `products_discount_quantity` VALUES ('6', '177', '36', '30.0000');
INSERT INTO `products_discount_quantity` VALUES ('5', '176', '48', '30.0000');
INSERT INTO `products_discount_quantity` VALUES ('4', '176', '36', '20.0000');
INSERT INTO `products_discount_quantity` VALUES ('3', '176', '24', '10.0000');
INSERT INTO `products_discount_quantity` VALUES ('2', '176', '12', '5.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '176', '60', '40.0000');
INSERT INTO `products_discount_quantity` VALUES ('5', '177', '24', '20.0000');
INSERT INTO `products_discount_quantity` VALUES ('4', '177', '12', '10.0000');
INSERT INTO `products_discount_quantity` VALUES ('3', '177', '6', '5.0000');
INSERT INTO `products_discount_quantity` VALUES ('2', '177', '60', '50.0000');
INSERT INTO `products_discount_quantity` VALUES ('1', '177', '48', '40.0000');
INSERT INTO `products_discount_quantity` VALUES ('4', '178', '4', '5.0000');
INSERT INTO `products_discount_quantity` VALUES ('5', '178', '5', '6.0000');
INSERT INTO `products_discount_quantity` VALUES ('6', '178', '6', '7.0000');
INSERT INTO `products_discount_quantity` VALUES ('7', '178', '7', '8.0000');
INSERT INTO `products_discount_quantity` VALUES ('8', '178', '8', '9.0000');
INSERT INTO `products_discount_quantity` VALUES ('9', '178', '9', '10.0000');

-- ----------------------------
-- Table structure for `products_notifications`
-- ----------------------------
DROP TABLE IF EXISTS `products_notifications`;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for `products_options`
-- ----------------------------
DROP TABLE IF EXISTS `products_options`;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_options
-- ----------------------------
INSERT INTO `products_options` VALUES ('1', '1', 'Color', '10', '2', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('1', '2', '颜色', '10', '2', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('2', '1', 'Size', '20', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('2', '2', '尺寸', '20', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('3', '1', 'Model', '30', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('3', '2', '型号', '30', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('4', '1', 'Memory', '50', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('4', '2', '内存', '50', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('5', '1', 'Version', '40', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('5', '2', '版本', '40', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('6', '1', 'Media Type', '60', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('6', '2', '媒体', '60', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('7', '1', 'Logo Back', '310', '4', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('7', '2', '背面图标', '310', '4', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('8', '1', 'Logo Front', '300', '4', '32', 'You may upload your own image file(s)', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('8', '2', '正面图标', '300', '4', '32', '您可以上传自己的图像', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('9', '1', 'Line 2', '410', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('9', '2', '第二行', '410', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('10', '1', 'Line 1', '400', '1', '64', 'Enter your text up to 64 characters, punctuation and spaces', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('10', '2', '第一行', '400', '1', '64', '输入的文字最多64个字符、标点符号或空格', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('11', '1', 'Line 3', '420', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('11', '2', '第三行', '420', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('12', '1', 'Line 4', '430', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('12', '2', '第四行', '430', '1', '64', '', '40', '5', '0', '1');
INSERT INTO `products_options` VALUES ('13', '1', 'Gift Options', '70', '3', '32', 'Special Option Options Available:', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('13', '2', '礼物', '70', '3', '32', '选项:', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('14', '1', 'Amount', '200', '2', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('14', '2', '金额', '200', '2', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('15', '1', 'Features', '700', '5', '32', '&nbsp;', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('15', '2', '特色', '700', '5', '32', '&nbsp;', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('16', '1', 'Irons', '800', '3', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('16', '2', '球杆', '800', '3', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('17', '1', 'Documentation', '45', '0', '32', null, '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('17', '2', '资料', '45', '0', '32', null, '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('18', '1', 'Length', '70', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('18', '2', '长度', '70', '0', '32', '', '32', '5', '0', '1');
INSERT INTO `products_options` VALUES ('19', '1', 'Shipping', '600', '5', '32', '', '32', '0', '0', '1');
INSERT INTO `products_options` VALUES ('19', '2', '交货', '600', '5', '32', '', '32', '0', '0', '1');

-- ----------------------------
-- Table structure for `products_options_types`
-- ----------------------------
DROP TABLE IF EXISTS `products_options_types`;
CREATE TABLE `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';

-- ----------------------------
-- Records of products_options_types
-- ----------------------------
INSERT INTO `products_options_types` VALUES ('0', '下拉');
INSERT INTO `products_options_types` VALUES ('1', '文本');
INSERT INTO `products_options_types` VALUES ('2', '单选');
INSERT INTO `products_options_types` VALUES ('3', '多选');
INSERT INTO `products_options_types` VALUES ('4', '文件');
INSERT INTO `products_options_types` VALUES ('5', '只读');

-- ----------------------------
-- Table structure for `products_options_values`
-- ----------------------------
DROP TABLE IF EXISTS `products_options_values`;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_options_values
-- ----------------------------
INSERT INTO `products_options_values` VALUES ('0', '1', 'TEXT', '0');
INSERT INTO `products_options_values` VALUES ('0', '2', '文字', '0');
INSERT INTO `products_options_values` VALUES ('1', '1', '4 mb', '10');
INSERT INTO `products_options_values` VALUES ('1', '2', '4 mb', '10');
INSERT INTO `products_options_values` VALUES ('2', '1', '8 mb', '20');
INSERT INTO `products_options_values` VALUES ('2', '2', '8MB', '20');
INSERT INTO `products_options_values` VALUES ('3', '1', '16 mb', '30');
INSERT INTO `products_options_values` VALUES ('3', '2', '16MB', '30');
INSERT INTO `products_options_values` VALUES ('4', '1', '32 mb', '40');
INSERT INTO `products_options_values` VALUES ('4', '2', '32MB', '40');
INSERT INTO `products_options_values` VALUES ('5', '1', 'Value', '10');
INSERT INTO `products_options_values` VALUES ('5', '2', '超值', '10');
INSERT INTO `products_options_values` VALUES ('6', '1', 'Premium', '20');
INSERT INTO `products_options_values` VALUES ('6', '2', '高级', '20');
INSERT INTO `products_options_values` VALUES ('7', '1', 'Deluxe', '30');
INSERT INTO `products_options_values` VALUES ('7', '2', '豪华', '30');
INSERT INTO `products_options_values` VALUES ('8', '1', 'PS/2', '20');
INSERT INTO `products_options_values` VALUES ('8', '2', 'PS/2', '20');
INSERT INTO `products_options_values` VALUES ('9', '1', 'USB', '10');
INSERT INTO `products_options_values` VALUES ('9', '2', 'USB', '10');
INSERT INTO `products_options_values` VALUES ('10', '1', 'Download: Windows - English', '10');
INSERT INTO `products_options_values` VALUES ('10', '2', '下载: Windows - 英文', '10');
INSERT INTO `products_options_values` VALUES ('13', '1', 'Box: Windows - English', '1000');
INSERT INTO `products_options_values` VALUES ('13', '2', '盒装: Windows - 英文', '1000');
INSERT INTO `products_options_values` VALUES ('14', '1', 'DVD/VHS Combo Pak', '30');
INSERT INTO `products_options_values` VALUES ('14', '2', 'DVD/VHS', '30');
INSERT INTO `products_options_values` VALUES ('15', '1', 'Blue', '50');
INSERT INTO `products_options_values` VALUES ('15', '2', '蓝色', '50');
INSERT INTO `products_options_values` VALUES ('16', '1', 'Red', '10');
INSERT INTO `products_options_values` VALUES ('16', '2', '红色', '10');
INSERT INTO `products_options_values` VALUES ('17', '1', 'Yellow', '30');
INSERT INTO `products_options_values` VALUES ('17', '2', '黄色', '30');
INSERT INTO `products_options_values` VALUES ('18', '1', 'Medium', '30');
INSERT INTO `products_options_values` VALUES ('18', '2', '中号', '30');
INSERT INTO `products_options_values` VALUES ('19', '1', 'X-Small', '10');
INSERT INTO `products_options_values` VALUES ('19', '2', '超小', '10');
INSERT INTO `products_options_values` VALUES ('20', '1', 'Large', '40');
INSERT INTO `products_options_values` VALUES ('20', '2', '大号', '40');
INSERT INTO `products_options_values` VALUES ('21', '1', 'Small', '20');
INSERT INTO `products_options_values` VALUES ('21', '2', '小号', '20');
INSERT INTO `products_options_values` VALUES ('22', '1', 'VHS', '20');
INSERT INTO `products_options_values` VALUES ('22', '2', 'VHS', '20');
INSERT INTO `products_options_values` VALUES ('23', '1', 'DVD', '10');
INSERT INTO `products_options_values` VALUES ('23', '2', 'DVD', '10');
INSERT INTO `products_options_values` VALUES ('24', '1', '20th Century', '10');
INSERT INTO `products_options_values` VALUES ('24', '2', '二十世纪', '10');
INSERT INTO `products_options_values` VALUES ('25', '1', 'Orange', '20');
INSERT INTO `products_options_values` VALUES ('25', '2', '橙色', '20');
INSERT INTO `products_options_values` VALUES ('26', '1', 'Green', '40');
INSERT INTO `products_options_values` VALUES ('26', '2', '绿色', '40');
INSERT INTO `products_options_values` VALUES ('27', '1', 'Purple', '60');
INSERT INTO `products_options_values` VALUES ('27', '2', '紫色', '60');
INSERT INTO `products_options_values` VALUES ('28', '1', 'Brown', '70');
INSERT INTO `products_options_values` VALUES ('28', '2', '褐色', '70');
INSERT INTO `products_options_values` VALUES ('29', '1', 'Black', '80');
INSERT INTO `products_options_values` VALUES ('29', '2', '黑色', '80');
INSERT INTO `products_options_values` VALUES ('30', '1', 'White', '90');
INSERT INTO `products_options_values` VALUES ('30', '2', '白色', '90');
INSERT INTO `products_options_values` VALUES ('31', '1', 'Silver', '100');
INSERT INTO `products_options_values` VALUES ('31', '2', '银色', '100');
INSERT INTO `products_options_values` VALUES ('32', '1', 'Gold', '110');
INSERT INTO `products_options_values` VALUES ('32', '2', '金色', '110');
INSERT INTO `products_options_values` VALUES ('34', '1', 'Wrapping', '40');
INSERT INTO `products_options_values` VALUES ('34', '2', '外包装', '40');
INSERT INTO `products_options_values` VALUES ('35', '1', 'Autographed Memorabilia Card', '30');
INSERT INTO `products_options_values` VALUES ('35', '2', '签名卡', '30');
INSERT INTO `products_options_values` VALUES ('36', '1', 'Collector\'s Tin', '20');
INSERT INTO `products_options_values` VALUES ('36', '2', '礼品盒', '20');
INSERT INTO `products_options_values` VALUES ('37', '1', 'Select from below ...', '5');
INSERT INTO `products_options_values` VALUES ('37', '2', '请选择 ...', '5');
INSERT INTO `products_options_values` VALUES ('38', '1', '$5.00', '5');
INSERT INTO `products_options_values` VALUES ('38', '2', '5元', '5');
INSERT INTO `products_options_values` VALUES ('39', '1', '$10.00', '10');
INSERT INTO `products_options_values` VALUES ('39', '2', '10元', '10');
INSERT INTO `products_options_values` VALUES ('40', '1', '$25.00', '25');
INSERT INTO `products_options_values` VALUES ('40', '2', '25元', '25');
INSERT INTO `products_options_values` VALUES ('41', '1', '$15.00', '15');
INSERT INTO `products_options_values` VALUES ('41', '2', '15元', '15');
INSERT INTO `products_options_values` VALUES ('42', '1', '$50.00', '50');
INSERT INTO `products_options_values` VALUES ('42', '2', '50元', '50');
INSERT INTO `products_options_values` VALUES ('43', '1', '$100.00', '100');
INSERT INTO `products_options_values` VALUES ('43', '2', '100元', '100');
INSERT INTO `products_options_values` VALUES ('44', '1', 'Select from below ...', '5');
INSERT INTO `products_options_values` VALUES ('44', '2', '请选择 ...', '5');
INSERT INTO `products_options_values` VALUES ('45', '1', 'NONE', '5');
INSERT INTO `products_options_values` VALUES ('45', '2', '无', '5');
INSERT INTO `products_options_values` VALUES ('46', '1', 'None', '5');
INSERT INTO `products_options_values` VALUES ('46', '2', '无', '5');
INSERT INTO `products_options_values` VALUES ('47', '1', 'Embossed Collector\'s Tin', '10');
INSERT INTO `products_options_values` VALUES ('47', '2', '装饰盒', '10');
INSERT INTO `products_options_values` VALUES ('48', '1', 'None', '5');
INSERT INTO `products_options_values` VALUES ('48', '2', '无', '5');
INSERT INTO `products_options_values` VALUES ('49', '1', 'Custom Handling', '20');
INSERT INTO `products_options_values` VALUES ('49', '2', '客户定制', '20');
INSERT INTO `products_options_values` VALUES ('50', '1', 'Same Day Shipping', '30');
INSERT INTO `products_options_values` VALUES ('50', '2', '当日发货', '30');
INSERT INTO `products_options_values` VALUES ('51', '1', 'Quality Design', '10');
INSERT INTO `products_options_values` VALUES ('51', '2', '设计精美', '10');
INSERT INTO `products_options_values` VALUES ('52', '1', 'Download: Windows - Spanish', '20');
INSERT INTO `products_options_values` VALUES ('52', '2', '下载: Windows - 西班牙', '20');
INSERT INTO `products_options_values` VALUES ('53', '1', '3 Iron', '30');
INSERT INTO `products_options_values` VALUES ('53', '2', '3杆', '30');
INSERT INTO `products_options_values` VALUES ('54', '1', '4 Iron', '40');
INSERT INTO `products_options_values` VALUES ('54', '2', '4杆', '40');
INSERT INTO `products_options_values` VALUES ('55', '1', '5 Iron', '50');
INSERT INTO `products_options_values` VALUES ('55', '2', '5杆', '50');
INSERT INTO `products_options_values` VALUES ('56', '1', '6 Iron', '60');
INSERT INTO `products_options_values` VALUES ('56', '2', '6杆', '60');
INSERT INTO `products_options_values` VALUES ('57', '1', '9 Iron', '90');
INSERT INTO `products_options_values` VALUES ('57', '2', '9杆', '90');
INSERT INTO `products_options_values` VALUES ('58', '1', 'Wedge', '200');
INSERT INTO `products_options_values` VALUES ('58', '2', '挖起杆', '200');
INSERT INTO `products_options_values` VALUES ('59', '1', '7 Iron', '70');
INSERT INTO `products_options_values` VALUES ('59', '2', '7杆', '70');
INSERT INTO `products_options_values` VALUES ('60', '1', '8 Iron', '80');
INSERT INTO `products_options_values` VALUES ('60', '2', '8杆', '80');
INSERT INTO `products_options_values` VALUES ('61', '1', '2 Iron', '20');
INSERT INTO `products_options_values` VALUES ('61', '2', '2杆', '20');
INSERT INTO `products_options_values` VALUES ('62', '1', 'PDF - English', '10');
INSERT INTO `products_options_values` VALUES ('62', '2', 'PDF - 英文', '10');
INSERT INTO `products_options_values` VALUES ('63', '1', 'MS Word - English', '20');
INSERT INTO `products_options_values` VALUES ('63', '2', 'WORD - 英文', '20');
INSERT INTO `products_options_values` VALUES ('64', '1', 'Download: MAC - English', '100');
INSERT INTO `products_options_values` VALUES ('64', '2', '下载: MAC - 英语', '100');
INSERT INTO `products_options_values` VALUES ('65', '1', 'per Foot', '10');
INSERT INTO `products_options_values` VALUES ('65', '2', '每尺', '10');
INSERT INTO `products_options_values` VALUES ('66', '1', 'per Yard', '20');
INSERT INTO `products_options_values` VALUES ('66', '2', '每码', '20');
INSERT INTO `products_options_values` VALUES ('67', '1', 'Free Shipping Included!', '10');
INSERT INTO `products_options_values` VALUES ('67', '2', '免运费!', '10');
INSERT INTO `products_options_values` VALUES ('68', '1', 'Book Hard Cover', '5');
INSERT INTO `products_options_values` VALUES ('68', '2', '硬壳封面', '5');

-- ----------------------------
-- Table structure for `products_options_values_to_products_options`
-- ----------------------------
DROP TABLE IF EXISTS `products_options_values_to_products_options`;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_options_values_to_products_options
-- ----------------------------
INSERT INTO `products_options_values_to_products_options` VALUES ('1', '4', '1');
INSERT INTO `products_options_values_to_products_options` VALUES ('2', '4', '2');
INSERT INTO `products_options_values_to_products_options` VALUES ('3', '4', '3');
INSERT INTO `products_options_values_to_products_options` VALUES ('4', '4', '4');
INSERT INTO `products_options_values_to_products_options` VALUES ('5', '3', '5');
INSERT INTO `products_options_values_to_products_options` VALUES ('6', '3', '6');
INSERT INTO `products_options_values_to_products_options` VALUES ('7', '3', '7');
INSERT INTO `products_options_values_to_products_options` VALUES ('8', '3', '8');
INSERT INTO `products_options_values_to_products_options` VALUES ('9', '3', '9');
INSERT INTO `products_options_values_to_products_options` VALUES ('10', '5', '10');
INSERT INTO `products_options_values_to_products_options` VALUES ('13', '5', '13');
INSERT INTO `products_options_values_to_products_options` VALUES ('14', '6', '14');
INSERT INTO `products_options_values_to_products_options` VALUES ('15', '1', '15');
INSERT INTO `products_options_values_to_products_options` VALUES ('16', '1', '16');
INSERT INTO `products_options_values_to_products_options` VALUES ('17', '1', '17');
INSERT INTO `products_options_values_to_products_options` VALUES ('18', '2', '18');
INSERT INTO `products_options_values_to_products_options` VALUES ('19', '2', '19');
INSERT INTO `products_options_values_to_products_options` VALUES ('20', '2', '20');
INSERT INTO `products_options_values_to_products_options` VALUES ('21', '2', '21');
INSERT INTO `products_options_values_to_products_options` VALUES ('22', '6', '22');
INSERT INTO `products_options_values_to_products_options` VALUES ('23', '6', '23');
INSERT INTO `products_options_values_to_products_options` VALUES ('24', '5', '24');
INSERT INTO `products_options_values_to_products_options` VALUES ('35', '1', '25');
INSERT INTO `products_options_values_to_products_options` VALUES ('36', '1', '26');
INSERT INTO `products_options_values_to_products_options` VALUES ('37', '1', '27');
INSERT INTO `products_options_values_to_products_options` VALUES ('38', '1', '28');
INSERT INTO `products_options_values_to_products_options` VALUES ('39', '1', '29');
INSERT INTO `products_options_values_to_products_options` VALUES ('40', '1', '30');
INSERT INTO `products_options_values_to_products_options` VALUES ('41', '1', '31');
INSERT INTO `products_options_values_to_products_options` VALUES ('42', '1', '32');
INSERT INTO `products_options_values_to_products_options` VALUES ('53', '13', '34');
INSERT INTO `products_options_values_to_products_options` VALUES ('54', '13', '35');
INSERT INTO `products_options_values_to_products_options` VALUES ('55', '13', '36');
INSERT INTO `products_options_values_to_products_options` VALUES ('56', '9', '0');
INSERT INTO `products_options_values_to_products_options` VALUES ('57', '10', '0');
INSERT INTO `products_options_values_to_products_options` VALUES ('58', '11', '0');
INSERT INTO `products_options_values_to_products_options` VALUES ('59', '12', '0');
INSERT INTO `products_options_values_to_products_options` VALUES ('60', '7', '0');
INSERT INTO `products_options_values_to_products_options` VALUES ('61', '8', '0');
INSERT INTO `products_options_values_to_products_options` VALUES ('62', '2', '37');
INSERT INTO `products_options_values_to_products_options` VALUES ('63', '14', '38');
INSERT INTO `products_options_values_to_products_options` VALUES ('64', '14', '39');
INSERT INTO `products_options_values_to_products_options` VALUES ('65', '14', '40');
INSERT INTO `products_options_values_to_products_options` VALUES ('66', '14', '41');
INSERT INTO `products_options_values_to_products_options` VALUES ('67', '14', '42');
INSERT INTO `products_options_values_to_products_options` VALUES ('68', '14', '43');
INSERT INTO `products_options_values_to_products_options` VALUES ('69', '13', '44');
INSERT INTO `products_options_values_to_products_options` VALUES ('70', '1', '45');
INSERT INTO `products_options_values_to_products_options` VALUES ('71', '4', '46');
INSERT INTO `products_options_values_to_products_options` VALUES ('72', '13', '47');
INSERT INTO `products_options_values_to_products_options` VALUES ('73', '13', '48');
INSERT INTO `products_options_values_to_products_options` VALUES ('74', '15', '49');
INSERT INTO `products_options_values_to_products_options` VALUES ('75', '15', '50');
INSERT INTO `products_options_values_to_products_options` VALUES ('76', '15', '51');
INSERT INTO `products_options_values_to_products_options` VALUES ('77', '5', '52');
INSERT INTO `products_options_values_to_products_options` VALUES ('78', '16', '53');
INSERT INTO `products_options_values_to_products_options` VALUES ('79', '16', '54');
INSERT INTO `products_options_values_to_products_options` VALUES ('80', '16', '55');
INSERT INTO `products_options_values_to_products_options` VALUES ('81', '16', '56');
INSERT INTO `products_options_values_to_products_options` VALUES ('82', '16', '57');
INSERT INTO `products_options_values_to_products_options` VALUES ('83', '16', '58');
INSERT INTO `products_options_values_to_products_options` VALUES ('84', '16', '59');
INSERT INTO `products_options_values_to_products_options` VALUES ('85', '16', '60');
INSERT INTO `products_options_values_to_products_options` VALUES ('86', '16', '61');
INSERT INTO `products_options_values_to_products_options` VALUES ('87', '17', '62');
INSERT INTO `products_options_values_to_products_options` VALUES ('88', '17', '63');
INSERT INTO `products_options_values_to_products_options` VALUES ('89', '5', '64');
INSERT INTO `products_options_values_to_products_options` VALUES ('90', '18', '65');
INSERT INTO `products_options_values_to_products_options` VALUES ('91', '18', '66');
INSERT INTO `products_options_values_to_products_options` VALUES ('92', '19', '67');
INSERT INTO `products_options_values_to_products_options` VALUES ('93', '5', '68');

-- ----------------------------
-- Table structure for `products_to_categories`
-- ----------------------------
DROP TABLE IF EXISTS `products_to_categories`;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products_to_categories
-- ----------------------------
INSERT INTO `products_to_categories` VALUES ('1', '4');
INSERT INTO `products_to_categories` VALUES ('2', '4');
INSERT INTO `products_to_categories` VALUES ('3', '9');
INSERT INTO `products_to_categories` VALUES ('4', '10');
INSERT INTO `products_to_categories` VALUES ('5', '11');
INSERT INTO `products_to_categories` VALUES ('5', '22');
INSERT INTO `products_to_categories` VALUES ('6', '10');
INSERT INTO `products_to_categories` VALUES ('6', '22');
INSERT INTO `products_to_categories` VALUES ('7', '12');
INSERT INTO `products_to_categories` VALUES ('7', '22');
INSERT INTO `products_to_categories` VALUES ('8', '13');
INSERT INTO `products_to_categories` VALUES ('8', '22');
INSERT INTO `products_to_categories` VALUES ('9', '10');
INSERT INTO `products_to_categories` VALUES ('9', '22');
INSERT INTO `products_to_categories` VALUES ('10', '10');
INSERT INTO `products_to_categories` VALUES ('11', '10');
INSERT INTO `products_to_categories` VALUES ('11', '22');
INSERT INTO `products_to_categories` VALUES ('12', '10');
INSERT INTO `products_to_categories` VALUES ('12', '22');
INSERT INTO `products_to_categories` VALUES ('13', '10');
INSERT INTO `products_to_categories` VALUES ('13', '22');
INSERT INTO `products_to_categories` VALUES ('14', '15');
INSERT INTO `products_to_categories` VALUES ('14', '22');
INSERT INTO `products_to_categories` VALUES ('15', '14');
INSERT INTO `products_to_categories` VALUES ('15', '22');
INSERT INTO `products_to_categories` VALUES ('16', '15');
INSERT INTO `products_to_categories` VALUES ('16', '22');
INSERT INTO `products_to_categories` VALUES ('17', '10');
INSERT INTO `products_to_categories` VALUES ('17', '22');
INSERT INTO `products_to_categories` VALUES ('18', '10');
INSERT INTO `products_to_categories` VALUES ('19', '12');
INSERT INTO `products_to_categories` VALUES ('19', '22');
INSERT INTO `products_to_categories` VALUES ('20', '15');
INSERT INTO `products_to_categories` VALUES ('20', '22');
INSERT INTO `products_to_categories` VALUES ('21', '18');
INSERT INTO `products_to_categories` VALUES ('21', '22');
INSERT INTO `products_to_categories` VALUES ('22', '19');
INSERT INTO `products_to_categories` VALUES ('22', '22');
INSERT INTO `products_to_categories` VALUES ('23', '20');
INSERT INTO `products_to_categories` VALUES ('23', '22');
INSERT INTO `products_to_categories` VALUES ('24', '20');
INSERT INTO `products_to_categories` VALUES ('24', '22');
INSERT INTO `products_to_categories` VALUES ('25', '8');
INSERT INTO `products_to_categories` VALUES ('26', '9');
INSERT INTO `products_to_categories` VALUES ('27', '5');
INSERT INTO `products_to_categories` VALUES ('27', '22');
INSERT INTO `products_to_categories` VALUES ('28', '21');
INSERT INTO `products_to_categories` VALUES ('29', '21');
INSERT INTO `products_to_categories` VALUES ('30', '21');
INSERT INTO `products_to_categories` VALUES ('31', '21');
INSERT INTO `products_to_categories` VALUES ('32', '21');
INSERT INTO `products_to_categories` VALUES ('34', '22');
INSERT INTO `products_to_categories` VALUES ('36', '25');
INSERT INTO `products_to_categories` VALUES ('39', '24');
INSERT INTO `products_to_categories` VALUES ('40', '24');
INSERT INTO `products_to_categories` VALUES ('41', '28');
INSERT INTO `products_to_categories` VALUES ('42', '28');
INSERT INTO `products_to_categories` VALUES ('43', '24');
INSERT INTO `products_to_categories` VALUES ('44', '22');
INSERT INTO `products_to_categories` VALUES ('46', '22');
INSERT INTO `products_to_categories` VALUES ('47', '21');
INSERT INTO `products_to_categories` VALUES ('48', '23');
INSERT INTO `products_to_categories` VALUES ('49', '23');
INSERT INTO `products_to_categories` VALUES ('50', '23');
INSERT INTO `products_to_categories` VALUES ('51', '24');
INSERT INTO `products_to_categories` VALUES ('52', '24');
INSERT INTO `products_to_categories` VALUES ('53', '23');
INSERT INTO `products_to_categories` VALUES ('54', '23');
INSERT INTO `products_to_categories` VALUES ('55', '28');
INSERT INTO `products_to_categories` VALUES ('56', '28');
INSERT INTO `products_to_categories` VALUES ('57', '24');
INSERT INTO `products_to_categories` VALUES ('59', '23');
INSERT INTO `products_to_categories` VALUES ('60', '28');
INSERT INTO `products_to_categories` VALUES ('61', '28');
INSERT INTO `products_to_categories` VALUES ('74', '23');
INSERT INTO `products_to_categories` VALUES ('76', '28');
INSERT INTO `products_to_categories` VALUES ('78', '25');
INSERT INTO `products_to_categories` VALUES ('79', '23');
INSERT INTO `products_to_categories` VALUES ('80', '23');
INSERT INTO `products_to_categories` VALUES ('82', '27');
INSERT INTO `products_to_categories` VALUES ('83', '27');
INSERT INTO `products_to_categories` VALUES ('84', '23');
INSERT INTO `products_to_categories` VALUES ('85', '23');
INSERT INTO `products_to_categories` VALUES ('88', '31');
INSERT INTO `products_to_categories` VALUES ('89', '31');
INSERT INTO `products_to_categories` VALUES ('90', '45');
INSERT INTO `products_to_categories` VALUES ('92', '45');
INSERT INTO `products_to_categories` VALUES ('93', '46');
INSERT INTO `products_to_categories` VALUES ('94', '46');
INSERT INTO `products_to_categories` VALUES ('95', '51');
INSERT INTO `products_to_categories` VALUES ('96', '51');
INSERT INTO `products_to_categories` VALUES ('97', '32');
INSERT INTO `products_to_categories` VALUES ('98', '32');
INSERT INTO `products_to_categories` VALUES ('99', '23');
INSERT INTO `products_to_categories` VALUES ('100', '25');
INSERT INTO `products_to_categories` VALUES ('101', '47');
INSERT INTO `products_to_categories` VALUES ('104', '23');
INSERT INTO `products_to_categories` VALUES ('105', '22');
INSERT INTO `products_to_categories` VALUES ('106', '22');
INSERT INTO `products_to_categories` VALUES ('107', '23');
INSERT INTO `products_to_categories` VALUES ('108', '23');
INSERT INTO `products_to_categories` VALUES ('109', '23');
INSERT INTO `products_to_categories` VALUES ('110', '52');
INSERT INTO `products_to_categories` VALUES ('111', '52');
INSERT INTO `products_to_categories` VALUES ('112', '53');
INSERT INTO `products_to_categories` VALUES ('113', '53');
INSERT INTO `products_to_categories` VALUES ('114', '53');
INSERT INTO `products_to_categories` VALUES ('115', '53');
INSERT INTO `products_to_categories` VALUES ('116', '53');
INSERT INTO `products_to_categories` VALUES ('117', '53');
INSERT INTO `products_to_categories` VALUES ('118', '53');
INSERT INTO `products_to_categories` VALUES ('119', '53');
INSERT INTO `products_to_categories` VALUES ('120', '53');
INSERT INTO `products_to_categories` VALUES ('121', '53');
INSERT INTO `products_to_categories` VALUES ('122', '53');
INSERT INTO `products_to_categories` VALUES ('123', '53');
INSERT INTO `products_to_categories` VALUES ('127', '55');
INSERT INTO `products_to_categories` VALUES ('130', '55');
INSERT INTO `products_to_categories` VALUES ('131', '57');
INSERT INTO `products_to_categories` VALUES ('132', '58');
INSERT INTO `products_to_categories` VALUES ('133', '60');
INSERT INTO `products_to_categories` VALUES ('134', '57');
INSERT INTO `products_to_categories` VALUES ('154', '58');
INSERT INTO `products_to_categories` VALUES ('155', '56');
INSERT INTO `products_to_categories` VALUES ('156', '56');
INSERT INTO `products_to_categories` VALUES ('157', '56');
INSERT INTO `products_to_categories` VALUES ('158', '56');
INSERT INTO `products_to_categories` VALUES ('159', '56');
INSERT INTO `products_to_categories` VALUES ('160', '61');
INSERT INTO `products_to_categories` VALUES ('165', '61');
INSERT INTO `products_to_categories` VALUES ('166', '62');
INSERT INTO `products_to_categories` VALUES ('167', '63');
INSERT INTO `products_to_categories` VALUES ('168', '64');
INSERT INTO `products_to_categories` VALUES ('169', '64');
INSERT INTO `products_to_categories` VALUES ('170', '64');
INSERT INTO `products_to_categories` VALUES ('171', '63');
INSERT INTO `products_to_categories` VALUES ('171', '64');
INSERT INTO `products_to_categories` VALUES ('172', '64');
INSERT INTO `products_to_categories` VALUES ('173', '61');
INSERT INTO `products_to_categories` VALUES ('174', '24');
INSERT INTO `products_to_categories` VALUES ('175', '55');
INSERT INTO `products_to_categories` VALUES ('176', '55');
INSERT INTO `products_to_categories` VALUES ('177', '55');
INSERT INTO `products_to_categories` VALUES ('178', '55');
INSERT INTO `products_to_categories` VALUES ('179', '60');

-- ----------------------------
-- Table structure for `product_music_extra`
-- ----------------------------
DROP TABLE IF EXISTS `product_music_extra`;
CREATE TABLE `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_music_extra
-- ----------------------------
INSERT INTO `product_music_extra` VALUES ('166', '1', '0', '1');
INSERT INTO `product_music_extra` VALUES ('169', '1', '1', '2');

-- ----------------------------
-- Table structure for `product_types`
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_types
-- ----------------------------
INSERT INTO `product_types` VALUES ('1', '商品 - 普通', 'product', '1', 'Y', '', '2018-08-08 12:34:00', '2018-08-08 12:34:00');
INSERT INTO `product_types` VALUES ('2', '商品 - 音乐', 'product_music', '1', 'Y', '', '2018-08-08 12:34:00', '2018-08-08 12:34:00');
INSERT INTO `product_types` VALUES ('3', '文档 - 普通', 'document_general', '3', 'N', '', '2018-08-08 12:34:00', '2018-08-08 12:34:00');
INSERT INTO `product_types` VALUES ('4', '文档 - 商品', 'document_product', '3', 'Y', '', '2018-08-08 12:34:00', '2018-08-08 12:34:00');
INSERT INTO `product_types` VALUES ('5', '商品 - 免运费', 'product_free_shipping', '1', 'Y', '', '2018-08-08 12:34:00', '2018-08-08 12:34:00');

-- ----------------------------
-- Table structure for `product_types_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_types_to_category`;
CREATE TABLE `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_types_to_category
-- ----------------------------
INSERT INTO `product_types_to_category` VALUES ('3', '63');
INSERT INTO `product_types_to_category` VALUES ('4', '63');
INSERT INTO `product_types_to_category` VALUES ('2', '62');

-- ----------------------------
-- Table structure for `product_type_layout`
-- ----------------------------
DROP TABLE IF EXISTS `product_type_layout`;
CREATE TABLE `product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type_layout
-- ----------------------------
INSERT INTO `product_type_layout` VALUES ('1', '显示型号', 'SHOW_PRODUCT_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '1', '1', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('2', '显示重量', 'SHOW_PRODUCT_INFO_WEIGHT', '1', '在商品页面显示重量 0= 否 1= 是', '1', '2', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('3', '显示属性重量', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '1', '3', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('4', '显示厂商', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', '1', '4', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('5', '显示购物车中数量', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '1', '5', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('6', '显示库存数量', 'SHOW_PRODUCT_INFO_QUANTITY', '1', '在商品页面显示库存数量 0= 否 1= 是', '1', '6', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('7', '显示商品评论计数', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '1', '7', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('8', '显示商品评论按钮', 'SHOW_PRODUCT_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '1', '8', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('9', '显示上市日期', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '1', '9', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('10', '显示加入日期', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '1', '10', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('11', '显示商品网址', 'SHOW_PRODUCT_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '1', '11', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('12', '显示商品附加图像', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '1', '13', null, '2018-08-08 12:34:00', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('13', '显示最低价格文字', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '1', '12', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('14', '商品免运费图像 - 分类', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在分类中显示免运费图像/文字?', '1', '16', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('15', '商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '1', '100', null, '2018-08-08 12:34:01', '', '');
INSERT INTO `product_type_layout` VALUES ('16', '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '1', '101', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('17', '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '1', '102', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `product_type_layout` VALUES ('18', '显示型号', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '2', '1', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('19', '显示重量', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', '2', '2', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('20', '显示属性重量', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '2', '3', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('21', '显示歌手', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', '在商品页面显示歌手名字 0= 否 1= 是', '2', '4', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('22', '显示音乐类型', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', '在商品页面显示音乐类型 0= 否 1= 是', '2', '4', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('23', '显示唱片公司', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', '在商品页面显示唱片公司 0= 否 1= 是', '2', '4', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('24', '显示购物车中数量', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '2', '5', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('25', '显示库存数量', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', '在商品页面显示库存数量 0= 否 1= 是', '2', '6', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('26', '显示商品评论计数', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '2', '7', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('27', '显示商品评论按钮', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '2', '8', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('28', '显示上市日期', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '2', '9', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('29', '显示加入日期', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '2', '10', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('30', '显示商品附加图像', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '2', '13', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('31', '显示价格文字最低至', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '2', '12', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('32', '商品免运费图像 - 分类', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在列表中显示免运费图像/文字?', '2', '16', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('33', '商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '2', '100', null, '2018-08-08 12:34:01', '', '');
INSERT INTO `product_type_layout` VALUES ('34', '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '2', '101', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('35', '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '2', '102', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `product_type_layout` VALUES ('36', '显示商品评论计数', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 Info 0= 否 1= 是', '3', '7', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('37', '显示商品评论按钮', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '3', '8', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('38', '显示上市日期', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '3', '9', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('39', '显示加入日期', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '3', '10', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('40', '显示商品网址', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '3', '11', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('41', '显示商品附加图像', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '3', '13', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('42', '显示型号', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '4', '1', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('43', '显示重量', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', '4', '2', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('44', '显示属性重量', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '4', '3', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('45', '显示厂商', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', '4', '4', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('46', '显示购物车中数量', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '4', '5', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('47', '显示库存数量', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', '在商品页面显示库存数量 0= 否 1= 是', '4', '6', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('48', '显示商品评论计数', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '4', '7', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('49', '显示商品评论按钮', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '4', '8', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('50', '显示上市日期', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', '在商品页面显示上市日期 0= 否 1= 是', '4', '9', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('51', '显示加入日期', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '4', '10', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('52', '显示商品网址', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '4', '11', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('53', '显示商品附加图像', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '4', '13', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('54', '显示价格文字最低至', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '4', '12', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('55', '商品免运费图像状态 - 分类', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', '是否在列表中显示免运费图像/文字?', '4', '16', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('56', '商品价格缺省税种 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '4', '100', null, '2018-08-08 12:34:01', '', '');
INSERT INTO `product_type_layout` VALUES ('57', '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '4', '101', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('58', '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '4', '102', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `product_type_layout` VALUES ('59', '显示型号', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', '在商品页面显示型号 0= 否 1= 是', '5', '1', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('60', '显示重量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', '在商品页面显示重量 0= 否 1= 是', '5', '2', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('61', '显示属性重量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', '在商品页面显示属性重量 0= 否 1= 是', '5', '3', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('62', '显示厂商', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', '在商品页面显示厂商名字 0= 否 1= 是', '5', '4', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('63', '显示购物车中数量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', '在商品页面显示购物车中商品数量 0= 否 1= 是', '5', '5', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('64', '显示库存数量', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', '在商品页面显示库存数量 0= 否 1= 是', '5', '6', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('65', '显示商品评论计数', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', '在商品页面显示商品评论计数 0= 否 1= 是', '5', '7', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('66', '显示商品评论按钮', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', '在商品页面显示商品评论按钮 0= 否 1= 是', '5', '8', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('67', '显示上市日期', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', '在商品页面显示上市日期 0= 否 1= 是', '5', '9', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('68', '显示加入日期', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', '在商品页面显示加入日期 0= 否 1= 是', '5', '10', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('69', '显示商品网址', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', '在商品页面显示网址 0= 否 1= 是', '5', '11', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('70', '显示商品附加图像', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', '在商品页面显示附加图像 0= 否 1= 是', '5', '13', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('71', '显示价格文字 最低至', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', '是否在含属性的商品页面显示最低价格文字 0= 否 1= 是', '5', '12', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('72', '商品免运费图像 - 分类', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', '是否在列表中显示免运费图像/文字?', '5', '16', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('73', '商品价格缺省税种 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', '增加新商品时，缺省的商品价格税种的编号是?', '5', '100', null, '2018-08-08 12:34:01', '', '');
INSERT INTO `product_type_layout` VALUES ('74', '虚拟商品缺省状态 - 不需要送货地址 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', '增加新商品时，缺省的虚拟商品状态为开?', '5', '101', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('75', '商品免运费缺省状态 - 正常运费 - 增加新商品时', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', '增加新商品时，缺省为免运费吗？<br />是，打开免运费<br />否，关闭免运费<br />特定，可下载商品需要发货', '5', '102', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), ');
INSERT INTO `product_type_layout` VALUES ('76', '显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', '1', '50', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('77', '显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', '1', '51', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('78', '显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', '1', '52', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('79', '显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', '1', '53', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('80', '显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', '1', '54', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('81', '显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', '2', '50', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('82', '显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', '2', '51', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('83', '显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', '2', '52', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('84', '显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', '2', '53', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('85', '显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', '2', '54', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('86', '显示元标签标题缺省值 - 文档标题', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示文档标题 0= 否 1= 是', '3', '50', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('87', '显示元标签标题缺省值 - 文档名称', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示文档名称 0= 否 1= 是', '3', '51', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('88', '显示元标签标题缺省值 - 文档 Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示文档标签行 Title 0= 否 1= 是', '3', '54', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('89', '显示元标签标题缺省值 - 文档标题', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示文档标题 0= 否 1= 是', '4', '50', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('90', '显示元标签标题缺省值 - 文档名称', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示文档名称 0= 否 1= 是', '4', '51', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('91', '显示元标签标题缺省值 - 文档型号', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示文档型号 0= 否 1= 是', '4', '52', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('92', '显示元标签标题缺省值 - 文档价格', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示文档价格 0= 否 1= 是', '4', '53', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('93', '显示元标签标题缺省值 - 文档 Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示文档标签行 0= 否 1= 是', '4', '54', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('94', '显示元标签标题缺省值 - 商品标题', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', '在元标签标题上显示商品标题 0= 否 1= 是', '5', '50', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('95', '显示元标签标题缺省值 - 商品名称', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', '在元标签标题上显示商品名称 0= 否 1= 是', '5', '51', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('96', '显示元标签标题缺省值 - 商品型号', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', '在元标签标题上显示商品型号 0= 否 1= 是', '5', '52', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('97', '显示元标签标题缺省值 - 商品价格', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', '在元标签标题上显示商品价格 0= 否 1= 是', '5', '53', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('98', '显示元标签标题缺省值 - 商品标签行', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', '在元标签标题上显示商品标签行 0= 否 1= 是', '5', '54', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), ');
INSERT INTO `product_type_layout` VALUES ('99', '商品属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', '商品属性仅用于显示<br />仅用于显示<br />0= 否 1= 是', '1', '200', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('100', '商品属性免费 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', '商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '1', '201', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('101', '商品属性缺省 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', '商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '1', '202', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('102', '商品属性有优惠 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', '商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '1', '203', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('103', '商品属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '1', '204', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('104', '商品属性是必选的 - 缺省', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', '商品属性是必选的<br />属性是必须的<br />0= 否 1= 是', '1', '205', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('105', '商品属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', '商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '1', '206', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('106', '商品属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '1', '207', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('107', '音乐属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', '音乐属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '2', '200', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('108', '音乐属性免费 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', '音乐属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '2', '201', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('109', '音乐属性缺省 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', '音乐属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '2', '202', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('110', '音乐属性有优惠 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', '音乐属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '2', '203', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('111', '音乐属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '音乐属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '2', '204', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('112', '音乐属性是必选的 - 缺省', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', '音乐属性是必选的<br />属性是必须的<br />0= 否 1= 是', '2', '205', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('113', '音乐属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', '音乐属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '2', '206', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('114', '音乐属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '音乐属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '2', '207', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('115', '普通文档属性仅用于显示 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', '普通文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '3', '200', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('116', '普通文档属性免费 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', '普通文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '3', '201', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('117', '普通文档属性缺省 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', '普通文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '3', '202', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('118', '普通文档属性有优惠 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', '普通文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '3', '203', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('119', '普通文档属性定价包含商品基价 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '普通文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '3', '204', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('120', '普通文档属性是必选的 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', '普通文档属性是必选的<br />属性是必须的<br />0= 否 1= 是', '3', '205', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('121', '普通文档属性价格前缀 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', '普通文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '3', '206', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('122', '普通文档属性重量前缀 - 缺省', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '普通文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '3', '207', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('123', '商品文档属性仅用于显示 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', '商品文档属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '4', '200', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('124', '商品文档属性免费 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', '商品文档属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '4', '201', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('125', '商品文档属性缺省 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', '商品文档属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '4', '202', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('126', '商品文档属性有优惠 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', '商品文档属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '4', '203', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('127', '商品文档属性定价包含商品基价 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '商品文档属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '4', '204', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('128', '商品文档属性是必选的 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', '商品文档属性是必选的<br />属性是必须的<br />0= 否 1= 是', '4', '205', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('129', '商品文档属性价格前缀 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', '商品文档属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '4', '206', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('130', '商品文档属性重量前缀 - 缺省', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '商品文档属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '4', '207', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('131', '免运费商品属性仅用于显示 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', '免运费商品属性仅用于显示 - 缺省<br />仅用于显示用途<br />0= 否 1= 是', '5', '201', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('132', '免运费商品属性免费 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', '免运费商品属性免费<br />商品免费时属性免费<br />0= 否 1= 是', '5', '201', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('133', '免运费商品属性缺省 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', '免运费商品属性缺省<br />缺省选中的属性<br />0= 否 1= 是', '5', '202', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('134', '免运费商品属性有优惠 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', '免运费商品属性有优惠<br />商品特价/促销同样适用于属性<br />0= 否 1= 是', '5', '203', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('135', '免运费商品属性定价包含商品基价 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', '免运费商品属性定价包含商品基价<br />根据属性定价时，包含商品基价<br />0= 否 1= 是', '5', '204', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('136', '免运费商品属性是必选的 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', '免运费商品属性是必选的<br />属性是必须的<br />0= 否 1= 是', '5', '205', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), ');
INSERT INTO `product_type_layout` VALUES ('137', '免运费商品属性价格前缀 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', '免运费商品属性价格前缀<br />缺省的属性价格前缀<br />留空, + 或 -', '5', '206', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
INSERT INTO `product_type_layout` VALUES ('138', '免运费商品属性重量前缀 - 缺省', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', '免运费商品属性重量前缀<br />缺省的属性重量前缀<br />留空, + 或 -', '5', '207', null, '2018-08-08 12:34:01', null, 'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');

-- ----------------------------
-- Table structure for `project_version`
-- ----------------------------
DROP TABLE IF EXISTS `project_version`;
CREATE TABLE `project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking';

-- ----------------------------
-- Records of project_version
-- ----------------------------
INSERT INTO `project_version` VALUES ('1', 'Zen-Cart Main', '1', '5.4', '', '', '', '', 'New Installation', '2018-08-08 12:34:01');
INSERT INTO `project_version` VALUES ('2', 'Zen-Cart Database', '1', '5.4', '', '', '', '', 'New Installation', '2018-08-08 12:34:01');

-- ----------------------------
-- Table structure for `project_version_history`
-- ----------------------------
DROP TABLE IF EXISTS `project_version_history`;
CREATE TABLE `project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History';

-- ----------------------------
-- Records of project_version_history
-- ----------------------------
INSERT INTO `project_version_history` VALUES ('1', 'Zen-Cart Main', '1', '5.4', '', 'New Installation', '2018-08-08 12:34:01');
INSERT INTO `project_version_history` VALUES ('2', 'Zen-Cart Database', '1', '5.4', '', 'New Installation', '2018-08-08 12:34:01');

-- ----------------------------
-- Table structure for `query_builder`
-- ----------------------------
DROP TABLE IF EXISTS `query_builder`;
CREATE TABLE `query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules';

-- ----------------------------
-- Records of query_builder
-- ----------------------------
INSERT INTO `query_builder` VALUES ('1', 'email', '所有客户', '返回所有客户的姓名和电子邮件地址，用于批量发送电子邮件(例如: 电子商情、优惠券、礼券、短信等)。', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', '');
INSERT INTO `query_builder` VALUES ('2', 'email,newsletters', '所有电子商情订阅者', '返回电子商情订阅者的姓名和电子邮件地址。', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'', '');
INSERT INTO `query_builder` VALUES ('3', 'email,newsletters', '以往客户(超过三个月) (订阅者)', '以前曾经购物，但最近三个月内没有购物的客户订阅者', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO `query_builder` VALUES ('4', 'email,newsletters', '最近三个月的客户(订阅者)', '最近三个月内有购物的电子商情订阅者。', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO `query_builder` VALUES ('5', 'email,newsletters', '最近三个月的客户(无论是否订阅)', '所有曾经购物的顾客，不论是否订阅电子商情。', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', '');
INSERT INTO `query_builder` VALUES ('6', 'email,newsletters', '管理员', '仅当前管理员的电子邮件帐号', 'select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', '');
INSERT INTO `query_builder` VALUES ('7', 'email,newsletters', '从未购物的客户', '发给已注册但从未购物的客户', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- ----------------------------
-- Table structure for `record_artists`
-- ----------------------------
DROP TABLE IF EXISTS `record_artists`;
CREATE TABLE `record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_artists
-- ----------------------------
INSERT INTO `record_artists` VALUES ('1', 'The Russ Tippins Band', 'sooty.jpg', '2004-06-01 20:53:00', null);

-- ----------------------------
-- Table structure for `record_artists_info`
-- ----------------------------
DROP TABLE IF EXISTS `record_artists_info`;
CREATE TABLE `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_artists_info
-- ----------------------------
INSERT INTO `record_artists_info` VALUES ('1', '1', 'www.russtippins.com/', '0', null);
INSERT INTO `record_artists_info` VALUES ('1', '2', 'russtippinsband.users.btopenworld.com', '0', null);

-- ----------------------------
-- Table structure for `record_company`
-- ----------------------------
DROP TABLE IF EXISTS `record_company`;
CREATE TABLE `record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_company
-- ----------------------------
INSERT INTO `record_company` VALUES ('1', 'HMV Group', null, '2004-07-09 14:11:52', null);

-- ----------------------------
-- Table structure for `record_company_info`
-- ----------------------------
DROP TABLE IF EXISTS `record_company_info`;
CREATE TABLE `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_company_info
-- ----------------------------
INSERT INTO `record_company_info` VALUES ('1', '1', 'www.hmvgroup.com', '0', null);
INSERT INTO `record_company_info` VALUES ('1', '2', 'www.hmvgroup.com', '0', null);

-- ----------------------------
-- Table structure for `reviews`
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES ('1', '19', '0', 'Bill Smith', '5', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '11', '1');

-- ----------------------------
-- Table structure for `reviews_description`
-- ----------------------------
DROP TABLE IF EXISTS `reviews_description`;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reviews_description
-- ----------------------------
INSERT INTO `reviews_description` VALUES ('1', '1', 'This really is a very funny but old movie!');
INSERT INTO `reviews_description` VALUES ('1', '2', '这是一部很有趣的旧电影！');

-- ----------------------------
-- Table structure for `salemaker_sales`
-- ----------------------------
DROP TABLE IF EXISTS `salemaker_sales`;
CREATE TABLE `salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salemaker_sales
-- ----------------------------
INSERT INTO `salemaker_sales` VALUES ('1', '0', '10% off Sale', '10.0000', '1', '1.0000', '1000.0000', '2', '25,28,45,47,58', ',25,28,45,47,58,', '2003-12-23', '2008-02-21', '2003-12-23', '2004-05-18', '2018-08-08');
INSERT INTO `salemaker_sales` VALUES ('3', '0', 'Mice 20%', '20.0000', '1', '1.0000', '1000.0000', '2', '9', ',9,', '2003-12-24', '2004-04-21', '2003-12-31', '2003-12-31', '2004-04-25');
INSERT INTO `salemaker_sales` VALUES ('6', '1', '$5.00 off', '5.0000', '0', '0.0000', '0.0000', '2', '27', ',27,', '0001-01-01', '0001-01-01', '2004-01-04', '2004-01-05', '2004-01-04');
INSERT INTO `salemaker_sales` VALUES ('7', '1', '10% Skip Specials', '10.0000', '1', '0.0000', '0.0000', '1', '31', ',31,', '0001-01-01', '0001-01-01', '2004-01-04', '2004-05-18', '2004-01-04');
INSERT INTO `salemaker_sales` VALUES ('8', '1', '10% Apply to Price', '10.0000', '1', '0.0000', '0.0000', '0', '32', ',32,', '0001-01-01', '0001-01-01', '2004-01-05', '2004-05-18', '2004-01-05');
INSERT INTO `salemaker_sales` VALUES ('9', '1', 'New Price $100', '100.0000', '2', '0.0000', '0.0000', '2', '46', ',46,', '0001-01-01', '0001-01-01', '2004-01-06', '2004-01-07', '2004-01-06');
INSERT INTO `salemaker_sales` VALUES ('10', '1', 'New Price $100 Skip Special', '100.0000', '2', '0.0000', '0.0000', '1', '51', ',51,', '0001-01-01', '0001-01-01', '2004-01-07', '2004-01-07', '2004-01-07');
INSERT INTO `salemaker_sales` VALUES ('11', '1', '$5.00 off Skip Specials', '5.0000', '0', '0.0000', '0.0000', '1', '52', ',52,', '0001-01-01', '0001-01-01', '2004-01-24', '2004-01-24', '2004-01-24');

-- ----------------------------
-- Table structure for `seo_cache`
-- ----------------------------
DROP TABLE IF EXISTS `seo_cache`;
CREATE TABLE `seo_cache` (
  `cache_id` varchar(32) NOT NULL DEFAULT '',
  `cache_language_id` tinyint(1) NOT NULL DEFAULT '0',
  `cache_name` varchar(255) NOT NULL DEFAULT '',
  `cache_data` mediumtext NOT NULL,
  `cache_global` tinyint(1) NOT NULL DEFAULT '1',
  `cache_gzip` tinyint(1) NOT NULL DEFAULT '1',
  `cache_method` varchar(20) NOT NULL DEFAULT 'RETURN',
  `cache_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cache_expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`cache_id`,`cache_language_id`),
  KEY `cache_id` (`cache_id`),
  KEY `cache_language_id` (`cache_language_id`),
  KEY `cache_global` (`cache_global`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seo_cache
-- ----------------------------
INSERT INTO `seo_cache` VALUES ('ca34fbe5f9a075091ad59abf02c259a7', '2', 'seo_urls_v2_products', 'lVhLUxtHEL7nV+RGUpWt0q4QMpVTKskxj0olZ1dcJjEHiMvgKh/lKDIIIRBGMugtMGCMLCFsAXrzZ3Ye+y8y273AYHlm5CqdVP31dPf3dffMPpz7a35x7qupX3/75Yc/vv/9/s/f/fTjfXvqmy+nFv5cfvLPM+tvJxSyFhaWpr7+9ouHnzJ2ZONpYRx2Fh4orcO+tdvrucNtcnnIjlOkceQNarS2ooRM+xBavOK9Oi3HaDKltIz4lt72BbsaoKVFTgd0kCXJEz7aYslVy9se0Y1DpYMZcNDfIs190imT4tAEiPoAlj0njQyNJ9zukQlwzwfwfF38SPqMlnomwKwPoMOSN8rzYYscvDUB7NDHCMeihTY/b6EXZfI20E4rJ2TzNS2V3U7KeBRwz/MbPP5CxEeOnxsRwD9faZOtIW0ckfyxEQH0s94+T77nb17yjJETG2RA42ss9S9vtowHAOksW6WNPj87ETQaEQHrPoLuXHixqhEBtOMZiBCcnF+6nTURpjhRzQnSv7rldnpso+h2hiIp02kOKICVqmz1zGiLpLeLpLrBkl3eOApb7P2Ip87Y4NVkTeMEKiiQbp/VK3QtRsyydkAIohbsbc/tpviwaYwUhEBKr+nqLhsdiAjdQc1ihxXxl+hU0jP2ngPCIKMmH5562SYr7irr7oAoAlP9eHJADTReo/kmvRLzadu2Q6Fn88Z8UBMHA7LaiZBEXB0LaICBoR3SWYaReLB0tD7DQDv6jOh9ArvXp+tNgaE7w40cFOi7kVghYSEuslqn2Qu+sykmsTLbMFQey2mRswqNvXGv4l42pkZAfUgizdtdkntBtp8rTaehQG7/ktYGXnmfN5smANRJBliGaKahXnI0RgS0AukcYbas8J+MVueC/SDB3E6abJ7Sy0uSWTXlhfqWwBMjUe7rSYyWNAuiOiJmVIg6WlA7PU/x05zbUZM5jQMP7XrrSn8R3HKBv6TaDggkiWNRU6yJ5a2kvZVNsSZVN5pIQKGE4fkCTVUNRY3gTCvFSGuL5lriELK5hmVCUtQnApcUkLzdcLst8nI9cJHOucO05ZUrJh+49jQ+0IFJjhFsQI2fm1iMrkArspotmozRkoYupB+GadD9qDBl6WZQCIjA3iTrCZp6h4VX43DxyTi/fyaBRpGt8SAtMeREN1h0p2aYElEsMsjXciIBzg6ZYFIXjcMmK1hU6rBbH3I3K2t2T2q6G6jaGtoIW952/M0R6EW7me5hE0FlAhRWZ3ZiD0iP5EEdIvaMZBpQCIepYRINdzKT0b4KaHnP7V+o/UhU3PFjh3z0rZoMfmYlXsb8lJLoRxnFrIonOQo1epyv29BRzqIlxI1Id3GZHaMsqKQTCTQzgQ8Vl+M+LL/TM3VTXaQeDaqqzGxCj7g7ZblhhfxKX/NkkY2qyJZUe2wvJl4I6sqrVCjzNrk31GIpievRH9pXGfONShALz807wzDxnDc77mBX3OJu81LmYYdwFH+6LNdtoIGDeLxCRtwscWfSV12690KDuFmVBwVxGdG1qB26WYe+bVJvi/zu1D63hsAkG/R4+43hjmGHgKfxbMUVzE/7Q06ddvBlYLzO/kC2yNWQ5Q4NPWEHHwlkHwj5eDxP6k8aPq7mvmfb0pwhxaImS2mWuL2sxlAaGLorqW1Lg4Ak6hqPUn8LrWgMpdYlafV7xbalDUESDbVHfPNf36/Vj0nbkZpNHK2tOb7sA6fdsuZ0mRzhVHPBt4P3cr7pxQomsQcPWrhVGW0xsfUkP037z8x2V0gwQfY0fIVBfF59l7Sy5KDOMnFa1oyNMGQpnrRu50R8HePDoboiYVSheCY1diaMJgIQ1v8gPiaqHUdAtWJBiCcsKdZYu6axBeHKtrwVp7m2BoE3dnh2i4nyWVDQtFhbtPROFF9zBmg6eBclu+KZhKtCjcA7/sQ8zUCJTIWcgeI8ebq0ZC3PP348v7hkPfhz8aG1/GjOevR0cXnuiSYgqdHpqxW691pji3WBDxO0dik+T1jiS5EQPzvrk4r6Y7Y9g3WSgV71g9vNmIBRXMkQ12edGMUWkoHYdcYToZHQNjjx5gKhrkwU+kl8NNeYQE+gDPGDDTyuQP0aFAjAi70k+xU6kcKC95g0lGxHu+qjoABcfZi3CQAyGI9pkgsSPtmI+BIgD57/AQ==', '1', '1', 'EVAL', '2018-08-08 12:35:04', '2018-09-07 12:35:04');
INSERT INTO `seo_cache` VALUES ('a93b9170a03ff54d81e95917742ea01b', '2', 'seo_urls_v2_categories', 'ldXLTsJQEAbgvU/hDk00QY0rV8QYV2pi3LgyApq48RkwhEshKAYoRRHaiAESucULVii+TGdO+xZWGi8bzwz7L//MmbQz0ZPTs/OThcBm6GBre2//8Gg3tLN1FFiaDwjj0R69BhY35qL/GsfqkQasgdNMynNEYwzpN7lxCxO8fIBSEgoXcokvWadXQn1ISkjknGfTedFpOahhrGmbd5jR/Hx5D3yJsRGkk2IwIgI/4m4xxnk+pK7s0ZAj7Wmmh1Efy6tjWZ9h/mpfKKY3Lk4Pbv3JNvNEdTWFxj1hhkPIp/2K3jChliW8NoGcQRilALk+Vt8Jpk1E4x0qLTnzXiq6A8IUu+JWI8xYRz0lN5BMQIfIgYTitol+sGVgtk7UyrRsqyo3oqOK0oPcACeneQ0m8aeAWgWlSdTKGW7sRm4wnnErbcKkr+hanbz/gy+vHsvT4FeG2TLClscrfLrKpmF+aniG1DV2AxF+A5EZUqlePyzvi/bXPNHqZd1bsRzJMfDnEMnr2mMN4/o6JOJct+ytebwzyJP+czdWgkE6/vvI+JhZAhXT9e7Y9Any9v2ByA2qKeiUOYfu68YWu/I0+y3rWJbcQLcmlOny+AQ=', '1', '1', 'EVAL', '2018-08-08 12:35:04', '2018-09-07 12:35:04');
INSERT INTO `seo_cache` VALUES ('4404c1df54fdb1291c8dd9bb259f32a9', '2', 'seo_urls_v2_manufacturers', 'S0lNy8xL1VD3dfQLdXN0DgkNcg2K93P0dY1X11FQV9e05koZVYESHgA=', '1', '1', 'EVAL', '2018-08-08 12:35:04', '2018-09-07 12:35:04');
INSERT INTO `seo_cache` VALUES ('4c8c09ec83152a7da27516b6c5234f27', '2', 'seo_urls_v2_ezpages', 'S0lNy8xL1VB3jQpwdHcNjvdz9HWNN1TXUVB/2j/xxZblT3bPeLZmn7qmNVcKNpVGIJUvGqc837z7WcfEJ7vX4FRpDFL5bM6ap7umP5u24eX03ThVmoBV9q140Tvh6dS2p5Mbcao0Bal8vnfi89Uzn87Z8HQ2bneagVS+nDXh+fLGp4s3PJvRh9NMc7CZU7Y+XQuy/VlzK06VFiCVT1vXPO3f8Xxdw5Pd3ThVWoJtXzbt5cKtONUYGoAUAYPmxf7ZBLxtCI6flwv3PV236OXC3c/nL8VtKjiCnnfufLJ7OyFTITG0ecXTth6QeQA=', '1', '1', 'EVAL', '2018-08-08 12:35:04', '2018-09-07 12:35:04');

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `sesskey` varchar(255) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('i3eoud6kdnrjpoedm3pg0mois7', '1533726001', 0x6332566A64584A7064486C556232746C626E787A4F6A4D794F6949324D7A646C59545269595749324E445A6B4E32526D5A544D78597A5135596A41314E6A63794F4441794D6949375933567A644739745A584A7A58326876633352665957526B636D567A6333787A4F6A49314F694A50526B5A4A51305666535642665645396653453954564639425245525352564E54496A746A59584A3053555238637A6F774F6949694F324E68636E5238547A6F784D6A6F696332687663484270626D644459584A30496A6F784D547037637A6F344F694A6A623235305A5735306379493759546F774F6E7439637A6F314F694A30623352686243493761546F774F334D364E6A6F69643256705A326830496A74704F6A4137637A6F784D6A6F695932397564475675644639306558426C496A74694F6A4137637A6F784F446F695A6E4A6C5A56397A61476C7763476C755A31397064475674496A74704F6A4137637A6F794D446F695A6E4A6C5A56397A61476C7763476C755A3139335A576C6E614851694F326B364D44747A4F6A45354F694A6D636D566C58334E6F615842776157356E5833427961574E6C496A74704F6A4137637A6F784E446F695A473933626D78765957526659323931626E51694F326B364D44747A4F6A49794F694A3062335268624639695A575A76636D56665A476C7A59323931626E527A496A74704F6A4137637A6F794D6A6F695A476C7A634778686556396B5A574A315A3139745A584E7A5957646C63794937596A6F774F334D364D6A4D36496D5A73595764665A48567762476C6A5958526C5832317A5A334E6663325630496A74694F6A413766574E6F5A574E7258335A6862476C6B66484D364E446F6964484A315A534937626D46326157646864476C76626E78504F6A45334F694A7559585A705A3246306157397553476C7A64473979655349364D6A7037637A6F304F694A775958526F496A74684F6A453665326B364D4474684F6A513665334D364E446F696347466E5A534937637A6F314F694A70626D526C65434937637A6F304F694A746232526C496A747A4F6A5936496B3550546C4E5454434937637A6F7A4F694A6E5A5851694F334D364D446F69496A747A4F6A5136496E4276633351694F3245364D44703766583139637A6F344F694A7A626D4677633268766443493759546F774F6E743966577868626D64315957646C66484D364F446F6963324E6F6157356C633255694F327868626D64315957646C633139705A48787A4F6A4536496A49694F327868626D64315957646C6331396A6232526C66484D364D6A6F695A3249694F324E31636E4A6C626D4E3566484D364D7A6F6956564E45496A743062325268655639706333787A4F6A45774F6949794D4445344C5441344C544134496A7431634752686447564665484270636D463061573975633378694F6A45376332567A63326C76626C396A6233567564475679664749364D54746A64584E306232316C636E4E66615842665957526B636D567A6333787A4F6A6B36496A45794E7934774C6A41754D534937);
INSERT INTO `sessions` VALUES ('ou8lin98bvact9vovl3fn8qin3', '1533725470', 0x6332566A64584A7064486C556232746C626E787A4F6A4D794F694A6A4D474E6A4E5441304D6A6B324D6D5A6B4F446335596A5A684E6A51335A4451314D6D55334D54493559694937624746755A3356685A325638637A6F344F694A7A59326870626D567A5A534937624746755A3356685A32567A58326C6B66484D364D546F694D694937624746755A3356685A32567A58324E765A475638637A6F794F694A6E59694937633256735A574E305A575266596D393466484D364D544D36496D4E76626D5A705A33567959585270623234694F326830625778665A57527064473979583342795A575A6C636D567559325666633352686448567A66484D364E446F69546B394F52534937595752746157356661575238637A6F784F694978496A733D);
INSERT INTO `sessions` VALUES ('rhnm4bo7m88sbqeoja2matptk2', '1533725391', 0x6332566A64584A7064486C556232746C626E787A4F6A4D794F6949314E47526C4E44457A4E54566A4D5456694E6A566C5954566B4F544932593252684F4441324E47597A5A534937624746755A3356685A325638637A6F344F694A7A59326870626D567A5A534937624746755A3356685A32567A58326C6B66484D364D546F694D694937624746755A3356685A32567A58324E765A475638637A6F794F694A6E59694937633256735A574E305A575266596D393466484D364D544D36496D4E76626D5A705A33567959585270623234694F326830625778665A57527064473979583342795A575A6C636D567559325666633352686448567A66484D364E446F69546B394F52534937615731685A325666614746755A47786C636C396C636E4A76636E4E38596A6F774F773D3D);
INSERT INTO `sessions` VALUES ('uttstriequ3bsvbvbkd9hipth0', '1533725420', 0x6332566A64584A7064486C556232746C626E787A4F6A4D794F694A6A4D474E6A4E5441304D6A6B324D6D5A6B4F446335596A5A684E6A51335A4451314D6D55334D54493559694937624746755A3356685A325638637A6F344F694A7A59326870626D567A5A534937624746755A3356685A32567A58326C6B66484D364D546F694D694937624746755A3356685A32567A58324E765A475638637A6F794F694A6E59694937633256735A574E305A575266596D393466484D364D544D36496D4E76626D5A705A33567959585270623234694F326830625778665A57527064473979583342795A575A6C636D567559325666633352686448567A66484D364E446F69546B394F525349376247396E61573566595852305A573177644878704F6A4537);

-- ----------------------------
-- Table structure for `specials`
-- ----------------------------
DROP TABLE IF EXISTS `specials`;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specials
-- ----------------------------
INSERT INTO `specials` VALUES ('1', '3', '39.9900', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('2', '5', '30.0000', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('3', '6', '30.0000', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('4', '16', '29.9900', '2003-12-23 03:18:19', '0001-01-01 00:00:00', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('5', '41', '90.0000', '2003-12-25 19:15:47', '2004-09-27 13:33:33', '2008-02-21', '2018-08-08 12:34:50', '0', '0001-01-01');
INSERT INTO `specials` VALUES ('6', '42', '95.0000', '2003-12-25 19:15:57', '2004-01-04 13:07:27', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('7', '44', '90.0000', '2003-12-25 21:54:50', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('8', '46', '90.0000', '2003-12-25 21:55:01', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('9', '53', '20.0000', '2003-12-28 23:59:03', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('10', '39', '75.0000', '2003-12-31 02:03:59', '2004-02-21 00:36:40', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('14', '74', '399.2000', '2004-01-02 15:35:30', '2004-01-02 17:38:43', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('27', '59', '300.0000', '2004-01-03 01:51:50', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('28', '76', '75.0000', '2004-01-03 23:09:36', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('29', '78', '112.5000', '2004-01-04 01:12:14', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('31', '83', '90.0000', '2004-01-04 15:03:07', '2004-01-06 10:02:25', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('32', '85', '90.0000', '2004-01-04 15:19:59', '2004-01-06 09:59:59', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('34', '88', '90.0000', '2004-01-05 00:16:22', '2004-01-06 09:59:30', '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('35', '90', '90.0000', '2004-01-05 23:57:20', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('36', '94', '90.0000', '2004-01-06 00:07:34', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('38', '95', '90.0000', '2004-01-07 02:39:58', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('39', '97', '90.0000', '2004-01-07 11:29:03', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('40', '100', '374.2500', '2004-01-08 14:07:31', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('42', '111', '90.0000', '2004-01-24 16:14:19', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');
INSERT INTO `specials` VALUES ('44', '130', '10.0000', '2004-04-28 02:46:44', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `specials` VALUES ('45', '173', '47.5000', '2004-09-24 23:57:05', null, '2004-09-28', '2004-09-28 18:48:42', '0', '0001-01-01');
INSERT INTO `specials` VALUES ('46', '166', '3.0000', '2004-10-03 20:24:53', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `specials` VALUES ('47', '177', '75.0000', '2004-10-05 16:49:33', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `specials` VALUES ('48', '178', '50.0000', '2004-10-05 16:56:46', null, '0001-01-01', null, '1', '0001-01-01');
INSERT INTO `specials` VALUES ('50', '40', '75.0000', '2004-01-08 14:07:31', null, '0001-01-01', '0001-01-01 00:00:00', '1', '0001-01-01');

-- ----------------------------
-- Table structure for `tax_class`
-- ----------------------------
DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_class
-- ----------------------------
INSERT INTO `tax_class` VALUES ('1', '附加购物税', '以下商品含非食物、服务等。', null, '2018-08-08 12:34:00');

-- ----------------------------
-- Table structure for `tax_rates`
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax_rates
-- ----------------------------
INSERT INTO `tax_rates` VALUES ('1', '1', '1', '1', '3.0000', '演示税率', '2018-08-08 12:34:00', '2018-08-08 12:34:00');

-- ----------------------------
-- Table structure for `template_select`
-- ----------------------------
DROP TABLE IF EXISTS `template_select`;
CREATE TABLE `template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_select
-- ----------------------------
INSERT INTO `template_select` VALUES ('1', 'crista_blue', '0');

-- ----------------------------
-- Table structure for `upgrade_exceptions`
-- ----------------------------
DROP TABLE IF EXISTS `upgrade_exceptions`;
CREATE TABLE `upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upgrade_exceptions
-- ----------------------------
INSERT INTO `upgrade_exceptions` VALUES ('1', 'sql/mysql_utf8.sql', '无法插入配置值 \"CURRENCIES_TRANSLATIONS\" ，已存在', '2018-08-08 12:34:01', 'INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES (\'Convert currencies for Text emails\', \'CURRENCIES_TRANSLATIONS\', \'\', \'What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;\', 12, 120, NULL, \'2003-11-21 00:00:00\', NULL, \'zen_cfg_textarea_small(\');');

-- ----------------------------
-- Table structure for `whos_online`
-- ----------------------------
DROP TABLE IF EXISTS `whos_online`;
CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whos_online
-- ----------------------------
INSERT INTO `whos_online` VALUES ('0', '&yen;Guest', 'i3eoud6kdnrjpoedm3pg0mois7', '127.0.0.1', '1533724561', '1533724561', '/', 'OFFICE_IP_TO_HOST_ADDRESS', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0');

-- ----------------------------
-- Table structure for `zones`
-- ----------------------------
DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zones
-- ----------------------------
INSERT INTO `zones` VALUES ('1', '223', 'AL', 'Alabama');
INSERT INTO `zones` VALUES ('2', '223', 'AK', 'Alaska');
INSERT INTO `zones` VALUES ('3', '223', 'AS', 'American Samoa');
INSERT INTO `zones` VALUES ('4', '223', 'AZ', 'Arizona');
INSERT INTO `zones` VALUES ('5', '223', 'AR', 'Arkansas');
INSERT INTO `zones` VALUES ('7', '223', 'AA', 'Armed Forces Americas');
INSERT INTO `zones` VALUES ('9', '223', 'AE', 'Armed Forces Europe');
INSERT INTO `zones` VALUES ('11', '223', 'AP', 'Armed Forces Pacific');
INSERT INTO `zones` VALUES ('12', '223', 'CA', 'California');
INSERT INTO `zones` VALUES ('13', '223', 'CO', 'Colorado');
INSERT INTO `zones` VALUES ('14', '223', 'CT', 'Connecticut');
INSERT INTO `zones` VALUES ('15', '223', 'DE', 'Delaware');
INSERT INTO `zones` VALUES ('16', '223', 'DC', 'District of Columbia');
INSERT INTO `zones` VALUES ('17', '223', 'FM', 'Federated States Of Micronesia');
INSERT INTO `zones` VALUES ('18', '223', 'FL', 'Florida');
INSERT INTO `zones` VALUES ('19', '223', 'GA', 'Georgia');
INSERT INTO `zones` VALUES ('20', '223', 'GU', 'Guam');
INSERT INTO `zones` VALUES ('21', '223', 'HI', 'Hawaii');
INSERT INTO `zones` VALUES ('22', '223', 'ID', 'Idaho');
INSERT INTO `zones` VALUES ('23', '223', 'IL', 'Illinois');
INSERT INTO `zones` VALUES ('24', '223', 'IN', 'Indiana');
INSERT INTO `zones` VALUES ('25', '223', 'IA', 'Iowa');
INSERT INTO `zones` VALUES ('26', '223', 'KS', 'Kansas');
INSERT INTO `zones` VALUES ('27', '223', 'KY', 'Kentucky');
INSERT INTO `zones` VALUES ('28', '223', 'LA', 'Louisiana');
INSERT INTO `zones` VALUES ('29', '223', 'ME', 'Maine');
INSERT INTO `zones` VALUES ('30', '223', 'MH', 'Marshall Islands');
INSERT INTO `zones` VALUES ('31', '223', 'MD', 'Maryland');
INSERT INTO `zones` VALUES ('32', '223', 'MA', 'Massachusetts');
INSERT INTO `zones` VALUES ('33', '223', 'MI', 'Michigan');
INSERT INTO `zones` VALUES ('34', '223', 'MN', 'Minnesota');
INSERT INTO `zones` VALUES ('35', '223', 'MS', 'Mississippi');
INSERT INTO `zones` VALUES ('36', '223', 'MO', 'Missouri');
INSERT INTO `zones` VALUES ('37', '223', 'MT', 'Montana');
INSERT INTO `zones` VALUES ('38', '223', 'NE', 'Nebraska');
INSERT INTO `zones` VALUES ('39', '223', 'NV', 'Nevada');
INSERT INTO `zones` VALUES ('40', '223', 'NH', 'New Hampshire');
INSERT INTO `zones` VALUES ('41', '223', 'NJ', 'New Jersey');
INSERT INTO `zones` VALUES ('42', '223', 'NM', 'New Mexico');
INSERT INTO `zones` VALUES ('43', '223', 'NY', 'New York');
INSERT INTO `zones` VALUES ('44', '223', 'NC', 'North Carolina');
INSERT INTO `zones` VALUES ('45', '223', 'ND', 'North Dakota');
INSERT INTO `zones` VALUES ('46', '223', 'MP', 'Northern Mariana Islands');
INSERT INTO `zones` VALUES ('47', '223', 'OH', 'Ohio');
INSERT INTO `zones` VALUES ('48', '223', 'OK', 'Oklahoma');
INSERT INTO `zones` VALUES ('49', '223', 'OR', 'Oregon');
INSERT INTO `zones` VALUES ('50', '163', 'PW', 'Palau');
INSERT INTO `zones` VALUES ('51', '223', 'PA', 'Pennsylvania');
INSERT INTO `zones` VALUES ('52', '223', 'PR', 'Puerto Rico');
INSERT INTO `zones` VALUES ('53', '223', 'RI', 'Rhode Island');
INSERT INTO `zones` VALUES ('54', '223', 'SC', 'South Carolina');
INSERT INTO `zones` VALUES ('55', '223', 'SD', 'South Dakota');
INSERT INTO `zones` VALUES ('56', '223', 'TN', 'Tennessee');
INSERT INTO `zones` VALUES ('57', '223', 'TX', 'Texas');
INSERT INTO `zones` VALUES ('58', '223', 'UT', 'Utah');
INSERT INTO `zones` VALUES ('59', '223', 'VT', 'Vermont');
INSERT INTO `zones` VALUES ('60', '223', 'VI', 'Virgin Islands');
INSERT INTO `zones` VALUES ('61', '223', 'VA', 'Virginia');
INSERT INTO `zones` VALUES ('62', '223', 'WA', 'Washington');
INSERT INTO `zones` VALUES ('63', '223', 'WV', 'West Virginia');
INSERT INTO `zones` VALUES ('64', '223', 'WI', 'Wisconsin');
INSERT INTO `zones` VALUES ('65', '223', 'WY', 'Wyoming');
INSERT INTO `zones` VALUES ('66', '38', 'AB', 'Alberta');
INSERT INTO `zones` VALUES ('67', '38', 'BC', 'British Columbia');
INSERT INTO `zones` VALUES ('68', '38', 'MB', 'Manitoba');
INSERT INTO `zones` VALUES ('69', '38', 'NL', 'Newfoundland');
INSERT INTO `zones` VALUES ('70', '38', 'NB', 'New Brunswick');
INSERT INTO `zones` VALUES ('71', '38', 'NS', 'Nova Scotia');
INSERT INTO `zones` VALUES ('72', '38', 'NT', 'Northwest Territories');
INSERT INTO `zones` VALUES ('73', '38', 'NU', 'Nunavut');
INSERT INTO `zones` VALUES ('74', '38', 'ON', 'Ontario');
INSERT INTO `zones` VALUES ('75', '38', 'PE', 'Prince Edward Island');
INSERT INTO `zones` VALUES ('76', '38', 'QC', 'Quebec');
INSERT INTO `zones` VALUES ('77', '38', 'SK', 'Saskatchewan');
INSERT INTO `zones` VALUES ('78', '38', 'YT', 'Yukon Territory');
INSERT INTO `zones` VALUES ('79', '81', 'NDS', 'Niedersachsen');
INSERT INTO `zones` VALUES ('80', '81', 'BAW', 'Baden-Württemberg');
INSERT INTO `zones` VALUES ('81', '81', 'BAY', 'Bayern');
INSERT INTO `zones` VALUES ('82', '81', 'BER', 'Berlin');
INSERT INTO `zones` VALUES ('83', '81', 'BRG', 'Brandenburg');
INSERT INTO `zones` VALUES ('84', '81', 'BRE', 'Bremen');
INSERT INTO `zones` VALUES ('85', '81', 'HAM', 'Hamburg');
INSERT INTO `zones` VALUES ('86', '81', 'HES', 'Hessen');
INSERT INTO `zones` VALUES ('87', '81', 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO `zones` VALUES ('88', '81', 'NRW', 'Nordrhein-Westfalen');
INSERT INTO `zones` VALUES ('89', '81', 'RHE', 'Rheinland-Pfalz');
INSERT INTO `zones` VALUES ('90', '81', 'SAR', 'Saarland');
INSERT INTO `zones` VALUES ('91', '81', 'SAS', 'Sachsen');
INSERT INTO `zones` VALUES ('92', '81', 'SAC', 'Sachsen-Anhalt');
INSERT INTO `zones` VALUES ('93', '81', 'SCN', 'Schleswig-Holstein');
INSERT INTO `zones` VALUES ('94', '81', 'THE', 'Thüringen');
INSERT INTO `zones` VALUES ('95', '14', 'WI', 'Wien');
INSERT INTO `zones` VALUES ('96', '14', 'NO', 'Niederösterreich');
INSERT INTO `zones` VALUES ('97', '14', 'OO', 'Oberösterreich');
INSERT INTO `zones` VALUES ('98', '14', 'SB', 'Salzburg');
INSERT INTO `zones` VALUES ('99', '14', 'KN', 'Kärnten');
INSERT INTO `zones` VALUES ('100', '14', 'ST', 'Steiermark');
INSERT INTO `zones` VALUES ('101', '14', 'TI', 'Tirol');
INSERT INTO `zones` VALUES ('102', '14', 'BL', 'Burgenland');
INSERT INTO `zones` VALUES ('103', '14', 'VB', 'Voralberg');
INSERT INTO `zones` VALUES ('104', '204', 'AG', 'Aargau');
INSERT INTO `zones` VALUES ('105', '204', 'AI', 'Appenzell Innerrhoden');
INSERT INTO `zones` VALUES ('106', '204', 'AR', 'Appenzell Ausserrhoden');
INSERT INTO `zones` VALUES ('107', '204', 'BE', 'Bern');
INSERT INTO `zones` VALUES ('108', '204', 'BL', 'Basel-Landschaft');
INSERT INTO `zones` VALUES ('109', '204', 'BS', 'Basel-Stadt');
INSERT INTO `zones` VALUES ('110', '204', 'FR', 'Freiburg');
INSERT INTO `zones` VALUES ('111', '204', 'GE', 'Genf');
INSERT INTO `zones` VALUES ('112', '204', 'GL', 'Glarus');
INSERT INTO `zones` VALUES ('113', '204', 'JU', 'Graubnden');
INSERT INTO `zones` VALUES ('114', '204', 'JU', 'Jura');
INSERT INTO `zones` VALUES ('115', '204', 'LU', 'Luzern');
INSERT INTO `zones` VALUES ('116', '204', 'NE', 'Neuenburg');
INSERT INTO `zones` VALUES ('117', '204', 'NW', 'Nidwalden');
INSERT INTO `zones` VALUES ('118', '204', 'OW', 'Obwalden');
INSERT INTO `zones` VALUES ('119', '204', 'SG', 'St. Gallen');
INSERT INTO `zones` VALUES ('120', '204', 'SH', 'Schaffhausen');
INSERT INTO `zones` VALUES ('121', '204', 'SO', 'Solothurn');
INSERT INTO `zones` VALUES ('122', '204', 'SZ', 'Schwyz');
INSERT INTO `zones` VALUES ('123', '204', 'TG', 'Thurgau');
INSERT INTO `zones` VALUES ('124', '204', 'TI', 'Tessin');
INSERT INTO `zones` VALUES ('125', '204', 'UR', 'Uri');
INSERT INTO `zones` VALUES ('126', '204', 'VD', 'Waadt');
INSERT INTO `zones` VALUES ('127', '204', 'VS', 'Wallis');
INSERT INTO `zones` VALUES ('128', '204', 'ZG', 'Zug');
INSERT INTO `zones` VALUES ('129', '204', 'ZH', 'Zürich');
INSERT INTO `zones` VALUES ('130', '44', '安徽', '安徽');
INSERT INTO `zones` VALUES ('131', '44', '北京', '北京');
INSERT INTO `zones` VALUES ('132', '44', '重庆', '重庆');
INSERT INTO `zones` VALUES ('133', '44', '福建', '福建');
INSERT INTO `zones` VALUES ('134', '44', '甘肃', '甘肃');
INSERT INTO `zones` VALUES ('135', '44', '广东', '广东');
INSERT INTO `zones` VALUES ('136', '44', '广西', '广西');
INSERT INTO `zones` VALUES ('137', '44', '贵州', '贵州');
INSERT INTO `zones` VALUES ('138', '44', '海南', '海南');
INSERT INTO `zones` VALUES ('139', '44', '河北', '河北');
INSERT INTO `zones` VALUES ('140', '44', '黑龙江', '黑龙江');
INSERT INTO `zones` VALUES ('141', '44', '河南', '河南');
INSERT INTO `zones` VALUES ('142', '44', '香港', '香港');
INSERT INTO `zones` VALUES ('143', '44', '湖北', '湖北');
INSERT INTO `zones` VALUES ('144', '44', '湖南', '湖南');
INSERT INTO `zones` VALUES ('145', '44', '江苏', '江苏');
INSERT INTO `zones` VALUES ('146', '44', '江西', '江西');
INSERT INTO `zones` VALUES ('147', '44', '吉林', '吉林');
INSERT INTO `zones` VALUES ('148', '44', '辽宁', '辽宁');
INSERT INTO `zones` VALUES ('149', '44', '澳门', '澳门');
INSERT INTO `zones` VALUES ('150', '44', '内蒙古', '内蒙古');
INSERT INTO `zones` VALUES ('151', '44', '宁夏', '宁夏');
INSERT INTO `zones` VALUES ('152', '44', '青海', '青海');
INSERT INTO `zones` VALUES ('153', '44', '山西', '山西');
INSERT INTO `zones` VALUES ('154', '44', '陕西', '陕西');
INSERT INTO `zones` VALUES ('155', '44', '山东', '山东');
INSERT INTO `zones` VALUES ('156', '44', '上海', '上海');
INSERT INTO `zones` VALUES ('157', '44', '四川', '四川');
INSERT INTO `zones` VALUES ('158', '44', '台湾', '台湾');
INSERT INTO `zones` VALUES ('159', '44', '天津', '天津');
INSERT INTO `zones` VALUES ('160', '44', '新疆', '新疆');
INSERT INTO `zones` VALUES ('161', '44', '西藏', '西藏');
INSERT INTO `zones` VALUES ('162', '44', '云南', '云南');
INSERT INTO `zones` VALUES ('163', '44', '浙江', '浙江');
INSERT INTO `zones` VALUES ('164', '195', 'A Coruña', 'A Coruña');
INSERT INTO `zones` VALUES ('165', '195', 'Álava', 'Álava');
INSERT INTO `zones` VALUES ('166', '195', 'Albacete', 'Albacete');
INSERT INTO `zones` VALUES ('167', '195', 'Alicante', 'Alicante');
INSERT INTO `zones` VALUES ('168', '195', 'Almería', 'Almería');
INSERT INTO `zones` VALUES ('169', '195', 'Asturias', 'Asturias');
INSERT INTO `zones` VALUES ('170', '195', 'Ávila', 'Ávila');
INSERT INTO `zones` VALUES ('171', '195', 'Badajoz', 'Badajoz');
INSERT INTO `zones` VALUES ('172', '195', 'Baleares', 'Baleares');
INSERT INTO `zones` VALUES ('173', '195', 'Barcelona', 'Barcelona');
INSERT INTO `zones` VALUES ('174', '195', 'Burgos', 'Burgos');
INSERT INTO `zones` VALUES ('175', '195', 'Cáceres', 'Cáceres');
INSERT INTO `zones` VALUES ('176', '195', 'Cádiz', 'Cádiz');
INSERT INTO `zones` VALUES ('177', '195', 'Cantabria', 'Cantabria');
INSERT INTO `zones` VALUES ('178', '195', 'Castellón', 'Castellón');
INSERT INTO `zones` VALUES ('179', '195', 'Ceuta', 'Ceuta');
INSERT INTO `zones` VALUES ('180', '195', 'Ciudad Real', 'Ciudad Real');
INSERT INTO `zones` VALUES ('181', '195', 'Córdoba', 'Córdoba');
INSERT INTO `zones` VALUES ('182', '195', 'Cuenca', 'Cuenca');
INSERT INTO `zones` VALUES ('183', '195', 'Girona', 'Girona');
INSERT INTO `zones` VALUES ('184', '195', 'Granada', 'Granada');
INSERT INTO `zones` VALUES ('185', '195', 'Guadalajara', 'Guadalajara');
INSERT INTO `zones` VALUES ('186', '195', 'Guipúzcoa', 'Guipúzcoa');
INSERT INTO `zones` VALUES ('187', '195', 'Huelva', 'Huelva');
INSERT INTO `zones` VALUES ('188', '195', 'Huesca', 'Huesca');
INSERT INTO `zones` VALUES ('189', '195', 'Jaén', 'Jaén');
INSERT INTO `zones` VALUES ('190', '195', 'La Rioja', 'La Rioja');
INSERT INTO `zones` VALUES ('191', '195', 'Las Palmas', 'Las Palmas');
INSERT INTO `zones` VALUES ('192', '195', 'León', 'León');
INSERT INTO `zones` VALUES ('193', '195', 'Lérida', 'Lérida');
INSERT INTO `zones` VALUES ('194', '195', 'Lugo', 'Lugo');
INSERT INTO `zones` VALUES ('195', '195', 'Madrid', 'Madrid');
INSERT INTO `zones` VALUES ('196', '195', 'Málaga', 'Málaga');
INSERT INTO `zones` VALUES ('197', '195', 'Melilla', 'Melilla');
INSERT INTO `zones` VALUES ('198', '195', 'Murcia', 'Murcia');
INSERT INTO `zones` VALUES ('199', '195', 'Navarra', 'Navarra');
INSERT INTO `zones` VALUES ('200', '195', 'Ourense', 'Ourense');
INSERT INTO `zones` VALUES ('201', '195', 'Palencia', 'Palencia');
INSERT INTO `zones` VALUES ('202', '195', 'Pontevedra', 'Pontevedra');
INSERT INTO `zones` VALUES ('203', '195', 'Salamanca', 'Salamanca');
INSERT INTO `zones` VALUES ('204', '195', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO `zones` VALUES ('205', '195', 'Segovia', 'Segovia');
INSERT INTO `zones` VALUES ('206', '195', 'Sevilla', 'Sevilla');
INSERT INTO `zones` VALUES ('207', '195', 'Soria', 'Soria');
INSERT INTO `zones` VALUES ('208', '195', 'Tarragona', 'Tarragona');
INSERT INTO `zones` VALUES ('209', '195', 'Teruel', 'Teruel');
INSERT INTO `zones` VALUES ('210', '195', 'Toledo', 'Toledo');
INSERT INTO `zones` VALUES ('211', '195', 'Valencia', 'Valencia');
INSERT INTO `zones` VALUES ('212', '195', 'Valladolid', 'Valladolid');
INSERT INTO `zones` VALUES ('213', '195', 'Vizcaya', 'Vizcaya');
INSERT INTO `zones` VALUES ('214', '195', 'Zamora', 'Zamora');
INSERT INTO `zones` VALUES ('215', '195', 'Zaragoza', 'Zaragoza');
INSERT INTO `zones` VALUES ('216', '13', 'ACT', 'Australian Capital Territory');
INSERT INTO `zones` VALUES ('217', '13', 'NSW', 'New South Wales');
INSERT INTO `zones` VALUES ('218', '13', 'NT', 'Northern Territory');
INSERT INTO `zones` VALUES ('219', '13', 'QLD', 'Queensland');
INSERT INTO `zones` VALUES ('220', '13', 'SA', 'South Australia');
INSERT INTO `zones` VALUES ('221', '13', 'TAS', 'Tasmania');
INSERT INTO `zones` VALUES ('222', '13', 'VIC', 'Victoria');
INSERT INTO `zones` VALUES ('223', '13', 'WA', 'Western Australia');
INSERT INTO `zones` VALUES ('224', '105', 'AG', 'Agrigento');
INSERT INTO `zones` VALUES ('225', '105', 'AL', 'Alessandria');
INSERT INTO `zones` VALUES ('226', '105', 'AN', 'Ancona');
INSERT INTO `zones` VALUES ('227', '105', 'AO', 'Aosta');
INSERT INTO `zones` VALUES ('228', '105', 'AR', 'Arezzo');
INSERT INTO `zones` VALUES ('229', '105', 'AP', 'Ascoli Piceno');
INSERT INTO `zones` VALUES ('230', '105', 'AT', 'Asti');
INSERT INTO `zones` VALUES ('231', '105', 'AV', 'Avellino');
INSERT INTO `zones` VALUES ('232', '105', 'BA', 'Bari');
INSERT INTO `zones` VALUES ('233', '105', 'BT', 'Barletta Andria Trani');
INSERT INTO `zones` VALUES ('234', '105', 'BL', 'Belluno');
INSERT INTO `zones` VALUES ('235', '105', 'BN', 'Benevento');
INSERT INTO `zones` VALUES ('236', '105', 'BG', 'Bergamo');
INSERT INTO `zones` VALUES ('237', '105', 'BI', 'Biella');
INSERT INTO `zones` VALUES ('238', '105', 'BO', 'Bologna');
INSERT INTO `zones` VALUES ('239', '105', 'BZ', 'Bolzano');
INSERT INTO `zones` VALUES ('240', '105', 'BS', 'Brescia');
INSERT INTO `zones` VALUES ('241', '105', 'BR', 'Brindisi');
INSERT INTO `zones` VALUES ('242', '105', 'CA', 'Cagliari');
INSERT INTO `zones` VALUES ('243', '105', 'CL', 'Caltanissetta');
INSERT INTO `zones` VALUES ('244', '105', 'CB', 'Campobasso');
INSERT INTO `zones` VALUES ('245', '105', 'CI', 'Carbonia-Iglesias');
INSERT INTO `zones` VALUES ('246', '105', 'CE', 'Caserta');
INSERT INTO `zones` VALUES ('247', '105', 'CT', 'Catania');
INSERT INTO `zones` VALUES ('248', '105', 'CZ', 'Catanzaro');
INSERT INTO `zones` VALUES ('249', '105', 'CH', 'Chieti');
INSERT INTO `zones` VALUES ('250', '105', 'CO', 'Como');
INSERT INTO `zones` VALUES ('251', '105', 'CS', 'Cosenza');
INSERT INTO `zones` VALUES ('252', '105', 'CR', 'Cremona');
INSERT INTO `zones` VALUES ('253', '105', 'KR', 'Crotone');
INSERT INTO `zones` VALUES ('254', '105', 'CN', 'Cuneo');
INSERT INTO `zones` VALUES ('255', '105', 'EN', 'Enna');
INSERT INTO `zones` VALUES ('256', '105', 'FM', 'Fermo');
INSERT INTO `zones` VALUES ('257', '105', 'FE', 'Ferrara');
INSERT INTO `zones` VALUES ('258', '105', 'FI', 'Firenze');
INSERT INTO `zones` VALUES ('259', '105', 'FG', 'Foggia');
INSERT INTO `zones` VALUES ('260', '105', 'FC', 'Forlì Cesena');
INSERT INTO `zones` VALUES ('261', '105', 'FR', 'Frosinone');
INSERT INTO `zones` VALUES ('262', '105', 'GE', 'Genova');
INSERT INTO `zones` VALUES ('263', '105', 'GO', 'Gorizia');
INSERT INTO `zones` VALUES ('264', '105', 'GR', 'Grosseto');
INSERT INTO `zones` VALUES ('265', '105', 'IM', 'Imperia');
INSERT INTO `zones` VALUES ('266', '105', 'IS', 'Isernia');
INSERT INTO `zones` VALUES ('267', '105', 'AQ', 'Aquila');
INSERT INTO `zones` VALUES ('268', '105', 'SP', 'La Spezia');
INSERT INTO `zones` VALUES ('269', '105', 'LT', 'Latina');
INSERT INTO `zones` VALUES ('270', '105', 'LE', 'Lecce');
INSERT INTO `zones` VALUES ('271', '105', 'LC', 'Lecco');
INSERT INTO `zones` VALUES ('272', '105', 'LI', 'Livorno');
INSERT INTO `zones` VALUES ('273', '105', 'LO', 'Lodi');
INSERT INTO `zones` VALUES ('274', '105', 'LU', 'Lucca');
INSERT INTO `zones` VALUES ('275', '105', 'MC', 'Macerata');
INSERT INTO `zones` VALUES ('276', '105', 'MN', 'Mantova');
INSERT INTO `zones` VALUES ('277', '105', 'MS', 'Massa Carrara');
INSERT INTO `zones` VALUES ('278', '105', 'MT', 'Matera');
INSERT INTO `zones` VALUES ('279', '105', 'VS', 'Medio Campidano');
INSERT INTO `zones` VALUES ('280', '105', 'ME', 'Messina');
INSERT INTO `zones` VALUES ('281', '105', 'MI', 'Milano');
INSERT INTO `zones` VALUES ('282', '105', 'MO', 'Modena');
INSERT INTO `zones` VALUES ('283', '105', 'MB', 'Monza e Brianza');
INSERT INTO `zones` VALUES ('284', '105', 'NA', 'Napoli');
INSERT INTO `zones` VALUES ('285', '105', 'NO', 'Novara');
INSERT INTO `zones` VALUES ('286', '105', 'NU', 'Nuoro');
INSERT INTO `zones` VALUES ('287', '105', 'OG', 'Ogliastra');
INSERT INTO `zones` VALUES ('288', '105', 'OT', 'Olbia-Tempio');
INSERT INTO `zones` VALUES ('289', '105', 'OR', 'Oristano');
INSERT INTO `zones` VALUES ('290', '105', 'PD', 'Padova');
INSERT INTO `zones` VALUES ('291', '105', 'PA', 'Palermo');
INSERT INTO `zones` VALUES ('292', '105', 'PR', 'Parma');
INSERT INTO `zones` VALUES ('293', '105', 'PG', 'Perugia');
INSERT INTO `zones` VALUES ('294', '105', 'PV', 'Pavia');
INSERT INTO `zones` VALUES ('295', '105', 'PU', 'Pesaro Urbino');
INSERT INTO `zones` VALUES ('296', '105', 'PE', 'Pescara');
INSERT INTO `zones` VALUES ('297', '105', 'PC', 'Piacenza');
INSERT INTO `zones` VALUES ('298', '105', 'PI', 'Pisa');
INSERT INTO `zones` VALUES ('299', '105', 'PT', 'Pistoia');
INSERT INTO `zones` VALUES ('300', '105', 'PN', 'Pordenone');
INSERT INTO `zones` VALUES ('301', '105', 'PZ', 'Potenza');
INSERT INTO `zones` VALUES ('302', '105', 'PO', 'Prato');
INSERT INTO `zones` VALUES ('303', '105', 'RG', 'Ragusa');
INSERT INTO `zones` VALUES ('304', '105', 'RA', 'Ravenna');
INSERT INTO `zones` VALUES ('305', '105', 'RC', 'Reggio Calabria');
INSERT INTO `zones` VALUES ('306', '105', 'RE', 'Reggio Emilia');
INSERT INTO `zones` VALUES ('307', '105', 'RI', 'Rieti');
INSERT INTO `zones` VALUES ('308', '105', 'RN', 'Rimini');
INSERT INTO `zones` VALUES ('309', '105', 'RM', 'Roma');
INSERT INTO `zones` VALUES ('310', '105', 'RO', 'Rovigo');
INSERT INTO `zones` VALUES ('311', '105', 'SA', 'Salerno');
INSERT INTO `zones` VALUES ('312', '105', 'SS', 'Sassari');
INSERT INTO `zones` VALUES ('313', '105', 'SV', 'Savona');
INSERT INTO `zones` VALUES ('314', '105', 'SI', 'Siena');
INSERT INTO `zones` VALUES ('315', '105', 'SR', 'Siracusa');
INSERT INTO `zones` VALUES ('316', '105', 'SO', 'Sondrio');
INSERT INTO `zones` VALUES ('317', '105', 'TA', 'Taranto');
INSERT INTO `zones` VALUES ('318', '105', 'TE', 'Teramo');
INSERT INTO `zones` VALUES ('319', '105', 'TR', 'Terni');
INSERT INTO `zones` VALUES ('320', '105', 'TO', 'Torino');
INSERT INTO `zones` VALUES ('321', '105', 'TP', 'Trapani');
INSERT INTO `zones` VALUES ('322', '105', 'TN', 'Trento');
INSERT INTO `zones` VALUES ('323', '105', 'TV', 'Treviso');
INSERT INTO `zones` VALUES ('324', '105', 'TS', 'Trieste');
INSERT INTO `zones` VALUES ('325', '105', 'UD', 'Udine');
INSERT INTO `zones` VALUES ('326', '105', 'VA', 'Varese');
INSERT INTO `zones` VALUES ('327', '105', 'VE', 'Venezia');
INSERT INTO `zones` VALUES ('328', '105', 'VB', 'Verbania');
INSERT INTO `zones` VALUES ('329', '105', 'VC', 'Vercelli');
INSERT INTO `zones` VALUES ('330', '105', 'VR', 'Verona');
INSERT INTO `zones` VALUES ('331', '105', 'VV', 'Vibo Valentia');
INSERT INTO `zones` VALUES ('332', '105', 'VI', 'Vicenza');
INSERT INTO `zones` VALUES ('333', '105', 'VT', 'Viterbo');

-- ----------------------------
-- Table structure for `zones_to_geo_zones`
-- ----------------------------
DROP TABLE IF EXISTS `zones_to_geo_zones`;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zones_to_geo_zones
-- ----------------------------
INSERT INTO `zones_to_geo_zones` VALUES ('1', '44', '67', '1', null, '2018-08-08 12:34:00');
