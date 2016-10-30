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
public class Deber {
    
    private String deberid;
    private String nombredeber;
    private String tipodeberid;
    private String nombretipodeber;
    private String estado;

    public Deber() {
    }

    public String getDeberid() {
        return deberid;
    }

    public void setDeberid(String deberid) {
        this.deberid = deberid;
    }

    public String getNombredeber() {
        return nombredeber;
    }

    public void setNombredeber(String nombredeber) {
        this.nombredeber = nombredeber;
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
    
}
