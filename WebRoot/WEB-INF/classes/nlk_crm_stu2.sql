/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50146
Source Host           : 127.0.0.1:3306
Source Database       : nlk_crm_stu2

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2017-10-16 12:03:10
*/
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for comp_acount_manger
-- ----------------------------
DROP TABLE IF EXISTS `comp_acount_manger`;
CREATE TABLE `comp_acount_manger` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pack_id` int(10) NOT NULL,
  `pay_comp` varchar(50) NOT NULL COMMENT '付款单位',
  `pay_bank` varchar(50) NOT NULL COMMENT '支付银行',
  `pay_money` double(10,2) NOT NULL COMMENT '到账金额',
  `time` datetime NOT NULL COMMENT '到账时间',
  `times` int(10) NOT NULL COMMENT '到账期数',
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_acount_manger
-- ----------------------------

-- ----------------------------
-- Table structure for comp_applyfor
-- ----------------------------
DROP TABLE IF EXISTS `comp_applyfor`;
CREATE TABLE `comp_applyfor` (
  `aname` varchar(20) DEFAULT NULL,
  `adept` varchar(20) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `statics` int(1) DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_applyfor
-- ----------------------------
INSERT INTO `comp_applyfor` VALUES ('1', '1', '1', '0', '2017-01-03 17:17:53', '1');
INSERT INTO `comp_applyfor` VALUES ('2', '2', '2', '0', '2017-01-03 17:40:26', '2');
INSERT INTO `comp_applyfor` VALUES ('3', '3', '3', '0', '2017-01-03 17:56:24', '3');

-- ----------------------------
-- Table structure for comp_business_category
-- ----------------------------
DROP TABLE IF EXISTS `comp_business_category`;
CREATE TABLE `comp_business_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `code` varchar(12) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_business_category
-- ----------------------------
INSERT INTO `comp_business_category` VALUES ('1', '专利转让', '021');
INSERT INTO `comp_business_category` VALUES ('2', '专利申请', '022');
INSERT INTO `comp_business_category` VALUES ('3', '商标注册', '02');
INSERT INTO `comp_business_category` VALUES ('4', '基金与其他', '023');


