<%-- 
    Document   : addDeber
    Created on : 20/10/2016, 10:16:33 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.TipoDeber"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Deber"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idDeberEdit = request.getParameter("idDeberEdit"); idDeberEdit = idDeberEdit == null?"":idDeberEdit;
    String estadoDeber = request.getParameter("estadoDeber"); estadoDeber = estadoDeber == null?"1":estadoDeber;
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
                    <h4><b>Lista de Deberes</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarDeber()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaDeber" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'deberes', '1')" type="text" class="form-control" placeholder="Buscar Deber." aria-describedby="basic-addon1">
                            </div>
                        </article>
                         <script>
                            $(document).ready(function (){
                                    $('select[name=estadoDeber]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addDeber.jsp",
                                            data: "estadoDeber="+ $('select[name=estadoDeber]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoDeber" class="form-control" name="estadoDeber">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoDeber.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoDeber.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="deberes" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdDeber</th>
                                        <th>Deber</th>
                                        <th hidden>IdTipoDber</th>
                                        <th>TipoDeber</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;

                                        List<Deber> listarDeber = dao.listarDeberes(estadoDeber);
                                        for (Deber deb : listarDeber) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=deb.getDeberid()%></td>
                                        <td><%=deb.getNombredeber()%></td>
                                        <td hidden><%=deb.getTipodeberid()%></td>
                                        <td><%=deb.getNombretipodeber()%></td>
                                        <td><%=deb.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=deb.getDeberid()%>(<%=deb.getDeberid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Deber" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(deb.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=deb.getDeberid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Deber" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(deb.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=deb.getDeberid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Deber" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=deb.getDeberid()%>() {
                                        $("#deberDelete").val("<%=deb.getDeberid()%>");
                                    }
                                    function activar<%=deb.getDeberid()%>() {
                                        $("#deberActive").val("<%=deb.getDeberid()%>");
                                    }
                                    function Editar<%=deb.getDeberid()%>(deber) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addDeber.jsp",
                                            data: "idDeberEdit=" + deber,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaDeber').style.display = 'none';
                                                document.getElementById('agregarDeber').style.display = 'none';
                                                document.getElementById('editarDeber').style.display = 'block';
                                                document.getElementById("deberEdit").focus();
                                                $("#aciones").html("Modificar Deber");
                                            }
                                        });
                                    }
                                    function cancelarEditDeber() {
                                        document.getElementById("editdeber").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaDeber').style.display = 'block';
                                        document.getElementById('editarDeber').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Deberes");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div><!-- col-md-10 col-xs-offset-1 -->
            <div id="agregarDeber" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Deber</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="adddeber" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deber">Deber</label>
                                        <input type="text" class="form-control" id="deber" placeholder="Nombre del Deber" name="nombres">
                                        <input type="hidden" name="opcion" value="AddDeber">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Deber</label>
                                        <select class="form-control" id="tipo" name="tipoDeberId">
                                            <option hidden>Seleccionar el Tipo de Deber</option>
                                            <%

                                                List<TipoDeber> listaTipoDeberAct = dao.listarTipoDeberAct();
                                                for (TipoDeber tipoDeber : listaTipoDeberAct) {

                                            %>
                                            <option value="<%=tipoDeber.getTipodeberid()%>"><%=tipoDeber.getNombretipodeber()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarDeber()"><!--  data-dismiss="modal" -->
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
            <div id="editarDeber" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos del Deber</b></h4>
                    </div>
                    <%
                        List<Deber> listaDeberEdit = dao.listarEditDeberes(idDeberEdit);
                        for(Deber deberEditar : listaDeberEdit){
                    %>
                    <div class="panel-body">
                        <form id="editdeber" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deberEdit">Deber</label>
                                        <input value="<%=deberEditar.getNombredeber()%>" type="text" class="form-control" id="deberEdit" placeholder="Nombre del Deber" name="nombres">
                                        <input type="hidden" name="opcion" value="EditDeber">
                                        <input type="hidden" name="id" value="<%=idDeberEdit%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Deber</label>
                                        <select class="form-control" id="tipo" name="tipoDeberId">
                                            <option hidden>Seleccionar el Tipo de Deber</option>
                                            <%

                                                List<TipoDeber> listaTipoDeberEditAct = dao.listarTipoDeberAct();
                                                for (TipoDeber tipoDeberEdit : listaTipoDeberEditAct) {

                                            %>
                                            <option <% if(deberEditar.getTipodeberid().equals(tipoDeberEdit.getTipodeberid())){%>selected<%}%> value="<%=tipoDeberEdit.getTipodeberid()%>"><%=tipoDeberEdit.getNombretipodeber()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditDeber()"><!--  data-dismiss="modal" -->
                                    Cancelar &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                                <button class="btn btn-primary" type="submit">
                                    Moficar &nbsp;&nbsp; <i class="glyphicon glyphicon-ok-circle"></i>
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Deber?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="deberDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteDeber">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Deber?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="deberActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarDeber">
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
