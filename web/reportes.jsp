<%-- 
    Document   : reportes
    Created on : 3/11/2016, 11:01:00 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/top.jspf" %>


<div class="bs-example">
    <ul class="breadcrumb" style="margin-bottom: 5px; color: #2fa4e7;">
        <li>Garita UPeU</li>
        <li><%=JSP%></li>
        <li id="breadseg"></li>
        <li id="aciones"></li>
    </ul>
</div>

<div id="reportes"   style="margin-top: -10px;">

</div>

<script>
    $(document).ready(function () {
    <% if (IdSubMenu.equals("31") || IdSubMenu.equals("")) { %>
        //ir31();
    <%}
        if (IdSubMenu.equals("32")) { %>
        //ir32();
    <%}
        if (IdSubMenu.equals("33")) { %>
        //ir33();
    <%}
        if (IdSubMenu.equals("34")) { %>
        //ir34();
    <%}%>

        $('[data-toggle="tooltip"]').tooltip();
    });
</script>


<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
