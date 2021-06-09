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

if($_FILES['archivoC']){
	$archivoC = md5($_FILES['archivoC']. time()) . "." . end(explode('.', $_FILES['archivoC']));
	$NewFile = "../images/" . $archivoC;
	if (!move_uploaded_file($_FILES['archivoC'], $NewFile))
		{
		die("Failed to move file " .$_FILES['archivoC']." to " . $archivoC);	
		}	
		
}
//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$sql = "INSERT INTO contenidos (descripcionC,archivoC) VALUES ('$descripcionC','$archivoC')";

if (mysqli_query($conn, $sql)) {
  
	header("Location: home_pro.php?notify=Se ha hecho tu publicación");
	exit();
} 




?>