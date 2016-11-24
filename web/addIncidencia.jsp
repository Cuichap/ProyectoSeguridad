<%-- 
    Document   : addIncidencia
    Created on : 21/10/2016, 01:46:06 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.TipoIncidencia"%>
<%@page import="rest.modelo.entidad.Usuario"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.entidad.Incidencia"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.IncidenciaDaoImpl"%>
<%@page import="rest.modelo.dao.IncidenciaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<!DOCTYPE html>
<%
    String idIncidenciaEdit = request.getParameter("idIncidenciaEdit");
    idIncidenciaEdit = idIncidenciaEdit == null ? "" : idIncidenciaEdit;
    String idUserEdit = request.getParameter("idUserEdit");
    idUserEdit = idUserEdit == null ? "" : idUserEdit;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    </head>
    <body>
        <div class="col-sm-12">
            <br>
            <section id="lista" class="col-sm-12 well well-sm backcolor" style="display: block; margin-bottom: -50px;">
                <article class="col-sm-6" style="color: white;">
                    <h4 ><b>Lista de Incidencias</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarIncidencia()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaIncidencia" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'incid', '1')" type="text" class="form-control" placeholder="Buscar Incidencias." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="incid" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>IncidenciaId</th>
                                        <th hidden>UsuarioId</th>
                                        <th>Persona</th>
                                        <th hidden>TipoPersonaId</th>
                                        <th>Tipo Persona</th>
                                        <th hidden>TipoIncidenciaId</th>
                                        <th>Incidencia</th>
                                        <th>Descripcion</th>
                                        <th>Lugar</th>
                                        <th hidden>ObjetoId</th>
                                        <th>Objeto</th>
                                        <th>Fecha/Hora</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        IncidenciaDao idao = new IncidenciaDaoImpl();
                                        int count = 0;

                                        List<Incidencia> listarIncidencias = idao.listarIncidencia();
                                        for (Incidencia incidencia : listarIncidencias) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=incidencia.getIncidenciaid()%> </td>
                                        <td hidden><%=incidencia.getUsuarioid()%> </td>
                                        <td><%=incidencia.getNombres()%>[<%=incidencia.getIncidenciaid()%>]</td>
                                        <td hidden><%=incidencia.getTipopersonaid()%></td>
                                        <td><%=incidencia.getNombretipopersona()%>[<%=incidencia.getUsuarioid()%>]</td>
                                        <td hidden><%=incidencia.getTipoincidenciaid()%></td>
                                        <td><%=incidencia.getNombretipoincidencia()%></td>
                                        <td><%=incidencia.getDescripcion()%></td>
                                        <td><%=incidencia.getLugar()%></td>
                                        <td hidden><%=incidencia.getObjetoid()%></td>
                                        <td><%=incidencia.getObjeto()%></td>
                                        <td><%=incidencia.getFecha()%></td>
                                        <td><%=incidencia.getEstado()%></td>
                                        <td align="center">
                                            <%
                                                if (!incidencia.getDescripcion().equals("")) {%>
                                            &nbsp;&nbsp;&nbsp;
                                            <a style="cursor: pointer;" onclick="Editar<%=incidencia.getIncidenciaid()%><%=incidencia.getUsuarioid()%>(<%=incidencia.getIncidenciaid()%>, <%=incidencia.getUsuarioid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Editar Incidencia" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                        function Editar<%=incidencia.getIncidenciaid()%><%=incidencia.getUsuarioid()%>(incidencia, usuario) {
                                            $.ajax({
                                                stype: 'POST',
                                                url: "addIncidencia.jsp",
                                                data: "idIncidenciaEdit=" + incidencia + "&idUserEdit=" + usuario,
                                                success: function (data) {
                                                    $("#incidencias").html(data);
                                                    document.getElementById('lista').style.display = 'none';
                                                    document.getElementById('listaIncidencia').style.display = 'none';
                                                    document.getElementById('editarIncidencia').style.display = 'block';
                                                    $("#aciones").html("Modificar Incidencia");
                                                }
                                            });
                                        }
                                        function cancelarEditInc() {
                                        document.getElementById("editIncidencia").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaIncidencia').style.display = 'block';
                                        document.getElementById('editarIncidencia').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Incidencia");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarIncidencia" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos de la Incidencia</b></span></h3>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="addincidencia" class="form-signin" role="form" method="post" action="">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="idusuario">Persona</label>
                                        <select class="form-control" id="id_usuario" name="usuarioid">
                                        <option hidden>Seleccione</option>
                                        <%
                                            List<Usuario> listaUser = idao.listarUsuario();
                                            for(Usuario usuario : listaUser){%>
                                            
                                        <option value="<%=usuario.getUsuarioid()%>"><%=usuario.getNombre()%></option>   
                                        <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoincidencia">Incidencia</label>
                                        <select class="form-control" id="tipoIncidencia" name="tipoincidenciaid">
                                            <option hidden>Seleccione</option>
                                            <%
                                            List<TipoIncidencia> listaTipInc = idao.listaTipoIncidencia();
                                            for(TipoIncidencia tipo : listaTipInc){%>
                                            
                                            <option value="<%=tipo.getTipoincidenciaid() %>"><%=tipo.getNombretipoincidencia()%></option>   
                                            <%}%>
                                        </select>
                                    </div>     
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="lugar">Lugar</label>
                                        <input type="text" class="form-control" id="lugar" nombre="lugar" placeholder="Lugar">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="descripcion">Descripción</label>
                                        <input type="text" class="form-control" id="descripcion" nombre="descripcion" placeholder="Descripcion">
                                    </div>     
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="fechaadd">Fecha</label>
                                        <input type="date" class="form-control" id="fechaadd" nombre="fecha" placeholder="Fecha">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="hora">Hora</label>
                                        <input type="time" class="form-control" id="horaadd" nombre="hora" placeholder="Hora">
                                    </div>     
                                </div>
                            </div>             
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarIncidencia()"><!--  data-dismiss="modal" -->
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
            <div id="editarIncidencia" class="col-md-12" style="padding: 0px; display: none;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4><b>Modificar los Datos de la Incidencia</b></h4>
                    </div>
                    <%
                        List<Incidencia> listaEditIncidencia = idao.listarIcidenciaEdit(idIncidenciaEdit, idUserEdit);
                        for (Incidencia inc : listaEditIncidencia) {
                    %>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="editIncidencia" class="form-signin" role="form" method="post" action="incidencias">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="nombres">Nombres</label>
                                        <input value="<%=inc.getNombres()%>" required type="text" disabled  class="form-control" id="nombresEdit" placeholder="Nombres" name="nombres" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="tipopersona">Tipo Persona</label>
                                        <input value="<%=inc.getNombretipopersona()%>" required type="text" disabled class="form-control" id="tipoperEdit" placeholder="Tipo Persona" name="tipopersona" data-error="">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="nombIncidencia">Incidencia</label>
                                        <input value="<%=inc.getNombretipoincidencia()%>" required type="text" disabled class="form-control" id="nombreinciEdit" placeholder="Incidencia" name="nombIncidencia" data-error="">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="descripcionEdit">Descripcion</label>
                                        <input value="<%=inc.getDescripcion() %>" required type="text"  class="form-control" id="descripcionEdit" placeholder="Descripcion" name="descripcion" data-error="">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>  
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="lugarEdit">Lugar</label>
                                        <input value="<%=inc.getLugar()%>" required type="text" class="form-control" id="lugarEdit" placeholder="Lugar" name="lugar" data-error="">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="opcion" value="EditIncidencia">
                            <input type="hidden" name="id" value="<%=idIncidenciaEdit%>">
                            <input type="hidden" name="id2" value="<%=idUserEdit%>">
                            <input type="hidden" name="idusuarioreg" value="<%=idUsuario%>">
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditInc()"><!--  data-dismiss="modal" -->
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
        </div>
    </body>
</html>
