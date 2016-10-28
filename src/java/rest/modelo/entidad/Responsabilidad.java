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
public class Responsabilidad {
    
    private String deberid;
    private String usuarioid;
    private String turnoid;
    private String usuarioidreg;

    public Responsabilidad() {
    }

    public String getDeberid() {
        return deberid;
    }

    public void setDeberid(String deberid) {
        this.deberid = deberid;
    }

    public String getUsuarioid() {
        return usuarioid;
    }

    public void setUsuarioid(String usuarioid) {
        this.usuarioid = usuarioid;
    }

    public String getTurnoid() {
        return turnoid;
    }

    public void setTurnoid(String turnoid) {
        this.turnoid = turnoid;
    }

    public String getUsuarioidreg() {
        return usuarioidreg;
    }

    public void setUsuarioidreg(String usuarioidreg) {
        this.usuarioidreg = usuarioidreg;
    }
    
}
