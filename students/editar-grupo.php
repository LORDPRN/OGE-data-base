<?php

$sname= "localhost";
$unmae= "root";
$password2 = "root";

$db_name = "oge_bd";

//La variable conexión es para contectarse 
$conn = mysqli_connect($sname, $unmae, $password2, $db_name);


//Meter la data mediante una sentencia sql para agregar un usuario a la base de datos
$idGrupo = $_GET["idGrupo"];
$contenidos = "SELECT * FROM grupos_estudiantilessd WHERE idGrupo = '$idGrupo'";

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
                    <td>Nombre del grupo</td>
                    <td>Descripción</td>
                    <td>Correo</td>
                    <td>Teléfono</td>
                    <td>Administrador</td>
                    <td>Acción</td>

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
                    <td><?php echo $row['idGrupo'];?></td>
                    <td><input type="text" value="<?php echo $row["nombreGrupo"];?>"></td>
                    <td><input type="text" value="<?php echo $row["descripcionGrupo"];?>"></td>
                    <td><input type="text" value="<?php echo $row["correoGrupo"];?>"></td>
                    <td><input type="text" value="<?php echo $row["telefonoGrupo"];?>"></td>
                    <td><input type="text" value="<?php echo $row["idAdminFG"];?>"></td>
                    <td>
                        <h4>
                            <a href=""><input type="submit" value="Actualizar"></a>
                            
                            <?php
                            
                            if (isset($_GET['notify'])) { ?>
                            <p class="notify"><?php echo $_GET['notify']; ?></p>
                            <?php } ?>
                    </td>
    </tr>
    <?php
    
                }
                
            ?>

    </div>
    </table>
    </form>
</body>

</html>