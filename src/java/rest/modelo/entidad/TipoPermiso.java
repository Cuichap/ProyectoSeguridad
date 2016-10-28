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
public class TipoPermiso {
    
    private String tipopermisoid;
    private String nombretipopermiso;
    private String descripcion;

    public TipoPermiso() {
    }

    public String getTipopermisoid() {
        return tipopermisoid;
    }

    public void setTipopermisoid(String tipopermisoid) {
        this.tipopermisoid = tipopermisoid;
    }

    public String getNombretipopermiso() {
        return nombretipopermiso;
    }

    public void setNombretipopermiso(String nombretipopermiso) {
        this.nombretipopermiso = nombretipopermiso;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
