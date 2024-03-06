
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel="stylesheet" href="RegistroUsario.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" > 
  <title>Añadir Usuario - StockPro</title>
  <link rel="icon" type="image/x-icon" href="img/Cubo.ico">
 
</head>
<body>
 
  <div class="container">
    <a href="index.jsp" class="btn-floating btn-large waves-effect waves-light "><i class="material-icons">home</i></a>
    <div class="logo">
    <img src="https://i.ibb.co/H4P3S5V/StockPro.png" alt="Logo StockPro">
  </div>
    <br>
    <br>
    <br>
    
    <h6>Añadir Usuario</h6>
    
    <form action="SvRegistroUser" method="post">
      <div class="input-field">
        <input type="text" id="nombre" name="nombre" required>
        <label for="nombre">Nombre</label>
      </div>
      <div class="input-field">
        <input type="number" id="cedula" name="cedula" required>
        <label for="cedula">Cédula</label>
      </div>
      <div class="input-field">
        <input type="text" id="cargo" name="cargo" required>
        <label for="cargo">Cargo</label>
      </div>
      <div class="input-field">
        <input type="number" id="Celular" name="Celular">
        <label for="Celular">Celular</label>
      </div>
      <p>
        <label>
          <input type="radio" name="nivel" value="basico" checked>
          <span>Nivel de acceso Básico (solo registro de producción)</span>
        </label>
      </p>
      <p>
        <label>
          <input type="radio" name="nivel" value="total">
          <span>Nivel de acceso Total</span>
        </label>
      </p>
      <div id="nivelTotalFields" style="display: none;">
        <div class="input-field">
          <input type="email" id="correo" name="correo">
          <label for="correo">Correo</label>
        </div>
        <div class="input-field">
          <input type="password" id="contrasena" name="contrasena">
          <label for="contrasena">Contraseña</label>
        </div>
        <div class="input-field">
          <input type="password" id="confirmarContrasena" name="confirmarContrasena">
          <label for="confirmarContrasena">Confirmar Contraseña</label>
        </div>
      </div>
      <button class="btn waves-effect waves-light" type="submit" name="action">Añadir Usuario
        <i class="material-icons right"></i>
      </button>
    </form>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      var radioTotal = document.querySelector('input[value="total"]');
      var nivelTotalFields = document.getElementById('nivelTotalFields');

      radioTotal.addEventListener('change', function() {
        if (radioTotal.checked) {
          nivelTotalFields.style.display = 'block';
        } else {
          nivelTotalFields.style.display = 'none';
        }
      });
    });
  </script>
</body>
</html>

