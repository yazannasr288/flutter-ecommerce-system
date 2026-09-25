<?php
include '../connect.php';

$email = filterRequest("email");

$verfiy = filterRequest("verifiycode");

$stmt = $con->prepare("SELECT * FROM users WHERE users_email ='$email' AND users_verifyicode = '$verfiy' ");

$stmt->execute();

$count = $stmt->rowCount();

result($count);