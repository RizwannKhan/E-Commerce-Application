<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");
    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> cList = categoryDao.getCategories();
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index">E-Commerce</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>                    
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%                        for (Category cc : cList) {
                        %>
                        <a class="dropdown-item" href="#"><%=cc.getcTitle()%></a>
                        <% }%>
                    </div>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="about">About us</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <%
                    if (user1 == null) {%>
                <li class="nav-item active">
                    <a class="nav-link" href="login">Login </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register">Register</a>
                </li> 
                <%  } else {%>
                <li class="nav-item active">
                    <a class="nav-link" href="#!"><%=user1.getUserName()%> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li> 
                <%    }
                %>

            </ul>

        </div>
    </div>
</nav>
