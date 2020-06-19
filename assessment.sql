-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by sabry at 19-06-2020 09:53.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE admins
DROP TABLE IF EXISTS admins;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table admins contains no data. No inserts have been genrated.
-- Inserting 0 rows into admins


-- END TABLE admins

-- BEGIN TABLE cases
DROP TABLE IF EXISTS cases;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `case_date` date DEFAULT NULL,
  `case_time` time DEFAULT NULL,
  `paint_type_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '‘0’ => pending\n‘1’ => approved\n‘2’ => refused\n‘3’ => reschadualed’\n‘4’ => closed',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `case_user_id` (`user_id`),
  KEY `cases_pain_type_id` (`paint_type_id`),
  KEY `cases_modified_by_admin_id` (`modified_by`),
  KEY `cases_doctor_id` (`doctor_id`),
  CONSTRAINT `case_user_id` FOREIGN KEY (`user_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `cases_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `cases_modified_by_admin_id` FOREIGN KEY (`modified_by`) REFERENCES `admins` (`id`),
  CONSTRAINT `cases_pain_type_id` FOREIGN KEY (`paint_type_id`) REFERENCES `pain_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Inserting 1 row into cases
-- Insert batch #1
INSERT INTO cases (id, user_id, doctor_id, case_date, case_time, paint_type_id, status, created_date, modified_date, modified_by) VALUES
(1, 1, NULL, NULL, NULL, 2, 0, '2020-06-19 04:51:55', '2020-06-19 04:51:55', NULL);

-- END TABLE cases

