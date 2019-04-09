<?php
    session_start();
    require_once"../util/connection.php";
    if (isset($_POST["submit"])
        ) {
            $rfc = htmlspecialchars($_POST["rfc"]);
            $social= htmlspecialchars($_POST["social"]);
            registrarZombie($rfc, $social);
            
    } else {
        $_SESSION["error"] = "Datos incorrectos";
        var_dump($_POST);
        header("location:../partials/index.php");
    }
?>