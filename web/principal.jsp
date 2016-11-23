<%@page import="rest.modelo.dao.ReporteDao"%>
<%@page import="rest.modelo.daoimpl.ReporteDaoImpl"%>
<%@include file="WEB-INF/jspf/top.jspf" %>
<!-- <script src="/graficos/Chart.js"></script> -->

<%
    ReporteDao da=new ReporteDaoImpl();
    int can=da.cantidadPermisos();
    int cant=da.cantidadPerResidente();
    int canti=da.cantidadPerPersonal();
    int cantidad=da.cantidadPerVehiculo();
    int cani=da.cantidadIncidencia();
    int canv=da.cantidadVisita();
%>
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
    <div class="row" >
        <div class="col-lg-4">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-6">
                        <i class="fa fa-car fa-4x"></i>
                    </div>
                    <div class="col-xs-5 text-center">
                        <p class="alerts-heading"><%=can%></p>
                        <p class="alerts-text">Permisos</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-6">
                        <i class="fa fa-users fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading"><%=canv%></p>
                        <p class="alerts-text">Visitas</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="panel panel-default ">
                <div class="panel-body alert-info">
                    <div class="col-xs-6">
                        <i class="fa fa-ban fa-5x"></i>
                    </div>
                    <div class="col-xs-5 text-right">
                        <p class="alerts-heading"><%=cani%></p>
                        <p class="alerts-text">Incidencias</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Reporte Semanal y Diario Commpleto</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-grid1"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Reporte Mensual Completo</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-chart3"></div>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(function () {
        // Create the chart
        $('#shieldui-grid1').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: ' '
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Cantidad'
                }

            },
            legend: {
                enabled: true
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y}'
                    }
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> {point.tiempo}<br><br><br><span>{point.texto}</span><br/>'
            },
            series: [{
                    name: 'Reporte Semanal',
                    colorByPoint: true,
                    data: [{
                            name: 'Permisos de Residentes',
                            tiempo: 'En esta Semana',
                            texto: 'Click Para ver el Reporte Diario',
                            y: 10,
                            drilldown: 'Permisos de Residentes'
                        }, {
                            name: 'Permisos del Personal',
                            tiempo: 'En esta Semana',
                            texto: 'Click Para ver el Reporte Diario',
                            y: 9,
                            drilldown: 'Permisos del Personal'
                        }, {
                            name: 'Permisos de Vehículos',
                            tiempo: 'En esta Semana',
                            texto: 'Click Para ver el Reporte Diario',
                            y: 8,
                            drilldown: 'Permisos de Vehículos'
                        }, {
                            name: 'Visitas',
                            tiempo: 'En esta Semana',
                            texto: 'Click Para ver el Reporte Diario',
                            y: 7,
                            drilldown: 'Visitas'
                        }, {
                            name: 'Incidencias',
                            tiempo: 'En esta Semana',
                            texto: 'Click Para ver el Reporte Diario',
                            y: 9,
                            drilldown: 'Incidencias'
                        } ]
                }],
            drilldown: {
                series: [{
                        name: 'Permisos de Residentes',
                        id: 'Permisos de Residentes',
                        data: [
                            [
                                'v11.0',
                                24.13
                            ],
                            [
                                'v8.0',
                                17.2
                            ],
                            [
                                'v9.0',
                                8.11
                            ],
                            [
                                'v10.0',
                                5.33
                            ],
                            [
                                'v6.0',
                                1.06
                            ]
                        ]
                    }, {
                        name: 'Permisos del Personal',
                        id: 'Permisos del Personal',
                        data: [
                            [
                                'v40.0',
                                5
                            ],
                            [
                                'v41.0',
                                4.32
                            ],
                            [
                                'v42.0',
                                3.68
                            ],
                            [
                                'v39.0',
                                2.96
                            ],
                            [
                                'v36.0',
                                2.53
                            ]
                        ]
                    }, {
                        name: 'Permisos de Vehículos',
                        id: 'Permisos de Vehículos',
                        data: [
                            [
                                'v35',
                                2.76
                            ],
                            [
                                'v36',
                                2.32
                            ],
                            [
                                'v37',
                                2.31
                            ],
                            [
                                'v34',
                                1.27
                            ],
                            [
                                'v38',
                                1.02
                            ]
                        ]
                    }, {
                        name: 'Visitas',
                        id: 'Visitas',
                        data: [
                            [
                                'v8.0',
                                2.56
                            ],
                            [
                                'v7.1',
                                0.77
                            ],
                            [
                                'v5.1',
                                0.42
                            ],
                            [
                                'v5.0',
                                0.3
                            ],
                            [
                                'v6.1',
                                0.29
                            ]
                        ]
                    }, {
                        name: 'Incidencias',
                        id: 'Incidencias',
                        data: [
                            [
                                'v12.x',
                                0.34
                            ],
                            [
                                'v28',
                                0.24
                            ],
                            [
                                'v27',
                                0.17
                            ],
                            [
                                'v29',
                                0.16
                            ],
                            [
                                'v30',
                                0.16
                            ]
                        ]
                    }]
            }
        });
    });
</script>
<!-- <script>
    var pieData = [
        {
            value: 40,
            color: "#0b82e7",
            highlight: "#0c62ab",
            label: "Enero"
        },
        {
            value: 16,
            color: "#e3e860",
            highlight: "#a9ad47",
            label: "Febrero"
        },
        {
            value: 11,
            color: "#eb5d82",
            highlight: "#b74865",
            label: "Marzo"
        },
        {
            value: 10,
            color: "#5ae85a",
            highlight: "#42a642",
            label: "Mayo"
        },
        {
            value: 8.6,
            color: "#e965db",
            highlight: "#a6429b",
            label: "Junio"
        }
    ];

    var barChartData = {
        labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio"],
        datasets: [
            {
                fillColor: "#6b9dfa",
                strokeColor: "#ffffff",
                highlightFill: "#1864f2",
                highlightStroke: "#ffffff",
                data: [90, 30, 10, 80, 15, 5, 15]
            },
            {
                fillColor: "#e9e225",
                strokeColor: "#ffffff",
                highlightFill: "#ee7f49",
                highlightStroke: "#ffffff",
                data: [40, 50, 70, 40, 85, 55, 15]
            }
        ]

    }
    var lineChartData = {
        labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio"],
        datasets: [
            {
                label: "Primera serie de datos",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "#6b9dfa",
                pointColor: "#1e45d7",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [90, 30, 10, 80, 15, 5, 15]
            },
            {
                label: "Segunda serie de datos",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "#e9e225",
                pointColor: "#faab12",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [40, 50, 70, 40, 85, 55, 15]
            }
        ]

    }
    var ctx = document.getElementById("shieldui-grid1").getContext("2d");
    var ctx2 = document.getElementById("shieldui-chart2").getContext("2d");
    var ctx3 = document.getElementById("shieldui-chart3").getContext("2d");
    var ctx4 = document.getElementById("chart-area4").getContext("2d");
    window.myPie = new Chart(ctx).Pie(pieData);
    window.myPie = new Chart(ctx2).Doughnut(pieData);
    window.myPie = new Chart(ctx3).Bar(barChartData, {responsive: true});
    window.myPie = new Chart(ctx4).Line(lineChartData, {responsive: true});
</script> -->

<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
<%@include file="WEB-INF/jspf/social.jspf" %>
