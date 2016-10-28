/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import rest.modelo.conexion.Conexion;
import rest.modelo.conexion.Configuracion;
import rest.modelo.dao.UsuarioDao;
import rest.modelo.entidad.Perfil;

/**
 *
 * @author TOSHIBA
 */
public class UsuarioDaoImpl implements UsuarioDao {

    @Override
    public Perfil CompUsuario(String usuario, String contrasena) {
        /*Statement st = null;
         ResultSet rs = null;
         String query = "select usuario_id, tipo_persona_id, perfil_id from usuario where usuario='" + usuario.toUpperCase() + "' and contrasena='" + contrasena + "' and estado='1'";
         Perfil per = null;
        
         try {
         st = abrirConexion().createStatement();
         rs = st.executeQuery(query);
         cerrarConexion();
         if (rs.next()) {   
         per = new Perfil();
         per.setIdusuario(rs.getString("usuario_id"));
         per.setPerfil(rs.getString("perfil_id"));
         per.setTipo(rs.getString("tipo_persona_id"));
         }
         } catch (Exception e) {
         e.printStackTrace();
         try {
         cerrarConexion();
         } catch (Exception ex) {
         }
         }
         return per; */
        Perfil per = null;
        Conexion cx = Configuracion.GaritaUPeU();
        String query = "select usuario_id, tipo_persona_id, perfil_id from usuario where usuario='" + usuario.toUpperCase() + "' and contrasena='" + contrasena + "' and estado='1'";
        cx.execQuery(query);

        while (cx.getNext()) {
            per = new Perfil();
            per.setIdusuario(cx.getCol("usuario_id"));
            per.setPerfil(cx.getCol("perfil_id"));
            per.setTipo(cx.getCol("tipo_persona_id"));
        }

        return per;

    }

    @Override
    public boolean Resturar(String usuario, String apellidos, String dni) {
        
        Conexion cx = Configuracion.GaritaUPeU();
        String query1 = "resContraseña('"+ usuario.toUpperCase() +"', '"+ apellidos.toUpperCase() +"', '"+ dni +"')";
        boolean estad = false;
        try {
            cx.procPreparar(query1);
            cx.Commit();
            cx.Close(1, 1, 1);
            estad = true;
        } catch (Exception e) {
            cx.RollBack();
            cx.Close(1, 1, 1);
            estad = false;
        }
        
        return estad;
        
        /*boolean estad = false;
        Statement st = null;
        String query1 = "update usuario set contrasena = '123456789' where upper(usuario)='" + usuario.toUpperCase() + "' and pregunta = '" + pregunta + "' and upper(respuesta) = '" + respuesta.toUpperCase() + "' ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query1);
            guardar();
            cerrarConexion();
            estad = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                revertir();
                estad = false;
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return estad;*/
        
    }

}
