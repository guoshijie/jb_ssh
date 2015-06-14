/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.25 : Database - jb_sh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jb_sh` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jb_sh`;

/*Table structure for table `accounts` */

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `curmoney` double DEFAULT NULL COMMENT '本次浮动金额',
  `account` double DEFAULT NULL COMMENT '当前账户余额',
  `payments` varchar(10) DEFAULT NULL COMMENT '收入或支出',
  `time` varchar(30) DEFAULT NULL COMMENT '变化时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `accounts` */

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `receiver` varchar(45) DEFAULT NULL COMMENT '收货人',
  `tel` varchar(45) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(16) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `county` varchar(20) DEFAULT NULL COMMENT '县',
  `street` varchar(100) DEFAULT NULL COMMENT '街道门牌号（详细地址）',
  `flag` int(2) unsigned NOT NULL COMMENT '1:默认    0：不默认',
  PRIMARY KEY (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`aid`,`uid`,`receiver`,`tel`,`province`,`city`,`county`,`street`,`flag`) values (4,6,'郭世杰','15022542881','天津市','天津市','西青区','宾水西道399号天津市大学软件学院',0),(5,6,'郭世杰','18734915338','山西省','太原市','尖草坪区','中北大学软件学院',1),(7,8,'李四','13445678989','上海市','上海市','黄浦区','黄埔军校校长室',1),(9,6,'郭世杰','15022542881','山西省','临汾市','尧都区','向阳西路煤气公司家属院5号楼三单元101室',0),(10,13,'焦楠','15022542264','天津市','天津市','西青区','宾水西道399号',1),(11,7,'张三','17734541234','重庆市','重庆市','渝北区','重庆小火锅',1);

/*Table structure for table `attribute` */

DROP TABLE IF EXISTS `attribute`;

