<%-- 
    Document   : seguridad
    Created on : 3/11/2016, 10:50:33 PM
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

<div id="seguridad"   style="margin-top: -10px;">

</div>

<script>
    $(document).ready(function () {
    <% if (!Perfil.equals("3")) {%>
        <% if (IdSubMenu.equals("29") || IdSubMenu.equals("")) { %>
            ir29();
        <%} if (IdSubMenu.equals("30")) { %>
            ir30();
        <%} if (IdSubMenu.equals("31")) { %>
            ir31();
        <%} if (IdSubMenu.equals("32")) { %>
            ir32();
        <%} if (IdSubMenu.equals("33")) { %>
            ir33();
        <%}%>
    <%}%>
    <% if(Perfil.equals("3")){ %>
        <% if (IdSubMenu.equals("33") || IdSubMenu.equals("")) { %>
            ir33();
        <%}%>
    <%}%>

        $('[data-toggle="tooltip"]').tooltip();
    });
</script>


<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>
