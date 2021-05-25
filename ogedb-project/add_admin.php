<?php

$sname= "localhost";
$unmae= "root";
$password2 = "";

$db_name = "oge_bd";

//Variables para obtener la información del formulario

$user_name = $_POST['user_name'];
$password = $_POST['password'];
$correoAdmin = $_POST['correoAdmin'];

//La variable conexión es para contectarse 

$conn = mysqli_connect($sname, $unmae, $password2, $db_name);

//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$sql = "INSERT INTO administradores (user_name, password, correoAdmin) VALUES ('$user_name','$password','$correoAdmin')";

if (mysqli_query($conn, $sql)) {
	echo "Se registró";
}
else{
	echo "F";
}

?>