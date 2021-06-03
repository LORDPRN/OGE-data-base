<?php 
session_start(); 
include "db_conn.php";

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
            	$_SESSION['usuarioCuenta'] = $row['usuarioCuenta'];
            	$_SESSION['nombre1Admin'] = $row['nombre1Admin'];
            	$_SESSION['idCuenta'] = $row['idCuenta'];
            	header("Location: home.php");
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