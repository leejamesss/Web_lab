/*
 Navicat Premium Data Transfer

 Source Server         : link1
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : weblab

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 27/11/2023 22:12:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acheive(ua)
-- ----------------------------
DROP TABLE IF EXISTS `acheive(ua)`;
CREATE TABLE `acheive(ua)`  (
  `Uno` int NOT NULL,
  `Ano` int NULL DEFAULT NULL,
  `get_time` datetime NULL DEFAULT NULL,
  `is_display` tinyint(1) NULL DEFAULT NULL,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Ano`(`Ano` ASC) USING BTREE,
  CONSTRAINT `acheive(ua)_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `acheive(ua)_ibfk_2` FOREIGN KEY (`Ano`) REFERENCES `acheivement` (`Ano`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for acheivement
-- ----------------------------
DROP TABLE IF EXISTS `acheivement`;
CREATE TABLE `acheivement`  (
  `Ano` int NOT NULL,
  `Alevel` int NULL DEFAULT NULL,
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Atype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Ano`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `Bno` int NOT NULL AUTO_INCREMENT,
  `bname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `introduction` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `byear` year NULL DEFAULT NULL,
  `press` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `ISBN/ISRC` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `person_in_charge` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `page_number` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CLC` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `attachment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `size` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `series` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Lno` int NOT NULL,
  PRIMARY KEY (`Bno`) USING BTREE,
  INDEX `Lno`(`Lno` ASC) USING BTREE,
  FULLTEXT INDEX `introduction`(`introduction`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Lno`) REFERENCES `library` (`Lno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for borrowing(ub)
-- ----------------------------
DROP TABLE IF EXISTS `borrowing(ub)`;
CREATE TABLE `borrowing(ub)`  (
  `Uno` int NOT NULL,
  `Bno` int NOT NULL,
  `borrow_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  `islegal` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Mno` int NULL DEFAULT NULL,
  `delay` tinyint(1) NULL DEFAULT NULL,
  `audit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  INDEX `Mno`(`Mno` ASC) USING BTREE,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Bno`(`Bno` ASC) USING BTREE,
  CONSTRAINT `borrowing(ub)_ibfk_1` FOREIGN KEY (`Mno`) REFERENCES `manager` (`Mno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrowing(ub)_ibfk_2` FOREIGN KEY (`Uno`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrowing(ub)_ibfk_3` FOREIGN KEY (`Bno`) REFERENCES `book` (`Bno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `Cno` int NOT NULL AUTO_INCREMENT,
  `Cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Cyear` year NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Exam` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`Cno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discussion(up)
-- ----------------------------
DROP TABLE IF EXISTS `discussion(up)`;
CREATE TABLE `discussion(up)`  (
  `Uno` int NOT NULL,
  `Pno` int NOT NULL,
  `date` date NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Pno`(`Pno` ASC) USING BTREE,
  CONSTRAINT `discussion(up)_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `discussion(up)_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `post` (`Pno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for do(sq)
-- ----------------------------
DROP TABLE IF EXISTS `do(sq)`;
CREATE TABLE `do(sq)`  (
  `Uno` int NOT NULL,
  `Qno` int NOT NULL,
  `do_time` datetime NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Qno`(`Qno` ASC) USING BTREE,
  CONSTRAINT `do(sq)_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `student` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `do(sq)_ibfk_2` FOREIGN KEY (`Qno`) REFERENCES `questions` (`Qno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for electronic_book
-- ----------------------------
DROP TABLE IF EXISTS `electronic_book`;
CREATE TABLE `electronic_book`  (
  `Bno` int NOT NULL,
  `rate` float NULL DEFAULT NULL,
  PRIMARY KEY (`Bno`) USING BTREE,
  CONSTRAINT `electronic_book_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `book` (`Bno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `Uno(Owner)` int NOT NULL,
  `Bno` int NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `if_open` tinyint(1) NULL DEFAULT NULL,
  `browsing_history` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Bno`, `Uno(Owner)`) USING BTREE,
  INDEX `Uno(Owner)`(`Uno(Owner)` ASC) USING BTREE,
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `book` (`Bno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`Uno(Owner)`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for friendlist
-- ----------------------------
DROP TABLE IF EXISTS `friendlist`;
CREATE TABLE `friendlist`  (
  `Uno(Owner)` int NOT NULL,
  `Uno` int NOT NULL,
  `is_online` tinyint(1) NULL DEFAULT NULL,
  `F_date` datetime NULL DEFAULT NULL,
  `F_right` int NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Uno`) USING BTREE,
  INDEX `Uno(Owner)`(`Uno(Owner)` ASC) USING BTREE,
  CONSTRAINT `friendlist_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `friendlist_ibfk_2` FOREIGN KEY (`Uno(Owner)`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for have(cs)
-- ----------------------------
DROP TABLE IF EXISTS `have(cs)`;
CREATE TABLE `have(cs)`  (
  `Cno` int NOT NULL,
  `Sno` int NOT NULL,
  INDEX `Sno`(`Sno` ASC) USING BTREE,
  INDEX `Cno`(`Cno` ASC) USING BTREE,
  CONSTRAINT `have(cs)_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `teaching_staff` (`Sno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `have(cs)_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for leave(tq)
-- ----------------------------
DROP TABLE IF EXISTS `leave(tq)`;
CREATE TABLE `leave(tq)`  (
  `Uno` int NOT NULL,
  `Qno` int NOT NULL,
  `leave_time` datetime NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Qno`(`Qno` ASC) USING BTREE,
  CONSTRAINT `leave(tq)_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `teacher` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `leave(tq)_ibfk_2` FOREIGN KEY (`Qno`) REFERENCES `questions` (`Qno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library`  (
  `Lno` int NOT NULL AUTO_INCREMENT,
  `Location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Cooperation_time` datetime NULL DEFAULT NULL,
  `Lname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Lno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `Mno` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `PIN` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` int NULL DEFAULT NULL,
  `right` int NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Onboarding_time` datetime NULL DEFAULT NULL,
  `Working_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Mno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for physical_book
-- ----------------------------
DROP TABLE IF EXISTS `physical_book`;
CREATE TABLE `physical_book`  (
  `Bno` int NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Bno`) USING BTREE,
  CONSTRAINT `physical_book_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `book` (`Bno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `Pno` int NOT NULL AUTO_INCREMENT,
  `Time` datetime NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Uno(owner)` int NULL DEFAULT NULL,
  `Uno(participant)` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `audit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_top` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`Pno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `Qno` int NOT NULL AUTO_INCREMENT,
  `Date` datetime NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `difficulty_level` int NULL DEFAULT NULL,
  `Cno` int NULL DEFAULT NULL,
  `wherefrom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Qno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Uno` int NOT NULL,
  `GPA` float NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Enrollment_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Uno`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for take(sc)
-- ----------------------------
DROP TABLE IF EXISTS `take(sc)`;
CREATE TABLE `take(sc)`  (
  `Uno` int NOT NULL,
  `Cno` int NOT NULL,
  `take_time` datetime NULL DEFAULT NULL,
  `Score` float NULL DEFAULT NULL,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Cno`(`Cno` ASC) USING BTREE,
  CONSTRAINT `take(sc)_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `student` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `take(sc)_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `Uno` int NOT NULL,
  `Onborading_time` datetime NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Working_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Uno`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `user` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teaching(tc)
-- ----------------------------
DROP TABLE IF EXISTS `teaching(tc)`;
CREATE TABLE `teaching(tc)`  (
  `Uno` int NOT NULL,
  `Cno` int NOT NULL,
  `open_date` datetime NULL DEFAULT NULL,
  `appraise` float NULL DEFAULT NULL,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  INDEX `Cno`(`Cno` ASC) USING BTREE,
  CONSTRAINT `teaching(tc)_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `teacher` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teaching(tc)_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teaching_staff
-- ----------------------------
DROP TABLE IF EXISTS `teaching_staff`;
CREATE TABLE `teaching_staff`  (
  `Sno` int NOT NULL AUTO_INCREMENT,
  `Uno` int NOT NULL,
  `Bno` int NOT NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE,
  INDEX `Uno`(`Uno` ASC) USING BTREE,
  CONSTRAINT `teaching_staff_ibfk_1` FOREIGN KEY (`Uno`) REFERENCES `teacher` (`Uno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Uno` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PIN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `register_date` datetime NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL,
  `right` int NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Uno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
