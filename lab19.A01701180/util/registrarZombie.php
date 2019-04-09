<?php
    session_start();
    require_once"connection.php";
    if (isset($_POST["estado"])
        ) {
            $nombre = htmlspecialchars($_POST["nombre"]);
            $apellido = htmlspecialchars($_POST["apellido"]);
            $estado = htmlspecialchars($_POST["estado"]);
            registrarZombie($nombre, $apellido, $estado);
            $_SESSION["mensaje"] = "Se agrego un nuevo zombie";
            //header("location:../formRegistrarZombie.php");
            
    } else {
        $_SESSION["error"] = "Datos incorrectos";
        var_dump($_POST);
        header("location:../formRegistrarZombie.php");
    }
?>