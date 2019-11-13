/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : shoppingmall

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-11-13 17:16:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引商品收藏',
  `uid` int(11) NOT NULL COMMENT '用户 ID:索引某用户的商品收藏',
  `pid` int(11) NOT NULL COMMENT '商品 ID ：索引收藏的商品',
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `colid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(40) NOT NULL,
  `cvalue` varchar(15) NOT NULL,
  PRIMARY KEY (`colid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of color
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品评论 ID',
  `pid` int(11) NOT NULL COMMENT '商品 ID',
  `point` tinyint(4) NOT NULL COMMENT '商品分数',
  `content` varchar(255) NOT NULL COMMENT '商品评论内容',
  `uname` varchar(40) NOT NULL COMMENT '商品评论者',
  `uid` int(11) NOT NULL COMMENT '用户 ID ',
  `addtime` int(11) NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comid`),
  KEY `pid_1` (`pid`),
  KEY `uid_1` (`uid`),
  CONSTRAINT `pid_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `uid_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY pid(pid,uid,addtime)';

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for gp
-- ----------------------------
DROP TABLE IF EXISTS `gp`;
CREATE TABLE `gp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `color` smallint(6) NOT NULL COMMENT '团购商品颜色',
  `size` smallint(6) NOT NULL COMMENT '团购商品的尺寸',
  `gpic` varchar(40) NOT NULL COMMENT '团购商品图片',
  `stime` int(11) NOT NULL COMMENT '团购的开始时间',
  `etime` int(11) NOT NULL COMMENT '团购的截止时间',
  PRIMARY KEY (`id`),
  KEY `pid_4` (`pid`),
  CONSTRAINT `pid_4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY pid(pid,stime,etime)';

-- ----------------------------
-- Records of gp
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `pinid` int(11) NOT NULL,
  `styleid` int(11) NOT NULL,
  `describe` varchar(255) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `style_1` (`styleid`),
  CONSTRAINT `style_1` FOREIGN KEY (`styleid`) REFERENCES `style` (`styleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for odetail
-- ----------------------------
DROP TABLE IF EXISTS `odetail`;
CREATE TABLE `odetail` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情 ID',
  `ordid` int(11) NOT NULL COMMENT '订单 ID',
  `pid` int(11) NOT NULL COMMENT '商品 ID ',
  `psize` varchar(10) NOT NULL COMMENT '商品尺寸',
  `colid` smallint(6) NOT NULL COMMENT '商品颜色 ID',
  `pname` varchar(40) NOT NULL COMMENT '商品名称',
  `num` smallint(6) NOT NULL COMMENT '购买数量',
  `pprice` double(8,2) NOT NULL COMMENT '商品单价',
  PRIMARY KEY (`oid`),
  KEY `ordid` (`ordid`),
  KEY `pid_5` (`pid`),
  CONSTRAINT `ordid` FOREIGN KEY (`ordid`) REFERENCES `orders` (`ordid`),
  CONSTRAINT `pid_5` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY oid(oid,pid,cid)';

-- ----------------------------
-- Records of odetail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单 ID',
  `uid` int(11) NOT NULL COMMENT '用户 ID',
  `linkman` varchar(50) NOT NULL COMMENT '收货人姓名',
  `total` int(11) NOT NULL COMMENT '订单状态： 0 未处理， 1 已发货， 2 已签收',
  `oaddress` varchar(40) NOT NULL COMMENT '地址',
  `ostate` tinyint(4) NOT NULL COMMENT '团购开始状态',
  `rtime` int(11) NOT NULL COMMENT '到货时间',
  `btime` int(11) NOT NULL COMMENT '下单时间',
  PRIMARY KEY (`ordid`),
  KEY `uid_2` (`uid`),
  CONSTRAINT `uid_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY uid(uid,ostate)';

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for pdetailr
-- ----------------------------
DROP TABLE IF EXISTS `pdetailr`;
CREATE TABLE `pdetailr` (
  `pdeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品详情 ID',
  `pid` int(11) NOT NULL COMMENT '商品 ID',
  `colid` smallint(6) NOT NULL COMMENT '商品颜色 ID',
  `size` varchar(10) NOT NULL COMMENT '尺寸',
  `number` smallint(6) NOT NULL COMMENT '商品数量',
  PRIMARY KEY (`pdeid`),
  KEY `pid_3` (`pid`),
  CONSTRAINT `pid_3` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdetailr
