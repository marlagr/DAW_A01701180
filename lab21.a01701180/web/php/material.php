<?php
    session_start();
    require_once"../util/connection.php";
    if (isset($_POST["submit"])
        ) {
            $nombre = htmlspecialchars($_POST["nombre"]);
            $clave = htmlspecialchars($_POST["clave"]);
            $costo = htmlspecialchars($_POST["costo"]);
            $impuesto = htmlspecialchars($_POST["impuesto"]);
            crearMaterial($nombre, $clave, $costo,$impuesto);
            
    } else {
        $_SESSION["error"] = "Datos incorrectos";
        var_dump($_POST);
        header("location:../partials/index.php");
    }
?>