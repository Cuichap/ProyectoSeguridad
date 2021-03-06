/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.daoimpl;

import java.util.ArrayList;
import java.util.List;
import rest.modelo.conexion.Conexion;
import rest.modelo.conexion.Configuracion;
import rest.modelo.dao.MantenimientoDao;
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
public class MantenimientoDaoImpl implements MantenimientoDao {

    /* MANTENIMIENTO -- AGREGAR  */
    @Override
    public boolean AgregarPersona(Persona persona) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO persona VALUES (null, '" + persona.getNombres() + "', '" + persona.getApellidos() + "', '" + persona.getDireccion() + "', '" + persona.getProcedencia() + "', " + persona.getTipoducumentoid() + ", " + persona.getNumdocumento() + ", '" + persona.getTelefono() + "', '" + persona.getGenero() + "', '" + persona.getImg() + "', 1, '" + persona.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTipoPersona(TipoPersona tipoPersona) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO tipo_persona VALUES (null, '" + tipoPersona.getNombreTipoPersona() + "', 1, '" + tipoPersona.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarObjeto(Objeto objeto) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO objeto VALUES (null, '" + objeto.getNombreobjeto() + "', '" + objeto.getDescripcion() + "', 1, '" + objeto.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarArea(Area area) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO area VALUES (null, " + area.getSubareaid() + ", '" + area.getNombre() + "', '" + area.getDescripcion() + "', 1, '" + area.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarVehiculo(Vehiculo vehiculo) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO vehiculo VALUES (null, " + vehiculo.getTipovehiculoid() + ", " + vehiculo.getMarcaid() + ", '" + vehiculo.getNumplaca() + "', '" + vehiculo.getDecripcion() + "', 1, '" + vehiculo.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTipoVehiculo(TipoVehiculo tipoVehiculo) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO tipo_vehiculo VALUES (null, '" + tipoVehiculo.getNombretipovehiculo() + "', 1, '" + tipoVehiculo.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarMarca(Marca marca) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO marca VALUES (null, '" + marca.getNombremarca() + "', 1, '" + marca.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTurno(Turno turno) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO turno VALUES (null, '" + turno.getNombreturno() + "', '" + turno.getHorainicio() + "', '" + turno.getHorafin() + "', 1, '" + turno.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarDeber(Deber deber) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO deber VALUES (null, '" + deber.getNombredeber() + "', " + deber.getTipodeberid() + ", 1, '" + deber.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTipoDeber(TipoDeber tipoDeber) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO tipo_deber VALUES (null, '" + tipoDeber.getNombretipodeber() + "', 1, '" + tipoDeber.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarMotivo(Motivo motivo) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO motivo VALUES (null, '" + motivo.getNombremotivo() + "', 1, '" + motivo.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTipoSalida(TipoPermiso tipoPermiso) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO tipo_permiso VALUES (null, '" + tipoPermiso.getNombretipopermiso() + "', '" + tipoPermiso.getDescripcion() + "', 1, '" + tipoPermiso.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTipoIncidencia(TipoIncidencia tipoIncidencia) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO tipo_incidencia VALUES (null, '" + tipoIncidencia.getNombretipoincidencia() + "', '" + tipoIncidencia.getDescripcion() + "', 1, '" + tipoIncidencia.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean AgregarTipoDocumento(TipoDocumento tipoDocumento) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO tipo_documento VALUES (null, '" + tipoDocumento.getNombredocumento() + "', 1, '" + tipoDocumento.getUserIdReg() + "')";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    /* MANTENIMIENTO -- EDITAR */
    @Override
    public boolean EditarPersona(Persona persona, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE persona SET nombre='" + persona.getNombres() + "', apellidos='" + persona.getApellidos() + "', direccion='" + persona.getDireccion() + "', procedencia='" + persona.getProcedencia() + "', tipo_documento_id='" + persona.getTipoducumentoid() + "', ndocumento='" + persona.getNumdocumento() + "', telefono='" + persona.getTelefono() + "', genero='" + persona.getGenero() + "', estado='1', usuario_id_reg='" + persona.getUserIdReg() + "' WHERE Persona_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTipoPersona(TipoPersona tipoPersona, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_persona SET nombre_tipo_persona='" + tipoPersona.getNombreTipoPersona() + "', estado='1', usuario_id_reg='" + tipoPersona.getUserIdReg() + "' WHERE tipo_persona_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarObjeto(Objeto objeto, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE objeto SET nombre='" + objeto.getNombreobjeto() + "', descripcion='" + objeto.getDescripcion() + "', usuario_id_reg='" + objeto.getUserIdReg() + "' WHERE objeto_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarArea(Area area, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE area SET subarea_id=" + area.getSubareaid() + ", nombre='" + area.getNombre() + "', descripcion='" + area.getDescripcion() + "', estado='1', usuario_id_reg=" + area.getUserIdReg() + " WHERE area_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarVehiculo(Vehiculo vehiculo, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE vehiculo SET tipo_vehiculo_id='" + vehiculo.getTipovehiculoid() + "', marca_id='" + vehiculo.getMarcaid() + "', numplaca='" + vehiculo.getNumplaca() + "', descripcion='" + vehiculo.getDecripcion() + "', usuario_id_reg='" + vehiculo.getUserIdReg() + "' WHERE vehiculo_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTipoVehiculo(TipoVehiculo tipoVehiculo, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_vehiculo SET nombre_tipo_vehiculo='" + tipoVehiculo.getNombretipovehiculo() + "', usuario_id_reg='" + tipoVehiculo.getUserIdReg() + "' WHERE tipo_vehiculo_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarMarca(Marca marca, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE marca SET nombre_marca='" + marca.getNombremarca() + "', usuario_id_reg='" + marca.getUserIdReg() + "' WHERE marca_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTurno(Turno turno, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE turno SET nombre_turno='" + turno.getNombreturno() + "', horainicio='" + turno.getHorainicio() + "', horafin='" + turno.getHorafin() + "', usuario_id_reg='" + turno.getUserIdReg() + "' WHERE turno_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarDeber(Deber deber, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE deber SET nombre_deber='" + deber.getNombredeber() + "', tipo_deber_id='" + deber.getTipodeberid() + "', usuario_id_reg='" + deber.getUserIdReg() + "' WHERE deber_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTipoDeber(TipoDeber tipoDeber, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_deber SET nombre_tipo_deber='" + tipoDeber.getNombretipodeber() + "', usuario_id_reg='" + tipoDeber.getUserIdReg() + "' WHERE tipo_deber_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarMotivo(Motivo motivo, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE motivo SET nombre_motivo='" + motivo.getNombremotivo() + "', usuario_id_reg='" + motivo.getUserIdReg() + "' WHERE motivo_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTipoSalida(TipoPermiso tipoPermiso, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_permiso SET nombre_tipo_permiso='" + tipoPermiso.getNombretipopermiso() + "', descripcion='" + tipoPermiso.getDescripcion() + "', usuario_id_reg='" + tipoPermiso.getUserIdReg() + "' WHERE tipo_permiso_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTipoIncidencia(TipoIncidencia tipoIncidencia, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_incidencia SET nombre_tipo_incidencia='" + tipoIncidencia.getNombretipoincidencia() + "', descripcion='" + tipoIncidencia.getDescripcion() + "', usuario_id_reg='" + tipoIncidencia.getUserIdReg() + "' WHERE tipo_incidencia_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EditarTipoDocumento(TipoDocumento tipoDocumento, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_documento SET nombre_documento='" + tipoDocumento.getNombredocumento() + "', usuario_id_reg='" + tipoDocumento.getUserIdReg() + "' WHERE tipo_documento_id='" + id + "' ";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    /* MANTENIMIENTO -- LISTAS -- ID */
    @Override
    public List<Persona> listarEditPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Persona> listaPer = new ArrayList<>();
        String query = "SELECT per.nombre, per.apellidos, per.direccion, per.procedencia, tip.tipo_documento_id as idtipo, tip.nombre_documento, per.ndocumento, per.telefono, per.genero FROM persona as per, tipo_documento as tip WHERE tip.tipo_documento_id=per.tipo_documento_id AND persona_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Persona persona = new Persona();
            persona.setNombres(cx.getCol("nombre"));
            persona.setApellidos(cx.getCol("apellidos"));
            persona.setDireccion(cx.getCol("direccion"));
            persona.setProcedencia(cx.getCol("procedencia"));
            persona.setTipoducumentoid(cx.getCol("idtipo"));
            persona.setNombredoc(cx.getCol("nombre_documento"));
            persona.setNumdocumento(cx.getCol("ndocumento"));
            persona.setTelefono(cx.getCol("telefono"));
            persona.setGenero(cx.getCol("genero"));
            listaPer.add(persona);
        }
        return listaPer;
    }

    @Override
    public List<TipoPersona> listarEditTipoPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPersona> listaTipoPer = new ArrayList<>();
        String query = "SELECT nombre_tipo_persona as nombre FROM tipo_persona WHERE tipo_persona_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoPersona tipoPersona = new TipoPersona();
            tipoPersona.setNombreTipoPersona(cx.getCol("nombre"));
            listaTipoPer.add(tipoPersona);
        }
        return listaTipoPer;
    }

    @Override
    public List<Objeto> listarEditObjeto(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Objeto> listaObjeto = new ArrayList<>();
        String query = "SELECT nombre, descripcion FROM objeto WHERE objeto_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Objeto objeto = new Objeto();
            objeto.setNombreobjeto(cx.getCol("nombre"));
            objeto.setDescripcion(cx.getCol("descripcion"));
            listaObjeto.add(objeto);
        }
        return listaObjeto;
    }

    @Override
    public List<Area> listarEditArea(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Area> listaArea = new ArrayList<>();
        String query = "SELECT subarea_id as idsub, nombre, tipo, descripcion FROM area WHERE area_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Area area = new Area();
            area.setSubareaid(cx.getCol("idsub"));
            area.setNombre(cx.getCol("nombre"));
            area.setTipo(cx.getCol("tipo"));
            area.setDescripcion(cx.getCol("descripcion"));
            listaArea.add(area);
        }
        return listaArea;
    }

    @Override
    public List<Vehiculo> listarEditVehiculo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Vehiculo> listaVehiculo = new ArrayList<>();
        String query = "SELECT tipo_vehiculo_id as idtipo, marca_id as idmarca, numplaca as placa, descripcion as descripcion FROM vehiculo WHERE vehiculo_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Vehiculo vehiculo = new Vehiculo();
            vehiculo.setTipovehiculoid(cx.getCol("idtipo"));
            vehiculo.setMarcaid(cx.getCol("idmarca"));
            vehiculo.setNumplaca(cx.getCol("placa"));
            vehiculo.setDecripcion(cx.getCol("descripcion"));
            listaVehiculo.add(vehiculo);
        }
        return listaVehiculo;
    }

    @Override
    public List<TipoVehiculo> listarEditTipoVehiculo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoVehiculo> listaTipoVeh = new ArrayList<>();
        String query = "SELECT nombre_tipo_vehiculo as nombre FROM tipo_vehiculo WHERE tipo_vehiculo_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoVehiculo tpvehiculo = new TipoVehiculo();
            tpvehiculo.setNombretipovehiculo(cx.getCol("nombre"));
            listaTipoVeh.add(tpvehiculo);
        }
        return listaTipoVeh;
    }

    @Override
    public List<Marca> listarEditMarcas(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Marca> listaMarca = new ArrayList<>();
        String query = "SELECT  nombre_marca as nombre FROM marca WHERE marca_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Marca marca = new Marca();
            marca.setNombremarca(cx.getCol("nombre"));
            listaMarca.add(marca);
        }
        return listaMarca;
    }

    @Override
    public List<Turno> listarEditTurnos(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Turno> listaTurno = new ArrayList<>();
        String query = "SELECT nombre_turno as nombre, horainicio as inicio, horafin as fin FROM turno WHERE turno_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Turno turno = new Turno();
            turno.setNombreturno(cx.getCol("nombre"));
            turno.setHorainicio(cx.getCol("inicio"));
            turno.setHorafin(cx.getCol("fin"));
            listaTurno.add(turno);
        }
        return listaTurno;
    }

    @Override
    public List<Deber> listarEditDeberes(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Deber> listaDeber = new ArrayList<>();
        String query = "SELECT nombre_deber as nombre, tipo_deber_id as tipoid FROM deber WHERE deber_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Deber deb = new Deber();
            deb.setNombredeber(cx.getCol("nombre"));
            deb.setTipodeberid(cx.getCol("tipoid"));
            listaDeber.add(deb);
        }
        return listaDeber;
    }

    @Override
    public List<TipoDeber> listarEditTipoDeber(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoDeber> listarTipoDeber = new ArrayList<>();
        String query = "SELECT nombre_tipo_deber as nombre FROM tipo_deber WHERE tipo_deber_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoDeber tipodeb = new TipoDeber();
            tipodeb.setNombretipodeber(cx.getCol("nombre"));
            listarTipoDeber.add(tipodeb);
        }
        return listarTipoDeber;
    }

    @Override
    public List<Motivo> listarEditMotivos(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Motivo> listaMotivo = new ArrayList<>();
        String query = "SELECT nombre_motivo as nombre FROM motivo WHERE motivo_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Motivo motivo = new Motivo();
            motivo.setNombremotivo(cx.getCol("nombre"));
            listaMotivo.add(motivo);
        }
        return listaMotivo;
    }

    @Override
    public List<TipoPermiso> listarEditSalida(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPermiso> listaPermiso = new ArrayList<>();
        String query = "SELECT nombre_tipo_permiso as nombre, descripcion FROM tipo_permiso WHERE tipo_permiso_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoPermiso tipopermiso = new TipoPermiso();
            tipopermiso.setNombretipopermiso(cx.getCol("nombre"));
            tipopermiso.setDescripcion(cx.getCol("descripcion"));
            listaPermiso.add(tipopermiso);
        }
        return listaPermiso;
    }

    @Override
    public List<TipoIncidencia> listarEditTipoIncidencia(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoIncidencia> listaTipoIncidencia = new ArrayList<>();
        String query = "SELECT nombre_tipo_incidencia as nombre, descripcion FROM tipo_incidencia WHERE tipo_incidencia_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoIncidencia tipoincidencia = new TipoIncidencia();
            tipoincidencia.setNombretipoincidencia(cx.getCol("nombre"));
            tipoincidencia.setDescripcion(cx.getCol("descripcion"));
            listaTipoIncidencia.add(tipoincidencia);
        }
        return listaTipoIncidencia;
    }

    @Override
    public List<TipoDocumento> listarEditTipoDocumento(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoDocumento> listaTipoDoc = new ArrayList<>();
        String query = "SELECT nombre_documento as nombre FROM tipo_documento WHERE tipo_documento_id='" + id + "'";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoDocumento tipoDocumento = new TipoDocumento();
            tipoDocumento.setNombredocumento(cx.getCol("nombre"));
            listaTipoDoc.add(tipoDocumento);
        }
        return listaTipoDoc;
    }

    /* MANTENIMIENTO -- LISTAS -- ACTIVAS */
    @Override
    public List<TipoDocumento> listarTipoDocumentoAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoDocumento> listaTipoDoc = new ArrayList<>();
        String query = "SELECT tipo_documento_id as id, nombre_documento as nombre FROM tipo_documento WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoDocumento tipoDocumento = new TipoDocumento();
            tipoDocumento.setTipodocumentoid(cx.getCol("id"));
            tipoDocumento.setNombredocumento(cx.getCol("nombre"));
            listaTipoDoc.add(tipoDocumento);
        }
        return listaTipoDoc;
    }

    @Override
    public List<Area> listarAreasAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Area> listaAreasAct = new ArrayList<>();
        String query = "SELECT area_id as id, nombre, descripcion FROM area WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Area area = new Area();
            area.setAreaid(cx.getCol("id"));
            area.setNombre(cx.getCol("nombre"));
            area.setDescripcion(cx.getCol("descripcion"));
            listaAreasAct.add(area);
        }
        return listaAreasAct;
    }

    @Override
    public List<Perfiles> listarPerfilesAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Perfiles> listaPerfilesAct = new ArrayList<>();
        String query = "SELECT perfil_id as id, nombre_perfil as nombre FROM perfil WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Perfiles perfiles = new Perfiles();
            perfiles.setPerfilid(cx.getCol("id"));
            perfiles.setNombreperfil(cx.getCol("nombre"));
            listaPerfilesAct.add(perfiles);
        }
        return listaPerfilesAct;
    }

    @Override
    public List<TipoPersona> listarTipoPersonaAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPersona> listaTipoPersonaAct = new ArrayList<>();
        String query = "SELECT tipo_persona_id as id, nombre_tipo_persona as nombre FROM tipo_persona WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoPersona tipoPer = new TipoPersona();
            tipoPer.setTipoPersonaid(cx.getCol("id"));
            tipoPer.setNombreTipoPersona(cx.getCol("nombre"));
            listaTipoPersonaAct.add(tipoPer);
        }
        return listaTipoPersonaAct;
    }

    @Override
    public List<Opcion> listarOpcionesAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Opcion> listaOpcionesAct = new ArrayList<>();
        String query = "SELECT opciones_id as id, menu as nombre FROM opciones WHERE tipo='nivel1' AND estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Opcion opcion = new Opcion();
            opcion.setOpcionesid(cx.getCol("id"));
            opcion.setMenu(cx.getCol("nombre"));
            listaOpcionesAct.add(opcion);
        }
        return listaOpcionesAct;
    }

    @Override
    public List<TipoVehiculo> listarTipoVehiculoAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoVehiculo> listaTipoVehiculoAct = new ArrayList<>();
        String query = "SELECT tipo_vehiculo_id as id, nombre_tipo_vehiculo as nombre FROM tipo_vehiculo WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoVehiculo tipoVehiculo = new TipoVehiculo();
            tipoVehiculo.setTipovehiculoid(cx.getCol("id"));
            tipoVehiculo.setNombretipovehiculo(cx.getCol("nombre"));
            listaTipoVehiculoAct.add(tipoVehiculo);
        }
        return listaTipoVehiculoAct;
    }

    @Override
    public List<Marca> listarMarcaAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Marca> listaMarcaAct = new ArrayList<>();
        String query = "SELECT marca_id as id, nombre_marca as nombre FROM marca WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Marca marca = new Marca();
            marca.setMarcaid(cx.getCol("id"));
            marca.setNombremarca(cx.getCol("nombre"));
            listaMarcaAct.add(marca);
        }
        return listaMarcaAct;
    }

    @Override
    public List<TipoDeber> listarTipoDeberAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoDeber> listaTipoDeberAct = new ArrayList<>();
        String query = "SELECT tipo_deber_id as id, nombre_tipo_deber as nombre FROM tipo_deber WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoDeber tipoDeber = new TipoDeber();
            tipoDeber.setTipodeberid(cx.getCol("id"));
            tipoDeber.setNombretipodeber(cx.getCol("nombre"));
            listaTipoDeberAct.add(tipoDeber);
        }
        return listaTipoDeberAct;
    }

    @Override
    public List<Turno> listarTurnoAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Turno> listaTurnoAct = new ArrayList<>();
        String query = "SELECT turno_id as id, nombre_turno as nombre FROM turno WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Turno turno = new Turno();
            turno.setTurnoid(cx.getCol("id"));
            turno.setNombreturno(cx.getCol("nombre"));
            listaTurnoAct.add(turno);
        }
        return listaTurnoAct;
    }

    @Override
    public List<Deber> listarDeberAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Deber> listaDeberAct = new ArrayList<>();
        String query = "SELECT deber_id as id, nombre_deber as nombre FROM deber WHERE estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Deber deber = new Deber();
            deber.setDeberid(cx.getCol("id"));
            deber.setNombredeber(cx.getCol("nombre"));
            listaDeberAct.add(deber);
        }
        return listaDeberAct;
    }

    @Override
    public List<Motivo> listarMotivoAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Motivo> listaMotivoAct = new ArrayList<>();
        String query = "select motivo_id as id, nombre_motivo as nombre from motivo where estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            Motivo motivo = new Motivo();
            motivo.setMotivoid(cx.getCol("id"));
            motivo.setNombremotivo(cx.getCol("nombre"));
            listaMotivoAct.add(motivo);
        }
        return listaMotivoAct;
    }

    @Override
    public List<TipoPermiso> listarTiipoPermisoAct() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPermiso> listaTipoPermisoAct = new ArrayList<>();
        String query = "select tipo_permiso_id as id, nombre_tipo_permiso as nombre from tipo_permiso where estado=1";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoPermiso tp = new TipoPermiso();
            tp.setTipopermisoid(cx.getCol("id"));
            tp.setNombretipopermiso(cx.getCol("nombre"));
            listaTipoPermisoAct.add(tp);
        }
        return listaTipoPermisoAct;
    }

    /* MANTENIMIENTO -- LISTAS */
    @Override
    public List<Persona> listarPersona(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Persona> listaPer = new ArrayList<>();
        String query = "SELECT per.persona_id as id, per.nombre, per.apellidos, per.direccion, per.procedencia, per.tipo_documento_id as idtipo, tp.nombre_documento as nombdoc, per.ndocumento, per.telefono, per.genero, CASE per.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM persona as per, tipo_documento as tp WHERE per.tipo_documento_id=tp.tipo_documento_id AND per.estado="+estado+" ORDER BY per.persona_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Persona persona = new Persona();
            persona.setPersonaid(cx.getCol("id"));
            persona.setNombres(cx.getCol("nombre"));
            persona.setApellidos(cx.getCol("apellidos"));
            persona.setDireccion(cx.getCol("direccion"));
            persona.setProcedencia(cx.getCol("procedencia"));
            persona.setTipoducumentoid(cx.getCol("idtipo"));
            persona.setNombredoc(cx.getCol("nombdoc"));
            persona.setNumdocumento(cx.getCol("ndocumento"));
            persona.setTelefono(cx.getCol("telefono"));
            persona.setGenero(cx.getCol("genero"));
            persona.setEstado(cx.getCol("estado"));
            listaPer.add(persona);
        }
        return listaPer;
    }

    @Override
    public List<TipoPersona> listarTipoPersona(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPersona> listaTipoPer = new ArrayList<>();
        String query = "SELECT tipo_persona_id as id, nombre_tipo_persona as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_persona WHERE estado="+estado+" ORDER BY tipo_persona_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoPersona tipoPersona = new TipoPersona();
            tipoPersona.setTipoPersonaid(cx.getCol("id"));
            tipoPersona.setNombreTipoPersona(cx.getCol("nombre"));
            tipoPersona.setEstado(cx.getCol("estado"));
            listaTipoPer.add(tipoPersona);
        }
        return listaTipoPer;
    }

    @Override
    public List<Objeto> listarObjeto(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Objeto> listaObjeto = new ArrayList<>();
        String query = "SELECT objeto_id as id, nombre, descripcion, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END  as estado FROM objeto WHERE estado="+estado+" ORDER BY objeto_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Objeto objeto = new Objeto();
            objeto.setObjetoid(cx.getCol("id"));
            objeto.setNombreobjeto(cx.getCol("nombre"));
            objeto.setDescripcion(cx.getCol("descripcion"));
            objeto.setEstado(cx.getCol("estado"));
            listaObjeto.add(objeto);
        }
        return listaObjeto;
    }

    @Override
    public List<TipoDocumento> listarTipoDocumento(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoDocumento> listaTipoDoc = new ArrayList<>();
        String query = "SELECT tipo_documento_id as id, nombre_documento as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_documento WHERE estado="+estado+" ORDER BY tipo_documento_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoDocumento tipoDocumento = new TipoDocumento();
            tipoDocumento.setTipodocumentoid(cx.getCol("id"));
            tipoDocumento.setNombredocumento(cx.getCol("nombre"));
            tipoDocumento.setEstado(cx.getCol("estado"));
            listaTipoDoc.add(tipoDocumento);
        }
        return listaTipoDoc;
    }

    @Override
    public List<TipoIncidencia> listarTipoIncidencia(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoIncidencia> listaTipoIncidencia = new ArrayList<>();
        String query = "SELECT tipo_incidencia_id as id, nombre_tipo_incidencia as nombre, descripcion, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_incidencia WHERE estado="+estado+" ORDER BY tipo_incidencia_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoIncidencia tipoincidencia = new TipoIncidencia();
            tipoincidencia.setTipoincidenciaid(cx.getCol("id"));
            tipoincidencia.setNombretipoincidencia(cx.getCol("nombre"));
            tipoincidencia.setDescripcion(cx.getCol("descripcion"));
            tipoincidencia.setEstado(cx.getCol("estado"));
            listaTipoIncidencia.add(tipoincidencia);
        }
        return listaTipoIncidencia;
    }

    @Override
    public List<TipoPermiso> listarSalida(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPermiso> listaPermiso = new ArrayList<>();
        String query = "SELECT tipo_permiso_id as id, nombre_tipo_permiso as nombre, descripcion, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_permiso WHERE estado="+estado+" ORDER BY tipo_permiso_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoPermiso tipopermiso = new TipoPermiso();
            tipopermiso.setTipopermisoid(cx.getCol("id"));
            tipopermiso.setNombretipopermiso(cx.getCol("nombre"));
            tipopermiso.setDescripcion(cx.getCol("descripcion"));
            tipopermiso.setEstado(cx.getCol("estado"));
            listaPermiso.add(tipopermiso);
        }
        return listaPermiso;
    }

    @Override
    public List<Motivo> listarMotivos(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Motivo> listaMotivo = new ArrayList<>();
        String query = "SELECT motivo_id as id, nombre_motivo as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM motivo WHERE estado="+estado+" ORDER BY motivo_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Motivo motivo = new Motivo();
            motivo.setMotivoid(cx.getCol("id"));
            motivo.setNombremotivo(cx.getCol("nombre"));
            motivo.setEstado(cx.getCol("estado"));
            listaMotivo.add(motivo);
        }
        return listaMotivo;
    }

    @Override
    public List<TipoDeber> listarTipoDeber(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoDeber> listarTipoDeber = new ArrayList<>();
        String query = "SELECT tipo_deber_id as id, nombre_tipo_deber as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_deber WHERE estado="+estado+" ORDER BY tipo_deber_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoDeber tipodeb = new TipoDeber();
            tipodeb.setTipodeberid(cx.getCol("id"));
            tipodeb.setNombretipodeber(cx.getCol("nombre"));
            tipodeb.setEstado(cx.getCol("estado"));
            listarTipoDeber.add(tipodeb);
        }
        return listarTipoDeber;
    }

    @Override
    public List<Deber> listarDeberes(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Deber> listaDeber = new ArrayList<>();
        String query = "SELECT d.deber_id as id, d.nombre_deber as nombre, td.tipo_deber_id as tipoid, td.nombre_tipo_deber as tipo, CASE d.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM deber as d, tipo_deber as td WHERE td.tipo_deber_id=d.tipo_deber_id AND d.estado="+estado+" ORDER BY d.deber_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Deber deb = new Deber();
            deb.setDeberid(cx.getCol("id"));
            deb.setNombredeber(cx.getCol("nombre"));
            deb.setTipodeberid(cx.getCol("tipoid"));
            deb.setNombretipodeber(cx.getCol("tipo"));
            deb.setEstado(cx.getCol("estado"));
            listaDeber.add(deb);
        }
        return listaDeber;
    }

    @Override
    public List<Turno> listarTurnos(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Turno> listaTurno = new ArrayList<>();
        String query = "SELECT turno_id as id, nombre_turno as nombre, horainicio as inicio, horafin as fin, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM turno WHERE estado="+estado+" ORDER BY turno_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Turno turno = new Turno();
            turno.setTurnoid(cx.getCol("id"));
            turno.setNombreturno(cx.getCol("nombre"));
            turno.setHorainicio(cx.getCol("inicio"));
            turno.setHorafin(cx.getCol("fin"));
            turno.setEstado(cx.getCol("estado"));
            listaTurno.add(turno);
        }
        return listaTurno;
    }

    @Override
    public List<Marca> listarMarcas(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Marca> listaMarca = new ArrayList<>();
        String query = "SELECT marca_id as id, nombre_marca as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM marca WHERE estado="+estado+" ORDER BY marca_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Marca marca = new Marca();
            marca.setMarcaid(cx.getCol("id"));
            marca.setNombremarca(cx.getCol("nombre"));
            marca.setEstado(cx.getCol("estado"));
            listaMarca.add(marca);
        }
        return listaMarca;
    }

    @Override
    public List<TipoVehiculo> listarTipoVehiculo(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoVehiculo> listaTipoVeh = new ArrayList<>();
        String query = "SELECT tipo_vehiculo_id as id, nombre_tipo_vehiculo as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_vehiculo WHERE estado="+estado+" ORDER BY tipo_vehiculo_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            TipoVehiculo tpvehiculo = new TipoVehiculo();
            tpvehiculo.setTipovehiculoid(cx.getCol("id"));
            tpvehiculo.setNombretipovehiculo(cx.getCol("nombre"));
            tpvehiculo.setEstado(cx.getCol("estado"));
            listaTipoVeh.add(tpvehiculo);
        }
        return listaTipoVeh;
    }

    @Override
    public List<Vehiculo> listarVehiculo(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Vehiculo> listaVehiculo = new ArrayList<>();
        String query = "SELECT v.vehiculo_id as id, v.tipo_vehiculo_id as idtipo, tp.nombre_tipo_vehiculo as nombre, m.marca_id as idmarca, m.nombre_marca as nombremarca, v.numplaca as placa, v.descripcion as descripcion, CASE v.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM vehiculo as v, tipo_vehiculo as tp, marca as m WHERE m.marca_id=v.marca_id and v.tipo_vehiculo_id=tp.tipo_vehiculo_id and v.estado="+estado+" ORDER BY v.vehiculo_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Vehiculo vehiculo = new Vehiculo();
            vehiculo.setVehiculoid(cx.getCol("id"));
            vehiculo.setTipovehiculoid(cx.getCol("idtipo"));
            vehiculo.setNombre(cx.getCol("nombre"));
            vehiculo.setMarcaid(cx.getCol("idmarca"));
            vehiculo.setNombremarca(cx.getCol("nombremarca"));
            vehiculo.setNumplaca(cx.getCol("placa"));
            vehiculo.setDecripcion(cx.getCol("descripcion"));
            vehiculo.setEstado(cx.getCol("estado"));
            listaVehiculo.add(vehiculo);
        }
        return listaVehiculo;
    }

    @Override
    public List<Area> listarArea(String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Area> listaArea = new ArrayList<>();
        String query = "SELECT a.area_id as id, CASE a.nombre WHEN a.tipo='nivel2' THEN a.nombre END as area, ar.area_id as idsub, CASE ar.nombre WHEN a.tipo='nivel1' THEN a.nombre END as subarea, CASE ar.tipo WHEN 'nivel1' THEN 'Area' WHEN 'nivel2' THEN'Subarea' END as tipo, CASE ar.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END  as estado, a.tipo, a.descripcion as descripcion FROM area as a, area as ar WHERE a.area_id=ar.area_id AND ar.estado="+estado+" ORDER BY a.area_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Area area = new Area();
            area.setAreaid(cx.getCol("id"));
            area.setNombre(cx.getCol("area"));
            area.setSubareaid(cx.getCol("idsub"));
            area.setSubareanombre(cx.getCol("subarea"));
            area.setDescripcion(cx.getCol("descripcion"));
            area.setEstado(cx.getCol("estado"));
            listaArea.add(area);
        }
        return listaArea;
    }

    /* MANTENIMIENTO -- BUSCAR */
    @Override
    public List<Usuario> listarUsuario(String var) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Usuario> listaUser = new ArrayList<>();
        String query = "SELECT us.usuario_id as idusuario, us.persona_id as personaid, per.nombre, per.apellidos FROM usuario as us, persona as per, tipo_persona as tper, area as ar, perfil as perf WHERE us.persona_id=per.persona_id AND us.area_id=ar.area_id AND us.perfil_id=perf.perfil_id AND us.tipo_persona_id=tper.tipo_persona_id  and concat(per.nombre,' ',per.apellidos) like '" + var + "%' and us.estado=1 ORDER BY us.usuario_id";
