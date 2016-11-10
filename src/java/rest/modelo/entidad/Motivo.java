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
public class Motivo {
    
    private String motivoid;
    private String nombremotivo;
    private String estado;
    private String userIdReg;

    public Motivo() {
    }

    public String getMotivoid() {
        return motivoid;
    }

    public void setMotivoid(String motivoid) {
        this.motivoid = motivoid;
    }

    public String getNombremotivo() {
        return nombremotivo;
    }

    public void setNombremotivo(String nombremotivo) {
        this.nombremotivo = nombremotivo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getUserIdReg() {
        return userIdReg;
    }

    public void setUserIdReg(String userIdReg) {
        this.userIdReg = userIdReg;
    }
    
}
