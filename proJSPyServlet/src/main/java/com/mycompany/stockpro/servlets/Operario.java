package com.mycompany.stockpro.servlets;

public class Operario {

    private int idOperario;
    private String nombre;
    private String cedula;
    private String cargo;
    private String telefono;
    private String email;

    public Operario(int idOperario, String nombre, String cedula, String cargo, String telefono, String email) {
        this.idOperario = idOperario;
        this.nombre = nombre;
        this.cedula = cedula;
        this.cargo = cargo;
        this.telefono = telefono;
        this.email = email;
    }

    public Operario() {
    }

    public int getIdOperario() {
        return idOperario;
    }

    public void setIdOperario(int idOperario) {
        this.idOperario = idOperario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