-- BEGIN TABLE countries
DROP TABLE IF EXISTS countries;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  `phone_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4;

-- Inserting 239 rows into countries
-- Insert batch #1
INSERT INTO countries (id, country_name, created_date, modified_date, phone_code) VALUES
(1, 'Afghanistan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 93),
(2, 'Albania', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 355),
(3, 'Algeria', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 213),
(4, 'American Samoa', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1684),
(5, 'Andorra', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 376),
(6, 'Angola', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 244),
(7, 'Anguilla', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1264),
(8, 'Antarctica', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 0),
(9, 'Antigua and Barbuda', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1268),
(10, 'Argentina', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 54),
(11, 'Armenia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 374),
(12, 'Aruba', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 297),
(13, 'Australia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 61),
(14, 'Austria', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 43),
(15, 'Azerbaijan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 994),
(16, 'Bahamas', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1242),
(17, 'Bahrain', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 973),
(18, 'Bangladesh', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 880),
(19, 'Barbados', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1246),
(20, 'Belarus', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 375),
(21, 'Belgium', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 32),
(22, 'Belize', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 501),
(23, 'Benin', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 229),
(24, 'Bermuda', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1441),
(25, 'Bhutan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 975),
(26, 'Bolivia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 591),
(27, 'Bosnia and Herzegovina', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 387),
(28, 'Botswana', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 267),
(29, 'Bouvet Island', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 0),
(30, 'Brazil', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 55),
(31, 'British Indian Ocean Territory', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 246),
(32, 'Brunei Darussalam', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 673),
(33, 'Bulgaria', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 359),
(34, 'Burkina Faso', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 226),
(35, 'Burundi', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 257),
(36, 'Cambodia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 855),
(37, 'Cameroon', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 237),
(38, 'Canada', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1),
(39, 'Cape Verde', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 238),
(40, 'Cayman Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1345),
(41, 'Central African Republic', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 236),
(42, 'Chad', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 235),
(43, 'Chile', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 56),
(44, 'China', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 86),
(45, 'Christmas Island', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 61),
(46, 'Cocos (Keeling) Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 672),
(47, 'Colombia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 57),
(48, 'Comoros', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 269),
(49, 'Congo', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 242),
(50, 'Congo, the Democratic Republic of the', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 242),
(51, 'Cook Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 682),
(52, 'Costa Rica', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 506),
(53, 'Cote D''Ivoire', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 225),
(54, 'Croatia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 385),
(55, 'Cuba', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 53),
(56, 'Cyprus', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 357),
(57, 'Czech Republic', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 420),
(58, 'Denmark', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 45),
(59, 'Djibouti', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 253),
(60, 'Dominica', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1767),
(61, 'Dominican Republic', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1809),
(62, 'Ecuador', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 593),
(63, 'Egypt', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 20),
(64, 'El Salvador', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 503),
(65, 'Equatorial Guinea', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 240),
(66, 'Eritrea', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 291),
(67, 'Estonia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 372),
(68, 'Ethiopia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 251),
(69, 'Falkland Islands (Malvinas)', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 500),
(70, 'Faroe Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 298),
(71, 'Fiji', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 679),
(72, 'Finland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 358),
(73, 'France', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 33),
(74, 'French Guiana', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 594),
(75, 'French Polynesia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 689),
(76, 'French Southern Territories', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 0),
(77, 'Gabon', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 241),
(78, 'Gambia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 220),
(79, 'Georgia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 995),
(80, 'Germany', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 49),
(81, 'Ghana', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 233),
(82, 'Gibraltar', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 350),
(83, 'Greece', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 30),
(84, 'Greenland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 299),
(85, 'Grenada', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1473),
(86, 'Guadeloupe', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 590),
(87, 'Guam', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1671),
(88, 'Guatemala', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 502),
(89, 'Guinea', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 224),
(90, 'Guinea-Bissau', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 245),
(91, 'Guyana', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 592),
(92, 'Haiti', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 509),
(93, 'Heard Island and Mcdonald Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 0),
(94, 'Holy See (Vatican City State)', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 39),
(95, 'Honduras', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 504),
(96, 'Hong Kong', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 852),
(97, 'Hungary', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 36),
(98, 'Iceland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 354),
(99, 'India', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 91),
(100, 'Indonesia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 62),
(101, 'Iran, Islamic Republic of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 98),
(102, 'Iraq', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 964),
(103, 'Ireland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 353),
(104, 'Israel', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 972),
(105, 'Italy', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 39),
(106, 'Jamaica', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1876),
(107, 'Japan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 81),
(108, 'Jordan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 962),
(109, 'Kazakhstan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 7),
(110, 'Kenya', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 254),
(111, 'Kiribati', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 686),
(112, 'Korea, Democratic People''s Republic of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 850),
(113, 'Korea, Republic of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 82),
(114, 'Kuwait', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 965),
(115, 'Kyrgyzstan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 996),
(116, 'Lao People''s Democratic Republic', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 856),
(117, 'Latvia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 371),
(118, 'Lebanon', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 961),
(119, 'Lesotho', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 266),
(120, 'Liberia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 231),
(121, 'Libyan Arab Jamahiriya', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 218),
(122, 'Liechtenstein', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 423),
(123, 'Lithuania', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 370),
(124, 'Luxembourg', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 352),
(125, 'Macao', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 853),
(126, 'Macedonia, the Former Yugoslav Republic of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 389),
(127, 'Madagascar', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 261),
(128, 'Malawi', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 265),
(129, 'Malaysia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 60),
(130, 'Maldives', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 960),
(131, 'Mali', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 223),
(132, 'Malta', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 356),
(133, 'Marshall Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 692),
(134, 'Martinique', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 596),
(135, 'Mauritania', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 222),
(136, 'Mauritius', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 230),
(137, 'Mayotte', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 269),
(138, 'Mexico', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 52),
(139, 'Micronesia, Federated States of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 691),
(140, 'Moldova, Republic of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 373),
(141, 'Monaco', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 377),
(142, 'Mongolia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 976),
(143, 'Montserrat', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1664),
(144, 'Morocco', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 212),
(145, 'Mozambique', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 258),
(146, 'Myanmar', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 95),
(147, 'Namibia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 264),
(148, 'Nauru', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 674),
(149, 'Nepal', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 977),
(150, 'Netherlands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 31),
(151, 'Netherlands Antilles', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 599),
(152, 'New Caledonia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 687),
(153, 'New Zealand', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 64),
(154, 'Nicaragua', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 505),
(155, 'Niger', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 227),
(156, 'Nigeria', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 234),
(157, 'Niue', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 683),
(158, 'Norfolk Island', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 672),
(159, 'Northern Mariana Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1670),
(160, 'Norway', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 47),
(161, 'Oman', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 968),
(162, 'Pakistan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 92),
(163, 'Palau', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 680),
(164, 'Palestinian Territory, Occupied', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 970),
(165, 'Panama', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 507),
(166, 'Papua New Guinea', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 675),
(167, 'Paraguay', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 595),
(168, 'Peru', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 51),
(169, 'Philippines', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 63),
(170, 'Pitcairn', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 0),
(171, 'Poland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 48),
(172, 'Portugal', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 351),
(173, 'Puerto Rico', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1787),
(174, 'Qatar', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 974),
(175, 'Reunion', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 262),
(176, 'Romania', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 40),
(177, 'Russian Federation', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 70),
(178, 'Rwanda', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 250),
(179, 'Saint Helena', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 290),
(180, 'Saint Kitts and Nevis', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1869),
(181, 'Saint Lucia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1758),
(182, 'Saint Pierre and Miquelon', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 508),
(183, 'Saint Vincent and the Grenadines', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1784),
(184, 'Samoa', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 684),
(185, 'San Marino', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 378),
(186, 'Sao Tome and Principe', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 239),
(187, 'Saudi Arabia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 966),
(188, 'Senegal', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 221),
(189, 'Serbia and Montenegro', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 381),
(190, 'Seychelles', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 248),
(191, 'Sierra Leone', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 232),
(192, 'Singapore', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 65),
(193, 'Slovakia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 421),
(194, 'Slovenia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 386),
(195, 'Solomon Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 677),
(196, 'Somalia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 252),
(197, 'South Africa', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 27),
(198, 'South Georgia and the South Sandwich Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 0),
(199, 'Spain', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 34),
(200, 'Sri Lanka', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 94),
(201, 'Sudan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 249),
(202, 'Suriname', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 597),
(203, 'Svalbard and Jan Mayen', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 47),
(204, 'Swaziland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 268),
(205, 'Sweden', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 46),
(206, 'Switzerland', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 41),
(207, 'Syrian Arab Republic', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 963),
(208, 'Taiwan, Province of China', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 886),
(209, 'Tajikistan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 992),
(210, 'Tanzania, United Republic of', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 255),
(211, 'Thailand', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 66),
(212, 'Timor-Leste', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 670),
(213, 'Togo', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 228),
(214, 'Tokelau', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 690),
(215, 'Tonga', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 676),
(216, 'Trinidad and Tobago', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1868),
(217, 'Tunisia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 216),
(218, 'Turkey', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 90),
(219, 'Turkmenistan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 7370),
(220, 'Turks and Caicos Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1649),
(221, 'Tuvalu', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 688),
(222, 'Uganda', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 256),
(223, 'Ukraine', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 380),
(224, 'United Arab Emirates', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 971),
(225, 'United Kingdom', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 44),
(226, 'United States', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1),
(227, 'United States Minor Outlying Islands', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1),
(228, 'Uruguay', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 598),
(229, 'Uzbekistan', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 998),
(230, 'Vanuatu', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 678),
(231, 'Venezuela', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 58),
(232, 'Viet Nam', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 84),
(233, 'Virgin Islands, British', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1284),
(234, 'Virgin Islands, U.s.', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 1340),
(235, 'Wallis and Futuna', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 681),
(236, 'Western Sahara', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 212),
(237, 'Yemen', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 967),
(238, 'Zambia', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 260),
(239, 'Zimbabwe', '2020-06-19 04:06:25', '2020-06-19 04:06:25', 263);

-- END TABLE countries

-- BEGIN TABLE doctors
DROP TABLE IF EXISTS doctors;
CREATE TABLE `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `speciality_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `doctors_speciality_id` (`speciality_id`),
  CONSTRAINT `doctors_speciality_id` FOREIGN KEY (`speciality_id`) REFERENCES `specialities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table doctors contains no data. No inserts have been genrated.
