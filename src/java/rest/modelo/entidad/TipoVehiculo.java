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
public class TipoVehiculo {
    
    private String tipovehiculoid;
    private String nombretipovehiculo;
    
    public TipoVehiculo() {
    }
    

    public String getTipovehiculoid() {
        return tipovehiculoid;
    }

    public void setTipovehiculoid(String tipovehiculoid) {
        this.tipovehiculoid = tipovehiculoid;
    }

    public String getNombretipovehiculo() {
        return nombretipovehiculo;
    }

    public void setNombretipovehiculo(String nombretipovehiculo) {
        this.nombretipovehiculo = nombretipovehiculo;
    }
    
}
