
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel="stylesheet" href="estilos/login.css">
  <title>Iniciar Sesión - StockPro</title>
  <link rel="icon" type="image/x-icon" href="img/Cubo.ico">
  
</head>
<body>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
  }
  .container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    
  }
  .logo {
    text-align: center;
    margin-bottom: 20px;
  }
  .input-field label {
    font-weight: bold;
    
  }
  .btn-login {
    
    color: white;
    width: 100%;
    margin-top: 20px;
  }

  .recover-password {
    width: 100%;
    margin-top: 20px;
    text-align: center;
  }


/* Estilos para dispositivos móviles */
@media screen and (max-width: 600px) {
  .container {
    max-width: 100%;
    padding: 10px;
  }
  .input-field label {
    font-size: 14px; 
  }
  .btn-login {
    margin-top: 15px;
  }
  .recover-password {
    margin-top: 15px;
  }
}
    </style>
  
  <div class="container">
    <div class="logo">
      <img src="https://i.ibb.co/H4P3S5V/StockPro.png" alt="Logo de la Empresa" class="responsive-img">
    </div>
    <h5>Iniciar Sesión</h5>
    
    <form action="SvUsuarios" method="post">
      <div class="input-field">
        <input type="text" id="usuario" name="usuario" required >
        <label for="usuario">Usuario</label>
      </div>
      <div class="input-field">
        <input type="password" id="contrasena" name="contrasena" required >
        <label for="contrasena">Contraseña</label>
      </div>
        
      <input type="submit" value="Iniciar sesión" class="btn waves-effect waves-light btn-login btn-block" onclick="return redireccionarSegunUsuario();">

      <div class="recover-password">
        <a href="RecuperarContrasena.html">¿Olvidó su contraseña?</a>
    
      </div>
    </form> 
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>