-- ----------------------------

-- ----------------------------
-- Table structure for pic
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic` (
  `picid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品图片 ID ',
  `pid` int(11) NOT NULL COMMENT '商品 ID ',
  `picname` char(40) NOT NULL COMMENT '商品图片名',
  PRIMARY KEY (`picid`),
  KEY `pid_2` (`pid`),
  CONSTRAINT `pid_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY pid(pid)';

-- ----------------------------
-- Records of pic
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品 ID',
  `pname` varchar(40) NOT NULL COMMENT '商品名称',
  `price` double(255,0) NOT NULL COMMENT '商品单价',
  `discount` varchar(5) NOT NULL COMMENT '商品折扣',
  `ptime` int(11) NOT NULL COMMENT '商品上架时间',
  `mpic` char(50) NOT NULL COMMENT '商品主图',
  `typeid` smallint(6) NOT NULL COMMENT '类别 ID',
  `styleid` smallint(6) NOT NULL COMMENT '样式 ID',
  `intro` varchar(255) NOT NULL COMMENT '商品简介',
  `pstate` tinyint(4) NOT NULL COMMENT '商品的状态： 0 为新添加商品， 1 为上架商品， 2 为下架商品',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY name(name,price,mpic,typeid,styleid,pstate,ptime,discount)';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for return
-- ----------------------------
DROP TABLE IF EXISTS `return`;
CREATE TABLE `return` (
  `retid` int(11) NOT NULL AUTO_INCREMENT COMMENT '退 / 换货单 ID',
  `ordid` int(11) NOT NULL COMMENT '退 / 换货的原订单 ID',
  `pid` int(11) NOT NULL COMMENT '退 / 换的物品 ID',
  `rstate` tinyint(4) NOT NULL COMMENT '退 / 换的物品状态： 0 未处理， 1 已退换， 2 不能退换',
  PRIMARY KEY (`retid`),
  KEY `ordid_1` (`ordid`),
  KEY `pid_6` (`pid`),
  CONSTRAINT `ordid_1` FOREIGN KEY (`ordid`) REFERENCES `orders` (`ordid`),
  CONSTRAINT `pid_6` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY oid(oid,pid,rstate)';

-- ----------------------------
-- Records of return
-- ----------------------------

-- ----------------------------
-- Table structure for shopca
-- ----------------------------
DROP TABLE IF EXISTS `shopca`;
CREATE TABLE `shopca` (
  `shopid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `pnum` smallint(6) NOT NULL,
  PRIMARY KEY (`shopid`),
  KEY `uid_5` (`uid`),
  KEY `pid_7` (`pid`),
  CONSTRAINT `pid_7` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `uid_5` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopca
-- ----------------------------

-- ----------------------------
-- Table structure for style
-- ----------------------------
DROP TABLE IF EXISTS `style`;
CREATE TABLE `style` (
  `styleid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(40) NOT NULL,
  `password` char(32) NOT NULL,
  `sdetail` varchar(255) NOT NULL,
  PRIMARY KEY (`styleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of style
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(40) NOT NULL,
  `typefatherid` int(11) NOT NULL,
  `path` varchar(20) NOT NULL,
  `tpic` varchar(30) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='KEY pid(pid,tname,path)';

-- ----------------------------
-- Records of type
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户 ID',
  `uname` varchar(40) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密   码',
  `phone` varchar(15) DEFAULT NULL COMMENT '手   机',
  `address` varchar(40) NOT NULL COMMENT '送货地址',
  `upoint` int(8) NOT NULL COMMENT '积分',
  `allow_1` tinyint(4) NOT NULL COMMENT '前台登陆： 1 是正常登陆， 0 为禁止登陆',
  `allow_2` tinyint(4) NOT NULL COMMENT '订单管理： 1 可以登陆后台，对订单进行管理， 0 为无此权限',
  `allow_3` tinyint(4) NOT NULL COMMENT '录入数据： 1 可以登陆后台，可以对数据做增改查， 0 为此无权限',
  `allow_4` tinyint(4) NOT NULL COMMENT '超级管理员： 1 可以删除数据，可以对有管理员权限的用户进行管理， 0 为无此权限',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='KEY username(username, password,allow_1,allow_2,allow_3,allow_4)';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'a', '123467890', '江干区', '2', '1', '1', '1', '1');
