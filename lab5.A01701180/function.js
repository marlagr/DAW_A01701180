
function validar()
{

  var contra1 = document.getElementById(pass).value;
  var contra2 = document.getElementById(pass2).value;


  if(contra1 === contra2){
    alert("Contraseña Valida");
  }
  else if (contra1 === " " || contra2===" ") {
    alert("Campos vacios");
  }
  else {
    alert("contraseña no valida");
  }
}
