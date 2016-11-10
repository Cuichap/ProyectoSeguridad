<%-- 
    Document   : addPerfil
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.SeguridadDaoImpl"%>
<%@page import="rest.modelo.dao.SeguridadDao"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Perfiles"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idPerfilEdit = request.getParameter("idPerfilEdit"); idPerfilEdit = idPerfilEdit == null ? "" : idPerfilEdit;
    String estadoPerfil = request.getParameter("estadoPerfil"); estadoPerfil = estadoPerfil == null ? "1" : estadoPerfil;
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
                    <h4><b>Lista de Perfiles</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarPerfil()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaPerfil" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'perfiles', '1')" type="text" class="form-control" placeholder="Buscar Perfil." aria-describedby="basic-addon1">
                            </div>
                        </article>
                         <script>
                            $(document).ready(function (){
                                    $('select[name=estadoPerfil]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addPerfil.jsp",
                                            data: "estadoPerfil="+ $('select[name=estadoPerfil]').val(),
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoPerfil" class="form-control" name="estadoPerfil">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoPerfil.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoPerfil.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="perfiles" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdPerfil</th>
                                        <th>Perfil</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        SeguridadDao sdaoDao = new SeguridadDaoImpl();
                                        
                                        int count = 0;
                                        
                                        List<Perfiles> listarPerfiles = sdaoDao.listarPerfiles(estadoPerfil);
                                        for (Perfiles perfiles : listarPerfiles) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=perfiles.getPerfilid()%></td>
                                        <td><%=perfiles.getNombreperfil()%></td>
                                        <td><%=perfiles.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=perfiles.getPerfilid()%>(<%=perfiles.getPerfilid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Perfil" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (perfiles.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=perfiles.getPerfilid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Perfil" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (perfiles.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=perfiles.getPerfilid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Perfil" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=perfiles.getPerfilid()%>() {
                                        $("#perfilDelete").val("<%=perfiles.getPerfilid()%>");
                                    }
                                    function activar<%=perfiles.getPerfilid()%>() {
                                        $("#perfilActive").val("<%=perfiles.getPerfilid()%>");
                                    }
                                    function Editar<%=perfiles.getPerfilid()%>(perfil) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addPerfil.jsp",
                                            data: "idPerfilEdit=" + perfil,
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaPerfil').style.display = 'none';
                                                document.getElementById('agregarPerfil').style.display = 'none';
                                                document.getElementById('editarPerfil').style.display = 'block';
                                                document.getElementById("perfilEdit").focus();
                                                $("#aciones").html("Modificar Perfil");
                                            }
                                        });
                                    }
                                    function cancelarEditperfil() {
                                        document.getElementById("editperfil").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaPerfil').style.display = 'block';
                                        document.getElementById('editarPerfil').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Perfiles");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarPerfil" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Perfil</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addperfil" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="perfil">Perfil</label>
                                        <input type="text" pattern="^[A-Za-záéíóú ]*" maxlength="50" class="form-control" id="perfil" placeholder="Nombre del Perfil" name="nombres"  required>
                                        <input type="hidden" name="opcion" value="AddPerfil">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarPerfil()"><!--  data-dismiss="modal" -->
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
            <div id="editarPerfil" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Perfil</b></h4>
                    </div>
                    <%  
                        List<Perfiles> listaEditPerfiles = sdaoDao.listarEditPerfil(idPerfilEdit);
                        for (Perfiles perfilesEdit : listaEditPerfiles) {
                    %>
                    <div class="panel-body">
                        <form id="editperfil" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="perfilEdit">Nombre del Perfil</label>
                                        <input value="<%=perfilesEdit.getNombreperfil()%>" type="text" pattern="^[A-Za-záéíóú ]*" maxlength="50" class="form-control" id="perfilEdit" placeholder="Nombre del Perfil" name="nombres"  required>
                                        <input type="hidden" name="opcion" value="EditPerfil">
                                        <input type="hidden" name="id" value="<%=idPerfilEdit%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditperfil()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Perfil de Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="perfilDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeletePerfil">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Perfil de Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="perfilActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarPerfil">
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
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
            $().ready(function () {
                $("#addperfil").validator({debug: true});
                $("#editperfil").validator({debug: true});
            });
        </script>
    </body>
</html>
