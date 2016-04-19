/*
Navicat MySQL Data Transfer

Source Server         : user-develop
Source Server Version : 50505
Source Host           : 10.28.6.151:3307
Source Database       : dili_book

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2015-03-26 11:49:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_bookcase`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO `tb_bookcase` VALUES ('30', '吴建均个人');
INSERT INTO `tb_bookcase` VALUES ('29', '移动部');

-- ----------------------------
-- Table structure for `tb_bookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) DEFAULT NULL,
  `bookname` varchar(70) DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `translator` varchar(30) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `page` int(10) unsigned DEFAULT NULL,
  `bookcase` int(10) unsigned DEFAULT NULL,
  `storage` int(10) unsigned DEFAULT NULL,
  `inTime` varchar(30) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookinfo
-- ----------------------------
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014011', 'Android应用性能优化', '7', 'Herve Guihot', '白龙', '7-115', '49.00', '0', '29', '1', '2015-03-25', 'admin', '0', '1');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014008', 'Android4编程入门经典-开发智能手机与平板电脑应用', '7', 'Wei-Meng Lee', '何晨光 李洪刚', '7-115', '68.00', '0', '29', '1', '2015-03-25', 'admin', '0', '2');
INSERT INTO `tb_bookinfo` VALUES ('P-001', 'Objective-C基础教程 （第2版）', '6', '', '', '7-115', '59.00', '0', '30', '1', '2015-03-26', 'admin', '0', '3');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014046', 'Objective-C高级编程 ios与osx 多线程和内存管理', '6', '', '', '7-115', '49.00', '0', '29', '1', '2015-03-26', 'admin', '0', '4');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014007', 'Android4高级编程（第3版）', '7', '', '', '7-115', '98.00', '0', '29', '1', '2015-03-26', 'admin', '0', '5');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014010', '精通iOS开发（第5版）', '6', '', '', '7-115', '76.90', '0', '29', '1', '2015-03-26', 'admin', '0', '6');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014045', 'effective java中文版', '11', '', '', '7-115', '52.00', '0', '29', '1', '2015-03-26', 'admin', '0', '7');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014047', 'Objective-C编程之道：iOS设计模式解析', '6', '', '', '7-115', '59.00', '0', '29', '1', '2015-03-26', 'admin', '0', '8');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014048', '精通Android', '7', '', '', '7-115', '119.00', '0', '29', '1', '2015-03-26', 'admin', '0', '9');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014049', 'effective objective-c 2.0 编写高质量ios与iosx代码的52个有效方法', '6', '', '', '7-115', '69.00', '0', '29', '1', '2015-03-26', 'admin', '0', '10');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014050', 'iOS编程实战', '6', '', '', '7-115', '79.00', '0', '29', '1', '2015-03-26', 'admin', '0', '11');
INSERT INTO `tb_bookinfo` VALUES ('CDYF-2014051', 'Swift开发指南', '6', '', '', '7-115', '69.00', '0', '29', '1', '2015-03-26', 'admin', '0', '12');
INSERT INTO `tb_bookinfo` VALUES ('P-002', 'iPhone UIKIT详解', '6', '', '', '7-115', '79.00', '0', '30', '1', '2015-03-26', 'admin', '0', '13');

-- ----------------------------
-- Table structure for `tb_booktype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `days` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_booktype
-- ----------------------------
INSERT INTO `tb_booktype` VALUES ('11', 'Java', '20');
INSERT INTO `tb_booktype` VALUES ('7', 'Android', '20');
INSERT INTO `tb_booktype` VALUES ('6', 'iOS', '20');

-- ----------------------------
-- Table structure for `tb_borrow`
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(10) unsigned DEFAULT NULL,
  `bookid` int(10) DEFAULT NULL,
  `borrowTime` varchar(30) DEFAULT NULL,
  `backTime` varchar(30) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `ifback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO `tb_borrow` VALUES ('1', '1', '2', '2015-03-25', '2042-08-09', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('2', '1', '1', '2015-03-25', '2042-08-09', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('3', '1', '2', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('4', '1', '1', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('5', '2', '1', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('6', '2', '1', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('7', '1', '1', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('8', '1', '1', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('9', '1', '1', '2015-03-25', '2015-04-14', 'admin', '1');
INSERT INTO `tb_borrow` VALUES ('10', '1', '7', '2015-03-26', '2015-04-15', 'admin', '0');

-- ----------------------------
-- Table structure for `tb_giveback`
-- ----------------------------
DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(11) DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `backTime` varchar(30) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_giveback
-- ----------------------------
INSERT INTO `tb_giveback` VALUES ('1', '1', '1', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('2', '2', '1', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('3', '1', '2', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('4', '1', '2', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('5', '1', '1', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('6', '1', '1', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('7', '1', '1', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('8', '2', '1', '2015-03-25', 'admin');
INSERT INTO `tb_giveback` VALUES ('9', '1', '1', '2015-03-26', 'admin');

-- ----------------------------
-- Table structure for `tb_library`
-- ----------------------------
DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libraryname` varchar(50) DEFAULT NULL,
  `curator` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `createDate` varchar(30) DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_library
-- ----------------------------
INSERT INTO `tb_library` VALUES ('1', '地利集团成都研发中心图书馆', '张三', '1363444****', 'ccs', 'wgh8016@***.com', 'http://www.diligrp.com', '2014-01-02', '地利集团成都研发中心图书馆');

-- ----------------------------
-- Table structure for `tb_manager`
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `tb_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cost` int(10) unsigned DEFAULT NULL,
  `validity` int(10) unsigned DEFAULT NULL,
  `remindDay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_parameter
-- ----------------------------
INSERT INTO `tb_parameter` VALUES ('1', '30', '12', '20');

-- ----------------------------
-- Table structure for `tb_publishing`
-- ----------------------------
DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) DEFAULT NULL,
  `pubname` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_publishing
-- ----------------------------
INSERT INTO `tb_publishing` VALUES ('7-115', '未知');

-- ----------------------------
-- Table structure for `tb_purview`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sysset` tinyint(1) DEFAULT '0',
  `readerset` tinyint(1) DEFAULT '0',
  `bookset` tinyint(1) DEFAULT '0',
  `borrowback` tinyint(1) DEFAULT '0',
  `sysquery` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_purview
-- ----------------------------
INSERT INTO `tb_purview` VALUES ('1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `tb_reader`
-- ----------------------------
-- ----------------------------
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `vocation` varchar(50) DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL,
  `paperType` varchar(10) DEFAULT NULL,
  `paperNO` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createDate` varchar(30) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `remark` text,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO `tb_reader` VALUES ('1', '钟轲', '男', '100', '', '0000-00-00', '身份证', '10000000001', '18200394456', '', '2015-03-25', 'admin', '', '12');
INSERT INTO `tb_reader` VALUES ('2', '陈伟涛', '男', '101', '', '0000-00-00', '身份证', '10000000001', '', '', '2015-03-25', 'admin', '', '12');

-- ----------------------------
-- Table structure for `tb_readertype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `number` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO `tb_readertype` VALUES ('11', 'Android开发工程师', '99');
INSERT INTO `tb_readertype` VALUES ('4', 'Java开发工程师', '50');
INSERT INTO `tb_readertype` VALUES ('12', 'iOS开发工程师', '999');
