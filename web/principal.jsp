<%@include file="WEB-INF/jspf/top.jspf" %>

<div class="bs-example">
    <ul class="breadcrumb" style="margin-bottom: 5px;">
        <li><a>Garita UPeU</a></li>
            <%if (!JSP.equals("")) {%>
        <li class="active"><a><%=JSP%></a></li>
                <%} else {%>
        <li class="active"><a>Inicio</a></li>
            <%}%>
    </ul>
</div>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-truck fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">343</p>
                        <p class="alerts-text">Orders</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-money fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">173</p>
                        <p class="alerts-text">Income</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-twitter fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">743</p>
                        <p class="alerts-text">Mentions</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-5">
                        <i class="fa fa-download fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading">1453</p>
                        <p class="alerts-text">Downloads</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Sales personnel Data</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-grid1"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Logins per week</h3>
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
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Sales Data</h3>
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