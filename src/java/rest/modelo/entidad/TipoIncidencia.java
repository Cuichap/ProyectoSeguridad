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
public class TipoIncidencia {
    
    private String tipoincidenciaid;
    private String nombretipoincidencia;
    private String descripcion;
    private String estado;

    public TipoIncidencia() {
    }

    public String getTipoincidenciaid() {
        return tipoincidenciaid;
    }

    public void setTipoincidenciaid(String tipoincidenciaid) {
        this.tipoincidenciaid = tipoincidenciaid;
    }

    public String getNombretipoincidencia() {
        return nombretipoincidencia;
    }

    public void setNombretipoincidencia(String nombretipoincidencia) {
        this.nombretipoincidencia = nombretipoincidencia;
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
