<%-- 
    Document   : addTipoVehiculo
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.TipoVehiculo"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idTipoVehiculoEdit = request.getParameter("idTipoVehiculoEdit"); idTipoVehiculoEdit = idTipoVehiculoEdit == null?"":idTipoVehiculoEdit;
    String estadoTipoVehiculo = request.getParameter("estadoTipoVehiculo"); estadoTipoVehiculo = estadoTipoVehiculo == null?"1":estadoTipoVehiculo;
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
                    <h4><b>Lista de Tipos de Vehiculos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoVehiculo()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoVehiculo" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'tipoVehiculo', '1')" type="text" class="form-control" placeholder="Buscar Tipos de Vehículo." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            $(document).ready(function (){
                                    $('select[name=estadoTipoVehiculo]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addTipoVehiculo.jsp",
                                            data: "estadoTipoVehiculo="+ $('select[name=estadoTipoVehiculo]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoTipoVehiculo" class="form-control" name="estadoTipoVehiculo">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoTipoVehiculo.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoTipoVehiculo.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="tipoVehiculo" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>TipoVehiculoId</th>
                                        <th>Tipo de Vehículo</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody><%
                                    MantenimientoDao dao = new MantenimientoDaoImpl();

                                    int count = 0;
                                    List<TipoVehiculo> listaTipoVehiculo = dao.listarTipoVehiculo(estadoTipoVehiculo);
                                    for (TipoVehiculo tpvehiculo : listaTipoVehiculo) {
                                        count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tpvehiculo.getTipovehiculoid()%></td>
                                        <td><%=tpvehiculo.getNombretipovehiculo()%></td>
                                        <td><%=tpvehiculo.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=tpvehiculo.getTipovehiculoid()%>(<%=tpvehiculo.getTipovehiculoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Tipo de Vehículo" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (tpvehiculo.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=tpvehiculo.getTipovehiculoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Tipo de Vehículo" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (tpvehiculo.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=tpvehiculo.getTipovehiculoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Tipo de Vehículo" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=tpvehiculo.getTipovehiculoid()%>() {
                                        $("#tipoVehiculoDelete").val("<%=tpvehiculo.getTipovehiculoid()%>");
                                    }
                                    function activar<%=tpvehiculo.getTipovehiculoid()%>() {
                                        $("#tipoVehiculoActive").val("<%=tpvehiculo.getTipovehiculoid()%>");
                                    }
                                    function Editar<%=tpvehiculo.getTipovehiculoid()%>(tipovehiculo) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addTipoVehiculo.jsp",
                                            data: "idTipoVehiculoEdit=" + tipovehiculo,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaTipoVehiculo').style.display = 'none';
                                                document.getElementById('agregarTipoVehiculo').style.display = 'none';
                                                document.getElementById('editarTipoVehiculo').style.display = 'block';
                                                document.getElementById("nombreTipoVehiculoEdit").focus();
                                                $("#aciones").html("Modificar Tipo de Vehículo");
                                            }
                                        });
                                    }
                                    function cancelarEditTipoVehiculo() {
                                        document.getElementById("edittipovehiculo").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaTipoVehiculo').style.display = 'block';
                                        document.getElementById('editarTipoVehiculo').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Tipos de Vehículo");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTipoVehiculo" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Tipo de Vehículo</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addtipovehiculo" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipo">Tipo de Vehículo</label>
                                        <input type="text" pattern="^[A-Za-záéíóú ]*" maxlength="20" class="form-control" id="tipo" placeholder="Nombre del Tipo de Vehículo" name="nombres" required>
                                        <input type="hidden" name="opcion" value="AddTipoVehiculo">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoVehiculo()"><!--  data-dismiss="modal" -->
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
            <div id="editarTipoVehiculo" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Tipo de Vehículo</b></h4>
                    </div>
                    <%
                        List<TipoVehiculo> listaTipoVehiculoEdit = dao.listarEditTipoVehiculo(idTipoVehiculoEdit);
                        for(TipoVehiculo tvEditar : listaTipoVehiculoEdit){
                    %>
                    <div class="panel-body">
                        <form id="edittipovehiculo" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="nombreTipoVehiculoEdit">Nombre del Tipo de Vehículo</label>
                                        <input value="<%=tvEditar.getNombretipovehiculo()%>" type="text" pattern="^[A-Za-záéíóú ]*" maxlength="20" class="form-control" id="nombreTipoVehiculoEdit" placeholder="Nombre del Tipo de Vehículo" name="nombres" required>
                                        <input type="hidden" name="opcion" value="EditTipoVehiculo">
                                        <input type="hidden" name="id" value="<%=idTipoVehiculoEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditTipoVehiculo()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Vehículo?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoVehiculoDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTipoVehiculo">
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Vehículo?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoVehiculoActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTipoVehiculo">
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
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
            $().ready(function () {
                $("#addtipovehiculo").validator({debug: true});
                $("#edittipovehiculoEdit").validator({debug: true});
            });
        </script>
    </body>
</html>
