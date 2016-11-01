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
public class Opcion {
    
    private String opcionesid;
    private String subopcionesid;
    private String menu;
    private String submenu;
    private String tipo;
    private String url;
    private String estado;

    public Opcion() {
    }

    public String getOpcionesid() {
        return opcionesid;
    }

    public void setOpcionesid(String opcionesid) {
        this.opcionesid = opcionesid;
    }

    public String getSubopcionesid() {
        return subopcionesid;
    }

    public void setSubopcionesid(String subopcionesid) {
        this.subopcionesid = subopcionesid;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSubmenu() {
        return submenu;
    }

    public void setSubmenu(String submenu) {
        this.submenu = submenu;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
