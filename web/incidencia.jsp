<%-- 
    Document   : incidencia
    Created on : 20/10/2016, 10:08:59 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="WEB-INF/jspf/top.jspf" %>

<div class="bs-example">
    <ul class="breadcrumb" style="margin-bottom: 5px;">
        <li><a>Garita UPeU</a></li>
        <li><a><%=JSP%></a></li>
        <li><a id="breadseg"></a></li>
        <li><a id="aciones"></a></li>
    </ul>
</div>
        
<div id="incidencias" style="margin-top: -10px;">

</div>

<script>
    $(document).ready(function () {
    <% if (IdSubMenu.equals("8") || IdSubMenu.equals("")) { %>
        ir8();
    <%}%>
    });
</script>

<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>