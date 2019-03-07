<?php
  //aqui estamos conectandonos a la base de datos

  function connect(){
    $mysql = mysqli:connect("localhost", "ejuarezp", "", "ntabla")
      if($conexion == NULL){
        die("500 die internal"):
      }
      return $conexion;
  }

  public function close($conexion)
  {
    mysqli_close($conexion);
  }
  //Consulta valor agregado
  function get_usuarios(){
    $bd = connect();

    close()
  }

?>