CREATE TABLE `attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pnumber` int(10) DEFAULT NULL COMMENT '属性编号',
  `pname` varchar(20) DEFAULT NULL COMMENT '属性名称',
  `pvalue` varchar(50) DEFAULT NULL COMMENT '属性值',
  `gid` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  CONSTRAINT `attribute_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';

/*Data for the table `attribute` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `money` double DEFAULT NULL COMMENT '总价格',
  `status` int(10) DEFAULT NULL COMMENT '购物车状态',
  `gid` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`id`,`uid`,`money`,`status`,`gid`) values (24,13,0,NULL,NULL);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT NULL COMMENT '上级分类号',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名',
  `level` int(11) DEFAULT NULL COMMENT '分类级别，几级分类',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`parent`,`name`,`level`) values (7,NULL,'图书、音像、数字商品',1),(8,NULL,'手机、数码',1),(9,NULL,'电脑、办公',1),(10,NULL,'服饰鞋帽',1),(11,NULL,'礼品箱包、钟表、珠宝',1),(12,NULL,'个护化装',1),(13,NULL,'运动健康、体育用品',1),(14,NULL,'食品饮料、保健食品',1),(15,NULL,'家用电器',1),(16,NULL,'汽车用品',1),(17,NULL,'彩票、旅游',1),(18,NULL,'家居、家具、家装、厨具',1),(19,NULL,'母婴、玩具乐器',1),(20,7,'电子书',2),(21,7,'数字音乐',2),(22,7,'音像',2),(23,7,'科技',2),(24,7,'教育',2),(25,7,'生活',2),(26,20,'免费',3),(27,20,'小说',3),(28,20,'励志',3),(29,20,'婚恋',3),(30,20,'文学',3),(31,20,'经管',3),(32,8,'手机通讯',2),(33,32,'手机',3),(34,32,'对讲机',3),(35,32,'其它',3),(36,8,'手机配件',2),(37,8,'摄影摄像',2),(38,8,'数码配件',2),(39,8,'时尚影音',2),(40,8,'其它',2),(41,21,'通俗流行',3),(42,21,'古典音乐',3),(43,21,'摇滚说唱',3),(44,21,'其它',3),(45,22,'音乐',3),(46,22,'影视',3),(47,22,'游戏',3),(48,22,'教育音像',3),(49,22,'其它',3),(50,23,'科普',3),(51,23,'建筑',3),(52,23,'医学',3),(53,23,'IT',3),(54,23,'其它',3),(55,24,'教材教辅',3),(56,24,'考试',3),(57,24,'外语学习',3),(58,24,'其它',3),(59,25,'旅游地图',3),(60,25,'娱乐休闲',3),(61,25,'体育运动',3),(62,25,'其它',3),(63,36,'电池',3),(64,36,'充电器',3),(65,36,'数据线',3),(66,36,'贴膜',3),(67,36,'其它',3),(68,37,'数码相机',3),(69,37,'单反',3),(70,37,'摄像机',3),(71,37,'镜头',3),(72,37,'其它',3),(73,38,'内存卡',3),(74,38,'读卡器',3),(75,38,'相机包',3),(76,38,'移动电源',3),(77,38,'其它',3),(78,39,'MP3/MP4',3),(79,39,'电子书',3),(80,39,'电子词典',3),(81,39,'录音笔',3),(82,39,'其它',3),(83,40,'苹果配件',3),(84,40,'数码相框',3),(85,40,'音箱',3),(86,40,'其它',3),(87,9,'电脑整机',2),(88,9,'电脑配件',2),(89,9,'外设产品',2),(90,9,'网络产品',2),(91,9,'办公打印',2),(92,9,'办公文仪',2),(93,9,'服务产品',2),(94,87,'笔记本',3),(95,87,'超级本',3),(96,87,'游戏本',3),(97,87,'平板电脑',3),(98,87,'台式机',3),(99,87,'其它',3),(100,88,'CPU',3),(101,88,'主板',3),(102,88,'显卡',3),(103,88,'内存',3),(104,88,'硬盘',3),(105,88,'显示器',3),(106,88,'声卡',3),(107,88,'其它',3),(108,89,'鼠标',3),(109,89,'键盘',3),(110,89,'游戏设备',3),(111,89,'U盘',3),(112,89,'移动硬盘',3),(113,89,'插座',3),(114,89,'其它',3),(115,90,'路由器',3),(116,90,'网卡',3),(117,90,'交换机',3),(118,90,'网络存储',3),(119,90,'3G上网',3),(120,90,'其它',3),(121,91,'打印机',3),(122,91,'一体机',3),(123,91,'投影机',3),(124,91,'传真机',3),(125,91,'扫描仪',3),(126,91,'其它',3),(127,92,'办公文具',3),(128,92,'文件管理',3),(129,92,'笔类',3),(130,92,'计算器',3),(131,92,'财务用品',3),(132,92,'其它',3),(133,93,'上门服务',3),(134,93,'远程服务',3),(135,93,'电脑软件',3),(136,93,'其它',3),(137,10,'女装',2),(138,10,'男装',2),(139,10,'运动',2),(140,10,'女鞋',2),(141,10,'男鞋',2),(142,10,'配饰',2),(143,10,'童装',2),(144,137,'T恤',3),(145,137,'衬衫',3),(146,137,'针织衫',3),(147,137,'卫衣',3),(148,137,'连衣裙',3),(149,137,'牛仔裤',3),(150,137,'其它',3),(151,138,'衬衫',3),(152,138,'T恤',3),(153,138,'POLO衫',3),(154,138,'针织衫',3),(155,138,'夹克',3),(156,138,'西装',3),(157,138,'其它',3),(158,139,'羽绒服',3),(159,139,'帆布鞋',3),(160,139,'套装',3),(161,139,'拖鞋',3),(162,139,'运动裤',3),(163,139,'T恤',3),(164,139,'其它',3),(165,140,'平底鞋',3),(166,140,'高跟鞋',3),(167,140,'单鞋',3),(168,140,'休闲鞋',3),(169,140,'凉鞋',3),(170,140,'雪地靴',3),(171,140,'其它',3),(172,141,'商务休闲鞋',3),(173,141,'正装鞋',3),(174,141,'休闲鞋',3),(175,141,'功能',3),(176,141,'拖鞋',3),(177,141,'其它',3),(178,142,'太阳镜',3),(179,142,'框镜',3),(180,142,'皮带',3),(181,142,'围巾',3),(182,142,'手套',3),(183,142,'帽子',3),(184,142,'其它',3),(185,143,'套装',3),(186,143,'上衣',3),(187,143,'裤子',3),(188,143,'亲子装',3),(189,143,'靴子',3),(190,143,'凉鞋',3),(191,143,'其它',3),(192,11,'潮流女包',2),(193,11,'时尚男包',2),(194,11,'功能箱包',2),(195,11,'礼品',2),(196,11,'钟表',2),(197,11,'珠宝首饰',2),(198,11,'婚庆',2),(199,192,'钱包',3),(200,192,'手拿包',3),(201,192,'单肩包',3),(202,192,'双肩包',3),(203,192,'手提',3),(204,192,'斜跨包',3),(205,192,'其它',3),(206,193,'钱包',3),(207,193,'卡包',3),(208,193,'男士手包',3),(209,193,'腰带',3),(210,193,'商务公文包',3),(211,193,'其它',3),(212,194,'电脑数码包',3),(213,194,'拉杆箱',3),(214,194,'旅行包',3),(215,194,'旅行配件',3),(216,194,'休闲运动包',3),(217,195,'火机烟具',3),(218,195,'礼品文具',3),(219,195,'瑞士军刀',3),(220,195,'收藏品',3),(221,195,'工艺',3),(222,195,'其它',3),(223,196,'瑞士品牌',3),(224,196,'国产品牌',3),(225,196,'日本品牌',3),(226,196,'时尚品牌',3),(227,196,'其它',3),(228,197,'钻石饰品',3),(229,197,'银饰',3),(230,197,'翡翠玉石',3),(231,197,'宝石珍珠',3),(232,197,'其它',3),(233,198,'婚嫁首饰',3),(234,198,'婚纱摄影',3),(235,198,'婚纱礼服',3),(236,198,'婚庆服务',3),(237,198,'其它',3),(238,12,'面部护理',2),(239,12,'身体护理',2),(240,12,'口腔护理',2),(241,12,'男士护理',2),(242,12,'香水SPA',2),(243,12,'魅力彩妆',2),(244,238,'洁面乳',3),(245,238,'爽肤水',3),(246,238,'精华露',3),(247,238,'乳液面霜',3),(248,238,'眼部护理',3),(249,238,'其它',3),(250,239,'洗发护发',3),(251,239,'沐浴',3),(252,239,'香皂',3),(253,239,'手足护理',3),(254,239,'染发',3),(255,239,'其它',3),(256,240,'牙膏',3),(257,240,'牙刷',3),(258,240,'漱口水',3),(259,240,'其它',3),(260,241,'脸部',3),(261,241,'眼部',3),(262,241,'身体护理',3),(263,241,'男士香水',3),(264,241,'剃须',3),(265,241,'其它',3),(266,242,'女士香水',3),(267,242,'男士香水',3),(268,242,'组合套装',3),(269,242,'迷你香水',3),(270,242,'其它',3),(271,243,'粉底',3),(272,243,'腮红',3),(273,243,'眉笔',3),(274,243,'睫毛膏',3),(275,243,'美甲',3),(276,243,'其它',3),(277,13,'户外鞋服',2),(278,13,'户外装备',2),(279,13,'运动器械',2),(280,13,'体育娱乐',2),(281,13,'保健器械',2),(282,13,'急救卫生',2),(283,277,'户外服装',3),(284,277,'户外鞋袜',3),(285,277,'户外配饰',3),(286,277,'其它',3),(287,278,'帐篷',3),(288,278,'睡袋',3),(289,278,'登山攀岩',3),(290,278,'户外背包',3),(291,278,'烧烤用品',3),(292,278,'其它',3),(293,279,'健身器械',3),(294,279,'运动器械',3),(295,279,'防护器具',3),(296,279,'极限轮滑',3),(297,279,'其它',3),(298,280,'羽毛球',3),(299,280,'乒乓球',3),(300,280,'篮球',3),(301,280,'足球',3),(302,280,'网球',3),(303,280,'排球',3),(304,280,'其它',3),(305,281,'养生器械',3),(306,281,'保健用品',3),(307,281,'康复辅助',3),(308,281,'家庭护理',3),(309,281,'其它',3),(310,282,'跌打损伤',3),(311,282,'烫伤止痒',3),(312,282,'口腔咽部',3),(313,282,'眼部保健',3),(314,282,'其它',3),(315,14,'进口食品',2),(316,14,'地方特产',2),(317,14,'休闲食品',2),(318,14,'粮油调味',2),(319,14,'营养健康',2),(320,14,'健康礼品',2),(321,315,'饼干蛋糕',3),(322,315,'糖果巧克力',3),(323,315,'休闲零食',3),(324,315,'粮油调味',3),(325,315,'其它',3),(326,316,'华北',3),(327,316,'西北',3),(328,316,'西南',3),(329,316,'东北',3),(330,316,'华南',3),(331,316,'华东',3),(332,316,'东中',3),(333,316,'其它',3),(334,317,'休闲零食',3),(335,317,'坚果炒货',3),(336,317,'肉干肉松',3),(337,317,'糖果',3),(338,317,'其它',3),(339,318,'米面杂粮',3),(340,318,'食用油',3),(341,318,'调味品',3),(342,318,'南北干货',3),(343,318,'有机食品',3),(344,318,'其它',3),(345,319,'基础营养',3),(346,319,'美体养颜',3),(347,319,'滋补调养',3),(348,319,'保健茶饮',3),(349,319,'其它',3),(350,320,'参茸礼品',3),(351,320,'更多礼品',3),(352,15,'大家电',2),(353,15,'生活电器',2),(354,15,'厨房电器',2),(355,15,'个护健康',2),(356,15,'五金家族',2),(357,352,'平板电视',3),(358,352,'空调',3),(359,352,'冰箱',3),(360,352,'家庭影院',3),(361,352,'热水器',3),(362,352,'其它',3),(363,353,'取暖器',3),(364,353,'加温器',3),(365,353,'净化器',3),(366,353,'饮水机',3),(367,353,'吸尘器',3),(368,353,'其它',3),(369,354,'电压力锅',3),(370,354,'电饭煲',3),(371,354,'豆浆机',3),(372,354,'面包机',3),(373,354,'微波炉',3),(374,354,'其它',3),(375,355,'剃须刀',3),(376,355,'口腔护理',3),(377,355,'电吹风',3),(378,355,'美容',3),(379,355,'血压计',3),(380,355,'其它',3),(381,356,'电动工具',3),(382,356,'手动工具',3),(383,356,'灯具',3),(384,356,'LED灯',3),(385,356,'电气开关',3),(386,356,'其它',3),(387,16,'电子电器',2),(388,16,'系统养护',2),(389,16,'改装配件',2),(390,16,'洗车美容',2),(391,16,'座垫脚垫',2),(392,16,'内饰精品',2),(393,387,'充气泵',3),(394,387,'行车记录仪',3),(395,387,'车载电源',3),(396,387,'倒车雷达',3),(397,387,'导航',3),(398,387,'其它',3),(399,388,'机油 ',3),(400,388,'添加剂',3),(401,388,'防冻冷却液',3),(402,388,'附属油',3),(403,388,'底盘装甲',3),(404,388,'其它',3),(405,389,'雨刷',3),(406,389,'车灯',3),(407,389,'轮胎',3),(408,389,'贴膜',3),(409,389,'后视镜',3),(410,389,'刹车盘',3),(411,389,'其它',3),(412,390,'漆面美容',3),(413,390,'漆面修复',3),(414,390,'内饰清洁',3),(415,390,'车掸',3),(416,390,'洗车液',3),(417,390,'其它',3),(418,391,'凉热',3),(419,391,'四季垫',3),(420,391,'毛垫',3),(421,391,'后备箱垫',3),(422,391,'通用脚垫',3),(423,391,'其它',3),(424,392,'车用香水',3),(425,392,'车用炭包',3),(426,392,'空气净化',3),(427,392,'方向盘套',3),(428,392,'挂件',3),(429,392,'其它',3),(430,17,'彩票',2),(431,17,'机票',2),(432,17,'酒店',2),(433,17,'旅行',2),(434,17,'票务',2),(435,17,'应用商店',2),(436,430,'双色球',3),(437,430,'七乐彩',3),(438,430,'福彩3D',3),(439,430,'足彩',3),(440,430,'大乐透',3),(441,430,'快3',3),(442,430,'其它',3),(443,431,'国内机票',3),(444,432,'国内酒店',3),(445,432,'酒店团购',3),(446,433,'度假',3),(447,433,'景点',3),(448,433,'租车',3),(449,433,'旅游团购',3),(450,433,'其它',3),(451,434,'电影票',3),(452,434,'演唱会',3),(453,434,'音乐会',3),(454,434,'体育赛事',3),(455,434,'戏曲综艺',3),(456,434,'其它',3),(457,435,'移动游戏',3),(458,435,'移动软件',3),(459,435,'网页应用',3),(460,435,'其它',3),(461,18,'厨具',2),(462,18,'家纺',2),(463,18,'家具',2),(464,18,'灯具',2),(465,18,'生活日用',2),(466,461,'烹饪锅具',3),(467,461,'刀剪菜板',3),(468,461,'保鲜器皿',3),(469,461,'水具酒具',3),(470,461,'餐具',3),(471,461,'其它',3),(472,462,'床品件套',3),(473,462,'被子',3),(474,462,'枕芯枕套',3),(475,462,'床单被罩',3),(476,462,'床垫',3),(477,462,'其它',3),(478,463,'卧室家具',3),(479,463,'客厅家具',3),(480,463,'餐厅',3),(481,463,'书房家具',3),(482,463,'阳台户外',3),(483,463,'其它',3),(484,464,'台灯',3),(485,464,'节能灯',3),(486,464,'多用灯',3),(487,464,'手电',3),(488,464,'LED灯',3),(489,464,'吸顶灯',3),(490,464,'其它',3),(491,465,'收纳用品',3),(492,465,'雨伞雨具',3),(493,465,'浴室用品',3),(494,465,'缝纫用品',3),(495,465,'洗晒',3),(496,465,'其它',3),(497,19,'奶粉',2),(498,19,'洗护用品',2),(499,19,'童车童床',2),(500,19,'喂养用品',2),(501,19,'玩具乐器',2),(502,497,'品牌奶粉',3),(503,497,'特殊配方',3),(504,497,'成人奶粉',3),(505,497,'其它',3),(506,498,'宝宝护肤',3),(507,498,'护理用品',3),(508,498,'清洁用品',3),(509,498,'洗浴用品',3),(510,498,'其它',3),(511,499,'婴儿推车',3),(512,499,'安全座椅',3),(513,499,'自行车',3),(514,499,'学步车',3),(515,499,'健身车',3),(516,499,'其它',3),(517,500,'奶瓶',3),(518,500,'奶嘴',3),(519,500,'吸奶器',3),(520,500,'餐具',3),(521,500,'水具',3),(522,500,'其它',3),(523,501,'适用年龄',3),(524,501,'遥控电动',3),(525,501,'娃娃玩具',3),(526,501,'模型玩具',3),(527,501,'健身玩具',3);

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `cid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL COMMENT 'user的id',
  `gid` int(11) unsigned DEFAULT NULL COMMENT 'goods的id',
  `ctime` varchar(20) DEFAULT NULL COMMENT '收藏日期',
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

