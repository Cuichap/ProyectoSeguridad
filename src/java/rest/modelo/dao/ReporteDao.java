/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Permiso;
import rest.modelo.entidad.Visita;

/**
 *
 * @author LEYDI
 */
public interface ReporteDao {
    
   public int cantidadPermisos();
   public int cantidadPerResidente();
   public int cantidadPerPersonal();    
   public int cantidadPerVehiculo();
   public int cantidadIncidencia();
   public int cantidadVisita();
   public List<Visita> ListaVisitas();
   public List<Permiso> listaPerRes();
   public List<Permiso> listarPermisos(String permisoid);
}
