<?php

include "../connect.php";

$coponname = filterRequest("coponname");

$now = date("Y-m-d H:i:s");

getData("copon","copon_name = '$coponname' AND copon_date > '$now' AND copon_count > 0");

