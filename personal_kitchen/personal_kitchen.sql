/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : personal_kitchen

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-26 00:24:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cookbook
-- ----------------------------
DROP TABLE IF EXISTS `cookbook`;
CREATE TABLE `cookbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '菜谱标题',
  `detail` longtext COMMENT '菜谱',
  `uuid` int(10) unsigned NOT NULL COMMENT '菜谱创建者',
  `creat_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '菜谱创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_cookbook` (`uuid`,`title`) USING BTREE COMMENT '用户菜谱索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜谱表';

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '菜谱分类名',
  `uuid` int(11) unsigned NOT NULL COMMENT '创建菜谱分类的用户id',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '菜谱分类添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_menu` (`uuid`,`name`) USING BTREE COMMENT '用户所属菜谱分类索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜谱分类表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uuid` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '用户唯一id',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `create_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '用户创建时间',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `name_email` (`name`,`password`) USING BTREE,
  KEY `name` (`name`,`email`,`password`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
