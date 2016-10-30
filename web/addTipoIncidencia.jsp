<%-- 
    Document   : addTipoIncidencia
    Created on : 21/10/2016, 01:24:02 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.TipoIncidencia"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="col-sm-12">
            <br>
            <section id="lista" class="col-sm-12 well well-sm backcolor" style="display: block; margin-bottom: -50px;">
                <article class="col-sm-6" style="color: white;">
                    <h4><b>Lista de Tipos de Incidencia</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoIncidencia()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoIncidencia" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'tipoincidencias', '1')" type="text" class="form-control" placeholder="Buscar Tipos de Incidencias." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="tipoincidencias" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th>Tipo de Salida</th>
                                        <th>Descripción</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count=0;
                                        
                                        List<TipoIncidencia> listarTipoInc = dao.listarTipoIncidencia();
                                        for(TipoIncidencia tipoinc : listarTipoInc){
                                            count++;
                                            
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tipoinc.getTipoincidenciaid()%></td>
                                        <td><%=tipoinc.getNombretipoincidencia()%></td>
                                        <td><%=tipoinc.getDescripcion()%></td>
                                        <td><%=tipoinc.getEstado()%></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar el Tipo de Salida" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar el Tipo de Salida" align="center"><a><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTipoIncidencia" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos del Tipo de Incidencia</b></span></h3>
                    </div>
                    <div class="panel-body">
                        <form id="addtipoincidencia" class="form-signin" role="form" method="post" action="">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipoIncidencia">Tipo de incidencia</label>
                                        <input type="text" class="form-control" id="tipoIncidencia" placeholder="Nombre del Tipo de Incidencia" name="tipoIncidencia">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <textarea class="form-control" rows="4" id="descripcion" placeholder="Descripción del Tipo de Incidencia" name="descripcion"></textarea>
                                    </div>
                                </div>
                            </div>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoIncidencia()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Registrar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                </button>
                            </h4>
                            <h1></h1>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
