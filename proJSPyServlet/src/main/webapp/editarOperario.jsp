<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.stockpro.servlets.Operario" %>

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
</head>

<body>
  <div class="container">
   <a href="GestiónUsuarios.jsp" class="btn-floating btn-large waves-effect waves-light "><i class="material-icons">reply</i></a>
    <img class="logo" src="img/StockPro.png" alt="Logo StockPro">
    <br>
    <br>
    <br>
<h5>Editar Operario</h5>

<%
 Operario operario = (Operario) request.getAttribute("operario");

    if (operario != null) {
        operario.setIdOperario(Integer.parseInt(request.getParameter("idOperario")));
    } else {
        // Si el objeto operario no está en la solicitud, crea uno vacío
        operario = new Operario();
    }
%>

<form action="editarOperario" method="post">

    <input type="hidden" name="idOperario" value="<%= operario.getIdOperario() %>">

    <div class="input-field">
      <label for="nombre">Nombre</label>
      <input type="text" name="nombre" value="<%= operario.getNombre() %>" required>
    </div>

    <div class="input-field">
      <label for="cedula">Cédula</label>
      <input type="text" name="cedula" value="<%= operario.getCedula() %>" required>
    </div>

    <div class="input-field">
      <label for="cargo">Cargo</label>
      <input type="text" name="cargo" value="<%= operario.getCargo() %>" required>
    </div>

    <div class="input-field">
      <label for="telefono">Teléfono</label>
      <input type="text" name="telefono" value="<%= operario.getTelefono() %>" required>
    </div>

    <input type="submit" class="btn waves-effect waves-light" value="Guardar">

</form>

</div>
</body>
</html>
