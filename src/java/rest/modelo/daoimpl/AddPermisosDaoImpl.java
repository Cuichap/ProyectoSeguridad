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
import rest.modelo.dao.AddPermisosDao;
import rest.modelo.entidad.UsuarioPermisoResident;

/**
 *
 * @author USUARIO
 */
public class AddPermisosDaoImpl implements AddPermisosDao{

    @Override
    public boolean AgregarPermisoResidente(UsuarioPermisoResident usuarioPermiso) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "call addPermisoResidente ("+ usuarioPermiso.getTipoPermisoId() +", "+ usuarioPermiso.getMotivoId() +", '"+ usuarioPermiso.getOtros() +"', '"+ usuarioPermiso.getLugar() +"', '"+ usuarioPermiso.getFechaSalida() +"', '"+ usuarioPermiso.getHoraSalida() +"', '"+ usuarioPermiso.getFechaEntrada() +"', '"+ usuarioPermiso.getHoraEntrada() +"', "+ usuarioPermiso.getUserIdReg() +")";
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
    public boolean EditarPermisoResidente(UsuarioPermisoResident usuarioPermiso, String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE permiso SET tipo_permiso_id='"+ usuarioPermiso.getTipoPermisoId() +"', motivo_id='"+ usuarioPermiso.getMotivoId() +"', otros='"+ usuarioPermiso.getOtros() +"', lugar='"+ usuarioPermiso.getLugar() +"', fechasalida='"+ usuarioPermiso.getFechaSalida() +"', horasalida='"+ usuarioPermiso.getHoraSalida() +"', fechaingreso='"+ usuarioPermiso.getFechaEntrada() +"', horaingreso='"+ usuarioPermiso.getHoraEntrada() +"', usuario_id_reg='"+ usuarioPermiso.getUserIdReg() +"' WHERE permiso_id='"+ id +"' ";
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
    public List<UsuarioPermisoResident> listarEditPermisoResidente(String idper, String iduser) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<UsuarioPermisoResident> listarPermisoResidente(String id, String estado) {
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<UsuarioPermisoResident> listaPermisoUsuario = new ArrayList<>();
        String query = "SELECT us.usuario_id as usid, p.nombre, p.apellidos, perm.permiso_id as permid, perm.tipo_permiso_id as tpid, tp.nombre_tipo_permiso as nombtp, perm.motivo_id as idmot, m.nombre_motivo as nombmotivo, perm.otros, perm.lugar, perm.fechasalida, perm.horasalida, perm.fechaingreso, perm.horaingreso, CASE perm.estado WHEN 0 THEN 'Rechazado' WHEN 1 THEN 'En Proceso' WHEN 2 THEN 'Aceptado' WHEN 3 THEN 'Inactivo' END as estado, perm.usuario_id_reg FROM permiso as perm, usuario_permiso as up, usuario as us, persona as p, tipo_permiso as tp, motivo as m WHERE perm.permiso_id=up.permiso_id AND up.usuario_id=us.usuario_id AND us.persona_id=p.persona_id AND perm.motivo_id=m.motivo_id AND perm.tipo_permiso_id=tp.tipo_permiso_id AND up.usuario_id='"+ id +"' AND perm.estado='"+ estado +"' ";
        cx.execQuery(query);
        while (cx.getNext()) {
            UsuarioPermisoResident usuarioPermiso = new UsuarioPermisoResident();
            usuarioPermiso.setUsuarioId(cx.getCol("usid"));
            usuarioPermiso.setNombres(cx.getCol("nombre"));
            usuarioPermiso.setApellidos(cx.getCol("apellidos"));
            usuarioPermiso.setPermisoId(cx.getCol("permid"));
            usuarioPermiso.setTipoPermisoId(cx.getCol("tpid"));
            usuarioPermiso.setNombreTipoPermiso(cx.getCol("nombtp"));
            usuarioPermiso.setMotivoId(cx.getCol("idmot"));
            usuarioPermiso.setNombreMotivo(cx.getCol("nombmotivo"));
            usuarioPermiso.setOtros(cx.getCol("otros"));
            usuarioPermiso.setLugar(cx.getCol("lugar"));
            usuarioPermiso.setFechaSalida(cx.getCol("fechasalida"));
            usuarioPermiso.setHoraSalida(cx.getCol("horasalida"));
            usuarioPermiso.setFechaEntrada(cx.getCol("fechaingreso"));
            usuarioPermiso.setHoraEntrada(cx.getCol("horaingreso"));
            usuarioPermiso.setEstado(cx.getCol("estado"));
            listaPermisoUsuario.add(usuarioPermiso);
        }
        return listaPermisoUsuario;
    }

    @Override
    public boolean AprobarPermisoResidente(String idperm, String iduser, String estado, String idprec) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "CALL AprobarPermisoResidente ("+ idperm +", "+ iduser +", "+ estado +", "+ idprec +")";
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
    public boolean EliminarPermisoResidente(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE permiso SET estado='3' WHERE permiso_id='"+ id +"' ";
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
    public boolean ActivarPermisoResidente(String id) {
        Conexion cx = Configuracion.GaritaUPeU();
        String COMANDO = "UPDATE permiso SET estado='1' WHERE permiso_id='"+ id +"' ";
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
