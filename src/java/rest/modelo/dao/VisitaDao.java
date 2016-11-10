/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Visita;

/**
 *
 * @author Carlitos
 */
public interface VisitaDao {
    
    /*INSERTAR VISITA*/
    public boolean registrarVisita(Visita visita);
    
    /*LISTAR VISITAS*/
    public List<Visita> listarVisita();
    public List<Visita> listaVisitaEdit(String id);
    
    /*ELIMINAR VISITA*/
    public boolean eliminarVisita(String id);
    
    /* ACTIVAR VISITAR */
    public boolean activarVisita(String id);
    
}
