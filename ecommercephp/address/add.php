<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include "../connect.php";

$table = "address";

$usersid = filterRequest("usersid");

$name = filterRequest("name");


$city = filterRequest("city");

$street = filterRequest("street");

$lat = filterRequest("lat");

$long = filterRequest("long");

$note = filterRequest("note");





$data = array(

    "address_usersid" => $usersid ,

        "address_name" => $name ,


        "address_city" => $city ,


            "address_street" => $street ,


                "address_lat" => $lat ,


                    "address_long" => $long ,

                                        "address_note" => $note ,


);
insertData($table,$data);



