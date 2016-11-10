<%-- 
    Document   : addTipoSalida
    Created on : 21/10/2016, 01:22:13 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.entidad.TipoPermiso"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idTippoSalidaEdit = request.getParameter("idTippoSalidaEdit"); idTippoSalidaEdit = idTippoSalidaEdit == null ? "" : idTippoSalidaEdit;
    String estadoTipoSalida = request.getParameter("estadoTipoSalida"); estadoTipoSalida = estadoTipoSalida == null ? "1" : estadoTipoSalida;
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
                    <h4><b>Lista de Tipos de Salida</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoSalida()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoSalida" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'tiposalidas', '1')" type="text" class="form-control" placeholder="Buscar Tipos de Salidas." aria-describedby="basic-addon1">
                            </div>
                        </article>
                         <script>
                            $(document).ready(function (){
                                    $('select[name=estadoTipoSalida]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addTipoSalida.jsp",
                                            data: "estadoTipoSalida="+ $('select[name=estadoTipoSalida]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                 <select id="estadoTipoSalida" class="form-control" name="estadoTipoSalida">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoTipoSalida.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoTipoSalida.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="tiposalidas" class="table table-bordered table-condensed table-hover table-responsive">
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
                                        int count = 0;

                                        List<TipoPermiso> listarPermiso = dao.listarSalida(estadoTipoSalida);
                                        for (TipoPermiso tipoper : listarPermiso) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tipoper.getTipopermisoid()%></td>
                                        <td><%=tipoper.getNombretipopermiso()%></td>
                                        <td><%=tipoper.getDescripcion()%></td>
                                        <td><%=tipoper.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=tipoper.getTipopermisoid()%>(<%=tipoper.getTipopermisoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar el Tipo de Salida" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(tipoper.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=tipoper.getTipopermisoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar el Tipo de Salida" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(tipoper.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=tipoper.getTipopermisoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar el Tipo de Salida" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=tipoper.getTipopermisoid()%>() {
                                        $("#tipoSalidaDelete").val("<%=tipoper.getTipopermisoid()%>");
                                    }
                                    function activar<%=tipoper.getTipopermisoid()%>() {
                                        $("#tipoSalidaActive").val("<%=tipoper.getTipopermisoid()%>");
                                    }
                                    function Editar<%=tipoper.getTipopermisoid()%>(tiposalida) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addTipoSalida.jsp",
                                            data: "idTippoSalidaEdit=" + tiposalida,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaTipoSalida').style.display = 'none';
                                                document.getElementById('agregarTipoSalida').style.display = 'none';
                                                document.getElementById('editarTipoSalida').style.display = 'block';
                                                document.getElementById("tipoSalidaEdit").focus();
                                                $("#aciones").html("Modificar Tipo de Salida");
                                            }
                                        });
                                    }
                                    function cancelarEditTipoSalida() {
                                        document.getElementById("edittiposalida").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaTipoSalida').style.display = 'block';
                                        document.getElementById('editarTipoSalida').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Tipos de Salidas");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTipoSalida" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Tipo de Salida</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addtiposalida" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoSalida">Tipo de Salida</label>
                                        <input type="text" class="form-control" id="tipoSalida" placeholder="Nombre del Tipo de Salida" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <textarea class="form-control" rows="4" id="descripcion" placeholder="Descripción del Tipo de Salida" name="descripcion"></textarea>
                                        <input type="hidden" name="opcion" value="AddTipoSalida">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoSalida()"><!--  data-dismiss="modal" -->
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
            <div id="editarTipoSalida" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Tipo de Salida</b></h4>
                    </div>
                    <%
                        List<TipoPermiso> listaTipoSalidaEdit = dao.listarEditSalida(idTippoSalidaEdit);
                        for (TipoPermiso tpEditar : listaTipoSalidaEdit) {
                    %>
                    <div class="panel-body">
                        <form id="edittiposalida" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoSalidaEdit">Nombre del Tipo de Salida</label>
                                        <input value="<%=tpEditar.getNombretipopermiso()%>" type="text" class="form-control" id="tipoSalidaEdit" placeholder="Nombre del Tipo de Salida" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcionEdit">Descripción</label>
                                        <input value="<%=tpEditar.getDescripcion()%>" class="form-control" id="descripcionEdit" placeholder="Descripción del Tipo de Salida" name="descripcion">
                                        <input type="hidden" name="opcion" value="EditTipoSalida">
                                        <input type="hidden" name="id" value="<%=idTippoSalidaEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditTipoSalida()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Salida?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoSalidaDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTipoSalida">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Tipo de Salida?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoSalidaActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTipoSalida">
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
            $(document).ready(function (){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
