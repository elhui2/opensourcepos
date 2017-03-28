-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2017 at 06:56 PM
-- Server version: 5.5.54-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ospos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ospos_app_config`
--

CREATE TABLE `ospos_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('address', '123 Nowhere street'),
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_font', 'Arial'),
('barcode_font_size', '10'),
('barcode_generate_if_empty', '0'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_quality', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'unit_price'),
('barcode_type', 'Code39'),
('barcode_width', '250'),
('client_id', 'b2c451ea-8f3f-4b02-9e13-80cac6b1cee3'),
('company', 'Open Source Point of Sale'),
('company_logo', ''),
('country_codes', 'us'),
('currency_decimals', '2'),
('currency_symbol', '$'),
('custom10_name', ''),
('custom1_name', 'boleto'),
('custom2_name', ''),
('custom3_name', ''),
('custom4_name', ''),
('custom5_name', ''),
('custom6_name', ''),
('custom7_name', ''),
('custom8_name', ''),
('custom9_name', ''),
('customer_reward_enable', ''),
('dateformat', 'm/d/Y'),
('date_or_time_format', ''),
('default_register_mode', 'sale'),
('default_sales_discount', '0'),
('default_tax_1_name', 'IVA'),
('default_tax_1_rate', '16'),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_rate', '8'),
('email', 'changeme@example.com'),
('fax', ''),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear $CU, In attachment the receipt for sale $INV'),
('invoice_enable', '1'),
('language', 'spanish'),
('language_code', 'es'),
('last_used_invoice_number', '0'),
('last_used_quote_number', '0'),
('lines_per_page', '25'),
('line_sequence', '0'),
('mailpath', '/usr/sbin/sendmail'),
('msg_msg', ''),
('msg_pwd', ''),
('msg_src', ''),
('msg_uid', ''),
('notify_horizontal_position', 'center'),
('notify_vertical_position', 'bottom'),
('number_locale', 'en_US'),
('payment_options_order', 'cashdebitcredit'),
('phone', '555-555-5555'),
('print_bottom_margin', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('protocol', 'mail'),
('quantity_decimals', '0'),
('receipt_show_description', '1'),
('receipt_show_serialnumber', '1'),
('receipt_show_taxes', '0'),
('receipt_show_total_discount', '1'),
('receipt_template', 'receipt_default'),
('receiving_calculate_average_price', '0'),
('recv_invoice_format', '$CO'),
('return_policy', 'Test'),
('sales_invoice_format', '$CO'),
('sales_quote_format', 'Q%y{QSEQ:6}'),
('smtp_crypto', 'ssl'),
('smtp_port', '465'),
('smtp_timeout', '5'),
('statistics', '1'),
('tax_decimals', '2'),
('tax_included', '0'),
('theme', 'flatly'),
('thousands_separator', 'thousands_separator'),
('timeformat', 'H:i:s'),
('timezone', 'America/Mexico_City'),
('website', '');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers`
--

CREATE TABLE `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers_packages`
--

CREATE TABLE `ospos_customers_packages` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_customers_packages`
--

INSERT INTO `ospos_customers_packages` (`package_id`, `package_name`, `points_percent`, `deleted`) VALUES
(1, 'Default', 0, 0),
(2, 'Bronze', 10, 0),
(3, 'Silver', 20, 0),
(4, 'Gold', 30, 0),
(5, 'Premium', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers_points`
--

CREATE TABLE `ospos_customers_points` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_dinner_tables`
--

CREATE TABLE `ospos_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_dinner_tables`
--

INSERT INTO `ospos_dinner_tables` (`dinner_table_id`, `name`, `status`, `deleted`) VALUES
(1, 'Delivery', 0, 0),
(2, 'Take Away', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_employees`
--

CREATE TABLE `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `hash_version` int(1) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`, `hash_version`) VALUES
('admin', '$2y$10$vJBSMlD02EC7ENSrKfVQXuvq9tNRHMtcOA8MSK2NYS748HHWm.gcG', 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_giftcards`
--

CREATE TABLE `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL,
  `giftcard_number` int(10) NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_grants`
--

CREATE TABLE `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_grants`
--

INSERT INTO `ospos_grants` (`permission_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('giftcards', 1),
('items', 1),
('items_stock', 1),
('item_kits', 1),
('messages', 1),
('receivings', 1),
('receivings_stock', 1),
('reports', 1),
('reports_categories', 1),
('reports_customers', 1),
('reports_discounts', 1),
('reports_employees', 1),
('reports_inventory', 1),
('reports_items', 1),
('reports_payments', 1),
('reports_receivings', 1),
('reports_sales', 1),
('reports_suppliers', 1),
('reports_taxes', 1),
('sales', 1),
('sales_stock', 1),
('suppliers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_inventory`
--

CREATE TABLE `ospos_inventory` (
  `trans_id` int(11) NOT NULL,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
(1, 1, 1, '2017-03-16 07:50:34', 'Edición Manual de Cantidad', 1, '10.000'),
(2, 1, 1, '2017-03-16 07:53:21', 'POS 1', 1, '-1.000'),
(3, 1, 1, '2017-03-16 07:57:01', 'POS 2', 1, '-1.000'),
(4, 2, 1, '2017-03-21 04:07:33', 'Edición Manual de Cantidad', 1, '100.000'),
(5, 1, 1, '2017-03-24 03:36:18', 'POS 3', 1, '-1.000'),
(6, 1, 1, '2017-03-24 03:54:55', 'POS 4', 1, '-3.000'),
(7, 1, 1, '2017-03-24 03:56:24', 'POS 5', 1, '-1.000'),
(8, 1, 1, '2017-03-24 03:58:06', 'POS 6', 1, '-1.000'),
(9, 1, 1, '2017-03-24 04:15:31', 'POS 7', 1, '-1.000'),
(10, 1, 1, '2017-03-24 04:16:08', 'POS 8', 1, '-1.000'),
(11, 1, 1, '2017-03-27 19:42:29', 'POS 9', 1, '-2.000'),
(12, 1, 1, '2017-03-27 19:43:54', 'POS 10', 1, '-1.000'),
(13, 1, 1, '2017-03-27 19:56:34', 'POS 11', 1, '-1.000'),
(14, 1, 1, '2017-03-27 19:57:01', 'POS 12', 1, '-1.000'),
(15, 1, 1, '2017-03-27 21:19:35', 'POS 13', 1, '-1.000'),
(16, 1, 1, '2017-03-27 23:24:40', 'POS 14', 1, '-3.000'),
(17, 1, 1, '2017-03-27 22:03:25', 'POS 15', 1, '-3.000'),
(18, 1, 1, '2017-03-28 00:39:32', 'POS 16', 1, '-2.000'),
(19, 1, 1, '2017-03-28 00:45:47', 'POS 17', 1, '-1.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items`
--

CREATE TABLE `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `item_id` int(10) NOT NULL,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_type` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_filename`, `allow_alt_description`, `is_serialized`, `stock_type`, `item_type`, `deleted`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
('Entrada', 'tickets', NULL, NULL, '', '30.00', '90.00', '0.000', '10.000', 1, NULL, 0, 0, 1, 0, 0, 'true', '', '', '', '', '', '', '', '', ''),
('Palomitas chicas', 'golosinas', NULL, NULL, '', '5.00', '20.00', '10.000', '100.000', 2, NULL, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items_taxes`
--

CREATE TABLE `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_items_taxes`
--

INSERT INTO `ospos_items_taxes` (`item_id`, `name`, `percent`) VALUES
(1, 'IVA', '16.000'),
(2, 'IVA', '16.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kits`
--

CREATE TABLE `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `kit_discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_option` tinyint(2) NOT NULL DEFAULT '0',
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kit_items`
--

CREATE TABLE `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_quantities`
--

CREATE TABLE `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_item_quantities`
--

INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
(1, 1, '10.000'),
(2, 1, '100.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_modules`
--

CREATE TABLE `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_config', 'module_config_desc', 110, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_messages', 'module_messages_desc', 100, 'messages'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_people`
--

CREATE TABLE `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_people`
--

INSERT INTO `ospos_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('John', 'Doe', NULL, '555-555-5555', 'changeme@example.com', 'Address 1', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_permissions`
--

CREATE TABLE `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('config', 'config', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('giftcards', 'giftcards', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('item_kits', 'item_kits', NULL),
('messages', 'messages', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_suppliers', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_stock', 'sales', 1),
('suppliers', 'suppliers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings`
--

CREATE TABLE `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings_items`
--

CREATE TABLE `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales`
--

CREATE TABLE `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL,
  `dinner_table_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales`
--

INSERT INTO `ospos_sales` (`sale_time`, `customer_id`, `employee_id`, `comment`, `invoice_number`, `sale_id`, `dinner_table_id`) VALUES
('2017-03-24 03:54:55', NULL, 1, '', NULL, 4, NULL),
('2017-03-24 03:56:24', NULL, 1, '', NULL, 5, NULL),
('2017-03-24 03:58:06', NULL, 1, '', NULL, 6, NULL),
('2017-03-24 04:15:31', NULL, 1, '', NULL, 7, NULL),
('2017-03-24 04:16:08', NULL, 1, '', NULL, 8, NULL),
('2017-03-27 19:42:29', NULL, 1, '', NULL, 9, NULL),
('2017-03-27 19:43:54', NULL, 1, '', NULL, 10, NULL),
('2017-03-27 19:56:34', NULL, 1, '', NULL, 11, NULL),
('2017-03-27 19:57:01', NULL, 1, '', NULL, 12, NULL),
('2017-03-27 21:19:35', NULL, 1, '', NULL, 13, NULL),
('2017-03-27 23:24:40', NULL, 1, '', NULL, 14, NULL),
('2017-03-27 22:03:25', NULL, 1, '', NULL, 15, NULL),
('2017-03-28 00:39:32', NULL, 1, '', NULL, 16, NULL),
('2017-03-28 00:45:47', NULL, 1, '', NULL, 17, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items`
--

CREATE TABLE `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_items`
--

INSERT INTO `ospos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `item_location`, `print_option`) VALUES
(4, 1, '', '', 1, '3.000', '30.00', '90.00', '0.00', 1, 0),
(5, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(6, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(7, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(8, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(9, 1, '', '', 1, '2.000', '30.00', '90.00', '0.00', 1, 0),
(10, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(11, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(12, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(13, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0),
(14, 1, '', '', 1, '3.000', '30.00', '90.00', '0.00', 1, 0),
(15, 1, '', '', 1, '3.000', '30.00', '90.00', '0.00', 1, 0),
(16, 1, '', '', 1, '2.000', '30.00', '90.00', '0.00', 1, 0),
(17, 1, '', '', 1, '1.000', '30.00', '90.00', '0.00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items_taxes`
--

CREATE TABLE `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_items_taxes`
--

INSERT INTO `ospos_sales_items_taxes` (`sale_id`, `item_id`, `line`, `name`, `percent`) VALUES
(4, 1, 1, 'IVA', '16.000'),
(5, 1, 1, 'IVA', '16.000'),
(6, 1, 1, 'IVA', '16.000'),
(7, 1, 1, 'IVA', '16.000'),
(8, 1, 1, 'IVA', '16.000'),
(9, 1, 1, 'IVA', '16.000'),
(10, 1, 1, 'IVA', '16.000'),
(11, 1, 1, 'IVA', '16.000'),
(12, 1, 1, 'IVA', '16.000'),
(13, 1, 1, 'IVA', '16.000'),
(14, 1, 1, 'IVA', '16.000'),
(15, 1, 1, 'IVA', '16.000'),
(16, 1, 1, 'IVA', '16.000'),
(17, 1, 1, 'IVA', '16.000');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_payments`
--

CREATE TABLE `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sales_payments`
--

INSERT INTO `ospos_sales_payments` (`sale_id`, `payment_type`, `payment_amount`) VALUES
(4, 'Efectivo', '350.00'),
(5, 'Efectivo', '105.00'),
(6, 'Efectivo', '105.00'),
(7, 'Efectivo', '110.00'),
(8, 'Efectivo', '110.00'),
(9, 'Efectivo', '220.00'),
(10, 'Efectivo', '110.00'),
(11, 'Efectivo', '110.00'),
(12, 'Efectivo', '110.00'),
(13, 'Efectivo', '104.40'),
(14, 'Efectivo', '313.20'),
(15, 'Efectivo', '313.20'),
(16, 'Efectivo', '208.80'),
(17, 'Efectivo', '104.40');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_reward_points`
--

CREATE TABLE `ospos_sales_reward_points` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended`
--

CREATE TABLE `ospos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL,
  `dinner_table_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_items`
--

CREATE TABLE `ospos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_items_taxes`
--

CREATE TABLE `ospos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_payments`
--

CREATE TABLE `ospos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sessions`
--

CREATE TABLE `ospos_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('tufv54hklgsjf5u0g1qcmh3a67gdrqe7', '127.0.0.1', 1489641918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634313631393b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('scdir9ur5mmk1nsn6v13001bqtl3eapj', '127.0.0.1', 1489642010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634313935383b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('agkghlp3149oovdctka13353dfo8ddut', '127.0.0.1', 1489642858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634323835353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('jinfmtbpdfsd38kn3v86bm4pabljuk52', '127.0.0.1', 1489643553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634333137353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('044qic645t440rauod61tskotod44tl5', '127.0.0.1', 1489643821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634333535343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('un7es94fejgsfllpv0k2v57pf488sv4n', '127.0.0.1', 1489644163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634333837303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3230303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('b0fqpa5261e9ku21876jjk8l0nba1p3r', '127.0.0.1', 1489644346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634343334353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('b5hpmvjq6cn8h10ru482seo6td22hhb0', '127.0.0.1', 1489645536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634353335303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('ldgl78c3nhe4oui0ob4vtro5r9qhfn7b', '127.0.0.1', 1489647094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634363936353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('ihinipu098ktj4r0udlhnf86msis35ot', '127.0.0.1', 1489648114, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634373739343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('1ae47gbaspo3s9ndaplrh29nogthat0g', '127.0.0.1', 1489648115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634383131353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ksdhe5c8d17jeharjt4n7h1238c0m9a7', '127.0.0.1', 1489649807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393634383532393b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a39303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b73616c65735f636f6d6d656e747c733a303a22223b),
('8eqragr8tl0ap51fe964pglt5fs0tad9', '127.0.0.1', 1489650629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635303334353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a39303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b73616c65735f636f6d6d656e747c733a303a22223b),
('58uqugtv5k5826e6mm398b2mnn9bfko2', '127.0.0.1', 1489651544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635313433373b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('6mtojh4ktfq5rovm2kctld97k74lt0g8', '127.0.0.1', 1489652106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635313839343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('qdr1dma10nv7a7rk3s121pj3og6j1l9h', '127.0.0.1', 1489652468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635323239343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b733a363a22322e30303030223b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a383a223138302e30303030223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223138302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('njsjm401vgd29cs1b8khermmn7o7dr9j', '127.0.0.1', 1489652854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635323630343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('u3j6p3okuso4h73bn63htpqreedf9805', '127.0.0.1', 1489653571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635333237333b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('aaf0odlic2kbefggvgjcc4246odsrt2o', '127.0.0.1', 1489653613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635333539343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22313830223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223138302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b733a383a223230302e30303030223b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('qosa90bgdpi1foj8s3rdcc6cukm6qvnv', '127.0.0.1', 1489654031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313438393635343031333b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b726563765f636172747c613a303a7b7d726563765f6d6f64657c733a373a2272656365697665223b726563765f737570706c6965727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7072696e745f61667465725f73616c657c733a353a2266616c7365223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3230303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('cp5o1qn4jv002omreqj14fh1g8hm3141', '127.0.0.1', 1490032151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033323135313b73657373696f6e5f736861317c733a373a2234663561643537223b),
('iek45d9nu1vt59anp5ckn4kniomle1t3', '127.0.0.1', 1490032151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033323135313b73657373696f6e5f736861317c733a373a2234663561643537223b),
('lhfs619nemde9n7knrd329vaurf7u7l5', '127.0.0.1', 1490032915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033323834343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('ijpgit3pvcfhrogi6ju6ohjsuklrnvrn', '127.0.0.1', 1490033369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033333138313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b64696e6e65725f7461626c657c4e3b),
('2bm42mt4jjla49chgok22al25g52tm49', '127.0.0.1', 1490036090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033343139353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('0a76d467eet40p62hn3of69l19a7gpns', '127.0.0.1', 1490036377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033363039313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('o2bmlf3q9d61bemvvi6qeeflied2jof2', '127.0.0.1', 1490036533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033363533333b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('gq73e60r73obdmib4hie55fr9lihrv91', '127.0.0.1', 1490036959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033363935393b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('iree7uko3kahb7e4jkv7si4hdlo0icet', '127.0.0.1', 1490037997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033373931373b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('s5fqq3robslp3f3n2n3eetado0ld5tnd', '127.0.0.1', 1490038881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033383535353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('2v91etsoenoj9iseh7g3edpjh7e2rfbs', '127.0.0.1', 1490038945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303033383838323b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ggkein9g6l9baoc9d7aqq9ma032ur4b1', '127.0.0.1', 1490040778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034303530343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3130303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('meldnhn66jl3e6oba0f73gebva92krhg', '127.0.0.1', 1490041177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034303839383b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('cien8u24tl2f5p1bcaioulq14pjndan8', '127.0.0.1', 1490041567, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034313237303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22313830223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223138302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('6ntauc6froe5kvqk51im5k2ee87vsj5d', '127.0.0.1', 1490041386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034313338363b),
('mockbbckbbe6l8kp31r9rinfprv543f0', '127.0.0.1', 1490041386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034313338363b73657373696f6e5f736861317c733a373a2234663561643537223b),
('jg4dglm3ld8u2pue64kftaqh2rl82086', '127.0.0.1', 1490041740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034313733333b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22313830223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223138302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('5067dg2icmb31hk6hhtq6ppei848ed9m', '127.0.0.1', 1490042917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034323334323b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('jg7ft76igijvgm7998jrvijudaip6j6j', '127.0.0.1', 1490042917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034323931373b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('sfovd6lnl2pmd5spcnr0rnr0r7cqg538', '127.0.0.1', 1490045766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034353736363b73657373696f6e5f736861317c733a373a2234663561643537223b),
('0obka4akvv3l8sgoftmnv8h6pdj0qg07', '127.0.0.1', 1490045795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303034353736363b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b6974656d5f6c6f636174696f6e7c733a313a2231223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b);
INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('3c5l8bjsa50ahh2d8bfrm47gr196mbfc', '127.0.0.1', 1490062189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303036313932303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('8epctup1k74lhqbrr51d3btf9gtqisa4', '127.0.0.1', 1490062729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303036323732393b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('q7jleqt8ud5ebhklhvgld9r014sib0m1', '127.0.0.1', 1490066036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303036363033313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('h1lihbbqocd8gbrg1vftvsqiauq5mlih', '127.0.0.1', 1490068064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303036373932303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('tevb9ilo62bgqa2m7vvfebg5k39epkn3', '127.0.0.1', 1490069065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303036383837313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('0519suqrro8nsqbd0278mau7d0r00kfh', '127.0.0.1', 1490070214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303036393934393b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('v4uqnh7hbv8a45fageqm91ve4vae94ka', '127.0.0.1', 1490070599, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037303331383b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('8j40i56daeobr9dftnqcutflscnf39r7', '127.0.0.1', 1490070858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037303730303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('oojcqdlrlcr778f0nthtufsnmfpkq2tm', '127.0.0.1', 1490071330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037313037303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('sadempk6aoe4fc6trecufniti121ubbb', '127.0.0.1', 1490071501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037313437313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('3gpq52t1pntllaj9gpqbd242bbk8lrh8', '127.0.0.1', 1490072708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037323433323b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('d3784hk7jhrjppi9t5ds4m4qrrg0dr6q', '127.0.0.1', 1490073828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037333534343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('t3bhavfma22adt7ngr50dcl9p5lsmrjp', '127.0.0.1', 1490074077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037333931383b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b733a353a2232302e3030223b733a353a22746f74616c223b733a353a2232302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('2kdeciqanvh7t2r3drrucm7lspplr1e1', '127.0.0.1', 1490074638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037343630303b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a323a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d693a323b613a31383a7b733a373a226974656d5f6964223b733a313a2232223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a323b733a343a226e616d65223b733a31363a2250616c6f6d6974617320636869636173223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a373a223130302e303030223b733a353a227072696365223b643a32303b733a353a22746f74616c223b733a323a223230223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2232302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('e1sft268i3g4ccbhs31mjjfrmut59pg9', '127.0.0.1', 1490076788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037363538313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('kn0ogiifdpibj5kthkhq243ukhtl3ajt', '127.0.0.1', 1490077032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303037363937353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22313830223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223138302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b6974656d5f6c6f636174696f6e7c733a313a2231223b),
('10l2cq5to4hsq9klhhdcrpc1mb49hv1j', '127.0.0.1', 1490214188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231333931343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ccjj1l31rhguseb4v7im1ged1seucnv1', '127.0.0.1', 1490214525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231343239343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('tqntaopgf8lblgnqha9jv04v5nrst6s2', '127.0.0.1', 1490215004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231343930343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('s51pimud3rdh2nq3hqk3frfmfo7n88bl', '127.0.0.1', 1490215243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231353234333b),
('23beuit1samktmbujjfh8ermjhi1adev', '127.0.0.1', 1490215244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231353234343b73657373696f6e5f736861317c733a373a2234663561643537223b),
('rj17sa5mf8majflahra52op1cqei5ndg', '127.0.0.1', 1490215246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231353234353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('m57qre9lofqkhoogd9gmtkl6pu6naffj', '127.0.0.1', 1490215412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231353235363b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('1fg9mu9kttgr6o8hsoc2ht25cdd0amh9', '127.0.0.1', 1490216648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231353631343b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ide8imgbrall0pmegcn53av9j1itsn01', '127.0.0.1', 1490216886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231363838363b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('4p5k09si02s2h1cqaha276dki4de0dfi', '127.0.0.1', 1490217423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231373230353b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('q5bl9tjm9137emr3g24rg0bf2r7tue93', '127.0.0.1', 1490217733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231373733323b73657373696f6e5f736861317c733a373a2234663561643537223b),
('71o0tgu4i5k77bmhvh2clojvheb3b2pc', '127.0.0.1', 1490217897, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231373839363b73657373696f6e5f736861317c733a373a2234663561643537223b),
('d084hshd0n5ocer13fbmqu4p888lo10h', '127.0.0.1', 1490218311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231383236363b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('j6jau1d8ho47dh9u5vuvi0runm7gvehq', '127.0.0.1', 1490219061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303231393031333b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('rjvd6e223ieoihjrfpn7oskkmtek5uqn', '127.0.0.1', 1490220036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232303033363b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('3st98nra9d3vvf40nems2fqeqv1p3lom', '127.0.0.1', 1490220052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232303035323b),
('p1he3inhrvjijl44ppf3o0098ag1jno5', '127.0.0.1', 1490220052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232303035323b73657373696f6e5f736861317c733a373a2234663561643537223b),
('becqiduqst5mnv2267e24pndaqdfegpf', '127.0.0.1', 1490220502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232303438363b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('1qgas75fifvoe10ca2g1pujevrpkphau', '127.0.0.1', 1490221441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232313434313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('dcu630kr352488o7o667ulj4d8usuajb', '127.0.0.1', 1490222218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323135313b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('vicotoujj0fs67h3u219fmql3voff38p', '127.0.0.1', 1490222305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323330353b73657373696f6e5f736861317c733a373a2234663561643537223b),
('vfsq3nq4s7cu83haqrpo4c2374tm8bmo', '127.0.0.1', 1490222426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323330373b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('t1847b9d72mdlatgm1ffkrth4tfsk1qd', '127.0.0.1', 1490222619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323631393b73657373696f6e5f736861317c733a373a2234663561643537223b),
('5eqh16m0o54bkoei300qh5iuk000gh4d', '127.0.0.1', 1490222783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323632323b73657373696f6e5f736861317c733a373a2234663561643537223b706572736f6e5f69647c733a313a2231223b),
('0qv4eiijem0uuju970l7f0tba3vr4lpe', '127.0.0.1', 1490222813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323831333b),
('c2e2flv9eidfe0j1ai17elo8nkek1l2s', '127.0.0.1', 1490222822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232323831353b706572736f6e5f69647c733a313a2231223b),
('7p4qa39pcnqa0cf94aahp16t8rg1bp3p', '127.0.0.1', 1490223362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232333336323b),
('1o68tsf9j3bef3ep13do3s01adki6ve3', '127.0.0.1', 1490223532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232333336373b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('djlgc8ue6ka8la94m2gobef0tauo79ng', '127.0.0.1', 1490224296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232343031393b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('g11mkac3mpea1fi4iugkk11ss617bf3h', '127.0.0.1', 1490224770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232343337303b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b);
INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ti0m0f0pc1iivt67q1iff017qnhjia2r', '127.0.0.1', 1490225217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232343933323b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('pt5fqrf2nigschaum04kjutajfsl0ovo', '127.0.0.1', 1490225553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232353238383b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('jpu771770tn0an4sam33tjdgdlgvj7ll', '127.0.0.1', 1490225871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232353631303b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ruv1287lse4b13bi8f2e6ic61u5g6jkk', '127.0.0.1', 1490226308, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232363131313b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('osb7d41uvpd5dj803s46695ql6142una', '127.0.0.1', 1490226686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232363633393b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('7p18s75dm4q51p96rvvktdf7eu4aifnh', '127.0.0.1', 1490227237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232373233323b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('nq2op6m0ff03upjaj3s8ndndp29p4atv', '127.0.0.1', 1490228261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232383131333b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('h1bnsp857tqb6e6k6praalikbk2rn926', '127.0.0.1', 1490229238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232383936313b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('m9kqgt5oj9qdmkfnj4lrp30e06ng2067', '127.0.0.1', 1490229474, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232393237383b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('164lcgrihrlqnp6c57k7ck3e9171ruqm', '127.0.0.1', 1490229875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232393539343b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('bpfuf8qv64n7tosu3mq4mh887vdgfogq', '127.0.0.1', 1490229922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232393932323b),
('7cm8vatl5eo985cmp5ik07mr92uvvs09', '127.0.0.1', 1490229922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303232393932323b),
('5noble07h5e0keo0qdkkvjhj99qivd3u', '127.0.0.1', 1490230060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303233303033323b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('23c3k9h47a0gb8oeul2t75g5f9af72do', '127.0.0.1', 1490230528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303233303433313b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a323b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22313830223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223138302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('7uheuh6bvnufuk7q12p3ola1tconramc', '127.0.0.1', 1490230965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303233303738353b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('th2l0q10m5ico5nvska04v2pdgk9f2gq', '127.0.0.1', 1490231658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303233313537363b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a32353b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a3130303b733a353a22746f74616c223b733a343a2232353030223b733a31363a22646973636f756e7465645f746f74616c223b733a393a22323530302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('q22p34okn11li419iseshi65i0vq3jo2', '127.0.0.1', 1490309670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303330393637303b),
('gegbm6tpnlitvji0u17hmprlrsqdin6o', '127.0.0.1', 1490309746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303330393637303b706572736f6e5f69647c733a313a2231223b),
('a8qm9t9f487edbnq99ko7a2gvct367ad', '127.0.0.1', 1490311198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331303133373b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('1c305tsjihvf2hl6mnbtffj8dgmsaksn', '127.0.0.1', 1490311199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331313139393b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('64ffgoogpj9a10m83iefjetgsvbk7gg1', '127.0.0.1', 1490313810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331333732303b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('7mcvb5r9gup644vjni310n61tmddorvh', '127.0.0.1', 1490314956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331343638313b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('itlme9glvt7u8sppj0drphib13i5g23o', '127.0.0.1', 1490315022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331343938333b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('8hp2pvna037pr9j6horu2dmcrccukn4o', '127.0.0.1', 1490316066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331363036353b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('fftsn7e4jb7khhls3robjokof2k3lce5', '127.0.0.1', 1490316899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331363635303b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223430306338613666643864373437653830376663333438663531356436353332223b),
('6fgo6unbf0sl9ef00jnvoekn2j2m1b8d', '127.0.0.1', 1490317397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331373030303b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223933303136333634636635386239653861656336626561666230393063393730223b),
('p84cc24ngef7pt2uadts0rl3b8njhnft', '127.0.0.1', 1490317646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331373430323b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a333b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22323730223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223237302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a226633376161666530643761313565636464303132353731393161643264393963223b),
('muhos25fpfvv8nebtu47en117dh85k3e', '127.0.0.1', 1490318146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331373835343b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a333b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22323730223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223237302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223830343065363562643731373036373538346339303434616233653163633961223b),
('1nvfafkf1m7i38vks7tmsjeoit7823hj', '127.0.0.1', 1490318318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331383136353b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a333b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22323730223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223237302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223731666163393636666136346166386634663562653762663061383333303435223b73656174735f73686f777c733a353a2231323a3030223b),
('k99ubj8qce7klr5fpf1q7knfcki30mfk', '127.0.0.1', 1490318767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331383736363b),
('ho6mlcu50gtgvigprda12npbcpcoam73', '127.0.0.1', 1490319378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331393037373b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226236636337303937633236336239663462343961633361626631303862643236223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('t9o92udsbrdor2pgrd5eoeltvu38nea7', '127.0.0.1', 1490319688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331393339363b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a333b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22323730223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223237302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223539393061323632373764613466633761643932303831336534353463383639223b73656174735f73686f777c733a353a2231313a3030223b),
('4imqandd5u8glkt2eme2j2te3c1evh3r', '127.0.0.1', 1490319837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303331393732343b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a333b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a333a22323730223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223237302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3335303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223539393061323632373764613466633761643932303831336534353463383639223b73656174735f73686f777c733a353a2231313a3030223b),
('lo9n21huv1nbildq8ep8v4gopm2sq73f', '127.0.0.1', 1490321566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332303439353b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223335333536663830656462313565653739383162336462363137653266303333223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('6ug6b3327vnrkoq0v43dcjejaj1l7ufi', '127.0.0.1', 1490321768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332313536373b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226430653564643330376131626261643439663839333863626364363931613265223b73656174735f73686f777c733a353a2231323a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('5v07kjt58v2ffjn342ulip7roudb7ubh', '127.0.0.1', 1490322323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332323034353b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226430653564643330376131626261643439663839333863626364363931613265223b73656174735f73686f777c733a353a2231323a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('8i0kj88it7p5k26mp35a4olhn5l53osd', '127.0.0.1', 1490322960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332323935393b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226430653564643330376131626261643439663839333863626364363931613265223b73656174735f73686f777c733a353a2231323a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('3rckaqss0hqjnna7402gn0vohhm121q5', '127.0.0.1', 1490323465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332333333343b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226430653564643330376131626261643439663839333863626364363931613265223b73656174735f73686f777c733a353a2231323a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('t4p9l8gjnprqfis0l4mq6vd3a03t6mo0', '127.0.0.1', 1490324277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332343035393b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226364656664396166643334643434373133353733623334616434646335326331223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b643a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a323a223930223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a313a7b733a383a22456665637469766f223b613a323a7b733a31323a227061796d656e745f74797065223b733a383a22456665637469766f223b733a31343a227061796d656e745f616d6f756e74223b643a3131303b7d7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('hum9sktbf7i9jp7mjr0blfboe7ie7049', '127.0.0.1', 1490324646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332343338353b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226364656664396166643334643434373133353733623334616434646335326331223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('mb93voh3pmu1sq4827p8sjhgs99gn77u', '127.0.0.1', 1490326316, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332343639393b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226364656664396166643334643434373133353733623334616434646335326331223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b);
INSERT INTO `ospos_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('9t3me76tu65i8vebch9fm6kq6cknmkkg', '127.0.0.1', 1490326814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332363831343b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226364656664396166643334643434373133353733623334616434646335326331223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('1v1dngenb3kea5ik1j6ghvcbq0uobtop', '127.0.0.1', 1490328734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303332383733333b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226364656664396166643334643434373133353733623334616434646335326331223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('uhg70i7e37mmnp8q6spi5ph6lk3f070r', '127.0.0.1', 1490636478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303633363437383b),
('j7vna7hlctp9b1muk4fr9es616peph4i', '127.0.0.1', 1490637382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303633363437383b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223436643739333064313263376234323738393464323233326336353765396165223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('i83c1dac28j1ofb1u91o7u0idoo2rn0a', '127.0.0.1', 1490637553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303633373338333b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223730323030633035643937393535386661643835313563353061386663393934223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('76i23gv6ik6cco8fqet9gugkm712b8k1', '127.0.0.1', 1490637926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303633373736303b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223730323030633035643937393535386661643835313563353061386663393934223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('823e843la3a6min4bm448jc1gfaqd66a', '127.0.0.1', 1490642403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634323138343b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('82ehs62fc0q5sdvngqnh26kh6vfen5p3', '127.0.0.1', 1490642686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634323630323b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('4lauigdvi6unaq4vskcqin0cm1pefbjj', '127.0.0.1', 1490643035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634323930353b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('te9qqq0qaha79g2s3j5jlod0h6j2h3jo', '127.0.0.1', 1490643556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634333331373b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('vcept70auq9ps0d6017qc3gii2g7huu8', '127.0.0.1', 1490643809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634333830303b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('vt1ljsrn9vpttn2lgfgqougkfgt35o6q', '127.0.0.1', 1490644936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634343834363b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('8uckqnriknrbjet8jplhs4t2gmokncr1', '127.0.0.1', 1490645663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634353338343b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('f73md0b7kjhv5bm78qa40j2mnhlup2oq', '127.0.0.1', 1490646210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634353933323b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226435633966306631353732376339336138333563333634306266626465336562223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('2gun173njnvbdb54m70naaam0mvpr1aq', '127.0.0.1', 1490646564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634363536343b),
('4dgvak7srra4dj61t20o8jjfbh44v7e0', '127.0.0.1', 1490647521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634363937373b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a303a7b7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('rfphpbrcb2fe1qb2sn1revjvhotdiipj', '127.0.0.1', 1490648132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634373532323b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('922lnrpbaufea1fv5oicg22ps2pcinji', '127.0.0.1', 1490648532, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634383134363b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('q2luhmd1gbiua6qr3vciap064qcrk312', '127.0.0.1', 1490649069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634383738343b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('rg7pg9prb6rsl74qj14hl5fu13tahqcf', '127.0.0.1', 1490649354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634393234373b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b733a363a22332e30303030223b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b643a39303b733a353a22746f74616c223b733a383a223237302e30303030223b733a31363a22646973636f756e7465645f746f74616c223b733a383a223237302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a223333653262653861393966656664306632636163303165366133353662353539223b73656174735f73686f777c733a353a2231313a3030223b),
('r3hed0abi65a3p63ibhg3nfvqh5i0k59', '127.0.0.1', 1490649880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303634393634353b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223230623364663532613833633836373564346436626639366332363338666261223b73656174735f73686f777c733a353a2232333a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b),
('is1n32hilfde4slmh3jccvuoie8alc7f', '127.0.0.1', 1490650332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635303132303b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223230623364663532613833633836373564346436626639366332363338666261223b73656174735f73686f777c733a353a2232333a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('6ul7r6cvnr8c42lacp1mqnaahub1br7g', '127.0.0.1', 1490650699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635303539343b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('n2pfqtppj9hqol0gt9j4lt1mmmvmqf8l', '127.0.0.1', 1490651074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635303932313b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('u91tf69qvoupmju22qhr4mtlg8q768cq', '127.0.0.1', 1490651926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635313436323b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('jmnaa23eu7fkt1rptqtar02rhqap7qu3', '127.0.0.1', 1490652251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635323032303b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223931653766306362343838633832363266613837636164306665613662363635223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('uoq8005uibiocm9dk7cah1360qag47l9', '127.0.0.1', 1490652755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303635323733353b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b),
('ka7fn2coqmle9iofkd82bal5g1n7067r', '127.0.0.1', 1490661567, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303636303239343b706572736f6e5f69647c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b7472616e73616374696f6e7c733a33323a226632636666353338346635663562346561643963613736326466383832626162223b73656174735f73686f777c733a353a2231313a3030223b),
('sqeoe4g5h8q1n664bhp9opcdo8a0gm5r', '127.0.0.1', 1490661652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303636313536373b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226632636666353338346635663562346561643963613736326466383832626162223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('1ecll3kief0umb4p25semtb03nkp8fij', '127.0.0.1', 1490661947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303636313931393b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a223963646432353139646635313833303632626532366232636265363236366262223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b),
('9otlbjp1f7noeoc2nv77n8q7n34tru3c', '127.0.0.1', 1490662334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439303636323233333b706572736f6e5f69647c733a313a2231223b73616c65735f6d6f64657c733a343a2273616c65223b73616c65735f6c6f636174696f6e7c733a313a2231223b7472616e73616374696f6e7c733a33323a226465376536336162363765623465363838323434303535363330393332303739223b73656174735f73686f777c733a353a2231313a3030223b73616c65735f696e766f6963655f6e756d6265725f656e61626c65647c623a303b73616c65735f656d706c6f7965657c733a313a2231223b73616c65735f636172747c613a313a7b693a313b613a31383a7b733a373a226974656d5f6964223b733a313a2231223b733a31333a226974656d5f6c6f636174696f6e223b733a313a2231223b733a31303a2273746f636b5f6e616d65223b733a353a2273746f636b223b733a343a226c696e65223b693a313b733a343a226e616d65223b733a373a22456e7472616461223b733a31313a226974656d5f6e756d626572223b4e3b733a31313a226465736372697074696f6e223b733a303a22223b733a31323a2273657269616c6e756d626572223b733a303a22223b733a32313a22616c6c6f775f616c745f6465736372697074696f6e223b733a313a2230223b733a31333a2269735f73657269616c697a6564223b733a313a2230223b733a383a227175616e74697479223b693a313b733a383a22646973636f756e74223b733a313a2230223b733a383a22696e5f73746f636b223b733a363a2231302e303030223b733a353a227072696365223b733a353a2239302e3030223b733a353a22746f74616c223b733a353a2239302e3030223b733a31363a22646973636f756e7465645f746f74616c223b733a373a2239302e30303030223b733a31323a227072696e745f6f7074696f6e223b733a313a2230223b733a31303a2273746f636b5f74797065223b733a313a2230223b7d7d73616c65735f637573746f6d65727c693a2d313b73616c65735f7061796d656e74737c613a303a7b7d73616c65735f696e766f6963655f6e756d6265727c4e3b);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_stock_locations`
--

CREATE TABLE `ospos_stock_locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_stock_locations`
--

INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_suppliers`
--

CREATE TABLE `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_tickets`
--

CREATE TABLE `ospos_tickets` (
  `id_ticket` int(11) NOT NULL,
  `schedule` time NOT NULL,
  `seat` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `num_seat` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `status` enum('active','blocked','used') COLLATE utf8_unicode_ci NOT NULL,
  `dt_show` date NOT NULL,
  `transaction` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `status_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ospos_tickets`
--

INSERT INTO `ospos_tickets` (`id_ticket`, `schedule`, `seat`, `num_seat`, `sale_id`, `status`, `dt_show`, `transaction`, `status_time`) VALUES
(1, '12:00:00', '1_1', 1, 8, 'used', '2017-03-23', 'd0e5dd307a1bbad49f8938cbcd691a2e', '0000-00-00 00:00:00'),
(2, '11:00:00', '1_3', 2, 0, 'active', '2017-03-23', 'cdefd9afd34d44713573b34ad4dc52c1', '2017-03-27 20:25:15'),
(3, '11:00:00', '1_1', 1, 9, 'used', '2017-03-27', '06ee43b1344c03b4411a40f406163a35', '0000-00-00 00:00:00'),
(4, '11:00:00', '1_3', 2, 9, 'used', '2017-03-27', '06ee43b1344c03b4411a40f406163a35', '0000-00-00 00:00:00'),
(5, '11:00:00', '1_5', 3, 10, 'used', '2017-03-27', '46d7930d12c7b427894d2232c657e9ae', '0000-00-00 00:00:00'),
(6, '11:00:00', '2_2', 4, -1, 'used', '2017-03-27', '70200c05d979558fad8515c50a8fc994', '0000-00-00 00:00:00'),
(7, '11:00:00', '2_4', 5, 13, 'used', '2017-03-27', 'd5c9f0f15727c93a835c3640bfbde3eb', '2017-03-27 20:26:29'),
(8, '12:00:00', '11_3', 24, 0, 'active', '2017-03-27', '', '2017-03-27 22:00:38'),
(9, '11:00:00', '11_5', 25, 0, 'active', '2017-03-27', '', '2017-03-27 22:00:28'),
(10, '11:00:00', '11_3', 24, 0, 'active', '2017-03-27', '', '2017-03-27 22:00:43'),
(11, '11:00:00', '11_5', 25, 0, 'active', '2017-03-27', '', '2017-03-27 22:01:55'),
(12, '23:00:00', '1_1', 1, 14, 'used', '2017-03-27', '20b3df52a83c8675d4d6bf96c2638fba', '2017-03-27 21:24:40'),
(13, '23:00:00', '1_3', 2, 14, 'used', '2017-03-27', '20b3df52a83c8675d4d6bf96c2638fba', '2017-03-27 21:24:40'),
(14, '23:00:00', '1_5', 3, 14, 'used', '2017-03-27', '20b3df52a83c8675d4d6bf96c2638fba', '2017-03-27 21:24:40'),
(15, '11:00:00', '3_3', 7, 0, 'active', '2017-03-27', '', '2017-03-27 22:10:03'),
(16, '11:00:00', '3_5', 8, 0, 'active', '2017-03-27', '', '2017-03-27 22:11:05'),
(17, '11:00:00', '3_1', 6, 15, 'used', '2017-03-27', '91e7f0cb488c8262fa87cad0fea6b665', '2017-03-27 22:03:25'),
(18, '11:00:00', '3_3', 7, 15, 'used', '2017-03-27', '91e7f0cb488c8262fa87cad0fea6b665', '2017-03-27 22:03:25'),
(19, '11:00:00', '3_5', 8, 15, 'used', '2017-03-27', '91e7f0cb488c8262fa87cad0fea6b665', '2017-03-27 22:03:25'),
(20, '11:00:00', '4_2', 9, 0, 'active', '2017-03-27', '', '2017-03-28 00:23:00'),
(21, '11:00:00', '4_4', 10, 0, 'active', '2017-03-27', '', '2017-03-28 00:23:10'),
(22, '11:00:00', '4_2', 9, 16, 'used', '2017-03-27', 'f2cff5384f5f5b4ead9ca762df882bab', '2017-03-28 00:39:32'),
(23, '11:00:00', '4_4', 10, 16, 'used', '2017-03-27', 'f2cff5384f5f5b4ead9ca762df882bab', '2017-03-28 00:39:32'),
(24, '11:00:00', '10_4', 23, 17, 'used', '2017-03-27', '9cdd2519df5183062be26b2cbe6266bb', '2017-03-28 00:45:47'),
(25, '11:00:00', '5_1', 11, 0, 'blocked', '2017-03-27', 'de7e63ab67eb4e688244055630932079', '2017-03-28 00:51:30'),
(26, '11:00:00', '5_3', 12, 0, 'blocked', '2017-03-27', 'de7e63ab67eb4e688244055630932079', '2017-03-28 00:51:30'),
(27, '11:00:00', '5_5', 13, 0, 'blocked', '2017-03-27', 'de7e63ab67eb4e688244055630932079', '2017-03-28 00:51:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ospos_app_config`
--
ALTER TABLE `ospos_app_config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_customers_packages`
--
ALTER TABLE `ospos_customers_packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ospos_dinner_tables`
--
ALTER TABLE `ospos_dinner_tables`
  ADD PRIMARY KEY (`dinner_table_id`);

--
-- Indexes for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD UNIQUE KEY `giftcard_number` (`giftcard_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD PRIMARY KEY (`permission_id`,`person_id`),
  ADD KEY `ospos_grants_ibfk_2` (`person_id`);

--
-- Indexes for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_items` (`trans_items`),
  ADD KEY `trans_user` (`trans_user`),
  ADD KEY `trans_location` (`trans_location`);

--
-- Indexes for table `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_number` (`item_number`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD PRIMARY KEY (`item_id`,`name`,`percent`);

--
-- Indexes for table `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
  ADD PRIMARY KEY (`item_kit_id`);

--
-- Indexes for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  ADD KEY `ospos_item_kit_items_ibfk_2` (`item_id`);

--
-- Indexes for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD PRIMARY KEY (`item_id`,`location_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `ospos_modules`
--
ALTER TABLE `ospos_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  ADD UNIQUE KEY `name_lang_key` (`name_lang_key`);

--
-- Indexes for table `ospos_people`
--
ALTER TABLE `ospos_people`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `ospos_permissions_ibfk_2` (`location_id`);

--
-- Indexes for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD PRIMARY KEY (`receiving_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reference` (`reference`);

--
-- Indexes for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `sale_time` (`sale_time`),
  ADD KEY `dinner_table_id` (`dinner_table_id`);

--
-- Indexes for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_location` (`item_location`);

--
-- Indexes for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD PRIMARY KEY (`sale_id`,`payment_type`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `dinner_table_id` (`dinner_table_id`);

--
-- Indexes for table `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `ospos_sales_suspended_items_ibfk_3` (`item_location`);

--
-- Indexes for table `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
  ADD PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
  ADD PRIMARY KEY (`sale_id`,`payment_type`);

--
-- Indexes for table `ospos_sessions`
--
ALTER TABLE `ospos_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `ospos_tickets`
--
ALTER TABLE `ospos_tickets`
  ADD PRIMARY KEY (`id_ticket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ospos_customers_packages`
--
ALTER TABLE `ospos_customers_packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ospos_customers_points`
--
ALTER TABLE `ospos_customers_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_dinner_tables`
--
ALTER TABLE `ospos_dinner_tables`
  MODIFY `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ospos_items`
--
ALTER TABLE `ospos_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ospos_item_kits`
--
ALTER TABLE `ospos_item_kits`
  MODIFY `item_kit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_people`
--
ALTER TABLE `ospos_people`
  MODIFY `person_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  MODIFY `receiving_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ospos_sales_reward_points`
--
ALTER TABLE `ospos_sales_reward_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
  MODIFY `sale_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ospos_stock_locations`
--
ALTER TABLE `ospos_stock_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ospos_tickets`
--
ALTER TABLE `ospos_tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Constraints for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Constraints for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Constraints for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`);

--
-- Constraints for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Constraints for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
  ADD CONSTRAINT `ospos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  ADD CONSTRAINT `ospos_sales_suspended_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`);

--
-- Constraints for table `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
  ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
  ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended_items` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
  ADD CONSTRAINT `ospos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`);

--
-- Constraints for table `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
  ADD CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
