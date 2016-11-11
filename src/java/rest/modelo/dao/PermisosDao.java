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
    
    /* LISTAR POR ID */
    public List<Permiso> listarPermisoResidenteEdit(String IdPermiso);
    public List<Permiso> listarPermisoPersonalEdit(String IdPermiso);
    public List<Permiso> listarPermisoVehiculoEdit(String IdPermiso, String idVehiculo);
    
    /* EDITAR */
    public boolean EditarPermiso (Permiso permiso, String id);
    public boolean AgregarSalidaResidente (Permiso permiso, String id);
    public boolean AgregarIngresoResidente (Permiso permiso, String id);
    public boolean AgregarSalidaVehiculo (Permiso permiso, String id, String id2);
    public boolean AgregarentradaVehiculo(Permiso permiso, String id, String id2);
    public boolean EditarPermisoVehiculo(Permiso permiso, String id, String id2);
    
    
    /* ELIMINAR*/
    public boolean EliminarPermiso (String id);
    public boolean EliminarPermisoVehiculo (String id);
    
    /* ACTIVAR */
    public boolean ActivarPermiso(String id);
    public boolean ActivarPermisoVehiculo(String id);
}
