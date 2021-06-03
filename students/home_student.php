<?php 
session_start();

if (isset($_SESSION['codigoCuenta']) && isset($_SESSION['usuarioCuenta'])) {

 ?>
<!DOCTYPE html>
<html>
<head>
	<title>OGE ADMIN LOGIN</title>
	<link rel="stylesheet" type="text/css" href="stylelogin.css">
</head>
<body>
     <h1>Bienvenido, <?php echo $_SESSION['nombre1Cuenta']; ?></h1>
     <a href="logout_student.php">Logout</a>
</body>
</html>

<?php 
}else{
     header("Location: index_student.php");
     exit();
}
 ?>