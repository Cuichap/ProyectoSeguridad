/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rest.modelo.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rest.modelo.dao.IncidenciaDao;
import rest.modelo.daoimpl.IncidenciaDaoImpl;
import rest.modelo.entidad.Incidencia;

/**
 *
 * @author USUARIO
 */
public class Incidencias extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        IncidenciaDao idao = new IncidenciaDaoImpl();
        Incidencia incidencia = new Incidencia();

        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        String idIncidencia = request.getParameter("idIncidencia"); idIncidencia = idIncidencia == null ? "" : idIncidencia;
        String idUsuar = request.getParameter("idUser"); idUsuar = idUsuar == null ? "" : idUsuar;
        String nombIncidencia = request.getParameter("nombIncidencia"); nombIncidencia = nombIncidencia == null ? "" : nombIncidencia;
        String descripcion = request.getParameter("descripcion"); descripcion = descripcion == null ? "" : descripcion;
        String lugar = request.getParameter("lugar"); lugar = lugar == null ? "" : lugar;
        String idusuarioreg = request.getParameter("idusuarioreg"); idusuarioreg = idusuarioreg == null ? "" : idusuarioreg;

        String id = request.getParameter("id"); id = id == null ? "" : id;
        String id2 = request.getParameter("id2"); id2 = id2 == null ? "" : id2;

        switch (opcion) {
            case "EditIncidencia":
                incidencia.setIncidenciaid(idIncidencia);
                incidencia.setUsuarioid(idUsuar);
                incidencia.setDescripcion(descripcion);
                incidencia.setLugar(lugar);
                incidencia.setUsuarioreg(idusuarioreg);
                if (idao.editarIncidencia(incidencia, id, id2)) {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Incidencias");
                    request.getRequestDispatcher("incidencia.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Incidencias");
                    request.getRequestDispatcher("incidencia.jsp").forward(request, response);
                }
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
