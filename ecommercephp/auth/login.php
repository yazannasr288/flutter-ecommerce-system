<?php
include "../connect.php";

$password = sha1($_POST['password']);

$email = filterRequest("email");

getData("users", "users_email =? AND users_password = ?",array($email,$password));
// $stmt->execute(array($email, $password));)
// $stmt = $con->prepare("SELECT * FROM users WHERE users_email =? And users_password = ?");
// $stmt->execute(array($email, $password));
// $count = $stmt->rowCount();
// result($count);


// include "../connect.php";

// $password = sha1($_POST['password']);
// $email = filterRequest("email");

// $stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? AND users_password = ?");
// $stmt->execute(array($email, $password));
// $count = $stmt->rowCount();

// if ($count > 0) {
//     $data = $stmt->fetch(PDO::FETCH_ASSOC); // جلب بيانات المستخدم
//     echo json_encode([
//         "status" => "success",
//         "message" => "none",
//         "data" => $data
//     ]);
// } else {
//     echo json_encode([
//         "status" => "failure",
//         "message" => "Invalid email or password"
//     ]);
// }

