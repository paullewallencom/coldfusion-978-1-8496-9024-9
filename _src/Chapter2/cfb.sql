-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for category_product
-- ----------------------------
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_category_product__product` (`product_id`),
  KEY `FK_category_product__category` (`category_id`),
  CONSTRAINT `FK_category_product__category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_category_product__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- View structure for testing
-- ----------------------------
CREATE VIEW `testing` AS select `product`.`id` AS `id`,`product`.`name` AS `name`,`product`.`description` AS `description`,`product`.`price` AS `price` from `product`;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Egg Plant', 'This is a squash like plant that has purple, green and white fruit on the bush.', '2.57');
INSERT INTO `product` VALUES ('2', 'Watermellon Plant', 'This is likely the largest and sweetest of the cucumber family.', '3.23');
INSERT INTO `product` VALUES ('3', 'Tomatoe Plants', 'This is the Roma variety.', '2.94');
INSERT INTO `product` VALUES ('5', 'Carrots', 'Beta vitamins in store.', '1.24');
INSERT INTO `product` VALUES ('6', 'Pea', 'These are great raw!', '0.23');
INSERT INTO `product` VALUES ('7', 'Spinach', 'Leaf wonder of the garden containing both iron, Vitamin A, B...', '1.54');
