        //guardar form
        $("#enviar").click(function(){
            $('#container').submit(function(ev){
                ev.preventDefault();
                var nombre = $('#nombre').val();
                console.log(nombre);
                $.ajax({
                    type: 'POST',
                    url: '../util/transaccionNombre.php',
                    data:{nombre:nombre}
                })
                .done(function(nombre){
                     $('#tran').html(nombre)
                    $('#nombre').val(" ");
                   
                })
                .fail(function(){
                    console.log('error form');
                })
            })
        });

     $(document).ready(function(){
      $("input").focus(function(){
        $(this).css("background-color", "#cccccc");
      });
      $("input").blur(function(){
        $(this).css("background-color", "#ffffff");
      });
    });
    
 