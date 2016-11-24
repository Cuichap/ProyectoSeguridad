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
    String Personalid = request.getParameter("Personalid"); Personalid = Personalid == null ? "" : Personalid;
    String PersonalidEdit = request.getParameter("PersonalidEdit"); PersonalidEdit = PersonalidEdit == null ? "" : PersonalidEdit;
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
            <div id="listaPermisoPersonal" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input autofocus name="filt" onkeyup="filter(this, 'perPersonal', '1')" type="text" class="form-control" placeholder="Buscar Permisos de los Residentes." aria-describedby="basic-addon1">
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
                                            <%if (permiso.getFechasalidareal().equals("") && permiso.getHorasalidareal().equals("")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="AgregarPer<%=permiso.getPermisoid()%>(<%=permiso.getPermisoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Registrar Salida" class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <%}
                                                if (!permiso.getFechasalidareal().equals("") && !permiso.getHorasalidareal().equals("") && permiso.getFechaingresoreal().equals("") && permiso.getHoraingresoreal().equals("")) {%>
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
                                            data: "Personalid=" + permiso,
                                            success: function (data) {
                                                $("#permisos").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaPermisoPersonal').style.display = 'none';
                                                document.getElementById('registrarSalidaPers').style.display = 'block';
                                                $("#aciones").html("Modificar Permiso Residente");
                                            }
                                        });
                                    }
                                    function Editar<%=permiso.getPermisoid()%>(permisoEdit) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "permisoPersonal.jsp",
                                            data: "PersonalidEdit=" + permisoEdit,
                                            success: function (data) {
                                                $("#permisos").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaPermisoPersonal').style.display = 'none';
                                                document.getElementById('SalidaPersedit').style.display = 'block';
                                                $("#aciones").html("Modificar Permiso Residente");
                                            }
                                        });
                                    }
                                    function cancelarEditPermiso() {
                                        document.getElementById("registrarsalia").reset();
                                        document.getElementById("saledit").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaPermisoPersonal').style.display = 'block';
                                        document.getElementById('registrarSalidaPers').style.display = 'none';
                                        document.getElementById('SalidaPersedit').style.display = 'none';
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
            <div id="registrarSalidaPers" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso</b></h4>
                    </div>
                    <%
                        PermisosDao ppdao = new PermisosDaoImpl();
                        List<Permiso> listaPermisoPersonalEdite = ppdao.listarPermisoPersonalEdit(Personalid);
                        for (Permiso perEditar : listaPermisoPersonalEdite) {
                    %>
                    <div class="panel-body">
                        <form id="registrarsalia" class="form-signin" role="form" method="post" action="permisos">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="permisoEdit">Persona</label>
                                        <input value="<%=perEditar.getNombres()%>" type="text" disabled="" disabled="" class="form-control" id="permisoEdit" placeholder="Nombres" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lugarEdit">Lugar</label>
                                        <input value="<%=perEditar.getLugar()%>" type="text" disabled="" class="form-control" id="lugarEdit" placeholder="Lugar" name="lugar">
                                        <%if (perEditar.getFechasalidareal().equals("") && perEditar.getHorasalidareal().equals("")) {%>
                                        <input type="hidden" name="opcion" value="RegistrarSalidaPersonal">
                                        <%}
                                            if (!perEditar.getFechasalidareal().equals("") && !perEditar.getHorasalidareal().equals("") && perEditar.getFechaingresoreal().equals("") && perEditar.getHoraingresoreal().equals("")) {%>
                                        <input type="hidden" name="opcion" value="RegistrarIngresoPersonal">
                                        <%}%>
                                        <input type="hidden" name="id" value="<%=Personalid%>">
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
                                        <input value="<%=perEditar.getFechasalida()%>" type="date" disabled="" class="form-control" id="fechasalidaProgramadaEdit" placeholder="Fecha Salida Programada" name="fechasalida">
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidaProgramadaEdit">Hora Salida Programada</label>
                                        <input value="<%=perEditar.getHorasalida()%>" type="time" disabled="" class="form-control" id="horasalidaProgramadaEdit" placeholder="Hora Salida Programada" name="horasalida">
                                    </div>
                                </div>     
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresoProgramadoEdit">Fecha Ingreso Programada</label>
                                        <input value="<%=perEditar.getFechaingreso()%>" type="date" disabled="" class="form-control" id="fechaingresoProgramadoEdit" placeholder="Fecha Salida Programada" name="fechaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresoProgramadoEdit">Hora Ingreso Programada</label>
                                        <input value="<%=perEditar.getHoraingreso()%>" type="time" disabled="" class="form-control" id="horaingresoProgramadoEdit" placeholder="Hora Salida Programada" name="horaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidarealEdit">Fecha Salida Real</label>
                                        <input value="<%=perEditar.getFechasalidareal()%>" type="date" <%if (!perEditar.getFechasalidareal().equals("")) {%>disabled=""<%}%> class="form-control" id="fechasalidarealEdit" placeholder="Fecha de Salida" name="fechasalidareal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidarealEdit">Hora Salida Real</label>
                                        <input value="<%=perEditar.getHorasalidareal()%>" type="time" <%if (!perEditar.getHorasalidareal().equals("")) {%> disabled=""<%}%>class="form-control" id="horasalidarealEdit" placeholder="Fecha de Salida" name="horasalidareal">
                                    </div>
                                </div>
                                <% if (!perEditar.getFechasalidareal().equals("") && !perEditar.getHorasalidareal().equals("") && perEditar.getFechaingresoreal().equals("") && perEditar.getHoraingresoreal().equals("")) {%>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresorealEdit">Fecha Ingreso Real</label>
                                        <input value="<%=perEditar.getFechaingresoreal()%>" type="date" class="form-control" id="fechaingresorealEdit" placeholder="Fecha de Entrada" name="fechaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresorealEdit">Hora Ingreso Real</label>
                                        <input value="<%=perEditar.getHoraingresoreal()%>" type="time" class="form-control" id="horaingresorealEdit" placeholder="Fecha de Entrada" name="horaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="observacion">Observación</label>
                                        <input value="<%=perEditar.getObservacion()%>" class="form-control" id="observacion" placeholder="Observacón" name="observacion">
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
            <div id="SalidaPersedit" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso</b></h4>
                    </div>
                    <%
                        List<Permiso> listaPermisoPersonalEdit = perdao.listarPermisoPersonalEdit(PersonalidEdit);
                        for (Permiso personalEditar : listaPermisoPersonalEdit) {
                    %>
                    <div class="panel-body">
                        <form id="saledit" class="form-signin" role="form" method="post" action="permisos">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="permisoEdit">Persona</label>
                                        <input value="<%=personalEditar.getNombres()%>" type="text" disabled="" class="form-control" id="permisoEdit" placeholder="Nombres" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lugarEdit">Lugar</label>
                                        <input value="<%=personalEditar.getLugar()%>" type="text" disabled="" class="form-control" id="lugarEdit" placeholder="Lugar" name="lugar">
                                        <input type="hidden" name="opcion" value="EditarPermisoPersonal">
                                        <input type="hidden" name="id" value="<%=PersonalidEdit%>">
                                        <input type="hidden" name="usuarioreg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="motivoEdit">Motivo</label>
                                        <input value="<%=personalEditar.getMotivo()%>" type="text" disabled="" class="form-control" id="motivoEdit" placeholder="Nombre del Permiso" name="motivo">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidaProgramadaEdit">Fecha Salida Programada</label>
                                        <input value="<%=personalEditar.getFechasalida()%>" type="date" disabled="" class="form-control" id="fechasalidaProgramadaEdit" placeholder="Fecha Salida Programada" name="fechasalida">
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidaProgramadaEdit">Hora Salida Programada</label>
                                        <input value="<%=personalEditar.getHorasalida()%>" type="time" disabled="" class="form-control" id="horasalidaProgramadaEdit" placeholder="Hora Salida Programada" name="horasalida">
                                    </div>
                                </div>     
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresoProgramadoEdit">Fecha Ingreso Programada</label>
                                        <input value="<%=personalEditar.getFechaingreso()%>" type="date" disabled="" class="form-control" id="fechaingresoProgramadoEdit" placeholder="Fecha Salida Programada" name="fechaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresoProgramadoEdit">Hora Ingreso Programada</label>
                                        <input value="<%=personalEditar.getHoraingreso()%>" type="time" disabled="" class="form-control" id="horaingresoProgramadoEdit" placeholder="Hora Salida Programada" name="horaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalidarealEdit">Fecha Salida Real</label>
                                        <input value="<%=personalEditar.getFechasalidareal()%>" type="date" class="form-control" id="fechasalidarealEdit" placeholder="Fecha de Salida" name="fechasalidareal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalidarealEdit">Hora Salida Real</label>
                                        <input value="<%=personalEditar.getHorasalidareal()%>" type="time" class="form-control" id="horasalidarealEdit" placeholder="Fecha de Salida" name="horasalidareal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingresorealEdit">Fecha Ingreso Real</label>
                                        <input value="<%=personalEditar.getFechaingresoreal()%>" type="date" class="form-control" id="fechaingresorealEdit" placeholder="Fecha de Entrada" name="fechaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingresorealEdit">Hora Ingreso Real</label>
                                        <input value="<%=personalEditar.getHoraingresoreal()%>" type="time" class="form-control" id="horaingresorealEdit" placeholder="Fecha de Entrada" name="horaingresoreal">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="observacion">Observación</label>
                                        <input value="<%=personalEditar.getObservacion()%>" class="form-control" id="observacion" placeholder="Observacón" name="observacion">
                                    </div>
                                </div>
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
    </body>
</html>
