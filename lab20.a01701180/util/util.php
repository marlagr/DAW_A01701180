<?php

    function connect() {
      $conexion = mysqli_connect("localhost","a01701180","","rbac");
      if ($conexion == NULL) {
          die("500: Internal Server Error");
      }
      $conexion->set_charset("utf8");
      return $conexion;
    }
    
    function close($conexion) {
      mysqli_close($conexion);
    }
    
    function login($email, $password) {
        $usuario = "";
        $bd = connect();
        $query="SELECT Id_Usuario, Contrasena, Nombre, Apellidos FROM usuario";
        $results = $bd->query($query);
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) 
        {             
            if ($email == $row['Id_Usuario'] && $password == $row['Contrasena']) 
            {
                $usuario = $row['Nombre']." ".$row['Apellidos'];
            }          
        }
       return $usuario;
   }
       function obtenerRol($email) {
        $rol = "";
        $bd = connect();
        $query="SELECT Id_Rol, u.Id_Usuario FROM usuario as u, roles_usuario as r where u.Id_Usuario = r.Id_Usuario";
        $results = $bd->query($query);
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) 
        {             
            if ($email == $row['Id_Usuario']) 
            {
                $rol = $row['Id_Rol'];
            }          
        }
        
       return $rol;
   }
   
   function navBar($rol)
   {
        $result = "";
        $bd = connect();
        $query="SELECT DISTINCT r.Id_Rol, r.Id_Privilegio FROM  roles_privilegios AS r, roles AS rol WHERE rol.Id_Rol = r.Id_Rol";
        $results = $bd->query($query);
        $result .= '<div class="dropdown"><a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Opciones</a><div class="dropdown-menu" aria-labelledby="dropdownMenuLink">';
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) 
        {             
            if ($rol == $row['Id_Rol']) 
            {
                $result .= '<a class="dropdown-item" href="../views/'.$row['Id_Privilegio'].'.php">'.$row['Id_Privilegio'].'</a>';
            }          
        }
        $result .= '</div></div>';
      return $result;
   }
   
   function logout()
   {
        session_start();
        session_unset();
        session_destroy();
        header("location:../views/inicioSesion.php");
   }
   
   function obtenerTransaccion($nombre)
   {
        $print = "";
        $bd = connect();
        $query="CALL transaccionNombre('".$nombre."')";
        $results = $bd->query($query);
        echo'<table class="table table-striped"><thead ><tr><th scope="col">Nombre</th><th scope="col">Apellido</th><th scope="col">Monto</th><th scope="col">Fecha</th></tr></thead><tbody>';
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) 
        {             
            echo  '<tr>';
            // use of numeric index
            echo'<td scope="row">'.$row['Nombre'].'</td>';
            echo  '<td scope="row">'.$row['Apellidos'].'</td>';
            echo'<td scope="row">'.$row['Total'].'</td>';
            echo'<td scope="row">'.$row['Fecha'].'</td>';
        	echo '</tr>';
        }
         echo  '</tr></tbody></table><hr>';
        close($bd);
        
      //return $print;
   }


?>