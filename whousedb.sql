/*
Navicat MySQL Data Transfer

Source Server         : wackyJ
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : whousedb

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-08-27 20:42:12
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
-- Table structure for `wh_order`
-- ----------------------------
DROP TABLE IF EXISTS `wh_order`;
CREATE TABLE `wh_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长，订单主键',
  `onum` int(11) NOT NULL COMMENT '订单编号，供客户查询订单',
  `pid` int(11) NOT NULL,
  `sell_price` decimal(10,2) NOT NULL,
  `ocount` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `cid` int(11) NOT NULL,
  `remark` varchar(32) DEFAULT NULL,
  `create_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `ostatus` varchar(32) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `pid` (`pid`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `wh_order_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `wh_product` (`pid`),
  CONSTRAINT `wh_order_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `wh_client` (`cid`),
  CONSTRAINT `wh_order_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `wh_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_order
-- ----------------------------
INSERT INTO `wh_order` VALUES ('3', '2019030501', '1', '50.00', '25', '1250.00', '2', null, '2019-03-05', '2019-03-05', '1', '1');
INSERT INTO `wh_order` VALUES ('4', '2019040801', '1', '50.00', '15', '750.00', '2', null, '2019-04-08', '2019-04-08', '1', '1');
INSERT INTO `wh_order` VALUES ('5', '2019051101', '1', '50.00', '20', '1000.00', '1', null, '2019-05-11', '2019-05-11', '1', '1');
INSERT INTO `wh_order` VALUES ('6', '2019061301', '1', '50.00', '3', '150.00', '3', null, '2019-06-13', '2019-06-13', '1', '1');
INSERT INTO `wh_order` VALUES ('7', '2019071501', '1', '50.00', '10', '500.00', '1', null, '2019-07-15', '2019-07-15', '1', '1');
INSERT INTO `wh_order` VALUES ('8', '2019081701', '1', '50.00', '3', '150.00', '3', null, '2019-08-17', '2019-08-17', '1', '1');
INSERT INTO `wh_order` VALUES ('9', '2019081901', '1', '50.00', '2', '100.00', '1', null, '2019-08-19', '2019-08-19', '1', '1');
INSERT INTO `wh_order` VALUES ('10', '2019081902', '1', '50.00', '1', '50.00', '1', null, '2019-08-19', '2019-08-19', '1', '1');

-- ----------------------------
-- Table structure for `wh_product`
-- ----------------------------
DROP TABLE IF EXISTS `wh_product`;
CREATE TABLE `wh_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `pname` varchar(32) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_product
-- ----------------------------
INSERT INTO `wh_product` VALUES ('1', '1', 'AppleMacBook Air', '6988.00', '双核i5/8GB内存/128GB闪存', 'MacOS', '8G', '1920*1080', '集成显卡', 'Intel i5低功耗版', '其它', '轻薄本', '128G固态', '150123456789', '2968', null, '1', '1');
INSERT INTO `wh_product` VALUES ('2', '1', 'AppleMacBook Air', '8268.00', '双核i5/8GB内存/256GB闪存', 'MacOS', '8G', '1920*1080', '集成显卡', 'Intel i5低功耗版', '其它', '轻薄本', '256G固态', '150223456789', '1922', null, '0', null);
INSERT INTO `wh_product` VALUES ('3', '1', 'AppleMacBook Air', '7488.00', '定制款：双核i7/8G内存/128G闪存', 'MacOS', '8G', '1920*1080', '集成显卡', 'Intel i7低功耗版', '其它', '轻薄本', '128G固态', '150323456789', '733', null, '0', null);
INSERT INTO `wh_product` VALUES ('4', '1', 'AppleMacBook Air', '7888.00', '定制款：双核i7/8G内存/256G闪存', 'MacOS', '8G', '1920*1080', '集成显卡', 'Intel i7低功耗版', '其它', '轻薄本', '256G固态', '150323456789', '105', null, '0', null);
INSERT INTO `wh_product` VALUES ('5', '2', '小米Air', '4999.00', '【13.3英寸】I5-6200U 8G 256G', 'Windows 10', '8G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i5低功耗版', '1G', '轻薄本', '256G固态', '154123456789', '1527', null, '1', null);
INSERT INTO `wh_product` VALUES ('6', '2', '小米Air', '3599.00', '【12.5银色】 M-7Y30 4G 128G', 'Windows 10', '4G', '全高清屏(1920*1080)', '集成显卡', 'Intel CoreM', '其它', '轻薄本', '128G固态', '153123456789', '115', null, '0', null);
INSERT INTO `wh_product` VALUES ('7', '2', '小米Air', '3599.00', '【12.5金色】 M-7Y30 4G 128G', 'Windows 10', '4G', '全高清屏(1920*1080)', '集成显卡', 'Intel CoreM', '其它', '轻薄本', '128G固态', '156123456789', '812', null, '1', null);
INSERT INTO `wh_product` VALUES ('8', '2', '小米Air', '3499.00', '【12.5英寸】M-6Y30 4G 128G', 'Windows 10', '4G', '全高清屏(1920*1080)', '集成显卡', 'Intel CoreM', '其它', '轻薄本', '128G固态', '157123456789', '1081', null, '0', null);
INSERT INTO `wh_product` VALUES ('9', '3', 'ThinkPadE480c', '3499.00', '【E480C-2017新】i3 4G 500G独显', 'Windows10', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i3', '2G', '常规笔记本', '500G', '150423456789', '1461', null, '1', null);
INSERT INTO `wh_product` VALUES ('10', '3', 'ThinkPadE480c', '4499.00', '【E480C-2017新】i5 4G 500G', 'Windows10', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规笔记本', '500G', '151423456789', '733', null, '0', null);
INSERT INTO `wh_product` VALUES ('11', '3', 'ThinkPadE480c', '5399.00', '【E480C-2017新】i5 4G 256GSSD', 'Windows10', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规笔记本', '256G固态', '152423456789', '913', null, '1', null);
INSERT INTO `wh_product` VALUES ('12', '3', 'ThinkPadE480c', '5999.00', '【E480C-2017新】i5 8G 256GSSD', 'Windows10', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规笔记本', '256G固态', '153423456789', '112', null, '0', null);
INSERT INTO `wh_product` VALUES ('13', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '4299.00', '13.3英寸I3-7100U/4G/128G固态', 'Windows 10', '8G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '151123456789', '1197', null, '1', null);
INSERT INTO `wh_product` VALUES ('14', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '4999.00', '13.3英寸I5/4G/128G固态', 'Windows 10', '8G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '152123456789', '137', null, '0', null);
INSERT INTO `wh_product` VALUES ('15', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '5499.00', '13.3英寸I5/4G/256G/2G独显', 'Windows 10', '4G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '153123456789', '21', null, '0', null);
INSERT INTO `wh_product` VALUES ('16', '4', '华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务', '5699.00', '13.3英寸I5/8G/256G/2G独显', 'Windows 10', '8G', '全高清屏(1920×1080)', '高性能游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G固态', '152423456789', '981', null, '0', null);
INSERT INTO `wh_product` VALUES ('17', '5', '联想小新700', '5199.00', '小新700【i5 双硬盘 GTX950M】', 'Windows 10', '8G', '分辨率：全高清屏(1920×1080)', 'GTX950M', 'Intel i5标准电压版', '4G', '游戏本', '128G+500G', '149123456789', '192', null, '1', null);
INSERT INTO `wh_product` VALUES ('18', '5', '联想小新700', '5499.00', '小新700【i7 8G 500G GTX950M】', 'Windows 10', '8G', '分辨率：全高清屏(1920×1080)', 'GTX950M', 'Intel i7标准电压版', '4G', '游戏本', '128G+500G', '151523456789', '260', null, '0', null);
INSERT INTO `wh_product` VALUES ('19', '6', '戴尔燃7000', '5299.00', '【流光银】i5-7200u 4G 128 500G', 'Windows 10', '4G', '全高清屏(1920×1080)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G+500G', '151923456789', '911', null, '0', null);
INSERT INTO `wh_product` VALUES ('20', '6', '戴尔燃7000', '6599.00', '【溢彩金】i7-7500u 8G 128 1T', 'Windows 10', '8G', '全高清屏(1920×1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '轻薄本', '128G+500G', '150823456789', '1930', null, '1', null);
INSERT INTO `wh_product` VALUES ('21', '6', '戴尔燃7000', '5299.00', '【元気粉】i5-7200u 4G 128 500G', 'Windows 10', '4G', '全高清屏(1920×1080)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '轻薄本', '128G+500G', '151023456789', '987', null, '1', null);
INSERT INTO `wh_product` VALUES ('22', '7', '戴尔灵越游匣15PR-5745B', '6999.00', '宗师版 i7-7700HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '148123456789', '1901', null, '1', null);
INSERT INTO `wh_product` VALUES ('23', '7', '戴尔灵越游匣15PR-5645SE', '6699.00', '枪弹版 i5-7300HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i5标准电压版', '4G', '游戏本', '128G+1T', '153123456789', '1231', null, '0', null);
INSERT INTO `wh_product` VALUES ('24', '7', '戴尔灵越游匣15PR-5645SE', '7999.00', '枪弹版 i7-7700HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '1539923456789', '221', null, '0', null);
INSERT INTO `wh_product` VALUES ('25', '7', '戴尔游匣', '6099.00', '精锐版 i7-6700HQ 4G GTX960 4G', 'Windows 10', '4G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '1519123456789', '711', null, '1', null);
INSERT INTO `wh_product` VALUES ('26', '7', '戴尔游匣', '5299.00', '精锐版 i5-6300HQ 4G GTX960 4G', 'Windows 10', '4G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i5标准电压版', '4G', '游戏本', '128G+1T', '1529123456789', '319', null, '0', null);
INSERT INTO `wh_product` VALUES ('27', '7', '戴尔灵越游匣15PR-5645B', '5999.00', '宗师版 i5-7300HQ 8G GTX1050 4G', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX1050', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '1511123456789', '2110', null, '0', null);
INSERT INTO `wh_product` VALUES ('28', '8', 'ThinkPadE470 c', '3998.00', '【E470C-2017新】i5 4G 500G', 'Linux', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '500G', '150123456789', '117', null, '1', null);
INSERT INTO `wh_product` VALUES ('29', '8', 'ThinkPadE470 c', '4699.00', '【E470C-2017新】i5 8G 500G', 'Linux', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '500G', '151123456789', '1862', null, '0', null);
INSERT INTO `wh_product` VALUES ('30', '8', 'ThinkPadE470 c', '5499.00', '【E470C-2017新】i5 8G 1TB', 'Linux', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '1T', '152123456789', '812', null, '1', null);
INSERT INTO `wh_product` VALUES ('31', '8', 'ThinkPadE470 c', '5399.00', '【E470C-2017新】i5 4G 256GSSD', 'Linux', '4G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '256G固态', '153123456789', '162', null, '0', null);
INSERT INTO `wh_product` VALUES ('32', '8', 'ThinkPadE470 c', '5499.00', '【E470C-2017新】i5 8G 256GSSD', 'Linux', '8G', '标准屏(1366×768)', '入门级游戏独立显卡', 'Intel i5低功耗版', '2G', '常规本', '256G固态', '154123456789', '1180', null, '0', null);
INSERT INTO `wh_product` VALUES ('33', '9', '华硕FH5900V', '4999.00', '【高速】顽石游戏本i74G1T128SSD', 'Windows 10', '4G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7标准电压版', '2G', '游戏本', '128G+1T', '1450123456789', '1231', null, '0', null);
INSERT INTO `wh_product` VALUES ('34', '9', '华硕FL5900UQ', '4699.00', '顽石经典【高配i7 8G 1T 深蓝】', 'Windows 10', '8G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '游戏本', '1T', '1550123456789', '1231', null, '1', null);
INSERT INTO `wh_product` VALUES ('35', '9', '华硕FL5900UQ', '4999.00', '顽石双盘【i7 4G 1t加128SSD】', 'Windows 10', '4G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '游戏本', '128G+1T', '1531023456789', '221', null, '0', null);
INSERT INTO `wh_product` VALUES ('36', '9', '华硕FL5900U', '4799.00', '顽石高速【i7-4G 512SSD 炫红】', 'Windows 10', '4G', '全高清屏(1920*1080)', 'GT940M', 'Intel i7低功耗版', '2G', '游戏本', '512G固态', '1510123456789', '103', null, '1', null);
INSERT INTO `wh_product` VALUES ('37', '9', '华硕FL5900UQ', '4799.00', '顽石高速【i74G512SSD NV940MX】', 'Windows 10', '4G', '全高清屏(1920*1080)', '入门级游戏独立显卡', 'Intel i7低功耗版', '2G', '游戏本', '512G固态', '1450123456789', '341', null, '0', null);
INSERT INTO `wh_product` VALUES ('38', '10', '神舟战神Z7M-KP7GT', '6199.00', 'Z7M GT【i7 128G+1T GTX1050Ti】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX1050Ti', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '151123456789', '441', null, '0', null);
INSERT INTO `wh_product` VALUES ('39', '10', '神舟战神Z7M', '5499.00', '战神Z7M【四核i7 GTX965M】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX965M', 'Intel i7标准电压版', '4G', '游戏本', '128G+1T', '152123456789', '1289', null, '1', null);
INSERT INTO `wh_product` VALUES ('40', '10', '神舟战神Z7M-SL5D1', '4499.00', '战神Z7M【四核i5 GTX965M】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX965M', 'Intel i7标准电压版', '2G', '游戏本', '1T', '153123456789', '231', null, '0', null);
INSERT INTO `wh_product` VALUES ('41', '10', '神舟战神Z6-KP5GT', '5199.00', 'Z6 GT【i5 128G+1T GTX1050】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX1050', 'Intel i5标准电压版', '4G', '游戏本', '128G+1T', '154123456789', '469', null, '1', null);
INSERT INTO `wh_product` VALUES ('42', '10', '神舟战神G6', '5499.00', '战神G6【17.3英寸 GTX960M】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX960M', 'Intel i7标准电压版', '4G', '游戏本', '256固态', '155123456789', '1223', null, '0', null);
INSERT INTO `wh_product` VALUES ('43', '10', '神舟战神Z6-KP7GT', '5699.00', 'Z6 GT【i7 128G+1T GTX1050】', 'Windows 10', '8G', '全高清屏(1920×1080)', 'GTX1050', 'Intel i7标准电压版', '2G', '游戏本', '128G+1T', '156123456789', '1844', null, '1', null);

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
-- Table structure for `wh_provider`
-- ----------------------------
DROP TABLE IF EXISTS `wh_provider`;
CREATE TABLE `wh_provider` (
  `pv_id` int(11) NOT NULL,
  `pv_name` varchar(64) NOT NULL,
  `pv_address` varchar(128) NOT NULL,
  `pv_contact` varchar(16) NOT NULL,
  `pv_phone` varchar(16) NOT NULL,
  `pv_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`pv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_provider
-- ----------------------------
INSERT INTO `wh_provider` VALUES ('1', '微星鼎世嘉诚专卖店', '山东省淄博市张店区洪沟东路136号', '李杰', '18568997512', null);
INSERT INTO `wh_provider` VALUES ('2', '优创（湖南）信息设备有限公司', '长沙市高新区桐梓坡西路229号麓谷国际工业园A1', '爱德华', '15687412365', null);
INSERT INTO `wh_provider` VALUES ('3', '长沙尼桑电子科技有限责任公司', ' 中国 湖南 长沙市 芙蓉区晚报大道228号上东印', '刘伟', '13654821456', null);
INSERT INTO `wh_provider` VALUES ('4', '长沙富之尔数码科技有限公司', '中国 湖南 长沙市天心区 长沙天心电子B座世界2', '王德胜', '18532456852', null);

-- ----------------------------
-- Table structure for `wh_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `wh_purchase`;
CREATE TABLE `wh_purchase` (
  `pur_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `pur_count` int(11) NOT NULL,
  `pur_price` decimal(10,2) NOT NULL,
  `pur_date` date NOT NULL,
  `pv_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pur_total` decimal(10,2) NOT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pur_id`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`),
  KEY `pv_id` (`pv_id`),
  CONSTRAINT `wh_purchase_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `wh_product` (`pid`),
  CONSTRAINT `wh_purchase_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `wh_user` (`uid`),
  CONSTRAINT `wh_purchase_ibfk_3` FOREIGN KEY (`pv_id`) REFERENCES `wh_provider` (`pv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_purchase
-- ----------------------------

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
  `status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `token_id` (`token_id`),
  CONSTRAINT `wh_user_ibfk_1` FOREIGN KEY (`token_id`) REFERENCES `wh_token` (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wh_user
-- ----------------------------
INSERT INTO `wh_user` VALUES ('1', 'dingding', '123456', '78527309@qq.com', '13501234567', '1', '丁伟', null, null);
INSERT INTO `wh_user` VALUES ('2', 'dangdang', '234567', 'dang@qq.com', '13501234568', '1', '林当', null, '');
INSERT INTO `wh_user` VALUES ('3', 'doudou', '345678', 'dou@qq.com', '13501234569', '1', '窦志强', null, '');
INSERT INTO `wh_user` VALUES ('4', 'yaya', '456789', 'yaya@qq.com', '13501234560', '0', '秦小雅', null, null);
