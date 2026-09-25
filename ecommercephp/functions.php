<?php

include 'PHPMailer/src/PHPMailer.php';

include 'PHPMailer/src/SMTP.php';

include 'PHPMailer/src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;

use PHPMailer\PHPMailer\Exception;


define("MB", 1048576);

function filterRequest($requestname)

{
    return htmlspecialchars(strip_tags($_REQUEST[$requestname] ?? ''));

}

function getAllData($table, $where = null, $values = null,$json = true)

{
    global $con;

    $data = array();

    if($where==null){

        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{

        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");

    }
    $stmt->execute($values);

    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $count  = $stmt->rowCount();

    if($json == true){

        if ($count > 0) {

            echo json_encode(array("status" => "success", "data" => $data));
        
        } else {

            echo json_encode(array("status" => "failure"));
        }

        return $count;

    }else {

        if ($count >0) {

          return array("status" => "success" , "data" => $data);

        }else {

            return array("status" => "failure");
        }
            
        }
    }
    

    


function getData($table, $where = null, $values = null,$json = true)

{

    global $con;

    $data = array();
  
    $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
 
    $stmt->execute($values);
    
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    
    $count  = $stmt->rowCount();
      
    if($json == true){

    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
  
    } else {
      
        echo json_encode(array("status" => "failure"));
   
    }

}else{

    return $count;
}}



function insertData($table, $data, $json = true)
{
    global $con;

    foreach ($data as $field => $v)

        $ins[] = ':' . $field;

    $ins = implode(',', $ins);

    $fields = implode(',', array_keys($data));

    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

   

    $stmt = $con->prepare($sql);

    foreach ($data as $f => $v) {

        $stmt->bindValue(':' . $f, $v);
    }

    $stmt->execute();

    $count = $stmt->rowCount();

    



    if ($json == true) {

        if ($count > 0) {

            echo json_encode(array("status" => "success"));
        
        } else {

            echo json_encode(array("status" => "failure"));
        }
    }

    return $count;
}


function updateData($table, $data, $where, $json = true)
{
    global $con;

    $cols = array();

    $vals = array();


    foreach ($data as $key => $val) {

        $vals[] = "$val";

        $cols[] = "`$key` =  ? ";
    }

    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);

    $stmt->execute($vals);

    $count = $stmt->rowCount();

    if ($json == true) {

        if ($count > 0) {

            echo json_encode(array("status" => "success"));
       
        } else {

            echo json_encode(array("status" => "failure"));
        }
    }

    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;

    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    
    $stmt->execute();
    $count = $stmt->rowCount();

    if ($json == true) {

        if ($count > 0) {

            echo json_encode(array("status" => "success"));
        
        } else {

            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function imageUpload($imageRequest)
{
    global $msgError;

    $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
   
    $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
   
    $imagesize  = $_FILES[$imageRequest]['size'];
   
    $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
   
    $strToArray = explode(".", $imagename);
   
    $ext        = end($strToArray);
   
    $ext        = strtolower($ext);

    if (!empty($imagename) && !in_array($ext, $allowExt)) {
        $msgError = "EXT";

    }
    if ($imagesize > 2 * MB) {
        $msgError = "size";
        
    if (empty($msgError)) {

        move_uploaded_file($imagetmp,  "../upload/" . $imagename);
      
        return $imagename;

    } else {

        return "fail";

    }
}



function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {

        unlink($dir . "/" . $imagename);
    }
}



function printfailure($message = "none")
{
    echo json_encode(array("status" => "failure", "message" => $message));
}
function printsuccess($message = "none")
{
    echo json_encode(array("status" => "success", "message" => $message));
}
function result($count)
{
    if ($count > 0) {
        printsuccess();
    } else {
        printfailure();
    }
}




function sendEmail($email, $subject, $body)
{
    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();

        $mail->Host = 'smtp.gmail.com';

        $mail->SMTPAuth = true;

        $mail->Username = 'YOUR_EMAIL';

        $mail->Password = 'YOUR_SMTP_PASSWORD';

        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        
        $mail->Port = 587;

        $mail->setFrom('YOUR_EMAIL', 'MyStore');
        $mail->addAddress($email);


        $mail->isHTML(true);

        $mail->Subject = $subject;

        $mail->Body    = $body;

        $mail->AltBody = strip_tags($body);

        $mail->send();
    } 
    catch (Exception $e) {
    }
}}
