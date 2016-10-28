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
public class TipoPersona {
    
    private String TipoPersonaid;
    private String nombreTipoPersona;
    private String estado;

    public TipoPersona() {
    }

    public String getTipoPersonaid() {
        return TipoPersonaid;
    }

    public void setTipoPersonaid(String TipoPersonaid) {
        this.TipoPersonaid = TipoPersonaid;
    }

    public String getNombreTipoPersona() {
        return nombreTipoPersona;
    }

    public void setNombreTipoPersona(String nombreTipoPersona) {
        this.nombreTipoPersona = nombreTipoPersona;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
