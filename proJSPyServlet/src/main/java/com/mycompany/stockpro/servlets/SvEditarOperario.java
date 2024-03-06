package com.mycompany.stockpro.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editarOperario")
public class SvEditarOperario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Obtener parámetros del formulario
        int idOperario = Integer.parseInt(request.getParameter("idOperario"));
        String nombre = request.getParameter("nombre");
        String cedula = request.getParameter("cedula");
        String cargo = request.getParameter("cargo");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");

        // JDBC URL, username, and password of MySQL server
        String jdbcUrl = "jdbc:mysql://localhost:3306/bd_stockpro";
        String dbUser = "root";
        String dbPassword = "";

        // JDBC variables for opening, closing and managing connection
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Consulta SQL para actualizar los datos del operario
            String sql = "UPDATE operarios SET nombre = ?, cedula = ?, cargo = ?, telefono = ?, email = ? WHERE idOperario = ?";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, nombre);
                statement.setString(2, cedula);
                statement.setString(3, cargo);
                statement.setString(4, telefono);
                statement.setString(5, email);
                statement.setInt(6, idOperario);

                int filasActualizadas = statement.executeUpdate();

                if (filasActualizadas > 0) {
                    response.sendRedirect("GestiónUsuarios.jsp");
                } else {
                    throw new SQLException("Error al actualizar el operario");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }
}
