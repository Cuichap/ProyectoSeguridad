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
    <% if (IdSubMenu.equals("35") || IdSubMenu.equals("")) { %>
        ir35();
    <%}
        if (IdSubMenu.equals("36")) { %>
        ir36();
    <%}
        if (IdSubMenu.equals("37")) { %>
        ir37();
    <%}%>

        $('[data-toggle="tooltip"]').tooltip();
    });
</script>


<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
