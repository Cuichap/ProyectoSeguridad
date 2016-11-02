<%-- 
    Document   : addMenu
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.Opcion"%>
<%@page import="java.util.List"%>
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
                    <h4><b>Lista de Menús</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" disabled onclick="agregarMenu()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaMenu" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
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
                                        <th hidden>IdMenu</th>
                                        <th>Menú</th>
                                        <th hidden>IdSubMenu</th>
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
                                        int count = 0;

                                        List<Opcion> listMen = dao.listarMenus();
                                        for (Opcion opc : listMen) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=opc.getOpcionesid()%></td>
                                        <td><%=opc.getMenu()%></td>
                                        <td hidden><%=opc.getSubopcionesid()%></td>
                                        <td><%=opc.getSubmenu()%></td>
                                        <td><%=opc.getTipo()%></td>
                                        <td><%=opc.getUrl()%></td>
                                        <td><%=opc.getEstado()%></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Menú" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar Menú" align="center"><a onclick="eliminar<%=opc.getOpcionesid()%>()" data-toggle="modal" data-target="#delete"><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                <script>
                                        function eliminar<%=opc.getOpcionesid()%>() {
                                            $("#menuDelete").val("<%=opc.getOpcionesid()%>");
                                        }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarMenu" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos del Menú</b></span></h3>
                    </div>
                    <div class="panel-body">
                        <form id="addmenu" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="menu">Menú</label>
                                        <input type="text" class="form-control" id="menu" placeholder="Nombre del Menú" name="nombres">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoMenu">Tipo de Menú</label>
                                        <select class="form-control" id="tipoMenu" name="tipoMenu">
                                            <option hidden>Seleccionar Tipo de Menú</option>
                                            <option value="nivel1">Menú</option>
                                            <option value="nivel2">SubMenú</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoMenu">Seleccionar Menú</label>
                                        <select class="form-control" id="tipo" name="idSubMenu">
                                            <option value="null" hidden>Seleccionar Menú</option>
                                            <%

                                                List<Opcion> listaOpcAct = dao.listarOpcionesAct();
                                                for (Opcion opcionact : listaOpcAct) {

                                            %>
                                            <option value="<%=opcionact.getOpcionesid()%>"><%=opcionact.getMenu()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="url">Url</label>
                                        <input type="text" class="form-control" id="url" placeholder="Url del Menú" name="url">
                                        <input type="hidden" name="opcion" value="AddMenu">
                                    </div>
                                </div>
                            </div>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarMenu()"><!--  data-dismiss="modal" -->
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
            <div class="modal fade" id="delete">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #c71c22; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Menú?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="menuDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteMenu">
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
    </body>
</html>
