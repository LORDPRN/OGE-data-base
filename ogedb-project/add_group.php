<?php

$sname= "localhost";
$unmae= "root";
$password2 = "root";

$db_name = "oge_bd";

//Variables para obtener la información del formulario

$idGrupo= $_POST['idGrupo'];
$nombreGrupo= $_POST['nombreGrupo'];
$correoGrupo= $_POST['correoGrupo'];
$telefonoGrupo= $_POST['telefonoGrupo'];
$descripcionGrupo= $_POST['descripcionGrupo'];
$idAdmin = $_POST['idAdmin'];

//La variable conexión es para contectarse 
$conn = mysqli_connect($sname, $unmae, $password2, $db_name);

//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$sql = "INSERT INTO grupos_estudiantilessd (idGrupo, nombreGrupo, correoGrupo, telefonoGrupo, descripcionGrupo, idAdmin) VALUES ('$idGrupo','$nombreGrupo','$correoGrupo','$telefonoGrupo','$descripcionGrupo','$idAdmin')";

if (mysqli_query($conn, $sql)) {
	header("Location: grupos.php?notify=Se han registrado un grupo");
	exit();
}
else{
	echo "Foraing key 'idAdmin'";
}

?>