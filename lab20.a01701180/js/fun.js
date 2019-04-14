
    $(document).ready(function(){ 
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
    });
    
        //guardar form
        $(document).ready(function(){
            $('#container').submit(function(ev){
                ev.preventDefault();
                var nombre = $('#nombre').val();
                console.log(nombre);
                $.ajax({
                    type: 'POST',
                    url: 'util/transaccionNombre.php',
                    data:{nombre:nombre}
                })
                .done(function(data){
                    $('#nombre').val(" ");     
                })
                .fail(function(){
                    console.log('error form');
                })
            })
        });