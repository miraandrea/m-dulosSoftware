
package com.mycompany.stockpro.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvRegistroUser", urlPatterns = {"/SvRegistroUser"})
public class SvRegistroUser extends HttpServlet {

  
    @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Obtener parámetros del formulario
            String nombre = request.getParameter("nombre");
            String cedula = request.getParameter("cedula");
            String cargo = request.getParameter("cargo");
            String celular = request.getParameter("Celular");
            String nivelAcceso = request.getParameter("nivel");

            // Variables para datos de usuario
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");

            // JDBC URL, username, and password of MySQL server
            String jdbcUrl = "jdbc:mysql://localhost:3306/bd_stockpro";
            String dbUser = "root";
            String dbPassword = "";

            Connection connection = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                // Deshabilitar el modo de confirmación automática
                connection.setAutoCommit(false);

                // Insertar datos en la tabla operario
                String sqlOperario = "INSERT INTO operario (nombre, cedula, cargo, Telefono, email) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement statementOperario = connection.prepareStatement(sqlOperario, Statement.RETURN_GENERATED_KEYS)) {
                    statementOperario.setString(1, nombre);
                    statementOperario.setString(2, cedula);
                    statementOperario.setString(3, cargo);
                    statementOperario.setString(4, celular);
                    statementOperario.setString( 5, correo);
                    int affectedRows = statementOperario.executeUpdate();

                    if (affectedRows == 0) {
                        throw new SQLException("No se pudo insertar en la tabla operario.");
                    }

                    // Obtener el ID generado en la tabla operario
                    try (ResultSet generatedKeys = statementOperario.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int idOperario = generatedKeys.getInt(1);

                            // Insertar datos en la tabla usuarios
                            String sqlUsuario = "INSERT INTO usuarios (id, nombre, email, password) VALUES (?, ?, ?, ?)";
                            try (PreparedStatement statementUsuario = connection.prepareStatement(sqlUsuario)) {
                                statementUsuario.setInt(1, idOperario);
                                statementUsuario.setString(2, nombre);
                                statementUsuario.setString(3, correo);
                                statementUsuario.setString(4, contrasena);
                                statementUsuario.executeUpdate();
                            }
                        } else {
                            throw new SQLException("No se pudo obtener el ID generado en la tabla operario.");
                        }
                    }
                }

                // Confirmar la transacción
                connection.commit();

                // Redirigir a la página de éxito o a donde desees
                response.sendRedirect("exito.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                // Revertir la transacción en caso de error
                if (connection != null) {
                    try {
                        connection.rollback();
                    } catch (SQLException ex) {
                        out.println("Error al revertir la transacción: " + ex.getMessage());
                    }
                }

                out.println("Error: " + e.getMessage());
            } finally {
                // Restaurar el modo de confirmación automática
                if (connection != null) {
                    try {
                        connection.setAutoCommit(true);
                        connection.close();
                    } catch (SQLException e) {
                        out.println("Error al cerrar la conexión: " + e.getMessage());
                    }
                }
            }
        }
    }
}