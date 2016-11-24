/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.UsuarioPermisoResident;

/**
 *
 * @author USUARIO
 */
public interface AddPermisosDao {
    
    /* PERMISOS -- AGREGAR */
    public boolean AgregarPermisoResidente(UsuarioPermisoResident usuarioPermiso);
    
    /* PERMISOS -- EDITAR */
    public boolean EditarPermisoResidente(UsuarioPermisoResident usuarioPermiso, String id);
    
    /* PERMISOS -- LISTAS -- ID */
    public List<UsuarioPermisoResident> listarEditPermisoResidente(String idper, String iduser);
    
    /* PERMISO -- LISTAS */
    public List<UsuarioPermisoResident> listarPermisoResidente(String id, String estado);
    
    /* PERMISOS -- APROBAR -- PERMISO */
    public boolean AprobarPermisoResidente(String idperm, String iduser, String estado, String idprec);
    
    /* PERMISOS -- ELIMINAR */
    public boolean EliminarPermisoResidente(String id);
    
    /* PERMISOS -- ACTIVAR */
    public boolean ActivarPermisoResidente(String id);
    
    /* preceptor */
     public List<UsuarioPermisoResident> listarPermisoPendientes(String estado);
     
    //public List<UsuarioPermisoResident> listarEditPermisoPendientes(String idper, String iduser); 
    
}
