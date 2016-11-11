<%-- 
    Document   : permisoResidente
    Created on : 21/10/2016, 01:40:15 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.PermisosDaoImpl"%>
<%@page import="rest.modelo.dao.PermisosDao"%>
<%@page import="rest.modelo.entidad.Permiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String IdPermisoEditPer = request.getParameter("IdPermisoEditPer");
    IdPermisoEditPer = IdPermisoEditPer == null ? "" : IdPermisoEditPer;
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
                <article class="col-sm-4" style="color: white;">
                    <h4 ><b>Lista de Permisos del Personal</b></h4>
                </article>
            </section>
            <div id="listaPermiso" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input autofocus name="filt" onkeyup="filter(this, 'perResidentes', '1')" type="text" class="form-control" placeholder="Buscar Permisos de los Residentes." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="perResidentes" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>PermisoId</th>
                                        <th hidden>PersonaId</th>
                                        <th hidden>UsuarioId</th>
                                        <th>Nombres</th>
                                        <th>Lugar</th>
                                        <th hidden>MotivoId</th>
                                        <th>Motivo</th>
                                        <th>Salida Programada</th>
                                        <th>Ingreso Programado</th>
                                        <th>Salida Real</th>
                                        <th>Ingreso Real</th>
                                        <th>Observacion</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        PermisosDao perdao = new PermisosDaoImpl();
                                        int count = 0;

                                        List<Permiso> listarPermiso = perdao.listarPermisosPersonal();
                                        for (Permiso permiso : listarPermiso) {
                                            count++;

                                    %>  
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=permiso.getPermisoid()%></td>
                                        <td hidden><%=permiso.getPersonaid()%></td>
                                        <td hidden><%=permiso.getUsuarioid()%></td>
                                        <td><%=permiso.getNombres()%></td>
                                        <td><%=permiso.getLugar()%></td>
                                        <td hidden><%=permiso.getMotivoid()%></td>
                                        <td><%=permiso.getMotivo()%></td>
                                        <td><%=permiso.getFechasalida()%> <%=permiso.getHoraingreso()%></td>
                                        <td><%=permiso.getFechaingreso()%> <%=permiso.getHoraingreso()%></td>
                                        <td><%=permiso.getFechasalidareal()%> <%=permiso.getHorasalidareal()%></td>
                                        <td><%=permiso.getFechaingresoreal()%> <%=permiso.getHoraingresoreal()%></td>
                                        <td><%=permiso.getObservacion()%></td>
                                        <td align="center">
                                            <%if (permiso.getFechasalidareal().equals("") && permiso.getHorasalidareal().equals("")) { %>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="AgregarPer<%=permiso.getPermisoid()%>(<%=permiso.getPermisoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Registrar Salida" class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <%} if(!permiso.getFechasalidareal().equals("") && !permiso.getHorasalidareal().equals("") && permiso.getFechaingresoreal().equals("") && permiso.getHoraingresoreal().equals("")){%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="AgregarPer<%=permiso.getPermisoid()%>(<%=permiso.getPermisoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Registrar Ingreso" class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <%}
                                                if (!permiso.getFechaingresoreal().equals("") && !permiso.getHoraingresoreal().equals("")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="Editar<%=permiso.getPermisoid()%>(<%=permiso.getPermisoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Editar Permiso" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                            <%}
                                                if (permiso.getEstado().equals("Inactivo")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="activar<%=permiso.getPermisoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Permiso" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}
                                                if (permiso.getEstado().equals("Activo")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="eliminar<%=permiso.getPermisoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Permiso" class="glyphicon glyphicon-trash"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                        function eliminar<%=permiso.getPermisoid()%>() {
                                            $("#permisoDeletePersonal").val("<%=permiso.getPermisoid()%>");
                                        }
                                        function activar<%=permiso.getPermisoid()%>() {
                                            $("#PermisoActivePersonal").val("<%=permiso.getPermisoid()%>");
                                        }
                                        function AgregarPer<%=permiso.getPermisoid()%>(permiso) {
                                            $.ajax({
                                                stype: 'POST',
                                                url: "permisoPersonal.jsp",
                                                data: "IdPermisoEditPer=" + permiso,
                                                success: function (data) {
                                                    $("#permisos").html(data);
                                                    document.getElementById('lista').style.display = 'none';
                                                    document.getElementById('listaPermiso').style.display = 'none';
                                                    document.getElementById('registrarpermiso').style.display = 'block';
                                                    document.getElementById("Permiso").focus();
                                                    $("#aciones").html("Modificar Permiso Residente");
                                                }
                                            });
                                        }
                                        function Editar<%=permiso.getPermisoid()%>(permiso) {
                                            $.ajax({
                                                stype: 'POST',
                                                url: "permisoPersonal.jsp",
                                                data: "IdPermisoEditPer=" + permiso,
                                                success: function (data) {
                                                    $("#permisos").html(data);
                                                    document.getElementById('lista').style.display = 'none';
                                                    document.getElementById('listaPermiso').style.display = 'none';
                                                    document.getElementById('registrarSalidaPer').style.display = 'block';
                                                    $("#aciones").html("Modificar Permiso Residente");
                                                }
                                            });
                                        }
                                        function cancelarEditPermiso() {
                                            document.getElementById("registrarpermiso").reset();
                                            document.getElementById("editarpermiso").reset();
                                            document.getElementById('lista').style.display = 'block';
                                            document.getElementById('listaPermiso').style.display = 'block';
                                            document.getElementById('registrarSalidaPer').style.display = 'none';
                                            document.getElementById('editarPermiso').style.display = 'none';
                                            document.getElementById("buscador").focus();
                                            $("#aciones").html("Lista de Permisos");
                                        }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="registrarSalidaPer" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso</b></h4>
                    </div>
                    <%
                        PermisosDao ppdao = new PermisosDaoImpl();
                        List<Permiso> listaPermisoPersonalEdite = ppdao.listarPermisoPersonalEdit(IdPermisoEditPer);
                        for (Permiso perEditar : listaPermisoPersonalEdite) {
                    %>
                    <div class="panel-body">
                        <form id="registrarpermiso" class="form-signin" role="form" method="post" action="permisos">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="permisoEdit">Persona</label>
                                        <input value="<%=perEditar.getNombres()%>" type="text" disabled="" class="form-control" id="permisoEdit" placeholder="Nombres" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lugarEdit">Lugar</label>
                                        <input value="<%=perEditar.getLugar()%>" type="text" disabled="" class="form-control" id="lugarEdit" placeholder="Lugar" name="lugar">
                                        <%if (perEditar.getFechasalidareal().equals("") && perEditar.getHorasalidareal().equals("")) {%>
                                        <input type="hidden" name="opcion" value="RegistrarSalidaResidente">
                                        <%}
                                            if (!perEditar.getFechasalidareal().equals("") && !perEditar.getHorasalidareal().equals("") && perEditar.getFechaingresoreal().equals("") && perEditar.getHoraingresoreal().equals("")) {%>
                                        <input type="hidden" name="opcion" value="RegistrarIngresoResidente">
                                        <%}%>
                                        <input type="hidden" name="id" value="<%=IdPermisoEditPer%>">
                                        <input type="hidden" name="usuarioreg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="motivoEdit">Motivo</label>
                                        <input value="<%=perEditar.getMotivo()%>" type="text" disabled="" class="form-control" id="motivoEdit" placeholder="Nombre del Permiso" name="motivo">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidaProgramadaEdit">Fecha Salida Programada</label>
                                        <input value="<%=perEditar.getFechasalida()%>" type="text" disabled="" class="form-control" id="fechasalidaProgramadaEdit" placeholder="Fecha Salida Programada" name="fechasalida">
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidaProgramadaEdit">Hora Salida Programada</label>
                                        <input value="<%=perEditar.getHorasalida()%>" type="text" disabled="" class="form-control" id="horasalidaProgramadaEdit" placeholder="Hora Salida Programada" name="horasalida">
                                    </div>
                                </div>     
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresoProgramadoEdit">Fecha Ingreso Programada</label>
                                        <input value="<%=perEditar.getFechaingreso()%>" type="text" disabled="" class="form-control" id="fechaingresoProgramadoEdit" placeholder="Fecha Salida Programada" name="fechaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresoProgramadoEdit">Hora Ingreso Programada</label>
                                        <input value="<%=perEditar.getHoraingreso()%>" type="text" disabled="" class="form-control" id="horaingresoProgramadoEdit" placeholder="Hora Salida Programada" name="horaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidarealEdit">Fecha Salida Real</label>
                                        <input value="<%=perEditar.getFechasalidareal()%>" type="text" <%if (!perEditar.getFechasalidareal().equals("")) {%>disabled=""<%}%> class="form-control" id="fechasalidarealEdit" placeholder="Fecha de Salida" name="fechasalidareal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidarealEdit">Hora Salida Real</label>
                                        <input value="<%=perEditar.getHorasalidareal()%>" type="text" <%if (!perEditar.getHorasalidareal().equals("")){%> disabled=""<%}%>class="form-control" id="horasalidarealEdit" placeholder="Fecha de Salida" name="horasalidareal">
                                    </div>
                                </div>
                                <% if (!perEditar.getFechasalidareal().equals("") && !perEditar.getHorasalidareal().equals("") && perEditar.getFechaingresoreal().equals("") && perEditar.getHoraingresoreal().equals("")) {%>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresorealEdit">Fecha Ingreso Real</label>
                                        <input value="<%=perEditar.getFechaingresoreal()%>" type="text" class="form-control" id="fechaingresorealEdit" placeholder="Fecha de Entrada" name="fechaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresorealEdit">Hora Ingreso Real</label>
                                        <input value="<%=perEditar.getHoraingresoreal()%>" type="text" class="form-control" id="horaingresorealEdit" placeholder="Fecha de Entrada" name="horaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="observacion">Observación</label>
                                        <input value="<%=perEditar.getObservacion()%>" class="form-control" id="observacion" placeholder="Descripción del permiso" name="observacion">
                                    </div>
                                </div>
                                <%}%>
                                <hr style="border-color: #3b5998;">
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" onclick="cancelarEditPermiso()"><!--  data-dismiss="modal" -->
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-primary" type="submit">
                                        Agregar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                    </button>
                                </h4>
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>                    
            <div id="editarPermiso" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso</b></h4>
                    </div>
                    <%
                        PermisosDao rpdao = new PermisosDaoImpl();
                        List<Permiso> listaPermisoPersonalEdit = rpdao.listarPermisoPersonalEdit(IdPermisoEditPer);
                        for (Permiso perEditar : listaPermisoPersonalEdit) {
                    %>
                    <div class="panel-body">
                        <form id="editarpermiso" class="form-signin" role="form" method="post" action="permisos">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="permisoEdit">Persona</label>
                                        <input value="<%=perEditar.getNombres()%>" type="text" disabled="" class="form-control" id="permisoEdit" placeholder="Nombres" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lugarEdit">Lugar</label>
                                        <input value="<%=perEditar.getLugar()%>" type="text" disabled="" class="form-control" id="lugarEdit" placeholder="Lugar" name="lugar">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="motivoEdit">Motivo</label>
                                        <input value="<%=perEditar.getMotivo()%>" type="text" disabled="" class="form-control" id="motivoEdit" placeholder="Nombre del Permiso" name="motivo">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidaProgramadaEdit">Fecha Salida Programada</label>
                                        <input value="<%=perEditar.getFechasalida()%>" type="text" disabled="" class="form-control" id="fechasalidaProgramadaEdit" placeholder="Fecha Salida Programada" name="fechasalida">
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidaProgramadaEdit">Hora Salida Programada</label>
                                        <input value="<%=perEditar.getHorasalida()%>" type="text" disabled="" class="form-control" id="horasalidaProgramadaEdit" placeholder="Hora Salida Programada" name="horasalida">
                                    </div>
                                </div>     
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresoProgramadoEdit">Fecha Ingreso Programada</label>
                                        <input value="<%=perEditar.getFechaingreso()%>" type="text" disabled="" class="form-control" id="fechaingresoProgramadoEdit" placeholder="Fecha Salida Programada" name="fechaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresoProgramadoEdit">Hora Ingreso Programada</label>
                                        <input value="<%=perEditar.getHoraingreso()%>" type="text" disabled="" class="form-control" id="horaingresoProgramadoEdit" placeholder="Hora Salida Programada" name="horaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidarealEdit">Fecha Salida Real</label>
                                        <input value="<%=perEditar.getFechasalidareal()%>" type="text" class="form-control" id="fechasalidarealEdit" placeholder="Fecha de Salida" name="fechasalidareal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidarealEdit">Hora Salida Real</label>
                                        <input value="<%=perEditar.getHorasalidareal()%>" type="text" class="form-control" id="horasalidarealEdit" placeholder="Fecha de Salida" name="horasalidareal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresorealEdit">Fecha Ingreso Real</label>
                                        <input value="<%=perEditar.getFechaingresoreal()%>" type="text" class="form-control" id="fechaingresorealEdit" placeholder="Fecha de Entrada" name="fechaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresorealEdit">Hora Ingreso Real</label>
                                        <input value="<%=perEditar.getHoraingresoreal()%>" type="text" class="form-control" id="horaingresorealEdit" placeholder="Fecha de Entrada" name="horaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="observacion">Observación</label>
                                        <input value="<%=perEditar.getObservacion()%>" class="form-control" id="observacion" placeholder="Descripción del permiso" name="observacion">
                                        <input type="hidden" name="opcion" value="EditPermisoPersonal">
                                        <input type="hidden" name="id" value="<%=IdPermisoEditPer%>">
                                        <input type="hidden" name="usuarioreg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditPermiso()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Permiso?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="permisos">
                                <div class="row">
                                    <input type="hidden" id="permisoDeletePersonal" name="id">
                                    <input type="hidden" name="opcion" value="DeletePermisoPersonal">
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
            <div class="modal fade" id="activar"><!---esto va al boton--->
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #3b5998; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Activar este Permiso?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="permisos"><!--se envia al servlet--->
                                <div class="row">
                                    <input type="hidden" id="PermisoActivePersonal" name="id"><!--aqui se llama a la funcion-->
                                    <input type="hidden" name="opcion" value="ActivarPermisosPersonal"><!-- se envia la variable al servlet--->
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
    </body>
</html>
