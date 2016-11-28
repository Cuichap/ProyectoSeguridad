<%-- 
    Document   : reporteVisitas
    Created on : 10/11/2016, 08:50:26 AM
    Author     : USUARIO
--%>

<%@page import="rest.modelo.entidad.Visita"%>
<%@page import="java.util.List"%>
<%@page import="rest.modelo.daoimpl.ReporteDaoImpl"%>
<%@page import="rest.modelo.dao.ReporteDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idVisitadet = request.getParameter("idVisitadet");
    idVisitadet = idVisitadet == null ? "" : idVisitadet;

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
                    <h4 ><b>Reporte de Visitas</b></h4>
                </article>
            </section>
            <div id="listaVis" class="col-md-12" style="display: block; padding: 0px; margin-top: 60px;">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i></span>
                            <input id="buscador" autofocus name="filt" onkeyup="filter(this, 'ReVisita', '1')" type="text" class="form-control" placeholder="Buscar Permisos de los Residentes." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12" style="overflow: auto; padding: 0px;">
                            <table style="" id="ReVisita" class="table table-bordered table-condensed table-hover table-responsive">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>#</th>
                                        <th>Nombres</th>
                                        <th>Fecha y Hora de Ingreso</th>
                                        <th>Destino</th>
                                        <th>Visitado</th>
                                        <%-- <th>Descripción</th> --%>
                                        <th>Fecha y Hora de Salida</th>
                                        <th>estado</th>
                                        <th>Ver detalle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <%
                                    ReporteDao dao= new ReporteDaoImpl();
                                     
                                    int count=0;
                                    
                                    List<Visita> ListaVisitas=dao.ListaVisitas();
                                    
                                    for(Visita vis:ListaVisitas ){  
                                        count++;

                                    %>
                                    <tr>
                                        <td><%=count%></td>
                                        <td><%=vis.getNombres()%></td>
                                        <td><%=vis.getFechaentrada()%>&nbsp;<%=vis.getHoraentrada()%></td>
                                        <td><%=vis.getDestino()%></td>
                                        <td><%=vis.getVisitado()%></td>
                                        <%--<td><%=vis.getDescripcion()%></td> --%>
                                        <td><%=vis.getFechasalida()%>&nbsp;<%=vis.getHorasalida()%></td>
                                        <td><%=vis.getEstado()%></td>
                                        <td > 
                                            <a  style="cursor: pointer;" onclick="detallevis<%=vis.getVisitaid()%>(<%=vis.getVisitaid()%>)">
                                                <i data-toggle="tooltip" data-placement="top" title="Detalle Visita" class="glyphicon glyphicon-plus-sign"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    
                                    <script>
                                    function detallevis<%=vis.getVisitaid()%>(visita) {
                                        $.ajax({
                                            stype: 'POST',
                                            url: "reporteVisitas.jsp",
                                            data: "idVisitadet=" + visita,
                                            success: function (data) {
                                                $("#reportes").html(data);
                                                document.getElementById('lista').style.display = 'none';
                                                document.getElementById('listaVis').style.display = 'none';
                                                document.getElementById('delistVist').style.display = 'block';
                                                $("#aciones").html("Detalle Visita");
                                            }
                                        });
                                    }

                                    function volverList() {
                                       // document.getElementById("delistVis").reset();
                                        document.getElementById('lista').style.display = 'block';
                                        document.getElementById('listaVis').style.display = 'block';
                                        document.getElementById('delistVist').style.display = 'none';
                                        document.getElementById("buscador").focus();
                                        $("#aciones").html("Reportes de Visitas");
                                    }
                                </script>
                                
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
                                
                                
             <div id="delistVist" class="col-md-12" style="padding: 0px; display: none;">
                <div data-brackets-id="780" class="panel panel-primary">
                    <div data-brackets-id="781" class="panel-heading">
                        <h4><b>Detalle de Visita</b></h4>
                        <input hidden value="<%=idVisitadet%>" required type="text" >
                    </div>


                    <div data-brackets-id="782" class="panel-body">
                        <form class="form-horizontal" role="form" method="post" action="reportes">

                            <%
                                List<Visita> listade = dao.ListaVisitid(idVisitadet);
                                for (Visita perList : listade) {

                            %>

                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2 ">Visitante:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getNombres()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2">Documento:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getDocumento()%></p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2">Visitado:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getVisitado()%></p>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2">Lugar:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getDestino()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-1">Motivo:</label>
                                        <div class="col-sm-10">
                                            <p class="form-horizontal"><%=perList.getDescripcion()%></p>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="row">
                                  <div class="col-sm-6 form-horizontal">
                                    <div class="form-group">
                                    <label  class="col-sm-4 ">Fecha/Hora entrada:</label>
                                    <div class="col-sm-8">
                                        <p class="form-horizontal"><%=perList.getFechaentrada()%>&nbsp &nbsp;<%=perList.getHoraentrada()%></p>
                                    </div>
                                    </div>
                                </div>
                                <div class=" col-sm-6 form-horizontal"> 
                                    <div class="form-group">
                                        <label  class="col-sm-4">Fecha / Hora salida :</label>
                                        <div class="col-sm-8">
                                            <p class="form-horizontal"><%=perList.getFechasalida()%>&nbsp &nbsp;<%=perList.getHorasalida()%></p>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>

                            <div class="row">
                                <div class="col-sm-12 form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-sm-2">Agente de control:</label>
                                        <div class="col-sm-7">
                                            <p class="form-horizontal"><%=perList.getAgente()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                        </form>
                    </div>
                    <%}%>
                    <hr style="border-color: #3b5998;">
                            <h4 align="center">
                                <button type="button" class="btn btn-primary" onclick="volverList()"><!--  data-dismiss="modal" -->
                                    Atras &nbsp;&nbsp; <i class="glyphicon glyphicon-remove-circle"></i>
                                </button>
                            </h4>
                </div>
            </div>                    
            
                                
        </div>
    </body>
</html>