<%@include file="WEB-INF/jspf/top.jspf" %>

<div class="bs-example">
    <ul class="breadcrumb" style="margin-bottom: 5px; color: #2fa4e7;">
        <li>Garita UPeU</li>
            <%if (!JSP.equals("")) {%>
        <li><%=JSP%></li>
            <%} else {%>
        <li>Inicio</li>
            <%}%>
    </ul>
</div>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-users fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">343</p>
                        <p class="alerts-text">Permisos</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-map fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">453</p>
                        <p class="alerts-text">Visitas</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-bicycle fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">78</p>
                        <p class="alerts-text">Incidencias</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-steam fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">28</p>
                        <p class="alerts-text">Mantenimiento</p>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Reporte Diario</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-grid1"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Reporte Semanal</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-chart2"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Reporte Mensual</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-chart3"></div>
                </div>
            </div>
        </div>
    </div>

</div>

<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
<%@include file="WEB-INF/jspf/social.jspf" %>