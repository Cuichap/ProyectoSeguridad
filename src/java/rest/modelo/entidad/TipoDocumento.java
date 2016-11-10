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
public class TipoDocumento {
    
    private String tipodocumentoid;
    private String nombredocumento;
    private String estado;
    private String userIdReg;

    public TipoDocumento() {
    }

    public String getTipodocumentoid() {
        return tipodocumentoid;
    }

    public void setTipodocumentoid(String tipodocumentoid) {
        this.tipodocumentoid = tipodocumentoid;
    }

    public String getNombredocumento() {
        return nombredocumento;
    }

    public void setNombredocumento(String nombredocumento) {
        this.nombredocumento = nombredocumento;
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
