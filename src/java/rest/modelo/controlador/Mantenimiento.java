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
import rest.modelo.dao.MantenimientoDao;
import rest.modelo.daoimpl.MantenimientoDaoImpl;
import rest.modelo.entidad.Area;
import rest.modelo.entidad.Deber;
import rest.modelo.entidad.Marca;
import rest.modelo.entidad.Motivo;
import rest.modelo.entidad.Objeto;
import rest.modelo.entidad.Opcion;
import rest.modelo.entidad.Perfil;
import rest.modelo.entidad.Perfiles;
import rest.modelo.entidad.Persona;
import rest.modelo.entidad.Responsabilidad;
import rest.modelo.entidad.TipoDeber;
import rest.modelo.entidad.TipoDocumento;
import rest.modelo.entidad.TipoIncidencia;
import rest.modelo.entidad.TipoPermiso;
import rest.modelo.entidad.TipoPersona;
import rest.modelo.entidad.TipoVehiculo;
import rest.modelo.entidad.Turno;
import rest.modelo.entidad.Usuario;
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
        Usuario usuario = new Usuario();
        Objeto objeto = new Objeto();
        Opcion opciones = new Opcion();
        Perfiles perfiles = new Perfiles();
        Area area = new Area();
        Vehiculo vehiculo = new Vehiculo();
        TipoVehiculo tipoVehiculo = new TipoVehiculo();
        Marca marca = new Marca();
        Turno turno = new Turno();
        Deber deber = new Deber();
        TipoDeber tipoDeber = new TipoDeber();
        Responsabilidad responsabilidad = new Responsabilidad();
        Motivo motivo = new Motivo();
        TipoPermiso tipoPermiso = new TipoPermiso();
        TipoIncidencia tipoIncidencia = new TipoIncidencia();
        TipoDocumento tipoDoc = new TipoDocumento();
       
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
        String user = request.getParameter("user"); user = user == null?"":user;
        String contrasena = request.getParameter("contrasena"); contrasena = contrasena == null?"":contrasena;
        String codigo = request.getParameter("codigo"); codigo = codigo == null?"":codigo;
        String habitacion = request.getParameter("habitacion"); habitacion = habitacion == null?"":habitacion;
        String culto = request.getParameter("culto"); culto = culto == null?"":culto;
        String descripcion = request.getParameter("descripcion"); descripcion = descripcion == null?"":descripcion;
        String tipomenu = request.getParameter("tipoMenu"); tipomenu = tipomenu == null?"":tipomenu;
        String url = request.getParameter("url"); url = url == null?"":url;
        String placa = request.getParameter("placa"); placa = placa == null?"":placa;
        
        String personaid = request.getParameter("personaId"); personaid = personaid == null?"":personaid;
        String tipopersonaid = request.getParameter("tipoPersonaId"); tipopersonaid = tipopersonaid == null?"":tipopersonaid;
        String perfilid = request.getParameter("perfilId"); perfilid = perfilid == null?"":perfilid;
        String areaid = request.getParameter("areaId"); areaid = areaid == null?"":areaid;
        String idsubmenu = request.getParameter("idSubMenu"); idsubmenu = idsubmenu == null?"":idsubmenu;
        String MarcaId = request.getParameter("MarcaId"); MarcaId = MarcaId == null?"":MarcaId;
        String tipoVehiculoId = request.getParameter("tipoVehiculoId"); tipoVehiculoId = tipoVehiculoId == null?"":tipoVehiculoId;
        
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
                if (dao.AgregarUsuario(usuario)) {
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
            case "EditUsuario":
                break;
            case "RestablecerPassword":
                if (dao.RestablecerPassword(id)) {
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
            case "DeleteUsuario":
                if (dao.EliminarUsuario(id)) {
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
            case "AddObjeto":
                objeto.setNombreobjeto(nombres);
                objeto.setDescripcion(descripcion);
                if (dao.AgregarObjeto(objeto)) {
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
            case "EditObjeto": 
                break;
            case "DeleteObjeto": 
                if (dao.EliminarObjeto(id)) {
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
            case "AddMenu":
                opciones.setSubopcionesid(idsubmenu);
                opciones.setMenu(nombres);
                opciones.setTipo(tipomenu);
                opciones.setUrl(url);
                if (dao.AgregarOpciones(opciones)) {
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
            case "EditMenu": 
                break;
            case "DeleteMenu": 
                if (dao.EliminarMenu(id)) {
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
            case "AddPerfil":
                perfiles.setNombreperfil(nombres);
                if (dao.AgregarPerfil(perfiles)) {
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
            case "EditPerfil": 
                break;
            case "DeletePerfil": 
                if (dao.EliminarPerfil(id)) {
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
            case "AddArea":
                break;
            case "EditArea": 
                break;
            case "DeleteArea": 
                break;
            case "AddVehiculo":
                vehiculo.setTipovehiculoid(tipoVehiculoId);
                vehiculo.setMarcaid(MarcaId);
                vehiculo.setNumplaca(placa);
                vehiculo.setDecripcion(descripcion);
                if (dao.AgregarVehiculo(vehiculo)) {
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
            case "EditVehiculo": 
                break;
            case "DeleteVehiculo": 
                if (dao.EliminarVehiculo(id)) {
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
            case "AddTipoVehiculo":
                tipoVehiculo.setNombretipovehiculo(nombres);
                if (dao.AgregarTipoVehiculo(tipoVehiculo)) {
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
            case "EditTipoVehiculo":
                break;
            case "DeleteTipoVehiculo":
                if (dao.EliminarTipoVehiculo(id)) {
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
            case "AddMarca":
                marca.setNombremarca(nombres);
                if (dao.AgregarMarca(marca)) {
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
            case "EditMarca":
                break;
            case "DeleteMarca":
                if (dao.EliminarMarca(id)) {
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
