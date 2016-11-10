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
}
    
    
    

