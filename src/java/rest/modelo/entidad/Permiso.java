/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.entidad;

/**
 *
 * @author Carlitos
 */
public class Permiso {
    
    private String permisoid;
    private String personaid;
    private String tipopermisoid;
    private String areaid;
    private String area;
    private String nombrepermiso;
    private String nombres;
    private String motivoid;
    private String motivo;
    private String otros;
    private String fechahoraemision;
    private String lugar;
    private String fechasalida;
    private String horasalida;
    private String fechaingreso;
    private String horaingreso;
    private String fechasalidareal;
    private String horasalidareal;
    private String fechaingresoreal;
    private String horaingresoreal;
    private String observacion;
    private String estado;
    private String vehiculoid;
    private String kilometrajesalida;
    private String kilometrajeingreso;
    private String usuarioid;
    private String usuarioautid;
    private String tipovehiculoid;
    private String tipovehiculo;
    private String placa;
    private String descripcionSalida;
    private String descripcionIngreso;
    private int count;

    public Permiso() {
    }

    public String getPermisoid() {
        return permisoid;
    }

    public void setPermisoid(String permisoid) {
        this.permisoid = permisoid;
    }

    public String getPersonaid() {
        return personaid;
    }

    public void setPersonaid(String personaid) {
        this.personaid = personaid;
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTipopermisoid() {
        return tipopermisoid;
    }

    public void setTipopermisoid(String tipopermisoid) {
        this.tipopermisoid = tipopermisoid;
    }

    public String getNombrepermiso() {
        return nombrepermiso;
    }

    public void setNombrepermiso(String nombrepermiso) {
        this.nombrepermiso = nombrepermiso;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getMotivoid() {
        return motivoid;
    }

    public void setMotivoid(String motivoid) {
        this.motivoid = motivoid;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getOtros() {
        return otros;
    }

    public void setOtros(String otros) {
        this.otros = otros;
    }

    public String getFechahoraemision() {
        return fechahoraemision;
    }

    public void setFechahoraemision(String fechahoraemision) {
        this.fechahoraemision = fechahoraemision;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getFechasalida() {
        return fechasalida;
    }

    public void setFechasalida(String fechasalida) {
        this.fechasalida = fechasalida;
    }

    public String getHorasalida() {
        return horasalida;
    }

    public void setHorasalida(String horasalida) {
        this.horasalida = horasalida;
    }

    public String getFechaingreso() {
        return fechaingreso;
    }

    public void setFechaingreso(String fechaingreso) {
        this.fechaingreso = fechaingreso;
    }

    public String getHoraingreso() {
        return horaingreso;
    }

    public void setHoraingreso(String horaingreso) {
        this.horaingreso = horaingreso;
    }

    public String getFechasalidareal() {
        return fechasalidareal;
    }

    public void setFechasalidareal(String fechasalidareal) {
        this.fechasalidareal = fechasalidareal;
    }

    public String getHorasalidareal() {
        return horasalidareal;
    }

    public void setHorasalidareal(String horasalidareal) {
        this.horasalidareal = horasalidareal;
    }

    public String getFechaingresoreal() {
        return fechaingresoreal;
    }

    public void setFechaingresoreal(String fechaingresoreal) {
        this.fechaingresoreal = fechaingresoreal;
    }

    public String getHoraingresoreal() {
        return horaingresoreal;
    }

    public void setHoraingresoreal(String horaingresoreal) {
        this.horaingresoreal = horaingresoreal;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getVehiculoid() {
        return vehiculoid;
    }

    public void setVehiculoid(String vehiculoid) {
        this.vehiculoid = vehiculoid;
    }

    public String getKilometrajesalida() {
        return kilometrajesalida;
    }

    public void setKilometrajesalida(String kilometrajesalida) {
        this.kilometrajesalida = kilometrajesalida;
    }

    public String getKilometrajeingreso() {
        return kilometrajeingreso;
    }

    public void setKilometrajeingreso(String kilometrajeingreso) {
        this.kilometrajeingreso = kilometrajeingreso;
    }

    public String getUsuarioid() {
        return usuarioid;
    }

    public void setUsuarioid(String usuarioid) {
        this.usuarioid = usuarioid;
    }

    public String getUsuarioautid() {
        return usuarioautid;
    }

    public void setUsuarioautid(String usuarioautid) {
        this.usuarioautid = usuarioautid;
    }

    public String getTipovehiculoid() {
        return tipovehiculoid;
    }

    public void setTipovehiculoid(String tipovehiculoid) {
        this.tipovehiculoid = tipovehiculoid;
    }

    public String getTipovehiculo() {
        return tipovehiculo;
    }

    public void setTipovehiculo(String tipovehiculo) {
        this.tipovehiculo = tipovehiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getDescripcionSalida() {
        return descripcionSalida;
    }

    public void setDescripcionSalida(String descripcionSalida) {
        this.descripcionSalida = descripcionSalida;
    }

    public String getDescripcionIngreso() {
        return descripcionIngreso;
    }

    public void setDescripcionIngreso(String descripcionIngreso) {
        this.descripcionIngreso = descripcionIngreso;
    }
}
