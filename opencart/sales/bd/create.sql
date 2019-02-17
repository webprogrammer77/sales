DROP TABLE IF EXISTS sales;
DROP TABLE sales_rules;

CREATE TABLE `sales_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(4) DEFAULT NULL,
  `vendor_id` int(4) DEFAULT NULL,
  `price_from` decimal(15,2) DEFAULT NULL,
  `price_to` decimal(15,2) DEFAULT NULL,
  `sale_a` int(3) DEFAULT NULL,
  `sale_b` int(3) DEFAULT NULL,
  `markup_from` int(4) DEFAULT NULL,
  `markup_to` int(4) DEFAULT NULL,
  `markup` int(4) DEFAULT NULL,
  `markup_min` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO sales_rules (cat_id,markup_from,markup_to,markup,markup_min) 
VALUES(3,8,18,7,300); 
INSERT INTO sales_rules (cat_id,markup_from,markup_to,markup,markup_min) 
VALUES(3,18.01,500,10,300); 
INSERT INTO sales_rules (cat_id,markup_from,markup_to,markup,markup_min) 
VALUES(4,10,18,10,300); 
INSERT INTO sales_rules (cat_id,markup_from,markup_to,markup,markup_min) 
VALUES(4,18.01,500,12,300);

INSERT INTO `sales_rules`(`id`, `category_id`, `manufacturer_id`, `price_from`, `price_to`, `sale_a`, `sale_b`) 
VALUES('1', '12','1', '0', '1000000000', '5', '10');
INSERT INTO `sales_rules`(`id`, `manufacturer_id`, `price_from`, `price_to`, `sale_a`, `sale_b`) 
VALUES('2', '141', '0', '1000000000', '3', '5');
INSERT INTO `sales_rules`(`id`, `manufacturer_id`, `price_from`, `price_to`, `sale_a`, `sale_b`) 
VALUES('3', '1', '9000', '1000000000', '5', '10');
INSERT INTO `sales_rules`(`id`, `manufacturer_id`, `price_from`, `price_to`, `sale_a`, `sale_b`) 
VALUES('4', '237', '10000', '1000000000', '15', '16');
INSERT INTO `sales_rules`(`id`, `price_from`, `price_to`, `sale_a`, `sale_b`) 
VALUES('5', '10001', '1000000000', '4', '5');
INSERT INTO `sales_rules`(`id`, `price_from`, `price_to`, `sale_a`, `sale_b`) 
VALUES('6', '0', '10000', '2', '3');
 
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` int(8) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(4) DEFAULT NULL,
  `manufacturer_id` int(4) DEFAULT NULL,
  `vendor_id` int(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `vendor_price` decimal(15,4) DEFAULT NULL,
  `sale_a` int(3) DEFAULT NULL,
  `sale_b` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prid` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `belotorg_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `belotorg_settings`(`type`,`value`)
VALUES('Download_over','1'),('pic_file_prefix','_big');

UPDATE `belotorg_settings`
SET `value` = 1
WHERE `type` = 'Download_over';

UPDATE `belotorg_settings`
SET `value` = '_big'
WHERE `type` = 'pic_file_prefix';