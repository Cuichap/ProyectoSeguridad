<%-- 
    Document   : reporteVisitas
    Created on : 10/11/2016, 08:50:26 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Visita"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.ReporteDaoImpl"%>
<%@page import="rest.modelo.dao.ReporteDao"%>
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
                    <h4 ><b>Reporte de Visitas</b></h4>
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
                                        <th>Nombres</th>
                                        <th>Fecha y Hora de Ingreso</th>
                                        <th>Destino</th>
                                        <th>Visitado</th>
                                        <th>Descripción</th>
                                        <th>Fecha y Hora de Salida</th>
                                        <th>estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                    ReporteDao dao= new ReporteDaoImpl();
                                     
                                    int count=0;
                                    
                                    List<Visita> ListaVisitas=dao.ListaVisitas();
                                    
                                    for(Visita vis:ListaVisitas ){  
                                        count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td><%=vis.getNombres()%></td>
                                        <td><%=vis.getFechaentrada()%>&nbsp;<%=vis.getHoraentrada()%></td>
                                        <td><%=vis.getDestino()%></td>
                                        <td><%=vis.getVisitado()%></td>
                                        <td><%=vis.getDescripcion()%></td>
                                        <td><%=vis.getFechasalida()%>&nbsp;<%=vis.getHorasalida()%></td>
                                        <td><%=vis.getEstado()%></td>
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