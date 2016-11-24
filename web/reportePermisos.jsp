<%-- 
    Document   : reportePermisos
    Created on : 10/11/2016, 08:49:48 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.controlador.Permisos"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.entidad.Permiso"%>
<%@page import="rest.modelo.daoimpl.ReporteDaoImpl"%>
<%@page import="rest.modelo.dao.ReporteDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idPermisoRep = request.getParameter("idPermisoRep");
    idPermisoRep = idPermisoRep == null ? "" : idPermisoRep;

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

                <article class="col-sm-4" style="color: white;">
                    <h4 ><b>Reporte de Permisos</b></h4>
                </article>
                <%--<article class=" form-horizontal col-sm-8">
                    <div class="col-sm-12 ">
                        <h4 class="col-sm-4" style="color: white;">Elige el tipo de reporte:</h4>
                            <div class=" col-sm-8 form-group">
                                <select form-group  name="size" id="size" onchange="ir()">
                                    <option value="10">Permiso Residente</option>
                                    <option value="20">Permiso Personal</option>
                                    <option value="30">Permiso Vehicular</option>
                                </select>
                            </div>
                        </div>
                </article> --%>

            </section>
            <div id="listaPerm" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'perGeneral', '1')" type="text" class="form-control" placeholder="Buscar Permisos de los Residentes." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="perGeneral" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th>Nombres</th>
                                        <th>Lugar</th>
                                        <th>Motivo</th>
                                        <th>Fecha y Hora de Salida</th>
                                        <th>Fecha y Hora de Retorno</th>
                                        <th>Observación</th>
                                        <th>Ver detalle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                        ReporteDao dao = new ReporteDaoImpl();
                                        int count = 0;

                                        List<Permiso> listPerRe = dao.listaPerRes();

                                        for (Permiso per : listPerRe) {

                                            count++;

                                    %>    

                                    <tr>
                                        <td><%=count%></td>
                                        <td><%=per.getNombres()%></td>
                                        <td><%=per.getLugar()%></td>
                                        <td><%=per.getMotivo()%></td>
                                        <td><%=per.getHorasalida()%>&nbsp;<%=per.getFechasalida()%></td>
                                        <td><%=per.getHoraingreso()%>&nbsp;<%=per.getFechaingreso()%></td>
                                        <td><%=per.getObservacion()%></td>
                                        <td aling="center"> 
                                            <a style="cursor: pointer;" onclick="detalleper<%=per.getPermisoid()%>(<%=per.getPermisoid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Detalle Permiso" class="glyphicon glyphicon-option-horizontal"></i>
                                            </a>
                                        </td>
                                    </tr>
                                <script>
                                    function detalleper<%=per.getPermisoid()%>(permiso) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "reportePermisos.jsp",
                                            data: "idPermisoRep=" + permiso,
                                            success: function (data) {
                                                $("#reportes").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaPerm').style.display = 'none';
                                                document.getElementById('delistVis').style.display = 'block';
                                                $("#aciones").html("Detalle Permiso");
                                            }
                                        });
                                    }

                                    function volverList() {
                                       // document.getElementById("delistVis").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaPerm').style.display = 'block';
                                        document.getElementById('delistVis').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Reportes de Permisos");
                                    }
                                </script>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>             
                </div>
            </div>

            <div id="delistVis" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="780" class="panel panel-primary">
                    <div data-brackets-id="781" class="panel-heading">
                        <h4><b>Detalle de Permiso</b></h4>
                        <input hidden value="<%=idPermisoRep%>" required type="text" >
                    </div>


                    <div data-brackets-id="782" class="panel-body">
                        <form class="form-horizontal" role="form" method="post" action="reportes">

                            <%
                                List<Permiso> listade = dao.listarPermisos(idPermisoRep);
                                for (Permiso perList : listade) {

                            %>

                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2 ">Nombres:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getNombres()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-3">Tipo salida:</label>
                                        <div class="col-sm-9">
                                            <p class="form-horizontal"><%=perList.getNombretipoper()%></p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2">Lugar :</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getLugar()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2 control-label">Telefono:</label>
                                        <div class="col-sm-10">
                                            <p class="form-control-static"><%=perList.getTelefono()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2">Motivo:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getMotivo()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 form-horizontal"> 
                                    <div class="form-group">
                                        <label  class="col-sm-3 ">Acompañante:</label>
                                        <div class="col-sm-9">
                                            <p class="form-horizontal"><%=perList.getOtros()%></p>
                                        </div>
                                    </div>                                  
                                </div>
                            </div>
                            <div class="row">
                                <div class=" col-sm-6 form-horizontal"> 
                                    <div class="form-group">
                                        <label  class="col-sm-4">Fecha / Hora salida :</label>
                                        <div class="col-sm-8">
                                            <p class="form-horizontal"><%=perList.getFechasalida()%>&nbsp &nbsp;<%=perList.getHorasalida()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label  class="col-sm-4 ">Fecha/Hora entrada:</label>
                                    <div class="col-sm-8">
                                        <p class="form-horizontal"><%=perList.getFechaingreso()%>&nbsp &nbsp;<%=perList.getHoraingreso()%></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-5">Fecha / Hora Salida real :</label>
                                        <div class="col-sm-7">
                                            <p class="form-horizontal text-left"><%=perList.getFechasalidareal()%>&nbsp &nbsp;<%=perList.getHorasalidareal()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 form-horizontal"> 
                                    <div class="form-group">
                                        <label  class="col-sm-5">Fecha/Hora entrada real:</label>
                                        <div class="col-sm-7">
                                            <p class="form-horizontal"><%=perList.getFechaingresoreal()%>&nbsp &nbsp;<%=perList.getHoraingresoreal()%></p>
                                        </div>
                                    </div>                                  
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-4">Autorizado por:</label>
                                        <div class="col-sm-8">
                                            <p class="form-horizontal text-left"><%=perList.getNombreusuauto()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 form-horizontal"> 
                                    <div class="form-group">
                                        <label  class="col-sm-5">Agente de control:</label>
                                        <div class="col-sm-7">
                                            <p class="form-horizontal">Juan Carlos Bustamante Sanchez</p>
                                        </div>
                                    </div>                                  
                                </div>
                            </div>

                            <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-primary" onclick="volverList()"><!--  data-dismiss="modal" -->
                                    Atras &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
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
