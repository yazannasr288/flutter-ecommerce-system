<?php

include "../connect.php";

$usersid =filterRequest("usersid");

$addressid =filterRequest("addressid");

$orderstype =filterRequest("orderstype");

$pricedilivary=filterRequest("pricedilivary");

$priceorders =filterRequest("priceorders");

$coponid =filterRequest("coponid");

$paymethod =filterRequest("paymethod");

$copondiscount =filterRequest("copondiscount");

$now = date("Y-m-d H:i:s");

$checkcopon = getData("copon","copon_id = '$coponid' AND copon_date > '$now' AND copon_count > 0",null,false);

$totalprice = $priceorders = + $pricedilivary;

if($checkcopon>0){
    $totalprice = $totalprice - $priceorders * $copondiscount /100;


}

$data = array(
    
    
    
    "orders_usersid" => $usersid,

        "orders_address" => $addressid,

             "orders_type" => $orderstype,

             "orders_pricedilivary" => $pricedilivary,

                            "orders_price" => $priceorders,

                                      "orders_copon" => $coponid,

                                           "orders_paymethod" => $paymethod, 

                                                     "orders_totalprice" => $totalprice,








);

$count = insertData("orders",$data ,false);

if($count>0){

    $stmt = $con->prepare("SELECT MAX(orders_id)from orders");

    $stmt->execute();

    $maxid =$stmt->fetchColumn();

    $data = array("cart_orders" => $maxid);

    updateData("cart",$data,"cart_usersid = $usersid AND cart_orders = 0");

}