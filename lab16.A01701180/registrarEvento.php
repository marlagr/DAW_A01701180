<? php
    session_start();
    require_once("connection.php");
    if ( isset($_POST["submit"]) && isset($_POST["titulo_evento"]) && isset($_POST["titulo_evento"]) != "" &&
        isset($_POST["sinopsis"]) && isset($_POST["sinopsis"]) != "" &&
        isset($_POST["fecha_inicio"]) && isset($_POST["fecha_inicio"]) != "" &&
        isset($_POST["fecha_fin"]) && isset($_POST["fecha_fin"]) != "" &&
        isset($_POST["hora_inicio"]) && isset($_POST["hora_inicio"]) != "" &&
        isset($_POST["hora_fin"]) && isset($_POST["hora_fin"]) != "" &&
        isset($_POST["ubicacion"]) && isset($_POST["ubicacion"]) != "" &&
        isset($_POST["descripcion"]) && isset($_POST["descripcion"] != "")
        ) {
            $titulo = htmlspecialchars($_POST["titulo_evento"]);
            $sinopsis = htmlspecialchars($_POST["sinopsis"]);
            $fecha_inicio = htmlspecialchars($_POST["fecha_inicio"]);
            $fecha_fin = htmlspecialchars($_POST["fecha_fin"]);
            $hora_inicio = htmlspecialchars($_POST["hora_inicio"]);
            $hora_fin = htmlspecialchars($_POST["hora_fin"]);
            $ubicacion = htmlspecialchars($_POST["ubicacion"]);
            $descripcion = htmlspecialchars($_POST["descripcion"]);
            registrarEvento($titulo, $sinopsis, $fecha_inicio,$fecha_fin, $hora_inicio, $hora_fin, $ubicacion, $descripcion);
            $_SESSION["mensaje"] = "Se agrego un nuevo evento";
            include("../PARTIALS/_header.html");
            header("location: eventos.php");
            include("../PARTIALS/_footer.html");
    } else {
        $_SESSION["error"] = "Datos incorrectos";
        var_dump($_POST);
        header("location:eventos.php");
    }




?>