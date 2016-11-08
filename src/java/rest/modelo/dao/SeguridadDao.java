/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Acceso;
import rest.modelo.entidad.Opcion;
import rest.modelo.entidad.Perfiles;
import rest.modelo.entidad.Responsabilidad;
import rest.modelo.entidad.Usuario;

/**
 *
 * @author USUARIO
 */
public interface SeguridadDao {
    
    /* SEGURIDAD -- AGREGAR */
    public boolean AgregarUsuario(Usuario usuario);
    public boolean AgregarPerfil(Perfiles perfiles);
    public boolean AgregarAccesos(Acceso acceso);
    public boolean AgregarOpciones(Opcion opcion);
    public boolean AgregarResponsabilidad(Responsabilidad responsabilidad);
    
    /* SEGURIDAD -- LISTAS */
    public List<Usuario> listarUsuario();
    public List<Perfiles> listarPerfiles();
    public List<Acceso> listarAccesos();
    public List<Opcion> listarMenus();
    public List<Responsabilidad> listarResponsabilidad();
    
    /* SEGURIDAD -- EXTRAS */
    public boolean RestablecerPassword(String id);
    
    /* SEGURIDAD -- LISTAS -- ID */
    public List<Usuario> listarEditUsuario(String id);
    public List<Perfiles> listarEditPerfil(String id);
    public List<Acceso> listarEditAccesos(String id);
    public List<Opcion> listarEditMenus(String id);
    public List<Responsabilidad> listarEditResponsabilidad(String iddeb, String iduser, String idtur);
    
    /* SEGURIDAD -- EDITAR */
    
    
    /* SEGURIDAD -- ELIMINAR */
    public boolean EliminarUsuario(String id);
    public boolean EliminarPerfil(String id);
    public boolean EliminarAcceso(String idper, String idop);
    public boolean EliminarMenu(String id);
    public boolean EliminarResponsabilidad(String iddeber, String iduser, String idturno);
    
    /* SEGURIDAD -- ACTIVAR */
    public boolean ActivarUsuario(String id);
    public boolean ActivarPerfil(String id);
    public boolean ActivarAcceso(String idper, String idop);
    public boolean ActivarMenu(String id);
    public boolean ActivarResponsabilidad(String iddeber, String iduser, String idturno);
    
}
