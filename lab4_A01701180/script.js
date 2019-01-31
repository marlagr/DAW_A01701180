function sumaNumerosRand() {


  var secs = new Date();
  let b = secs.getSeconds();


  var x =  Math.floor((Math.random() * 100) + 1);
  var y =  Math.floor((Math.random() * 100) + 1);

  document.getElementById("x").innerHTML = x;
  document.getElementById("y").innerHTML = y;

  var numero =  prompt("ingresa ls suma de " + x +" + "+ y);
  if((x+y)==numero)
  {
    alert("correcto "+b+" segundos");
  }
  else {
    alert("mal "+b+" segundos");
  }
}

function cubeNumber() {
  var numero =  prompt("ingresa el numero");
  var text = "";
  var i;
  for (i = 0; i <= numero; i++) {
    text += i +" "+ (i*i)+" "+(i*i*i) + "<br>";
  }
  document.getElementById("demo").innerHTML = text;
}

function contador(){
  var tamaño = prompt("Ingrese el tamaño del arreglo");
	var arg = [];
  var i = 0;
  var cero = 0;
  var neg =0;
  var pos=0;
	for(i =0;i < tamaño ; i++){
		arg[i]= prompt("Ingrese el siguiente numero");
      if (arg[i]==0) {
        cero++;
      }
      else if (arg[i]<0) {
        neg++;
      }
        else if(arg[i]>0)
        {
          pos++;
        }
	}
  var text = "negativos: "+neg+" positivos: "+pos+" ceros: "+cero;
  document.getElementById("contador").innerHTML = text;
}

function promedios()
{
  var tamaño = prompt("Ingrese el tamaño del arreglo");
  var arg = [];
  var i = 0;
  var total=0;
  for(i =0;i < tamaño ; i++){
    arg[i]= prompt("Ingrese el siguiente numero");
      total += arg[i];
  }
  total = total/tamaño;
  let text = "promedio: " + total;
  document.getElementById("promedio").innerHTML = text;
}

function volteado()
{
  var numero = prompt("Ingrese un numero");
  var inv=0;
  while(numero > 0){ // Cuando ya no queden digitos en el numero acaba el bucle
       inv = (inv *10) + (numero % 10); // Multiplicamos por diez el resultado y sumamos el ultimo digito del numero
       numero = numero%10; // Reducimos en un digito el numero, quitando siempre el ultimo de atras
   }

  document.getElementById("volteado").innerHTML = inv;
}
