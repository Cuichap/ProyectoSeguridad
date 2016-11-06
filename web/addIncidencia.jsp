<%-- 
    Document   : addIncidencia
    Created on : 21/10/2016, 01:46:06 AM
    Author     : USUARIO
--%>

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
                                        <th>Incidencia</th>
                                        <th>Campo 1</th>
                                        <th>Campo 2</th>
                                        <th>Campo 3</th>
                                        <th>Campo 4</th>
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
                                        <td data-toggle="tooltip" data-placement="bottom" title="Modificar Incidencia" align="center"><a><i class="glyphicon glyphicon-edit"></i></a></td>
                                        <td data-toggle="tooltip" data-placement="bottom" title="Eliminar Incidencia" align="center"><a><i class="glyphicon glyphicon-trash"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agregarIncidencia" class="col-md-10 col-xs-offset-1" style="padding: 0px; display: none;">
                <div data-brackets-id="733" class="panel panel-primary">
                    <div data-brackets-id="734" class="panel-heading">
                        <h3 align="center"><span><b>Ingresar los Datos de la Incidencia</b></span></h3>
                    </div>
                    <div data-brackets-id="736" class="panel-body">
                        <form id="addincidencia" class="form-signin" role="form" method="post" action="">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="campo">Campo 1</label>
                                        <input type="text" class="form-control" id="campo" placeholder="Nombre del campo">
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
        </div>
    </body>
</html>
