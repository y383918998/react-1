/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : yy

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 23/11/2023 10:11:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_action
-- ----------------------------
DROP TABLE IF EXISTS `t_action`;
CREATE TABLE `t_action`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ActionCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作编码',
  `ActionName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `Position` int NULL DEFAULT NULL COMMENT '显示位置（1：表单内，2：表单右上）',
  `Icon` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `Method` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `Remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '说明',
  `OrderBy` int NULL DEFAULT NULL COMMENT '排序号',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '更新者',
  `ClassName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式名称',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_action
-- ----------------------------
INSERT INTO `t_action` VALUES (1, 'Add', '添加', 1, 'icon-add', 'Add', NULL, 0, b'1', '2019-02-28 14:44:33', '2019-06-15 23:32:07', 0, 1, NULL);
INSERT INTO `t_action` VALUES (2, 'edit', '编辑', 0, 'icon-bianji', 'edit', NULL, 0, b'1', '2019-02-28 14:44:36', '2019-02-28 14:45:21', 0, 0, NULL);
INSERT INTO `t_action` VALUES (3, 'detail', '查看', 0, 'icon-chakan', 'detail', NULL, 0, b'1', '2019-02-28 14:44:39', '2019-02-28 14:45:24', 0, 0, 'layui-btn-normal');
INSERT INTO `t_action` VALUES (4, 'del', '删除', 0, 'icon-guanbi', 'del', NULL, 0, b'1', '2019-02-28 14:44:42', '2019-02-28 14:45:27', 0, 0, 'layui-btn-danger');
INSERT INTO `t_action` VALUES (5, 'reset', '重置密码', 0, 'icon-reset', 'reset', NULL, 0, b'1', '2019-02-28 14:44:45', '2019-06-15 23:34:55', 0, 1, 'layui-btn-warm');
INSERT INTO `t_action` VALUES (6, 'assign', '分配权限', 0, 'icon-jiaoseguanli', 'assign', NULL, 0, b'1', '2019-02-28 14:44:48', '2019-02-28 14:45:34', 0, 0, NULL);
INSERT INTO `t_action` VALUES (7, 'BatchDel', '批量删除', 1, 'icon-shanchu', 'BatchDel', NULL, 0, b'1', '2019-06-15 23:34:15', '0001-01-01 00:00:00', 1, 0, NULL);
INSERT INTO `t_action` VALUES (8, 'menu_action', '菜单权限', 0, 'icon-setting-permissions', 'menu_action', NULL, 0, b'1', '2019-06-17 17:00:29', '0001-01-01 00:00:00', 1, 0, NULL);
INSERT INTO `t_action` VALUES (9, 'fz', '复制', 1, 'icon-add', 'fz', NULL, 0, b'1', '2019-02-28 14:44:33', '2019-06-15 23:32:07', 0, 1, NULL);

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LogType` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `UserName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `RealName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作账户',
  `ModuleName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志模块',
  `Description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志描述',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `IPAddress` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `IPAddressName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IP所在地',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-15 22:56:18', '192.168.1.2', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (2, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-06-15 23:11:59', '192.168.1.2', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (3, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2019-06-15 23:12:04', '192.168.1.2', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (28, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-21 16:29:05', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (29, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2023-11-21 16:32:59', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (30, 'Login', 'test2', 'test2', '系统登录', '登录成功', '2023-11-21 16:33:04', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (31, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-21 16:36:15', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (32, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2023-11-21 16:36:42', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (33, 'Login', 'test2', 'test2', '系统登录', '登录成功', '2023-11-21 16:36:47', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (34, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-21 16:55:05', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (35, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2023-11-21 16:55:16', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (36, 'Login', 'test2', 'test2', '系统登录', '登录成功', '2023-11-21 16:55:22', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (37, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-21 17:23:45', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (38, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 14:53:41', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (39, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:13:02', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (40, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:33:46', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (41, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:36:34', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (42, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:38:46', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (43, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:42:07', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (44, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:45:14', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (45, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:47:51', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (46, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:49:31', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (47, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:51:10', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (48, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2023-11-22 15:54:27', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (49, 'Login', 'test2', 'test2', '系统登录', '登录成功', '2023-11-22 15:54:32', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (50, 'Exit', 'test2', 'test2', NULL, '安全退出系统', '2023-11-22 15:56:24', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (51, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-22 15:56:29', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (52, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-23 10:06:00', '172.17.96.1', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (53, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2023-11-23 10:10:44', '172.17.96.1', '本地局域网', b'1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MenuName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `MenuUrl` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `MenuIcon` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `OrderNo` tinyint NULL DEFAULT 0 COMMENT '排序号',
  `ParentId` int NULL DEFAULT 0 COMMENT '父菜单',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '编辑者',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '权限管理', NULL, 'icon-setting-permissions', 0, 0, b'1', '2019-02-28 15:03:14', '2019-06-17 17:11:25', 0, 1);
INSERT INTO `t_menu` VALUES (2, '菜单管理', '/permissions/menu', 'icon-caidan', 1, 1, b'1', '2019-02-28 15:03:20', '2019-02-28 15:03:23', 0, 0);
INSERT INTO `t_menu` VALUES (3, '角色管理', '/permissions/role', 'icon-jiaoseguanli', 2, 1, b'1', '2019-02-28 15:03:25', '2019-02-28 15:03:29', 0, 0);
INSERT INTO `t_menu` VALUES (4, '用户管理', '/permissions/user', 'icon-yonghu', 3, 1, b'1', '2019-02-28 15:03:32', '2019-02-28 15:03:35', 0, 0);
INSERT INTO `t_menu` VALUES (6, '系统设置', NULL, 'icon-xitong', 0, 0, b'1', '2019-02-28 15:03:46', '2019-02-28 15:03:48', 0, 0);
INSERT INTO `t_menu` VALUES (8, '基本资料', '/SysSet/info', 'icon-jibenziliao', 2, 6, b'1', '2019-02-28 15:03:56', '2019-02-28 15:03:58', 0, 0);
INSERT INTO `t_menu` VALUES (9, '修改密码', '/SysSet/password', 'icon-xiugaimima', 3, 6, b'1', '2019-02-28 15:04:02', '2019-02-28 15:04:05', 0, 0);
INSERT INTO `t_menu` VALUES (11, '日常管理', NULL, 'icon-xitongrizhi', 0, 0, b'1', '2023-11-22 14:54:15', '0001-01-01 00:00:00', 1, 0);
INSERT INTO `t_menu` VALUES (12, '日程排期', '/Business/Work', 'icon-shezhi', 0, 11, b'1', '2023-11-22 14:54:39', '2023-11-22 15:16:53', 1, 1);

-- ----------------------------
-- Table structure for t_menu_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_action`;
CREATE TABLE `t_menu_action`  (
  `MenuId` int NULL DEFAULT NULL COMMENT '菜单ID',
  `ActionId` int NULL DEFAULT NULL COMMENT '操作ID',
  UNIQUE INDEX `idx_MenuId_ActionId`(`MenuId`, `ActionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu_action
-- ----------------------------
INSERT INTO `t_menu_action` VALUES (2, 1);
INSERT INTO `t_menu_action` VALUES (2, 2);
INSERT INTO `t_menu_action` VALUES (2, 4);
INSERT INTO `t_menu_action` VALUES (2, 8);
INSERT INTO `t_menu_action` VALUES (3, 1);
INSERT INTO `t_menu_action` VALUES (3, 2);
INSERT INTO `t_menu_action` VALUES (3, 3);
INSERT INTO `t_menu_action` VALUES (3, 4);
INSERT INTO `t_menu_action` VALUES (3, 6);
INSERT INTO `t_menu_action` VALUES (4, 1);
INSERT INTO `t_menu_action` VALUES (4, 2);
INSERT INTO `t_menu_action` VALUES (4, 3);
INSERT INTO `t_menu_action` VALUES (4, 4);
INSERT INTO `t_menu_action` VALUES (4, 5);
INSERT INTO `t_menu_action` VALUES (5, 1);
INSERT INTO `t_menu_action` VALUES (5, 2);
INSERT INTO `t_menu_action` VALUES (5, 3);
INSERT INTO `t_menu_action` VALUES (5, 4);
INSERT INTO `t_menu_action` VALUES (10, 4);
INSERT INTO `t_menu_action` VALUES (10, 7);
INSERT INTO `t_menu_action` VALUES (12, 1);
INSERT INTO `t_menu_action` VALUES (12, 4);
INSERT INTO `t_menu_action` VALUES (12, 9);

-- ----------------------------
-- Table structure for t_menu_role_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role_action`;
CREATE TABLE `t_menu_role_action`  (
  `MenuId` int NULL DEFAULT NULL COMMENT '菜单ID',
  `RoleId` int NULL DEFAULT NULL COMMENT '角色ID',
  `ActionId` int NULL DEFAULT NULL COMMENT '操作ID',
  UNIQUE INDEX `idx_RoleId_MenuId`(`MenuId`, `RoleId`, `ActionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu_role_action
-- ----------------------------
INSERT INTO `t_menu_role_action` VALUES (1, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 8);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 6);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 5);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (6, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (6, 4, 0);
INSERT INTO `t_menu_role_action` VALUES (7, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (8, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (8, 4, 0);
INSERT INTO `t_menu_role_action` VALUES (9, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (9, 4, 0);
INSERT INTO `t_menu_role_action` VALUES (11, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (11, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (12, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 9);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `RoleCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `RoleName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `Remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态(1:有效，0：无效）',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '超级管理员', '超级管理员', NULL, b'1', '2019-02-28 15:34:59', '2023-11-21 16:31:15', 0, 1);
INSERT INTO `t_role` VALUES (4, '医生', '医生', '医生', b'1', '2023-11-21 16:30:00', '0001-01-01 00:00:00', 1, 0);
INSERT INTO `t_role` VALUES (5, '患者', '患者', '患者', b'1', '2023-11-21 16:30:14', '0001-01-01 00:00:00', 1, 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UserName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名（登录）',
  `RealName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `PassWord` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `RoleId` int NULL DEFAULT NULL COMMENT '角色ID',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '修改者',
  `Gender` tinyint NULL DEFAULT NULL COMMENT '性别（0：男，1：女）',
  `Phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机',
  `Email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `Remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `HeadShot` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `Department` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '科室',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1, b'1', '2019-02-28 16:18:52', '2019-06-20 09:53:05', 0, 1, 1, '11111111111', '123456@qq.com', '最高权限', '/Upload/img/502.jpg', NULL);
INSERT INTO `t_user` VALUES (4, 'test1', 'test1', 'e10adc3949ba59abbe56e057f20f883e', 5, b'0', '2023-11-21 16:32:09', '0001-01-01 00:00:00', 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (5, 'test2', 'test2', 'e10adc3949ba59abbe56e057f20f883e', 4, b'1', '2023-11-21 16:32:54', '2023-11-21 17:08:30', 1, 5, 0, '11231231231', '1510178756@gmail.com', NULL, '/Upload/img/people@3x.png', '家庭医生');

-- ----------------------------
-- Table structure for t_work
-- ----------------------------
DROP TABLE IF EXISTS `t_work`;
CREATE TABLE `t_work`  (
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '修改者',
  `Id` int NOT NULL AUTO_INCREMENT,
  `BeginTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `UId` int NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_work
-- ----------------------------
INSERT INTO `t_work` VALUES (NULL, '2023-11-22 15:45:39', '0001-01-01 00:00:00', 1, 0, 3, '2023-11-22 15:45:33', '2023-11-30 00:00:00', 5);
INSERT INTO `t_work` VALUES (NULL, '2023-11-22 15:48:11', '0001-01-01 00:00:00', 1, 0, 4, '2023-11-22 00:00:00', '2023-11-30 00:00:00', 5);

SET FOREIGN_KEY_CHECKS = 1;
