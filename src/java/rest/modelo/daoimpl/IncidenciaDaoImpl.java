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
import rest.modelo.entidad.TipoIncidencia;
import rest.modelo.entidad.Usuario;

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
        return listaIncidecnia;   
    }

    @Override
    public List<Incidencia> listarObjetoPerdido() {
    Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Incidencia> listaIncidecnia = new ArrayList<>();
        String query = "SELECT i.incidencia_id as idinci, us.usuario_id as idus, concat(per.nombre,' ',per.apellidos) as implicado, tip.tipo_persona_id as idtipo, tip.nombre_tipo_persona as cargo, ti.tipo_incidencia_id as idtipoin, ti.nombre_tipo_incidencia as nombretipoinci, ui.descripcion as descripcion, i.lugar as lugar, ob.objeto_id as idobjeto, ob.nombre as objeto, i.fecha as fecha, CASE i.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM usuario as us, incidencia as i, usuario_incidencia as ui, tipo_incidencia as ti, objeto as ob, persona as per, tipo_persona as tip WHERE per.persona_id=us.persona_id AND us.usuario_id=ui.usuario_id AND ui.incidencia_id=i.incidencia_id AND i.tipo_incidencia_id=ti.tipo_incidencia_id AND ui.objeto_id=ob.objeto_id AND tip.tipo_persona_id=us.tipo_persona_id and ti.tipo_incidencia_id=6;";
        cx.execQuery(query);
        while (cx.getNext()) {
            Incidencia incidencia = new Incidencia();
            incidencia.setIncidenciaid(cx.getCol("idinci"));
            incidencia.setUsuarioid(cx.getCol("idus"));
            incidencia.setNombres(cx.getCol("implicado"));
            incidencia.setTipopersonaid(cx.getCol("idtipo"));
            incidencia.setNombretipopersona(cx.getCol("cargo"));
            incidencia.setNombretipoincidencia(cx.getCol("nombretipoinci"));
            incidencia.setDescripcion(cx.getCol("descripcion"));
            incidencia.setLugar(cx.getCol("lugar"));
            incidencia.setObjetoid(cx.getCol("idobjeto"));
            incidencia.setObjeto(cx.getCol("objeto"));
            incidencia.setFecha(cx.getCol("fecha"));
            incidencia.setEstado(cx.getCol("estado"));
            listaIncidecnia.add(incidencia);
        }
        return listaIncidecnia;
    }

    @Override
    public List<Incidencia> listarIcidenciaEdit(String id, String id2) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Incidencia> listaIncidecnia = new ArrayList<>();
        String query = "SELECT i.incidencia_id as idinci, us.usuario_id as idus, concat(per.nombre,' ',per.apellidos) as persona, tip.tipo_persona_id as idtipo, tip.nombre_tipo_persona as nombretipo, ti.tipo_incidencia_id as idtipoin, ti.nombre_tipo_incidencia as nombretipoinci, ui.descripcion as descripcion, i.lugar as lugar, ob.objeto_id as idobjeto, ob.nombre as objeto, i.fecha as fecha, CASE i.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM usuario as us, incidencia as i, usuario_incidencia as ui, tipo_incidencia as ti, objeto as ob, persona as per, tipo_persona as tip WHERE per.persona_id=us.persona_id AND us.usuario_id=ui.usuario_id AND ui.incidencia_id=i.incidencia_id AND i.tipo_incidencia_id=ti.tipo_incidencia_id AND ui.objeto_id=ob.objeto_id AND tip.tipo_persona_id=us.tipo_persona_id AND i.incidencia_id='"+id+"' AND us.usuario_id='"+id2+"'";
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
        return listaIncidecnia;
    }

    @Override
    public boolean editarIncidencia(Incidencia incidencia, String id, String id2) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE incidencia inc, usuario_incidencia as ui SET inc.lugar='"+incidencia.getLugar()+"', inc.usuario_id_reg='"+incidencia.getUsuarioreg()+"', ui.descripcion='"+incidencia.getDescripcion()+"' WHERE inc.incidencia_id='"+id+"' AND ui.incidencia_id='"+id+"' AND ui.usuario_id='"+id2+"'  ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
        
    }

    @Override
    public List<Usuario> listarUsuario() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Usuario> listaUsuario = new ArrayList<>();
        String query = "SELECT us.usuario_id as id, concat(per.nombre, ' ', per.apellidos) as nombres FROM persona as per, usuario as us WHERE per.persona_id=us.persona_id";
        cx.execQuery(query);
        while (cx.getNext()) {
            Usuario usuario = new Usuario();
            usuario.setUsuarioid(cx.getCol("id"));
            usuario.setNombre(cx.getCol("nombres"));
            listaUsuario.add(usuario);
        }
        return listaUsuario; 
    }

    @Override
    public List<TipoIncidencia> listaTipoIncidencia() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoIncidencia> listaTipoIncidencia = new ArrayList<>();
        String query = "SELECT tipo_incidencia_id as id, nombre_tipo_incidencia as inciden FROM tipo_incidencia";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoIncidencia tipo = new TipoIncidencia();
            tipo.setTipoincidenciaid(cx.getCol("id"));
            tipo.setNombretipoincidencia(cx.getCol("inciden"));
            listaTipoIncidencia.add(tipo);
        }
        return listaTipoIncidencia; 
    }
    
}
