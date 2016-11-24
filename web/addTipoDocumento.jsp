<%-- 
    Document   : addTipoDocumento
    Created on : 21/10/2016, 01:24:51 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.TipoDocumento"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idTipoDocumentoEdit = request.getParameter("idTipoDocumentoEdit"); idTipoDocumentoEdit = idTipoDocumentoEdit == null ? "" : idTipoDocumentoEdit;
    String estadoTipoDocumento = request.getParameter("estadoTipoDocumento"); estadoTipoDocumento = estadoTipoDocumento == null?"1": estadoTipoDocumento;
    
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
                    <h4><b>Lista de Tipos de Documento</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoDocumento()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoDocumento" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'tipodocumentos', '1')" type="text" class="form-control" placeholder="Buscar Tipos de Documentos." aria-describedby="basic-addon1">
                            </div>
                        </article>
                         <script>
                            function enviar(){
                                $.ajax({
                                    type: "POST",
                                    url: "addTipoDocumento.jsp",
                                    data: "estadoTipoDocumento="+ $('select[name=estadoTipoDocumento]').val(),
                                    success: function (data) {
                                        $("#mantenimiento").html(data);
                                    }
                                });
                            };
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoTipoDocumento" class="form-control" name="estadoTipoDocumento" onchange="enviar()">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoTipoDocumento.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoTipoDocumento.equals("0")){%>selected<%}%> value="0">Inactivos</option>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="tipodocumentos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th>Tipo de Salida</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();

                                        int count = 0;

                                        List<TipoDocumento> listaTipoDoc = dao.listarTipoDocumento(estadoTipoDocumento);
                                        for (TipoDocumento tipodoc : listaTipoDoc) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tipodoc.getTipodocumentoid()%></td>
                                        <td><%=tipodoc.getNombredocumento()%></td>
                                        <td><%=tipodoc.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=tipodoc.getTipodocumentoid()%>(<%=tipodoc.getTipodocumentoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar el Tipo de Documento" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(tipodoc.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=tipodoc.getTipodocumentoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar el Tipo de Documento" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(tipodoc.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=tipodoc.getTipodocumentoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar el Tipo de Documento" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=tipodoc.getTipodocumentoid()%>() {
                                        $("#tipoDocumentoDelete").val("<%=tipodoc.getTipodocumentoid()%>");
                                    }
                                    function activar<%=tipodoc.getTipodocumentoid()%>() {
                                        $("#tipoDocumentoActive").val("<%=tipodoc.getTipodocumentoid()%>");
                                    }
                                    function Editar<%=tipodoc.getTipodocumentoid()%>(tipodocumento) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addTipoDocumento.jsp",
                                            data: "idTipoDocumentoEdit=" + tipodocumento,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaTipoDocumento').style.display = 'none';
                                                document.getElementById('agregarTipoDocumento').style.display = 'none';
                                                document.getElementById('editarTipoDocumento').style.display = 'block';
                                                document.getElementById("tipoDocumentoEdit").focus();
                                                $("#aciones").html("Modificar Tipo de Incidencia");
                                            }
                                        });
                                    }
                                    function cancelarEditTipoDocumento() {
                                        document.getElementById("edittipodocumento").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaTipoDocumento').style.display = 'block';
                                        document.getElementById('editarTipoDocumento').style.display = 'none';
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
            <div id="agregarTipoDocumento" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Tipo de Documento</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addtipodocumento" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipoDocumento">Tipo de Documento</label>
                                        <input required pattern="^[A-Za-záéíóúñÑ,. ]*" type="text" maxlength="30" class="form-control" id="tipoDocumento" placeholder="Nombre del Tipo de Documento" name="nombres">
                                        <input type="hidden" name="opcion" value="AddTipoDocumento">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                        
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoDocumento()"><!--  data-dismiss="modal" -->
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
            <div id="editarTipoDocumento" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Tipo de Documento</b></h4>
                    </div>
                    <%
                        List<TipoDocumento> listaTipoDocumentoEdit = dao.listarEditTipoDocumento(idTipoDocumentoEdit);
                        for (TipoDocumento tdEditar : listaTipoDocumentoEdit) {
                    %>
                    <div class="panel-body">
                        <form id="edittipodocumento" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipoDocumentoEdit">Nombre del Tipo de Documento</label>
                                        <input required pattern="^[A-Za-záéíóúñÑ,. ]*" value="<%=tdEditar.getNombredocumento()%>" type="text" class="form-control" id="tipoDocumentoEdit" placeholder="Nombre del Tipo de Documento" name="nombres">
                                        <input type="hidden" name="opcion" value="EditTipoDocumento">
                                        <input type="hidden" name="id" value="<%=idTipoDocumentoEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditTipoDocumento()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Documento?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoDocumentoDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTipoDocumento">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Tipo de Documento?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipoDocumentoActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTipoDocumento">
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
               $().ready(function () {
                $("#addtipodocumento").validator({debug: true});
                $("#edittipodocumento").validator({debug: true});
            });
        </script> 
    </body>
</html>
