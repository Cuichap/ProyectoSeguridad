/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Menu;
import rest.modelo.entidad.SubMenu;

/**
 *
 * @author TOSHIBA
 */
public interface MenuDao {
    public List<Menu> listarMenus(String perfil_id);
    public List<SubMenu> listarSubMenu(String subopciones_id, String perfil_id);
}
