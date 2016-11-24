/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Incidencia;
import rest.modelo.entidad.TipoIncidencia;
import rest.modelo.entidad.Usuario;

/**
 *
 * @author Carlitos
 */
public interface IncidenciaDao {
     public List<Incidencia> listarIncidencia();
     public List<Incidencia> listarObjetoPerdido();
     
     public List<Incidencia> listarIcidenciaEdit(String id, String id2);
     public List<Usuario> listarUsuario();
     public List<TipoIncidencia> listaTipoIncidencia();
     
     public boolean editarIncidencia(Incidencia incidencia, String id, String id2);
     
     
}
