<%-- 
    Document   : addObjeto
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Objeto"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idObjetoEdit = request.getParameter("idObjetoEdit"); idObjetoEdit = idObjetoEdit == null ? "" : idObjetoEdit;
    String estadoObjeto = request.getParameter("estadoObjeto"); estadoObjeto = estadoObjeto == null ? "1" : estadoObjeto;
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
                    <h4><b>Lista de Objetos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarObjeto()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaObjeto" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'objetos', '1')" type="text" class="form-control" placeholder="Buscar Objeto." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            $(document).ready(function (){
                                    $('select[name=estadoObjeto]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addObjeto.jsp",
                                            data: "estadoObjeto="+ $('select[name=estadoObjeto]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoObjeto" class="form-control" name="estadoObjeto">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoObjeto.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoObjeto.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="objetos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdObjeto</th>
                                        <th>Objeto</th>
                                        <th>Descripción</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;

                                        List<Objeto> listarObjeto = dao.listarObjeto(estadoObjeto);
                                        for (Objeto obj : listarObjeto) {

                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=obj.getObjetoid()%></td>
                                        <td><%=obj.getNombreobjeto()%></td>
                                        <td><%=obj.getDescripcion()%></td>
                                        <td><%=obj.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=obj.getObjetoid()%>(<%=obj.getObjetoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Objeto" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <%if (obj.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=obj.getObjetoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Objeto" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (obj.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=obj.getObjetoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Objeto" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=obj.getObjetoid()%>() {
                                        $("#objDelete").val("<%=obj.getObjetoid()%>");
                                    }
                                    function activar<%=obj.getObjetoid()%>() {
                                        $("#objActive").val("<%=obj.getObjetoid()%>");
                                    }
                                    function Editar<%=obj.getObjetoid()%>(objeto) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addObjeto.jsp",
                                            data: "idObjetoEdit=" + objeto,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaObjeto').style.display = 'none';
                                                document.getElementById('agregarObjeto').style.display = 'none';
                                                document.getElementById('editarObjeto').style.display = 'block';
                                                document.getElementById("objetoEdit").focus();
                                                $("#aciones").html("Modificar Objeto");
                                            }
                                        });
                                    }
                                    function cancelarEditObjeto() {
                                        document.getElementById("editobj").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaObjeto').style.display = 'block';
                                        document.getElementById('editarObjeto').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Objetos");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarObjeto" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 align="center"><b>Ingresar los Datos del Objeto</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addobj" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="objeto">Objeto</label>
                                        <input required type="text" maxlength="30" class="form-control" id="objeto" placeholder="Nombre del Objeto" name="nombres">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <textarea maxlength="300" class="form-control" rows="4" id="descripcion" placeholder="Descripción del Objeto" name="descripcion"></textarea>
                                        <input type="hidden" name="opcion" value="AddObjeto">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarObjeto()"><!--  data-dismiss="modal" -->
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
            <div id="editarObjeto" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 align="center"><b>Modificar los Datos del Objeto</b></h4>
                    </div>
                    <%
                        List<Objeto> listaEditObj = dao.listarEditObjeto(idObjetoEdit);
                        for (Objeto objeto : listaEditObj) {
                    %>
                    <div class="panel-body">
                        <form id="editobj" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="objeto">Objeto</label>
                                        <input value="<%=objeto.getNombreobjeto()%>" required type="text" maxlength="30" class="form-control" id="objetoEdit" placeholder="Nombre del Objeto" name="nombres">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <input value="<%=objeto.getDescripcion()%>" type="text" maxlength="300" class="form-control" id="descripcion" placeholder="Descripción del Objeto" name="descripcion">
                                        <input type="hidden" name="opcion" value="EditObjeto">
                                        <input type="hidden" name="id" value="<%=idObjetoEdit%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditObjeto()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Objeto?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="objDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteObjeto">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Objeto?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="objActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarObjeto">
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
                $("#addobj").validator({debug: true});
                $("#editobj").validator({debug: true});
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
