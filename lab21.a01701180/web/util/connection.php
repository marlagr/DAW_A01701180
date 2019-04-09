<?php
    function connect() {
        // server 10.25.18.106,10433
        //username: a1701180
        //password: eniquniy
      $conexion = mysqli_connect("10.25.18.106,10433","a1701180","eniquniy","BD");
      if ($conexion == NULL) {
          die("500: Internal Server Error");
      }
      $conexion->set_charset("utf8");
      return $conexion;
    }
    function close($conexion) {
      mysqli_close($conexion);
    }

    
    function crearMaterial($clave, $descripcion, $costo, $impuesto)
    {
        $bd= connect();
        $query="EXECUTE crearMaterial('$clave', '$descripcion', '$costo', '$impuesto')";
        $results = $bd->query($query);
        close($bd);
    }
    
        function crearProyecto($numero, $denominacion)
    {
        $bd= connect();
        $query="EXECUTE crearMaterial('$numero', '$denominacion')";
        $results = $bd->query($query);
        close($bd);
    }
    
        function crearProveedor($RFC, $razonSocial)
    {
        $bd= connect();
        $query="EXECUTE crearMaterial('$RFC', '$razonSocial')";
        $results = $bd->query($query);
        close($bd);
        return $print;
    }
    

    
    
    
?>