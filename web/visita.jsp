<%-- 
    Document   : visitas
    Created on : 20/10/2016, 10:07:33 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.TipoDocumento"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.Visita"%>
<%@page import="rest.modelo.daoimpl.VisitaDaoImpl"%>
<%@page import="rest.modelo.dao.VisitaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/top.jspf" %>
<%
    String visitaidEdit = request.getParameter("visitaidEdit"); visitaidEdit = visitaidEdit == null ? "" : visitaidEdit;
    String listaEstadoVisita = request.getParameter("listaEstadoVisita"); listaEstadoVisita = listaEstadoVisita == null ? "" : listaEstadoVisita;
%>
<div class="bs-example">
    <ul class="breadcrumb" style="margin-bottom: 5px; color: #2fa4e7;">
        <li>Garita UPeU</li>
        <li><%=JSP%></li>
        <li id="aciones">Lista de Visitas</li>
    </ul>
</div>

<div id="visitas" style="margin-top: -10px;">
    <div class="col-sm-12">
        <br>
        <section id="lista" class="col-sm-12 well well-sm backcolor" style="display: block; margin-bottom: -50px;">
            <article class="col-sm-4" style="color: white;">
                <h4 ><b>Lista de Visitas</b></h4>
            </article>
            <article align="right" class="col-sm-8">
                <a class="btn btn-primary" onclick="agregarVisita()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
            </article>
        </section>
        <div id="listaVis" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <article class="col-sm-8" style="color: white;">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'visita', '1')" type="text" class="form-control" placeholder="Buscar Usuario." aria-describedby="basic-addon1">
                        </div>
                    </article>
                    <script>
                        function enviar(){
                            $.ajax({
                                type: "POST",
                                url: "visita.jsp",
                                data: "listaEstadoVisita="+ $('select[name=estadoVisita]').val(),
                                success: function (data) {
                                }
                            });
                        };
                    </script>
                    <article align="right" class="col-sm-4">
                        <div class="input-group col-sm-12">
                            <select id="estadoUsuario" class="form-control" name="estadoVisita" onchange="enviar()">
                                <option hidden>Seleccionar el Estado</option>
                                <option <% if(listaEstadoVisita.equals("1")){%>selected<%}%> value="1">Activos</option>
                                <option <% if(listaEstadoVisita.equals("0")){%>selected<%}%> value="0">Inactivos</option>>
                            </select>
                        </div>
                    </article>
                    <div class="row"></div>
                </div>
                <div class="panel-body">
                    <div class="col-md-12" style="overflow: auto; padding: 0px;">
                        <table style="" id="visita" class="table table-bordered table-condensed table-hover table-responsive">
                            <thead class="bg-primary">
                                <tr>
                                    <th>#</th>
                                    <th hidden>IdVisita</th>
                                    <th hidden>IdPersona</th>
                                    <th>Nombres</th>
                                    <th>Procedencia</th>
                                    <th>Teléfono</th>
                                    <th>Ingreso</th>
                                    <th>Salida</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    VisitaDao vdao = new VisitaDaoImpl();
                                    int count = 0;

                                    List<Visita> listVisita = vdao.listarVisita();
                                    for (Visita visita : listVisita) {
                                        count++;
                                %>
                                <tr>
                                    <td><%=count%></td>
                                    <td hidden><%=visita.getVisitaid()%></td>
                                    <td hidden><%=visita.getPersonaid()%></td>
                                    <td><%=visita.getNombres()%></td>
                                    <td><%=visita.getProcedencia()%></td>
                                    <td><%=visita.getTelefono()%></td>
                                    <td><%=visita.getFechaentrada()%> /<%=visita.getHoraentrada()%></td>
                                    <td><%=visita.getFechasalida()%> /<%=visita.getHorasalida()%></td>
                                    <td><%=visita.getEstado()%></td>
                                    <td align="center">
                                        <%if (visita.getFechasalida().equals("") && visita.getHorasalida().equals("")) {%>
                                        &nbsp;&nbsp;&nbsp;
                                        <a style="cursor: pointer;">
                                            <i data-toggle="tooltip" data-placement="top" title="Registrar Salida" class="glyphicon glyphicon-arrow-left"></i>
                                        </a>
                                        <%}
                                            if (!visita.getFechasalida().equals("") && !visita.getHorasalida().equals("")) {%>
                                        &nbsp;&nbsp;&nbsp;
                                        <a style="cursor: pointer;">
                                            <i data-toggle="tooltip" data-placement="top" title="Editar Visita" class="glyphicon glyphicon-pencil"></i>
                                        </a>
                                        <%}
                                            if (visita.getEstado().equals("Inactivo")) {%>
                                        &nbsp;&nbsp;&nbsp;
                                        <a style="cursor: pointer;" onclick="Activar<%=visita.getVisitaid()%>()" data-toggle="modal" data-target="#activar">
                                            <i data-toggle="tooltip" data-placement="top" title="Activar Visita" class="glyphicon glyphicon-ok"></i>
                                        </a>
                                        <%}
                                            if (visita.getEstado().equals("Activo")) {%>
                                        &nbsp;&nbsp;&nbsp;
                                        <a style="cursor: pointer;" onclick="eliminar<%=visita.getVisitaid()%>()" data-toggle="modal" data-target="#delete">
                                            <i data-toggle="tooltip" data-placement="top" title="Eliminar Visita" class="glyphicon glyphicon-trash"></i>
                                        </a>
                                        <%}%>
                                    </td>
                                </tr>
                            <script>
                                function eliminar<%=visita.getVisitaid()%>() {
                                    $("#visDelete").val("<%=visita.getVisitaid()%>");
                                }
                                function Activar<%=visita.getVisitaid()%>() {
                                    $("#visActive").val("<%=visita.getVisitaid()%>");
                                }
                            </script>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="agregarVis" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h4><b>Ingresar los Datos de la Visita</b></h4>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="addVisit" class="form-signin" role="form" method="post" action="visita">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="nombres">Nombres</label>
                                        <input required type="text" pattern="^[A-Za-záéíóú ][A-Za-záéíóú ]*" maxlength="39" class="form-control" id="nombres" placeholder="Nombres" name="nombres" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="apellidos">Apellidos</label>
                                        <input required type="text" pattern="^[A-Za-záéíóú ][A-Za-záéíóú ]*" maxlength="39" class="form-control" id="apellidos" placeholder="Apellidos" name="apellidos" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="direccion">Dirección</label>
                                        <input required type="text" maxlength="39" class="form-control" id="direccion" placeholder="Dirección" name="direccion">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="procedencia">Procedencia</label>
                                        <input required type="text" maxlength="39" class="form-control" id="procedencia" placeholder="Procedencia" name="procedencia" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipo">Tipo de Documento</label>
                                        <select required class="form-control" id="tipo" name="tipoDocumento">
                                            <option hidden>Seleccionar Tipo de Documento</option>
                                            <%
                                                MantenimientoDao mdao = new MantenimientoDaoImpl();
                                                
                                                List<TipoDocumento> listadoc = mdao.listarTipoDocumentoAct();
                                                for (TipoDocumento tipo : listadoc) {
                                            %>
                                            <option  value="<%=tipo.getTipodocumentoid()%>"><%=tipo.getNombredocumento()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="numeroDoc">N° Documento</label>
                                        <input required type="text" pattern="^[A-Za-z0-9]*" class="form-control"  data-minlength="8" maxlength="16" id="numeroDoc" placeholder="numero de Documento" name="numeroDoc">
                                        <div class="help-block">Minimo 8 números</div>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="telefono">Teléfono</label>
                                        <input  type="text" pattern="^[#*0-9]*" maxlength="15" class="form-control" id="telefono" placeholder="Teléfono" name="telefono">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="genero">Género</label>
                                        <select required class="form-control" id="genero" name="genero">
                                            <option hidden>Seleccionar su Género</option>
                                            <option value="F">Mujer</option>
                                            <option value="M">Varón</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="imagen">Seleccione su Imagen</label>
                                        <input type="file" disabled id="imagen" name="img">
                                        <p class="help-block">Vayase a la ...</p>
                                    </div>
                                    <input type="hidden" name="opcion" value="addVisit">
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarVisita()"><!--  data-dismiss="modal" -->
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
                        <h3 align="center"><span><b>¿Está seguro de Eliminar esta Visita?</b></span></h3>
                    </section>
                    <section class="modal-body">
                        <form class="form-signin" role="form" method="post" action="visitas">
                            <div class="row">
                                <input type="hidden" id="visDelete" name="id">
                                <input type="hidden" name="opcion" value="DeleteVisita">
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
                        <h3 align="center"><span><b>¿Está seguro de Activar esta Visita?</b></span></h3>
                    </section>
                    <section class="modal-body">
                        <form class="form-signin" role="form" method="post" action="visitas">
                            <div class="row">
                                <input type="hidden" id="visActive" name="id">
                                <input type="hidden" name="opcion" value="ActivarVisita">
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
<script type="text/javascript">
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
