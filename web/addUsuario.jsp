<%-- 
    Document   : addUsuario
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Area"%>
<%@page import="rest.modelo.entidad.Perfiles"%>
<%@page import="rest.modelo.entidad.TipoPersona"%>
<%@page import="rest.modelo.entidad.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                                        <th>Contraseña</th>
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

                                        int count = 0;

                                        List<Usuario> listaUser = dao.listarUsuario();
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
                                        <td><%=usuario.getContrasena()%></td>
                                        <td><%=usuario.getCodigo()%></td>
                                        <td><%=usuario.getHabitacion()%></td>
                                        <td><%=usuario.getCulto()%></td>
                                        <td><%=usuario.getEstado()%></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Restablecer Contraseña" align="center"><a onclick="restabelcer<%=usuario.getUsuarioid()%>()" data-toggle="modal" data-target="#restPassUser"><i class="glyphicon glyphicon-refresh"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Usuario" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar Usuario" align="center"><a onclick="eliminar<%=usuario.getUsuarioid()%>()" data-toggle="modal" data-target="#delete"><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                <script>
                                    function eliminar<%=usuario.getUsuarioid()%>() {
                                        $("#userDelete").val("<%=usuario.getUsuarioid()%>");
                                    }
                                    function restabelcer<%=usuario.getUsuarioid()%>() {
                                        $("#restPass").val("<%=usuario.getUsuarioid()%>");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarUsuario" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos del Usuario</b></span></h3>
                    </div>
                    <div class="panel-body">
                        <form id="adduser" class="form-signin" role="form" method="post" action="mantenimiento">
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
                                        <input type="text" maxlength="20" class="form-control" id="usuario" placeholder="Usuario" name="user">
                                        <input type="hidden" name="opcion" value="AddUsuario">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="contrasena">Contraseña</label>
                                        <input type="password" data-minlength="6" maxlength="20" class="form-control" id="contrasena" placeholder="Contraseña" name="contrasena">
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
                                        <input type="text" pattern="^[0-9][0-9]*" data-minlength="9" maxlength="10" class="form-control" id="codigo" placeholder="Código" name="codigo">
                                         <div class="help-block">Mínimo 9 digitos</div>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="habitacion">N° de Habitación</label>
                                        <input type="text" maxlength="8" class="form-control" id="habitacion" placeholder="N° de Habitación" name="habitacion">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group has-feedback">
                                        <label for="culto">N° de Culto</label>
                                        <input type="text" maxlength="4" class="form-control" id="culto" placeholder="N° de Culto" name="culto">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarUsuario()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Registrar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
                                </button>
                            </h4>
                            <h1></h1>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="restPassUser">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #dd5600; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de restablecer la contraceña de este Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
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
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
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
        </div>
       <script type="text/javascript">
            $().ready(function () {
                $("#adduser").validator({debug: true});
            });
        </script> 
    </body>
</html>
