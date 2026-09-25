<?php

// include "../connect.php";
// $usersid = filterRequest("usersid");
// $itemsid = filterRequest("itemsid");
// $data =array(
//   "favorite_usersid"  =>  $usersid,
//   "favorite_itemsid"  =>  $itemsid,
// );

// insertData("favorite",$data,);
include "../connect.php";

// الحصول على معرف المستخدم ومعرف العنصر
$usersid = filterRequest("usersid");

$itemsid = filterRequest("itemsid");

// استعلام للتحقق إذا كان العنصر موجودًا بالفعل في المفضلة
$insertStmt = $con->prepare("INSERT INTO favorite (favorite_usersid, favorite_itemsid)
                     
                             SELECT :usersid, :itemsid
                         
                             WHERE NOT EXISTS (SELECT 1 FROM favorite WHERE favorite_usersid = :usersid AND favorite_itemsid = :itemsid)");

// ربط المعلمات
$insertStmt->bindParam(':usersid', $usersid);

$insertStmt->bindParam(':itemsid', $itemsid);

// تنفيذ الاستعلام
$insertStmt->execute();

// يمكنك هنا إضافة كود الاستجابة الخاص بك لتأكيد العملية أو إعادة البيانات المعدلة
if ($insertStmt->rowCount() > 0) {

    echo json_encode(array("status" => "success", "message" => "تم إضافة العنصر للمفضلة"));
} else {
    
    echo json_encode(array("status" => "failure", "message" => "العنصر موجود بالفعل في المفضلة"));
}
?>


