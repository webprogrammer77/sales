<?php
//======подключение к базе данных============

//для joomla

include '../../configuration.php';
$cfg = new JConfig();
$hostname               = $cfg->host;
$username               = $cfg->user;
$password               = $cfg->password;
$dbName                 = $cfg->db;

// для open cart
/*
include_once '../../config.php';

$hostname = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$dbName   = DB_DATABASE;
*/
$link = mysql_connect($hostname,$username,$password) OR DIE("Не могу создать соединение ");
mysql_select_db($dbName) or die(mysql_error());

// Исправьте, если у вас другая кодировка в БД
mysql_query('set names utf8');
//=============================================
$name  = $_POST['name'];
$sku   = $_POST['sku'];
$phone = $_POST['phone'];
$price = $_POST['price'];	
$sale  = $_POST['sale'];	
$url   = $_POST['url'];
$quant = 4;
//echo 'sale1: '.$sale. "\n";
	
$phone = clean($phone);
$sku   = clean($sku);
$id    = clean($name);
$url   = clean($url);	
$price = clean($price);
$price = preg_replace('/[^0-9]/', '', $price);	
$sale  = clean($sale);
//$sale = preg_replace('/[^0-9]/', '', $sale);	


/* Запрос на проверку скидки в базу данных */

//if ($id != 0 and $id !== ''){
$query ="SELECT product_id, `image`, `name`, price, sale_a, sale_b FROM ".$dbName.".sales WHERE product_id=".$id;

$result = mysql_query($query) or die("Ошибка запроса" . mysql_error($link));
//} 
if($result){		
	
  $row = mysql_fetch_row($result);    
  //$productImage = $row[1];
	$name 	  = $row[2];	
  $price_bd = $row[3];
	$sales_a  = $row[4];
  $sales_b  = $row[5];
   //$sku = $row[6];


//проверка на мошенничество
/*------------------------------------------------------------*/
	if($sales_a >= 40 ){	
		$sale = 40;
	}else{
		if($sale == $sales_a){
			$sale = $sales_a;
		}else if($sale == $sales_b){
			$sale = $sales_b;
		}else{
			$sale = 0;
			$price = $price_bd;
		}
	}
/*--------------------------------------------------------------*/

  $price = $price_bd*(1-$sale/100);
  $price = (int)$price;  

	if(!preg_match("#^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,11}$#", $_POST['phone'])){
	
		$data['status'] = "erPhone";
		$data['mes'] 	= "Произошла ошибка";
	}else{

		$mail_message = "
			Товар $name<br>
			Скидка $sale<br>
			Цена $price<br>
			Артикул $sku<br>
			Телефон $phone<br>
			Сайт $url<br>
			Количество $quant<br>
			";
			
		$headers = "From: Заказ со скидкой: ". $url ."\r\n".
		"MIME-Version: 1.0" . "\r\n" .
		"Content-type: text/html; charset=UTF-8" . "\r\n";

		//, sportano2015@yandex.ru, webprogrammer77@yandex.ru, webprogrammer77@gmail.com
		$emailTo = 'work.for.igor@yandex.ru';

		$mail = mail($emailTo, "Заказ со скидкой ". $name ."  с сайта: ". $url , $mail_message, $headers);

		$data = [];

		if($mail && $sale !=0 && $price !=0) {		
			$data['status'] = "OK";
			$data['mes'] 	= "";
			$date_order = date("Y-m-d H:i:s");
			/*---------------добавление заказов в базу данных------------------------*/

			//$phone = mysqli_real_escape_string($link, $phone);
			$query_alter_time = "ALTER TABLE ".$dbName.".`sales_orders` ADD `order_date` DATETIME  NOT NULL AFTER `id`";
			//mysql_query($query_alter_time) or die(mysql_error());
			$query_create = "CREATE TABLE IF NOT EXISTS ".$dbName.".`sales_orders`
			(
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`order_date` DATETIME  NOT NULL,
			`name` varchar(255) DEFAULT NULL,
			`sku` int(4) DEFAULT NULL,
			`price`  decimal(15,2) DEFAULT NULL,
			`sale`  int(3) DEFAULT NULL,
			`quant` int(7) DEFAULT NULL,
			`phone` varchar(20) DEFAULT NULL,
			`url` varchar(255) DEFAULT NULL,
			PRIMARY KEY(`id`)
			)ENGINE=InnoDB DEFAULT CHARSET=utf8";
			mysql_query($query_create) or die(mysql_error());
			$query_add = "INSERT INTO ".$dbName.".sales_orders (`order_date`, `name`,`sku`,`price`,`sale`,`quant`,`phone`,`url`)  VALUES ('".$date_order."','".$name."','".$sku."','".$price."','".$sale."','".$quant."','".$phone."','".$url."')";
			//echo $query_add;
			mysql_query($query_add) or die(mysql_error());
			
			
			/*---------------------------------------------------------------------*/	

			
		}else{			
			$data['status'] = "NO";
			$data['mes'] 	= "";
		}
    }
}else{	
		$data['status'] = "NO";	
}


echo json_encode($data);
	 
mysqli_close($link);

//функции очистки json данных

function clean($value = "") {
    $value = trim($value);
    $value = stripslashes($value);
    $value = strip_tags($value);
    $value = htmlspecialchars($value);
    
		return $value;		
}

function check_length($value = "", $min, $max) {
    $result = (mb_strlen($value) < $min || mb_strlen($value) > $max);
    return !$result;
}	

    // экранирования символов для mysql
    //$name = htmlentities(mysqli_real_escape_string($link, $_POST['name']));
    //$phone = htmlentities(mysqli_real_escape_string($link, $_POST['phone']));     
    // выполняем запрос
    //$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link)); 