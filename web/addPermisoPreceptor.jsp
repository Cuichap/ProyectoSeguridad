<%-- 
    Document   : addPermisoPreceptor
    Created on : 10/11/2016, 10:54:09 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.TipoPermiso"%>
<%@page import="rest.modelo.entidad.Motivo"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.UsuarioPermisoResident"%>
<%@page import="rest.modelo.daoimpl.AddPermisosDaoImpl"%>
<%@page import="rest.modelo.dao.AddPermisosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idPermisoRes = request.getParameter("idPermisoRes"); idPermisoRes = idPermisoRes == null ? "" : idPermisoRes;
    String UsuarioRes = request.getParameter("UsuarioRes"); UsuarioRes = UsuarioRes == null ? "" : UsuarioRes;
    String estadoPermisoComp = request.getParameter("estadoPermisoComp"); estadoPermisoComp = estadoPermisoComp == null ? "1" : estadoPermisoComp;
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
                                    url: "addPermisoPreceptor.jsp",
                                    data: "estadoPermisoComp="+ $('select[name=estadoPermmisocompleto]').val(),
                                    success: function (data) {
                                        $("#permisos").html(data);
                                    }
                                });
                            };
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoPersona" class="form-control" name="estadoPermmisocompleto" onchange="enviar()">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoPermisoComp.equals("2")){%>selected<%}%> value="2">Aceptados</option>
                                    <option <% if(estadoPermisoComp.equals("0")){%>selected<%}%> value="0">Rechazados</option>
                                    <option <% if(estadoPermisoComp.equals("1")){%>selected<%}%> value="1">En Proceso</option>
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

                                        List<UsuarioPermisoResident> listaUsuarioPendientes = dao.listarPermisoPendientes(estadoPermisoComp);
                                        for (UsuarioPermisoResident up : listaUsuarioPendientes) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=up.getUsuarioId()%></td>
                                        <td><%=up.getNombres()%></td>
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
                                            <% if (up.getEstado().equals("En Proceso") || up.getEstado().equals("Aceptado")) {%>
                                            <a style="cursor: pointer;" onclick="rechazar<%=up.getUsuarioId()%><%=up.getPermisoId()%>()" data-toggle="modal" data-target="#rechazar">
                                                <i data-toggle="tooltip" data-placement="top" title="Rechazar el Permiso" class="glyphicon glyphicon-remove"></i>
                                            </a>&nbsp;&nbsp;&nbsp;
                                            <%} if (up.getEstado().equals("En Proceso") || up.getEstado().equals("Rechazado")) {%>
                                            <a style="cursor: pointer;" onclick="aceptar<%=up.getUsuarioId()%><%=up.getPermisoId()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Autorizar el Permiso" class="glyphicon glyphicon-ok"></i>
                                            </a>&nbsp;&nbsp;&nbsp;
                                            <%}%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=up.getUsuarioId()%><%=up.getPermisoId()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar el Permiso" class="glyphicon glyphicon-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <script>
                                    function rechazar<%=up.getUsuarioId()%><%=up.getPermisoId()%>() {
                                        $("#idpermisorechazar").val("<%=up.getPermisoId()%>");
                                        $("#idusuariorechazar").val("<%=up.getUsuarioId()%>");
                                    }
                                    function aceptar<%=up.getUsuarioId()%><%=up.getPermisoId()%>() {
                                        $("#idpermisoaceptar").val("<%=up.getPermisoId()%>");
                                        $("#idusuarioaceptar").val("<%=up.getUsuarioId()%>");
                                    }
                                    function eliminar<%=up.getUsuarioId()%><%=up.getPermisoId()%>() {
                                        $("#idpermisoeliminar").val("<%=up.getPermisoId()%>");
                                        $("#idusuarioeliminar").val("<%=up.getUsuarioId()%>");
                                    }
                                    function cancelarEditPermisoResidente() {
                                        document.getElementById("editpermisoresidente").reset();
                                        document.getElementById("addpermisoresidente").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaPermisoResidente').style.display = 'block';
                                        document.getElementById('editarPermisoResidente').style.display = 'none';
                                        document.getElementById('agregarPermisoResidente').style.display = 'none';
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
                                    document.getElementById('agregarPermisoResidente').style.display = 'block';
                                    document.getElementById('editarPermisoResidente').style.display = 'none';
                                    document.getElementById("otros").focus();
                                    $("#aciones").html("Agregar Permiso");
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarPermisoResidente" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h4><b>Ingresar los Datos del Permiso</b></h4>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="addpermisoresidente" class="form-signin" role="form" method="post" action="usuariopermiso">
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
                                <button type="button" class="btn btn-default" onclick="cancelarEditPermisoResidente()"><!--  data-dismiss="modal" -->
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
            <div class="modal fade" id="rechazar">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #c71c22; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Rechazar este Permiso?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="usuariopermiso">
                                <div class="row">
                                    <input type="hidden" id="idpermisorechazar" name="id">
                                    <input type="hidden" id="idusuariorechazar" name="idusuario">
                                    <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    <input type="hidden" value="0" name="AceptarPer">
                                    <input type="hidden" name="opcion" value="AprobarPermisoResidente">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-danger" type="submit">
                                        Rechazar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                    </button>
                                </h4>
                            </form>
                        </section>
                    </section>
                </section>
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
                                    <input type="hidden" id="idpermisoeliminar" name="id">
                                    <input type="hidden" id="idusuarioeliminar" name="idusuario">
                                    <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    <input type="hidden" value="3" name="AceptarPer">
                                    <input type="hidden" name="opcion" value="AprobarPermisoResidente">
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
                            <h3 align="center"><span><b>¿Está seguro de Autorizar este Permiso?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="usuariopermiso">
                                <div class="row">
                                    <input type="hidden" id="idpermisoaceptar" name="id">
                                    <input type="hidden" id="idusuarioaceptar" name="idusuario">
                                    <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    <input type="hidden" value="2" name="AceptarPer">
                                    <input type="hidden" name="opcion" value="AprobarPermisoResidente">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-primary" type="submit">
                                        Autorizar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
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
                $("#addpermisoresidente").validator({debug: true});
                $("#editpermisoresidente").validator({debug: true});
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>                                
    </body>

</html>
