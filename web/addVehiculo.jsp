<%-- 
    Document   : addVehiculo
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.entidad.Vehiculo"%>
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
                    <h4><b>Lista de Vehículos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarVehiculo()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaVehiculo" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'vehiculos', '1')" type="text" class="form-control" placeholder="Buscar Vehículo." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="vehiculos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdVehiculo</th>
                                        <th hidden>IdTipoVehiculo</th>
                                        <th>Vehículo</th>
                                        <th hidden>IdMarca</th>
                                        <th>Marca</th>
                                        <th>N° Placa</th>
                                        <th>Descripción</th>
                                        <td>Estado</td>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;
                                        List<Vehiculo> listaVehiculo = dao.listarVehiculo();
                                        for(Vehiculo vehiculo : listaVehiculo){
                                            count++;
                                        
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <th hidden><%=vehiculo.getVehiculoid()%></th>
                                        <th hidden><%=vehiculo.getTipovehiculoid()%></th>
                                        <td><%=vehiculo.getNombre()%></td>
                                        <th hidden><%=vehiculo.getMarcaid()%></th>
                                        <td><%=vehiculo.getNombremarca()%></td>
                                        <td><%=vehiculo.getNumplaca()%></td>
                                        <td><%=vehiculo.getDecripcion()%></td>
                                        <td><%=vehiculo.getEstado()%></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Vehículo" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar Vehículo" align="center"><a><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarVehiculo" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos del Vehículo</b></span></h3>
                    </div>
                    <div class="panel-body">
                        <form id="addvehiculo" class="form-signin" role="form" method="post" action="">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Vehiculo</label>
                                        <select class="form-control" id="tipo" name="tipoVehiculo">
                                            <option hidden>Seleccionar el Tipo de Vehiculo</option>
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="marca">Marca</label>
                                        <input type="text" class="form-control" id="marca" placeholder="Ingresar la Marca del Vehiculo" name="marca">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="placa">Placa</label>
                                        <input type="text" class="form-control" id="placa" placeholder="Ingresar la Placa del Vehiculo" name="placa">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="descripcion">Descrippción</label>
                                        <textarea class="form-control" rows="4" id="descripcion" placeholder="Descripción del Vehiculo" name="descripcion"></textarea>
                                    </div>
                                </div>
                            </div>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarVehiculo()"><!--  data-dismiss="modal" -->
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
