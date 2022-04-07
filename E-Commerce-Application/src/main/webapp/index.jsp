<%-- 
    Document   : index
    Created on : 06-Apr-2022, 12:04:22 PM
    Author     : Rijwank
--%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css and js-->
        <%@include file="components/common_css_js.jsp" %>
        <title>E-Commerce - Home</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <%
            out.println(FactoryProvider.getFactory());
        %>

    </body>
</html>
