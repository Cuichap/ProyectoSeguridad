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
import rest.modelo.dao.VisitaDao;
import rest.modelo.entidad.Persona;
import rest.modelo.entidad.Visita;

/**
 *
 * @author Carlitos
 */
public class VisitaDaoImpl implements VisitaDao {

    @Override
    public boolean registrarVisita(String idper, String fing, String hing, String dest, String vistado, String descrip, String userReg) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "call addVisitaconIdPersona('"+ idper +"', '"+ fing +"', '"+ hing +"', '"+ dest +"', '"+ vistado +"', '"+ descrip +"', '"+ userReg +"')";
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
    public List<Visita> listarVisita() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Visita> listaPer = new ArrayList<>();
        String query = "SELECT v.visita_id as idv, p.persona_id idp, concat(p.nombre,' ', p.apellidos) as nombres, p.procedencia as procedencia, v.destino as destino, v.visitado as visitado, v.descripcion as descripcion, p.telefono as telefono, us.usuario_id as idusuario, us.usuario as usuario, v.fechaentrada as fecha1, v.fechasalida as fecha2, v.horaentrada as hora1, v.horasalida as hora2, CASE v.estado WHEN 0 THEN 'Inactivo' WHEN 1 THEN 'Activo' END as estado FROM visita v, persona_visita as pv, persona as p, tipo_documento as td, usuario as us WHERE v.visita_id=pv.visita_id and pv.persona_id=p.persona_id and p.tipo_documento_id=td.tipo_documento_id and us.usuario_id=v.usuario_id_reg";
        cx.execQuery(query);
        while (cx.getNext()) {
            Visita visita = new Visita();
            visita.setVisitaid(cx.getCol("idv"));
            visita.setPersonaid(cx.getCol("idp"));
            visita.setNombres(cx.getCol("nombres"));
            visita.setProcedencia(cx.getCol("procedencia"));
            visita.setDestino(cx.getCol("destino"));
            visita.setVisitado(cx.getCol("visitado"));
            visita.setDescripcion(cx.getCol("descripcion"));
            visita.setUsuarioid(cx.getCol("idusuario"));
            visita.setUsuario(cx.getCol("usuario"));
            visita.setTelefono(cx.getCol("telefono"));
            visita.setGenero(cx.getCol("genero"));
            visita.setFechaentrada(cx.getCol("fecha1"));
            visita.setHoraentrada(cx.getCol("hora1"));
            visita.setFechasalida(cx.getCol("fecha2"));
            visita.setHorasalida(cx.getCol("hora2"));
            visita.setEstado(cx.getCol("estado"));
            listaPer.add(visita);
        }
        return listaPer;
    }

    @Override
    public List<Visita> listaVisitaEdit(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Visita> listaPer = new ArrayList<>();
        String query = "SELECT v.visita_id as idv, p.persona_id idp, concat(p.nombre,' ', p.apellidos) as nombres, p.procedencia as procedencia, p.telefono as telefono, us.usuario_id as idusuario, us.usuario as usuario, v.fechaentrada as fecha1, v.fechasalida as fecha2, v.horaentrada as hora1, v.horasalida as hora2, CASE v.estado WHEN 0 THEN 'Inactivo' WHEN 1 THEN 'Activo' END as estado FROM visita v, persona_visita as pv, persona as p, tipo_documento as td, usuario as us WHERE v.visita_id=pv.visita_id and pv.persona_id=p.persona_id and p.tipo_documento_id=td.tipo_documento_id and us.usuario_id=v.usuario_id WHERE v.visita_id='"+id+"'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Visita visita = new Visita();
            visita.setVisitaid(cx.getCol("idv"));
            visita.setPersonaid(cx.getCol("idp"));
            visita.setNombres(cx.getCol("nombres"));
            visita.setProcedencia(cx.getCol("procedencia"));
            visita.setUsuarioid(cx.getCol("idusuario"));
            visita.setUsuario(cx.getCol("usuario"));
            visita.setTelefono(cx.getCol("telefono"));
            visita.setGenero(cx.getCol("genero"));
            visita.setFechaentrada(cx.getCol("fecha1"));
            visita.setHoraentrada(cx.getCol("hora1"));
            visita.setFechasalida(cx.getCol("fecha2"));
            visita.setHorasalida(cx.getCol("hora2"));
            visita.setEstado(cx.getCol("estado"));
            listaPer.add(visita);
        }
        return listaPer;
    }

    @Override
    public boolean eliminarVisita(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE visita SET estado=0 WHERE visita_id='" + id + "'";
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
    public boolean activarVisita(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE visita SET estado=1 WHERE visita_id='" + id + "'";
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
    public List<Persona> listarPersona() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Persona> listaPerson = new ArrayList<>();
        String query = "SELECT persona_id as id, concat(nombre,' ',apellidos) as nombres FROM persona";
        cx.execQuery(query);
        while (cx.getNext()) {
            Persona persona = new Persona();
            persona.setPersonaid(cx.getCol("id"));
            persona.setNombres(cx.getCol("nombres"));
            listaPerson.add(persona);
        }
        return listaPerson;     
    }

    @Override
    public Persona MaxidPersona() {
        Persona per = null;
        Conexion cx = Configuracion.GaritaUPeU();
        String query = "SELECT max(persona_id) as id from persona";
        cx.execQuery(query);

        while (cx.getNext()) {
            per = new Persona();
            per.setPersonaid(cx.getCol("id"));
        }

        return per;
    }

    @Override
    public boolean registrarTodojeje(String nomb, String ape, String dir, String proce, String tpdoc, String numdoc, String tel, String gen, String fing, String hing, String dest, String vistado, String descrip, String userReg) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "call addVisita('"+ nomb +"', '"+ ape +"', '"+ dir +"', '"+ proce +"', '"+ tpdoc +"', '"+ numdoc +"', '"+ tel +"', '"+ gen +"', '"+ fing +"', '"+ hing +"', '"+ dest +"', '"+ vistado +"', '"+ descrip +"', '"+ userReg +"')";
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
