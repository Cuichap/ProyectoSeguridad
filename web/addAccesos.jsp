<%-- 
    Document   : addAccesos
    Created on : 4/11/2016, 10:01:33 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Acceso"%>
<%@page import="rest.modelo.daoimpl.SeguridadDaoImpl"%>
<%@page import="rest.modelo.dao.SeguridadDao"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h4><b>Lista de Accesos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarMenuPerfil()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaMenuPerfil" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'menus', '1')" type="text" class="form-control" placeholder="Buscar Menú." aria-describedby="basic-addon1">
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
                            <table style="margin-top: 0px;" id="menus" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>Perfil Id</th>
                                        <th>Perfil</th>
                                        <th hidden>Menu Id</th>
                                        <th>Menú</th>
                                        <th hidden>SubMenú Id</th>
                                        <th>SubMenú</th>
                                        <th>Tipo</th>
                                        <th>Url</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        SeguridadDao sdaoDao = new SeguridadDaoImpl();

                                        int count = 0;

                                        List<Acceso> listAccess = sdaoDao.listarAccesos();
                                        for (Acceso acceso : listAccess) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=acceso.getPerfilId()%></td>
                                        <td><%=acceso.getNombrePerfil()%></td>
                                        <td hidden><%=acceso.getMenuId()%></td>
                                        <td><%=acceso.getNombreMenu()%></td>
                                        <td hidden><%=acceso.getSubMenuId()%></td>
                                        <td><%=acceso.getNombreSubMenu()%></td>
                                        <td><%=acceso.getTipo()%></td>
                                        <td><%=acceso.getUrl()%></td>
                                        <td><%=acceso.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Menú" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (acceso.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=acceso.getPerfilId()%><%=acceso.getMenuId()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Quitar Menú" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (acceso.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=acceso.getPerfilId()%><%=acceso.getMenuId()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Añadir Menú" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=acceso.getPerfilId()%><%=acceso.getMenuId()%>() {
                                        $("#perfilDelete").val("<%=acceso.getPerfilId()%>");
                                        $("#menuDelete").val("<%=acceso.getMenuId()%>");
                                    }
                                    function activar<%=acceso.getPerfilId()%><%=acceso.getMenuId()%>() {
                                        $("#perfilActive").val("<%=acceso.getPerfilId()%>");
                                        $("#menuActive").val("<%=acceso.getMenuId()%>");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarMenuPerfil" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addMenuperfil" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Perfiles</label>
                                        <select class="form-control" id="tipo" name="perfilId">
                                            <option hidden>Seleccionar perfil</option>
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarMenuPerfil()"><!--  data-dismiss="modal" -->
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
            <div class="modal fade" id="delete">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #c71c22; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Quitar este Menú?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="" id="perfilDelete" name="id">
                                    <input type="" id="menuDelete" name="iduser">
                                    <input type="" name="opcion" value="DeleteAcceso">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-danger" type="submit">
                                        Quitar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
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
                            <h3 align="center"><span><b>¿Está seguro de Anadir este Menú?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="" id="perfilActive" name="id">
                                    <input type="" id="menuActive" name="iduser">
                                    <input type="" name="opcion" value="ActivarAcceso">
                                </div>
                                <h4 align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                    </button>
                                    <button class="btn btn-primary" type="submit">
                                        Añadir &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
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
