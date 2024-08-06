<%-- 
    Document   : signin
    Created on : 18-Jul-2024, 2:13:11 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-In</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet"  href="Style.css"/>
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body" style=" margin-bottom: 23px;">
                            <h4 class=""><a href="index.jsp" class="back-btn btn-sm mr-5"><i class="fa-solid fa-arrow-left"></i></a>
                            Login Page</h4>
                            
                            <c:if test="${not empty failedMsg}">
                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty LogoutMsg}">
                                <h5 class="text-center text-success">${LogoutMsg}</h5>
                                 <c:remove var ="LogoutMsg" scope="session"/>
                            </c:if>
                            
                                
                            
                            <form action="login" method="post">
                                <div class="form-group mt-1">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
                                </div>
                                <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" name="password">
                                </div>
                                <div class="text-center mt-1">
                                    <button type="submit" class="btn btn-primary mt-1">Login</button><br>
                                    <small id="emailHelp" class="form-text text-muted">Don't have an account?</small>
                                        <a href="signUp.jsp">Create Account</a>   
                                </div>        
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_components/footer.jsp" %>
    </body>
</html>
