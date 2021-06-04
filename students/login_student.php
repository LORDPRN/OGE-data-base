<?php 
session_start(); 
include "db_conn_student.php";

if (isset($_POST['usuarioCuenta']) && isset($_POST['contraseniaCuenta'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$usuarioCuenta = validate($_POST['usuarioCuenta']);
	$contraseniaCuenta = validate($_POST['contraseniaCuenta']);

	if (empty($usuarioCuenta)) {
		header("Location: index_student.php?error=Se requiere el User ID.");
	    exit();
	}else if(empty($contraseniaCuenta)){
        header("Location: index_student.php?error=Se requiere la contraseña.");
	    exit();
	}else{
		$sql = "SELECT * FROM cuentas WHERE usuarioCuenta='$usuarioCuenta' AND contraseniaCuenta='$contraseniaCuenta'";
		$result = mysqli_query($conn, $sql);
            
		if (mysqli_num_rows($result) === 1) {
			$row = mysqli_fetch_assoc($result);
            if ($row['usuarioCuenta'] === $usuarioCuenta && $row['contraseniaCuenta'] === $contraseniaCuenta) {
				$_SESSION['idCuenta'] = $row['idCuenta'];
				$_SESSION['nombre1Cuenta'] = $row['nombre1Cuenta'];
				$_SESSION['nombre2Cuenta'] = $row['nombre2Cuenta'];  	
				$_SESSION['apellido1Cuenta'] = $row['apellido1Cuenta'];
				$_SESSION['apellido2Cuenta'] = $row['apellido2Cuenta'];
				$_SESSION['correoInstitucional'] = $row['correoInstitucional'];
				$_SESSION['numeroCelular'] = $row['numeroCelular'];
            	$_SESSION['usuarioCuenta'] = $row['usuarioCuenta'];
				$_SESSION['esCoordinador']= $row['esCoordinador'];
				$_SESSION['nombreCarrera']= $row['nombreCarrera'];
            	header("Location: home_pro.php");
		        exit();
            }else{
				header("Location: index_student.php?error=User ID ó contraseña inválida.");
		        exit();
			}
		}else{
			header("Location: index_student.php?error=User ID ó contraseña inválida.");
	        exit();
		}
	}
	
}else{
	header("Location: index_student.php");
	exit();
}