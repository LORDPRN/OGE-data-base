<?php 
session_start(); 
include "db_conn.php";

if (isset($_POST['uname']) && isset($_POST['password'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$uname = validate($_POST['uname']);
	$pass = validate($_POST['password']);

	if (empty($uname)) {
		header("Location: index.php?error=Se requiere el userID.");
	    exit();
	}else if(empty($pass)){
        header("Location: index.php?error=Se requiere la contraseña.");
	    exit();
	}else{
		$sql = "SELECT * FROM administradores WHERE user_name='$uname' AND password='$pass'";

		$result = mysqli_query($conn, $sql);

		if (mysqli_num_rows($result) === 1) {
			$row = mysqli_fetch_assoc($result);
            if ($row['user_name'] === $uname && $row['password'] === $pass) {
            	$_SESSION['user_name'] = $row['user_name'];
            	$_SESSION['name'] = $row['nombre1Admin'];
            	$_SESSION['idAdmin'] = $row['idAdmin'];
            	header("Location: home.php");
		        exit();
            }else{
				header("Location: index.php?error=userID ó contraseña inválida.");
		        exit();
			}
		}else{
			header("Location: index.php?error=userID ó contraseña inválida.");
	        exit();
		}
	}
	
}else{
	header("Location: index.php");
	exit();
}