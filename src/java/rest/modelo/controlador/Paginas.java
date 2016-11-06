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

/**
 *
 * @author USUARIO
 */
public class Paginas extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        String idmenu = request.getParameter("idmenu"); idmenu = idmenu == null ? "" : idmenu;
        String url = request.getParameter("url"); url = url == null ? "" : url;

        switch (opcion) {
            case "Inicio":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            case "Permisos":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            case "Visitas":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            case "Incidencias":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            case "Mantenimiento":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            case "Seguridad":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
                break;
            case "Reportes":
                request.setAttribute("IdMenu", idmenu);
                request.setAttribute("JSP", opcion);
                request.getRequestDispatcher(url).forward(request, response);
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
