/*
Navicat MySQL Data Transfer

Source Server         : kl
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : whousedb

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-09-25 21:37:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wh_client`
-- ----------------------------
DROP TABLE IF EXISTS `wh_client`;
CREATE TABLE `wh_client` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(32) NOT NULL,
  `caddress` varchar(64) NOT NULL,
  `contacts` varchar(32) NOT NULL,
  `cphone` varchar(16) NOT NULL,
  `cgrade` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_client
-- ----------------------------
INSERT INTO `wh_client` VALUES ('1', 'dongdong', '杭州市江干区东大街155号', '张东', '15765487891', null);
INSERT INTO `wh_client` VALUES ('2', 'ranran', '浙江省杭州市西湖区紫荆花路4号', '李然', '18269557523', null);
INSERT INTO `wh_client` VALUES ('3', 'liangliang', '浙江省杭州市拱墅区花园岗街204号', '成亮', '16585231456', null);

-- ----------------------------
-- Table structure for `wh_log`
-- ----------------------------
DROP TABLE IF EXISTS `wh_log`;
CREATE TABLE `wh_log` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `log_msg` varchar(128) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_log
-- ----------------------------
INSERT INTO `wh_log` VALUES ('1', '任务一', '2019-09-09 20:30:39');
INSERT INTO `wh_log` VALUES ('2', '任务一', '2019-09-05 20:30:44');
INSERT INTO `wh_log` VALUES ('3', '任务一', '2019-09-06 20:30:48');
INSERT INTO `wh_log` VALUES ('4', '任务一', '2019-08-26 20:30:53');
INSERT INTO `wh_log` VALUES ('5', '任务一', '2019-08-13 20:30:58');
INSERT INTO `wh_log` VALUES ('6', '任务一', '2019-09-05 20:31:05');
INSERT INTO `wh_log` VALUES ('7', '任务一', '2019-07-03 20:31:09');
INSERT INTO `wh_log` VALUES ('8', '任务一', '2019-08-28 20:31:16');
INSERT INTO `wh_log` VALUES ('9', '任务一', '2019-08-12 20:31:21');
INSERT INTO `wh_log` VALUES ('10', 'fsfrre', '2019-09-11 16:09:51');
INSERT INTO `wh_log` VALUES ('11', 'fsfsf', '2019-09-11 16:46:19');
INSERT INTO `wh_log` VALUES ('12', 'sfsfsf', '2019-09-11 16:48:16');
INSERT INTO `wh_log` VALUES ('13', '4234234', '2019-09-11 16:49:19');
INSERT INTO `wh_log` VALUES ('14', 'tryyrty', '2019-09-11 16:49:33');
INSERT INTO `wh_log` VALUES ('15', 'fgsfse', '2019-09-11 16:50:14');
INSERT INTO `wh_log` VALUES ('16', '组花今天要吃黄焖鸡', '2019-09-11 16:50:42');
INSERT INTO `wh_log` VALUES ('17', 'qwertasd', '2019-09-11 16:54:38');
INSERT INTO `wh_log` VALUES ('18', 'dfgvcdc', '2019-09-11 16:55:48');
INSERT INTO `wh_log` VALUES ('19', '明晚放假', '2019-09-11 16:56:35');
INSERT INTO `wh_log` VALUES ('20', '后天不上课', '2019-09-11 16:57:42');
INSERT INTO `wh_log` VALUES ('21', '123wqas', '2019-09-11 16:59:53');
INSERT INTO `wh_log` VALUES ('22', '7886hjnnjk', '2019-09-11 17:01:57');
INSERT INTO `wh_log` VALUES ('23', '432432fsdfsf', '2019-09-11 17:04:41');
INSERT INTO `wh_log` VALUES ('24', '3123afsf', '2019-09-11 17:06:01');
INSERT INTO `wh_log` VALUES ('25', '1234qwe', '2019-09-11 17:07:16');
INSERT INTO `wh_log` VALUES ('26', 'ihjihjiuhiu', '2019-09-11 17:09:56');
INSERT INTO `wh_log` VALUES ('27', '3434sfsdfs', '2019-09-11 17:10:26');

-- ----------------------------
-- Table structure for `wh_order`
-- ----------------------------
DROP TABLE IF EXISTS `wh_order`;
CREATE TABLE `wh_order` (
  `onum` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号，供客户查询订单',
  `cid` int(11) NOT NULL,
  `remark` varchar(32) DEFAULT NULL,
  `create_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `ostatus` varchar(32) NOT NULL,
  `uid` int(11) NOT NULL,
  `firstAdress` varchar(32) DEFAULT NULL,
  `lastAdress` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`onum`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  CONSTRAINT `wh_order_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `wh_client` (`cid`),
  CONSTRAINT `wh_order_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `wh_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2019081910 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of wh_order
-- ----------------------------
INSERT INTO `wh_order` VALUES ('2019030501', '2', '', '2019-03-05', '2019-03-05', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019040801', '2', '', '2019-04-08', '2019-04-08', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019051101', '1', '', '2019-05-11', '2019-05-11', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019061301', '3', '', '2019-06-13', '2019-06-13', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019071501', '1', '', '2019-07-15', '2019-07-15', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019081701', '3', '', '2019-08-17', '2019-08-17', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019081901', '1', '', '2019-08-19', '2019-08-19', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019081902', '1', '', '2019-08-19', '2019-08-19', '5', '1', '120000/120100/120101', '');
INSERT INTO `wh_order` VALUES ('2019081903', '1', null, '2019-09-13', '2019-09-13', '未发货', '1', '120000/120100/120101', '3213213');
INSERT INTO `wh_order` VALUES ('2019081904', '1', null, '2019-09-13', '2019-09-13', '今日发货', '1', '120000/120100/120101', '14v');
INSERT INTO `wh_order` VALUES ('2019081905', '1', null, '2019-09-13', '2019-09-13', '今日发货', '1', '120000/120100/120101', '12314');
INSERT INTO `wh_order` VALUES ('2019081906', '3', null, '2019-09-13', '2019-09-13', '今日发货', '1', '110000/110100/110101', '23123');
INSERT INTO `wh_order` VALUES ('2019081907', '1', null, '2019-09-13', '2019-09-13', '普通退货', '1', '110000/110100/110101', '12312');
INSERT INTO `wh_order` VALUES ('2019081908', '1', '1', '2019-09-13', '2019-09-13', '今日发货', '1', '120000/120100/120101', '1');
INSERT INTO `wh_order` VALUES ('2019081909', '1', null, '2019-09-13', '2019-09-13', '今日发货', '1', '120000/120100/120101', '23123');

-- ----------------------------
-- Table structure for `wh_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `wh_order_detail`;
CREATE TABLE `wh_order_detail` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `onum` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `pcount` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `onum` (`onum`),
  CONSTRAINT `wh_order_detail_ibfk_1` FOREIGN KEY (`onum`) REFERENCES `wh_order` (`onum`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_order_detail
-- ----------------------------
INSERT INTO `wh_order_detail` VALUES ('1', '2019030501', '1', '6988.00', '22', '2019-03-05', '2019-03-05');
INSERT INTO `wh_order_detail` VALUES ('2', '2019030501', '2', '8268.00', '10', '2019-03-05', '2019-03-05');
INSERT INTO `wh_order_detail` VALUES ('3', '2019040801', '1', '6988.00', '2', '2019-04-08', '2019-04-08');
INSERT INTO `wh_order_detail` VALUES ('4', '2019051101', '4', '7888.00', '1', '2019-05-11', '2019-05-11');
INSERT INTO `wh_order_detail` VALUES ('5', '2019061301', '3', '7488.00', '5', '2019-06-13', '2019-06-13');
INSERT INTO `wh_order_detail` VALUES ('6', '2019071501', '8', '3499.00', '3', '2019-07-15', '2019-07-15');
INSERT INTO `wh_order_detail` VALUES ('7', '2019081701', '5', '4999.00', '5', '2019-08-17', '2019-08-17');
INSERT INTO `wh_order_detail` VALUES ('8', '2019081901', '13', '4299.00', '3', '2019-08-19', '2019-08-19');
INSERT INTO `wh_order_detail` VALUES ('9', '2019081902', '11', '5399.00', '5', '2019-08-19', '2019-08-19');
INSERT INTO `wh_order_detail` VALUES ('10', '2019081903', '1', '6988.00', '23', '2019-09-13', '2019-09-13');
INSERT INTO `wh_order_detail` VALUES ('11', '2019081904', '1', '6988.00', '1', '2019-09-13', '2019-09-13');
INSERT INTO `wh_order_detail` VALUES ('12', '2019081905', '21', '5299.00', '3', '2019-09-13', '2019-09-13');
INSERT INTO `wh_order_detail` VALUES ('13', '2019081906', '3', '7488.00', '23', '2019-09-13', '2019-09-13');
INSERT INTO `wh_order_detail` VALUES ('14', '2019081907', '1', '6988.00', '23', '2019-09-13', '2019-09-13');
INSERT INTO `wh_order_detail` VALUES ('15', '2019081908', '23', '6699.00', '123', '2019-09-13', '2019-09-13');
INSERT INTO `wh_order_detail` VALUES ('16', '2019081909', '1', '6988.00', '100', '2019-09-13', '2019-09-13');

-- ----------------------------
-- Table structure for `wh_product`
-- ----------------------------
DROP TABLE IF EXISTS `wh_product`;
CREATE TABLE `wh_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `pname` varchar(32) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `spec` varchar(64) DEFAULT NULL,
  `os` varchar(32) DEFAULT NULL,
  `memory` varchar(32) DEFAULT NULL,
  `resolution` varchar(32) DEFAULT NULL,
  `video_card` varchar(32) DEFAULT NULL,
  `cpu` varchar(32) DEFAULT NULL,
  `video_memory` varchar(32) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `disk` varchar(32) DEFAULT NULL,
  `shelf_time` bigint(20) DEFAULT NULL,
  `sold_count` int(11) DEFAULT NULL,
  `repertory_count` int(11) DEFAULT NULL,
  `is_onsale` tinyint(1) DEFAULT NULL,
  `pv_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `pv_id` (`pv_id`),
  KEY `family_id` (`family_id`),
  CONSTRAINT `wh_product_ibfk_1` FOREIGN KEY (`pv_id`) REFERENCES `wh_provider` (`pv_id`),
  CONSTRAINT `wh_product_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `wh_product_family` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_product
-- ----------------------------
INSERT INTO `wh_product` VALUES ('6', '2', '小米Air', '3599.00', '【12.5银色】 M-7Y30 4G 128G', 'Windows 10', '4G', '全高清屏(1920*1080)', '集成显卡', 'Intel CoreM', '其它', '轻薄本', '128G固态', '153123456789', '115', '185', '0', '1');
INSERT INTO `wh_product` VALUES ('7', '2', '小米Air', '3599.00', '【12.5金色】 M-7Y30 4G 128G', 'Windows 10', '4G', '全高清屏(1920*1080)', '集成显卡', 'Intel CoreM', '其它', '轻薄本', '128G固态', '156123456789', '812', '188', '1', null);
INSERT INTO `wh_product` VALUES ('9', '3', 'ThinkPadE480c', '3499.00', '【E480C-2017新】i3 4G 500G独显', 'Windows10', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i3', '2G', '常规笔记本', '500G', '150423456789', '1461', '39', '1', null);
INSERT INTO `wh_product` VALUES ('10', '3', 'ThinkPadE480c', '4499.00', '【E480C-2017新】i5 4G 500G', 'Windows10', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规笔记本', '500G', '151423456789', '733', '267', '0', null);
INSERT INTO `wh_product` VALUES ('12', '3', 'ThinkPadE480c', '5999.00', '【E480C-2017新】i5 8G 256GSSD', 'Windows10', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规笔记本', '256G固态', '153423456789', '112', '188', '0', null);
INSERT INTO `wh_product` VALUES ('14', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '4999.00', '13.3英寸I5/4G/128G固态', 'Windows 10', '8G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '152123456789', '137', '63', '0', null);
INSERT INTO `wh_product` VALUES ('15', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '5499.00', '13.3英寸I5/4G/256G/2G独显', 'Windows 10', '4G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '153123456789', '21', '79', '0', null);
INSERT INTO `wh_product` VALUES ('16', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '5699.00', '13.3英寸I5/8G/256G/2G独显', 'Windows 10', '8G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '152423456789', '981', '19', '0', null);
INSERT INTO `wh_product` VALUES ('17', '5', '联想小新700', '5199.00', '小新700【i5 双硬盘 GTX950M】', 'Windows 10', '8G', '分辨率：全高清屏(1920×1080)', 'GTX950M', 'Intel i5标准电压版', '4G', '游戏本', '128G+500G', '149123456789', '192', '108', '1', null);
INSERT INTO `wh_product` VALUES ('18', '5', '联想小新700', '5499.00', '小新700【i7 8G 500G GTX950M】', 'Windows 10', '8G', '分辨率：全高清屏(1920×1080)', 'GTX950M', 'Intel i7标准电压版', '4G', '游戏本', '128G+500G', '151523456789', '260', '140', '0', null);
INSERT INTO `wh_product` VALUES ('19', '6', '戴尔燃7000', '5299.00', '【流光银】i5-7200u 4G 128 500G', 'Windows 10', '4G', '全高清屏(1920×1080)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G+500G', '151923456789', '911', '189', '0', null);
INSERT INTO `wh_product` VALUES ('20', '6', '戴尔燃7000', '6599.00', '【溢彩金】i7-7500u 8G 128 1T', 'Windows 10', '8G', '全高清屏(1920×1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '轻薄本', '128G+500G', '150823456789', '1930', '270', '1', null);
INSERT INTO `wh_product` VALUES ('21', '6', '戴尔燃7000', '5299.00', '【元気粉】i5-7200u 4G 128 500G', 'Windows 10', '4G', '全高清屏(1920×1080)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G+500G', '151023456789', '990', '310', '1', null);
INSERT INTO `wh_product` VALUES ('22', '7', '戴尔灵越游匣15PR-5745B', '6999.00', '宗师版 i7-7700HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '148123456789', '1901', '199', '1', null);
INSERT INTO `wh_product` VALUES ('23', '7', '戴尔灵越游匣15PR-5645SE', '6699.00', '枪弹版 i5-7300HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i5标准电压版', '4G', '游戏本', '128G+1T', '153123456789', '1354', '246', '0', null);
INSERT INTO `wh_product` VALUES ('24', '7', '戴尔灵越游匣15PR-5645SE', '7999.00', '枪弹版 i7-7700HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '1539923456789', '221', '179', '0', null);
INSERT INTO `wh_product` VALUES ('25', '7', '戴尔游匣', '6099.00', '精锐版 i7-6700HQ 4G GTX960 4G', 'Windows 10', '4G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '1519123456789', '711', '289', '1', null);
INSERT INTO `wh_product` VALUES ('26', '7', '戴尔游匣', '5299.00', '精锐版 i5-6300HQ 4G GTX960 4G', 'Windows 10', '4G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i5标准电压版', '4G', '游戏本', '128G+1T', '1529123456789', '319', '181', '0', null);
INSERT INTO `wh_product` VALUES ('27', '7', '戴尔灵越游匣15PR-5645B', '5999.00', '宗师版 i5-7300HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX1050', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '1511123456789', '2110', '490', '0', null);
INSERT INTO `wh_product` VALUES ('28', '8', 'ThinkPadE470 c', '3998.00', '【E470C-2017新】i5 4G 500G', 'Linux', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '500G', '150123456789', '117', '283', '1', null);
INSERT INTO `wh_product` VALUES ('29', '8', 'ThinkPadE470 c', '4699.00', '【E470C-2017新】i5 8G 500G', 'Linux', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '500G', '151123456789', '1862', '138', '0', null);
INSERT INTO `wh_product` VALUES ('30', '8', 'ThinkPadE470 c', '5499.00', '【E470C-2017新】i5 8G 1TB', 'Linux', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '1T', '152123456789', '812', '188', '1', null);
INSERT INTO `wh_product` VALUES ('31', '8', 'ThinkPadE470 c', '5399.00', '【E470C-2017新】i5 4G 256GSSD', 'Linux', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '256G固态', '153123456789', '162', '338', '0', null);
INSERT INTO `wh_product` VALUES ('32', '8', 'ThinkPadE470 c', '5499.00', '【E470C-2017新】i5 8G 256GSSD', 'Linux', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '256G固态', '154123456789', '1180', '220', '0', null);
INSERT INTO `wh_product` VALUES ('33', '9', '华硕FH5900V', '4999.00', '【高速】顽石游戏本i74G1T128SSD', 'Windows 10', '4G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7标准电压版', '2G', '游戏本', '128G+1T', '1450123456789', '1231', '369', '0', null);
INSERT INTO `wh_product` VALUES ('34', '9', '华硕FL5900UQ', '4699.00', '顽石经典【高配i7 8G 1T 深蓝】', 'Windows 10', '8G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '游戏本', '1T', '1550123456789', '1231', '469', '1', null);
INSERT INTO `wh_product` VALUES ('35', '9', '华硕FL5900UQ', '4999.00', '顽石双盘【i7 4G 1t加128SSD】', 'Windows 10', '4G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '游戏本', '128G+1T', '1531023456789', '221', '279', '0', null);
INSERT INTO `wh_product` VALUES ('36', '9', '华硕FL5900U', '4799.00', '顽石高速【i7-4G 512SSD 炫红】', 'Windows 10', '4G', '全高清屏(1920*1080)', 'GT940M', 'Intel i7低功耗版', '2G', '游戏本', '512G固态', '1510123456789', '103', '97', '1', null);
INSERT INTO `wh_product` VALUES ('37', '9', '华硕FL5900UQ', '4799.00', '顽石高速【i74G512SSD NV940MX】', 'Windows 10', '4G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '游戏本', '512G固态', '1450123456789', '341', '159', '0', null);
INSERT INTO `wh_product` VALUES ('38', '10', '神舟战神Z7M-KP7GT', '6199.00', 'Z7M GT【i7 128G+1T GTX1050Ti】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX1050Ti', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '151123456789', '441', '259', '0', null);
INSERT INTO `wh_product` VALUES ('39', '10', '神舟战神Z7M', '5499.00', '战神Z7M【四核i7 GTX965M】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX965M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '152123456789', '1289', '211', '1', null);

-- ----------------------------
-- Table structure for `wh_product_family`
-- ----------------------------
DROP TABLE IF EXISTS `wh_product_family`;
CREATE TABLE `wh_product_family` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_product_family
-- ----------------------------
INSERT INTO `wh_product_family` VALUES ('1', 'AppleMacBookAir');
INSERT INTO `wh_product_family` VALUES ('2', '小米Air');
INSERT INTO `wh_product_family` VALUES ('3', 'ThinkPadE480C');
INSERT INTO `wh_product_family` VALUES ('4', '华硕RX310UQ');
INSERT INTO `wh_product_family` VALUES ('5', '联想小新700');
INSERT INTO `wh_product_family` VALUES ('6', '戴尔燃7000');
INSERT INTO `wh_product_family` VALUES ('7', '戴尔灵越15PR-5745B');
INSERT INTO `wh_product_family` VALUES ('8', 'ThinkPadE470 C');
INSERT INTO `wh_product_family` VALUES ('9', '华硕FH5900V');
INSERT INTO `wh_product_family` VALUES ('10', '神舟战神Z7M-KP7GT');

-- ----------------------------
-- Table structure for `wh_product_pic`
-- ----------------------------
DROP TABLE IF EXISTS `wh_product_pic`;
CREATE TABLE `wh_product_pic` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_pid` int(11) DEFAULT NULL,
  `sm` varchar(128) DEFAULT NULL,
  `md` varchar(128) DEFAULT NULL,
  `lg` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_product_pic
-- ----------------------------
INSERT INTO `wh_product_pic` VALUES ('1', '1', 'img/product/sm/57b12a31N8f4f75a3.jpg', 'img/product/md/57b12a31N8f4f75a3.jpg', 'img/product/lg/57b12a31N8f4f75a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('2', '1', 'img/product/sm/57ad359dNd4a6f130.jpg', 'img/product/md/57ad359dNd4a6f130.jpg', 'img/product/lg/57ad359dNd4a6f130.jpg');
INSERT INTO `wh_product_pic` VALUES ('3', '1', 'img/product/sm/57ad8846N64ac3c79.jpg', 'img/product/md/57ad8846N64ac3c79.jpg', 'img/product/lg/57ad8846N64ac3c79.jpg');
INSERT INTO `wh_product_pic` VALUES ('4', '2', 'img/product/sm/57b12a31N8f4f75a3.jpg', 'img/product/md/57b12a31N8f4f75a3.jpg', 'img/product/lg/57b12a31N8f4f75a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('5', '2', 'img/product/sm/57ad359dNd4a6f130.jpg', 'img/product/md/57ad359dNd4a6f130.jpg', 'img/product/lg/57ad359dNd4a6f130.jpg');
INSERT INTO `wh_product_pic` VALUES ('6', '2', 'img/product/sm/57ad8846N64ac3c79.jpg', 'img/product/md/57ad8846N64ac3c79.jpg', 'img/product/lg/57ad8846N64ac3c79.jpg');
INSERT INTO `wh_product_pic` VALUES ('7', '3', 'img/product/sm/57b12a31N8f4f75a3.jpg', 'img/product/md/57b12a31N8f4f75a3.jpg', 'img/product/lg/57b12a31N8f4f75a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('8', '3', 'img/product/sm/57ad359dNd4a6f130.jpg', 'img/product/md/57ad359dNd4a6f130.jpg', 'img/product/lg/57ad359dNd4a6f130.jpg');
INSERT INTO `wh_product_pic` VALUES ('9', '3', 'img/product/sm/57ad8846N64ac3c79.jpg', 'img/product/md/57ad8846N64ac3c79.jpg', 'img/product/lg/57ad8846N64ac3c79.jpg');
INSERT INTO `wh_product_pic` VALUES ('10', '4', 'img/product/sm/57b12a31N8f4f75a3.jpg', 'img/product/md/57b12a31N8f4f75a3.jpg', 'img/product/lg/57b12a31N8f4f75a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('11', '4', 'img/product/sm/57ad359dNd4a6f130.jpg', 'img/product/md/57ad359dNd4a6f130.jpg', 'img/product/lg/57ad359dNd4a6f130.jpg');
INSERT INTO `wh_product_pic` VALUES ('12', '4', 'img/product/sm/57ad8846N64ac3c79.jpg', 'img/product/md/57ad8846N64ac3c79.jpg', 'img/product/lg/57ad8846N64ac3c79.jpg');
INSERT INTO `wh_product_pic` VALUES ('13', '5', 'img/product/sm/57e3b072N661cd00d.jpg', 'img/product/md/57e3b072N661cd00d.jpg', 'img/product/lg/57e3b072N661cd00d.jpg');
INSERT INTO `wh_product_pic` VALUES ('14', '5', 'img/product/sm/57e1ff09Nf610fea3.jpg', 'img/product/md/57e1ff09Nf610fea3.jpg', 'img/product/lg/57e1ff09Nf610fea3.jpg');
INSERT INTO `wh_product_pic` VALUES ('15', '5', 'img/product/sm/57e1ff17N286390a9.jpg', 'img/product/md/57e1ff17N286390a9.jpg', 'img/product/lg/57e1ff17N286390a9.jpg');
INSERT INTO `wh_product_pic` VALUES ('16', '5', 'img/product/sm/57e1ff2fN8a36d0fe.jpg', 'img/product/md/57e1ff2fN8a36d0fe.jpg', 'img/product/lg/57e1ff2fN8a36d0fe.jpg');
INSERT INTO `wh_product_pic` VALUES ('17', '5', 'img/product/sm/57e52dffNa4d8ce2c.jpg', 'img/product/md/57e52dffNa4d8ce2c.jpg', 'img/product/lg/57e52dffNa4d8ce2c.jpg');
INSERT INTO `wh_product_pic` VALUES ('18', '5', 'img/product/sm/57e52e03N4ec367dd.jpg', 'img/product/md/57e52e03N4ec367dd.jpg', 'img/product/lg/57e52e03N4ec367dd.jpg');
INSERT INTO `wh_product_pic` VALUES ('19', '5', 'img/product/sm/57e52e06N116974f7.jpg', 'img/product/md/57e52e06N116974f7.jpg', 'img/product/lg/57e52e06N116974f7.jpg');
INSERT INTO `wh_product_pic` VALUES ('20', '6', 'img/product/sm/57e3b072N661cd00d.jpg', 'img/product/md/57e3b072N661cd00d.jpg', 'img/product/lg/57e3b072N661cd00d.jpg');
INSERT INTO `wh_product_pic` VALUES ('21', '6', 'img/product/sm/57e1ff09Nf610fea3.jpg', 'img/product/md/57e1ff09Nf610fea3.jpg', 'img/product/lg/57e1ff09Nf610fea3.jpg');
INSERT INTO `wh_product_pic` VALUES ('22', '6', 'img/product/sm/57e1ff17N286390a9.jpg', 'img/product/md/57e1ff17N286390a9.jpg', 'img/product/lg/57e1ff17N286390a9.jpg');
INSERT INTO `wh_product_pic` VALUES ('23', '6', 'img/product/sm/57e1ff2fN8a36d0fe.jpg', 'img/product/md/57e1ff2fN8a36d0fe.jpg', 'img/product/lg/57e1ff2fN8a36d0fe.jpg');
INSERT INTO `wh_product_pic` VALUES ('24', '6', 'img/product/sm/57e52dffNa4d8ce2c.jpg', 'img/product/md/57e52dffNa4d8ce2c.jpg', 'img/product/lg/57e52dffNa4d8ce2c.jpg');
INSERT INTO `wh_product_pic` VALUES ('25', '6', 'img/product/sm/57e52e03N4ec367dd.jpg', 'img/product/md/57e52e03N4ec367dd.jpg', 'img/product/lg/57e52e03N4ec367dd.jpg');
INSERT INTO `wh_product_pic` VALUES ('26', '6', 'img/product/sm/57e52e06N116974f7.jpg', 'img/product/md/57e52e06N116974f7.jpg', 'img/product/lg/57e52e06N116974f7.jpg');
INSERT INTO `wh_product_pic` VALUES ('27', '7', 'img/product/sm/57e3b072N661cd00d.jpg', 'img/product/md/57e3b072N661cd00d.jpg', 'img/product/lg/57e3b072N661cd00d.jpg');
INSERT INTO `wh_product_pic` VALUES ('28', '7', 'img/product/sm/57e1ff09Nf610fea3.jpg', 'img/product/md/57e1ff09Nf610fea3.jpg', 'img/product/lg/57e1ff09Nf610fea3.jpg');
INSERT INTO `wh_product_pic` VALUES ('29', '7', 'img/product/sm/57e1ff17N286390a9.jpg', 'img/product/md/57e1ff17N286390a9.jpg', 'img/product/lg/57e1ff17N286390a9.jpg');
INSERT INTO `wh_product_pic` VALUES ('30', '7', 'img/product/sm/57e1ff2fN8a36d0fe.jpg', 'img/product/md/57e1ff2fN8a36d0fe.jpg', 'img/product/lg/57e1ff2fN8a36d0fe.jpg');
INSERT INTO `wh_product_pic` VALUES ('31', '7', 'img/product/sm/57e52dffNa4d8ce2c.jpg', 'img/product/md/57e52dffNa4d8ce2c.jpg', 'img/product/lg/57e52dffNa4d8ce2c.jpg');
INSERT INTO `wh_product_pic` VALUES ('32', '7', 'img/product/sm/57e52e03N4ec367dd.jpg', 'img/product/md/57e52e03N4ec367dd.jpg', 'img/product/lg/57e52e03N4ec367dd.jpg');
INSERT INTO `wh_product_pic` VALUES ('33', '7', 'img/product/sm/57e52e06N116974f7.jpg', 'img/product/md/57e52e06N116974f7.jpg', 'img/product/lg/57e52e06N116974f7.jpg');
INSERT INTO `wh_product_pic` VALUES ('34', '8', 'img/product/sm/57e3b072N661cd00d.jpg', 'img/product/md/57e3b072N661cd00d.jpg', 'img/product/lg/57e3b072N661cd00d.jpg');
INSERT INTO `wh_product_pic` VALUES ('35', '8', 'img/product/sm/57e1ff09Nf610fea3.jpg', 'img/product/md/57e1ff09Nf610fea3.jpg', 'img/product/lg/57e1ff09Nf610fea3.jpg');
INSERT INTO `wh_product_pic` VALUES ('36', '8', 'img/product/sm/57e1ff17N286390a9.jpg', 'img/product/md/57e1ff17N286390a9.jpg', 'img/product/lg/57e1ff17N286390a9.jpg');
INSERT INTO `wh_product_pic` VALUES ('37', '8', 'img/product/sm/57e1ff2fN8a36d0fe.jpg', 'img/product/md/57e1ff2fN8a36d0fe.jpg', 'img/product/lg/57e1ff2fN8a36d0fe.jpg');
INSERT INTO `wh_product_pic` VALUES ('38', '8', 'img/product/sm/57e52dffNa4d8ce2c.jpg', 'img/product/md/57e52dffNa4d8ce2c.jpg', 'img/product/lg/57e52dffNa4d8ce2c.jpg');
INSERT INTO `wh_product_pic` VALUES ('39', '8', 'img/product/sm/57e52e03N4ec367dd.jpg', 'img/product/md/57e52e03N4ec367dd.jpg', 'img/product/lg/57e52e03N4ec367dd.jpg');
INSERT INTO `wh_product_pic` VALUES ('40', '8', 'img/product/sm/57e52e06N116974f7.jpg', 'img/product/md/57e52e06N116974f7.jpg', 'img/product/lg/57e52e06N116974f7.jpg');
INSERT INTO `wh_product_pic` VALUES ('41', '9', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('42', '9', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('43', '9', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('44', '9', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('45', '9', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('46', '9', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('47', '9', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('48', '9', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('49', '10', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('50', '10', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('51', '10', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('52', '10', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('53', '10', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('54', '10', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('55', '10', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('56', '10', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('57', '11', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('58', '11', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('59', '11', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('60', '11', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('61', '11', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('62', '11', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('63', '11', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('64', '11', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('65', '12', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('66', '12', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('67', '12', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('68', '12', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('69', '12', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('70', '12', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('71', '12', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('72', '12', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('73', '13', 'img/product/sm/590a98f9N8039f132.jpg', 'img/product/md/590a98f9N8039f132.jpg', 'img/product/lg/590a98f9N8039f132.jpg');
INSERT INTO `wh_product_pic` VALUES ('74', '13', 'img/product/sm/58f46de7N0dafbae3.jpg', 'img/product/md/58f46de7N0dafbae3.jpg', 'img/product/lg/58f46de7N0dafbae3.jpg');
INSERT INTO `wh_product_pic` VALUES ('75', '13', 'img/product/sm/58e5c226N4836a223.jpg', 'img/product/md/58e5c226N4836a223.jpg', 'img/product/lg/58e5c226N4836a223.jpg');
INSERT INTO `wh_product_pic` VALUES ('76', '13', 'img/product/sm/58dc76d5N8a0947a3.jpg', 'img/product/md/58dc76d5N8a0947a3.jpg', 'img/product/lg/58dc76d5N8a0947a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('77', '13', 'img/product/sm/58fd9c54Nec723d68.jpg', 'img/product/md/58fd9c54Nec723d68.jpg', 'img/product/lg/58fd9c54Nec723d68.jpg');
INSERT INTO `wh_product_pic` VALUES ('78', '13', 'img/product/sm/58bfc2afNd44b4135.jpg', 'img/product/md/58bfc2afNd44b4135.jpg', 'img/product/lg/58bfc2afNd44b4135.jpg');
INSERT INTO `wh_product_pic` VALUES ('79', '14', 'img/product/sm/590a98f9N8039f132.jpg', 'img/product/md/590a98f9N8039f132.jpg', 'img/product/lg/590a98f9N8039f132.jpg');
INSERT INTO `wh_product_pic` VALUES ('80', '14', 'img/product/sm/58f46de7N0dafbae3.jpg', 'img/product/md/58f46de7N0dafbae3.jpg', 'img/product/lg/58f46de7N0dafbae3.jpg');
INSERT INTO `wh_product_pic` VALUES ('81', '14', 'img/product/sm/58e5c226N4836a223.jpg', 'img/product/md/58e5c226N4836a223.jpg', 'img/product/lg/58e5c226N4836a223.jpg');
INSERT INTO `wh_product_pic` VALUES ('82', '14', 'img/product/sm/58dc76d5N8a0947a3.jpg', 'img/product/md/58dc76d5N8a0947a3.jpg', 'img/product/lg/58dc76d5N8a0947a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('83', '14', 'img/product/sm/58fd9c54Nec723d68.jpg', 'img/product/md/58fd9c54Nec723d68.jpg', 'img/product/lg/58fd9c54Nec723d68.jpg');
INSERT INTO `wh_product_pic` VALUES ('84', '14', 'img/product/sm/58bfc2afNd44b4135.jpg', 'img/product/md/58bfc2afNd44b4135.jpg', 'img/product/lg/58bfc2afNd44b4135.jpg');
INSERT INTO `wh_product_pic` VALUES ('85', '15', 'img/product/sm/590a98f9N8039f132.jpg', 'img/product/md/590a98f9N8039f132.jpg', 'img/product/lg/590a98f9N8039f132.jpg');
INSERT INTO `wh_product_pic` VALUES ('86', '15', 'img/product/sm/58f46de7N0dafbae3.jpg', 'img/product/md/58f46de7N0dafbae3.jpg', 'img/product/lg/58f46de7N0dafbae3.jpg');
INSERT INTO `wh_product_pic` VALUES ('87', '15', 'img/product/sm/58e5c226N4836a223.jpg', 'img/product/md/58e5c226N4836a223.jpg', 'img/product/lg/58e5c226N4836a223.jpg');
INSERT INTO `wh_product_pic` VALUES ('88', '15', 'img/product/sm/58dc76d5N8a0947a3.jpg', 'img/product/md/58dc76d5N8a0947a3.jpg', 'img/product/lg/58dc76d5N8a0947a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('89', '15', 'img/product/sm/58fd9c54Nec723d68.jpg', 'img/product/md/58fd9c54Nec723d68.jpg', 'img/product/lg/58fd9c54Nec723d68.jpg');
INSERT INTO `wh_product_pic` VALUES ('90', '15', 'img/product/sm/58bfc2afNd44b4135.jpg', 'img/product/md/58bfc2afNd44b4135.jpg', 'img/product/lg/58bfc2afNd44b4135.jpg');
INSERT INTO `wh_product_pic` VALUES ('91', '16', 'img/product/sm/590a98f9N8039f132.jpg', 'img/product/md/590a98f9N8039f132.jpg', 'img/product/lg/590a98f9N8039f132.jpg');
INSERT INTO `wh_product_pic` VALUES ('92', '16', 'img/product/sm/58f46de7N0dafbae3.jpg', 'img/product/md/58f46de7N0dafbae3.jpg', 'img/product/lg/58f46de7N0dafbae3.jpg');
INSERT INTO `wh_product_pic` VALUES ('93', '16', 'img/product/sm/58e5c226N4836a223.jpg', 'img/product/md/58e5c226N4836a223.jpg', 'img/product/lg/58e5c226N4836a223.jpg');
INSERT INTO `wh_product_pic` VALUES ('94', '16', 'img/product/sm/58dc76d5N8a0947a3.jpg', 'img/product/md/58dc76d5N8a0947a3.jpg', 'img/product/lg/58dc76d5N8a0947a3.jpg');
INSERT INTO `wh_product_pic` VALUES ('95', '16', 'img/product/sm/58fd9c54Nec723d68.jpg', 'img/product/md/58fd9c54Nec723d68.jpg', 'img/product/lg/58fd9c54Nec723d68.jpg');
INSERT INTO `wh_product_pic` VALUES ('96', '16', 'img/product/sm/58bfc2afNd44b4135.jpg', 'img/product/md/58bfc2afNd44b4135.jpg', 'img/product/lg/58bfc2afNd44b4135.jpg');
INSERT INTO `wh_product_pic` VALUES ('97', '17', 'img/product/sm/587f476aNcfbf7869.jpg', 'img/product/md/587f476aNcfbf7869.jpg', 'img/product/lg/587f476aNcfbf7869.jpg');
INSERT INTO `wh_product_pic` VALUES ('98', '17', 'img/product/sm/57871083Nefe2d3d6.jpg', 'img/product/md/57871083Nefe2d3d6.jpg', 'img/product/lg/57871083Nefe2d3d6.jpg');
INSERT INTO `wh_product_pic` VALUES ('99', '17', 'img/product/sm/57871086N86c8f0ab.jpg', 'img/product/md/57871086N86c8f0ab.jpg', 'img/product/lg/57871086N86c8f0ab.jpg');
INSERT INTO `wh_product_pic` VALUES ('100', '17', 'img/product/sm/5787107bN73d05ad5.jpg', 'img/product/md/5787107bN73d05ad5.jpg', 'img/product/lg/5787107bN73d05ad5.jpg');
INSERT INTO `wh_product_pic` VALUES ('101', '17', 'img/product/sm/5787109cNaf26e3b0.jpg', 'img/product/md/5787109cNaf26e3b0.jpg', 'img/product/lg/5787109cNaf26e3b0.jpg');
INSERT INTO `wh_product_pic` VALUES ('102', '17', 'img/product/sm/578710a0N07795fe5.jpg', 'img/product/md/578710a0N07795fe5.jpg', 'img/product/lg/578710a0N07795fe5.jpg');
INSERT INTO `wh_product_pic` VALUES ('103', '17', 'img/product/sm/578710a3Nc498e3ea.jpg', 'img/product/md/578710a3Nc498e3ea.jpg', 'img/product/lg/578710a3Nc498e3ea.jpg');
INSERT INTO `wh_product_pic` VALUES ('104', '18', 'img/product/sm/587f476aNcfbf7869.jpg', 'img/product/md/587f476aNcfbf7869.jpg', 'img/product/lg/587f476aNcfbf7869.jpg');
INSERT INTO `wh_product_pic` VALUES ('105', '18', 'img/product/sm/57871083Nefe2d3d6.jpg', 'img/product/md/57871083Nefe2d3d6.jpg', 'img/product/lg/57871083Nefe2d3d6.jpg');
INSERT INTO `wh_product_pic` VALUES ('106', '18', 'img/product/sm/57871086N86c8f0ab.jpg', 'img/product/md/57871086N86c8f0ab.jpg', 'img/product/lg/57871086N86c8f0ab.jpg');
INSERT INTO `wh_product_pic` VALUES ('107', '18', 'img/product/sm/5787107bN73d05ad5.jpg', 'img/product/md/5787107bN73d05ad5.jpg', 'img/product/lg/5787107bN73d05ad5.jpg');
INSERT INTO `wh_product_pic` VALUES ('108', '18', 'img/product/sm/5787109cNaf26e3b0.jpg', 'img/product/md/5787109cNaf26e3b0.jpg', 'img/product/lg/5787109cNaf26e3b0.jpg');
INSERT INTO `wh_product_pic` VALUES ('109', '18', 'img/product/sm/578710a0N07795fe5.jpg', 'img/product/md/578710a0N07795fe5.jpg', 'img/product/lg/578710a0N07795fe5.jpg');
INSERT INTO `wh_product_pic` VALUES ('110', '18', 'img/product/sm/578710a3Nc498e3ea.jpg', 'img/product/md/578710a3Nc498e3ea.jpg', 'img/product/lg/578710a3Nc498e3ea.jpg');
INSERT INTO `wh_product_pic` VALUES ('111', '19', 'img/product/sm/57bbc38eN9def8042.jpg', 'img/product/md/57bbc38eN9def8042.jpg', 'img/product/lg/57bbc38eN9def8042.jpg');
INSERT INTO `wh_product_pic` VALUES ('112', '19', 'img/product/sm/57ba6a27Nbb8d2dcf.jpg', 'img/product/md/57ba6a27Nbb8d2dcf.jpg', 'img/product/lg/57ba6a27Nbb8d2dcf.jpg');
INSERT INTO `wh_product_pic` VALUES ('113', '19', 'img/product/sm/57ba6a38N4f4670bd.jpg', 'img/product/md/57ba6a38N4f4670bd.jpg', 'img/product/lg/57ba6a38N4f4670bd.jpg');
INSERT INTO `wh_product_pic` VALUES ('114', '19', 'img/product/sm/57ba6a3dN54779e6a.jpg', 'img/product/md/57ba6a3dN54779e6a.jpg', 'img/product/lg/57ba6a3dN54779e6a.jpg');
INSERT INTO `wh_product_pic` VALUES ('115', '19', 'img/product/sm/57ba6a47N19af9c97.jpg', 'img/product/md/57ba6a47N19af9c97.jpg', 'img/product/lg/57ba6a47N19af9c97.jpg');
INSERT INTO `wh_product_pic` VALUES ('116', '19', 'img/product/sm/57ba6a4cNb83e292a.jpg', 'img/product/md/57ba6a4cNb83e292a.jpg', 'img/product/lg/57ba6a4cNb83e292a.jpg');
INSERT INTO `wh_product_pic` VALUES ('117', '19', 'img/product/sm/57ba6a56N1e3e3d63.jpg', 'img/product/md/57ba6a56N1e3e3d63.jpg', 'img/product/lg/57ba6a56N1e3e3d63.jpg');
INSERT INTO `wh_product_pic` VALUES ('118', '20', 'img/product/sm/57bbc38eN9def8042.jpg', 'img/product/md/57bbc38eN9def8042.jpg', 'img/product/lg/57bbc38eN9def8042.jpg');
INSERT INTO `wh_product_pic` VALUES ('119', '20', 'img/product/sm/57ba6a27Nbb8d2dcf.jpg', 'img/product/md/57ba6a27Nbb8d2dcf.jpg', 'img/product/lg/57ba6a27Nbb8d2dcf.jpg');
INSERT INTO `wh_product_pic` VALUES ('120', '20', 'img/product/sm/57ba6a38N4f4670bd.jpg', 'img/product/md/57ba6a38N4f4670bd.jpg', 'img/product/lg/57ba6a38N4f4670bd.jpg');
INSERT INTO `wh_product_pic` VALUES ('121', '20', 'img/product/sm/57ba6a3dN54779e6a.jpg', 'img/product/md/57ba6a3dN54779e6a.jpg', 'img/product/lg/57ba6a3dN54779e6a.jpg');
INSERT INTO `wh_product_pic` VALUES ('122', '20', 'img/product/sm/57ba6a47N19af9c97.jpg', 'img/product/md/57ba6a47N19af9c97.jpg', 'img/product/lg/57ba6a47N19af9c97.jpg');
INSERT INTO `wh_product_pic` VALUES ('123', '20', 'img/product/sm/57ba6a4cNb83e292a.jpg', 'img/product/md/57ba6a4cNb83e292a.jpg', 'img/product/lg/57ba6a4cNb83e292a.jpg');
INSERT INTO `wh_product_pic` VALUES ('124', '20', 'img/product/sm/57ba6a56N1e3e3d63.jpg', 'img/product/md/57ba6a56N1e3e3d63.jpg', 'img/product/lg/57ba6a56N1e3e3d63.jpg');
INSERT INTO `wh_product_pic` VALUES ('125', '21', 'img/product/sm/57bbc38eN9def8042.jpg', 'img/product/md/57bbc38eN9def8042.jpg', 'img/product/lg/57bbc38eN9def8042.jpg');
INSERT INTO `wh_product_pic` VALUES ('126', '21', 'img/product/sm/57ba6a27Nbb8d2dcf.jpg', 'img/product/md/57ba6a27Nbb8d2dcf.jpg', 'img/product/lg/57ba6a27Nbb8d2dcf.jpg');
INSERT INTO `wh_product_pic` VALUES ('127', '21', 'img/product/sm/57ba6a38N4f4670bd.jpg', 'img/product/md/57ba6a38N4f4670bd.jpg', 'img/product/lg/57ba6a38N4f4670bd.jpg');
INSERT INTO `wh_product_pic` VALUES ('128', '21', 'img/product/sm/57ba6a3dN54779e6a.jpg', 'img/product/md/57ba6a3dN54779e6a.jpg', 'img/product/lg/57ba6a3dN54779e6a.jpg');
INSERT INTO `wh_product_pic` VALUES ('129', '21', 'img/product/sm/57ba6a47N19af9c97.jpg', 'img/product/md/57ba6a47N19af9c97.jpg', 'img/product/lg/57ba6a47N19af9c97.jpg');
INSERT INTO `wh_product_pic` VALUES ('130', '21', 'img/product/sm/57ba6a4cNb83e292a.jpg', 'img/product/md/57ba6a4cNb83e292a.jpg', 'img/product/lg/57ba6a4cNb83e292a.jpg');
INSERT INTO `wh_product_pic` VALUES ('131', '21', 'img/product/sm/57ba6a56N1e3e3d63.jpg', 'img/product/md/57ba6a56N1e3e3d63.jpg', 'img/product/lg/57ba6a56N1e3e3d63.jpg');
INSERT INTO `wh_product_pic` VALUES ('132', '22', 'img/product/sm/5913f8ffN49fa143c.jpg', 'img/product/md/5913f8ffN49fa143c.jpg', 'img/product/lg/5913f8ffN49fa143c.jpg');
INSERT INTO `wh_product_pic` VALUES ('133', '22', 'img/product/sm/5913f903Nbffaa4fd.jpg', 'img/product/md/5913f903Nbffaa4fd.jpg', 'img/product/lg/5913f903Nbffaa4fd.jpg');
INSERT INTO `wh_product_pic` VALUES ('134', '22', 'img/product/sm/5913f907Ncbc65469.jpg', 'img/product/md/5913f907Ncbc65469.jpg', 'img/product/lg/5913f907Ncbc65469.jpg');
INSERT INTO `wh_product_pic` VALUES ('135', '22', 'img/product/sm/5913f90bN1b563f42.jpg', 'img/product/md/5913f90bN1b563f42.jpg', 'img/product/lg/5913f90bN1b563f42.jpg');
INSERT INTO `wh_product_pic` VALUES ('136', '22', 'img/product/sm/5913f90fN99370675.jpg', 'img/product/md/5913f90fN99370675.jpg', 'img/product/lg/5913f90fN99370675.jpg');
INSERT INTO `wh_product_pic` VALUES ('137', '22', 'img/product/sm/5913f93bNe4d2b3e5.jpg', 'img/product/md/5913f93bNe4d2b3e5.jpg', 'img/product/lg/5913f93bNe4d2b3e5.jpg');
INSERT INTO `wh_product_pic` VALUES ('138', '22', 'img/product/sm/5913f93fNfd79b4fc.jpg', 'img/product/md/5913f93fNfd79b4fc.jpg', 'img/product/lg/5913f93fNfd79b4fc.jpg');
INSERT INTO `wh_product_pic` VALUES ('139', '23', 'img/product/sm/5913f8ffN49fa143c.jpg', 'img/product/md/5913f8ffN49fa143c.jpg', 'img/product/lg/5913f8ffN49fa143c.jpg');
INSERT INTO `wh_product_pic` VALUES ('140', '23', 'img/product/sm/5913f903Nbffaa4fd.jpg', 'img/product/md/5913f903Nbffaa4fd.jpg', 'img/product/lg/5913f903Nbffaa4fd.jpg');
INSERT INTO `wh_product_pic` VALUES ('141', '23', 'img/product/sm/5913f907Ncbc65469.jpg', 'img/product/md/5913f907Ncbc65469.jpg', 'img/product/lg/5913f907Ncbc65469.jpg');
INSERT INTO `wh_product_pic` VALUES ('142', '23', 'img/product/sm/5913f90bN1b563f42.jpg', 'img/product/md/5913f90bN1b563f42.jpg', 'img/product/lg/5913f90bN1b563f42.jpg');
INSERT INTO `wh_product_pic` VALUES ('143', '23', 'img/product/sm/5913f90fN99370675.jpg', 'img/product/md/5913f90fN99370675.jpg', 'img/product/lg/5913f90fN99370675.jpg');
INSERT INTO `wh_product_pic` VALUES ('144', '23', 'img/product/sm/5913f93bNe4d2b3e5.jpg', 'img/product/md/5913f93bNe4d2b3e5.jpg', 'img/product/lg/5913f93bNe4d2b3e5.jpg');
INSERT INTO `wh_product_pic` VALUES ('145', '23', 'img/product/sm/5913f93fNfd79b4fc.jpg', 'img/product/md/5913f93fNfd79b4fc.jpg', 'img/product/lg/5913f93fNfd79b4fc.jpg');
INSERT INTO `wh_product_pic` VALUES ('146', '24', 'img/product/sm/5913f8ffN49fa143c.jpg', 'img/product/md/5913f8ffN49fa143c.jpg', 'img/product/lg/5913f8ffN49fa143c.jpg');
INSERT INTO `wh_product_pic` VALUES ('147', '24', 'img/product/sm/5913f903Nbffaa4fd.jpg', 'img/product/md/5913f903Nbffaa4fd.jpg', 'img/product/lg/5913f903Nbffaa4fd.jpg');
INSERT INTO `wh_product_pic` VALUES ('148', '24', 'img/product/sm/5913f907Ncbc65469.jpg', 'img/product/md/5913f907Ncbc65469.jpg', 'img/product/lg/5913f907Ncbc65469.jpg');
INSERT INTO `wh_product_pic` VALUES ('149', '24', 'img/product/sm/5913f90bN1b563f42.jpg', 'img/product/md/5913f90bN1b563f42.jpg', 'img/product/lg/5913f90bN1b563f42.jpg');
INSERT INTO `wh_product_pic` VALUES ('150', '24', 'img/product/sm/5913f90fN99370675.jpg', 'img/product/md/5913f90fN99370675.jpg', 'img/product/lg/5913f90fN99370675.jpg');
INSERT INTO `wh_product_pic` VALUES ('151', '24', 'img/product/sm/5913f93bNe4d2b3e5.jpg', 'img/product/md/5913f93bNe4d2b3e5.jpg', 'img/product/lg/5913f93bNe4d2b3e5.jpg');
INSERT INTO `wh_product_pic` VALUES ('152', '24', 'img/product/sm/5913f93fNfd79b4fc.jpg', 'img/product/md/5913f93fNfd79b4fc.jpg', 'img/product/lg/5913f93fNfd79b4fc.jpg');
INSERT INTO `wh_product_pic` VALUES ('153', '25', 'img/product/sm/5913f8ffN49fa143c.jpg', 'img/product/md/5913f8ffN49fa143c.jpg', 'img/product/lg/5913f8ffN49fa143c.jpg');
INSERT INTO `wh_product_pic` VALUES ('154', '25', 'img/product/sm/5913f903Nbffaa4fd.jpg', 'img/product/md/5913f903Nbffaa4fd.jpg', 'img/product/lg/5913f903Nbffaa4fd.jpg');
INSERT INTO `wh_product_pic` VALUES ('155', '25', 'img/product/sm/5913f907Ncbc65469.jpg', 'img/product/md/5913f907Ncbc65469.jpg', 'img/product/lg/5913f907Ncbc65469.jpg');
INSERT INTO `wh_product_pic` VALUES ('156', '25', 'img/product/sm/5913f90bN1b563f42.jpg', 'img/product/md/5913f90bN1b563f42.jpg', 'img/product/lg/5913f90bN1b563f42.jpg');
INSERT INTO `wh_product_pic` VALUES ('157', '25', 'img/product/sm/5913f90fN99370675.jpg', 'img/product/md/5913f90fN99370675.jpg', 'img/product/lg/5913f90fN99370675.jpg');
INSERT INTO `wh_product_pic` VALUES ('158', '25', 'img/product/sm/5913f93bNe4d2b3e5.jpg', 'img/product/md/5913f93bNe4d2b3e5.jpg', 'img/product/lg/5913f93bNe4d2b3e5.jpg');
INSERT INTO `wh_product_pic` VALUES ('159', '25', 'img/product/sm/5913f93fNfd79b4fc.jpg', 'img/product/md/5913f93fNfd79b4fc.jpg', 'img/product/lg/5913f93fNfd79b4fc.jpg');
INSERT INTO `wh_product_pic` VALUES ('160', '26', 'img/product/sm/5913f8ffN49fa143c.jpg', 'img/product/md/5913f8ffN49fa143c.jpg', 'img/product/lg/5913f8ffN49fa143c.jpg');
INSERT INTO `wh_product_pic` VALUES ('161', '26', 'img/product/sm/5913f903Nbffaa4fd.jpg', 'img/product/md/5913f903Nbffaa4fd.jpg', 'img/product/lg/5913f903Nbffaa4fd.jpg');
INSERT INTO `wh_product_pic` VALUES ('162', '26', 'img/product/sm/5913f907Ncbc65469.jpg', 'img/product/md/5913f907Ncbc65469.jpg', 'img/product/lg/5913f907Ncbc65469.jpg');
INSERT INTO `wh_product_pic` VALUES ('163', '26', 'img/product/sm/5913f90bN1b563f42.jpg', 'img/product/md/5913f90bN1b563f42.jpg', 'img/product/lg/5913f90bN1b563f42.jpg');
INSERT INTO `wh_product_pic` VALUES ('164', '26', 'img/product/sm/5913f90fN99370675.jpg', 'img/product/md/5913f90fN99370675.jpg', 'img/product/lg/5913f90fN99370675.jpg');
INSERT INTO `wh_product_pic` VALUES ('165', '26', 'img/product/sm/5913f93bNe4d2b3e5.jpg', 'img/product/md/5913f93bNe4d2b3e5.jpg', 'img/product/lg/5913f93bNe4d2b3e5.jpg');
INSERT INTO `wh_product_pic` VALUES ('166', '26', 'img/product/sm/5913f93fNfd79b4fc.jpg', 'img/product/md/5913f93fNfd79b4fc.jpg', 'img/product/lg/5913f93fNfd79b4fc.jpg');
INSERT INTO `wh_product_pic` VALUES ('167', '27', 'img/product/sm/5913f8ffN49fa143c.jpg', 'img/product/md/5913f8ffN49fa143c.jpg', 'img/product/lg/5913f8ffN49fa143c.jpg');
INSERT INTO `wh_product_pic` VALUES ('168', '27', 'img/product/sm/5913f903Nbffaa4fd.jpg', 'img/product/md/5913f903Nbffaa4fd.jpg', 'img/product/lg/5913f903Nbffaa4fd.jpg');
INSERT INTO `wh_product_pic` VALUES ('169', '27', 'img/product/sm/5913f907Ncbc65469.jpg', 'img/product/md/5913f907Ncbc65469.jpg', 'img/product/lg/5913f907Ncbc65469.jpg');
INSERT INTO `wh_product_pic` VALUES ('170', '27', 'img/product/sm/5913f90bN1b563f42.jpg', 'img/product/md/5913f90bN1b563f42.jpg', 'img/product/lg/5913f90bN1b563f42.jpg');
INSERT INTO `wh_product_pic` VALUES ('171', '27', 'img/product/sm/5913f90fN99370675.jpg', 'img/product/md/5913f90fN99370675.jpg', 'img/product/lg/5913f90fN99370675.jpg');
INSERT INTO `wh_product_pic` VALUES ('172', '27', 'img/product/sm/5913f93bNe4d2b3e5.jpg', 'img/product/md/5913f93bNe4d2b3e5.jpg', 'img/product/lg/5913f93bNe4d2b3e5.jpg');
INSERT INTO `wh_product_pic` VALUES ('173', '27', 'img/product/sm/5913f93fNfd79b4fc.jpg', 'img/product/md/5913f93fNfd79b4fc.jpg', 'img/product/lg/5913f93fNfd79b4fc.jpg');
INSERT INTO `wh_product_pic` VALUES ('174', '28', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('175', '28', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('176', '28', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('177', '28', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('178', '28', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('179', '28', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('180', '28', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('181', '28', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('182', '29', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('183', '29', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('184', '29', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('185', '29', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('186', '29', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('187', '29', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('188', '29', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('189', '29', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('190', '30', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('191', '30', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('192', '30', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('193', '30', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('194', '30', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('195', '30', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('196', '30', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('197', '30', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('198', '31', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('199', '31', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('200', '31', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('201', '31', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('202', '31', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('203', '31', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('204', '31', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('205', '31', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('206', '32', 'img/product/sm/584b5678Nbc9f1e70.jpg', 'img/product/md/584b5678Nbc9f1e70.jpg', 'img/product/lg/584b5678Nbc9f1e70.jpg');
INSERT INTO `wh_product_pic` VALUES ('207', '32', 'img/product/sm/584b567dNd9c58341.jpg', 'img/product/md/584b567dNd9c58341.jpg', 'img/product/lg/584b567dNd9c58341.jpg');
INSERT INTO `wh_product_pic` VALUES ('208', '32', 'img/product/sm/5819a0ebNefd901bc.jpg', 'img/product/md/5819a0ebNefd901bc.jpg', 'img/product/lg/5819a0ebNefd901bc.jpg');
INSERT INTO `wh_product_pic` VALUES ('209', '32', 'img/product/sm/5819a106Necf0abb8.jpg', 'img/product/md/5819a106Necf0abb8.jpg', 'img/product/lg/5819a106Necf0abb8.jpg');
INSERT INTO `wh_product_pic` VALUES ('210', '32', 'img/product/sm/5819a10bN2ea5c8e0.jpg', 'img/product/md/5819a10bN2ea5c8e0.jpg', 'img/product/lg/5819a10bN2ea5c8e0.jpg');
INSERT INTO `wh_product_pic` VALUES ('211', '32', 'img/product/sm/5819a10fNd0f96a03.jpg', 'img/product/md/5819a10fNd0f96a03.jpg', 'img/product/lg/5819a10fNd0f96a03.jpg');
INSERT INTO `wh_product_pic` VALUES ('212', '32', 'img/product/sm/5819a114Ne0cd75db.jpg', 'img/product/md/5819a114Ne0cd75db.jpg', 'img/product/lg/5819a114Ne0cd75db.jpg');
INSERT INTO `wh_product_pic` VALUES ('213', '32', 'img/product/sm/5819a133N03021b26.jpg', 'img/product/md/5819a133N03021b26.jpg', 'img/product/lg/5819a133N03021b26.jpg');
INSERT INTO `wh_product_pic` VALUES ('214', '33', 'img/product/sm/58985861N615a3581.jpg', 'img/product/md/58985861N615a3581.jpg', 'img/product/lg/58985861N615a3581.jpg');
INSERT INTO `wh_product_pic` VALUES ('215', '33', 'img/product/sm/58985867Nf8909d49.jpg', 'img/product/md/58985867Nf8909d49.jpg', 'img/product/lg/58985867Nf8909d49.jpg');
INSERT INTO `wh_product_pic` VALUES ('216', '33', 'img/product/sm/5898586cNe235284b.jpg', 'img/product/md/5898586cNe235284b.jpg', 'img/product/lg/5898586cNe235284b.jpg');
INSERT INTO `wh_product_pic` VALUES ('217', '33', 'img/product/sm/58985881N0a78dea2.jpg', 'img/product/md/58985881N0a78dea2.jpg', 'img/product/lg/58985881N0a78dea2.jpg');
INSERT INTO `wh_product_pic` VALUES ('218', '33', 'img/product/sm/58985883Nd4aec745.jpg', 'img/product/md/58985883Nd4aec745.jpg', 'img/product/lg/58985883Nd4aec745.jpg');
INSERT INTO `wh_product_pic` VALUES ('219', '33', 'img/product/sm/5836b979N85c3852b.jpg', 'img/product/md/5836b979N85c3852b.jpg', 'img/product/lg/5836b979N85c3852b.jpg');
INSERT INTO `wh_product_pic` VALUES ('220', '33', 'img/product/sm/5836b981Nd60fd02a.jpg', 'img/product/md/5836b981Nd60fd02a.jpg', 'img/product/lg/5836b981Nd60fd02a.jpg');
INSERT INTO `wh_product_pic` VALUES ('221', '34', 'img/product/sm/58985861N615a3581.jpg', 'img/product/md/58985861N615a3581.jpg', 'img/product/lg/58985861N615a3581.jpg');
INSERT INTO `wh_product_pic` VALUES ('222', '34', 'img/product/sm/58985867Nf8909d49.jpg', 'img/product/md/58985867Nf8909d49.jpg', 'img/product/lg/58985867Nf8909d49.jpg');
INSERT INTO `wh_product_pic` VALUES ('223', '34', 'img/product/sm/5898586cNe235284b.jpg', 'img/product/md/5898586cNe235284b.jpg', 'img/product/lg/5898586cNe235284b.jpg');
INSERT INTO `wh_product_pic` VALUES ('224', '34', 'img/product/sm/58985881N0a78dea2.jpg', 'img/product/md/58985881N0a78dea2.jpg', 'img/product/lg/58985881N0a78dea2.jpg');
INSERT INTO `wh_product_pic` VALUES ('225', '34', 'img/product/sm/58985883Nd4aec745.jpg', 'img/product/md/58985883Nd4aec745.jpg', 'img/product/lg/58985883Nd4aec745.jpg');
INSERT INTO `wh_product_pic` VALUES ('226', '34', 'img/product/sm/5836b979N85c3852b.jpg', 'img/product/md/5836b979N85c3852b.jpg', 'img/product/lg/5836b979N85c3852b.jpg');
INSERT INTO `wh_product_pic` VALUES ('227', '34', 'img/product/sm/5836b981Nd60fd02a.jpg', 'img/product/md/5836b981Nd60fd02a.jpg', 'img/product/lg/5836b981Nd60fd02a.jpg');
INSERT INTO `wh_product_pic` VALUES ('228', '35', 'img/product/sm/58985861N615a3581.jpg', 'img/product/md/58985861N615a3581.jpg', 'img/product/lg/58985861N615a3581.jpg');
INSERT INTO `wh_product_pic` VALUES ('229', '35', 'img/product/sm/58985867Nf8909d49.jpg', 'img/product/md/58985867Nf8909d49.jpg', 'img/product/lg/58985867Nf8909d49.jpg');
INSERT INTO `wh_product_pic` VALUES ('230', '35', 'img/product/sm/5898586cNe235284b.jpg', 'img/product/md/5898586cNe235284b.jpg', 'img/product/lg/5898586cNe235284b.jpg');
INSERT INTO `wh_product_pic` VALUES ('231', '35', 'img/product/sm/58985881N0a78dea2.jpg', 'img/product/md/58985881N0a78dea2.jpg', 'img/product/lg/58985881N0a78dea2.jpg');
INSERT INTO `wh_product_pic` VALUES ('232', '35', 'img/product/sm/58985883Nd4aec745.jpg', 'img/product/md/58985883Nd4aec745.jpg', 'img/product/lg/58985883Nd4aec745.jpg');
INSERT INTO `wh_product_pic` VALUES ('233', '35', 'img/product/sm/5836b979N85c3852b.jpg', 'img/product/md/5836b979N85c3852b.jpg', 'img/product/lg/5836b979N85c3852b.jpg');
INSERT INTO `wh_product_pic` VALUES ('234', '35', 'img/product/sm/5836b981Nd60fd02a.jpg', 'img/product/md/5836b981Nd60fd02a.jpg', 'img/product/lg/5836b981Nd60fd02a.jpg');
INSERT INTO `wh_product_pic` VALUES ('235', '36', 'img/product/sm/58985861N615a3581.jpg', 'img/product/md/58985861N615a3581.jpg', 'img/product/lg/58985861N615a3581.jpg');
INSERT INTO `wh_product_pic` VALUES ('236', '36', 'img/product/sm/58985867Nf8909d49.jpg', 'img/product/md/58985867Nf8909d49.jpg', 'img/product/lg/58985867Nf8909d49.jpg');
INSERT INTO `wh_product_pic` VALUES ('237', '36', 'img/product/sm/5898586cNe235284b.jpg', 'img/product/md/5898586cNe235284b.jpg', 'img/product/lg/5898586cNe235284b.jpg');
INSERT INTO `wh_product_pic` VALUES ('238', '36', 'img/product/sm/58985881N0a78dea2.jpg', 'img/product/md/58985881N0a78dea2.jpg', 'img/product/lg/58985881N0a78dea2.jpg');
INSERT INTO `wh_product_pic` VALUES ('239', '36', 'img/product/sm/58985883Nd4aec745.jpg', 'img/product/md/58985883Nd4aec745.jpg', 'img/product/lg/58985883Nd4aec745.jpg');
INSERT INTO `wh_product_pic` VALUES ('240', '36', 'img/product/sm/5836b979N85c3852b.jpg', 'img/product/md/5836b979N85c3852b.jpg', 'img/product/lg/5836b979N85c3852b.jpg');
INSERT INTO `wh_product_pic` VALUES ('241', '36', 'img/product/sm/5836b981Nd60fd02a.jpg', 'img/product/md/5836b981Nd60fd02a.jpg', 'img/product/lg/5836b981Nd60fd02a.jpg');
INSERT INTO `wh_product_pic` VALUES ('242', '37', 'img/product/sm/58985861N615a3581.jpg', 'img/product/md/58985861N615a3581.jpg', 'img/product/lg/58985861N615a3581.jpg');
INSERT INTO `wh_product_pic` VALUES ('243', '37', 'img/product/sm/58985867Nf8909d49.jpg', 'img/product/md/58985867Nf8909d49.jpg', 'img/product/lg/58985867Nf8909d49.jpg');
INSERT INTO `wh_product_pic` VALUES ('244', '37', 'img/product/sm/5898586cNe235284b.jpg', 'img/product/md/5898586cNe235284b.jpg', 'img/product/lg/5898586cNe235284b.jpg');
INSERT INTO `wh_product_pic` VALUES ('245', '37', 'img/product/sm/58985881N0a78dea2.jpg', 'img/product/md/58985881N0a78dea2.jpg', 'img/product/lg/58985881N0a78dea2.jpg');
INSERT INTO `wh_product_pic` VALUES ('246', '37', 'img/product/sm/58985883Nd4aec745.jpg', 'img/product/md/58985883Nd4aec745.jpg', 'img/product/lg/58985883Nd4aec745.jpg');
INSERT INTO `wh_product_pic` VALUES ('247', '37', 'img/product/sm/5836b979N85c3852b.jpg', 'img/product/md/5836b979N85c3852b.jpg', 'img/product/lg/5836b979N85c3852b.jpg');
INSERT INTO `wh_product_pic` VALUES ('248', '37', 'img/product/sm/5836b981Nd60fd02a.jpg', 'img/product/md/5836b981Nd60fd02a.jpg', 'img/product/lg/5836b981Nd60fd02a.jpg');
INSERT INTO `wh_product_pic` VALUES ('249', '38', 'img/product/sm/58a2c667Ne2b5cb73.jpg', 'img/product/md/58a2c667Ne2b5cb73.jpg', 'img/product/lg/58a2c667Ne2b5cb73.jpg');
INSERT INTO `wh_product_pic` VALUES ('250', '38', 'img/product/sm/58a2c668N800be261.jpg', 'img/product/md/58a2c668N800be261.jpg', 'img/product/lg/58a2c668N800be261.jpg');
INSERT INTO `wh_product_pic` VALUES ('251', '38', 'img/product/sm/58a2c668N0159a26f.jpg', 'img/product/md/58a2c668N0159a26f.jpg', 'img/product/lg/58a2c668N0159a26f.jpg');
INSERT INTO `wh_product_pic` VALUES ('252', '38', 'img/product/sm/58a2c669Nf884ac31.jpg', 'img/product/md/58a2c669Nf884ac31.jpg', 'img/product/lg/58a2c669Nf884ac31.jpg');
INSERT INTO `wh_product_pic` VALUES ('253', '38', 'img/product/sm/58a2c668N7293a0d1.jpg', 'img/product/md/58a2c668N7293a0d1.jpg', 'img/product/lg/58a2c668N7293a0d1.jpg');
INSERT INTO `wh_product_pic` VALUES ('254', '38', 'img/product/sm/58a2c669N4f92f8cb.jpg', 'img/product/md/58a2c669N4f92f8cb.jpg', 'img/product/lg/58a2c669N4f92f8cb.jpg');
INSERT INTO `wh_product_pic` VALUES ('255', '38', 'img/product/sm/58a2c668N0be41fb0.jpg', 'img/product/md/58a2c668N0be41fb0.jpg', 'img/product/lg/58a2c668N0be41fb0.jpg');
INSERT INTO `wh_product_pic` VALUES ('256', '38', 'img/product/sm/58a2c66aNcd10ee32.jpg', 'img/product/md/58a2c66aNcd10ee32.jpg', 'img/product/lg/58a2c66aNcd10ee32.jpg');
INSERT INTO `wh_product_pic` VALUES ('257', '39', 'img/product/sm/58a2c667Ne2b5cb73.jpg', 'img/product/md/58a2c667Ne2b5cb73.jpg', 'img/product/lg/58a2c667Ne2b5cb73.jpg');
INSERT INTO `wh_product_pic` VALUES ('258', '39', 'img/product/sm/58a2c668N800be261.jpg', 'img/product/md/58a2c668N800be261.jpg', 'img/product/lg/58a2c668N800be261.jpg');
INSERT INTO `wh_product_pic` VALUES ('259', '39', 'img/product/sm/58a2c668N0159a26f.jpg', 'img/product/md/58a2c668N0159a26f.jpg', 'img/product/lg/58a2c668N0159a26f.jpg');
INSERT INTO `wh_product_pic` VALUES ('260', '39', 'img/product/sm/58a2c669Nf884ac31.jpg', 'img/product/md/58a2c669Nf884ac31.jpg', 'img/product/lg/58a2c669Nf884ac31.jpg');
INSERT INTO `wh_product_pic` VALUES ('261', '39', 'img/product/sm/58a2c668N7293a0d1.jpg', 'img/product/md/58a2c668N7293a0d1.jpg', 'img/product/lg/58a2c668N7293a0d1.jpg');
INSERT INTO `wh_product_pic` VALUES ('262', '39', 'img/product/sm/58a2c669N4f92f8cb.jpg', 'img/product/md/58a2c669N4f92f8cb.jpg', 'img/product/lg/58a2c669N4f92f8cb.jpg');
INSERT INTO `wh_product_pic` VALUES ('263', '39', 'img/product/sm/58a2c668N0be41fb0.jpg', 'img/product/md/58a2c668N0be41fb0.jpg', 'img/product/lg/58a2c668N0be41fb0.jpg');
INSERT INTO `wh_product_pic` VALUES ('264', '39', 'img/product/sm/58a2c66aNcd10ee32.jpg', 'img/product/md/58a2c66aNcd10ee32.jpg', 'img/product/lg/58a2c66aNcd10ee32.jpg');
INSERT INTO `wh_product_pic` VALUES ('265', '40', 'img/product/sm/58a2c667Ne2b5cb73.jpg', 'img/product/md/58a2c667Ne2b5cb73.jpg', 'img/product/lg/58a2c667Ne2b5cb73.jpg');
INSERT INTO `wh_product_pic` VALUES ('266', '40', 'img/product/sm/58a2c668N800be261.jpg', 'img/product/md/58a2c668N800be261.jpg', 'img/product/lg/58a2c668N800be261.jpg');
INSERT INTO `wh_product_pic` VALUES ('267', '40', 'img/product/sm/58a2c668N0159a26f.jpg', 'img/product/md/58a2c668N0159a26f.jpg', 'img/product/lg/58a2c668N0159a26f.jpg');
INSERT INTO `wh_product_pic` VALUES ('268', '40', 'img/product/sm/58a2c669Nf884ac31.jpg', 'img/product/md/58a2c669Nf884ac31.jpg', 'img/product/lg/58a2c669Nf884ac31.jpg');
INSERT INTO `wh_product_pic` VALUES ('269', '40', 'img/product/sm/58a2c668N7293a0d1.jpg', 'img/product/md/58a2c668N7293a0d1.jpg', 'img/product/lg/58a2c668N7293a0d1.jpg');
INSERT INTO `wh_product_pic` VALUES ('270', '40', 'img/product/sm/58a2c669N4f92f8cb.jpg', 'img/product/md/58a2c669N4f92f8cb.jpg', 'img/product/lg/58a2c669N4f92f8cb.jpg');
INSERT INTO `wh_product_pic` VALUES ('271', '40', 'img/product/sm/58a2c668N0be41fb0.jpg', 'img/product/md/58a2c668N0be41fb0.jpg', 'img/product/lg/58a2c668N0be41fb0.jpg');
INSERT INTO `wh_product_pic` VALUES ('272', '40', 'img/product/sm/58a2c66aNcd10ee32.jpg', 'img/product/md/58a2c66aNcd10ee32.jpg', 'img/product/lg/58a2c66aNcd10ee32.jpg');
INSERT INTO `wh_product_pic` VALUES ('273', '41', 'img/product/sm/58a2c667Ne2b5cb73.jpg', 'img/product/md/58a2c667Ne2b5cb73.jpg', 'img/product/lg/58a2c667Ne2b5cb73.jpg');
INSERT INTO `wh_product_pic` VALUES ('274', '41', 'img/product/sm/58a2c668N800be261.jpg', 'img/product/md/58a2c668N800be261.jpg', 'img/product/lg/58a2c668N800be261.jpg');
INSERT INTO `wh_product_pic` VALUES ('275', '41', 'img/product/sm/58a2c668N0159a26f.jpg', 'img/product/md/58a2c668N0159a26f.jpg', 'img/product/lg/58a2c668N0159a26f.jpg');
INSERT INTO `wh_product_pic` VALUES ('276', '41', 'img/product/sm/58a2c669Nf884ac31.jpg', 'img/product/md/58a2c669Nf884ac31.jpg', 'img/product/lg/58a2c669Nf884ac31.jpg');
INSERT INTO `wh_product_pic` VALUES ('277', '41', 'img/product/sm/58a2c668N7293a0d1.jpg', 'img/product/md/58a2c668N7293a0d1.jpg', 'img/product/lg/58a2c668N7293a0d1.jpg');
INSERT INTO `wh_product_pic` VALUES ('278', '41', 'img/product/sm/58a2c669N4f92f8cb.jpg', 'img/product/md/58a2c669N4f92f8cb.jpg', 'img/product/lg/58a2c669N4f92f8cb.jpg');
INSERT INTO `wh_product_pic` VALUES ('279', '41', 'img/product/sm/58a2c668N0be41fb0.jpg', 'img/product/md/58a2c668N0be41fb0.jpg', 'img/product/lg/58a2c668N0be41fb0.jpg');
INSERT INTO `wh_product_pic` VALUES ('280', '41', 'img/product/sm/58a2c66aNcd10ee32.jpg', 'img/product/md/58a2c66aNcd10ee32.jpg', 'img/product/lg/58a2c66aNcd10ee32.jpg');
INSERT INTO `wh_product_pic` VALUES ('281', '42', 'img/product/sm/58a2c667Ne2b5cb73.jpg', 'img/product/md/58a2c667Ne2b5cb73.jpg', 'img/product/lg/58a2c667Ne2b5cb73.jpg');
INSERT INTO `wh_product_pic` VALUES ('282', '42', 'img/product/sm/58a2c668N800be261.jpg', 'img/product/md/58a2c668N800be261.jpg', 'img/product/lg/58a2c668N800be261.jpg');
INSERT INTO `wh_product_pic` VALUES ('283', '42', 'img/product/sm/58a2c668N0159a26f.jpg', 'img/product/md/58a2c668N0159a26f.jpg', 'img/product/lg/58a2c668N0159a26f.jpg');
INSERT INTO `wh_product_pic` VALUES ('284', '42', 'img/product/sm/58a2c669Nf884ac31.jpg', 'img/product/md/58a2c669Nf884ac31.jpg', 'img/product/lg/58a2c669Nf884ac31.jpg');
INSERT INTO `wh_product_pic` VALUES ('285', '42', 'img/product/sm/58a2c668N7293a0d1.jpg', 'img/product/md/58a2c668N7293a0d1.jpg', 'img/product/lg/58a2c668N7293a0d1.jpg');
INSERT INTO `wh_product_pic` VALUES ('286', '42', 'img/product/sm/58a2c669N4f92f8cb.jpg', 'img/product/md/58a2c669N4f92f8cb.jpg', 'img/product/lg/58a2c669N4f92f8cb.jpg');
INSERT INTO `wh_product_pic` VALUES ('287', '42', 'img/product/sm/58a2c668N0be41fb0.jpg', 'img/product/md/58a2c668N0be41fb0.jpg', 'img/product/lg/58a2c668N0be41fb0.jpg');
INSERT INTO `wh_product_pic` VALUES ('288', '42', 'img/product/sm/58a2c66aNcd10ee32.jpg', 'img/product/md/58a2c66aNcd10ee32.jpg', 'img/product/lg/58a2c66aNcd10ee32.jpg');
INSERT INTO `wh_product_pic` VALUES ('289', '43', 'img/product/sm/58a2c667Ne2b5cb73.jpg', 'img/product/md/58a2c667Ne2b5cb73.jpg', 'img/product/lg/58a2c667Ne2b5cb73.jpg');
INSERT INTO `wh_product_pic` VALUES ('290', '43', 'img/product/sm/58a2c668N800be261.jpg', 'img/product/md/58a2c668N800be261.jpg', 'img/product/lg/58a2c668N800be261.jpg');
INSERT INTO `wh_product_pic` VALUES ('291', '43', 'img/product/sm/58a2c668N0159a26f.jpg', 'img/product/md/58a2c668N0159a26f.jpg', 'img/product/lg/58a2c668N0159a26f.jpg');
INSERT INTO `wh_product_pic` VALUES ('292', '43', 'img/product/sm/58a2c669Nf884ac31.jpg', 'img/product/md/58a2c669Nf884ac31.jpg', 'img/product/lg/58a2c669Nf884ac31.jpg');
INSERT INTO `wh_product_pic` VALUES ('293', '43', 'img/product/sm/58a2c668N7293a0d1.jpg', 'img/product/md/58a2c668N7293a0d1.jpg', 'img/product/lg/58a2c668N7293a0d1.jpg');
INSERT INTO `wh_product_pic` VALUES ('294', '43', 'img/product/sm/58a2c669N4f92f8cb.jpg', 'img/product/md/58a2c669N4f92f8cb.jpg', 'img/product/lg/58a2c669N4f92f8cb.jpg');
INSERT INTO `wh_product_pic` VALUES ('295', '43', 'img/product/sm/58a2c668N0be41fb0.jpg', 'img/product/md/58a2c668N0be41fb0.jpg', 'img/product/lg/58a2c668N0be41fb0.jpg');
INSERT INTO `wh_product_pic` VALUES ('296', '43', 'img/product/sm/58a2c66aNcd10ee32.jpg', 'img/product/md/58a2c66aNcd10ee32.jpg', 'img/product/lg/58a2c66aNcd10ee32.jpg');

-- ----------------------------
-- Table structure for `wh_provider`
-- ----------------------------
DROP TABLE IF EXISTS `wh_provider`;
CREATE TABLE `wh_provider` (
  `pv_id` int(11) NOT NULL AUTO_INCREMENT,
  `pv_name` varchar(64) NOT NULL,
  `pv_address` varchar(128) NOT NULL,
  `pv_contact` varchar(16) NOT NULL,
  `pv_phone` varchar(16) NOT NULL,
  `pv_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`pv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_provider
-- ----------------------------
INSERT INTO `wh_provider` VALUES ('1', '微星鼎世嘉诚专卖店', '山东省淄博市张店区洪沟东路136号', '李杰', '18568997512', null);
INSERT INTO `wh_provider` VALUES ('2', '优创（湖南）信息设备有限公司', '长沙市高新区桐梓坡西路229号麓谷国际工业园A1', '爱德华', '15687412365', null);
INSERT INTO `wh_provider` VALUES ('3', '长沙尼桑电子科技有限责任公司', ' 中国 湖南 长沙市 芙蓉区晚报大道228号上东印', '刘伟', '13654821456', null);
INSERT INTO `wh_provider` VALUES ('4', '长沙富之尔数码科技有限公司', '中国 湖南 长沙市天心区 长沙天心电子B座世界2', '王德胜', '18532456852', null);
INSERT INTO `wh_provider` VALUES ('5', 'erfe', 'gfg', 'gfrdsgdrh', 'rhy656', '1');

-- ----------------------------
-- Table structure for `wh_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `wh_purchase`;
CREATE TABLE `wh_purchase` (
  `pur_num` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `pur_price` decimal(10,2) NOT NULL,
  `pur_count` int(11) NOT NULL,
  `pur_total` decimal(10,2) NOT NULL,
  `pv_id` int(11) NOT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `pur_date` date NOT NULL,
  PRIMARY KEY (`pur_num`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  KEY `pv_id` (`pv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20190914 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_purchase
-- ----------------------------
INSERT INTO `wh_purchase` VALUES ('20190913', '0', '0.00', '0', '0.00', '0', null, '1', '2019-09-13');

-- ----------------------------
-- Table structure for `wh_purchase_detail`
-- ----------------------------
DROP TABLE IF EXISTS `wh_purchase_detail`;
CREATE TABLE `wh_purchase_detail` (
  `pur_id` int(11) NOT NULL AUTO_INCREMENT,
  `pur_num` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `pur_price` decimal(10,2) DEFAULT NULL,
  `pur_count` int(11) DEFAULT NULL,
  `total` decimal(11,0) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pur_date` date DEFAULT NULL,
  PRIMARY KEY (`pur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wh_purchase_detail
-- ----------------------------
INSERT INTO `wh_purchase_detail` VALUES ('2', '20190913', '1', '6880.00', '3', '20640', null, '1', '2019-09-13');

-- ----------------------------
-- Table structure for `wh_receiver_address`
-- ----------------------------
DROP TABLE IF EXISTS `wh_receiver_address`;
CREATE TABLE `wh_receiver_address` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver` varchar(16) DEFAULT NULL,
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL,
  `county` varchar(16) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `cellphone` varchar(16) DEFAULT NULL,
  `fixedphone` varchar(16) DEFAULT NULL,
  `postcode` char(6) DEFAULT NULL,
  `tag` varchar(16) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_receiver_address
-- ----------------------------

-- ----------------------------
-- Table structure for `wh_tips`
-- ----------------------------
DROP TABLE IF EXISTS `wh_tips`;
CREATE TABLE `wh_tips` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `msg` varchar(128) NOT NULL COMMENT '展示信息',
  `type` varchar(1) NOT NULL COMMENT '0:入库；1：出库',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`tip_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of wh_tips
-- ----------------------------
INSERT INTO `wh_tips` VALUES ('18', 'ThinkPadE480c 库存不足50--商品ID：9', '1', '2019-09-13 19:03:07');
INSERT INTO `wh_tips` VALUES ('19', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务 库存不足50--商品ID：16', '1', '2019-09-13 19:03:07');
INSERT INTO `wh_tips` VALUES ('21', '商品ID：1的库存增加了3件', '0', '2019-09-13 20:27:24');

-- ----------------------------
-- Table structure for `wh_token`
-- ----------------------------
DROP TABLE IF EXISTS `wh_token`;
CREATE TABLE `wh_token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_grade` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_token
-- ----------------------------
INSERT INTO `wh_token` VALUES ('1', '1000200030004000', '');
INSERT INTO `wh_token` VALUES ('2', '100020003000', '');
INSERT INTO `wh_token` VALUES ('3', '10002000', '');
INSERT INTO `wh_token` VALUES ('4', '1000', '');

-- ----------------------------
-- Table structure for `wh_user`
-- ----------------------------
DROP TABLE IF EXISTS `wh_user`;
CREATE TABLE `wh_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) NOT NULL,
  `upwd` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) DEFAULT NULL,
  `uphone` varchar(16) NOT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '#性别   0：女  1：男',
  `real_name` varchar(16) DEFAULT NULL,
  `token_id` int(11) DEFAULT NULL COMMENT '用于判断用户权限等级，空值时候为最低',
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `token_id` (`token_id`),
  CONSTRAINT `wh_user_ibfk_1` FOREIGN KEY (`token_id`) REFERENCES `wh_token` (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_user
-- ----------------------------
INSERT INTO `wh_user` VALUES ('1', 'dingding', 'e10adc3949ba59abbe56e057f20f883e', '78527309@qq.com', '13501234567', '1', '丁伟', '1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsImlhdCI6MTU2OTQxODY1MCwiZXhwIjoxNTY5NDIyMjUwfQ.1zsTLIRPZvlsDrTz1Us98eEp6u06KIrkunMZm8itXKU');
INSERT INTO `wh_user` VALUES ('2', 'dangdang', '508df4cb2f4d8f80519256258cfb975f', 'dang@qq.com', '13501234568', '1', '丁当', '2', null);
INSERT INTO `wh_user` VALUES ('3', 'doudou', '5bd2026f128662763c532f2f4b6f2476', 'dou@163.com', '13501234789', '1', '窦志强', '3', null);
INSERT INTO `wh_user` VALUES ('4', 'yaya', 'e35cf7b66449df565f93c607d5a81d09', 'yaya@126.com', '13501231258', '0', '秦小雅', '4', null);
