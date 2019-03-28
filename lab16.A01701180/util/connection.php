<?php
    function connect() {
      $conexion = mysqli_connect("localhost","a01701180"," ","c9");
      if ($conexion == NULL) {
          die("500: Internal Server Error");
      }
      $conexion->set_charset("utf8");
      return $conexion;
    }
    function close($conexion) {
      mysqli_close($conexion);
    }
    
    
    function registrarEvento($titulo, $sinopsis, $fecha_inicio,$fecha_fin, $hora_inicio, $hora_fin, $ubicacion, $descripcion) {
        $bd = connect();
        
        //auto incrementar el id
        $index ="SELECT MAX( `id_evento` ) AS indice FROM `Evento`" ;
        $row= mysqli_query($bd,$index);
        $numero=mysqli_fetch_object($row);
        $indice2 = $numero->indice;
        $indice2++;
        
        // insert command specification 
        $query="INSERT INTO Evento( id_evento, nombre, sinopsis, fecha_inicio, fecha_fin, hora_inicio, hora_fin, ubicacion, descripcion, visible )  VALUES (?,?,?,?,?,?,?,?,?,?)";
        
        // Preparing the statement 
        if (!($statement = $bd->prepare($query))) {
            die("Preparation failed: (" . $bd->errno . ") " . $bd->error);
        }
        $titulo = $bd->real_escape_string($titulo);
        $sinopsis = $bd->real_escape_string($sinopsis);
        $fecha_inicio = $bd->real_escape_string($fecha_inicio);
        $fecha_inicio = date('Y/m/d ');
        $fecha_fin = $bd->real_escape_string($fecha_fin);
        $fecha_fin = date('Y/m/d ');
        $hora_inicio = $bd->real_escape_string($hora_inicio);
        $hora_inicio  = date('H:i:s');
        $hora_fin = $bd->real_escape_string($hora_fin);
        $hora_fin  = date('H:i:s');
        $ubicacion = $bd->real_escape_string($ubicacion);
        $descripcion = $bd->real_escape_string($descripcion);
        
        if (!$statement->bind_param("sss",'$indice2', '$titulo', '$sinopsis', '$fecha_inicio','$fecha_fin', '$hora_inicio', '$hora_fin', '$ubicacion', '$descripcion', '1')) {
            die("Parameter vinculation failed: (" . $statement->error . ") " . $statement->error); 
        }
         // Executing the statement
         if (!$statement->execute()) {
            die("Execution failed: (" . $statement->error . ") " . $statement->error);
          } 

        close($bd);
    }

?>