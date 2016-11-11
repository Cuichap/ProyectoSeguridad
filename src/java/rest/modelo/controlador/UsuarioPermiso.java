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
import rest.modelo.dao.AddPermisosDao;
import rest.modelo.entidad.UsuarioPermisoResident;
import rest.modelo.daoimpl.AddPermisosDaoImpl;

/**
 *
 * @author USUARIO
 */
public class UsuarioPermiso extends HttpServlet {

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
        
        AddPermisosDao apd = new AddPermisosDaoImpl();
        
        UsuarioPermisoResident uspr = new UsuarioPermisoResident();
        
        request.setCharacterEncoding("UTF-8");
        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        
        String tipoPermisoId = request.getParameter("tipoPermisoId"); tipoPermisoId = tipoPermisoId == null ? "" : tipoPermisoId;
        String MotivoId = request.getParameter("MotivoId"); MotivoId = MotivoId == null ? "" : MotivoId;
        String otros = request.getParameter("otros"); otros = otros == null ? "" : otros;
        String lugar = request.getParameter("lugar"); lugar = lugar == null ? "" : lugar;
        String fechasalida = request.getParameter("fechasalida"); fechasalida = fechasalida == null ? "" : fechasalida;
        String horasalida = request.getParameter("horasalida"); horasalida = horasalida == null ? "" : horasalida;
        String fechaEntrada = request.getParameter("fechaEntrada"); fechaEntrada = fechaEntrada == null ? "" : fechaEntrada;
        String horaEntrada = request.getParameter("horaEntrada"); horaEntrada = horaEntrada == null ? "" : horaEntrada;
        
        String id = request.getParameter("id"); id = id == null?"":id;
        String idUserReg = request.getParameter("idUserReg"); idUserReg = idUserReg == null?"":idUserReg;
        
        switch (opcion) {
            case "AddPermisoResidente":
                uspr.setTipoPermisoId(tipoPermisoId);
                uspr.setMotivoId(MotivoId);
                uspr.setOtros(otros);
                uspr.setLugar(lugar);
                uspr.setFechaSalida(fechasalida);
                uspr.setHoraSalida(horasalida);
                uspr.setFechaEntrada(fechaEntrada);
                uspr.setHoraEntrada(horaEntrada);
                uspr.setUserIdReg(idUserReg);
                if (apd.AgregarPermisoResidente(uspr)) {
                    request.setAttribute("IdSubMenu", "6");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "6");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "EditarPermisoResidente":
                break;
            case "DeletePermisoResidente":
                if (apd.EliminarPermisoResidente(id)) {
                    request.setAttribute("IdSubMenu", "6");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "6");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            case "ActivarPermisoResidente":
                if (apd.ActivarPermisoResidente(id)) {
                    request.setAttribute("IdSubMenu", "6");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "6");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Seguridad");
                    request.getRequestDispatcher("seguridad.jsp").forward(request, response);
                }
                break;
            default :
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
