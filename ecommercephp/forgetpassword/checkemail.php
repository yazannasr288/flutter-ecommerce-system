<?php
include "../connect.php";

$email = filterRequest("email");

$verifyicode = rand(10000 ,99999) ;

$stmt = $con->prepare("SELECT * FROM users WHERE users_email =? ");
$stmt->execute(array($email));

$count = $stmt->rowCount();

result($count);

if ($count>0) {

$data=array("users_verifyicode"=>$verifyicode);

 updateData("users",$data,"users_email='$email'",false);
sendEmail(
    
    $email,
    "رمز التحقق الخاص بك",
    "
    <h3>مرحباً $username!</h3>
    <p>رمز التحقق الخاص بك هو: <strong style='color:#2c3e50; font-size: 20px;'>$verifyicode</strong></p>
    <p>الرمز صالح لمدة 10 دقائق فقط.</p>
    "
);

// sendEmail($email,"veryfiy code","verifiy code $verifyicode");


}