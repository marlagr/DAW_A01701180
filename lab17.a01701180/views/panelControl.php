<?php
    session_start();
    include("../_PARTIALS/_headerAutentificado.html");
            echo '<div class="container"><br>Bienvenid@!<br>';
            echo $_SESSION["usuario"];
            echo '<br>';
            date_default_timezone_set('America/Mexico_City');
            echo date("d M Y ") . "\n"; 
            echo date("h:i a"). "\n"; 
            echo '<br>';
            echo $_SESSION["rol"];
            echo '</div>';
    include("../_PARTIALS/_footer.html");
?>