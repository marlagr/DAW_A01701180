<?php
require_once("footer.html");
require_once("header.html");
  function info($mensaje) {
   M.toast({html: $mensaje});
   echo $mensaje;
}



 ?>
