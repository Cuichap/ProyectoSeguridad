/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.entidad;

/**
 *
 * @author USUARIO
 */
public class Vehiculo {
    
    private String vehiculoid;
    private String tipovehiculoid;
    private String marcaid;
    private String numplaca;
    private String decripcion;

    public Vehiculo() {
    }

    public String getVehiculoid() {
        return vehiculoid;
    }

    public void setVehiculoid(String vehiculoid) {
        this.vehiculoid = vehiculoid;
    }

    public String getTipovehiculoid() {
        return tipovehiculoid;
    }

    public void setTipovehiculoid(String tipovehiculoid) {
        this.tipovehiculoid = tipovehiculoid;
    }

    public String getMarcaid() {
        return marcaid;
    }

    public void setMarcaid(String marcaid) {
        this.marcaid = marcaid;
    }

    public String getNumplaca() {
        return numplaca;
    }

    public void setNumplaca(String numplaca) {
        this.numplaca = numplaca;
    }

    public String getDecripcion() {
        return decripcion;
    }

    public void setDecripcion(String decripcion) {
        this.decripcion = decripcion;
    }
    
}
