<?php
    session_start();
    require_once("util/connection.php");
    include("../PARTIALS/_header.html");
        if (isset($_SESSION["error"])) {
        echo $_SESSION["error"];
        unset($_SESSION["error"]);
        }   
    include("eventos.html");
    include("../PARTIALS/_footer.html");
?>