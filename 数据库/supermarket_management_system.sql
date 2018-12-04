/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : supermarket_management_system

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-12-04 16:03:06
*/

SET FOREIGN_KEY_CHECKS=0;

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
  KEY `type` (`type_id`),
  CONSTRAINT `type` FOREIGN KEY (`type_id`) REFERENCES `commodity_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_information
-- ----------------------------
INSERT INTO `commodity_information` VALUES ('0', '品牌', '品牌 商品名 口味规格 100ml', '商品名', '口味规格', '100', 'ml', '1234567890123', '10', '个', '5.5', '0');

-- ----------------------------
-- Table structure for `commodity_life`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_life`;
CREATE TABLE `commodity_life` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `life` int(4) NOT NULL,
  `Production_Date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commodity_id` (`commodity_id`),
  CONSTRAINT `commodity_life_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity_information` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_life
-- ----------------------------
INSERT INTO `commodity_life` VALUES ('1', '0', '1', '2018-01-31', '2018-11-12');

-- ----------------------------
-- Table structure for `commodity_type`
-- ----------------------------
DROP TABLE IF EXISTS `commodity_type`;
CREATE TABLE `commodity_type` (
  `id` int(2) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of commodity_type
-- ----------------------------
INSERT INTO `commodity_type` VALUES ('0', '信息');

-- ----------------------------
-- Table structure for `report_sales_commodity`
-- ----------------------------
DROP TABLE IF EXISTS `report_sales_commodity`;
CREATE TABLE `report_sales_commodity` (
  `id` int(11) NOT NULL,
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
INSERT INTO `report_sales_commodity` VALUES ('0', '0', '1', '55', '2018-12-02 20:40:17');

-- ----------------------------
-- Table structure for `report_sales_statistical`
-- ----------------------------
DROP TABLE IF EXISTS `report_sales_statistical`;
CREATE TABLE `report_sales_statistical` (
  `id` int(11) NOT NULL,
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交接班时间',
  `Cash_amount` int(8) NOT NULL DEFAULT '0',
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
  `id` int(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pwd` char(32) NOT NULL,
  `privilege` bit(1) NOT NULL DEFAULT b'1' COMMENT '用户权限，0是站长，1是员工',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', '');
