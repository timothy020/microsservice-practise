/*
 Navicat Premium Data Transfer

 Source Server         : Centos
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.10.100:3306
 Source Schema         : hm-cart

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 19/08/2024 08:11:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '购物车条目id ',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `item_id` bigint NOT NULL COMMENT 'sku商品id',
  `num` int NOT NULL DEFAULT 1 COMMENT '购买数量',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标题',
  `spec` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品动态属性键值集',
  `price` int NOT NULL COMMENT '价格,单位：分',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_user_item_id`(`user_id` ASC, `item_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (10, 2, 2120808, 1, '姬龙雪 guy laroche女包 GL经典手提包女牛皮大容量单肩包女欧美时尚包包女包GS1210001-06杏色', '{}', 71800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30694/267/398774087/90954/6fc143cf/5bf25358N14dadbf7.jpg!q70.jpg.webp', '2024-07-29 09:30:59', '2024-07-29 09:30:59');

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
