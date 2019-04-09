<?php
    session_start();
    require_once"../util/connection.php";
    if (isset($_POST["submit"])
        ) {
            $numero = htmlspecialchars($_POST["numero"]);
            $deno= htmlspecialchars($_POST["deno"]);
            rcrearProyecto($nombre, $clave, $costo,$impuesto);
            
    } else {
        $_SESSION["error"] = "Datos incorrectos";
        var_dump($_POST);
        header("location:../partials/index.php");
    }
?>