//        System.out.println(query);
        cx.execQuery(query);
        while (cx.getNext()) {
//            System.out.println("ok");
            Usuario usuario = new Usuario();
            usuario.setUsuarioid(cx.getCol("idusuario"));
            usuario.setPersonaid(cx.getCol("personaid"));
            usuario.setNombre(cx.getCol("nombre"));
            usuario.setApellidos(cx.getCol("apellidos"));
            listaUser.add(usuario);
        }
        return listaUser;
    }

    /* MANTENIMIENTO -- ELIMINAR */
    @Override
    public boolean EliminarPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE persona SET estado=0 WHERE persona_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTipoPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_persona SET estado=0 WHERE tipo_persona_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarObjeto(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE objeto SET estado=0 WHERE objeto_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarArea(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE area SET estado=0 WHERE area_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarVehiculo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE vehiculo SET estado=0 WHERE vehiculo_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTipoVehiculo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_vehiculo SET estado=0 WHERE tipo_vehiculo_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarMarca(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE marca SET estado=0 WHERE marca_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTurno(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE turno SET estado=0 WHERE turno_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarDeber(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE deber SET estado=0 WHERE deber_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTipoDeber(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_deber SET estado=0 WHERE tipo_deber_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarMotivo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE motivo SET estado=0 WHERE motivo_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTipoSalida(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_permiso SET estado=0 WHERE tipo_permiso_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTipoIncidencia(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_incidencia SET estado=0 WHERE tipo_incidencia_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean EliminarTipoDocumento(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_documento SET estado=0 WHERE tipo_documento_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    /* MANTENIMIENTO -- ACTIVAR */
    @Override
    public boolean ActivarPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE persona SET estado=1 WHERE persona_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTipoPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_persona SET estado=1 WHERE tipo_persona_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarObjeto(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE objeto SET estado=1 WHERE objeto_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarArea(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE area SET estado=1 WHERE area_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarVehiculo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE vehiculo SET estado=1 WHERE vehiculo_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTipoVehiculo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_vehiculo SET estado=1 WHERE tipo_vehiculo_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarMarca(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE marca SET estado=1 WHERE marca_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTurno(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE turno SET estado=1 WHERE turno_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarDeber(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE deber SET estado=1 WHERE deber_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTipoDeber(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_deber SET estado=1 WHERE tipo_deber_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarMotivo(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE motivo SET estado=1 WHERE motivo_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTipoSalida(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_permiso SET estado=1 WHERE tipo_permiso_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTipoIncidencia(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_incidencia SET estado=1 WHERE tipo_incidencia_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

    @Override
    public boolean ActivarTipoDocumento(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE tipo_documento SET estado=1 WHERE tipo_documento_id='" + id + "'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        } catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }

}
