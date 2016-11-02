<%-- 
    Document   : addResponsabilidad
    Created on : 21/10/2016, 01:21:29 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Turno"%>
<%@page import="rest.modelo.entidad.Deber"%>
<%@page import="rest.modelo.entidad.Responsabilidad"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
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
                    <h4><b>Lista de Responsabilidades</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarResponsabilidad()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaResponsabilidad" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'responsabilidades', '1')" type="text" class="form-control" placeholder="Buscar Responsabilidades." aria-describedby="basic-addon1">
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
                            <table style="margin-top: 0px;" id="responsabilidades" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IdDeber</th>
                                        <th hidden>IdUsuario</th>
                                        <th hidden>IdTurno</th>
                                        <th>Usuario</th>
                                        <th>Responsabilidad</th>
                                        <th>Fecha</th>
                                        <th hidden>IdUsuarioReg</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();
                                        int count = 0;

                                        List<Responsabilidad> listarResponsabilidad = dao.listarResponsabilidad();
                                        for (Responsabilidad resp : listarResponsabilidad) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=resp.getDeberid()%></td>
                                        <td hidden><%=resp.getUsuarioid()%></td>
                                        <td hidden><%=resp.getTurnoid()%></td>
                                        <td><%=resp.getNomresponsab()%></td>
                                        <td><%=resp.getNomdeber()%></td>
                                        <td><%=resp.getFecha()%></td>
                                        <td hidden><%=resp.getUsuarioidreg()%></td>
                                        <td><%=resp.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar la Responsabilidad" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if(resp.getEstado().equals("Activo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar la Responsabilidad" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%} if(resp.getEstado().equals("Inactivo")){%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar la Responsabilidad" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=resp.getDeberid()%><%=resp.getUsuarioid()%><%=resp.getTurnoid()%>() {
                                        $("#TipoDeberIdDelete").val("<%=resp.getDeberid()%>");
                                        $("#TipoUsuarioIdDelete").val("<%=resp.getUsuarioid()%>");
                                        $("#TipoTurnoIdDelete").val("<%=resp.getTurnoid()%>");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarResponsabilidad" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos de la Responsabilidad</b></span></h3>
                    </div>
                    <div class="panel-body">
                        <form id="addresponsabilidad" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <article class="col-sm-12">
                                    <div class="form-group">
                                        <label for="tipo">Buscar Usuario</label>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                            <input id="buscarusuario" autofocus type="text" class="form-control" placeholder="Buscar Persona" describedby="basic-addon1">
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="usuario">Usuario</label>
                                        <input type="text" class="form-control" id="usuario" placeholder="Nombre del Usuario" name="usuario">
                                        <input type="hidden" name="usuarioId" value="1">
                                        <input type="hidden" name="usuarioIdReg" value="<%=idUsuario%>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deber">Deber</label>
                                        <select class="form-control" id="deber" name="deberId">
                                            <option hidden>Seleccionar el Deber</option>
                                            <%

                                                List<Deber> listaDeberAct = dao.listarDeberAct();
                                                for (Deber deber : listaDeberAct) {

                                            %>
                                            <option value="<%=deber.getDeberid()%>"><%=deber.getNombredeber()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="deber">Turno</label>
                                        <select class="form-control" id="deber" name="turnoId">
                                            <option hidden>Seleccionar el Turno</option>
                                            <%

                                                List<Turno> listaTurnoAct = dao.listarTurnoAct();
                                                for (Turno turno : listaTurnoAct) {

                                            %>
                                            <option value="<%=turno.getTurnoid()%>"><%=turno.getNombreturno()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fecha">Fecha</label>
                                        <input type="date" class="form-control" id="fecha" placeholder="Ingrese la Fecha" name="fechaDeber">
                                        <input type="hidden" name="opcion" value="AddResponsabilidad">
                                    </div>
                                </div>
                            </div>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarResponsabilidad()"><!--  data-dismiss="modal" -->
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
                            <h3 align="center"><span><b>¿Está seguro de Eliminar la Responsabilidad de este Usuario?</b></span></h3>
                        </section>
                        <section class="modal-body">
                            <form class="form-signin" role="form" method="post" action="mantenimiento">
                                <div class="row">
                                    <input type="hidden" id="TipoDeberIdDelete" name="id">
                                    <input type="hidden" id="TipoUsuarioIdDelete" name="iduser">
                                    <input type="hidden" id="TipoTurnoIdDelete" name="idturno">
                                    <input type="hidden" name="opcion" value="DeleteResponsabilidad">
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
        <script type="text/javascript">
            $(document).ready(function (){
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script> 
    </body>
</html>
