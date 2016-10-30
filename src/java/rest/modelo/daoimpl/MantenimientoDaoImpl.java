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
public class MantenimientoDaoImpl implements MantenimientoDao {

    /* MANTENIMIENTO -- AGREGAR  */
    @Override
    public boolean AgregarPersona(Persona persona) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO persona VALUES (null, '" + persona.getNombres() + "', '" + persona.getApellidos() + "', '" + persona.getDireccion() + "', '" + persona.getProcedencia() + "', " + persona.getTipoducumentoid() + ", " + persona.getNumdocumento() + ", '" + persona.getTelefono() + "', '" + persona.getGenero() + "', '" + persona.getImg() + "', 1)";
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
        String COMANDO = "INSERT INTO tipo_persona VALUES (null, '"+ tipoPersona.getNombreTipoPersona() +"', 1)";
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
    public boolean AgregarUsuario(Usuario usuario) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO usuario VALUES (null, "+ usuario.getPersonaid() +", "+ usuario.getTipopersonaid() +", "+ usuario.getAreaid() +", "+ usuario.getPerfilid() +", '"+ usuario.getUsuario() +"', '"+ usuario.getContrasena() +"', '"+ usuario.getCodigo() +"', '"+ usuario.getHabitacion() +"', '"+ usuario.getCulto() +"', 1)";
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
        String COMANDO = "INSERT INTO objeto VALUES (null, '"+ objeto.getNombreobjeto() +"', '"+ objeto.getDescripcion() +"', 1)";
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
    public boolean AgregarOpciones(Opcion opcion) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO opciones VALUES (null, "+ opcion.getSubopcionesid() +", '"+ opcion.getMenu() +"', '"+ opcion.getTipo() +"', '"+ opcion.getUrl() +"', 1)";
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
    public boolean AgregarPerfil(Perfiles perfiles) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO perfil VALUES (null, '"+ perfiles.getNombreperfil() +"', 1)";
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
        String COMANDO = "INSERT INTO area VALUES (null, "+ area.getSubareaid() +", '"+ area.getNombre() +"', '"+ area.getDescripcion() +"', 1)";
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
        String COMANDO = "INSERT INTO vehiculo VALUES (null, "+ vehiculo.getTipovehiculoid() +", "+ vehiculo.getMarcaid() +", '"+ vehiculo.getNumplaca() +"', '"+ vehiculo.getDecripcion() +"', 1)";
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
        String COMANDO = "INSERT INTO tipo_vehiculo VALUES (null, '"+ tipoVehiculo.getNombretipovehiculo() +"', 1)";
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
        String COMANDO = "INSERT INTO marca VALUES (null, '"+ marca.getNombremarca() +"', 1)";
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
        String COMANDO = "INSERT INTO turno VALUES (null, '"+ turno.getNombreturno() +"', '"+ turno.getHorainicio() +"', '"+ turno.getHorafin() +"', 1)";
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
        String COMANDO = "INSERT INTO deber VALUES (null, '"+ deber.getNombredeber() +"', "+ deber.getTipodeberid() +", 1)";
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
        String COMANDO = "INSERT INTO tipo_deber VALUES (null, '"+ tipoDeber.getNombretipodeber() +"', 1)";
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
    public boolean AgregarResponsabilidad(Responsabilidad responsabilidad) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO deber_usuario VALUES (null, "+ responsabilidad.getDeberid() +", "+ responsabilidad.getUsuarioid() +", "+ responsabilidad.getTurnoid() +", "+ responsabilidad.getUsuarioidreg() +")";
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
        String COMANDO = "INSERT INTO motivo VALUES (null, '"+ motivo.getNombremotivo() +"', 1)";
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
        String COMANDO = "INSERT INTO tipo_permiso VALUES (null, '"+ tipoPermiso.getNombretipopermiso() +"', '"+ tipoPermiso.getDescripcion() +"', 1)";
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
        String COMANDO = "INSERT INTO tipo_incidencia VALUES (null, '"+ tipoIncidencia.getNombretipoincidencia() +"', '"+ tipoIncidencia.getDescripcion() +"', 1)";
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
        String COMANDO = "INSERT INTO tipo_documento VALUES (null, '"+ tipoDocumento.getNombredocumento() +"', 1)";
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

    
    /* MANTENIMIENTO -- LISTAS */
    @Override
    public List<Persona> listarPersona() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Persona> listaPer = new ArrayList<>();
        String query = "SELECT per.persona_id as id, per.nombre, per.apellidos, per.direccion, per.procedencia, per.tipo_documento_id as idtipo, tp.nombre_documento as nombdoc, per.ndocumento, per.telefono, per.genero, CASE per.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM persona as per, tipo_documento as tp WHERE per.tipo_documento_id=tp.tipo_documento_id";
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
    public List<TipoPersona> listarTipoPersona() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<TipoPersona> listaTipoPer = new ArrayList<>();
        String query = "SELECT tipo_persona_id as id, nombre_tipo_persona as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM tipo_persona";
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
    public List<Usuario> listarUsuario() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Usuario> listaUser = new ArrayList<>();
        String query = "SELECT us.usuario_id as idusuario, us.persona_id as personaid, concat(per.nombre, ' ', per.apellidos) as nombres, us.tipo_persona_id as tipoperid, tper.nombre_tipo_persona as nombretipopersona, us.area_id as areaid, ar.nombre as nombrearea, us.perfil_id as idperfil, perf.nombre_perfil as nombreperfil, us.usuario, us.contrasena, us.codigo, us.numhabitacion as habitacion, us.numculto as culto, CASE us.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM usuario as us, persona as per, tipo_persona as tper, area as ar, perfil \n"
                + "as perf WHERE us.persona_id=per.persona_id AND us.area_id=ar.area_id AND us.perfil_id=perf.perfil_id AND us.tipo_persona_id=tper.tipo_persona_id ORDER BY us.usuario_id";
        cx.execQuery(query);
        while (cx.getNext()) {
            Usuario usuario = new Usuario();
            usuario.setUsuarioid(cx.getCol("idusuario"));
            usuario.setPersonaid(cx.getCol("personaid"));
            usuario.setNombres(cx.getCol("nombres"));
            usuario.setTipopersonaid(cx.getCol("tipoperid"));
            usuario.setNombretipoper(cx.getCol("nombretipopersona"));
            usuario.setAreaid(cx.getCol("areaid"));
            usuario.setNombrearea(cx.getCol("nombrearea"));
            usuario.setPerfilid(cx.getCol("idperfil"));
            usuario.setNombreperfil(cx.getCol("nombreperfil"));
            usuario.setUsuario(cx.getCol("usuario"));
            usuario.setContrasena(cx.getCol("contrasena"));
            usuario.setCodigo(cx.getCol("codigo"));
            usuario.setHabitacion(cx.getCol("habitacion"));
            usuario.setCulto(cx.getCol("culto"));
            usuario.setEstado(cx.getCol("estado"));
            listaUser.add(usuario);
        }
        return listaUser;
    }

    @Override
    public List<Objeto> listarObjeto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Opcion> listarMenus() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    /* MANTENIMIENTO -- EXTRAS */
    @Override
    public boolean RestablecerPassword(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE usuario SET contrasena='1234567890' WHERE usuario_id='"+ id +"'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        }
        catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }
    
    
    /* MANTENIMIENTO -- ELIMINAR */
    @Override
    public boolean EliminarPersona(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE persona SET estado=0 WHERE persona_id='"+ id +"'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        }
        catch (Exception EX) {
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
        String COMANDO = "UPDATE tipo_persona SET estado=0 WHERE tipo_persona_id='"+ id +"'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        }
        catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }
    
    @Override
    public boolean EliminarUsuario(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE usuario SET estado=0 WHERE usuario_id='"+ id +"'";
        try {
            cx.execC(COMANDO);
            cx.Commit();
            cx.Close(1, 1, 1);
            return true;
        }
        catch (Exception EX) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            System.out.println(EX.getMessage() + ":Tipo **** Error: " + EX.getLocalizedMessage());
            System.out.println(COMANDO);
            return false;
        }
    }
}
