
    $(document).ready(function(){
            
            $.ajax({
                type: 'POST',
                url: 'php/total.php',
                data:{'data': 'data'}
            })
            .done(function(doc){
                $('#total').html(doc)
            })
            .fail(function(){
                console.log('error');
            })
    });
    
    $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/infectados.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#infectados').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });
    
    $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/coma.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#coma').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });    
        $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/trans.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#trans').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });
    
    $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/muerto.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#muerto').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });
    
        $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/nomuertos.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#nomuertos').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });
    
    $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/todos.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#todos').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });
    
    $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'php/select.php',
            data:{'peticion': 'cargar_lugares'}
        })
        .done(function(data){
            $('#estado').html(data)
        })
        .fail(function(){
            console.log('error');
        })
    });
    
    //guardar form
        $(document).ready(function(){
            $('#container').submit(function(ev){
                ev.preventDefault();
                var nombre = $('#nombre').val();
                var apellido = $('#apellido').val();
                var select = $('#select').val();
                console.log(nombre);
                console.log(apellido);
                console.log(select);
                $.ajax({
                    type: 'POST',
                    url: 'util/registrarZombie.php',
                    data:{estado: select, nombre:nombre, apellido:apellido}
                })
                .done(function(data){
                    $('#nombre').val(" ");
                    $('#apellido').val(" ");
                    $('#estado').val("0");
                    $('#total').html(data);     
                })
                
                .fail(function(){
                    console.log('error');
                })
            })
        });
    