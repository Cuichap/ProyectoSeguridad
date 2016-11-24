<%-- 
    Document   : addResponsabilidad
    Created on : 21/10/2016, 01:21:29 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.SeguridadDaoImpl"%>
<%@page import="rest.modelo.dao.SeguridadDao"%>
<%@page import="rest.modelo.entidad.Turno"%>
<%@page import="rest.modelo.entidad.Deber"%>
<%@page import="rest.modelo.entidad.Responsabilidad"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idDeberEdit = request.getParameter("idDeberEdit"); idDeberEdit = idDeberEdit == null ? "" : idDeberEdit;
    String idUsuarioEdit = request.getParameter("idUsuarioEdit"); idUsuarioEdit = idUsuarioEdit == null ? "" : idUsuarioEdit;
    String idTurnoEdit = request.getParameter("idTurnoEdit"); idTurnoEdit = idTurnoEdit == null ? "" : idTurnoEdit;
%>
<!DOCTYPE html>
<%
    String estadoResponsabilidad = request.getParameter("estadoResponsabilidad"); estadoResponsabilidad = estadoResponsabilidad == null ? "1" : estadoResponsabilidad;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    </head>
    <body>
        <div class="col-sm-12">
            <br>
            <section id="lista" class="col-sm-12 well well-sm backcolor" style="display: block; margin-bottom: -50px;">
                <article class="col-sm-6" style="color: white;">
                    <h4><b>Lista de Responsabilidades</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarResponsabilidad()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaResponsabilidad" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'responsabilidades', '1')" type="text" class="form-control" placeholder="Buscar Responsabilidades." aria-describedby="basic-addon1">
                            </div>
                        </article>
                         <script>
                            $(document).ready(function (){
                                    $('select[name=estadoResponsabilidad]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addResponsabilidad.jsp",
                                            data: "estadoResponsabilidad="+ $('select[name=estadoResponsabilidad]').val(),
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoResponsabilidad" class="form-control" name="estadoResponsabilidad">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoResponsabilidad.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoResponsabilidad.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="responsabilidades" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdDeber</th>
                                        <th hidden>IdUsuario</th>
                                        <th hidden>IdTurno</th>
                                        <th>Usuario</th>
                                        <th>Responsabilidad</th>
                                        <th>Turno</th>
                                        <th>Fecha</th>
                                        <th hidden>IdUsuarioReg</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        SeguridadDao sdaoDao = new SeguridadDaoImpl();
                                        
                                        int count = 0;

                                        List<Responsabilidad> listarResponsabilidad = sdaoDao.listarResponsabilidad(estadoResponsabilidad);
                                        for (Responsabilidad resp : listarResponsabilidad) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=resp.getDeberid()%></td>
                                        <td hidden><%=resp.getUsuarioid()%></td>
                                        <td hidden><%=resp.getTurnoid()%></td>
                                        <td><%=resp.getNomresponsab()%></td>                                        
                                        <td><%=resp.getNomdeber()%></td>
                                        <td><%=resp.getNomturno()%></td>
                                        <td><%=resp.getFecha()%></td>
                                        <td hidden><%=resp.getUserIdReg()%></td>
                                        <td><%=resp.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>(<%=resp.getDeberid()%>, <%=resp.getUsuarioid()%>, <%=resp.getTurnoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar la Responsabilidad" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (resp.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar la Responsabilidad" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (resp.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar la Responsabilidad" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>() {
                                        $("#TipoDeberIdDelete").val("<%=resp.getDeberid()%>");
                                        $("#TipoUsuarioIdDelete").val("<%=resp.getUsuarioid()%>");
                                        $("#TipoTurnoIdDelete").val("<%=resp.getTurnoid()%>");
                                    }
                                    function Editar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>(deber, usuario, turno) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addResponsabilidad.jsp",
                                            data: "idDeberEdit=" + deber + "&idUsuarioEdit=" + usuario + "&idTurnoEdit=" + turno,
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaResponsabilidad').style.display = 'none';
                                                document.getElementById('agregarResponsabilidad').style.display = 'none';
                                                document.getElementById('editarResponsabilidad').style.display = 'block';
                                                document.getElementById("fechaEdit").focus();
                                                $("#aciones").html("Modificar Responsabilidad");
                                            }
                                        });
                                    }
                                    function cancelarEditResponsabilidad() {
                                        document.getElementById("editresponsabilidad").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaResponsabilidad').style.display = 'block';
                                        document.getElementById('editarResponsabilidad').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de responsabilidades");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarResponsabilidad" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos de la Responsabilidad</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addresponsabilidad" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <article class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Buscar Usuario</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                            <input id="buscarusuario" autofocus type="text" class="form-control" placeholder="Buscar Persona" describedby="basic-addon1">
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="usuario">Usuario</label>
                                        <input type="text" class="form-control" id="usuario" placeholder="Nombre del Usuario" name="usuario">
                                        <input type="hidden" name="usuarioId" value="1">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deber">Deber</label>
                                        <select class="form-control" id="deber" name="deberId">
                                            <option hidden>Seleccionar el Deber</option>
                                            <%

                                                List<Deber> listaDeberAct = dao.listarDeberAct();
                                                for (Deber deber : listaDeberAct) {

                                            %>
                                            <option value="<%=deber.getDeberid()%>"><%=deber.getNombredeber()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deber">Turno</label>
                                        <select class="form-control" id="deber" name="turnoId">
                                            <option hidden>Seleccionar el Turno</option>
                                            <%

                                                List<Turno> listaTurnoAct = dao.listarTurnoAct();
                                                for (Turno turno : listaTurnoAct) {

                                            %>
                                            <option value="<%=turno.getTurnoid()%>"><%=turno.getNombreturno()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fecha">Fecha</label>
                                        <input type="date" class="form-control" id="fecha" placeholder="Ingrese la Fecha" name="fechaDeber">
                                        <input type="hidden" name="opcion" value="AddResponsabilidad">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarResponsabilidad()"><!--  data-dismiss="modal" -->
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
            <div id="editarResponsabilidad" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos de la Responsabilidad</b></h4>
                    </div>
                    <%  
                        List<Responsabilidad> listaEditResponsabilidadesEdit = sdaoDao.listarEditResponsabilidad(idDeberEdit, idUsuarioEdit, idTurnoEdit);
                        for (Responsabilidad responsabilidadEdit : listaEditResponsabilidadesEdit) {
                    %>
                    <div class="panel-body">
                        <form id="editresponsabilidad" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="usuarioEdit">Usuario</label>
                                        <input type="text" value="<%=responsabilidadEdit.getNomresponsab()%>" disabled class="form-control" id="usuarioEdit" placeholder="Nombre del Usuario" name="usuario">
                                        <input type="hidden" value="<%=responsabilidadEdit.getUsuarioid()%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deberEdit">Deber</label>
                                        <select class="form-control" disabled id="deberEdit" name="deberId">
                                            <option hidden>Seleccionar el Deber</option>
                                            <%

                                                List<Deber> listaDeberActEdit = dao.listarDeberAct();
                                                for (Deber deberEdit : listaDeberActEdit) {

                                            %>
                                            <option <% if(responsabilidadEdit.getDeberid().equals(deberEdit.getDeberid())){%>selected<%}%> value="<%=deberEdit.getDeberid()%>"><%=deberEdit.getNombredeber()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deberEdit">Turno</label>
                                        <select class="form-control" disabled id="deberEdit" name="turnoId">
                                            <option hidden>Seleccionar el Turno</option>
                                            <%

                                                List<Turno> listaTurnoActEdit = dao.listarTurnoAct();
                                                for (Turno turnoEdit : listaTurnoActEdit) {

                                            %>
                                            <option <% if(responsabilidadEdit.getTurnoid().equals(turnoEdit.getTurnoid())){%>selected<%}%> value="<%=turnoEdit.getTurnoid()%>"><%=turnoEdit.getNombreturno()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaEdit">Fecha</label>
                                        <input type="date" value="<%=responsabilidadEdit.getFecha()%>" class="form-control" id="fechaEdit" placeholder="Ingrese la Fecha" name="fechaDeber">
                                        <input type="hidden" name="opcion" value="EditResponsabilidad">
                                        <input type="hidden" name="id" value="<%=idDeberEdit%>">
                                        <input type="hidden" name="iduser" value="<%=idUsuarioEdit%>">
                                        <input type="hidden" name="idturno" value="<%=idTurnoEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditResponsabilidad()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar la Responsabilidad de este Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="TipoDeberIdDelete" name="id">
                                    <input type="hidden" id="TipoUsuarioIdDelete" name="iduser">
                                    <input type="hidden" id="TipoTurnoIdDelete" name="idturno">
                                    <input type="hidden" name="opcion" value="DeleteResponsabilidad">
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
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
