<%-- 
    Document   : normal
    Created on : 08-Apr-2022, 9:48:59 AM
    Author     : Rijwank
--%>
<%@page import="com.ecommerce.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("msg", "You are not logged in !! Login first");
        response.sendRedirect("login");
        return;
    } else {
        if (user.getUserType().equals("admin")) {
            session.setAttribute("msg", "You are not logged in as Normal User !! you can not access to this page");
            response.sendRedirect("login");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<%@include file="components/common_css_js.jsp" %>
        <title>E-Commerce - User Panel</title>
    </head>
    <body>
        <!--navbar-->
        <%@include file="components/navbar.jsp" %>
        <h1>Normal user panel</h1>
    </body>
</html>
