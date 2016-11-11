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
import rest.modelo.dao.PermisosDao;
import rest.modelo.daoimpl.PermisosDaoImpl;
import rest.modelo.entidad.Permiso;

/**
 *
 * @author USUARIO
 */
public class Permisos extends HttpServlet {

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
        
        PermisosDao pdao = new PermisosDaoImpl();
        Permiso permiso = new Permiso();
        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        
        String permisoid = request.getParameter("permisoid"); permisoid = permisoid == null ? "" : permisoid;
        String tipopermiso = request.getParameter("tipopermiso"); tipopermiso = tipopermiso == null ? "" :tipopermiso;
        String nombres = request.getParameter("nombres"); nombres = nombres == null ? "" :nombres;
        String motivoid = request.getParameter("motivoid"); motivoid = motivoid == null ? "" :motivoid; 
        String fechasalida = request.getParameter("fechasalida"); fechasalida = fechasalida == null ? "" :fechasalida; 
        String horasalida = request.getParameter("horasalida"); horasalida = horasalida == null ? "" :horasalida; 
        String fechaingreso = request.getParameter("fechaingreso"); fechaingreso = fechaingreso == null ? "" :fechaingreso; 
        String horaingreso = request.getParameter("horaingreso"); horaingreso = horaingreso == null ? "" :horaingreso; 
        String fechasalidareal = request.getParameter("fechasalidareal"); fechasalidareal = fechasalidareal == null ? "" :fechasalidareal; 
        String horasalidareal = request.getParameter("horasalidareal"); horasalidareal = horasalidareal == null ? "" :horasalidareal; 
        String fechaingresoreal = request.getParameter("fechaingresoreal"); fechaingresoreal = fechaingresoreal == null ? "" :fechaingresoreal; 
        String horaingresoreal = request.getParameter("horaingresoreal"); horaingresoreal = horaingresoreal == null ? "" :horaingresoreal; 
        String observacion = request.getParameter("observacion"); observacion = observacion == null ? "" :observacion; 
        String usuarioreg = request.getParameter("usuarioreg"); usuarioreg = usuarioreg == null ? "" :usuarioreg; 
        String descripcion1 = request.getParameter("descripcion1"); descripcion1 = descripcion1 == null ? "" :descripcion1; 
        String descripcion2 = request.getParameter("descripcion2"); descripcion2 = descripcion2 == null ? "" :descripcion2; 
        String lugar = request.getParameter("lugar"); lugar = lugar == null ? "" :lugar; 
        String kilometrajeini = request.getParameter("kilometrajeini"); kilometrajeini = kilometrajeini == null ? "" :kilometrajeini; 
        String kilometrajefin = request.getParameter("kilometrajefin"); kilometrajefin = kilometrajefin == null ? "" :kilometrajefin; 
        
        String id = request.getParameter("id"); id = id == null?"":id;
        String id2 = request.getParameter("id2"); id2 = id2 == null?"":id2;
        
        switch(opcion){
            case "RegistrarSalidaResidente":
                permiso.setFechasalidareal(fechasalidareal);
                permiso.setHorasalidareal(horasalidareal);
                if (pdao.AgregarSalidaResidente(permiso, id)) {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "RegistrarIngresoResidente":
                permiso.setFechaingresoreal(fechaingresoreal);
                permiso.setHoraingresoreal(horaingresoreal);
                permiso.setObservacion(observacion);
                permiso.setUsuarioreg(usuarioreg);
                if (pdao.AgregarSalidaResidente(permiso, id)) {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "EditPermiso":
                permiso.setFechasalidareal(fechasalidareal);
                permiso.setHorasalidareal(horasalidareal);
                permiso.setFechaingresoreal(fechaingresoreal);
                permiso.setHoraingresoreal(horaingresoreal);
                permiso.setObservacion(observacion);
                permiso.setUsuarioreg(usuarioreg);
                if (pdao.EditarPermiso(permiso, id)) {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "DeletePermiso":
                if (pdao.EliminarPermiso(id)) {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "ActivarPermisos":
                if (pdao.ActivarPermiso(id)) {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "EditPermisoPersonal":
                permiso.setFechasalidareal(fechasalidareal);
                permiso.setHorasalidareal(horasalidareal);
                permiso.setFechaingresoreal(fechaingresoreal);
                permiso.setHoraingresoreal(horaingresoreal);
                permiso.setObservacion(observacion);
                permiso.setUsuarioreg(usuarioreg);
                if (pdao.EditarPermiso(permiso, id)) {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "3");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "ActivarPermisosPersonal":
                if (pdao.ActivarPermiso(id)) {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "DeletePermisoPersonal":
                if (pdao.EliminarPermiso(id)) {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "RegistrarPermisoPersonal":
                permiso.setFechasalidareal(fechasalidareal);
                permiso.setHorasalidareal(horasalidareal);
                permiso.setFechaingresoreal(fechaingresoreal);
                permiso.setHoraingresoreal(horaingresoreal);
                permiso.setObservacion(observacion);
                permiso.setUsuarioreg(usuarioreg);
                if (pdao.EditarPermiso(permiso, id)) {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "RegistrarSalidaVehiculo":
                permiso.setFechasalida(fechasalida);
                permiso.setHorasalida(horasalida);
                permiso.setKilometrajesalida(kilometrajeini);
                permiso.setDescripcionSalida(descripcion1);
                if (pdao.AgregarSalidaVehiculo(permiso, id, id2)) {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "RegistrarIngresoVehiculo":
                permiso.setKilometrajeingreso(kilometrajefin);
                permiso.setFechaingreso(fechaingreso);
                permiso.setHoraingreso(horaingreso);
                permiso.setDescripcionIngreso(descripcion2);
                if (pdao.AgregarentradaVehiculo(permiso, id, id2)) {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "EditarIngresoVehiculo":
                permiso.setFechasalida(fechasalida);
                permiso.setHorasalida(horasalida);
                permiso.setKilometrajesalida(kilometrajeini);
                permiso.setDescripcionSalida(descripcion1);
                permiso.setFechaingreso(fechaingreso);
                permiso.setHoraingreso(horaingreso);
                permiso.setKilometrajeingreso(kilometrajefin);
                permiso.setDescripcionIngreso(descripcion2);
                if (pdao.EditarPermisoVehiculo(permiso, id, id2)) {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "DeletePermisoVehiculo":
                if (pdao.EliminarPermisoVehiculo(id)) {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                }
                break;
            case "ActivarPermisosVehiculo":
               if (pdao.ActivarPermisoVehiculo(id)) {
                    request.setAttribute("IdSubMenu", "5");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "4");
                    request.setAttribute("IdMenu", "2");
                    request.setAttribute("JSP", "Permisos");
                    request.getRequestDispatcher("permisos.jsp").forward(request, response);
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
