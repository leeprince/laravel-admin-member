/*
 Navicat Premium Data Transfer

 Source Server         : mac-leeprince
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : laravel-admin-member

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 18/02/2021 23:36:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_member
-- ----------------------------
DROP TABLE IF EXISTS `admin_member`;
CREATE TABLE `admin_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '全平台统一手机号',
  `status` tinyint(4) NOT NULL COMMENT '0：禁用；1：正常',
  `level` tinyint(4) NOT NULL COMMENT '1：普通会员；2：白银会员；3：黄金会员；4：白金会员；5：砖石会员；6：超级会员',
  `balance` decimal(8,2) NOT NULL COMMENT '余额',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_member
-- ----------------------------
BEGIN;
INSERT INTO `admin_member` VALUES (1, '13500000001', 1, 1, 10000.00, 1603899193, 1604326826);
COMMIT;

-- ----------------------------
-- Table structure for admin_member_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_member_info`;
CREATE TABLE `admin_member_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL COMMENT '全平台统一用户ID，关联：member 表',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '全平台统一手机号',
  `source_id` tinyint(4) NOT NULL COMMENT '来源 1：微信；2：支付宝；3：prince商城',
  `source_type` tinyint(4) NOT NULL COMMENT '来源类型 1：小程序；2：公众号；3：APP',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '第三方标识',
  `union_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '第三方统一标识',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_member_info
-- ----------------------------
BEGIN;
INSERT INTO `admin_member_info` VALUES (1, 1, '13500000000', 1, 1, 'leeprince-01', 'union_id-leeprince-01', 'name-leeprince-01', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLBmXKM1eNzaTjrFKRBc2OsE6F96pJ44Qdmbr5zBxQLI9rtTZg79c8tcBa6QZjXfUuuJElaQEhKlQ/132', 1603899193, 1603899193);
INSERT INTO `admin_member_info` VALUES (2, 1, '13500000000', 1, 2, 'leeprince-02', 'union_id-leeprince-02', 'name-leeprince-02', 'http://thirdwx.qlogo.cn/mmopen/vi_32/73JN7HxoDAy8qI3Vk6ufk3v1r1YbkAcQ2wqawYhEj68VhNoCus2vBYBBFXrEFZYf7g3c1L1vialhFHWz8v1rFgA/0', 1603899193, 1603899193);
COMMIT;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, '仪表盘', 'fa-bar-chart', '/', '', '2020-10-28 22:48:40', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '系统管理', 'fa-tasks', '', '', '2020-10-28 22:48:44', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '用户管理', 'fa-users', 'auth/users', '', '2020-10-28 22:48:49', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色管理', 'fa-user', 'auth/roles', '', '2020-10-28 22:48:53', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', '', '2020-10-28 22:48:57', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', '', '2020-10-28 22:49:02', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', '', '2020-10-28 22:49:07', '2020-10-24 18:39:03');
INSERT INTO `admin_menu` VALUES (8, 0, 8, '小程序会员系统', 'fa-terminal', '', '', '2020-10-24 03:34:29', '2020-10-24 18:39:26');
INSERT INTO `admin_menu` VALUES (9, 8, 9, '会员管理', 'fa-user-md', 'members', '', '2020-10-24 04:12:23', '2020-10-27 13:54:09');
COMMIT;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_operation_log_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-10-28 14:47:44', '2020-10-28 14:47:44');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-10-28 14:54:24', '2020-10-28 14:54:24');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-28 14:54:27', '2020-10-28 14:54:27');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-28 14:54:34', '2020-10-28 14:54:34');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:00:51', '2020-10-28 15:00:51');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:01:15', '2020-10-28 15:01:15');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:01:40', '2020-10-28 15:01:40');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:03:26', '2020-10-28 15:03:26');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:04:29', '2020-10-28 15:04:29');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:04:31', '2020-10-28 15:04:31');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:04:46', '2020-10-28 15:04:46');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:04:47', '2020-10-28 15:04:47');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:13:09', '2020-10-28 15:13:09');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:13:09', '2020-10-28 15:13:09');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:13:58', '2020-10-28 15:13:58');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:33:42', '2020-10-28 15:33:42');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:33:43', '2020-10-28 15:33:43');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:33:43', '2020-10-28 15:33:43');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 15:34:04', '2020-10-28 15:34:04');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:09:37', '2020-10-28 16:09:37');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:11:07', '2020-10-28 16:11:07');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:32:53', '2020-10-28 16:32:53');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:33:12', '2020-10-28 16:33:12');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:34:53', '2020-10-28 16:34:53');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:36:01', '2020-10-28 16:36:01');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:38:41', '2020-10-28 16:38:41');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:38:42', '2020-10-28 16:38:42');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:39:55', '2020-10-28 16:39:55');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 16:41:41', '2020-10-28 16:41:41');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-28 16:42:25', '2020-10-28 16:42:25');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-28 16:42:32', '2020-10-28 16:42:32');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-28 16:42:35', '2020-10-28 16:42:35');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-10-28 16:42:37', '2020-10-28 16:42:37');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 18:13:00', '2020-10-28 18:13:00');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 18:13:11', '2020-10-28 18:13:11');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 18:32:38', '2020-10-28 18:32:38');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 18:32:48', '2020-10-28 18:32:48');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-28 18:33:50', '2020-10-28 18:33:50');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-10-29 08:23:17', '2020-10-29 08:23:17');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-10-29 08:23:20', '2020-10-29 08:23:20');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-10-29 08:23:33', '2020-10-29 08:23:33');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-10-29 08:23:34', '2020-10-29 08:23:34');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-10-29 08:23:52', '2020-10-29 08:23:52');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-10-29 08:24:02', '2020-10-29 08:24:02');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-11-01 13:34:04', '2020-11-01 13:34:04');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-01 13:37:33', '2020-11-01 13:37:33');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-01 15:04:22', '2020-11-01 15:04:22');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-01 15:06:54', '2020-11-01 15:06:54');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-01 15:23:52', '2020-11-01 15:23:52');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-01 15:23:58', '2020-11-01 15:23:58');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-01 15:24:01', '2020-11-01 15:24:01');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-01 15:24:05', '2020-11-01 15:24:05');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:47:42', '2020-11-02 12:47:42');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:48:26', '2020-11-02 12:48:26');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:49:20', '2020-11-02 12:49:20');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:49:27', '2020-11-02 12:49:27');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:50:21', '2020-11-02 12:50:21');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:50:22', '2020-11-02 12:50:22');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:50:24', '2020-11-02 12:50:24');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:52:50', '2020-11-02 12:52:50');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:52:55', '2020-11-02 12:52:55');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:52:57', '2020-11-02 12:52:57');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:52:58', '2020-11-02 12:52:58');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:53:00', '2020-11-02 12:53:00');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:53:23', '2020-11-02 12:53:23');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\"}', '2020-11-02 12:53:27', '2020-11-02 12:53:27');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 12:54:22', '2020-11-02 12:54:22');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 13:08:31', '2020-11-02 13:08:31');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:08:34', '2020-11-02 13:08:34');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:08:36', '2020-11-02 13:08:36');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:08:38', '2020-11-02 13:08:38');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/members/1', 'GET', '127.0.0.1', '[]', '2020-11-02 13:08:40', '2020-11-02 13:08:40');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 13:10:28', '2020-11-02 13:10:28');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:10:30', '2020-11-02 13:10:30');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:12:53', '2020-11-02 13:12:53');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:12:56', '2020-11-02 13:12:56');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:13:03', '2020-11-02 13:13:03');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":null}', '2020-11-02 13:13:14', '2020-11-02 13:13:14');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"1\"}', '2020-11-02 13:13:18', '2020-11-02 13:13:18');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"1\"}', '2020-11-02 13:13:21', '2020-11-02 13:13:21');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"1\"}', '2020-11-02 13:13:23', '2020-11-02 13:13:23');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:13:27', '2020-11-02 13:13:27');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:13:58', '2020-11-02 13:13:58');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:14:46', '2020-11-02 13:14:46');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:14:50', '2020-11-02 13:14:50');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:14:54', '2020-11-02 13:14:54');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"1\"}', '2020-11-02 13:14:57', '2020-11-02 13:14:57');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"2\"}', '2020-11-02 13:15:01', '2020-11-02 13:15:01');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:15:04', '2020-11-02 13:15:04');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":null}', '2020-11-02 13:15:07', '2020-11-02 13:15:07');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"1\",\"level\":null}', '2020-11-02 13:15:19', '2020-11-02 13:15:19');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"1\",\"level\":\"0\"}', '2020-11-02 13:15:26', '2020-11-02 13:15:26');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"1\",\"level\":\"0\"}', '2020-11-02 13:49:14', '2020-11-02 13:49:14');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"1\",\"level\":\"0\"}', '2020-11-02 13:49:16', '2020-11-02 13:49:16');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"1\",\"level\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:49:21', '2020-11-02 13:49:21');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"1\",\"level\":\"2\"}', '2020-11-02 13:49:25', '2020-11-02 13:49:25');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"2\"}', '2020-11-02 13:49:35', '2020-11-02 13:49:35');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"1\"}', '2020-11-02 13:49:40', '2020-11-02 13:49:40');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"1\"}', '2020-11-02 13:50:05', '2020-11-02 13:50:05');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"-\",\"level\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:50:08', '2020-11-02 13:50:08');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"-\",\"level\":\"0\"}', '2020-11-02 13:50:12', '2020-11-02 13:50:12');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"-\",\"level\":\"0\"}', '2020-11-02 13:50:26', '2020-11-02 13:50:26');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"-\",\"level\":\"0\",\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:50:30', '2020-11-02 13:50:30');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"-\",\"level\":\"0\"}', '2020-11-02 13:50:43', '2020-11-02 13:50:43');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:50:49', '2020-11-02 13:50:49');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":null}', '2020-11-02 13:50:53', '2020-11-02 13:50:53');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":null}', '2020-11-02 13:50:58', '2020-11-02 13:50:58');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:51:01', '2020-11-02 13:51:01');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:51:15', '2020-11-02 13:51:15');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:55:43', '2020-11-02 13:55:43');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":null,\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:55:47', '2020-11-02 13:55:47');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:55:53', '2020-11-02 13:55:53');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:57:34', '2020-11-02 13:57:34');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:57:51', '2020-11-02 13:57:51');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:58:00', '2020-11-02 13:58:00');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:58:21', '2020-11-02 13:58:21');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:58:25', '2020-11-02 13:58:25');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:58:40', '2020-11-02 13:58:40');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"0\"}', '2020-11-02 13:59:14', '2020-11-02 13:59:14');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":null,\"level\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:59:19', '2020-11-02 13:59:19');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"0\",\"level\":\"1\"}', '2020-11-02 13:59:24', '2020-11-02 13:59:24');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"1\",\"level\":\"1\"}', '2020-11-02 13:59:26', '2020-11-02 13:59:26');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/members', 'GET', '127.0.0.1', '{\"id\":null,\"status\":\"1\",\"level\":\"1\"}', '2020-11-02 13:59:52', '2020-11-02 13:59:52');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 13:59:58', '2020-11-02 13:59:58');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/members/1', 'GET', '127.0.0.1', '[]', '2020-11-02 14:02:28', '2020-11-02 14:02:28');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:15:26', '2020-11-02 14:15:26');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:15:38', '2020-11-02 14:15:38');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"mobile\":\"13500000000\",\"status\":\"1\",\"level\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2020-11-02 14:15:47', '2020-11-02 14:15:47');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/members/create', 'GET', '127.0.0.1', '[]', '2020-11-02 14:15:47', '2020-11-02 14:15:47');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:16:12', '2020-11-02 14:16:12');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:16:18', '2020-11-02 14:16:18');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"mobile\":\"13500000000\",\"status\":\"0\",\"level\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-admin.wenbo\\/admin\\/members\"}', '2020-11-02 14:16:22', '2020-11-02 14:16:22');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:16:22', '2020-11-02 14:16:22');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:16:26', '2020-11-02 14:16:26');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"mobile\":\"13500000000\",\"status\":\"1\",\"level\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-admin.wenbo\\/admin\\/members\"}', '2020-11-02 14:16:30', '2020-11-02 14:16:30');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:16:30', '2020-11-02 14:16:30');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:16:52', '2020-11-02 14:16:52');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"name\":\"mobile\",\"value\":\"13500000001\",\"pk\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-11-02 14:16:56', '2020-11-02 14:16:56');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:16:58', '2020-11-02 14:16:58');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:20:09', '2020-11-02 14:20:09');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"mobile\":\"13500000001\",\"status\":\"off\",\"level\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-admin.wenbo\\/admin\\/members\"}', '2020-11-02 14:20:18', '2020-11-02 14:20:18');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:20:18', '2020-11-02 14:20:18');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:20:22', '2020-11-02 14:20:22');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"mobile\":\"13500000001\",\"status\":\"on\",\"level\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-admin.wenbo\\/admin\\/members\"}', '2020-11-02 14:20:26', '2020-11-02 14:20:26');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:20:26', '2020-11-02 14:20:26');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:20:42', '2020-11-02 14:20:42');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:22:45', '2020-11-02 14:22:45');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:22:49', '2020-11-02 14:22:49');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:22:49', '2020-11-02 14:22:49');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:22:55', '2020-11-02 14:22:55');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:22:55', '2020-11-02 14:22:55');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:23:00', '2020-11-02 14:23:00');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:23:02', '2020-11-02 14:23:02');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:23:02', '2020-11-02 14:23:02');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:24:28', '2020-11-02 14:24:28');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:24:31', '2020-11-02 14:24:31');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/members/1', 'GET', '127.0.0.1', '[]', '2020-11-02 14:25:10', '2020-11-02 14:25:10');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:25:14', '2020-11-02 14:25:14');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:25:29', '2020-11-02 14:25:29');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:25:31', '2020-11-02 14:25:31');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:26:27', '2020-11-02 14:26:27');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:26:30', '2020-11-02 14:26:30');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:26:34', '2020-11-02 14:26:34');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:26:35', '2020-11-02 14:26:35');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:26:36', '2020-11-02 14:26:36');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:27:00', '2020-11-02 14:27:00');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:27:12', '2020-11-02 14:27:12');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:30:13', '2020-11-02 14:30:13');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:30:38', '2020-11-02 14:30:38');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-02 14:31:00', '2020-11-02 14:31:00');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:31:14', '2020-11-02 14:31:14');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2020-11-02 14:34:15', '2020-11-02 14:34:15');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:34:17', '2020-11-02 14:34:17');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:34:54', '2020-11-02 14:34:54');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/members/2/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:35:36', '2020-11-02 14:35:36');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '[]', '2020-11-02 14:35:41', '2020-11-02 14:35:41');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:35:43', '2020-11-02 14:35:43');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:35:46', '2020-11-02 14:35:46');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/members/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:35:48', '2020-11-02 14:35:48');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/members/1', 'PUT', '127.0.0.1', '{\"mobile\":\"13500000001\",\"status\":\"on\",\"level\":\"1\",\"_token\":\"cpH7Stvt4LRzOKZT5BqDm8WqnHdtFZudz2V3t6dJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-admin.wenbo\\/admin\\/members\\/1\"}', '2020-11-02 14:35:53', '2020-11-02 14:35:53');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/members/1', 'GET', '127.0.0.1', '[]', '2020-11-02 14:35:54', '2020-11-02 14:35:54');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-02 14:35:58', '2020-11-02 14:35:58');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-11-10 13:59:59', '2020-11-10 13:59:59');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-10 14:00:03', '2020-11-10 14:00:03');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-11-10 15:44:15', '2020-11-10 15:44:15');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-10 15:44:27', '2020-11-10 15:44:27');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-10 15:55:54', '2020-11-10 15:55:54');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-10 15:56:51', '2020-11-10 15:56:51');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-10 15:59:15', '2020-11-10 15:59:15');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-11-14 14:09:15', '2020-11-14 14:09:15');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/test', 'GET', '127.0.0.1', '[]', '2020-11-14 14:09:23', '2020-11-14 14:09:23');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/test', 'GET', '127.0.0.1', '[]', '2020-11-14 14:15:55', '2020-11-14 14:15:55');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-11-14 14:15:59', '2020-11-14 14:15:59');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-11-14 14:16:01', '2020-11-14 14:16:01');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-14 14:20:39', '2020-11-14 14:20:39');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-14 14:21:21', '2020-11-14 14:21:21');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/members', 'GET', '127.0.0.1', '[]', '2020-11-14 14:22:20', '2020-11-14 14:22:20');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 05:27:29', '2021-02-18 05:27:29');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:27:38', '2021-02-18 05:27:38');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:27:41', '2021-02-18 05:27:41');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:27:43', '2021-02-18 05:27:43');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:27:49', '2021-02-18 05:27:49');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 05:29:27', '2021-02-18 05:29:27');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:29:34', '2021-02-18 05:29:34');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 05:29:36', '2021-02-18 05:29:36');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:31:02', '2021-02-18 05:31:02');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:31:13', '2021-02-18 05:31:13');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:32:53', '2021-02-18 05:32:53');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:32:54', '2021-02-18 05:32:54');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 05:32:55', '2021-02-18 05:32:55');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2021-02-18 05:34:10', '2021-02-18 05:34:10');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2021-02-18 10:56:51', '2021-02-18 10:56:51');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2021-02-18 10:56:52', '2021-02-18 10:56:52');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 10:56:54', '2021-02-18 10:56:54');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 10:56:58', '2021-02-18 10:56:58');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:02:25', '2021-02-18 11:02:25');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:02:29', '2021-02-18 11:02:29');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:02:30', '2021-02-18 11:02:30');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:02:32', '2021-02-18 11:02:32');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:02:36', '2021-02-18 11:02:36');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-02-18 11:07:32', '2021-02-18 11:07:32');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-02-18 11:07:33', '2021-02-18 11:07:33');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:07:35', '2021-02-18 11:07:35');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:07:37', '2021-02-18 11:07:37');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:07:37', '2021-02-18 11:07:37');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:07:38', '2021-02-18 11:07:38');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:07:39', '2021-02-18 11:07:39');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2021-02-18 11:08:14', '2021-02-18 11:08:14');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:17', '2021-02-18 11:08:17');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:21', '2021-02-18 11:08:21');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:32', '2021-02-18 11:08:32');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:43', '2021-02-18 11:08:43');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:45', '2021-02-18 11:08:45');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:47', '2021-02-18 11:08:47');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:08:53', '2021-02-18 11:08:53');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:09:06', '2021-02-18 11:09:06');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:09:18', '2021-02-18 11:09:18');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/members/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:09:29', '2021-02-18 11:09:29');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:09:33', '2021-02-18 11:09:33');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"2\"}', '2021-02-18 11:09:46', '2021-02-18 11:09:46');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/members', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":null,\"level\":\"1\"}', '2021-02-18 11:09:50', '2021-02-18 11:09:50');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:10:04', '2021-02-18 11:10:04');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:10:06', '2021-02-18 11:10:06');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:10:10', '2021-02-18 11:10:10');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:10:12', '2021-02-18 11:10:12');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2021-02-18 11:11:16', '2021-02-18 11:11:16');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:11:18', '2021-02-18 11:11:18');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 11:23:35', '2021-02-18 11:23:35');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 11:24:40', '2021-02-18 11:24:40');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 11:24:42', '2021-02-18 11:24:42');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-02-18 11:25:53', '2021-02-18 11:25:53');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:25:56', '2021-02-18 11:25:56');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:25:58', '2021-02-18 11:25:58');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:26:00', '2021-02-18 11:26:00');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:26:01', '2021-02-18 11:26:01');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:26:15', '2021-02-18 11:26:15');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:26:22', '2021-02-18 11:26:22');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-02-18 11:26:26', '2021-02-18 11:26:26');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$10XHD2cyF0dGO2k2TMxM.eXC67\\/mKlaORpeBbEmGNgUyV0wD7LSzO\",\"password_confirmation\":\"$2y$10$10XHD2cyF0dGO2k2TMxM.eXC67\\/mKlaORpeBbEmGNgUyV0wD7LSzO\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"QHChnVXi1u7bvk2Yk9OIumVKoB6rRbAgdWddTC2u\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/p.laravel.admin.member\\/admin\\/auth\\/users\"}', '2021-02-18 11:26:39', '2021-02-18 11:26:39');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2021-02-18 11:26:39', '2021-02-18 11:26:39');
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_permissions_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_permissions` VALUES (1, 1, '2021-02-18 19:08:05', '2021-02-18 19:08:09');
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, '2021-02-18 19:07:15', '2021-02-18 19:07:18');
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_roles_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `admin_roles_slug_unique` (`slug`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-10-28 14:46:59', '2020-10-28 14:46:59');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_user_permissions` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_users_username_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$10XHD2cyF0dGO2k2TMxM.eXC67/mKlaORpeBbEmGNgUyV0wD7LSzO', 'Administrator', NULL, 'E1tyVHQj60eKdzJsNxlm6dxklZe5pvTOjpIsWgxyPRBPXPFIOChCmxR0JvTX', '2020-10-28 14:46:59', '2020-10-28 14:46:59');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_10_24_153336_minprogram_member_tables', 2);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
