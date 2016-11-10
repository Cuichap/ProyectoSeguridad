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
public class Turno {
    
    private String turnoid;
    private String nombreturno;
    private String horainicio;
    private String horafin;
    private String estado;
    private String userIdReg;

    public Turno() {
    }

    public String getTurnoid() {
        return turnoid;
    }

    public void setTurnoid(String turnoid) {
        this.turnoid = turnoid;
    }

    public String getNombreturno() {
        return nombreturno;
    }

    public void setNombreturno(String nombreturno) {
        this.nombreturno = nombreturno;
    }

    public String getHorainicio() {
        return horainicio;
    }

    public void setHorainicio(String horainicio) {
        this.horainicio = horainicio;
    }

    public String getHorafin() {
        return horafin;
    }

    public void setHorafin(String horafin) {
        this.horafin = horafin;
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
