<%-- 
    Document   : addDeber
    Created on : 20/10/2016, 10:16:33 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Deber"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
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
                    <h4><b>Lista de Deberes</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarDeber()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaDeber" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'deberes', '1')" type="text" class="form-control" placeholder="Buscar Deber." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="deberes" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdDeber</th>
                                        <th>Deber</th>
                                        <th hidden>IdTipoDber</th>
                                        <th>TipoDeber</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;
                                        
                                        List<Deber> listarDeber = dao.listarDeberes();
                                        for(Deber deb :listarDeber){
                                            count++;
                                        
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=deb.getDeberid()%></td>
                                        <td><%=deb.getNombredeber()%></td>
                                        <td hidden><%=deb.getTipodeberid()%></td>
                                        <td><%=deb.getNombretipodeber()%></td>
                                        <td><%=deb.getEstado()%></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Deber" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar Deber" align="center"><a><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarDeber" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos del Deber</b></span></h3>
                    </div>
                    <div class="panel-body">
                        <form id="adddeber" class="form-signin" role="form" method="post" action="">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="deber">Deber</label>
                                        <input type="text" class="form-control" id="deber" placeholder="Nombre del Deber" name="tipoVehiculo">
                                    </div>
                                </div>
                            </div>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarDeber()"><!--  data-dismiss="modal" -->
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
