/*
Navicat MySQL Data Transfer

Source Server         : dxj
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : oa

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-04-26 20:05:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add movie', '7', 'add_movie');
INSERT INTO `auth_permission` VALUES ('20', 'Can change movie', '7', 'change_movie');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete movie', '7', 'delete_movie');
INSERT INTO `auth_permission` VALUES ('22', 'Can add mobile', '8', 'add_mobile');
INSERT INTO `auth_permission` VALUES ('23', 'Can change mobile', '8', 'change_mobile');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete mobile', '8', 'delete_mobile');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime default NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$HnItPbcWmC4I$o517GrIeLxW3hIAteRQR8jrtGiZ0Y97V+yGkotaXxcY=', '2019-04-26 01:30:31', '1', 'dxj', '', '', '1054242248@qq.com', '1', '1', '2019-04-26 01:28:36');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('8', 'Spider', 'mobile');
INSERT INTO `django_content_type` VALUES ('7', 'Spider', 'movie');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL auto_increment,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'Spider', '0001_initial', '2019-04-26 01:26:31');
INSERT INTO `django_migrations` VALUES ('2', 'Spider', '0002_auto_20190426_0923', '2019-04-26 01:26:32');
INSERT INTO `django_migrations` VALUES ('3', 'contenttypes', '0001_initial', '2019-04-26 01:26:33');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0001_initial', '2019-04-26 01:26:35');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0001_initial', '2019-04-26 01:26:36');
INSERT INTO `django_migrations` VALUES ('6', 'admin', '0002_logentry_remove_auto_add', '2019-04-26 01:26:36');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2019-04-26 01:26:36');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2019-04-26 01:26:36');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2019-04-26 01:26:36');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2019-04-26 01:26:36');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2019-04-26 01:26:37');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2019-04-26 01:26:37');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2019-04-26 01:26:37');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2019-04-26 01:26:37');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2019-04-26 01:26:37');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2019-04-26 01:26:38');
INSERT INTO `django_migrations` VALUES ('17', 'Spider', '0003_remove_movie_movie_ename', '2019-04-26 02:04:21');
INSERT INTO `django_migrations` VALUES ('18', 'Spider', '0004_mobile', '2019-04-26 03:15:52');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('i2kn9ji750zu8jmh2gg93966ogu5vla7', 'MzIwMjg3NzY2MGQ2MWI0NDc1ZDBjYjZkY2RhYTcxYzM0MjI2MjI0OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NDBiMjE2MDQ5NmU4MDI4OTNhZjY0MWVjNzgxN2QwMDRhYWM1ZmYzIn0=', '2019-05-10 01:30:31');

-- ----------------------------
-- Table structure for `jd_mobile`
-- ----------------------------
DROP TABLE IF EXISTS `jd_mobile`;
CREATE TABLE `jd_mobile` (
  `id` int(11) NOT NULL auto_increment,
  `p_name` varchar(255) NOT NULL,
  `p_price` varchar(255) default NULL,
  `p_comment` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jd_mobile
-- ----------------------------
INSERT INTO `jd_mobile` VALUES ('1', 'vivoZ3 6GB+64GB大内存 领券立减100元', '1598.00', '');
INSERT INTO `jd_mobile` VALUES ('2', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄 4GB+64GB 幻夜黑 移动联通电信4G全面屏, 双卡双待', '1298.00', '限时优惠1299！麒麟710处理器，2000万AI双摄，人脸+指纹双识别！荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('3', 'Apple iPhone XR (A2108) 128GB 黑色 移动联通电信4G, 双卡双待', '5699.00', '【五一假期提前放价，抢券立减400元】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('4', '【KPL官方比赛用机】vivo iQOO 44W超快闪充 8GB+128GB电光蓝 全面屏拍照, 骁龙855电竞游戏 全网通4G', '3298.00', '【白条3期免息+赠蓝牙耳机！晒单评价赢50元E卡！】高通骁龙855，44W超快闪充，4000mAh大电池，非凡电竞体验X27新品上市，立即抢购');
INSERT INTO `jd_mobile` VALUES ('5', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB 渐变蓝 移动联通电信4G全面屏, 双卡双待', '1298.00', '限时优惠1299，下单再减50，成交价1249！2400万AI高清自拍，麒麟710处理器，炫光渐变色！荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('6', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB 幻夜黑 移动联通电信4G全面屏, 双卡双待', '898.00', '限时优惠899！高通6系列芯片+4000mAh大电池+指纹识别+4GB大内存！荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('7', '小米 红米Redmi Note7 幻彩渐变AI双摄 4GB+64GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '1199.00', '【品质特惠】4800万拍照千元机，品质\"小金刚\"，18个月长质保，\"满血版\"骁龙660，4000mAh大电量！品质好物选小米，京东选购更省钱');
INSERT INTO `jd_mobile` VALUES ('8', 'vivo U1 水滴全面屏 AI智慧拍照, 3GB+32GB 极光色 移动联通电信全网通4G', '799.00', '【25-28号限时加赠耳机】4030mAh大电池，6.2英寸全面水滴屏，后置双摄，指纹人脸双识别！Z3限时优惠200元，速抢！');
INSERT INTO `jd_mobile` VALUES ('9', '飞利浦（PHILIPS） E183A 按键直板 老人, 移动联通 双卡双待老年机 炫丽红', '158.00', '');
INSERT INTO `jd_mobile` VALUES ('10', '荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏', '2798.00', '限时优惠2799！麒麟980芯片，魅眼全视屏，4800万AI超清摄影！V20好时唯AI礼盒装，加礼盒不加价，限量抢购》》》');
INSERT INTO `jd_mobile` VALUES ('11', '小米9 4800万超广角三摄 8GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '3299.00', '【爆款抢购】骁龙855旗舰，索尼4800万广角微距三摄，屏下指纹解锁！经典旗舰小米8，品质特惠，领券立减，速抢！');
INSERT INTO `jd_mobile` VALUES ('12', '小米 红米6 全网通版 3GB内存 流沙金 32GB 移动联通电信4G, 双卡双待', '729.00', '【品质特惠】限时优惠70！成交价729！后置1200万AI双摄，12nm八核处理器！品质好物选小米，京东选购更省钱');
INSERT INTO `jd_mobile` VALUES ('13', '小米8SE 全面屏智能游戏拍照, 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待', '1399.00', '【品质特惠】限时特惠成交价1399，骁龙710处理器，前置2000万柔光自拍，3120mAh长续航！品质好物选小米，京东选购更省钱');
INSERT INTO `jd_mobile` VALUES ('14', '小米 红米Redmi 7 AI双摄 3GB+32GB 亮黑色 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '799.00', '【品质特惠】4000mAh大电量，骁龙632八核处理器，18个月长质保，康宁第五代大猩猩玻璃盖板，1200万AI双摄！品质好物选小米，京东选购更省钱');
INSERT INTO `jd_mobile` VALUES ('15', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G', '6099.00', '【五一假期提前放价，抢券立减200元】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('16', '黑鲨游戏,2 8GB+128GB 暗影黑 骁龙855 Magic Press立体操控 塔式全域液冷 全面屏 全网通4G 双卡双待', '3499.00', '【购机赠左手柄套装，白条3期免息】竞在操控，骁龙855，MagicPress立体操控，塔式全域液冷散热，X+2天线，AI游戏引擎黑鲨开黑趴，购机享好礼！');
INSERT INTO `jd_mobile` VALUES ('17', '捷语（GoFly）N9户外三防  老人智能,  全网通4G  老年机  3G+32G  双卡双待 橙色', '799.00', '');
INSERT INTO `jd_mobile` VALUES ('18', 'vivo S1 6GB+128GB 冰湖蓝 2480万AI高清自拍 超广角后置三摄拍照,  移动联通电信全网通4G', '2298.00', '【S1新品上市，享6期免息+赠蓝牙耳机】2480万AI高清自拍，超广角AI三摄，零界全面屏，升降摄像头！X27新品上市，立即抢购');
INSERT INTO `jd_mobile` VALUES ('19', '荣耀10 GT游戏加速 AIS手持夜景 6GB+64GB 幻夜黑 全网通 移动联通电信4G 双卡双待 游戏', '2198.00', '');
INSERT INTO `jd_mobile` VALUES ('20', 'vivo X27 8GB+256GB大内存 雀羽蓝 4800万AI三摄全面屏拍照, 移动联通电信全网通4G', '3598.00', '【购机享12期免息+赠乐心手环+半年延保】4800万广角夜景三摄，4000mAh大电池，升降摄像头！iQOO享3期免息赠好礼，速抢！');
INSERT INTO `jd_mobile` VALUES ('21', 'Apple iPhone 8 (A1863) 64GB 深空灰色 移动联通电信4G', '3799.00', '【五一假期提前放价】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('22', '小米 红米Redmi Note7Pro AI双摄 6GB+128GB 梦幻蓝 全网通4G 双卡双待 水滴屏拍照游戏', '1599.00', '索尼4800万拍照，18个月长质保，骁龙675，4000mAh大电量，P2i整机防泼溅处理，标配18W充电器！小米爆品特惠，选品质，购小米！');
INSERT INTO `jd_mobile` VALUES ('23', '小米 红米6A AI美颜 3GB+32GB 流沙金 全网通4G, 双卡双待', '649.00', '【品质特惠】到手价价649！1300万高清相机，小杨柳腰机身！品质好物选小米，京东选购更省钱');
INSERT INTO `jd_mobile` VALUES ('24', '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB 幻夜黑 移动联通电信4G全面屏, 双卡双待', '1599.00', '前置3200万AI相机，后置2400万AI三摄，3D炫光渐变机身！荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('25', 'OPPO R17 ,【已降200元+6期免息+碎屏险+耳机音箱等】128G版屏幕指纹游戏拍照水滴屏 R17 流光蓝(8G+128G)', '2999.00', '');
INSERT INTO `jd_mobile` VALUES ('26', 'Apple iPhone 8 Plus (A1864) 64GB 深空灰色 移动联通电信4G', '4699.00', '【五一假期提前放价】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('27', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版,8GB+64GB亮黑色全网通双4G,双', '3988.00', '麒麟980芯片，6.1英寸OLED全面屏，屏内指纹，感光徕卡三摄，5倍混合变焦华为新品季，新品不断，优惠升级，详情猛戳》');
INSERT INTO `jd_mobile` VALUES ('28', 'Apple iPhone XS Max (A2104) 64GB 金色 移动联通电信4G, 双卡双待', '8299.00', '【五一假期提前放价，抢券立减600元】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('29', 'OPPO Reno 全面屏拍照, 8G+256G 雾海绿 全网通 移动联通电信 双卡双待', '3599.00', 'Reno新品首发，享6期免息+N6蓝牙音箱+京东180天只换不修服务，隐藏式摄像头，4800万像素，闪充3.0，屏下指纹。Reno10倍变焦版，立即预定');
INSERT INTO `jd_mobile` VALUES ('30', '诺基亚 NOKIA X6 6GB+64GB 星空黑 全网通 双卡双待 移动联通电信4G', '1069.00', '诺基亚X6，原生安卓，智能AI，双面玻璃机身，超高屏占比，越级体验，爱我所爱，速来抢购！点击查看更多》》》');
INSERT INTO `jd_mobile` VALUES ('31', 'Apple iPhone 7 (A1660) 128G 黑色 移动联通电信4G', '3199.00', '【五一假期提前放价】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('32', '华为 HUAWEI nova 4e 3200万立体美颜AI超广角三摄珍珠屏6GB+128GB幻夜黑全网通版双4G', '2299.00', '3200万立体美颜AI超广角三摄，3D幻彩玻璃机身新品预约优惠50，千元AI三摄,拍照旗舰，火爆预约中》');
INSERT INTO `jd_mobile` VALUES ('33', 'vivo U1 水滴全面屏 AI智慧拍照, 4GB+64GB 极光色 移动联通电信全网通4G', '1099.00', '');
INSERT INTO `jd_mobile` VALUES ('34', '华为 HUAWEI Mate 20 麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB亮黑色全网通版双4G', '3999.00', '【优惠500+赠送叮咚音箱+6期免息，到手价3999！】麒麟980AI智能芯片，超微距影像超大广角徕卡三摄华为新品季，mate20系列优惠不断，详情猛戳》');
INSERT INTO `jd_mobile` VALUES ('35', '华为 HUAWEI 畅享 9S 4GB+64GB 极光蓝 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G, 双卡双待', '1499.00', '【购机无线运动蓝牙线控耳机】麒麟710,6.21英寸珍珠屏,2400万广角三摄大存储大电池新品预约优惠50，千元AI三摄,拍照旗舰，火爆预约中》');
INSERT INTO `jd_mobile` VALUES ('36', '华为 HUAWEI P30 Pro 超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+256GB亮黑色全网通版双4G', '', '【4.28日10点08分，品牌日，P30pro限量抢购】4000万感光徕卡四摄，50倍数字变焦P30系列，稀缺货源火热抢购中，详情猛戳》');
INSERT INTO `jd_mobile` VALUES ('37', '小米9 SE 4800万超广角三摄 骁龙712 水滴全面屏 游戏智能拍照, 6GB+128GB 全息幻彩蓝 全网通4G双卡双待', '2299.00', '【爆款抢购】三星AMOLED屏，索尼4800万相机，屏幕指纹解锁！经典旗舰小米8，品质特惠，领券立减，速抢！');
INSERT INTO `jd_mobile` VALUES ('38', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB 幻夜黑 移动联通电信4G全面屏, 双卡双待', '799.00', '荣耀手机新品8A，等你来购！荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('39', '三星 Galaxy S10 8GB+128GB皓玉白（SM-G9730）超感官全视屏骁龙855双卡双待全网通4G游戏', '5999.00', '【白条12期免息】赠品四选一，骁龙855游戏手机！3D超声波屏下指纹！购买加送百日体验服务！开启百日体验S10计划');
INSERT INTO `jd_mobile` VALUES ('40', '华为 HUAWEI 畅享9 Plus 4GB+64GB 极光紫 全网通 四摄超清全面屏大电池 移动联通电信4G, 双卡双待', '1399.00', '【优惠100,到手价1399！】6.5英寸超清全面屏,1600万高清拍摄,4000mAh超长续航！新品预约优惠50，千元AI三摄,拍照旗舰，火爆预约中》');
INSERT INTO `jd_mobile` VALUES ('41', '【预售】魅族 16s 骁龙855全面屏拍照游戏, 6GB+128GB 碳纤黑 全网通移动联通电信4G, 双卡双待', '3198.00', '');
INSERT INTO `jd_mobile` VALUES ('42', '华为 HUAWEI 畅享 9e 实力大音量高像素珍珠屏3GB+64GB幻夜黑全网通版双4G', '999.00', '【购机无线运动蓝牙线控耳机】6.09英寸高清珍珠屏,大存储大音量,出彩夜拍新品预约优惠50，千元AI三摄,拍照旗舰，火爆预约中》');
INSERT INTO `jd_mobile` VALUES ('43', 'Apple iPhone XS (A2100) 64GB 金色 移动联通电信4G', '7599.00', '【五一假期提前放价，抢券立减500元】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('44', '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏, 2000万超广角三摄 6GB+128GB 亮黑色 全网通双卡双待', '2699.00', '【优惠100，到手价2699】6.4英寸极点全面屏/2500万海报级自拍新品预约优惠50，千元AI三摄,拍照旗舰，火爆预约中》');
INSERT INTO `jd_mobile` VALUES ('45', '一加,6T 8GB+128GB 墨岩黑 超强城市夜景 光感屏幕指纹 全面屏双摄游戏, 全网通4G 双卡双待', '3199.00', '活动期间10点购机前50名赠复联4等电影兑换券！购机立省400元+3期免息+赠碎屏险,赠完即止!一加品牌更多精彩猛戳查看！');
INSERT INTO `jd_mobile` VALUES ('46', '三星 Galaxy S10+ 8GB+128GB皓玉白（SM-G9750）3D超声波屏下指纹超感官全视屏双卡双待全网通4G游戏', '6999.00', '【白条12期免息】赠品四选一，骁龙855游戏手机！3D超声波屏下指纹！购买加送百日体验服务！开启百日体验S10计划');
INSERT INTO `jd_mobile` VALUES ('47', '荣耀Note10 全网通6G+64G 幻夜黑 移动联通电信4G全面屏, 双卡双待 游戏', '2598.00', '领券立减500，成交价2099！6.95英寸全面屏！液冷双Turbo！荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('48', 'Apple iPhone 7 Plus (A1661) 128G 黑色 移动联通电信4G', '4199.00', '【五一假期提前放价】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');
INSERT INTO `jd_mobile` VALUES ('49', '小辣椒 红辣椒7X 4+64GB 学生智能, 美颜双摄 微Q多开 人脸识别 移动联通电信4G全网通 黑色', '689.00', '');
INSERT INTO `jd_mobile` VALUES ('50', '小米8青春版 镜面渐变AI双摄 6GB+64GB 深空灰 全网通4G 双卡双待 全面屏拍照游戏智能', '1499.00', '【爆品抢购】领券立减200，到手价1299，索尼2400万自拍旗舰，AI裸妆美颜，骁龙660AIE处理器！品质好物选小米，京东选购更省钱');
INSERT INTO `jd_mobile` VALUES ('51', '华为 HUAWEI Mate 20 Pro (UD)屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB亮黑色全网通双4G', '5499.00', '【优惠500+6期免息，到手价5499】麒麟980AI智能芯片，超微距影像超大广角徕卡三摄华为新品季，mate20系列优惠不断，详情猛戳》');
INSERT INTO `jd_mobile` VALUES ('52', '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏, 6GB+64GB 极光色 全网通移动联通电信4G, 双卡双待', '3088.00', '【优惠300，到手价3088】麒麟970芯片/DxO评分过百P30系列，稀缺货源火热抢购中，详情猛戳》');
INSERT INTO `jd_mobile` VALUES ('53', 'OPPO R17 2500万美颜拍照 6.4英寸水滴屏 光感屏幕指纹 6G+128G 流光蓝 全网通 移动联通电信4G 双卡双待', '2399.00', '【6G版直降200元到手2399元，8G版直降200元到手2999元。6期免息+蓝牙音箱】光感屏幕指纹，2500前置！Reno10倍变焦版，立即预定');
INSERT INTO `jd_mobile` VALUES ('54', '荣耀 畅玩7 2GB+16GB 金色 全网通4G, 双卡双待', '599.00', '全面屏，小身材，大视野！小巧全面屏,通话大音量,柔光自拍黑夜自拍更得心应手。荣耀爆品特惠，选品质，购荣耀~');
INSERT INTO `jd_mobile` VALUES ('55', 'OPPO K1  光感屏幕指纹 水滴屏拍照,  4G+64G 摩卡红 全网通 移动联通电信4G 双卡双待', '1399.00', '【4G版优惠50元，到手仅需1349！3期免息】屏幕指纹解锁手机，前置2500万，AI智慧拍照美颜！Reno10倍变焦版，立即预定');
INSERT INTO `jd_mobile` VALUES ('56', 'HUAWEI  华为畅享9  3GB+32GB 幻夜黑 高清珍珠屏 AI长续航 全网通标配版 移动联通电信4G', '949.00', '【优惠100,到手价899】6.26英寸全面屏,AI智慧双摄,4000mAh大电池新品预约优惠50，千元AI三摄,拍照旗舰，火爆预约中》');
INSERT INTO `jd_mobile` VALUES ('57', '荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏', '2798.00', '');
INSERT INTO `jd_mobile` VALUES ('58', '魅族 Note9 全面屏游戏拍照, 4GB+64GB 幻黑 全网通移动联通电信4G, 双卡双待', '1398.00', '6.2英寸全面屏，4800万像素，4000mAh大电池容量！魅族Note9，吃鸡不卡，拍她更美~');
INSERT INTO `jd_mobile` VALUES ('59', '华为 HUAWEI P20 Pro 全面屏徕卡三摄游戏, 6GB+128GB 亮黑色 全网通移动联通电信4G, 双卡双待', '3988.00', '4000万徕卡三摄/DxO评分过百华为新品季，更多优惠猛戳》');
INSERT INTO `jd_mobile` VALUES ('60', 'Apple iPhone 6s Plus (A1699) 128G 玫瑰金色 移动联通电信4G', '2999.00', '【五一假期提前放价】小屏经典iPhone7仅售3199元，iPhoneXR低至4799元！白条12期免息券27日截止，限时限量速抢！');

-- ----------------------------
-- Table structure for `top_movie`
-- ----------------------------
DROP TABLE IF EXISTS `top_movie`;
CREATE TABLE `top_movie` (
  `id` int(11) NOT NULL auto_increment,
  `m_name` varchar(255) NOT NULL,
  `m_href` varchar(255) default NULL,
  `m_star` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of top_movie
-- ----------------------------
INSERT INTO `top_movie` VALUES ('41', '肖申克的救赎', 'https://movie.douban.com/subject/1292052/', '9.6');
INSERT INTO `top_movie` VALUES ('42', '霸王别姬', 'https://movie.douban.com/subject/1291546/', '9.6');
INSERT INTO `top_movie` VALUES ('43', '这个杀手不太冷', 'https://movie.douban.com/subject/1295644/', '9.4');
INSERT INTO `top_movie` VALUES ('44', '阿甘正传', 'https://movie.douban.com/subject/1292720/', '9.4');
INSERT INTO `top_movie` VALUES ('45', '美丽人生', 'https://movie.douban.com/subject/1292063/', '9.5');
INSERT INTO `top_movie` VALUES ('46', '泰坦尼克号', 'https://movie.douban.com/subject/1292722/', '9.3');
INSERT INTO `top_movie` VALUES ('47', '千与千寻', 'https://movie.douban.com/subject/1291561/', '9.3');
INSERT INTO `top_movie` VALUES ('48', '辛德勒的名单', 'https://movie.douban.com/subject/1295124/', '9.5');
INSERT INTO `top_movie` VALUES ('49', '盗梦空间', 'https://movie.douban.com/subject/3541415/', '9.3');
INSERT INTO `top_movie` VALUES ('50', '忠犬八公的故事', 'https://movie.douban.com/subject/3011091/', '9.3');
INSERT INTO `top_movie` VALUES ('51', '机器人总动员', 'https://movie.douban.com/subject/2131459/', '9.3');
INSERT INTO `top_movie` VALUES ('52', '三傻大闹宝莱坞', 'https://movie.douban.com/subject/3793023/', '9.2');
INSERT INTO `top_movie` VALUES ('53', '海上钢琴师', 'https://movie.douban.com/subject/1292001/', '9.2');
INSERT INTO `top_movie` VALUES ('54', '放牛班的春天', 'https://movie.douban.com/subject/1291549/', '9.3');
INSERT INTO `top_movie` VALUES ('55', '楚门的世界', 'https://movie.douban.com/subject/1292064/', '9.2');
INSERT INTO `top_movie` VALUES ('56', '大话西游之大圣娶亲', 'https://movie.douban.com/subject/1292213/', '9.2');
INSERT INTO `top_movie` VALUES ('57', '星际穿越', 'https://movie.douban.com/subject/1889243/', '9.2');
INSERT INTO `top_movie` VALUES ('58', '龙猫', 'https://movie.douban.com/subject/1291560/', '9.2');
INSERT INTO `top_movie` VALUES ('59', '教父', 'https://movie.douban.com/subject/1291841/', '9.3');
INSERT INTO `top_movie` VALUES ('60', '熔炉', 'https://movie.douban.com/subject/5912992/', '9.3');
INSERT INTO `top_movie` VALUES ('61', '无间道', 'https://movie.douban.com/subject/1307914/', '9.1');
INSERT INTO `top_movie` VALUES ('62', '疯狂动物城', 'https://movie.douban.com/subject/25662329/', '9.2');
INSERT INTO `top_movie` VALUES ('63', '当幸福来敲门', 'https://movie.douban.com/subject/1849031/', '9.0');
INSERT INTO `top_movie` VALUES ('64', '怦然心动', 'https://movie.douban.com/subject/3319755/', '9.0');
INSERT INTO `top_movie` VALUES ('65', '触不可及', 'https://movie.douban.com/subject/6786002/', '9.2');
INSERT INTO `top_movie` VALUES ('66', '蝙蝠侠：黑暗骑士', 'https://movie.douban.com/subject/1851857/', '9.1');
INSERT INTO `top_movie` VALUES ('67', '乱世佳人', 'https://movie.douban.com/subject/1300267/', '9.2');
INSERT INTO `top_movie` VALUES ('68', '活着', 'https://movie.douban.com/subject/1292365/', '9.2');
INSERT INTO `top_movie` VALUES ('69', '少年派的奇幻漂流', 'https://movie.douban.com/subject/1929463/', '9.0');
INSERT INTO `top_movie` VALUES ('70', '控方证人', 'https://movie.douban.com/subject/1296141/', '9.6');
INSERT INTO `top_movie` VALUES ('71', '天堂电影院', 'https://movie.douban.com/subject/1291828/', '9.2');
INSERT INTO `top_movie` VALUES ('72', '鬼子来了', 'https://movie.douban.com/subject/1291858/', '9.2');
INSERT INTO `top_movie` VALUES ('73', '指环王3：王者无敌', 'https://movie.douban.com/subject/1291552/', '9.1');
INSERT INTO `top_movie` VALUES ('74', '十二怒汉', 'https://movie.douban.com/subject/1293182/', '9.4');
INSERT INTO `top_movie` VALUES ('75', '天空之城', 'https://movie.douban.com/subject/1291583/', '9.1');
INSERT INTO `top_movie` VALUES ('76', '摔跤吧！爸爸', 'https://movie.douban.com/subject/26387939/', '9.0');
INSERT INTO `top_movie` VALUES ('77', '飞屋环游记', 'https://movie.douban.com/subject/2129039/', '8.9');
INSERT INTO `top_movie` VALUES ('78', '大话西游之月光宝盒', 'https://movie.douban.com/subject/1299398/', '9.0');
INSERT INTO `top_movie` VALUES ('79', '搏击俱乐部', 'https://movie.douban.com/subject/1292000/', '9.0');
INSERT INTO `top_movie` VALUES ('80', '罗马假日', 'https://movie.douban.com/subject/1293839/', '9.0');
INSERT INTO `top_movie` VALUES ('81', '哈尔的移动城堡', 'https://movie.douban.com/subject/1308807/', '9.0');
INSERT INTO `top_movie` VALUES ('82', '闻香识女人', 'https://movie.douban.com/subject/1298624/', '9.0');
INSERT INTO `top_movie` VALUES ('83', '辩护人', 'https://movie.douban.com/subject/21937445/', '9.2');
INSERT INTO `top_movie` VALUES ('84', '窃听风暴', 'https://movie.douban.com/subject/1900841/', '9.1');
INSERT INTO `top_movie` VALUES ('85', '末代皇帝', 'https://movie.douban.com/subject/1293172/', '9.1');
INSERT INTO `top_movie` VALUES ('86', '两杆大烟枪', 'https://movie.douban.com/subject/1293350/', '9.1');
INSERT INTO `top_movie` VALUES ('87', '飞越疯人院', 'https://movie.douban.com/subject/1292224/', '9.1');
INSERT INTO `top_movie` VALUES ('88', '死亡诗社', 'https://movie.douban.com/subject/1291548/', '9.0');
INSERT INTO `top_movie` VALUES ('89', '素媛', 'https://movie.douban.com/subject/21937452/', '9.2');
INSERT INTO `top_movie` VALUES ('90', '寻梦环游记', 'https://movie.douban.com/subject/20495023/', '9.0');
INSERT INTO `top_movie` VALUES ('91', '指环王2：双塔奇兵', 'https://movie.douban.com/subject/1291572/', '9.0');
INSERT INTO `top_movie` VALUES ('92', '教父2', 'https://movie.douban.com/subject/1299131/', '9.2');
INSERT INTO `top_movie` VALUES ('93', 'V字仇杀队', 'https://movie.douban.com/subject/1309046/', '8.9');
INSERT INTO `top_movie` VALUES ('94', '指环王1：魔戒再现', 'https://movie.douban.com/subject/1291571/', '9.0');
INSERT INTO `top_movie` VALUES ('95', '海豚湾', 'https://movie.douban.com/subject/3442220/', '9.3');
INSERT INTO `top_movie` VALUES ('96', '饮食男女', 'https://movie.douban.com/subject/1291818/', '9.1');
INSERT INTO `top_movie` VALUES ('97', '狮子王', 'https://movie.douban.com/subject/1301753/', '9.0');
INSERT INTO `top_movie` VALUES ('98', '美丽心灵', 'https://movie.douban.com/subject/1306029/', '8.9');
INSERT INTO `top_movie` VALUES ('99', '情书', 'https://movie.douban.com/subject/1292220/', '8.9');
INSERT INTO `top_movie` VALUES ('100', '钢琴家', 'https://movie.douban.com/subject/1296736/', '9.1');
INSERT INTO `top_movie` VALUES ('101', '本杰明·巴顿奇事', 'https://movie.douban.com/subject/1485260/', '8.8');
INSERT INTO `top_movie` VALUES ('102', '美国往事', 'https://movie.douban.com/subject/1292262/', '9.1');
INSERT INTO `top_movie` VALUES ('103', '看不见的客人', 'https://movie.douban.com/subject/26580232/', '8.8');
INSERT INTO `top_movie` VALUES ('104', '黑客帝国', 'https://movie.douban.com/subject/1291843/', '8.9');
INSERT INTO `top_movie` VALUES ('105', '小鞋子', 'https://movie.douban.com/subject/1303021/', '9.2');
INSERT INTO `top_movie` VALUES ('106', '西西里的美丽传说', 'https://movie.douban.com/subject/1292402/', '8.8');
INSERT INTO `top_movie` VALUES ('107', '大闹天宫', 'https://movie.douban.com/subject/1418019/', '9.3');
INSERT INTO `top_movie` VALUES ('108', '哈利·波特与魔法石', 'https://movie.douban.com/subject/1295038/', '8.9');
INSERT INTO `top_movie` VALUES ('109', '让子弹飞', 'https://movie.douban.com/subject/3742360/', '8.7');
INSERT INTO `top_movie` VALUES ('110', '拯救大兵瑞恩', 'https://movie.douban.com/subject/1292849/', '8.9');
INSERT INTO `top_movie` VALUES ('111', '致命魔术', 'https://movie.douban.com/subject/1780330/', '8.8');
INSERT INTO `top_movie` VALUES ('112', '七宗罪', 'https://movie.douban.com/subject/1292223/', '8.8');
INSERT INTO `top_movie` VALUES ('113', '被嫌弃的松子的一生', 'https://movie.douban.com/subject/1787291/', '8.9');
INSERT INTO `top_movie` VALUES ('114', '音乐之声', 'https://movie.douban.com/subject/1294408/', '9.0');
INSERT INTO `top_movie` VALUES ('115', '低俗小说', 'https://movie.douban.com/subject/1291832/', '8.8');
INSERT INTO `top_movie` VALUES ('116', '沉默的羔羊', 'https://movie.douban.com/subject/1293544/', '8.8');
INSERT INTO `top_movie` VALUES ('117', '天使爱美丽', 'https://movie.douban.com/subject/1292215/', '8.7');
INSERT INTO `top_movie` VALUES ('118', '猫鼠游戏', 'https://movie.douban.com/subject/1305487/', '8.9');
INSERT INTO `top_movie` VALUES ('119', '勇敢的心', 'https://movie.douban.com/subject/1294639/', '8.9');
INSERT INTO `top_movie` VALUES ('120', '蝴蝶效应', 'https://movie.douban.com/subject/1292343/', '8.7');
INSERT INTO `top_movie` VALUES ('121', '剪刀手爱德华', 'https://movie.douban.com/subject/1292370/', '8.7');
INSERT INTO `top_movie` VALUES ('122', '春光乍泄', 'https://movie.douban.com/subject/1292679/', '8.9');
INSERT INTO `top_movie` VALUES ('123', '心灵捕手', 'https://movie.douban.com/subject/1292656/', '8.8');
INSERT INTO `top_movie` VALUES ('124', '禁闭岛', 'https://movie.douban.com/subject/2334904/', '8.7');
INSERT INTO `top_movie` VALUES ('125', '布达佩斯大饭店', 'https://movie.douban.com/subject/11525673/', '8.8');
INSERT INTO `top_movie` VALUES ('126', '穿条纹睡衣的男孩', 'https://movie.douban.com/subject/3008247/', '9.0');
INSERT INTO `top_movie` VALUES ('127', '入殓师', 'https://movie.douban.com/subject/2149806/', '8.8');
INSERT INTO `top_movie` VALUES ('128', '阿凡达', 'https://movie.douban.com/subject/1652587/', '8.7');
INSERT INTO `top_movie` VALUES ('129', '幽灵公主', 'https://movie.douban.com/subject/1297359/', '8.8');
INSERT INTO `top_movie` VALUES ('130', '阳光灿烂的日子', 'https://movie.douban.com/subject/1291875/', '8.8');
INSERT INTO `top_movie` VALUES ('131', '致命ID', 'https://movie.douban.com/subject/1297192/', '8.7');
INSERT INTO `top_movie` VALUES ('132', '第六感', 'https://movie.douban.com/subject/1297630/', '8.8');
INSERT INTO `top_movie` VALUES ('133', '加勒比海盗', 'https://movie.douban.com/subject/1298070/', '8.7');
INSERT INTO `top_movie` VALUES ('134', '狩猎', 'https://movie.douban.com/subject/6985810/', '9.1');
INSERT INTO `top_movie` VALUES ('135', '断背山', 'https://movie.douban.com/subject/1418834/', '8.7');
INSERT INTO `top_movie` VALUES ('136', '玛丽和马克思', 'https://movie.douban.com/subject/3072124/', '8.9');
INSERT INTO `top_movie` VALUES ('137', '重庆森林', 'https://movie.douban.com/subject/1291999/', '8.7');
INSERT INTO `top_movie` VALUES ('138', '摩登时代', 'https://movie.douban.com/subject/1294371/', '9.2');
INSERT INTO `top_movie` VALUES ('139', '喜剧之王', 'https://movie.douban.com/subject/1302425/', '8.7');
INSERT INTO `top_movie` VALUES ('140', '告白', 'https://movie.douban.com/subject/4268598/', '8.7');
