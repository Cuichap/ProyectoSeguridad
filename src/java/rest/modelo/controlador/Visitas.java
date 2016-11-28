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
import rest.modelo.dao.VisitaDao;
import rest.modelo.daoimpl.VisitaDaoImpl;
import rest.modelo.entidad.Visita;

/**
 *
 * @author USUARIO
 */
public class Visitas extends HttpServlet {

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
        
        
        VisitaDao vdao = new VisitaDaoImpl();
        Visita visita = new Visita();
        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        
        String visitaid = request.getParameter("visitaid"); visitaid = visitaid == null ? "" : visitaid;
        String personaidVisita = request.getParameter("personaidVisita"); personaidVisita = personaidVisita == null ? "" : personaidVisita;
        String fechaIngreso = request.getParameter("fechaIngreso"); fechaIngreso = fechaIngreso == null ? "" : fechaIngreso;
        String HoraIngreso = request.getParameter("HoraIngreso"); HoraIngreso = HoraIngreso == null ? "" : HoraIngreso;
        String destino = request.getParameter("destino"); destino = destino == null ? "" : destino;
        String visitado = request.getParameter("visitado"); visitado = visitado == null ? "" : visitado;
        String descripcion = request.getParameter("descripcion"); descripcion = descripcion == null ? "" : descripcion;
        String horasalida = request.getParameter("horasalida"); horasalida = horasalida == null ? "" : horasalida;
        String fechasalida = request.getParameter("fechasalida"); fechasalida = fechasalida == null ? "" : fechasalida;
        String nombres = request.getParameter("nombres"); nombres = nombres == null ? "" : nombres;
        String apellidos = request.getParameter("apellidos"); apellidos = apellidos == null ? "" : apellidos;
        String direccion = request.getParameter("direccion"); direccion = direccion == null ? "" : direccion;
        String procedencia = request.getParameter("procedencia"); procedencia = procedencia == null ? "" : procedencia;
        String tipoDocumento = request.getParameter("tipoDocumento"); tipoDocumento = tipoDocumento == null ? "" : tipoDocumento;
        String numeroDoc = request.getParameter("numeroDoc"); numeroDoc = numeroDoc == null ? "" : numeroDoc;
        String telefono = request.getParameter("telefono"); telefono = telefono == null ? "" : telefono;
        String genero = request.getParameter("genero"); genero = genero == null ? "" : genero;
        String idUsuarioReg = request.getParameter("idUsuarioReg"); idUsuarioReg = idUsuarioReg == null ? "" : idUsuarioReg;
        
        String id = request.getParameter("id"); id = id == null?"":id;
        
        switch(opcion){
            case "AddVisitaConId":
                if( vdao.registrarVisita(personaidVisita, fechaIngreso, HoraIngreso, destino, visitado, descripcion, idUsuarioReg)){
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } 
                break;
            case "AddVisitaTodo":
                if( vdao.registrarTodojeje(nombres, apellidos, direccion, procedencia, tipoDocumento, numeroDoc, telefono, genero, fechaIngreso, HoraIngreso, destino, visitado, descripcion, idUsuarioReg)){
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } 
                break;
            case "EditVisita":
                break;
            case "DeleteVisita":
                if( vdao.eliminarVisita(id)){
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } 
                break;
            case "ActivarVisita":
                if( vdao.activarVisita(id)){
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdMenu", "6");
                    request.setAttribute("JSP", "Visitas");
                    request.getRequestDispatcher("visita.jsp").forward(request, response);
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
