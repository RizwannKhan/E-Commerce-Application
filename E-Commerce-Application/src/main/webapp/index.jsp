<%-- 
    Document   : index
    Created on : 06-Apr-2022, 12:04:22 PM
    Author     : Rijwank
--%>
<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());

    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> catList = cDao.getCategories();
%>
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

        <!--showing products and categories -- main content-->
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%                    String cat = request.getParameter("category");
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = pDao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = pDao.getAllProductsByCatId(cid);
                    }
                %>
                <div class="col-md-2">
                    <!--show categories-->
                    <div class="list-group mt-4">
                        <a href="index?category=all" class="list-group-item list-group-item-action active c-link">
                            All Products
                        </a>
                        <%                        for (Category c : catList) {
                        %>
                        <a href="index?category=<%=c.getcId()%>" class="list-group-item list-group-item-action c-link"><%=c.getcTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-10">
                    <!--show products-->
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product p : list) {
                                %>

                                <div class="card mt-2">
                                    <div class="container text-center">
                                        <img class="card-img-top img-fluid m-2" style="max-height: 200px; max-width: 100%; width: auto;" src="products/<%=p.getpPic()%>" alt="Card image cap">
                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><%=Helper.get10Words(p.getpTitle())%></h5>
                                        <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white">Add to Cart</button>
                                        <button class="btn btn-outline-info">&#8377; <%=p.getpPrice()%></button>
                                    </div>
                                </div>

                                <% }
                                    if (list.size() == 0) {
                                        out.print("<h3>We will add products in this category soon !!!</h3>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                

    </body>
</html>
