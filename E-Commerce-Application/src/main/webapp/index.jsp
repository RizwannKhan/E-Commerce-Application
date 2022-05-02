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
<%
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
                <div class="col-md-2">
                    <!--show categories-->
                    <div class="list-group mt-4">
                        <a href="#" onclick="getProducts(0, this)" class="list-group-item list-group-item-action active c-link">
                            All Products
                        </a>
                        <%                        for (Category c : catList) {
                        %>
                        <a href="#" onclick="getProducts(<%=c.getcId()%>, this)" class="list-group-item list-group-item-action c-link"><%=c.getcTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>

                <div class="col-md-10">
                    <!--show products-->
                    <div class="container text-center mt-4" id="prod_loader">
                        <i class="fa fa-refresh fa-5x fa-spin"></i>
                        <h3 class="mt-3">Loading...</h3>
                    </div>
                    <div class="container-fluid" id="prod_container"></div>
                </div>
            </div>
        </div>  


                        <%@include file="components/common_modals.jsp" %>
        <script type="text/javascript">
            //show products    
            function getProducts(catId, temp) {
                $('#prod_loader').show();
                $('#prod_container').hide();

                $('.c-link').removeClass('active');

                $.ajax({
                    url: "show_products",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        //console.log(data);
                        $('#prod_loader').hide();
                        $('#prod_container').show();
                        $('#prod_container').html(data);
                        $(temp).addClass('active');
                    }
                });
            }

            $(document).ready(function (e) {
                let allProdRef = $('.c-link')[0];
                getProducts(0, allProdRef);
            });
        </script>
    </body>
</html>
