
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel="stylesheet" href="estilos/GestionUsuarios.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >
  <title>Gestión de Usuarios - StockPro</title>
  <link rel="icon" type="image/x-icon" href="img/Cubo.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
  <div class="container">
    <a href="index.jsp" class="btn-floating btn-large waves-effect waves-light "><i class="material-icons">home</i></a>
    <img class="logo" src="img/StockPro.png" alt="Logo StockPro">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <h5>Gestión de Usuarios</h5>
    
<jsp:include page="/SvObtenerOperarios"/>
    <script>
function editarOperario(idOperario) {
    // Redirigir a la página de edición con el parámetro "accion=editar"
    window.location.href = "SvObtenerOperarios?accion=editar&idOperario=" + idOperario;
}

function eliminarOperario(idOperario) {
    // Mostrar una confirmación
    if (confirm("¿Está seguro de que desea eliminar el operario?")) {
        // Enviar una solicitud AJAX para eliminar el operario
        $.ajax({
            url: "eliminarOperario.jsp",
            type: "POST",
            data: {
                idOperario: idOperario
            },
            success: function() {
                // Actualizar la tabla
                location.reload();
            }
        });
    }
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
