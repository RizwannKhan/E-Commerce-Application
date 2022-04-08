<%-- 
    Document   : login
    Created on : 07-Apr-2022, 10:55:07 AM
    Author     : Rijwank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css and js-->
        <%@include file="components/common_css_js.jsp" %>
        <title>E-Commerce - Login</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>    

        <div class="container">
            <div class="row mt-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="container mt-3 text-center">
                            <img src="img/login.png" alt="Login User" width="150">
                            <h3>Login Here !!!</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post"> 
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="container text-center mt-2">
                                    <button type="submit" class="btn btn-outline-primary">Submit</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
                            <p>Not a member,<a href="register"> click here !!!</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
