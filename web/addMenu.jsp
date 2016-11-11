<%-- 
    Document   : addMenu
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.SeguridadDaoImpl"%>
<%@page import="rest.modelo.dao.SeguridadDao"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.Opcion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idMenuEdit = request.getParameter("idMenuEdit"); idMenuEdit = idMenuEdit == null ? "" : idMenuEdit;
    String estadoMenu = request.getParameter("estadoMenu"); estadoMenu = estadoMenu == null ? "1" : estadoMenu;
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
                         <script>
                            $(document).ready(function (){
                                    $('select[name=estadoMenu]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addMenu.jsp",
                                            data: "estadoMenu="+ $('select[name=estadoMenu]').val(),
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoMenu" class="form-control" name="estadoMenu">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoMenu.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoMenu.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
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
                                        SeguridadDao sdaoDao = new SeguridadDaoImpl();
                                        
                                        int count = 0;

                                        List<Opcion> listMen = sdaoDao.listarMenus(estadoMenu);
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
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=opc.getOpcionesid()%>(<%=opc.getOpcionesid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Menú" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(opc.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=opc.getOpcionesid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Menú" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(opc.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=opc.getOpcionesid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Menú" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=opc.getOpcionesid()%>() {
                                        $("#menuDelete").val("<%=opc.getOpcionesid()%>");
                                    }
                                    function activar<%=opc.getOpcionesid()%>() {
                                        $("#menuActive").val("<%=opc.getOpcionesid()%>");
                                    }
                                    function Editar<%=opc.getOpcionesid()%>(menu) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addMenu.jsp",
                                            data: "idMenuEdit=" + menu,
                                            success: function (data) {
                                                $("#seguridad").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaMenu').style.display = 'none';
                                                document.getElementById('agregarMenu').style.display = 'none';
                                                document.getElementById('editarMenu').style.display = 'block';
                                                document.getElementById("menuEd").focus();
                                                $("#aciones").html("Modificar Menú");
                                            }
                                        });
                                    }
                                    function cancelarEditMenu() {
                                        document.getElementById("editmenu").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaMenu').style.display = 'block';
                                        document.getElementById('editarMenu').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Menús");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarMenu" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Menú</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addmenu" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="menu">Menú</label>
                                        <input type="text" class="form-control" id="menu" placeholder="Nombre del Menú" name="nombres">
                                        <input type="hidden" name="opcion" value="AddMenu">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
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
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarMenu()"><!--  data-dismiss="modal" -->
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
            <div id="editarMenu" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Menú</b></h4>
                    </div>
                    <%  
                        List<Opcion> listaEditPerfilesEdit = sdaoDao.listarEditMenus(idMenuEdit);
                        for (Opcion opcEdit : listaEditPerfilesEdit) {
                    %>
                    <div class="panel-body">
                        <form id="editmenu" class="form-signin" role="form" method="post" action="seguridad">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="menuEd">Menú</label>
                                        <input value="<%=opcEdit.getMenu()%>" type="text" class="form-control" id="menuEd" placeholder="Nombre del Menú" name="nombres">
                                        <input type="hidden" name="opcion" value="EditMenu">
                                        <input type="hidden" name="id" value="<%=idMenuEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoMenuEd">Tipo de Menú</label>
                                        <select class="form-control" disabled id="tipoMenuEd" name="tipoMenu">
                                            <option hidden>Seleccionar Tipo de Menú</option>
                                            <option <% if(opcEdit.getTipo().equals("nivel1")){%>selected<%}%> value="nivel1">Menú</option>
                                            <option <% if(opcEdit.getTipo().equals("nivel2")){%>selected<%}%> value="nivel2">SubMenú</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <% if(opcEdit.getTipo().equals("nivel2")){%>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="menuEd">Pertenece al Menú</label>
                                        <select class="form-control" disabled id="menuEd" name="idSubMenu">
                                            <option value="null" hidden>Seleccionar Menú</option>
                                            <%

                                                List<Opcion> listaOpcActEdit = dao.listarOpcionesAct();
                                                for (Opcion opcactEdit : listaOpcActEdit) {

                                            %>
                                            <option <% if(opcEdit.getSubopcionesid().equals(opcactEdit.getOpcionesid())){%>selected<%}%> value="<%=opcactEdit.getOpcionesid()%>"><%=opcactEdit.getMenu()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <%} if(opcEdit.getTipo().equals("nivel1")){%>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="urlEd">Url</label>
                                        <input value="<%=opcEdit.getUrl()%>" disabled type="text" class="form-control" id="urlEd" placeholder="Url del Menú" name="url">
                                    </div>
                                </div>
                                <%}%>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditMenu()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Menú?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
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
            <div class="modal fade" id="activar">
                <section class="modal-dialog modal-md">
                    <section class="modal-content">
                        <section class="modal-header" style="border-top-left-radius: 5px; border-top-right-radius: 5px; background: #3b5998; color: white;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;"><span aria-hidden="true">&times;</span></button>
                            <h3 align="center"><span><b>¿Está seguro de Activar este Menú?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="seguridad">
                                <div class="row">
                                    <input type="hidden" id="menuActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarMenu">
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
        </script>
    </body>
</html>
