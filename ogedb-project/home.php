<?php 
session_start();

if (isset($_SESSION['idAdmin']) && isset($_SESSION['user_name'])) {

 ?>
<!DOCTYPE html>
<html>
<head>
	<title>OGE ADMIN LOGIN</title>
	<link rel="stylesheet" type="text/css" href="stylelogin.css">
</head>
<body>
     <h1>Bienvenido, <?php echo $_SESSION['nombre1Admin']; ?></h1>
     <a href="logout.php">Logout</a>
</body>
</html>

<?php 
}else{
     header("Location: index.php");
     exit();
}
 ?>