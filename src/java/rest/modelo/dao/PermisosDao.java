/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Permiso;

/**
 *
 * @author Carlitos
 */
public interface PermisosDao {
    
    public boolean agregarPermiso(Permiso permiso);
    
    /* LISTAR PERMISOS */
    public List<Permiso> listarPermisosResidentes();
    public List<Permiso> listarPermisosPersonal();
    public List<Permiso> listarPermisosVehiculo();
}
