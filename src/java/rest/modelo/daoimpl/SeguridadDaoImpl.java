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
import rest.modelo.dao.SeguridadDao;
import rest.modelo.entidad.Acceso;
import rest.modelo.entidad.Opcion;
import rest.modelo.entidad.Perfiles;
import rest.modelo.entidad.Responsabilidad;
import rest.modelo.entidad.Usuario;

/**
 *
 * @author USUARIO
 */
public class SeguridadDaoImpl implements SeguridadDao{
    
    /* SEGURIDAD -- AGREGAR */
    @Override
    public boolean AgregarUsuario(Usuario usuario) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO usuario VALUES (null, " + usuario.getPersonaid() + ", " + usuario.getTipopersonaid() + ", " + usuario.getAreaid() + ", " + usuario.getPerfilid() + ", '" + usuario.getUsuario() + "', '" + usuario.getContrasena() + "', '" + usuario.getCodigo() + "', '" + usuario.getHabitacion() + "', '" + usuario.getCulto() + "', 1)";
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
        String COMANDO = "INSERT INTO perfil VALUES (null, '" + perfiles.getNombreperfil() + "', 1)";
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
    public boolean AgregarAccesos(Acceso acceso) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO acceso_perfil VALUES ("+ acceso.getPerfilId() +", "+ acceso.getMenuId() +", 'si')";
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
        String COMANDO = "INSERT INTO opciones VALUES (null, " + opcion.getSubopcionesid() + ", '" + opcion.getMenu() + "', '" + opcion.getTipo() + "', '" + opcion.getUrl() + "', 1)";
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
        String COMANDO = "INSERT INTO deber_usuario VALUES (" + responsabilidad.getDeberid() + ", " + responsabilidad.getUsuarioid() + ", " + responsabilidad.getTurnoid() + ", '" + responsabilidad.getFecha() + "', " + responsabilidad.getUsuarioidreg() + ", 1)";
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
    
    /* SEGURIDAD -- EDITAR */
    @Override
    public boolean EditarUsuario(Usuario usuario, String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EditarPerfil(Perfiles perfiles, String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EditarAccesos(Acceso acceso, String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EditarOpciones(Opcion opcion, String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EditarResponsabilidad(Responsabilidad responsabilidad, String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    /* SEGURIDAD -- LISTAS */
    @Override
    public List<Usuario> listarUsuario() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Usuario> listaUser = new ArrayList<>();
        String query = "SELECT us.usuario_id as idusuario, us.persona_id as personaid, concat(per.nombre, ' ', per.apellidos) as nombres, us.tipo_persona_id as tipoperid, tper.nombre_tipo_persona as nombretipopersona, us.area_id as areaid, ar.nombre as nombrearea, us.perfil_id as idperfil, perf.nombre_perfil as nombreperfil, us.usuario, us.contrasena, us.codigo, us.numhabitacion as habitacion, us.numculto as culto, CASE us.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM usuario as us, persona as per, tipo_persona as tper, area as ar, perfil \n"
                + "as perf WHERE us.persona_id=per.persona_id AND us.area_id=ar.area_id AND us.perfil_id=perf.perfil_id AND us.tipo_persona_id=tper.tipo_persona_id ORDER BY us.usuario_id DESC";
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
    public List<Perfiles> listarPerfiles() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Perfiles> listaPerfiles = new ArrayList<>();
        String query = "SELECT perfil_id as id, nombre_perfil as nombre, CASE estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM perfil ORDER BY perfil_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Perfiles perfiles = new Perfiles();
            perfiles.setPerfilid(cx.getCol("id"));
            perfiles.setNombreperfil(cx.getCol("nombre"));
            perfiles.setEstado(cx.getCol("estado"));
            listaPerfiles.add(perfiles);
        }
        return listaPerfiles;
    }

    @Override
    public List<Acceso> listarAccesos() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Acceso> listaAccesos = new ArrayList<>();
        String query = "SELECT per.perfil_id as idperfil, per.nombre_perfil as perfil, o.opciones_id as idmenu, CASE o.menu WHEN o.tipo='nivel2' THEN o.menu END as menu, op.subopciones_id as idsubmenu, CASE op.menu WHEN o.tipo='nivel1' THEN o.menu END as submenu, CASE op.tipo WHEN 'nivel1' THEN 'Menú' WHEN 'nivel2' THEN 'SubMenú' END as tipo, op.url, CASE ap.activo WHEN 'si' THEN 'Activo' WHEN'no' THEN 'Inactivo' END  as estado FROM opciones as o, opciones as op , perfil per, acceso_perfil as ap WHERE o.opciones_id=op.opciones_id AND ap.opciones_id=o.opciones_id AND per.perfil_id=ap.perfil_id AND o.estado=1 ORDER BY per.perfil_id, o.opciones_id";
        cx.execQuery(query);
        while (cx.getNext()) {
            Acceso acceso = new Acceso();
            acceso.setPerfilId(cx.getCol("idperfil"));
            acceso.setNombrePerfil(cx.getCol("perfil"));
            acceso.setMenuId(cx.getCol("idmenu"));
            acceso.setNombreMenu(cx.getCol("menu"));
            acceso.setSubMenuId(cx.getCol("idsubmenu"));
            acceso.setNombreSubMenu(cx.getCol("submenu"));
            acceso.setTipo(cx.getCol("tipo"));
            acceso.setUrl(cx.getCol("url"));
            acceso.setEstado(cx.getCol("estado"));
            listaAccesos.add(acceso);
        }
        return listaAccesos;
    }

    @Override
    public List<Opcion> listarMenus() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Opcion> listaMenus = new ArrayList<>();
        String query = "SELECT o.opciones_id as id, CASE o.menu WHEN o.tipo='nivel2' THEN o.menu END as menup, op.subopciones_id as idsub, CASE op.menu WHEN o.tipo='nivel1' THEN o.menu END as menu_s, CASE op.tipo WHEN 'nivel1' THEN 'Area' WHEN 'nivel2' THEN'Subarea' END as tipo, op.url, CASE op.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END  as estado, o.tipo FROM opciones as o, opciones as op WHERE o.opciones_id=op.opciones_id order by o.opciones_id ASC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Opcion opcion = new Opcion();
            opcion.setOpcionesid(cx.getCol("id"));
            opcion.setMenu(cx.getCol("menup"));
            opcion.setSubopcionesid(cx.getCol("idsub"));
            opcion.setSubmenu(cx.getCol("menu_s"));
            opcion.setTipo(cx.getCol("tipo"));
            opcion.setUrl(cx.getCol("url"));
            opcion.setEstado(cx.getCol("estado"));
            listaMenus.add(opcion);
        }
        return listaMenus;
    }

