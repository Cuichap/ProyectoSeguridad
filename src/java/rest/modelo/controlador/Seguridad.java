/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rest.modelo.dao.SeguridadDao;
import rest.modelo.daoimpl.SeguridadDaoImpl;
import rest.modelo.entidad.Acceso;
import rest.modelo.entidad.Opcion;
import rest.modelo.entidad.Perfiles;
import rest.modelo.entidad.Responsabilidad;
import rest.modelo.entidad.Usuario;

/**
 *
 * @author USUARIO
 */
public class Seguridad extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SeguridadDao dao = new SeguridadDaoImpl();
        Usuario usuario = new Usuario();
        Perfiles perfiles = new Perfiles();
        Opcion opciones = new Opcion();
        Acceso acceso = new Acceso();
        Responsabilidad responsabilidad = new Responsabilidad();
        
        request.setCharacterEncoding("UTF-8");
        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        
        String nombres = request.getParameter("nombres"); nombres = nombres == null?"":nombres;
        String user = request.getParameter("user"); user = user == null?"":user;
        String contrasena = request.getParameter("contrasena"); contrasena = contrasena == null?"":contrasena;
        String codigo = request.getParameter("codigo"); codigo = codigo == null?"":codigo;
        String habitacion = request.getParameter("habitacion"); habitacion = habitacion == null?"":habitacion;
        String culto = request.getParameter("culto"); culto = culto == null?"":culto;
        String tipomenu = request.getParameter("tipoMenu"); tipomenu = tipomenu == null?"":tipomenu;
        String url = request.getParameter("url"); url = url == null?"":url;
        String fechaDeber = request.getParameter("fechaDeber"); fechaDeber = fechaDeber == null?"":fechaDeber;
        
        String personaid = request.getParameter("personaId"); personaid = personaid == null?"":personaid;
        String tipopersonaid = request.getParameter("tipoPersonaId"); tipopersonaid = tipopersonaid == null?"":tipopersonaid;
        String perfilid = request.getParameter("perfilId"); perfilid = perfilid == null?"":perfilid;
        String areaid = request.getParameter("areaId"); areaid = areaid == null?"0":areaid;
        String areaIdEdit = request.getParameter("areaIdEdit"); areaIdEdit = areaIdEdit == null?"":areaIdEdit;
        String idsubmenu = request.getParameter("idSubMenu"); idsubmenu = idsubmenu == null?"":idsubmenu;
        String deberId = request.getParameter("deberId"); deberId = deberId == null?"":deberId;
        String usuarioId = request.getParameter("usuarioId"); usuarioId = usuarioId == null?"":usuarioId;
        String turnoId = request.getParameter("turnoId"); turnoId = turnoId == null?"":turnoId;
        String idUserReg = request.getParameter("idUserReg"); idUserReg = idUserReg == null?"":idUserReg;
        
        String id = request.getParameter("id"); id = id == null?"":id;
        String iduser = request.getParameter("iduser"); iduser = iduser == null?"":iduser;
        String idturno = request.getParameter("idturno"); idturno = idturno == null?"":idturno;
        
        switch (opcion) {
            case "AddUsuario":
                usuario.setPersonaid(personaid);
                usuario.setTipopersonaid(tipopersonaid);
                usuario.setPerfilid(perfilid);
                usuario.setAreaid(areaid);
                usuario.setUsuario(user);
                usuario.setContrasena(contrasena);
                usuario.setCodigo(codigo);
                usuario.setHabitacion(habitacion);
                usuario.setCulto(culto);
                usuario.setUserIdReg(idUserReg);
                if (dao.AgregarUsuario(usuario)) {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "EditUsuario":
                usuario.setTipopersonaid(tipopersonaid);
                usuario.setAreaid(areaIdEdit);
                usuario.setPerfilid(perfilid);
                usuario.setUsuario(user);
                usuario.setCodigo(codigo);
                usuario.setHabitacion(habitacion);
                usuario.setCulto(culto);
                usuario.setUserIdReg(idUserReg);
                if (dao.EditarUsuario(usuario, id)) {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "RestablecerPassword":
                if (dao.RestablecerPassword(id)) {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "DeleteUsuario":
                if (dao.EliminarUsuario(id)) {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "ActivarUsuario":
                if (dao.ActivarUsuario(id)) {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "29");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "AddPerfil":
                perfiles.setNombreperfil(nombres);
                perfiles.setUserIdReg(idUserReg);
                if (dao.AgregarPerfil(perfiles)) {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "EditPerfil": 
                perfiles.setNombreperfil(nombres);
                perfiles.setUserIdReg(idUserReg);
                if (dao.EditarPerfil(perfiles, id)) {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "DeletePerfil": 
                if (dao.EliminarPerfil(id)) {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "ActivarPerfil": 
                if (dao.ActivarPerfil(id)) {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "30");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "AddAcceso":
                if (dao.AgregarAccesos(acceso)) {
                    request.setAttribute("IdSubMenu", "31");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "31");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "EditAcceso":
                break;
            case "DeleteAcceso":
                if (dao.EliminarAcceso(id, iduser)) {
                    request.setAttribute("IdSubMenu", "31");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "31");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "ActivarAcceso":
                if (dao.ActivarAcceso(id, iduser)) {
                    request.setAttribute("IdSubMenu", "31");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "31");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "AddMenu":
                opciones.setSubopcionesid(idsubmenu);
                opciones.setMenu(nombres);
                opciones.setTipo(tipomenu);
                opciones.setUrl(url);
                if (dao.AgregarOpciones(opciones)) {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "EditMenu":
                opciones.setMenu(nombres);
                opciones.setUserIdReg(idUserReg);
                if (dao.EditarOpciones(opciones, id)) {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "DeleteMenu": 
                if (dao.EliminarMenu(id)) {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "ActivarMenu":
                if (dao.ActivarMenu(id)) {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "32");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "AddResponsabilidad":
                responsabilidad.setDeberid(deberId);
                responsabilidad.setTurnoid(turnoId);
                responsabilidad.setUsuarioid(usuarioId);
                responsabilidad.setFecha(fechaDeber);
                responsabilidad.setUserIdReg(idUserReg);
                if (dao.AgregarResponsabilidad(responsabilidad)) {
                    request.setAttribute("IdSubMenu", "33");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "33");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "EditResponsabilidad":
                responsabilidad.setFecha(fechaDeber);
                responsabilidad.setUserIdReg(idUserReg);
                if (dao.EditarResponsabilidad(responsabilidad, id, iduser, idturno)) {
                    request.setAttribute("IdSubMenu", "33");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "33");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "DeleteResponsabilidad":
                if (dao.EliminarResponsabilidad(id, iduser, idturno)) {
                    request.setAttribute("IdSubMenu", "33");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "33");
                    request.setAttribute("IdMenu", "28");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "ActivarResponsabilidad":
                break;
            default:
                break;
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
