/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Area;
import rest.modelo.entidad.Deber;
import rest.modelo.entidad.Marca;
import rest.modelo.entidad.Motivo;
import rest.modelo.entidad.Objeto;
import rest.modelo.entidad.Opcion;
import rest.modelo.entidad.Perfiles;
import rest.modelo.entidad.Persona;
import rest.modelo.entidad.Responsabilidad;
import rest.modelo.entidad.TipoDeber;
import rest.modelo.entidad.TipoDocumento;
import rest.modelo.entidad.TipoIncidencia;
import rest.modelo.entidad.TipoPermiso;
import rest.modelo.entidad.TipoPersona;
import rest.modelo.entidad.TipoVehiculo;
import rest.modelo.entidad.Turno;
import rest.modelo.entidad.Usuario;
import rest.modelo.entidad.Vehiculo;

/**
 *
 * @author USUARIO
 */
public interface MantenimientoDao {
    
    /* MANTENIMIENTO -- AGREGAR */
    public boolean AgregarPersona(Persona persona);
    public boolean AgregarTipoPersona(TipoPersona tipoPersona);
    public boolean AgregarUsuario(Usuario usuario);
    public boolean AgregarObjeto(Objeto objeto);
    public boolean AgregarOpciones(Opcion opcion);
    public boolean AgregarPerfil(Perfiles perfiles);
    public boolean AgregarArea(Area area);
    public boolean AgregarVehiculo(Vehiculo vehiculo);
    public boolean AgregarTipoVehiculo(TipoVehiculo tipoVehiculo);
    public boolean AgregarMarca(Marca marca);
    public boolean AgregarTurno(Turno turno);
    public boolean AgregarDeber(Deber deber);
    public boolean AgregarTipoDeber(TipoDeber tipoDeber);
    public boolean AgregarResponsabilidad(Responsabilidad responsabilidad);
    public boolean AgregarMotivo(Motivo motivo);
    public boolean AgregarTipoSalida(TipoPermiso tipoPermiso);
    public boolean AgregarTipoIncidencia(TipoIncidencia tipoIncidencia);
    public boolean AgregarTipoDocumento(TipoDocumento tipoDocumento);
    
    /* MANTENIMIENTO -- EDITAR */
    
    
    /* MANTENIMIENTO -- LISTAS -- ACTIVOS */
    public List<TipoDocumento> listarTipoDocumentoAct();
    public List<Area> listarAreasAct();
    public List<Perfiles> listarPerfilesAct();
    public List<TipoPersona> listarTipoPersonaAct();
    public List<Opcion> listarOpcionesAct();
    
    /* MANTENIMIENTO -- LISTAS */
    public List<Persona> listarPersona();
    public List<TipoPersona> listarTipoPersona();
    public List<Usuario> listarUsuario();
    public List<Objeto> listarObjeto();
    public List<Opcion> listarMenus();
    
    /* MANTENIMIENTO -- EXTRAS */
    public boolean RestablecerPassword(String id);
    
    /* MANTENIMIENTO -- ELIMINAR */
    public boolean EliminarPersona(String id);
    public boolean EliminarTipoPersona(String id);
    public boolean EliminarUsuario(String id);
    
}
