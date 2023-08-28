/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : flyclass

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2021-06-03 13:10:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '分类名称',
  `weight` int(11) DEFAULT NULL COMMENT '权重，数字越大权重越高',
  `create_time` datetime DEFAULT NULL,
  `delete` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '黑客和画家', '432', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('2', '前端生活', '23', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('3', '人工智能', '342', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('4', '自动化测试', '44', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('5', '大数据', '4', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('6', 'Java进阶', '3213', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('7', '网络安全', '3231', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('8', '后端架构', '32431', '2021-06-01 09:00:00', '0');
INSERT INTO `category` VALUES ('9', 'dsafsaf', '0', '2021-06-03 01:13:23', '0');
INSERT INTO `category` VALUES ('10', 'asdf', '0', '2021-06-03 01:13:25', '0');
INSERT INTO `category` VALUES ('11', 'fbdbsd', '0', '2021-06-03 01:13:27', '0');
INSERT INTO `category` VALUES ('12', '23', '23', '2021-06-03 10:12:49', '0');
INSERT INTO `category` VALUES ('13', '324', '234', '2021-06-03 10:13:08', '0');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL COMMENT '楼层编号，回复是不能删除的',
  `content` varchar(524) DEFAULT NULL COMMENT '回复内容',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '回复人名称',
  `user_img` varchar(128) DEFAULT NULL COMMENT '回复人头像',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete` int(11) DEFAULT NULL COMMENT '0是正常，1是禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('24', '22', '1', '你以后面试说你5年经验，加班加的', '17', '小姐姐', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/14.jpeg', '2021-06-01 21:21:31', '2021-06-01 21:21:31', '0');
INSERT INTO `reply` VALUES ('25', '22', '2', '身体重要啊，少撸管', '17', '张飞', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/13.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('26', '22', '3', '加班努力付出', '17', '刘备', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/15.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('27', '22', '4', '重新找过，年轻怕啥', '17', '关羽', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('28', '22', '5', '给多少钱你就去了？', '17', '吕布', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('29', '22', '6', '重新找过，年轻怕啥', '17', '关羽', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('30', '22', '7', '来我这边把，大量招聘', '17', '曹操', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('31', '21', '8', '真逗啊，你这样发问题', '17', '曹操', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2021-06-01 21:22:44', '2021-06-01 21:22:44', '0');
INSERT INTO `reply` VALUES ('32', '22', '8', '加班多久呢? 我这边也加班', '18', '大当家', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/13.jpeg', '2021-06-01 21:38:23', '2021-06-01 21:38:23', '0');
INSERT INTO `reply` VALUES ('33', '22', '9', '66666', '18', '大当家', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/13.jpeg', '2021-06-01 21:39:13', '2021-06-01 21:39:13', '0');
INSERT INTO `reply` VALUES ('35', '21', '9', 'ewrr', '23', '666', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/f645fa68be443488d73c28dad2526e25.jpeg', '2021-06-01 11:48:55', '2021-06-01 11:48:55', '0');
INSERT INTO `reply` VALUES ('36', '21', '10', 'qrqwer w', '23', '666', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/f645fa68be443488d73c28dad2526e25.jpeg', '2021-06-01 11:48:59', '2021-06-01 11:48:59', '0');
INSERT INTO `reply` VALUES ('37', '45', '1', 'wdaw', '23', '666', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/f645fa68be443488d73c28dad2526e25.jpeg', '2021-06-02 00:15:37', '2021-06-02 00:15:37', '0');
INSERT INTO `reply` VALUES ('38', '57', '1', '', '15', 'cc小天才', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/14.jpeg', '2021-06-02 15:52:28', '2021-06-02 15:52:28', '0');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL COMMENT '分类',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `pv` int(11) DEFAULT NULL COMMENT '浏览量',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `user_img` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `hot` int(2) DEFAULT '0' COMMENT '是否热门 1是热门',
  `delete` int(11) DEFAULT '0' COMMENT '0是未删除，1是已经删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('20', '1', '我是传统IT公司，想转行互联网公司怎么办？', '以前是传统IT公司，想转行互联网公司怎么办？谁可以告诉我', '6', '17', '小姐姐', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/14.jpeg', '2021-06-01 21:09:52', '2021-06-01 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('21', '1', 'DDOS流量攻击怎么防止', '网络带宽被别人占据了，没法上网', '48', '1', 'cc小天才', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/13.jpeg', '2021-06-01 21:09:52', '2021-06-01 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('22', '1', '你对加班的是怎么看的？', '自己也会合理评估工作，提高个人工作效率', '7', '17', '刘备', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/14.jpeg', '2020-06-03 21:09:52', '2021-06-01 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('23', '1', '被压在五指山上了咋办', '我被别人压在五指山上了，怎么救我，我免费教你打怪', '32', '17', '孙悟空', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/16.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('24', '6', '拿到面试通知，互联网公司都有多轮面试，怎么准备', '谁有简历模板', '33', '4', '小明', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('25', '1', '社招流程是怎么样的', '明天要参加社招，流程是咋样的', '42', '4', '中山大学-西欧', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('26', '6', '技术现场面试', '如果同城一般直接现场面试吗', '32', '4', '路飞', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('27', '6', '网站被人挖矿了怎么办', '电脑被人安装挖矿程序了，谁知道怎么解决啊', '2', '17', '张飞', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/16.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('28', '1', '被压在五指山上了咋办', '我被别人压在五指山上了，怎么救我，我免费教你打怪', '32', '17', '隔壁老王', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/17.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('29', '1', '要求有3年经验，可是我只有1~2年怎么办？', '只能靠加班吗', '32', '4', '雅力士', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('30', '6', '内推的岗位多种，实习和非实习(正式工作)', '谁可以帮我内推', '33', '4', '小明', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('31', '6', '要有礼貌，保持头脑清晰', '要有礼貌，保持头脑清晰有帮助吗', '33', '4', '小明', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('32', '1', '为什么说会被技术官完虐，怎样避免', '校招+社招考查点很多，记不住', '3', '17', '刘冰', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/15.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('33', '1', '为什么从上个公司离职？', '不能说不好的，比如公司混乱、勾心斗角、负面情', '3', '17', '还珠格格', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('34', '6', '做下简单的自我介绍？', '尽量介绍和专业相关的，毕业、工作经历等', '33', '4', '小明', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('35', '1', '要求本科，但我是大专学历不符合怎么办？', '大专学历不符合怎么办？', '3', '17', '关羽', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/12.jpeg', '2020-06-03 21:09:52', '2020-06-03 21:09:52', '0', '0');
INSERT INTO `topic` VALUES ('37', '3', '正确实现用 spring 扫描自定义的 annotation', '我要学习', '1', '17', '小姐姐', 'https://xd-video-pc-img.oss-cn-beijing.aliyuncs.com/xdclass_pro/default/head_img/14.jpeg', '2020-06-03 21:55:11', '2020-06-03 21:55:11', '0', '0');
INSERT INTO `topic` VALUES ('67', '6', '3c课堂', '<p><img alt=\"Image\" src=\"img/a9.jpg\" data-image-size=\"101,50\" width=\"0\" height=\"0\"><br></p><p><img alt=\"Image\" src=\"img/a9.jpg\" data-image-size=\"101,50\"><br></p>', '2', '19', '321', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/7c2a556066c1419587f1397f41e60531.jpeg', '2021-06-03 02:11:10', '2021-06-03 02:11:10', '0', '0');
INSERT INTO `topic` VALUES ('68', '7', '22131232131', '<p><img alt=\"Image\" src=\"img/a9.jpg\" data-image-size=\"256,126\"><br></p><p><img alt=\"Image\" src=\"img/a9.jpg\" data-image-size=\"256,126\"><br></p>', '1', '19', '321', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/7c2a556066c1419587f1397f41e60531.jpeg', '2021-06-03 02:21:38', '2021-06-03 02:21:38', '0', '0');
INSERT INTO `topic` VALUES ('69', '7', 'sadfasf', '<p>asdfafasfasf</p>', '1', '19', '321', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/7c2a556066c1419587f1397f41e60531.jpeg', '2021-06-03 09:46:12', '2021-06-03 09:46:12', '0', '0');
INSERT INTO `topic` VALUES ('70', '8', '安放水电费第三方', '<blockquote><p>阿斯顿发防守打法</p></blockquote><p><i>阿斯顿发</i></p>', '2', '72', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/16218212847645048.jpg', '2021-06-03 10:29:39', '2021-06-03 10:29:39', '0', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) DEFAULT NULL,
  `pwd` varchar(128) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL COMMENT '0是女，1是男，2未知',
  `img` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `role` int(11) DEFAULT NULL COMMENT '1是普通用户，2是管理员',
  `username` varchar(128) DEFAULT NULL,
  `delete` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('19', '321', 'CAF1A3DFB505FFED0D024130F58C5CFA', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/7c2a556066c1419587f1397f41e60531.jpeg', '2021-06-01 11:46:12', '2', '321', '0');
INSERT INTO `user` VALUES ('52', '123', '979D472A84804B9F647BC185A877A8B5', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/f645fa68be443488d73c28dad2526e25.jpeg', '2021-06-03 10:07:43', '1', '123', '0');
INSERT INTO `user` VALUES ('54', '21', '3C59DC048E8850243BE8079A5C74D079', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/v2-ad1e1c9fc7bc6a3f0e10b2129991deeb_r.jpg', '2021-06-03 10:07:50', '1', '12', '0');
INSERT INTO `user` VALUES ('65', '12', 'C20AD4D76FE97759AA27A0C99BFF6710', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/16218212686675093.jpg', '2021-06-03 10:13:40', '2', 'xie', '0');
INSERT INTO `user` VALUES ('66', '213', '202CB962AC59075B964B07152D234B70', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/16218212686675093.jpg', '2021-06-03 10:13:51', '1', '213', '0');
INSERT INTO `user` VALUES ('68', '342', 'F2FC990265C712C49D51A18A32B39F0C', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/f645fa68be443488d73c28dad2526e25.jpeg', '2021-06-03 10:13:58', '1', '321', '0');
INSERT INTO `user` VALUES ('69', 'g', 'B2F5FF47436671B6E533D8DC3614845D', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/16218212686675093.jpg', '2021-06-03 10:14:04', '1', '5', '0');
INSERT INTO `user` VALUES ('70', 'sfg', 'A168AEF37C5374BC151790DCE45FAE47', '1', 'https://ccclass.oss-cn-beijing.aliyuncs.com/image_user/v2-ad1e1c9fc7bc6a3f0e10b2129991deeb_r.jpg', '2021-06-03 10:14:07', '1', 'sfdg', '0');
