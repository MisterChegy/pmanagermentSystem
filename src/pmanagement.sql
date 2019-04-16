/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : pmanagement

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-07-23 10:16:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ausertable`
-- ----------------------------
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable` (
  `aname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apwd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ausertable
-- ----------------------------
INSERT INTO ausertable VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dtype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dtel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dfax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supdepartment` int(11) DEFAULT NULL,
  `establishmentdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO department VALUES ('1', '采购部', '部门', '123456', '123456', '好部门', '0', '2018-06-27');
INSERT INTO department VALUES ('3', '11', '生产线', '11', '11', '111', '1', '2018-07-22');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ptype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `organization` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO post VALUES ('1', '好岗位', '技术', '300');
INSERT INTO post VALUES ('2', '坏岗位', '营销', '234');

-- ----------------------------
-- Table structure for `quit`
-- ----------------------------
DROP TABLE IF EXISTS `quit`;
CREATE TABLE `quit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qdate` date DEFAULT NULL,
  `opdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qsid` (`staff_id`),
  CONSTRAINT `qsid` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of quit
-- ----------------------------
INSERT INTO quit VALUES ('8', '1', '44', '退休', '2018-07-05', '2018-07-22');
INSERT INTO quit VALUES ('9', '1', '44', '辞职', '2018-07-05', '2018-07-22');
INSERT INTO quit VALUES ('10', '3', '坏', '辞职', '2018-07-04', '2018-07-22');
INSERT INTO quit VALUES ('11', '10', null, '辞职', '2018-07-05', '2018-07-23');
INSERT INTO quit VALUES ('12', '9', '11', '辞职', '2018-07-04', '2018-07-23');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `sid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `depart_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `entrydate` date NOT NULL,
  `joinworkdate` date NOT NULL,
  `workform` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `staffsource` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `politicalstatus` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativeplace` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sheight` decimal(12,2) DEFAULT NULL,
  `bloodtype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maritalstatus` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registeredresidence` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degree` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `university` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `graduationdate` date DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peroidopdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `did` (`depart_id`),
  KEY `pid` (`post_id`),
  CONSTRAINT `did` FOREIGN KEY (`depart_id`) REFERENCES `department` (`id`),
  CONSTRAINT `pid` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO staff VALUES ('1', '44', '男', '2018-05-30', '11111', '1', '1', '2018-05-31', '2018-05-29', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', '2018-07-11', null, null, null, null);
INSERT INTO staff VALUES ('2', '好', '男', '2018-07-03', '23455', '1', '1', '2018-07-19', '2018-07-03', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, '2018-07-20', '2018-07-21', '转正', null);
INSERT INTO staff VALUES ('3', '坏', '男', '2018-07-10', '32234', '1', '2', '2018-07-20', '2018-07-18', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, '2018-07-27', '2018-08-07', '转正', null);
INSERT INTO staff VALUES ('4', 'fff', '男', '2018-07-10', '545454', '1', '1', '2018-07-12', '2018-07-05', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, '2018-08-01', '2018-08-03', '延期', null);
INSERT INTO staff VALUES ('7', '454', '男', '2018-07-02', '4554', '1', '1', '2018-07-13', '2018-07-10', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, null, null, null, null);
INSERT INTO staff VALUES ('8', 'ss', '男', '2018-07-02', '1233', '1', '1', '2018-07-20', '2018-07-12', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, '2018-07-03', '2018-07-24', '转正', null);
INSERT INTO staff VALUES ('9', '11', '男', '2018-07-03', '1111', '1', '1', '2018-07-05', '2018-07-25', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, '2018-07-02', '2018-08-08', '不录用', null);
INSERT INTO staff VALUES ('10', '11', '男', '2018-07-02', '11', '1', '1', '2018-07-05', '2018-07-18', '正式', '校园招聘', '', '', '', '', '', null, '', '', '', '', '', '', '', null, '2018-07-12', '2018-08-03', '不录用', '2018-07-21');

-- ----------------------------
-- Table structure for `transfer`
-- ----------------------------
DROP TABLE IF EXISTS `transfer`;
CREATE TABLE `transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `sname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beforepost_id` int(11) DEFAULT NULL,
  `afterpost_id` int(11) DEFAULT NULL,
  `ttype` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tdate` date DEFAULT NULL,
  `opdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ssid` (`staff_id`),
  KEY `ppid` (`afterpost_id`),
  KEY `bpid` (`beforepost_id`),
  CONSTRAINT `bpid` FOREIGN KEY (`beforepost_id`) REFERENCES `post` (`id`),
  CONSTRAINT `ppid` FOREIGN KEY (`afterpost_id`) REFERENCES `post` (`id`),
  CONSTRAINT `ssid` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of transfer
-- ----------------------------
INSERT INTO transfer VALUES ('3', '1', '44', '1', '2', '升职', '2018-07-05', '2018-07-23');
INSERT INTO transfer VALUES ('4', '1', '44', '2', '1', '升职', '2018-07-12', '2018-07-23');
INSERT INTO transfer VALUES ('5', '3', '坏', '1', '2', '升职', '2018-07-12', '2018-07-23');
