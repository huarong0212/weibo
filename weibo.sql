/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : weibo

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2015-01-18 13:40:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for weibo_approve
-- ----------------------------
DROP TABLE IF EXISTS `weibo_approve`;
CREATE TABLE `weibo_approve` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `name` varchar(20) NOT NULL COMMENT '认证名称',
  `info` varchar(255) NOT NULL COMMENT '认证资料',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '认证状态',
  `create` int(10) unsigned NOT NULL COMMENT '申请时间',
  `uid` int(10) unsigned NOT NULL COMMENT '用户登录的ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_approve
-- ----------------------------
INSERT INTO `weibo_approve` VALUES ('2', '马云', '阿里巴巴董事局主席，淘宝网创始人！', '1', '1420551253', '7');

-- ----------------------------
-- Table structure for weibo_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `weibo_auth_group`;
CREATE TABLE `weibo_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_auth_group
-- ----------------------------
INSERT INTO `weibo_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5,6');
INSERT INTO `weibo_auth_group` VALUES ('2', '普通管理员', '1', '2,3,4,5');
INSERT INTO `weibo_auth_group` VALUES ('3', '认证专员', '1', '3');
INSERT INTO `weibo_auth_group` VALUES ('6', '会员专员', '1', '2,3');

-- ----------------------------
-- Table structure for weibo_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `weibo_auth_group_access`;
CREATE TABLE `weibo_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_auth_group_access
-- ----------------------------
INSERT INTO `weibo_auth_group_access` VALUES ('1', '1');
INSERT INTO `weibo_auth_group_access` VALUES ('2', '2');
INSERT INTO `weibo_auth_group_access` VALUES ('3', '3');
INSERT INTO `weibo_auth_group_access` VALUES ('5', '6');

-- ----------------------------
-- Table structure for weibo_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `weibo_auth_rule`;
CREATE TABLE `weibo_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_auth_rule
-- ----------------------------
INSERT INTO `weibo_auth_rule` VALUES ('1', 'Admin/Manage/', '管理员管理', '1', '1', '');
INSERT INTO `weibo_auth_rule` VALUES ('2', 'Admin/User/', '会员列表', '1', '1', '');
INSERT INTO `weibo_auth_rule` VALUES ('3', 'Admin/Approve/', '认证审核', '1', '1', '');
INSERT INTO `weibo_auth_rule` VALUES ('4', 'Admin/Topic/', '微博管理', '1', '1', '');
INSERT INTO `weibo_auth_rule` VALUES ('5', 'Admin/Comment/', '评论管理', '1', '1', '');
INSERT INTO `weibo_auth_rule` VALUES ('6', 'Admin/AuthGroup/', '权限控制', '1', '1', '');

-- ----------------------------
-- Table structure for weibo_comment
-- ----------------------------
DROP TABLE IF EXISTS `weibo_comment`;
CREATE TABLE `weibo_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论的ID',
  `content` char(255) NOT NULL COMMENT '评论的内容',
  `create` int(10) unsigned NOT NULL COMMENT '评论发布时间',
  `ip` int(10) unsigned NOT NULL COMMENT 'IP',
  `tid` int(10) unsigned NOT NULL COMMENT '微博的ID',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `tid` (`tid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_comment
