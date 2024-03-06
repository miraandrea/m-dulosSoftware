
package com.mycompany.stockpro.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SvUsuarios")
public class SvUsuarios extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Obtener parámetros del formulario
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
            String error="";
            // JDBC URL, username, and password of MySQL server
            String jdbcUrl = "jdbc:mysql://localhost:3306/bd_stockpro";
            String dbUser = "root";
            String dbPassword = "";

            // JDBC variables for opening, closing and managing connection
            try {Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                    {

                // Consulta SQL para verificar el usuario y la contraseña
                String sql = "SELECT * FROM usuarios WHERE Email = ? AND password = ?";

                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, usuario);
                    statement.setString(2, contrasena);
                    ResultSet result = statement.executeQuery();

                    if (result.next()) {
                        // Usuario y contraseña válidos
                        out.println("Inicio de sesión exitoso");
                        //Redirigir a index.jsp
                        response.sendRedirect("index.jsp");
                    } else {
                        // Usuario o contraseña incorrectos
                        out.println("Inicio de sesión fallido");
                        error="Usuario o contraseña incorrectos, por favor intente de nuevo";
                    }
                }}
            } catch (IOException | ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            }
                        out.println("<div style='color: red;'>" + error + "</div>");
        }    }
}
