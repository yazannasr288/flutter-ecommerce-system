<?php
include '../connect.php';

$email = filterRequest("email");

$verfiy = filterRequest("verifiycode");

$stmt = $con->prepare("SELECT * FROM users WHERE users_email ='$email' AND users_verifyicode = '$verfiy' ");

$stmt->execute();
$count = $stmt->rowCount();

if($count>0){

    $data =array("users_aproove"=>"1");

    updateData("users",$data,"users_email = '$email'");

}

else{printfailure("verifyicode not correct");
}