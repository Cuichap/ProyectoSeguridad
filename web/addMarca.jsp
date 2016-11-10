<%-- 
    Document   : addMarca
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Marca"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idMarcaEdit = request.getParameter("idMarcaEdit"); idMarcaEdit = idMarcaEdit == null?"":idMarcaEdit;
    String estadoMarca=request.getParameter("estadoMarca"); estadoMarca = estadoMarca == null?"1":estadoMarca;
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
                    <h4><b>Lista de Marcas</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarMarca()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaMarca" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'marcas', '1')" type="text" class="form-control" placeholder="Buscar Marcas." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            $(document).ready(function (){
                                    $('select[name=estadoMarca]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addMarca.jsp",
                                            data: "estadoMarca="+ $('select[name=estadoMarca]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoMarca" class="form-control" name="estadoMarca">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoMarca.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoMarca.equals("0")){%>selected<%}%> value="0">Inactivos</option>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="marcas" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdMarca</th>
                                        <th>Marca</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;
                                        List<Marca> listaMarcas = dao.listarMarcas(estadoMarca);
                                        for (Marca marca : listaMarcas) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=marca.getMarcaid()%></td>
                                        <td><%=marca.getNombremarca()%></td>
                                        <td><%=marca.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=marca.getMarcaid()%>(<%=marca.getMarcaid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Marca" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (marca.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=marca.getMarcaid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Marca" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (marca.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=marca.getMarcaid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Marca" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=marca.getMarcaid()%>() {
                                        $("#marcaDelete").val("<%=marca.getMarcaid()%>");
                                    }
                                    function activar<%=marca.getMarcaid()%>() {
                                        $("#marcaActive").val("<%=marca.getMarcaid()%>");
                                    }
                                    function Editar<%=marca.getMarcaid()%>(marca) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addMarca.jsp",
                                            data: "idMarcaEdit=" + marca,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaMarca').style.display = 'none';
                                                document.getElementById('agregarMarca').style.display = 'none';
                                                document.getElementById('editarMarca').style.display = 'block';
                                                document.getElementById("marcaEdit").focus();
                                                $("#aciones").html("Modificar Marca");
                                            }
                                        });
                                    }
                                    function cancelarEditMarca() {
                                        document.getElementById("editmarca").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaMarca').style.display = 'block';
                                        document.getElementById('editarMarca').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Marcas");
                                    }
                                     
                              
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarMarca" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos de la Marca</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addmarca" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="marca">Marca</label>
                                        <input required maxlength="20" autofocus="true" type="text" class="form-control" id="marca" placeholder="Ingresar la Marca" name="nombres">
                                        <input type="hidden" name="opcion" value="AddMarca">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarMarca()"><!--  data-dismiss="modal" -->
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
            <div id="editarMarca" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos de la Marca</b></h4>
                    </div>
                    <%
                        List<Marca> listaMarcaEdit = dao.listarEditMarcas(idMarcaEdit);
                        for(Marca marcaEditar : listaMarcaEdit){
                    %>
                    <div class="panel-body">
                        <form id="editmarca" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="marcaEdit">Marca</label>
                                        <input value="<%=marcaEditar.getNombremarca()%>" required maxlength="20" autofocus="true" type="text" class="form-control" id="marcaEdit" placeholder="Ingresar la Marca" name="nombres">
                                        <input type="hidden" name="opcion" value="EditMarca">
                                        <input type="hidden" name="id" value="<%=idMarcaEdit%>">
                                        <input type="hidden" name="idUserReg" value="<%=idUsuario%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditMarca()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar esta Marca?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="marcaDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteMarca">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar esta Marca?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="marcaActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarMarca">
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
                $("#addmarca").validator({debug: true});
                $("#editmarca").validator({debug: true});
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
