<?php
//======*подключение к базе данных*============

//для joomla
include '../configuration.php';
$cfg = new JConfig();
$hostname               = $cfg->host;
$username               = $cfg->user;
$password               = $cfg->password;
$dbName                 = $cfg->db;

// для open cart
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
//=============================================
$productID=$_POST['productID'];
$query ="SELECT product_id, `image`, `name`, price, sale_a, sale_b FROM ".$dbName.".sales WHERE product_id=".$productID;
//$query ="SELECT product_id, `image`, `name`, price, sale_a, sale_b FROM ".$dbName.".sales WHERE product_id=1470";
//echo $query;
$result = mysql_query($query) or die("Ошибка запроса" . mysql_error()); 
if($result)
{		
	
    $row = mysql_fetch_row($result);
    
    $productImage = $row[1];
	$productName  = $row[2];
	$price 		  = $row[3];
	$sales_a      = $row[4];
    $sales_b 	  = $row[5];
    //$sku = $row[6];

    $data = [];

	// echo 'done';
	if($sales_a != null){
	$data['status'] = "OK";
	$data['mesA']   = $sales_a;
	$data['mesB'] 	= $sales_b;
	$data['mesC'] 	= $price;
	$data['mesD'] 	= $productName;
	$data['mesE'] 	= $productImage;
	//$data['mesF'] = $sku;

	}else{
		$data['status'] = "nosale";

	}
}else{
	// echo 'error';
	$data['status'] = "NO";
	
}
 
   echo json_encode($data);

   mysqli_close($link);   
   

	 ?>