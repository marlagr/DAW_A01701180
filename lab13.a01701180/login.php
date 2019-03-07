<?php
  include("util.php");
  session_start();
  //si llega e-mail y password
  if(isset($_POST["email"])&& isset($_POST["password"])){
    $usuario = login(htmlspecialchars($_POST(["email"])), htmlspecialchars($_POST(["password"])));//funcion boool que regresa si lo enci¡uentra
    if($usuario != ""){
      $_SESSION["usuario"] = $usuario;
      header("location:session.php");
      } else {
              $error = "Usuario y/o contraseña incorrectos";
                echo $error;
                include("vistas/header.html");
                include("vistas/login.html");
                include("vistas/footer.html");
          }
    }else{
      $error = "Usuario y/o contraseña incorrectos";
      echo $error;
      include("vistas/header.html");
      include("vistas/login.html");
      include("vistas/footer.html");
    }


?>
