/*
 Navicat Premium Data Transfer

 Source Server         : Centos
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.10.100:3306
 Source Schema         : hm-pay

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 19/08/2024 08:09:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_order_no` bigint NOT NULL COMMENT '业务订单号',
  `pay_order_no` bigint NOT NULL DEFAULT 0 COMMENT '支付单号',
  `biz_user_id` bigint NOT NULL COMMENT '支付用户id',
  `pay_channel_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '支付渠道编码',
  `amount` int NOT NULL COMMENT '支付金额，单位分',
  `pay_type` tinyint NOT NULL DEFAULT 5 COMMENT '支付类型，1：h5,2:小程序，3：公众号，4：扫码，5：余额支付',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态，0：待提交，1:待支付，2：支付超时或取消，3：支付成功',
  `expand_json` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拓展字段，用于传递不同渠道单独处理的字段',
  `result_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方返回业务码',
  `result_msg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方返回提示信息',
  `pay_success_time` datetime NULL DEFAULT NULL COMMENT '支付成功时间',
  `pay_over_time` datetime NOT NULL COMMENT '支付超时时间',
  `qr_code_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码链接',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creater` bigint NOT NULL DEFAULT 0 COMMENT '创建人',
  `updater` bigint NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `biz_order_no`(`biz_order_no` ASC) USING BTREE,
  UNIQUE INDEX `pay_order_no`(`pay_order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1825322388665999362 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES (1658455441987891201, 1658453559437434882, 1658455441975308289, 1, 'balance', 55400, 5, 3, '', '', '', '2023-05-16 21:14:57', '2023-05-16 22:52:45', NULL, '2023-05-16 20:52:44', '2023-05-18 19:38:03', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1659160218174607363, 1659160216593354754, 1659160218174607362, 1, 'balance', 156000, 5, 3, '', '', '', '2023-05-18 19:34:48', '2023-05-18 21:33:16', NULL, '2023-05-18 19:33:16', '2023-05-18 19:37:54', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1817791895904989187, 1817791890582429697, 1817791895904989186, 1, 'balance', 663300, 5, 1, '', '', '', NULL, '2024-07-29 15:18:56', NULL, '2024-07-29 09:56:59', '2024-07-29 09:56:59', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1818161322999689219, 1818161318729994241, 1818161322999689218, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-07-30 15:46:54', NULL, '2024-07-29 15:55:21', '2024-07-29 15:55:21', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823148428637622273, 1823148420295045121, 1823148428625039361, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:03:53', NULL, '2024-07-30 21:52:13', '2024-07-30 21:52:13', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823148468919717890, 1823148467808120834, 1823148468919717889, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:04:02', NULL, '2024-07-30 21:52:23', '2024-07-30 21:52:23', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823149469487648769, 1823149466547482625, 1823149469470871554, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:08:01', NULL, '2024-07-30 21:56:41', '2024-07-30 21:56:41', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823149523690639363, 1823149522549829633, 1823149523690639362, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:08:14', NULL, '2024-07-30 21:56:55', '2024-07-30 21:56:55', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823149572529115138, 1823149571371528194, 1823149572529115137, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:08:25', NULL, '2024-07-30 21:57:08', '2024-07-30 21:57:08', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823149671900565506, 1823149670407434241, 1823149671900565505, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:08:49', NULL, '2024-07-30 21:57:34', '2024-07-30 21:57:34', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823150364971552770, 1823150363612639234, 1823150364971552769, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:11:34', NULL, '2024-07-30 22:00:33', '2024-07-30 22:00:33', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823150528478158850, 1823150524170625026, 1823150528457187329, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 10:12:13', NULL, '2024-07-30 22:01:15', '2024-07-30 22:01:15', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823150850252578818, 1823150846691631105, 1823150850252578817, 1, 'balance', 71800, 5, 1, '', '', '', NULL, '2024-08-13 10:13:30', NULL, '2024-07-30 22:02:38', '2024-07-30 22:02:38', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823151281393475586, 1823151280084869122, 1823151281393475585, 1, 'balance', 379500, 5, 1, '', '', '', NULL, '2024-08-13 10:15:13', NULL, '2024-08-13 08:15:16', '2024-08-13 08:15:16', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823151871720792066, 1823151870340882434, 1823151871720792065, 1, 'balance', 379500, 5, 1, '', '', '', NULL, '2024-08-13 10:17:33', NULL, '2024-08-13 08:17:48', '2024-08-13 08:17:48', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823151946484260867, 1823151945221791746, 1823151946484260866, 1, 'balance', 379500, 5, 1, '', '', '', NULL, '2024-08-13 10:17:51', NULL, '2024-08-13 08:18:07', '2024-08-13 08:18:07', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823152993944469506, 1823152991121825793, 1823152993923497986, 1, 'balance', 379500, 5, 1, '', '', '', NULL, '2024-08-13 10:22:01', NULL, '2024-08-13 08:22:38', '2024-08-13 08:22:38', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823166609322147842, 1823166604842754050, 1823166609322147841, 1, 'balance', 144600, 5, 1, '', '', '', NULL, '2024-08-13 11:16:07', NULL, '2024-08-13 09:16:07', '2024-08-13 09:16:07', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823168365011664899, 1823168360993644545, 1823168365011664898, 1, 'balance', 224900, 5, 1, '', '', '', NULL, '2024-08-13 11:23:06', NULL, '2024-08-13 09:23:05', '2024-08-13 09:23:05', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823169829209636866, 1823169825514577921, 1823169829209636865, 1, 'balance', 211600, 5, 1, '', '', '', NULL, '2024-08-13 11:28:55', NULL, '2024-08-13 09:28:54', '2024-08-13 09:28:54', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823181490826063874, 1823181482861002753, 1823181490805092354, 1, 'balance', 12800, 5, 3, '', '', '', '2024-08-13 10:26:52', '2024-08-13 12:15:15', NULL, '2024-08-13 10:15:15', '2024-08-13 10:26:52', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823184490348965889, 1823184483722002433, 1823184490323800066, 1, 'balance', 12800, 5, 3, '', '', '', '2024-08-13 10:27:14', '2024-08-13 12:27:10', NULL, '2024-08-13 10:27:10', '2024-08-13 10:27:13', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1823184664576159746, 1823184660587413505, 1823184664576159745, 1, 'balance', 379500, 5, 3, '', '', '', '2024-08-13 10:27:54', '2024-08-13 12:27:52', NULL, '2024-08-13 10:27:51', '2024-08-13 10:27:54', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1825321882543460354, 1825321879150313474, 1825321882526683138, 1, 'balance', 13700, 5, 3, '', '', '', '2024-08-19 08:00:30', '2024-08-19 10:00:24', NULL, '2024-08-14 20:59:10', '2024-08-14 20:59:16', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1825322388665999361, 1825322385931288578, 1825322388636639234, 1, 'balance', 379500, 5, 3, '', '', '', '2024-08-19 08:02:31', '2024-08-19 10:02:25', NULL, '2024-08-14 21:01:21', '2024-08-14 21:01:27', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1825323151576342531, 1825323150422884353, 1825323151576342530, 1, 'balance', 12800, 5, 3, '', '', '', '2024-08-19 08:05:41', '2024-08-19 10:05:27', NULL, '2024-08-14 21:04:38', '2024-08-14 21:04:53', 0, 0, b'0');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
