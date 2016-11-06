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
import rest.modelo.dao.MantenimientoDao;
import rest.modelo.daoimpl.MantenimientoDaoImpl;
import rest.modelo.entidad.Area;
import rest.modelo.entidad.Deber;
import rest.modelo.entidad.Marca;
import rest.modelo.entidad.Motivo;
import rest.modelo.entidad.Objeto;
import rest.modelo.entidad.Persona;
import rest.modelo.entidad.TipoDeber;
import rest.modelo.entidad.TipoDocumento;
import rest.modelo.entidad.TipoIncidencia;
import rest.modelo.entidad.TipoPermiso;
import rest.modelo.entidad.TipoPersona;
import rest.modelo.entidad.TipoVehiculo;
import rest.modelo.entidad.Turno;
import rest.modelo.entidad.Vehiculo;

/**
 *
 * @author USUARIO
 */
public class Mantenimiento extends HttpServlet {

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
        
        MantenimientoDao dao = new MantenimientoDaoImpl();
        Persona persona = new Persona();
        TipoPersona tipoPersona = new TipoPersona();
        Objeto objeto = new Objeto();
        Area area = new Area();
        Vehiculo vehiculo = new Vehiculo();
        TipoVehiculo tipoVehiculo = new TipoVehiculo();
        Marca marca = new Marca();
        Turno turno = new Turno();
        Deber deber = new Deber();
        TipoDeber tipoDeber = new TipoDeber();
        Motivo motivo = new Motivo();
        TipoPermiso tipoPermiso = new TipoPermiso();
        TipoIncidencia tipoIncidencia = new TipoIncidencia();
        TipoDocumento tipoDoc = new TipoDocumento();
        
        request.setCharacterEncoding("UTF-8");
       
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        
        String nombres = request.getParameter("nombres"); nombres = nombres == null?"":nombres;
        String apellidos = request.getParameter("apellidos"); apellidos = apellidos == null?"":apellidos;
        String direccion = request.getParameter("direccion"); direccion = direccion == null?"":direccion;
        String procedencia = request.getParameter("procedencia"); procedencia = procedencia == null?"":procedencia;
        String tipoDocumento = request.getParameter("tipoDocumento"); tipoDocumento = tipoDocumento == null?"":tipoDocumento;
        String numeroDoc = request.getParameter("numeroDoc"); numeroDoc = numeroDoc == null?"":numeroDoc;
        String telefono = request.getParameter("telefono"); telefono = telefono == null?"":telefono;
        String genero = request.getParameter("genero"); genero = genero == null?"":genero;
        String img = request.getParameter("img"); img = img == null?"":img;
        String nombretipopersona = request.getParameter("nombreTipoPersona"); nombretipopersona = nombretipopersona == null?"":nombretipopersona;
        String descripcion = request.getParameter("descripcion"); descripcion = descripcion == null?"":descripcion;
        String placa = request.getParameter("placa"); placa = placa == null?"":placa;
        String horainicio = request.getParameter("horainicio"); horainicio = horainicio == null?"":horainicio;
        String horafin = request.getParameter("horafin"); horafin = horafin == null?"":horafin;
        
        String MarcaId = request.getParameter("MarcaId"); MarcaId = MarcaId == null?"":MarcaId;
        String tipoVehiculoId = request.getParameter("tipoVehiculoId"); tipoVehiculoId = tipoVehiculoId == null?"":tipoVehiculoId;
        String tipoDeberId = request.getParameter("tipoDeberId"); tipoDeberId = tipoDeberId == null?"":tipoDeberId;
        
        String id = request.getParameter("id"); id = id == null?"":id;

