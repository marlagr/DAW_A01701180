<?php
    session_start();
    include("util.php");
    if(isset($_POST["nombre"]) && isset($_POST["nombre"]) != "")
        {
          return obtenerTransaccion(htmlspecialchars($_POST["nombre"]));        
        }
    return obtenerTransaccion(htmlspecialchars($_POST["nombre"]));
?>