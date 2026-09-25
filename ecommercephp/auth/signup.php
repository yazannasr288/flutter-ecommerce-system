<?php
include "../connect.php";

$username = filterRequest("username");

$password = sha1($_POST['password']);

$email = filterRequest("email");

$phone = filterRequest("phone");

$verifyicode = rand(10000 ,99999) ;

$stmt = $con->prepare("SELECT * FROM users WHERE users_email =? OR users_phone = ?");

$stmt->execute(array($email, $phone));

$count = $stmt->rowCount();

if ($count > 0) {
    
    printfailure("Phone or email already exists");

}else{
    
    $data =array(

    "users_name" => $username,

    "users_password" => $password,

    "users_email" => $email,

    "users_phone" => $phone,

    "users_verifyicode" => $verifyicode,


);
// sendEmail($email,"veryfiy code","verifiy code $verifyicode");

sendEmail(

    $email,

    "support@syrianmall.com",
    "
    <h3>مرحباً $username!</h3>
    <p>رمز التحقق الخاص بك هو: <strong style='color:#2c3e50; font-size: 20px;'>$verifyicode</strong></p>
    <p>الرمز صالح لمدة 10 دقائق فقط.</p>
    "
);

insertData("users",$data);

}






