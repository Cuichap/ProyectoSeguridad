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
public class Area {
    
    private String areaid;
    private String subareaid;
    private String nombre;
    private String subareanombre;
    private String descripcion;
    private String estado;

    public Area() {
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid;
    }

    public String getSubareaid() {
        return subareaid;
    }

    public void setSubareaid(String subareaid) {
        this.subareaid = subareaid;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSubareanombre() {
        return subareanombre;
    }

    public void setSubareanombre(String subareanombre) {
        this.subareanombre = subareanombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