-- ----------------------------
-- Table structure for comp_bussness_type
-- ----------------------------
DROP TABLE IF EXISTS `comp_bussness_type`;
CREATE TABLE `comp_bussness_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type_code` varchar(50) DEFAULT NULL COMMENT '业务类别编码（如01,02,03,04）',
  `code` varchar(50) DEFAULT NULL COMMENT '业务编码',
  `task_day` int(5) DEFAULT NULL COMMENT '任务天数',
  `remark` varchar(100) DEFAULT NULL,
  `order_num` int(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `cost_price` double(10,0) DEFAULT NULL COMMENT '成本费',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_bussness_type
-- ----------------------------
INSERT INTO `comp_bussness_type` VALUES ('1', '商标', null, 'shangbiao', '5', '商标注册', null, '禁用', '200');
INSERT INTO `comp_bussness_type` VALUES ('2', '发明', null, 'faming', '10', '专利申请', null, '启用', '2000');
INSERT INTO `comp_bussness_type` VALUES ('3', '实用新型', null, 'shiyongxinxing', '10', '专利申请', null, '启用', '1000');
INSERT INTO `comp_bussness_type` VALUES ('4', '外观', null, 'waiguang', '10', '专利申请', null, '启用', '500');
INSERT INTO `comp_bussness_type` VALUES ('5', '作品著作权', null, 'zuobingzhuzuoquan', '5', '版权申请', null, '启用', '300');
INSERT INTO `comp_bussness_type` VALUES ('6', '软件著作权', null, 'ruanjianzhuzuoquan', '5', '版权申请', null, '启用', '300');
INSERT INTO `comp_bussness_type` VALUES ('7', '高新', null, 'gaoxin', '15', '高新代理', null, '启用', '6000');
INSERT INTO `comp_bussness_type` VALUES ('8', '基金', null, 'jijin', '15', '项目基金', null, '启用', '2000');
INSERT INTO `comp_bussness_type` VALUES ('9', '其他', null, 'qita', '10', 'ISO系列认定', null, '启用', '4500');
INSERT INTO `comp_bussness_type` VALUES ('10', '商标复审', null, 'shangfushen', '7', '驳回复审', null, '启用', '700');
INSERT INTO `comp_bussness_type` VALUES ('11', '村高新', null, 'cungaoxin', '10', '中关村高新', null, '启用', '200');
INSERT INTO `comp_bussness_type` VALUES ('12', '代缴杂费', null, 'daijiaozafei', '7', '专利年费等各类杂费', null, '启用', '50');
INSERT INTO `comp_bussness_type` VALUES ('13', '商标注册', null, 'shangbiaozhuce', '5', '商标注册申请', null, '启用', '200');
INSERT INTO `comp_bussness_type` VALUES ('14', '专利各种变更', null, 'zhuanlibiangeng', '5', '申请人，发明人，地址', null, '启用', '100');

-- ----------------------------
-- Table structure for comp_combo
-- ----------------------------
DROP TABLE IF EXISTS `comp_combo`;
CREATE TABLE `comp_combo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '套餐名称',
  `prime_cost` double DEFAULT NULL COMMENT '原价',
  `current_price` double DEFAULT NULL COMMENT '现价',
  `deadline` int(3) DEFAULT NULL COMMENT '截止日期,这里是天数',
  `style` int(2) DEFAULT NULL COMMENT '0/1/2   0表示成单前 1 表示成单后 2 其他',
  `content` varchar(300) DEFAULT NULL COMMENT '套餐内容',
  `remark` varchar(300) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='套餐';

-- ----------------------------
-- Records of comp_combo
-- ----------------------------
INSERT INTO `comp_combo` VALUES ('1', '商标注册套餐1', '6400', '6000', '10', '0', '注册4件，价格优惠400元', '');
INSERT INTO `comp_combo` VALUES ('2', '商标注册套餐2', '6400', '5400', '10', '1', '申请商标4个类别送作品版权1个', null);
INSERT INTO `comp_combo` VALUES ('3', '商标注册套餐3', '6400', '5400', '10', '0', '申请商标4类，送商标图形设计1个', null);
INSERT INTO `comp_combo` VALUES ('5', '专利申请套餐1', '5200', '4200', '11', '1', '外观专利申请4个送作品版权1个', null);
INSERT INTO `comp_combo` VALUES ('6', '专利申请套餐2', '5200', '4400', '1', '2', '外观专利申请4件立减800元', null);
INSERT INTO `comp_combo` VALUES ('7', '高新VIP套餐', '20000', '18000', '1', '2', '', null);
INSERT INTO `comp_combo` VALUES ('8', '2', '2.2', '2.2', '12', '1', '2', '12');
INSERT INTO `comp_combo` VALUES ('9', '1118', '2.8', '1.8', '28', '1', '18', '2228');
INSERT INTO `comp_combo` VALUES ('10', 'aaa', '45.99', '34.98', '23', '2', '1212', 'wer');

-- ----------------------------
-- Table structure for comp_commission_ratio
-- ----------------------------
DROP TABLE IF EXISTS `comp_commission_ratio`;
CREATE TABLE `comp_commission_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(1) DEFAULT NULL COMMENT '地区ID',
  `area_name` varchar(50) DEFAULT NULL COMMENT '地区名称',
  `type` varchar(50) DEFAULT NULL COMMENT '业务类别',
  `rule` varchar(50) DEFAULT NULL COMMENT '提成规则(1业务数量.2贡献额,3代理费)',
  `min_num` int(10) DEFAULT NULL COMMENT '提成最小范围',
  `max_num` int(10) DEFAULT NULL COMMENT '提成最大范围',
  `ratio_company` double(10,2) DEFAULT NULL COMMENT '提成比例公司资源',
  `ratio_custom` double(10,2) DEFAULT NULL COMMENT '提成比例客户介绍',
  `created_datetime` datetime DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_id_type_min_num` (`area_id`,`type`,`min_num`),
  UNIQUE KEY `area_id_type_max_num` (`area_id`,`type`,`max_num`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_commission_ratio
-- ----------------------------
INSERT INTO `comp_commission_ratio` VALUES ('1', '16', '九江', '01', '2', '1', '10000', '10.00', null, '2017-05-19 09:54:23', '2017-05-19 09:54:23');
INSERT INTO `comp_commission_ratio` VALUES ('2', '1', '北京', '01', '1', '1', '2', '10.00', '15.00', '2017-05-19 09:56:38', '2017-05-21 06:57:37');
INSERT INTO `comp_commission_ratio` VALUES ('3', '1', '北京', '01', '1', '3', '100', '13.00', '18.00', '2017-05-19 09:58:28', '2017-05-21 06:59:14');
INSERT INTO `comp_commission_ratio` VALUES ('4', '1', '北京总部', '02', '1', '1', '3', '10.00', '15.00', '2017-05-21 06:55:14', '2017-06-19 10:01:16');
INSERT INTO `comp_commission_ratio` VALUES ('5', '1', '北京总部', '02', '1', '4', '100', '15.00', '20.00', '2017-05-21 06:57:02', '2017-06-19 10:01:08');
INSERT INTO `comp_commission_ratio` VALUES ('9', '1', '北京', '03', '2', '10', '10', '10.00', '15.00', '2017-05-21 07:02:00', '2017-05-21 07:02:00');
INSERT INTO `comp_commission_ratio` VALUES ('10', '1', '北京', '04', '2', '6000', '100000', '10.00', '15.00', '2017-05-21 07:04:30', '2017-05-21 07:04:30');
INSERT INTO `comp_commission_ratio` VALUES ('11', '1', '北京总部', '021', '1', '1', '1111', '11.00', null, '2017-05-24 01:38:16', '2017-05-24 01:38:16');
INSERT INTO `comp_commission_ratio` VALUES ('12', '1', '北京总部', '022', '1', '1', '3', '10.00', '15.00', '2017-06-19 10:00:47', '2017-06-19 10:00:47');
INSERT INTO `comp_commission_ratio` VALUES ('13', '1', '北京总部', '023', '1', '1', '2', '10.00', '13.00', '2017-06-19 02:13:18', '2017-06-19 02:13:18');
INSERT INTO `comp_commission_ratio` VALUES ('14', '1', '北京总部', '023', '1', '3', '100', '15.00', '18.00', '2017-06-19 02:14:01', '2017-06-19 02:14:01');
INSERT INTO `comp_commission_ratio` VALUES ('15', '1', '北京总部', '022', '1', '4', '100', '13.00', '18.00', '2017-06-19 04:04:11', '2017-06-19 04:04:11');

-- ----------------------------
-- Table structure for comp_contract
-- ----------------------------
DROP TABLE IF EXISTS `comp_contract`;
CREATE TABLE `comp_contract` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `work_code` int(10) DEFAULT NULL COMMENT '任务编号',
  `company_name` varchar(50) DEFAULT NULL COMMENT '客户',
  `company_resouce` varchar(50) DEFAULT NULL COMMENT '客户来源',
  `start_time` datetime DEFAULT NULL COMMENT '合同签订的时间',
  `notarization_fee` double(10,2) DEFAULT NULL COMMENT '合同公证费',
  `audit_fee` double(10,2) DEFAULT NULL COMMENT '合同审计费',
  `agency_fee` double(10,2) DEFAULT NULL COMMENT '合同代理费',
  `cost_amount` double(10,2) DEFAULT NULL COMMENT '合同成本额',
  `contribution` double(10,2) DEFAULT NULL COMMENT '合同贡献额',
  `cost_total` double(10,2) DEFAULT NULL COMMENT '合同总费用',
  `type` varchar(1000) DEFAULT NULL COMMENT '合同类型',
  `content` longtext COMMENT '合同内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '合同备注',
  `code` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `create_login_name` varchar(50) DEFAULT NULL COMMENT '录入合同用户',
  `create_datetime` datetime DEFAULT NULL COMMENT '录入合同日期',
  `done_login_name` varchar(50) DEFAULT NULL COMMENT '成单用户账号',
  `pay_way` varchar(50) DEFAULT NULL COMMENT '付款方式',
  `pay_status` varchar(10) DEFAULT '未付款' COMMENT '付款状态（未付款，部分付款，已付款）',
  `pay_times` int(10) DEFAULT NULL COMMENT '付款次数',
  `way_enter` varchar(50) DEFAULT NULL COMMENT '录入方式（自动生成，手动录入）',
  `percentage` double DEFAULT NULL COMMENT '总提成',
  `server_code` varchar(50) DEFAULT NULL COMMENT '业务类型（如0102，0304，0103，020405等）',
  `status` varchar(50) DEFAULT '正常' COMMENT '已废弃，正常，已结案',
  `updated_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  `is_invoice` varchar(50) DEFAULT 'no' COMMENT '是否已申请发票（yes,no）',
  `finance_info` varchar(1000) DEFAULT NULL COMMENT '财务信息',
  `bank` varchar(50) DEFAULT NULL COMMENT '到账银行',
  `custom_name` varchar(50) DEFAULT NULL COMMENT '推荐客户名称',
  `custom_phone` varchar(50) DEFAULT NULL COMMENT '推荐客户联系方式',
  `auditor_phone` varchar(50) DEFAULT NULL COMMENT '审核人手机号',
  `auditor` varchar(50) DEFAULT NULL COMMENT '审核人',
  `auditor_ok` varchar(50) DEFAULT NULL COMMENT '实际审核人',
  `audit_datetime` datetime DEFAULT NULL COMMENT '审核日期',
  `auditing_status` varchar(50) DEFAULT NULL COMMENT '审核状态（未审核、审核通过、退回）',
  `audit_reason` varchar(200) DEFAULT NULL COMMENT '审核原因',
  `below_line` bit(1) DEFAULT NULL COMMENT '是否有线下合同',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='合同管理';

-- ----------------------------
-- Records of comp_contract
-- ----------------------------
INSERT INTO `comp_contract` VALUES ('1', '111', '测试1', '客户介绍', '2017-06-12 14:57:16', '200.00', '0.00', '600.00', '0.00', '200.00', '600.00', '[{\"name\":\"商标注册\",\"notarizationFee\":\"200\",\"agencyFee\":\"600\",\"num\":\"1\",\"contribution\":\"200\",\"percentageRate\":\"15\",\"percentage\":\"30\",\"serverCode\":\"02\",\"code\":\"5\"}]', null, '', '170001', 'admin', '2017-06-12 15:01:43', 'admin', '转账', '未付款', '1', '自动生成', null, '02', '已废弃', '2017-08-17 10:43:39', 'no', '[{\"amount\":\"600\",\"time\":\"2017-6-13\",\"remark\":\"一次付清\",\"serverType\":\"商标注册\"}]', '万总微信', 'jskh', '13567854985', '18062425172', '李艳云', '管理员', '2017-06-14 10:06:03', '审核通过', '45', '');
INSERT INTO `comp_contract` VALUES ('2', '112', '公司1', '其他', '2017-06-19 17:41:18', '500.00', '0.00', '7900.00', '0.00', '800.00', '7900.00', '[{\"name\":\"软件著作权\",\"notarizationFee\":\"300\",\"agencyFee\":\"7000\",\"num\":\"2\",\"contribution\":\"700\",\"percentageRate\":\"13\",\"percentage\":\"91\",\"serverCode\":\"022\",\"code\":\"8\"},{\"name\":\"作品著作权\",\"notarizationFee\":\"200\",\"agencyFee\":\"900\",\"num\":\"2\",\"contribution\":\"100\",\"percentageRate\":\"13\",\"percentage\":\"13\",\"serverCode\":\"022\",\"code\":\"10\"}]', null, 'wewer', '170002', 'admin', '2017-06-19 17:42:46', '王莹', '转账', '已付款', '2', '自动生成', null, '022', '流程已完成', '2017-06-30 14:12:49', 'yes', '[{\"amount\":\"7000\",\"time\":\"2017-06-23\",\"remark\":\"aaa\",\"serverType\":\"软件著作权\"},{\"amount\":\"1000\",\"time\":\"2017-06-23\",\"remark\":\"bbb\",\"serverType\":\"作品著作权\"}]', '万总微信', '', '', '18808681293', '汪艳', '管理员', '2017-06-23 14:23:29', '审核通过', 'wer', '\0');
INSERT INTO `comp_contract` VALUES ('3', '113', '公司1', '其他', '2017-06-21 15:21:13', '700.00', '0.00', '14400.00', '3000.00', '3700.00', '14400.00', '[{\"name\":\"商标注册\",\"notarizationFee\":\"200\",\"agencyFee\":\"3000\",\"num\":\"2\",\"contribution\":\"2400\",\"percentageRate\":\"10\",\"percentage\":\"240\",\"serverCode\":\"02\",\"code\":\"5\"},{\"name\":\"软件著作权\",\"notarizationFee\":\"300\",\"agencyFee\":\"6800\",\"num\":\"2\",\"contribution\":\"500\",\"percentageRate\":\"13\",\"percentage\":\"65\",\"serverCode\":\"022\",\"code\":\"8\"},{\"name\":\"基金\",\"costAmount\":\"3000\",\"agencyFee\":\"3600\",\"num\":\"1\",\"contribution\":\"600\",\"percentageRate\":\"10\",\"percentage\":\"60\",\"serverCode\":\"023\",\"code\":\"9\"},{\"name\":\"作品著作权\",\"notarizationFee\":\"200\",\"agencyFee\":\"1000\",\"num\":\"2\",\"contribution\":\"200\",\"percentageRate\":\"13\",\"percentage\":\"26\",\"serverCode\":\"022\",\"code\":\"10\"}]', null, 'qwrqe', '170003', '王莹', '2017-06-23 15:21:20', '王莹', '转账', '已付款', '4', '自动生成', null, '02022023', '正常', '2017-06-23 16:35:39', 'no', '[{\"amount\":\"3000\",\"time\":\"明天\",\"remark\":\"wer\",\"serverType\":\"商标注册\"},{\"amount\":\"6800\",\"time\":\"明天\",\"remark\":\"sfd\",\"serverType\":\"软件著作权\"},{\"amount\":\"3600\",\"time\":\"明天\",\"remark\":\"dsf\",\"serverType\":\"基金\"},{\"amount\":\"1000\",\"time\":\"明天\",\"remark\":\"dhffg\",\"serverType\":\"作品著作权\"}]', '万总微信', '', '', '15717801228', '李仙', '李仙', '2017-06-23 15:31:50', '审核通过', 'ert', '');
INSERT INTO `comp_contract` VALUES ('4', '114', '测试1', '客户介绍', '2017-06-30 00:00:46', '200.00', '0.00', '8000.00', '4000.00', '3600.00', '8000.00', '[{\"name\":\"商标注册\",\"notarizationFee\":\"200\",\"agencyFee\":\"3000\",\"num\":\"1\",\"contribution\":\"2600\",\"percentageRate\":\"15\",\"percentage\":\"390\",\"serverCode\":\"02\",\"code\":\"5\"},{\"name\":\"基金\",\"costAmount\":\"4000\",\"agencyFee\":\"5000\",\"num\":\"3\",\"contribution\":\"1000\",\"percentageRate\":\"18\",\"percentage\":\"180\",\"serverCode\":\"023\",\"code\":\"9\"}]', null, 'sd', '170004', '刘艳秋', '2017-06-30 12:02:38', '刘艳秋', '转账', '未付款', '2', '自动生成', null, '02023', '正常', '2017-06-30 14:05:50', 'no', '[{\"amount\":\"3000\",\"time\":\"aaa\",\"remark\":\"ss\",\"serverType\":\"商标注册\"},{\"amount\":\"5000\",\"time\":\"ddd\",\"remark\":\"dd\",\"serverType\":\"基金\"}]', '万总微信', '', '', '18808681293', '汪艳', '汪艳', '2017-06-30 14:05:50', '审核通过', 'sdf', '');
INSERT INTO `comp_contract` VALUES ('5', '116', '1111', '百度推广', '2017-06-30 14:19:32', '400.00', '0.00', '8000.00', '0.00', '1000.00', '8000.00', '[{\"name\":\"软件著作权\",\"notarizationFee\":\"200\",\"agencyFee\":\"7000\",\"num\":\"2\",\"contribution\":\"800\",\"percentageRate\":\"13\",\"percentage\":\"104\",\"serverCode\":\"022\",\"code\":\"8\"},{\"name\":\"作品著作权\",\"notarizationFee\":\"200\",\"agencyFee\":\"1000\",\"num\":\"2\",\"contribution\":\"200\",\"percentageRate\":\"13\",\"percentage\":\"26\",\"serverCode\":\"022\",\"code\":\"10\"}]', null, '', '170005', '王莹', '2017-06-30 14:21:03', '王莹', '转账', '部分付款', '2', '自动生成', null, '022', '流程已完成', '2017-06-30 14:43:31', 'no', '[{\"amount\":\"7000\",\"time\":\"we\",\"remark\":\"wewe\",\"serverType\":\"软件著作权\"},{\"amount\":\"1000\",\"time\":\"we\",\"remark\":\"we\",\"serverType\":\"作品著作权\"}]', '万总微信', '', '', '18808681293', '汪艳', null, null, '未审核', null, '');
INSERT INTO `comp_contract` VALUES ('6', null, '铸剑山庄', '', '2017-07-10 15:53:46', '200.00', '0.00', '3000.00', '0.00', '2400.00', '3000.00', '[{\"name\":\"商标注册\",\"notarizationFee\":\"200\",\"agencyFee\":\"3000\",\"num\":\"2\",\"contribution\":\"2400\",\"percentageRate\":\"10\",\"percentage\":\"240\",\"serverCode\":\"02\",\"code\":\"5\"}]', null, '地方是房东三大师傅', '170006', '郭梦秋', '2017-07-10 15:53:50', '许丽', '转账', '未付款', '1', '手动录入', null, '02', '正常', '2017-07-10 15:57:03', 'no', '[{\"amount\":\"3000\",\"time\":\"0710\",\"remark\":\"方式\",\"serverType\":\"商标注册\"}]', '万总微信', '测试', '', '13681029390', '田磊', null, null, '未审核', null, '');

-- ----------------------------
-- Table structure for comp_contract_server_type
-- ----------------------------
DROP TABLE IF EXISTS `comp_contract_server_type`;
CREATE TABLE `comp_contract_server_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `work_code` int(10) DEFAULT NULL COMMENT '任务号',
  `contract_code` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `server_code` varchar(50) DEFAULT NULL COMMENT '业务类型编号',
  `server_item_code` varchar(50) DEFAULT NULL COMMENT '业务编号',
  `name` varchar(50) DEFAULT NULL COMMENT '业务类型名称',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `cost` float DEFAULT NULL COMMENT '费用',
  `notarization_fee` float DEFAULT NULL COMMENT '官费',
  `audit_fee` float DEFAULT NULL COMMENT '审计费',
  `audit_cost` float DEFAULT NULL COMMENT '审计成本费',
  `agency_fee` float DEFAULT NULL COMMENT '服务费',
  `contribution` float DEFAULT NULL COMMENT '贡献额',
  `cost_amount` float DEFAULT NULL COMMENT '成本额',
  `percentage_rate` float DEFAULT NULL COMMENT '提成率',
  `percentage` float DEFAULT NULL COMMENT '提成',
  `status` varchar(50) DEFAULT NULL COMMENT '已废弃，正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='合同业务类型表';

-- ----------------------------
-- Records of comp_contract_server_type
-- ----------------------------
INSERT INTO `comp_contract_server_type` VALUES ('1', null, '170001', '02', '5', '商标注册', '1', null, '200', null, null, '600', '200', null, '15', '30', '已废弃');
INSERT INTO `comp_contract_server_type` VALUES ('4', null, '170002', '022', '8', '软件著作权', '2', null, '300', null, null, '7000', '700', null, '13', '91', '流程已完成');
INSERT INTO `comp_contract_server_type` VALUES ('5', null, '170002', '022', '10', '作品著作权', '2', null, '200', null, null, '900', '100', null, '13', '13', '流程已完成');
INSERT INTO `comp_contract_server_type` VALUES ('6', null, '170003', '02', '5', '商标注册', '2', null, '200', null, null, '3000', '2400', null, '10', '240', null);
INSERT INTO `comp_contract_server_type` VALUES ('7', null, '170003', '022', '8', '软件著作权', '2', null, '300', null, null, '6800', '500', null, '13', '65', null);
INSERT INTO `comp_contract_server_type` VALUES ('8', null, '170003', '023', '9', '基金', '1', null, null, null, null, '3600', '600', '3000', '10', '60', null);
INSERT INTO `comp_contract_server_type` VALUES ('9', null, '170003', '022', '10', '作品著作权', '2', null, '200', null, null, '1000', '200', null, '13', '26', null);
INSERT INTO `comp_contract_server_type` VALUES ('12', null, '170004', '02', '5', '商标注册', '1', null, '200', null, null, '3000', '2600', null, '15', '390', null);
INSERT INTO `comp_contract_server_type` VALUES ('13', null, '170004', '023', '9', '基金', '3', null, null, null, null, '5000', '1000', '4000', '18', '180', null);
INSERT INTO `comp_contract_server_type` VALUES ('14', null, '170005', '022', '8', '软件著作权', '2', null, '200', null, null, '7000', '800', null, '13', '104', '流程已完成');
INSERT INTO `comp_contract_server_type` VALUES ('15', null, '170005', '022', '10', '作品著作权', '2', null, '200', null, null, '1000', '200', null, '13', '26', '流程已完成');
INSERT INTO `comp_contract_server_type` VALUES ('16', null, '170006', '02', '5', '商标注册', '2', null, '200', null, null, '3000', '2400', null, '10', '240', null);

-- ----------------------------
-- Table structure for comp_cost
-- ----------------------------
DROP TABLE IF EXISTS `comp_cost`;
CREATE TABLE `comp_cost` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `area_id` int(10) DEFAULT NULL COMMENT '地区ID',
  `area_name` varchar(50) DEFAULT NULL COMMENT '地区名称',
  `bussness_id` int(11) DEFAULT NULL COMMENT '业务ID',
  `bussness_name` varchar(50) DEFAULT NULL COMMENT '业务名称',
  `type` varchar(50) DEFAULT NULL COMMENT '业务类别(专利"01",商标"02",版权"03",高新"04",基金与其他"05")',
  `cost` double DEFAULT NULL COMMENT '业务成本',
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_id_bussness_id` (`area_id`,`bussness_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='各地区业务成本';

-- ----------------------------
-- Records of comp_cost
-- ----------------------------
INSERT INTO `comp_cost` VALUES ('2', '1', '北京', '2', '发明', '01', '2000', '2017-05-19 10:00:44', '2017-05-21 07:06:57');
INSERT INTO `comp_cost` VALUES ('4', '1', '北京', '12', '代缴杂费', '01', '100', '2017-05-21 07:09:02', '2017-05-21 07:09:02');
INSERT INTO `comp_cost` VALUES ('5', '1', '北京总部', '13', '商标注册', '02', '200', '2017-05-21 07:12:44', '2017-06-19 09:53:57');
INSERT INTO `comp_cost` VALUES ('6', '1', '北京', '3', '实用新型', '01', '1000', '2017-05-21 07:13:26', '2017-05-21 07:13:26');
INSERT INTO `comp_cost` VALUES ('7', '2', '武汉分公司', '2', '发明', '022', '1', '2017-05-24 12:00:22', '2017-05-24 12:00:22');
INSERT INTO `comp_cost` VALUES ('8', '1', '北京总部', '6', '软件著作权', '022', '3000', '2017-06-19 09:53:40', '2017-06-19 09:53:40');
INSERT INTO `comp_cost` VALUES ('9', '1', '北京总部', '8', '基金', '023', '2000', '2017-06-19 14:12:56', '2017-06-19 14:12:56');
INSERT INTO `comp_cost` VALUES ('10', '1', '北京总部', '5', '作品著作权', '022', '300', '2017-06-19 16:02:58', '2017-06-19 16:02:58');

-- ----------------------------
-- Table structure for comp_customer
-- ----------------------------
DROP TABLE IF EXISTS `comp_customer`;
CREATE TABLE `comp_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL COMMENT '公司名称',
  `company_leve` varchar(20) DEFAULT '' COMMENT '等级',
  `input_time` datetime DEFAULT NULL COMMENT '录入时间',
  `input_user` varchar(50) DEFAULT NULL COMMENT '录入人帐号',
  `company_phone` varchar(50) DEFAULT '',
  `company_tel` varchar(50) DEFAULT '',
  `company_email` varchar(50) DEFAULT '' COMMENT '电子邮件',
  `company_fax` varchar(50) DEFAULT '' COMMENT '传真',
  `company_prov` varchar(20) DEFAULT NULL COMMENT '省份',
  `company_city` varchar(20) DEFAULT '' COMMENT '城市',
  `info_source` varchar(10) DEFAULT '' COMMENT '客户来源',
  `company_address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `sub_id` int(10) DEFAULT NULL,
  `company_intro` text COMMENT '公司简介',
  `zipcode` varchar(10) DEFAULT '' COMMENT '邮编',
  `company_industry` varchar(30) DEFAULT NULL COMMENT '公司所属行业',
  `registering_property` varchar(50) DEFAULT NULL COMMENT '公司的注册资金',
  `owner_user` varchar(50) DEFAULT NULL COMMENT '所属人帐号',
  `status` int(1) DEFAULT NULL COMMENT '状态：1为启用，0为禁用',
  `bussness_type` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `task_status` int(5) DEFAULT NULL COMMENT '任务状态：0没有分配任务，1已分配任务',
  `order_status` int(5) DEFAULT NULL COMMENT '是否成过单：0没成过单，1成过单',
  `public_status` int(1) DEFAULT '0' COMMENT '是否为公共客户(经过3次没有成单的客户)（0不是公共客户，1是）',
  `company_linkman` varchar(20) DEFAULT NULL COMMENT '公司联系人',
  `company_linkmantel` varchar(15) DEFAULT NULL COMMENT '公司联系人电话',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name` (`company_name`) USING BTREE,
  KEY `owner_user` (`owner_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_customer
-- ----------------------------
INSERT INTO `comp_customer` VALUES ('150', '网娱互动科技（北京）股份有限公司', '刚接触', '2017-07-10 15:03:11', null, null, '010-56140561  负责人 女的', null, null, '北京', '东城区', '电话销售', null, null, null, null, '15年高新', null, '郭彦敏', '1', '高新', '2017-07-10 16:56:19', '1', null, null, null, null, '加QQ 641185310发简介和高新资料。软著推了15个。');
INSERT INTO `comp_customer` VALUES ('151', '7.5北京地星伟业数码科技有限公司', '刚接触', '2017-07-10 15:03:11', null, null, '82603903', null, null, '北京', '东城区', '电话销售', null, null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-10 15:03:11', null, null, null, null, null, '行政负责，今天没在');
INSERT INTO `comp_customer` VALUES ('152', '7.5北京骏嘉财通科技有限公司', '刚接触', '2017-07-10 15:03:11', null, null, '400-6069365', null, null, '北京', '东城区', '网络推广', null, null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-10 15:03:11', null, null, null, null, null, '留我联系方式，让负责人给我回电话。');
INSERT INTO `comp_customer` VALUES ('153', 'B7.10北京华信捷投资咨询有限责任公司', '刚接触', '2017-07-07 00:00:00', '史一', null, '68066861 财务 郭经理', null, null, '北京', '东城区', '电话销售', '·', null, null, null, '15年高新', null, '王子铮', '1', '高新', '2017-07-10 17:00:26', '1', null, null, null, null, 'qq 350414921');
INSERT INTO `comp_customer` VALUES ('154', 'B7.10北京众智信安信息技术研究院', '刚接触', '2017-07-07 00:00:00', '史一', null, '82896558', null, null, '北京', '东城区', '电话销售', '·', null, null, null, '15年高新', null, '张秀辉', '1', '高新', '2017-07-10 17:00:44', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('155', 'B7.10北京和利时恒业科技有限公司', '刚接触', '2017-07-07 00:00:00', '史一', null, '62965620', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('156', 'B7.10北京鑫智盛世科技有限公司', '刚接触', '2017-07-07 00:00:00', '史一', null, '62101866', null, null, '北京', '东城区', '网络推广', '·', null, null, null, '15年高新', null, '张秀辉', '1', '商标', '2017-07-10 17:00:45', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('157', '北京滔滔前途国际教育科技有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, ' 13911224198', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '张秀辉', '1', '商标', '2017-07-10 17:00:45', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('158', '北京闻美教育咨询有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, ' 15810888801', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:03:12', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('159', '北京创优翼教育科技有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, '18511761085', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:03:12', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('160', '北京乐醒教育科技有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, '13552733802', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:03:12', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('161', '大学长（北京）网络教育科技有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, '65138877', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '李艳云', '1', '高新', '2017-07-10 17:01:03', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('162', '北京万德宏远教育咨询有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, ' 13810317852', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '李艳云', '1', '高新', '2017-07-10 17:01:03', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('163', '喜马拉雅教育科技（北京）有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, ' 18500069876', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '李艳云', '1', '高新', '2017-07-10 17:01:04', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('164', '玩聚（北京）教育科技有限公司', '刚接触', '2017-07-06 00:00:00', '周艺', null, '13801271301;', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '李艳云', '1', '商标', '2017-07-10 17:01:04', '1', null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('165', '7.10北京中创锐科信息技术有限公司', '刚接触', '2017-07-06 00:00:00', '史一', null, '82730052', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('166', '张经理', '刚接触', '2017-07-06 00:00:00', '冷峰', null, '01083421134', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '版权', '2017-07-07 00:00:00', null, null, null, null, null, '咨询版权 口号 ');
INSERT INTO `comp_customer` VALUES ('167', '孟小姐', '有意向', '2017-07-06 00:00:00', '冷峰', null, '15811048146', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '软件发明 ');
INSERT INTO `comp_customer` VALUES ('168', '何经理-黎莎跟进', '刚接触', '2017-07-06 00:00:00', '陈晨', null, '13647218180', null, null, '湖北', '武汉 ', '网络推广', '武汉', null, null, null, null, null, '陈晨', '1', '其他', '2017-07-10 15:03:12', null, null, null, null, null, '智能制造企业认定');
INSERT INTO `comp_customer` VALUES ('169', '贾经理-黎莎跟进', '刚接触', '2017-07-06 00:00:00', '陈晨', null, '15601152619', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '专利', '2017-07-10 15:03:13', null, null, null, null, null, '寻求合作');
INSERT INTO `comp_customer` VALUES ('170', '张延鹏', '有意向', '2017-07-06 00:00:00', '冷峰', null, '13810221020', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '专利申请');
INSERT INTO `comp_customer` VALUES ('171', '周先生', '刚接触', '2017-07-06 00:00:00', '冷峰', null, '13901243803', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '专利', '2017-07-07 00:00:00', null, null, null, null, null, '有关于医疗类的专利 发明报价6560 ，手机号加他微信，给他发一下技术交底书，和需要提供费减的资料。单位申请');
INSERT INTO `comp_customer` VALUES ('172', '韩女士', '有意向', '2017-07-06 00:00:00', '冷峰', null, '52903092', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '版权', '2017-07-06 00:00:00', null, null, null, null, null, '版权登记，文字，美术，汇编作品 汇编4000-5000元 ');
INSERT INTO `comp_customer` VALUES ('173', '北京清源华建环境科技有限公司', '刚接触', '2017-07-06 00:00:00', '冷峰', null, '13581983150', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('174', 'W-田海艳-北京电旗通讯股份有限公司', '有意向', '2017-07-05 00:00:00', '赵新杨', null, '13811152404', null, null, '北京', '东城区', '网络推广', '北京望京', null, null, null, '通讯', null, '杨美燕', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新复审');
INSERT INTO `comp_customer` VALUES ('175', '薛经理', '有意向', '2017-07-05 00:00:00', '赵新杨', null, '010-63716361-804', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '版权', '2017-07-07 00:00:00', null, null, null, null, null, '咨询软著');
INSERT INTO `comp_customer` VALUES ('176', '罗先生', '刚接触', '2017-07-05 00:00:00', '赵新杨', null, '15611079733', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新 ');
INSERT INTO `comp_customer` VALUES ('177', '7.10北京青云创新科技发展有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '62168668 管理部', null, null, '北京', '东城区', '网络推广', '·', null, null, null, '15年高新', null, '史一', '1', '商标', '2017-07-10 15:03:13', null, null, null, null, null, '和东财合作了好久 让东财做软著1000。');
INSERT INTO `comp_customer` VALUES ('178', '9.10日立（中国）研究开发有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '010-82862918-415', null, null, '北京', '东城区', '电话销售', '·', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-10 15:03:13', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('179', '7.10北京中润信能源技术有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '62285286', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('180', '郑先生', '刚接触', '2017-07-05 00:00:00', '赵新杨', null, '13911837869', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '张文强', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('181', '7.10北京雷航时代科技有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '62255316 转 邵经理', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '负责人休产假');
INSERT INTO `comp_customer` VALUES ('182', '7.10中电达通数据技术股份有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '-82557922', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('183', '7.10北京淳堂科技有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '82679325', null, null, '北京', '东城区', '电话销售', '中关村10号楼', null, null, null, null, null, '史一', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('184', '7.10中国印刷科学技术研究院', '刚接触', '2017-07-05 00:00:00', '史一', null, '88275628', null, null, '北京', '东城区', '网络推广', '1', null, null, null, '15年高新', null, '史一', '1', '商标', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('185', '北京纽维逊建筑工程技术有限公司', '被其他成单', '2017-07-05 00:00:00', '史一', null, '82227280', null, null, '北京', '东城区', '网络推广', '1', null, null, null, '15年高新', null, '史一', '1', '商标', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('186', '7.10北京纽维逊建筑工程技术有限公司', '刚接触', '2017-07-05 00:00:00', '史一', null, '82227280', null, null, '北京', '东城区', '网络推广', '1', null, null, null, '15年高新', null, '史一', '1', '商标', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('187', '王先生', '刚接触', '2017-07-05 00:00:00', '赵新杨', null, '微信36588742', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '张文强', '1', '版权', '2017-07-05 00:00:00', null, null, null, null, null, '咨询软著');
INSERT INTO `comp_customer` VALUES ('188', '7.6北京掌上通网络技术股份有限公司', '刚接触', '2017-07-04 00:00:00', '史一', null, '59862117  行政 柳树负责', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('189', '7.10网娱互动科技（北京）股份有限公司', '刚接触', '2017-07-04 00:00:00', '史一', null, '010-56140561  负责人 女的', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '加QQ 641185310发简介和高新资料。软著推了15个。');
INSERT INTO `comp_customer` VALUES ('190', '7.10北京地星伟业数码科技有限公司', '刚接触', '2017-07-04 00:00:00', '史一', null, '82603903', null, null, '北京', '东城区', '电话销售', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '行政负责，今天没在');
INSERT INTO `comp_customer` VALUES ('191', '7.6北京骏嘉财通科技有限公司', '刚接触', '2017-07-04 00:00:00', '史一', null, '400-6069365', null, null, '北京', '东城区', '网络推广', '1', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '留我联系方式，让负责人给我回电话。');
INSERT INTO `comp_customer` VALUES ('192', '7.5北京红枫树智能控制技术股份有限公司', '待处理', '2017-07-04 00:00:00', '史一', null, '57076260', null, null, '北京', '东城区', '电话销售', '1', null, null, null, null, null, '史一', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '负责人不在。');
INSERT INTO `comp_customer` VALUES ('193', '7.7姚女士', '有意向', '2017-07-04 00:00:00', '张秀辉', null, '13810976310', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '专利', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('194', '冯先生', '刚接触', '2017-07-04 00:00:00', '赵新杨', null, '17701251781', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '专利', '2017-07-04 00:00:00', null, null, null, null, null, '专利申请');
INSERT INTO `comp_customer` VALUES ('195', '7.14北京博益众科技有限公司', '刚接触', '2017-07-04 00:00:00', '史一', null, '010-62960998', null, null, '北京', '东城区', '电话销售', '北京市海淀区信息路15号8层815室', null, null, null, null, null, '史一', '1', '高新', '2017-07-10 15:03:15', null, null, null, null, null, '负责人不在，十天后再联系。');
INSERT INTO `comp_customer` VALUES ('196', '7.4北京心知堂文化交流有限公司', '刚接触', '2017-07-03 00:00:00', '史一', null, '010-56293899', null, null, '北京', null, '电话销售', '北京市大兴区地盛北街1号18号楼八层', null, null, null, null, null, '史一', '1', '高新', '2017-07-10 15:03:15', null, null, null, null, null, '财务温女士负责，  给前台陈女士发邮件780561492@qq.com 。  明天再联系');
INSERT INTO `comp_customer` VALUES ('197', '世纪禾光科技发展（北京）有限公司', '刚接触', '2017-07-03 00:00:00', '史一', null, '18611792142 F刘经理', null, null, '北京', null, '网络推广', '北京市海淀区成府路28号1-901室', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-10 15:03:15', null, null, null, null, null, '加微信，发送介绍和高新资料。');
INSERT INTO `comp_customer` VALUES ('198', '中恒华瑞（北京）信息技术有限公司', '刚接触', '2017-07-03 00:00:00', '史一', null, '62369181', null, null, '北京', null, '电话销售', '北京市海淀区上地十街1号院2号楼508', null, null, null, null, null, '史一', '1', '高新', '2017-07-10 15:13:00', null, null, null, null, null, '苗经理负责  邮箱 miaoguilin@sinohuarui.com  公司软著有14个，发介绍和高新资料。');
INSERT INTO `comp_customer` VALUES ('199', '7.4北京幻响神州科技股份有限公司', '刚接触', '2017-07-03 00:00:00', '史一', null, '010-51660078', null, null, '北京', null, '电话销售', '北京市海淀区彩和坊路8号906室', null, null, null, '15年高新', null, '史一', '1', '高新', '2017-07-04 00:00:00', null, null, null, null, null, '转财务 孔经理负责，手头忙，换个时间联系。');
INSERT INTO `comp_customer` VALUES ('200', '北京乐普四方方圆科技股份有限公司', '刚接触', '2017-07-03 00:00:00', '史一', null, '010-88850480', null, null, '北京', null, '电话销售', '北京市海淀区闵庄路3号玉泉慧谷10号楼西侧一层102室', null, null, null, null, null, '史一', '1', '高新', '2017-07-10 15:13:01', null, null, null, null, null, '市场部的申娟经理负责知识产权，另一个女的负责高新复审。给申娟发送shenjuan_lpsf@126.com 企业介绍和高新资料');
INSERT INTO `comp_customer` VALUES ('201', '7.24莱恩创科（北京）科技有限公司', '刚接触', '2017-07-03 00:00:00', '史一', null, '65916800', null, null, '北京', null, '电话销售', '北京海淀学院路北四环中路238号柏彦大厦508室', null, null, null, null, null, '史一', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, '负责人郑经理（刚换的），13426216910  加微信，然后发公司及高新资料。');
INSERT INTO `comp_customer` VALUES ('202', '北京仁和诚信+银信长远', '已成单', '2017-07-03 00:00:00', '郭梦秋', null, '18610113983 张璐', null, null, '北京', '东城区', '电话销售', '北京市昌平区回龙观西大街龙冠置业大厦A座506', null, null, null, null, null, '郭梦秋', '1', '版权', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('203', '咨询高新', '刚接触', '2017-07-03 00:00:00', '张秀辉', null, 'QQ：2083300959', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('204', '靓诺派时装有限公司', '有意向', '2017-07-03 00:00:00', '王京京', null, '13301009728', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, '李先生13301009728');
INSERT INTO `comp_customer` VALUES ('205', '7.6诺未科技（北京）有限公司', '有意向', '2017-07-03 00:00:00', '张秀辉', null, '13311561266 冯晶', null, null, '北京', '东城区', '网络推广', ' 北京经济技术开发区西环南路18号B座1层103室', null, '银丰生物工程集团有限公司、中国医学科学院基础医学研究所、北京京源亚能生物技术有限公司，北京戈程知识产权代理有限公司', null, null, null, '郭梦秋', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, '本周四上午10:00到双井石韵浩庭A座1002室 ');
INSERT INTO `comp_customer` VALUES ('206', '西安亚辰餐饮有限公司', '已成单', '2017-07-03 00:00:00', '郭彦敏', null, '13772058025', null, null, '陕西', '西安', '客户介绍', '陕西西安', null, null, null, null, null, '郭彦敏', '1', '商标', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('207', '广州壹玖柒捌文化创意产业园有限公司', '已成单', '2017-07-03 00:00:00', '郭彦敏', null, '021', null, null, '广东', '广州', '客户介绍', '广东省 增城区', null, null, null, null, null, '郭彦敏', '1', '商标', '2017-07-10 15:13:01', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('208', '北京乐邦乐成科技孵化器有限公司', '刚接触', '2017-07-03 00:00:00', '董自强', null, '13911870382', null, null, '北京', '昌平区', '网络推广', '回龙观西大街龙冠商务中心银座6层', null, null, null, null, null, '董自强', '1', '其他', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('209', '陈先生-黎莎跟进', '刚接触', '2017-06-30 00:00:00', '陈晨', null, '17087187955', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '专利', '2017-07-10 15:13:01', null, null, null, null, null, '专利转让');
INSERT INTO `comp_customer` VALUES ('210', 'W- 河南中烟工业有限责任公司许昌卷烟厂', '已成单', '2017-06-30 00:00:00', '杨美燕', null, 'XXX', null, null, '河南', '许昌', '客户介绍', '许昌市魏都区明礼街1号  软著一件', null, null, null, 'XXX', null, '杨美燕', '1', '版权', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('211', '北京格致同德科技有限公司', '被其他成单', '2017-06-30 00:00:00', '史一', null, '	57487572 王先生  ', null, null, '北京', '东城区', '网络推广', '	北京市朝阳区百子湾西里403号楼2层209', null, null, null, null, null, '史一', '1', '商标', '2017-07-04 00:00:00', null, null, null, null, null, '邮箱info@beijinggt.com   简单咨询了一下高新技术企业。发公司及高新介绍资料。');
INSERT INTO `comp_customer` VALUES ('212', '北京智慧星光信息技术有限公司-温女士', '有意向', '2017-06-30 00:00:00', '冷峰', null, '15233021189', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '版权', '2017-07-06 00:00:00', null, null, null, null, null, '软著咨询 ');
INSERT INTO `comp_customer` VALUES ('213', '7.4北京亦通石油科技有限公司', '刚接触', '2017-06-30 00:00:00', '史一', null, '13521566631', null, null, '北京', '东城区', '电话销售', '北京市朝阳区永安东里16号五层D576室', null, null, null, null, null, '史一', '1', '商标', '2017-07-04 00:00:00', null, null, null, null, null, '下周一打，她给转财务');
INSERT INTO `comp_customer` VALUES ('214', '壹玖教育', '有意向', '2017-06-30 00:00:00', '冷峰', null, '无', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '冷峰', '1', '版权', '2017-06-30 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('215', '7.24北京爱力佳医药科技有限公司', '刚接触', '2017-06-30 00:00:00', '史一', null, '13552049218 袁总', null, null, '北京', '东城区', '网络推广', '	北京市海淀区高粱桥斜街59号院1号楼8层0816室', null, null, null, null, null, '史一', '1', '商标', '2017-07-10 15:13:02', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('216', '崔先生', '被其他成单', '2017-06-30 00:00:00', '冷峰', null, '13716400721', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '冷峰', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '购买专利');
INSERT INTO `comp_customer` VALUES ('217', '众鼎科技', '刚接触', '2017-06-30 00:00:00', '冷峰', null, '15801414139', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('218', '大光盛业（北京）传媒有限公司', '待处理', '2017-06-30 00:00:00', '冷峰', null, '13801113379', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '冷峰', '1', '专利', '2017-06-30 00:00:00', null, null, null, null, null, '确认下专利5年独占许可事项');
INSERT INTO `comp_customer` VALUES ('219', '北京爱诺艾斯商贸有限公司', '有意向', '2017-06-30 00:00:00', '冷峰', null, '13671133222', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周艺', '1', '商标', '2017-07-05 00:00:00', null, null, null, null, null, '商标注册');
INSERT INTO `comp_customer` VALUES ('220', '河南豆香坊食品有限公司', '已成单', '2017-06-30 00:00:00', '冷峰', null, '13073712195', null, null, '河南', '郑州', '电话销售', '二七区', null, null, null, null, null, '冷峰', '1', '商标', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('221', '万宝甲由（北京）科技有限责任公司', '有意向', '2017-06-30 00:00:00', '冷峰', null, '13810824048', null, null, '北京', '东城区', '电话销售', '亚运村附近', null, null, null, null, null, '冷峰', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('222', '去徒步科技有限公司', '有意向', '2017-06-30 00:00:00', '冷峰', null, '无', null, null, '北京', '东城区', '电话销售', '软件园', null, null, null, null, null, '冷峰', '1', '商标', '2017-06-30 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('223', '润宁悠悦生态科技（北京）有限公司---郭总', '有意向', '2017-06-30 00:00:00', '冷峰', null, '18610797494', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '咨询专利  ');
INSERT INTO `comp_customer` VALUES ('224', '北京三迪艾科思科技有限公司', '有意向', '2017-06-30 00:00:00', '冷峰', null, '010', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '其他', '2017-07-06 00:00:00', null, null, null, null, null, '咨询双软');
INSERT INTO `comp_customer` VALUES ('225', '田先生', '有意向', '2017-06-29 00:00:00', '赵新杨', null, '13466540103', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '专利', '2017-06-29 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('226', 'W-赵经理-新能源-海淀', '有意向', '2017-06-29 00:00:00', '赵新杨', null, '13439613750', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '杨美燕', '1', '高新', '2017-07-04 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('227', '张女士', '有意向', '2017-06-29 00:00:00', '赵新杨', null, '010-62197026', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王焱', '1', '专利', '2017-06-29 00:00:00', null, null, null, null, null, '购买专利');
INSERT INTO `comp_customer` VALUES ('228', '7.4北京中亿孚佑科技有限公司', '刚接触', '2017-06-29 00:00:00', '史一', null, '010-81515279 高女士', null, null, '北京', '东城区', '电话销售', '北京市通州区工业开发区广聚街22号', null, null, null, null, null, '史一', '1', '商标', '2017-07-04 00:00:00', null, null, null, null, null, '王总 负责，已发邮件，ronghua.gao@zhongyifuyou.com让转交给王总，7.3还没转交王总。');
INSERT INTO `comp_customer` VALUES ('229', '王经理', '待处理', '2017-06-29 00:00:00', '赵新杨', null, '18701591523', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('230', 'W-李斌-北京京唐德信轨道设备有限公司', '有意向', '2017-06-29 00:00:00', '赵新杨', null, '13311560650', null, null, '北京', '东城区', '网络推广', '北京丰台', null, null, null, '机械', null, '杨美燕', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('231', '6.30北京银驰腾达科技有限公司', '刚接触', '2017-06-29 00:00:00', '史一', null, '01080767260 张经理  ', null, null, '北京', null, '电话销售', '北京市昌平区回龙观镇发展路8号院1号楼4层410', null, null, null, null, null, '史一', '1', '商标', '2017-06-30 00:00:00', null, null, null, null, null, '咨询商标，报价一般1500.渠道2000。已发公司简介邮件  447677904@qq.com');
INSERT INTO `comp_customer` VALUES ('232', '北京银驰腾达科技有限公司', '被其他成单', '2017-06-29 00:00:00', '史一', null, '01080767260 张经理  ', null, null, '北京', null, '电话销售', '北京市昌平区回龙观镇发展路8号院1号楼4层410', null, null, null, null, null, '史一', '1', '商标', '2017-06-29 00:00:00', null, null, null, null, null, '咨询商标，报价一般1500.渠道2000。已发公司简介邮件');
INSERT INTO `comp_customer` VALUES ('233', '北京勤思教育', '刚接触', '2017-06-29 00:00:00', '董自强', null, '18612887813', null, null, '北京', '昌平区', '电话销售', '北京市昌平区白浮泉路17号', null, null, null, '教育', null, '董自强', '1', '其他', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('234', '北京北控高科技孵化器有限公司', '刚接触', '2017-06-29 00:00:00', '董自强', null, '01089760007', null, null, '北京', '昌平区', '电话销售', '北京市昌平区科技园区白浮泉路10号2号楼1107A', null, null, null, '孵化器', null, '董自强', '1', '其他', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('235', '7.5北京科瑞博远', '有意向', '2017-06-28 00:00:00', '张秀辉', null, '18611558295 张', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '其他', '2017-06-30 00:00:00', null, null, null, null, null, '咨询评估');
INSERT INTO `comp_customer` VALUES ('236', '玉美人美业（北京）商贸有限公司', '已成单', '2017-06-28 00:00:00', '郭彦敏', null, '孙总：15369618517', null, null, '北京', '东城区', '客户介绍', '怀柔', null, null, null, null, null, '郭彦敏', '1', '商标', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('237', '李四化', '已成单', '2017-06-28 00:00:00', '张秀辉', null, '13681512171', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '版权', '2017-07-04 00:00:00', null, null, null, null, null, '咨询软著');
INSERT INTO `comp_customer` VALUES ('238', '安萨尔多-于女士', '待处理', '2017-06-28 00:00:00', '张秀辉', null, '010-59786181', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '刘艳秋', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('239', '7.10北京思信通科技有限公司', '刚接触', '2017-06-28 00:00:00', '史一', null, '01082397721转806李经理负责', null, null, '北京', '东城区', '电话销售', '北京市海淀区北四环中路209号健翔园G座6号楼6301室', null, null, null, null, null, '史一', '1', '商标', '2017-07-04 00:00:00', null, null, null, null, null, '李经理手机13693177277   15年高新  未接');
INSERT INTO `comp_customer` VALUES ('240', '7.18优仕伯众管理咨询（北京）有限公司', '有意向', '2017-06-28 00:00:00', '张秀辉', null, '13520862564 张', null, null, '北京', '东城区', '网络推广', ' 北京市海淀区小营中关村东升科技园二期西区18号1区1层025室 ，2013年成立', null, null, null, null, null, '郭梦秋', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('241', '2017.7.10肖先生', '刚接触', '2017-06-28 00:00:00', '张秀辉', null, '18618260362', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '专利', '2017-07-07 00:00:00', null, null, null, null, null, '申请专利');
INSERT INTO `comp_customer` VALUES ('242', '齐女士-黎莎跟进', '刚接触', '2017-06-28 00:00:00', '陈晨', null, '15327203011', null, null, '湖北', '武汉 ', '网络推广', '武汉', null, null, null, null, null, '陈晨', '1', '商标', '2017-07-10 15:13:05', null, null, null, null, null, '咨询高新和专利 按照正常报价给的，高新也是给说了大概的费用，要3万左右这样，具体根据公司情况来定');
INSERT INTO `comp_customer` VALUES ('243', '7.15智动天地（北京）科技有限公司', '有意向', '2017-06-28 00:00:00', '张秀辉', null, '13910128618', null, null, '北京', '东城区', '网络推广', '北京市西城区德胜门外大街11号5幢305室', null, null, null, null, null, '郭梦秋', '1', '高新', '2017-07-04 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('244', '北京中能金瀚能源技术有限公司', '刚接触', '2017-06-28 00:00:00', '史一', null, '010-58431871', null, null, '北京', '东城区', '电话销售', '北京市朝阳区康家沟145号A195', null, null, null, null, null, '史一', '1', '商标', '2017-06-29 00:00:00', null, null, null, null, null, '正在做高新申请相关工作');
INSERT INTO `comp_customer` VALUES ('245', '晖丰', '已成单', '2017-06-28 00:00:00', '张秀辉', null, '123', null, null, '北京', '东城区', '客户介绍', '123', null, null, null, null, null, '张秀辉', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '王雨婷换工作后联系的，之前是和超凡合作');
INSERT INTO `comp_customer` VALUES ('246', '北京中金永嘉大数据技术有限公司', '已成单', '2017-06-28 00:00:00', '宋佳佳', null, '15010350428', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '商标', '2017-06-28 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('247', '7.5必和必拓（北京）生物技术有限公司', '刚接触', '2017-06-28 00:00:00', '史一', null, '56213400', null, null, '北京', '东城区', '网络推广', '	北京市大兴区西红门镇北兴路东段2号1幢249房间', null, null, null, null, null, '史一', '1', '商标', '2017-07-04 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('248', '6.29刘女士+北京美业生物科技有限公司', '有意向', '2017-06-28 00:00:00', '张秀辉', null, '0571 26894876', null, null, '浙江', '杭州', '网络推广', '杭州', null, null, null, null, null, '刘艳秋', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '15081674916   咨询高新');
INSERT INTO `comp_customer` VALUES ('249', '(做产学研协议）范经理', '待处理', '2017-06-28 00:00:00', '张秀辉', null, '18701261030', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '高新', '2017-06-29 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('250', '刘女士', '刚接触', '2017-06-27 00:00:00', '冷峰', null, '59006506', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '专利', '2017-06-27 00:00:00', null, null, null, null, null, '咨询项目书是否可以申报专利');
INSERT INTO `comp_customer` VALUES ('251', '李经理', '刚接触', '2017-06-27 00:00:00', '冷峰', null, '18611513363', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('252', '北京北安华电电梯工程有限公司', '有意向', '2017-06-27 00:00:00', '冷峰', null, '13522038503', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周艺', '1', '专利', '2017-07-05 00:00:00', null, null, null, null, null, '咨询专利    电梯机械   发明和实用专利查询  ');
INSERT INTO `comp_customer` VALUES ('253', '河北平安健康家园有限公司', '已成单', '2017-06-27 00:00:00', '周新翠', null, '18132020610', null, null, '河北', '石家庄', '客户介绍', '河北省石家庄市桥西区槐安东路81号', null, null, null, null, null, '周新翠', '1', '商标', '2017-06-29 00:00:00', null, null, null, null, null, '云优科技介绍');
INSERT INTO `comp_customer` VALUES ('254', 'W-南水北调', '已成单', '2017-06-27 00:00:00', '杨美燕', null, 'XXX', null, null, '北京', '海淀区', '客户介绍', 'XXX', null, null, null, null, null, '杨美燕', '1', '版权', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('255', '北京天凯华尊科技有限公司', '刚接触', '2017-06-27 00:00:00', '董自强', null, '84832071', null, null, '北京', '昌平区', '电话销售', '北京市昌平区北七家镇宏翔鸿企业孵化基地E座一层103-A', null, null, null, null, null, '董自强', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('256', '北京福力通达科技有限公司', '有意向', '2017-06-27 00:00:00', '董自强', null, '81764601', null, null, '北京', '昌平区', '电话销售', '北京市昌平区北七家镇瑶光路附近', null, null, null, null, null, '董自强', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('257', '北京昌兴顺达彩钢钢构有限公司', '刚接触', '2017-06-27 00:00:00', '董自强', null, '81766178', null, null, '北京', '昌平区', '电话销售', '北京市昌平区北七家镇工业园八仙工业区', null, null, null, null, null, '董自强', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('258', '北京今品餐饮有限公司', '有意向', '2017-06-27 00:00:00', '董自强', null, '15011157768', null, null, '北京', '海淀区', '电话销售', '北京市海淀区海淀大街3号1幢5层501-A5839			', null, null, null, null, null, '董自强', '1', '商标', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('259', '广州和顺教育发展有限公司', '已成单', '2017-06-27 00:00:00', '郭彦敏', null, '广州增城区', null, null, '广东', '广州', '电话销售', '广州省 ', null, null, null, null, null, '郭彦敏', '1', '商标', '2017-07-10 15:13:06', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('260', '王经理  欧里研究员', '有意向', '2017-06-27 00:00:00', '冷峰', null, '13146627501 ', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '专利', '2017-06-28 00:00:00', null, null, null, null, null, '咨询专利   ');
INSERT INTO `comp_customer` VALUES ('261', '北京迪格海纳教育科技有限公司，王先生', '刚接触', '2017-06-27 00:00:00', '赵新杨', null, '63103768', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-29 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('262', '世纪英闻信息资讯（北京）有限公司', '已成单', '2017-06-27 00:00:00', '冷峰', null, 'QQ 617448462', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('263', '王雪梅 ', '已成单', '2017-06-26 00:00:00', '赵新杨', null, ' 13691585232 ', null, null, '北京', '东城区', '网络推广', '北京市大兴区黄村海子角东忠信仓储园内 ', null, null, null, null, null, '宋佳佳', '1', '专利', '2017-06-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('264', '北京思创佳德桩工机械制造有限公司', '已成单', '2017-06-26 00:00:00', '宋佳佳', null, '18610219175', null, null, '北京', '东城区', '网络推广', '北京北京顺义高丽营镇水坡村8号院', null, null, null, null, null, '宋佳佳', '1', '版权', '2017-06-28 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('265', '北京奥洁鼎森新能源科技有限公司', '已成单', '2017-06-26 00:00:00', '赵新杨', null, '13911682286', null, null, '北京', '东城区', '网络推广', '北京市通州区梨园新城嘉园东侧鼎森实业', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('266', '高女士', '刚接触', '2017-06-26 00:00:00', '赵新杨', null, '13910686491', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王焱', '1', '其他', '2017-06-26 00:00:00', null, null, null, null, null, '知识产权评估');
INSERT INTO `comp_customer` VALUES ('267', 'W-白小姐-商标', '有意向', '2017-06-26 00:00:00', '赵新杨', null, '18600130350', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '杨美燕', '1', '商标', '2017-06-27 00:00:00', null, null, null, null, null, '咨询商标  ');
INSERT INTO `comp_customer` VALUES ('268', '刘长胜', '已成单', '2017-06-26 00:00:00', '张秀辉', null, '15890452265', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '专利', '2017-06-27 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('269', '2017.7.10中讯凌动（北京）科技有限公司', '有意向', '2017-06-26 00:00:00', '张秀辉', null, '13522181986', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('270', '2017.6.30钟先生', '待处理', '2017-06-26 00:00:00', '张秀辉', null, '52321679', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '专利', '2017-06-30 00:00:00', null, null, null, null, null, '咨询专利  ');
INSERT INTO `comp_customer` VALUES ('271', '涂林海', '刚接触', '2017-06-26 00:00:00', '张秀辉', null, '18311203753', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '专利', '2017-06-29 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('272', '国都证券', '有意向', '2017-06-22 00:00:00', '冷峰', null, '15011396155', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '高新', '2017-06-26 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('273', '咨询实用专利', '刚接触', '2017-06-22 00:00:00', '冷峰', null, '057128234089', null, null, '浙江', '杭州', '网络推广', '杭州', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-06-26 00:00:00', null, null, null, null, null, '咨询实用专利。报价2500');
INSERT INTO `comp_customer` VALUES ('274', '陈果', '有意向', '2017-06-22 00:00:00', '冷峰', null, '13911129225', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '版权', '2017-07-04 00:00:00', null, null, null, null, null, '陶瓷版权登记，有系列的作品');
INSERT INTO `comp_customer` VALUES ('275', '博士科环保科技有限公司', '有意向', '2017-06-22 00:00:00', '冷峰', null, '010-59636865-815', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('276', '张小姐', '有意向', '2017-06-22 00:00:00', '冷峰', null, '68901494-8001', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '咨询专利  生物，已发表论文');
INSERT INTO `comp_customer` VALUES ('277', '北京爱格致教育科技有限公司', '有意向', '2017-06-22 00:00:00', '周艺', null, '18010029895', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '商标', '2017-06-27 00:00:00', null, null, null, null, null, '问了商标好处和价格  类型');
INSERT INTO `comp_customer` VALUES ('278', '咨询专利', '刚接触', '2017-06-22 00:00:00', '冷峰', null, '15010910518', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周艺', '1', '专利', '2017-06-27 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('279', '李金建', '有意向', '2017-06-22 00:00:00', '冷峰', null, '17701091661', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '咨询专利     下午五点后再打');
INSERT INTO `comp_customer` VALUES ('280', '一路展（北京）信息科技有限公司', '已成单', '2017-06-22 00:00:00', '冷峰', null, '01057730946', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '高新', '2017-06-29 00:00:00', null, null, null, null, null, '互联网行业 咨询高新 ');
INSERT INTO `comp_customer` VALUES ('281', '北京华油信通科技有限公司-----杨经理', '有意向', '2017-06-22 00:00:00', '冷峰', null, '15801251983', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '专利', '2017-06-29 00:00:00', null, null, null, null, null, '专利申请');
INSERT INTO `comp_customer` VALUES ('282', 'DMS国际梦肌肉学院-王宣', '刚接触', '2017-06-21 00:00:00', '赵新杨', null, '13910126556', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-21 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('283', '京师博仁-孙经理', '刚接触', '2017-06-21 00:00:00', '赵新杨', null, '1370118977', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-26 00:00:00', null, null, null, null, null, '高新认定');
INSERT INTO `comp_customer` VALUES ('284', 'W-邱经理-航空航天', '有意向', '2017-06-21 00:00:00', '赵新杨', null, '13581656215', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '杨美燕', '1', '高新', '2017-06-22 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('285', '北京知行乐学教育科技有限公司', '有意向', '2017-06-21 00:00:00', '周艺', null, ' 18511669255', null, null, '北京', '石景山区', '电话销售', ' 北京市石景山区实兴大街30号院3号楼2层A-1465房间', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:13:08', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('286', '斯邦乐(北京)汽车技术服务有限公司刘经理', '有意向', '2017-06-21 00:00:00', '赵新杨', null, '18742148717', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '专利', '2017-06-26 00:00:00', null, null, null, null, null, '著作权及实用新型转让 从子公司转到母公司');
INSERT INTO `comp_customer` VALUES ('287', '马经理', '已成单', '2017-06-21 00:00:00', '赵新杨', null, '微信  18645906769', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '张文强', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('288', '林宝库', '刚接触', '2017-06-21 00:00:00', '赵新杨', null, '15846953181', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '冷峰', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '专利申请');
INSERT INTO `comp_customer` VALUES ('289', 'W-北京远浪潮生态建设有限公司', '已成单', '2017-06-20 00:00:00', '杨美燕', null, '18611428097', null, null, '北京', '东城区', '客户介绍', '注册地址东城，办公地址：北京市朝阳区水岸中街19号院19号楼', null, null, null, '资源与环境', null, '杨美燕', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, '高新卷号：IC2017132  ');
INSERT INTO `comp_customer` VALUES ('290', '赵经理-黎莎跟进', '刚接触', '2017-06-20 00:00:00', '陈晨', null, '18672377045', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '商标', '2017-06-20 00:00:00', null, null, null, null, null, '商标注册');
INSERT INTO `comp_customer` VALUES ('291', '张先生-专利购买', '待处理', '2017-06-20 00:00:00', '张秀辉', null, '15631704110', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '赵新杨', '1', '专利', '2017-07-05 00:00:00', null, null, null, null, null, '专利购买');
INSERT INTO `comp_customer` VALUES ('292', '6.29夏先生', '有意向', '2017-06-20 00:00:00', '张秀辉', null, '057128234082 18210339003', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '专利', '2017-06-29 00:00:00', null, null, null, null, null, '咨询专利 商标 ');
INSERT INTO `comp_customer` VALUES ('293', '北京泰格华诚科技有限公司', '已成单', '2017-06-20 00:00:00', '王焱', null, '13910728551', null, null, '北京', '昌平区', '网络推广', '北京市昌平区发展路8号8号楼1层115', null, null, null, null, null, '王焱', '1', '高新', '2017-06-20 00:00:00', null, null, null, null, null, '高新辅导');
INSERT INTO `comp_customer` VALUES ('294', '6.23李女士', '有意向', '2017-06-20 00:00:00', '张秀辉', null, '13681358250', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '专利', '2017-07-10 17:21:36', '1', null, null, null, null, '专利申请');
INSERT INTO `comp_customer` VALUES ('295', '6.21刘经理', '有意向', '2017-06-20 00:00:00', '张秀辉', null, '微信  lyhqwer12345', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '专利', '2017-07-10 17:21:36', '1', null, null, null, null, '实用新型 ');
INSERT INTO `comp_customer` VALUES ('296', '7.6北京明杰伟业机械制造有限公司', '有意向', '2017-06-20 00:00:00', '张秀辉', null, '13522191520   张女士     ', null, null, '北京', '东城区', '网络推广', '北京市丰台区赵辛店83号 03年成立，办公地址房山弘扬建设饭庄东30米', null, '金属零件机械加工；销售机械设备、电器设备、五金交电、化工产品（不含一类易制毒化学品及化学品）、金属材料、建筑材料、装饰材料、百货、工艺美术品、仪器仪表、塑料制品、汽车配件；技术服务。', null, null, null, '郭梦秋', '1', '高新', '2017-07-10 17:21:37', '1', null, null, null, null, '18518758275 ');
INSERT INTO `comp_customer` VALUES ('297', '北京金凤凰药业科技有限公司', '刚接触', '2017-06-19 00:00:00', '周艺', null, ' 62450038', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '商标', '2017-06-30 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('298', '刘光起', '已成单', '2017-06-19 00:00:00', '冷峰', null, '18611010669', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '发明专利6000+560 加他微信，给他发一下我们的地址约个时间， 他来我们公司面谈');
INSERT INTO `comp_customer` VALUES ('299', '唐山博全实业有限公司', '已成单', '2017-06-19 00:00:00', '王焱', null, '15613888906', null, null, '河北', '唐山', '网络推广', '曹妃甸中小企业园区', null, null, null, null, null, '王焱', '1', '专利', '2017-07-10 15:13:09', null, null, null, null, null, '购买专利');
INSERT INTO `comp_customer` VALUES ('300', '刘敏-黎莎跟进', '刚接触', '2017-06-19 00:00:00', '陈晨', null, '15201689927', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '商标', '2017-07-10 15:13:09', null, null, null, null, null, '微信同号   合作  商标执照办理的');
INSERT INTO `comp_customer` VALUES ('301', '北京晟宏扬科技发展有限公司', '已成单', '2017-06-19 00:00:00', '周新翠', null, ' 13911529820 ', null, null, '北京', '东城区', '客户介绍', '北京市怀柔区宏怀热力附属办公楼 ', null, null, null, null, null, '郭梦秋', '1', '其他', '2017-08-02 14:04:11', '1', '1', '0', null, null, null);
INSERT INTO `comp_customer` VALUES ('302', '北京新创宇仪器厂', '已成单', '2017-06-19 00:00:00', '王京京', null, '15810997769', null, null, '北京', '海淀区', '网络推广', '北京市海淀区丰慧中路7号新材料大厦A座303室', null, null, null, '机械', null, '王京京', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('303', '王勋', '刚接触', '2017-06-19 00:00:00', '冷峰', null, '15531256985', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '专利', '2017-07-10 17:21:37', '1', null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('304', '周小姐网讯科技', '有意向', '2017-06-19 00:00:00', '冷峰', null, '13911881618', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('305', '周女士', '刚接触', '2017-06-16 00:00:00', '赵新杨', null, '010-5920-1669', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-07-04 00:00:00', null, null, null, null, null, '实用新型    ');
INSERT INTO `comp_customer` VALUES ('306', '北京泡泡玛特贸易有限公司', '已成单', '2017-06-16 00:00:00', '宋佳佳', null, '57076013-6006', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '版权', '2017-06-16 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('307', '北京美智达教育咨询有限公司', '有意向', '2017-06-16 00:00:00', '周艺', null, '13601242031', null, null, '北京', '通州区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '版权', '2017-06-26 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('308', '北京家美美信息技术有限公司', '已成单', '2017-06-16 00:00:00', '张文强', null, '15010127567', null, null, '北京', '朝阳区 ', '客户介绍', '望京', null, null, null, null, null, '张文强', '1', '商标', '2017-06-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('309', '量子伟业胡小姐', '有意向', '2017-06-16 00:00:00', '赵新杨', null, '62679735', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '商标', '2017-06-26 00:00:00', null, null, null, null, null, '咨询商标  ');
INSERT INTO `comp_customer` VALUES ('310', 'W-吉先生-村高新-', '有意向', '2017-06-16 00:00:00', '赵新杨', null, '01084565986   18301695582', null, null, '北京', '东城区', '网络推广', '北京', null, '吴总，13801158005', null, null, null, '杨美燕', '1', '高新', '2017-06-23 00:00:00', null, null, null, null, null, '村高新');
INSERT INTO `comp_customer` VALUES ('311', ' 王先生  新技术新产品认定', '有意向', '2017-06-16 00:00:00', '赵新杨', null, '15011002996 ', null, null, '北京', '东城区', '网络推广', '发给', null, null, null, null, null, '宋佳佳', '1', '其他', '2017-06-16 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('312', '宫先生，火星时代', '有意向', '2017-06-16 00:00:00', '赵新杨', null, '18516919155', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-16 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('313', 'W-张小姐-2014成立', '被其他成单', '2017-06-16 00:00:00', '赵新杨', null, '18612523298', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '杨美燕', '1', '高新', '2017-06-21 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('314', '王博', '已成单', '2017-06-16 00:00:00', '谷占鹏', null, '18616623797', null, null, '北京', '海淀区', '网络推广', '个人', null, null, null, '设备', null, '谷占鹏', '1', '专利', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('315', '北京博奥联创科技孵化器有限公司', '有意向', '2017-06-15 00:00:00', '董自强', null, '69702734', null, null, '北京', '昌平区', '电话销售', '北京市昌平区科技园区超前路5号', null, null, null, '孵化器', null, '董自强', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('316', '7.3景经理+北京光之印信息技术有限公司', '有意向', '2017-06-15 00:00:00', '张秀辉', null, '18901158582', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '刘艳秋', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('317', ' 6.27赵女士', '被其他成单', '2017-06-15 00:00:00', '张秀辉', null, '18589000782', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '版权', '2017-07-03 00:00:00', null, null, null, null, null, '电影版权');
INSERT INTO `comp_customer` VALUES ('318', '2017.7.8北京金房暖通节能技术股份有限公司', '有意向', '2017-06-15 00:00:00', '张秀辉', null, '15810551393', null, null, '北京', '东城区', '网络推广', '北京', null, '北京市朝阳区华威北里18号楼6层\r\n孙学孟，15810551393\r\n', null, null, null, '周新翠', '1', '专利', '2017-07-04 00:00:00', null, null, null, null, null, '咨询专利变更  ');
INSERT INTO `comp_customer` VALUES ('319', '刘经理-黎莎跟进', '刚接触', '2017-06-14 00:00:00', '陈晨', null, '18610810100', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '专利', '2017-07-10 15:13:11', null, null, null, null, null, '咨询专利   合作的');
INSERT INTO `comp_customer` VALUES ('320', '中城新能源物流', '已成单', '2017-06-14 00:00:00', '冷峰', null, '01057378863', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('321', '庄经理-黎莎跟进', '刚接触', '2017-06-14 00:00:00', '陈晨', null, '13008983775', null, null, '浙江', '杭州', '网络推广', '宁波', null, null, null, null, null, '陈晨', '1', '其他', '2017-07-10 15:13:11', null, null, null, null, null, '实用新型专利 合作价');
INSERT INTO `comp_customer` VALUES ('322', '杨先生', '刚接触', '2017-06-14 00:00:00', '冷峰', null, '18618213480', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '张秀辉', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, '咨询专利 高新');
INSERT INTO `comp_customer` VALUES ('323', '汪姐', '有意向', '2017-06-14 00:00:00', '冷峰', null, '01082868684', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周艺', '1', '商标', '2017-06-27 00:00:00', null, null, null, null, null, '咨询商标  品牌--商标--融资--无形资产评估--注册资金--增资   ');
INSERT INTO `comp_customer` VALUES ('324', 'W-白先生-能源', '有意向', '2017-06-13 00:00:00', '赵新杨', null, '13911570622', null, null, '北京', '东城区', '网络推广', '北京亦庄', null, null, null, null, null, '杨美燕', '1', '专利', '2017-07-04 00:00:00', null, null, null, null, null, '咨询专利  ');
INSERT INTO `comp_customer` VALUES ('325', '刘经理', '刚接触', '2017-06-13 00:00:00', '赵新杨', null, 'QQ;2558502893', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '其他', '2017-06-13 00:00:00', null, null, null, null, null, '软著登记测试报告');
INSERT INTO `comp_customer` VALUES ('326', '赵经理', '待处理', '2017-06-13 00:00:00', '赵新杨', null, '13311392825', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('327', '中国华录集团有限公司', '有意向', '2017-06-13 00:00:00', '赵新杨', null, '15210677485管经理', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '其他', '2017-06-16 00:00:00', null, null, null, null, null, '专利风险评估');
INSERT INTO `comp_customer` VALUES ('328', '山东壹树生物科技有限公司', '待处理', '2017-06-13 00:00:00', '赵新杨', null, '13173350908', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, '咨询高新企业认定  ');
INSERT INTO `comp_customer` VALUES ('329', '张经理，中金云', '有意向', '2017-06-13 00:00:00', '赵新杨', null, '80865000-6013', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-16 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('330', '7.5袁小姐', '刚接触', '2017-06-13 00:00:00', '张秀辉', null, '18210198575', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '刘艳秋', '1', '其他', '2017-07-03 00:00:00', null, null, null, null, null, '咨询专利价值评估  ');
INSERT INTO `comp_customer` VALUES ('331', '6.28刘小姐', '被其他成单', '2017-06-13 00:00:00', '张秀辉', null, '57184159', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '赵新杨', '1', '高新', '2017-07-04 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('332', '咨询商标', '被其他成单', '2017-06-13 00:00:00', '张秀辉', null, '15101664789', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王焱', '1', '商标', '2017-06-26 00:00:00', null, null, null, null, null, '咨询商标');
INSERT INTO `comp_customer` VALUES ('333', '2017.7.10北京左岸卡漫网络科技有限公司', '接近成单', '2017-06-13 00:00:00', '张秀辉', null, '13811628621', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '周新翠', '1', '高新', '2017-07-07 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('334', '北京乐柏教育咨询有限公司', '刚接触', '2017-06-12 00:00:00', '周艺', null, ' 64279166', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('335', '北京东大正保科技有限公司', '刚接触', '2017-06-12 00:00:00', '周艺', null, '82319999', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('336', '北京新澳国际教育科技有限公司', '刚接触', '2017-06-12 00:00:00', '周艺', null, '88466249', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('337', '北京迈瑞科教育科技有限公司', '有意向', '2017-06-12 00:00:00', '周艺', null, '85181721', null, null, '北京', '东城区', '电话销售', '北京市朝阳区建国路甲92号-4至24层内18层1806、1807室', null, null, null, null, null, '周艺', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '3个软著  还有13个正在申请  想了解高新');
INSERT INTO `comp_customer` VALUES ('338', '北京理本教育科技有限责任公司', '有意向', '2017-06-12 00:00:00', '周艺', null, ' 13911680746', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '商标', '2017-06-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('339', '北京远大成长文化发展有限公司', '刚接触', '2017-06-12 00:00:00', '周艺', null, '13011191828', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:13:13', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('340', '北京成功轨迹教育科技有限公司', '刚接触', '2017-06-12 00:00:00', '周艺', null, ' 13260400950', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:13:13', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('341', '北京世通美嘉教育咨询有限公司', '刚接触', '2017-06-12 00:00:00', '周艺', null, '65206717', null, null, '北京', '东城区', '电话销售', '无', null, null, null, null, null, '周艺', '1', '高新', '2017-07-10 15:13:13', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('342', '北京指趣盈通科技有限公司', '已成单', '2017-06-12 00:00:00', '曹倩倩', null, '15711050185', null, null, '北京', '海淀区', '客户介绍', '海淀', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-06-20 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('343', '北京荣蒂盛环境科技有限公司', '已成单', '2017-06-12 00:00:00', '宋佳佳', null, '张先生13910256528', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '商标', '2017-06-12 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('344', '张先生', '有意向', '2017-06-09 00:00:00', '冷峰', null, '13661296069', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-07-06 00:00:00', null, null, null, null, null, '咨询发明专利');
INSERT INTO `comp_customer` VALUES ('345', '咨询软件专利-黎莎跟进', '刚接触', '2017-06-09 00:00:00', '陈晨', null, 'qq：1277851462', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '专利', '2017-06-09 00:00:00', null, null, null, null, null, '咨询软件专利 ');
INSERT INTO `comp_customer` VALUES ('346', '成功起航教育咨询有限公司-余女士', '有意向', '2017-06-09 00:00:00', '冷峰', null, '13366108111', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '高新', '2017-06-30 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('347', '许经理', '刚接触', '2017-06-08 00:00:00', '赵新杨', null, '13910875877', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-06-23 00:00:00', null, null, null, null, null, '外观专利  ');
INSERT INTO `comp_customer` VALUES ('348', '北京志翔蓝天评价装置技术开发有限公司', '已成单', '2017-06-08 00:00:00', '冷峰', null, '13911044349', null, null, '北京', '昌平区', '客户介绍', '绿创科技园老楼203室 ', null, null, null, '生物医药', null, '谷占鹏', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('349', 'W-姜经理-阳光易购（北京）有限公司', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '18611720573', null, null, '北京', '东城区', '网络推广', '北京海淀注册', null, null, null, null, null, '杨美燕', '1', '高新', '2017-07-04 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('350', '房萌', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '13911614164', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('351', 'Z-岳经理', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '13811252615', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '杨美燕', '1', '专利', '2017-06-19 00:00:00', null, null, null, null, null, '申请专利');
INSERT INTO `comp_customer` VALUES ('352', '蔡经理', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '13075513385', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '专利', '2017-06-12 00:00:00', null, null, null, null, null, '专利查询 购买专利');
INSERT INTO `comp_customer` VALUES ('353', 'W-岳经理-江苏谷德', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '17507136415', null, null, '江苏', null, '网络推广', '江苏南京  弱电智能化维护   软著有3件，专利建议买', null, null, null, null, null, '杨美燕', '1', '高新', '2017-06-13 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('354', '徐经理', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '18612614613', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '专利', '2017-06-26 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('355', 'W-钱小姐', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '58933964', null, null, '北京', '东城区', '网络推广', '北京', null, '新能源咨询', null, null, null, '杨美燕', '1', '高新', '2017-06-12 00:00:00', null, null, null, null, null, '咨询高新  ');
INSERT INTO `comp_customer` VALUES ('356', '咨询高新-黎莎跟进', '刚接触', '2017-06-08 00:00:00', '陈晨', null, '15608639138', null, null, '湖北', '武汉 ', '网络推广', '武汉', null, null, null, null, null, '陈晨', '1', '高新', '2017-06-09 00:00:00', null, null, null, null, null, '客户洪山区 环保  发客户电话 公司地址 客户最近来公司');
INSERT INTO `comp_customer` VALUES ('357', '周女士-黎莎跟进', '刚接触', '2017-06-08 00:00:00', '陈晨', null, '13377861660', null, null, '湖北', '武汉 ', '网络推广', '武汉', null, null, null, null, null, '陈晨', '1', '专利', '2017-07-10 15:13:15', null, null, null, null, null, '发明专利  ');
INSERT INTO `comp_customer` VALUES ('358', 'W-王艳玲-北京安东恒知识产权代理有限公司', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '13621355868', null, null, '北京', '东城区', '网络推广', '北京昌平，目前不做知识产权代理，做软件开发，没有已经授权的专利，加微信', null, null, null, null, null, '杨美燕', '1', '高新', '2017-06-15 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('359', 'W-李女士-海淀-世纪爱心-2015注册', '有意向', '2017-06-08 00:00:00', '赵新杨', null, '18600571997  58933964', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '杨美燕', '1', '高新', '2017-06-16 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('360', '唐姐', '有意向', '2017-06-08 00:00:00', '尹曼', null, '13581635912', null, null, '北京', '海淀区', '电话销售', '苏州街神州数码大厦7层', null, null, null, null, null, '尹曼', '1', '高新', '2017-07-06 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('361', '北京桑德集团', '接近成单', '2017-06-07 00:00:00', '周新翠', null, '01060591045', null, null, '北京', '东城区', '客户介绍', '湖南意谱电动系统有限公司', null, null, null, null, null, '周新翠', '1', '专利', '2017-07-05 00:00:00', null, null, null, null, null, '他说他们主管给的，他们主管也是从别人给的，不知道是谁，没问出来，之前无合作。');
INSERT INTO `comp_customer` VALUES ('362', '北京骑士无忧科技有限公司', '已成单', '2017-06-07 00:00:00', '冷峰', null, '18911887288', null, null, '北京', '昌平区', '客户介绍', '十三陵景区地铁站--绿创园企业', null, null, null, null, null, '冷峰', '1', '高新', '2017-06-27 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('363', '刘猛', '已成单', '2017-06-07 00:00:00', '张秀辉', null, '18600080538', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '专利转让');
INSERT INTO `comp_customer` VALUES ('364', '2017.6.29北京雅林士博建筑工程有限公司', '被其他成单', '2017-06-07 00:00:00', '张秀辉', null, '01059123759', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '赵新杨', '1', '高新', '2017-06-29 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('365', '6.20王女士', '待处理', '2017-06-07 00:00:00', '张秀辉', null, '微信号  1105133554', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '版权', '2017-06-16 00:00:00', null, null, null, null, null, '软件著作权登记');
INSERT INTO `comp_customer` VALUES ('366', '新美智佳', '已成单', '2017-06-07 00:00:00', '张秀辉', null, '18911750025    010-64125943', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '商标', '2017-06-29 00:00:00', null, null, null, null, null, '商标转让');
INSERT INTO `comp_customer` VALUES ('367', '7.3北京贵人礼网络科技有限公司', '有意向', '2017-06-07 00:00:00', '张秀辉', null, '18682905768', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '刘艳秋', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('368', '6.7李女士', '刚接触', '2017-06-07 00:00:00', '张秀辉', null, '01065910257', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王焱', '1', '专利', '2017-06-26 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('369', '软著加急咨询', '被其他成单', '2017-06-07 00:00:00', '张秀辉', null, '010-82608499', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '版权', '2017-06-13 00:00:00', null, null, null, null, null, '软著加急咨询');
INSERT INTO `comp_customer` VALUES ('370', '6.28北京数缘科技有限公司', '有意向', '2017-06-07 00:00:00', '张秀辉', null, '15253166443  李先生', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '赵新杨', '1', '高新', '2017-06-29 00:00:00', null, null, null, null, null, '咨询双软费用');
INSERT INTO `comp_customer` VALUES ('371', '2017.6.9刘女士', '待处理', '2017-06-07 00:00:00', '张秀辉', null, '18201125976', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '高新', '2017-06-13 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('372', '7.12北京易铺平机房设备有限公司', '刚接触', '2017-06-07 00:00:00', '张秀辉', null, '010-60216209   彭女士 ', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭梦秋', '1', '高新', '2017-06-29 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('373', '罗经理-黎莎跟进', '刚接触', '2017-06-07 00:00:00', '陈晨', null, '13554035133', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '高新', '2017-07-10 15:13:16', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('374', '路经理', '被其他成单', '2017-06-07 00:00:00', '冷峰', null, '18611307831', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '史一', '1', '商标', '2017-06-22 00:00:00', null, null, null, null, null, '咨询商标');
INSERT INTO `comp_customer` VALUES ('375', '6.23实用专利', '待处理', '2017-06-07 00:00:00', '冷峰', null, '18301228459', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王子铮', '1', '专利', '2017-06-22 00:00:00', null, null, null, null, null, '实用专利  报价 2500');
INSERT INTO `comp_customer` VALUES ('376', '北京亦盛精密半导体有限公司', '有意向', '2017-06-07 00:00:00', '冷峰', null, '67867685', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '曹倩倩', '1', '专利', '2017-07-03 00:00:00', null, null, null, null, null, '13767109445加微信，约具体时间面谈。做专利规划布局');
INSERT INTO `comp_customer` VALUES ('377', '雷先生', '有意向', '2017-06-07 00:00:00', '冷峰', null, '15510140373', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '专利', '2017-07-04 00:00:00', null, null, null, null, null, '商业模式专利申请');
INSERT INTO `comp_customer` VALUES ('378', '三易智慧道路运输有限公司', '有意向', '2017-06-07 00:00:00', '冷峰', null, '15810655785', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '郭彦敏', '1', '高新', '2017-07-03 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('379', '北京艾蓝文化传播有限公司--尚经理', '有意向', '2017-06-07 00:00:00', '冷峰', null, '13801015378', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '尹曼', '1', '高新', '2017-06-23 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('380', '北京雅迪传媒有限公司', '有意向', '2017-06-05 00:00:00', '赵新杨', null, '010-65018008 转347李经理', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '高新', '2017-06-26 00:00:00', null, null, null, null, null, '咨询高新');
INSERT INTO `comp_customer` VALUES ('381', '侯经理', '刚接触', '2017-06-05 00:00:00', '赵新杨', null, '01068418391', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-06-22 00:00:00', null, null, null, null, null, '专利费减办理');
INSERT INTO `comp_customer` VALUES ('382', '中央民族大学', '已成单', '2017-06-05 00:00:00', '郭彦敏', null, '13811323647', null, null, '北京', '海淀区', '客户介绍', '中关村大街', null, null, null, null, null, '郭彦敏', '1', '商标', '2017-07-07 00:00:00', null, null, null, null, null, null);
INSERT INTO `comp_customer` VALUES ('383', '李先生', '有意向', '2017-06-05 00:00:00', '赵新杨', null, '01082609473', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '王京京', '1', '专利', '2017-06-13 00:00:00', null, null, null, null, null, '发明专利');
INSERT INTO `comp_customer` VALUES ('384', '马先生', '刚接触', '2017-06-05 00:00:00', '赵新杨', null, '18600788151', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '专利', '2017-06-22 00:00:00', null, null, null, null, null, '咨询专利');
INSERT INTO `comp_customer` VALUES ('385', '熊占萍-黎莎跟进', '刚接触', '2017-06-05 00:00:00', '陈晨', null, '15711275625', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '其他', '2017-07-10 15:13:17', null, null, null, null, null, '寻求合作');
INSERT INTO `comp_customer` VALUES ('386', '张经理-黎莎跟进', '刚接触', '2017-06-05 00:00:00', '陈晨', null, 'QQ：1131288387', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '陈晨', '1', '其他', '2017-07-10 15:13:17', null, null, null, null, null, '寻求合作');
INSERT INTO `comp_customer` VALUES ('387', '昆吾九鼎投资管理有限公司', '刚接触', '2017-06-05 00:00:00', '赵新杨', null, '15010428605季先生', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '商标', '2017-06-23 00:00:00', null, null, null, null, null, '咨询商标');
INSERT INTO `comp_customer` VALUES ('388', '张恒', '有意向', '2017-06-05 00:00:00', '赵新杨', null, '13269307367', null, null, '北京', '东城区', '网络推广', '北京', null, null, null, null, null, '宋佳佳', '1', '专利', '2017-06-19 00:00:00', null, null, null, null, null, '专利申请 ');
INSERT INTO `comp_customer` VALUES ('389', '北京银信天下网信息科技服务有限公司', '刚接触', '2017-06-05 00:00:00', '赵新杨', null, '15801357611', null, null, '北京', '朝阳区 ', '网络推广', '北京', null, null, null, null, null, '谷占鹏', '1', '高新', '2017-07-05 00:00:00', null, null, null, null, null, '咨询高新');

-- ----------------------------
-- Table structure for comp_customer_level
-- ----------------------------
DROP TABLE IF EXISTS `comp_customer_level`;
CREATE TABLE `comp_customer_level` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `order_num` int(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `order_status` int(5) DEFAULT NULL COMMENT '是否成过单：0过单前，1成单后',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='客户级别';

-- ----------------------------
-- Records of comp_customer_level
-- ----------------------------
INSERT INTO `comp_customer_level` VALUES ('1', 'L1客服分析及策略', '一般为电话一通初步互相了解，需求领域的初步确定', '1', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('2', 'L2建立信赖', '客户没有直接拒绝，愿意进一步联系沟通', '2', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('3', 'L3确认需求', '需求正式确认，需要进一步挖掘', '3', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('4', 'L4塑造价值，推荐产品', '根据客户的需求完善方案，推荐适合客户的产品并初步达成意向', '4', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('5', 'L5解除异议', '针对客户提出的异议，进行相关引导或者协商，消除客户的疑问和顾虑', '5', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('6', 'L6领取承诺', '达成最终合作意向，签订合同', '6', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('7', 'L7成交，交款', '客户打款成交', '7', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('8', 'B1没成单', '被其他公司成单', '8', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('9', 'B2没成单', '被其他公司成单，后期可以继续联系', '9', '启用', '0');
INSERT INTO `comp_customer_level` VALUES ('10', '★', '第一次成单', null, '启用', '1');
INSERT INTO `comp_customer_level` VALUES ('11', '★★', '二次成单', '11', '启用', '1');
INSERT INTO `comp_customer_level` VALUES ('12', '★★★', '描述信息', '12', '启用', '1');
INSERT INTO `comp_customer_level` VALUES ('13', '★★★★', '描述', '13', '启用', '1');
INSERT INTO `comp_customer_level` VALUES ('14', '★★★★★', '描述', '14', '启用', '1');

-- ----------------------------
-- Table structure for comp_customer_linkman
-- ----------------------------
DROP TABLE IF EXISTS `comp_customer_linkman`;
CREATE TABLE `comp_customer_linkman` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `job` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `sex` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `tel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `mail` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `weixin` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comp_customer_linkman
-- ----------------------------
INSERT INTO `comp_customer_linkman` VALUES ('1', '李逍遥2', '经理2', '女', '13333333334', '1111@qq.com', '1111111', '1111111', '1111111', '1');
INSERT INTO `comp_customer_linkman` VALUES ('2', 'abc', 'aav', '男', '123123123213', '13213@sina.com', '12232323', 'we23', 'werw', '3');
INSERT INTO `comp_customer_linkman` VALUES ('3', '测试', null, '男', '1333333333', '111@163.com', '723683687', '', '', '149');

-- ----------------------------
-- Table structure for comp_customer_touch_record
-- ----------------------------
DROP TABLE IF EXISTS `comp_customer_touch_record`;
CREATE TABLE `comp_customer_touch_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL COMMENT '客户id',
  `work_id` int(10) DEFAULT NULL COMMENT '任务id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_name` varchar(50) DEFAULT NULL COMMENT '创建人帐号',
  `content` varchar(300) DEFAULT NULL COMMENT '内容',
  `guide` varchar(50) DEFAULT NULL COMMENT '指导人帐号',
  `guide_content` varchar(300) DEFAULT NULL COMMENT '指导内容',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='客户联系记录';

-- ----------------------------
-- Records of comp_customer_touch_record
-- ----------------------------
INSERT INTO `comp_customer_touch_record` VALUES ('1', '1', '111', '2017-06-12 13:50:27', 'admin', '约客户吃个饭', 'admin', '约吧,钱不给报销', '2017-06-12 13:54:24');
INSERT INTO `comp_customer_touch_record` VALUES ('2', '1', '111', '2017-06-12 13:52:19', 'admin', '多少给报点', 'admin', '不报', '2017-06-12 13:55:56');
INSERT INTO `comp_customer_touch_record` VALUES ('3', '1', '111', '2017-06-12 13:54:22', 'admin', '那不约了', null, null, null);
INSERT INTO `comp_customer_touch_record` VALUES ('4', '1', '111', '2017-06-30 10:23:53', 'admin', '4euh', null, null, null);
INSERT INTO `comp_customer_touch_record` VALUES ('5', '156', '120', '2017-08-02 09:56:57', 'admin', '早上联系了XXX', null, null, null);

-- ----------------------------
-- Table structure for comp_department
-- ----------------------------
DROP TABLE IF EXISTS `comp_department`;
CREATE TABLE `comp_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL COMMENT '上级部门',
  `parent_name` varchar(50) DEFAULT NULL COMMENT '上级部门名称',
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  `lead` varchar(20) NOT NULL COMMENT '部门领导',
  `area_id` int(11) DEFAULT NULL COMMENT '地区',
  `createdatetime` datetime NOT NULL COMMENT '创建时间',
  `updatedatetime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of comp_department
-- ----------------------------
INSERT INTO `comp_department` VALUES ('1', null, null, '北京总部', '万*', '1', '2017-02-04 16:12:41', '2017-05-21 07:58:04');
INSERT INTO `comp_department` VALUES ('2', null, null, '武汉分公司', '黎*', '2', '2017-02-04 16:12:41', '2017-05-21 07:58:57');
INSERT INTO `comp_department` VALUES ('9', '1', null, '北京顾问部', '万*', '1', '2017-02-22 10:01:37', '2017-05-21 07:16:26');
INSERT INTO `comp_department` VALUES ('10', '1', null, '总经办', 'a*', '1', '2017-02-22 10:02:01', '2017-05-21 08:01:32');
INSERT INTO `comp_department` VALUES ('11', '9', null, '北分1公司', '冷*', '1', '2017-02-22 10:02:21', '2017-05-21 07:16:55');
INSERT INTO `comp_department` VALUES ('12', '9', null, '北分2公司', '张*', '1', '2017-02-22 10:02:37', '2017-05-21 07:17:29');
INSERT INTO `comp_department` VALUES ('13', '9', null, '顾问三部', '赵*', '1', '2017-02-22 10:02:57', '2017-05-21 07:18:06');
INSERT INTO `comp_department` VALUES ('16', null, null, '九江岳阳分公司', '黄*', '16', '2017-04-10 15:07:00', '2017-05-21 07:59:32');
INSERT INTO `comp_department` VALUES ('18', null, null, '湖北分公司', '陈*', '18', '2017-04-12 15:07:00', '2017-05-21 07:59:48');
INSERT INTO `comp_department` VALUES ('19', '1', null, '北京客服部', '陈*', '1', '2017-04-12 15:07:11', '2017-05-21 07:22:05');
INSERT INTO `comp_department` VALUES ('21', '1', null, '北京流程部', '杨*', '1', '2017-04-17 09:46:28', '2017-05-21 07:21:34');
INSERT INTO `comp_department` VALUES ('23', '9', null, '顾问四部', '1*', '1', '2017-05-21 07:19:40', '2017-05-21 07:19:40');
INSERT INTO `comp_department` VALUES ('24', '9', null, '顾问五部', '1*', '1', '2017-05-21 07:20:07', '2017-05-21 07:20:07');
INSERT INTO `comp_department` VALUES ('25', '1', null, '综合管理部', '许*', '1', '2017-05-21 07:21:14', '2017-05-21 07:21:14');
INSERT INTO `comp_department` VALUES ('26', '2', null, '武汉代理部', '欧*', '2', '2017-05-21 07:22:37', '2017-05-21 07:22:37');
INSERT INTO `comp_department` VALUES ('27', '2', null, '武汉顾问部', '黎*', '2', '2017-05-21 07:22:53', '2017-05-21 07:22:53');
INSERT INTO `comp_department` VALUES ('28', '2', null, '综合管理部', '陈*', '2', '2017-05-21 07:23:13', '2017-05-21 07:23:13');
INSERT INTO `comp_department` VALUES ('29', '16', null, '综合管理部', '陈*', '16', '2017-05-21 07:23:40', '2017-05-21 07:23:40');
INSERT INTO `comp_department` VALUES ('30', '16', null, '顾问部', '黄*', '16', '2017-05-21 07:23:59', '2017-05-21 07:23:59');
INSERT INTO `comp_department` VALUES ('31', '18', null, '湖北客服部', '陈*', '18', '2017-05-21 07:24:33', '2017-05-21 07:24:33');
INSERT INTO `comp_department` VALUES ('32', '18', null, '湖北流程部', '邵*', '18', '2017-05-21 07:24:46', '2017-05-21 07:24:46');
INSERT INTO `comp_department` VALUES ('33', '18', null, '网络推广部', '林*', '18', '2017-05-21 07:25:07', '2017-05-21 07:25:07');
INSERT INTO `comp_department` VALUES ('34', '2', null, '渠道部', '黎*', '2', '2017-05-21 07:25:27', '2017-05-21 07:25:27');
INSERT INTO `comp_department` VALUES ('35', '32', null, '专商版组', '杨*', '18', '2017-05-21 07:26:14', '2017-05-21 07:26:14');
INSERT INTO `comp_department` VALUES ('36', '32', null, '项目组', '邵*', '18', '2017-05-21 07:26:38', '2017-05-21 07:26:38');
INSERT INTO `comp_department` VALUES ('37', '1', null, '北京代理部', '尹*', '1', '2017-05-21 07:31:17', '2017-05-21 07:31:17');
INSERT INTO `comp_department` VALUES ('39', '25', null, '财务部', '丁*', '1', '2017-05-21 08:02:15', '2017-05-21 08:02:15');
INSERT INTO `comp_department` VALUES ('40', '25', null, '行政人事部', '1*', '1', '2017-05-21 08:02:39', '2017-05-21 08:02:39');
INSERT INTO `comp_department` VALUES ('41', '31', null, '分公司服务组', '陈*', '18', '2017-05-21 08:08:38', '2017-05-21 08:08:38');
INSERT INTO `comp_department` VALUES ('42', '31', null, '本部服务组', '李*', '18', '2017-05-21 08:09:02', '2017-05-21 08:09:02');

-- ----------------------------
-- Table structure for comp_financial_info
-- ----------------------------
DROP TABLE IF EXISTS `comp_financial_info`;
CREATE TABLE `comp_financial_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '财务编号',
  `contract_code` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `customer_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `done_login_name` varchar(50) DEFAULT NULL COMMENT '成单人账号',
  `pay_amount` int(10) DEFAULT NULL COMMENT '付款金额',
  `ok_pay_amount` int(10) DEFAULT NULL COMMENT '实付款金额',
  `bank` varchar(50) DEFAULT NULL COMMENT '银行',
  `server_type` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `agency_fee` double DEFAULT NULL COMMENT '服务费',
  `notarization_fee` double DEFAULT NULL COMMENT '官费',
  `audit_fee` double DEFAULT NULL COMMENT '审计费',
  `audit_cost` double DEFAULT NULL COMMENT '审计成本费',
  `contribution` double DEFAULT NULL COMMENT '贡献额',
  `cost_amount` double DEFAULT NULL COMMENT '成本额',
  `percentage_rate` double DEFAULT NULL COMMENT '提成率',
  `percentage` double DEFAULT NULL COMMENT '提成',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `input_user` varchar(50) DEFAULT NULL COMMENT '录入人',
  `created_datetime` datetime DEFAULT NULL,
  `edit_user` varchar(50) DEFAULT NULL COMMENT '金额确认人（财务）',
  `updated_datetime` datetime DEFAULT NULL,
  `pay_time` varchar(50) DEFAULT NULL COMMENT '付款时间',
  `ok_pay_time` varchar(50) DEFAULT NULL COMMENT '实付款时间',
  `pay_status` varchar(50) DEFAULT NULL COMMENT '付款状态（未付款，已付款，已提交文案）',
  `confirm_user` varchar(50) DEFAULT NULL COMMENT '文案提交人',
  `status` varchar(50) DEFAULT '正常' COMMENT '状态（已废弃，正常）',
  `is_invoice` varchar(50) DEFAULT 'no' COMMENT '是否申请发票（yes,no）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='财务信息';

-- ----------------------------
-- Records of comp_financial_info
-- ----------------------------
INSERT INTO `comp_financial_info` VALUES ('1', '14972509112811', '170001', '测试1', 'admin', '600', null, '万总微信', '商标注册', '1', '600', '200', null, null, '200', null, '15', '30', '一次付清', 'admin', '2017-06-12 15:01:43', null, null, '2017-6-13', null, '未付款', null, '已废弃', 'no');
INSERT INTO `comp_financial_info` VALUES ('4', '14979426744231', '170002', '公司1', '王莹', '7000', '7000', '万总微信', '软件著作权', '2', '7000', '300', null, null, '700', null, '13', '91', 'aaa', 'admin', '2017-06-20 15:11:14', 'admin', '2017-06-23 14:18:45', '2017-06-23', '2017-06-22', '已付款', null, '流程已完成', 'no');
INSERT INTO `comp_financial_info` VALUES ('5', '14979426744232', '170002', '公司1', '王莹', '1000', '1000', '万总微信', '作品著作权', '2', '900', '200', null, null, '100', null, '13', '13', 'bbb', 'admin', '2017-06-20 15:11:14', 'admin', '2017-06-23 15:07:51', '2017-06-23', '2017-06-23', '已付款', null, '流程已完成', 'no');
INSERT INTO `comp_financial_info` VALUES ('6', '14982024812991', '170003', '公司1', '王莹', '3000', '3000', '万总微信', '商标注册', '2', '3000', '200', null, null, '2400', null, '10', '240', 'wer', '王莹', '2017-06-23 15:21:20', '张彦君', '2017-06-23 16:29:45', '明天', '2017-06-23', '已付款', null, '正常', 'no');
INSERT INTO `comp_financial_info` VALUES ('7', '14982024812992', '170003', '公司1', '王莹', '6800', '6800', '万总微信', '软件著作权', '2', '6800', '300', null, null, '500', null, '13', '65', 'sfd', '王莹', '2017-06-23 15:21:20', '张彦君', '2017-06-23 16:30:45', '明天', '2017-06-23', '已付款', null, '正常', 'no');
INSERT INTO `comp_financial_info` VALUES ('8', '14982024812993', '170003', '公司1', '王莹', '3600', '3600', '万总微信', '基金', '1', '3600', null, null, null, '600', '3000', '10', '60', 'dsf', '王莹', '2017-06-23 15:21:20', '张彦君', '2017-06-23 16:31:15', '明天', '2017-06-23', '已付款', null, '正常', 'no');
INSERT INTO `comp_financial_info` VALUES ('9', '14982024812994', '170003', '公司1', '王莹', '1000', '1000', '万总微信', '作品著作权', '2', '1000', '200', null, null, '200', null, '13', '26', 'dhffg', '王莹', '2017-06-23 15:21:20', '张彦君', '2017-06-23 16:31:37', '明天', '2017-06-23', '已付款', null, '正常', 'no');
INSERT INTO `comp_financial_info` VALUES ('12', '14988025324891', '170004', '测试1', '刘艳秋', '3000', null, '万总微信', '商标注册', '1', '3000', '200', null, null, '2600', null, '15', '390', 'ss', '刘艳秋', '2017-06-30 14:02:12', null, null, 'aaa', null, '未付款', null, '正常', 'no');
INSERT INTO `comp_financial_info` VALUES ('13', '14988025324892', '170004', '测试1', '刘艳秋', '5000', null, '万总微信', '基金', '3', '5000', null, null, null, '1000', '4000', '18', '180', 'dd', '刘艳秋', '2017-06-30 14:02:12', null, null, 'ddd', null, '未付款', null, '正常', 'no');
INSERT INTO `comp_financial_info` VALUES ('14', '14988036640811', '170005', '1111', '王莹', '7000', null, '万总微信', '软件著作权', '2', '7000', '200', null, null, '800', null, '13', '104', 'wewe', '王莹', '2017-06-30 14:21:03', null, null, 'we', null, '未付款', null, '流程已完成', 'no');
INSERT INTO `comp_financial_info` VALUES ('15', '14988036640812', '170005', '1111', '王莹', '1000', '1000', '万总微信', '作品著作权', '2', '1000', '200', null, null, '200', null, '13', '26', 'we', '王莹', '2017-06-30 14:21:03', '张彦君', '2017-06-30 14:33:46', 'we', '2017-06-30', '已付款', null, '流程已完成', 'no');
INSERT INTO `comp_financial_info` VALUES ('16', '14996732312591', '170006', '铸剑山庄', '许丽', '3000', null, '万总微信', '商标注册', '2', '3000', '200', null, null, '2400', null, '10', '240', '方式', '郭梦秋', '2017-07-10 15:53:50', null, null, '0710', null, '未付款', null, '正常', 'no');

-- ----------------------------
-- Table structure for comp_function
-- ----------------------------
DROP TABLE IF EXISTS `comp_function`;
CREATE TABLE `comp_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url` varchar(50) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `qtip` varchar(50) DEFAULT NULL,
  `exist` int(1) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_function
-- ----------------------------
INSERT INTO `comp_function` VALUES ('1', '系统设置', '', null, '0', '一级', '1', '1');
INSERT INTO `comp_function` VALUES ('2', '角色管理', '/role', null, '1', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('3', '业务类型', '/businessType', null, '1', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('4', '客户等级', '/customerLevel', null, '1', '二级', '1', '3');
INSERT INTO `comp_function` VALUES ('5', '公告管理', '/notice', null, '1', '二级', '1', '4');
INSERT INTO `comp_function` VALUES ('6', '规则管理', '/transferWorkRule', null, '1', '二级', '1', '5');
INSERT INTO `comp_function` VALUES ('7', '常量管理', '/parameter', null, '1', '二级', '1', '6');
INSERT INTO `comp_function` VALUES ('8', '套餐管理', '/combo', null, '1', '二级', '1', '7');
INSERT INTO `comp_function` VALUES ('9', '组织机构', '', null, '0', '一级', '1', '2');
INSERT INTO `comp_function` VALUES ('10', '部门管理', '/depart', null, '9', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('11', '职位管理', '/job', null, '9', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('12', '员工信息', '/user', null, '9', '二级', '1', '3');
INSERT INTO `comp_function` VALUES ('13', '个人提醒', '', null, '0', '一级', '1', '3');
INSERT INTO `comp_function` VALUES ('14', '个人提醒', '/remind', null, '13', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('15', '客户和任务管理', '', null, '0', '一级', '1', '4');
INSERT INTO `comp_function` VALUES ('16', '客户管理', '/customer', null, '15', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('17', '客户公海', '/publicCustomer', null, '15', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('18', '任务管理', '/work', null, '15', '二级', '1', '3');
INSERT INTO `comp_function` VALUES ('19', '跟踪记录', '/recordGuide', null, '15', '二级', '1', '4');
INSERT INTO `comp_function` VALUES ('20', '合同管理', '', null, '0', '一级', '1', '5');
INSERT INTO `comp_function` VALUES ('21', '合同信息', '/contract', null, '20', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('22', '合同信息(已废弃)', '/contract/useless', null, '20', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('23', '财务管理', '', null, '0', '一级', '1', '6');
INSERT INTO `comp_function` VALUES ('24', '发票管理', '/invoice', null, '23', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('25', '财务信息', '/finance/existContract', null, '23', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('26', '财务信息(无合同)', '/finance/noContract', null, '23', '二级', '1', '3');
INSERT INTO `comp_function` VALUES ('27', '退款信息', '/minus', null, '23', '二级', '1', '4');
INSERT INTO `comp_function` VALUES ('28', '积分管理', '', null, '0', '一级', '1', '7');
INSERT INTO `comp_function` VALUES ('29', '积分项', '/integralOption', null, '28', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('30', '积分信息', '/integralInfo', null, '28', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('31', '积分记录', '/integralRecord', null, '28', '二级', '1', '3');
INSERT INTO `comp_function` VALUES ('32', '统计管理', '', null, '0', '一级', '1', '8');
INSERT INTO `comp_function` VALUES ('33', '合同统计', '/statistics/contract', null, '32', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('34', '成单率统计', '/statistics/achievedRate', null, '32', '二级', '1', '2');
INSERT INTO `comp_function` VALUES ('35', '财务统计', '/statistics/finance', '', '32', '二级', '1', '3');
INSERT INTO `comp_function` VALUES ('36', '客户消费统计', '/statistics/customerConsume', null, '32', '二级', '1', '4');
INSERT INTO `comp_function` VALUES ('37', '个人提成统计', '/statistics/toSingle', null, '32', '二级', '1', '5');
INSERT INTO `comp_function` VALUES ('38', '业务类型提成比例', '/commission', null, '1', '二级', '1', '8');
INSERT INTO `comp_function` VALUES ('39', '业务类型成本', '/cost', null, '1', '二级', '1', '9');
INSERT INTO `comp_function` VALUES ('40', 'aa', '', null, '0', null, '0', null);
INSERT INTO `comp_function` VALUES ('41', 'aa', '', null, '0', null, '0', null);
INSERT INTO `comp_function` VALUES ('42', 'aa', '', null, '0', null, '0', null);
INSERT INTO `comp_function` VALUES ('43', '新建', '', null, '16', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('44', '修改', '', null, '16', '三级', '1', '2');
INSERT INTO `comp_function` VALUES ('45', '删除', '', '', '16', '三级', '1', '3');
INSERT INTO `comp_function` VALUES ('46', '添加联系人', '', null, '16', '三级', '1', '4');
INSERT INTO `comp_function` VALUES ('47', '查看联系人', '', null, '16', '三级', '1', '5');
INSERT INTO `comp_function` VALUES ('48', '还给公海', '', null, '16', '三级', '1', '6');
INSERT INTO `comp_function` VALUES ('49', '分配客户', '', null, '16', '三级', '1', '7');
INSERT INTO `comp_function` VALUES ('50', '分配任务', '', null, '16', '三级', '1', '8');
INSERT INTO `comp_function` VALUES ('51', '导出报表', '', null, '16', '三级', '1', '9');
INSERT INTO `comp_function` VALUES ('52', '修改', '', null, '18', '三级', '1', '10');
INSERT INTO `comp_function` VALUES ('53', '跟踪记录', '', null, '18', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('54', '提醒记录', '', null, '18', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('55', '添加保护期', '', null, '18', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('56', '重分任务', '', null, '18', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('57', '完成', '', null, '18', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('58', '生成合同', '', null, '18', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('59', '新建', '', null, '21', '三级', '1', null);
INSERT INTO `comp_function` VALUES ('60', '修改', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('61', '废弃', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('62', '申请发票', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('63', '结案', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('64', '导出', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('65', '申请发票', '', null, '24', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('66', '修改', '', null, '24', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('67', '删除', '', null, '24', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('68', '点我开票', '', null, '24', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('69', '新建', '', null, '25', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('70', '确认付款', '', null, '25', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('71', '提交流程', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('72', '申请退款', '', null, '25', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('73', '导出', '', null, '25', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('74', '新建', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('75', '修改', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('76', '删除', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('77', '确认付款', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('78', '审核', '', null, '21', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('79', '申请发票', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('80', '申请退款', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('81', '导出', '', null, '26', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('82', '修改', '', null, '27', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('83', '删除', '', null, '27', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('84', '申请', '', null, '31', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('85', '审批', '', null, '31', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('86', '删除', '', null, '31', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('87', '自动分配', '', null, '18', '三级', '1', '1');
INSERT INTO `comp_function` VALUES ('88', '业务类别', '/category', null, '1', '二级', '1', '10');
INSERT INTO `comp_function` VALUES ('89', '新客户统计', '/statistics/newCustom', null, '32', '二级', '1', '1');
INSERT INTO `comp_function` VALUES ('90', '积分统计', '/statistics/IntegralOrder', null, '32', '二级', '1', '7');


select fu.id,fu.name,fu.url
		from comp_role_function rf
		left join comp_function fu 
		on fu.id = rf.function_id
		where rf.role_id = 1
		and fu.parent_id = 15
		order by fu.order_num;
-- ----------------------------
-- Table structure for comp_integral_info
-- ----------------------------
DROP TABLE IF EXISTS `comp_integral_info`;
CREATE TABLE `comp_integral_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL COMMENT '员工账号',
  `user_name` varchar(50) NOT NULL COMMENT '员工',
  `integral_count` int(10) NOT NULL COMMENT '总积分',
  `integral_quarter` int(10) NOT NULL COMMENT '季度积分',
  `quarter_code` varchar(50) NOT NULL COMMENT '季度标识(如2016_1)',
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='积分信息';




-- ----------------------------
-- Records of comp_integral_info
-- ----------------------------
INSERT INTO `comp_integral_info` VALUES ('3', 'admin', '管理员', '200', '0', '2017_1', '2017-02-21 14:59:00', '2017-02-21 14:59:00');
INSERT INTO `comp_integral_info` VALUES ('106', 'zhangwuji', '张无忌', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('107', 'zhangsanfen', '张三丰', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('108', 'zhangcuishan', '张翠山', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('109', 'songyuanqiao', '宋远桥', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('110', 'fdksadfasdf', '张三峰', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('111', 'asfdasf', '陆小凤', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('112', '12125454787', '花满楼', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');
INSERT INTO `comp_integral_info` VALUES ('113', '4548784asdf', '江流儿', '200', '0', '2017_3', '2017-08-03 11:07:03', '2017-08-03 11:07:03');

-- ----------------------------
-- Table structure for comp_integral_option
-- ----------------------------
DROP TABLE IF EXISTS `comp_integral_option`;
CREATE TABLE `comp_integral_option` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '积分项名称',
  `score` int(11) DEFAULT NULL COMMENT '积分项分数（可为负数）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='积分项';

-- ----------------------------
-- Records of comp_integral_option
-- ----------------------------
INSERT INTO `comp_integral_option` VALUES ('1', '月度销售冠军', '5');
INSERT INTO `comp_integral_option` VALUES ('2', '积极组织公司活动', '2');
INSERT INTO `comp_integral_option` VALUES ('3', '月度全勤', '1');
INSERT INTO `comp_integral_option` VALUES ('4', '内部推荐，在试用期的', '2');
INSERT INTO `comp_integral_option` VALUES ('5', '内部推荐，过试用期转正', '3');
INSERT INTO `comp_integral_option` VALUES ('6', '收到客户书面表扬的', '5');
INSERT INTO `comp_integral_option` VALUES ('7', '一星期成三单', '2');
INSERT INTO `comp_integral_option` VALUES ('8', '周末见客户', '2');
INSERT INTO `comp_integral_option` VALUES ('9', '外出讲课', '5');
INSERT INTO `comp_integral_option` VALUES ('10', '积极主动维护公司共用设备', '2');
INSERT INTO `comp_integral_option` VALUES ('11', '帮助其他部门做文件得到良好反馈', '3');
INSERT INTO `comp_integral_option` VALUES ('12', '在公司各项评比中获得第一名', '5');
INSERT INTO `comp_integral_option` VALUES ('13', '获得政府、行业协会等外单位表彰', '10');
INSERT INTO `comp_integral_option` VALUES ('14', '工作满1年', '2');
INSERT INTO `comp_integral_option` VALUES ('15', '月度日志未有漏发', '2');
INSERT INTO `comp_integral_option` VALUES ('16', '在例会或日常工作中有表扬行为的', '1');
INSERT INTO `comp_integral_option` VALUES ('17', '按时完成安排的工作', '1');
INSERT INTO `comp_integral_option` VALUES ('18', '内部客户满意并填写满意单，公司内部表扬的', '5');
INSERT INTO `comp_integral_option` VALUES ('19', '业务知识随时抽查回答正确的', '1');
INSERT INTO `comp_integral_option` VALUES ('20', '公司安排的劳动、任务等外出活动，按时完成的', '1');
INSERT INTO `comp_integral_option` VALUES ('21', '金点子提议', '5');
INSERT INTO `comp_integral_option` VALUES ('22', '替同事见客户（帮忙行为）', '2');
INSERT INTO `comp_integral_option` VALUES ('23', '下班不关电脑', '-2');
INSERT INTO `comp_integral_option` VALUES ('24', '公共区域与同事发生口角、打架', '-3');
INSERT INTO `comp_integral_option` VALUES ('25', '中午午休未关闭显示器', '-1');
INSERT INTO `comp_integral_option` VALUES ('26', '散播不利公司的谣言，被举报', '-5');
INSERT INTO `comp_integral_option` VALUES ('27', '上班着奇装异服，拖鞋等', '-2');
INSERT INTO `comp_integral_option` VALUES ('28', '无正当理由不服从上级工作安排的', '-2');
INSERT INTO `comp_integral_option` VALUES ('29', '无故旷工者', '-2');
INSERT INTO `comp_integral_option` VALUES ('30', '环境卫生、工位不整洁', '-1');
INSERT INTO `comp_integral_option` VALUES ('31', '遭客户投诉者', '-3');
INSERT INTO `comp_integral_option` VALUES ('32', '安排的工作有推托行为的', '-1');
INSERT INTO `comp_integral_option` VALUES ('33', '业务知识随时抽查有不清楚的', '-1');
INSERT INTO `comp_integral_option` VALUES ('34', '工作期间在职场内趴桌子、大声喧哗', '-1');
INSERT INTO `comp_integral_option` VALUES ('35', '公司组织的劳动、集体活动等，无故不参加', '-1');
INSERT INTO `comp_integral_option` VALUES ('36', '公司安排的劳动、任务等外出活动不按时完成的', '-1');

-- ----------------------------
-- Table structure for comp_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `comp_integral_record`;
CREATE TABLE `comp_integral_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_id` int(10) DEFAULT NULL COMMENT '创建人（包括员工与领导）id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人（包括员工与领导）name',
  `integral_option` varchar(50) DEFAULT NULL COMMENT '积分项',
  `integral_num` int(50) DEFAULT NULL COMMENT '积分值',
  `login_name` varchar(50) DEFAULT NULL COMMENT '积分所得员工ID（可与record_id相同）',
  `user_name` varchar(50) DEFAULT NULL COMMENT '积分所得员工',
  `depart_id` varchar(50) DEFAULT NULL COMMENT '部门ID',
  `lead_id` int(11) DEFAULT NULL COMMENT '审批人Id',
  `lead_name` varchar(50) DEFAULT NULL COMMENT '审批人',
  `status` varchar(50) DEFAULT NULL COMMENT '待审批，审批通过，驳回',
  `integral_ok_num` int(11) DEFAULT NULL COMMENT '审批通过确认加减积分值',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='积分加减记录';

-- ----------------------------
-- Records of comp_integral_record
-- ----------------------------
INSERT INTO `comp_integral_record` VALUES ('9', '1', '管理员', '月度销售冠军', '5', '郭彦敏', '郭彦敏', '1', '1', '管理员', '审批通过', '5', null, '2017-05-22 14:55:06', '2017-05-22 14:55:06');
INSERT INTO `comp_integral_record` VALUES ('10', '1', '管理员', '月度销售冠军', '5', '郭彦敏', '郭彦敏', '1', '1', '管理员', '审批通过', '5', null, '2017-05-27 10:00:34', '2017-05-27 10:00:34');
INSERT INTO `comp_integral_record` VALUES ('11', '1', '管理员', '月度全勤', '1', 'admin', '管理员', '1', null, null, '待审批', null, null, '2017-08-02 16:03:51', '2017-08-02 16:03:51');
INSERT INTO `comp_integral_record` VALUES ('12', '1', '管理员', '积极组织公司活动', '2', '郭彦敏', '郭彦敏', '1', '1', '管理员', '审批通过', '2', null, '2017-08-03 11:08:50', '2017-08-03 11:08:50');
INSERT INTO `comp_integral_record` VALUES ('13', '1', '管理员', '公共区域与同事发生口角、打架', '-3', '郭彦敏', '郭彦敏', '1', '1', '管理员', '审批通过', '-3', null, '2017-08-03 11:09:05', '2017-08-03 11:09:05');
INSERT INTO `comp_integral_record` VALUES ('14', '1', '管理员', '积极组织公司活动', '2', 'admin', '管理员', '1', '1', '管理员', '驳回', '2', '', '2017-08-03 15:24:41', '2017-08-03 15:36:50');

-- ----------------------------
-- Table structure for comp_invoice
-- ----------------------------
DROP TABLE IF EXISTS `comp_invoice`;
CREATE TABLE `comp_invoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `makeout_time` date DEFAULT NULL COMMENT '开票截止日期',
  `title` varchar(50) NOT NULL COMMENT '发票抬头',
  `cost` double(10,2) NOT NULL COMMENT '总花费',
  `proposer` varchar(50) DEFAULT NULL COMMENT '申请人',
  `user_id` int(10) DEFAULT NULL COMMENT '开票人',
  `create_time` datetime DEFAULT NULL COMMENT '实际开票时间',
  `type` varchar(10) DEFAULT NULL COMMENT '发票类型',
  `department_id` varchar(50) DEFAULT NULL COMMENT '申请部门',
  `content` varchar(20) DEFAULT NULL COMMENT '内容',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注',
  `pack_id` int(10) DEFAULT NULL,
  `makeout_company` varchar(50) DEFAULT NULL COMMENT '开票公司',
  `contract_code` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `financial_code` varchar(30) DEFAULT NULL COMMENT '财务编号',
  `payment_condition` varchar(300) DEFAULT NULL COMMENT '到款情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='发票';

-- ----------------------------
-- Records of comp_invoice
-- ----------------------------
INSERT INTO `comp_invoice` VALUES ('1', '公司1', null, '11212', '1212.00', 'admin', '1', '2017-08-16 10:26:19', '普通发票', '1', '123213', '32423', null, '北京', '170220002', '', '已付款');

-- ----------------------------
-- Table structure for comp_job
-- ----------------------------
DROP TABLE IF EXISTS `comp_job`;
CREATE TABLE `comp_job` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '职位名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `order_num` int(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='职位';

-- ----------------------------
-- Records of comp_job
-- ----------------------------
INSERT INTO `comp_job` VALUES ('1', '总经理', '公司整体运营，管理，规划', '1', '启用');
INSERT INTO `comp_job` VALUES ('2', '部门经理', '各个部门或分公司管理', '2', '启用');
INSERT INTO `comp_job` VALUES ('3', '副总经理', '业务板块运营及规划', '3', '启用');
INSERT INTO `comp_job` VALUES ('4', '普通职员', '独立自主，合作共赢', '4', '启用');
INSERT INTO `comp_job` VALUES ('5', '财务', '数据录入，整理，汇总，规划', null, '启用');
INSERT INTO `comp_job` VALUES ('6', '部门主管', '负责小组人员管理', null, '启用');
INSERT INTO `comp_job` VALUES ('7', '部门副理', '执行公司及部门经理制定的政策，员工管理', null, '启用');

-- ----------------------------
-- Table structure for comp_minus
-- ----------------------------
DROP TABLE IF EXISTS `comp_minus`;
CREATE TABLE `comp_minus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `contract_code` varchar(50) DEFAULT NULL COMMENT '合同编码',
  `finance_code` varchar(50) DEFAULT NULL COMMENT '财务编码',
  `minus_amount` double DEFAULT NULL COMMENT '退款金额',
  `minus_time` datetime DEFAULT NULL COMMENT '退款时间',
  `minus_reason` varchar(50) DEFAULT NULL COMMENT '退款原因',
  `input_user` varchar(50) DEFAULT NULL COMMENT '录入人',
  `created_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_datetime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='退款信息';

-- ----------------------------
-- Records of comp_minus
-- ----------------------------
INSERT INTO `comp_minus` VALUES ('1', '17020220230003', '14982024812994', '1000', '2017-08-01 00:00:00', '测试', 'admin', '2017-08-16 17:23:34', null);

-- ----------------------------
-- Table structure for comp_money_manger
-- ----------------------------
DROP TABLE IF EXISTS `comp_money_manger`;
CREATE TABLE `comp_money_manger` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL COMMENT '客户姓名',
  `time` datetime NOT NULL COMMENT '到款日期',
  `money` double(10,2) NOT NULL COMMENT '收款金额',
  `cost_gf` double(10,2) NOT NULL COMMENT '官费',
  `cost_dlf` double(10,2) NOT NULL COMMENT '代理费',
  `input_time` datetime NOT NULL COMMENT '录入时间',
  `pay_bank` varchar(50) NOT NULL COMMENT '到款银行',
  `user_id` int(10) NOT NULL COMMENT '成单人员',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  `input_id` int(10) NOT NULL COMMENT '录入者用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_money_manger
-- ----------------------------

-- ----------------------------
-- Table structure for comp_monthly_order_rate
-- ----------------------------
DROP TABLE IF EXISTS `comp_monthly_order_rate`;
CREATE TABLE `comp_monthly_order_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `month` varchar(10) DEFAULT NULL COMMENT '月份 如2017-02',
  `department_id` int(10) DEFAULT NULL COMMENT '部门id',
  `login_name` varchar(50) DEFAULT NULL COMMENT '帐号',
  `achieved_count` int(11) DEFAULT NULL COMMENT '成单数量',
  `total_count` int(11) DEFAULT NULL COMMENT '总单数',
  `achieved_rate` double DEFAULT NULL COMMENT '成单率',
  `ranking` int(10) DEFAULT NULL COMMENT '排名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_monthly_order_rate
-- ----------------------------
INSERT INTO `comp_monthly_order_rate` VALUES ('1', '2017-04', '16', '陈艳洁   ', '3', '3', '1', '1', '2017-05-01 01:00:00', null);
INSERT INTO `comp_monthly_order_rate` VALUES ('2', '2017-04', '11', '郭彦敏', '1', '1', '1', '1', '2017-05-01 01:00:00', null);
INSERT INTO `comp_monthly_order_rate` VALUES ('3', '2017-04', '12', '周新翠', '1', '1', '1', '1', '2017-05-01 01:00:00', null);

-- ----------------------------
-- Table structure for comp_notice
-- ----------------------------
DROP TABLE IF EXISTS `comp_notice`;
CREATE TABLE `comp_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `level` varchar(20) DEFAULT NULL COMMENT '级别',
  `publisher` varchar(50) DEFAULT NULL COMMENT '发布人',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `order_num` int(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of comp_notice
-- ----------------------------
INSERT INTO `comp_notice` VALUES ('11', '1', '1', 'admin', '1', '2017-06-07 14:22:09', '1', null);
INSERT INTO `comp_notice` VALUES ('12', '2222', '2', 'admin', '2', '2017-06-07 14:22:18', '1', null);
INSERT INTO `comp_notice` VALUES ('13', '3', '1', 'admin', '3', '2017-06-07 15:07:04', '2', null);
INSERT INTO `comp_notice` VALUES ('14', '222222', '3', 'admin', '222222', '2017-06-07 15:07:18', '2', null);

-- ----------------------------
-- Table structure for comp_parameter
-- ----------------------------
DROP TABLE IF EXISTS `comp_parameter`;
CREATE TABLE `comp_parameter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '参数名称',
  `parameter_value` int(11) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='参数';

-- ----------------------------
-- Records of comp_parameter
-- ----------------------------
INSERT INTO `comp_parameter` VALUES ('1', 'PUBLIC_CUSTOMER_NUM', '23', '拥有公共客户的数目');

-- ----------------------------
-- Table structure for comp_rank
-- ----------------------------
DROP TABLE IF EXISTS `comp_rank`;
CREATE TABLE `comp_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comp_rank
-- ----------------------------

-- ----------------------------
-- Table structure for comp_record
-- ----------------------------
DROP TABLE IF EXISTS `comp_record`;
CREATE TABLE `comp_record` (
  `rid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `times` datetime NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_record
-- ----------------------------

-- ----------------------------
-- Table structure for comp_remind
-- ----------------------------
DROP TABLE IF EXISTS `comp_remind`;
CREATE TABLE `comp_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL COMMENT '客户id',
  `work_id` int(10) DEFAULT NULL COMMENT '任务id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_name` varchar(50) DEFAULT NULL COMMENT '创建人帐号',
  `content` varchar(300) DEFAULT NULL COMMENT '内容',
  `remind_time` datetime DEFAULT NULL COMMENT '提醒时间',
  `status` int(1) DEFAULT NULL COMMENT '状态：0为关闭，1为开启',
  `remind_start` datetime DEFAULT NULL COMMENT '提醒时间段_起始时间',
  `remind_end` datetime DEFAULT NULL COMMENT '提醒时间段_结束时间',
  `remind_gap` int(11) DEFAULT NULL COMMENT '提醒间隔(以秒为单位)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='提醒';

-- ----------------------------
-- Records of comp_remind
-- ----------------------------
INSERT INTO `comp_remind` VALUES ('11', '5', '30', '2017-03-31 16:25:50', 'admin', '测试内容', '2017-04-01 16:25:48', '0', '2017-06-20 09:00:48', '2017-06-20 19:00:48', '6000');
INSERT INTO `comp_remind` VALUES ('12', '1', '111', '2017-06-16 14:33:03', 'admin', '测试', null, '0', '2017-06-19 11:00:48', '2017-06-19 19:00:48', '6000');
INSERT INTO `comp_remind` VALUES ('13', null, null, '2017-06-19 15:11:26', 'admin', '联系XX客户', '2017-08-01 17:57:00', '1', '2017-06-19 15:11:07', '2017-06-19 15:11:13', '3000');
INSERT INTO `comp_remind` VALUES ('14', null, null, '2017-06-19 15:15:59', 'admin', '111', null, '1', '2017-06-19 15:15:38', '2017-06-19 22:50:48', '7000');
INSERT INTO `comp_remind` VALUES ('15', null, null, '2017-06-29 15:38:16', 'admin', '提醒啊啊啊', null, '0', '2017-06-29 15:30:45', '2017-06-29 17:37:58', '8');
INSERT INTO `comp_remind` VALUES ('16', '2', '112', '2017-06-29 15:40:56', 'admin', '提醒', null, '0', '2017-06-29 15:40:46', '2017-06-30 15:40:49', '7');
INSERT INTO `comp_remind` VALUES ('17', null, null, '2017-06-30 10:08:56', 'admin', 'aaa', null, '0', '2017-06-30 10:08:18', '2017-06-30 10:10:29', '10');
INSERT INTO `comp_remind` VALUES ('18', '1', '111', '2017-06-30 10:10:35', 'admin', 'gv', null, '1', '2017-06-30 10:10:20', '2017-06-30 10:20:23', '30');
INSERT INTO `comp_remind` VALUES ('19', '301', '131', '2017-08-02 10:22:31', 'admin', '确定xxx', '2017-08-03 10:22:24', '1', null, null, null);

-- ----------------------------
-- Table structure for comp_role
-- ----------------------------
DROP TABLE IF EXISTS `comp_role`;
CREATE TABLE `comp_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of comp_role
-- ----------------------------
INSERT INTO `comp_role` VALUES ('1', '超级管理员');
INSERT INTO `comp_role` VALUES ('2', '测试用户4');
INSERT INTO `comp_role` VALUES ('14', '部门经理');
INSERT INTO `comp_role` VALUES ('15', '顾问');
INSERT INTO `comp_role` VALUES ('16', '综合部');
INSERT INTO `comp_role` VALUES ('17', '客服总监');
INSERT INTO `comp_role` VALUES ('18', '客服');
INSERT INTO `comp_role` VALUES ('19', '业务经理');
INSERT INTO `comp_role` VALUES ('20', '业务员');
INSERT INTO `comp_role` VALUES ('21', '财务');
INSERT INTO `comp_role` VALUES ('22', '网络推广主管');
INSERT INTO `comp_role` VALUES ('23', '网络推广专员');
INSERT INTO `comp_role` VALUES ('24', '流程专员');
INSERT INTO `comp_role` VALUES ('25', '武汉分所');
INSERT INTO `comp_role` VALUES ('26', '武汉分所');
INSERT INTO `comp_role` VALUES ('27', 'qwe');
INSERT INTO `comp_role` VALUES ('28', 'ceshi');
INSERT INTO `comp_role` VALUES ('29', '测试1');
INSERT INTO `comp_role` VALUES ('30', '测试2');
INSERT INTO `comp_role` VALUES ('31', '测试3');
INSERT INTO `comp_role` VALUES ('32', '测试4');

-- ----------------------------
-- Table structure for comp_role_function
-- ----------------------------
DROP TABLE IF EXISTS `comp_role_function`;
CREATE TABLE `comp_role_function` (
  `role_id` int(10) NOT NULL,
  `function_id` int(10) NOT NULL,
  PRIMARY KEY (`role_id`,`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_role_function
-- ----------------------------
INSERT INTO `comp_role_function` VALUES ('1', '1');
INSERT INTO `comp_role_function` VALUES ('1', '2');
INSERT INTO `comp_role_function` VALUES ('1', '3');
INSERT INTO `comp_role_function` VALUES ('1', '4');
INSERT INTO `comp_role_function` VALUES ('1', '5');
INSERT INTO `comp_role_function` VALUES ('1', '6');
INSERT INTO `comp_role_function` VALUES ('1', '7');
INSERT INTO `comp_role_function` VALUES ('1', '8');
INSERT INTO `comp_role_function` VALUES ('1', '9');
INSERT INTO `comp_role_function` VALUES ('1', '10');
INSERT INTO `comp_role_function` VALUES ('1', '11');
INSERT INTO `comp_role_function` VALUES ('1', '12');
INSERT INTO `comp_role_function` VALUES ('1', '13');
INSERT INTO `comp_role_function` VALUES ('1', '14');
INSERT INTO `comp_role_function` VALUES ('1', '15');
INSERT INTO `comp_role_function` VALUES ('1', '16');
INSERT INTO `comp_role_function` VALUES ('1', '17');
INSERT INTO `comp_role_function` VALUES ('1', '18');
INSERT INTO `comp_role_function` VALUES ('1', '19');
INSERT INTO `comp_role_function` VALUES ('1', '20');
INSERT INTO `comp_role_function` VALUES ('1', '21');
INSERT INTO `comp_role_function` VALUES ('1', '22');
INSERT INTO `comp_role_function` VALUES ('1', '23');
INSERT INTO `comp_role_function` VALUES ('1', '24');
INSERT INTO `comp_role_function` VALUES ('1', '25');
INSERT INTO `comp_role_function` VALUES ('1', '26');
INSERT INTO `comp_role_function` VALUES ('1', '27');
INSERT INTO `comp_role_function` VALUES ('1', '28');
INSERT INTO `comp_role_function` VALUES ('1', '29');
INSERT INTO `comp_role_function` VALUES ('1', '30');
INSERT INTO `comp_role_function` VALUES ('1', '31');
INSERT INTO `comp_role_function` VALUES ('1', '32');
INSERT INTO `comp_role_function` VALUES ('1', '33');
INSERT INTO `comp_role_function` VALUES ('1', '34');
INSERT INTO `comp_role_function` VALUES ('1', '35');
INSERT INTO `comp_role_function` VALUES ('1', '36');
INSERT INTO `comp_role_function` VALUES ('1', '37');
INSERT INTO `comp_role_function` VALUES ('1', '38');
INSERT INTO `comp_role_function` VALUES ('1', '39');
INSERT INTO `comp_role_function` VALUES ('1', '43');
INSERT INTO `comp_role_function` VALUES ('1', '44');
INSERT INTO `comp_role_function` VALUES ('1', '45');
INSERT INTO `comp_role_function` VALUES ('1', '46');
INSERT INTO `comp_role_function` VALUES ('1', '47');
INSERT INTO `comp_role_function` VALUES ('1', '48');
INSERT INTO `comp_role_function` VALUES ('1', '49');
INSERT INTO `comp_role_function` VALUES ('1', '50');
INSERT INTO `comp_role_function` VALUES ('1', '51');
INSERT INTO `comp_role_function` VALUES ('1', '52');
INSERT INTO `comp_role_function` VALUES ('1', '53');
INSERT INTO `comp_role_function` VALUES ('1', '54');
INSERT INTO `comp_role_function` VALUES ('1', '55');
INSERT INTO `comp_role_function` VALUES ('1', '56');
INSERT INTO `comp_role_function` VALUES ('1', '57');
INSERT INTO `comp_role_function` VALUES ('1', '58');
INSERT INTO `comp_role_function` VALUES ('1', '59');
INSERT INTO `comp_role_function` VALUES ('1', '60');
INSERT INTO `comp_role_function` VALUES ('1', '61');
INSERT INTO `comp_role_function` VALUES ('1', '62');
INSERT INTO `comp_role_function` VALUES ('1', '63');
INSERT INTO `comp_role_function` VALUES ('1', '64');
INSERT INTO `comp_role_function` VALUES ('1', '65');
INSERT INTO `comp_role_function` VALUES ('1', '66');
INSERT INTO `comp_role_function` VALUES ('1', '67');
INSERT INTO `comp_role_function` VALUES ('1', '68');
INSERT INTO `comp_role_function` VALUES ('1', '69');
INSERT INTO `comp_role_function` VALUES ('1', '70');
INSERT INTO `comp_role_function` VALUES ('1', '71');
INSERT INTO `comp_role_function` VALUES ('1', '72');
INSERT INTO `comp_role_function` VALUES ('1', '73');
INSERT INTO `comp_role_function` VALUES ('1', '74');
INSERT INTO `comp_role_function` VALUES ('1', '75');
INSERT INTO `comp_role_function` VALUES ('1', '76');
INSERT INTO `comp_role_function` VALUES ('1', '77');
INSERT INTO `comp_role_function` VALUES ('1', '78');
INSERT INTO `comp_role_function` VALUES ('1', '79');
INSERT INTO `comp_role_function` VALUES ('1', '80');
INSERT INTO `comp_role_function` VALUES ('1', '81');
INSERT INTO `comp_role_function` VALUES ('1', '82');
INSERT INTO `comp_role_function` VALUES ('1', '83');
INSERT INTO `comp_role_function` VALUES ('1', '84');
INSERT INTO `comp_role_function` VALUES ('1', '85');
INSERT INTO `comp_role_function` VALUES ('1', '86');
INSERT INTO `comp_role_function` VALUES ('1', '87');
INSERT INTO `comp_role_function` VALUES ('1', '88');
INSERT INTO `comp_role_function` VALUES ('1', '89');
INSERT INTO `comp_role_function` VALUES ('1', '90');
INSERT INTO `comp_role_function` VALUES ('2', '1');
INSERT INTO `comp_role_function` VALUES ('2', '3');
INSERT INTO `comp_role_function` VALUES ('2', '9');
INSERT INTO `comp_role_function` VALUES ('2', '10');
INSERT INTO `comp_role_function` VALUES ('2', '11');
INSERT INTO `comp_role_function` VALUES ('2', '12');
INSERT INTO `comp_role_function` VALUES ('2', '28');
INSERT INTO `comp_role_function` VALUES ('2', '29');
INSERT INTO `comp_role_function` VALUES ('2', '30');
INSERT INTO `comp_role_function` VALUES ('2', '31');
INSERT INTO `comp_role_function` VALUES ('2', '32');
INSERT INTO `comp_role_function` VALUES ('2', '33');
INSERT INTO `comp_role_function` VALUES ('2', '34');
INSERT INTO `comp_role_function` VALUES ('2', '35');
INSERT INTO `comp_role_function` VALUES ('2', '36');
INSERT INTO `comp_role_function` VALUES ('2', '37');
INSERT INTO `comp_role_function` VALUES ('2', '43');
INSERT INTO `comp_role_function` VALUES ('2', '44');
INSERT INTO `comp_role_function` VALUES ('2', '45');
INSERT INTO `comp_role_function` VALUES ('2', '46');
INSERT INTO `comp_role_function` VALUES ('2', '47');
INSERT INTO `comp_role_function` VALUES ('2', '48');
INSERT INTO `comp_role_function` VALUES ('2', '49');
INSERT INTO `comp_role_function` VALUES ('2', '50');
INSERT INTO `comp_role_function` VALUES ('2', '51');
INSERT INTO `comp_role_function` VALUES ('2', '52');
INSERT INTO `comp_role_function` VALUES ('2', '53');
INSERT INTO `comp_role_function` VALUES ('2', '54');
INSERT INTO `comp_role_function` VALUES ('2', '55');
INSERT INTO `comp_role_function` VALUES ('2', '56');
INSERT INTO `comp_role_function` VALUES ('2', '57');
INSERT INTO `comp_role_function` VALUES ('2', '58');
INSERT INTO `comp_role_function` VALUES ('2', '65');
INSERT INTO `comp_role_function` VALUES ('2', '66');
INSERT INTO `comp_role_function` VALUES ('2', '67');
INSERT INTO `comp_role_function` VALUES ('2', '68');
INSERT INTO `comp_role_function` VALUES ('2', '69');
INSERT INTO `comp_role_function` VALUES ('2', '70');
INSERT INTO `comp_role_function` VALUES ('2', '72');
INSERT INTO `comp_role_function` VALUES ('2', '73');
INSERT INTO `comp_role_function` VALUES ('2', '74');
INSERT INTO `comp_role_function` VALUES ('2', '75');
INSERT INTO `comp_role_function` VALUES ('2', '76');
INSERT INTO `comp_role_function` VALUES ('2', '77');
INSERT INTO `comp_role_function` VALUES ('2', '79');
INSERT INTO `comp_role_function` VALUES ('2', '80');
INSERT INTO `comp_role_function` VALUES ('2', '81');
INSERT INTO `comp_role_function` VALUES ('2', '82');
INSERT INTO `comp_role_function` VALUES ('2', '83');
INSERT INTO `comp_role_function` VALUES ('2', '84');
INSERT INTO `comp_role_function` VALUES ('2', '85');
INSERT INTO `comp_role_function` VALUES ('2', '86');
INSERT INTO `comp_role_function` VALUES ('2', '87');
INSERT INTO `comp_role_function` VALUES ('2', '89');
INSERT INTO `comp_role_function` VALUES ('2', '90');
INSERT INTO `comp_role_function` VALUES ('14', '9');
INSERT INTO `comp_role_function` VALUES ('14', '12');
INSERT INTO `comp_role_function` VALUES ('14', '13');
INSERT INTO `comp_role_function` VALUES ('14', '14');
INSERT INTO `comp_role_function` VALUES ('14', '15');
INSERT INTO `comp_role_function` VALUES ('14', '16');
INSERT INTO `comp_role_function` VALUES ('14', '17');
INSERT INTO `comp_role_function` VALUES ('14', '18');
INSERT INTO `comp_role_function` VALUES ('14', '19');
INSERT INTO `comp_role_function` VALUES ('14', '20');
INSERT INTO `comp_role_function` VALUES ('14', '21');
INSERT INTO `comp_role_function` VALUES ('14', '22');
INSERT INTO `comp_role_function` VALUES ('14', '23');
INSERT INTO `comp_role_function` VALUES ('14', '24');
INSERT INTO `comp_role_function` VALUES ('14', '25');
INSERT INTO `comp_role_function` VALUES ('14', '26');
INSERT INTO `comp_role_function` VALUES ('14', '27');
INSERT INTO `comp_role_function` VALUES ('14', '28');
INSERT INTO `comp_role_function` VALUES ('14', '29');
INSERT INTO `comp_role_function` VALUES ('14', '30');
INSERT INTO `comp_role_function` VALUES ('14', '31');
INSERT INTO `comp_role_function` VALUES ('14', '32');
INSERT INTO `comp_role_function` VALUES ('14', '33');
INSERT INTO `comp_role_function` VALUES ('14', '34');
INSERT INTO `comp_role_function` VALUES ('14', '35');
INSERT INTO `comp_role_function` VALUES ('14', '36');
INSERT INTO `comp_role_function` VALUES ('14', '37');
INSERT INTO `comp_role_function` VALUES ('14', '43');
INSERT INTO `comp_role_function` VALUES ('14', '46');
INSERT INTO `comp_role_function` VALUES ('14', '47');
INSERT INTO `comp_role_function` VALUES ('14', '48');
INSERT INTO `comp_role_function` VALUES ('14', '49');
INSERT INTO `comp_role_function` VALUES ('14', '50');
INSERT INTO `comp_role_function` VALUES ('14', '53');
INSERT INTO `comp_role_function` VALUES ('14', '54');
INSERT INTO `comp_role_function` VALUES ('14', '55');
INSERT INTO `comp_role_function` VALUES ('14', '56');
INSERT INTO `comp_role_function` VALUES ('14', '57');
INSERT INTO `comp_role_function` VALUES ('14', '58');
INSERT INTO `comp_role_function` VALUES ('14', '59');
INSERT INTO `comp_role_function` VALUES ('14', '61');
INSERT INTO `comp_role_function` VALUES ('14', '62');
INSERT INTO `comp_role_function` VALUES ('14', '63');
INSERT INTO `comp_role_function` VALUES ('14', '65');
INSERT INTO `comp_role_function` VALUES ('14', '69');
INSERT INTO `comp_role_function` VALUES ('14', '72');
INSERT INTO `comp_role_function` VALUES ('14', '74');
INSERT INTO `comp_role_function` VALUES ('14', '79');
INSERT INTO `comp_role_function` VALUES ('15', '12');
INSERT INTO `comp_role_function` VALUES ('15', '15');
INSERT INTO `comp_role_function` VALUES ('15', '16');
INSERT INTO `comp_role_function` VALUES ('15', '17');
INSERT INTO `comp_role_function` VALUES ('15', '18');
INSERT INTO `comp_role_function` VALUES ('15', '19');
INSERT INTO `comp_role_function` VALUES ('15', '20');
INSERT INTO `comp_role_function` VALUES ('15', '21');
INSERT INTO `comp_role_function` VALUES ('15', '23');
INSERT INTO `comp_role_function` VALUES ('15', '24');
INSERT INTO `comp_role_function` VALUES ('15', '25');
INSERT INTO `comp_role_function` VALUES ('15', '26');
INSERT INTO `comp_role_function` VALUES ('15', '27');
INSERT INTO `comp_role_function` VALUES ('15', '28');
INSERT INTO `comp_role_function` VALUES ('15', '29');
INSERT INTO `comp_role_function` VALUES ('15', '30');
INSERT INTO `comp_role_function` VALUES ('15', '31');
INSERT INTO `comp_role_function` VALUES ('15', '43');
INSERT INTO `comp_role_function` VALUES ('15', '46');
INSERT INTO `comp_role_function` VALUES ('15', '47');
INSERT INTO `comp_role_function` VALUES ('15', '49');
INSERT INTO `comp_role_function` VALUES ('15', '50');
INSERT INTO `comp_role_function` VALUES ('15', '53');
INSERT INTO `comp_role_function` VALUES ('15', '54');
INSERT INTO `comp_role_function` VALUES ('15', '55');
INSERT INTO `comp_role_function` VALUES ('15', '57');
INSERT INTO `comp_role_function` VALUES ('15', '58');
INSERT INTO `comp_role_function` VALUES ('15', '59');
INSERT INTO `comp_role_function` VALUES ('15', '60');
INSERT INTO `comp_role_function` VALUES ('15', '62');
INSERT INTO `comp_role_function` VALUES ('15', '65');
INSERT INTO `comp_role_function` VALUES ('15', '66');
INSERT INTO `comp_role_function` VALUES ('15', '67');
INSERT INTO `comp_role_function` VALUES ('15', '84');
INSERT INTO `comp_role_function` VALUES ('16', '9');
INSERT INTO `comp_role_function` VALUES ('16', '10');
INSERT INTO `comp_role_function` VALUES ('16', '11');
INSERT INTO `comp_role_function` VALUES ('16', '12');
INSERT INTO `comp_role_function` VALUES ('16', '13');
INSERT INTO `comp_role_function` VALUES ('16', '14');
INSERT INTO `comp_role_function` VALUES ('16', '15');
INSERT INTO `comp_role_function` VALUES ('16', '18');
INSERT INTO `comp_role_function` VALUES ('16', '20');
INSERT INTO `comp_role_function` VALUES ('16', '21');
INSERT INTO `comp_role_function` VALUES ('16', '22');
INSERT INTO `comp_role_function` VALUES ('16', '28');
INSERT INTO `comp_role_function` VALUES ('16', '29');
INSERT INTO `comp_role_function` VALUES ('16', '30');
INSERT INTO `comp_role_function` VALUES ('16', '31');
INSERT INTO `comp_role_function` VALUES ('16', '53');
INSERT INTO `comp_role_function` VALUES ('16', '54');
INSERT INTO `comp_role_function` VALUES ('16', '57');
INSERT INTO `comp_role_function` VALUES ('16', '58');
INSERT INTO `comp_role_function` VALUES ('16', '59');
INSERT INTO `comp_role_function` VALUES ('16', '60');
INSERT INTO `comp_role_function` VALUES ('16', '61');
INSERT INTO `comp_role_function` VALUES ('16', '62');
INSERT INTO `comp_role_function` VALUES ('16', '63');
INSERT INTO `comp_role_function` VALUES ('16', '64');
INSERT INTO `comp_role_function` VALUES ('16', '84');
INSERT INTO `comp_role_function` VALUES ('16', '85');
INSERT INTO `comp_role_function` VALUES ('16', '86');
INSERT INTO `comp_role_function` VALUES ('17', '13');
INSERT INTO `comp_role_function` VALUES ('17', '14');
INSERT INTO `comp_role_function` VALUES ('17', '15');
INSERT INTO `comp_role_function` VALUES ('17', '16');
INSERT INTO `comp_role_function` VALUES ('17', '18');
INSERT INTO `comp_role_function` VALUES ('17', '20');
INSERT INTO `comp_role_function` VALUES ('17', '21');
INSERT INTO `comp_role_function` VALUES ('17', '22');
INSERT INTO `comp_role_function` VALUES ('17', '23');
INSERT INTO `comp_role_function` VALUES ('17', '24');
INSERT INTO `comp_role_function` VALUES ('17', '43');
INSERT INTO `comp_role_function` VALUES ('17', '44');
INSERT INTO `comp_role_function` VALUES ('17', '46');
INSERT INTO `comp_role_function` VALUES ('17', '47');
INSERT INTO `comp_role_function` VALUES ('17', '48');
INSERT INTO `comp_role_function` VALUES ('17', '49');
INSERT INTO `comp_role_function` VALUES ('17', '50');
INSERT INTO `comp_role_function` VALUES ('17', '52');
INSERT INTO `comp_role_function` VALUES ('17', '53');
INSERT INTO `comp_role_function` VALUES ('17', '54');
INSERT INTO `comp_role_function` VALUES ('17', '56');
INSERT INTO `comp_role_function` VALUES ('17', '57');
INSERT INTO `comp_role_function` VALUES ('17', '58');
INSERT INTO `comp_role_function` VALUES ('17', '59');
INSERT INTO `comp_role_function` VALUES ('17', '60');
INSERT INTO `comp_role_function` VALUES ('17', '61');
INSERT INTO `comp_role_function` VALUES ('17', '62');
INSERT INTO `comp_role_function` VALUES ('17', '63');
INSERT INTO `comp_role_function` VALUES ('17', '65');
INSERT INTO `comp_role_function` VALUES ('17', '66');
INSERT INTO `comp_role_function` VALUES ('17', '67');
INSERT INTO `comp_role_function` VALUES ('17', '68');
INSERT INTO `comp_role_function` VALUES ('18', '13');
INSERT INTO `comp_role_function` VALUES ('18', '14');
INSERT INTO `comp_role_function` VALUES ('18', '15');
INSERT INTO `comp_role_function` VALUES ('18', '16');
INSERT INTO `comp_role_function` VALUES ('18', '17');
INSERT INTO `comp_role_function` VALUES ('18', '18');
INSERT INTO `comp_role_function` VALUES ('18', '19');
INSERT INTO `comp_role_function` VALUES ('18', '20');
INSERT INTO `comp_role_function` VALUES ('18', '21');
INSERT INTO `comp_role_function` VALUES ('18', '22');
INSERT INTO `comp_role_function` VALUES ('18', '23');
INSERT INTO `comp_role_function` VALUES ('18', '24');
INSERT INTO `comp_role_function` VALUES ('18', '31');
INSERT INTO `comp_role_function` VALUES ('18', '43');
INSERT INTO `comp_role_function` VALUES ('18', '46');
INSERT INTO `comp_role_function` VALUES ('18', '47');
INSERT INTO `comp_role_function` VALUES ('18', '48');
INSERT INTO `comp_role_function` VALUES ('18', '53');
INSERT INTO `comp_role_function` VALUES ('18', '54');
INSERT INTO `comp_role_function` VALUES ('18', '55');
INSERT INTO `comp_role_function` VALUES ('18', '57');
INSERT INTO `comp_role_function` VALUES ('18', '58');
INSERT INTO `comp_role_function` VALUES ('18', '59');
INSERT INTO `comp_role_function` VALUES ('18', '60');
INSERT INTO `comp_role_function` VALUES ('18', '61');
INSERT INTO `comp_role_function` VALUES ('18', '62');
INSERT INTO `comp_role_function` VALUES ('18', '63');
INSERT INTO `comp_role_function` VALUES ('18', '65');
INSERT INTO `comp_role_function` VALUES ('18', '66');
INSERT INTO `comp_role_function` VALUES ('18', '67');
INSERT INTO `comp_role_function` VALUES ('18', '78');
INSERT INTO `comp_role_function` VALUES ('18', '84');
INSERT INTO `comp_role_function` VALUES ('21', '13');
INSERT INTO `comp_role_function` VALUES ('21', '14');
INSERT INTO `comp_role_function` VALUES ('21', '20');
INSERT INTO `comp_role_function` VALUES ('21', '21');
INSERT INTO `comp_role_function` VALUES ('21', '23');
INSERT INTO `comp_role_function` VALUES ('21', '24');
INSERT INTO `comp_role_function` VALUES ('21', '25');
INSERT INTO `comp_role_function` VALUES ('21', '26');
INSERT INTO `comp_role_function` VALUES ('21', '27');
INSERT INTO `comp_role_function` VALUES ('21', '28');
INSERT INTO `comp_role_function` VALUES ('21', '35');
INSERT INTO `comp_role_function` VALUES ('21', '65');
INSERT INTO `comp_role_function` VALUES ('21', '66');
INSERT INTO `comp_role_function` VALUES ('21', '67');
INSERT INTO `comp_role_function` VALUES ('21', '68');
INSERT INTO `comp_role_function` VALUES ('21', '69');
INSERT INTO `comp_role_function` VALUES ('21', '70');
INSERT INTO `comp_role_function` VALUES ('21', '71');
INSERT INTO `comp_role_function` VALUES ('21', '72');
INSERT INTO `comp_role_function` VALUES ('21', '73');
INSERT INTO `comp_role_function` VALUES ('21', '74');
INSERT INTO `comp_role_function` VALUES ('21', '75');
INSERT INTO `comp_role_function` VALUES ('21', '76');
INSERT INTO `comp_role_function` VALUES ('21', '77');
INSERT INTO `comp_role_function` VALUES ('21', '78');
INSERT INTO `comp_role_function` VALUES ('21', '79');
INSERT INTO `comp_role_function` VALUES ('21', '80');
INSERT INTO `comp_role_function` VALUES ('21', '81');
INSERT INTO `comp_role_function` VALUES ('21', '82');
INSERT INTO `comp_role_function` VALUES ('21', '83');
INSERT INTO `comp_role_function` VALUES ('21', '84');
INSERT INTO `comp_role_function` VALUES ('21', '86');
INSERT INTO `comp_role_function` VALUES ('22', '13');
INSERT INTO `comp_role_function` VALUES ('22', '14');
INSERT INTO `comp_role_function` VALUES ('22', '15');
INSERT INTO `comp_role_function` VALUES ('22', '16');
INSERT INTO `comp_role_function` VALUES ('22', '17');
INSERT INTO `comp_role_function` VALUES ('22', '18');
INSERT INTO `comp_role_function` VALUES ('22', '19');
INSERT INTO `comp_role_function` VALUES ('22', '28');
INSERT INTO `comp_role_function` VALUES ('22', '31');
INSERT INTO `comp_role_function` VALUES ('22', '43');
INSERT INTO `comp_role_function` VALUES ('22', '44');
INSERT INTO `comp_role_function` VALUES ('22', '45');
INSERT INTO `comp_role_function` VALUES ('22', '46');
INSERT INTO `comp_role_function` VALUES ('22', '47');
INSERT INTO `comp_role_function` VALUES ('22', '48');
INSERT INTO `comp_role_function` VALUES ('22', '49');
INSERT INTO `comp_role_function` VALUES ('22', '50');
INSERT INTO `comp_role_function` VALUES ('22', '52');
INSERT INTO `comp_role_function` VALUES ('22', '53');
INSERT INTO `comp_role_function` VALUES ('22', '54');
INSERT INTO `comp_role_function` VALUES ('22', '55');
INSERT INTO `comp_role_function` VALUES ('22', '56');
INSERT INTO `comp_role_function` VALUES ('22', '57');
INSERT INTO `comp_role_function` VALUES ('22', '58');
INSERT INTO `comp_role_function` VALUES ('22', '84');
INSERT INTO `comp_role_function` VALUES ('22', '85');
INSERT INTO `comp_role_function` VALUES ('22', '86');
INSERT INTO `comp_role_function` VALUES ('22', '87');
INSERT INTO `comp_role_function` VALUES ('23', '13');
INSERT INTO `comp_role_function` VALUES ('23', '14');
INSERT INTO `comp_role_function` VALUES ('23', '15');
INSERT INTO `comp_role_function` VALUES ('23', '16');
INSERT INTO `comp_role_function` VALUES ('23', '17');
INSERT INTO `comp_role_function` VALUES ('23', '18');
INSERT INTO `comp_role_function` VALUES ('23', '19');
INSERT INTO `comp_role_function` VALUES ('23', '28');
INSERT INTO `comp_role_function` VALUES ('23', '31');
INSERT INTO `comp_role_function` VALUES ('23', '43');
INSERT INTO `comp_role_function` VALUES ('23', '44');
INSERT INTO `comp_role_function` VALUES ('23', '45');
INSERT INTO `comp_role_function` VALUES ('23', '46');
INSERT INTO `comp_role_function` VALUES ('23', '47');
INSERT INTO `comp_role_function` VALUES ('23', '48');
INSERT INTO `comp_role_function` VALUES ('23', '49');
INSERT INTO `comp_role_function` VALUES ('23', '50');
INSERT INTO `comp_role_function` VALUES ('23', '52');
INSERT INTO `comp_role_function` VALUES ('23', '53');
INSERT INTO `comp_role_function` VALUES ('23', '54');
INSERT INTO `comp_role_function` VALUES ('23', '55');
INSERT INTO `comp_role_function` VALUES ('23', '56');
INSERT INTO `comp_role_function` VALUES ('23', '57');
INSERT INTO `comp_role_function` VALUES ('23', '84');
INSERT INTO `comp_role_function` VALUES ('23', '86');
INSERT INTO `comp_role_function` VALUES ('24', '13');
INSERT INTO `comp_role_function` VALUES ('24', '14');
INSERT INTO `comp_role_function` VALUES ('24', '20');
INSERT INTO `comp_role_function` VALUES ('24', '21');
INSERT INTO `comp_role_function` VALUES ('24', '25');
INSERT INTO `comp_role_function` VALUES ('24', '28');
INSERT INTO `comp_role_function` VALUES ('24', '29');
INSERT INTO `comp_role_function` VALUES ('24', '30');
INSERT INTO `comp_role_function` VALUES ('24', '31');
INSERT INTO `comp_role_function` VALUES ('24', '69');
INSERT INTO `comp_role_function` VALUES ('24', '70');
INSERT INTO `comp_role_function` VALUES ('24', '71');
INSERT INTO `comp_role_function` VALUES ('24', '72');
INSERT INTO `comp_role_function` VALUES ('24', '73');
INSERT INTO `comp_role_function` VALUES ('24', '84');
INSERT INTO `comp_role_function` VALUES ('24', '85');
INSERT INTO `comp_role_function` VALUES ('24', '86');

-- ----------------------------
-- Table structure for comp_scorecard
-- ----------------------------
DROP TABLE IF EXISTS `comp_scorecard`;
CREATE TABLE `comp_scorecard` (
  `sname` varchar(20) NOT NULL,
  `uid` int(11) NOT NULL,
  `expect` varchar(20) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `period` varchar(20) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_scorecard
-- ----------------------------

-- ----------------------------
-- Table structure for comp_statis
-- ----------------------------
DROP TABLE IF EXISTS `comp_statis`;
CREATE TABLE `comp_statis` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `subsection` int(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_statis
-- ----------------------------
INSERT INTO `comp_statis` VALUES ('1', '季度积分冠军', '5');
INSERT INTO `comp_statis` VALUES ('2', '周末访问顾客234', '2');
INSERT INTO `comp_statis` VALUES ('3', '周末访问顾客234', '3');

-- ----------------------------
-- Table structure for comp_total
-- ----------------------------
DROP TABLE IF EXISTS `comp_total`;
CREATE TABLE `comp_total` (
  `uid` int(10) NOT NULL,
  `totalpoints` int(11) NOT NULL,
  `deptid` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_total
-- ----------------------------

-- ----------------------------
-- Table structure for comp_user
-- ----------------------------
DROP TABLE IF EXISTS `comp_user`;
CREATE TABLE `comp_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL,
  `login_pwd` varchar(50) NOT NULL,
  `department_id` int(10) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `job_id` int(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `joined_date` date DEFAULT NULL COMMENT '参加工作时间',
  `gender` varchar(10) DEFAULT NULL,
  `nation` varchar(20) DEFAULT NULL COMMENT '名族',
  `brithday` date DEFAULT NULL,
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `political_status` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `marital_status` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `graduated` varchar(20) DEFAULT NULL COMMENT '毕业院校',
  `education` varchar(10) DEFAULT NULL COMMENT '学历',
  `graduated_time` date DEFAULT NULL COMMENT '毕业时间',
  `profession` varchar(50) DEFAULT NULL,
  `hometown` varchar(50) DEFAULT NULL COMMENT '户口所在地',
  `work_time` date DEFAULT NULL COMMENT '参加工作时间',
  `native_place` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `now_home` varchar(50) DEFAULT NULL COMMENT '现住地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '电子信箱',
  `urgency_name` varchar(20) DEFAULT NULL COMMENT '紧急联系人姓名',
  `urgency_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `content` varchar(100) DEFAULT NULL COMMENT '备注',
  `work_num` varchar(100) DEFAULT NULL COMMENT '工号',
  `account_num` varchar(100) DEFAULT NULL COMMENT '银行账号',
  `pc_code` varchar(100) DEFAULT NULL COMMENT '电脑代码',
  `phone_extension` varchar(100) DEFAULT NULL COMMENT '电话分机',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `update_datetime` datetime NOT NULL COMMENT '修改时间(离职时间)',
  `referee` varchar(50) DEFAULT NULL COMMENT '推荐人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_user
-- ----------------------------
INSERT INTO `comp_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', '管理员', '启用', '2014-03-02', null, null, null, null, null, null, '*******大学', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-02-07 11:28:47', '2017-02-08 11:28:56', '张三');
INSERT INTO `comp_user` VALUES ('8', '郭彦敏', 'e10adc3949ba59abbe56e057f20f883e', '11', '15', '4', '郭彦敏', '启用', '2016-07-12', '女', null, '1987-08-06', '372901198708063208', null, null, '*******大学', '大专', null, null, null, null, '山东********', null, '152********', '2696185@qq.com', '付**', '185********', null, '23', '12344543654365', '', '', '2017-04-12 15:14:27', '2017-06-07 15:14:27', '张三');
INSERT INTO `comp_user` VALUES ('9', '郭梦秋', 'e10adc3949ba59abbe56e057f20f883e', '12', '15', '4', '郭梦秋', '启用', '2016-02-15', '女', null, '1992-09-02', '320381199309024466', null, null, '*******大学', '大专', null, null, null, null, '江苏********', null, '152********', '1939800@qq.com', '紧**', '159********', null, '19', '34532654365436545', '', '', '2017-04-12 15:23:18', '2017-04-12 15:23:18', null);
INSERT INTO `comp_user` VALUES ('10', '王焱', 'c4ca4238a0b923820dcc509a6f75849b', '13', '15', '4', '王焱', '离职', '2017-04-26', '女', null, '1994-04-12', '130824199404124021', null, null, '*******大学', '本科', null, null, null, null, '河北********', null, '187********', '1332019@qq.com', '李**', '187********', '', '46', '23453264365436', '', '', '2017-04-12 15:27:07', '2017-06-08 00:00:00', '张三');
INSERT INTO `comp_user` VALUES ('80', 'zhangwuji', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '张无忌', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '24', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:09', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('81', 'zhangsanfen', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '张三丰', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '25', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:09', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('82', 'zhangcuishan', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '张翠山', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '26', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:09', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('83', 'songyuanqiao', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '宋远桥', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '27', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:09', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('84', 'fdksadfasdf', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '张三峰', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '28', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:09', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('85', 'asfdasf', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '陆小凤', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '29', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:10', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('86', '12125454787', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '花满楼', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '30', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:10', '2017-07-10 00:00:00', '张三丰');
INSERT INTO `comp_user` VALUES ('87', '4548784asdf', 'e10adc3949ba59abbe56e057f20f883e', '26', '19', '6', '江流儿', '启用', '2017-06-29', '男', '汉', '1991-04-22', '130121199104221818', '群众', '否', '*******大学', '本科', '2011-06-01', '计算机科学与技术', '石家庄', '2014-04-22', '河北********', '北京海淀', '137********', 'lxy1371@qq.com', '紧**', '133********', 'a', '31', '11445522554455', 'pc110', '2372110', '2017-07-10 10:32:10', '2017-07-10 00:00:00', '张三丰');


-- ----------------------------
-- Table structure for comp_user_more
-- ----------------------------
DROP TABLE IF EXISTS `comp_user_more`;
CREATE TABLE `comp_user_more` (
  `user_id` int(10) NOT NULL,
  `entry_time` date NOT NULL COMMENT '入职时间',
  `regular_time` date NOT NULL COMMENT '转正日期',
  `pack_deadline` date NOT NULL COMMENT '合同截止日期',
  `pack_another` date NOT NULL COMMENT '续签时间',
  `salary_for_test` double(10,2) NOT NULL COMMENT '试用期薪资',
  `salary_for_regular` double(10,2) NOT NULL COMMENT '转正薪资',
  `raises_time` date NOT NULL COMMENT '加薪日期',
  `content` varchar(100) NOT NULL COMMENT '备注',
  `resume` varchar(10) NOT NULL COMMENT '个人简历',
  `job_hunter_reg` varchar(10) NOT NULL COMMENT '求职人员在登记表',
  `audition_score` varchar(10) NOT NULL COMMENT '面试评分表',
  `id_copy` varchar(10) NOT NULL COMMENT '身份证复印件',
  `education_copy` varchar(10) NOT NULL COMMENT '学历证复印件',
  `pack` varchar(10) NOT NULL COMMENT '聘用协议',
  `secrecy` varchar(10) NOT NULL COMMENT '保密承诺书',
  `regular` varchar(10) NOT NULL COMMENT '转正审批表',
  `change_title` varchar(10) NOT NULL COMMENT '职务变更审批表',
  `change_salary` varchar(10) NOT NULL COMMENT '工资变更审批表',
  `pack_long` varchar(10) NOT NULL COMMENT '员工续签合同申请表',
  `content2` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_user_more
-- ----------------------------

-- ----------------------------
-- Table structure for comp_work
-- ----------------------------
DROP TABLE IF EXISTS `comp_work`;
CREATE TABLE `comp_work` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '工作编号',
  `customer_id` int(10) NOT NULL COMMENT '客户编号',
  `business_type` varchar(50) DEFAULT '' COMMENT '业务类型',
  `department_id` int(10) DEFAULT NULL COMMENT '部门id',
  `owner_user` varchar(50) DEFAULT NULL COMMENT '任务所属人',
  `remark` varchar(20) DEFAULT NULL COMMENT '备注(任务进度)',
  `status` int(5) DEFAULT NULL COMMENT '任务状态 :0未完成,1为完成,2已生成合同',
  `create_time` datetime DEFAULT NULL,
  `task_time` datetime DEFAULT NULL COMMENT '任务完成的截止时间',
  `finish_time` datetime DEFAULT NULL COMMENT '任务完成时间',
  `number` int(5) DEFAULT NULL COMMENT '第几次分配任务',
  `safe_status` int(5) DEFAULT NULL COMMENT '是否为安全的（是否在保护期）:0不安全，1为安全',
  PRIMARY KEY (`id`),
  KEY `work_owner_user` (`owner_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_work
-- ----------------------------
INSERT INTO `comp_work` VALUES ('117', '150', '高新', '11', '郭彦敏', null, '0', '2017-07-10 16:53:07', '2017-07-25 16:53:07', null, '1', '0');
INSERT INTO `comp_work` VALUES ('118', '153', '高新', '12', '王子铮', null, '0', '2017-07-10 16:57:14', '2017-07-25 16:57:14', null, '1', '0');
INSERT INTO `comp_work` VALUES ('119', '154', '高新', '12', '张秀辉', null, '0', '2017-07-10 16:57:32', '2017-07-25 16:57:32', null, '1', '0');
INSERT INTO `comp_work` VALUES ('120', '156', '商标', '12', '张秀辉', null, '0', '2017-07-10 16:57:32', '2017-07-15 16:57:32', null, '1', '0');
INSERT INTO `comp_work` VALUES ('121', '157', '商标', '12', '张秀辉', null, '0', '2017-07-10 16:57:32', '2017-07-15 16:57:32', null, '1', '0');
INSERT INTO `comp_work` VALUES ('122', '161', '高新', '21', '李艳云', null, '0', '2017-07-10 16:57:50', '2017-07-25 16:57:50', null, '1', '0');
INSERT INTO `comp_work` VALUES ('123', '162', '高新', '21', '李艳云', null, '0', '2017-07-10 16:57:50', '2017-07-25 16:57:50', null, '1', '0');
INSERT INTO `comp_work` VALUES ('124', '163', '高新', '21', '李艳云', null, '0', '2017-07-10 16:57:50', '2017-07-25 16:57:50', null, '1', '0');
INSERT INTO `comp_work` VALUES ('125', '164', '商标', '21', '李艳云', null, '0', '2017-07-10 16:57:50', '2017-07-15 16:57:50', null, '1', '0');
INSERT INTO `comp_work` VALUES ('128', '294', '专利', '12', '郭梦秋', null, '0', '2017-07-10 17:18:24', '2017-07-19 17:18:24', null, '1', '0');
INSERT INTO `comp_work` VALUES ('129', '295', '专利', '12', '郭梦秋', null, '0', '2017-07-10 17:18:24', '2017-07-19 17:18:24', null, '1', '0');
INSERT INTO `comp_work` VALUES ('130', '296', '高新', '12', '郭梦秋', null, '0', '2017-07-10 17:18:24', '2017-07-19 17:18:24', null, '1', '0');
INSERT INTO `comp_work` VALUES ('131', '301', '其他', '12', '郭梦秋', null, '1', '2017-07-10 17:18:24', '2017-07-19 17:18:24', '2017-08-02 14:04:11', '1', '0');
INSERT INTO `comp_work` VALUES ('132', '303', '专利', '12', '郭梦秋', null, '0', '2017-07-10 17:18:24', '2017-07-19 17:18:24', null, '1', '0');

-- ----------------------------
-- Table structure for comp_worklog
-- ----------------------------
DROP TABLE IF EXISTS `comp_worklog`;
CREATE TABLE `comp_worklog` (
  `work_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `cdtime` datetime NOT NULL COMMENT '截止时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comp_worklog
-- ----------------------------
INSERT INTO `comp_worklog` VALUES ('1', '1', '已打款，正在开发票', '2016-11-12 00:00:00', '2013-12-26 12:25:58');

-- ----------------------------
-- Table structure for transfer_work_rule
-- ----------------------------
DROP TABLE IF EXISTS `transfer_work_rule`;
CREATE TABLE `transfer_work_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `now_department_id` int(5) NOT NULL COMMENT '当前部门id',
  `next_department_id` int(10) NOT NULL COMMENT '转到下一个部门的id',
  `order_num` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='重新分配过期任务的规则';

-- ----------------------------
-- Records of transfer_work_rule
-- ----------------------------
INSERT INTO `transfer_work_rule` VALUES ('1', '11', '12', '1');
INSERT INTO `transfer_work_rule` VALUES ('2', '12', '13', '2');
INSERT INTO `transfer_work_rule` VALUES ('3', '13', '11', '3');
