<%-- 
    Document   : permisoVehiculo
    Created on : 21/10/2016, 01:41:17 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Permiso"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.PermisosDaoImpl"%>
<%@page import="rest.modelo.dao.PermisosDao"%>
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
                    <h4 ><b>Lista de Permisos de Vehículos</b></h4>
                </article>
            </section>
            <div id="listaVis" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input autofocus name="filt" onkeyup="filter(this, 'perVehiculos', '1')" type="text" class="form-control" placeholder="Buscar Permisos de Vehículos." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="perVehiculos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>PermisoId</th>
                                        <th hidden>AreaId</th>
                                        <th>Area</th>
                                        <th>Conductor</th>
                                        <th>Autorizó</th>
                                        <th hidden>VehiculoId</th>
                                        <th>Vehículo</th>
                                        <th>N° Placa</th>
                                        <th>Kilometraje inicial</th>
                                        <th>Descripcion Salida</th>
                                        <th>Kilometraje final</th>
                                        <th>Descripcion Entrada</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        PermisosDao pdao = new PermisosDaoImpl();
                                        int count = 0;
                                        
                                        List<Permiso> listarPermisoVehiculo = pdao.listarPermisosVehiculo();
                                        for(Permiso pVehiculo : listarPermisoVehiculo){
                                            count++;
                                        %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=pVehiculo.getPermisoid()%></td>
                                        <td hidden><%=pVehiculo.getAreaid()%></td>
                                        <td><%=pVehiculo.getArea()%></td>
                                        <td><%=pVehiculo.getNombres()%></td>
                                        <td><%=pVehiculo.getUsuarioautid()%></td>
                                        <td hidden><%=pVehiculo.getTipovehiculoid()%></td>
                                        <td><%=pVehiculo.getTipovehiculo()%></td>
                                        <td><%=pVehiculo.getPlaca()%></td>
                                        <td><%=pVehiculo.getKilometrajesalida()%></td>
                                        <td><%=pVehiculo.getDescripcionSalida()%></td>
                                        <td><%=pVehiculo.getKilometrajeingreso()%></td>
                                        <td><%=pVehiculo.getDescripcionIngreso()%></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Registrar Entrada" align="center"><a><i class="glyphicon glyphicon-arrow-right"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Permiso" align="center"><a><i class="glyphicon glyphicon-trash"></i></a></td>
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
