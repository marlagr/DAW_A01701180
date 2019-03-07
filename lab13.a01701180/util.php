<?php
//Aqui tenemos la funcion encargada de verificar que los capos ingresados sean iguales
function login($email, $password) {
       $usuario = "";
       if ($email == "marla@gmail.com" && $password == "1234") {
           $usuario = "Marla Galvan";
       }
       return "marla";
   }


?>
