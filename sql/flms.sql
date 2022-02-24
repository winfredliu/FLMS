/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : flms

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2022-02-24 11:41:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
