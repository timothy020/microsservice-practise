/*
 Navicat Premium Data Transfer

 Source Server         : Centos
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.10.100:3306
 Source Schema         : hm-trade

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 19/08/2024 08:09:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL COMMENT '订单id',
  `total_fee` int NOT NULL DEFAULT 0 COMMENT '总金额，单位为分',
  `payment_type` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '支付类型，1、支付宝，2、微信，3、扣减余额',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '订单的状态，1、未付款 2、已付款,未发货 3、已发货,未确认 4、确认收货，交易成功 5、交易取消，订单关闭 6、交易结束，已评价',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `consign_time` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` timestamp NULL DEFAULT NULL COMMENT '交易关闭时间',
  `comment_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `multi_key_status_time`(`status` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (123865420, 327900, 3, 2, 1, '2021-07-28 19:01:41', NULL, NULL, NULL, NULL, NULL, '2021-07-28 19:01:47');
INSERT INTO `order` VALUES (1654779387523936258, 135800, 3, 1, 1, '2023-05-06 17:25:24', NULL, NULL, NULL, NULL, NULL, '2023-05-06 17:25:24');
INSERT INTO `order` VALUES (1654782927348740097, 135800, 3, 1, 1, '2023-05-06 17:39:28', NULL, NULL, NULL, NULL, NULL, '2023-05-06 17:39:28');
INSERT INTO `order` VALUES (1658434251768471554, 120000, 3, 1, 1, '2023-05-16 19:28:32', NULL, NULL, NULL, NULL, NULL, '2023-05-16 19:28:32');
INSERT INTO `order` VALUES (1658453559437434882, 55400, 3, 1, 1, '2023-05-16 20:45:15', NULL, NULL, NULL, NULL, NULL, '2023-05-16 20:45:15');
INSERT INTO `order` VALUES (1659160216593354754, 156000, 3, 1, 1, '2023-05-18 19:33:16', NULL, NULL, NULL, NULL, NULL, '2023-05-18 19:33:16');
INSERT INTO `order` VALUES (1817791502944854017, 663300, 3, 1, 1, '2024-07-29 09:55:18', NULL, NULL, NULL, NULL, NULL, '2024-07-29 09:55:18');
INSERT INTO `order` VALUES (1817791559312105473, 663300, 3, 1, 1, '2024-07-29 09:55:32', NULL, NULL, NULL, NULL, NULL, '2024-07-29 09:55:32');
INSERT INTO `order` VALUES (1817791684688240642, 663300, 3, 1, 1, '2024-07-29 09:56:04', NULL, NULL, NULL, NULL, NULL, '2024-07-29 09:56:04');
INSERT INTO `order` VALUES (1817791873834573826, 663300, 3, 1, 1, '2024-07-29 09:56:53', NULL, NULL, NULL, NULL, NULL, '2024-07-29 09:56:53');
INSERT INTO `order` VALUES (1817791890582429697, 663300, 3, 1, 1, '2024-07-29 09:56:58', NULL, NULL, NULL, NULL, NULL, '2024-07-29 09:56:58');
INSERT INTO `order` VALUES (1818161318729994241, 144600, 3, 1, 1, '2024-07-29 15:55:20', NULL, NULL, NULL, NULL, NULL, '2024-07-29 15:55:20');
INSERT INTO `order` VALUES (1823147764519804929, 144600, 3, 1, 1, '2024-07-30 21:49:21', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:49:21');
INSERT INTO `order` VALUES (1823148420295045121, 144600, 3, 1, 1, '2024-07-30 21:52:11', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:52:11');
INSERT INTO `order` VALUES (1823148467808120834, 144600, 3, 1, 1, '2024-07-30 21:52:23', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:52:23');
INSERT INTO `order` VALUES (1823149295826726914, 144600, 3, 1, 1, '2024-07-30 21:55:57', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:55:57');
INSERT INTO `order` VALUES (1823149466547482625, 144600, 3, 1, 1, '2024-07-30 21:56:41', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:56:41');
INSERT INTO `order` VALUES (1823149522549829633, 144600, 3, 1, 1, '2024-07-30 21:56:55', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:56:55');
INSERT INTO `order` VALUES (1823149571371528194, 144600, 3, 1, 1, '2024-07-30 21:57:08', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:57:08');
INSERT INTO `order` VALUES (1823149670407434241, 144600, 3, 1, 1, '2024-07-30 21:57:33', NULL, NULL, NULL, NULL, NULL, '2024-07-30 21:57:33');
INSERT INTO `order` VALUES (1823150363612639234, 144600, 3, 1, 1, '2024-07-30 22:00:32', NULL, NULL, NULL, NULL, NULL, '2024-07-30 22:00:32');
INSERT INTO `order` VALUES (1823150524170625026, 144600, 3, 1, 1, '2024-07-30 22:01:14', NULL, NULL, NULL, NULL, NULL, '2024-07-30 22:01:14');
INSERT INTO `order` VALUES (1823150846691631105, 71800, 3, 1, 1, '2024-07-30 22:02:37', NULL, NULL, NULL, NULL, NULL, '2024-07-30 22:02:37');
INSERT INTO `order` VALUES (1823151280084869122, 379500, 3, 1, 1, '2024-08-13 08:15:15', NULL, NULL, NULL, NULL, NULL, '2024-08-13 08:15:15');
INSERT INTO `order` VALUES (1823151870340882434, 379500, 3, 1, 1, '2024-08-13 08:17:48', NULL, NULL, NULL, NULL, NULL, '2024-08-13 08:17:48');
INSERT INTO `order` VALUES (1823151945221791746, 379500, 3, 1, 1, '2024-08-13 08:18:07', NULL, NULL, NULL, NULL, NULL, '2024-08-13 08:18:07');
INSERT INTO `order` VALUES (1823152991121825793, 379500, 3, 1, 1, '2024-08-13 08:22:37', NULL, NULL, NULL, NULL, NULL, '2024-08-13 08:22:37');
INSERT INTO `order` VALUES (1823166604842754050, 144600, 3, 1, 1, '2024-08-13 09:16:06', NULL, NULL, NULL, NULL, NULL, '2024-08-13 09:16:06');
INSERT INTO `order` VALUES (1823168360993644545, 224900, 3, 1, 1, '2024-08-13 09:23:04', NULL, NULL, NULL, NULL, NULL, '2024-08-13 09:23:04');
INSERT INTO `order` VALUES (1823169825514577921, 211600, 3, 1, 1, '2024-08-13 09:28:53', NULL, NULL, NULL, NULL, NULL, '2024-08-13 09:28:53');
INSERT INTO `order` VALUES (1823181482861002753, 12800, 3, 1, 2, '2024-08-13 10:15:13', '2024-08-13 10:26:52', NULL, NULL, NULL, NULL, '2024-08-13 10:26:52');
INSERT INTO `order` VALUES (1823184483722002433, 12800, 3, 1, 2, '2024-08-13 10:27:09', '2024-08-13 10:27:14', NULL, NULL, NULL, NULL, '2024-08-13 10:27:13');
INSERT INTO `order` VALUES (1823184660587413505, 379500, 3, 1, 2, '2024-08-13 10:27:50', '2024-08-13 10:27:54', NULL, NULL, NULL, NULL, '2024-08-13 10:27:54');
INSERT INTO `order` VALUES (1825321756454338562, 13700, 3, 1, 1, '2024-08-14 20:58:38', NULL, NULL, NULL, NULL, NULL, '2024-08-14 20:58:38');
INSERT INTO `order` VALUES (1825321879150313474, 13700, 3, 1, 2, '2024-08-14 20:59:09', '2024-08-19 08:00:30', NULL, NULL, NULL, NULL, '2024-08-14 20:59:16');
INSERT INTO `order` VALUES (1825322385931288578, 379500, 3, 1, 2, '2024-08-14 21:01:20', '2024-08-19 08:02:34', NULL, NULL, NULL, NULL, '2024-08-14 21:01:30');
INSERT INTO `order` VALUES (1825323150422884353, 12800, 3, 1, 2, '2024-08-14 21:04:37', NULL, NULL, NULL, NULL, NULL, '2024-08-14 21:05:12');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单详情id ',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `item_id` bigint NOT NULL COMMENT 'sku商品id',
  `num` int NOT NULL COMMENT '购买数量',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标题',
  `spec` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品动态属性键值集',
  `price` int NOT NULL COMMENT '价格,单位：分',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 123865420, 100000003145, 2, 'vivo X23 8GB+128GB 幻夜蓝 水滴屏全面屏 游戏手机 移动联通电信全网通4G手机', '{\"颜色\": \"红色\", \"版本\": \"8GB+128GB\"}', 95900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/4612/28/6223/298257/5ba22d66Ef665222f/d97ed0b25cbe8c6e.jpg!q70.jpg.webp', '2021-07-28 19:05:21', '2021-07-28 19:05:21');
INSERT INTO `order_detail` VALUES (8, 1654779387523936258, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 17:25:24', '2023-05-06 17:25:24');
INSERT INTO `order_detail` VALUES (9, 1654779387523936258, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 17:25:24', '2023-05-06 17:25:24');
INSERT INTO `order_detail` VALUES (10, 1654782927348740097, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 17:39:28', '2023-05-06 17:39:28');
INSERT INTO `order_detail` VALUES (11, 1654782927348740097, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 17:39:28', '2023-05-06 17:39:28');
INSERT INTO `order_detail` VALUES (12, 1658434251768471554, 100002672272, 1, '荣耀V20胡歌同款手机全网通 标配版 6GB+128GB 魅丽红 游戏手机 移动联通电信4G全面屏手机 双卡双待', '{\"颜色\": \"红色\"}', 95000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/8112/20/10485/366920/5c2336deEab272fe3/12b58de5020ca1a1.jpg!q70.jpg.webp', '2023-05-16 19:28:32', '2023-05-16 19:28:32');
INSERT INTO `order_detail` VALUES (13, 1658434251768471554, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-16 19:28:32', '2023-05-16 19:28:32');
INSERT INTO `order_detail` VALUES (14, 1658453559437434882, 100002672274, 1, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-16 20:45:15', '2023-05-16 20:45:15');
INSERT INTO `order_detail` VALUES (15, 1659160216593354754, 100001964366, 1, 'OPPO A7 全面屏拍照手机 4GB+64GB 清新粉 全网通 移动联通电信4G 双卡双待手机', '{\"颜色\": \"粉色\"}', 65400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t25564/327/2615611632/135559/d3c69840/5bebd32eN3bf6f987.jpg!q70.jpg.webp', '2023-05-18 19:33:16', '2023-05-18 19:33:16');
INSERT INTO `order_detail` VALUES (16, 1659160216593354754, 100002624512, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 90600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2023-05-18 19:33:16', '2023-05-18 19:33:16');
INSERT INTO `order_detail` VALUES (39, 1817791502944854017, 3995643, 1, 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '{\"颜色\": \"黑色\"}', 663300, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t3193/308/1586388837/134147/92414e51/57d0c55bNa8230260.jpg!q70.jpg.webp', '2024-07-29 09:55:18', '2024-07-29 09:55:18');
INSERT INTO `order_detail` VALUES (40, 1817791559312105473, 3995643, 1, 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '{\"颜色\": \"黑色\"}', 663300, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t3193/308/1586388837/134147/92414e51/57d0c55bNa8230260.jpg!q70.jpg.webp', '2024-07-29 09:55:32', '2024-07-29 09:55:32');
INSERT INTO `order_detail` VALUES (41, 1817791684688240642, 3995643, 1, 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '{\"颜色\": \"黑色\"}', 663300, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t3193/308/1586388837/134147/92414e51/57d0c55bNa8230260.jpg!q70.jpg.webp', '2024-07-29 09:56:04', '2024-07-29 09:56:04');
INSERT INTO `order_detail` VALUES (42, 1817791873834573826, 3995643, 1, 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '{\"颜色\": \"黑色\"}', 663300, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t3193/308/1586388837/134147/92414e51/57d0c55bNa8230260.jpg!q70.jpg.webp', '2024-07-29 09:56:53', '2024-07-29 09:56:53');
INSERT INTO `order_detail` VALUES (43, 1817791890582429697, 3995643, 1, 'Apple iPhone 7 (A1660) 32G 黑色 移动联通电信4G手机', '{\"颜色\": \"黑色\"}', 663300, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t3193/308/1586388837/134147/92414e51/57d0c55bNa8230260.jpg!q70.jpg.webp', '2024-07-29 09:56:58', '2024-07-29 09:56:58');
INSERT INTO `order_detail` VALUES (44, 1818161318729994241, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-29 15:55:20', '2024-07-29 15:55:20');
INSERT INTO `order_detail` VALUES (51, 1823147764519804929, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:49:22', '2024-07-30 21:49:22');
INSERT INTO `order_detail` VALUES (52, 1823148420295045121, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:52:11', '2024-07-30 21:52:11');
INSERT INTO `order_detail` VALUES (53, 1823148467808120834, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:52:23', '2024-07-30 21:52:23');
INSERT INTO `order_detail` VALUES (54, 1823149295826726914, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:55:57', '2024-07-30 21:55:57');
INSERT INTO `order_detail` VALUES (55, 1823149466547482625, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:56:41', '2024-07-30 21:56:41');
INSERT INTO `order_detail` VALUES (56, 1823149522549829633, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:56:55', '2024-07-30 21:56:55');
INSERT INTO `order_detail` VALUES (57, 1823149571371528194, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:57:08', '2024-07-30 21:57:08');
INSERT INTO `order_detail` VALUES (58, 1823149670407434241, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 21:57:33', '2024-07-30 21:57:33');
INSERT INTO `order_detail` VALUES (59, 1823150363612639234, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 22:00:32', '2024-07-30 22:00:32');
INSERT INTO `order_detail` VALUES (60, 1823150524170625026, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-07-30 22:01:14', '2024-07-30 22:01:14');
INSERT INTO `order_detail` VALUES (61, 1823150846691631105, 2120808, 1, '姬龙雪 guy laroche女包 GL经典手提包女牛皮大容量单肩包女欧美时尚包包女包GS1210001-06杏色', '{}', 71800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30694/267/398774087/90954/6fc143cf/5bf25358N14dadbf7.jpg!q70.jpg.webp', '2024-07-30 22:02:37', '2024-07-30 22:02:37');
INSERT INTO `order_detail` VALUES (63, 1823151280084869122, 8533120, 1, '海尔 （Haier ）LQ65H31 65英寸 4K曲面人工智能全面屏超高清LED液晶电视', '{}', 379500, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/2851/14/13998/101463/5bd9723cE81b2c299/1bfdf2d1628648e4.jpg!q70.jpg.webp', '2024-08-13 08:15:15', '2024-08-13 08:15:15');
INSERT INTO `order_detail` VALUES (64, 1823151870340882434, 8533120, 1, '海尔 （Haier ）LQ65H31 65英寸 4K曲面人工智能全面屏超高清LED液晶电视', '{}', 379500, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/2851/14/13998/101463/5bd9723cE81b2c299/1bfdf2d1628648e4.jpg!q70.jpg.webp', '2024-08-13 08:17:48', '2024-08-13 08:17:48');
INSERT INTO `order_detail` VALUES (65, 1823151945221791746, 8533120, 1, '海尔 （Haier ）LQ65H31 65英寸 4K曲面人工智能全面屏超高清LED液晶电视', '{}', 379500, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/2851/14/13998/101463/5bd9723cE81b2c299/1bfdf2d1628648e4.jpg!q70.jpg.webp', '2024-08-13 08:18:07', '2024-08-13 08:18:07');
INSERT INTO `order_detail` VALUES (66, 1823152991121825793, 8533120, 1, '海尔 （Haier ）LQ65H31 65英寸 4K曲面人工智能全面屏超高清LED液晶电视', '{}', 379500, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/2851/14/13998/101463/5bd9723cE81b2c299/1bfdf2d1628648e4.jpg!q70.jpg.webp', '2024-08-13 08:22:37', '2024-08-13 08:22:37');
INSERT INTO `order_detail` VALUES (67, 1823166604842754050, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-08-13 09:16:06', '2024-08-13 09:16:06');
INSERT INTO `order_detail` VALUES (68, 1823168360993644545, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-08-13 09:23:04', '2024-08-13 09:23:04');
INSERT INTO `order_detail` VALUES (69, 1823169825514577921, 4093561, 1, '华为畅享7 Plus 3GB+32GB 移动4G版 香槟金 移动联通电信4G手机 双卡双待', '{\"颜色\": \"粉色\", \"版本\": \"64G\", \"选择版本\": \"移动4G版\"}', 211600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t7804/212/1308671016/161589/6dd9c5fc/599c0da5N88410391.jpg!q70.jpg.webp', '2024-08-13 09:28:53', '2024-08-13 09:28:53');
INSERT INTO `order_detail` VALUES (70, 1823181482861002753, 1713453, 1, '小鹿叮叮 超薄 成长裤 婴儿拉拉裤 男女学步通用尿不湿 大号L码84片【9-14kg】', '{}', 12800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22591/39/1930198982/188975/7385556d/5b6d33bdNa455e2b0.jpg!q70.jpg.webp', '2024-08-13 10:15:13', '2024-08-13 10:15:13');
INSERT INTO `order_detail` VALUES (71, 1823184483722002433, 1713453, 1, '小鹿叮叮 超薄 成长裤 婴儿拉拉裤 男女学步通用尿不湿 大号L码84片【9-14kg】', '{}', 12800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22591/39/1930198982/188975/7385556d/5b6d33bdNa455e2b0.jpg!q70.jpg.webp', '2024-08-13 10:27:09', '2024-08-13 10:27:09');
INSERT INTO `order_detail` VALUES (72, 1823184660587413505, 8533120, 1, '海尔 （Haier ）LQ65H31 65英寸 4K曲面人工智能全面屏超高清LED液晶电视', '{}', 379500, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/2851/14/13998/101463/5bd9723cE81b2c299/1bfdf2d1628648e4.jpg!q70.jpg.webp', '2024-08-13 10:27:50', '2024-08-13 10:27:50');
INSERT INTO `order_detail` VALUES (73, 1825321756454338562, 100001511821, 1, 'HMDIME 牛仔背带裤女2018秋冬新品 韩版学院风潮流百搭弹力修身补丁学生吊带长裤女 AXNZ369 深蓝 30', '{\"颜色\": \"蓝色\", \"尺码\": \"30\"}', 13700, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30892/263/313055374/557791/c98e9abc/5bef811aN036f7c3b.jpg!q70.jpg.webp', '2024-08-14 20:58:38', '2024-08-14 20:58:38');
INSERT INTO `order_detail` VALUES (74, 1825321879150313474, 100001511821, 1, 'HMDIME 牛仔背带裤女2018秋冬新品 韩版学院风潮流百搭弹力修身补丁学生吊带长裤女 AXNZ369 深蓝 30', '{\"颜色\": \"蓝色\", \"尺码\": \"30\"}', 13700, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30892/263/313055374/557791/c98e9abc/5bef811aN036f7c3b.jpg!q70.jpg.webp', '2024-08-14 20:59:09', '2024-08-14 20:59:09');
INSERT INTO `order_detail` VALUES (75, 1825322385931288578, 8533120, 1, '海尔 （Haier ）LQ65H31 65英寸 4K曲面人工智能全面屏超高清LED液晶电视', '{}', 379500, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/2851/14/13998/101463/5bd9723cE81b2c299/1bfdf2d1628648e4.jpg!q70.jpg.webp', '2024-08-14 21:01:20', '2024-08-14 21:01:20');
INSERT INTO `order_detail` VALUES (76, 1825323150422884353, 1713453, 1, '小鹿叮叮 超薄 成长裤 婴儿拉拉裤 男女学步通用尿不湿 大号L码84片【9-14kg】', '{}', 12800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22591/39/1930198982/188975/7385556d/5b6d33bdNa455e2b0.jpg!q70.jpg.webp', '2024-08-14 21:04:37', '2024-08-14 21:04:37');

-- ----------------------------
-- Table structure for order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `order_logistics`;
CREATE TABLE `order_logistics`  (
  `order_id` bigint NOT NULL COMMENT '订单id，与订单表一对一',
  `logistics_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物流单号',
  `logistics_company` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物流公司名称',
  `contact` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人手机号码',
  `province` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `town` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `street` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '街道',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_logistics
-- ----------------------------
INSERT INTO `order_logistics` VALUES (123865420, '', '', '李四', '13838411438', '上海', '上海', '浦东新区', '航头镇', '2021-07-28 19:07:01', '2021-07-28 19:07:01');

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
