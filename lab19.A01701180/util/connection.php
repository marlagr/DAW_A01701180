<?php
    function connect() {
      $conexion = mysqli_connect("localhost","a01701180","","Zombies");
      if ($conexion == NULL) {
          die("500: Internal Server Error");
      }
      $conexion->set_charset("utf8");
      return $conexion;
    }
    function close($conexion) {
      mysqli_close($conexion);
    }
    
    function registrarZombie($nombre, $apellido, $estado){
        $bd = connect();

        // insert command specification 
        $query="INSERT INTO zombie (nombre, apellido, estado) VALUES ('$nombre', '$apellido', '$estado')";
        
        $result = mysqli_query($bd,$query);
        
       if($result){
           totalZombie();
           close($bd);
            return $result;
       }else{
            echo "Error<br>".mysqli_error($bd);
           return $result;
           close($bd);
       }

        close($bd);   
    }
    
    function totalZombie(){
        $bd = connect();

        // insert command specification 
        $query="SELECT COUNT(*) as 'total' FROM zombie";
        $results = $bd->query($query);
        $row = mysqli_fetch_array($results, MYSQLI_BOTH);
        echo $row['total'];  
        close($bd);   
    }
    
    function zombieInfeccion(){
        $bd = connect();

        // insert command specification 
        $query="SELECT COUNT(*) as 'total' FROM zombie WHERE estado = 1";
        $results = $bd->query($query);
        $row = mysqli_fetch_array($results, MYSQLI_BOTH);
        echo $row['total'];
        close($bd);   
    }
    
        function zombieComa(){
        $bd = connect();

        // insert command specification 
        $query="SELECT COUNT(*) as 'total' FROM zombie WHERE estado = 2";
        $results = $bd->query($query);
        $row = mysqli_fetch_array($results, MYSQLI_BOTH);
        echo $row['total'];
        
        close($bd);   
    }
    
    function zombieTrans(){
        $bd = connect();

        // insert command specification 
        $query="SELECT COUNT(*) as 'total' FROM zombie WHERE estado = 3";
        $results = $bd->query($query);
        $row = mysqli_fetch_array($results, MYSQLI_BOTH);
        echo $row['total'];
        
        close($bd);   
    }
    
        function zombieMuerto()
        {
            $bd = connect();
    
            // insert command specification 
            $query="SELECT COUNT(*) as 'total' FROM zombie WHERE estado = 4";
            $results = $bd->query($query);
            $row = mysqli_fetch_array($results, MYSQLI_BOTH);
            close($bd);
            echo $row['total'];
        }
    
    function zombieNoMuertos()
    {
        $bd = connect();
        // insert command specification 
        $query="SELECT COUNT(*) as 'total' FROM zombie WHERE estado = 1 OR estado = 2 OR estado = 3";
        $results = $bd->query($query);
        $row = mysqli_fetch_array($results, MYSQLI_BOTH);
        echo $row['total'];
        close($bd); 
    }
    
    function todos()
    {
        $bd= connect();
        $query="CALL TODOS()";
        $results = $bd->query($query);
        echo  '<h4>Bitácora de zombies</h4><table class="table table-striped"><thead ><tr><th scope="col">Nombre</th><th scope="col">Apellido</th><th scope="col">Estado</th><th scope="col">Fecha</th></tr></thead><tbody>';
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) {
            echo  '<tr>';
            // use of numeric index
            echo  '<td scope="row">'.$row['nombre'].'</td>';
            echo  '<td scope="row">'.$row['apellido'].'</td>';
            echo '<td scope="row">'.$row['descripcion'].'</td>';
            echo  '<td scope="row">'.$row['hora_fecha'].'</td>';
        	echo  '</tr>';
        }
        echo   '</tr></tbody></table><hr>';
        close($bd);
        return $print;
    }
    
    function obtenerSelect()
    {
        $bd = connect();
        $query = 'SELECT id_estado, descripcion FROM estado';
        $results = $bd->query($query);
        $print .= 'Selecciona Estado<select id="select"><option  value="0">Selecciona estado</option>';
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) {
            $print .= '<option value="'.$row['id_estado'].'">'.$row['descripcion'].'</option>';
        }
        $print .= '</select>';
        close($bd);
        return $print;
    }
    
    
    
?>