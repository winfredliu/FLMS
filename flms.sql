/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : flms

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2022-03-08 09:21:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `jid` int NOT NULL AUTO_INCREMENT,
  `jno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jname` varchar(50) NOT NULL,
  `jdept` varchar(50) NOT NULL,
  `jsalary` float DEFAULT NULL,
  `jbonus` float DEFAULT NULL,
  PRIMARY KEY (`jid`),
  UNIQUE KEY `jno` (`jno`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('5', 'j0', '董事长', '董事长办公室', null, null);
INSERT INTO `jobs` VALUES ('8', 'j1', '董秘', '董事长办公室', '10000', '10000');
INSERT INTO `jobs` VALUES ('9', 'j2', '总经理', '总经理办公室', '100000', '20000');
INSERT INTO `jobs` VALUES ('10', 'j3', '总经理秘书', '总经理办公室', '10000', '4000');
INSERT INTO `jobs` VALUES ('11', 'j4', '副总经理-财务', '总经理办公室', '80000', '10000');
INSERT INTO `jobs` VALUES ('12', 'j5', '副总经理-业务', '总经理办公室', '80000', '10000');
INSERT INTO `jobs` VALUES ('13', 'j6', '副总经理-综合', '总经理办公室', '80000', '10000');
INSERT INTO `jobs` VALUES ('14', 'j7', '副总经理-风控', '总经理办公室', '80000', '10000');
INSERT INTO `jobs` VALUES ('15', 'j8', '财务部部长', '财务部', '20000', '5000');
INSERT INTO `jobs` VALUES ('16', 'j9', '核算会计', '财务部', '10000', '2000');
INSERT INTO `jobs` VALUES ('17', 'j10', '总账会计', '财务部', '10000', '2000');
INSERT INTO `jobs` VALUES ('18', 'j18', '出纳', '财务部', '10000', '2000');
INSERT INTO `jobs` VALUES ('19', 'j19', '综合部部长', '综合部', '20000', '5000');
INSERT INTO `jobs` VALUES ('20', 'j20', '人事专员', '综合部', '10000', null);
INSERT INTO `jobs` VALUES ('21', 'j21', '后勤专员', '综合部', '10000', null);
INSERT INTO `jobs` VALUES ('22', 'j22', '司机', '综合部', '8000', null);
INSERT INTO `jobs` VALUES ('23', 'j11', '信息化专员', '综合部', '20000', null);
INSERT INTO `jobs` VALUES ('24', 'j24', '印章保管员', '综合部', '8000', null);
INSERT INTO `jobs` VALUES ('25', 'j25', '库管员', '综合部', '8000', null);
INSERT INTO `jobs` VALUES ('26', 'j26', '前台', '综合部', '6000', null);
INSERT INTO `jobs` VALUES ('27', 'j27', '业务部长', '业务部', '20000', '10000');
INSERT INTO `jobs` VALUES ('28', 'j28', '客户经理', '业务部', '10000', '5000');
INSERT INTO `jobs` VALUES ('29', 'j29', '风控部部长', '风控部', '20000', '10000');
INSERT INTO `jobs` VALUES ('30', 'j30', '放款审核岗', '风控部', '8000', null);
INSERT INTO `jobs` VALUES ('31', 'j31', '合规审核岗', '风控部', '8000', null);
INSERT INTO `jobs` VALUES ('32', 'j32', '项目审核岗', '风控部', '8000', null);
INSERT INTO `jobs` VALUES ('33', 'j33', '秘书', '风控部', '10000', null);
INSERT INTO `jobs` VALUES ('34', 'j34', '股东审核岗', '风控部', '10000', null);
INSERT INTO `jobs` VALUES ('35', 'j35', '外聘专家', '风控部', '20000', null);
INSERT INTO `jobs` VALUES ('36', 'j36', '租后管理岗', '风控部', '10000', null);
INSERT INTO `jobs` VALUES ('37', 'j37', '金融市场部部长', '金融市场部', '20000', '10000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `usercode` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `authority` varchar(30) DEFAULT NULL,
  `wno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `usercode` (`usercode`),
  KEY `fk_ws_user` (`wno`),
  CONSTRAINT `fk_ws_user` FOREIGN KEY (`wno`) REFERENCES `workers` (`wno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', 'yz', '123456', '公司高层', '181549305');
INSERT INTO `user` VALUES ('12', 'lyf', '123456', '公司高层', '181549306');
INSERT INTO `user` VALUES ('13', 'lbw', '123456', '普通员工', '181549304');
INSERT INTO `user` VALUES ('14', 'admin', '123456', '系统管理员', '181549307');
INSERT INTO `user` VALUES ('16', 'nhr', '123456', '财务', '181549308');
INSERT INTO `user` VALUES ('17', 'xcy', '123456', '公司高层', '181549309');

-- ----------------------------
-- Table structure for wj
-- ----------------------------
DROP TABLE IF EXISTS `wj`;
CREATE TABLE `wj` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wno` char(9) DEFAULT NULL,
  `jno` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ws_worker` (`wno`),
  KEY `fk_ws_jobs` (`jno`),
  CONSTRAINT `fk_ws_jobs` FOREIGN KEY (`jno`) REFERENCES `jobs` (`jno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ws_worker` FOREIGN KEY (`wno`) REFERENCES `workers` (`wno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wj
-- ----------------------------
INSERT INTO `wj` VALUES ('10', '181549306', 'j0');
INSERT INTO `wj` VALUES ('11', '181549304', 'j1');
INSERT INTO `wj` VALUES ('12', '181549307', 'j11');
INSERT INTO `wj` VALUES ('13', '181549305', 'j4');
INSERT INTO `wj` VALUES ('14', '181549308', 'j10');
INSERT INTO `wj` VALUES ('15', '181549309', 'j2');

-- ----------------------------
-- Table structure for workers
-- ----------------------------
DROP TABLE IF EXISTS `workers`;
CREATE TABLE `workers` (
  `wid` int NOT NULL AUTO_INCREMENT,
  `wno` char(9) NOT NULL,
  `wname` varchar(30) NOT NULL,
  `wsex` char(2) DEFAULT NULL,
  `wnative` varchar(30) DEFAULT NULL,
  `wphone` varchar(30) NOT NULL,
  PRIMARY KEY (`wid`),
  UNIQUE KEY `wno` (`wno`),
  CONSTRAINT `workers_chk_1` CHECK (((`wsex` = _utf8mb3'男') or (`wsex` = _utf8mb3'女')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of workers
-- ----------------------------
INSERT INTO `workers` VALUES ('4', '181549304', 'lbw', '男', '四川达州', '15003812891');
INSERT INTO `workers` VALUES ('5', '181549305', 'yz', '男', '四川达州', '19928915555');
INSERT INTO `workers` VALUES ('6', '181549306', 'lyf', '男', '云南', '19928915555');
INSERT INTO `workers` VALUES ('7', '181549307', 'wfp', '男', '河南', '19918030625');
INSERT INTO `workers` VALUES ('8', '181549308', 'nhr', '男', '天津', '150046394');
INSERT INTO `workers` VALUES ('9', '181549309', 'xcy', '男', '重庆', '19982070605');

-- ----------------------------
-- Table structure for wsalary
-- ----------------------------
DROP TABLE IF EXISTS `wsalary`;
CREATE TABLE `wsalary` (
  `wsid` int NOT NULL AUTO_INCREMENT,
  `wno` char(9) NOT NULL,
  `wname` varchar(30) NOT NULL,
  `jno` varchar(30) NOT NULL,
  `jname` varchar(50) NOT NULL,
  `jdept` varchar(50) NOT NULL,
  `jsalary` float NOT NULL,
  `jbonus` float NOT NULL,
  `total` float NOT NULL,
  `settledate` varchar(50) DEFAULT NULL,
  `isgrant` varchar(20) DEFAULT '否',
  `grantdate` date DEFAULT NULL,
  PRIMARY KEY (`wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of wsalary
-- ----------------------------
INSERT INTO `wsalary` VALUES ('13', '181549306', 'lyf', 'j0', '董事长', '董事长办公室', '0', '0', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('14', '181549304', 'lbw', 'j1', '董秘', '董事长办公室', '10000', '10000', '20000', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('15', '181549307', 'wfp', 'j11', '信息化专员', '综合部', '20000', '0', '20000', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('16', '181549305', 'yz', 'j4', '副总经理-财务', '总经理办公室', '80000', '10000', '90000', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('17', '181549308', 'nhr', 'j10', '总账会计', '财务部', '10000', '2000', '12000', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('18', '181549306', 'lyf', 'j0', '董事长', '董事长办公室', '0', '0', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('19', '181549304', 'lbw', 'j1', '董秘', '董事长办公室', '10000', '10000', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('20', '181549307', 'wfp', 'j11', '信息化专员', '综合部', '20000', '0', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('21', '181549305', 'yz', 'j4', '副总经理-财务', '总经理办公室', '80000', '10000', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('22', '181549308', 'nhr', 'j10', '总账会计', '财务部', '10000', '2000', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('23', '181549309', 'xcy', 'j2', '总经理', '总经理办公室', '100000', '20000', '0', '', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('24', '181549306', 'lyf', 'j0', '董事长', '董事长办公室', '0', '0', '0', '2022-03', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('25', '181549304', 'lbw', 'j1', '董秘', '董事长办公室', '10000', '10000', '0', '2022-03', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('26', '181549307', 'wfp', 'j11', '信息化专员', '综合部', '20000', '0', '0', '2022-03', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('27', '181549305', 'yz', 'j4', '副总经理-财务', '总经理办公室', '80000', '10000', '0', '2022-03', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('28', '181549308', 'nhr', 'j10', '总账会计', '财务部', '10000', '2000', '0', '2022-03', '是', '2022-02-27');
INSERT INTO `wsalary` VALUES ('29', '181549309', 'xcy', 'j2', '总经理', '总经理办公室', '100000', '20000', '0', '2022-03', '是', '2022-02-27');
