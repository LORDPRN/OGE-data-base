<?php 
session_start();
if (isset($_SESSION['idAdmin']) && isset($_SESSION['user_name'])) {
 ?>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="css/sourcesanspro-font.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- Google Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="css/stylehome_pro.css" />
    <title>oge : home</title>
</head>
<body>
    
    <!-- Header Starts -->
    <div class="header">
        <div class="header__left">
            <img src="images/oge_student.png" alt="" onclick="window.open('home_pro.php','_self');"/>
            <div class="header__search">
            <i class="material-icons"> search </i>
            <input type="text">
            </div>
        </div>

        <div class="header__right">
            <div class="headerOption">
            <i class="material-icons headerOption__icon"> home </i>
            <h3><a href="home_pro.php"><input type="button" value="Home"></a></h3>
        </div>

        <div class="headerOption">
            <i class="material-icons headerOption__icon"> supervisor_account </i>
            <h3><a href="grupos.php"><input type="button" value="Groups"></a></h3>
            </h3>
        </div>

        <div class="headerOption">
            
            <i class="material-icons headerOption__icon" type=> logout </i>
            
            <h3><a href="logout.php"><input type="button" value="Cerrar sesión"></a></h3>
        </div>
        </div>
    </div>
    <!-- Header Ends -->

    <!-- Main Body Starts -->
    <div class="body__main">
        
        <!-- Sidebar Starts -->
        <div class="sidebar">
            <div class="sidebar__top">
                <img src="images/CAMPUS-PLANEACION.jpg" alt="" />
                <i class="material-icons sidebar__topAvatar"> account_circle </i>
                <h2><?php echo $_SESSION['nombre1Admin']; ?> <?php echo $_SESSION['apellido1Admin']?></h2>
                <h4><?php echo $_SESSION['correoAdmin']; ?></h4>
            </div>

            <div class="sidebar__stats">         
                <div class="sidebar__stat">
                    <p>Administrador:</p>
                    <p class="sidebar__statNumber">
                       <i class="material-icons headerOption__icon">check</i>
                    </p>
                </div>
            </div>

            <div class="sidebar__bottom">
                <p>¿Qué panel deseas consultar?</p>
                <div class="sidebar__recentItem">
                    <span class="sidebar__hash">👨‍🎓</span>
                    <p>
                    <h3><a href="lista-estudiante.php"><input type="button" value="Lista de estudiantes"></a></h3>
                    </p>
                </div>
                <div class="sidebar__recentItem">
                    <span class="sidebar__hash">👨‍💻</span>
                    <p>Lista de coordinadores</p>
                </div>
                
            </div>
        </div>
        <!-- Sidebar Ends -->

        <!-- Feed Starts -->
        <div class="feed">
            <div class="feed__inputContainer">
                <div class="feed__input">
                    <i class="material-icons"> create </i>
                    <form action="add_post.php" method="post">
                        <input name="descripcionC" type="text" required />

                </div>
                <?php if (isset($_GET['notify'])) { ?>
                <p class="notify"><?php echo $_GET['notify']; ?></p>
                <?php } ?>
                <div class="feed__inputOptions">
                    <div class="inputOption">
                        <i style="color: #70b5f9" class="material-icons"> insert_photo </i>
                        <h4><input name="archivoC" type="file" name="image" id="text-input"></h4>

                    </div>
                    <div class="inputOption">
                        <!--<i style="color: #e7a33e" class="material-icons"> subscriptions </i>
              <h4>Video</h4>-->
                    </div>
                    <!--Publicar-->
                    <div class="inputOption">
                        <i style="color: #7fc15e" class="material-icons"> send </i>
                        <h4><input type="submit" id="text-input" value="Publicar"></h4>
                    </div>
                </div>
                </form>
            </div>

            <!-- Post Starts -->
            <div class="post">                        
		<table border="1">
                <tr>
                <div class="post__header">
                    <td>idContenido</td>
                    <td>fechaPublicacionC</td>
                    <td>descripcionC</td>
                    <td>archivoC</td>
                    <td>Acciones</td>
                    <i class="material-icons sidebar__topAvatar"> supervisor_account </i>
                    <div class="post__info">
                        <h2>Hola <?php echo $_SESSION['nombre1Admin']?> <?php echo $_SESSION['apellido1Admin']?>,
                        aquí están todas las publicaciones realizadas
                    </h2>
                    <br>
                    </div>
                </div>

                </tr>
                <?php
                    $sname= "localhost";
                    $unmae= "root";
                    $password = "root";
                    $db_name = "oge_bd";
                    $conn = mysqli_connect($sname, $unmae, $password, $db_name);
                
                
                $sqlshow ="SELECT * FROM contenidos";
                $resultshow = mysqli_query($conn,$sqlshow);
                if(mysqli_num_rows($resultshow)>0){
                    while($row = mysqli_fetch_assoc($resultshow)){
                        ?>
                <tr>
                <div class="feed__inputOptions">
                    <td><?php echo $row['idContenido'];?></td>
                    <td><?php echo $row['fechaPublicacionC'];?></td>
                    <td><?php echo $row['descripcionC'];?></td>
                  
                    <td><?php echo $row['archivoC'];?>
                    <div class="inputOption">
                        <i style="color: gray" class="material-icons"> thumb_up </i>
                        <h4>Like</h4>
                        </div>
                    <div class="inputOption">
                        <i style="color: gray" class="material-icons"> comment </i>
                        <h4>Comment</h4>
                    </td>
                    <td>
                        <h4>
                        <a href="editar_post.php?idContenido=<?php echo $row["idContenido"];?>" class="">Editar</a>
                        <a href="borrar_post.php?idContenido=<?php echo $row["idContenido"];?>" class="">Borrar</a>
                    </td>
                    
                    </div>
                </div>
                </tr>
                <?php
                }
            }?>
         
</div>
          </table>    
            <!-- Post Ends -->

        </div>
        <!-- Feed Ends -->


    </div>
    <!-- Main Body Ends -->
</body>

</html>
<?php 
}
?>