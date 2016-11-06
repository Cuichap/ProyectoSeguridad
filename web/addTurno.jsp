<%-- 
    Document   : addTurno
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.Turno"%>
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
                    <h4><b>Lista de Turnos</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarTurno()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaTurno" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'turnos', '1')" type="text" class="form-control" placeholder="Buscar Turnos." aria-describedby="basic-addon1">
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
                            <table style="margin-top: 0px;" id="turnos" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdTurno</th>
                                        <th>Turno</th>
                                        <th>Hora de Inicio</th>
                                        <th>Hora de Fin</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;
                                        List<Turno> listarTurnos = dao.listarTurnos();
                                        for (Turno turn : listarTurnos) {
                                            count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=turn.getTurnoid()%></td>
                                        <td><%=turn.getNombreturno()%></td>
                                        <td><%=turn.getHorainicio()%></td>
                                        <td><%=turn.getHorafin()%></td>
                                        <td><%=turn.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Turno" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (turn.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=turn.getTurnoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Turno" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (turn.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="activar<%=turn.getTurnoid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Turno" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=turn.getTurnoid()%>() {
                                        $("#turnoDelete").val("<%=turn.getTurnoid()%>");
                                    }
                                    function activar<%=turn.getTurnoid()%>() {
                                        $("#turnoActive").val("<%=turn.getTurnoid()%>");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarTurno" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Ingresar los Datos del Turno</b></h4>
                    </div>
                    <div class="panel-body">
                        <form id="addturno" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="turno">Turno</label>
                                        <input maxlength="10" autofocus="true" pattern="^[A-Za-záéíóúñ ]*" type="text" class="form-control" id="turno" placeholder="Ingresar el Nombre del Turno" name="nombres" required>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="horainicio">Hora de Inicio</label>
                                        <input type="time" class="form-control" id="horainicio" placeholder="Ingresar de Inicio" name="horainicio" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="hoorafin">Hora de Fin</label>
                                        <input type="time" class="form-control" id="horafin" placeholder="Ingresar de Fin" name="horafin" required>
                                        <input type="hidden" name="opcion" value="AddTurno">
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarTurno()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar este Turno?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="turnoDelete" name="id">
                                    <input type="hidden" name="opcion" value="DeleteTurno">
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
                            <h3 align="center"><span><b>¿Está seguro de Activar este Turno?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="turnoActive" name="id">
                                    <input type="hidden" name="opcion" value="ActivarTurno">
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
                $("#addturno").validator({debug: true});
            });
        </script>
    </body>
</html>
