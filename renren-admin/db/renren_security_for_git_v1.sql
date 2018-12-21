/*
 Navicat MySQL Data Transfer

 Source Server         : 本机MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : renren_security

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 12/21/2018 14:38:38 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_CRON_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai'), ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_JOB_DETAILS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372002e696f2e72656e72656e2e6d6f64756c65732e6a6f622e656e746974792e5363686564756c654a6f62456e7469747900000000000000010200084c00086265616e4e616d657400124c6a6176612f6c616e672f537472696e673b4c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c000e63726f6e45787072657373696f6e71007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000a6d6574686f644e616d6571007e00094c0006706172616d7371007e00094c000672656d61726b71007e00094c00067374617475737400134c6a6176612f6c616e672f496e74656765723b7870740008746573745461736b7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000158baf593307874000e3020302f3330202a202a202a203f7372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000000000017400047465737474000672656e72656e74000fe69c89e58f82e695b0e6b58be8af95737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e0013000000007800), ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372002e696f2e72656e72656e2e6d6f64756c65732e6a6f622e656e746974792e5363686564756c654a6f62456e7469747900000000000000010200084c00086265616e4e616d657400124c6a6176612f6c616e672f537472696e673b4c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c000e63726f6e45787072657373696f6e71007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000a6d6574686f644e616d6571007e00094c0006706172616d7371007e00094c000672656d61726b71007e00094c00067374617475737400134c6a6176612f6c616e672f496e74656765723b7870740008746573745461736b7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000158c377c4607874000e3020302f3330202a202a202a203f7372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000274000574657374327074000fe697a0e58f82e695b0e6b58be8af95737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e0013000000017800);
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_LOCKS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS'), ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_SCHEDULER_STATE`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'appledeMacBook-Air.local1545372453511', '1545373208883', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1545373800000', '-1', '5', 'WAITING', 'CRON', '1544513351000', '0', null, '2', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372002e696f2e72656e72656e2e6d6f64756c65732e6a6f622e656e746974792e5363686564756c654a6f62456e7469747900000000000000010200084c00086265616e4e616d657400124c6a6176612f6c616e672f537472696e673b4c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c000e63726f6e45787072657373696f6e71007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000a6d6574686f644e616d6571007e00094c0006706172616d7371007e00094c000672656d61726b71007e00094c00067374617475737400134c6a6176612f6c616e672f496e74656765723b7870740008746573745461736b7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000158baf593307874000e3020302f3330202a202a202a203f7372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000000000017400047465737474000672656e72656e74000fe69c89e58f82e695b0e6b58be8af95737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e0013000000007800), ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1544513400000', '-1', '5', 'PAUSED', 'CRON', '1544513351000', '0', null, '2', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000d4a4f425f504152414d5f4b45597372002e696f2e72656e72656e2e6d6f64756c65732e6a6f622e656e746974792e5363686564756c654a6f62456e7469747900000000000000010200084c00086265616e4e616d657400124c6a6176612f6c616e672f537472696e673b4c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c000e63726f6e45787072657373696f6e71007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c000a6d6574686f644e616d6571007e00094c0006706172616d7371007e00094c000672656d61726b71007e00094c00067374617475737400134c6a6176612f6c616e672f496e74656765723b7870740008746573745461736b7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000158c377c4607874000e3020302f3330202a202a202a203f7372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000274000574657374327074000fe697a0e58f82e695b0e6b58be8af95737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c75657871007e0013000000017800);
COMMIT;

-- ----------------------------
--  Table structure for `cms_user`
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(45) NOT NULL COMMENT '登录名',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=无效，1=有效',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `remark` varchar(45) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `head_pic` varchar(512) DEFAULT NULL COMMENT '头像',
  `is_system` int(11) DEFAULT '0' COMMENT '是否系统管理员 1:是系统管理员 | 0:不是系统管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `cms_user`
-- ----------------------------
BEGIN;
INSERT INTO `cms_user` VALUES ('1', 'admin', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '系统默认', '2018-05-30 15:41:37', '2018-05-30 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('2', 'plw', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '彭立威', '2018-05-30 15:41:37', '2018-05-30 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('3', 'sunyu', '593a1768fd6110af41a39fc93bbb9f35', '1', null, 'sunyu', '2018-05-30 15:41:37', '2018-05-30 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('4', 'zhaoshang', 'd672c65c5c9dfe56d30e317c2be2894a', '1', null, '田昊', '2018-05-30 15:41:37', '2018-05-30 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('5', 've', '593a1768fd6110af41a39fc93bbb9f35', '1', null, 'VE', '2018-06-12 15:41:37', '2018-06-12 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('6', 'front', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '前端用户', '2018-06-26 15:41:37', '2018-06-26 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('7', 'leo', 'b76bac176f407baab042043ff384b805', '1', null, '大客户经理', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('8', 'shirley', 'b76bac176f407baab042043ff384b805', '1', null, '大客户经理', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('9', 'luna', 'b76bac176f407baab042043ff384b805', '1', null, '文案', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('10', 'yuting', '90481e4c9c0d1b18df3f016f36b34aea', '1', null, '钰婷', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('11', 'shanshan', '90481e4c9c0d1b18df3f016f36b34aea', '1', null, '珊珊', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('12', 'bawei', '90481e4c9c0d1b18df3f016f36b34aea', '1', null, '巴卫', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('13', 'fengfeng', '90481e4c9c0d1b18df3f016f36b34aea', '1', null, '风风', '2018-06-28 11:41:37', '2018-06-28 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('14', 'xdx', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '谢德讯', '2018-05-30 15:41:37', '2018-05-30 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('15', 'tianhao', '0257bb4d7994a31fa2b3d8794327a413', '1', null, '田昊', '2018-07-25 15:41:37', '2018-07-25 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('16', 'fangshan101', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '方山', '2018-07-30 15:41:37', '2018-07-30 15:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('17', 'tuzi', '22ed3a618b6c8a4271c67fc04cad2578', '1', null, '兔子', '2018-08-08 11:41:37', '2018-08-08 11:41:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('18', 'feiyuan', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '飞鸢', '2018-09-06 11:30:15', '2018-09-06 11:30:18', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('19', 'luoqing', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '罗晴', '2018-09-06 14:58:44', '2018-09-06 14:58:44', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('20', 'chaoyang', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '朝阳', '2018-09-11 17:58:23', '2018-09-11 17:58:20', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('21', 'hxw', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '胡学望', '2018-09-11 18:00:30', '2018-09-11 18:00:33', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('22', 'bianshanshan', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '卞杉杉', '2018-09-11 18:23:52', '2018-09-11 18:23:55', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('23', 'wushanshan', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '吴珊珊', '2018-09-11 18:25:17', '2018-09-11 18:25:14', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('24', 'yeyayun', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '叶亚运', '2018-10-15 12:10:34', '2018-10-15 12:10:37', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('25', 'zhoukuiting', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '周魁霆', '2018-10-16 19:56:43', '2018-10-16 19:56:43', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('26', 'xt', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '夏天', '2018-10-16 20:00:02', '2018-10-16 20:00:02', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('27', 'lyy', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '刘艳艳', '2018-10-16 20:00:02', '2018-10-16 20:00:02', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('28', 'hzq', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '贺志强', '2018-10-17 11:24:57', '2018-10-17 11:24:57', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('29', 'zhuoma', '593a1768fd6110af41a39fc93bbb9f35', '1', null, 'zhuoma', '2018-10-17 11:24:57', '2018-10-17 11:24:57', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('30', 'wangrongrong', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '王榕榕', '2018-10-24 16:30:02', '2018-10-24 16:30:07', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('31', 'hxyfj', 'd58e3582afa99040e27b92b13c8f2280', '1', null, '黄雄', '2018-10-31 17:57:19', '2018-10-31 17:57:22', '粉象生活', 'http://adbats-res.oss-cn-hangzhou.aliyuncs.com/njia/head_pic.png', '0'), ('32', 'hejianwen', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '贺建文', '2018-10-29 15:30:26', '2018-10-29 15:30:29', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('33', 'liuweiwei', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '刘薇薇', '2018-10-31 17:56:17', '2018-10-31 17:56:27', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('34', 'ruanwenfang', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '阮文芳', '2018-10-31 17:56:19', '2018-10-31 17:56:29', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('35', 'liuyinghua', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '刘英华', '2018-10-31 17:56:24', '2018-10-31 17:56:32', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('36', 'ios', 'eb25b153faa85902cfbc4413e2aaf8f1', '1', null, 'iOS', '2018-11-03 13:37:59', '2018-11-03 13:38:02', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('37', 'chenchaoying', '593a1768fd6110af41a39fc93bbb9f35', '1', null, '陈超颖', '2018-11-05 16:51:44', '2018-11-05 16:51:42', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('38', 'mia', '0729197c596fd4ad7b33e1e85935905712', '1', null, 'mia', '2018-11-12 10:47:18', '2018-11-12 10:47:21', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('40', 'dongsheng01', 'cf206cddb1de9ef8043f5a885018e32c', '1', null, '东升', '2018-11-14 14:19:49', '2018-11-14 14:19:49', '粉象生活', 'http://adbats-res.oss-cn-hangzhou.aliyuncs.com/njia/head_pic.png', '0'), ('41', 'Jerry', 'e7d276de61ea83f9c6e6ffb3e28dd51e', '1', null, '大客户经理', '2018-11-15 16:53:50', '2018-11-15 16:53:56', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('42', 'Tina', 'cc70d44f15a354b02d905d8bb55d5afc', '1', null, '大客户经理', '2018-11-15 16:53:53', '2018-11-15 16:53:59', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('43', 'zhangxinbing', 'cfb527510b95ba4d54d422ffe8ac62da', '1', null, '张新冰', '2018-11-21 18:39:56', '2018-11-21 18:39:59', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('44', 'dali', 'f84a22a984de7fa02fa6bbeeb6735003', '1', null, '大力', '2018-11-21 18:39:56', '2018-11-21 18:39:59', '粉象生活', 'https://static.fenxianglife.com/other/head_pic.png', '0'), ('45', 'zhaoyong', 'dc483e80a7a0bd9ef71d8cf973673924', '1', null, '赵勇', '2018-11-27 11:57:20', '2018-11-27 11:57:20', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '1'), ('46', 'zhangsi', 'd4ca00396ea7d2afc11ab21e61952779', '1', null, '张斯', '2018-11-28 15:55:29', '2018-11-28 15:55:31', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('47', 'xiejing', 'd76fbea193a56ca5cfe16351eee15e85', '1', null, '谢静', '2018-12-03 20:19:43', '2018-12-03 20:19:46', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('48', 'qufeifei', 'ef70e3488f926b541d113bacf9c9709b', '1', null, '曲斐斐', '2018-12-05 14:26:29', '2018-12-05 14:26:29', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0'), ('49', 'wangjing', 'fdf89b258ed8db46259284654918a633', '1', null, '王竞', '2018-12-05 14:26:29', '2018-12-05 14:26:29', '粉象生活', 'http://static.fenxianglife.com/other/head_pic.png', '0');
COMMIT;

-- ----------------------------
--  Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
--  Records of `schedule_job`
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46'), ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');
COMMIT;

-- ----------------------------
--  Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
--  Records of `schedule_job_log`
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1036', '2018-12-11 15:30:00'), ('2', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-12-11 20:00:00'), ('3', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-11 20:30:00'), ('4', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-12-11 21:00:00'), ('5', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-12-11 21:30:00'), ('6', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2018-12-12 16:30:00'), ('7', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2018-12-12 17:00:00'), ('8', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-12-12 17:30:00'), ('9', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-12-12 18:00:00'), ('10', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-12 18:30:00'), ('11', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-12-12 20:30:00'), ('12', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-12-12 21:00:00'), ('13', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-12-12 21:30:00'), ('14', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-13 10:00:00'), ('15', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-12-13 10:30:00'), ('16', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-12-13 11:00:00'), ('17', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-12-13 11:30:00'), ('18', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-12-13 12:00:00'), ('19', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-12-14 10:00:00'), ('20', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2018-12-14 10:30:00'), ('21', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-12-14 11:00:00'), ('22', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-12-14 11:30:00'), ('23', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-12-14 12:00:00'), ('24', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-12-14 12:30:00'), ('25', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-12-14 13:00:00'), ('26', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2018-12-14 14:00:00'), ('27', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-12-14 14:30:00'), ('28', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2018-12-14 15:00:00'), ('29', '1', 'testTask', 'test', 'renren', '0', null, '1036', '2018-12-14 15:30:00'), ('30', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-12-14 16:00:00'), ('31', '1', 'testTask', 'test', 'renren', '0', null, '1030', '2018-12-14 16:30:00'), ('32', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2018-12-14 17:00:00'), ('33', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2018-12-14 17:30:00'), ('34', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2018-12-18 15:00:00'), ('35', '1', 'testTask', 'test', 'renren', '0', null, '1049', '2018-12-19 10:30:00'), ('36', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2018-12-19 11:00:00'), ('37', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-12-19 11:30:00'), ('38', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-12-19 12:00:00'), ('39', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-12-19 12:30:00'), ('40', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-12-19 13:00:00'), ('41', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2018-12-19 13:30:00'), ('42', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2018-12-19 14:00:00'), ('43', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-12-19 14:30:00'), ('44', '1', 'testTask', 'test', 'renren', '0', null, '1031', '2018-12-19 16:30:00'), ('45', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-19 17:00:00'), ('46', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-19 17:30:00'), ('47', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-19 18:00:00'), ('48', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-19 18:30:00'), ('49', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-12-19 19:00:00'), ('50', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-19 19:30:00'), ('51', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-19 20:00:00'), ('52', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-19 20:30:00'), ('53', '1', 'testTask', 'test', 'renren', '0', null, '1047', '2018-12-19 21:00:00'), ('54', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-12-20 01:29:52'), ('55', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-20 10:00:00'), ('56', '1', 'testTask', 'test', 'renren', '0', null, '1025', '2018-12-20 11:00:00'), ('57', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-12-20 11:30:00'), ('58', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-12-20 14:30:00'), ('59', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2018-12-20 16:00:00'), ('60', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-12-20 18:00:00'), ('61', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2018-12-20 19:00:00'), ('62', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-12-20 19:30:00'), ('63', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-12-20 20:00:00'), ('64', '1', 'testTask', 'test', 'renren', '0', null, '1046', '2018-12-20 20:30:00'), ('65', '1', 'testTask', 'test', 'renren', '0', null, '1070', '2018-12-21 11:00:00'), ('66', '1', 'testTask', 'test', 'renren', '0', null, '1036', '2018-12-21 11:30:00'), ('67', '1', 'testTask', 'test', 'renren', '0', null, '1042', '2018-12-21 12:00:00'), ('68', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2018-12-21 12:30:00'), ('69', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2018-12-21 13:00:00'), ('70', '1', 'testTask', 'test', 'renren', '0', null, '1036', '2018-12-21 14:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');
COMMIT;

-- ----------------------------
--  Table structure for `sys_data_type_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_type_config`;
CREATE TABLE `sys_data_type_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上一级数据分类id,一级数据分类为0',
  `data_key` varchar(50) DEFAULT NULL COMMENT '数据key',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='数据类型配置';

-- ----------------------------
--  Records of `sys_data_type_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_data_type_config` VALUES ('1', '0', 'benefits', '会员权益', '0'), ('2', '1', 'benefitsVip', '会员权益：vip专区', '0'), ('3', '1', 'benefitsTopic', '会员权益：促销专题模块', '0'), ('4', '1', 'benefitsngleProducts', '会员权益：促销单品专题', '0'), ('5', '1', 'benefitsAll', '会员权益:全部数据', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '0', '人人开源集团', '0', '0'), ('2', '1', '长沙分公司', '1', '0'), ('3', '1', '上海分公司', '2', '0'), ('4', '3', '技术部', '0', '0'), ('5', '3', '销售部', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0'), ('2', '性别', 'sex', '1', '男', '1', null, '0'), ('3', '性别', 'sex', '2', '未知', '3', null, '0'), ('4', 'aa', 'a', 'adga', 'gasdg', '1', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,5],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '181', '0:0:0:0:0:0:0:1', '2018-12-11 15:34:24'), ('2', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,4,5],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '24', '0:0:0:0:0:0:0:1', '2018-12-11 15:35:32'), ('3', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '21', '0:0:0:0:0:0:0:1', '2018-12-11 15:36:37'), ('4', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"admin2\",\"password\":\"ccd3f674a5fc04125a57cf67367310f2a62203a1641f11c1a9a8a786aadcde6b\",\"salt\":\"e373nRIZ8jaQlpyBSFA1\",\"email\":\"admin2@admin.com\",\"mobile\":\"13700000001\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Dec 11, 2018 7:50:40 PM\",\"deptId\":4,\"deptName\":\"技术部\"}', '227', '0:0:0:0:0:0:0:1', '2018-12-11 19:50:41'), ('5', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '39', '0:0:0:0:0:0:0:1', '2018-12-11 20:21:59'), ('6', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"Android工程师\",\"remark\":\"Android工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,24,25,26],\"deptIdList\":[2,4,5],\"createTime\":\"Dec 11, 2018 8:23:19 PM\"}', '21', '0:0:0:0:0:0:0:1', '2018-12-11 20:23:19'), ('7', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,4,5],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '24', '0:0:0:0:0:0:0:1', '2018-12-11 20:23:52'), ('8', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,4],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '21', '0:0:0:0:0:0:0:1', '2018-12-11 20:24:26'), ('9', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '30', '0:0:0:0:0:0:0:1', '2018-12-11 20:28:01'), ('10', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '36', '0:0:0:0:0:0:0:1', '2018-12-11 20:29:18'), ('11', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '29', '0:0:0:0:0:0:0:1', '2018-12-11 21:13:45'), ('12', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '203', '0:0:0:0:0:0:0:1', '2018-12-12 17:14:35'), ('13', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '22', '0:0:0:0:0:0:0:1', '2018-12-12 17:16:39'), ('14', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,4],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '151', '0:0:0:0:0:0:0:1', '2018-12-12 17:47:13'), ('15', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,7,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,4],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '48', '0:0:0:0:0:0:0:1', '2018-12-12 18:17:01'), ('16', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '19', '0', '0:0:0:0:0:0:0:1', '2018-12-13 09:59:09'), ('17', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"java工程师\",\"remark\":\"java工程师\",\"deptId\":4,\"deptName\":\"技术部\",\"menuIdList\":[1,2,15,16,17,3,19,20,21,4,23,24,6,7,11,12,13,31,32,34,36,37,38,39],\"deptIdList\":[2,4],\"createTime\":\"Dec 11, 2018 3:34:24 PM\"}', '88', '0:0:0:0:0:0:0:1', '2018-12-13 10:19:45'), ('18', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"admin2\",\"salt\":\"e373nRIZ8jaQlpyBSFA1\",\"email\":\"admin2@admin.com\",\"mobile\":\"13700000001\",\"status\":1,\"roleIdList\":[1,2],\"createTime\":\"Dec 11, 2018 7:50:41 PM\",\"deptId\":4,\"deptName\":\"技术部\"}', '174', '0:0:0:0:0:0:0:1', '2018-12-14 17:24:21'), ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":36,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"字典管理\",\"url\":\"modules/sys/dict.html\",\"perms\":\"sys:dict:abc\",\"type\":1,\"icon\":\"fa fa-bookmark-o\",\"orderNum\":6}', '18', '0:0:0:0:0:0:0:1', '2018-12-19 16:50:04'), ('20', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":36,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"字典管理\",\"url\":\"modules/sys/dict.html\",\"perms\":\"\",\"type\":1,\"icon\":\"fa fa-bookmark-o\",\"orderNum\":6}', '12', '0:0:0:0:0:0:0:1', '2018-12-19 16:50:56'), ('21', 'zhaoyong', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '\"zhaoyong123\"', '35', '0:0:0:0:0:0:0:1', '2018-12-20 18:54:13'), ('22', 'zhaoyong', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '\"zhaoyong12\"', '38', '0:0:0:0:0:0:0:1', '2018-12-20 19:00:16'), ('23', 'zhaoyong', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '\"zhaoyong123\"', '9', '0:0:0:0:0:0:0:1', '2018-12-20 19:00:21'), ('24', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '36', '40', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:02'), ('25', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '38', '13', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:22'), ('26', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '39', '11', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:27'), ('27', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '37', '12', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:31'), ('28', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '40', '12', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:36'), ('29', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '27', '0', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:48'), ('30', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '27', '0', '0:0:0:0:0:0:0:1', '2018-12-21 12:56:58'), ('31', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '7', '0', '0:0:0:0:0:0:0:1', '2018-12-21 12:57:53'), ('32', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '30', '0', '0:0:0:0:0:0:0:1', '2018-12-21 13:02:07'), ('33', 'zhaoyong', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '5', '0', '0:0:0:0:0:0:0:1', '2018-12-21 13:43:16');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `is_system_menu` int(11) DEFAULT '0' COMMENT '是否权限管理用的系统菜单 1:是 | 0：不是',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0', '1'), ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1', '1'), ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2', '1'), ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3', '1'), ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', '1'), ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', '1'), ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', '1'), ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', '1'), ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', '1'), ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0', '1'), ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0', '1'), ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', '1'), ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', '1'), ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', '1'), ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', '1'), ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', '1'), ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1', '1'), ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0', '1'), ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0', '1'), ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0', '1'), ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oss`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', 'java工程师', 'java工程师', '4', '2018-12-11 15:34:24'), ('2', 'Android工程师', 'Android工程师', '4', '2018-12-11 20:23:19');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_data`;
CREATE TABLE `sys_role_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `data_type_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='角色与数据权限对应关系';

-- ----------------------------
--  Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
--  Records of `sys_role_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES ('8', '2', '2'), ('9', '2', '4'), ('10', '2', '5'), ('25', '1', '2'), ('26', '1', '4');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('90', '2', '1'), ('91', '2', '2'), ('92', '2', '15'), ('93', '2', '16'), ('94', '2', '17'), ('95', '2', '18'), ('96', '2', '3'), ('97', '2', '19'), ('98', '2', '20'), ('99', '2', '21'), ('100', '2', '22'), ('101', '2', '4'), ('102', '2', '24'), ('103', '2', '25'), ('104', '2', '26'), ('311', '1', '1'), ('312', '1', '2'), ('313', '1', '15'), ('314', '1', '16'), ('315', '1', '17'), ('316', '1', '3'), ('317', '1', '19'), ('318', '1', '20'), ('319', '1', '21'), ('320', '1', '4'), ('321', '1', '23'), ('322', '1', '24'), ('323', '1', '6'), ('324', '1', '7'), ('325', '1', '11'), ('326', '1', '12'), ('327', '1', '13'), ('328', '1', '31'), ('329', '1', '32'), ('330', '1', '34');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11'), ('2', 'admin2', 'ccd3f674a5fc04125a57cf67367310f2a62203a1641f11c1a9a8a786aadcde6b', 'e373nRIZ8jaQlpyBSFA1', 'admin2@admin.com', '13700000001', '1', '4', '2018-12-11 19:50:41');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('2', '2', '1'), ('3', '2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `tb_token`
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
--  Records of `tb_user`
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
