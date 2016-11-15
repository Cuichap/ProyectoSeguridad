/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Incidencia;

/**
 *
 * @author Carlitos
 */
public interface IncidenciaDao {
     public List<Incidencia> listarIncidencia();
     public List<Incidencia> listarObjetoPerdido();
}
