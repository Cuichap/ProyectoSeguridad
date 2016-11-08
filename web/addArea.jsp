<%-- 
    Document   : addArea
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Area"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idAreaEdit = request.getParameter("idAreaEdit"); idAreaEdit = idAreaEdit == null?"":idAreaEdit;
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
                    <h4><b>Lista de Áreas</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarArea()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaArea" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'areas', '1')" type="text" class="form-control" placeholder="Buscar Área." aria-describedby="basic-addon1">
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
                            <table style="margin-top: 0px;" id="areas" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdArea</th>
                                        <th>Área</th>
                                        <th hidden>IdSubArea</th>
                                        <th>AubÁrea</th>
                                        <th>Descripción</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;

                                        List<Area> listarAreas = dao.listarArea();
                                        for (Area area : listarAreas) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=area.getAreaid()%></td>
                                        <td><%=area.getNombre()%></td>
                                        <td hidden><%=area.getSubareaid()%></td>
                                        <td><%=area.getSubareanombre()%></td>
                                        <td><%=area.getDescripcion()%></td>
                                        <td><%=area.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=area.getAreaid()%>(<%=area.getAreaid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Área" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(area.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=area.getAreaid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Área" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(area.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=area.getAreaid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Área" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=area.getAreaid()%>() {
                                        $("#areaDelete").val("<%=area.getAreaid()%>");
                                    }
                                    function activar<%=area.getAreaid()%>() {
                                        $("#areaActive").val("<%=area.getAreaid()%>");
                                    }
                                    function Editar<%=area.getAreaid()%>(area) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addArea.jsp",
                                            data: "idAreaEdit=" + area,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaArea').style.display = 'none';
                                                document.getElementById('agregarArea').style.display = 'none';
                                                document.getElementById('editarArea').style.display = 'block';
                                                document.getElementById("areaEdit").focus();
                                                $("#aciones").html("Modificar Área");
                                            }
                                        });
                                    }
                                    function cancelarEditArea() {
                                        document.getElementById("editarea").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaArea').style.display = 'block';
                                        document.getElementById('editarArea').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Áreas");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarArea" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Área</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addarea" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="area">Área</label>
                                        <input required type="text" maxlength="30" class="form-control" id="area" placeholder="Nombre del Área" name="objeto">
                                        <input type="hidden" name="opcion" value="AddArea">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarArea()"><!--  data-dismiss="modal" -->
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
            <div id="editarArea" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Área</b></h4>
                    </div>
                    <%
                        List<Area> listaAreaEdit = dao.listarEditArea(idAreaEdit);
                        for(Area areaEditar : listaAreaEdit){
                    %>
                    <div class="panel-body">
                        <form id="editarea" class="form-signin" role="form" method="post" action="mantenimiento">
                            <% if(!areaEditar.getSubareaid().equals("")){%>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Área</label>
                                        <select class="form-control" id="tipo" name="subAreaId">
                                            <option hidden>Seleccionar el Área</option>
                                            <%

                                                List<Area> listaAreaAct = dao.listarAreasAct();
                                                for (Area areaAct : listaAreaAct) {

                                            %>
                                            <option <% if(areaEditar.getSubareaid().equals(areaAct.getAreaid())){%>selected<%}%> value="<%=areaAct.getAreaid()%>" data-toggle="tooltip" data-placement="bottom" title="<%=areaAct.getDescripcion()%>"><%=areaAct.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="area">Nombre Área</label>
                                        <input value="<%=areaEditar.getNombre()%>" required type="text" maxlength="30" class="form-control" id="areaEdit" placeholder="Nombre del Área" name="nombres">
                                        <input type="hidden" name="opcion" value="EditArea">
                                        <input type="hidden" name="id" value="<%=idAreaEdit%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo</label>
                                        <select <% if(areaEditar.getTipo().equals("nivel1")){%>disabled<%}%> class="form-control" id="tipo" name="tipo">
                                            <option hidden>Seleccionar el Tipo</option>
                                            <option <% if(areaEditar.getTipo().equals("nivel1")){%>selected<%}%> value="nivel1">Área</option>
                                            <option <% if(areaEditar.getTipo().equals("nivel2")){%>selected<%}%> value="nivel2">SubÁrea</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group has-feedback">
                                        <label for="area">Descripción</label>
                                        <input value="<%=areaEditar.getDescripcion()%>" required type="text" maxlength="300" class="form-control" id="descripcion" placeholder="Descripción del Área" name="descripcion">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditArea()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar esta Persona?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="areaDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteArea">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar esta Persona?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="areaActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarArea">
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
                $("#addarea").validator({debug: true});
                $("#editarea").validator({debug: true});
            });
            $(document).ready(function (){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
