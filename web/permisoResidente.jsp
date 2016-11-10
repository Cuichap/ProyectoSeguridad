<%-- 
    Document   : permisoResidente
    Created on : 21/10/2016, 01:40:15 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.PermisosDaoImpl"%>
<%@page import="rest.modelo.dao.PermisosDao"%>
<%@page import="rest.modelo.entidad.Permiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    </head>
    <body>
        <div class="col-sm-12">
            <br>
            <section id="lista" class="col-sm-12 well well-sm backcolor" style="display: block; margin-bottom: -50px;">
                <article class="col-sm-4" style="color: white;">
                    <h4 ><b>Lista de Permisos de los Residentes</b></h4>
                </article>
            </section>
            <div id="listaVis" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input autofocus name="filt" onkeyup="filter(this, 'perResidentes', '1')" type="text" class="form-control" placeholder="Buscar Permisos de los Residentes." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="perResidentes" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>PermisoId</th>
                                        <th hidden>PersonaId</th>
                                        <th hidden>UsuarioId</th>
                                        <th>Nombres</th>
                                        <th>Lugar</th>
                                        <th hidden>MotivoId</th>
                                        <th>Motivo</th>
                                        <th>Salida Programada</th>
                                        <th>Ingreso Programado</th>
                                        <th>Salida Real</th>
                                        <th>Ingreso Real</th>
                                        <th>Observacion</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        PermisosDao pdao = new PermisosDaoImpl();
                                        int count = 0;
                                        
                                        List<Permiso> listarPermiso = pdao.listarPermisosResidentes();
                                        for(Permiso permiso : listarPermiso){
                                            count++;
                                        
                                     %>  
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=permiso.getPermisoid()%></td>
                                        <td hidden><%=permiso.getPersonaid()%></td>
                                        <td hidden><%=permiso.getUsuarioid()%></td>
                                        <td><%=permiso.getNombres()%></td>
                                        <td><%=permiso.getLugar()%></td>
                                        <td hidden><%=permiso.getMotivoid()%></td>
                                        <td><%=permiso.getMotivo()%></td>
                                        <td><%=permiso.getFechasalida()%> <%=permiso.getHoraingreso()%></td>
                                        <td><%=permiso.getFechaingreso()%> <%=permiso.getHoraingreso() %></td>
                                        <td><%=permiso.getFechasalidareal()%> <%=permiso.getHorasalidareal()%></td>
                                        <td><%=permiso.getFechaingresoreal()%> <%=permiso.getHoraingresoreal()%></td>
                                        <td><%=permiso.getObservacion()%></td>
                                        <td align="center">
                                            <%if(permiso.getFechaingresoreal().equals("") && permiso.getHoraingresoreal().equals("")){ %>
                                            &nbsp;&nbsp;&nbsp;
                                            <a>
                                            <i data-toggle="tooltip" data-placement="top" title="Registrar Salida" class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <%} if(!permiso.getFechaingresoreal().equals("") && !permiso.getHoraingresoreal().equals("")){%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a>
                                                <i data-toggle="tooltip" data-placement="top" title="Editar Permiso" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                            <%} if(permiso.getEstado().equals("Inactivo")){%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a>
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Permiso" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%} if(permiso.getEstado().equals("Activo")){%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a>
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Permiso" class="glyphicon glyphicon-trash"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
