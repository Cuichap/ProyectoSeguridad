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
public class Objeto {
    
    private String objetoid;
    private String nombreobjeto;
    private String descripcion;
    private String estado;

    public Objeto() {
    }

    public String getObjetoid() {
        return objetoid;
    }

    public void setObjetoid(String objetoid) {
        this.objetoid = objetoid;
    }

    public String getNombreobjeto() {
        return nombreobjeto;
    }

    public void setNombreobjeto(String nombreobjeto) {
        this.nombreobjeto = nombreobjeto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
