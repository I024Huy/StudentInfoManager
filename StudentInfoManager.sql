/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : bigmysql

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 06/07/2020 15:45:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absent
-- ----------------------------
DROP TABLE IF EXISTS `absent`;
CREATE TABLE `absent`  (
  `kid` int(4) NOT NULL AUTO_INCREMENT,
  `course` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `date` datetime(0) NOT NULL COMMENT '日期',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原因',
  `sid` int(4) NOT NULL,
  PRIMARY KEY (`kid`) USING BTREE,
  INDEX `c_s_id`(`sid`) USING BTREE,
  CONSTRAINT `c_s_id` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of absent
-- ----------------------------
INSERT INTO `absent` VALUES (6, '大学英语1', '2020-06-05 00:00:00', '测试数据', 6);
INSERT INTO `absent` VALUES (7, '高等数学A', '2020-06-12 00:00:00', '生病住院', 9);
INSERT INTO `absent` VALUES (11, '高等数学A', '2020-06-01 00:00:00', '参加比赛', 6);
INSERT INTO `absent` VALUES (12, '大学英语2', '2020-07-01 00:00:00', '参加比赛', 18);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '12345');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `xid` int(11) NOT NULL AUTO_INCREMENT,
  `xname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`xid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '计算机与软件工程学院');
INSERT INTO `college` VALUES (2, '电子与电气工程学');
INSERT INTO `college` VALUES (3, '法学院');
INSERT INTO `college` VALUES (4, '医学院');

-- ----------------------------
-- Table structure for counselor
-- ----------------------------
DROP TABLE IF EXISTS `counselor`;
CREATE TABLE `counselor`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'username表示辅导员号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0标识女，1标识男',
  `age` int(4) NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of counselor
-- ----------------------------
INSERT INTO `counselor` VALUES (1, '50110', '12345', 'Ashe', '1', 28, '15234589622', 'Ashe@qq.com', '四川省成都市郫都区');
INSERT INTO `counselor` VALUES (2, '50111', '12345', 'Timo', '1', 28, '15632458566', 'Timo@qq.com', '四川省成都市');

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1:学生以编辑，0:学生未编辑',
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `fname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监护人姓名',
  `fgender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监护人性别（0：女；1：男）',
  `fage` int(4) NULL DEFAULT NULL COMMENT '监护人年龄',
  `fphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监护人电话',
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES (1, '1', '四川省成都市', 'Tom', '1', 33, '14669824751');
INSERT INTO `family` VALUES (13, '0', '四川省成都市', 'jackDad', '1', 36, '15632458566');
INSERT INTO `family` VALUES (16, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `family` VALUES (17, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `family` VALUES (18, '1', '四川省成都市', 'lindaDad', '1', 33, '15632458566');
INSERT INTO `family` VALUES (27, '1', '四川省成都市郫都区', 'hay', '1', 33, '11111111111');
INSERT INTO `family` VALUES (36, '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `family` VALUES (37, '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize`  (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '级别',
  `date` datetime(0) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`hid`) USING BTREE,
  INDEX `h_s_id`(`sid`) USING BTREE,
  CONSTRAINT `h_s_id` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prize
-- ----------------------------
INSERT INTO `prize` VALUES (13, '篮球比赛', '最佳后卫', '2020-06-04 00:00:00', 6);
INSERT INTO `prize` VALUES (23, '数学建模', '一等奖', '2020-07-05 00:00:00', 6);
INSERT INTO `prize` VALUES (26, '数学建模', '三等奖', '2020-05-07 00:00:00', 9);
INSERT INTO `prize` VALUES (27, '数学建模', '一等奖', '2020-06-30 00:00:00', 18);
INSERT INTO `prize` VALUES (28, '网页设计大赛', '一等奖', '2020-06-29 00:00:00', 9);

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession`  (
  `zid` int(11) NOT NULL AUTO_INCREMENT,
  `zname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xid` int(11) NOT NULL COMMENT '所在学院',
  PRIMARY KEY (`zid`) USING BTREE,
  INDEX `p_c_id`(`xid`) USING BTREE,
  CONSTRAINT `p_c_id` FOREIGN KEY (`xid`) REFERENCES `college` (`xid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profession
-- ----------------------------
INSERT INTO `profession` VALUES (1, '计算机科学与技术', 1);
INSERT INTO `profession` VALUES (2, '软件工程', 1);
INSERT INTO `profession` VALUES (3, '物联网工程', 1);
INSERT INTO `profession` VALUES (4, '智能科学与技术', 1);
INSERT INTO `profession` VALUES (5, '信息安全', 1);
INSERT INTO `profession` VALUES (6, '临床医学', 4);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'username表示学号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0标识女，1标识男',
  `age` int(4) NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `room` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '寝室',
  `IDcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `grade` int(4) NOT NULL COMMENT '所在年级',
  `myclass` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在班级',
  `fid` int(4) NULL DEFAULT NULL COMMENT '家庭信息',
  `zid` int(4) NULL DEFAULT NULL COMMENT '所在专业',
  `cid` int(4) NULL DEFAULT NULL COMMENT '所属辅导员',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `s_f_id`(`fid`) USING BTREE,
  INDEX `s_z_id`(`zid`) USING BTREE,
  INDEX `s_c_id`(`cid`) USING BTREE,
  CONSTRAINT `s_c_id` FOREIGN KEY (`cid`) REFERENCES `counselor` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `s_f_id` FOREIGN KEY (`fid`) REFERENCES `family` (`fid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `s_z_id` FOREIGN KEY (`zid`) REFERENCES `profession` (`zid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (6, '3120190906312', '12345', 'jack', '1', 22, '15632458566', 'd32d32d32@qq.com', '一舍202', '212147845963254485', 2017, '计科1班', 1, 6, 1);
INSERT INTO `student` VALUES (9, '3120190906316', '12345', 'Linda', '0', 20, '14569824751', 'linda@qq.com', '一舍202', '544215423654785423', 2017, '临床医学2班', 18, 6, 1);
INSERT INTO `student` VALUES (18, '3120190901301', '11111', '张三', '0', 21, '14785236925', 'zhangsan@163.com', '一舍202', '553315423654785423', 2017, '临床医学2班', 36, 6, 1);
INSERT INTO `student` VALUES (19, '3120190901302', '12345', '张婷', '0', 20, '14785236925', 'zhangsan@163.com', '一舍404', '212147845963254485', 2017, '计科1班', 37, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
