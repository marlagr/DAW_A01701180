<?php
    include("util.php");
    session_start();
    if(isset($_POST["nombre"]) && isset($_POST["nombre"]) != "")
        {
          return obtenerTransaccion(htmlspecialchars($_POST["nombre"]));        
        }
?>