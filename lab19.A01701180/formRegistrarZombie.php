<?php
    session_start();
    require_once("util/connection.php");
    require_once("partials/_header.html");
        if (isset($_SESSION["error"])) {
           echo '<div class="alert alert-danger col-8 container" role="alert">';
            echo $_SESSION["error"];
            echo'</div>';
        unset($_SESSION["error"]);
        }   
    require_once("formRegistrarZombie.html");
    require_once("partials/_footer.html");
?>