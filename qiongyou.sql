/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : localhost
 Source Database       : qiongyou

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : utf-8

 Date: 05/21/2017 20:35:24 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_blog`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `blog_id` int(11) NOT NULL COMMENT '游记的主键',
  `title` varchar(255) DEFAULT NULL COMMENT '游记的标题',
  `content` varchar(255) DEFAULT NULL COMMENT '游记的内容',
  `user_id` int(11) DEFAULT NULL COMMENT '游记的作者id',
  `is_delete` int(11) DEFAULT NULL COMMENT '游记删除的标志，1表示删除，0表示未删除',
  `photo` varchar(255) DEFAULT NULL COMMENT '游记的图片',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL COMMENT '评论的主键id',
  `scene_id` int(11) DEFAULT NULL COMMENT '评论的景点ID',
  `user_id` int(11) DEFAULT NULL COMMENT '评论者的id',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_img`
-- ----------------------------
DROP TABLE IF EXISTS `t_img`;
CREATE TABLE `t_img` (
  `img_id` int(11) NOT NULL COMMENT '图片自己的主键',
  `scene_id` int(11) DEFAULT NULL COMMENT '图片的外键，说明这个图片是哪个景点的',
  `photo` varchar(255) DEFAULT NULL COMMENT '存放图片的路径',
  `is_main` int(11) DEFAULT NULL COMMENT '标志图片是否是主图片，显示在主页，0表示非主图片，1表示主图片',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `reply_id` int(11) NOT NULL COMMENT '回复id',
  `comment_id` int(11) DEFAULT NULL COMMENT '回复的那条评论的id',
  `type` int(11) DEFAULT NULL COMMENT '回复的类型（回复的是评论还是回复），0表示评论，1表示回复',
  `parent_id` int(11) DEFAULT NULL COMMENT '回复目标的id（如果是评论，parent_id=comment_id;如果是回复，parent_id=reply_id）',
  `content` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `from_userid` int(11) DEFAULT NULL COMMENT '发起回复的人的id',
  `to_userid` int(11) DEFAULT NULL COMMENT '被回复的人的id',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_scene`
-- ----------------------------
DROP TABLE IF EXISTS `t_scene`;
CREATE TABLE `t_scene` (
  `scene_id` int(11) NOT NULL COMMENT '景点主键',
  `name` varchar(255) DEFAULT NULL COMMENT '景点名称',
  `position` varchar(255) DEFAULT NULL COMMENT '景点的所在位置',
  PRIMARY KEY (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户的主键',
  `name` varchar(255) DEFAULT NULL COMMENT '用户的昵称，刚开始自动生成，之后只能修改一次',
  `name_flag` int(11) DEFAULT '0' COMMENT '0未修改，1已修改',
  `tel` varchar(255) DEFAULT NULL COMMENT '选择手机号登录或者注册时用',
  `email` varchar(255) DEFAULT NULL COMMENT '选择邮箱登录或者注册时用',
  `password` varchar(255) DEFAULT NULL COMMENT '存放用户注册和登录的密码（>=八位,<=十六位的字母数字组合）',
  `sex` int(11) DEFAULT NULL COMMENT '0表示女，1表示男',
  `birth` timestamp NULL DEFAULT NULL COMMENT '用户的出生日期',
  `photo` varchar(255) DEFAULT NULL COMMENT '存放用户头像',
  `now_place` varchar(255) DEFAULT NULL COMMENT '现居住地',
  `old_place` varchar(255) DEFAULT NULL COMMENT '曾居住地',
  `construction` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `website` varchar(255) DEFAULT NULL COMMENT '个人网址',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
