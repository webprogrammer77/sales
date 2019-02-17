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
nd ecp.pic_file_prefix = '_big';

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