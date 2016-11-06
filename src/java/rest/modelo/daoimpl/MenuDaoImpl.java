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
import rest.modelo.dao.MenuDao;
import rest.modelo.entidad.Menu;
import rest.modelo.entidad.SubMenu;
/**
 *
 * @author TOSHIBA
 */
public class MenuDaoImpl implements MenuDao{
    
    @Override
    public List<Menu> listarMenus(String perfil_id) {
        
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<Menu> listaM = new ArrayList<Menu>();
        String query = "SELECT opc.opciones_id as id, opc.menu as nombre, opc.url as url FROM acceso_perfil as acp, opciones as opc WHERE acp.opciones_id=opc.opciones_id AND acp.perfil_id='"+ perfil_id +"' AND opc.tipo='nivel1' AND estado=1 AND acp.activo='si'";
        cx.execQuery(query);
        while(cx.getNext()){
            Menu menu = new Menu();
            menu.setIdmenu(cx.getCol("id"));
            menu.setNombreMenu(cx.getCol("nombre"));  
            menu.setUrl(cx.getCol("url"));
            listaM.add(menu);
        }
        return listaM;
        
        /*Statement st = null;
        ResultSet rs = null;
        String query = "select opc.opciones_id as id, opc.menu as nombre, opc.url as url from seguridad.acceso_perfil as acp, seguridad.opciones as opc where acp.opciones_id=opc.opciones_id and acp.perfil_id='"+ perfil_id +"'";
        Menu menu = null;
        List<Menu> listaC = new ArrayList<>();
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            while (rs.next()) {   
                menu = new Menu();     
                menu.setIdmenu(rs.getString("id"));
                menu.setNombreMenu(rs.getString("nombre"));  
                menu.setUrl(rs.getString("url"));
                listaC.add(menu);
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return listaC; */
    }

    @Override
    public List<SubMenu> listarSubMenu(String subopciones_id, String perfil_id) {
        
        Conexion cx = Configuracion.GaritaUPeU();
        ArrayList<SubMenu> listaSM = new ArrayList<SubMenu>();
        String query = "SELECT opc.opciones_id as id, opc.menu as nombre FROM acceso_perfil as acp, opciones as opc WHERE opc.opciones_id=acp.opciones_id AND opc.subopciones_id='"+ subopciones_id +"' AND acp.perfil_id='"+ perfil_id +"' AND opc.tipo='nivel2' AND estado=1 AND acp.activo='si' order by opc.opciones_id";
        cx.execQuery(query);
        while(cx.getNext()){
            SubMenu submenu = new SubMenu();
            submenu.setIdSubMenu(cx.getCol("id"));
            submenu.setNombreSubMenu(cx.getCol("nombre"));
            listaSM.add(submenu);
        }
        return listaSM;
        
        /*Statement st = null;
        ResultSet rs = null;
        String query = "select opc.opciones_id as id, opc.menu as nombre from  seguridad.opciones as opc where opc.subopciones_id='"+ subopciones_id +"' ";
        SubMenu submenu = null;
        List<SubMenu> listaS = new ArrayList<>();
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            while (rs.next()) {   
                submenu = new SubMenu();     
                submenu.setIdSubMenu(rs.getString("id"));
                submenu.setNombreSubMenu(rs.getString("nombre"));
                listaS.add(submenu);
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return listaS; */
    }
    
}
