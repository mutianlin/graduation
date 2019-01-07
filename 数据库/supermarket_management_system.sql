/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : supermarket_management_system

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-01-07 22:49:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `assets`
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `but_date` date NOT NULL,
  `scrapped_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES ('1', '资产名称', '2018-12-26', '2018-12-27');

-- ----------------------------
-- Table structure for `commodity_in`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_in`;
CREATE TABLE `commodity_in` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `life_id` int(11) unsigned DEFAULT NULL,
  `set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_number` (`order_number`),
  KEY `commodity_id` (`commodity_id`),
  KEY `life_id` (`life_id`),
  CONSTRAINT `commodity_in_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity_information` (`id`),
  CONSTRAINT `commodity_in_ibfk_2` FOREIGN KEY (`life_id`) REFERENCES `commodity_life` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_in
-- ----------------------------

-- ----------------------------
-- Table structure for `commodity_information`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_information`;
CREATE TABLE `commodity_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Brand` varchar(255) NOT NULL COMMENT '品牌',
  `all_name` varchar(255) NOT NULL COMMENT '商品全名，包含品牌，名称，规格，净含量，净含量单位',
  `name` varchar(255) NOT NULL,
  `specification` varchar(255) DEFAULT NULL COMMENT '商品规格，记录商品的口味',
  `net_weight` int(4) NOT NULL COMMENT '净含量',
  `net_weight_unit` char(2) NOT NULL COMMENT '净含量单位 kg g l ml',
  `bar_code` char(13) NOT NULL COMMENT '13位条码',
  `inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `inventory_unti` char(2) NOT NULL DEFAULT '个' COMMENT '商品计量单位',
  `price` float NOT NULL DEFAULT '0' COMMENT '进价',
  `type_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `commodity_information_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `commodity_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_information
-- ----------------------------
INSERT INTO `commodity_information` VALUES ('1', '品牌', '品牌 名字规格口味 100ml', '名字', '规格口味', '100', 'ml', '1234567891113', '0', '瓶', '0', '1');

-- ----------------------------
-- Table structure for `commodity_life`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_life`;
CREATE TABLE `commodity_life` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `life` int(4) NOT NULL COMMENT '以天为单位记录保质期',
  `Production_Date` date NOT NULL COMMENT '生产日期',
  `deadline` date DEFAULT NULL COMMENT '最后一天保质期',
  PRIMARY KEY (`id`),
  KEY `commodity_id` (`commodity_id`),
  CONSTRAINT `commodity_life_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_life
-- ----------------------------
INSERT INTO `commodity_life` VALUES ('1', '1', '365', '2018-12-08', '2019-12-08');

-- ----------------------------
-- Table structure for `commodity_price`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_price`;
CREATE TABLE `commodity_price` (
  `commodity_id` int(11) NOT NULL,
  `price` float unsigned NOT NULL,
  PRIMARY KEY (`commodity_id`),
  CONSTRAINT `commodity_price_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_price
-- ----------------------------

-- ----------------------------
-- Table structure for `commodity_receive`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_receive`;
CREATE TABLE `commodity_receive` (
  `id` int(11) NOT NULL,
  `in_order_number` int(11) NOT NULL,
  `in_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `receive_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '0表示未接收，1表示接收，2表示拒收',
  `receiver` int(3) DEFAULT NULL COMMENT '收货人，写user表id',
  PRIMARY KEY (`id`),
  KEY `in_order_number` (`in_order_number`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `commodity_receive_ibfk_1` FOREIGN KEY (`in_order_number`) REFERENCES `commodity_in` (`order_number`),
  CONSTRAINT `commodity_receive_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_receive
-- ----------------------------

-- ----------------------------
-- Table structure for `commodity_type`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_type`;
CREATE TABLE `commodity_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_type
-- ----------------------------
INSERT INTO `commodity_type` VALUES ('1', '其他');
INSERT INTO `commodity_type` VALUES ('2', '饮料');
INSERT INTO `commodity_type` VALUES ('3', '奶制品');
INSERT INTO `commodity_type` VALUES ('4', '饼干');
INSERT INTO `commodity_type` VALUES ('5', '面包');
INSERT INTO `commodity_type` VALUES ('6', '香烟');
INSERT INTO `commodity_type` VALUES ('7', '酒');
INSERT INTO `commodity_type` VALUES ('8', '日用品');
INSERT INTO `commodity_type` VALUES ('9', '调味品');

-- ----------------------------
-- Table structure for `promotions`
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount_price` float NOT NULL,
  `status` bit(1) DEFAULT b'0' COMMENT '0不启用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of promotions
-- ----------------------------

-- ----------------------------
-- Table structure for `report_sales_commodity`
-- ----------------------------
DROP TABLE IF EXISTS `report_sales_commodity`;
CREATE TABLE `report_sales_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `number` int(10) unsigned NOT NULL COMMENT '商品销售数量',
  `price` int(11) NOT NULL COMMENT '销售额',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `commodity` (`commodity_id`),
  CONSTRAINT `commodity` FOREIGN KEY (`commodity_id`) REFERENCES `commodity_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of report_sales_commodity
-- ----------------------------

-- ----------------------------
-- Table structure for `report_sales_statistical`
-- ----------------------------
DROP TABLE IF EXISTS `report_sales_statistical`;
CREATE TABLE `report_sales_statistical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交接班时间',
  `Cash_amount` int(8) NOT NULL DEFAULT '0' COMMENT '现金',
  `Total_sales` int(11) NOT NULL,
  `type1N` int(11) NOT NULL,
  `type1A` int(11) NOT NULL,
  `type2N` int(11) NOT NULL,
  `type2A` int(11) NOT NULL,
  `type3N` int(11) NOT NULL,
  `type3A` int(11) NOT NULL,
  `type4N` int(11) NOT NULL,
  `type4A` int(11) NOT NULL,
  `type5N` int(11) NOT NULL,
  `type5A` int(11) NOT NULL,
  `type6N` int(11) NOT NULL,
  `type6A` int(11) NOT NULL,
  `type7N` int(11) NOT NULL,
  `type7A` int(11) NOT NULL,
  `type8N` int(11) NOT NULL,
  `type8A` int(11) NOT NULL,
  `type9N` int(11) NOT NULL,
  `type9A` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of report_sales_statistical
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pwd` char(32) NOT NULL,
  `privilege` bit(1) NOT NULL DEFAULT b'1' COMMENT '用户权限，0是站长，1是员工',
  `Incumbent` bit(1) NOT NULL DEFAULT b'0' COMMENT '0离职，1在任',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', '', '');
