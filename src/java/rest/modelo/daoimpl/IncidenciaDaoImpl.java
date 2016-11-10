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
import rest.modelo.dao.IncidenciaDao;
import rest.modelo.entidad.Incidencia;

/**
 *
 * @author Carlitos
 */
public class IncidenciaDaoImpl implements IncidenciaDao{

    @Override
    public List<Incidencia> listarIncidencia() {
Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Incidencia> listaIncidecnia = new ArrayList<>();
        String query = "SELECT i.incidencia_id as idinci, us.usuario_id as idus, concat(per.nombre,' ',per.apellidos) as persona, tip.tipo_persona_id as idtipo, tip.nombre_tipo_persona as nombretipo, ti.tipo_incidencia_id as idtipoin, ti.nombre_tipo_incidencia as nombretipoinci, ui.descripcion as descripcion, i.lugar as lugar, ob.objeto_id as idobjeto, ob.nombre as objeto, i.fecha as fecha, CASE i.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM usuario as us, incidencia as i, usuario_incidencia as ui, tipo_incidencia as ti, objeto as ob, persona as per, tipo_persona as tip WHERE per.persona_id=us.persona_id AND us.usuario_id=ui.usuario_id AND ui.incidencia_id=i.incidencia_id AND i.tipo_incidencia_id=ti.tipo_incidencia_id AND ui.objeto_id=ob.objeto_id AND tip.tipo_persona_id=us.tipo_persona_id";
        cx.execQuery(query);
        while (cx.getNext()) {
            Incidencia incidencia = new Incidencia();
            incidencia.setIncidenciaid(cx.getCol("idinci"));
            incidencia.setUsuarioid(cx.getCol("idus"));
            incidencia.setNombres(cx.getCol("persona"));
            incidencia.setTipopersonaid(cx.getCol("idtipo"));
            incidencia.setNombretipopersona(cx.getCol("nombretipo"));
            incidencia.setNombretipoincidencia(cx.getCol("nombretipoinci"));
            incidencia.setDescripcion(cx.getCol("descripcion"));
            incidencia.setLugar(cx.getCol("lugar"));
            incidencia.setObjetoid(cx.getCol("idobjeto"));
            incidencia.setObjeto(cx.getCol("objeto"));
            incidencia.setFecha(cx.getCol("fecha"));
            incidencia.setEstado(cx.getCol("estado"));
            listaIncidecnia.add(incidencia);
        }
        return listaIncidecnia;    }
    
}
