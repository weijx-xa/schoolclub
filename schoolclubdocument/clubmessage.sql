/*
Navicat MySQL Data Transfer

Source Server         : watermelon
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : schoolclub

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-12-29 17:28:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clubmessage`
-- ----------------------------
DROP TABLE IF EXISTS `clubmessage`;
CREATE TABLE `clubmessage` (
  `clubmessageid` int(11) NOT NULL AUTO_INCREMENT,
  `clubmessagetime` varchar(20) DEFAULT NULL,
  `clubmessagecontent` varchar(50) DEFAULT NULL,
  `clubid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`clubmessageid`),
  KEY `FK_Reference_5` (`clubid`),
  KEY `userid` (`userid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`clubid`) REFERENCES `t_club` (`clubid`),
  CONSTRAINT `clubmessage_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=100089 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clubmessage
-- ----------------------------
INSERT INTO `clubmessage` VALUES ('100001', '2016-12-01 19:38:21', '欢迎大家来到江西师范大学吧，这里是师大人交流情感、增进友谊、互帮互助的平台', '1', '1');
INSERT INTO `clubmessage` VALUES ('100002', '2016-12-23 19:40:26', '本帖包括江西师大吧吧规，以及本吧在用的专贴链接', '1', '2');
INSERT INTO `clubmessage` VALUES ('100003', '2016-12-23 19:40:34', '禁止以任何形式造谣、诽谤、诋毁、诅咒、人身攻击、嘲讽他人或组织，删除并封禁处理，披露贴要写明楼主身份', '1', '3');
INSERT INTO `clubmessage` VALUES ('100004', '2016-12-16 19:41:19', '禁止随意发广告贴（本吧有提供专贴），违者删除处理，多次劝告无效者封禁处理', '1', '4');
INSERT INTO `clubmessage` VALUES ('100005', '2016-12-09 19:41:24', '造谣生事，诽谤诬陷，讨论吧友隐私、暴露吧友隐私等。删帖并根据当事人要求选择封ID一天', '1', '5');
INSERT INTO `clubmessage` VALUES ('100006', '2016-12-09 19:41:55', '性质恶劣的黑名单处理同时封号三天，由此内容带来的一切后果由发帖人自负', '1', '6');
INSERT INTO `clubmessage` VALUES ('100007', '2016-12-15 19:42:04', '无论是因为网络问题，还是刻意而发的重复贴，都要删除', '1', '7');
INSERT INTO `clubmessage` VALUES ('100008', '2016-12-16 19:42:32', '本吧谢绝为凑十五字而复制粘贴的回帖，发现多次封一天', '1', '8');
INSERT INTO `clubmessage` VALUES ('100009', '2016-12-23 19:42:42', '为刷经验的标题党、日经党、及其他无意义水贴党（如空白或纯表情帖等），', '1', '9');
INSERT INTO `clubmessage` VALUES ('100010', '2016-12-23 19:43:07', '恶心、血腥、暴力、色情相关帖必删，情节严重者封禁处理', '1', '10');
INSERT INTO `clubmessage` VALUES ('100011', '2016-12-24 19:43:14', '（如空白或纯表情帖等），', '1', '11');
INSERT INTO `clubmessage` VALUES ('100077', '2016-12-28 14:21:44', '这社团真不错啊啊', '1', '1');
INSERT INTO `clubmessage` VALUES ('100078', '2016-12-28 14:29:50', '你说啥', '1', '1');
INSERT INTO `clubmessage` VALUES ('100079', '2016-12-28 14:31:06', '我我我', '1', '1');
INSERT INTO `clubmessage` VALUES ('100080', '2016-12-28 14:32:45', '啥啊', '1', '1');
INSERT INTO `clubmessage` VALUES ('100081', '2016-12-28 14:33:57', 'sssss', '1', '1');
INSERT INTO `clubmessage` VALUES ('100082', '2016-12-28 14:51:02', 'fff', '1', '1');
INSERT INTO `clubmessage` VALUES ('100083', '2016-12-28 14:51:55', 'wwww', '1', '1');
INSERT INTO `clubmessage` VALUES ('100084', '2016-12-28 18:18:39', 'gdrrgre', '1', '1');
INSERT INTO `clubmessage` VALUES ('100085', '2016-12-28 18:18:40', '', '1', '1');
INSERT INTO `clubmessage` VALUES ('100086', '2016-12-28 18:18:44', 'gregre', '1', '1');
INSERT INTO `clubmessage` VALUES ('100087', '2016-12-28 19:38:02', '终于做完了=  =', '1', '1');
INSERT INTO `clubmessage` VALUES ('100088', '2016-12-28 21:19:49', '好社团啊   ', '7', '1');

-- ----------------------------
-- Table structure for `postmessage`
-- ----------------------------
DROP TABLE IF EXISTS `postmessage`;
CREATE TABLE `postmessage` (
  `postmessageid` int(11) NOT NULL,
  `postmessagetime` datetime DEFAULT NULL,
  `postmessagecontent` varchar(50) DEFAULT NULL,
  `postid` int(11) DEFAULT NULL,
  PRIMARY KEY (`postmessageid`),
  KEY `FK_Reference_6` (`postid`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`postid`) REFERENCES `t_post` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postmessage
-- ----------------------------
INSERT INTO `postmessage` VALUES ('1000001', '2016-12-01 19:44:17', '中国科学技术期刊编辑学会', '1111001');
INSERT INTO `postmessage` VALUES ('1000002', '2016-12-01 19:45:45', '中国高校科技期刊研究会、全国高等学校文科学报研究会', '1111001');
INSERT INTO `postmessage` VALUES ('1000003', '2016-12-01 19:45:53', '转型融合提升国际竞力    服务创新重塑市场主体', '1111001');
INSERT INTO `postmessage` VALUES ('1000004', '2016-12-01 19:46:25', '“2016中国学术期刊未来论坛”在北京会议中心成功召开', '1111001');
INSERT INTO `postmessage` VALUES ('1000005', '2016-12-02 19:46:31', '同方知网承办的“中国学术期刊未来论坛”在北京会议中心隆重举行', '1111001');
INSERT INTO `postmessage` VALUES ('1000006', '2016-12-03 19:47:33', '力    服务创新重塑市场主体', '1111002');
INSERT INTO `postmessage` VALUES ('1000007', '2016-12-22 19:47:56', '着力宣传长征胜利的历史意义及在新时期继承和发扬长征精神的现实意义', '1111002');
INSERT INTO `postmessage` VALUES ('1000008', '2016-12-22 19:48:35', '活动开展以来，得到了全国各地网民的积极响应，共计收到各类作品437件', '1111002');
INSERT INTO `postmessage` VALUES ('1000009', '2016-12-22 19:48:51', '最终评出一等奖作品10件，二等奖作品20件，三等奖作品30件，纪念奖作品67件', '1111002');
INSERT INTO `postmessage` VALUES ('1000010', '2016-12-22 19:49:13', '最终评出一等奖作品10件，二等奖作品20件，三等奖作品30件，纪念奖作品67件', '1111002');

-- ----------------------------
-- Table structure for `t_activityimg`
-- ----------------------------
DROP TABLE IF EXISTS `t_activityimg`;
CREATE TABLE `t_activityimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` int(11) NOT NULL,
  `activityImg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activityId` (`activityId`),
  CONSTRAINT `activityId` FOREIGN KEY (`activityId`) REFERENCES `t_clubactivities` (`clubactivitiesid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activityimg
-- ----------------------------
INSERT INTO `t_activityimg` VALUES ('1', '1001', 'activity/huodong1.jpg');
INSERT INTO `t_activityimg` VALUES ('2', '1002', 'activity/huodong2.jpg');
INSERT INTO `t_activityimg` VALUES ('3', '1003', 'activity/huodong3.jpg');
INSERT INTO `t_activityimg` VALUES ('4', '1004', 'activity/huodong4.jpg');
INSERT INTO `t_activityimg` VALUES ('5', '1005', 'activity/huodong1.jpg');
INSERT INTO `t_activityimg` VALUES ('6', '1006', 'activity/huodong2.jpg');
INSERT INTO `t_activityimg` VALUES ('7', '1007', 'activity/huodong3.jpg');
INSERT INTO `t_activityimg` VALUES ('8', '1008', 'activity/huodong4.jpg');
INSERT INTO `t_activityimg` VALUES ('9', '1009', 'activity/huodong1.jpg');
INSERT INTO `t_activityimg` VALUES ('10', '1010', 'activity/huodong2.jpg');
INSERT INTO `t_activityimg` VALUES ('11', '1001', 'activity/huodong3.jpg');
INSERT INTO `t_activityimg` VALUES ('12', '1001', 'activity/huodong4.jpg');
INSERT INTO `t_activityimg` VALUES ('13', '1001', 'activity/huodong1.jpg');
INSERT INTO `t_activityimg` VALUES ('14', '1001', 'activity/huodong2.jpg');
INSERT INTO `t_activityimg` VALUES ('15', '1001', 'activity/huodong3.jpg');

-- ----------------------------
-- Table structure for `t_attention`
-- ----------------------------
DROP TABLE IF EXISTS `t_attention`;
CREATE TABLE `t_attention` (
  `userid` int(11) DEFAULT NULL,
  `attentiontime` varchar(20) DEFAULT NULL,
  `attentionid` int(11) NOT NULL,
  `clubactivitesid` int(11) DEFAULT NULL,
  PRIMARY KEY (`attentionid`),
  KEY `FK_Reference_11` (`clubactivitesid`),
  KEY `FK_Reference_12` (`userid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`clubactivitesid`) REFERENCES `t_clubactivities` (`clubactivitiesid`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attention
-- ----------------------------
INSERT INTO `t_attention` VALUES ('1', '2016-12-22 19:04:51', '11001', '1001');
INSERT INTO `t_attention` VALUES ('1', '2016-12-23 19:04:55', '11002', '1002');
INSERT INTO `t_attention` VALUES ('1', '2016-12-24 19:04:59', '11003', '1003');
INSERT INTO `t_attention` VALUES ('2', '2016-12-01 19:05:03', '11004', '1001');
INSERT INTO `t_attention` VALUES ('2', '2016-12-02 19:05:07', '11005', '1002');
INSERT INTO `t_attention` VALUES ('2', '2016-12-03 19:05:12', '11006', '1003');
INSERT INTO `t_attention` VALUES ('3', '2016-12-04 19:05:16', '11007', '1001');
INSERT INTO `t_attention` VALUES ('3', '2016-12-05 19:05:21', '11008', '1002');
INSERT INTO `t_attention` VALUES ('3', '2016-12-06 19:05:27', '11009', '1003');
INSERT INTO `t_attention` VALUES ('4', '2016-12-07 19:05:31', '11010', '1001');
INSERT INTO `t_attention` VALUES ('4', '2016-12-08 19:05:35', '11011', '1002');
INSERT INTO `t_attention` VALUES ('4', '2016-12-10 19:05:40', '11012', '1003');

-- ----------------------------
-- Table structure for `t_club`
-- ----------------------------
DROP TABLE IF EXISTS `t_club`;
CREATE TABLE `t_club` (
  `clubid` int(11) NOT NULL AUTO_INCREMENT,
  `clubname` varchar(30) DEFAULT NULL,
  `clubaccount` varchar(20) DEFAULT NULL,
  `clubpassword` varchar(20) DEFAULT NULL,
  `clubbriefintro` varchar(50) DEFAULT NULL,
  `clubcover` varchar(50) DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  `clubProperty` varchar(20) DEFAULT NULL,
  `pushNum` int(10) DEFAULT NULL,
  PRIMARY KEY (`clubid`),
  KEY `FK_Reference_4` (`schoolid`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`schoolid`) REFERENCES `t_school` (`schoolid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_club
-- ----------------------------
INSERT INTO `t_club` VALUES ('1', '羽毛球协会', '123123@qq.com', '123123', '源远流长,博大精深', 'club/club1.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('2', '足球社', '123123@qq.com', '123123', '国足未来', 'club/club2.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('3', '蓝天环保社团', '123123@qq.com', '123123', '蓝天，白云', 'club/club3.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('4', '青年马克思主义发展研究会', '123123@qq.com', '123123', '马克思', 'club/club4.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('5', '\"三国\"研究会', '123123@qq.com', '123123', '三国', 'club/club5.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('6', '跆拳道', '123123@qq.com', '123123', '热爱祖国,热爱人民,热爱中国共产党', 'club/club6.png', '1', '校级社团', '13');
INSERT INTO `t_club` VALUES ('7', '健美操协会', '123123@qq.com', '123123', '健美，健康与美丽', 'club/club7.png', '1', '校级社团', '2');
INSERT INTO `t_club` VALUES ('8', '幻影轮滑社', '123123@qq.com', '123123', '秀的是精彩，展现青春', 'club/club8.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('9', '法学社', '123123@qq.com', '123123', '学法知法守法', 'club/club9.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('10', '心理协会', '123123@qq.com', '123123', '健康心理，健康成长，希望人生', 'club/club10.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('11', '青蓝文学社', '123123@qq.com', '123123', '文学与生活', 'club/club11.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('12', '演辩协会', '123123@qq.com', '123123', '口才与表演', 'club/club12.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('13', '国际交流联谊社', '123123@qq.com', '123123', '国际交流', 'club/club1.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('14', '外语爱好者协会', '123123@qq.com', '123123', '学习外语，发展兴趣，拓展技能', 'club/club2.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('15', '外语话剧社', '123123@qq.com', '123123', '话剧与外语的约会', 'club/club3.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('16', '动漫协会', '123123@qq.com', '123123', '创意融入生活', 'club/club4.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('17', '旅行者社团', '123123@qq.com', '123123', '世界这么大，我想去看看', 'club/club5.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('18', '吉他协会', '123123@qq.com', '123123', '丰富校园生活,推广音乐文化, 学才共进', 'club/club6.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('20', '九天跆拳道社', '123123@qq.com', '123123', '礼仪廉耻 忍耐克己 百折不屈', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('21', '教育研究社', '123123@qq.com', '123123', '未来在于青少年一代，在于教书育人', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('22', '数学建模协会', '123123@qq.com', '123123', '数学建模协会在数学与统计学院是一个科研学术性质的社团', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('23', '市场营销俱乐部', '123123@qq.com', '123123', '着力于打造一个学习、交流、交友、交换客户信息的平台，致力于提高营销人本身的工', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('24', '大学生职业发展协会', '123123@qq.com', '123123', '为学生提供就业信息和就业指导。协会的宗旨服务广大同学，提升就业能力', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('25', '学生京剧团', '123123@qq.com', '123123', '京剧，作为丰富多彩的戏曲代表，被称为中国的国粹。它是我国古老而又高雅的传统文学艺术', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('26', '大学生艺术团', '123123@qq.com', '123123', '倡导校园主流文化,丰富学生课外艺术教育和业余文化生活,活跃人文气氛', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('27', '女大学生军乐团', '123123@qq.com', '123123', '我国高校第一支女大学生军乐团，也是江西省第一支女子军乐团', 'club/club7.png', '1', '校级社团', '1');
INSERT INTO `t_club` VALUES ('28', '国旗班', '123123@qq.com', '123123', '不爱红妆，爱军装。穿上军装的她们，高大，帅气', 'club/club7.png', '1', '校级社团', '1');

-- ----------------------------
-- Table structure for `t_clubactivitesmessage`
-- ----------------------------
DROP TABLE IF EXISTS `t_clubactivitesmessage`;
CREATE TABLE `t_clubactivitesmessage` (
  `clubactivitesmessageid` int(11) NOT NULL,
  `clubactivitesmessagetime` varchar(20) DEFAULT NULL,
  `clubactivitesmessagecontent` varchar(50) DEFAULT NULL,
  `clubactivitesid` int(11) DEFAULT NULL,
  PRIMARY KEY (`clubactivitesmessageid`),
  KEY `FK_Reference_10` (`clubactivitesid`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`clubactivitesid`) REFERENCES `t_clubactivities` (`clubactivitiesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_clubactivitesmessage
-- ----------------------------
INSERT INTO `t_clubactivitesmessage` VALUES ('10000001', '2016-12-15 19:51:14', '唯一收录专家组对该项成果的推广应用前景与措施、主要技术文件目录及来源', '1008');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000002', '2016-12-15 19:52:47', '测试报告和鉴定意见等内容的鉴定数据。与通常的科技成果数据库相比', '1008');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000003', '2016-12-15 19:52:51', '《中国科技项目创新成果鉴定意见数据库（知网版）》每项成果的知网节集成了与该成果相关的最新文献', '1009');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000004', '2016-12-09 19:53:37', '可以完整地展现该成果产生的背景、最新发展动态、相关领域的发展趋势', '1010');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000005', '2016-12-08 19:53:42', '可以浏览成果完成人和成果完成机构更多的论述以及在各种出版物上发表的文献。', '1011');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000006', '2016-12-07 19:54:17', '按照《中国图书资料分类法》（第四版）和GB/T13745《学科分类与代码》进行学科分类', '1012');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000007', '2016-12-13 19:54:25', '从1978年至今的科技成果，部分成果回溯至1920年。', '1001');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000008', '2016-12-01 19:55:00', '目前，《中国科技项目创新成果鉴定意见数据库（知网版）》共计收录科技成果741,471项。', '1002');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000009', '2016-12-07 19:55:05', 'WEB 版（网上包库）、镜像站版、流量计费', '1003');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000010', '2016-12-15 19:55:34', '《中国学术期刊（光盘版）》电子杂志社有限公司', '1004');
INSERT INTO `t_clubactivitesmessage` VALUES ('10000011', '2016-12-08 19:55:40', '警察职业学院学生心理健康状况及人格特征测查研究', '1005');

-- ----------------------------
-- Table structure for `t_clubactivities`
-- ----------------------------
DROP TABLE IF EXISTS `t_clubactivities`;
CREATE TABLE `t_clubactivities` (
  `clubactivitiesid` int(11) NOT NULL AUTO_INCREMENT,
  `clubactivitiesname` varchar(20) DEFAULT NULL,
  `clubactivitiescontent` varchar(50) DEFAULT NULL,
  `clubactivitiesstart` datetime DEFAULT NULL,
  `clubactivitiesend` datetime DEFAULT NULL,
  `clubactivitiesimg` varchar(50) DEFAULT NULL,
  `clubposition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clubactivitiesid`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_clubactivities
-- ----------------------------
INSERT INTO `t_clubactivities` VALUES ('1001', '青春开讲啦', '青春开讲啦青春开讲啦青春开讲啦', '2016-12-20 20:17:58', '2016-12-28 20:18:58', 'activity/activity1.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1002', '十佳歌手', '十佳歌手十佳歌手十佳歌手十佳歌手', '2016-12-28 20:18:05', '2016-12-29 20:19:03', 'activity/activity2.jpg', '江西师范大学三食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1003', '女生节', '女生节女生节女生节女生节女生节', '2016-12-22 20:18:09', '2016-12-31 20:19:08', 'activity/activity3.jpg', '江西师范大学四食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1004', '辩论赛', '辩论赛辩论赛辩论赛辩论赛', '2016-12-30 20:18:13', '2016-12-31 20:19:14', 'activity/activity4.jpg', '江西师范大学五食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1005', '英语演讲比赛', '英语演讲比赛英语演讲比赛英语演讲比赛', '2016-12-30 20:18:17', '2016-12-31 20:19:17', 'activity/activity5.jpg', '江西师范大学一食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1006', '动漫cosplay', '动漫cosplay动漫cosplay动漫cosplay动漫cosplay', '2016-12-07 20:18:25', '2016-12-30 20:19:21', 'activity/activity6.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1007', '吉他表演', '吉他表演吉他表演吉他表演吉他表演', '2016-12-24 20:18:30', '2016-12-30 20:19:25', 'activity/activity7.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1008', '足球赛', '足球赛足球赛足球赛足球赛', '2016-12-02 20:18:33', '2016-12-02 20:19:33', 'activity/activity8.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1009', '军乐团节日表演', '军乐团节日表演军乐团节日表演军乐团节日表演军乐团节日表演', '2016-12-07 20:18:37', '2016-12-07 20:19:43', 'activity/activity9.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1010', '国旗班升旗仪式', '国旗班升旗仪式国旗班升旗仪式国旗班升旗仪式国旗班升旗仪式国旗班升旗仪式国旗班升旗仪式国旗班升旗仪式', '2016-12-30 20:18:42', '2016-12-30 20:19:49', 'activity/activity10.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1011', '跆拳展示', '跆拳展示跆拳展示', '2017-01-07 20:18:46', '2017-01-07 20:19:55', 'activity/activity1.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1012', '轮滑show', '轮滑show轮滑show', '2016-12-06 20:18:50', '2016-12-06 20:20:04', 'activity/activity2.jpg', '江西师范大学二食堂门口摆摊');
INSERT INTO `t_clubactivities` VALUES ('1013', '大学生创业大赛', '大学生创业大赛大学生创业大赛', '2016-12-21 20:18:54', '2016-12-21 19:20:08', 'activity/activity3.jpg', '江西师范大学二食堂门口摆摊');

-- ----------------------------
-- Table structure for `t_entryform`
-- ----------------------------
DROP TABLE IF EXISTS `t_entryform`;
CREATE TABLE `t_entryform` (
  `entryformid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `clubactivitiesid` int(11) DEFAULT NULL,
  `entrytime` datetime DEFAULT NULL,
  `jointime` datetime DEFAULT NULL,
  PRIMARY KEY (`entryformid`),
  KEY `FK_Reference_16` (`clubactivitiesid`),
  KEY `FK_Reference_17` (`userid`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`clubactivitiesid`) REFERENCES `t_clubactivities` (`clubactivitiesid`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_entryform
-- ----------------------------
INSERT INTO `t_entryform` VALUES ('10002', '2', '1001', '2016-12-30 00:00:00', '2016-12-30 00:00:00');
INSERT INTO `t_entryform` VALUES ('10003', '3', '1001', '2016-12-21 11:35:20', '2016-12-29 11:35:24');
INSERT INTO `t_entryform` VALUES ('10004', '1', '1001', '2016-12-23 11:35:56', '2016-12-31 11:36:01');
INSERT INTO `t_entryform` VALUES ('10005', '4', '1001', '2016-12-01 11:36:15', '2016-12-06 11:36:11');
INSERT INTO `t_entryform` VALUES ('10006', '5', '1001', '2016-12-07 11:36:33', '2016-12-07 11:36:37');
INSERT INTO `t_entryform` VALUES ('10007', '6', '1001', '2016-12-08 11:36:56', '2016-12-16 11:37:01');
INSERT INTO `t_entryform` VALUES ('10008', '7', '1001', '2016-12-08 11:37:13', '2016-12-14 11:37:10');
INSERT INTO `t_entryform` VALUES ('10009', '8', '1002', '2016-12-07 11:37:38', '2016-12-14 11:37:41');
INSERT INTO `t_entryform` VALUES ('10010', '9', '1002', '2016-12-20 11:38:44', '2016-12-20 11:38:44');
INSERT INTO `t_entryform` VALUES ('10011', '10', '1002', '2016-12-20 11:38:44', '2016-12-20 11:38:44');
INSERT INTO `t_entryform` VALUES ('10012', '11', '1002', '2016-12-20 11:38:44', '2016-12-20 11:38:44');
INSERT INTO `t_entryform` VALUES ('10013', '12', '1002', '2016-12-20 11:41:52', '2016-12-20 11:42:00');

-- ----------------------------
-- Table structure for `t_post`
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `postid` int(11) NOT NULL,
  `postname` varchar(20) DEFAULT NULL,
  `postcontent` varchar(50) DEFAULT NULL,
  `posttime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `FK_Reference_3` (`userid`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES ('1111001', '通知', '关于转发《2017年国家留学基金资助出国留学人员选派简章》的通知', '2016-12-22 19:29:24', '1');
INSERT INTO `t_post` VALUES ('1111002', '音乐学院召开2016年学生座谈会', '2月16日下午，为全面了解学院教学情况，提高课堂教学质量，解决教学过程中存在的问题，', '2016-12-23 19:29:55', '1');
INSERT INTO `t_post` VALUES ('1111003', '学生代表踊跃发言', '熊小玉副院长认真听取学生的意见和建议，并对学生反映的情况耐心地给予了解答，', '2016-12-15 19:30:58', '2');
INSERT INTO `t_post` VALUES ('1111004', '同学们提出的关于学校后勤管理', '教务处课程安排等问题我们将及时向学校相关部门反馈。同时，鼓励大家珍惜学习机会，', '2016-12-14 19:33:01', '3');
INSERT INTO `t_post` VALUES ('1111005', '南京大学周仁来教授做客心理学院', '南京大学的周仁来教授在图书馆报告厅6202给全体2016级新生上了一堂生动的名师导航课', '2016-12-07 19:34:16', '4');
INSERT INTO `t_post` VALUES ('1111006', '周仁来教授', '南京大学社会学院心理学系系主任、北京师范大学应用实验心理北京市重点实验室主任', '2016-12-23 19:35:57', '5');

-- ----------------------------
-- Table structure for `t_publish`
-- ----------------------------
DROP TABLE IF EXISTS `t_publish`;
CREATE TABLE `t_publish` (
  `publishid` int(11) NOT NULL,
  `clubid` int(11) DEFAULT NULL,
  `clubactivitiesid` int(11) DEFAULT NULL,
  PRIMARY KEY (`publishid`),
  KEY `FK_Reference_14` (`clubid`),
  KEY `FK_Reference_15` (`clubactivitiesid`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`clubid`) REFERENCES `t_club` (`clubid`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`clubactivitiesid`) REFERENCES `t_clubactivities` (`clubactivitiesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_publish
-- ----------------------------
INSERT INTO `t_publish` VALUES ('1', '1', '1001');
INSERT INTO `t_publish` VALUES ('2', '2', '1002');
INSERT INTO `t_publish` VALUES ('3', '3', '1003');
INSERT INTO `t_publish` VALUES ('4', '4', '1004');
INSERT INTO `t_publish` VALUES ('5', '5', '1005');
INSERT INTO `t_publish` VALUES ('6', '6', '1006');
INSERT INTO `t_publish` VALUES ('7', '7', '1007');
INSERT INTO `t_publish` VALUES ('8', '8', '1008');
INSERT INTO `t_publish` VALUES ('9', '9', '1009');
INSERT INTO `t_publish` VALUES ('10', '10', '1010');
INSERT INTO `t_publish` VALUES ('11', '11', '1011');
INSERT INTO `t_publish` VALUES ('12', '12', '1012');
INSERT INTO `t_publish` VALUES ('13', '13', '1013');
INSERT INTO `t_publish` VALUES ('14', '14', '1001');
INSERT INTO `t_publish` VALUES ('15', '15', '1002');
INSERT INTO `t_publish` VALUES ('16', '16', '1003');
INSERT INTO `t_publish` VALUES ('17', '17', '1004');
INSERT INTO `t_publish` VALUES ('18', '18', '1005');
INSERT INTO `t_publish` VALUES ('19', '1', '1006');
INSERT INTO `t_publish` VALUES ('20', '2', '1007');
INSERT INTO `t_publish` VALUES ('21', '3', '1008');
INSERT INTO `t_publish` VALUES ('22', '4', '1009');
INSERT INTO `t_publish` VALUES ('23', '5', '1010');
INSERT INTO `t_publish` VALUES ('24', '6', '1011');
INSERT INTO `t_publish` VALUES ('25', '7', '1012');
INSERT INTO `t_publish` VALUES ('26', '8', '1013');
INSERT INTO `t_publish` VALUES ('27', '9', '1001');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `replytime` datetime DEFAULT NULL,
  `replycontent` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `reuserid` int(11) DEFAULT NULL,
  `messageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`replyid`),
  KEY `FK_Reference_7` (`userid`),
  KEY `reuserid` (`reuserid`),
  KEY `messageId` (`messageId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`),
  CONSTRAINT `t_reply_ibfk_1` FOREIGN KEY (`reuserid`) REFERENCES `t_user` (`userid`),
  CONSTRAINT `t_reply_ibfk_2` FOREIGN KEY (`messageId`) REFERENCES `clubmessage` (`clubmessageid`)
) ENGINE=InnoDB AUTO_INCREMENT=10000050 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('100083', '2016-12-14 20:00:37', '对全部研究对象均调查SCL－90', '1', '2', '100083');
INSERT INTO `t_reply` VALUES ('10000001', '2016-12-30 19:57:33', '铸造工人的免疫及心理健康状况研究', '1', '2', '100001');
INSERT INTO `t_reply` VALUES ('10000003', '2016-12-23 19:58:36', '铸造工人;SCL-90;细胞因子', '3', '1', '100002');
INSERT INTO `t_reply` VALUES ('10000004', '2016-12-24 19:59:05', '尘肺病是一种不可治愈的职业病,其防治的根本措施在于预防', '4', '1', '100001');
INSERT INTO `t_reply` VALUES ('10000005', '2016-12-25 19:59:09', '该课题通过调查、分析铸造工人的细胞因子及心理健康状况,掌握铸造工人的免疫水', '5', '2', '100001');
INSERT INTO `t_reply` VALUES ('10000006', '2016-12-24 19:59:49', '平和心理健康水平,为铸工尘肺的预防提供科学依据', '6', '3', '100003');
INSERT INTO `t_reply` VALUES ('10000007', '2016-12-28 20:00:02', '该项目选择100名铸造工人为研究对象,均为男性,身体健康,既往无精神病史', '7', '4', '100004');
INSERT INTO `t_reply` VALUES ('10000008', '2017-01-06 20:00:25', '对全部研究对象均调查SCL－90', '8', '2', '100005');
INSERT INTO `t_reply` VALUES ('10000009', '2016-12-14 20:00:37', '由医生讲解填表注意事项,研究对象自填SCL－90', '9', '1', '100006');
INSERT INTO `t_reply` VALUES ('10000010', '2016-12-30 20:00:59', '评分标准采用5级。研究对SCL－90各因子分与常模组各因子分比较。', '10', '5', '100007');
INSERT INTO `t_reply` VALUES ('10000025', '2016-12-28 17:56:51', 'fewaegwehhre', '1', '1', '100083');
INSERT INTO `t_reply` VALUES ('10000034', '2016-12-28 18:12:26', 'sds', '1', '1', '100083');
INSERT INTO `t_reply` VALUES ('10000035', '2016-12-28 18:12:29', 'sdsewr', '1', '1', '100083');
INSERT INTO `t_reply` VALUES ('10000036', '2016-12-28 18:23:05', 'fdsfs', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000037', '2016-12-28 18:24:21', 'dsfdsa', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000038', '2016-12-28 18:25:09', 'dsfa', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000039', '2016-12-28 18:26:01', 'fdsfs', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000040', '2016-12-28 18:28:38', 'ewfwe', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000041', '2016-12-28 18:34:18', 'rgdf ', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000042', '2016-12-28 18:36:05', 'sfdsf', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000043', '2016-12-28 18:36:30', 'gfgdgdf', '1', '1', '100085');
INSERT INTO `t_reply` VALUES ('10000044', '2016-12-28 18:37:19', 'fdgfd', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000045', '2016-12-28 18:40:56', 'gfdgfd', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000046', '2016-12-28 18:41:31', '李军是傻吊', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000047', '2016-12-28 19:36:52', '真的吗', '1', '1', '100086');
INSERT INTO `t_reply` VALUES ('10000048', '2016-12-28 19:37:00', '你说啥', '1', '1', '100085');
INSERT INTO `t_reply` VALUES ('10000049', '2016-12-28 21:20:05', '是啊', '1', '1', '100088');

-- ----------------------------
-- Table structure for `t_school`
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `schoolid` int(11) NOT NULL,
  `schoolname` varchar(50) DEFAULT NULL,
  `schoolpassword` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`schoolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('1', '江西师范大学', '123123');
INSERT INTO `t_school` VALUES ('2', '南昌大学', '123123');
INSERT INTO `t_school` VALUES ('3', '清华大学', '123123');
INSERT INTO `t_school` VALUES ('4', '北京大学', '123123');

-- ----------------------------
-- Table structure for `t_schoolnews`
-- ----------------------------
DROP TABLE IF EXISTS `t_schoolnews`;
CREATE TABLE `t_schoolnews` (
  `schoolnewsid` int(11) NOT NULL,
  `schoolnewstime` varchar(20) DEFAULT NULL,
  `schoolnewscontent` varchar(50) DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolnewsid`),
  KEY `FK_Reference_8` (`schoolid`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`schoolid`) REFERENCES `t_school` (`schoolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schoolnews
-- ----------------------------
INSERT INTO `t_schoolnews` VALUES ('11101', '2016-12-01 19:06:41', '本次音乐会曲目囊括了晚期浪漫主义和现代时期作品，除作曲大师勃拉姆斯晚期作品《严肃的四首歌》', '1');
INSERT INTO `t_schoolnews` VALUES ('11102', '2016-12-02 19:11:39', '舒莱克《奏鸣曲:加百利的号角》等经典长号作品以外', '1');
INSERT INTO `t_schoolnews` VALUES ('11103', '2016-12-03 19:12:24', 'Stephanie Ann Boyd为长号演奏家孙赫先生专门创作的无伴奏作品《Peregrine》', '1');
INSERT INTO `t_schoolnews` VALUES ('11104', '2016-12-05 19:13:02', '此次音乐会演奏家精湛的技艺及无懈可击的音乐诠释博得了现场观众的热烈掌声', '1');
INSERT INTO `t_schoolnews` VALUES ('11105', '2016-12-04 19:13:36', '孙赫， 旅美长号、低音长号演奏家，英国Denis Wick品牌形象代言人', '1');
INSERT INTO `t_schoolnews` VALUES ('11106', '2016-12-06 19:14:07', '宾夕法尼亚爱乐乐团长号演奏家，西北民族大学音乐学院特邀艺术指导', '1');
INSERT INTO `t_schoolnews` VALUES ('11107', '2016-12-08 19:14:22', '近年来多次以独奏家身份在费城、芝加哥、北京以及洛杉矶等地举办独奏音乐会，', '1');
INSERT INTO `t_schoolnews` VALUES ('11108', '2016-12-08 19:15:07', '首演了许多当代作曲家的作品及委约作品。并与国内外诸多知名乐团合作演出', '1');
INSERT INTO `t_schoolnews` VALUES ('11109', '2016-12-09 19:15:31', '2012年与芝加哥Lakefront低音铜管四重奏亚洲巡演，在香港、北京等地讲授大师课', '1');
INSERT INTO `t_schoolnews` VALUES ('11110', '2016-12-15 19:15:58', '2015年受邀担任Micky Wrobleski国际低音铜管大师班研讨会担任长号教师', '1');
INSERT INTO `t_schoolnews` VALUES ('11111', '2016-12-16 19:16:16', '2016-2017年将在美国录制首张个人独奏专辑《Tachycardia》', '1');
INSERT INTO `t_schoolnews` VALUES ('11112', '2016-12-23 19:16:48', '除了演奏家的身份之外，孙赫先生同时还是Ultimate Brass铜管工作室的创始人及首席技师', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `schoolid` int(11) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `clubid` int(11) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `telnumber` varchar(20) DEFAULT NULL,
  `headImg` varchar(50) DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `FK_Reference_1` (`schoolid`),
  KEY `FK_Reference_13` (`clubid`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`schoolid`) REFERENCES `t_school` (`schoolid`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`clubid`) REFERENCES `t_club` (`clubid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '1', 'watermelon', null, '4297f44b13955235245b2497399d7a93', '1', '844704781@qq.com', '13361640812', 'userhead/head1.png', '0');
INSERT INTO `t_user` VALUES ('2', '1', 'apple', null, '1233123@qq.com', '1', '1233123@qq.com', '13361640812', 'userhead/head1.png', '0');
INSERT INTO `t_user` VALUES ('3', '1', 'grape', null, '123123@qq.com', '1', '123123@qq.com', '12345678910', 'userhead/head1.png', '0');
INSERT INTO `t_user` VALUES ('4', '1', 'banana', null, '123123@qq.com', null, 'jiahui@qq.com', '13361640812', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('5', '1', 'pineapple ', null, '123123@qq.com', null, '123123@qq.com', '12312312310', 'userhead/head1.png', '0');
INSERT INTO `t_user` VALUES ('6', '1', 'peach', null, '123123@qq.com', '1', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('7', '1', 'strawberry', null, '123123@qq.com', '1', '123123@qq.com', '12312312310', 'userhead/head1.png', '0');
INSERT INTO `t_user` VALUES ('8', '1', 'mango', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('9', '1', 'cherry', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('10', '1', 'lemon', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('11', '1', 'orange', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('12', '1', 'lychee', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('13', '1', 'apricot', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('14', '1', 'muskmelon', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('15', '1', 'plum', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('16', '1', 'wanut', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('17', '1', 'sugarcan', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('18', '1', 'pawpaw', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('19', '1', 'grapefruit', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');
INSERT INTO `t_user` VALUES ('20', '1', 'kiwifruit', null, '123123@qq.com', '2', '123123@qq.com', '12312312310', 'userhead/head2.png', '0');

-- ----------------------------
-- Table structure for `t_userandactivity`
-- ----------------------------
DROP TABLE IF EXISTS `t_userandactivity`;
CREATE TABLE `t_userandactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userandactivity
-- ----------------------------
INSERT INTO `t_userandactivity` VALUES ('6', '1', '1001');
INSERT INTO `t_userandactivity` VALUES ('7', '2', '1002');
INSERT INTO `t_userandactivity` VALUES ('8', '3', '1003');
INSERT INTO `t_userandactivity` VALUES ('9', '4', '1001');
INSERT INTO `t_userandactivity` VALUES ('10', '5', '1001');
INSERT INTO `t_userandactivity` VALUES ('11', '6', '1002');

-- ----------------------------
-- Table structure for `t_userandclub`
-- ----------------------------
DROP TABLE IF EXISTS `t_userandclub`;
CREATE TABLE `t_userandclub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `clubId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userandclub
-- ----------------------------
INSERT INTO `t_userandclub` VALUES ('126', '1', '9');
INSERT INTO `t_userandclub` VALUES ('139', '1', '12');
INSERT INTO `t_userandclub` VALUES ('155', '1', '8');
INSERT INTO `t_userandclub` VALUES ('184', '1', '4');
INSERT INTO `t_userandclub` VALUES ('185', '1', '6');
INSERT INTO `t_userandclub` VALUES ('187', '2', '9');
INSERT INTO `t_userandclub` VALUES ('188', '2', '12');
INSERT INTO `t_userandclub` VALUES ('189', '3', '9');
INSERT INTO `t_userandclub` VALUES ('190', '3', '10');
INSERT INTO `t_userandclub` VALUES ('191', '4', '9');
INSERT INTO `t_userandclub` VALUES ('192', '5', '8');
INSERT INTO `t_userandclub` VALUES ('193', '6', '12');
INSERT INTO `t_userandclub` VALUES ('195', '1', '3');
INSERT INTO `t_userandclub` VALUES ('196', '1', '2');
