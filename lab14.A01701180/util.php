<?php
    function connect() {
      $conexion = mysqli_connect("localhost","root","","cubi13");
      if ($conexion == NULL) {
          die("500: Internal Server Error");
      }
      $conexion->set_charset(" ");
      return $conexion;
    }
    function close($conexion) {
      mysqli_close($conexion);
    }
 ?>