-- ----------------------------
INSERT INTO `weibo_comment` VALUES ('4', '在原微博评论一次！', '1414317462', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('5', '在原微博评论第二次！', '1414317470', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('6', '在转播的微博评论一次！', '1414317502', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('7', '我要评论很多内容呢！@蜡笔小新 ，你说呢？我要评论很多内容呢！@蜡笔小新 ，你说呢？我要评论很多内容呢！@蜡笔小新 ，你说呢？我要评论很多内容呢！@蜡笔小新 ，你说呢？我要评论很多内容呢！@蜡笔小新 ，你说呢？', '1414558128', '2130706433', '137', '10');
INSERT INTO `weibo_comment` VALUES ('8', '各种各样的评论呢！', '1414558144', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('9', '评论系统开始制作！', '1414558154', '2130706433', '137', '9');
INSERT INTO `weibo_comment` VALUES ('10', '这个评论可以@用户呢！', '1414558171', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('11', '我要发表一个评论！~', '1414558184', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('12', '你要不要也来一条评论呢？', '1414558194', '2130706433', '137', '9');
INSERT INTO `weibo_comment` VALUES ('13', '他也需要一条评论呢！', '1414558201', '2130706433', '137', '19');
INSERT INTO `weibo_comment` VALUES ('14', '这张图片不错啊，系统自带的吧？', '1414558212', '2130706433', '137', '10');

-- ----------------------------
-- Table structure for weibo_image
-- ----------------------------
DROP TABLE IF EXISTS `weibo_image`;
CREATE TABLE `weibo_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `data` char(200) NOT NULL COMMENT '微博配图URL的JSON格式',
  `tid` int(10) unsigned NOT NULL COMMENT '配图绑定微博的ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_image
-- ----------------------------
INSERT INTO `weibo_image` VALUES ('59', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_5408606703d09.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_5408606703d09.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/5408606703d09.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('60', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_54086067a7d8c.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_54086067a7d8c.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/54086067a7d8c.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('61', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_540860684c4b4.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_540860684c4b4.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/540860684c4b4.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('62', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_54086068e1113.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_54086068e1113.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/54086068e1113.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('63', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_5408606990f56.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_5408606990f56.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/5408606990f56.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('64', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_5408606a3567e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_5408606a3567e.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/5408606a3567e.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('65', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_5408606b00000.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_5408606b00000.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/5408606b00000.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('66', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_5408606b98968.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_5408606b98968.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/5408606b98968.jpg\"}', '39');
INSERT INTO `weibo_image` VALUES ('67', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_5408608c632ea.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_5408608c632ea.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/5408608c632ea.jpg\"}', '40');
INSERT INTO `weibo_image` VALUES ('68', '{\"thumb\":\".\\/Uploads\\/2014-09-04\\/180_54086093ec82e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-04\\/550_54086093ec82e.jpg\",\"source\":\".\\/Uploads\\/2014-09-04\\/54086093ec82e.jpg\"}', '41');
INSERT INTO `weibo_image` VALUES ('69', '{\"thumb\":\".\\/Uploads\\/2014-09-10\\/180_540fa89253ec6.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-10\\/550_540fa89253ec6.jpg\",\"source\":\".\\/Uploads\\/2014-09-10\\/540fa89253ec6.jpg\"}', '45');
INSERT INTO `weibo_image` VALUES ('70', '{\"thumb\":\".\\/Uploads\\/2014-09-10\\/180_540fa893632ea.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-10\\/550_540fa893632ea.jpg\",\"source\":\".\\/Uploads\\/2014-09-10\\/540fa893632ea.jpg\"}', '45');
INSERT INTO `weibo_image` VALUES ('71', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541262bc8583b.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541262bc8583b.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541262bc8583b.jpg\"}', '48');
INSERT INTO `weibo_image` VALUES ('72', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541262f4b34a7.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541262f4b34a7.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541262f4b34a7.jpg\"}', '50');
INSERT INTO `weibo_image` VALUES ('73', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412642f57bcf.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412642f57bcf.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412642f57bcf.jpg\"}', '54');
INSERT INTO `weibo_image` VALUES ('74', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541264387270e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541264387270e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541264387270e.jpg\"}', '55');
INSERT INTO `weibo_image` VALUES ('75', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541264397a120.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541264397a120.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541264397a120.jpg\"}', '55');
INSERT INTO `weibo_image` VALUES ('76', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_54126565baeb9.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_54126565baeb9.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/54126565baeb9.jpg\"}', '59');
INSERT INTO `weibo_image` VALUES ('77', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412658181b32.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412658181b32.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412658181b32.jpg\"}', '60');
INSERT INTO `weibo_image` VALUES ('78', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541265e944aa2.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541265e944aa2.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541265e944aa2.jpg\"}', '61');
INSERT INTO `weibo_image` VALUES ('79', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412666c487ab.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412666c487ab.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412666c487ab.jpg\"}', '62');
INSERT INTO `weibo_image` VALUES ('80', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541266a031975.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541266a031975.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541266a031975.jpg\"}', '63');
INSERT INTO `weibo_image` VALUES ('81', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541268c944aa2.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541268c944aa2.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541268c944aa2.jpg\"}', '68');
INSERT INTO `weibo_image` VALUES ('82', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541268d098968.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541268d098968.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541268d098968.jpg\"}', '69');
INSERT INTO `weibo_image` VALUES ('83', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_541268d198968.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_541268d198968.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/541268d198968.jpg\"}', '69');
INSERT INTO `weibo_image` VALUES ('84', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_54126a1398968.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_54126a1398968.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/54126a1398968.jpg\"}', '73');
INSERT INTO `weibo_image` VALUES ('85', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_54126a9500000.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_54126a9500000.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/54126a9500000.jpg\"}', '74');
INSERT INTO `weibo_image` VALUES ('86', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_54126affc28cb.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_54126affc28cb.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/54126affc28cb.jpg\"}', '75');
INSERT INTO `weibo_image` VALUES ('87', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_54126b2b632ea.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_54126b2b632ea.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/54126b2b632ea.jpg\"}', '76');
INSERT INTO `weibo_image` VALUES ('88', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f320aba95.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f320aba95.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f320aba95.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('89', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f3216acfc.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f3216acfc.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f3216acfc.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('90', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f3221ab3f.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f3221ab3f.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f3221ab3f.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('91', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f322baeb9.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f322baeb9.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f322baeb9.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('92', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f32366ff3.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f32366ff3.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f32366ff3.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('93', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f32416e36.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f32416e36.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f32416e36.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('94', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f324b34a7.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f324b34a7.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f324b34a7.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('95', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f3258d24d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f3258d24d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f3258d24d.jpg\"}', '78');
INSERT INTO `weibo_image` VALUES ('96', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f45139387.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f45139387.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f45139387.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('97', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f451d9701.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f451d9701.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f451d9701.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('98', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f45290f56.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f45290f56.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f45290f56.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('99', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4532dc6c.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4532dc6c.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4532dc6c.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('100', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f453cdfe6.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f453cdfe6.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f453cdfe6.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('101', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4547de29.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4547de29.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4547de29.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('102', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4551ab3f.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4551ab3f.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4551ab3f.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('103', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f455c28cb.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f455c28cb.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f455c28cb.jpg\"}', '79');
INSERT INTO `weibo_image` VALUES ('104', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4786ea05.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4786ea05.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4786ea05.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('105', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4791e848.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4791e848.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4791e848.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('106', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f479baeb9.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f479baeb9.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f479baeb9.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('107', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f47a57bcf.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f47a57bcf.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f47a57bcf.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('108', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f47b00000.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f47b00000.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f47b00000.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('109', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f47b94c5f.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f47b94c5f.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f47b94c5f.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('110', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f47c57bcf.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f47c57bcf.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f47c57bcf.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('111', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f47cf0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f47cf0537.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f47cf0537.jpg\"}', '80');
INSERT INTO `weibo_image` VALUES ('112', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4a8af79e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4a8af79e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4a8af79e.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('113', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4a95b8d8.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4a95b8d8.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4a95b8d8.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('114', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4aa0b71b.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4aa0b71b.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4aa0b71b.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('115', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4aa9c671.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4aa9c671.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4aa9c671.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('116', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4ab487ab.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4ab487ab.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4ab487ab.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('117', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4abe8b25.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4abe8b25.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4abe8b25.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('118', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4ac8d24d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4ac8d24d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4ac8d24d.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('119', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4ad7270e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4ad7270e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4ad7270e.jpg\"}', '81');
INSERT INTO `weibo_image` VALUES ('120', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cb2625a.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cb2625a.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cb2625a.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('121', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cbc65d4.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cbc65d4.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cbc65d4.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('122', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cc7270e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cc7270e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cc7270e.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('123', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cd16e36.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cd16e36.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cd16e36.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('124', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cdaf79e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cdaf79e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cdaf79e.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('125', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4ce5f5e1.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4ce5f5e1.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4ce5f5e1.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('126', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cef0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cef0537.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cef0537.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('127', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4cfa7d8c.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4cfa7d8c.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4cfa7d8c.jpg\"}', '82');
INSERT INTO `weibo_image` VALUES ('128', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4f689544.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4f689544.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4f689544.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('129', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4f739387.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4f739387.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4f739387.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('130', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4f7d9701.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4f7d9701.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4f7d9701.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('131', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4f87de29.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4f87de29.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4f87de29.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('132', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4f931975.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4f931975.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4f931975.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('133', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4f9cdfe6.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4f9cdfe6.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4f9cdfe6.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('134', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4fa6acfc.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4fa6acfc.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4fa6acfc.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('135', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f4fb16e36.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f4fb16e36.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f4fb16e36.jpg\"}', '83');
INSERT INTO `weibo_image` VALUES ('136', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f636e1113.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f636e1113.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f636e1113.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('137', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6378d24d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6378d24d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6378d24d.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('138', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6382dc6c.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6382dc6c.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6382dc6c.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('139', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f638d1cef.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f638d1cef.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f638d1cef.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('140', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6397a120.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6397a120.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6397a120.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('141', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f63a1ab3f.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f63a1ab3f.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f63a1ab3f.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('142', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f63aaba95.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f63aaba95.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f63aaba95.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('143', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f63b501bd.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f63b501bd.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f63b501bd.jpg\"}', '84');
INSERT INTO `weibo_image` VALUES ('144', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f67176417.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f67176417.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f67176417.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('145', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6721e848.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6721e848.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6721e848.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('146', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f672bebc2.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f672bebc2.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f672bebc2.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('147', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f67357bcf.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f67357bcf.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f67357bcf.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('148', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f673f0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f673f0537.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f673f0537.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('149', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f67498968.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f67498968.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f67498968.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('150', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6753d090.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6753d090.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6753d090.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('151', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f675d9701.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f675d9701.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f675d9701.jpg\"}', '85');
INSERT INTO `weibo_image` VALUES ('152', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f69776417.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f69776417.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f69776417.jpg\"}', '86');
INSERT INTO `weibo_image` VALUES ('153', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6987270e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6987270e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6987270e.jpg\"}', '86');
INSERT INTO `weibo_image` VALUES ('154', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6b21e848.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6b21e848.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6b21e848.jpg\"}', '87');
INSERT INTO `weibo_image` VALUES ('155', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f6b339387.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f6b339387.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f6b339387.jpg\"}', '87');
INSERT INTO `weibo_image` VALUES ('156', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f70c0b71b.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f70c0b71b.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f70c0b71b.jpg\"}', '88');
INSERT INTO `weibo_image` VALUES ('157', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f70cf0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f70cf0537.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f70cf0537.jpg\"}', '88');
INSERT INTO `weibo_image` VALUES ('158', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f7161312d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f7161312d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f7161312d.jpg\"}', '89');
INSERT INTO `weibo_image` VALUES ('159', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f72fd59f8.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f72fd59f8.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f72fd59f8.jpg\"}', '90');
INSERT INTO `weibo_image` VALUES ('160', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f77eca2dd.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f77eca2dd.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f77eca2dd.jpg\"}', '91');
INSERT INTO `weibo_image` VALUES ('161', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f7c803d09.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f7c803d09.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f7c803d09.jpg\"}', '92');
INSERT INTO `weibo_image` VALUES ('162', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f848cdfe6.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f848cdfe6.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f848cdfe6.jpg\"}', '93');
INSERT INTO `weibo_image` VALUES ('163', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d01312d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d01312d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d01312d.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('164', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d0baeb9.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d0baeb9.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d0baeb9.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('165', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d166ff3.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d166ff3.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d166ff3.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('166', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d20b71b.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d20b71b.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d20b71b.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('167', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d2baeb9.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d2baeb9.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d2baeb9.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('168', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d35b8d8.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d35b8d8.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d35b8d8.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('169', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d3f0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d3f0537.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d3f0537.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('170', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412f9d49c671.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412f9d49c671.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412f9d49c671.jpg\"}', '94');
INSERT INTO `weibo_image` VALUES ('171', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa20af79e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa20af79e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa20af79e.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('172', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa215f5e1.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa215f5e1.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa215f5e1.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('173', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa220b71b.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa220b71b.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa220b71b.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('174', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa22a4083.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa22a4083.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa22a4083.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('175', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa2353ec6.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa2353ec6.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa2353ec6.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('176', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa23ec82e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa23ec82e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa23ec82e.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('177', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa2490f56.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa2490f56.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa2490f56.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('178', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa253d090.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa253d090.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa253d090.jpg\"}', '95');
INSERT INTO `weibo_image` VALUES ('179', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa411312d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa411312d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa411312d.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('180', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa41b34a7.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa41b34a7.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa41b34a7.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('181', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa425f5e1.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa425f5e1.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa425f5e1.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('182', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa431312d.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa431312d.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa431312d.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('183', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa43af79e.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa43af79e.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa43af79e.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('184', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa445f5e1.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa445f5e1.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa445f5e1.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('185', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa44f0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa44f0537.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa44f0537.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('186', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa4598968.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa4598968.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa4598968.jpg\"}', '96');
INSERT INTO `weibo_image` VALUES ('187', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa8dd59f8.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa8dd59f8.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa8dd59f8.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('188', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa8e8583b.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa8e8583b.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa8e8583b.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('189', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa8f31975.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa8f31975.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa8f31975.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('190', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa8fc65d4.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa8fc65d4.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa8fc65d4.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('191', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa906ea05.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa906ea05.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa906ea05.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('192', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa911e848.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa911e848.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa911e848.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('193', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa91aba95.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa91aba95.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa91aba95.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('194', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412fa92501bd.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412fa92501bd.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412fa92501bd.jpg\"}', '97');
INSERT INTO `weibo_image` VALUES ('195', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412faad66ff3.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412faad66ff3.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412faad66ff3.jpg\"}', '98');
INSERT INTO `weibo_image` VALUES ('196', '{\"thumb\":\".\\/Uploads\\/2014-09-12\\/180_5412faae632ea.jpg\",\"unfold\":\".\\/Uploads\\/2014-09-12\\/550_5412faae632ea.jpg\",\"source\":\".\\/Uploads\\/2014-09-12\\/5412faae632ea.jpg\"}', '98');
INSERT INTO `weibo_image` VALUES ('197', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447befcb34a7.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447befcb34a7.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447befcb34a7.jpg\"}', '130');
INSERT INTO `weibo_image` VALUES ('198', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c074c28cb.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c074c28cb.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c074c28cb.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('199', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c075d1cef.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c075d1cef.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c075d1cef.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('200', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c07698968.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c07698968.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c07698968.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('201', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c0775b8d8.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c0775b8d8.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c0775b8d8.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('202', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c0781ab3f.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c0781ab3f.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c0781ab3f.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('203', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c078d59f8.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c078d59f8.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c078d59f8.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('204', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c079a7d8c.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c079a7d8c.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c079a7d8c.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('205', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c07a6ea05.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c07a6ea05.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c07a6ea05.jpg\"}', '132');
INSERT INTO `weibo_image` VALUES ('206', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c5e1f0537.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c5e1f0537.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c5e1f0537.jpg\"}', '137');
INSERT INTO `weibo_image` VALUES ('207', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c742c65d4.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c742c65d4.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c742c65d4.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('208', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c74381b32.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c74381b32.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c74381b32.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('209', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c744501bd.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c744501bd.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c744501bd.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('210', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c7450b71b.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c7450b71b.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c7450b71b.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('211', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c745c28cb.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c745c28cb.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c745c28cb.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('212', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c74681b32.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c74681b32.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c74681b32.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('213', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c74731975.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c74731975.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c74731975.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('214', '{\"thumb\":\".\\/Uploads\\/2014-10-22\\/180_5447c747e4e1c.jpg\",\"unfold\":\".\\/Uploads\\/2014-10-22\\/550_5447c747e4e1c.jpg\",\"source\":\".\\/Uploads\\/2014-10-22\\/5447c747e4e1c.jpg\"}', '139');
INSERT INTO `weibo_image` VALUES ('215', '{\"thumb\":\".\\/Uploads\\/2014-11-30\\/180_547ace2c6f878.jpg\",\"unfold\":\".\\/Uploads\\/2014-11-30\\/550_547ace2c6f878.jpg\",\"source\":\".\\/Uploads\\/2014-11-30\\/547ace2c6f878.jpg\"}', '199');
INSERT INTO `weibo_image` VALUES ('216', '{\"thumb\":\".\\/Uploads\\/2014-11-30\\/180_547ace4eac908.jpg\",\"unfold\":\".\\/Uploads\\/2014-11-30\\/550_547ace4eac908.jpg\",\"source\":\".\\/Uploads\\/2014-11-30\\/547ace4eac908.jpg\"}', '200');

-- ----------------------------
-- Table structure for weibo_manage
-- ----------------------------
DROP TABLE IF EXISTS `weibo_manage`;
CREATE TABLE `weibo_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `manager` char(20) CHARACTER SET latin1 NOT NULL COMMENT '管理员帐号',
  `password` char(40) CHARACTER SET latin1 NOT NULL COMMENT '管理员密码',
  `create` int(10) unsigned NOT NULL COMMENT '创建的时间',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录的时间',
  `last_ip` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录的IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_manage
-- ----------------------------
INSERT INTO `weibo_manage` VALUES ('1', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1406080825', '1421557049', '2130706433');
INSERT INTO `weibo_manage` VALUES ('2', 'bnbbs', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1406080825', '1421154176', '2130706433');
INSERT INTO `weibo_manage` VALUES ('3', 'ycku', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1406080825', '1421154586', '2130706433');
INSERT INTO `weibo_manage` VALUES ('5', 'liyanhui', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1421559300', '0', '0');

-- ----------------------------
-- Table structure for weibo_nav
-- ----------------------------
DROP TABLE IF EXISTS `weibo_nav`;
CREATE TABLE `weibo_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `text` char(20) NOT NULL COMMENT '菜单名称',
  `state` char(10) NOT NULL COMMENT '菜单状态',
  `url` char(20) DEFAULT '' COMMENT '模块链接',
  `iconCls` char(20) NOT NULL COMMENT '图标',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单层次',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_nav
-- ----------------------------
INSERT INTO `weibo_nav` VALUES ('1', '系统管理', 'closed', '', 'icon-system', '0');
INSERT INTO `weibo_nav` VALUES ('2', '权限控制', 'open', 'AuthGroup/index', 'icon-key', '1');
INSERT INTO `weibo_nav` VALUES ('3', '管理员管理', 'open', 'Manage/index', 'icon-manager', '1');
INSERT INTO `weibo_nav` VALUES ('4', '会员管理', 'closed', '', 'icon-user', '0');
INSERT INTO `weibo_nav` VALUES ('5', '会员列表', 'open', 'User/index', 'icon-group', '4');
INSERT INTO `weibo_nav` VALUES ('6', '认证审核', 'open', 'Approve/index', 'icon-award', '4');
INSERT INTO `weibo_nav` VALUES ('7', '内容管理', 'closed', '', 'icon-folder', '0');
INSERT INTO `weibo_nav` VALUES ('8', '微博管理', 'open', 'Topic/index', 'icon-report', '7');
INSERT INTO `weibo_nav` VALUES ('9', '评论管理', 'open', 'Comment/index', 'icon-smile', '7');

-- ----------------------------
-- Table structure for weibo_refer
-- ----------------------------
DROP TABLE IF EXISTS `weibo_refer`;
CREATE TABLE `weibo_refer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `tid` int(10) unsigned NOT NULL COMMENT '微博ID',
  `uid` int(10) unsigned NOT NULL COMMENT '被@的用户',
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否阅读',
  `create` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `tid` (`tid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_refer
-- ----------------------------
INSERT INTO `weibo_refer` VALUES ('1', '166', '19', '0', '1414940422');
INSERT INTO `weibo_refer` VALUES ('2', '166', '7', '1', '1414940422');
INSERT INTO `weibo_refer` VALUES ('3', '166', '9', '0', '1414940422');
INSERT INTO `weibo_refer` VALUES ('4', '166', '10', '0', '1414940422');
INSERT INTO `weibo_refer` VALUES ('5', '167', '7', '1', '1416966019');
INSERT INTO `weibo_refer` VALUES ('6', '168', '7', '1', '1416967364');
INSERT INTO `weibo_refer` VALUES ('7', '169', '7', '1', '1417156170');
INSERT INTO `weibo_refer` VALUES ('8', '170', '7', '1', '1417156183');
INSERT INTO `weibo_refer` VALUES ('9', '171', '7', '1', '1417157535');
INSERT INTO `weibo_refer` VALUES ('10', '172', '7', '1', '1417157547');

-- ----------------------------
-- Table structure for weibo_topic
-- ----------------------------
DROP TABLE IF EXISTS `weibo_topic`;
CREATE TABLE `weibo_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `content` char(255) NOT NULL COMMENT '微博内容',
  `content_over` char(25) DEFAULT '' COMMENT '微博溢出的内容',
  `reid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转播的源微博ID',
  `recount` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '转播的次数',
  `comcount` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip` int(10) unsigned NOT NULL COMMENT 'IP',
  `create` int(10) unsigned NOT NULL COMMENT '发表时间',
  `uid` int(10) unsigned NOT NULL COMMENT '发表用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_topic
-- ----------------------------
INSERT INTO `weibo_topic` VALUES ('39', '分享图片', '', '0', '0', '0', '2130706433', '1409835117', '7');
INSERT INTO `weibo_topic` VALUES ('40', '快乐，不是拥有的多，而是计较的少。感谢那些看透了我，却还一直陪在我身边的人。等待，有时候并不是相信那个人还会回来，而是因为还有爱。别人说你变了，是因为你没有按照他的想法活罢了。别人怎么看你不重要，唯一重要的是你很喜欢真实的自己。别人怎么看你不重要，重要的是你很喜欢真实的自己。', '', '0', '0', '0', '2130706433', '1409835150', '7');
INSERT INTO `weibo_topic` VALUES ('41', '年轻时做事还是要有计划性，不能太重一时。一干活整天不睡觉，持久不了，有些临时突击的可以这样，但多数工作得一步步来，你太猛，到后来常难乎为继。二要考虑别人，你要让大家都和你一样干，最后大家都有意见。还是有些韧性，每天坚持，一段时间之后成绩就不小。古语说：“狂风不竟日，暴雨不终朝。”', '', '0', '0', '0', '2130706433', '1409835158', '7');
INSERT INTO `weibo_topic` VALUES ('42', '这是一张无配图的微博！', '', '0', '0', '0', '2130706433', '1410143019', '7');
INSERT INTO `weibo_topic` VALUES ('43', '测试刚刚发布！', '', '0', '0', '0', '2130706433', '1410245367', '7');
INSERT INTO `weibo_topic` VALUES ('44', '测试刚刚发布！', '', '0', '0', '0', '2130706433', '1410246686', '7');
INSERT INTO `weibo_topic` VALUES ('45', '填充拉伸测试！', '', '0', '0', '0', '2130706433', '1410312342', '7');
INSERT INTO `weibo_topic` VALUES ('64', '刷新方案！', '', '0', '0', '0', '2130706433', '1410492344', '7');
INSERT INTO `weibo_topic` VALUES ('65', '当前页面自动刷新！', '', '0', '0', '0', '2130706433', '1410492404', '7');
INSERT INTO `weibo_topic` VALUES ('66', '插入节点！', '', '0', '0', '0', '2130706433', '1410492493', '7');
INSERT INTO `weibo_topic` VALUES ('93', '分享图片', '', '0', '0', '0', '2130706433', '1410529354', '7');
INSERT INTO `weibo_topic` VALUES ('94', '分享图片', '', '0', '0', '0', '2130706433', '1410529751', '7');
INSERT INTO `weibo_topic` VALUES ('95', '分享图片', '', '0', '0', '0', '2130706433', '1410529831', '7');
INSERT INTO `weibo_topic` VALUES ('96', '分享图片', '', '0', '0', '0', '2130706433', '1410529864', '7');
INSERT INTO `weibo_topic` VALUES ('97', '分享图片', '', '0', '0', '0', '2130706433', '1410529941', '7');
INSERT INTO `weibo_topic` VALUES ('98', '分享图片', '', '0', '0', '0', '2130706433', '1410529968', '7');
INSERT INTO `weibo_topic` VALUES ('99', '表情解析！[a_6]', '', '0', '0', '0', '2130706433', '1410529992', '7');
INSERT INTO `weibo_topic` VALUES ('100', '表情解析！[a_6]', '', '0', '0', '0', '2130706433', '1410530276', '7');
INSERT INTO `weibo_topic` VALUES ('101', '表情解析！[a_6]', '', '0', '0', '0', '2130706433', '1410530441', '7');
INSERT INTO `weibo_topic` VALUES ('102', '[a_7]表情测试！', '', '0', '0', '0', '2130706433', '1410695173', '7');
INSERT INTO `weibo_topic` VALUES ('103', '表情测试[c_19]！', '', '0', '0', '0', '2130706433', '1410695192', '7');
INSERT INTO `weibo_topic` VALUES ('104', '新增一条！[a_58]', '', '0', '0', '0', '2130706433', '1410870228', '7');
INSERT INTO `weibo_topic` VALUES ('105', '新增一条微博！@黑崎一护', '', '0', '0', '0', '2130706433', '1410870272', '7');
INSERT INTO `weibo_topic` VALUES ('106', '动态添加的没问题！[a_22]@娜美', '', '0', '0', '0', '2130706433', '1410870488', '7');
INSERT INTO `weibo_topic` VALUES ('107', '[a_50]', '', '0', '0', '0', '2130706433', '1410870550', '7');
INSERT INTO `weibo_topic` VALUES ('108', '测试一下我的头像！', '', '0', '0', '0', '2130706433', '1412147739', '19');
INSERT INTO `weibo_topic` VALUES ('109', '我测试我的头像！', '', '0', '0', '0', '2130706433', '1412147868', '19');
INSERT INTO `weibo_topic` VALUES ('110', '我来测试一下我的头像！', '', '0', '0', '0', '2130706433', '1412606835', '9');
INSERT INTO `weibo_topic` VALUES ('111', '测试一下我的头像！', '', '0', '0', '0', '2130706433', '1412606972', '7');
INSERT INTO `weibo_topic` VALUES ('112', '我是有头像的！', '', '0', '0', '0', '2130706433', '1412607387', '7');
INSERT INTO `weibo_topic` VALUES ('113', '我是没有头像的！', '', '0', '0', '0', '2130706433', '1412607411', '9');
INSERT INTO `weibo_topic` VALUES ('114', '我测试一下我及时发布微博的头像！', '', '0', '0', '0', '2130706433', '1412608304', '7');
INSERT INTO `weibo_topic` VALUES ('115', '我测试一下及时头像！', '', '0', '0', '0', '2130706433', '1412608551', '7');
INSERT INTO `weibo_topic` VALUES ('116', '我没有头像，测试一下及时性！', '', '0', '0', '0', '2130706433', '1412608580', '9');
INSERT INTO `weibo_topic` VALUES ('120', '@樱桃小丸子 你好！@路飞 你好！', '', '0', '0', '0', '2130706433', '1413531240', '7');
INSERT INTO `weibo_topic` VALUES ('135', '快乐，不是拥有的多，而是计较的少。感谢那些看透了我，却还一直陪在我身边的人。等待，有时候并不是相信那个人还会回来，而是因为还有爱。别人说你变了，是因为你没有按照他的想法活罢了。别人怎么看你不重要，唯一重要的是你很喜欢真实的自己。别人怎么看你不重要，重要的是你很喜欢真实的自己。', '', '0', '1', '0', '2130706433', '1413989613', '7');
INSERT INTO `weibo_topic` VALUES ('136', '转播这条微博！', '', '135', '0', '0', '2130706433', '1413989648', '19');
INSERT INTO `weibo_topic` VALUES ('137', '分享图片', '', '0', '4', '11', '2130706433', '1413989859', '19');
INSERT INTO `weibo_topic` VALUES ('138', '转播一张图片，显示效果！', '', '137', '0', '0', '2130706433', '1413989873', '19');
INSERT INTO `weibo_topic` VALUES ('139', '分享图片', '', '0', '1', '0', '2130706433', '1413990218', '19');
INSERT INTO `weibo_topic` VALUES ('140', '多张图片微博，进行转播效果！', '', '139', '0', '0', '2130706433', '1413990233', '19');
INSERT INTO `weibo_topic` VALUES ('141', '@路飞 你好啊！[a_7]！', '', '0', '2', '0', '2130706433', '1413990323', '19');
INSERT INTO `weibo_topic` VALUES ('142', '转播一下带有表情和@符号的！', '', '141', '0', '0', '2130706433', '1413990342', '19');
INSERT INTO `weibo_topic` VALUES ('161', '第二次转播！ || @樱桃小丸子 : 转播一张图片，显示效果！', '', '137', '0', '0', '2130706433', '1414132201', '19');
INSERT INTO `weibo_topic` VALUES ('162', '第三次转播！ || @樱桃小丸子 : 第二次转播！ || @樱桃小丸子 : 转播一张图片，显示效果！', '', '137', '0', '0', '2130706433', '1414132355', '19');
INSERT INTO `weibo_topic` VALUES ('163', '第四次转播！ || @樱桃小丸子 : 第三次转播！ || @樱桃小丸子 : 第二次转播！ || @樱桃小丸子 : 转播一张图片，显示效果！', '', '137', '0', '0', '2130706433', '1414132510', '19');
INSERT INTO `weibo_topic` VALUES ('166', '@樱桃小丸子 @蜡笔小新 @黑崎一护 @路飞 @不存在 ，你们好！', '', '0', '0', '0', '2130706433', '1414940422', '19');
INSERT INTO `weibo_topic` VALUES ('189', '我是黑崎一护！', '', '0', '0', '0', '2130706433', '1417333657', '9');
INSERT INTO `weibo_topic` VALUES ('190', '黑崎一护发表一条！', '', '0', '0', '0', '2130706433', '1417333729', '9');
INSERT INTO `weibo_topic` VALUES ('191', '我黑崎一护再发布一条！', '', '0', '0', '0', '2130706433', '1417333752', '9');
INSERT INTO `weibo_topic` VALUES ('192', '我樱桃小丸子发布一条！', '', '0', '0', '0', '2130706433', '1417333783', '19');
INSERT INTO `weibo_topic` VALUES ('193', '我樱桃小丸子发布一条！', '', '0', '0', '0', '2130706433', '1417333825', '19');
INSERT INTO `weibo_topic` VALUES ('194', '我现在发表一条！', '', '0', '0', '0', '2130706433', '1417334112', '19');
INSERT INTO `weibo_topic` VALUES ('195', '我再发表一条！', '', '0', '0', '0', '2130706433', '1417334125', '19');
INSERT INTO `weibo_topic` VALUES ('196', '我再发表！', '', '0', '0', '0', '2130706433', '1417334150', '19');
INSERT INTO `weibo_topic` VALUES ('197', '我发表了一条！', '', '0', '0', '0', '2130706433', '1417334233', '19');
INSERT INTO `weibo_topic` VALUES ('198', '我再发表仪表！', '', '0', '0', '0', '2130706433', '1417334246', '19');
INSERT INTO `weibo_topic` VALUES ('203', '我是樱桃小丸子！', '', '0', '0', '0', '2130706433', '1417334605', '19');

-- ----------------------------
-- Table structure for weibo_user
-- ----------------------------
DROP TABLE IF EXISTS `weibo_user`;
CREATE TABLE `weibo_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` char(20) NOT NULL COMMENT '用户名',
  `password` char(40) NOT NULL COMMENT '密码',
  `email` char(50) NOT NULL COMMENT '电子邮件',
  `face` char(200) DEFAULT NULL COMMENT '个人头像',
  `domain` char(10) DEFAULT NULL COMMENT '个性域名',
  `create` int(10) unsigned NOT NULL COMMENT '创建时间',
  `last_login` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录的时间',
  `last_ip` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录的IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `domain` (`domain`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_user
-- ----------------------------
INSERT INTO `weibo_user` VALUES ('7', '蜡笔小新', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'xiaoxin@163.com', null, 'xiaoxin', '1406080825', '1421149448', '2130706433');
INSERT INTO `weibo_user` VALUES ('19', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yingtao@163.com', '{\"big\":\".\\/Uploads\\/face\\/19.jpg\",\"small\":\".\\/Uploads\\/face\\/19_small.jpg\"}', 'yingtao', '1406354432', '1417333773', '2130706433');
INSERT INTO `weibo_user` VALUES ('9', '黑崎一护', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yihu@163.com', null, 'yihu', '1406081329', '1418893005', '2130706433');
INSERT INTO `weibo_user` VALUES ('10', '路飞', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'luifei@163.com', null, null, '1406081407', '1418275748', '2130706433');
INSERT INTO `weibo_user` VALUES ('12', '娜美', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'namei@163.com', null, null, '1406081526', '0', '0');
INSERT INTO `weibo_user` VALUES ('50', '小叮当', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'dingdang@163.com', null, null, '1406081525', '1417424148', '2130706433');
INSERT INTO `weibo_user` VALUES ('51', '佐助', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'zuozhu@163.com', null, null, '1406081524', '1417424149', '2130706433');
INSERT INTO `weibo_user` VALUES ('52', '柯南', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'kenan@163.com', null, null, '1406081523', '1417424135', '2130706433');
INSERT INTO `weibo_user` VALUES ('53', '灰原', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'huiyuan@163.com', null, null, '1406081522', '1417424136', '2130706433');
INSERT INTO `weibo_user` VALUES ('54', '工藤新一', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'gongteng@163.com', null, null, '1406081521', '1417424137', '2130706433');
INSERT INTO `weibo_user` VALUES ('55', '卡卡西', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'kakaxi@163.com', null, null, '1406081511', '1417424138', '2130706433');
INSERT INTO `weibo_user` VALUES ('56', '杀生丸', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'shashen@163.com', null, null, '1406081512', '1417424139', '2130706433');
INSERT INTO `weibo_user` VALUES ('57', '索隆', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'suolong@163.com', null, null, '1406081513', '1417424121', '2130706433');
INSERT INTO `weibo_user` VALUES ('58', '御坂美琴', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yuban@163.com', null, null, '1406081514', '1417424122', '2130706433');
INSERT INTO `weibo_user` VALUES ('59', '鲁鲁修', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'luluxiu@163.com', null, null, '1406081515', '1417424123', '2130706433');
INSERT INTO `weibo_user` VALUES ('60', '流川枫', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'liuchuanfeng@163.com', null, null, '1406081516', '1417424124', '2130706433');
INSERT INTO `weibo_user` VALUES ('61', '漩涡鸣人', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'mingren@163.com', null, null, '1406081517', '1417424125', '2130706433');
INSERT INTO `weibo_user` VALUES ('62', '织田信奈', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'xinnai@163.com', null, null, '1406081518', '1417424126', '2130706433');
INSERT INTO `weibo_user` VALUES ('63', '坂田银时', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'bantian@163.com', null, null, '1406081519', '1417424127', '2130706433');
INSERT INTO `weibo_user` VALUES ('64', '金田一', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'jintian@163.com', null, null, '1406081520', '1417424128', '2130706433');
INSERT INTO `weibo_user` VALUES ('65', '樱木花道', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'huadao@163.com', null, null, '1406081500', '1417424129', '2130706433');
INSERT INTO `weibo_user` VALUES ('66', '不知火舞', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'huowu@163.com', null, null, '1406081501', '1417424130', '2130706433');
INSERT INTO `weibo_user` VALUES ('67', '阿拉蕾', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'alailei@163.com', null, null, '1406081502', '1417424110', '2130706433');
INSERT INTO `weibo_user` VALUES ('68', '星矢', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'xingshi@163.com', null, null, '1406081503', '1417424111', '2130706433');
INSERT INTO `weibo_user` VALUES ('69', '不二周助', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'zhouzu@163.com', null, null, '1406081504', '1417424112', '2130706433');
INSERT INTO `weibo_user` VALUES ('70', '大蛇丸', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'dashewan@163.com', null, null, '1406081505', '1417424113', '2130706433');
INSERT INTO `weibo_user` VALUES ('71', '桔梗', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'jiegeng@163.com', null, null, '1406081506', '1417424114', '2130706433');
INSERT INTO `weibo_user` VALUES ('72', '越前龙马', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'longma@163.com', null, null, '1406081507', '1417424115', '2130706433');
INSERT INTO `weibo_user` VALUES ('73', '凌波丽', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'lingboli@163.com', null, null, '1406081508', '1417424117', '2130706433');
INSERT INTO `weibo_user` VALUES ('74', '我爱罗', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'woailuo@163.com', null, null, '1406081509', '1417424116', '2130706433');
INSERT INTO `weibo_user` VALUES ('75', '特兰克斯', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'kesi@163.com', null, null, '1406081591', '1417424118', '2130706433');
INSERT INTO `weibo_user` VALUES ('76', '怪盗基德', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'jide@163.com', null, null, '1406081592', '1417424119', '2130706433');

-- ----------------------------
-- Table structure for weibo_user_extend
-- ----------------------------
DROP TABLE IF EXISTS `weibo_user_extend`;
CREATE TABLE `weibo_user_extend` (
  `intro` varchar(255) DEFAULT NULL COMMENT '用户简介',
  `uid` int(10) unsigned NOT NULL COMMENT '关联用户ID',
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weibo_user_extend
-- ----------------------------
INSERT INTO `weibo_user_extend` VALUES ('我是蜡笔小新，请大家多多关注！', '7');
INSERT INTO `weibo_user_extend` VALUES ('我是樱桃小丸子，请多多关照！', '19');
INSERT INTO `weibo_user_extend` VALUES (null, '10');