    @Override
    public List<Responsabilidad> listarResponsabilidad() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Responsabilidad> listaResponsabilidad = new ArrayList<>();
        String query = "SELECT d.deber_id as id1, us.usuario_id as id2, t.turno_id as id3, concat(p.nombre,' ',p.apellidos) as usuario, d.nombre_deber as deber, du.fecha as fecha, CASE du.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM deber_usuario as du, deber as d, usuario as us, turno t, persona as p WHERE d.deber_id=du.deber_id and p.persona_id=us.persona_id and us.usuario_id=du.usuario_id and t.turno_id=du.turno_id ORDER BY d.deber_id DESC";
        cx.execQuery(query);
        while (cx.getNext()) {
            Responsabilidad responsabilidad = new Responsabilidad();
            responsabilidad.setDeberid(cx.getCol("id1"));
            responsabilidad.setUsuarioid(cx.getCol("id2"));
            responsabilidad.setTurnoid(cx.getCol("id3"));
            responsabilidad.setNomresponsab(cx.getCol("usuario"));
            responsabilidad.setNomdeber(cx.getCol("deber"));
            responsabilidad.setFecha(cx.getCol("fecha"));
            responsabilidad.setEstado(cx.getCol("estado"));
            listaResponsabilidad.add(responsabilidad);
        }
        return listaResponsabilidad;
    }

    /* SEGURIDAD -- EXTRAS */
    @Override
    public boolean RestablecerPassword(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE usuario SET contrasena='1234567890' WHERE usuario_id='" + id + "'";
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
    
    /* SEGURIDAD -- LISTAS -- ID */
    @Override
    public List<Usuario> listarEditUsuario(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Usuario> listaEditUser = new ArrayList<>();
        String query = "SELECT per.nombre as nombre, per.apellidos as apellidos, us.persona_id as perid, us.tipo_persona_id as tpid, us.area_id as areaid, us.perfil_id as perfid, us.usuario, us.contrasena, us.codigo, us.numhabitacion, us.numculto FROM usuario as us, persona as per WHERE us.usuario_id=per.persona_id AND us.usuario_id='"+ id +"'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Usuario usuario = new Usuario();
            usuario.setNombre(cx.getCol("nombre"));
            usuario.setApellidos(cx.getCol("apellidos"));
            usuario.setPersonaid(cx.getCol("perid"));
            usuario.setTipopersonaid(cx.getCol("tpid"));
            usuario.setAreaid(cx.getCol("areaid"));
            usuario.setPerfilid(cx.getCol("perfid"));
            usuario.setUsuario(cx.getCol("usuario"));
            usuario.setContrasena(cx.getCol("contrasena"));
            usuario.setCodigo(cx.getCol("codigo"));
            usuario.setHabitacion(cx.getCol("numhabitacion"));
            usuario.setCulto(cx.getCol("numculto"));
            listaEditUser.add(usuario);
        }
        return listaEditUser;
    }

    @Override
    public List<Perfiles> listarEditPerfil(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Perfiles> listaEditPerfiles = new ArrayList<>();
        String query = "SELECT nombre_perfil as nombre FROM perfil WHERE perfil_id='"+ id +"'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Perfiles perfiles = new Perfiles();
            perfiles.setNombreperfil(cx.getCol("nombre"));
            listaEditPerfiles.add(perfiles);
        }
        return listaEditPerfiles;
    }

    @Override
    public List<Acceso> listarEditAccesos(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Opcion> listarEditMenus(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Opcion> listaEditMenus = new ArrayList<>();
        String query = "SELECT subopciones_id as subid, menu as nombre, tipo, url FROM opciones WHERE opciones_id='"+ id +"'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Opcion opcion = new Opcion();
            opcion.setSubopcionesid(cx.getCol("subid"));
            opcion.setMenu(cx.getCol("nombre"));
            opcion.setTipo(cx.getCol("tipo"));
            opcion.setUrl(cx.getCol("url"));
            listaEditMenus.add(opcion);
        }
        return listaEditMenus;
    }

    @Override
    public List<Responsabilidad> listarEditResponsabilidad(String iddeb, String iduser, String idtur) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Responsabilidad> listaEditResponsabilidad = new ArrayList<>();
        String query = "SELECT usuario_id as usid, turno_id as turid, fecha, usuario_id_reg FROM deber_usuario WHERE deber_id='"+ iddeb +"' and usuario_id='"+ iduser +"' and turno_id='"+ idtur +"'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Responsabilidad responsabilidad = new Responsabilidad();
            responsabilidad.setDeberid(cx.getCol("id1"));
            responsabilidad.setUsuarioid(cx.getCol("id2"));
            responsabilidad.setTurnoid(cx.getCol("id3"));
            responsabilidad.setFecha(cx.getCol("fecha"));
            listaEditResponsabilidad.add(responsabilidad);
        }
        return listaEditResponsabilidad;
    }
    
    /* SEGURIDAD -- ELIMINAR */
    @Override
    public boolean EliminarUsuario(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE usuario SET estado=0 WHERE usuario_id='" + id + "'";
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
    public boolean EliminarPerfil(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE perfil SET estado=0 WHERE perfil_id='" + id + "'";
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
    public boolean EliminarAcceso(String idper, String idop) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE acceso_perfil SET activo='no' WHERE perfil_id='"+ idper +"' and opciones_id='" + idop + "'";
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
    public boolean EliminarMenu(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE opciones SET estado=0 WHERE opciones_id='" + id + "'";
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
    public boolean EliminarResponsabilidad(String iddeber, String iduser, String idturno) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE deber_usuario SET estado=0 WHERE deber_id='" + iddeber + "' and usuario_id='" + iduser + "' and turno_id='" + idturno + "'";
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
    
    /* SEGURIDAD -- ACTIVAR */
    @Override
    public boolean ActivarUsuario(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE usuario SET estado=1 WHERE usuario_id='" + id + "'";
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
    public boolean ActivarPerfil(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE perfil SET estado=1 WHERE perfil_id='" + id + "'";
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
    public boolean ActivarAcceso(String idper, String idop) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE acceso_perfil SET activo='si' WHERE perfil_id='"+ idper +"' and opciones_id='" + idop + "'";
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
    public boolean ActivarMenu(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE opciones SET estado=1 WHERE opciones_id='" + id + "'";
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
    public boolean ActivarResponsabilidad(String iddeber, String iduser, String idturno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
