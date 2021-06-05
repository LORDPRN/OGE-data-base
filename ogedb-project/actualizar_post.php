<?php

$sname= "localhost";
$unmae= "root";
$password2 = "root";

$db_name = "oge_bd";

//La variable conexión es para contectarse 
$conn = mysqli_connect($sname, $unmae, $password2, $db_name);

//Variables para obtener la información del formulario
$descripcionC= $_POST['descripcionC'];
$archivoC= $_POST['archivoC'];

//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$sql= "UPDATE `contenidos` SET `descripcionC`='$descripcionC',`archivoC`='$archivoC' WHERE idContenido='$idContenido'";

if (mysqli_query($conn, $sql)) {
  
	header("Location: home_pro.php?notify=Se ha actualizado");
	exit();
}



?>