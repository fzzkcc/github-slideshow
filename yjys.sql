/*
 Navicat Premium Data Transfer

 Source Server         : mysqld
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : yjys

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 24/11/2020 19:19:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIG_TO_TRIG_FK` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` longblob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIG_TO_TRIG_FK` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` decimal(13, 0) NOT NULL,
  `SCHED_TIME` decimal(13, 0) NOT NULL,
  `PRIORITY` decimal(13, 0) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` decimal(13, 0) NOT NULL,
  `CHECKIN_INTERVAL` decimal(13, 0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` decimal(7, 0) NOT NULL,
  `REPEAT_INTERVAL` decimal(12, 0) NOT NULL,
  `TIMES_TRIGGERED` decimal(10, 0) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIG_TO_TRIG_FK` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `STR_PROP_2` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `STR_PROP_3` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `INT_PROP_1` decimal(10, 0) DEFAULT NULL,
  `INT_PROP_2` decimal(10, 0) DEFAULT NULL,
  `LONG_PROP_1` decimal(13, 0) DEFAULT NULL,
  `LONG_PROP_2` decimal(13, 0) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIG_TO_TRIG_FK` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` decimal(13, 0) DEFAULT NULL,
  `PREV_FIRE_TIME` decimal(13, 0) DEFAULT NULL,
  `PRIORITY` decimal(13, 0) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` decimal(13, 0) NOT NULL,
  `END_TIME` decimal(13, 0) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` decimal(2, 0) DEFAULT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `QRTZ_TRIGGER_TO_JOBS_FK`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGER_TO_JOBS_FK` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITILE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `MSG_CONTENT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `START_TIME` datetime(0) DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime(0) DEFAULT NULL COMMENT '结束时间',
  `SENDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布人',
  `PRIORITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `MSG_CATEGORY` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型1:通知公告2:系统消息',
  `MSG_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `SEND_STATUS` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `SEND_TIME` datetime(0) DEFAULT NULL COMMENT '发布时间',
  `CANCEL_TIME` datetime(0) DEFAULT NULL COMMENT '撤销时间',
  `DEL_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `USER_IDS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '指定用户',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_send`;
CREATE TABLE `sys_announcement_send`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ANNT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '通告ID',
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `READ_FLAG` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `READ_TIME` datetime(0) DEFAULT NULL COMMENT '阅读时间',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通告阅读标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_arcsoft_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_arcsoft_config`;
CREATE TABLE `sys_arcsoft_config`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统编号',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'SDK名称',
  `OS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作系统版本',
  `APP_ID` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '应用ID',
  `SDK_KEY` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'KEY值',
  `VERSION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'SDK版本号',
  `LANGUAGE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '语言',
  `DOWNLOAD_TIME` datetime(0) DEFAULT NULL COMMENT 'SDK下载时间',
  `VALID_TIME` datetime(0) DEFAULT NULL COMMENT '到期时间',
  `DEL_FLAG` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态（无效：0，有效：1）',
  `SYS_ORG_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建部门',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `LIB_PATH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Lib路径',
  `DETECT_POO_SIZE` decimal(65, 30) DEFAULT NULL COMMENT '检测池数量',
  `COMPARE_POO_SIZE` decimal(65, 30) DEFAULT NULL COMMENT '比对池数量'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人脸识别JDK配置_虹软' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `ID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级节点',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型名称',
  `CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型编码',
  `CREATE_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `UPDATE_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新日期',
  `SYS_ORG_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属部门',
  `HAS_CHILD` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否有子节点',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('1183693424827564034', '0', '物料树', 'B02', 'admin', '2019-10-14 18:37:59', 'admin', '2019-10-14 18:38:15', 'A01', '1');
INSERT INTO `sys_category` VALUES ('1183693491043041282', '1183693424827564034', '上衣', 'B02A01', 'admin', '2019-10-14 18:38:15', 'admin', '2019-10-14 18:38:43', 'A01', '1');
INSERT INTO `sys_category` VALUES ('1183693534173069314', '1183693424827564034', '裤子', 'B02A02', 'admin', '2019-10-14 18:38:25', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1183693610534567937', '1183693491043041282', '秋衣', 'B02A01A01', 'admin', '2019-10-14 18:38:43', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1183693700254924802', '1183693491043041282', '兵装', 'B02A01A02', 'admin', '2019-10-14 18:39:05', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1183693773974011906', '1183693491043041282', '女装', 'B02A01A03', 'admin', '2019-10-14 18:39:22', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1185039122143719425', '0', '电脑产品', 'A01', 'admin', '2019-10-18 11:45:18', 'admin', '2019-10-18 11:45:31', 'A01', '1');
INSERT INTO `sys_category` VALUES ('1185039176799694850', '1185039122143719425', 'thinkpad', 'A01A01', 'admin', '2019-10-18 11:45:31', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1185039255115739138', '1185039122143719425', 'mackbook', 'A01A02', 'admin', '2019-10-18 11:45:50', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('1185039299051073537', '1185039122143719425', '华为电脑', 'A01A03', 'admin', '2019-10-18 11:46:01', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('22a50b413c5e1ef661fb8aea9469cf52', 'e9ded10fd33e5753face506f4f1564b5', 'MacBook', 'B01-2-1', 'admin', '2019-06-10 15:43:13', NULL, NULL, 'A01', NULL);
INSERT INTO `sys_category` VALUES ('5c8f68845e57f68ab93a2c8d82d26ae1', '0', '笔记本', 'B01', 'admin', '2019-06-10 15:34:11', 'admin', '2019-06-10 15:34:24', 'A01', '1');
INSERT INTO `sys_category` VALUES ('937fd2e9aa13b8bab1da1ca36d3fd344', 'e9ded10fd33e5753face506f4f1564b5', '台式机', 'B02-2-2', 'admin', '2019-06-10 15:43:32', 'admin', '2019-08-21 12:01:59', 'A01', NULL);
INSERT INTO `sys_category` VALUES ('e9ded10fd33e5753face506f4f1564b5', '5c8f68845e57f68ab93a2c8d82d26ae1', '苹果电脑', 'B01-2', 'admin', '2019-06-10 15:41:14', 'admin', '2019-06-10 15:43:13', 'A01', '1');
INSERT INTO `sys_category` VALUES ('f39a06bf9f390ba4a53d11bc4e0018d7', '5c8f68845e57f68ab93a2c8d82d26ae1', '华为', 'B01-1', 'admin', '2019-06-10 15:34:24', 'admin', '2019-08-21 12:01:56', 'A01', NULL);

-- ----------------------------
-- Table structure for sys_data_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_log`;
CREATE TABLE `sys_data_log`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人登录名称',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人登录名称',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新日期',
  `DATA_TABLE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表名',
  `DATA_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据ID',
  `DATA_CONTENT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '数据内容',
  `DATA_VERSION` decimal(11, 0) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_depart`;
CREATE TABLE `sys_depart`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `PARENT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父机构ID',
  `DEPART_NAME` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `DEPART_NAME_EN` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '英文名',
  `DEPART_NAME_ABBR` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '缩写',
  `DEPART_ORDER` decimal(11, 0) DEFAULT NULL COMMENT '排序',
  `DESCRIPTION` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '描述',
  `ORG_CATEGORY` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构类别 1组织机构，2岗位',
  `ORG_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构类型 1一级部门 2子部门',
  `ORG_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `MOBILE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `FAX` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '传真',
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `MEMO` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `DEL_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO `sys_depart` VALUES ('510000000000', '', '四川省应急管理厅', NULL, NULL, NULL, NULL, '1', NULL, '510000000000', NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_depart` VALUES ('511500000000', '510000000000', '宜宾市应急管理局', NULL, NULL, NULL, NULL, '1', NULL, '511500000000', NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, NULL, NULL);
INSERT INTO `sys_depart` VALUES ('511524000000', '511500000000', '长宁县应急管理局', NULL, NULL, NULL, NULL, '1', NULL, '511524000000', NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DICT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典名称',
  `DICT_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典编码',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `DEL_FLAG` decimal(11, 0) DEFAULT NULL COMMENT '删除状态',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `TYPE` decimal(11, 0) DEFAULT NULL COMMENT '字典类型0为string,1为number',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0b5d19e1fce4b2e6647e6b4a17760c14', '通告类型', 'msg_category', '消息类型1:通知公告2:系统消息', 0, 'admin', '2019-04-22 18:01:35', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1174509082208395266', '职务职级', 'position_rank', '职务表职级字典', 0, 'admin', '2019-09-19 10:22:41', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1174511106530525185', '机构类型', 'org_category', '机构类型 1组织机构，2岗位', 0, 'admin', '2019-09-19 10:30:43', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1178295274528845826', '表单权限策略', 'form_perms_type', NULL, 0, 'admin', '2019-09-29 21:07:39', 'admin', '2019-09-29 21:08:26', NULL);
INSERT INTO `sys_dict` VALUES ('1199517671259906049', '紧急程度', 'urgent_level', '日程计划紧急程度', 0, 'admin', '2019-11-27 10:37:53', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1199518099888414722', '日程计划类型', 'eoa_plan_type', NULL, 0, 'admin', '2019-11-27 10:39:36', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1199520177767587841', '分类栏目类型', 'eoa_cms_menu_type', NULL, 0, 'admin', '2019-11-27 10:47:51', 'admin', '2019-11-27 10:49:35', 0);
INSERT INTO `sys_dict` VALUES ('1199525215290306561', '日程计划状态', 'eoa_plan_status', NULL, 0, 'admin', '2019-11-27 11:07:52', 'admin', '2019-11-27 11:10:11', 0);
INSERT INTO `sys_dict` VALUES ('1224573164209348610', '订单类型', 'order_type', '订单类型', 0, 'admin', '2020-02-04 13:59:28', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1224573712316801026', '订单级别', 'order_level', '订单级别', 0, 'admin', '2020-02-04 14:01:39', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1225278386548371457', '数据状态', 'data_status', '业务数据分析状态', 0, 'admin', '2020-02-06 12:41:46', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1225340866343579650', '上传方式', 'upload_type', '数据上传方式', 0, 'admin', '2020-02-06 16:50:02', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1229365283004428290', '解析状态', 'is_check', '地址是否解析', 0, 'admin', '2020-02-17 19:21:38', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1229365834551209986', '下载状态', 'download_status', '地址数据下载状态', 0, 'admin', '2020-02-17 19:23:50', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1229366964836446209', '上传状态', 'upload_status', '地址数据上传状态', 0, 'admin', '2020-02-17 19:28:19', 'admin', '2020-02-17 19:28:47', NULL);
INSERT INTO `sys_dict` VALUES ('123456789', '系统参数表参数状态', 'param_status', '系统参数表参数状态', 0, 'admin', NULL, 'admin', '2020-02-04 16:27:44', 0);
INSERT INTO `sys_dict` VALUES ('1267472934607077377', '地图级别', 'level_type', '地图级别', 0, 'admin', '2020-06-01 23:07:50', 'admin', '2020-06-01 23:08:06', NULL);
INSERT INTO `sys_dict` VALUES ('1267475422336864257', '地图上传状态', 'map_upload', '地图上传状态', 0, 'admin', '2020-06-01 23:17:43', 'admin', '2020-06-01 23:17:54', NULL);
INSERT INTO `sys_dict` VALUES ('1291573236824850433', '注销状态', 'del_status', '注销状态', 0, 'admin', '2020-08-07 11:13:50', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1291573548746850305', '所属层级', 'ca_level', '所属层级', 0, 'admin', '2020-08-07 11:15:04', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1291576118848626689', '首页显示', 'is_show', '首页显示', 0, 'admin', '2020-08-07 11:25:17', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1291660923565015042', '文章类型', 'text_type', '文章类型', 0, 'admin', '2020-08-07 17:02:16', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1292655036867330050', '是否热点', 'is_hot', '是否热点', 0, 'admin', '2020-08-10 10:52:31', 'admin', '2020-08-10 10:53:58', NULL);
INSERT INTO `sys_dict` VALUES ('1292656429984444417', '是否发布', 'is_onSale', '是否发布', 0, 'admin', '2020-08-10 10:58:03', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1292712998042415105', '是否启用', 'en_abled', '是否启用', 0, 'admin', '2020-08-10 14:42:50', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1292715694522667009', '处理状态', 'handle_type', '处理状态', 0, 'admin', '2020-08-10 14:53:26', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1292720168964214785', '用户反馈类型', 'usermsg_type', '用户反馈类型', 0, 'admin', '2020-08-10 15:11:17', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1310601164876472322', '是否', 'yes_no', NULL, 0, 'admin', '2020-09-28 23:24:02', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1322928223099338753', '房屋类型', 'house_type', '房屋类型', 0, 'admin', '2020-11-01 23:47:21', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1323214795128496130', '住户类型', 'usercelltype', NULL, 0, 'admin', '2020-11-02 18:46:05', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1329427035896872961', '汉', '01', '', 1, 'admin', '2020-11-19 22:11:20', 'admin', '2020-11-19 22:13:24', NULL);
INSERT INTO `sys_dict` VALUES ('1329427523199500290', '彝', '02', '', 1, 'admin', '2020-11-19 22:13:16', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1329436370890833921', '民族类型', 'mz_code', '民族等', 0, 'admin', '2020-11-19 22:48:25', 'admin', '2020-11-20 11:13:19', NULL);
INSERT INTO `sys_dict` VALUES ('236e8a4baff0db8c62c00dd95632834f', '同步工作流引擎', 'activiti_sync', '同步工作流引擎', 0, 'admin', '2019-05-15 15:27:33', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2e02df51611a4b9632828ab7e5338f00', '权限策略', 'perms_type', '权限策略', 0, 'admin', '2019-04-26 18:26:55', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2f0320997ade5dd147c90130f7218c3e', '推送类别', 'msg_type', NULL, 0, 'admin', '2019-03-17 21:21:32', 'admin', '2019-03-26 19:57:45', 0);
INSERT INTO `sys_dict` VALUES ('3486f32803bb953e7155dab3513dc68b', '删除状态', 'del_flag', NULL, 0, 'admin', '2019-01-18 21:46:26', 'admin', '2019-03-30 11:17:11', 0);
INSERT INTO `sys_dict` VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, 0, NULL, '2019-01-04 14:56:32', 'admin', '2019-03-30 11:28:27', 1);
INSERT INTO `sys_dict` VALUES ('404a04a15f371566c658ee9ef9fc392a', 'cehis2', '22', NULL, 1, 'admin', '2019-01-30 11:17:21', 'admin', '2019-03-30 11:18:12', 0);
INSERT INTO `sys_dict` VALUES ('4274efc2292239b6f000b153f50823ff', '全局权限策略', 'global_perms_type', '全局权限策略', 0, 'admin', '2019-05-10 17:54:05', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4c03fca6bf1f0299c381213961566349', 'Online图表展示模板', 'online_graph_display_template', 'Online图表展示模板', 0, 'admin', '2019-04-12 17:28:50', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4c753b5293304e7a445fd2741b46529d', '字典状态', 'dict_item_status', NULL, 0, 'admin', '2020-06-18 23:18:42', 'admin', '2019-03-30 19:33:52', 1);
INSERT INTO `sys_dict` VALUES ('4d7fec1a7799a436d26d02325eff295e', '优先级', 'priority', '优先级', 0, 'admin', '2019-03-16 17:03:34', 'admin', '2019-04-16 17:39:23', 0);
INSERT INTO `sys_dict` VALUES ('4e4602b3e3686f0911384e188dc7efb4', '条件规则', 'rule_conditions', NULL, 0, 'admin', '2019-04-01 10:15:03', 'admin', '2019-04-01 10:30:47', 0);
INSERT INTO `sys_dict` VALUES ('4f69be5f507accea8d5df5f11346181a', '发送消息类型', 'msgType', NULL, 0, 'admin', '2019-04-11 14:27:09', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('68168534ff5065a152bfab275c2136f8', '有效无效状态', 'valid_status', '有效无效状态', 0, 'admin', '2020-09-26 19:21:14', 'admin', '2019-04-26 19:21:23', 0);
INSERT INTO `sys_dict` VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, 1, NULL, '2019-01-04 14:59:01', 'admin', '2019-03-18 23:28:18', 0);
INSERT INTO `sys_dict` VALUES ('72cce0989df68887546746d8f09811aa', 'Online表单类型', 'cgform_table_type', NULL, 0, 'admin', '2019-01-27 10:13:02', 'admin', '2019-03-30 11:37:36', 0);
INSERT INTO `sys_dict` VALUES ('78bda155fe380b1b3f175f1e88c284c6', '流程状态', 'bpm_status', '流程状态', 0, 'admin', '2019-05-09 16:31:52', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('83bfb33147013cc81640d5fd9eda030c', '日志类型', 'log_type', NULL, 0, 'admin', '2019-03-18 23:22:19', NULL, NULL, 1);
INSERT INTO `sys_dict` VALUES ('845da5006c97754728bf48b6a10f79cc', '状态', 'status', NULL, 1, 'admin', '2019-03-18 21:45:25', 'admin', '2019-03-18 21:58:25', 0);
INSERT INTO `sys_dict` VALUES ('880a895c98afeca9d9ac39f29e67c13e', '操作类型', 'operate_type', '操作类型', 0, 'admin', '2019-07-22 10:54:29', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('8dfe32e2d29ea9430a988b3b558bf233', '发布状态', 'send_status', '发布状态', 0, 'admin', '2019-04-16 17:40:42', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a7adbcd86c37f7dbc9b66945c82ef9e6', '1是0否', 'yn', NULL, 1, 'admin', '2019-05-22 19:29:29', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a9d9942bd0eccb6e89de92d130ec4c4a', '消息发送状态', 'msgSendStatus', NULL, 0, 'admin', '2019-04-12 18:18:17', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('ac2f7c0c5c5775fcea7e2387bcb22f01', '菜单类型', 'menu_type', NULL, 0, 'admin', '2020-12-18 23:24:32', 'admin', '2019-04-01 15:27:06', 1);
INSERT INTO `sys_dict` VALUES ('ad7c65ba97c20a6805d5dcdf13cdaf36', 'onlineT类型', 'ceshi_online', NULL, 1, 'admin', '2019-03-22 16:31:49', 'admin', '2019-03-22 16:34:16', 0);
INSERT INTO `sys_dict` VALUES ('bd1b8bc28e65d6feefefb6f3c79f42fd', 'Online图表数据类型', 'online_graph_data_type', 'Online图表数据类型', 0, 'admin', '2019-04-12 17:24:24', 'admin', '2019-04-12 17:24:57', 0);
INSERT INTO `sys_dict` VALUES ('c36169beb12de8a71c8683ee7c28a503', '部门状态', 'depart_status', NULL, 0, 'admin', '2019-03-18 21:59:51', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('c5a14c75172783d72cbee6ee7f5df5d1', 'Online图表类型', 'online_graph_type', 'Online图表类型', 0, 'admin', '2019-04-12 17:04:06', NULL, NULL, 0);
INSERT INTO `sys_dict` VALUES ('d6e1152968b02d69ff358c75b48a6ee1', '流程类型', 'bpm_process_type', NULL, 0, 'admin', '2021-02-22 19:26:54', 'admin', '2019-03-30 18:14:44', 0);
INSERT INTO `sys_dict` VALUES ('fc6cd58fde2e8481db10d3a1e68ce70c', '用户状态', 'user_status', NULL, 0, 'admin', '2019-03-18 21:57:25', 'admin', '2019-03-18 23:11:58', 1);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DICT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典id',
  `ITEM_TEXT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典项文本',
  `ITEM_VALUE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典项值',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `SORT_ORDER` decimal(11, 0) DEFAULT NULL COMMENT '排序',
  `STATUS` decimal(11, 0) DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime(0) DEFAULT NULL,
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPDATE_TIME` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('0072d115e07c875d76c9b022e2179128', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', '低', 3, 1, 'admin', '2019-04-16 17:04:59', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('05a2e732ce7b00aa52141ecc3e330b4e', '3486f32803bb953e7155dab3513dc68b', '已删除', '1', NULL, NULL, 1, 'admin', '2025-10-18 21:46:56', 'admin', '2019-03-28 22:23:20');
INSERT INTO `sys_dict_item` VALUES ('096c2e758d823def3855f6376bc736fb', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'SQL', 'sql', NULL, 1, 1, 'admin', '2019-04-12 17:26:26', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('0c9532916f5cd722017b46bc4d953e41', '2f0320997ade5dd147c90130f7218c3e', '指定用户', 'USER', NULL, NULL, 1, 'admin', '2019-03-17 21:22:19', 'admin', '2019-03-17 21:22:28');
INSERT INTO `sys_dict_item` VALUES ('0ca4beba9efc4f9dd54af0911a946d5c', '72cce0989df68887546746d8f09811aa', '附表', '3', NULL, 3, 1, 'admin', '2019-03-27 10:13:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1030a2652608f5eac3b49d70458b8532', '2e02df51611a4b9632828ab7e5338f00', '禁用', '2', '禁用', 2, 1, 'admin', '2021-03-26 18:27:28', 'admin', '2019-04-26 18:39:11');
INSERT INTO `sys_dict_item` VALUES ('1174509601047994369', '1174509082208395266', '员级', '1', NULL, 1, 1, 'admin', '2019-09-19 10:24:45', 'admin', '2019-09-23 11:46:39');
INSERT INTO `sys_dict_item` VALUES ('1174509667297026049', '1174509082208395266', '助级', '2', NULL, 2, 1, 'admin', '2019-09-19 10:25:01', 'admin', '2019-09-23 11:46:47');
INSERT INTO `sys_dict_item` VALUES ('1174509713568587777', '1174509082208395266', '中级', '3', NULL, 3, 1, 'admin', '2019-09-19 10:25:12', 'admin', '2019-09-23 11:46:56');
INSERT INTO `sys_dict_item` VALUES ('1174509788361416705', '1174509082208395266', '副高级', '4', NULL, 4, 1, 'admin', '2019-09-19 10:25:30', 'admin', '2019-09-23 11:47:06');
INSERT INTO `sys_dict_item` VALUES ('1174509835803189250', '1174509082208395266', '正高级', '5', NULL, 5, 1, 'admin', '2019-09-19 10:25:41', 'admin', '2019-09-23 11:47:12');
INSERT INTO `sys_dict_item` VALUES ('1174511197735665665', '1174511106530525185', '组织机构', '1', '组织机构', 1, 1, 'admin', '2019-09-19 10:31:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1174511244036587521', '1174511106530525185', '岗位', '2', '岗位', 1, 1, 'admin', '2019-09-19 10:31:16', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1178295553450061826', '1178295274528845826', '可编辑(未授权禁用)', '2', NULL, 2, 1, 'admin', '2019-09-29 21:08:46', 'admin', '2019-09-29 21:09:18');
INSERT INTO `sys_dict_item` VALUES ('1178295639554928641', '1178295274528845826', '可见(未授权不可见)', '1', NULL, 1, 1, 'admin', '2019-09-29 21:09:06', 'admin', '2019-09-29 21:09:24');
INSERT INTO `sys_dict_item` VALUES ('1199517884758368257', '1199517671259906049', '一般', '1', NULL, 1, 1, 'admin', '2019-11-27 10:38:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517914017832962', '1199517671259906049', '重要', '2', NULL, 1, 1, 'admin', '2019-11-27 10:38:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199517941339529217', '1199517671259906049', '紧急', '3', NULL, 1, 1, 'admin', '2019-11-27 10:38:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518186144276482', '1199518099888414722', '日常记录', '1', NULL, 1, 1, 'admin', '2019-11-27 10:39:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518214858481666', '1199518099888414722', '本周工作', '2', NULL, 1, 1, 'admin', '2019-11-27 10:40:03', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199518235943247874', '1199518099888414722', '下周计划', '3', NULL, 1, 1, 'admin', '2019-11-27 10:40:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520817285701634', '1199520177767587841', '列表', '1', NULL, 1, 1, 'admin', '2019-11-27 10:50:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199520835035996161', '1199520177767587841', '链接', '2', NULL, 1, 1, 'admin', '2019-11-27 10:50:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525468672405505', '1199525215290306561', '未开始', '0', NULL, 1, 1, 'admin', '2019-11-27 11:08:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525490575060993', '1199525215290306561', '进行中', '1', NULL, 1, 1, 'admin', '2019-11-27 11:08:58', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1199525506429530114', '1199525215290306561', '已完成', '2', NULL, 1, 1, 'admin', '2019-11-27 11:09:02', 'admin', '2019-11-27 11:10:02');
INSERT INTO `sys_dict_item` VALUES ('1199607547704647681', '4f69be5f507accea8d5df5f11346181a', '系统', '4', NULL, 1, 1, 'admin', '2019-11-27 16:35:02', 'admin', '2019-11-27 19:37:46');
INSERT INTO `sys_dict_item` VALUES ('1224573299207217154', '1224573164209348610', '基础版', '0', '基础版', 1, 1, 'admin', '2020-02-04 14:00:00', 'admin', '2020-02-04 17:49:09');
INSERT INTO `sys_dict_item` VALUES ('1224573401309159425', '1224573164209348610', '增强版', '1', '增强版', 2, 1, 'admin', '2020-02-04 14:00:25', 'admin', '2020-02-04 17:49:05');
INSERT INTO `sys_dict_item` VALUES ('1224573478966697985', '1224573164209348610', '完整版', '2', '完整版', 3, 1, 'admin', '2020-02-04 14:00:43', 'admin', '2020-02-04 17:48:56');
INSERT INTO `sys_dict_item` VALUES ('1224573799851925505', '1224573712316801026', '市局', 'sj', '市局', 1, 1, 'admin', '2020-02-04 14:02:00', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1224573849168551938', '1224573712316801026', '分局', 'fj', '分局', 2, 1, 'admin', '2020-02-04 14:02:11', 'admin', '2020-02-04 15:09:51');
INSERT INTO `sys_dict_item` VALUES ('1224573911055507458', '1224573712316801026', '派出所', 'pcs', '派出所', 3, 1, 'admin', '2020-02-04 14:02:26', 'admin', '2020-02-04 15:09:56');
INSERT INTO `sys_dict_item` VALUES ('1224988179982839810', '1224573712316801026', '省厅', 'st', '省厅', 4, 1, 'admin', '2020-02-05 17:28:35', 'admin', '2020-02-05 17:29:47');
INSERT INTO `sys_dict_item` VALUES ('1224988384715206658', '1224573712316801026', '部级', 'bj', '部级', 5, 1, 'admin', '2020-02-05 17:29:24', 'admin', '2020-02-05 17:29:55');
INSERT INTO `sys_dict_item` VALUES ('1225278477980004354', '1225278386548371457', '已审核', '1', '已审核数据', 2, 1, 'admin', '2020-02-06 12:42:08', 'admin', '2020-02-06 17:19:34');
INSERT INTO `sys_dict_item` VALUES ('1225278565234110466', '1225278386548371457', '分析中', '2', '数据分析中', 3, 1, 'admin', '2020-02-06 12:42:29', 'admin', '2020-02-06 17:19:43');
INSERT INTO `sys_dict_item` VALUES ('1225278644682616834', '1225278386548371457', '已提取', '4', '已提取数据', 5, 1, 'admin', '2020-02-06 12:42:48', 'admin', '2020-02-06 22:29:13');
INSERT INTO `sys_dict_item` VALUES ('1225278759979839489', '1225278386548371457', '已传送', '5', '已传送数据', 6, 1, 'admin', '2020-02-06 12:43:15', 'admin', '2020-02-06 22:29:18');
INSERT INTO `sys_dict_item` VALUES ('1225341132577026050', '1225340866343579650', '自主上传', '0', NULL, 1, 1, 'admin', '2020-02-06 16:51:06', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1225341189887995906', '1225340866343579650', '警综平台', '1', NULL, 2, 1, 'admin', '2020-02-06 16:51:20', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1225348129045180418', '1225278386548371457', '已上传', '0', '已上传数据', 1, 1, 'admin', '2020-02-06 17:18:54', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1225426183364931586', '1225278386548371457', '提取中', '3', '提取数据中', 4, 1, 'admin', '2020-02-06 22:29:04', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1228233751854424065', '1225278386548371457', '上传中', '6', NULL, 7, 1, 'admin', '2020-02-14 16:25:20', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229059474043256834', '1225278386548371457', '入库中', '7', NULL, 8, 1, 'admin', '2020-02-16 23:06:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229365455121887234', '1229365283004428290', '未解析', '0', '经纬度未解析', 1, 1, 'admin', '2020-02-17 19:22:19', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229365546985533441', '1229365283004428290', '已解析', '1', '经纬度已解析', 2, 1, 'admin', '2020-02-17 19:22:41', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229366168111624194', '1229365834551209986', '未下载地址', '0', '未下载地址', 1, 1, 'admin', '2020-02-17 19:25:09', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229366264060522497', '1229365834551209986', '已下载地址（未下载解析）', '1', '已下载地址（未下载解析）', 2, 1, 'admin', '2020-02-17 19:25:32', 'admin', '2020-02-17 19:34:12');
INSERT INTO `sys_dict_item` VALUES ('1229366736595005442', '1229365834551209986', '已下载解析', '2', '已下载解析', 3, 1, 'admin', '2020-02-17 19:27:25', 'admin', '2020-02-17 19:34:40');
INSERT INTO `sys_dict_item` VALUES ('1229367193535066113', '1229366964836446209', '已上传地址', '0', '已上传地址', 1, 1, 'admin', '2020-02-17 19:29:14', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229367423819132929', '1229366964836446209', '已上传待解析', '1', '已上传待解析', 2, 1, 'admin', '2020-02-17 19:30:09', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1229367646897385474', '1229366964836446209', '已上传解析', '2', '已上传解析', 3, 1, 'admin', '2020-02-17 19:31:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234567891', '123456789', '正常', '0', NULL, 1, 1, 'admin', '2020-01-15 00:00:00', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1234567892', '123456789', '无效', '1', NULL, 2, 1, 'admin', '2020-01-15 00:00:00', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267473208230887425', '1267472934607077377', '地市', '1', NULL, 1, 1, 'admin', '2020-06-01 23:08:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267473282361016322', '1267472934607077377', '区县', '2', NULL, 1, 1, 'admin', '2020-06-01 23:09:13', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267473340930277378', '1267472934607077377', '派出所', '3', NULL, 1, 1, 'admin', '2020-06-01 23:09:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267473406353031170', '1267472934607077377', '责任区', '4', NULL, 1, 1, 'admin', '2020-06-01 23:09:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267473446903562242', '1267472934607077377', '网格', '5', NULL, 1, 1, 'admin', '2020-06-01 23:09:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475608765288449', '1267475422336864257', '未上传', '0', NULL, 1, 1, 'admin', '2020-06-01 23:18:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475674485837825', '1267475422336864257', '已上传移动', 'M', NULL, 1, 1, 'admin', '2020-06-01 23:18:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475741976383489', '1267475422336864257', '已上传联通', 'U', NULL, 1, 1, 'admin', '2020-06-01 23:19:00', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475800482729985', '1267475422336864257', '已上传电信', 'T', NULL, 1, 1, 'admin', '2020-06-01 23:19:14', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475874134708226', '1267475422336864257', '已上传移动联通', 'MU', NULL, 1, 1, 'admin', '2020-06-01 23:19:31', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475938819264513', '1267475422336864257', '已上传移动电信', 'MT', NULL, 1, 1, 'admin', '2020-06-01 23:19:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267475995060686850', '1267475422336864257', '已上传联通电信', 'UT', NULL, 1, 1, 'admin', '2020-06-01 23:20:00', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1267476087620587522', '1267475422336864257', '已上传移动联通电信', 'MUT', NULL, 1, 1, 'admin', '2020-06-01 23:20:22', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1291573326176108546', '1291573236824850433', '开放', '0', '开放', 1, 1, 'admin', '2020-08-07 11:14:11', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1291573366105882625', '1291573236824850433', '禁用', '1', '禁用', 2, 1, 'admin', '2020-08-07 11:14:21', 'admin', '2020-08-07 11:30:03');
INSERT INTO `sys_dict_item` VALUES ('1291573683451117569', '1291573548746850305', '一级分类', 'L1', '一级分类', 1, 1, 'admin', '2020-08-07 11:15:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1291573724110700545', '1291573548746850305', '二级分类', 'L2', '二级分类', 2, 1, 'admin', '2020-08-07 11:15:46', 'admin', '2020-08-07 11:29:54');
INSERT INTO `sys_dict_item` VALUES ('1291576173856923650', '1291576118848626689', '显示', '1', '显示', 1, 1, 'admin', '2020-08-07 11:25:30', 'admin', '2020-08-07 11:29:40');
INSERT INTO `sys_dict_item` VALUES ('1291576227774701570', '1291576118848626689', '隐藏', '0', '隐藏', 2, 1, 'admin', '2020-08-07 11:25:43', 'admin', '2020-08-07 11:29:44');
INSERT INTO `sys_dict_item` VALUES ('1291661044113506305', '1291660923565015042', '新手指南', '1', '新手指南', 1, 1, 'admin', '2020-08-07 17:02:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1291661102808596482', '1291660923565015042', '售后指南', '0', '售后指南', 2, 1, 'admin', '2020-08-07 17:02:59', 'admin', '2020-08-07 17:03:03');
INSERT INTO `sys_dict_item` VALUES ('1292655552783499265', '1292655036867330050', '是', '1', '是', 1, 1, 'admin', '2020-08-10 10:54:34', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292655608664211458', '1292655036867330050', '否', '0', '否', 2, 1, 'admin', '2020-08-10 10:54:48', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292656532560343041', '1292656429984444417', '发布', '0', '发布', 1, 1, 'admin', '2020-08-10 10:58:28', 'admin', '2020-08-10 15:23:31');
INSERT INTO `sys_dict_item` VALUES ('1292656591725195265', '1292656429984444417', '未发布', '1', '未发布', 2, 1, 'admin', '2020-08-10 10:58:42', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292713093597048833', '1292712998042415105', '启用', '1', '启用', 1, 1, 'admin', '2020-08-10 14:43:13', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292713159300820993', '1292712998042415105', '未启用', '0', '未启用', 2, 1, 'admin', '2020-08-10 14:43:29', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292715768963174402', '1292715694522667009', '待处理', '0', '待处理', 1, 1, 'admin', '2020-08-10 14:53:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292715828186746881', '1292715694522667009', '正在处理', '1', '正在处理', 2, 1, 'admin', '2020-08-10 14:54:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292715878673584129', '1292715694522667009', '已完成', '3', '已完成', 3, 1, 'admin', '2020-08-10 14:54:17', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720295682527234', '1292720168964214785', '功能异常', '0', '功能异常', 1, 1, 'admin', '2020-08-10 15:11:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720356298608641', '1292720168964214785', '图片加载异常', '8', '图片加载异常', 9, 1, 'admin', '2020-08-10 15:12:05', 'admin', '2020-08-10 15:14:50');
INSERT INTO `sys_dict_item` VALUES ('1292720455120605186', '1292720168964214785', '功能缺失', '1', '功能缺失', 2, 1, 'admin', '2020-08-10 15:12:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720569637687298', '1292720168964214785', '首页轮播异常', '2', '首页轮播异常', 3, 1, 'admin', '2020-08-10 15:12:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720639682564098', '1292720168964214785', '举报中心异常', '3', '举报中心异常', 4, 1, 'admin', '2020-08-10 15:13:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720773405364225', '1292720168964214785', '安全防范分类异常', '4', '安全防范分类异常', 5, 1, 'admin', '2020-08-10 15:13:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720851687854082', '1292720168964214785', '安全防范列表异常', '5', '安全防范列表异常', 6, 1, 'admin', '2020-08-10 15:14:03', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292720965127000065', '1292720168964214785', '账号异常', '6', '账号异常', 7, 1, 'admin', '2020-08-10 15:14:30', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1292721022689628162', '1292720168964214785', '文章异常', '7', '文章异常', 8, 1, 'admin', '2020-08-10 15:14:44', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1310601264495386625', '1310601164876472322', '否', '0', NULL, 1, 1, 'admin', '2020-09-28 23:24:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1310601293629022210', '1310601164876472322', '是', '1', NULL, 1, 1, 'admin', '2020-09-28 23:24:32', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1313856167331553282', '0b5d19e1fce4b2e6647e6b4a17760c14', '布控预警', '3', NULL, 1, 1, 'admin', '2020-10-07 22:58:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1322928430235041793', '1322928223099338753', '出租房屋', 'OUTHOUSE', NULL, 1, 1, 'admin', '2020-11-01 23:48:11', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1322928550615760898', '1322928223099338753', '自主房屋', 'INHOUSE', NULL, 1, 1, 'admin', '2020-11-01 23:48:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1323214962296676353', '1323214795128496130', '成员', 'MEMBER', NULL, 1, 1, 'admin', '2020-11-02 18:46:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1323215069670858754', '1323214795128496130', '户主', 'MASTER', NULL, 1, 1, 'admin', '2020-11-02 18:47:11', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1323215258120937474', '1323214795128496130', '租客', 'TENANT', NULL, 1, 1, 'admin', '2020-11-02 18:47:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1323437369528958978', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 1, 1, 'admin', '2020-11-03 09:30:31', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1329436542039408642', '1329436370890833921', '汉族', '1', '', 1, 1, 'admin', '2020-11-19 22:49:06', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1329436598423437314', '1329436370890833921', '彝族', '2', '', 1, 1, 'admin', '2020-11-19 22:49:19', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('147c48ff4b51545032a9119d13f3222a', 'd6e1152968b02d69ff358c75b48a6ee1', '测试流程', 'test', NULL, 1, 1, 'admin', '2019-03-22 19:27:05', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1543fe7e5e26fb97cdafe4981bedc0c8', '4c03fca6bf1f0299c381213961566349', '单排布局', 'single', NULL, 2, 1, 'admin', '2022-07-12 17:43:39', 'admin', '2019-04-12 17:43:57');
INSERT INTO `sys_dict_item` VALUES ('1b8a6341163062dad8cb2fddd34e0c3b', '404a04a15f371566c658ee9ef9fc392a', '22', '222', NULL, 1, 1, 'admin', '2019-03-30 11:17:48', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1ce390c52453891f93514c1bd2795d44', 'ad7c65ba97c20a6805d5dcdf13cdaf36', '000', '00', NULL, 1, 1, 'admin', '2019-03-22 16:34:34', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('1db531bcff19649fa82a644c8a939dc4', '4c03fca6bf1f0299c381213961566349', '组合布局', 'combination', NULL, 4, 1, 'admin', '2019-05-11 16:07:08', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('222705e11ef0264d4214affff1fb4ff9', '4f69be5f507accea8d5df5f11346181a', '短信', '1', NULL, 1, 1, 'admin', '2023-02-28 10:50:36', 'admin', '2019-04-28 10:58:11');
INSERT INTO `sys_dict_item` VALUES ('23a5bb76004ed0e39414e928c4cde155', '4e4602b3e3686f0911384e188dc7efb4', '不等于', '!=', '不等于', 3, 1, 'admin', '2019-04-01 16:46:15', 'admin', '2019-04-01 17:48:40');
INSERT INTO `sys_dict_item` VALUES ('25847e9cb661a7c711f9998452dc09e6', '4e4602b3e3686f0911384e188dc7efb4', '小于等于', '<=', '小于等于', 6, 1, 'admin', '2019-04-01 16:44:34', 'admin', '2019-04-01 17:49:10');
INSERT INTO `sys_dict_item` VALUES ('2d51376643f220afdeb6d216a8ac2c01', '68168534ff5065a152bfab275c2136f8', '有效', '1', '有效', 2, 1, 'admin', '2019-04-26 19:22:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('308c8aadf0c37ecdde188b97ca9833f5', '8dfe32e2d29ea9430a988b3b558bf233', '已发布', '1', '已发布', 2, 1, 'admin', '2019-04-16 17:41:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('333e6b2196e01ef9a5f76d74e86a6e33', '8dfe32e2d29ea9430a988b3b558bf233', '未发布', '0', '未发布', 1, 1, 'admin', '2019-04-16 17:41:12', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('337ea1e401bda7233f6258c284ce4f50', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'JSON', 'json', NULL, 1, 1, 'admin', '2019-04-12 17:26:33', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('33bc9d9f753cf7dc40e70461e50fdc54', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送失败', '2', NULL, 3, 1, 'admin', '2019-04-12 18:20:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('3fbc03d6c994ae06d083751248037c0e', '78bda155fe380b1b3f175f1e88c284c6', '已完成', '3', '已完成', 3, 1, 'admin', '2019-05-09 16:33:25', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41d7aaa40c9b61756ffb1f28da5ead8e', '0b5d19e1fce4b2e6647e6b4a17760c14', '通知公告', '1', NULL, 1, 1, 'admin', '2019-04-22 18:01:57', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('41fa1e9571505d643aea87aeb83d4d76', '4e4602b3e3686f0911384e188dc7efb4', '等于', '=', '等于', 4, 1, 'admin', '2019-04-01 16:45:24', 'admin', '2019-04-01 17:49:00');
INSERT INTO `sys_dict_item` VALUES ('43d2295b8610adce9510ff196a49c6e9', '845da5006c97754728bf48b6a10f79cc', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 21:45:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('4f05fb5376f4c61502c5105f52e4dd2b', '83bfb33147013cc81640d5fd9eda030c', '操作日志', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:22:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('50223341bfb5ba30bf6319789d8d17fe', 'd6e1152968b02d69ff358c75b48a6ee1', '业务办理', 'business', NULL, 3, 1, 'admin', '2023-04-22 19:28:05', 'admin', '2019-03-22 23:24:39');
INSERT INTO `sys_dict_item` VALUES ('51222413e5906cdaf160bb5c86fb827c', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '是', '1', NULL, 1, 1, 'admin', '2019-05-22 19:29:45', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('538fca35afe004972c5f3947c039e766', '2e02df51611a4b9632828ab7e5338f00', '显示', '1', '显示', 1, 1, 'admin', '2025-03-26 18:27:13', 'admin', '2019-04-26 18:39:07');
INSERT INTO `sys_dict_item` VALUES ('5584c21993bde231bbde2b966f2633ac', '4e4602b3e3686f0911384e188dc7efb4', '自定义SQL表达式', 'USE_SQL_RULES', '自定义SQL表达式', 9, 1, 'admin', '2019-04-01 10:45:24', 'admin', '2019-04-01 17:49:27');
INSERT INTO `sys_dict_item` VALUES ('58b73b344305c99b9d8db0fc056bbc0a', '72cce0989df68887546746d8f09811aa', '主表', '2', NULL, 2, 1, 'admin', '2019-03-27 10:13:36', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('5b65a88f076b32e8e69d19bbaadb52d5', '2f0320997ade5dd147c90130f7218c3e', '全体用户', 'ALL', NULL, NULL, 1, 'admin', '2020-10-17 21:22:43', 'admin', '2019-03-28 22:17:09');
INSERT INTO `sys_dict_item` VALUES ('5d833f69296f691843ccdd0c91212b6b', '880a895c98afeca9d9ac39f29e67c13e', '修改', '3', NULL, 3, 1, 'admin', '2019-07-22 10:55:07', 'admin', '2019-07-22 10:55:41');
INSERT INTO `sys_dict_item` VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '0', NULL, 2, 1, NULL, '2019-01-04 14:56:56', 'admin', '2020-08-10 10:14:17');
INSERT INTO `sys_dict_item` VALUES ('66c952ae2c3701a993e7db58f3baf55e', '4e4602b3e3686f0911384e188dc7efb4', '大于', '>', '大于', 1, 1, 'admin', '2019-04-01 10:45:46', 'admin', '2019-04-01 17:48:29');
INSERT INTO `sys_dict_item` VALUES ('6937c5dde8f92e9a00d4e2ded9198694', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'easyui', '3', NULL, 1, 1, 'admin', '2019-03-22 16:32:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('69cacf64e244100289ddd4aa9fa3b915', 'a9d9942bd0eccb6e89de92d130ec4c4a', '未发送', '0', NULL, 1, 1, 'admin', '2019-04-12 18:19:23', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6a7a9e1403a7943aba69e54ebeff9762', '4f69be5f507accea8d5df5f11346181a', '邮件', '2', NULL, 2, 1, 'admin', '2031-02-28 10:50:44', 'admin', '2019-04-28 10:59:03');
INSERT INTO `sys_dict_item` VALUES ('6c682d78ddf1715baf79a1d52d2aa8c2', '72cce0989df68887546746d8f09811aa', '单表', '1', NULL, 1, 1, 'admin', '2019-03-27 10:13:29', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('6d404fd2d82311fbc87722cd302a28bc', '4e4602b3e3686f0911384e188dc7efb4', '模糊', 'LIKE', '模糊', 7, 1, 'admin', '2019-04-01 16:46:02', 'admin', '2019-04-01 17:49:20');
INSERT INTO `sys_dict_item` VALUES ('6d4e26e78e1a09699182e08516c49fc4', '4d7fec1a7799a436d26d02325eff295e', '高', 'H', '高', 1, 1, 'admin', '2019-04-16 17:04:24', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7050c1522702bac3be40e3b7d2e1dfd8', 'c5a14c75172783d72cbee6ee7f5df5d1', '柱状图', 'bar', NULL, 1, 1, 'admin', '2019-04-12 17:05:17', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('71b924faa93805c5c1579f12e001c809', 'd6e1152968b02d69ff358c75b48a6ee1', 'OA办公', 'oa', NULL, 2, 1, 'admin', '2021-03-22 19:27:17', 'admin', '2019-03-22 23:24:36');
INSERT INTO `sys_dict_item` VALUES ('75b260d7db45a39fc7f21badeabdb0ed', 'c36169beb12de8a71c8683ee7c28a503', '不启用', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:29:41', 'admin', '2019-03-18 23:29:54');
INSERT INTO `sys_dict_item` VALUES ('7688469db4a3eba61e6e35578dc7c2e5', 'c36169beb12de8a71c8683ee7c28a503', '启用', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:29:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('78ea6cadac457967a4b1c4eb7aaa418c', 'fc6cd58fde2e8481db10d3a1e68ce70c', '正常', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:30:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('7ccf7b80c70ee002eceb3116854b75cb', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '按钮权限', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:25:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('81fb2bb0e838dc68b43f96cc309f8257', 'fc6cd58fde2e8481db10d3a1e68ce70c', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 23:30:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('83250269359855501ec4e9c0b7e21596', '4274efc2292239b6f000b153f50823ff', '可见/可访问(授权后可见/可访问)', '1', NULL, 1, 1, 'admin', '2019-05-10 17:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84778d7e928bc843ad4756db1322301f', '4e4602b3e3686f0911384e188dc7efb4', '大于等于', '>=', '大于等于', 5, 1, 'admin', '2019-04-01 10:46:02', 'admin', '2019-04-01 17:49:05');
INSERT INTO `sys_dict_item` VALUES ('848d4da35ebd93782029c57b103e5b36', 'c5a14c75172783d72cbee6ee7f5df5d1', '饼图', 'pie', NULL, 3, 1, 'admin', '2019-04-12 17:05:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('84dfc178dd61b95a72900fcdd624c471', '78bda155fe380b1b3f175f1e88c284c6', '处理中', '2', '处理中', 2, 1, 'admin', '2019-05-09 16:33:01', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('86f19c7e0a73a0bae451021ac05b99dd', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '子菜单', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:25:27', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8bccb963e1cd9e8d42482c54cc609ca2', '4f69be5f507accea8d5df5f11346181a', '微信', '3', NULL, 3, 1, 'admin', '2021-05-11 14:29:12', 'admin', '2019-04-11 14:29:31');
INSERT INTO `sys_dict_item` VALUES ('8c618902365ca681ebbbe1e28f11a548', '4c753b5293304e7a445fd2741b46529d', '启用', '1', NULL, 0, 1, 'admin', '2020-07-18 23:19:27', 'admin', '2019-05-17 14:51:18');
INSERT INTO `sys_dict_item` VALUES ('8cdf08045056671efd10677b8456c999', '4274efc2292239b6f000b153f50823ff', '可编辑(未授权时禁用)', '2', NULL, 2, 1, 'admin', '2019-05-10 17:55:38', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('8ff48e657a7c5090d4f2a59b37d1b878', '4d7fec1a7799a436d26d02325eff295e', '中', 'M', '中', 2, 1, 'admin', '2019-04-16 17:04:40', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('948923658baa330319e59b2213cda97c', '880a895c98afeca9d9ac39f29e67c13e', '添加', '2', NULL, 2, 1, 'admin', '2019-07-22 10:54:59', 'admin', '2019-07-22 10:55:36');
INSERT INTO `sys_dict_item` VALUES ('9a96c4a4e4c5c9b4e4d0cbf6eb3243cc', '4c753b5293304e7a445fd2741b46529d', '不启用', '0', NULL, 1, 1, 'admin', '2019-03-18 23:19:53', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a1e7d1ca507cff4a480c8caba7c1339e', '880a895c98afeca9d9ac39f29e67c13e', '导出', '6', NULL, 6, 1, 'admin', '2019-07-22 12:06:50', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2321496db6febc956a6c70fab94cb0c', '404a04a15f371566c658ee9ef9fc392a', '3', '3', NULL, 1, 1, 'admin', '2019-03-30 11:18:18', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('a2be752dd4ec980afaec1efd1fb589af', '8dfe32e2d29ea9430a988b3b558bf233', '已撤销', '2', '已撤销', 3, 1, 'admin', '2019-04-16 17:41:39', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('aa0d8a8042a18715a17f0a888d360aa4', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '一级菜单', '0', NULL, NULL, 1, 'admin', '2019-03-18 23:24:52', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('adcf2a1fe93bb99a84833043f475fe0b', '4e4602b3e3686f0911384e188dc7efb4', '包含', 'IN', '包含', 8, 1, 'admin', '2019-04-01 16:45:47', 'admin', '2019-04-01 17:49:24');
INSERT INTO `sys_dict_item` VALUES ('b029a41a851465332ee4ee69dcf0a4c2', '0b5d19e1fce4b2e6647e6b4a17760c14', '系统消息', '2', NULL, 1, 1, 'admin', '2019-02-22 18:02:08', 'admin', '2019-04-22 18:02:13');
INSERT INTO `sys_dict_item` VALUES ('b2a8b4bb2c8e66c2c4b1bb086337f393', '3486f32803bb953e7155dab3513dc68b', '正常', '0', NULL, NULL, 1, 'admin', '2022-10-18 21:46:48', 'admin', '2019-03-28 22:22:20');
INSERT INTO `sys_dict_item` VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, 0, 'admin', '2019-02-21 19:59:43', 'admin', '2019-03-11 21:23:27');
INSERT INTO `sys_dict_item` VALUES ('b5f3bd5f66bb9a83fecd89228c0d93d1', '68168534ff5065a152bfab275c2136f8', '无效', '0', '无效', 1, 1, 'admin', '2019-04-26 19:21:49', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('b9fbe2a3602d4a27b45c100ac5328484', '78bda155fe380b1b3f175f1e88c284c6', '待提交', '1', '待提交', 1, 1, 'admin', '2019-05-09 16:32:35', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('ba27737829c6e0e582e334832703d75e', '236e8a4baff0db8c62c00dd95632834f', '同步', '1', '同步', 1, 1, 'admin', '2019-05-15 15:28:15', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('bcec04526b04307e24a005d6dcd27fd6', '880a895c98afeca9d9ac39f29e67c13e', '导入', '5', NULL, 5, 1, 'admin', '2019-07-22 12:06:41', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c53da022b9912e0aed691bbec3c78473', '880a895c98afeca9d9ac39f29e67c13e', '查询', '1', NULL, 1, 1, 'admin', '2019-07-22 10:54:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('c5700a71ad08994d18ad1dacc37a71a9', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '否', '0', NULL, 1, 1, 'admin', '2019-05-22 19:29:55', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('cbfcc5b88fc3a90975df23ffc8cbe29c', 'c5a14c75172783d72cbee6ee7f5df5d1', '曲线图', 'line', NULL, 2, 1, 'admin', '2019-05-12 17:05:30', 'admin', '2019-04-12 17:06:06');
INSERT INTO `sys_dict_item` VALUES ('d217592908ea3e00ff986ce97f24fb98', 'c5a14c75172783d72cbee6ee7f5df5d1', '数据列表', 'table', NULL, 4, 1, 'admin', '2019-04-12 17:05:56', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1, 1, NULL, '2027-08-04 14:56:49', 'admin', '2019-03-23 22:44:44');
INSERT INTO `sys_dict_item` VALUES ('e6329e3a66a003819e2eb830b0ca2ea0', '4e4602b3e3686f0911384e188dc7efb4', '小于', '<', '小于', 2, 1, 'admin', '2019-04-01 16:44:15', 'admin', '2019-04-01 17:48:34');
INSERT INTO `sys_dict_item` VALUES ('e94eb7af89f1dbfa0d823580a7a6e66a', '236e8a4baff0db8c62c00dd95632834f', '不同步', '0', '不同步', 2, 1, 'admin', '2019-05-15 15:28:28', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f0162f4cc572c9273f3e26b2b4d8c082', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'booostrap', '1', NULL, 1, 1, 'admin', '2021-08-22 16:32:04', 'admin', '2019-03-22 16:33:57');
INSERT INTO `sys_dict_item` VALUES ('f16c5706f3ae05c57a53850c64ce7c45', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送成功', '1', NULL, 2, 1, 'admin', '2019-04-12 18:19:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f2a7920421f3335afdf6ad2b342f6b5d', '845da5006c97754728bf48b6a10f79cc', '冻结', '2', NULL, NULL, 1, 'admin', '2019-03-18 21:46:02', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f37f90c496ec9841c4c326b065e00bb2', '83bfb33147013cc81640d5fd9eda030c', '登录日志', '1', NULL, NULL, 1, 'admin', '2019-03-18 23:22:37', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f753aff60ff3931c0ecb4812d8b5e643', '4c03fca6bf1f0299c381213961566349', '双排布局', 'double', NULL, 3, 1, 'admin', '2019-04-12 17:43:51', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('f80a8f6838215753b05e1a5ba3346d22', '880a895c98afeca9d9ac39f29e67c13e', '删除', '4', NULL, 4, 1, 'admin', '2019-07-22 10:55:14', 'admin', '2019-07-22 10:55:30');
INSERT INTO `sys_dict_item` VALUES ('fcec03570f68a175e1964808dc3f1c91', '4c03fca6bf1f0299c381213961566349', 'Tab风格', 'tab', NULL, 1, 1, 'admin', '2019-04-12 17:43:31', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('fe50b23ae5e68434def76f67cef35d2d', '78bda155fe380b1b3f175f1e88c284c6', '已作废', '4', '已作废', 4, 1, 'admin', '2021-09-09 16:33:43', 'admin', '2019-05-09 16:34:40');

-- ----------------------------
-- Table structure for sys_fill_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_fill_rule`;
CREATE TABLE `sys_fill_rule`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `RULE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则名称',
  `RULE_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则Code',
  `RULE_CLASS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则实现类',
  `RULE_PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则参数',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fill_rule
-- ----------------------------
INSERT INTO `sys_fill_rule` VALUES ('1202551334738382850', '机构编码生成', 'org_num_role', 'org.ezcdata.modules.system.rule.OrgCodeRule', '{parentId:c6d7cb4deeac411cb3384b1b31278596}', 'admin', '2019-12-09 10:37:06', 'admin', '2019-12-05 19:32:35');
INSERT INTO `sys_fill_rule` VALUES ('1202787623203065858', '分类字典编码生成', 'category_code_rule', 'org.ezcdata.modules.system.rule.CategoryCodeRule', '{pid:}', 'admin', '2019-12-09 10:36:54', 'admin', '2019-12-06 11:11:31');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOG_TYPE` decimal(11, 0) DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `LOG_CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '日志内容',
  `OPERATE_TYPE` decimal(11, 0) DEFAULT NULL COMMENT '操作类型',
  `USERID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作用户账号',
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作用户名称',
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求java方法',
  `REQUEST_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求路径',
  `REQUEST_PARAM` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求参数',
  `REQUEST_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求类型',
  `COST_TIME` decimal(20, 0) DEFAULT NULL COMMENT '耗时',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1327201216786128898', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-13 18:46:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328616044367921153', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-17 16:28:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328646219688222721', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.2.172', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-17 18:28:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328667346405937153', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-17 19:52:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328667465385758722', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-17 19:53:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328681423601651713', 2, '填值规则-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 82, 'admin', '2020-11-17 20:48:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328681525686816769', 2, '填值规则-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysFillRuleController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-17 20:48:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328685622469001217', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-17 21:05:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328879506176315394', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-18 09:55:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328946327449493505', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-18 14:21:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1328946744338145282', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-18 14:22:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329242282367287298', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 09:57:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329242370523168769', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 09:57:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329242443202068481', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 68, 'admin', '2020-11-19 09:57:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329242703290859521', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 09:58:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329249209088356354', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 83, 'admin', '2020-11-19 10:24:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329249209088356355', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 83, 'admin', '2020-11-19 10:24:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329249719782617089', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-11-19 10:26:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329249733779009538', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-19 10:26:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329251335092973570', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-19 10:33:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329251461962280962', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 10:33:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329252207915053058', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 10:36:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329252258099900417', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 10:36:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329252381550850050', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 2, 'admin', '2020-11-19 10:37:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329252879821582338', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 10:39:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329257525361401857', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 10:57:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329259181100654594', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 11:04:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329268294509621250', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 11:40:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329269060779601922', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 14, 'admin', '2020-11-19 11:43:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329269472039497729', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 11:45:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329273080210460673', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 11:59:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329273307671760897', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 31, 'admin', '2020-11-19 12:00:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329273460461867009', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 12:01:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329273465180459010', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 12:01:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329274656970969090', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 12:05:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329275715483316225', 2, '企业雇员-添加', 2, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1605759001798,\"departName\":\"呼呼呼\",\"id\":\"1329275715072274434\"}]', NULL, 138, 'admin', '2020-11-19 12:10:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329275717773406210', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 70, 'admin', '2020-11-19 12:10:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329299662610345985', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 13:45:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329299701646733313', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 13:45:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329299721699700738', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 18, 'admin', '2020-11-19 13:45:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329300541690327042', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-19 13:48:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329303967300038658', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-19 14:02:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329303968386363393', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-19 14:02:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329304063349600258', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 14:02:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329304641765093378', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-11-19 14:04:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329306431478804482', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-19 14:12:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329317163444449281', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 14:54:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329317205899194370', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 14:54:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329317327974412290', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 14:55:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329318499569348609', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 15:00:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329318871058853889', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 15:01:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329318947890114562', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 15:01:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329319330888790017', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 15:03:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329319352711753730', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 15:03:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329319361884696577', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 15:03:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329319729079234561', 2, '企业雇员-编辑', 3, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.edit()', NULL, '[{\"cityName\":\"成都\",\"companyName\":\"蚂蚁金服\",\"countyName\":\"武侯\",\"createBy\":\"admin\",\"createTime\":1605759002000,\"departName\":\"测试\",\"educationCode\":\"不详\",\"id\":\"1329275715072274434\",\"majorCode\":\"不详\",\"mzCode\":\"汉\",\"name\":\"张三\",\"phoneNo\":\"15778925875\",\"postName\":\"测试\",\"remark\":\"暂无\",\"trainExp\":\"暂无\",\"updateTime\":1605769495601,\"workYears\":\"12\"}]', NULL, 36, 'admin', '2020-11-19 15:04:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329319730828259330', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 15:04:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329320254403227650', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 15:07:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329321099685507074', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 15:10:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329321263720542210', 2, '企业雇员-添加', 2, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.add()', NULL, '[{\"cityName\":\"成都\",\"companyName\":\"蚂蚁金服\",\"countyName\":\"武侯\",\"createBy\":\"admin\",\"createTime\":1605769861488,\"departName\":\"四川省应急厅\",\"educationCode\":\"不详\",\"id\":\"1329321263586324481\",\"idcard\":\"\",\"majorCode\":\"不详\",\"mzCode\":\"汉\",\"name\":\"test\",\"phoneNo\":\"2222222\",\"postName\":\"测试\",\"remark\":\"暂无\",\"trainExp\":\"暂无\",\"workYears\":\"12\"}]', NULL, 39, 'admin', '2020-11-19 15:11:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329321264190304258', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 15:11:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329321971031191554', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 15:13:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329322049942827009', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 15:14:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329346459554729985', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 16:51:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329346492312244225', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 16:51:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329346510737821697', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 53, 'admin', '2020-11-19 16:51:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329350598732992514', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 17:07:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329351722500280322', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 17:12:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329351726103187458', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 17:12:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329352452854435842', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 17:14:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329354419735547905', 2, '企业雇员-添加', 2, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.add()', NULL, '[{\"createBy\":\"admin\",\"createTime\":1605777766473,\"id\":\"1329354419496472578\",\"name\":\"www\"}]', NULL, 57, 'admin', '2020-11-19 17:22:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329354421572653058', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 17:22:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329356503558049794', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-19 17:31:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329357471985094657', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-19 17:34:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358397537992706', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 98, 'admin', '2020-11-19 17:38:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358522595360769', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 21, 'admin', '2020-11-19 17:39:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358556825075713', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-11-19 17:39:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358569202466817', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-19 17:39:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358613167161345', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-19 17:39:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358846135582721', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-19 17:40:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358867820134402', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-19 17:40:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329358888779071489', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-19 17:40:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329359955952615426', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-19 17:44:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368734043713537', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 86, 'admin', '2020-11-19 18:19:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368769204563969', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 21, 'admin', '2020-11-19 18:19:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368824644874241', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 18, 'admin', '2020-11-19 18:20:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368842269339649', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-19 18:20:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368850808942593', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-19 18:20:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368853975642114', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-19 18:20:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368859180773378', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-19 18:20:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329368887945310210', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-19 18:20:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329371191599673345', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-19 18:29:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329372453326008321', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 18:34:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329372929513730049', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 18:36:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329373388685160449', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-19 18:38:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329378804286599169', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-19 18:59:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379214439198722', 2, '企业雇员-批量删除', 4, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.deleteBatch()', NULL, '[\"1329373386613174273,1329373386617368577,1329373386617368578,1329373386617368579,1329373386621562881,1329373386621562882,1329373386621562883,1329373386621562884,1329373386621562885,1329373386621562886,\"]', NULL, 36, 'admin', '2020-11-19 19:01:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379264552742913', 2, '企业雇员-批量删除', 4, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.deleteBatch()', NULL, '[\"1329373386613174273,1329373386617368577,1329373386617368578,1329373386617368579,1329373386621562881,1329373386621562882,1329373386621562883,1329373386621562884,1329373386621562885,1329373386621562886,\"]', NULL, 1, 'admin', '2020-11-19 19:01:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379280809865217', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-19 19:01:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379280809865218', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-19 19:01:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379299365466114', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-11-19 19:01:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379732167307266', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 19:03:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329379763733639170', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-19 19:03:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329383099983650818', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 19:16:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329383309375889409', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 33, 'admin', '2020-11-19 19:17:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329383879797080065', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 41, 'admin', '2020-11-19 19:19:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329384305468604418', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 28, 'admin', '2020-11-19 19:21:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329385388559458306', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 61, 'admin', '2020-11-19 19:25:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329385462593118210', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 32, 'admin', '2020-11-19 19:26:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329386895690366978', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 47, 'admin', '2020-11-19 19:31:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329386916347314177', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 31, 'admin', '2020-11-19 19:31:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329392017250123777', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-19 19:52:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329420297374203906', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 21:44:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329420442555842561', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 21:45:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329420800787152898', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 25, 'admin', '2020-11-19 21:46:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329430106228084738', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 118, 'admin', '2020-11-19 22:23:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329430150914199554', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 37, 'admin', '2020-11-19 22:23:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329430162578558978', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 25, 'admin', '2020-11-19 22:23:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329430393193975810', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 20, 'admin', '2020-11-19 22:24:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329430799215185922', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 19, 'admin', '2020-11-19 22:26:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329431207744589825', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 23, 'admin', '2020-11-19 22:27:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329431975092469762', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 31, 'admin', '2020-11-19 22:30:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329439793505828866', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 23:02:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329439797909848066', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 48, 'admin', '2020-11-19 23:02:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329440130031616001', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 23:03:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329442580348207105', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-19 23:13:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329442755410067458', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 23:13:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329442856681537538', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 51, 'admin', '2020-11-19 23:14:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329442856681537539', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 51, 'admin', '2020-11-19 23:14:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329444073398796289', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-19 23:19:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329444424726335489', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 23:20:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329444430334119937', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 54, 'admin', '2020-11-19 23:20:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329444779891609601', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-19 23:21:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329445318461214722', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 23:23:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329445350748966914', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-19 23:24:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329445409989316610', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-19 23:24:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329448243250028546', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 36, 'admin', '2020-11-19 23:35:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329448823745933314', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 51, 'admin', '2020-11-19 23:37:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329450616823365634', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 76, 'admin', '2020-11-19 23:45:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329451764779294721', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 66, 'admin', '2020-11-19 23:49:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329451786925219841', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 54, 'admin', '2020-11-19 23:49:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329452155436777473', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 50, 'admin', '2020-11-19 23:51:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329452174835433473', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 29, 'admin', '2020-11-19 23:51:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329623064181161985', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-20 11:10:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329623112478572545', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-20 11:10:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329630381903654913', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 70, 'admin', '2020-11-20 11:39:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329687973380194306', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-20 15:28:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329687997514219522', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-20 15:28:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329688193702789121', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 64, 'admin', '2020-11-20 15:29:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329688387542548482', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-20 15:29:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329688410728660993', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 23, 'admin', '2020-11-20 15:29:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329688780993429506', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-20 15:31:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329694750201053185', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 16, 'admin', '2020-11-20 15:55:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329697996214861825', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 14, 'admin', '2020-11-20 16:08:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698114020278274', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-20 16:08:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698309604868097', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-20 16:09:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698352252551170', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-20 16:09:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698665776775170', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-20 16:10:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698671497805826', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-20 16:10:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698728141881346', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-20 16:10:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329698976037830658', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-20 16:11:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329708024086884354', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 33, 'admin', '2020-11-20 16:47:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329712541339709442', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 30, 'admin', '2020-11-20 17:05:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329712595228127233', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 20, 'admin', '2020-11-20 17:06:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329712623204134914', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-20 17:06:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1329716881802620929', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-20 17:23:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330695516898435073', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '192.168.2.172', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 10:11:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330701545149190145', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.2.172', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 10:35:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330720761810186242', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 11:52:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330744603576315906', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 13:26:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330762733304307714', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 52, 'admin', '2020-11-23 14:38:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330764345687040001', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-11-23 14:45:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330768240169607170', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 15:00:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330777508193132545', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-23 15:37:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330780064613031938', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 15:47:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330780169537740801', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-23 15:48:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330786116901429250', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 28, 'admin', '2020-11-23 16:11:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330786382107271170', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 16:12:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330786425916776450', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 16:13:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330787034090856449', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 31, 'admin', '2020-11-23 16:15:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330787614028873729', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 16:17:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330787619905093634', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 85, 'admin', '2020-11-23 16:17:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330790189394444289', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 26, 'admin', '2020-11-23 16:28:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330790833568235522', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 14, 'admin', '2020-11-23 16:30:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330790839863885825', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 16:30:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330790854724304897', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-23 16:30:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330790957648330754', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 16:31:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330791216336224257', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 16:32:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330796030369611778', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 16:51:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330796772295852033', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 2, 'admin', '2020-11-23 16:54:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330796809549660161', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 2, 'admin', '2020-11-23 16:54:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330797347272015874', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-23 16:56:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330797409368686594', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-23 16:56:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330797450833575937', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 16:56:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330797455321481217', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 16:56:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330797566080466946', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 16:57:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330797752978653186', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-11-23 16:58:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330798616493572098', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 17:01:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330798827550949377', 2, '职务表-添加', 2, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.add()', NULL, '[{\"code\":\"5103\",\"createBy\":\"admin\",\"createTime\":1606122140158,\"id\":\"1330798827416731650\",\"name\":\"管理员\",\"postRank\":\"3\",\"sysOrgCode\":\"510000000000\"}]', NULL, 32, 'admin', '2020-11-23 17:02:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330798829144784898', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 17:02:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330798868009205762', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 17:02:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330800173914144770', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-23 17:07:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330800409235570689', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-11-23 17:08:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330800809330229249', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 17:10:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330804739447603201', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 2, 'admin', '2020-11-23 17:25:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330806869810171905', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 49, 'admin', '2020-11-23 17:34:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330808758110998529', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 33, 'admin', '2020-11-23 17:41:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330808828772438017', 2, '企业基本信息-添加', 2, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.add()', NULL, '[{\"certificatePersonNum\":555,\"companyAddress\":\"ceshi\",\"companyName\":\"test\",\"createBy\":\"admin\",\"createTime\":1606124524642,\"employeeNum\":12,\"id\":\"1330808828671774722\",\"legalPerson\":\"test\",\"phone\":\"15727855555\",\"phoneNo\":\"1051581\",\"phonenumSafety\":\"5295\",\"safetyDirector\":\"test\"}]', NULL, 26, 'admin', '2020-11-23 17:42:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330808830487908354', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 19, 'admin', '2020-11-23 17:42:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330815522403471361', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 26, 'admin', '2020-11-23 18:08:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330815522407665666', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 28, 'admin', '2020-11-23 18:08:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330835011870367746', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:26:07', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330835059245031425', 1, '用户名: cx_compary,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:26:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330835628672131074', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:28:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330835798147178498', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:29:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330835966414266370', 1, '用户登录失败，用户不存在！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:29:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330836264159518721', 1, '用户名: cx_compary,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:31:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330836453955969026', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 19:31:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330838280441143298', 2, '删除用户，id： 1330800703172395009', 3, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 19:39:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330838355758260225', 2, '删除用户，id： 1330800703172395009', 3, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 19:39:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330839435669901314', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 22, 'admin', '2020-11-23 19:43:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330839978752577537', 2, '系统参数表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.sysparam.controller.SysParamConfigController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 19:45:51', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330844283735871490', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 11, 'admin', '2020-11-23 20:02:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330844354623803394', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 20:03:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330851468528267266', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:31:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330851817976705025', 1, '用户名: cx_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:32:54', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330853482968592386', 1, '用户名: cx_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:39:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330854100852486145', 1, '用户名: cx_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:41:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330854660427165697', 1, '用户名: cx_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:44:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855361664462850', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:46:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855517017288705', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:47:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855561766318082', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:47:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855652585582594', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 31, 'admin', '2020-11-23 20:48:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855652585582595', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 16, 'admin', '2020-11-23 20:48:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855992378732546', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 20:49:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330855992382926849', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-23 20:49:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856025320796161', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 20:49:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856384290304002', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:51:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856470118346753', 1, '用户名: cx_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:51:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856503521783809', 2, '企业雇员-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 23, 'cx_company', '2020-11-23 20:51:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856519061680129', 2, '企业基本信息-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 12, 'cx_company', '2020-11-23 20:51:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856542663028737', 2, '企业雇员-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 18, 'cx_company', '2020-11-23 20:51:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856557997404161', 2, '企业雇员-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 11, 'cx_company', '2020-11-23 20:51:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856562875379713', 2, '企业基本信息-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'cx_company', '2020-11-23 20:51:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330856986089041922', 1, '用户名: cx_company,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:53:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330857061011894274', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 20:53:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330861678290481154', 1, '用户名: cx_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:12:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330861705700257794', 2, '企业基本信息-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 10, 'cx_company', '2020-11-23 21:12:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330861711131881473', 2, '企业雇员-分页列表查询', 1, 'cx_company', '醋纤化工', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'cx_company', '2020-11-23 21:12:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330862969347584001', 1, '用户名: cx_company,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:17:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330863005796085762', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:17:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330863836771594242', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:20:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330864554375065601', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:23:31', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330864695974768641', 1, '用户名: cl_company,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:24:04', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330864714983354369', 2, '企业雇员-分页列表查询', 1, 'cl_company', '长宁县泰宁化工有限公司', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 9, 'cl_company', '2020-11-23 21:24:09', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330864856373342210', 2, '企业基本信息-分页列表查询', 1, 'cl_company', '长宁县泰宁化工有限公司', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'cl_company', '2020-11-23 21:24:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330864896965816321', 1, '用户名: cl_company,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:24:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330864969057513474', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-23 21:25:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330865005099167746', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:25:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330865005099167747', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:25:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330866847313027073', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 49, 'admin', '2020-11-23 21:32:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868437822464002', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-23 21:38:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868438887817218', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-23 21:38:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868656312147970', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 21:39:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868656366673922', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 20, 'admin', '2020-11-23 21:39:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868657142620162', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-23 21:39:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868657671102465', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 21:39:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868818124201986', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:40:27', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868819416047617', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 21:40:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868957479952386', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:41:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330868974546575362', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:41:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869024223911938', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 21:41:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869040170655745', 2, '编辑用户，id： 1227792265186762753', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:41:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869281544429570', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 52, 'admin', '2020-11-23 21:42:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869303598080001', 2, '编辑用户，id： 1230179710779830273', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:42:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869500289966081', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 24, 'admin', '2020-11-23 21:43:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869501485342721', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-23 21:43:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869553977057281', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:43:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869583068749825', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:43:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330869592443019265', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:43:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870135123042305', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-23 21:45:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870135144013825', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 15, 'admin', '2020-11-23 21:45:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870136083537921', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 21:45:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870182027943937', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:45:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870313817169921', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:46:24', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870341684125698', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:46:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870664855248898', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:47:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870713609838594', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:47:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330870995211214849', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 21:49:06', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871022616797186', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 21:49:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871038156693506', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:49:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871058285158402', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 21:49:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871063263797250', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 21:49:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871064668889090', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 21:49:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871820520218626', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:52:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871820520218627', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-23 21:52:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871820553773058', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-23 21:52:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871821833035777', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 21:52:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871864308752385', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 21:52:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871889722040321', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 21:52:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330871918536908802', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:52:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330872298280804353', 2, '编辑用户，id： 1330864402109247489', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:54:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330872572386959361', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 3, 'admin', '2020-11-23 21:55:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330872709502951426', 2, '编辑用户，id： 1330864402109247489', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 21:55:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874798740299777', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-23 22:04:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874825550290945', 2, '企业基本信息-添加', 2, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.add()', NULL, '[{\"companyName\":\"ooooo\",\"createBy\":\"admin\",\"createTime\":1606140259501,\"id\":\"1330874825453821953\"}]', NULL, 25, 'admin', '2020-11-23 22:04:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874827190263810', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 22:04:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874878222360578', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-23 22:04:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874878243332098', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 22:04:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874902834536449', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 4, 'admin', '2020-11-23 22:04:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874944215539713', 2, '编辑用户，id： 1330839844547432450', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 22:04:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330874963157016578', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 2, 'admin', '2020-11-23 22:04:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877255507767298', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 146, 'admin', '2020-11-23 22:13:59', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877260889059329', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 49, 'admin', '2020-11-23 22:14:00', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877305998798850', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 32, 'admin', '2020-11-23 22:14:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877522928152577', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 199, 'admin', '2020-11-23 22:15:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877601533603842', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 43, 'admin', '2020-11-23 22:15:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877601562963970', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 47, 'admin', '2020-11-23 22:15:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877601562963971', 2, '职务表-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.system.controller.SysPositionController.queryPageList()', NULL, NULL, NULL, 49, 'admin', '2020-11-23 22:15:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877653731717122', 2, '编辑用户，id： e9ca23d68d884d4ebb19d07889727dae', 2, 'admin', '系统超级管理员', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 22:15:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877690301853697', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 26, 'admin', '2020-11-23 22:15:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877906992181249', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-11-23 22:16:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330877922448191489', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-11-23 22:16:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330879671816925186', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 225, 'admin', '2020-11-23 22:23:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330880617246543874', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 109, 'admin', '2020-11-23 22:27:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330880629879787522', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 14, 'admin', '2020-11-23 22:27:23', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330881581819023361', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 13, 'admin', '2020-11-23 22:31:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330891739416657921', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 208, 'admin', '2020-11-23 23:11:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330891769485623298', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 86, 'admin', '2020-11-23 23:11:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330891919973056514', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 67, 'admin', '2020-11-23 23:12:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330892915621187585', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 229, 'admin', '2020-11-23 23:16:12', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893066528051201', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 19, 'admin', '2020-11-23 23:16:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893740561092610', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-23 23:19:29', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893760639225858', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 9, 'admin', '2020-11-23 23:19:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893765970186241', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-23 23:19:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893767098454017', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-23 23:19:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893767287197697', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-23 23:19:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893810803101697', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 43, 'admin', '2020-11-23 23:19:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330893881082859521', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 40, 'admin', '2020-11-23 23:20:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330894008572923905', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 35, 'admin', '2020-11-23 23:20:33', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330894024926515201', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 41, 'admin', '2020-11-23 23:20:37', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330894089489436674', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 34, 'admin', '2020-11-23 23:20:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330894453512994817', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 229, 'admin', '2020-11-23 23:22:19', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330898663390445570', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 224, 'admin', '2020-11-23 23:39:03', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330898697238478849', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 44, 'admin', '2020-11-23 23:39:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330899123048456193', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 222, 'admin', '2020-11-23 23:40:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330899144447795202', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 45, 'admin', '2020-11-23 23:40:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330899297544085505', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 28, 'admin', '2020-11-23 23:41:34', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330899461314924546', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 221, 'admin', '2020-11-23 23:42:13', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330900205875228674', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 121, 'admin', '2020-11-23 23:45:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330900225542320130', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 34, 'admin', '2020-11-23 23:45:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330900235466043394', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 24, 'admin', '2020-11-23 23:45:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330900243884011521', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 22, 'admin', '2020-11-23 23:45:20', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330900252847239170', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 23, 'admin', '2020-11-23 23:45:22', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330900295645917186', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 34, 'admin', '2020-11-23 23:45:32', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330915891209019394', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 00:47:30', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330915922221703170', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 00:47:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330923244255916033', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '192.168.2.172', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 01:16:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330930348555419649', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '192.168.2.172', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 138, 'admin', '2020-11-24 01:44:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330930576792735745', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '192.168.2.172', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 140, 'admin', '2020-11-24 01:45:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330930969970937858', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '192.168.2.172', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 144, 'admin', '2020-11-24 01:47:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330932190744088578', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '192.168.2.172', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 24, 'admin', '2020-11-24 01:52:16', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330932198197366785', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '192.168.2.172', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 18, 'admin', '2020-11-24 01:52:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330969570192523266', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 04:20:48', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330969770743169026', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 97, 'admin', '2020-11-24 04:21:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330969793266581505', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 33, 'admin', '2020-11-24 04:21:42', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330969801797795841', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-11-24 04:21:44', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330969809758584833', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 17, 'admin', '2020-11-24 04:21:46', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330970167528521730', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 14, 'admin', '2020-11-24 04:23:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330970269932453890', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-24 04:23:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330970289247223810', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 8, 'admin', '2020-11-24 04:23:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330970309795119105', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-24 04:23:45', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330970330179436545', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 10, 'admin', '2020-11-24 04:23:50', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330982795189669890', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 57, 'admin', '2020-11-24 05:13:21', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330982823778045954', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-24 05:13:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330983127324020737', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-24 05:14:41', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330983229962833922', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-24 05:15:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1330983230961078274', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 5, 'admin', '2020-11-24 05:15:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331004816984350721', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 06:40:52', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331004860458311681', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 06:41:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331004884898521090', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 12, 'admin', '2020-11-24 06:41:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331004893954023426', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-24 06:41:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331005298347843585', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 7, 'admin', '2020-11-24 06:42:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331022619778998274', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 44, 'admin', '2020-11-24 07:51:36', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331022632252858370', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 6, 'admin', '2020-11-24 07:51:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331042706846101505', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 09:11:25', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331042757911752706', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 09:11:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331091329331974146', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 12:24:38', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331091620701917186', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 12:25:47', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331106890287808514', 2, '企业基本信息-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.enterprise.controller.EnterpriseController.queryPageList()', NULL, NULL, NULL, 81, 'admin', '2020-11-24 13:26:28', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331126896753061890', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 14:45:58', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331126924208975873', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 20, 'admin', '2020-11-24 14:46:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331128117404569601', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 54, 'admin', '2020-11-24 14:50:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331134815334764545', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 95, 'admin', '2020-11-24 15:17:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331195627210469378', 1, '用户名: admin,退出成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 19:19:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331195655551381506', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-24 19:19:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('1331195672685113346', 2, '企业雇员-分页列表查询', 1, 'admin', '系统超级管理员', '127.0.0.1', 'org.ezcdata.modules.train.controller.TrainEmployeeController.queryPageList()', NULL, NULL, NULL, 39, 'admin', '2020-11-24 19:19:15', NULL, NULL);

-- ----------------------------
-- Table structure for sys_param_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_param_config`;
CREATE TABLE `sys_param_config`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PARAM_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PARAM_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PARAM_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAM_REMARK` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAM_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAM_TYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARAM_VALUE` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `SYS_ORG_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATE_TIME` datetime(0) DEFAULT NULL,
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPDATE_TIME` datetime(0) DEFAULT NULL,
  `DEL_FLAG` decimal(11, 0) DEFAULT NULL,
  PRIMARY KEY (`PARAM_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `PARENT_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父id',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单标题',
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路径',
  `COMPONENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件',
  `COMPONENT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组件名字',
  `REDIRECT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '一级菜单跳转地址',
  `MENU_TYPE` decimal(11, 0) DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `PERMS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单权限编码',
  `PERMS_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限策略1显示2禁用',
  `SORT_NO` decimal(8, 2) DEFAULT NULL COMMENT '菜单排序',
  `ALWAYS_SHOW` decimal(4, 0) DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标',
  `IS_ROUTE` decimal(4, 0) DEFAULT NULL COMMENT '是否路由菜单: 0:不是  1:是（默认值1）',
  `IS_LEAF` decimal(4, 0) DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `KEEP_ALIVE` decimal(4, 0) DEFAULT NULL COMMENT '是否缓存该页面:    1:是   0:不是',
  `HIDDEN` decimal(11, 0) DEFAULT NULL COMMENT '是否隐藏路由: 0否,1是',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `DEL_FLAG` decimal(11, 0) DEFAULT NULL COMMENT '删除状态 0正常 1已删除',
  `RULE_FLAG` decimal(11, 0) DEFAULT NULL COMMENT '是否添加数据权限1是0否',
  `STATUS` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '按钮权限状态(0无效1有效)',
  `INTERNAL_OR_EXTERNAL` decimal(4, 0) DEFAULT NULL COMMENT '外链菜单打开方式 0/内部打开 1/外部打开',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('00a2a0ae65cdca5e93209cdbde97cbe6', '2e42e3835c2b44ec9f7bc26c146ee531', '成功', '/result/success', 'result/Success', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('024f1fd1283dc632458976463d8984e1', '700b7f95165c46cc7a78bf227aa8fed3', 'Tomcat信息', '/monitor/TomcatInfo', 'modules/monitor/TomcatInfo', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 09:44:29', 'admin', '2019-05-07 15:19:10', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('043780fa095ff1b2bec4dc406d76f023', '2a470fc0c3954d9dbb61de6d80846549', '表格合计', '/jeecg/tableTotal', 'jeecg/TableTotal', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-08-14 10:28:46', NULL, NULL, 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('05b3c82ddb2536a4a5ee1a4c46b5abef', '540a2936940846cb98114ffb0d145cb8', '用户列表', '/list/user-list', 'list/UserList', NULL, NULL, 1, NULL, NULL, 3.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('0620e402857b8c5b605e1ad9f4b89350', '2a470fc0c3954d9dbb61de6d80846549', '异步树列表Demo', '/jeecg/JeecgTreeTable', 'jeecg/JeecgTreeTable', NULL, NULL, 1, NULL, '0', 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-05-13 17:30:30', 'admin', '2019-05-13 17:32:17', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('078f9558cdeab239aecb2bda1a8ed0d1', 'fb07ca05a3e13674dbf6d3245956da2e', '搜索列表（文章）', '/list/search/article', 'list/TableList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-12 14:00:34', 'admin', '2019-02-12 14:17:54', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('08e6b9dc3c04489c8e1ff2ce6f105aa4', NULL, '系统监控', '/dashboard3', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 7.00, 0, 'dashboard', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:55:17', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('0ac2ad938963b6c6d1af25477d5b8b51', '8d4683aacaa997ab86b966b464360338', '代码生成按钮', NULL, NULL, NULL, NULL, 2, 'online:goGenerateCode', '1', 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-06-11 14:20:09', NULL, NULL, 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('109c78a583d4693ce2f16551b7786786', 'e41b69c57a941a3bbcce45032fe57605', 'Online报表配置', '/online/cgreport', 'modules/online/cgreport/OnlCgreportHeadList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-08 10:51:07', 'admin', '2019-03-30 19:04:28', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1166535831146504193', '2a470fc0c3954d9dbb61de6d80846549', '对象存储', '/oss/file', 'modules/oss/OSSFileList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-08-28 02:19:50', 'admin', '2019-08-28 02:20:57', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('1174506953255182338', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '职务管理', '/isystem/position', 'system/SysPositionList', NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-19 10:14:13', 'admin', '2019-09-19 10:15:22', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1174590283938041857', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '通讯录', '/isystem/addressList', 'system/AddressList', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-09-19 15:45:21', NULL, NULL, 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1192318987661234177', 'e41b69c57a941a3bbcce45032fe57605', '系统编码规则', '/isystem/fillRule', 'system/SysFillRuleList', NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-11-07 13:52:53', 'admin', '2019-12-25 09:53:40', 0, 0, '1', 0);
INSERT INTO `sys_permission` VALUES ('1217423939243716609', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '参数管理', '/sysparamList', 'sysparam/SysParamConfigList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-01-15 20:31:00', 'admin', '2020-01-15 20:58:09', 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('13212d3416eb690c2e1d5033166ff47a', '2e42e3835c2b44ec9f7bc26c146ee531', '失败', '/result/fail', 'result/Error', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('1329248653670232065', '1329248653670232065', 'excel', '/layouts/train', 'train/Train_fileList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2020-11-19 10:22:30', 'admin', '2020-11-19 10:26:07', 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('1329268722009862146', '1329268722009862146', 'excel文件导入导出', '/layouts/train', 'train/TrainEmployeeList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2020-11-19 11:42:15', 'admin', '2020-11-19 19:37:36', 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('1329391893849505793', '1329391893849505793', '文件操作', '/layouts/train', 'train/TrainEmployeeList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2020-11-19 19:51:41', 'admin', '2020-11-20 15:29:01', 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('1329694194128617473', '', '文件管理', '/layouts/train', 'layouts/RouteView', NULL, NULL, 0, NULL, '1', 1.00, 0, 'folder', 1, 0, 0, 0, NULL, 'admin', '2020-11-20 15:52:55', 'admin', '2020-11-23 16:30:23', 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('1329697939054886913', '1329694194128617473', 'excel', '/train/TrainEmployeeList', 'train/TrainEmployeeList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-11-20 16:07:48', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('1330785803343650817', '1329694194128617473', '企业基本信息', '/enterprise/EnterpriseList', 'enterprise/EnterpriseList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2020-11-23 16:10:35', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO `sys_permission` VALUES ('1367a93f2c410b169faa7abcbad2f77c', '6e73eb3c26099c191bf03852ee1310a1', '基本设置', '/account/settings/base', 'account/settings/BaseSetting', NULL, NULL, 1, 'BaseSettings', NULL, NULL, 0, NULL, 1, 1, NULL, 1, NULL, NULL, '2018-12-26 18:58:35', 'admin', '2019-03-20 12:57:31', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('190c2b43bec6a5f7a4194a85db67d96a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/isystem/RoleList', 'system/RoleUserList', NULL, NULL, 1, NULL, NULL, 1.20, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-17 15:13:56', 'admin', '2020-11-23 21:10:32', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('1a0811914300741f4e11838ff37a1d3a', '3f915b2769fc80648e92d04e84ca059d', '手机号禁用', NULL, NULL, NULL, NULL, 2, 'user:form:phone', '2', 1.00, 0, NULL, 0, 1, NULL, 0, NULL, 'admin', '2019-05-11 17:19:30', 'admin', '2019-05-11 18:00:22', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('200006f0edf145a2b50eacca07585451', 'fb07ca05a3e13674dbf6d3245956da2e', '搜索列表（应用）', '/list/search/application', 'list/TableList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-12 14:02:51', 'admin', '2019-02-12 14:14:01', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('22d6a3d39a59dd7ea9a30acfa6bfb0a5', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO动态表单', '/online/df/:table/:id', 'modules/online/cgform/auto/OnlineDynamicForm', NULL, NULL, 1, NULL, NULL, 9.00, 0, NULL, 0, 1, NULL, 1, NULL, 'admin', '2019-04-22 15:15:43', 'admin', '2019-04-30 18:18:26', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('265de841c58907954b8877fb85212622', '2a470fc0c3954d9dbb61de6d80846549', '图片拖拽排序', '/jeecg/imgDragSort', 'jeecg/ImgDragSort', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 10:43:08', 'admin', '2019-04-25 10:46:26', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('277bfabef7d76e89b33062b16a9a5020', 'e3c13679c73a4f829bcff2aba8fd68b1', '基础表单', '/form/base-form', 'form/BasicForm', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-26 17:02:08', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('2a470fc0c3954d9dbb61de6d80846549', NULL, '常见案例', '/jeecg', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 10.00, 0, 'qrcode', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:55:53', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('2dbbafa22cda07fa5d169d741b81fe12', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '在线文档', '{{ window._CONFIG[\'domianURL\'] }}/doc.html', 'layouts/IframePageView', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-01-30 10:00:01', 'admin', '2019-03-23 19:44:43', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('2e42e3835c2b44ec9f7bc26c146ee531', NULL, '结果页', '/result', 'layouts/PageView', NULL, NULL, 0, NULL, NULL, 11.00, 0, 'check-circle-o', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:56:30', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('339329ed54cf255e1f9392e84f136901', '2a470fc0c3954d9dbb61de6d80846549', 'helloworld', '/jeecg/helloworld', 'jeecg/helloworld', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-15 16:24:56', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户管理', '/isystem/user', 'system/UserList', NULL, NULL, 1, NULL, NULL, 1.10, 0, NULL, 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-12-25 09:36:24', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('3fac0d3c9cd40fa53ab70d4c583821f8', '2a470fc0c3954d9dbb61de6d80846549', '分屏', '/jeecg/splitPanel', 'jeecg/SplitPanel', NULL, NULL, 1, NULL, NULL, 6.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 16:27:06', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('4148ec82b6acd69f470bea75fe41c357', '2a470fc0c3954d9dbb61de6d80846549', '单表模型示例', '/jeecg/jeecgDemoList', 'jeecg/JeecgDemoList', 'DemoList', NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, NULL, '2018-12-28 15:57:30', 'admin', '2019-02-15 16:24:37', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('418964ba087b90a84897b62474496b93', '540a2936940846cb98114ffb0d145cb8', '查询表格', '/list/query-list', 'list/TableList', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('4356a1a67b564f0988a484f5531fd4d9', '2a470fc0c3954d9dbb61de6d80846549', '内嵌Table', '/jeecg/TableExpandeSub', 'jeecg/TableExpandeSub', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-04 22:48:13', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('45c966826eeff4c99b8f8ebfe74511fc', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '部门管理', '/isystem/depart', 'system/DepartList', NULL, NULL, 1, NULL, NULL, 1.40, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-01-29 18:47:40', 'admin', '2019-12-25 09:36:47', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('4875ebe289344e14844d8e3ea1edd73f', NULL, '详情页', '/profile', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 12.00, 0, 'profile', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:56:36', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('4f66409ef3bbd69c1d80469d6e2a885e', '6e73eb3c26099c191bf03852ee1310a1', '账户绑定', '/account/settings/binding', 'account/settings/Binding', NULL, NULL, 1, 'BindingSettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 19:01:20', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('4f84f9400e5e92c95f05b554724c2b58', '540a2936940846cb98114ffb0d145cb8', '角色列表', '/list/role-list', 'list/RoleList', NULL, NULL, 1, NULL, NULL, 4.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('53a9230444d33de28aa11cc108fb1dba', '5c8042bd6c601270b2bbd9b20bccc68b', '我的消息', '/isps/userAnnouncement', 'system/UserAnnouncementList', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-19 10:16:00', 'admin', '2019-12-25 09:54:34', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('54097c6a3cf50fad0793a34beff1efdf', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线表单', '/online/cgformList/:code', 'modules/online/cgform/auto/OnlCgformAutoList', NULL, NULL, 1, NULL, NULL, 9.00, 0, NULL, 1, 1, NULL, 1, NULL, 'admin', '2019-03-19 16:03:06', 'admin', '2019-04-30 18:19:03', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('540a2936940846cb98114ffb0d145cb8', NULL, '列表页', '/list', 'layouts/PageView', NULL, '/list/query-list', 0, NULL, NULL, 16.00, 0, 'table', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:56:23', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('54dd5457a3190740005c1bfec55b1c34', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/isystem/permission', 'system/PermissionList', NULL, NULL, 1, NULL, NULL, 1.30, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-12-25 09:36:39', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('58857ff846e61794c69208e9d3a85466', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '日志管理', '/isystem/log', 'system/LogList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, NULL, '2018-12-26 10:11:18', 'admin', '2019-04-02 11:38:17', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('58b9204feaf07e47284ddb36cd2d8468', '2a470fc0c3954d9dbb61de6d80846549', '图片翻页', '/jeecg/imgTurnPage', 'jeecg/ImgTurnPage', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 11:36:42', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('5c2f42277948043026b7a14692456828', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '我的部门', '/isystem/departUserList', 'system/DepartUserList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-04-17 15:12:24', 'admin', '2019-12-25 09:35:26', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('5c8042bd6c601270b2bbd9b20bccc68b', NULL, '消息中心', '/message', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 8.00, 0, 'message', 1, 0, 0, 0, NULL, 'admin', '2019-04-09 11:05:04', 'admin', '2020-08-06 10:55:34', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('6531cf3421b1265aeeeabaab5e176e6d', 'e3c13679c73a4f829bcff2aba8fd68b1', '分步表单', '/form/step-form', 'form/stepForm/StepForm', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('655563cd64b75dcf52ef7bcdd4836953', '2a470fc0c3954d9dbb61de6d80846549', '图片预览', '/jeecg/ImagPreview', 'jeecg/ImagPreview', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-17 11:18:45', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('65a8f489f25a345836b7f44b1181197a', 'c65321e57b7949b7a975313220de0422', '403', '/exception/403', 'exception/403', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('6ad53fd1b220989a8b71ff482d683a5a', '2a470fc0c3954d9dbb61de6d80846549', '一对多Tab示例', '/jeecg/tablist/JeecgOrderDMainList', 'jeecg/tablist/JeecgOrderDMainList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-20 14:45:09', 'admin', '2019-02-21 16:26:21', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('6e73eb3c26099c191bf03852ee1310a1', '717f6bee46f44a3897eca9abd6e2ec44', '个人设置', '/account/settings/base', 'account/settings/Index', NULL, NULL, 1, NULL, NULL, 2.00, 1, NULL, 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-04-19 09:41:05', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('700b7f95165c46cc7a78bf227aa8fed3', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '性能监控', '/monitor', 'layouts/RouteView', NULL, NULL, 1, NULL, NULL, 0.00, 0, NULL, 1, 0, NULL, 0, NULL, 'admin', '2019-04-02 11:34:34', 'admin', '2019-05-05 17:49:47', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('717f6bee46f44a3897eca9abd6e2ec44', NULL, '个人页', '/account', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 14.00, 0, 'user', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:56:49', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('73678f9daa45ed17a3674131b03432fb', '540a2936940846cb98114ffb0d145cb8', '权限列表', '/list/permission-list', 'list/PermissionList', NULL, NULL, 1, NULL, NULL, 5.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('7593c9e3523a17bca83b8d7fe8a34e58', '3f915b2769fc80648e92d04e84ca059d', '添加用户按钮', NULL, NULL, NULL, NULL, 2, 'user:add', '1', 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-16 11:20:33', 'admin', '2019-05-17 18:31:25', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('7960961b0063228937da5fa8dd73d371', '2a470fc0c3954d9dbb61de6d80846549', 'JEditableTable示例', '/jeecg/JEditableTable', 'jeecg/JeecgEditableTableExample', NULL, NULL, 1, NULL, NULL, 2.10, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-03-22 15:22:18', 'admin', '2019-12-25 09:48:16', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('7ac9eb9ccbde2f7a033cd4944272bf1e', '540a2936940846cb98114ffb0d145cb8', '卡片列表', '/list/card', 'list/CardList', NULL, NULL, 1, NULL, NULL, 7.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('841057b8a1bef8f6b4b20f9a618a7fa6', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '数据日志', '/sys/dataLog-list', 'system/DataLogList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-11 19:26:49', 'admin', '2019-03-12 11:40:47', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('882a73768cfd7f78f3a37584f7299656', '6e73eb3c26099c191bf03852ee1310a1', '个性化设置', '/account/settings/custom', 'account/settings/Custom', NULL, NULL, 1, 'CustomSettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 19:00:46', NULL, '2018-12-26 21:13:25', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8b3bff2eee6f1939147f5c68292a1642', '700b7f95165c46cc7a78bf227aa8fed3', '服务器信息', '/monitor/SystemInfo', 'modules/monitor/SystemInfo', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 11:39:19', 'admin', '2019-04-02 15:40:02', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8d1ebd663688965f1fd86a2f0ead3416', '700b7f95165c46cc7a78bf227aa8fed3', 'Redis监控', '/monitor/redis/info', 'modules/monitor/RedisInfo', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 13:11:33', 'admin', '2019-05-07 15:18:54', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8d4683aacaa997ab86b966b464360338', 'e41b69c57a941a3bbcce45032fe57605', 'Online表单开发', '/online/cgform', 'modules/online/cgform/OnlCgformHeadList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 0, NULL, 0, NULL, 'admin', '2019-03-12 15:48:14', 'admin', '2019-06-11 14:19:17', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('8fb8172747a78756c11916216b8b8066', '717f6bee46f44a3897eca9abd6e2ec44', '工作台', '/dashboard/workplace', 'dashboard/Workplace', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-04-02 11:45:02', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('944abf0a8fc22fe1f1154a389a574154', '5c8042bd6c601270b2bbd9b20bccc68b', '消息管理', '/modules/message/sysMessageList', 'modules/message/SysMessageList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-09 11:27:53', 'admin', '2019-04-09 19:31:23', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9502685863ab87f0ad1134142788a385', NULL, '首页', '/index/analysis', 'index/Analysis', NULL, NULL, 0, NULL, NULL, 0.00, 0, 'home', 1, 1, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-02-10 22:36:28', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('97c8629abc7848eccdb6d77c24bb3ebb', '700b7f95165c46cc7a78bf227aa8fed3', '磁盘监控', '/monitor/Disk', 'modules/monitor/DiskMonitoring', NULL, NULL, 1, NULL, NULL, 6.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 14:30:06', 'admin', '2019-05-05 14:37:14', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9a90363f216a6a08f32eecb3f0bf12a3', '2a470fc0c3954d9dbb61de6d80846549', '自定义组件', '/jeecg/SelectDemo', 'jeecg/SelectDemo', NULL, NULL, 1, NULL, NULL, 0.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2019-03-19 11:19:05', 'admin', '2019-12-25 09:47:04', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('9cb91b8851db0cf7b19d7ecc2a8193dd', '1939e035e803a99ceecb6f5563570fb2', '我的任务表单', '/modules/bpm/task/form/FormModule', 'modules/bpm/task/form/FormModule', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-08 16:49:05', 'admin', '2019-03-08 18:37:56', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('9fe26464838de2ea5e90f2367e35efa0', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO在线报表', '/online/cgreport/:code', 'modules/online/cgreport/auto/OnlCgreportAutoList', 'onlineAutoList', NULL, 1, NULL, NULL, 9.00, 0, NULL, 1, 1, NULL, 1, NULL, 'admin', '2019-03-12 11:06:48', 'admin', '2019-04-30 18:19:10', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('a400e4f4d54f79bf5ce160ae432231af', '2a470fc0c3954d9dbb61de6d80846549', '百度', 'http://www.baidu.com', 'layouts/IframePageView', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-01-29 19:44:06', 'admin', '2019-02-15 16:25:02', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('ae4fed059f67086fd52a73d913cf473d', '540a2936940846cb98114ffb0d145cb8', '内联编辑表格', '/list/edit-table', 'list/TableInnerEditList', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('aedbf679b5773c1f25e9f7b10111da73', '08e6b9dc3c04489c8e1ff2ce6f105aa4', 'SQL监控', '{{ window._CONFIG[\'domianURL\'] }}/druid/', 'layouts/IframePageView', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-01-30 09:43:22', 'admin', '2019-03-23 19:00:46', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b1cb0a3fedf7ed0e4653cb5a229837ee', '08e6b9dc3c04489c8e1ff2ce6f105aa4', '定时任务', '/isystem/QuartzJobList', 'system/QuartzJobList', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, NULL, '2019-01-03 09:38:52', 'admin', '2019-04-02 10:24:13', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b3c824fc22bd953e2eb16ae6914ac8f9', '4875ebe289344e14844d8e3ea1edd73f', '高级详情页', '/profile/advanced', 'profile/advanced/Advanced', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b4dfc7d5dd9e8d5b6dd6d4579b1aa559', 'c65321e57b7949b7a975313220de0422', '500', '/exception/500', 'exception/500', NULL, NULL, 1, NULL, NULL, 3.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('b6bcee2ccc854052d3cc3e9c96d90197', '71102b3b87fb07e5527bbd2c530dd90a', '加班申请', '/modules/extbpm/joa/JoaOvertimeList', 'modules/extbpm/joa/JoaOvertimeList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-03 15:33:10', 'admin', '2019-04-03 15:34:48', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('c431130c0bc0ec71b0a5be37747bb36a', '2a470fc0c3954d9dbb61de6d80846549', '一对多JEditable', '/jeecg/JeecgOrderMainListForJEditableTable', 'jeecg/JeecgOrderMainListForJEditableTable', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-03-29 10:51:59', 'admin', '2019-04-04 20:09:39', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('c65321e57b7949b7a975313220de0422', NULL, '异常页', '/exception', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 13.00, 0, 'warning', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:56:42', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('c6cf95444d80435eb37b2f9db3971ae6', '2a470fc0c3954d9dbb61de6d80846549', '数据回执模拟', '/jeecg/InterfaceTest', 'jeecg/InterfaceTest', NULL, NULL, 1, NULL, NULL, 6.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-19 16:02:23', 'admin', '2019-02-21 16:25:45', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('cc50656cf9ca528e6f2150eba4714ad2', '4875ebe289344e14844d8e3ea1edd73f', '基础详情页', '/profile/basic', 'profile/basic/Index', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d07a2c87a451434c99ab06296727ec4f', '700b7f95165c46cc7a78bf227aa8fed3', 'JVM信息', '/monitor/JvmInfo', 'modules/monitor/JvmInfo', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-01 23:07:48', 'admin', '2019-04-02 11:37:16', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d2bbf9ebca5a8fa2e227af97d2da7548', 'c65321e57b7949b7a975313220de0422', '404', '/exception/404', 'exception/404', NULL, NULL, 1, NULL, NULL, 2.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('d7d6e2e4e2934f2c9385a623fd98c6f3', NULL, '系统管理', '/isystem', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 6.00, 0, 'setting', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:54:56', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('d86f58e7ab516d3bc6bfb1fe10585f97', '717f6bee46f44a3897eca9abd6e2ec44', '个人中心', '/account/center', 'account/center/Index', NULL, NULL, 1, NULL, NULL, 1.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('de13e0f6328c069748de7399fcc1dbbd', 'fb07ca05a3e13674dbf6d3245956da2e', '搜索列表（项目）', '/list/search/project', 'list/TableList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-12 14:01:40', 'admin', '2019-02-12 14:14:18', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e08cb190ef230d5d4f03824198773950', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '系统通告', '/isystem/annountCement', 'system/SysAnnouncementList', NULL, NULL, 1, 'annountCement', NULL, 6.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2019-01-02 17:23:01', NULL, '2019-01-02 17:31:23', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e1979bb53e9ea51cecc74d86fd9d2f64', '2a470fc0c3954d9dbb61de6d80846549', 'PDF预览', '/jeecg/jeecgPdfView', 'jeecg/JeecgPdfView', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-25 10:39:35', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e3c13679c73a4f829bcff2aba8fd68b1', NULL, '表单页', '/form', 'layouts/PageView', NULL, NULL, 0, NULL, NULL, 15.00, 0, 'form', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2020-08-06 10:56:56', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('e41b69c57a941a3bbcce45032fe57605', NULL, '在线开发', '/online', 'layouts/RouteView', NULL, NULL, 0, NULL, NULL, 9.00, 0, 'cloud', 1, 0, 0, 0, NULL, 'admin', '2019-03-08 10:43:10', 'admin', '2020-08-06 10:55:41', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('e5973686ed495c379d829ea8b2881fc6', 'e3c13679c73a4f829bcff2aba8fd68b1', '高级表单', '/form/advanced-form', 'form/advancedForm/AdvancedForm', NULL, NULL, 1, NULL, NULL, 3.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('e6bfd1fcabfd7942fdd05f076d1dad38', '2a470fc0c3954d9dbb61de6d80846549', '打印测试', '/jeecg/PrintDemo', 'jeecg/PrintDemo', NULL, NULL, 1, NULL, NULL, 3.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-19 15:58:48', 'admin', '2019-05-07 20:14:39', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('ebb9d82ea16ad864071158e0c449d186', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '分类字典', '/isys/category', 'system/SysCategoryList', NULL, NULL, 1, NULL, '1', 5.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-05-29 18:48:07', 'admin', '2019-05-29 18:48:27', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('ec8d607d0156e198b11853760319c646', '6e73eb3c26099c191bf03852ee1310a1', '安全设置', '/account/settings/security', 'account/settings/Security', NULL, NULL, 1, 'SecuritySettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 18:59:52', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('f1cb187abf927c88b89470d08615f5ac', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '数据字典', '/isystem/dict', 'system/DictList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, 0, 0, NULL, NULL, '2018-12-28 13:54:43', 'admin', '2019-12-25 09:35:44', 0, 0, NULL, 0);
INSERT INTO `sys_permission` VALUES ('f23d9bfff4d9aa6b68569ba2cff38415', '540a2936940846cb98114ffb0d145cb8', '标准列表', '/list/basic-list', 'list/StandardList', NULL, NULL, 1, NULL, NULL, 6.00, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('f2849d3814fc97993bfc519ae6bbf049', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO复制表单', '/online/copyform/:code', 'modules/online/cgform/OnlCgformCopyList', NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 1, NULL, 'admin', '2019-08-29 16:05:37', NULL, NULL, 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('f780d0d3083d849ccbdb1b1baee4911d', '5c8042bd6c601270b2bbd9b20bccc68b', '模板管理', '/modules/message/sysMessageTemplateList', 'modules/message/SysMessageTemplateList', NULL, NULL, 1, NULL, NULL, 1.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-09 11:50:31', 'admin', '2019-04-12 10:16:34', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('fb07ca05a3e13674dbf6d3245956da2e', '540a2936940846cb98114ffb0d145cb8', '搜索列表', '/list/search', 'list/search/SearchLayout', NULL, '/list/search/article', 1, NULL, NULL, 8.00, 0, NULL, 1, 0, NULL, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-12 15:09:13', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('fb367426764077dcf94640c843733985', '2a470fc0c3954d9dbb61de6d80846549', '一对多示例', '/jeecg/JeecgOrderMainList', 'jeecg/JeecgOrderMainList', NULL, NULL, 1, NULL, NULL, 2.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-02-15 16:24:11', 'admin', '2019-02-18 10:50:14', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('fba41089766888023411a978d13c0aa4', 'e41b69c57a941a3bbcce45032fe57605', 'AUTO树表单列表', '/online/cgformTreeList/:code', 'modules/online/cgform/auto/OnlCgformTreeList', NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 1, NULL, 1, NULL, 'admin', '2019-05-21 14:46:50', 'admin', '2019-06-11 13:52:52', 0, 0, '1', NULL);
INSERT INTO `sys_permission` VALUES ('fc810a2267dd183e4ef7c71cc60f4670', '700b7f95165c46cc7a78bf227aa8fed3', '请求追踪', '/monitor/HttpTrace', 'modules/monitor/HttpTrace', NULL, NULL, 1, NULL, NULL, 4.00, 0, NULL, 1, 1, NULL, 0, NULL, 'admin', '2019-04-02 09:46:19', 'admin', '2019-04-02 11:37:27', 0, 0, NULL, NULL);
INSERT INTO `sys_permission` VALUES ('fedfbf4420536cacc0218557d263dfea', '6e73eb3c26099c191bf03852ee1310a1', '新消息通知', '/account/settings/notification', 'account/settings/Notification', NULL, NULL, 1, 'NotificationSettings', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2018-12-26 19:02:05', NULL, NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission_data_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_data_rule`;
CREATE TABLE `sys_permission_data_rule`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `PERMISSION_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单ID',
  `RULE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则名称',
  `RULE_COLUMN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段',
  `RULE_CONDITIONS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '条件',
  `RULE_VALUE` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '规则值',
  `STATUS` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限有效状态1有0否',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission_data_rule
-- ----------------------------
INSERT INTO `sys_permission_data_rule` VALUES ('1314101006769901570', '1313159165455224834', '自己查看自己的布控', 'CREATE_BY', '=', '#{userName}', '1', '2020-10-08 15:11:09', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('32b62cb04d6c788d9d92e3ff5e66854e', '8d4683aacaa997ab86b966b464360338', '000', '00', '!=', '00', '1', '2019-04-02 18:36:08', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('40283181614231d401614234fe670003', '40283181614231d401614232cd1c0001', 'createBy', 'createBy', '=', '#{sys_user_code}', '1', '2018-01-29 21:57:04', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('4028318161424e730161424fca6f0004', '4028318161424e730161424f61510002', 'createBy', 'createBy', '=', '#{sys_user_code}', '1', '2018-01-29 22:26:20', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402880e6487e661a01487e732c020005', '402889fb486e848101486e93a7c80014', 'SYS_ORG_CODE', 'SYS_ORG_CODE', 'LIKE', '010201%', '1', '2014-09-16 20:32:30', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402880e6487e661a01487e8153ee0007', '402889fb486e848101486e93a7c80014', 'create_by', 'create_by', NULL, '#{SYS_USER_CODE}', '1', '2014-09-16 20:47:57', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402880ec5ddec439015ddf9225060038', '40288088481d019401481d2fcebf000d', '复杂关系', NULL, 'USE_SQL_RULES', 'name like \'%张%\' or age > 10', '1', NULL, NULL, '2017-08-14 15:10:25', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('402880ec5ddfdd26015ddfe3e0570011', '4028ab775dca0d1b015dca3fccb60016', '复杂sql配置', NULL, 'USE_SQL_RULES', 'table_name like \'%test%\' or is_tree = \'Y\'', '1', NULL, NULL, '2017-08-14 16:38:55', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('402880f25b1e2ac7015b1e5fdebc0012', '402880f25b1e2ac7015b1e5cdc340010', '只能看自己数据', 'create_by', '=', '#{sys_user_code}', '1', '2017-03-30 16:40:51', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881875b19f141015b19f8125e0014', '40288088481d019401481d2fcebf000d', '可看下属业务数据', 'sys_org_code', 'LIKE', '#{sys_org_code}', '1', NULL, NULL, '2017-08-14 15:04:32', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('402881e45394d66901539500a4450001', '402881e54df73c73014df75ab670000f', 'sysCompanyCode', 'sysCompanyCode', '=', '#{SYS_COMPANY_CODE}', '1', '2016-03-21 01:09:21', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e45394d6690153950177cb0003', '402881e54df73c73014df75ab670000f', 'sysOrgCode', 'sysOrgCode', '=', '#{SYS_ORG_CODE}', '1', '2016-03-21 01:10:15', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e56266f43101626727aff60067', '402881e56266f43101626724eb730065', '销售自己看自己的数据', 'createBy', '=', '#{sys_user_code}', '1', '2018-03-27 19:11:16', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e56266f4310162672fb1a70082', '402881e56266f43101626724eb730065', '销售经理看所有下级数据', 'sysOrgCode', 'LIKE', '#{sys_org_code}', '1', '2018-03-27 19:20:01', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881e56266f431016267387c9f0088', '402881e56266f43101626724eb730065', '只看金额大于1000的数据', 'money', '>=', '1000', '1', '2018-03-27 19:29:37', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402881f3650de25101650dfb5a3a0010', '402881e56266f4310162671d62050044', '22', NULL, 'USE_SQL_RULES', '22', '1', '2018-08-06 14:45:01', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402889fb486e848101486e913cd6000b', '402889fb486e848101486e8e2e8b0007', 'userName', 'userName', '=', 'admin', '1', '2014-09-13 18:31:25', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('402889fb486e848101486e98d20d0016', '402889fb486e848101486e93a7c80014', 'title', 'title', '=', '12', '1', NULL, NULL, '2014-09-13 22:18:22', 'scott');
INSERT INTO `sys_permission_data_rule` VALUES ('402889fe47fcb29c0147fcb6b6220001', '8a8ab0b246dc81120146dc8180fe002b', '12', '12', '>', '12', '1', '2014-08-22 15:55:38', '8a8ab0b246dc81120146dc8181950052', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('4028ab775dca0d1b015dca4183530018', '4028ab775dca0d1b015dca3fccb60016', '表名限制', 'isDbSynch', '=', 'Y', '1', NULL, NULL, '2017-08-14 16:43:45', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('4028ef815595a881015595b0ccb60001', '40288088481d019401481d2fcebf000d', '限只能看自己', 'create_by', '=', '#{sys_user_code}', '1', NULL, NULL, '2017-08-14 15:03:56', 'demo');
INSERT INTO `sys_permission_data_rule` VALUES ('4028ef81574ae99701574aed26530005', '4028ef81574ae99701574aeb97bd0003', '用户名', 'userName', '!=', 'admin', '1', '2016-09-21 12:07:18', 'admin', NULL, NULL);
INSERT INTO `sys_permission_data_rule` VALUES ('53609e1854f4a87eb23ed23a18a1042c', '4148ec82b6acd69f470bea75fe41c357', '只看当前部门数据', 'sysOrgCode', '=', '#{sys_org_code}', '1', '2019-05-11 19:40:39', 'admin', '2019-05-11 19:40:50', 'admin');
INSERT INTO `sys_permission_data_rule` VALUES ('a7d661ef5ac168b2b162420c6804dac5', '4148ec82b6acd69f470bea75fe41c357', '只看自己的数据', 'createBy', '=', '#{sys_user_code}', '1', '2019-05-11 19:19:05', 'admin', '2019-05-11 19:24:58', 'admin');
INSERT INTO `sys_permission_data_rule` VALUES ('f852d85d47f224990147f2284c0c0005', NULL, '小于', 'test', '<=', '11', '1', '2014-08-20 14:43:52', '8a8ab0b246dc81120146dc8181950052', NULL, NULL);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务编码',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务名称',
  `POST_RANK` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职级',
  `COMPANY_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司id',
  `CREATE_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `SYS_ORG_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织机构编码',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES ('1224594864179331073', '5102', '测试', '5', NULL, 'admin', '2020-02-04 15:25:42', NULL, NULL, '510000000000');
INSERT INTO `sys_position` VALUES ('1330798827416731650', '5103', '管理员', '3', NULL, 'admin', '2020-11-23 17:02:20', NULL, NULL, '510000000000');

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `DEL_FLAG` decimal(11, 0) DEFAULT NULL COMMENT '删除状态',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `JOB_CLASS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务类名',
  `CRON_EXPRESSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `PARAMETER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `STATUS` decimal(11, 0) DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `ROLE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `ROLE_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `ROLE_AREA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色管辖范围',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1215888815783297025', '外部系统交换接口', 'api', NULL, 'admin', '2020-01-11 14:50:58', 'admin', '2020-02-01 16:40:25', '51');
INSERT INTO `sys_role` VALUES ('1223526121789505538', '测试角色', 'test', 'test', 'admin', '2020-02-01 16:38:53', 'admin', '2020-09-02 19:19:30', '51');
INSERT INTO `sys_role` VALUES ('1229390949611532289', '系统管理员', 'manager', NULL, 'admin', '2020-02-17 21:03:38', NULL, NULL, '51');
INSERT INTO `sys_role` VALUES ('1330839279285276673', 'cx_db', 'cx001', NULL, 'admin', '2020-11-23 19:43:05', NULL, NULL, '51');
INSERT INTO `sys_role` VALUES ('f6817f48af4fb3af11b9e8bf182f618b', '系统超级管理员', 'admin', '管理员', NULL, '2018-12-21 18:03:39', 'admin', '2020-02-17 21:04:05', '51');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  `PERMISSION_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限id',
  `DATA_RULE_IDS` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('00b0748f04d3ea52c8cfa179c1c9d384', '52b0cf022ac4187b2a70dfa4f8b2d940', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('00b82058779cca5106fbb84783534c9b', 'f6817f48af4fb3af11b9e8bf182f618b', '4148ec82b6acd69f470bea75fe41c357', NULL);
INSERT INTO `sys_role_permission` VALUES ('0254c0b25694ad5479e6d6935bbc176e', 'f6817f48af4fb3af11b9e8bf182f618b', '944abf0a8fc22fe1f1154a389a574154', NULL);
INSERT INTO `sys_role_permission` VALUES ('09bd4fc30ffe88c4a44ed3868f442719', 'f6817f48af4fb3af11b9e8bf182f618b', 'e6bfd1fcabfd7942fdd05f076d1dad38', NULL);
INSERT INTO `sys_role_permission` VALUES ('0c2d2db76ee3aa81a4fe0925b0f31365', 'f6817f48af4fb3af11b9e8bf182f618b', '024f1fd1283dc632458976463d8984e1', NULL);
INSERT INTO `sys_role_permission` VALUES ('0c6b8facbb1cc874964c87a8cf01e4b1', 'f6817f48af4fb3af11b9e8bf182f618b', '841057b8a1bef8f6b4b20f9a618a7fa6', NULL);
INSERT INTO `sys_role_permission` VALUES ('0c6e1075e422972083c3e854d9af7851', 'f6817f48af4fb3af11b9e8bf182f618b', '08e6b9dc3c04489c8e1ff2ce6f105aa4', NULL);
INSERT INTO `sys_role_permission` VALUES ('0e1469997af2d3b97fff56a59ee29eeb', 'f6817f48af4fb3af11b9e8bf182f618b', 'e41b69c57a941a3bbcce45032fe57605', NULL);
INSERT INTO `sys_role_permission` VALUES ('0f861cb988fdc639bb1ab943471f3a72', 'f6817f48af4fb3af11b9e8bf182f618b', '97c8629abc7848eccdb6d77c24bb3ebb', NULL);
INSERT INTO `sys_role_permission` VALUES ('115a6673ae6c0816d3f60de221520274', '21c5a3187763729408b40afb0d0fdfa8', '63b551e81c5956d5c861593d366d8c57', NULL);
INSERT INTO `sys_role_permission` VALUES ('1185039870491439105', 'f6817f48af4fb3af11b9e8bf182f618b', '1174506953255182338', NULL);
INSERT INTO `sys_role_permission` VALUES ('1185039870529187841', 'f6817f48af4fb3af11b9e8bf182f618b', '1174590283938041857', NULL);
INSERT INTO `sys_role_permission` VALUES ('1185039870537576450', 'f6817f48af4fb3af11b9e8bf182f618b', '1166535831146504193', NULL);
INSERT INTO `sys_role_permission` VALUES ('1197431682208206850', 'f6817f48af4fb3af11b9e8bf182f618b', '1192318987661234177', NULL);
INSERT INTO `sys_role_permission` VALUES ('1197795315916271617', 'f6817f48af4fb3af11b9e8bf182f618b', '109c78a583d4693ce2f16551b7786786', NULL);
INSERT INTO `sys_role_permission` VALUES ('1197795316268593154', 'f6817f48af4fb3af11b9e8bf182f618b', '9fe26464838de2ea5e90f2367e35efa0', NULL);
INSERT INTO `sys_role_permission` VALUES ('1209423530594258945', 'f6817f48af4fb3af11b9e8bf182f618b', '1205098241075453953', NULL);
INSERT INTO `sys_role_permission` VALUES ('1209423530606841858', 'f6817f48af4fb3af11b9e8bf182f618b', '1205306106780364802', NULL);
INSERT INTO `sys_role_permission` VALUES ('1209423580355481602', 'f6817f48af4fb3af11b9e8bf182f618b', '190c2b43bec6a5f7a4194a85db67d96a', NULL);
INSERT INTO `sys_role_permission` VALUES ('1209654501558046722', 'f6817f48af4fb3af11b9e8bf182f618b', 'f2849d3814fc97993bfc519ae6bbf049', NULL);
INSERT INTO `sys_role_permission` VALUES ('1211980905558761474', 'f6817f48af4fb3af11b9e8bf182f618b', 'b6bcee2ccc854052d3cc3e9c96d90197', NULL);
INSERT INTO `sys_role_permission` VALUES ('1211980905575538689', 'f6817f48af4fb3af11b9e8bf182f618b', '277bfabef7d76e89b33062b16a9a5020', NULL);
INSERT INTO `sys_role_permission` VALUES ('1211980905583927298', 'f6817f48af4fb3af11b9e8bf182f618b', 'e8af452d8948ea49d37c934f5100ae6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('1211980905583927299', 'f6817f48af4fb3af11b9e8bf182f618b', '1170592628746878978', NULL);
INSERT INTO `sys_role_permission` VALUES ('1215901097649127426', 'f6817f48af4fb3af11b9e8bf182f618b', '1215900708711317505', NULL);
INSERT INTO `sys_role_permission` VALUES ('1217425321430462466', 'f6817f48af4fb3af11b9e8bf182f618b', '1217423939243716609', NULL);
INSERT INTO `sys_role_permission` VALUES ('1224554539800899585', 'f6817f48af4fb3af11b9e8bf182f618b', '1224551950770286594', NULL);
INSERT INTO `sys_role_permission` VALUES ('1225323260869980161', 'f6817f48af4fb3af11b9e8bf182f618b', '1225322514535526401', NULL);
INSERT INTO `sys_role_permission` VALUES ('1226742420149637121', 'f6817f48af4fb3af11b9e8bf182f618b', '1226742351191085057', NULL);
INSERT INTO `sys_role_permission` VALUES ('1227800992325324801', 'f6817f48af4fb3af11b9e8bf182f618b', '1227800507895795714', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229386602844581889', 'f6817f48af4fb3af11b9e8bf182f618b', '1229386544170463234', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190372970498', '1229390949611532289', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190372970499', '1229390949611532289', '1215930592020021249', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190381359105', '1229390949611532289', '1226742351191085057', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190381359106', '1229390949611532289', '1229385179356524546', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190381359107', '1229390949611532289', '1225317030227193857', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190381359108', '1229390949611532289', '1215900708711317505', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190389747713', '1229390949611532289', '1229370764649377793', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190389747714', '1229390949611532289', '1225322514535526401', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190389747715', '1229390949611532289', '1224551950770286594', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229391190389747716', '1229390949611532289', '1227800507895795714', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413232921079809', '1229390949611532289', '1229413129707646978', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413232929468418', '1229390949611532289', '1229412900254052354', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413232929468419', '1229390949611532289', '1229412733945704449', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413232929468420', '1229390949611532289', '1229412147451981826', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413277238095873', 'f6817f48af4fb3af11b9e8bf182f618b', '1229413129707646978', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413277238095874', 'f6817f48af4fb3af11b9e8bf182f618b', '1229412900254052354', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413277246484481', 'f6817f48af4fb3af11b9e8bf182f618b', '1229412733945704449', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229413277246484482', 'f6817f48af4fb3af11b9e8bf182f618b', '1229412147451981826', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229418777321222145', '1229390949611532289', '1229418728340140034', NULL);
INSERT INTO `sys_role_permission` VALUES ('1229418824054157314', 'f6817f48af4fb3af11b9e8bf182f618b', '1229418728340140034', NULL);
INSERT INTO `sys_role_permission` VALUES ('1231119549868126210', 'f6817f48af4fb3af11b9e8bf182f618b', '1230315167501037569', NULL);
INSERT INTO `sys_role_permission` VALUES ('1247095829994209282', '1229390949611532289', '1247095503509585921', NULL);
INSERT INTO `sys_role_permission` VALUES ('1247095860352581633', 'f6817f48af4fb3af11b9e8bf182f618b', '1247095503509585921', NULL);
INSERT INTO `sys_role_permission` VALUES ('1262634491494293506', 'f6817f48af4fb3af11b9e8bf182f618b', '1262581891625410562', NULL);
INSERT INTO `sys_role_permission` VALUES ('1267420497347149826', 'f6817f48af4fb3af11b9e8bf182f618b', '1267420424781496322', NULL);
INSERT INTO `sys_role_permission` VALUES ('126ea9faebeec2b914d6d9bef957afb6', 'f6817f48af4fb3af11b9e8bf182f618b', 'f1cb187abf927c88b89470d08615f5ac', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549103788033', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204134411186177', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549120565250', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204378955886593', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549120565251', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204572820811778', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549128953858', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204731692658690', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549128953859', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204662306287617', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549137342466', 'f6817f48af4fb3af11b9e8bf182f618b', '1291205014791401473', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549141536770', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204807089467394', NULL);
INSERT INTO `sys_role_permission` VALUES ('1291205549141536771', 'f6817f48af4fb3af11b9e8bf182f618b', '1291204950886985729', NULL);
INSERT INTO `sys_role_permission` VALUES ('1292728674031292417', 'f6817f48af4fb3af11b9e8bf182f618b', '1291205123105107970', NULL);
INSERT INTO `sys_role_permission` VALUES ('1292728674039681025', 'f6817f48af4fb3af11b9e8bf182f618b', '1291205328424677377', NULL);
INSERT INTO `sys_role_permission` VALUES ('1292728674048069634', 'f6817f48af4fb3af11b9e8bf182f618b', '1292724953335500802', NULL);
INSERT INTO `sys_role_permission` VALUES ('1292728674052263937', 'f6817f48af4fb3af11b9e8bf182f618b', '1291205405453070337', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850434', '1223526121789505538', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850435', '1223526121789505538', '1291204134411186177', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850436', '1223526121789505538', '1291204378955886593', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850437', '1223526121789505538', '1291204572820811778', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850438', '1223526121789505538', '1291204662306287617', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850439', '1223526121789505538', '1291204731692658690', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850440', '1223526121789505538', '1291204807089467394', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850441', '1223526121789505538', '1291204950886985729', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850442', '1223526121789505538', '1291205123105107970', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850443', '1223526121789505538', '1291205014791401473', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850444', '1223526121789505538', '1291205328424677377', NULL);
INSERT INTO `sys_role_permission` VALUES ('1301117646040850445', '1223526121789505538', '1291205405453070337', NULL);
INSERT INTO `sys_role_permission` VALUES ('1310262451320655874', 'f6817f48af4fb3af11b9e8bf182f618b', '1310261903561330689', NULL);
INSERT INTO `sys_role_permission` VALUES ('1310262478415859714', '1223526121789505538', '1310261903561330689', NULL);
INSERT INTO `sys_role_permission` VALUES ('1310589247487283201', 'f6817f48af4fb3af11b9e8bf182f618b', '1310589193103937537', '1310590190614286338');
INSERT INTO `sys_role_permission` VALUES ('1310589285500260353', '1223526121789505538', '1310589193103937537', NULL);
INSERT INTO `sys_role_permission` VALUES ('1311321167011618817', 'f6817f48af4fb3af11b9e8bf182f618b', '1311321017539207170', NULL);
INSERT INTO `sys_role_permission` VALUES ('1313159566250332162', 'f6817f48af4fb3af11b9e8bf182f618b', '1313159165455224834', NULL);
INSERT INTO `sys_role_permission` VALUES ('1313159589998481410', '1223526121789505538', '1313159165455224834', '1314101006769901570');
INSERT INTO `sys_role_permission` VALUES ('1313160290707296258', 'f6817f48af4fb3af11b9e8bf182f618b', '1313160246507720706', NULL);
INSERT INTO `sys_role_permission` VALUES ('1313160326539235330', '1223526121789505538', '1313160246507720706', NULL);
INSERT INTO `sys_role_permission` VALUES ('1322927875328622594', '1223526121789505538', '1322927829560377346', NULL);
INSERT INTO `sys_role_permission` VALUES ('1322927908010639362', 'f6817f48af4fb3af11b9e8bf182f618b', '1322927829560377346', NULL);
INSERT INTO `sys_role_permission` VALUES ('1322949438350352385', 'f6817f48af4fb3af11b9e8bf182f618b', '1322949230031855617', NULL);
INSERT INTO `sys_role_permission` VALUES ('1329255023735877634', 'f6817f48af4fb3af11b9e8bf182f618b', '1329254896572968961', NULL);
INSERT INTO `sys_role_permission` VALUES ('1329268768424030210', 'f6817f48af4fb3af11b9e8bf182f618b', '1329268722009862146', NULL);
INSERT INTO `sys_role_permission` VALUES ('1329391948392235009', 'f6817f48af4fb3af11b9e8bf182f618b', '1329391893849505793', NULL);
INSERT INTO `sys_role_permission` VALUES ('1329694319261483009', 'f6817f48af4fb3af11b9e8bf182f618b', '1329694194128617473', NULL);
INSERT INTO `sys_role_permission` VALUES ('1329698057153904642', 'f6817f48af4fb3af11b9e8bf182f618b', '1329697939054886913', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330786866952036353', 'f6817f48af4fb3af11b9e8bf182f618b', '1330785803343650817', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330835734603472897', '1330799294465064962', '1329694194128617473', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330835734620250113', '1330799294465064962', '1329697939054886913', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330835734620250114', '1330799294465064962', '1330785803343650817', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330838174694350849', '1330799294465064962', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330839384386146306', '1330839279285276673', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330839384398729217', '1330839279285276673', '1329694194128617473', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330839384402923521', '1330839279285276673', '1329697939054886913', NULL);
INSERT INTO `sys_role_permission` VALUES ('1330839384402923522', '1330839279285276673', '1330785803343650817', NULL);
INSERT INTO `sys_role_permission` VALUES ('154edd0599bd1dc2c7de220b489cd1e2', 'f6817f48af4fb3af11b9e8bf182f618b', '7ac9eb9ccbde2f7a033cd4944272bf1e', NULL);
INSERT INTO `sys_role_permission` VALUES ('165acd6046a0eaf975099f46a3c898ea', 'f6817f48af4fb3af11b9e8bf182f618b', '4f66409ef3bbd69c1d80469d6e2a885e', NULL);
INSERT INTO `sys_role_permission` VALUES ('1664b92dff13e1575e3a929caa2fa14d', 'f6817f48af4fb3af11b9e8bf182f618b', 'd2bbf9ebca5a8fa2e227af97d2da7548', NULL);
INSERT INTO `sys_role_permission` VALUES ('17ead5b7d97ed365398ab20009a69ea3', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e08cb190ef230d5d4f03824198773950', NULL);
INSERT INTO `sys_role_permission` VALUES ('1ac1688ef8456f384091a03d88a89ab1', '52b0cf022ac4187b2a70dfa4f8b2d940', '693ce69af3432bd00be13c3971a57961', NULL);
INSERT INTO `sys_role_permission` VALUES ('1c1dbba68ef1817e7fb19c822d2854e8', 'f6817f48af4fb3af11b9e8bf182f618b', 'fb367426764077dcf94640c843733985', NULL);
INSERT INTO `sys_role_permission` VALUES ('1fe4d408b85f19618c15bcb768f0ec22', '1750a8fb3e6d90cb7957c02de1dc8e59', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('20e53c87a785688bdc0a5bb6de394ef1', 'f6817f48af4fb3af11b9e8bf182f618b', '540a2936940846cb98114ffb0d145cb8', NULL);
INSERT INTO `sys_role_permission` VALUES ('248d288586c6ff3bd14381565df84163', '52b0cf022ac4187b2a70dfa4f8b2d940', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('25491ecbd5a9b34f09c8bc447a10ede1', 'f6817f48af4fb3af11b9e8bf182f618b', 'd07a2c87a451434c99ab06296727ec4f', NULL);
INSERT INTO `sys_role_permission` VALUES ('27489816708b18859768dfed5945c405', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('296f9c75ca0e172ae5ce4c1022c996df', '646c628b2b8295fbdab2d34044de0354', '732d48f8e0abe99fe6a23d18a3171cd1', NULL);
INSERT INTO `sys_role_permission` VALUES ('29fb6b0ad59a7e911c8d27e0bdc42d23', 'f6817f48af4fb3af11b9e8bf182f618b', '9a90363f216a6a08f32eecb3f0bf12a3', NULL);
INSERT INTO `sys_role_permission` VALUES ('2ad37346c1b83ddeebc008f6987b2227', 'f6817f48af4fb3af11b9e8bf182f618b', '8d1ebd663688965f1fd86a2f0ead3416', NULL);
INSERT INTO `sys_role_permission` VALUES ('2c462293cbb0eab7e8ae0a3600361b5f', '52b0cf022ac4187b2a70dfa4f8b2d940', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('2fdaed22dfa4c8d4629e44ef81688c6a', '52b0cf022ac4187b2a70dfa4f8b2d940', 'aedbf679b5773c1f25e9f7b10111da73', NULL);
INSERT INTO `sys_role_permission` VALUES ('300c462b7fec09e2ff32574ef8b3f0bd', '52b0cf022ac4187b2a70dfa4f8b2d940', '2a470fc0c3954d9dbb61de6d80846549', NULL);
INSERT INTO `sys_role_permission` VALUES ('35ac7cae648de39eb56213ca1b649713', '52b0cf022ac4187b2a70dfa4f8b2d940', 'b1cb0a3fedf7ed0e4653cb5a229837ee', NULL);
INSERT INTO `sys_role_permission` VALUES ('38a2e55db0960262800576e34b3af44c', 'f6817f48af4fb3af11b9e8bf182f618b', '5c2f42277948043026b7a14692456828', NULL);
INSERT INTO `sys_role_permission` VALUES ('3b1886f727ac503c93fecdd06dcb9622', 'f6817f48af4fb3af11b9e8bf182f618b', 'c431130c0bc0ec71b0a5be37747bb36a', NULL);
INSERT INTO `sys_role_permission` VALUES ('3e4e38f748b8d87178dd62082e5b7b60', 'f6817f48af4fb3af11b9e8bf182f618b', '7960961b0063228937da5fa8dd73d371', NULL);
INSERT INTO `sys_role_permission` VALUES ('3e563751942b0879c88ca4de19757b50', '1750a8fb3e6d90cb7957c02de1dc8e59', '58857ff846e61794c69208e9d3a85466', NULL);
INSERT INTO `sys_role_permission` VALUES ('3f1d04075e3c3254666a4138106a4e51', 'f6817f48af4fb3af11b9e8bf182f618b', '3fac0d3c9cd40fa53ab70d4c583821f8', NULL);
INSERT INTO `sys_role_permission` VALUES ('412e2de37a35b3442d68db8dd2f3c190', '52b0cf022ac4187b2a70dfa4f8b2d940', 'f1cb187abf927c88b89470d08615f5ac', NULL);
INSERT INTO `sys_role_permission` VALUES ('4204f91fb61911ba8ce40afa7c02369f', 'f6817f48af4fb3af11b9e8bf182f618b', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('439568ff7db6f329bf6dd45b3dfc9456', 'f6817f48af4fb3af11b9e8bf182f618b', '7593c9e3523a17bca83b8d7fe8a34e58', NULL);
INSERT INTO `sys_role_permission` VALUES ('444126230885d5d38b8fa6072c9f43f8', 'f6817f48af4fb3af11b9e8bf182f618b', 'f780d0d3083d849ccbdb1b1baee4911d', NULL);
INSERT INTO `sys_role_permission` VALUES ('445656dd187bd8a71605f4bbab1938a3', 'f6817f48af4fb3af11b9e8bf182f618b', '020b06793e4de2eee0007f603000c769', NULL);
INSERT INTO `sys_role_permission` VALUES ('455cdb482457f529b79b479a2ff74427', 'f6817f48af4fb3af11b9e8bf182f618b', 'e1979bb53e9ea51cecc74d86fd9d2f64', NULL);
INSERT INTO `sys_role_permission` VALUES ('45a358bb738782d1a0edbf7485e81459', 'f6817f48af4fb3af11b9e8bf182f618b', '0ac2ad938963b6c6d1af25477d5b8b51', NULL);
INSERT INTO `sys_role_permission` VALUES ('4e0a37ed49524df5f08fc6593aee875c', 'f6817f48af4fb3af11b9e8bf182f618b', 'f23d9bfff4d9aa6b68569ba2cff38415', NULL);
INSERT INTO `sys_role_permission` VALUES ('4ea403fc1d19feb871c8bdd9f94a4ecc', 'f6817f48af4fb3af11b9e8bf182f618b', '2e42e3835c2b44ec9f7bc26c146ee531', NULL);
INSERT INTO `sys_role_permission` VALUES ('4f2fd4a190db856e21476de2704bbd99', 'f6817f48af4fb3af11b9e8bf182f618b', '1a0811914300741f4e11838ff37a1d3a', NULL);
INSERT INTO `sys_role_permission` VALUES ('4faad8ff93cb2b5607cd3d07c1b624ee', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '70b8f33da5f39de1981bf89cf6c99792', NULL);
INSERT INTO `sys_role_permission` VALUES ('520b5989e6fe4a302a573d4fee12a40a', 'f6817f48af4fb3af11b9e8bf182f618b', '6531cf3421b1265aeeeabaab5e176e6d', NULL);
INSERT INTO `sys_role_permission` VALUES ('54fdf85e52807bdb32ce450814abc256', 'f6817f48af4fb3af11b9e8bf182f618b', 'cc50656cf9ca528e6f2150eba4714ad2', NULL);
INSERT INTO `sys_role_permission` VALUES ('57c0b3a547b815ea3ec8e509b08948b3', '1750a8fb3e6d90cb7957c02de1dc8e59', '3f915b2769fc80648e92d04e84ca059d', NULL);
INSERT INTO `sys_role_permission` VALUES ('593ee05c4fe4645c7826b7d5e14f23ec', '52b0cf022ac4187b2a70dfa4f8b2d940', '8fb8172747a78756c11916216b8b8066', NULL);
INSERT INTO `sys_role_permission` VALUES ('5d230e6cd2935c4117f6cb9a7a749e39', 'f6817f48af4fb3af11b9e8bf182f618b', 'fc810a2267dd183e4ef7c71cc60f4670', NULL);
INSERT INTO `sys_role_permission` VALUES ('5e4015a9a641cbf3fb5d28d9f885d81a', 'f6817f48af4fb3af11b9e8bf182f618b', '2dbbafa22cda07fa5d169d741b81fe12', NULL);
INSERT INTO `sys_role_permission` VALUES ('5fc194b709336d354640fe29fefd65a3', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '9ba60e626bf2882c31c488aba62b89f0', NULL);
INSERT INTO `sys_role_permission` VALUES ('60eda4b4db138bdb47edbe8e10e71675', 'f6817f48af4fb3af11b9e8bf182f618b', 'fb07ca05a3e13674dbf6d3245956da2e', NULL);
INSERT INTO `sys_role_permission` VALUES ('660fbc40bcb1044738f7cabdf1708c28', 'f6817f48af4fb3af11b9e8bf182f618b', 'b3c824fc22bd953e2eb16ae6914ac8f9', NULL);
INSERT INTO `sys_role_permission` VALUES ('66b202f8f84fe766176b3f51071836ef', 'f6817f48af4fb3af11b9e8bf182f618b', '1367a93f2c410b169faa7abcbad2f77c', NULL);
INSERT INTO `sys_role_permission` VALUES ('6b605c261ffbc8ac8a98ae33579c8c78', 'f6817f48af4fb3af11b9e8bf182f618b', 'fba41089766888023411a978d13c0aa4', NULL);
INSERT INTO `sys_role_permission` VALUES ('6c74518eb6bb9a353f6a6c459c77e64b', 'f6817f48af4fb3af11b9e8bf182f618b', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559', NULL);
INSERT INTO `sys_role_permission` VALUES ('6fb4c2142498dd6d5b6c014ef985cb66', 'f6817f48af4fb3af11b9e8bf182f618b', '6e73eb3c26099c191bf03852ee1310a1', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588591820806', '16457350655250432', '5129710648430592', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588604403712', '16457350655250432', '5129710648430593', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588612792320', '16457350655250432', '40238597734928384', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588625375232', '16457350655250432', '57009744761589760', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588633763840', '16457350655250432', '16392452747300864', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588637958144', '16457350655250432', '16392767785668608', NULL);
INSERT INTO `sys_role_permission` VALUES ('75002588650541056', '16457350655250432', '16439068543946752', NULL);
INSERT INTO `sys_role_permission` VALUES ('76a54a8cc609754360bf9f57e7dbb2db', 'f6817f48af4fb3af11b9e8bf182f618b', 'c65321e57b7949b7a975313220de0422', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277779875336192', '496138616573952', '5129710648430592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780043108352', '496138616573952', '5129710648430593', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780055691264', '496138616573952', '15701400130424832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780064079872', '496138616573952', '16678126574637056', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780072468480', '496138616573952', '15701915807518720', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780076662784', '496138616573952', '15708892205944832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780085051392', '496138616573952', '16678447719911424', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780089245696', '496138616573952', '25014528525733888', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780097634304', '496138616573952', '56898976661639168', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780135383040', '496138616573952', '40238597734928384', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780139577344', '496138616573952', '45235621697949696', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780147965952', '496138616573952', '45235787867885568', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780156354560', '496138616573952', '45235939278065664', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780164743168', '496138616573952', '43117268627886080', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780168937472', '496138616573952', '45236734832676864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780181520384', '496138616573952', '45237010692050944', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780189908992', '496138616573952', '45237170029465600', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780198297600', '496138616573952', '57009544286441472', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780206686208', '496138616573952', '57009744761589760', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780215074816', '496138616573952', '57009981228060672', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780219269120', '496138616573952', '56309618086776832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780227657728', '496138616573952', '57212882168844288', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780236046336', '496138616573952', '61560041605435392', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780244434944', '496138616573952', '61560275261722624', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780257017856', '496138616573952', '61560480518377472', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780265406464', '496138616573952', '44986029924421632', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780324126720', '496138616573952', '45235228800716800', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780332515328', '496138616573952', '45069342940860416', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780340903937', '496138616573952', '5129710648430594', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780349292544', '496138616573952', '16687383932047360', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780357681152', '496138616573952', '16689632049631232', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780366069760', '496138616573952', '16689745006432256', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780370264064', '496138616573952', '16689883993083904', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780374458369', '496138616573952', '16690313745666048', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780387041280', '496138616573952', '5129710648430595', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780395429888', '496138616573952', '16694861252005888', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780403818496', '496138616573952', '16695107491205120', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780412207104', '496138616573952', '16695243126607872', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780420595712', '496138616573952', '75002207560273920', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780428984320', '496138616573952', '76215889006956544', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780433178624', '496138616573952', '76216071333351424', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780441567232', '496138616573952', '76216264070008832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780449955840', '496138616573952', '76216459709124608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780458344448', '496138616573952', '76216594207870976', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780466733056', '496138616573952', '76216702639017984', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780475121664', '496138616573952', '58480609315524608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780483510272', '496138616573952', '61394706252173312', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780491898880', '496138616573952', '61417744146370560', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780496093184', '496138616573952', '76606430504816640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780504481792', '496138616573952', '76914082455752704', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780508676097', '496138616573952', '76607201262702592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780517064704', '496138616573952', '39915540965232640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780525453312', '496138616573952', '41370251991977984', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780538036224', '496138616573952', '45264987354042368', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780546424832', '496138616573952', '45265487029866496', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780554813440', '496138616573952', '45265762415284224', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780559007744', '496138616573952', '45265886315024384', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780567396352', '496138616573952', '45266070000373760', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780571590656', '496138616573952', '41363147411427328', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780579979264', '496138616573952', '41363537456533504', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780588367872', '496138616573952', '41364927394353152', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780596756480', '496138616573952', '41371711400054784', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780605145088', '496138616573952', '41469219249852416', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780613533696', '496138616573952', '39916171171991552', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780621922304', '496138616573952', '39918482854252544', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780630310912', '496138616573952', '41373430515240960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780718391296', '496138616573952', '41375330996326400', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780722585600', '496138616573952', '63741744973352960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780730974208', '496138616573952', '42082442672082944', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780739362816', '496138616573952', '41376192166629376', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780747751424', '496138616573952', '41377034236071936', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780756140032', '496138616573952', '56911328312299520', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780764528640', '496138616573952', '41378916912336896', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780768722944', '496138616573952', '63482475359244288', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780772917249', '496138616573952', '64290663792906240', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780785500160', '496138616573952', '66790433014943744', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780789694464', '496138616573952', '42087054753927168', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780798083072', '496138616573952', '67027338952445952', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780806471680', '496138616573952', '67027909637836800', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780810665985', '496138616573952', '67042515441684480', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780823248896', '496138616573952', '67082402312228864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780827443200', '496138616573952', '16392452747300864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780835831808', '496138616573952', '16392767785668608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780840026112', '496138616573952', '16438800255291392', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780844220417', '496138616573952', '16438962738434048', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277780852609024', '496138616573952', '16439068543946752', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860062040064', '496138616573953', '5129710648430592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860070428672', '496138616573953', '5129710648430593', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860078817280', '496138616573953', '40238597734928384', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860091400192', '496138616573953', '43117268627886080', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860099788800', '496138616573953', '57009744761589760', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860112371712', '496138616573953', '56309618086776832', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860120760320', '496138616573953', '44986029924421632', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860129148928', '496138616573953', '5129710648430594', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860141731840', '496138616573953', '5129710648430595', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860150120448', '496138616573953', '75002207560273920', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860158509056', '496138616573953', '58480609315524608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860162703360', '496138616573953', '76606430504816640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860171091968', '496138616573953', '76914082455752704', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860179480576', '496138616573953', '76607201262702592', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860187869184', '496138616573953', '39915540965232640', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860196257792', '496138616573953', '41370251991977984', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860204646400', '496138616573953', '41363147411427328', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860208840704', '496138616573953', '41371711400054784', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860213035009', '496138616573953', '39916171171991552', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860221423616', '496138616573953', '39918482854252544', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860225617920', '496138616573953', '41373430515240960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860234006528', '496138616573953', '41375330996326400', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860242395136', '496138616573953', '63741744973352960', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860250783744', '496138616573953', '42082442672082944', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860254978048', '496138616573953', '41376192166629376', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860263366656', '496138616573953', '41377034236071936', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860271755264', '496138616573953', '56911328312299520', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860313698304', '496138616573953', '41378916912336896', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860322086912', '496138616573953', '63482475359244288', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860326281216', '496138616573953', '64290663792906240', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860334669824', '496138616573953', '66790433014943744', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860343058432', '496138616573953', '42087054753927168', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860347252736', '496138616573953', '67027338952445952', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860351447041', '496138616573953', '67027909637836800', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860359835648', '496138616573953', '67042515441684480', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860364029952', '496138616573953', '67082402312228864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860368224256', '496138616573953', '16392452747300864', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860372418560', '496138616573953', '16392767785668608', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860376612865', '496138616573953', '16438800255291392', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860385001472', '496138616573953', '16438962738434048', NULL);
INSERT INTO `sys_role_permission` VALUES ('77277860389195776', '496138616573953', '16439068543946752', NULL);
INSERT INTO `sys_role_permission` VALUES ('7a5d31ba48fe3fb1266bf186dc5f7ba7', '52b0cf022ac4187b2a70dfa4f8b2d940', '58857ff846e61794c69208e9d3a85466', NULL);
INSERT INTO `sys_role_permission` VALUES ('7a6bca9276c128309c80d21e795c66c6', 'f6817f48af4fb3af11b9e8bf182f618b', '54097c6a3cf50fad0793a34beff1efdf', NULL);
INSERT INTO `sys_role_permission` VALUES ('7ca833caa5eac837b7200d8b6de8b2e3', 'f6817f48af4fb3af11b9e8bf182f618b', 'fedfbf4420536cacc0218557d263dfea', NULL);
INSERT INTO `sys_role_permission` VALUES ('7de42bdc0b8c5446b7d428c66a7abc12', '52b0cf022ac4187b2a70dfa4f8b2d940', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('7e19d90cec0dd87aaef351b9ff8f4902', '646c628b2b8295fbdab2d34044de0354', 'f9d3f4f27653a71c52faa9fb8070fbe7', NULL);
INSERT INTO `sys_role_permission` VALUES ('884f147c20e003cc80ed5b7efa598cbe', 'f6817f48af4fb3af11b9e8bf182f618b', 'e5973686ed495c379d829ea8b2881fc6', NULL);
INSERT INTO `sys_role_permission` VALUES ('8a60df8d8b4c9ee5fa63f48aeee3ec00', '1750a8fb3e6d90cb7957c02de1dc8e59', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('8b09925bdc194ab7f3559cd3a7ea0507', 'f6817f48af4fb3af11b9e8bf182f618b', 'ebb9d82ea16ad864071158e0c449d186', NULL);
INSERT INTO `sys_role_permission` VALUES ('8ce1022dac4e558ff9694600515cf510', '1750a8fb3e6d90cb7957c02de1dc8e59', '08e6b9dc3c04489c8e1ff2ce6f105aa4', NULL);
INSERT INTO `sys_role_permission` VALUES ('8d154c2382a8ae5c8d1b84bd38df2a93', 'f6817f48af4fb3af11b9e8bf182f618b', 'd86f58e7ab516d3bc6bfb1fe10585f97', NULL);
INSERT INTO `sys_role_permission` VALUES ('8d848ca7feec5b7ebb3ecb32b2c8857a', '52b0cf022ac4187b2a70dfa4f8b2d940', '4148ec82b6acd69f470bea75fe41c357', NULL);
INSERT INTO `sys_role_permission` VALUES ('8dd64f65a1014196078d0882f767cd85', 'f6817f48af4fb3af11b9e8bf182f618b', 'e3c13679c73a4f829bcff2aba8fd68b1', NULL);
INSERT INTO `sys_role_permission` VALUES ('8e3dc1671abad4f3c83883b194d2e05a', 'f6817f48af4fb3af11b9e8bf182f618b', 'b1cb0a3fedf7ed0e4653cb5a229837ee', NULL);
INSERT INTO `sys_role_permission` VALUES ('905bf419332ebcb83863603b3ebe30f0', 'f6817f48af4fb3af11b9e8bf182f618b', '8fb8172747a78756c11916216b8b8066', NULL);
INSERT INTO `sys_role_permission` VALUES ('9264104cee9b10c96241d527b2d0346d', '1750a8fb3e6d90cb7957c02de1dc8e59', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('9380121ca9cfee4b372194630fce150e', 'f6817f48af4fb3af11b9e8bf182f618b', '65a8f489f25a345836b7f44b1181197a', NULL);
INSERT INTO `sys_role_permission` VALUES ('94911fef73a590f6824105ebf9b6cab3', 'f6817f48af4fb3af11b9e8bf182f618b', '8b3bff2eee6f1939147f5c68292a1642', NULL);
INSERT INTO `sys_role_permission` VALUES ('9700d20dbc1ae3cbf7de1c810b521fe6', 'f6817f48af4fb3af11b9e8bf182f618b', 'ec8d607d0156e198b11853760319c646', NULL);
INSERT INTO `sys_role_permission` VALUES ('980171fda43adfe24840959b1d048d4d', 'f6817f48af4fb3af11b9e8bf182f618b', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL);
INSERT INTO `sys_role_permission` VALUES ('987c23b70873bd1d6dca52f30aafd8c2', 'f6817f48af4fb3af11b9e8bf182f618b', '00a2a0ae65cdca5e93209cdbde97cbe6', NULL);
INSERT INTO `sys_role_permission` VALUES ('9b2ad767f9861e64a20b097538feafd3', 'f6817f48af4fb3af11b9e8bf182f618b', '73678f9daa45ed17a3674131b03432fb', NULL);
INSERT INTO `sys_role_permission` VALUES ('9d8772c310b675ae43eacdbc6c7fa04a', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '1663f3faba244d16c94552f849627d84', NULL);
INSERT INTO `sys_role_permission` VALUES ('9d980ec0489040e631a9c24a6af42934', 'f6817f48af4fb3af11b9e8bf182f618b', '05b3c82ddb2536a4a5ee1a4c46b5abef', NULL);
INSERT INTO `sys_role_permission` VALUES ('9f8311ecccd44e079723098cf2ffe1cc', '1750a8fb3e6d90cb7957c02de1dc8e59', '693ce69af3432bd00be13c3971a57961', NULL);
INSERT INTO `sys_role_permission` VALUES ('a307a9349ad64a2eff8ab69582fa9be4', 'f6817f48af4fb3af11b9e8bf182f618b', '0620e402857b8c5b605e1ad9f4b89350', NULL);
INSERT INTO `sys_role_permission` VALUES ('a5d25fdb3c62904a8474182706ce11a0', 'f6817f48af4fb3af11b9e8bf182f618b', '418964ba087b90a84897b62474496b93', NULL);
INSERT INTO `sys_role_permission` VALUES ('ae1852fb349d8513eb3fdc173da3ee56', 'f6817f48af4fb3af11b9e8bf182f618b', '8d4683aacaa997ab86b966b464360338', NULL);
INSERT INTO `sys_role_permission` VALUES ('aefc8c22e061171806e59cd222f6b7e1', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e8af452d8948ea49d37c934f5100ae6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('af60ac8fafd807ed6b6b354613b9ccbc', 'f6817f48af4fb3af11b9e8bf182f618b', '58857ff846e61794c69208e9d3a85466', NULL);
INSERT INTO `sys_role_permission` VALUES ('b0c8a20800b8bf1ebdd7be473bceb44f', 'f6817f48af4fb3af11b9e8bf182f618b', '58b9204feaf07e47284ddb36cd2d8468', NULL);
INSERT INTO `sys_role_permission` VALUES ('b128ebe78fa5abb54a3a82c6689bdca3', 'f6817f48af4fb3af11b9e8bf182f618b', 'aedbf679b5773c1f25e9f7b10111da73', NULL);
INSERT INTO `sys_role_permission` VALUES ('b21b07951bb547b09cc85624a841aea0', 'f6817f48af4fb3af11b9e8bf182f618b', '4356a1a67b564f0988a484f5531fd4d9', NULL);
INSERT INTO `sys_role_permission` VALUES ('b64c4ab9cd9a2ea8ac1e9db5fb7cf522', 'f6817f48af4fb3af11b9e8bf182f618b', '2aeddae571695cd6380f6d6d334d6e7d', NULL);
INSERT INTO `sys_role_permission` VALUES ('bbec16ad016efec9ea2def38f4d3d9dc', 'f6817f48af4fb3af11b9e8bf182f618b', '13212d3416eb690c2e1d5033166ff47a', NULL);
INSERT INTO `sys_role_permission` VALUES ('be8e5a9080569e59863f20c4c57a8e22', 'f6817f48af4fb3af11b9e8bf182f618b', '22d6a3d39a59dd7ea9a30acfa6bfb0a5', NULL);
INSERT INTO `sys_role_permission` VALUES ('bea2986432079d89203da888d99b3f16', 'f6817f48af4fb3af11b9e8bf182f618b', '54dd5457a3190740005c1bfec55b1c34', NULL);
INSERT INTO `sys_role_permission` VALUES ('c09373ebfc73fb5740db5ff02cba4f91', 'f6817f48af4fb3af11b9e8bf182f618b', '339329ed54cf255e1f9392e84f136901', NULL);
INSERT INTO `sys_role_permission` VALUES ('c56fb1658ee5f7476380786bf5905399', 'f6817f48af4fb3af11b9e8bf182f618b', 'de13e0f6328c069748de7399fcc1dbbd', NULL);
INSERT INTO `sys_role_permission` VALUES ('c6fee38d293b9d0596436a0cbd205070', 'f6817f48af4fb3af11b9e8bf182f618b', '4f84f9400e5e92c95f05b554724c2b58', NULL);
INSERT INTO `sys_role_permission` VALUES ('c90b0b01c7ca454d2a1cb7408563e696', 'f6817f48af4fb3af11b9e8bf182f618b', '882a73768cfd7f78f3a37584f7299656', NULL);
INSERT INTO `sys_role_permission` VALUES ('cf2ef620217673e4042f695743294f01', 'f6817f48af4fb3af11b9e8bf182f618b', '717f6bee46f44a3897eca9abd6e2ec44', NULL);
INSERT INTO `sys_role_permission` VALUES ('cf43895aef7fc684669483ab00ef2257', 'f6817f48af4fb3af11b9e8bf182f618b', '700b7f95165c46cc7a78bf227aa8fed3', NULL);
INSERT INTO `sys_role_permission` VALUES ('d281a95b8f293d0fa2a136f46c4e0b10', 'f6817f48af4fb3af11b9e8bf182f618b', '5c8042bd6c601270b2bbd9b20bccc68b', NULL);
INSERT INTO `sys_role_permission` VALUES ('d37ad568e26f46ed0feca227aa9c2ffa', 'f6817f48af4fb3af11b9e8bf182f618b', '9502685863ab87f0ad1134142788a385', NULL);
INSERT INTO `sys_role_permission` VALUES ('d3ddcacee1acdfaa0810618b74e38ef2', 'f6817f48af4fb3af11b9e8bf182f618b', 'c6cf95444d80435eb37b2f9db3971ae6', NULL);
INSERT INTO `sys_role_permission` VALUES ('d3fe195d59811531c05d31d8436f5c8b', '1750a8fb3e6d90cb7957c02de1dc8e59', 'e8af452d8948ea49d37c934f5100ae6a', NULL);
INSERT INTO `sys_role_permission` VALUES ('d83282192a69514cfe6161b3087ff962', 'f6817f48af4fb3af11b9e8bf182f618b', '53a9230444d33de28aa11cc108fb1dba', NULL);
INSERT INTO `sys_role_permission` VALUES ('d8a5c9079df12090e108e21be94b4fd7', 'f6817f48af4fb3af11b9e8bf182f618b', '078f9558cdeab239aecb2bda1a8ed0d1', NULL);
INSERT INTO `sys_role_permission` VALUES ('de8f43229e351d34af3c95b1b9f0a15d', 'f6817f48af4fb3af11b9e8bf182f618b', 'a400e4f4d54f79bf5ce160ae432231af', NULL);
INSERT INTO `sys_role_permission` VALUES ('e3e922673f4289b18366bb51b6200f17', '52b0cf022ac4187b2a70dfa4f8b2d940', '45c966826eeff4c99b8f8ebfe74511fc', NULL);
INSERT INTO `sys_role_permission` VALUES ('e7467726ee72235baaeb47df04a35e73', 'f6817f48af4fb3af11b9e8bf182f618b', 'e08cb190ef230d5d4f03824198773950', NULL);
INSERT INTO `sys_role_permission` VALUES ('eaef4486f1c9b0408580bbfa2037eb66', 'f6817f48af4fb3af11b9e8bf182f618b', '2a470fc0c3954d9dbb61de6d80846549', NULL);
INSERT INTO `sys_role_permission` VALUES ('ec4bc97829ab56afd83f428b6dc37ff6', 'f6817f48af4fb3af11b9e8bf182f618b', '200006f0edf145a2b50eacca07585451', NULL);
INSERT INTO `sys_role_permission` VALUES ('ec93bb06f5be4c1f19522ca78180e2ef', 'f6817f48af4fb3af11b9e8bf182f618b', '265de841c58907954b8877fb85212622', NULL);
INSERT INTO `sys_role_permission` VALUES ('ecdd72fe694e6bba9c1d9fc925ee79de', 'f6817f48af4fb3af11b9e8bf182f618b', '45c966826eeff4c99b8f8ebfe74511fc', NULL);
INSERT INTO `sys_role_permission` VALUES ('edefd8d468f5727db465cf1b860af474', 'f6817f48af4fb3af11b9e8bf182f618b', '6ad53fd1b220989a8b71ff482d683a5a', NULL);
INSERT INTO `sys_role_permission` VALUES ('ef8bdd20d29447681ec91d3603e80c7b', 'f6817f48af4fb3af11b9e8bf182f618b', 'ae4fed059f67086fd52a73d913cf473d', NULL);
INSERT INTO `sys_role_permission` VALUES ('f17ab8ad1e71341140857ef4914ef297', '21c5a3187763729408b40afb0d0fdfa8', '732d48f8e0abe99fe6a23d18a3171cd1', NULL);
INSERT INTO `sys_role_permission` VALUES ('f99f99cc3bc27220cdd4f5aced33b7d7', 'f6817f48af4fb3af11b9e8bf182f618b', '655563cd64b75dcf52ef7bcdd4836953', NULL);
INSERT INTO `sys_role_permission` VALUES ('fafe73c4448b977fe42880a6750c3ee8', 'f6817f48af4fb3af11b9e8bf182f618b', '9cb91b8851db0cf7b19d7ecc2a8193dd', NULL);
INSERT INTO `sys_role_permission` VALUES ('fced905c7598973b970d42d833f73474', 'f6817f48af4fb3af11b9e8bf182f618b', '4875ebe289344e14844d8e3ea1edd73f', NULL);
INSERT INTO `sys_role_permission` VALUES ('fd97963dc5f144d3aecfc7045a883427', 'f6817f48af4fb3af11b9e8bf182f618b', '043780fa095ff1b2bec4dc406d76f023', NULL);
INSERT INTO `sys_role_permission` VALUES ('fed41a4671285efb266cd404f24dd378', '52b0cf022ac4187b2a70dfa4f8b2d940', '00a2a0ae65cdca5e93209cdbde97cbe6', NULL);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `ES_TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消息标题',
  `ES_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发送方式：1短信 2邮件 3微信',
  `ES_RECEIVER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接收人',
  `ES_PARAM` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '发送所需参数Json格式',
  `ES_CONTENT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '推送内容',
  `ES_SEND_TIME` datetime(0) DEFAULT NULL COMMENT '推送时间',
  `ES_SEND_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `ES_SEND_NUM` decimal(11, 0) DEFAULT NULL COMMENT '发送次数 超过5次不再发送',
  `ES_RESULT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '推送失败原因',
  `REMARK` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人登录名称',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人登录名称',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_template`;
CREATE TABLE `sys_sms_template`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `TEMPLATE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板标题',
  `TEMPLATE_CODE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板CODE',
  `TEMPLATE_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板类型：1短信 2邮件 3微信',
  `TEMPLATE_CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板内容',
  `TEMPLATE_TEST_JSON` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板测试json',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人登录名称',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新日期',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人登录名称',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录账号',
  `REALNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `SALT` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'md5密码盐',
  `AVATAR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `BIRTHDAY` datetime(0) DEFAULT NULL COMMENT '生日',
  `SEX` decimal(4, 0) DEFAULT NULL COMMENT '性别(0-默认未知,1-男,2-女)',
  `EMAIL` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电子邮件',
  `PHONE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `ORG_CODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '机构编码',
  `STATUS` decimal(4, 0) DEFAULT NULL COMMENT '性别(1-正常,2-冻结)',
  `DEL_FLAG` decimal(4, 0) DEFAULT NULL COMMENT '删除状态(0-正常,1-已删除)',
  `ACTIVITI_SYNC` decimal(4, 0) DEFAULT NULL COMMENT '同步工作流引擎(1-同步,0-不同步)',
  `WORK_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工号，唯一键',
  `POST` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务，关联职务表',
  `TELEPHONE` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '座机号',
  `CREATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `company_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1215663519272435713', 'founder', '方正科技', '1311f545139f2d35', 'a3YKoKg8', NULL, NULL, NULL, NULL, NULL, 'A02A02', 1, 1, 1, '0001', NULL, NULL, 'admin', '2020-01-10 23:55:43', 'admin', '2020-01-15 11:02:12', NULL);
INSERT INTO `sys_user` VALUES ('1227792265186762753', 'test', '测试用户', 'd7240c8e3452ff51', 'zz0tuJzu', 'files/20200929/3_1601361906800.png', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 'test01', 'test', NULL, 'admin', '2020-02-13 11:11:01', 'admin', '2020-11-23 21:41:20', NULL);
INSERT INTO `sys_user` VALUES ('1229391780633178114', 'manager', '系统管理员', 'c00f9a0c9450a696', 'ShLTrkzN', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '003', NULL, NULL, 'admin', '2020-02-17 21:06:56', 'admin', '2020-09-04 11:25:02', NULL);
INSERT INTO `sys_user` VALUES ('1230179710779830273', 'lzsj', '泸州市公安局管理员', '9f8499d404c62cf4', 'u12tM5jR', NULL, NULL, NULL, NULL, NULL, '510500000000', 1, 1, 1, '004', NULL, NULL, 'admin', '2020-02-20 01:17:53', 'admin', '2020-02-20 01:18:10', NULL);
INSERT INTO `sys_user` VALUES ('1288714688777719810', 'callback', '外呼系统信息采集', '39ab4cc1dd57011184a68c33ed3af669', 'RVAuEv6m', NULL, NULL, NULL, NULL, NULL, '510000000000', 1, 0, 1, '0009', NULL, NULL, 'admin', '2020-07-30 13:54:59', 'admin', '2020-07-30 14:54:47', NULL);
INSERT INTO `sys_user` VALUES ('1330839844547432450', 'cx_company', '醋纤化工', '86161091673deafdda591f1f6c1ba59d', '4ohhD1ax', 'files/20201123/205524-1566651324f88b_1606132992338.jpg', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '001', 'test', NULL, 'admin', '2020-11-23 19:45:19', 'admin', '2020-11-23 22:04:48', '1330874825453821953,1330808828671774722');
INSERT INTO `sys_user` VALUES ('1330864402109247489', 'cl_company', '长宁县泰宁化工有限公司', '66845cc53bb3a846199d76a572a7659d', 'sD1ZHJ07', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '002', '5103', NULL, 'admin', '2020-11-23 21:22:54', 'admin', '2020-11-23 21:55:55', '1330808828671774722');
INSERT INTO `sys_user` VALUES ('a5ae85333ae2432dafb4483003af0e43', 'cdgx', '成都市公安局高新区分局', 'b795fc5eaca8857e', 'g3SgOQLd', NULL, NULL, NULL, NULL, NULL, '510109000000', 1, 1, 1, '0002', NULL, NULL, 'admin', '2020-02-01 15:25:22', 'admin', '2020-02-20 01:17:03', NULL);
INSERT INTO `sys_user` VALUES ('e9ca23d68d884d4ebb19d07889727dae', 'admin', '系统超级管理员', '92ec25931e612d17', 'I6rxbh2t', 'files/20200929/4_1601361227829.png', '2018-12-05 00:00:00', 1, NULL, NULL, '510000000000', 1, 0, 1, '111', '5102', NULL, NULL, '2038-06-21 17:54:10', 'admin', '2020-11-23 22:15:34', '1330808828671774722,1330874825453821953');

-- ----------------------------
-- Table structure for sys_user_agent
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_agent`;
CREATE TABLE `sys_user_agent`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `USER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `AGENT_USER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '代理人用户名',
  `START_TIME` datetime(0) DEFAULT NULL COMMENT '代理开始时间',
  `END_TIME` datetime(0) DEFAULT NULL COMMENT '代理结束时间',
  `STATUS` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态0无效1有效',
  `CREATE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `CREATE_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人登录名称',
  `CREATE_TIME` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `UPDATE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人名称',
  `UPDATE_BY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人登录名称',
  `UPDATE_TIME` datetime(0) DEFAULT NULL COMMENT '更新日期',
  `SYS_ORG_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属部门',
  `SYS_COMPANY_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户代理人设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_depart`;
CREATE TABLE `sys_user_depart`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `DEP_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO `sys_user_depart` VALUES ('0c42ba309c2c4cad35836ec2336676fa', '42d153bffeea74f72a9c1697874fa4a7', '6d35e179cd814e3299bd588ea7daed3f');
INSERT INTO `sys_user_depart` VALUES ('1288729739332980738', '1288714688777719810', '510000000000');
INSERT INTO `sys_user_depart` VALUES ('1330877654176313345', 'e9ca23d68d884d4ebb19d07889727dae', '510000000000');
INSERT INTO `sys_user_depart` VALUES ('1f3a0267811327b9eca86b0cc2b956f3', 'bcbe1290783a469a83ae3bd8effe15d4', '5159cde220114246b045e574adceafe9');
INSERT INTO `sys_user_depart` VALUES ('2835834d133f9118ee87a666e0f5501e', 'a75d45a015c44384a04449ee80dc3503', 'a7d7e77e06c84325a40932163adcdaa6');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `USER_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户id',
  `ROLE_ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1215890660547248129', '1215663519272435713', '1215888815783297025');
INSERT INTO `sys_user_role` VALUES ('1229391780943556610', '1229391780633178114', '1229390949611532289');
INSERT INTO `sys_user_role` VALUES ('1288729738460565506', '1288714688777719810', '1215888815783297025');
INSERT INTO `sys_user_role` VALUES ('1330800703172395010', '1330800703172395009', '1330799294465064962');
INSERT INTO `sys_user_role` VALUES ('1330869040426508289', '1227792265186762753', '1223526121789505538');
INSERT INTO `sys_user_role` VALUES ('1330872709653946369', '1330864402109247489', '1330839279285276673');
INSERT INTO `sys_user_role` VALUES ('1330874944320397314', '1330839844547432450', '1330839279285276673');
INSERT INTO `sys_user_role` VALUES ('1330877653945626625', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b');
INSERT INTO `sys_user_role` VALUES ('b3ffd9311a1ca296c44e2409b547384f', '01b802058ea94b978a2c96f4807f6b48', '1');
INSERT INTO `sys_user_role` VALUES ('ee45d0343ecec894b6886effc92cb0b7', '4d8fef4667574b24a9ccfedaf257810c', 'f6817f48af4fb3af11b9e8bf182f618b');
INSERT INTO `sys_user_role` VALUES ('f2922a38ba24fb53749e45a0c459adb3', '439ae3e9bcf7418583fcd429cadb1d72', '1');

-- ----------------------------
-- Table structure for train_company
-- ----------------------------
DROP TABLE IF EXISTS `train_company`;
CREATE TABLE `train_company`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位地址',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '法定代表人',
  `phone_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `safety_director` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '安全负责人',
  `phonenum_safety` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '安全负责人联系电话',
  `employee_num` int(255) DEFAULT NULL COMMENT '员工人数',
  `certificate_person_num` int(255) DEFAULT NULL COMMENT '持证书人员数量',
  `nature_enterprise` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '企业性质',
  `main_sever` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主要服务',
  `corporate_profile` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '企业简介',
  `corporate_img` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '企业图片',
  `belong` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司id',
  `nature_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_date` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_company
-- ----------------------------
INSERT INTO `train_company` VALUES ('1330808828671774722', 'test', 'ceshi', '15727855555', 'test', '1051581', 'test', '5295', 12, 555, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 17:42:05', NULL, NULL);
INSERT INTO `train_company` VALUES ('1330874825453821953', 'ooooo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-23 22:04:20', NULL, NULL);

-- ----------------------------
-- Table structure for train_employee
-- ----------------------------
DROP TABLE IF EXISTS `train_employee`;
CREATE TABLE `train_employee`  (
  `id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名字',
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '\r\n身份证号',
  `depart_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工作的部门',
  `company_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司名字',
  `post_name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位名称',
  `phone_no` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `education_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '教育经历',
  `major_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专业',
  `mz_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '民族',
  `work_years` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '危化工作年限',
  `Train_exp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '培训经历',
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地市',
  `county_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '区县',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '备注',
  `depart_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司id',
  `post_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `county_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` datetime(0) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
