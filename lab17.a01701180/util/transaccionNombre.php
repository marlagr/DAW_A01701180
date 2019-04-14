<?php
    include("util.php");
    session_start();
    include("../_PARTIALS/_headerAutentificado.html");
    echo obtenerTransaccion($_POST["nombre"]);
    include("../_PARTIALS/_footer.html");
?>