<%-- 
    Document   : addMotivos
    Created on : 21/10/2016, 01:21:55 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Motivo"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idMotivoEdit = request.getParameter("idMotivoEdit"); idMotivoEdit = idMotivoEdit == null ? "" : idMotivoEdit;
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
                    <h4><b>Lista de Motivos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarMotivo()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaMotivo" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'motivos', '1')" type="text" class="form-control" placeholder="Buscar Motivos." aria-describedby="basic-addon1">
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
                            <table style="margin-top: 0px;" id="motivos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdMotivo</th>
                                        <th>Motivo</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;
                                        List<Motivo> listarMot = dao.listarMotivos();
                                        for (Motivo list : listarMot) {

                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=list.getMotivoid()%></td>
                                        <td><%=list.getNombremotivo()%></td>
                                        <td><%=list.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=list.getMotivoid()%>(<%=list.getMotivoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Motivo" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (list.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=list.getMotivoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Motivo" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (list.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=list.getMotivoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Motivo" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=list.getMotivoid()%>() {
                                        $("#motivoDelete").val("<%=list.getMotivoid()%>");
                                    }
                                    function activar<%=list.getMotivoid()%>() {
                                        $("#motivoActive").val("<%=list.getMotivoid()%>");
                                    }
                                    function Editar<%=list.getMotivoid()%>(motivo) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addMotivos.jsp",
                                            data: "idMotivoEdit=" + motivo,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaMotivo').style.display = 'none';
                                                document.getElementById('agregarMotivo').style.display = 'none';
                                                document.getElementById('editarMotivo').style.display = 'block';
                                                document.getElementById("motivoEdit").focus();
                                                $("#aciones").html("Modificar Motivo");
                                            }
                                        });
                                    }
                                    function cancelarEditMotivo() {
                                        document.getElementById("editmotivo").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaMotivo').style.display = 'block';
                                        document.getElementById('editarMotivo').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Motivos");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarMotivo" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Motivo</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addmotivo" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="motivo">Motivo</label>
                                        <input type="text" class="form-control" id="motivo" placeholder="Nombre del Motivo" name="nombres">
                                        <input type="hidden" name="opcion" value="AddMotivo">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarMotivo()"><!--  data-dismiss="modal" -->
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
            <div id="editarMotivo" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Motivo</b></h4>
                    </div>
                    <%
                        List<Motivo> listaMotivoEdit = dao.listarEditMotivos(idMotivoEdit);
                        for (Motivo motivoEditar : listaMotivoEdit) {
                    %>
                    <div class="panel-body">
                        <form id="editmotivo" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="motivoEdit">Motivo</label>
                                        <input value="<%=motivoEditar.getNombremotivo()%>" type="text" class="form-control" id="motivoEdit" placeholder="Nombre del Motivo" name="nombres">
                                        <input type="hidden" name="opcion" value="EditMotivo">
                                        <input type="hidden" name="id" value="<%=idMotivoEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditMotivo()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Motivo?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="motivoDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteMotivo">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Motivo?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="motivoActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarMotivo">
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
        </script> 
    </body>
</html>
