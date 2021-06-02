<?php

$sname= "localhost";
$unmae= "root";
$password = "root";

$db_name = "oge_bd";

$conn = mysqli_connect($sname, $unmae, $password, $db_name);

if (!$conn) {
	echo "Connection failed!";
}
else{
	echo "Estamos conectados";
}