<?php

$sname= "localhost";
$unmae= "root";
$password2 = "root";

$db_name = "oge_bd";

//Variables para obtener la información del formulario

$nombre1Admin= $_POST['nombre1Admin'];
$nombre2Admin= $_POST['nombre1Admin'];
$apellido1Admin= $_POST['apellido1Admin'];
$apellido2Admin= $_POST['apellido2Admin'];
$user_name = $_POST['user_name'];
$correoAdmin = $_POST['correoAdmin'];
$password = $_POST['password'];


//La variable conexión es para contectarse 
$conn = mysqli_connect($sname, $unmae, $password2, $db_name);

//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$sql = "INSERT INTO administradores (nombre1Admin, nombre2Admin, apellido1Admin, apellido2Admin, user_name, correoAdmin, password) VALUES ('$nombre1Admin','$nombre2Admin','$apellido1Admin','$apellido2Admin','$user_name','$correoAdmin','$password')";

if (mysqli_query($conn, $sql)) {
	header("Location: index.php?notify=Se han registrado tus datos correctamente");
	exit();
}
else{
	echo "F";
}

?>