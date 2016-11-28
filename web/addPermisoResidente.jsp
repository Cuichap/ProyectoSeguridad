<%-- 
    Document   : addPermisoResidente
    Created on : 10/11/2016, 09:29:04 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.UsuarioPermisoResident"%>
<%@page import="rest.modelo.entidad.TipoPermiso"%>
<%@page import="rest.modelo.entidad.Motivo"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.UsuarioPermisoResident"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.AddPermisosDaoImpl"%>
<%@page import="rest.modelo.dao.AddPermisosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idPermisoResEdit = request.getParameter("idPermisoResEdit"); idPermisoResEdit = idPermisoResEdit == null ? "" : idPermisoResEdit;
    String user = request.getParameter("user"); user = user == null ? "" : user;
    String estadoPermisoRes = request.getParameter("estadoPermisoRes"); estadoPermisoRes = estadoPermisoRes == null ? "1" : estadoPermisoRes;
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
                    <h4><b>Lista de Permisos Solicitados</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="AddPermisoResidente()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaPermisoResidente" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div  class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'perResidente', '1')" type="text" class="form-control" placeholder="Buscar Persona." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            function enviar(){
                                $.ajax({
                                    type: "POST",
                                    url: "addPermisoResidente.jsp",
                                    data: "estadoPermisoRes="+ $('select[name=estadoPermmisoResidente]').val(),
                                    success: function (data) {
                                        $("#permisos").html(data);
                                    }
                                });
                            };
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoPersona" class="form-control" name="estadoPermmisoResidente" onchange="enviar()">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoPermisoRes.equals("2")){%>selected<%}%> value="2">Aceptados</option>
                                    <option <% if(estadoPermisoRes.equals("0")){%>selected<%}%> value="0">Rechazados</option>
                                    <option <% if(estadoPermisoRes.equals("1")){%>selected<%}%> value="1">En Proceso</option>
                                    <option <% if(estadoPermisoRes.equals("3")){%>selected<%}%> value="3">Inactivo</option>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="perResidente" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>Id Usuario</th>
                                        <th>Nombres</th>
                                        <th hidden>Id Permiso</th>
                                        <th hidden>Id Tipo Permiso</th>
                                        <th>Permiso</th>
                                        <th hidden>Id Motivo</th>
                                        <th>Motivo</th>
                                        <th>Otros</th>
                                        <th>Lugar</th>
                                        <th>Salida</th>
                                        <th>Entrada</th>
                                        <th>Estado</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        AddPermisosDao dao = new AddPermisosDaoImpl();
                                        MantenimientoDao md = new MantenimientoDaoImpl();

                                        int count = 0;

                                        List<UsuarioPermisoResident> listaUsuarioPerm = dao.listarPermisoResidente(idUsuario, estadoPermisoRes);
                                        for (UsuarioPermisoResident up : listaUsuarioPerm) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=up.getUsuarioId()%></td>
                                        <td><%=up.getNombres()%> <%=up.getApellidos()%></td>
                                        <td hidden><%=up.getPermisoId()%></td>
                                        <td hidden><%=up.getTipoPermisoId()%></td>
                                        <td><%=up.getNombreTipoPermiso()%></td>
                                        <td hidden><%=up.getMotivoId()%></td>
                                        <td><%=up.getNombreMotivo() %></td>
                                        <td><%=up.getOtros()%></td>
                                        <td><%=up.getLugar()%></td>
                                        <td><%=up.getFechaSalida()%> -- <%=up.getHoraSalida()%></td>
                                        <td><%=up.getFechaEntrada()%> -- <%=up.getHoraEntrada()%></td>
                                        <td><%=up.getEstado()%></td>
                                        <td align="center">
                                            <% if (up.getEstado().equals("En Proceso")) {%>
                                            <a style="cursor: pointer;" onclick="Editar<%=up.getPermisoId()%><%=up.getUsuarioId()%>(<%=up.getPermisoId()%>, <%=up.getUsuarioId()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Permiso" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                                &nbsp;&nbsp;&nbsp;
                                            <%} if (up.getEstado().equals("En Proceso") || up.getEstado().equals("Aceptado")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=up.getPermisoId()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Permiso" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if (up.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="Activar<%=up.getPermisoId()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Permiso" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=up.getPermisoId()%>() {
                                        $("#permUserDelete").val("<%=up.getPermisoId()%>");
                                    }
                                    function Activar<%=up.getPermisoId()%>() {
                                        $("#permUserActive").val("<%=up.getPermisoId()%>");
                                    }
                                    function Editar<%=up.getPermisoId()%><%=up.getUsuarioId()%>(permisoResident, user) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addPermisoResidente.jsp",
                                            data: "idPermisoResEdit=" + permisoResident + "&user=" + user,
                                            success: function (data) {
                                                $("#permisos").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaPermisoResidente').style.display = 'none';
                                                document.getElementById('editarPermisoResident').style.display = 'block';
                                                document.getElementById("otrosEdit").focus();
                                                $("#aciones").html("Modificar Permiso");
                                            }
                                        });
                                    }
                                    function cancelarEditPermisoResidente() {
                                        document.getElementById("editpermisoresid").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaPermisoResidente').style.display = 'block';
                                        document.getElementById('editarPermisoResident').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Permisos Solicitados");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                            <script>
                                function AddPermisoResidente() {
                                    document.getElementById('lista').style.display = 'none';
                                    document.getElementById('listaPermisoResidente').style.display = 'none';
                                    document.getElementById('agregarPermisoResident').style.display = 'block';
                                    document.getElementById("otros").focus();
                                    $("#aciones").html("Agregar Permiso");
                                }
                                function cancelarAddPermisoResidente() {
                                    document.getElementById("addpermisoresid").reset();
                                    document.getElementById('lista').style.display = 'block';
                                    document.getElementById('listaPermisoResidente').style.display = 'block';
                                    document.getElementById('agregarPermisoResident').style.display = 'none';
                                    document.getElementById("buscador").focus();
                                    $("#aciones").html("Lista de Permisos Solicitados");
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarPermisoResident" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h4><b>Ingresar los Datos del Permiso</b></h4>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="addpermisoresid" class="form-signin" role="form" method="post" action="usuariopermiso">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoperm">Tipo de Permiso</label>
                                        <select required class="form-control" id="tipoperm" name="tipoPermisoId">
                                            <option hidden>Seleccionar Tipo de Permiso</option>
                                            <%
                                                List<TipoPermiso> listaTipoPermisoAct = md.listarTiipoPermisoAct();
                                                for(TipoPermiso tipoPermiso : listaTipoPermisoAct){
                                            %>
                                            <option value="<%=tipoPermiso.getTipopermisoid()%>"><%=tipoPermiso.getNombretipopermiso()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipomot">Motivo</label>
                                        <select required class="form-control" id="tipomot" name="MotivoId">
                                            <option hidden>Seleccionar el Motivo</option>
                                            <%
                                                List<Motivo> listaMotivoAct = md.listarMotivoAct();
                                                for(Motivo motivo : listaMotivoAct){
                                            %>
                                            <option value="<%=motivo.getMotivoid()%>"><%=motivo.getNombremotivo()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="otros">Otros</label>
                                        <input type="text" pattern="^[A-Za-záéíóúñÑ ][A-Za-záéíóúñÑ ]*" maxlength="39" class="form-control" id="otros" placeholder="Otros Motivos" name="otros" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="lugar">Lugar</label>
                                        <input required type="text" pattern="^[A-Za-záéíóúñÑ ][A-Za-záéíóúñÑ ]*" maxlength="39" class="form-control" id="lugar" placeholder="Lugar" name="lugar" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalida">Fecha de Salida</label>
                                        <input type="date" class="form-control" id="fechasalida" placeholder="Ingrese la Fecha de Salida" name="fechasalida" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalida">Hora de Salida</label>
                                        <input type="time" class="form-control" id="horasalida" placeholder="Ingresar la hora de Salida" name="horasalida" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaEntrada">Fecha de Entrada</label>
                                        <input type="date" class="form-control" id="fechaEntrada" placeholder="Ingrese la Fecha de Entrada" name="fechaEntrada" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaEntrada">Hora de Entrada</label>
                                        <input type="time" class="form-control" id="horaEntrada" placeholder="Ingresar la Hora de Entrada" name="horaEntrada" required>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="opcion" value="AddPermisoResidente">
                            <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                            
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarAddPermisoResidente()"><!--  data-dismiss="modal" -->
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
            <div id="editarPermisoResid" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso </b></h4>
                    </div>
                    <%
                        List<UsuarioPermisoResident> listaEditPerRes = dao.listarEditPermisoResidente(idPermisoResEdit, user);
                        for(UsuarioPermisoResident usres : listaEditPerRes){
                    %>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="editpermisoresidente" class="form-signin" role="form" method="post" action="usuariopermiso">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipopermEdit">Tipo de Permiso</label>
                                        <select required class="form-control" id="tipopermEdit" name="tipoPermisoId">
                                            <option hidden>Seleccionar Tipo de Permiso</option>
                                            <%
                                                List<TipoPermiso> listaTipoPermisoEditAct = md.listarTiipoPermisoAct();
                                                for(TipoPermiso tipoPermisoEdit : listaTipoPermisoEditAct){
                                            %>
                                            <option <% if(usres.getTipoPermisoId().equals(tipoPermisoEdit.getTipopermisoid())){%>selected<%}%> value="<%=tipoPermisoEdit.getTipopermisoid()%>"><%=tipoPermisoEdit.getNombretipopermiso()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipomotEdit">Motivo</label>
                                        <select required class="form-control" id="tipomotEdit" name="MotivoId">
                                            <option hidden>Seleccionar el Motivo</option>
                                            <%
                                                List<Motivo> listaMotivoEditAct = md.listarMotivoAct();
                                                for(Motivo motivoEdit : listaMotivoEditAct){
                                            %>
                                            <option <% if(usres.getMotivoId().equals(motivoEdit.getMotivoid())){%>selected<%}%> value="<%=motivoEdit.getMotivoid()%>"><%=motivoEdit.getNombremotivo()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="otrosEdit">Otros</label>
                                        <input value="<%=usres.getOtros()%>" type="text" pattern="^[A-Za-záéíóúñÑ ][A-Za-záéíóúñÑ ]*" maxlength="39" class="form-control" id="otrosEdit" placeholder="Otros Motivos" name="otros" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="lugarEdit">Lugar</label>
                                        <input value="<%=usres.getLugar()%>" required type="text" pattern="^[A-Za-záéíóúñÑ ][A-Za-záéíóúñÑ ]*" maxlength="39" class="form-control" id="lugarEdit" placeholder="Lugar" name="lugar" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidaEdit">Fecha de Salida</label>
                                        <input value="<%=usres.getFechaSalida()%>" type="date" class="form-control" id="fechasalidaEdit" placeholder="Ingrese la Fecha de Salida" name="fechasalida" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidaEdit">Hora de Salida</label>
                                        <input value="<%=usres.getHoraSalida()%>" type="time" class="form-control" id="horasalidaEdit" placeholder="Ingresar la hora de Salida" name="horasalida" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaEntradaEdit">Fecha de Entrada</label>
                                        <input value="<%=usres.getFechaEntrada()%>" type="date" class="form-control" id="fechaEntradaEdit" placeholder="Ingrese la Fecha de Entrada" name="fechaEntrada" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaEntradaEdit">Hora de Entrada</label>
                                        <input value="<%=usres.getHoraEntrada() %>" type="time" class="form-control" id="horaEntradaEdit" placeholder="Ingresar la Hora de Entrada" name="horaEntrada" required>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="opcion" value="EditarPermisoResidente">
                            <input type="hidden" name="id" value="<%=idPermisoResEdit%>">
                            <input type="hidden" name="idUserReg" value="<%=idUsuario%>">

                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditPermisoResidente()"><!--  data-dismiss="modal" -->
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
        </div>
        <div class="modal fade" id="delete">
            <section class="modal-dialog modal-md">
                <section class="modal-content">
                    <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #c71c22; color: white;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                        <h3 align="center"><span><b>¿Está seguro de Eliminar este Permiso?</b></span></h3>
                    </section>
                    <section class="modal-body">
                        <form class="form-signin" role="form" method="post" action="usuariopermiso">
                            <div class="row">
                                <input type="hidden" id="permUserDelete" name="id">
                                <input type="hidden" name="opcion" value="DeletePermisoResidente">
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
                        <h3 align="center"><span><b>¿Está seguro de Activar este Permiso?</b></span></h3>
                    </section>
                    <section class="modal-body">
                        <form class="form-signin" role="form" method="post" action="usuariopermiso">
                            <div class="row">
                                <input type="hidden" id="permUserActive" name="id">
                                <input type="hidden" name="opcion" value="ActivarPermisoResidente">
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
        <script type="text/javascript">
            $().ready(function () {
                $("#addpermisoresidente").validator({debug: true});
                $("#editpermisoresidente").validator({debug: true});
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>                                
    </body>

</html>
