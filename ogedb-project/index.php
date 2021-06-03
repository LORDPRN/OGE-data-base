<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🐱‍💻Administradores</title>
    <!-- Font-->
    <link rel="stylesheet" type="text/css" href="css/sourcesanspro-font.css">
    <!-- Main Style Css -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="icon" href="images/oge.png">

</head>

<body class="form-v8">
    <div class="page-content">
        <div class="form-v8-content">
            <div class="form-left">
                <img src="images/form-v8.jpg" alt="form">
            </div>
            <div class="form-right">
                <div class="tab">
                    <div class="tab-inner">
                        <button class="tablinks" onclick="openCity(event, 'sign-up')"
                            id="defaultOpen">Registrarse</button>
                    </div>
                    <div class="tab-inner">
                        <button class="tablinks" onclick="openCity(event, 'sign-in')">Iniciar sesión</button>
                    </div>
                </div>
                <form class="form-detail" action="add_admin.php" method="post">
                    <div class="tabcontent" id="sign-up">
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="nombre1Admin" class="input-text" required>
                                <span class="label">Primer nombre</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="nombre2Admin" class="input-text" required>
                                <span class="label">Segundo nombre</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="apellido1Admin" class="input-text" required>
                                <span class="label">Primer apellido</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="apellido2Admin" class="input-text" required>
                                <span class="label">Segundo apellido</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="user_name" id="full_name" class="input-text" required>
                                <span class="label">User ID</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="correoAdmin" id="your_email" class="input-text" required>
                                <span class="label">Correo electrónico</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="password" name="password" id="password" class="input-text" required>
                                <span class="label">Contraseña</span>
                                <span class="border"></span>
                            </label>
                        </div>

                        <div class="form-row-last">
                            <input type="submit" name="register" class="register" value="Registrarse">
                            <?php if (isset($_GET['notify'])) { ?>
                            <p class="notify"><?php echo $_GET['notify']; ?></p>
                            <?php } ?>
                        </div>

                    </div>
                </form>
                <form class="form-detail" action="login.php" method="post">
                    <div class="tabcontent" id="sign-in">

                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="text" name="user_name" id="full_name_1" class="input-text" required>
                                <span class="label">User ID</span>
                                <span class="border"></span>
                            </label>
                        </div>

                        <div class="form-row">
                            <label class="form-row-inner">
                                <input type="password" name="password" id="password_1" class="input-text" required>
                                <span class="label">Contraseña</span>
                                <span class="border"></span>
                            </label>
                        </div>
                        <div class="form-row-last">
                            <input type="submit" name="" class="register" value="Iniciar sesión">
                            <?php if (isset($_GET['error'])) { ?>
                    <p class="error"><?php echo $_GET['error']; ?></p>
                    <?php } ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
    </script>

</body>

</html>