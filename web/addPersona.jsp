<%-- 
    Document   : addPersona
    Created on : 19/10/2016, 12:09:48 PM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Persona"%>
<%@page import="rest.modelo.daoimpl.MantenimientoDaoImpl"%>
<%@page import="rest.modelo.dao.MantenimientoDao"%>
<%@page import="rest.modelo.controlador.Mantenimiento"%>
<%@page import="rest.modelo.entidad.TipoDocumento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="IdSubMenu" scope="request" class="java.lang.String" />
<jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
<%
    String idPersonaEdit = request.getParameter("idPersonaEdit"); idPersonaEdit = idPersonaEdit == null ? "" : idPersonaEdit;
    String estadoPersona = request.getParameter("estadoPersona"); estadoPersona = estadoPersona == null ? "1" : estadoPersona;
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
                    <h4><b>Lista de Personas</b></h4>
                </article>
                <article align="right" class="col-sm-6">
                    <div class="col-sm-3"></div>
                    <a class="btn btn-primary" onclick="agregarPer()">Nuevo &nbsp;<i class="glyphicon glyphicon-plus"></i></a><!--  data-toggle="modal" data-target="#addPersona" -->
                </article>
            </section>
            <div id="listaPer" class="col-md-12" style="padding: 0px; display: block; margin-top: 60px;">
                <div  class="panel panel-primary">
                    <div class="panel-heading">
                        <article class="col-sm-8" style="color: white;">
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                                <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'persona', '1')" type="text" class="form-control" placeholder="Buscar Persona." aria-describedby="basic-addon1">
                            </div>
                        </article>
                        <script>
                            $(document).ready(function (){
                                    $('select[name=estadoPersona]').change(function (){
                                        $.ajax({
                                            type: "POST",
                                            url: "addPersona.jsp",
                                            data: "estadoPersona="+ $('select[name=estadoPersona]').val(),
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                            }
                                        });
                                    });
                                });
                        </script>
                        <article align="right" class="col-sm-4">
                            <div class="input-group col-sm-12">
                                <select id="estadoPersona" class="form-control" name="estadoPersona">
                                    <option hidden>Seleccionar el Estado</option>
                                    <option <% if(estadoPersona.equals("1")){%>selected<%}%> value="1">Activos</option>
                                    <option <% if(estadoPersona.equals("0")){%>selected<%}%> value="0">Inactivos</option>
                                </select>
                            </div>
                        </article>
                        <div class="row"></div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="persona" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th hidden>Id Persona</th>
                                        <th>Nombres</th>
                                        <th>Procedencia</th>
                                        <th>Direccion</th>
                                        <th hidden>Id Tipo</th>
                                        <th>Documento</th>
                                        <th>N° Documento</th>
                                        <th>Teléfono</th>
                                        <th>Género</th>
                                        <th>Estado</th>
                                        <th colspan="2">Opciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        MantenimientoDao dao = new MantenimientoDaoImpl();

                                        int count = 0;

                                        List<Persona> listaPer = dao.listarPersona(estadoPersona);
                                        for (Persona per : listaPer) {
                                            count++;
                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td hidden><%=per.getPersonaid()%></td>
                                        <td><%=per.getNombres()%>&nbsp;<%=per.getApellidos()%></td>
                                        <td><%=per.getProcedencia()%></td>
                                        <td><%=per.getDireccion()%></td>
                                        <td hidden><%=per.getTipoducumentoid()%></td>
                                        <td><%=per.getNombredoc()%></td>
                                        <td><%=per.getNumdocumento()%></td>
                                        <td><%=per.getTelefono()%></td>
                                        <td><%=per.getGenero()%></td>
                                        <td><%=per.getEstado()%></td>
                                        <td align="center">
                                            <a style="cursor: pointer;" onclick="Editar<%=per.getPersonaid()%>(<%=per.getPersonaid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Modificar Persona" class="glyphicon glyphicon-pencil"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <% if (per.getEstado().equals("Activo")) {%>
                                            <a style="cursor: pointer;" onclick="eliminar<%=per.getPersonaid()%>()" data-toggle="modal" data-target="#delete">
                                                <i data-toggle="tooltip" data-placement="top" title="Eliminar Persona" class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <%}
                                                if (per.getEstado().equals("Inactivo")) {%>
                                            <a style="cursor: pointer;" onclick="Activar<%=per.getPersonaid()%>()" data-toggle="modal" data-target="#activar">
                                                <i data-toggle="tooltip" data-placement="top" title="Activar Persona" class="glyphicon glyphicon-ok"></i>
                                            </a>
                                            <%}%>
                                        </td>
                                    </tr>
                                <script>
                                    function eliminar<%=per.getPersonaid()%>() {
                                        $("#perDelete").val("<%=per.getPersonaid()%>");
                                    }
                                    function Activar<%=per.getPersonaid()%>() {
                                        $("#perActive").val("<%=per.getPersonaid()%>");
                                    }
                                    function Editar<%=per.getPersonaid()%>(persona) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "addPersona.jsp",
                                            data: "idPersonaEdit=" + persona,
                                            success: function (data) {
                                                $("#mantenimiento").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaPer').style.display = 'none';
                                                document.getElementById('agregarPer').style.display = 'none';
                                                document.getElementById('editarPer').style.display = 'block';
                                                document.getElementById("nombresEdit").focus();
                                                $("#aciones").html("Modificar Persona");
                                            }
                                        });
                                    }
                                    function cancelarEditPer() {
                                        document.getElementById("editper").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaPer').style.display = 'block';
                                        document.getElementById('editarPer').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Lista de Personas");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarPer" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h4><b>Ingresar los Datos de la Persona</b></h4>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="addper" class="form-signin" role="form" method="post" action="mantenimiento">
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
                                        <select required class="form-control" id="tipo" name="tipoDocumentoId">
                                            <option hidden>Seleccionar Tipo de Documento</option>
                                            <%
                                                List<TipoDocumento> lista = dao.listarTipoDocumentoAct();
                                                for (TipoDocumento tipo : lista) {
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

                            <input type="hidden" name="opcion" value="AddPersona">
                            <input type="hidden" name="idUserReg" value="<%=idUsuario%>">

                            <div class="row hidden">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="imagen">Seleccione su Imagen</label>
                                        <input type="file" disabled id="imagen" name="img">
                                        <p class="help-block">Vayase a la ...</p>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarPer()"><!--  data-dismiss="modal" -->
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
            <div id="editarPer" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h4><b>Modificar los Datos de la Persona</b></h4>
                    </div>
                    <%
                        List<Persona> listaEditPer = dao.listarEditPersona(idPersonaEdit);
                        for (Persona perEdit : listaEditPer) {
                    %>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="editper" class="form-signin" role="form" method="post" action="mantenimiento">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="nombres">Nombres</label>
                                        <input value="<%=perEdit.getNombres()%>" required type="text" pattern="^[A-Za-záéíóú ][A-Za-záéíóú ]*" maxlength="39" class="form-control" id="nombresEdit" placeholder="Nombres" name="nombres" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="apellidos">Apellidos</label>
                                        <input value="<%=perEdit.getApellidos()%>" required type="text" pattern="^[A-Za-záéíóú ][A-Za-záéíóú ]*" maxlength="39" class="form-control" id="apellidosEdit" placeholder="Apellidos" name="apellidos" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="direccion">Dirección</label>
                                        <input value="<%=perEdit.getDireccion()%>" required type="text" maxlength="39" class="form-control" id="direccionEdit" placeholder="Dirección" name="direccion">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="procedencia">Procedencia</label>
                                        <input value="<%=perEdit.getProcedencia()%>" required type="text" maxlength="39" class="form-control" id="procedenciaEdit" placeholder="Procedencia" name="procedencia" data-error="Solo se permite letras no numeros">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="tipoEdit">Tipo de Documento</label>
                                        <select required class="form-control" id="tipoEdit" name="tipoDocumentoId">
                                            <option hidden>Seleccionar Tipo de Documento</option>
                                            <%
                                                for (TipoDocumento tipo : lista) {
                                            %>
                                            <option <% if (perEdit.getTipoducumentoid().equals(tipo.getTipodocumentoid())) {%>selected<%}%> value="<%=tipo.getTipodocumentoid()%>"><%=tipo.getNombredocumento()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group has-feedback">
                                        <label for="numeroDoc">N° Documento</label>
                                        <input value="<%=perEdit.getNumdocumento()%>" required type="text" pattern="^[A-Za-z0-9]*" class="form-control"  data-minlength="8" maxlength="16" id="numeroDocEdit" placeholder="numero de Documento" name="numeroDoc">
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
                                        <input value="<%=perEdit.getTelefono()%>" type="text" pattern="^[#*0-9]*" maxlength="15" class="form-control" id="telefonoEdit" placeholder="Teléfono" name="telefono">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="genero">Género</label>
                                        <select required class="form-control" id="genero" name="genero">
                                            <option hidden>Seleccionar su Género</option>
                                            <option <% if (perEdit.getGenero().equals("F")) {%>selected<%}%> value="F">Mujer</option>
                                            <option <% if (perEdit.getGenero().equals("M")) {%>selected<%}%> value="M">Varón</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="opcion" value="EditPersona">
                            <input type="hidden" name="id" value="<%=idPersonaEdit%>">
                            <input type="hidden" name="idUserReg" value="<%=idUsuario%>">

                            <div class="row hidden">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="imagen">Seleccione su Imagen</label>
                                        <input type="file" disabled id="imagen" name="img">
                                        <p class="help-block">Vayase a la ... jajaja</p>
                                    </div>
                                </div>
                            </div>
                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarEditPer()"><!--  data-dismiss="modal" -->
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
                                <input type="hidden" id="perDelete" name="id">
                                <input type="hidden" name="opcion" value="DeletePersona">
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
                                <input type="hidden" id="perActive" name="id">
                                <input type="hidden" name="opcion" value="ActivarPersona">
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
            $().ready(function () {
                $("#addper").validator({debug: true});
                $("#editper").validator({debug: true});
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>                                
    </body>

</html>
