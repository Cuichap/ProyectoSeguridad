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
    private String nomresponsab;
    private String nomdeber;
    private String nomturno;
    private String fecha;
    private String estado;
    private String userIdReg;

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

    public String getNomresponsab() {
        return nomresponsab;
    }

    public void setNomresponsab(String nomresponsab) {
        this.nomresponsab = nomresponsab;
    }

    public String getNomdeber() {
        return nomdeber;
    }

    public void setNomdeber(String nomdeber) {
        this.nomdeber = nomdeber;
    }

    public String getNomturno() {
        return nomturno;
    }

    public void setNomturno(String nomturno) {
        this.nomturno = nomturno;
    }
    
    
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
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
