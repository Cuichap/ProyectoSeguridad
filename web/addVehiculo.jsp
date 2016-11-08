<%-- 
    Document   : addVehiculo
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Marca"%>
<%@page import="rest.modelo.entidad.TipoVehiculo"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.entidad.Vehiculo"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idVehiculoEdit = request.getParameter("idVehiculoEdit"); idVehiculoEdit = idVehiculoEdit == null?"":idVehiculoEdit;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'vehiculos', '1')" type="text" class="form-control" placeholder="Buscar Vehículo." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select class="form-control">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option value="1">Activos</option>
                                    <option value="0">Inactivos</option>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
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
                                        for (Vehiculo vehiculo : listaVehiculo) {
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
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=vehiculo.getVehiculoid()%>(<%=vehiculo.getVehiculoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Vehículo" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (vehiculo.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=vehiculo.getVehiculoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Vehículo" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (vehiculo.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=vehiculo.getVehiculoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Vehículo" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=vehiculo.getVehiculoid()%>() {
                                        $("#vehiculoDelete").val("<%=vehiculo.getVehiculoid()%>");
                                    }
                                    function activar<%=vehiculo.getVehiculoid()%>() {
                                        $("#vehiculoActive").val("<%=vehiculo.getVehiculoid()%>");
                                    }
                                    function Editar<%=vehiculo.getVehiculoid()%>(vehiculo) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addVehiculo.jsp",
                                            data: "idVehiculoEdit=" + vehiculo,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaVehiculo').style.display = 'none';
                                                document.getElementById('agregarVehiculo').style.display = 'none';
                                                document.getElementById('editarVehiculo').style.display = 'block';
                                                document.getElementById("placaEdit").focus();
                                                $("#aciones").html("Modificar Vehículo");
                                            }
                                        });
                                    }
                                    function cancelarEditVehiculo() {
                                        document.getElementById("editvehiculo").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaVehiculo').style.display = 'block';
                                        document.getElementById('editarVehiculo').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Vehículos");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarVehiculo" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Vehículo</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addvehiculo" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Vehiculo</label>
                                        <select class="form-control" id="tipo" name="tipoVehiculoId">
                                            <option hidden>Seleccionar el Tipo de Vehiculo</option>
                                            <%

                                                List<TipoVehiculo> listaTipoVehiculoAct = dao.listarTipoVehiculoAct();
                                                for (TipoVehiculo tipoVehiculo : listaTipoVehiculoAct) {

                                            %>
                                            <option value="<%=tipoVehiculo.getTipovehiculoid()%>"><%=tipoVehiculo.getNombretipovehiculo()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Vehiculo</label>
                                        <select class="form-control" id="tipo" name="MarcaId">
                                            <option hidden>Seleccionar el Tipo de Vehiculo</option>
                                            <%

                                                List<Marca> listaMarcaAct = dao.listarMarcaAct();
                                                for (Marca marca : listaMarcaAct) {

                                            %>
                                            <option value="<%=marca.getMarcaid()%>"><%=marca.getNombremarca()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="placaEdit">Placa</label>
                                        <input required type="text" maxlength="10" class="form-control" id="placaEdit" placeholder="Ingresar la Placa del Vehiculo" name="placa">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="descripcion">Descrippción</label>
                                        <textarea maxlength="300" class="form-control" rows="4" id="descripcion" placeholder="Descripción del Vehiculo" name="descripcion"></textarea>
                                        <input type="hidden" name="opcion" value="AddVehiculo">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarVehiculo()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Registrar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                </button>
                            </h4>
                        </form>
                    </div>
                </div>
            </div>
            <div id="editarVehiculo" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Vehículo</b></h4>
                    </div>
                    <%
                        List<Vehiculo> listaVehiculoEdit = dao.listarEditVehiculo(idVehiculoEdit);
                        for(Vehiculo vehiculoEditar : listaVehiculoEdit){
                    %>
                    <div class="panel-body">
                        <form id="editvehiculo" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoEdit">Tipo de Vehiculo</label>
                                        <select class="form-control" id="tipoEdit" name="tipoVehiculoId">
                                            <option hidden>Seleccionar el Tipo de Vehiculo</option>
                                            <%
                                                List<TipoVehiculo> listaTipoVehiculoActEdit = dao.listarTipoVehiculoAct();
                                                for (TipoVehiculo tipoVehiculoEdit : listaTipoVehiculoActEdit) {
                                            %>
                                            <option <% if(vehiculoEditar.getTipovehiculoid().equals(tipoVehiculoEdit.getTipovehiculoid())){%>selected<%}%> value="<%=tipoVehiculoEdit.getTipovehiculoid()%>"><%=tipoVehiculoEdit.getNombretipovehiculo()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="marcaEdit">Marca</label>
                                        <select class="form-control" id="marcaEdit" name="MarcaId">
                                            <option hidden>Seleccionar la Marca del Vehiculo</option>
                                            <%
                                                List<Marca> listaMarcaActEdit = dao.listarMarcaAct();
                                                for (Marca marcaEdit : listaMarcaActEdit) {
                                            %>
                                            <option <% if(vehiculoEditar.getMarcaid().equals(marcaEdit.getMarcaid())){%>selected<%}%> value="<%=marcaEdit.getMarcaid()%>"><%=marcaEdit.getNombremarca()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="placaEdit">Placa</label>
                                        <input value="<%=vehiculoEditar.getNumplaca()%>" required type="text" maxlength="10" class="form-control" id="placaEdit" placeholder="Ingresar la Placa del Vehiculo" name="placa">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="descripcionEdit">Descrippción</label>
                                        <input value="<%=vehiculoEditar.getDecripcion()%>" maxlength="300" class="form-control" id="descripcionEdit" placeholder="Descripción del Vehiculo" name="descripcion">
                                        <input type="hidden" name="opcion" value="EditVehiculo">
                                        <input type="hidden" name="id" value="<%=idVehiculoEdit%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditVehiculo()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Modificar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                </button>
                            </h4>
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="modal fade" id="delete">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #c71c22; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Vehículo?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="vehiculoDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteVehiculo">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-danger" type="submit">
                                        Eliminar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                    </button>
                                </h4>
                            </form>
                        </section>
                    </section>
                </section>
            </div>
            <div class="modal fade" id="activar">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #3b5998; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Activar este Vehículo?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="vehiculoActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarVehiculo">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-primary" type="submit">
                                        Activar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                    </button>
                                </h4>
                            </form>
                        </section>
                    </section>
                </section>
            </div>
        </div>
        <script type="text/javascript">
            $().ready(function () {
                $("#addvehiculo").validator({debug: true});
                $("#editvehiculo").validator({debug: true});
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
