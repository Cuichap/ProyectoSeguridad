/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.dao;

import java.util.List;
import rest.modelo.entidad.Perfil;

/**
 *
 * @author TOSHIBA
 */
public interface UsuarioDao {
    public Perfil CompUsuario(String usuario, String contrasena);
    public boolean Resturar(String usuario, String apellidos, String dni);
}
