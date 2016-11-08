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
<%
    String idTipoIncidenciaEdit = request.getParameter("idTipoIncidenciaEdit"); idTipoIncidenciaEdit = idTipoIncidenciaEdit == null ? "" : idTipoIncidenciaEdit;
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
                    <h4><b>Lista de Tipos de Incidencia</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoIncidencia()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoIncidencia" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'tipoincidencias', '1')" type="text" class="form-control" placeholder="Buscar Tipos de Incidencias." aria-describedby="basic-addon1">
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
                                        int count = 0;

                                        List<TipoIncidencia> listarTipoInc = dao.listarTipoIncidencia();
                                        for (TipoIncidencia tipoinc : listarTipoInc) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tipoinc.getTipoincidenciaid()%></td>
                                        <td><%=tipoinc.getNombretipoincidencia()%></td>
                                        <td><%=tipoinc.getDescripcion()%></td>
                                        <td><%=tipoinc.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=tipoinc.getTipoincidenciaid()%>(<%=tipoinc.getTipoincidenciaid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar el Tipo de Salida" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(tipoinc.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=tipoinc.getTipoincidenciaid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar el Tipo de Salida" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(tipoinc.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=tipoinc.getTipoincidenciaid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar el Tipo de Salida" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=tipoinc.getTipoincidenciaid()%>() {
                                        $("#tipoIncidenciaDelete").val("<%=tipoinc.getTipoincidenciaid()%>");
                                    }
                                    function activar<%=tipoinc.getTipoincidenciaid()%>() {
                                        $("#tipoIncidenciaActive").val("<%=tipoinc.getTipoincidenciaid()%>");
                                    }
                                    function Editar<%=tipoinc.getTipoincidenciaid()%>(tipoincidencia) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addTipoIncidencia.jsp",
                                            data: "idTipoIncidenciaEdit=" + tipoincidencia,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaTipoIncidencia').style.display = 'none';
                                                document.getElementById('agregarTipoIncidencia').style.display = 'none';
                                                document.getElementById('editarTipoIncidencia').style.display = 'block';
                                                document.getElementById("tipoIncidenciaEdit").focus();
                                                $("#aciones").html("Modificar Tipo de Incidencia");
                                            }
                                        });
                                    }
                                    function cancelarEditTipoIncidencia() {
                                        document.getElementById("edittipoincidencia").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaTipoIncidencia').style.display = 'block';
                                        document.getElementById('editarTipoIncidencia').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Tipos de Incidencias");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTipoIncidencia" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Tipo de Incidencia</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addtipoincidencia" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoIncidencia">Tipo de incidencia</label>
                                        <input type="text" class="form-control" id="tipoIncidencia" placeholder="Nombre del Tipo de Incidencia" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <textarea class="form-control" rows="4" id="descripcion" placeholder="Descripción del Tipo de Incidencia" name="descripcion"></textarea>
                                        <input type="hidden" name="opcion" value="AddTipoIncidencia">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoIncidencia()"><!--  data-dismiss="modal" -->
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
            <div id="editarTipoIncidencia" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Tipo de Incidencia</b></h4>
                    </div>
                    <%
                        List<TipoIncidencia> listaTipoIncidenciaEdit = dao.listarEditTipoIncidencia(idTipoIncidenciaEdit);
                        for (TipoIncidencia tiEditar : listaTipoIncidenciaEdit) {
                    %>
                    <div class="panel-body">
                        <form id="edittipoincidencia" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoIncidenciaEdit">Nombre del Tipo de incidencia</label>
                                        <input value="<%=tiEditar.getNombretipoincidencia()%>" type="text" class="form-control" id="tipoIncidenciaEdit" placeholder="Nombre del Tipo de Incidencia" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcionEdit">Descripción</label>
                                        <input value="<%=tiEditar.getDescripcion()%>" class="form-control" id="descripcionEdit" placeholder="Descripción del Tipo de Incidencia" name="descripcion">
                                        <input type="hidden" name="opcion" value="EditTipoIncidencia">
                                        <input type="hidden" name="id" value="<%=idTipoIncidenciaEdit%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditTipoIncidencia()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Incidencia?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoIncidenciaDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTipoIncidencia">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Tipo de Incidencia?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoIncidenciaActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTipoIncidencia">
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
