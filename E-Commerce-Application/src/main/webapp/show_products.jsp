<%-- 
    Document   : show_products
    Created on : 02-May-2022, 10:37:53 AM
    Author     : Rijwank
--%>

<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
    int cat = Integer.parseInt(request.getParameter("cid"));
    List<Product> list = null;
    if (cat == 0) {
        list = pDao.getAllProducts();
    } else {
        list = pDao.getAllProductsByCatId(cat);
    }
%>

<style type="text/css">
    <%@include file="css/style.css" %>
</style>

<div class="row mt-4">
    <div class="col-md-12">
        <div class="card-columns">
            <%
                for (Product p : list) {
            %>

            <!-- product card-->
            <div class="card product-card mt-2">
                <div class="container text-center">
                    <img class="card-img-top img-fluid m-2" style="max-height: 200px; max-width: 100%; width: auto;" src="products/<%=p.getpPic()%>" alt="Card image cap">
                </div>

                <div class="card-body">
                    <h5 class="card-title"><%=Helper.get10Words(p.getpTitle())%></h5>
                    <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                </div>
                <div class="card-footer">
                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpTitle()%>', <%=p.getpPrice()%>)">Add to Cart</button>
                    <button class="btn btn-outline-info">&#8377; <%=p.getPriceAfterDiscount()%>/- <span class="text-secondary font-weight-light" style="font-size: 12px;"> <strike>&#8377; <%= p.getpPrice()%></strike> <%=p.getpDiscount()%>% off</span></button>
                </div>
            </div>

            <% }
                if (list.size() == 0) {
                    out.print("<h3 style='font-style: italic;'>We will add products in this category soon !!!</h3>");
                }
            %>
        </div>
    </div>
</div>
