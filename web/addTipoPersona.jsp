<%-- 
    Document   : addTipoPersona
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.TipoPersona"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idTipoPersonaEdit = request.getParameter("idTipoPersonaEdit"); idTipoPersonaEdit = idTipoPersonaEdit == null ? "" : idTipoPersonaEdit;
%>
<html>
    <head>
    </head>
    <body>
        <div class="col-sm-12">
            <br>
            <section id="lista" class="col-sm-12 well well-sm backcolor" style="display: block; margin-bottom: -50px;">
                <article class="col-sm-6" style="color: white;">
                    <h4><b>Lista de Tipos de Personas</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTipoPer()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTipoPer" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'persona', '1')" type="text" class="form-control" placeholder="Buscar Tipo de Persona." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estado" class="form-control" name="estado">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option value="0">Activos</option>
                                    <option value="1">Inactivos</option>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="margin-top: 0px;" id="persona" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>Id Tipo Persona</th>
                                        <th>Tipo de Persona</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        
                                        int count = 0;

                                        List<TipoPersona> listaTipoPer = dao.listarTipoPersona();
                                        for (TipoPersona tipoPersona : listaTipoPer) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=tipoPersona.getTipoPersonaid()%></td>
                                        <td><%=tipoPersona.getNombreTipoPersona()%></td>
                                        <td><%=tipoPersona.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=tipoPersona.getTipoPersonaid()%>(<%=tipoPersona.getTipoPersonaid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Tipo de Persona" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <%if(tipoPersona.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=tipoPersona.getTipoPersonaid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Tipo de Persona" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(tipoPersona.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="activar<%=tipoPersona.getTipoPersonaid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Tipo de Persona" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=tipoPersona.getTipoPersonaid()%>() {
                                        $("#tipPerDelete").val("<%=tipoPersona.getTipoPersonaid()%>");
                                    }
                                    function activar<%=tipoPersona.getTipoPersonaid()%>() {
                                        $("#tipPerActive").val("<%=tipoPersona.getTipoPersonaid()%>");
                                    }
                                    function Editar<%=tipoPersona.getTipoPersonaid()%>(tipoPersona) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addTipoPersona.jsp",
                                            data: "idTipoPersonaEdit=" + tipoPersona,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaTipoPer').style.display = 'none';
                                                document.getElementById('agregarTipoPer').style.display = 'none';
                                                document.getElementById('editarTipoPer').style.display = 'block';
                                                document.getElementById("tipoPerEdit").focus();
                                                $("#aciones").html("Modificar Tipo de Persona");
                                            }
                                        });
                                    }
                                    function cancelarEditTipoPer() {
                                        document.getElementById("edittipoper").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaTipoPer').style.display = 'block';
                                        document.getElementById('editarTipoPer').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Tipos de Personas");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTipoPer" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><span><b>Ingresar el Tipo de Persona</b></span></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addtipoper" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipo">Tipo Persona</label>
                                        <input type="text" required pattern="^[A-Za-záéíóú ][A-Za-záéíóú ]*" maxlength="30" class="form-control" id="tipo" placeholder="Nombre del Tipo Persona" name="nombreTipoPersona" data-error="Solo se permite letras y no numeros">
                                        <input type="hidden" name="opcion" value="AddTipoPersona">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTipoPer()"><!--  data-dismiss="modal" -->
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
            <div id="editarTipoPer" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><span><b>Modificar el Tipo de Persona</b></span></h4>
                    </div>
                    <%
                        List<TipoPersona> listaEditTipoPer = dao.listarEditTipoPersona(idTipoPersonaEdit);
                        for (TipoPersona tp : listaEditTipoPer) {
                    %>
                    <div class="panel-body">
                        <form id="edittipoper" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipo">Tipo Persona</label>
                                        <input value="<%=tp.getNombreTipoPersona()%>" type="text" required pattern="^[A-Za-záéíóú ][A-Za-záéíóú ]*" maxlength="30" class="form-control" id="tipoPerEdit" placeholder="Nombre del Tipo Persona" name="nombreTipoPersona" data-error="Solo se permite letras y no numeros">
                                        <input type="hidden" name="opcion" value="EditTipoPersona">
                                        <input type="hidden" name="id" value="<%=idTipoPersonaEdit%>">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditTipoPer()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Tipo de Persona?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipPerDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTipoPersona">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Tipo de Persona?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="tipPerActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTipoPersona">
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
                $("#addtipoper").validator({debug: true});
                $("#editarTipoPer").validator({debug: true});
            });
            $(document).ready(function (){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
