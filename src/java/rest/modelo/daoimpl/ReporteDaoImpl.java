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
            visita.setDescripcion(cx.getCol("descripción"));
            visita.setFechasalida(cx.getCol("fecha2"));
            visita.setHorasalida(cx.getCol("hora2"));
            visita.setEstado(cx.getCol("estado"));
            listaVisi.add(visita);
        }
        return listaVisi;
    }
}
    
    
    