        switch (opcion) {
            case "AddPersona":
                persona.setNombres(nombres);
                persona.setApellidos(apellidos);
                persona.setDireccion(direccion);
                persona.setProcedencia(procedencia);
                persona.setTipoducumentoid(tipoDocumento);
                persona.setNumdocumento(numeroDoc);
                persona.setTelefono(telefono);
                persona.setGenero(genero);
                persona.setImg(img);
                if (dao.AgregarPersona(persona)) {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "1");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } 
                break;
            case "EditPersona":
                break;
            case "DeletePersona":
                if (dao.EliminarPersona(id)) {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarPersona":
                if (dao.ActivarPersona(id)) {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "11");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddTipoPersona":
                tipoPersona.setNombreTipoPersona(nombretipopersona);
                if (dao.AgregarTipoPersona(tipoPersona)) {
                    request.setAttribute("IdSubMenu", "12");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "12");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTipoPersona":
                break;
            case "DeleteTipoPersona":
                if (dao.EliminarTipoPersona(id)) {
                    request.setAttribute("IdSubMenu", "12");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "12");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTipoPersona":
                if (dao.ActivarTipoPersona(id)) {
                    request.setAttribute("IdSubMenu", "12");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "12");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddObjeto":
                objeto.setNombreobjeto(nombres);
                objeto.setDescripcion(descripcion);
                if (dao.AgregarObjeto(objeto)) {
                    request.setAttribute("IdSubMenu", "13");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "13");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditObjeto": 
                break;
            case "DeleteObjeto": 
                if (dao.EliminarObjeto(id)) {
                    request.setAttribute("IdSubMenu", "13");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "13");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarObjeto":
                if (dao.ActivarObjeto(id)) {
                    request.setAttribute("IdSubMenu", "13");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "13");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddArea":
                break;
            case "EditArea": 
                break;
            case "DeleteArea":
                if (dao.EliminarArea(id)) {
                    request.setAttribute("IdSubMenu", "14");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "14");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarArea":
                if (dao.ActivarArea(id)) {
                    request.setAttribute("IdSubMenu", "14");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "14");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddVehiculo":
                vehiculo.setTipovehiculoid(tipoVehiculoId);
                vehiculo.setMarcaid(MarcaId);
                vehiculo.setNumplaca(placa);
                vehiculo.setDecripcion(descripcion);
                if (dao.AgregarVehiculo(vehiculo)) {
                    request.setAttribute("IdSubMenu", "15");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "15");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditVehiculo": 
                break;
            case "DeleteVehiculo": 
                if (dao.EliminarVehiculo(id)) {
                    request.setAttribute("IdSubMenu", "15");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "15");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarVehiculo":
                if (dao.ActivarVehiculo(id)) {
                    request.setAttribute("IdSubMenu", "15");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "15");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddTipoVehiculo":
                tipoVehiculo.setNombretipovehiculo(nombres);
                if (dao.AgregarTipoVehiculo(tipoVehiculo)) {
                    request.setAttribute("IdSubMenu", "16");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "16");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTipoVehiculo":
                break;
            case "DeleteTipoVehiculo":
                if (dao.EliminarTipoVehiculo(id)) {
                    request.setAttribute("IdSubMenu", "16");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "16");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTipoVehiculo":
                if (dao.ActivarTipoVehiculo(id)) {
                    request.setAttribute("IdSubMenu", "16");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "16");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddMarca":
                marca.setNombremarca(nombres);
                if (dao.AgregarMarca(marca)) {
                    request.setAttribute("IdSubMenu", "17");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "17");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditMarca":
                break;
            case "DeleteMarca":
                if (dao.EliminarMarca(id)) {
                    request.setAttribute("IdSubMenu", "17");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "17");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarMarca":
                if (dao.ActivarMarca(id)) {
                    request.setAttribute("IdSubMenu", "17");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "17");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddTurno":
                turno.setNombreturno(nombres);
                turno.setHorainicio(horainicio);
                turno.setHorafin(horafin);
                if (dao.AgregarTurno(turno)) {
                    request.setAttribute("IdSubMenu", "18");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "18");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTurno":
                break;
            case "DeleteTurno":
                if (dao.EliminarTurno(id)) {
                    request.setAttribute("IdSubMenu", "18");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "18");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTurno":
                if (dao.ActivarTurno(id)) {
                    request.setAttribute("IdSubMenu", "18");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "18");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddDeber":
                deber.setNombredeber(nombres);
                deber.setTipodeberid(tipoDeberId);
                if (dao.AgregarDeber(deber)) {
                    request.setAttribute("IdSubMenu", "19");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "19");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditDeber":
                break;
            case "DeleteDeber":
                if (dao.EliminarDeber(id)) {
                    request.setAttribute("IdSubMenu", "19");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "19");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarDeber":
                if (dao.ActivarDeber(id)) {
                    request.setAttribute("IdSubMenu", "19");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "19");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddTipoDeber":
                tipoDeber.setNombretipodeber(nombres);
                if (dao.AgregarTipoDeber(tipoDeber)) {
                    request.setAttribute("IdSubMenu", "20");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "20");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTipoDeber":
                break;
            case "DeleteTipoDeber":
                if (dao.EliminarTipoDeber(id)) {
                    request.setAttribute("IdSubMenu", "20");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "20");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTipoDeber":
                if (dao.ActivarTipoDeber(id)) {
                    request.setAttribute("IdSubMenu", "20");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "20");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddMotivo":
                motivo.setNombremotivo(nombres);
                if (dao.AgregarMotivo(motivo)) {
                    request.setAttribute("IdSubMenu", "21");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "21");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditMotivo":
                break;
            case "DeleteMotivo":
                if (dao.EliminarMotivo(id)) {
                    request.setAttribute("IdSubMenu", "21");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "21");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarMotivo":
                if (dao.ActivarMotivo(id)) {
                    request.setAttribute("IdSubMenu", "21");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "21");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddTipoSalida":
                tipoPermiso.setNombretipopermiso(nombres);
                tipoPermiso.setDescripcion(descripcion);
                if (dao.AgregarTipoSalida(tipoPermiso)) {
                    request.setAttribute("IdSubMenu", "22");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "22");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTipoSalida":
                break;
            case "DeleteTipoSalida":
                if (dao.EliminarTipoSalida(id)) {
                    request.setAttribute("IdSubMenu", "22");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "22");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTipoSalida":
                if (dao.ActivarTipoSalida(id)) {
                    request.setAttribute("IdSubMenu", "22");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "22");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                 break;
            case "AddTipoIncidencia":
                tipoIncidencia.setNombretipoincidencia(nombres);
                tipoIncidencia.setDescripcion(descripcion);
                if (dao.AgregarTipoIncidencia(tipoIncidencia)) {
                    request.setAttribute("IdSubMenu", "23");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "23");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTipoIncidencia":
                break;
            case "DeleteTipoIncidencia":
                if (dao.EliminarTipoIncidencia(id)) {
                    request.setAttribute("IdSubMenu", "23");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "23");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTipoIncidencia":
                if (dao.ActivarTipoIncidencia(id)) {
                    request.setAttribute("IdSubMenu", "23");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "23");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "AddTipoDocumento":
                tipoDoc.setNombredocumento(nombres);
                if (dao.AgregarTipoDocumento(tipoDoc)) {
                    request.setAttribute("IdSubMenu", "24");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "24");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "EditTipoDocumento":
                break;
            case "DeleteTipoDocumento":
                if (dao.EliminarTipoDocumento(id)) {
                    request.setAttribute("IdSubMenu", "24");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "24");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
                break;
            case "ActivarTipoDocumento":
                if (dao.ActivarTipoDocumento(id)) {
                    request.setAttribute("IdSubMenu", "24");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                } else {
                    request.setAttribute("IdSubMenu", "24");
                    request.setAttribute("IdMenu", "10");
                    request.setAttribute("JSP", "Mantenimiento");
                    request.getRequestDispatcher("mantenimiento.jsp").forward(request, response);
                }
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
