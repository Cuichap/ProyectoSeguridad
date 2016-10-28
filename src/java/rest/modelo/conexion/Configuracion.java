/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.conexion;

/**
 *
 * @author USUARIO
 */
public class Configuracion {
    
    public static Conexion GaritaUPeU() {
        Conexion cx = Conexion.getInstance();
        return cx;
    }
    
}
