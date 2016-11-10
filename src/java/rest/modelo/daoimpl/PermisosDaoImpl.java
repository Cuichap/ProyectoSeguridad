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
import rest.modelo.entidad.Permiso;
import rest.modelo.dao.PermisosDao;
import rest.modelo.entidad.Visita;

/**
 *
 * @author Carlitos
 */
public class PermisosDaoImpl implements PermisosDao {

    @Override
    public boolean agregarPermiso(Permiso permiso) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "INSERT INTO permiso VALUES ()";
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
    public List<Permiso> listarPermisosResidentes() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Permiso> listaPermisos = new ArrayList<>();
        String query = "SELECT p.permiso_id as idpermiso, us.persona_id as idpersona, us.usuario_id as usuarioid, concat(per.nombre,' ',per.apellidos) as nombres, p.lugar as lugar, m.motivo_id as motivoid, m.nombre_motivo as motivo, p.fechasalida as fechasal1, p.horasalida as horasal1, p.fechaingreso as fechaing1, p.horaingreso as horaing1, p.fechasalidareal as fechasal2, p.horasalidareal as horasal2, p.fechaingresoreal as fechaing2, p.horaingresoreal as horaing2, p.observacion as observacion, CASE p.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM permiso as p, tipo_permiso as tp, motivo as m, usuario_permiso as up, usuario as us, persona as per, tipo_persona as tip WHERE per.persona_id=us.persona_id AND us.usuario_id=up.usuario_id AND up.permiso_id=p.permiso_id AND p.tipo_permiso_id=tp.tipo_permiso_id and p.motivo_id=m.motivo_id AND tip.tipo_persona_id=us.tipo_persona_id AND tip.nombre_tipo_persona='Residente'";
        cx.execQuery(query);
        while (cx.getNext()) {
            Permiso permiso = new Permiso();
            permiso.setPermisoid(cx.getCol("idpermiso"));
            permiso.setPersonaid(cx.getCol("idpersona"));
            permiso.setUsuarioid(cx.getCol("usuarioid"));
            permiso.setNombres(cx.getCol("nombres"));
            permiso.setLugar(cx.getCol("lugar"));
            permiso.setMotivoid(cx.getCol("motivoid"));
            permiso.setMotivo(cx.getCol("motivo"));
            permiso.setFechasalida(cx.getCol("fechasal1"));
            permiso.setHorasalida(cx.getCol("horasal1"));
            permiso.setFechaingreso(cx.getCol("fechaing1"));
            permiso.setHoraingreso(cx.getCol("horaing1"));
            permiso.setFechasalidareal(cx.getCol("fechasal2"));
            permiso.setHorasalidareal(cx.getCol("horasal2"));
            permiso.setFechaingresoreal(cx.getCol("fechaing2"));
            permiso.setHoraingresoreal(cx.getCol("horaing2"));
            permiso.setObservacion(cx.getCol("observacion"));
            permiso.setEstado(cx.getCol("estado"));
            listaPermisos.add(permiso);
        }
        return listaPermisos;
    }

    @Override
    public List<Permiso> listarPermisosPersonal() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Permiso> listaPermisos = new ArrayList<>();
        String query = "SELECT p.permiso_id as idpermiso, us.persona_id as idpersona, us.usuario_id as usuarioid, concat(per.nombre,' ',per.apellidos) as nombres, p.lugar as lugar, m.motivo_id as motivoid, m.nombre_motivo as motivo, p.fechasalida as fechasal1, p.horasalida as horasal1, p.fechaingreso as fechaing1, p.horaingreso as horaing1, p.fechasalidareal as fechasal2, p.horasalidareal as horasal2, p.fechaingresoreal as fechaing2, p.horaingresoreal as horaing2, p.observacion as observacion, CASE p.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM permiso as p, tipo_permiso as tp, motivo as m, usuario_permiso as up, usuario as us, persona as per, tipo_persona as tip WHERE per.persona_id=us.persona_id AND us.usuario_id=up.usuario_id AND up.permiso_id=p.permiso_id AND p.tipo_permiso_id=tp.tipo_permiso_id and p.motivo_id=m.motivo_id AND tip.tipo_persona_id=us.tipo_persona_id AND tip.nombre_tipo_persona='Personal' ";
        cx.execQuery(query);
        while (cx.getNext()) {
            Permiso permiso = new Permiso();
            permiso.setPermisoid(cx.getCol("idpermiso"));
            permiso.setPersonaid(cx.getCol("idpersona"));
            permiso.setUsuarioid(cx.getCol("usuarioid"));
            permiso.setNombres(cx.getCol("nombres"));
            permiso.setLugar(cx.getCol("lugar"));
            permiso.setMotivoid(cx.getCol("motivoid"));
            permiso.setMotivo(cx.getCol("motivo"));
            permiso.setFechasalida(cx.getCol("fechasal1"));
            permiso.setHorasalida(cx.getCol("horasal1"));
            permiso.setFechaingreso(cx.getCol("fechaing1"));
            permiso.setHoraingreso(cx.getCol("horaing1"));
            permiso.setFechasalidareal(cx.getCol("fechasal2"));
            permiso.setHorasalidareal(cx.getCol("horasal2"));
            permiso.setFechaingresoreal(cx.getCol("fechaing2"));
            permiso.setHoraingresoreal(cx.getCol("horaing2"));
            permiso.setObservacion(cx.getCol("observacion"));
            permiso.setEstado(cx.getCol("estado"));
            listaPermisos.add(permiso);
        }
        return listaPermisos;
    }

    @Override
    public List<Permiso> listarPermisosVehiculo() {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Permiso> listaPermisos = new ArrayList<>();
        String query = "SELECT perm.permiso_id as idpermiso, a.area_id as idarea, a.nombre as area, vp.conductor as conductor, CASE up.usuari_aut_id WHEN 4 THEN 'Gerencia' END as autorizo , tipv.tipo_vehiculo_id as idtipv, tipv.nombre_tipo_vehiculo as tipveh, v.vehiculo_id as idvehiculo, v.numplaca as placa, vp.kilometrajesalida as kmsalida, vp.descripcionS descS, vp.kilometrajeingreso as kmingreso, vp.descripcionE as descentrada, CASE perm.estado WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END as estado FROM usuario as us, tipo_persona as tip, usuario_permiso as up, permiso as perm, vehiculo_permiso as vp, vehiculo as v, marca as mar, tipo_vehiculo as tipv, area as a WHERE a.area_id=us.area_id AND us.usuario_id=up.usuario_id AND up.permiso_id=perm.permiso_id AND perm.permiso_id=vp.permiso_id AND vp.vehiculo_id=v.vehiculo_id AND v.marca_id=mar.marca_id AND tipv.tipo_vehiculo_id=v.tipo_vehiculo_id AND tip.tipo_persona_id=us.tipo_persona_id ";
        cx.execQuery(query);
        while (cx.getNext()) {
            Permiso permiso = new Permiso();
            permiso.setPermisoid(cx.getCol("idpermiso"));
            permiso.setAreaid(cx.getCol("idarea"));
            permiso.setArea(cx.getCol("area"));
            permiso.setNombres(cx.getCol("conductor"));
            permiso.setUsuarioautid(cx.getCol("autorizo"));
            permiso.setTipopermisoid(cx.getCol("idtipv"));
            permiso.setTipovehiculo(cx.getCol("tipveh"));
            permiso.setPlaca(cx.getCol("placa"));
            permiso.setKilometrajesalida(cx.getCol("kmsalida"));
            permiso.setDescripcionSalida(cx.getCol("descS"));
            permiso.setKilometrajeingreso(cx.getCol("kmingreso"));
            permiso.setDescripcionIngreso(cx.getCol("descentrada"));
            permiso.setEstado(cx.getCol("estado"));
            listaPermisos.add(permiso);
        }
        return listaPermisos;
    }

}
