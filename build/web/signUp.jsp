<%-- 
    Document   : signUp
    Created on : 18-Jul-2024, 2:20:37 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.user.servlet.Register"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-Up Page</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet"  href="Style.css"/>

    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class=""><a href="index.jsp" class="back-btn btn-sm mr-5"><i class="fa-solid fa-arrow-left"></i></a>
                            Registration Page</h4>
                            
                            <c:if test="${not empty successMSG}">
                                <p class="text-center text-success">${successMSG}</p>
                                <c:remove var ="successMSG" scope="session"/>
                            </c:if>
                            <c:if test="${not empty failed}">
                                <p class="text-center text-danger ">${failed}</p>
                                <c:remove var ="failed" scope="session"/>
                            </c:if>    
                            <c:if test="${not empty unchecked}">
                                <p class="text-center text-danger ">${unchecked}</p>
                                <c:remove var ="unchecked" scope="session"/>
                            </c:if>    
                            
                            
                            <form action="Register" method="post">
                                    <div class="form-group mt-1">
                                        <label for="exampleInputEmail1">Name</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Full Name" required="required" name="name">
                                    </div>
                                     <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Phone Number</label>
                                        <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number" required="required" name="phoneno">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="checkbox">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms & conditions</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1">Submit</button>
                                    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_components/footer.jsp" %>   
    </body>
</html>
