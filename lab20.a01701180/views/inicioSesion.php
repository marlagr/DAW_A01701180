<?php
require_once("../util/util.php");
include("../_PARTIALS/_header.html");
        if (isset($_SESSION["error"])) {
           echo '<div class="alert alert-danger col-8 container" role="alert">';
            echo $_SESSION["error"];
            echo'</div>';
        unset($_SESSION["error"]);
        }
include("inicioSesion.html");
include("../_PARTIALS/_footer.html");
?>