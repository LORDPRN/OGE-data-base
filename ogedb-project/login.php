<?php 
session_start(); 
include "db_conn.php";

if (isset($_POST['user_name']) && isset($_POST['password'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$user_name = validate($_POST['user_name']);
	$password = validate($_POST['password']);

	if (empty($user_name)) {
		header("Location: index.php?error=Se requiere el User ID.");
	    exit();
	}else if(empty($password)){
        header("Location: index.php?error=Se requiere la contraseña.");
	    exit();
	}else{
		$sql = "SELECT * FROM administradores WHERE user_name='$user_name' AND password='$password'";

		$result = mysqli_query($conn, $sql);

		if (mysqli_num_rows($result) === 1) {
			$row = mysqli_fetch_assoc($result);
            if ($row['user_name'] === $user_name && $row['password'] === $password) {
            	$_SESSION['user_name'] = $row['user_name'];
            	$_SESSION['nombre1Admin'] = $row['nombre1Admin'];
				$_SESSION['nombre2Admin'] = $row['nombre2Admin'];
				$_SESSION['apellido1Admin'] = $row['apellido1Admin'];
				$_SESSION['apellido2Admin'] = $row['apellido2Admin'];
				$_SESSION['correoAdmin'] = $row['correoAdmin'];
            	$_SESSION['idAdmin'] = $row['idAdmin'];
            	header("Location: lista-estudiante.php");
		        exit();
            }else{
				header("Location: index.php?error=User ID ó contraseña inválida.");
		        exit();
			}
		}else{
			header("Location: index.php?error=User ID ó contraseña inválida.");
	        exit();
		}
	}
	
}else{
	header("Location: index.php");
	exit();
}