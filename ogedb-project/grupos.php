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
            <h3><a href="grupos.php"><input type="button" value="Grupos"></a></h3>
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
                    <p>Privilegios</p>
                    <p style="color:#76DC76">true</p>
                </div>

            </div>
        </div>
        <!-- Sidebar Ends -->

        <!-- Feed Starts -->
        <div class="feed">

        <div class="feed__inputContainer">
        <form action="add_group.php" method="post"> 
        <table border="1">
            <!--tr1-->
            <tr>
                <td>idGrupo</td>
                <td>nombreGrupo</td>
                <td>correoGrupo</td>
                <td>telefonoGrupo</td>
                <td>descripcionGrupo</td>
                <td>idAdmin</td>
            </tr>

            <!--tr2-->
            <tr>
            <td><input type="text" name="idGrupo" class="cajonesgrupo"></td>
            <td><input type="text" name="nombreGrupo" class="cajonesgrupo"></td>
            <td><input type="text" name="correoGrupo" class="cajonesgrupo"></td>
            <td><input type="text" name="telefonoGrupo" class="cajonesgrupo"></td>
            <td><input type="text" name="descripcionGrupo" class="cajonesgrupo"></td>
            <td><input type="text" name="idAdmin" class="cajonesgrupo"></td>

            <!--Get notify-->
            <?php if (isset($_GET['notify'])) { ?>
            <p class="notify"><?php echo $_GET['notify']; ?></p>
            <?php } ?>
          
            <!--Publicar-->
            <div class="inputOption">
                <i style="color: #7fc15e" class="material-icons"> send </i>
                <h4><input type="submit" id="text-input" value="Insertar"></h4>
            </div>
            </tr>
            </div>    
        </div>
         

        </form>
        </div>

            <!-- Post Starts -->
        <div class="post">                        
		<table border="1">
                <tr>
                <div class="post__header">
                    <td>idGrupo</td>
                    <td>nombreGrupo</td>
                    <td>correoGrupo</td>
                    <td>telefonoGrupo</td>
                    <td>descripcionGrupo</td>
                    <td>idAdmin</td>
                    <td>Acciones</td>
                    <i class="material-icons sidebar__topAvatar"> supervisor_account </i>
                    <div class="post__info">
                        <h2>Hola <?php echo $_SESSION['nombre1Admin']?> <?php echo $_SESSION['apellido1Admin']?>,
                        aquí están todos los grupos
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
                
                
                $sqlshow ="SELECT * FROM grupos_estudiantilessd";
                $resultshow = mysqli_query($conn,$sqlshow);
                if(mysqli_num_rows($resultshow)>0){
                    while($row = mysqli_fetch_assoc($resultshow)){
                        ?>
                <tr>
                <div class="feed__inputOptions">
                    <td><?php echo $row['idGrupo'];?></td>
                    <td><?php echo $row['nombreGrupo'];?></td>
                    <td><?php echo $row['correoGrupo'];?></td>
                    <td><?php echo $row['telefonoGrupo'];?></td>
                    <td><?php echo $row['descripcionGrupo'];?></td>
                    <td><?php echo $row['idAdmin'];?></td>
                    <td>
                        <h4><a href="editar_post.php?idGrupo=<?php echo $row["idGrupo"];?>" class="">Editar</a>
                        <a href="borrar_post.php?idGrupo=<?php echo $row["idGrupo"];?>" class="">Borrar</a></td>
                    
                    
                    </div>
                </div>
                </tr>
                <?php
                }
            }?>
        </table>   
        </div>
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