insert  into `collect`(`cid`,`uid`,`gid`,`ctime`) values (7,8,11,'2014-04-06 10:42:03'),(8,8,2,'2014-04-06 11:12:41'),(9,8,3,'2014-04-06 11:20:43'),(35,13,12,'2014-04-26 18:26:07'),(36,13,16,'2014-04-26 18:29:18'),(38,7,12,'2014-04-26 18:44:57'),(39,7,3,'2014-04-26 19:01:04'),(41,13,13,'2014-04-27 16:32:57'),(45,6,39,'2014-06-14 17:51:58'),(46,6,35,'2014-06-14 17:52:16'),(47,6,2,'2014-06-15 21:18:01'),(48,6,38,'2014-06-16 12:37:21'),(49,6,12,'2014-06-16 13:11:31');

/*Table structure for table `discuss` */

DROP TABLE IF EXISTS `discuss`;

CREATE TABLE `discuss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int(10) unsigned DEFAULT NULL COMMENT 'item的id',
  `gid` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `grade` varchar(10) DEFAULT NULL COMMENT '好，中，差评',
  `details` varchar(200) DEFAULT NULL COMMENT '评论内容',
  `dtime` varchar(20) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `uid` (`uid`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `discuss_ibfk_3` FOREIGN KEY (`itemid`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `discuss` */

insert  into `discuss`(`id`,`itemid`,`gid`,`uid`,`grade`,`details`,`dtime`) values (1,3,15,6,'好评','耳机很好，推荐大家购买','2014-04-22 11:50:17'),(4,4,12,6,'好评','鼠标不错，很省电','2014-04-24 10:31:19'),(6,5,11,6,'好评','儿子很喜欢，以后还会来的，特别不错','2014-04-25 16:42:10'),(7,7,12,6,'好评','第二次买了，一如即往的好','2014-04-26 14:13:39'),(8,26,14,6,'好评','图像显示很清楚，也很真，父母很喜欢','2014-04-26 15:50:19'),(9,25,12,6,'好评','这款无线鼠标按键声音很小，很适合住集体宿舍的人使用','2014-04-26 16:24:41'),(10,35,12,13,'差评','不好，没用一个月就坏了','2014-04-26 18:30:18'),(11,38,12,7,'中评','还行吧，塑料感很强，不知道省不省电','2014-04-26 18:46:12'),(12,39,3,7,'好评','质量很好，大家可以放心购买了','2014-04-26 19:01:54'),(13,40,17,6,'好评','手机运行很流畅，暂时还没有发现问题','2014-04-27 15:35:19'),(14,42,13,13,'好评','好手机，运行特别快','2014-04-27 16:33:46'),(15,43,2,6,'好评','电脑还不错，玩游戏很流畅','2014-05-10 17:23:42'),(16,46,37,6,'中评','还不错','2014-06-10 16:24:56'),(17,49,36,6,'好评','鼠标键盘套装性价比很高，还会再来的','2014-06-12 09:24:53'),(18,54,2,6,'差评','电脑老死机，不好，大家不要购买','2014-06-16 16:32:11');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) DEFAULT NULL,
  `sprice` double DEFAULT NULL COMMENT '售价',
  `dprice` double DEFAULT NULL COMMENT '折扣价',
  `gnum` int(11) DEFAULT NULL COMMENT '当前库存',
  `snum` int(10) DEFAULT NULL COMMENT '已售数量',
  `modifyTime` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `categoryId` int(10) unsigned DEFAULT NULL COMMENT '类别id',
  `img` varchar(1000) DEFAULT NULL COMMENT '商品图片',
  `groupBuy` varchar(2) DEFAULT NULL COMMENT '是否团购',
  `status` int(2) DEFAULT NULL COMMENT '商品状态',
  `score` int(10) DEFAULT NULL COMMENT '奖励积分',
  `noPostage` varchar(2) DEFAULT NULL COMMENT '是否包邮',
  `area` varchar(10) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`gid`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`gid`,`gname`,`sprice`,`dprice`,`gnum`,`snum`,`modifyTime`,`categoryId`,`img`,`groupBuy`,`status`,`score`,`noPostage`,`area`) values (2,'IBM老式笔记本电脑家用看电影斗地主',3399,NULL,396,4,'2014-03-29 12:57:01',94,'/jb_ssh/images/img/2014329125714298.jpg,/jb_ssh/images/img/2014329125718919.jpg,/jb_ssh/images/img/2014329125714938.jpg','否',1,NULL,'是','广州'),(3,'专业运动员的最佳选择乒乓球拍质量有保证',120,NULL,900,0,'2014-03-29 13:03:28',299,'/jb_ssh/images/img/2014329133285197.jpg,/jb_ssh/images/img/2014329133289407.jpg,/jb_ssh/images/img/201432913328350.jpg','否',1,NULL,'是','北京'),(11,'斯伯盯篮球送给朋友儿子的最佳礼物',200,NULL,100,0,'2014-03-30 16:17:34',300,'/jb_ssh/images/img/20143301617342529.jpg,/jb_ssh/images/img/20143301617349867.png,/jb_ssh/images/img/20143301617343721.jpg','否',1,NULL,'是','天津'),(12,'送鼠标垫 卡佐X6 无线鼠标 可爱 笔记本无声电脑游戏 2.4G秒杀',34.8,NULL,1589,11,'2014-03-30 16:19:42',108,'/jb_ssh/images/img/20143301619424146.jpg,/jb_ssh/images/img/20143301619423782.jpg,/jb_ssh/images/img/2014330161942983.jpg,/jb_ssh/images/img/20143301619423176.jpg','否',1,NULL,'是','天津'),(13,'小米官网正品小米手机3 TD版 16GB/64GB MI3顺丰包邮',2499,NULL,999,1,'2014-03-30 16:21:19',33,'/jb_ssh/images/img/20143301621199001.jpg,/jb_ssh/images/img/20143301621199793.jpg,/jb_ssh/images/img/2014330162119973.jpg','否',1,NULL,'否','北京'),(14,'Sony/索尼 KLV-32R300A 32英寸LED 液晶电视超窄边框彩电',1799,NULL,500,0,'2014-03-30 16:23:49',46,'/jb_ssh/images/img/20143301623493945.jpg,/jb_ssh/images/img/20143301623496535.jpg,/jb_ssh/images/img/20143301623491778.jpg','否',1,NULL,'否','北京'),(15,'小米旗舰店正品 红米线控耳机 小米3入耳式耳机 手机电脑通用包邮',99,NULL,1500,0,'2014-03-30 16:26:10',45,'/jb_ssh/images/img/20143301626107706.jpg,/jb_ssh/images/img/20143301626101875.jpg','否',1,NULL,'是','天津'),(16,'漫步者R201T12 多媒体有源台式电脑音箱 2.1木质低音炮笔记本音响',198,NULL,1000,0,'2014-03-30 16:27:28',45,'/jb_ssh/images/img/2014330162728773.jpg,/jb_ssh/images/img/2014330162728636.jpg,/jb_ssh/images/img/20143301627287330.jpg','否',0,NULL,'否','上海'),(17,'联想VIBE Z K910 WCDMA/GSM双卡双待双通',1999,NULL,999,1,'2014-04-27 14:49:58',33,'/jb_ssh/images/img/20144271449584580.jpg,/jb_ssh/images/img/20144271449589050.jpg,/jb_ssh/images/img/20144271449588840.jpg','否',0,NULL,'是','北京'),(18,'尼康（Nikon） D3200 单反相机套机（AF-S DX VR 18-105mm f/3.5-5.6G ED 防抖镜头）',4089,NULL,500,0,'2014-04-27 14:57:17',69,'/jb_ssh/images/img/2014427145717875.jpg,/jb_ssh/images/img/20144271457178942.jpg,/jb_ssh/images/img/20144271457174239.jpg','否',1,NULL,'是','上海'),(19,'伦威保罗LENWEBOLO男士手提包商务电脑公文包包14寸文件男包组合子母包 -5横款手提',208,NULL,1000,0,'2014-04-27 15:02:30',208,'/jb_ssh/images/img/2014427152307607.jpg,/jb_ssh/images/img/2014427152306646.jpg,/jb_ssh/images/img/2014427152304814.jpg','否',1,NULL,'是','广州'),(20,'苹果（Apple） iPad mini MD531CH/A 7.9英寸平板电脑 （16G WiFi版）白色 ',1998,NULL,1000,0,'2014-05-07 15:54:25',97,'/jb_ssh/images/img/2014571554259296.jpg,/jb_ssh/images/img/2014571554257905.jpg,/jb_ssh/images/img/2014571554252739.jpg','否',1,NULL,'是','广州'),(21,' 微软（Microsoft）中文版Surface Pro 64G（酷睿i5 4G内存 高清触屏 win8 触控笔 预装office2013） 办公神器，劲爆价格疯狂来袭~！！ ',3688,NULL,1998,2,'2014-05-07 16:45:39',97,'/jb_ssh/images/img/2014571645394262.jpg,/jb_ssh/images/img/2014571645395141.jpg,/jb_ssh/images/img/2014571645393391.jpg','否',1,NULL,'是','北京'),(22,'夏普（SHARP）LCD-46DS20A 46英寸日本原装面板',3599,NULL,100,0,'2014-06-07 21:48:39',357,'/jb_ssh/images/img/2014672148393013.jpg,/jb_ssh/images/img/2014672148399024.jpg,/jb_ssh/images/img/2014672148391836.jpg','否',1,NULL,'是','北京'),(23,'索尼（SONY） DSC-RX100 M2 黑卡数码相机',3599,NULL,1000,0,'2014-06-07 21:52:09',68,'/jb_ssh/images/img/201467215292322.jpg,/jb_ssh/images/img/201467215299143.jpg,/jb_ssh/images/img/201467215294188.jpg,/jb_ssh/images/img/201467215292435.jpg','否',1,NULL,'是','北京'),(24,'佳能（Canon） IXUS132 数码相机 银色（1600万像素 2.7英寸液晶屏 8倍光学变焦 28mm广角）',669,NULL,5000,0,'2014-06-07 21:55:03',68,'/jb_ssh/images/img/201467215534263.jpg,/jb_ssh/images/img/201467215531502.jpg,/jb_ssh/images/img/201467215533818.jpg,/jb_ssh/images/img/201467215533949.jpg','否',1,NULL,'是','北京'),(25,'海尔（Haier） BCD-190TMPK 190升 两门冰箱（银灰色）',1399,NULL,500,0,'2014-06-07 22:02:03',359,'/jb_ssh/images/img/20146722237846.jpg,/jb_ssh/images/img/20146722231323.jpg,/jb_ssh/images/img/20146722237458.jpg','否',1,NULL,'是','天津'),(26,'海尔（Haier） KFR-35GW/05GDC23A 1.5匹壁挂式冷暖变频空调',2799,NULL,1000,0,'2014-06-07 22:05:24',358,'/jb_ssh/images/img/201467225243884.jpg,/jb_ssh/images/img/201467225248422.jpg,/jb_ssh/images/img/201467225249985.jpg','否',1,NULL,'是','上海'),(27,'美的（Midea） W13PCS503E 易拆洗一手开系列 5L电压力锅',289,NULL,5000,0,'2014-06-07 22:09:26',369,'/jb_ssh/images/img/201467229266602.jpg,/jb_ssh/images/img/201467229269160.jpg,/jb_ssh/images/img/201467229263412.jpg','否',1,NULL,'是','广州'),(28,'飞利浦（PHILIPS） HTB3540 全高清3D蓝光家庭影院 黑色',1999,NULL,2000,0,'2014-06-07 22:11:37',360,'/jb_ssh/images/img/2014672211374766.jpg,/jb_ssh/images/img/2014672211377429.jpg,/jb_ssh/images/img/2014672211375546.jpg','否',1,NULL,'是','北京'),(29,'花花公子PLAYBOY 男包 时尚手提单肩斜挎包商务公文包913047-1黑',388,NULL,1000,0,'2014-06-08 15:01:59',210,'/jb_ssh/images/img/20146815159215.jpg,/jb_ssh/images/img/201468151596976.jpg,/jb_ssh/images/img/201468151592237.jpg','否',1,NULL,'是','北京'),(30,'PLAYBOY花花公子男包 时尚休闲男士横款手提包 韩版包包 男士包商务公文包单肩斜挎包 卡其色JBF0001-3K',348,NULL,5000,0,'2014-06-08 15:26:14',208,'/jb_ssh/images/img/2014681526144095.jpg,/jb_ssh/images/img/2014681526147716.jpg,/jb_ssh/images/img/2014681526148299.jpg','否',1,NULL,'是','天津'),(31,'MontBlanc万宝龙 皮带/男士腰带礼盒 抛光椭圆形扣针皮带38157',1168,NULL,2000,0,'2014-06-08 15:29:49',218,'/jb_ssh/images/img/2014681529487114.jpg,/jb_ssh/images/img/2014681529499983.jpg,/jb_ssh/images/img/2014681529498297.jpg','否',1,NULL,'是','天津'),(32,'维氏VICTORINOX瑞士军刀标准系列工作冠军0.9064',399,NULL,3000,0,'2014-06-08 15:32:21',219,'/jb_ssh/images/img/2014681532211845.jpg,/jb_ssh/images/img/2014681532215635.jpg,/jb_ssh/images/img/2014681532216319.jpg','否',1,NULL,'是','北京'),(33,'西部数据（WD） Elements 新元素系列 2.5英寸 USB3.0 移动硬盘 1TB（WDBUZG0010BBK）',449,NULL,10000,0,'2014-06-08 15:45:16',112,'/jb_ssh/images/img/2014681545163486.jpg,/jb_ssh/images/img/2014681545162614.jpg,/jb_ssh/images/img/2014681545162394.jpg','否',1,NULL,'是','北京'),(34,'台电（Teclast） 骑士USB3.0 (NQI) 杀毒 加密 32G 金属外壳U盘 咖啡色',79.9,NULL,20000,0,'2014-06-08 15:48:28',111,'/jb_ssh/images/img/2014681548282765.jpg,/jb_ssh/images/img/2014681548284472.jpg,/jb_ssh/images/img/2014681548281801.jpg','否',1,NULL,'是','北京'),(35,'罗技（Logitech） M545 无线鼠标 黑色',149,NULL,5000,0,'2014-06-08 15:50:20',108,'/jb_ssh/images/img/2014681550205330.jpg,/jb_ssh/images/img/2014681550208451.jpg,/jb_ssh/images/img/201468155020527.jpg','否',1,NULL,'是','北京'),(36,'雷蛇（Razer）二角尘蛛+地狱狂蛇 游戏键鼠套装',189,NULL,4999,1,'2014-06-08 15:52:00',109,'/jb_ssh/images/img/201468155205721.jpg,/jb_ssh/images/img/201468155205271.jpg,/jb_ssh/images/img/201468155207858.jpg','否',1,NULL,'是','北京'),(37,'【货到付款】买一送一 林丹欲争神器 李宁全碳素羽毛球拍 超轻手感好羽拍(赠羽毛球赠手胶) 男款',189,NULL,998,2,'2014-06-08 16:05:38',298,'/jb_ssh/images/img/201468165374939.jpg,/jb_ssh/images/img/201468165372150.jpg,/jb_ssh/images/img/201468165389582.jpg','否',1,NULL,'是','北京'),(38,'红双喜直拍双面反胶乒乓球拍弧圈结合快攻4星X4006(A4006)',109,NULL,9999,1,'2014-06-08 16:07:45',299,'/jb_ssh/images/img/201468167444175.jpg,/jb_ssh/images/img/201468167446417.jpg,/jb_ssh/images/img/201468167449250.jpg','否',1,NULL,'是','天津'),(39,'STAR世达 超纤革手缝大学生联赛指定用球 足球 SB375',180,NULL,4998,2,'2014-06-08 16:10:06',301,'/jb_ssh/images/img/201468161063186.jpg,/jb_ssh/images/img/201468161068213.jpg,/jb_ssh/images/img/201468161066763.jpg','否',1,NULL,'是','北京');

/*Table structure for table `groupbuy` */

DROP TABLE IF EXISTS `groupbuy`;

CREATE TABLE `groupbuy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  `beginTime` varchar(30) DEFAULT NULL COMMENT '团购开始时间',
  `endTime` varchar(30) DEFAULT NULL COMMENT '团购结束时间',
  `maxNum` int(10) DEFAULT NULL COMMENT '最大参团人数',
  `curNum` int(10) DEFAULT NULL COMMENT '当前参团人数',
  `gprice` double DEFAULT NULL COMMENT '团购价',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  CONSTRAINT `groupbuy_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `groupbuy` */

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `cid` int(10) unsigned DEFAULT NULL COMMENT '购物车id',
  `oid` int(10) unsigned DEFAULT NULL COMMENT '定单id',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(20) DEFAULT NULL COMMENT '商品数量',
  `gid` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  `amount` double DEFAULT NULL COMMENT '本条目总额',
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`),
  KEY `gid` (`gid`),
  KEY `cid` (`cid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

/*Data for the table `items` */

insert  into `items`(`cid`,`oid`,`id`,`num`,`gid`,`amount`) values (NULL,4,3,2,15,198),(NULL,4,4,1,12,34.8),(NULL,4,5,2,11,400),(NULL,5,6,4,11,800),(NULL,5,7,4,12,139.2),(NULL,9,24,1,11,200),(NULL,9,25,2,12,69.6),(NULL,10,26,1,14,1799),(NULL,11,35,1,12,34.8),(NULL,11,36,1,16,198),(NULL,12,38,1,12,34.8),(NULL,13,39,2,3,240),(NULL,14,40,1,17,1999),(NULL,15,42,1,13,2499),(NULL,16,43,3,2,9897),(NULL,18,45,1,21,3688),(NULL,19,46,2,37,378),(NULL,20,47,2,39,360),(NULL,21,49,1,36,189),(NULL,22,50,1,38,109),(NULL,23,51,2,12,69.6),(NULL,24,54,1,2,3399);

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(10) DEFAULT NULL COMMENT '用户等级',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `discount` double DEFAULT NULL COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `level` */

insert  into `level`(`id`,`level`,`integral`,`discount`) values (1,1,1000,1),(2,2,5000,0.99),(3,3,10000,0.98),(4,4,50000,0.97),(5,5,100000,0.96),(6,6,150000,0.95),(7,7,200000,0.94),(8,8,250000,0.93),(9,9,500000,0.92),(10,10,1000000,0.91);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `details` varchar(500) DEFAULT NULL COMMENT '内容',
  `addTime` varchar(20) DEFAULT NULL COMMENT '添加时间',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '发布人id',
  `picture` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`details`,`addTime`,`uid`,`picture`,`status`) values (6,'由于系统定期维护，本周六暂停服务，周一早上8点恢复正常',NULL,'2014-05-12 22:26:19',6,NULL,1),(7,'本商城所售商品均为正品，请大家放心购买',NULL,'2014-05-12 22:29:29',6,NULL,1),(8,'最近有部分用户密码丢失，请大家保护好自己的密码，不要告诉他人',NULL,'2014-05-12 22:30:46',6,NULL,1),(9,'端午节全场八折，机不可失，时不再来',NULL,'2014-05-13 22:25:48',6,NULL,1),(10,'本商城所有商品全网最低，质量有保证,假一陪十',NULL,'2014-05-16 09:24:59',6,NULL,1);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `oid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `cid` int(10) unsigned DEFAULT NULL COMMENT '购物车id',
  `num` varchar(100) DEFAULT NULL COMMENT '订单编号',
  `otime` varchar(20) DEFAULT NULL COMMENT '下单时间',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '收获地址id',
  `total` double DEFAULT NULL COMMENT '总价',
  `status` int(2) NOT NULL COMMENT '0:已删除   1：存在  2:永久删除',
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  KEY `aid` (`aid`),
  KEY `cid` (`cid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `address` (`aid`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`oid`,`cid`,`num`,`otime`,`uid`,`aid`,`total`,`status`) values (4,NULL,'OR-6-20144171812483880','2014-04-12 12:31:20',6,4,632.8,1),(5,NULL,'OR-6-20144172052318260','2014-04-15 10:19:24',6,4,939.2,2),(9,NULL,'OR-6-2014420154923447','2014-04-20 15:49:23',6,9,269.6,1),(10,NULL,'OR-6-2014420205395572','2014-04-20 20:05:39',6,9,1799,1),(11,NULL,'OR-13-20144261829338250','2014-04-26 18:29:33',13,10,232.8,1),(12,NULL,'OR-7-20144261845113096','2014-04-26 18:45:11',7,11,34.8,1),(13,NULL,'OR-7-201442619117951','2014-04-26 19:01:17',7,11,240,1),(14,NULL,'OR-6-2014427153359867','2014-04-27 15:33:59',6,4,1999,1),(15,NULL,'OR-13-20144271633158339','2014-04-27 16:33:15',13,10,2499,1),(16,NULL,'OR-6-2014530486522','2014-05-03 00:04:08',6,4,9897,0),(18,NULL,'OR-6-20145171013412332','2014-05-17 10:13:41',6,5,3688,1),(19,NULL,'OR-6-20146101624352759','2014-06-10 16:24:35',6,4,378,1),(20,NULL,'OR-6-20146111949375680','2014-06-11 19:49:37',6,4,360,2),(21,NULL,'OR-6-2014612919508547','2014-06-12 09:19:50',6,4,189,2),(22,NULL,'OR-6-20146161237412054','2014-06-16 12:37:41',6,5,109,1),(23,NULL,'OR-6-20146161312509513','2014-06-16 13:12:50',6,4,69.6,1),(24,NULL,'OR-6-20146161631386799','2014-06-16 16:31:38',6,5,3399,1);

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned DEFAULT NULL COMMENT '商品id',
  `snum` int(10) DEFAULT NULL COMMENT '进货数量',
  `sprice` double DEFAULT NULL COMMENT '进价',
  `sdate` varchar(20) DEFAULT NULL COMMENT '进货时间',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stock` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `headImg` varchar(150) DEFAULT NULL,
  `regTime` varchar(20) DEFAULT NULL,
  `regIP` varchar(20) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `money` double DEFAULT '0',
  `level` int(10) unsigned DEFAULT '1',
  `admin` varchar(2) DEFAULT '否',
  `service` varchar(2) DEFAULT '否',
  PRIMARY KEY (`uid`),
  KEY `level` (`level`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`uname`,`pwd`,`email`,`headImg`,`regTime`,`regIP`,`phone`,`money`,`level`,`admin`,`service`) values (3,'steve','123','steve_hi@163.com',NULL,'2013-12-01 15:15:41','127.0.0.1','15022542881',0,1,'是','否'),(5,'王伟','ww','ww@163.com',NULL,'2013-12-01 15:17:41','127.0.0.1',NULL,0,1,'否','否'),(6,'郭世杰','guo','steve_hi@163.com','/jb_ssh/images/headImg/201467141355799.jpg','2013-12-01 15:33:57','127.0.0.1','15022542881',31702,1,'是','否'),(7,'张三','zhangsan','zhangsan@qq.com',NULL,'2013-12-01 15:46:38','127.0.0.1','15022542881',1000,1,'否','否'),(8,'李四','lisi','lisi@163.com',NULL,'2013-12-01 15:49:16','127.0.0.1',NULL,0,1,'否','否'),(9,'王五','wuwu','wuwu@qq.com',NULL,'2013-12-01 15:52:06','127.0.0.1',NULL,0,1,'否','否'),(10,'赵二','123456','zhaoer@qq.com',NULL,'2013-12-01 15:54:46','127.0.0.1',NULL,0,1,'否','否'),(11,'谢霆锋','xie','xtf@163.com',NULL,'2013-12-01 16:38:34','127.0.0.1',NULL,0,1,'否','否'),(12,'王菲','wangfei','wangfei@163.com',NULL,'2013-12-01 21:58:43','127.0.0.1','15022542881',0,1,'是','是'),(13,'焦楠','jn','jn@163.com','/jb_ssh/images/headImg/20146141822335582.jpg','2013-12-01 23:06:40','127.0.0.1','12345678999',20000,1,'是','否'),(14,'王小伟','wangxiaowei','wangxiaowei@qq.com',NULL,'2013-12-03 10:02:59','127.0.0.1',NULL,0,1,'否','否'),(15,'王零伟','ww','ww@qq.com',NULL,'2013-12-03 10:22:10','127.0.0.1','18734913293',0,1,'否','否'),(16,'袁幸','maozedong','760377078@qq.com',NULL,'2013-12-03 10:24:52','10.2.195.31',NULL,0,1,'否','否'),(18,'任建鹏','rjp','rjp@qq.com',NULL,'2013-12-03 11:36:19','10.2.195.1',NULL,0,1,'否','否'),(19,'郭小杰','guo','guo@126.com',NULL,'2013-12-04 14:53:10','127.0.0.1','',0,1,'是','是'),(20,'王中伟','tyty','tyty@qq.com',NULL,'2013-12-04 16:13:34','127.0.0.1',NULL,0,1,'是','否'),(21,'王十伟','123','tyty@qq.com',NULL,'2013-12-09 09:13:17','127.0.0.1','18734411122',0,1,'否','否'),(22,'王三伟','56789','rjp@qq.com',NULL,'2013-12-04 17:04:23','127.0.0.1',NULL,0,1,'是','否'),(24,'王四伟','wwwww','xtf@163.com',NULL,'2013-12-04 17:08:05','127.0.0.1',NULL,0,1,'是','否'),(25,'王五伟','wangwu','wangwu@qq.com',NULL,'2013-12-04 17:09:13','127.0.0.1',NULL,0,1,'是','否'),(26,'王六伟','wlw','wlw@qq.com',NULL,'2013-12-04 17:10:56','127.0.0.1',NULL,0,1,'否','否'),(27,'王七伟','qiwei','qiwei@qq.com',NULL,'2013-12-04 17:12:25','127.0.0.1',NULL,0,1,'否','是'),(30,'段山山','ddd','ddd@qq.com',NULL,'2013-12-19 17:58:42','127.0.0.1','15022542222',0,1,'否','是'),(31,'段小山','sss','sss@qq.com',NULL,'2013-12-19 18:06:15','127.0.0.1',NULL,0,1,'是','否'),(32,'郭二杰','guo','guoshijie_hi@yeah.net',NULL,'2014-06-15 19:36:40','127.0.0.1',NULL,0,1,'是','是');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
