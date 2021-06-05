<?php

$sname= "localhost";
$unmae= "root";
$password2 = "root";

$db_name = "oge_bd";

//La variable conexión es para contectarse 
$conn = mysqli_connect($sname, $unmae, $password2, $db_name);

//Variables para obtener la información del formulario
$nombre1Cuenta= $_POST['nombre1Cuenta'];
$nombre2Cuenta= $_POST['nombre2Cuenta'];
$apellido1Cuenta= $_POST['apellido1Cuenta'];
$apellido2Cuenta= $_POST['apellido2Cuenta'];
$correoInstitucional = $_POST['correoInstitucional'];
$numeroCelular = $_POST['numeroCelular'];
$usuarioCuenta = $_POST['usuarioCuenta'];
$contraseniaCuenta = $_POST['contraseniaCuenta'];
$esCoordinador = $_POST['esCoordinador'];
$nombreCarrera= $_POST['nombreCarrera'];

//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$sql = "INSERT INTO cuentas (nombre1Cuenta, nombre2Cuenta, apellido1Cuenta, apellido2Cuenta, usuarioCuenta, correoInstitucional, numeroCelular, contraseniaCuenta,esCoordinador,nombreCarrera) VALUES ('$nombre1Cuenta','$nombre2Cuenta','$apellido1Cuenta','$apellido2Cuenta','$usuarioCuenta','$correoInstitucional','$numeroCelular','$contraseniaCuenta','$esCoordinador','$nombreCarrera')";

if (mysqli_query($conn, $sql)) {
	header("Location: index_student.php?notify=Se han registrado tus datos correctamente");
	exit();
}

?>