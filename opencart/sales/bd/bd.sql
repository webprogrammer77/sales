--cc

DROP TABLE IF EXISTS e_cc_pics;;;
create table IF NOT EXISTS  `e_cc_pics` as select * from `etrade_cc_pics` where 1;;;

-- pli

UPDATE `product` SET `model`=' ' WHERE `model` = `sku`;;;
UPDATE `product` SET sku=1100000 + product_id;;;

DROP TABLE IF EXISTS ep;;;
create table IF NOT EXISTS  `ep` as select * from `etrade_products` where 1;;;


DROP TABLE IF EXISTS sales;
DROP TABLE sales_rules;


CREATE TABLE `sales_rules`
(
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
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
 
CREATE TABLE IF NOT EXISTS sales
( `id` INT NOT NULL AUTO_INCREMENT ,
`sku` INT( 8 ) NOT NULL, 
`product_id` INT( 11 ) NOT NULL, 
`category_id` INT( 4 ), 
`manufacturer_id` INT( 4 ), 
`vendor_id` INT( 4 ), 
`name` VARCHAR( 255 )  NULL,
`image` VARCHAR( 255 )  NULL,
`price` DECIMAL(15,2) NULL, 
`vendor_price` DECIMAL(15,4) NULL, 
`sale_a` INT( 3 ) NULL, 
`sale_b` INT( 3 ) NULL,
PRIMARY KEY( `id` )
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

UPDATE sales SET sale_a = 0, sale_b = 0 
WHERE sales.product_id 
IN (SELECT ep.tov_id FROM ep WHERE  tov_quantity <= 0);;;
-- sport
INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 5 , 10 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0
 AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
 AND ep.tov_cat_id=12 
 AND ep.manufac_id=1 
 AND ep.tov_price>=0.00 
 AND ep.tov_price<=1000000000.00 
 AND ecp.pic_order =1 
 AND ecp.pic_file_prefix = '_big'; 
 
 UPDATE sales, ep SET `sale_a` =5, `sale_b` = 10 
 WHERE ep.tov_id=sales.product_id 
 AND ep.tov_quantity>0 
 AND sales.`sale_b`<10 
 AND ep.tov_cat_id=12 
 AND ep.manufac_id=1
 AND ep.tov_price>=0.00 
 AND ep.tov_price<=1000000000.00; 
 
 INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
 SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 3 , 5 
 FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
 WHERE ep.tov_quantity>0 
 AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
 AND ep.manufac_id=141 
 AND ep.tov_price>=0.00 
 AND ep.tov_price<=1000000000.00 
 AND ecp.pic_order =1 
 AND ecp.pic_file_prefix = '_big'; 
 UPDATE sales, ep 
 SET `sale_a` =3, `sale_b` = 5 
 WHERE ep.tov_id=sales.product_id 
 AND ep.tov_quantity>0 
 AND sales.`sale_b`<5 
 AND ep.manufac_id=141 
 AND ep.tov_price>=0.00 
 AND ep.tov_price<=1000000000.00; 
 
 INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
 SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 5 , 10 
 FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
 WHERE ep.tov_quantity>0 
 AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
 AND ep.manufac_id=1 
 AND ep.tov_price>=9000.00 
 AND ep.tov_price<=1000000000.00 
 AND ecp.pic_order =1 
 AND ecp.pic_file_prefix = '_big'; 
 
 UPDATE sales, ep 
 SET `sale_a` =5, `sale_b` = 10 
 WHERE ep.tov_id=sales.product_id 
 AND ep.tov_quantity>0 
 AND sales.`sale_b`<10 
 AND ep.manufac_id=1 
 AND ep.tov_price>=9000.00 
 AND ep.tov_price<=1000000000.00; 

 INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
 SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 15 , 16 
 FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
 WHERE ep.tov_quantity>0 
 AND ep.tov_id NOT IN (SELECT product_id FROM sales)
 AND ep.manufac_id=237 AND ep.tov_price>=10000.00 
 AND ep.tov_price<=1000000000.00 
 AND ecp.pic_order =1 
 AND ecp.pic_file_prefix = '_big'; 
 
 UPDATE sales, ep 
 SET `sale_a` =15, `sale_b` = 16 
 WHERE ep.tov_id=sales.product_id 
 AND ep.tov_quantity>0 
 AND sales.`sale_b`<16 
 AND ep.manufac_id=237 
 AND ep.tov_price>=10000.00 
 AND ep.tov_price<=1000000000.00; 
 
INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 4 , 5 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ep.tov_price>=10001.00 
AND ep.tov_price<=1000000000.00 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big'; 

UPDATE sales, ep SET `sale_a` =4, `sale_b` = 5 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<5 
AND ep.tov_price>=10001.00 
AND ep.tov_price<=1000000000.00; 

INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 2 , 3 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ep.tov_price>=0.00 
AND ep.tov_price<=10000.00 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big'; 

UPDATE sales, ep SET `sale_a` =2, `sale_b` = 3 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<3 
AND ep.tov_price>=0.00 
AND ep.tov_price<=10000.00;
-- -----------
