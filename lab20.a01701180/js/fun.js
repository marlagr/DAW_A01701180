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





    /*$("#enviar").click(function(){ 
            $.ajax({
                type: 'POST',
                url: 'util/transaccionNombre.php',
                data:{'data': 'data'}
            })
            .done(function(data){
                $('#tran').html(data)
            })
            .fail(function(){
                console.log('error data');
            })
    });*/
    
 