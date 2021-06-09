<?php

$sname= "localhost";
$unmae= "root";
$password2 = "root";

$db_name = "oge_bd";

//La variable conexión es para contectarse 
$conn = mysqli_connect($sname, $unmae, $password2, $db_name);


//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$idCuenta = $_GET["idCuenta"];
$contenidos = "SELECT * FROM cuentas WHERE idCuenta = '$idCuenta'";

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

</head>

<body>
    <form action="actualizar_post.php" method="post">
    <div class="post">
        <table border="1">
            <tr>
                <div class="post__header">
                    <td>ID</td>
                    <td>Nombre 1</td>
                    <td>Nombre 2</td>
                    <td>Apellido 1</td>
                    <td>Apellido 2</td>
                    <td>Correo</td>
                    <td>Celular</td>
                    <td>Usuario</td>
                    <td>Contraseña</td>
                    <td>Coordinador?</td>
                    <td>Carrera</td>

                    <i class="material-icons sidebar__topAvatar"> supervisor_account </i>
                    <div class="post__info">
                        <h2>Editar estudiantes
                        </h2>
                        <br>
                    </div>
                </div>

            </tr>
           <?php
            $resultado = mysqli_query($conn, $contenidos);
            while($row=mysqli_fetch_assoc($resultado)){?>
           
            <tr>
                <div class="feed__inputOptions">
                    <td><?php echo $row['idCuenta'];?></td>
                    <td><input type="text" value="<?php echo $row["nombre1Cuenta"];?>"></td>
                    <td><input type="text" value="<?php echo $row["nombre2Cuenta"];?>"></td>
                    <td><input type="text" value="<?php echo $row["apellido1Cuenta"];?>"></td>
                    <td><input type="text" value="<?php echo $row["apellido2Cuenta"];?>"></td>
                    <td><input type="text" value="<?php echo $row["correoInstitucional"];?>"></td>
                    <td><input type="text" value="<?php echo $row["numeroCelular"];?>"></td>
                    <td><input type="text" value="<?php echo $row["usuarioCuenta"];?>"></td>
                    <td><input type="text" value="<?php echo $row["contraseniaCuenta"];?>"></td>
                    <td><input type="text" value="<?php echo $row["esCoordinador"];?>"></td>
                    <td><input type="text" value="<?php echo $row["nombreCarrera"];?>"></td>


    </tr>
    <?php
    
                }
                
            ?>

    </div>
    </table>
    </form>
</body>

</html>