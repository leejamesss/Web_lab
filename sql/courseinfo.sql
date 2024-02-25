-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo` (
`Cno` int NOT NULL COMMENT '课程号',
`Cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
 `Cyear` year NULL DEFAULT NULL COMMENT '课程学年',
 `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程地点',
 `Exam` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程考核',
 PRIMARY KEY (`Cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `courseinfo` (`Cno`, `Cname`, `Cyear`, `location`, `Exam`) VALUES (10101, '无机化学', 2021, '教学楼B103', '期末考试'), (20205, '数据结构与算法', 2022, '计算机科学楼C305', '小组作业+期末考试'), (30303, '高等数学B（下）', 2021, '数学系A210', '平时作业+期末考试');
COMMIT;