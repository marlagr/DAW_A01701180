<?php
  include("util.php");
  session_start();
  //si llega e-mail y password
  if(isset($_POST["email"]) && isset($_POST["password"])){

     $usuario = login( htmlspecialchars($_POST["email"]), htmlspecialchars($_POST["password"]) );//funcion boool que regresa si lo enci¡uentra
     if($usuario != ""){
        $_SESSION["rol"] = obtenerRol(htmlspecialchars($_POST["email"]));
        $_SESSION["usuario"] = $usuario;
        echo $usuario;
        header("location:../views/panelControl.php");
     } else {
        $error = "Usuario y/o contraseña incorrectos";
        $_SESSION["error"] = $error;
        header("location:../views/inicioSesion.php");
     }

  } else {
        $error = "Usuario y/o contraseña incorrectos";
        $_SESSION["error"] = $error;
        header("location:../views/inicioSesion.php");
  }
?>