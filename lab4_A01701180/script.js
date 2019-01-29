function sumaNumerosRand() {
  var x =  Math.floor((Math.random() * 100) + 1);
  var y =  Math.floor((Math.random() * 100) + 1);
  var resultado = x + y;
  document.getElementById("x").innerHTML = x;
  document.getElementById("y").innerHTML = y;
  document.getElementById("resultado").innerHTML = resultado;
}
