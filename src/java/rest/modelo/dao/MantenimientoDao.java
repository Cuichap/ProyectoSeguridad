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
    public boolean AgregarObjeto(Objeto objeto);
    public boolean AgregarArea(Area area);
    public boolean AgregarVehiculo(Vehiculo vehiculo);
    public boolean AgregarTipoVehiculo(TipoVehiculo tipoVehiculo);
    public boolean AgregarMarca(Marca marca);
    public boolean AgregarTurno(Turno turno);
    public boolean AgregarDeber(Deber deber);
    public boolean AgregarTipoDeber(TipoDeber tipoDeber);
    public boolean AgregarMotivo(Motivo motivo);
    public boolean AgregarTipoSalida(TipoPermiso tipoPermiso);
    public boolean AgregarTipoIncidencia(TipoIncidencia tipoIncidencia);
    public boolean AgregarTipoDocumento(TipoDocumento tipoDocumento);
    
    /* MANTENIMIENTO -- EDITAR */
    
    
    /* MANTENIMIENTO -- LISTAS -- ID */
    public List<Persona> listarEditPersona(String id);
    public List<TipoPersona> listarEditTipoPersona(String id);
    public List<Objeto> listarEditObjeto(String id);
    public List<Area> listarEditArea(String id);
    public List<Vehiculo> listarEditVehiculo(String id);
    public List<TipoVehiculo> listarEditTipoVehiculo(String id);
    public List<Marca> listarEditMarcas(String id);
    public List<Turno> listarEditTurnos(String id);
    public List<Deber> listarEditDeberes(String id);
    public List<TipoDeber> listarEditTipoDeber(String id);
    public List<Motivo> listarEditMotivos(String id);
    public List<TipoPermiso> listarEditSalida(String id);
    public List<TipoIncidencia> listarEditTipoIncidencia(String id);
    public List<TipoDocumento> listarEditTipoDocumento(String id);
    
    /* MANTENIMIENTO -- LISTAS -- ACTIVOS */
    public List<TipoDocumento> listarTipoDocumentoAct();
    public List<Area> listarAreasAct();
    public List<Perfiles> listarPerfilesAct();
    public List<TipoPersona> listarTipoPersonaAct();
    public List<Opcion> listarOpcionesAct();
    public List<TipoVehiculo> listarTipoVehiculoAct();
    public List<Marca> listarMarcaAct();
    public List<TipoDeber> listarTipoDeberAct();
    public List<Turno> listarTurnoAct();
    public List<Deber> listarDeberAct();
    
    /* MANTENIMIENTO -- LISTAS */
    public List<TipoDocumento> listarTipoDocumento();
    public List<Persona> listarPersona();
    public List<TipoPersona> listarTipoPersona();
    public List<Objeto> listarObjeto();
    public List<TipoIncidencia> listarTipoIncidencia();
    public List<TipoPermiso> listarSalida();
    public List<Motivo> listarMotivos();
    public List<TipoDeber> listarTipoDeber();
    public List<Deber> listarDeberes();
    public List<Turno> listarTurnos();
    public List<Marca> listarMarcas();
    public List<TipoVehiculo> listarTipoVehiculo();
    public List<Vehiculo> listarVehiculo();
    public List<Area> listarArea();
     
    /* MANTENIMIENTO -- BUSCAR */
    public List<Usuario> listarUsuraioAuto(String var);
    
    /* MANTENIMIENTO -- ELIMINAR */
    public boolean EliminarPersona(String id);
    public boolean EliminarTipoPersona(String id);
    public boolean EliminarObjeto(String id);
    public boolean EliminarArea(String id);
    public boolean EliminarVehiculo(String id);
    public boolean EliminarTipoVehiculo(String id);
    public boolean EliminarMarca(String id);
    public boolean EliminarTurno(String id);
    public boolean EliminarDeber(String id);
    public boolean EliminarTipoDeber(String id);
    public boolean EliminarMotivo(String id);
    public boolean EliminarTipoSalida(String id);
    public boolean EliminarTipoIncidencia(String id);
    public boolean EliminarTipoDocumento(String id);
    
    /* MANTENIMIENTO -- ACTIVAR */
    public boolean ActivarPersona(String id);
    public boolean ActivarTipoPersona(String id);
    public boolean ActivarObjeto(String id);
    public boolean ActivarArea(String id);
    public boolean ActivarVehiculo(String id);
    public boolean ActivarTipoVehiculo(String id);
    public boolean ActivarMarca(String id);
    public boolean ActivarTurno(String id);
    public boolean ActivarDeber(String id);
    public boolean ActivarTipoDeber(String id);
    public boolean ActivarMotivo(String id);
    public boolean ActivarTipoSalida(String id);
    public boolean ActivarTipoIncidencia(String id);
    public boolean ActivarTipoDocumento(String id);
    
}
