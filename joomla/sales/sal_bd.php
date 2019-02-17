<?php

include '../configuration.php';
$cfg = new JConfig();
$hostname               = $cfg->host;
$username               = $cfg->user;
$password               = $cfg->password;
$dbName                 = $cfg->db;

/*
include '../config.php';

$hostname = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$dbName   = DB_DATABASE;
*/
mysql_connect($hostname,$username,$password) OR DIE("Не могу создать соединение ");
mysql_select_db($dbName) or die(mysql_error());

// Исправьте, если у вас другая кодировка в БД
mysql_query('set names utf8');

$query_sales_rules = "SELECT value FROM belotorg_settings WHERE type='Download_over_tyres'";
$res1tt = mysql_query($query_sales_rules) or die(mysql_error());
$par_name=mysql_fetch_array($res1tt);
$need_create_yml =$par_name['value'];		

if(trim($need_create_yml )== '1')
{
$query_update_2 = "UPDATE  belotorg_settings SET `value` = '2' WHERE `type` = 'Download_over_tyres'";
mysql_query($query_update_2) or die(mysql_error());

$query_drop="DROP TABLE IF EXISTS sales";
mysql_query($query_drop) or die(mysql_error());
$query_create="CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` int(8) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;
";

mysql_query($query_create) or die(mysql_error());
$query_pic_rules_prefix = "SELECT value FROM belotorg_settings WHERE type = 'pic_file_prefix' ";
	$res_pic_rules_prefix = mysql_query($query_pic_rules_prefix) or die(mysql_error());
	$par_pic_rules_prefix=mysql_fetch_array($res_pic_rules_prefix);
$pic_file_prefix_r = $par_pic_rules_prefix['value'];
$query_sales_rules= "SELECT * FROM `sales_rules`";
$res_sales_rules = mysql_query($query_sales_rules) or die(mysql_error());

while ($row_sales_rules=mysql_fetch_array($res_sales_rules)) {
	
$sale_a 				= $row_sales_rules['sale_a'];
$sale_b 				= $row_sales_rules['sale_b'];
$category_id 			= $row_sales_rules['category_id'];
$manufacturer_id 		= $row_sales_rules['manufacturer_id'];
$vendor_id 				= $row_sales_rules['vendor_id'];
$price_from 			= $row_sales_rules['price_from'];
$price_to 				= $row_sales_rules['price_to'];
$markup 				= $row_sales_rules['markup'];
$markup_from 			= $row_sales_rules['markup_from'];
$markup_to 				= $row_sales_rules['markup_to'];
$markup_min 			= $row_sales_rules['markup_min'];

 
If  (!empty($sale_a)) 
{
$select_tov_sales_not_empty = "SELECT ep.tov_id, ep.tov_name, ecp.pic_name, ep.tov_price, ". $sale_a . " , ". $sale_b . " FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) WHERE ep.tov_quantity>0 AND ep.tov_id NOT IN (SELECT product_id FROM sales)";
//echo $select_tov_sales_not_empty.";\n";

	$where_condition_sales_not_empty='';	
	
	If  (!empty($category_id)) 
	{
		$where_condition_sales_not_empty .=" AND ep.tov_cat_id=".$category_id;
	}
	
	If  (!empty($manufacturer_id)) 
	{
		$where_condition_sales_not_empty .=" AND ep.manufac_id=".$manufacturer_id;
	}
	
	If  (!empty($vendor_id)) 
	{
		$where_condition_sales_not_empty .=" AND ep.supply_id=".$vendor_id;
	}
	
	If  (!empty($price_from)) 
	{
		$where_condition_sales_not_empty .=" AND ep.tov_price>=".$price_from;
	}
	
	If  (!empty($price_to)) 
	{
		$where_condition_sales_not_empty .=" AND ep.tov_price<=".$price_to;
	}

	if(!empty($pic_file_prefix_r ))
	{
		$where_condition_pic =" AND ecp.pic_order =1 AND ecp.pic_file_prefix = '".$pic_file_prefix_r."'";
	}else
	{
		$where_condition_pic =" AND ecp.pic_order =1 ";
	}
		
$select_tov_sales_not_empty .= $where_condition_sales_not_empty.$where_condition_pic;
//echo $select_tov_sales_not_empty;
	 
$query_insert_sales_not_empty="INSERT INTO sales (product_id, `name`, `image`, price, sale_a, sale_b) ".$select_tov_sales_not_empty;
//echo $query_insert_sales_not_empty.";\n";
		
	
mysql_query($query_insert_sales_not_empty) or die(mysql_error());

	$query_update_sales_not_empty = "UPDATE sales, ep SET `sale_a` =".$sale_a.", `sale_b` = ".$sale_b." WHERE  ep.tov_id=sales.product_id AND ep.tov_quantity>0 AND sales.`sale_b`<".$sale_b;
	$query_update_sales_not_empty .= $where_condition_sales_not_empty;
mysql_query($query_update_sales_not_empty) or die(mysql_error());
//echo $query_update_sales_not_empty.";\n";
}
else
{
	$select_tov = "SELECT ep.tov_id, ep.tov_name, ecp.pic_name,  ep.tov_price, FLOOR((1-((ep.price_cost*(1+(".$markup."/100)))/ep.tov_price))*100) AS sale_a, FLOOR((1-((ep.price_cost*(1+(".$markup."/100)))/ep.tov_price))*100) AS sale_b FROM ep LEFT JOIN e_cc_pics AS ecp ON (ep.tov_id=ecp.tov_id ) WHERE ep.tov_quantity>0 AND ep.tov_id NOT IN (SELECT product_id FROM sales)";
				
	$where_condition='';
	
	If  (!empty($category_id)) 
	{
		$where_condition .=" AND ep.tov_cat_id=".$category_id;
	}
	
	If  (!empty($manufacturer_id)) 
	{
		$where_condition .=" AND ep.manufac_id=".$manufacturer_id;
	}
	
	If  (!empty($vendor_id)) 
	{
		$where_condition .=" AND ep.supply_id=".$vendor_id;
	}
	
	If  (!empty($markup_from))
	{
		$where_condition .=" AND (ep.tov_price/ep.price_cost-1)*100 >=".$markup_from;
	}
	else
	{
		// переход на следующее правило, так как, если нет markup_from в этой ветви IF, то правило составлено неверно
		//continue;
		break;
		// endif;
		//goto end;
		//exit;
	}
	
	If  (!empty($markup_to))
	{
		$where_condition .=" AND (ep.tov_price/ep.price_cost-1)*100 <=".$markup_to;
	}

	If  (!empty($markup_min))
	{
		$where_condition .=" AND (ep.price_cost*(".$markup."/100))> ".$markup_min;
	}
  
	if(!empty($pic_file_prefix_r))
	{
		$where_condition_pic =" AND ecp.pic_order =1 AND ecp.pic_file_prefix = '".$pic_file_prefix_r."'";
	}else
	{
		$where_condition_pic =" AND ecp.pic_order =1 ";
	}
	
	$select_tov .= $where_condition.$where_condition_pic;
//echo $select_tov;
	$query_insert = "INSERT INTO sales (product_id, `name`, image, price, sale_a, sale_b) ".$select_tov;
echo $query_insert.";\n";
	
mysql_query($query_insert)or die(mysql_error());

	$query_update = "UPDATE sales, ep SET `sale_a` =FLOOR((1-((ep.price_cost*(1+(".$markup."/100)))/ep.tov_price))*100) , `sale_b` = FLOOR((1-((ep.price_cost*(1+(".$markup."/100)))/ep.tov_price))*100) WHERE ep.tov_id=sales.product_id AND ep.tov_quantity>0 AND sales.`sale_b`<  FLOOR((1-((ep.price_cost*(1+(".$markup."/100)))/ep.tov_price))*100)";
	$query_update .= $where_condition;
mysql_query($query_update)or die(mysql_error());
echo $query_update.";\n";
}
//end:;
}

$query_del_null = "DELETE FROM `sales` WHERE sale_a=0;";
mysql_query($query_del_null) or die(mysql_error());
$query_update_3 = "UPDATE belotorg_settings SET `value` = '3' WHERE `type` = 'Download_over_tyres'";
mysql_query($query_update_3) or die(mysql_error());

echo 'Все ok';
}else{
echo "смотри таблицу belotorg_settings";
}
?>
