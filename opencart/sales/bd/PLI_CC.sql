--cc описание
DROP TABLE IF EXISTS e_cc_pics;;;
create table IF NOT EXISTS  `e_cc_pics` as select * from `etrade_cc_pics` where 1;;;


-- pli

UPDATE `etshop_product` SET `model`=' ' WHERE `model` = `sku`;;;
UPDATE `etshop_product` SET sku=1100000 + product_id;;;

DROP TABLE IF EXISTS ep;;;
create table IF NOT EXISTS  `ep` as select * from `etrade_products` where 1;;;

ALTER TABLE `ep` ADD INDEX tvid (`tov_id` ASC), ADD INDEX tcid (`tov_cat_id` ASC), ADD INDEX mid (`manufac_id` ASC);;;

UPDATE `belotorg_settings`SET `value` = 1 WHERE `type` = 'Download_over';;;

ALTER TABLE `a135132_sportano`.`ep` 
ADD INDEX tvid (`tov_id` ASC),
ADD INDEX tcid (`tov_cat_id` ASC),
ADD INDEX mid (`manufac_id` ASC),
ADD INDEX tid (`tov_id` ASC);;;

UPDATE `belotorg_settings`
SET
`value` = ''
WHERE `type` = 'pic_file_prefix';