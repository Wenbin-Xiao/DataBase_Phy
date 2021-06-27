/*
Navicat MySQL Data Transfer

Source Server         : ailab
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : employee

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2021-05-28 10:59:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `d_id` char(10) NOT NULL,
  `d_name` char(20) NOT NULL,
  `d_manager_id` char(10) NOT NULL,
  PRIMARY KEY (`d_id`),
  UNIQUE KEY `d_name` (`d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1000000001', '技术部', '0000000001');
INSERT INTO `department` VALUES ('1000000002', '市场部', '0000000020');
INSERT INTO `department` VALUES ('1000000003', '财务部', '0000000066');
INSERT INTO `department` VALUES ('1000000004', '法务部', '0000000888');
INSERT INTO `department` VALUES ('1000000005', '产品部', '0000000011');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `e_id` char(10) NOT NULL,
  `d_id` char(10) NOT NULL,
  `dp_id` char(10) NOT NULL,
  `e_name` char(20) NOT NULL,
  `e_idnumber` char(18) NOT NULL,
  `e_sex` char(8) NOT NULL,
  `e_phone` char(13) NOT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `e_idnumber` (`e_idnumber`),
  UNIQUE KEY `e_phone` (`e_phone`),
  KEY `d_id` (`d_id`),
  KEY `dp_id` (`dp_id`),
  KEY `idx_employee` (`e_id` DESC,`e_name`,`e_phone`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dp_id`) REFERENCES `position` (`dp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('0000000001', '1000000001', '3000000001', '张三', '450803197002026311', '男', '15842567423');
INSERT INTO `employee` VALUES ('0000000002', '1000000001', '3000000001', '李四', '520124198502135211', '男', '18432167412');
INSERT INTO `employee` VALUES ('0000000003', '1000000002', '3000000013', '李华', '320102198606095222', '女', '17514552136');
INSERT INTO `employee` VALUES ('0000000004', '1000000002', '3000000011', '肖炎', '45080319990506631X', '男', '18696668252');
INSERT INTO `employee` VALUES ('0000000005', '1000000002', '3000000011', '黄慧', '450803200102034222', '女', '13085556231');
INSERT INTO `employee` VALUES ('0000000011', '1000000005', '3000000041', '丁一', '124503200102034222', '女', '15231246556');
INSERT INTO `employee` VALUES ('0000000020', '1000000002', '3000000002', '王五', '265412199011035211', '男', '13041236521');
INSERT INTO `employee` VALUES ('0000000066', '1000000003', '3000000021', '王子', '452102198606095221', '男', '17888832154');
INSERT INTO `employee` VALUES ('0000000888', '1000000004', '3000000031', '李平', '62310319990506631X', '男', '18432154684');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `dp_id` char(10) NOT NULL,
  `d_id` char(10) DEFAULT NULL,
  `dp_name` char(20) NOT NULL,
  PRIMARY KEY (`dp_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('3000000001', '1000000001', '主管');
INSERT INTO `position` VALUES ('3000000002', '1000000001', '技术总监');
INSERT INTO `position` VALUES ('3000000003', '1000000001', '职员');
INSERT INTO `position` VALUES ('3000000011', '1000000002', '主管');
INSERT INTO `position` VALUES ('3000000012', '1000000002', '市场总监');
INSERT INTO `position` VALUES ('3000000013', '1000000002', '职员');
INSERT INTO `position` VALUES ('3000000021', '1000000003', '主管');
INSERT INTO `position` VALUES ('3000000022', '1000000003', '财务总监');
INSERT INTO `position` VALUES ('3000000023', '1000000003', '职员');
INSERT INTO `position` VALUES ('3000000031', '1000000004', '主管');
INSERT INTO `position` VALUES ('3000000032', '1000000004', '法务总监');
INSERT INTO `position` VALUES ('3000000033', '1000000004', '职员');
INSERT INTO `position` VALUES ('3000000041', '1000000005', '主管');
INSERT INTO `position` VALUES ('3000000042', '1000000005', '产品总监');
INSERT INTO `position` VALUES ('3000000043', '1000000005', '职员');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `p_id` char(10) NOT NULL,
  `p_name` char(20) NOT NULL,
  `p_begin` date DEFAULT NULL,
  `p_end` date DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_name` (`p_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('6000000001', '微信网页版', '2014-05-05', '2015-04-25');
INSERT INTO `project` VALUES ('6000000002', 'CQ友帮', '2021-03-05', '2021-04-21');

-- ----------------------------
-- Table structure for relation_ep
-- ----------------------------
DROP TABLE IF EXISTS `relation_ep`;
CREATE TABLE `relation_ep` (
  `r_id` char(10) NOT NULL,
  `e_id` char(10) DEFAULT NULL,
  `p_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `e_id` (`e_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `relation_ep_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`e_id`),
  CONSTRAINT `relation_ep_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `project` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of relation_ep
-- ----------------------------
INSERT INTO `relation_ep` VALUES ('5000000001', '0000000001', '6000000001');
INSERT INTO `relation_ep` VALUES ('5000000002', '0000000002', '6000000001');
INSERT INTO `relation_ep` VALUES ('5000000003', '0000000003', '6000000001');
INSERT INTO `relation_ep` VALUES ('5000000004', '0000000004', '6000000001');
INSERT INTO `relation_ep` VALUES ('5000000005', '0000000005', '6000000002');
INSERT INTO `relation_ep` VALUES ('5000000006', '0000000011', '6000000002');
INSERT INTO `relation_ep` VALUES ('5000000007', '0000000066', '6000000002');
INSERT INTO `relation_ep` VALUES ('5000000008', '0000000020', '6000000001');
INSERT INTO `relation_ep` VALUES ('5000000009', '0000000888', '6000000002');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `s_id` char(10) NOT NULL,
  `e_id` char(10) DEFAULT NULL,
  `s_salary` float DEFAULT NULL,
  `s_bonus` float DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `e_id` (`e_id`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('8000000001', '0000000001', '5000', '1200');
INSERT INTO `salary` VALUES ('8000000002', '0000000002', '4500', '800');
INSERT INTO `salary` VALUES ('8000000003', '0000000020', '5500', '200');
INSERT INTO `salary` VALUES ('8000000050', '0000000020', '7000', '2000');

-- ----------------------------
-- View structure for v_salary
-- ----------------------------
DROP VIEW IF EXISTS `v_salary`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salary` AS select `employee`.`e_name` AS `e_name`,`employee`.`e_sex` AS `e_sex`,`salary`.`s_salary` AS `s_salary`,`salary`.`s_bonus` AS `s_bonus` from (`employee` join `salary`) where (`employee`.`e_id` = `salary`.`e_id`) ;
