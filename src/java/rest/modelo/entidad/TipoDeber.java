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
public class TipoDeber {
    
    private String tipodeberid;
    private String nombretipodeber;
    private String estado;
    private String userIdReg;

    public TipoDeber() {
    }

    public String getTipodeberid() {
        return tipodeberid;
    }

    public void setTipodeberid(String tipodeberid) {
        this.tipodeberid = tipodeberid;
    }

    public String getNombretipodeber() {
        return nombretipodeber;
    }

    public void setNombretipodeber(String nombretipodeber) {
        this.nombretipodeber = nombretipodeber;
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
