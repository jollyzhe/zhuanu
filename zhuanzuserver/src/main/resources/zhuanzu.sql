/*
Date: 2020-05-12 18:36:12
*/

CREATE DATABASE `zhuanzu` DEFAULT CHARACTER SET utf8;

USE `zhuanzu`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `gender` int(1) DEFAULT NULL COMMENT '性别 0男  1女',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `is_del` int(1) DEFAULT 0 COMMENT '是否删除 0为未删除 1为删除',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` Date DEFAULT NULL COMMENT '创建日期',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_time` Date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8  COMMENT='用户表';


-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(64) DEFAULT NULL COMMENT '省份code',
  `name` varchar(64) DEFAULT NULL COMMENT '省份名称',
  `is_del` int(1) DEFAULT 0 COMMENT '是否删除 0为未删除 1为删除',
 `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` Date DEFAULT NULL COMMENT '创建日期',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_time` Date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='省份表';

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `province_code` varchar(64) DEFAULT NULL COMMENT '省份code',
  `province_name` varchar(64) DEFAULT NULL COMMENT '省份名称',
  `code` varchar(64) DEFAULT NULL COMMENT '城市code',
  `name` varchar(64) DEFAULT NULL COMMENT '城市名称',
  `is_del` int(1) DEFAULT 0 COMMENT '是否删除 0为未删除 1为删除',
  `create_id` int(11) DEFAULT NULL COMMENT '创建人id',
  `create_time` Date DEFAULT NULL COMMENT '创建日期',
  `modified_id` int(11) DEFAULT NULL COMMENT '修改人id',
  `modified_time` Date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8  COMMENT='城市表';


