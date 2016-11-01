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
public class Marca {
    
    private String marcaid;
    private String nombremarca;
    private String estado;

    public Marca() {
    }

    public String getMarcaid() {
        return marcaid;
    }

    public void setMarcaid(String marcaid) {
        this.marcaid = marcaid;
    }

    public String getNombremarca() {
        return nombremarca;
    }

    public void setNombremarca(String nombremarca) {
        this.nombremarca = nombremarca;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
