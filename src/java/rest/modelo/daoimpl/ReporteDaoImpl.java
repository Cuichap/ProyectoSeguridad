/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.daoimpl;

import java.util.ArrayList;
import java.util.List;
import rest.modelo.conexion.Conexion;
import rest.modelo.conexion.Configuracion;
import rest.modelo.dao.ReporteDao;
import rest.modelo.entidad.Permiso;
import rest.modelo.entidad.Visita;

/**
 *
 * @author LEYDI
 */
public class ReporteDaoImpl implements ReporteDao{
    
       
      @Override
    public int cantidad() {
        Conexion cx = Configuracion.GaritaUPeU();
        String query = "SELECT count(p.fechasalida) as cantidadP FROM permiso as p,  usuario_permiso as up WHERE  up.permiso_id=p.permiso_id  and up.usuario_id=4 and fechasalida<curdate()";
        cx.execQuery(query);
        cx.getNext();
        int cantidad=Integer.parseInt(cx.getCol("cantidadP"));        
        return cantidad; 
        }

    @Override
    public List<Visita> ListaVisitas() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Visita> listaVisi = new ArrayList<>();
        String query = "SELECT v.visita_id as idv, p.persona_id idp, concat(p.nombre,' ', p.apellidos) as nombres, v.fechaentrada as fecha1, v.horaentrada as hora1, v.destino as destino, ifnull(v.visitado,'----') as visitado, ifnull(v.descripcion,'----') as descripcion, v.fechasalida as fecha2,  v.horasalida as hora2, CASE v.estado WHEN 0 THEN 'Inactivo' WHEN 1 THEN 'Activo' END as estado \n" +
                        "FROM visita v, persona_visita as pv, persona as p, tipo_documento as td, usuario as us WHERE v.visita_id=pv.visita_id and pv.persona_id=p.persona_id and p.tipo_documento_id=td.tipo_documento_id and us.usuario_id=v.usuario_id_reg";
        cx.execQuery(query);
        while (cx.getNext()) {
            Visita visita = new Visita();
            visita.setVisitaid(cx.getCol("idv"));
            visita.setPersonaid(cx.getCol("idp"));
            visita.setNombres(cx.getCol("nombres"));
            visita.setFechaentrada(cx.getCol("fecha1"));
            visita.setHoraentrada(cx.getCol("hora1"));
            visita.setDestino(cx.getCol("destino"));
            visita.setVisitado(cx.getCol("visitado"));
            visita.setDescripcion(cx.getCol("descripcion"));
            visita.setFechasalida(cx.getCol("fecha2"));
            visita.setHorasalida(cx.getCol("hora2"));
            visita.setEstado(cx.getCol("estado"));
            listaVisi.add(visita);
        }
        return listaVisi;
    }

    @Override
    public List<Permiso> listaPerRes() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Permiso> listPerRe = new ArrayList<>();
        String query = "Select p.persona_id as idp,u.usuario_id as idu, pe.permiso_id as idpe,  concat(p.nombre,' ', p.apellidos) as nombres, ifnull(pe.lugar,'---') as lugar, ifnull(m.nombre_motivo,'---') as motivo, pe.fechasalida as fecha1, pe.horasalida as hora1, pe.fechaingreso as fecha2, pe.horaingreso as hora2, pe.fechasalidareal as fecha11, pe.horasalidareal as hora11, pe.fechaingresoreal as fecha22, pe.horasalidareal as hora22, ifnull(pe.otros,'---') as otros, ifnull(pe.observacion,'----') as observaciones\n" +
                        "from persona as p, tipo_persona as tip, area as a, usuario as u, usuario_permiso as up, permiso as pe, tipo_permiso as tp, motivo as m\n" +
                        "where p.persona_id=u.persona_id and tip.tipo_persona_id=u.tipo_persona_id and a.area_id=u.area_id \n" +
                        "and u.usuario_id=up.usuario_id and up.permiso_id=pe.permiso_id and tp.tipo_permiso_id=pe.tipo_permiso_id and m.motivo_id=pe.motivo_id";
        cx.execQuery(query);
        while (cx.getNext()) {
            Permiso permiso = new Permiso();
            permiso.setPersonaid(cx.getCol("idp"));
            permiso.setUsuarioid(cx.getCol("idu"));
            permiso.setPermisoid(cx.getCol("idpe"));
            permiso.setNombres(cx.getCol("nombres"));
            permiso.setLugar(cx.getCol("lugar"));
            permiso.setMotivo(cx.getCol("motivo"));
            permiso.setFechasalida(cx.getCol("fecha1"));
            permiso.setHorasalida(cx.getCol("hora1"));
            permiso.setFechaingreso(cx.getCol("fecha2"));
            permiso.setHoraingreso(cx.getCol("hora2"));
            permiso.setFechasalidareal(cx.getCol("fecha1"));
            permiso.setHorasalidareal(cx.getCol("hora1"));
            permiso.setFechaingresoreal(cx.getCol("fecha2"));
            permiso.setHoraingresoreal(cx.getCol("hora2"));
            permiso.setOtros(cx.getCol("otros"));
            permiso.setObservacion(cx.getCol("observaciones"));
            listPerRe.add(permiso);
        }
        return listPerRe;
    }

    @Override
    public List<Permiso> listarPermisos(String personaid) {
     Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Permiso> listPerRe = new ArrayList<>();
        String query = "Select p.persona_id as idp,u.usuario_id as idu, concat(p.nombre,' ', p.apellidos) as nombres, ifnull(pe.lugar,'---') as lugar, ifnull(p.telefono,'---') as telefono, ifnull(m.nombre_motivo,'---') as motivo, pe.fechasalida as fecha1, pe.horasalida as hora1, pe.fechaingreso as fecha2, pe.horaingreso as hora2, pe.fechasalidareal as fecha11, pe.horasalidareal as hora11, pe.fechaingresoreal as fecha22, pe.horasalidareal as hora22, ifnull(pe.otros,'---') as otros, ifnull(pe.observacion,'----') as observaciones\n" +
                        "from persona as p, tipo_persona as tip, area as a, usuario as u, usuario_permiso as up, permiso as pe, tipo_permiso as tp, motivo as m\n" +
                        "where p.persona_id=u.persona_id and tip.tipo_persona_id=u.tipo_persona_id and a.area_id=u.area_id \n" +
                        "and u.usuario_id=up.usuario_id and up.permiso_id=pe.permiso_id and tp.tipo_permiso_id=pe.tipo_permiso_id and m.motivo_id=pe.motivo_id and pe.permiso_id="+personaid;
        cx.execQuery(query);
        while (cx.getNext()) {
            Permiso permiso = new Permiso();
            permiso.setPersonaid(cx.getCol("idp"));
            permiso.setUsuarioid(cx.getCol("idu"));
            permiso.setNombres(cx.getCol("nombres"));
            permiso.setLugar(cx.getCol("lugar"));
            permiso.setTelefono(cx.getCol("telefono"));
            permiso.setMotivo(cx.getCol("motivo"));
            permiso.setFechasalida(cx.getCol("fecha1"));
            permiso.setHorasalida(cx.getCol("hora1"));
            permiso.setFechaingreso(cx.getCol("fecha2"));
            permiso.setHoraingreso(cx.getCol("hora2"));
            permiso.setFechasalidareal(cx.getCol("fecha1"));
            permiso.setHorasalidareal(cx.getCol("hora1"));
            permiso.setFechaingresoreal(cx.getCol("fecha2"));
            permiso.setHoraingresoreal(cx.getCol("hora2"));
            permiso.setOtros(cx.getCol("otros"));
            permiso.setObservacion(cx.getCol("observaciones"));
            listPerRe.add(permiso);
        }
        return listPerRe;   
    }
}
    
    
    

