package com.mycompany.stockpro.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SvObtenerOperarios")
public class SvObtenerOperarios extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // Conexión con la base de datos
    String url = "jdbc:mysql://localhost:3306/bd_stockpro";
    String usuario = "root";
    String clave = "";

    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection(url, usuario, clave);

      // Consulta SQL
      String consulta = "SELECT idoperario, nombre, cedula, cargo, Telefono, email FROM operario";

      // Ejecución de la consulta
      Statement sentencia = conexion.createStatement();
      ResultSet resultado = sentencia.executeQuery(consulta);

      // Creación de la tabla HTML
      StringBuilder tabla = new StringBuilder();
      tabla.append("<table border='1'>");
      tabla.append("<thead>");
      tabla.append("<tr>");
      tabla.append("<th>ID Operario</th>");
      tabla.append("<th>Nombre</th>");
      tabla.append("<th>Cédula</th>");
      tabla.append("<th>Cargo</th>");
      tabla.append("<th>Teléfono</th>");
      tabla.append("<th>Email</th>");
      tabla.append("<th>Acciones</th>");
      tabla.append("</tr>");
      tabla.append("</thead>");
      tabla.append("<tbody>");

      while (resultado.next()) {
        // Obtener los datos del operario
        int idOperario = resultado.getInt("idoperario");
        String nombre = resultado.getString("nombre");
        String cedula = resultado.getString("cedula");
        String cargo = resultado.getString("cargo");
        String telefono = resultado.getString("telefono");
        String email = resultado.getString("email");

        // ... (código para crear la fila de la tabla)
        
        tabla.append("<tr id='").append(idOperario).append("'>");
        tabla.append("<td>").append(idOperario).append("</td>");
        tabla.append("<td>").append(nombre).append("</td>");
        tabla.append("<td>").append(cedula).append("</td>");
        tabla.append("<td>" + cargo + "</td>");
        tabla.append("<td>").append(telefono).append("</td>");
        tabla.append("<td>").append(email).append("</td>");
        tabla.append("<td><button onclick='editarOperario(").append(idOperario).append(")'>Editar</button>");
        tabla.append("<button onclick='eliminarOperario(").append(idOperario).append(")'>Eliminar</button></td>");
        tabla.append("</tr>");
      }

      tabla.append("</tbody>");
      tabla.append("</table>");

      // Envío de la respuesta
      response.setContentType("text/html");
      
      // Verificamos si se hizo clic en "Editar"
      if ("editar".equals(request.getParameter("accion"))) {
        // Si se hizo clic en "Editar", redirigir a la página de edición
        response.sendRedirect("editarOperario.jsp");
      } else {
        // Si no se hizo clic en "Editar", enviar la tabla
        response.getWriter().write(tabla.toString());
      }

    } catch (ClassNotFoundException | SQLException e) {
    }
  }
}


