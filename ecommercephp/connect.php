<?php
$host = "127.0.0.1";

$user = "YOUR_DATABASE_USER";

$pass = "YOUR_DATABASE_PASSWORD";

$option = array(

   PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
);

$countrowinpage = 9;

try {

   $dsn = "mysql:host=$host;dbname=YOUR_DATABASE_NAME;charset=utf8";
   
   $con = new PDO($dsn, $user, $pass, $option);
  
   $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   
   header("Access-Control-Allow-Origin: *");
  
   header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin");
  
   header("Access-Control-Allow-Methods: POST, OPTIONS , GET");
   include "functions.php";

   if (!isset($notAuth)) {

      // checkAuthenticate();
   }

} catch (PDOException $e) {

   echo $e->getMessage();
   
}
