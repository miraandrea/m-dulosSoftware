
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="estilos/PanelDeControl.css"/>
  <title>Panel de Control - StockPro</title>
  <link rel="icon" type="image/x-icon" href="img/Cubo.ico">
</head>
<body>
<style>
        body {
  font-family: Arial, sans-serif;
}

.container {
  display: flex;
  overflow-x: auto;
  scrollbar-width: none;
}

.logo {
  text-align: center;
  margin-top: 10px;
}

.logo img {
  max-width: 100%;
  height: auto;
}

.card {
  position: relative;
  flex: 0 0 309px;
  height: 300px;
  overflow: hidden;
  margin-left: 1.5rem;
  border-radius: 18px;
  box-shadow: 
        2px 4px 12px
        rgba(0,155,119);
}

.dropdown-content {
  width: 100%;
}

.collapsible-header {
  font-weight: bold;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.section-title {
  font-size: 24px;
}

.collapsible-body ul {
  margin-left: 20px;
}

h6 {
  font-weight: bold;
  text-align: center;
}

.notificaciones-box {
  display: none;
  position: absolute;
  top: 150px;
  right: 150px;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: 10px;
  z-index: 1;
}

.btn-floating.btn-large {
  display: flex;
  float:inline-end ;
  margin-top: 0px;
  margin-right: 10px;
}

/* Estilos para dispositivos móviles */
@media screen and (max-width: 600px) {
  .container {
    max-width: 100%;
    padding: 10px;
  }

  .btn-floating.btn-large {
    margin-right: 10px;
  }

  .collapsible-header {
    font-size: 16px;
  }

  .section-title {
    font-size: 20px;
  }

  .collapsible-body ul {
    margin-left: 10px;
  }
}

    </style>
  <script src="Index.js"></script>
  <div class="logo">
    <img src="https://i.ibb.co/H4P3S5V/StockPro.png" alt="Logo StockPro">
    <h6>Panel de Control</h6>
    <a class="btn-floating btn-large waves-effect waves-light blue"><i class="material-icons" id="notificaciones">notifications</i></a>
  </div>
  <div id="notificacionesBox" class="notificaciones-box">
    <p>No tienes notificaciones.</p>
  </div>
  <br><br><br>
  <div class="container">
    <div class="row">
      <div class="col s8 m3 l3">
        <div class="card">
          <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="https://www.bing.com/th?id=OIG.7aG0ZoUnUHcU1LLceeLl&w=236&c=11&rs=1&qlt=90&bgcl=ececec&o=6&pid=PersonalBing&p=0" alt="Imagen de la tarjeta">
          </div>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4">Usuarios<i class="material-icons right">more_vert</i></span>
            <!-- Dropdown Structure -->
          </div>
          <div class="card-reveal">
            <span class="card-title grey-text text-darken-4">Usuarios<i class="material-icons right">close</i></span>
            <ul>
              <li class="divider"></li>
              <li><a href="RegistroUsuario.jsp">Añadir Usuarios</a></li>
              <li class="divider"></li>
            <li><a href="GestiónUsuarios.jsp">Gestionar Usuarios</a></li>
            </ul>
          </div>
        </div>
      </div>
      
      <!-- Repite la estructura de la tarjeta para las otras dos tarjetas -->

      <div class="col s8 m3 l3">
        <div class="card">
          <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="https://www.bing.com/th?id=OIG.cbYXHIBA.qyAjveJshLA&w=236&c=11&rs=1&qlt=90&bgcl=ececec&o=6&pid=PersonalBing&p=0" alt="Imagen de la tarjeta">
          </div>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4">Inventarios<i class="material-icons right">more_vert</i></span>
            <!-- Dropdown Structure -->
          </div>
          <div class="card-reveal">
            <span class="card-title grey-text text-darken-4">Inventarios<i class="material-icons right">close</i></span>
            <!--<ul>
              <li class="divider"></li>
              <li><a href="Preforma.html">Inventario de Preformas</a></li>
              <li class="divider"></li>
            <li><a href="InventarioEnvases.html">Inventario de Envases</a></li>
            <li class="divider"></li>
            <li><a href="InvantarioDesperdicio.html">Inventario de Material para Reciclar</a></li>
            <li class="divider"></li>
            <li><a href="InventarioPellet.html">Inventario de Pellet</a></li>
            </ul>-->
          </div>
        </div>

        
      </div>

      <div class="col s8 m3 l3">
        <div class="card">
          <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="https://www.bing.com/th?id=OIG.nv84vArsy52ASM5LsFdX&w=236&c=11&rs=1&qlt=90&bgcl=ececec&o=6&pid=PersonalBing&p=0" alt="Imagen de la tarjeta">
          </div>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4">Ordenes de producción<i class="material-icons right">more_vert</i></span>
            <!-- Dropdown Structure -->
          </div>
          <div class="card-reveal">
            <span class="card-title grey-text text-darken-4">Ordenes de producción<i class="material-icons right">close</i></span>
            <!--<ul>
              <li class="divider"></li>
              <li><a href="RegistroOP.html">Crear Orden de Producción</a></li>
              <li class="divider"></li>
              <li><a href="GestiónOP.html">Gestionar Órdenes de Producción</a></li>
            </ul>-->
          </div>
        </div>
      </div>

      <div class="col s8 m3 l3">
        <div class="card">
          <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="https://th.bing.com/th/id/OIG.zuNIGNOtdQ3zWtRTGRZc?w=1024&h=1024&rs=1&pid=ImgDetMain" alt="Imagen de la tarjeta">
          </div>
          <div class="card-content">
            <span class="card-title activator grey-text text-darken-4">Informes de producción<i class="material-icons right">more_vert</i></span>
            <!-- Dropdown Structure -->
          </div>
          <div class="card-reveal">
            <span class="card-title grey-text text-darken-4">Informes de producción<i class="material-icons right">close</i></span>
            <!--<ul>
              <li class="divider"></li>
              <li><a href="InformesEnvase.html">Informes de producción de envase</a></li>
              <li class="divider"></li>
              <li><a href="InformesPellet.html">Informes de producción Pellet</a></li>
            </ul>-->
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script>
    // Inicializar el dropdown
    document.addEventListener('DOMContentLoaded', function() {
      var elems = document.querySelectorAll('.dropdown-trigger');
      var instances = M.Dropdown.init(elems);
    });
  </script>
  <footer>
    <a href="login.jsp" class="btn waves-effect waves-light red">Cerrar Sesión</a>
</footer>
</body>
</html>