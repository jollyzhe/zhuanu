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
  `nickname` varchar(64) DEFAULT NULL COMMENT '  ',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `enabled` tinyint(1) DEFAULT '1',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `address` varchar(255) DEFAULT NULL COMMENT '  ',
  `regTime` datetime DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '  ',
  `mdContent` text COMMENT 'md文件源码',
  `htmlContent` text COMMENT 'html源码',
  `summary` text,
  `cid` int(11) DEFAULT NULL COMMENT '  ',
  `uid` int(11) DEFAULT NULL COMMENT '  ',
  `publishDate` datetime DEFAULT NULL COMMENT '  ',
  `editTime` datetime DEFAULT NULL COMMENT '  ',
  `state` int(11) DEFAULT NULL COMMENT '0表示草稿箱，1表示已发表，2表示已删除',
  `pageView` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`id`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) DEFAULT NULL COMMENT '  ',
  `tid` int(11) DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `article_tags_ibfk_1` (`aid`),
  CONSTRAINT `article_tags_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_tags_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cateName` varchar(64) DEFAULT NULL COMMENT '  ',
  `date` date DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('56', 'Vue22', '2017-12-21');
INSERT INTO `category` VALUES ('58', '人生感悟', '2017-12-21');
INSERT INTO `category` VALUES ('60', 'JavaEE', '2017-12-21');
INSERT INTO `category` VALUES ('61', 'Git', '2017-12-21');
INSERT INTO `category` VALUES ('62', 'Linux', '2017-12-21');
INSERT INTO `category` VALUES ('64', 'MongoDB', '2017-12-23');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `aid` int(11) DEFAULT NULL COMMENT '  ',
  `content` text,
  `publishDate` datetime DEFAULT NULL COMMENT '  ',
  `parentId` int(11) DEFAULT NULL COMMENT '-1表示正常回复，其他值表示是评论的回复',
  `uid` int(11) DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for pv
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `countDate` date DEFAULT NULL COMMENT '  ',
  `pv` int(11) DEFAULT NULL COMMENT '  ',
  `uid` int(11) DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`),
  KEY `pv_ibfk_1` (`uid`),
  CONSTRAINT `pv_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pv
-- ----------------------------
INSERT INTO `pv` VALUES ('1', '2017-12-24', '20', '6');
INSERT INTO `pv` VALUES ('2', '2017-12-24', '14', '7');
INSERT INTO `pv` VALUES ('4', '2017-12-25', '40', '6');
INSERT INTO `pv` VALUES ('5', '2017-12-25', '23', '7');
INSERT INTO `pv` VALUES ('6', '2017-12-26', '11', '6');
INSERT INTO `pv` VALUES ('7', '2017-12-26', '32', '7');
INSERT INTO `pv` VALUES ('26', '2017-12-23', '2', '6');
INSERT INTO `pv` VALUES ('27', '2017-12-23', '77', '7');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员');
INSERT INTO `roles` VALUES ('2', '普通用户');
INSERT INTO `roles` VALUES ('3', '测试角色1');
INSERT INTO `roles` VALUES ('4', '测试角色2');
INSERT INTO `roles` VALUES ('5', '测试角色3');

-- ----------------------------
-- Table structure for roles_user
-- ----------------------------
DROP TABLE IF EXISTS `roles_user`;
CREATE TABLE `roles_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` int(11) DEFAULT '2',
  `uid` int(11) DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `roles_user_ibfk_2` (`uid`),
  CONSTRAINT `roles_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_user
-- ----------------------------
INSERT INTO `roles_user` VALUES ('8', '2', '7');
INSERT INTO `roles_user` VALUES ('9', '1', '7');
INSERT INTO `roles_user` VALUES ('17', '5', '7');
INSERT INTO `roles_user` VALUES ('106', '2', '14');
INSERT INTO `roles_user` VALUES ('108', '2', '16');
INSERT INTO `roles_user` VALUES ('109', '2', '17');
INSERT INTO `roles_user` VALUES ('110', '2', '18');
INSERT INTO `roles_user` VALUES ('111', '2', '19');
INSERT INTO `roles_user` VALUES ('112', '2', '20');
INSERT INTO `roles_user` VALUES ('119', '2', '15');
INSERT INTO `roles_user` VALUES ('120', '5', '15');
INSERT INTO `roles_user` VALUES ('121', '2', '6');
INSERT INTO `roles_user` VALUES ('123', '2', '13');
INSERT INTO `roles_user` VALUES ('124', '3', '13');
INSERT INTO `roles_user` VALUES ('128', '2', '10');
INSERT INTO `roles_user` VALUES ('129', '5', '10');
INSERT INTO `roles_user` VALUES ('130', '1', '6');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tagName` varchar(32) DEFAULT NULL COMMENT '  ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagName` (`tagName`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('66', '666');
INSERT INTO `tags` VALUES ('35', 'Ajax');
INSERT INTO `tags` VALUES ('36', 'Dubbo');
INSERT INTO `tags` VALUES ('40', 'git');
INSERT INTO `tags` VALUES ('33', 'Linux');
INSERT INTO `tags` VALUES ('45', 'mongodb');
INSERT INTO `tags` VALUES ('42', 'spring');
INSERT INTO `tags` VALUES ('44', 'SpringSecurity');
INSERT INTO `tags` VALUES ('37', 'websocket');
INSERT INTO `tags` VALUES ('34', 'Zookeeper');
INSERT INTO `tags` VALUES ('50', '图片上传');
INSERT INTO `tags` VALUES ('51', '图片预览');
INSERT INTO `tags` VALUES ('41', '学习资料');
INSERT INTO `tags` VALUES ('65', '杂谈');
