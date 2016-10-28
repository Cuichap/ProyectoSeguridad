<%-- 
    Document   : visitas
    Created on : 20/10/2016, 10:07:33 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/top.jspf" %>

<div class="bs-example">
    <ul class="breadcrumb" style="margin-bottom: 5px;">
        <li><a>Garita UPeU</a></li>
        <li><a><%=JSP%></a></li>
        <li><a id="aciones">Lista de Visitas</a></li>
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
                    <div class="input-group">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                        <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'visita', '1')" type="text" class="form-control" placeholder="Buscar Visita." aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-md-12" style="overflow: auto; padding: 0px;">
                        <table style="" id="visita" class="table table-bordered table-condensed table-hover table-responsive">
                            <thead class="bg-primary">
                                <tr>
                                    <th>#</th>
                                    <th>Nombres</th>
                                    <th>Procedencia</th>
                                    <th>Direccion</th>
                                    <th>Documento</th>
                                    <th>N° Documento</th>
                                    <th>Teléfono</th>
                                    <th>Género</th>
                                    <th colspan="2">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td data-toggle="tooltip" data-placement="bottom" title="Registrar Salida" align="center"><a><i class="glyphicon glyphicon-arrow-left"></i></a></td>
                                    <td data-toggle="tooltip" data-placement="bottom" title="Modificar Visita" align="center"><a><i class="glyphicon glyphicon-trash"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="agregarVis" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 align="center"><span><b>Ingresar los Datos de la Visita</b></span></h3>
                </div>
                <div class="panel-body">
                    <form id="addvis" class="form-signin" role="form" method="post" action="">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="campo">Campo 1</label>
                                    <input type="text" class="form-control" id="campo" placeholder="Nombre del campo">
                                </div>
                            </div>
                        </div>
                        <h4 align="center">
                            <button type="button" class="btn btn-default" onclick="cancelarVisita()"><!--  data-dismiss="modal" -->
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
</div>

<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
