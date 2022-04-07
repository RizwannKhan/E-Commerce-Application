<%-- 
    Document   : register
    Created on : 06-Apr-2022, 1:01:51 PM
    Author     : Rijwank
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>E-Commerce - Register</title>
    </head>
    <body>
        <!--navbar-->
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">                    
                    <div class="card">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body px-4">
                            <div class="container text-center">
                                <img src="img/add_user.png" alt="Add User" width="150">
                                <h3 class="my-3">Sign up here !!!</h3>
                            </div>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input type="text" class="form-control" id="name" name="user_name" aria-describedby="name" placeholder="Enter user name">
                                </div> 
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input type="email" class="form-control" id="email" name="user_email" aria-describedby="emailHelp" placeholder="Enter user email">
                                </div> 
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input type="password" class="form-control" id="password" name="user_password" aria-describedby="password" placeholder="Enter password">
                                </div> 
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input type="number" class="form-control" id="phone" name="user_phone" aria-describedby="phone" placeholder="Enter phone">
                                </div> 
                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea class="form-control" rows="5" name="user_address" placeholder="Enter your address"></textarea>
                                </div> 

                                <div class="container text-center">
                                    <button class="btn btn-outline-success" type="submit">Register</button>
                                    <button class="btn btn-outline-warning" type="reset">Reset</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
                            <p>Already a member,<a href="register"> click here to Login !!!</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
