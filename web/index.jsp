<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="res/css/reset.css">
        <link rel="stylesheet" href="res/css/supersized.css">
        <link rel="stylesheet" href="res/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div class="page-container" id="inicio" style="display: block;">
            <h1>Inicio de Sesión</h1>
            <form id="valid" role="form" method="post" action="validar">
                <input id="usuario" type="text" name="usuario" class="username" placeholder="Usuario" autofocus>
                <input type="password" name="contrasena" class="password" placeholder="Contraseña">
                <br>
                <a onclick="ver()" style="cursor: pointer;" align="left">¿Olvido su Contraseña?</a>
                <button type="submit">Ingresar</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>
        <div class="page-container" id="restablecer" style="display: none;">
            <div class="">
                <h1>Restablecer Contraseña&nbsp;&nbsp;&nbsp;<span onclick="noVer()" class="cerrar">+</span></h1>
            </div>
            <form id="rest" role="form" method="post" action="">
                <input id="nomRes" type="text" name="nombres" class="username" placeholder="Ingrese su Nombre" autofocus>
                <input type="text" name="apellidos" class="password" placeholder="Ingrese sus Apellidos">
                <input required type="text" name="dni" class="dni" placeholder="Ingrese su DNI">
                <button type="submit">Restablecer</button>
                <div class="error"><span>+</span></div>
            </form>
        </div>

        <!-- Javascript -->
        <script src="res/js/jquery-1.8.2.min.js"></script>
        <script src="res/js/supersized.3.2.7.min.js"></script>
        <script src="res/js/supersized-init.js"></script>
        <script src="res/js/scripts.js"></script>
        <script>
            function ver() {
                document.getElementById('inicio').style.display = 'none';
                document.getElementById('restablecer').style.display = 'block';
                document.getElementById("nomRes").focus();
                document.getElementById("valid").reset();
            }
            function noVer() {
                document.getElementById('restablecer').style.display = 'none';
                document.getElementById('inicio').style.display = 'block';
                document.getElementById("usuario").focus();
                document.getElementById("rest").reset();
            }
        </script>
    </body>

</html>

