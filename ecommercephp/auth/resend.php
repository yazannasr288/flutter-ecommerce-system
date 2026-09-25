<?php
include '../connect.php';

$email = filterRequest("email");

$verifyicode = rand(10000 ,99999) ;

$data = array(

    "users_verifyicode" => $verifyicode
);

updateData("users" ,$data ,"users_email = '$email'");

sendEmail($email, "verifyicode","verifyi code is $verifyicode");
