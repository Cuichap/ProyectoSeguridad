<%-- 
    Document   : addUsuario
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.SeguridadDaoImpl"%>
<%@page import="rest.modelo.dao.SeguridadDao"%>
<%@page import="rest.modelo.entidad.Area"%>
<%@page import="rest.modelo.entidad.Perfiles"%>
<%@page import="rest.modelo.entidad.TipoPersona"%>
<%@page import="rest.modelo.entidad.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idUsuarioEdit = request.getParameter("idUsuarioEdit"); idUsuarioEdit = idUsuarioEdit == null ? "" :idUsuarioEdit;
    String estadoUsuario = request.getParameter("estadoUsuario"); estadoUsuario = estadoUsuario == null ? "1" :estadoUsuario;
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
                    <h4><b>Lista de Usuarios</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-12"></div>
                    <a class="btn btn-primary" onclick="agregarUsuario()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaUsuario" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'usuario', '1')" type="text" class="form-control" placeholder="Buscar Usuario." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            $(document).ready(function (){
                                    $('select[name=estadoUsuario]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addUsuario.jsp",
                                            data: "estadoUsuario="+ $('select[name=estadoUsuario]').val(),
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoUsuario" class="form-control" name="estadoUsuario">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoUsuario.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoUsuario.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="usuario" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>Id Usuario</th>
                                        <th hidden>Id Persona</th>
                                        <th>Nombres</th>
                                        <th hidden>Tipo Persona Id</th>
                                        <th>Tipo</th>
                                        <th hidden>Area Id</th>
                                        <th>Area</th>
                                        <th hidden>Perfil Id</th>
                                        <th>Perfil</th>
                                        <th>Usuario</th>
                                        <th hidden>Contraseña</th>
                                        <th>Codigo</th>
                                        <th>Habitación</th>
                                        <th>Culto</th>
                                        <th>Estado</th>
                                        <th colspan="3">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        SeguridadDao sdaoDao = new SeguridadDaoImpl();

                                        int count = 0;

                                        List<Usuario> listaUser = sdaoDao.listarUsuario(estadoUsuario);
                                        for (Usuario usuario : listaUser) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=usuario.getUsuarioid()%></td>
                                        <td hidden><%=usuario.getPersonaid()%></td>
                                        <td><%=usuario.getNombres()%></td>
                                        <td hidden><%=usuario.getPersonaid()%></td>
                                        <td><%=usuario.getNombretipoper()%></td>
                                        <td hidden><%=usuario.getAreaid()%></td>
                                        <td><%=usuario.getNombrearea()%></td>
                                        <td hidden><%=usuario.getPerfilid()%></td>
                                        <td><%=usuario.getNombreperfil()%></td>
                                        <td><%=usuario.getUsuario()%></td>
                                        <td hidden><%=usuario.getContrasena()%></td>
                                        <td><%=usuario.getCodigo()%></td>
                                        <td><%=usuario.getHabitacion()%></td>
                                        <td><%=usuario.getCulto()%></td>
                                        <td><%=usuario.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="restabelcer<%=usuario.getUsuarioid()%>()" data-toggle="modal" data-target="#restPassUser">
                                                <i data-toggle="tooltip" data-placement="top" title="Restablecer Contraseña" class="glyphicon glyphicon-refresh"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=usuario.getUsuarioid()%>(<%=usuario.getUsuarioid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Usuario" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(usuario.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=usuario.getUsuarioid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Usuario" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(usuario.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=usuario.getUsuarioid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Usuario" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=usuario.getUsuarioid()%>() {
                                        $("#userDelete").val("<%=usuario.getUsuarioid()%>");
                                    }
                                    function activar<%=usuario.getUsuarioid()%>() {
                                        $("#userActive").val("<%=usuario.getUsuarioid()%>");
                                    }
                                    function restabelcer<%=usuario.getUsuarioid()%>() {
                                        $("#restPass").val("<%=usuario.getUsuarioid()%>");
                                    }
                                    function Editar<%=usuario.getUsuarioid()%>(usuario) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addUsuario.jsp",
                                            data: "idUsuarioEdit=" + usuario,
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaUsuario').style.display = 'none';
                                                document.getElementById('agregarUsuario').style.display = 'none';
                                                document.getElementById('editarUsuario').style.display = 'block';
                                                document.getElementById("usuarioEd").focus();
                                                $("#aciones").html("Modificar Usuario");
                                            }
                                        });
                                    }
                                    function cancelarEditUsuario() {
                                        document.getElementById("edituser").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaUsuario').style.display = 'block';
                                        document.getElementById('editarUsuario').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Usuarios");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarUsuario" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Usuario</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="adduser" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <article class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Buscar Persona</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                            <input id="buscador" autofocus type="filt" onkeyup="filter(this, 'usuario', '1')" type="text" class="form-control" placeholder="Buscar Usuario" describedby="basic-addon1">
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="nombres">Nombres</label>
                                        <input type="text" disabled="" class="form-control" id="nombres" placeholder="Nombres" name="nombres">
                                        <input type="hidden" name="personaId" value="1">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="apellidos">Apellidos</label>
                                        <input type="text" disabled="" class="form-control" id="apellidos" placeholder="Apellidos" name="apellidos">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Usuario</label>
                                        <select class="form-control" id="tipo" name="tipoPersonaId">
                                            <option hidden>Seleccionar Tipo de Usuario</option>
                                            <%

                                                List<TipoPersona> listaTipoPer = dao.listarTipoPersonaAct();
                                                for (TipoPersona tipoPer : listaTipoPer) {

                                            %>
                                            <option value="<%=tipoPer.getTipoPersonaid()%>"><%=tipoPer.getNombreTipoPersona()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Perfil</label>
                                        <select class="form-control" id="tipo" name="perfilId">
                                            <option hidden>Seleccionar el Perfil</option>
                                            <%

                                                List<Perfiles> listaPerfi = dao.listarPerfilesAct();
                                                for (Perfiles perfiles : listaPerfi) {

                                            %>
                                            <option value="<%=perfiles.getPerfilid()%>"><%=perfiles.getNombreperfil()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Área de Trabajo</label>
                                        <select class="form-control" id="tipo" name="areaId">
                                            <option hidden>Seleccionar el Área de Trabajo</option>
                                            <%

                                                List<Area> listaArea = dao.listarAreasAct();
                                                for (Area area : listaArea) {

                                            %>
                                            <option value="<%=area.getAreaid()%>" data-toggle="tooltip" data-placement="top" title="<%=area.getDescripcion()%>"><%=area.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="usuario">Usuario</label>
                                        <input required type="text" maxlength="20" class="form-control" id="usuario" placeholder="Usuario" name="user">
                                        <input type="hidden" name="opcion" value="AddUsuario">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="contrasena">Contraseña</label>
                                        <input required type="password" data-minlength="6" maxlength="20" class="form-control" id="contrasena" placeholder="Contraseña" name="contrasena">
                                        <div class="help-block">Mínimo 6 digitos</div>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="codigo">Código</label>
                                        <input type="text" pattern="^[0-9][0-9]*" data-minlength="9" maxlength="10" class="form-control" id="codigo" placeholder="Código" name="codigo" required>
                                         <div class="help-block">Mínimo 9 digitos</div>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="habitacion">N° de Habitación</label>
                                        <input type="text" maxlength="8" class="form-control" id="habitacion" placeholder="N° de Habitación" name="habitacion" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="culto">N° de Culto</label>
                                        <input type="text" maxlength="4" class="form-control" id="culto" placeholder="N° de Culto" name="culto" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarUsuario()"><!--  data-dismiss="modal" -->
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
            <div id="editarUsuario" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Usuario</b></h4>
                    </div>
                    <%  
                        List<Usuario> listaEditUsuario = sdaoDao.listarEditUsuario(idUsuarioEdit);
                        for (Usuario usuarioEdit : listaEditUsuario) {
                    %>
                    <div class="panel-body">
                        <form id="edituser" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="nombresEdit">Nombres</label>
                                        <input value="<%=usuarioEdit.getNombre()%>" type="text" disabled="" class="form-control" id="nombresEdit" placeholder="Nombres" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="apellidosEdit">Apellidos</label>
                                        <input value="<%=usuarioEdit.getApellidos()%>" type="text" disabled="" class="form-control" id="apellidosEdit" placeholder="Apellidos" name="apellidos">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Usuario</label>
                                        <select class="form-control" id="tipo" name="tipoPersonaId">
                                            <option hidden>Seleccionar Tipo de Usuario</option>
                                            <%

                                                List<TipoPersona> listaTipoPerEdit = dao.listarTipoPersonaAct();
                                                for (TipoPersona tipoPerEdit : listaTipoPerEdit) {

                                            %>
                                            <option <% if(usuarioEdit.getTipopersonaid().equals(tipoPerEdit.getTipoPersonaid())){%>selected<%}%> value="<%=tipoPerEdit.getTipoPersonaid()%>"><%=tipoPerEdit.getNombreTipoPersona()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Perfil</label>
                                        <select class="form-control" id="tipo" name="perfilId">
                                            <option hidden>Seleccionar el Perfil</option>
                                            <%

                                                List<Perfiles> listaPerfiEdit = dao.listarPerfilesAct();
                                                for (Perfiles perfilesEdit : listaPerfiEdit) {

                                            %>
                                            <option <% if(usuarioEdit.getPerfilid().equals(perfilesEdit.getPerfilid())){%>selected<%}%> value="<%=perfilesEdit.getPerfilid()%>"><%=perfilesEdit.getNombreperfil()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <% if(!usuarioEdit.getAreaid().equals("")){%>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Área de Trabajo</label>
                                        <select class="form-control" id="tipo" name="areaIdEdit">
                                            <option hidden>Seleccionar el Área de Trabajo</option>
                                            <%

                                                List<Area> listaAreaEdit = dao.listarAreasAct();
                                                for (Area areaEdit : listaAreaEdit) {

                                            %>
                                            <option <% if(usuarioEdit.getAreaid().equals(areaEdit.getAreaid())){%>selected<%}%> value="<%=areaEdit.getAreaid()%>" data-toggle="tooltip" data-placement="top" title="<%=areaEdit.getDescripcion()%>"><%=areaEdit.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="usuarioEd">Usuario</label>
                                        <input value="<%=usuarioEdit.getUsuario()%>" required type="text" maxlength="20" class="form-control" id="usuarioEd" placeholder="Usuario" name="user">
                                        <input type="hidden" name="opcion" value="EditUsuario">
                                        <input type="hidden" name="id" value="<%=idUsuarioEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="contrasenaEdit">Contraseña</label>
                                        <input value="<%=usuarioEdit.getContrasena()%>" disabled required type="password" data-minlength="6" maxlength="20" class="form-control" id="contrasenaEdit" placeholder="Contraseña" name="contrasena">
                                        <div class="help-block">Mínimo 6 digitos</div>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <% if(!usuarioEdit.getCodigo().equals("") && !usuarioEdit.getHabitacion().equals("") && !usuarioEdit.getCulto().equals("")){%>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="codigoEdit">Código</label>
                                        <input value="<%=usuarioEdit.getCodigo()%>" type="text" pattern="^[0-9][0-9]*" data-minlength="9" maxlength="10" class="form-control" id="codigoEdit" placeholder="Código" name="codigo" required>
                                        <div class="help-block">Mínimo 9 digitos</div>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="habitacionEdit">N° de Habitación</label>
                                        <input value="<%=usuarioEdit.getHabitacion()%>" type="text" maxlength="8" class="form-control" id="habitacionEdit" placeholder="N° de Habitación" name="habitacion" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="cultoEdit">N° de Culto</label>
                                        <input value="<%=usuarioEdit.getCulto()%>" type="text" maxlength="4" class="form-control" id="cultoEdit" placeholder="N° de Culto" name="culto" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditUsuario()"><!--  data-dismiss="modal" -->
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
            <div class="modal fade" id="restPassUser">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #dd5600; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de restablecer la contraseña de este Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="restPass" name="id">
                                    <input type="hidden" name="opcion" value="RestablecerPassword">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-warning" type="submit">
                                        Restablecer &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="userDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteUsuario">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="userActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarUsuario">
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
            $().ready(function () {
                $("#adduser").validator({debug: true});
                $("#edituser").validator({debug: true});
            });
            $(document).ready(function (){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
