<%-- 
    Document   : admin
    Created on : 08-Apr-2022, 9:48:46 AM
    Author     : Rijwank
--%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.CategoryDao"%>
<%@page import="com.ecommerce.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("msg", "You are not logged in !! Login first");
        response.sendRedirect("login");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("msg", "You are not Admin !! you can not access to this page");
            response.sendRedirect("login");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css and js-->
        <%@include file="components/common_css_js.jsp" %>
        <title>E-Commerce - Admin Panel</title>      
    </head>
    <body>
        <!--navbar-->
        <%@include file="components/navbar.jsp" %>

        <!--main admin content-->
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>           

            <div class="row mt-3">
                <div class="col-md-4 text-center">
                    <!--total users-->
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/all-users.png" class="img-fluid" alt="users_icon" width="150">
                            </div>
                            <h1>123</h1>
                            <h3 class="text-uppercase text-muted">Users</h3>
                        </div>
                    </div>
                </div>  
                <div class="col-md-4 text-center">
                    <!--total categorues-->
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/categories.png" class="img-fluid" alt="users_icon" width="150">
                            </div>
                            <h1>215</h1>
                            <h3 class="text-uppercase text-muted">Categories</h3>
                        </div>
                    </div>
                </div>  
                <div class="col-md-4 text-center">
                    <!--total products-->
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/products.png" class="img-fluid" alt="users_icon" width="150">
                            </div>
                            <h1>251</h1>
                            <h3 class="text-uppercase text-muted">Products</h3>
                        </div>
                    </div>
                </div>  
            </div>
            <div class="row mt-4">
                <div class="col-md-6 text-center">
                    <!--add category-->
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/add-category.png" class="img-fluid" alt="users_icon" width="150">
                            </div>
                            <h3 class="text-uppercase mt-2 text-muted">Add Category</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 text-center">
                    <!--add product-->
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img src="img/add-product.png" class="img-fluid" alt="users_icon" width="150">
                            </div>
                            <h3 class="text-uppercase mt-2 text-muted">Add Products</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--modal for add category-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="oparation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category title">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter category description" name="catDesc" rows="7"></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-lg btn-outline-primary">Add Category</button>
                                <button type="button" class="btn btn-outline-secondary ml-2" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end category modal-->

        <!--modal for add product-->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="oparation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" name="prodTitle" placeholder="Enter product title" required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter product description" name="prodDesc" rows="5" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="prodPrice" placeholder="Enter product price" required>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="prodDiscount" placeholder="Enter product discount" required>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="prodQuantity" placeholder="Enter product quantity" required>
                            </div>
                            <div class="form-group">
                                <%                                    CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> catList = catDao.getCategories();
                                %>
                                <select name="catId" id="" class="form-control" required>
                                    <option disabled selected>---Select---</option>
                                    <% for (Category c : catList) {%>
                                    <option value="<%=c.getcId()%>"><%= c.getcTitle()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="prodPic">Select Product photo :</label>
                                <input type="file" id="prodPic" class="form-control" name="prodPic" required>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-lg btn-outline-primary">Add Product</button>
                                <button type="button" class="btn btn-outline-secondary ml-2" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end product modal-->

    </body>
</html>
