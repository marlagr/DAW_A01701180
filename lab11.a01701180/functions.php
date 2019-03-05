<?
 include("header.html");
 //  require_once("footer.html");
 // require_once("util.php");
  if(isset($_POST["submit"])){
    $_POST["first_name"] = htmlspecialchars($_POST["first_name"]);
    $_POST["last_name"] = htmlspecialchars($_POST["last_name"]);
    if(isset($_POST["first_name"]) && isset($_POST["last_name"]) &&
     $_POST["first_name"] != "" && $_POST["last_name"] != ""){
        echo  "Datos Correctos";
        include("footer.html");
      }else {
        echo "Datos incorrectos";

      }
  }else {
    include("index.html");
  }
?>
