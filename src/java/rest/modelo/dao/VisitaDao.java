/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Persona;
import rest.modelo.entidad.Visita;

/**
 *
 * @author Carlitos
 */
public interface VisitaDao {
    
    /*INSERTAR VISITA*/
    public boolean registrarVisita(String idper, String fing, String hing, String dest, String vistado, String descrip, String userReg);
    public boolean registrarTodojeje(String nomb, String ape, String dir, String proce, String tpdoc, String numdoc, String tel, String gen, String fing, String hing, String dest, String vistado, String descrip, String userReg);
    
    /*LISTAR VISITAS*/
    public List<Visita> listarVisita();
    public List<Visita> listaVisitaEdit(String id);
    public List<Persona> listarPersona();
    public Persona MaxidPersona();
    
    /*ELIMINAR VISITA*/
    public boolean eliminarVisita(String id);
    
    /* ACTIVAR VISITAR */
    public boolean activarVisita(String id);
    
}
