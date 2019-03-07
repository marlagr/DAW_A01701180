<?php
    session_start();

    if(isset($_SESSION["usuario"])) {
        include("vistas/header.html");
        include("vistas/main.html");
        include("vistas/footer.html");
    } else {
        include("vistas/header.html");
        include("vistas/login.html");
        include("vistas/footer.html");
    }
?>
