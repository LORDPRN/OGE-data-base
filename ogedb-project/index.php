<!DOCTYPE html>
<html>
<head>
	<title>OGE ADMIN LOGIN</title>
	<link rel="stylesheet" type="text/css" href="stylelogin.css">
</head>
<body>
     <form class="box" action="login.php" method="post">
     	<h2>OGE ADMIN LOGIN</h2>
     	<?php if (isset($_GET['error'])) { ?>
     		<p class="error"><?php echo $_GET['error']; ?></p>
     	<?php } ?>
     	<label>userID:</label>
     	<input type="text" name="uname" placeholder="Escribe tu userID"><br><br>

     	<label>Password:</label>
     	<input type="password" name="password" placeholder="Escribe tu contraseña"><br><br>
     	<button type="submit" name="">Login</button>
     </form>
</body>
</html>