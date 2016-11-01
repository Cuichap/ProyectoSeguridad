<%-- 
    Document   : mantenimiento
    Created on : 20/10/2016, 09:31:54 PM
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

<div id="mantenimiento"   style="margin-top: -10px;">

</div>

<script>
    $(document).ready(function () {
    <% if (IdSubMenu.equals("11") || IdSubMenu.equals("")) { %>
        ir11();
    <%}
        if (IdSubMenu.equals("12")) { %>
        ir12();
    <%}
        if (IdSubMenu.equals("13")) { %>
        ir13();
    <%}
        if (IdSubMenu.equals("14")) { %>
        ir14();
    <%}
        if (IdSubMenu.equals("15")) { %>
        ir15();
    <%}
        if (IdSubMenu.equals("16")) { %>
        ir16();
    <%}
        if (IdSubMenu.equals("17")) { %>
        ir17();
    <%}
        if (IdSubMenu.equals("18")) { %>
        ir18();
    <%}%>
    });
</script>


<%@include file="WEB-INF/jspf/bottom.jspf" %>
<%@include file="WEB-INF/jspf/perfil.jspf" %>