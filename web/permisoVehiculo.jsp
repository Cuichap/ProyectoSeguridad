<%-- 
    Document   : permisoVehiculo
    Created on : 21/10/2016, 01:41:17 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Permiso"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.PermisosDaoImpl"%>
<%@page import="rest.modelo.dao.PermisosDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String IdPermisoEdit = request.getParameter("IdPermisoEdit");
    IdPermisoEdit = IdPermisoEdit == null ? "" : IdPermisoEdit;
    String IdVehiculoEdit = request.getParameter("IdVehiculoEdit");
    IdVehiculoEdit = IdVehiculoEdit == null ? "" : IdVehiculoEdit;
    String estadopermisoVehiculo = request.getParameter("estadopermisoVehiculo");
    estadopermisoVehiculo = estadopermisoVehiculo == null ? "2" : estadopermisoVehiculo;
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
                    <h4 ><b>Lista de Permisos de Vehículos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaVeh" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading col-sm-12">
                        <article class="col-sm-8" style="color: white;">
                        <div class="input-group ">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input autofocus name="filt" onkeyup="filter(this, 'perVehiculos', '1')" type="text" class="form-control" placeholder="Buscar Permisos de Vehículos." aria-describedby="basic-addon1">
                        </div>
                        </article>
                        <script>
                            function enviar(){
                                $.ajax({
                                    type: "POST",
                                    url: "permisoVehiculo.jsp",
                                    data: "estadopermisoVehiculo="+ $('select[name=estadopermisoVehiculo]').val(),
                                    success: function (data) {
                                        $("#permisos").html(data);
                                    }
                                });
                            };
                        </script>
                         <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="" class="form-control" name="estadopermisoVehiculo" onchange="enviar()">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadopermisoVehiculo.equals("2")){%>selected<%}%> value="2">Pendiente</option>
                                    <option <% if(estadopermisoVehiculo.equals("3")){%>selected<%}%> value="3">Inactivo</option>
                                    <option <% if(estadopermisoVehiculo.equals("4")){%>selected<%}%> value="4">Salida</option>
                                    <option <% if(estadopermisoVehiculo.equals("5")){%>selected<%}%> value="5">Terminado</option>
                                </select>
                            </div>
                        </article>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="perVehiculos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>PermisoId</th>
                                        <th hidden>AreaId</th>
                                        <th>Area</th>
                                        <th>Conductor</th>
                                        <th hidden>Autorizó</th>
                                        <th hidden>VehiculoId</th>
                                        <th>Vehículo</th>
                                        <th hidden>VehiculoId</th>
                                        <th>N° Placa</th>
                                        <th>Salida</th>
                                        <th>Kilometraje</th>
                                        <th>Descripcion Salida</th>
                                        <th>Entrada</th>
                                        <th>Kilometraje</th>
                                        <th>Descripcion Entrada</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        PermisosDao pdao = new PermisosDaoImpl();
                                        int count = 0;

                                        List<Permiso> listarPermisoVehiculo = pdao.listarPermisosVehiculo(estadopermisoVehiculo);
                                        for (Permiso pVehiculo : listarPermisoVehiculo) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=pVehiculo.getPermisoid()%></td>
                                        <td hidden><%=pVehiculo.getAreaid()%></td>
                                        <td><%=pVehiculo.getArea()%></td>
                                        <td><%=pVehiculo.getNombres()%>|<%=pVehiculo.getPermisoid()%>|<%=pVehiculo.getVehiculoid()%></td>
                                        <td hidden><%=pVehiculo.getUsuarioautid()%></td>
                                        <td hidden><%=pVehiculo.getTipovehiculoid()%></td>
                                        <td><%=pVehiculo.getTipovehiculo()%></td>
                                        <th hidden><%=pVehiculo.getVehiculoid()%></th>
                                        <td><%=pVehiculo.getPlaca()%></td>
                                        <td><%=pVehiculo.getFechasalida()%>/<%=pVehiculo.getHorasalida()%></td>
                                        <td><%=pVehiculo.getKilometrajesalida()%></td>
                                        <td><%=pVehiculo.getDescripcionSalida()%></td>
                                        <td><%=pVehiculo.getFechaingreso()%>/<%=pVehiculo.getHoraingreso()%></td>
                                        <td><%=pVehiculo.getKilometrajeingreso()%></td>
                                        <td><%=pVehiculo.getDescripcionIngreso()%></td>
                                        <td align="center">
                                            <%if (pVehiculo.getFechasalida().equals("") && pVehiculo.getHorasalida().equals("")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="EditarVehiculo<%=pVehiculo.getPermisoid()%><%=pVehiculo.getVehiculoid()%>(<%=pVehiculo.getPermisoid()%>, <%=pVehiculo.getVehiculoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Registrar Salida" class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <%}
                                                if (!pVehiculo.getFechasalida().equals("") && !pVehiculo.getHorasalida().equals("") && pVehiculo.getFechaingreso().equals("") && pVehiculo.getHoraingreso().equals("")) {%>
                                            <a style="cursor: pointer;" onclick="EditarVehiculo<%=pVehiculo.getPermisoid()%><%=pVehiculo.getVehiculoid()%>(<%=pVehiculo.getPermisoid()%>, <%=pVehiculo.getVehiculoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Registrar Ingreso" class="glyphicon glyphicon-arrow-left"></i>
                                            </a>
                                            <%}
                                                if (!pVehiculo.equals("")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="EditarVehiculoTodo<%=pVehiculo.getPermisoid()%><%=pVehiculo.getVehiculoid()%>(<%=pVehiculo.getPermisoid()%>, <%=pVehiculo.getVehiculoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Editar Permiso" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                            <%}
                                                if (pVehiculo.getEstado().equals("Inactivo")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="activarVehiculo<%=pVehiculo.getPermisoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Permiso" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}
                                                if (pVehiculo.getEstado().equals("Activo")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="eliminarVehiculo<%=pVehiculo.getPermisoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Permiso" class="glyphicon glyphicon-trash"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminarVehiculo<%=pVehiculo.getPermisoid()%>() {
                                        $("#permisoDeleteVehiculo").val("<%=pVehiculo.getPermisoid()%>");
                                    }
                                    function activarVehiculo<%=pVehiculo.getPermisoid()%>() {
                                        $("#PermisoActiveVehiculo").val("<%=pVehiculo.getPermisoid()%>");
                                    }
                                    function EditarVehiculo<%=pVehiculo.getPermisoid()%><%=pVehiculo.getVehiculoid()%>(permiso, vehiculo) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "permisoVehiculo.jsp",
                                            data: "IdPermisoEdit=" + permiso + "&IdVehiculoEdit=" + vehiculo,
                                            success: function (data) {
                                                $("#permisos").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaVeh').style.display = 'none';
                                                document.getElementById('registrarSalidaVeh').style.display = 'block';
                                                $("#aciones").html("Modificar Permiso vehiculo");
                                            }
                                        });
                                    }
                                    function EditarVehiculoTodo<%=pVehiculo.getPermisoid()%><%=pVehiculo.getVehiculoid()%>(permiso, vehiculo) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "permisoVehiculo.jsp",
                                            data: "IdPermisoEdit=" + permiso + "&IdVehiculoEdit=" + vehiculo,
                                            success: function (data) {
                                                $("#permisos").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaVeh').style.display = 'none';
                                                document.getElementById('editSalidaVeh').style.display = 'block';
                                                $("#aciones").html("Modificar Permiso vehiculo");
                                            }
                                        });
                                    }
                                    function cancelarEditPermisoVeh() {
                                        document.getElementById("regsalidavehi").reset();
                                        document.getElementById("editsalidavehi").reset();//del formulario
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaVeh').style.display = 'block';
                                        document.getElementById('registrarSalidaVeh').style.display = 'none';
                                        document.getElementById('editSalidaVeh').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Vehiculos");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="registrarSalidaVeh" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso Vehiculo</b></h4>
                    </div>
                    <%
                        PermisosDao vdao = new PermisosDaoImpl();
                        List<Permiso> listaPermisoVehiculoEdit = vdao.listarPermisoVehiculoEdit(IdPermisoEdit, IdVehiculoEdit);
                        for (Permiso perEditar : listaPermisoVehiculoEdit) {
                    %>
                    <div class="panel-body">
                        <form id="regsalidavehi" class="form-signin" role="form" method="post" action="permisos">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="area">Area</label>
                                        <input value="<%=perEditar.getArea()%>" type="text" disabled="" class="form-control" id="area" placeholder="Area" name="area">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="conductor">Conductor</label>
                                        <input value="<%=perEditar.getNombres()%>" type="text" disabled="" class="form-control" id="conductor" placeholder="Conductor" name="conductor">
                                        <%if (perEditar.getFechasalida().equals("") && perEditar.getHorasalida().equals("")) {%>
                                        <input type="hidden" name="opcion" value="RegistrarSalidaVehiculo">
                                        <%}
                                            if (!perEditar.getFechasalida().equals("") && !perEditar.getHorasalida().equals("") && perEditar.getFechaingreso().equals("") && perEditar.getHoraingreso().equals("")) {%>
                                        <input type="" name="opcion" value="RegistrarIngresoVehiculo">
                                        <%}%>
                                        <input type="hidden" name="id" value="<%=IdPermisoEdit%>">
                                        <input type="hidden" name="id2" value="<%=IdVehiculoEdit%>">
                                        <input type="hidden" name="usuarioreg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="vehiculo">Vehiculo</label>
                                        <input value="<%=perEditar.getTipovehiculo()%>" type="text" disabled="" class="form-control" id="vehiculo" placeholder="Vehiculo" name="vehiculo">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="placa">N° Placa</label>
                                        <input value="<%=perEditar.getPlaca()%>" type="text" disabled="" class="form-control" id="placa" placeholder="Placa" name="placa">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalida">Fecha Salida</label>
                                        <input value="<%=perEditar.getFechasalida()%>" type="date" <%if (!perEditar.getFechasalida().equals("")) {%>disabled=""<%}%> class="form-control" id="fechasalida" placeholder="Fecha Salida" name="fechasalida">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalida">Hora Salida</label>
                                        <input value="<%=perEditar.getHorasalida()%>" type="time" <%if (!perEditar.getHorasalida().equals("")) {%>disabled=""<%}%> class="form-control" id="horasalida" placeholder="Hora Salida" name="horasalida">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="kilometrajeini">Kilometraje</label>
                                        <input value="<%=perEditar.getKilometrajesalida()%>" type="text" <%if (!perEditar.getKilometrajesalida().equals("")) {%>disabled=""<%}%> class="form-control" id="kilometrajeini" placeholder="Kilometraje Incial" name="kilometrajeini">
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descSal">Descripcion Salida</label>
                                        <input value="<%=perEditar.getDescripcionSalida()%>" type="text" <%if (!perEditar.getDescripcionSalida().equals("")) {%>disabled=""<%}%> class="form-control" id="descSal" placeholder="Descripcion Inicial" name="descripcion1">
                                    </div>
                                </div>
                                <% if (!perEditar.getFechasalida().equals("") && !perEditar.getHorasalida().equals("") && perEditar.getFechaingreso().equals("") && perEditar.getHoraingreso().equals("")) {%>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingreso">Fecha Ingreso</label>
                                        <input value="<%=perEditar.getFechaingreso()%>" type="date" class="form-control" id="fechaingreso" placeholder="Fecha Ingreso" name="fechaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingreso">Hora Ingreso</label>
                                        <input value="<%=perEditar.getHoraingreso()%>" type="time" class="form-control" id="horaingreso" placeholder="Hora Entrada" name="horaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingreso">Kilometraje Final</label>
                                        <input value="<%=perEditar.getKilometrajeingreso()%>" type="text" class="form-control" id="horaingreso" placeholder="Kilometraje Final" name="kilometrajefin">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descIngreso">Observación</label>
                                        <input value="<%=perEditar.getDescripcionIngreso()%>" class="form-control" id="descIngreso" placeholder="Descripción del permiso" name="descripcion2">

                                    </div>
                                </div>
                                <%}%>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditPermisoVeh()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Agregar Salida Agregar Entrada &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                </button>
                            </h4>
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>
            <div id="editSalidaVeh" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Permiso Vehiculo</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="editsalidavehi" class="form-signin" role="form" method="post" action="permisos"><!---del formulario--->
                            <%
                                PermisosDao Pvdao = new PermisosDaoImpl();
                                List<Permiso> listaPermisoVehiculoEdita = Pvdao.listarPermisoVehiculoEdit(IdPermisoEdit, IdVehiculoEdit);
                                for (Permiso perEdit : listaPermisoVehiculoEdita) {
                            %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="area">Area</label>
                                        <input value="<%=perEdit.getArea()%>" type="text" disabled="" class="form-control" id="area" placeholder="Area" name="area">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="conductor">Conductor</label>
                                        <input value="<%=perEdit.getNombres()%>" type="text" disabled="" class="form-control" id="conductor" placeholder="Conductor" name="conductor">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="vehiculo">Vehiculo</label>
                                        <input value="<%=perEdit.getTipovehiculo()%>" type="text" disabled="" class="form-control" id="vehiculo" placeholder="Vehiculo" name="vehiculo">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="placa">N° Placa</label>
                                        <input value="<%=perEdit.getPlaca()%>" type="text" disabled="" class="form-control" id="placa" placeholder="Placa" name="placa">
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechasalida">Fecha Salida</label>
                                        <input value="<%=perEdit.getFechasalida()%>" type="date" class="form-control" id="fechasalida" placeholder="Fecha Salida" name="fechasalida">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horasalida">Hora Salida</label>
                                        <input value="<%=perEdit.getHorasalida()%>" type="time" class="form-control" id="horasalida" placeholder="Hora Salida" name="horasalida">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="kilometrajeini">Kilometraje</label>
                                        <input value="<%=perEdit.getKilometrajesalida()%>" type="text"  class="form-control" id="kilometrajeini" placeholder="Kilometraje Incial" name="kilometrajeini">
                                    </div>
                                </div> 
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descSal">Descripcion Salida</label>
                                        <input value="<%=perEdit.getDescripcionSalida()%>" type="text"  class="form-control" id="descSal" placeholder="Descripcion Inicial" name="descripcion1">
                                    </div>
                                </div><div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaingreso">Fecha Ingreso</label>
                                        <input value="<%=perEdit.getFechaingreso()%>" type="date" class="form-control" id="fechaingreso" placeholder="Fecha Ingreso" name="fechaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingreso">Hora Ingreso</label>
                                        <input value="<%=perEdit.getHoraingreso()%>" type="time" class="form-control" id="horaingreso" placeholder="Hora Entrada" name="horaingreso">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horaingreso">Kilometraje Final</label>
                                        <input value="<%=perEdit.getKilometrajeingreso()%>" type="text" class="form-control" id="horaingreso" placeholder="Kilometraje Final" name="kilometrajefin">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descIngreso">Observación</label>
                                        <input value="<%=perEdit.getDescripcionIngreso()%>" class="form-control" id="descIngreso" placeholder="Descripción del permiso" name="descripcion2">
                                        <input type="hidden" name="opcion" value="EditarIngresoVehiculo">
                                        <input type="hidden" name="id" value="<%=IdPermisoEdit%>">
                                        <input type="hidden" name="id2" value="<%=IdVehiculoEdit%>">
                                        <input type="hidden" name="usuarioreg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditPermisoVeh()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Editar Permiso &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                </button>
                            </h4>
                        </form>
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
                            <form class="form-signin" role="form" method="post" action="permisos">
                                <div class="row">
                                    <input type="hidden" id="permisoDeleteVehiculo" name="id">
                                    <input type="hidden" name="opcion" value="DeletePermisoVehiculo">
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
                                    <input type="hidden" id="PermisoActiveVehiculo" name="id"><!--aqui se llama a la funcion-->
                                    <input type="hidden" name="opcion" value="ActivarPermisosVehiculo"><!-- se envia la variable al servlet--->
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