-- Inserting 0 rows into doctors


-- END TABLE doctors

-- BEGIN TABLE notifications
DROP TABLE IF EXISTS notifications;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `notification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`notification`)),
  `status` smallint(6) NOT NULL COMMENT '‘0’ => unread\n‘1’ => read',
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table notifications contains no data. No inserts have been genrated.
-- Inserting 0 rows into notifications


-- END TABLE notifications

-- BEGIN TABLE pain_type
DROP TABLE IF EXISTS pain_type;
CREATE TABLE `pain_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pain_name` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Inserting 3 rows into pain_type
-- Insert batch #1
INSERT INTO pain_type (id, pain_name, created_date, modified_date) VALUES
(1, 'Kedny', '2020-06-19 04:40:49', '2020-06-19 04:40:49'),
(2, 'heart', '2020-06-19 04:40:49', '2020-06-19 04:40:49'),
(3, 'eye', '2020-06-19 04:40:49', '2020-06-19 04:40:49');

-- END TABLE pain_type

-- BEGIN TABLE patients
DROP TABLE IF EXISTS patients;
CREATE TABLE `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL COMMENT '‘0’ => male\n‘1’ => female',
  `country_id` int(11) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `patients_country_id` (`country_id`),
  CONSTRAINT `patients_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Inserting 1 row into patients
-- Insert batch #1
INSERT INTO patients (id, username, password, first_name, last_name, email, mobile, birth_date, gender, country_id, occupation, created_date, modified_date) VALUES
(1, 'sabry@yahoo.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Mohamed', 'Sabry', 'sabry@yahoo.com', '+201223018335', '2001-11-01', 0, 63, 'asdasdasd', '2020-06-19 03:15:50', '2020-06-19 03:15:50');

-- END TABLE patients

-- BEGIN TABLE specialities
DROP TABLE IF EXISTS specialities;
CREATE TABLE `specialities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spiciality_name` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table specialities contains no data. No inserts have been genrated.
-- Inserting 0 rows into specialities


-- END TABLE specialities

