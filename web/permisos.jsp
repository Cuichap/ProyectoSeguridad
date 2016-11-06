<%-- 
    Document   : permisos
    Created on : 20/10/2016, 10:06:09 PM
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
        
<div id="permisos" style="margin-top: -10px;">

</div>
        
<script>
    $(document).ready(function () {
    <% if (IdSubMenu.equals("3") || IdSubMenu.equals("")) { %>
        ir3();
    <%}%>
    });
</script>

<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>