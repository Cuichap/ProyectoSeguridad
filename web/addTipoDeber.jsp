<%-- 
    Document   : addTipoDeber
    Created on : 20/10/2016, 10:17:26 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.TipoDeber"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idTipoDeberEdit = request.getParameter("idTipoDeberEdit"); idTipoDeberEdit = idTipoDeberEdit == null?"":idTipoDeberEdit;
    String estadoTipoDeber = request.getParameter("estadoTipoDeber"); estadoTipoDeber = estadoTipoDeber == null?"1":estadoTipoDeber;
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
                    <h4><b>Lista de Tipos de Deberes</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoDeber()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoDeber" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'tipodeber', '1')" type="text" class="form-control" placeholder="Buscar Tipos de Deber." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            $(document).ready(function (){
                                    $('select[name=estadoTipoDeber]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addTipoDeber.jsp",
                                            data: "estadoTipoDeber="+ $('select[name=estadoTipoDeber]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoTipoDeber" class="form-control" name="estadoTipoDeber">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoTipoDeber.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoTipoDeber.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="tipodeber" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdTipoDeber</th>
                                        <th>Tipo de Deber</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;

                                        List<TipoDeber> listarTipod = dao.listarTipoDeber(estadoTipoDeber);
                                        for (TipoDeber tipdeb : listarTipod) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tipdeb.getTipodeberid()%></td>
                                        <td><%=tipdeb.getNombretipodeber()%></td>
                                        <td><%=tipdeb.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=tipdeb.getTipodeberid()%>(<%=tipdeb.getTipodeberid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Tipo de Deber" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <%if(tipdeb.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=tipdeb.getTipodeberid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Tipo de Deber" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(tipdeb.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=tipdeb.getTipodeberid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Tipo de Deber" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=tipdeb.getTipodeberid()%>() {
                                        $("#TipoDeberDelete").val("<%=tipdeb.getTipodeberid()%>");
                                    }
                                    function activar<%=tipdeb.getTipodeberid()%>() {
                                        $("#TipoDeberActive").val("<%=tipdeb.getTipodeberid()%>");
                                    }
                                    function Editar<%=tipdeb.getTipodeberid()%>(tipodeber) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addTipoDeber.jsp",
                                            data: "idTipoDeberEdit=" + tipodeber,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaTipoDeber').style.display = 'none';
                                                document.getElementById('agregarTipoDeber').style.display = 'none';
                                                document.getElementById('editarTipoDeber').style.display = 'block';
                                                document.getElementById("tipoEdit").focus();
                                                $("#aciones").html("Modificar Tipo de Deber");
                                            }
                                        });
                                    }
                                    function cancelarEditDeber() {
                                        document.getElementById("edittipodeber").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaTipoDeber').style.display = 'block';
                                        document.getElementById('editarTipoDeber').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Tipos de Deber");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTipoDeber" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Tipo de Deber</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addtipodeber" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Deber</label>
                                        <input required maxlength="30" type="text" class="form-control" id="tipo" placeholder="Nombre del Tipo de Deber" name="nombres">
                                        <input type="hidden" name="opcion" value="AddTipoDeber">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoDeber()"><!--  data-dismiss="modal" -->
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
            <div id="editarTipoDeber" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Tipo de Deber</b></h4>
                    </div>
                    <%
                        List<TipoDeber> listaTipoDeberEdit = dao.listarEditTipoDeber(idTipoDeberEdit);
                        for(TipoDeber tdEditar : listaTipoDeberEdit){
                    %>
                    <div class="panel-body">
                        <form id="edittipodeber" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipoEdit">Tipo de Deber</label>
                                        <input required maxlength="30" value="<%=tdEditar.getNombretipodeber()%>" type="text" class="form-control" id="tipoEdit" placeholder="Nombre del Tipo de Deber" name="nombres">
                                        <input type="hidden" name="opcion" value="EditTipoDeber">
                                        <input type="hidden" name="id" value="<%=idTipoDeberEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditDeber()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Deber?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="TipoDeberDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTipoDeber">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Tipo de Deber?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="TipoDeberActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTipoDeber">
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
                $("#addtipodeber").validator({debug: true});
                $("#edittipodeber").validator({debug: true});
            });
        </script> 
    </body>
</html>
