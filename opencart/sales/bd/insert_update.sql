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

INSERT INTO `belotorg_settings`(`type`,`value`)
VALUES('Download_over','1'),('pic_file_prefix','');

UPDATE `belotorg_settings`
SET `value` = 1
WHERE `type` = 'Download_over';

UPDATE `belotorg_settings`
SET `value` = ''
WHERE `type` = 'pic_file_prefix';

INSERT INTO sales (product_id, `name`, image, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, ep.price_cost*(1+ (7/100)) AS sale_a, ep.price_cost*(1+ (7/100)) AS sale_b 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ep.tov_cat_id=3 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=8 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=18 
AND ep.tov_price - ep.price_cost> 300 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big';

UPDATE sales, ep 
SET `sale_a` =ep.price_cost*(1+ (7/100)) , `sale_b` = ep.price_cost*(1+ (7/100)) 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<  ep.price_cost*(1+ (7/100)) 
AND ep.tov_cat_id=3 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=8 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=18 
AND ep.tov_price - ep.price_cost> 300;

INSERT INTO sales (product_id, `name`, image, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, ep.price_cost*(1+ (10/100)) AS sale_a, ep.price_cost*(1+ (10/100)) AS sale_b 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ep.tov_cat_id=3 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=18 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=500 
AND ep.tov_price - ep.price_cost> 300 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big';

UPDATE sales, ep 
SET `sale_a` =ep.price_cost*(1+ (10/100)) , `sale_b` = ep.price_cost*(1+ (10/100)) 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<  ep.price_cost*(1+ (10/100)) 
AND ep.tov_cat_id=3 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=18 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=500 
AND ep.tov_price - ep.price_cost> 300;

INSERT INTO sales (product_id, `name`, image, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, ep.price_cost*(1+ (10/100)) AS sale_a, ep.price_cost*(1+ (10/100)) AS sale_b 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ep.tov_cat_id=4 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=10 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=18 
AND ep.tov_price - ep.price_cost> 300 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big';

UPDATE sales, ep 
SET `sale_a` =ep.price_cost*(1+ (10/100)) , `sale_b` = ep.price_cost*(1+ (10/100)) 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<  ep.price_cost*(1+ (10/100)) 
AND ep.tov_cat_id=4 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=10 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=18 
AND ep.tov_price - ep.price_cost> 300;

INSERT INTO sales (product_id, `name`, image, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, ep.price_cost*(1+ (12/100)) AS sale_a, ep.price_cost*(1+ (12/100)) AS sale_b 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ep.tov_cat_id=4 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=18 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=500 
AND ep.tov_price - ep.price_cost> 300 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big';

UPDATE sales, ep 
SET `sale_a` =ep.price_cost*(1+ (12/100)) , `sale_b` = ep.price_cost*(1+ (12/100)) 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<  ep.price_cost*(1+ (12/100)) 
AND ep.tov_cat_id=4 
AND (((1-(ep.price_cost/ep.tov_price))*100))>=18 
AND (((1-(ep.price_cost/ep.tov_price))*100))<=500 
AND ep.tov_price - ep.price_cost> 300;

INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) 
SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, 1 , 2 
FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) 
WHERE ep.tov_quantity>0 
AND ep.tov_id NOT IN (SELECT product_id FROM sales) 
AND ecp.pic_order =1 
AND ecp.pic_file_prefix = '_big';

UPDATE sales, ep 
SET `sale_a` =1, `sale_b` = 2 
WHERE  ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<2;

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
 AND ecp.pic_order =1 ;
 
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
 AND ecp.pic_order =1; 

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
 AND ecp.pic_order =1; 
 
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
 AND ecp.pic_order =1; 
 
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
AND ecp.pic_order =1; 

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
AND ecp.pic_order =1; 

UPDATE sales, ep SET `sale_a` =2, `sale_b` = 3 
WHERE ep.tov_id=sales.product_id 
AND ep.tov_quantity>0 
AND sales.`sale_b`<3 
AND ep.tov_price>=0.00 
AND ep.tov_price<=10000.00;
-- -----------