/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80023
Source Host           : localhost:3306
Source Database       : guanli

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2021-09-28 21:55:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` int NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher` (`teacher`),
  KEY `id` (`id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('8001', 'web开发实训', '6001', '周一(3,5)', '4');
INSERT INTO `course` VALUES ('8002', 'uml实训', '6002', '周一(3,5)', '4');
INSERT INTO `course` VALUES ('8003', 'java网页设计实训', '6001', '周二(3,5)', '4');
INSERT INTO `course` VALUES ('8004', '数据库实训', '6002', '周二(3,5)', '5');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `job` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('0', 'admin', '0', '0');
INSERT INTO `login` VALUES ('1', 'student', '1', '1');
INSERT INTO `login` VALUES ('12', 'teacher', '12', '2');
INSERT INTO `login` VALUES ('123', 'office', '123', '3');

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `cid` int DEFAULT NULL,
  `sid` int DEFAULT NULL,
  KEY `courseid` (`cid`),
  KEY `studentid` (`sid`),
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selectedcourse_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES ('8001', '201801');
INSERT INTO `selectedcourse` VALUES ('8001', '201803');
INSERT INTO `selectedcourse` VALUES ('8001', '201802');
INSERT INTO `selectedcourse` VALUES ('8002', '201801');
INSERT INTO `selectedcourse` VALUES ('8002', '201803');
INSERT INTO `selectedcourse` VALUES ('8003', '201802');
INSERT INTO `selectedcourse` VALUES ('8004', '201802');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `classes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201801', '小陈', '男', '信息学院', '计算机181');
INSERT INTO `student` VALUES ('201802', '小张', '男', '信息学院', '计算机183');
INSERT INTO `student` VALUES ('201803', '小吴', '男', '信息学院', '计算机184');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('6001', '张老师');
INSERT INTO `teacher` VALUES ('6002', '陈老师');
