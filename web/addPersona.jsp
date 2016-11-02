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

<!DOCTYPE html>
<html>
    <head>
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

                                        List<Persona> listaPer = dao.listarPersona();
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
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Persona" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar Persona" align="center"><a onclick="eliminar<%=per.getPersonaid()%>()" data-toggle="modal" data-target="#delete"><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                <script>
                                    function eliminar<%=per.getPersonaid()%>() {
                                        $("#perDelete").val("<%=per.getPersonaid()%>");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarPer" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos de la Persona</b></span></h3>
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
                                        <select required class="form-control" id="tipo" name="tipoDocumento">
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
                            <div class="row hidden">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="imagen">Seleccione su Imagen</label>
                                        <input type="file" disabled id="imagen" name="img">
                                        <p class="help-block">Vayase a la ...</p>
                                    </div>
                                    <input type="hidden" name="opcion" value="AddPersona">
                                </div>
                            </div>
                            </section>
                            <h4 align="center">
                                <button type="button" class="btn btn-default" onclick="cancelarPer()"><!--  data-dismiss="modal" -->
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
        <script type="text/javascript">
            $().ready(function () {
                $("#addper").validator({debug: true});
            });
        </script>                                
    </body>

</html>
