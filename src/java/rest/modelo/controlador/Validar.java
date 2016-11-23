/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rest.modelo.dao.UsuarioDao;
import rest.modelo.daoimpl.UsuarioDaoImpl;

/**
 *
 * @author USUARIO
 */
public class Validar extends HttpServlet {

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

        UsuarioDao dao = new UsuarioDaoImpl();

        String us = request.getParameter(""); us = us == null ? "" : us;
        String rl = request.getParameter(""); rl = rl == null ? "" : rl;
        String tp = request.getParameter(""); tp = tp == null ? "" : tp;
        String usuario = request.getParameter("usuario");
        usuario = usuario == null ? "" : usuario;
        String password = request.getParameter("contrasena");
        password = password == null ? "" : password;

        if (dao.CompUsuario(usuario, password).getIdusuario() != null && dao.CompUsuario(usuario, password).getTipo() != null && dao.CompUsuario(usuario, password).getPerfil() != null) {

            us = dao.CompUsuario(usuario, password).getIdusuario();
            rl = dao.CompUsuario(usuario, password).getPerfil();
            tp = dao.CompUsuario(usuario, password).getTipo();
            HttpSession session = request.getSession();
            session.setAttribute("idUsuario", us);
            session.setAttribute("Usuario", usuario);
            session.setAttribute("Tipo", tp);
            session.setAttribute("Perfil", rl);

            if (rl.equals("1") || rl.equals("2") || rl.equals("3") || rl.equals("4")) {

                request.getRequestDispatcher("principal.jsp").forward(request, response);

            } else if (rl.equals("5")) {

                request.setAttribute("IdSubMenu", "7");
                request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                request.getRequestDispatcher("permisos.jsp").forward(request, response);

            } else if (rl.equals("6")) {

                request.setAttribute("IdSubMenu", "6");
                request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                request.getRequestDispatcher("permisos.jsp").forward(request, response);

            } else if (rl.equals("7")) {

                request.setAttribute("IdSubMenu", "8");
                request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                request.getRequestDispatcher("permisos.jsp").forward(request, response);

            } else if(rl.equals("8")){
                
                request.setAttribute("IdSubMenu", "8");
                request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                request.getRequestDispatcher("permisos.jsp").forward(request, response);
                
            }

        } else {

            request.getRequestDispatcher("index.jsp").forward(request, response);

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
