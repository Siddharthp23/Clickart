<%-- 
    Document   : setting
    Created on : 10-Aug-2024, 12:04:18 pm
    Author     : HP
--%>
<%@ page import="java.sql.Connection" %>
<%@page import="java.util.List"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.entity.user"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="carousel.css">
        <link rel="stylesheet" href="style.css">
        <style> 
            a{
                text-decoration: none;
                color: black;
                
            }
            a:hover{
                text-decoration: none;
                color: black;
                
            }
            
        </style>
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       
      <div class="modal-body">
        <div class="text-center">
          <h4>Do you want to logout ?</h4>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <a href="logoutServlet" type="button" class="btn btn-primary text-white">Logout</a>
      
         </div>
      <div class="modal-footer">
        </div>
            </div>
    </div>
  </div>
</div>

        
        <%
            user u = (user)session.getAttribute("userobj");
            if(u == null)
            {
        %>
        <div class="containerr mt-2">
            <h2 class="text-center">Settings</h2>
            <div class="row p-5">
                <div class="col-md-6">
                    <a href="signin.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-gear fa-3x" style="color:#424242;"></i>
                               <h4 style="color:#424242;">General</h4>
                               <h6 style="color: grey;">Username , Email , Cart</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="signin.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-circle-user fa-3x" style="color:#424242;"></i>
                               <h4 style="color:#424242;">Account</h4>
                               <h6 style="color:grey;">Edit Profile</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a href="signin.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-location-dot fa-3x" style="color:#424242;"></i>
                               <h4 style="color:#424242;">Address and Details</h4>
                               <h6 style="color:grey;">Order Address</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a href="signin.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-box-open fa-3x" style="color: #424242;"></i>
                               <h4 style="color:#424242;">Your Orders</h4>
                               <h6 style="color:grey;">Track Order</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a href="all_components/help_center.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-circle-info fa-3x" style="color:#424242;;"></i>
                               <h4 style="color:#424242;">Help Center</h4>
                               <h6 style="color:grey;">27*7 Service</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
            </div>
        </div>
        <%
            }
            else
            {   
        %>
        <div class="containerr mt-2">
            <h2 class="text-center"><i class="fa-solid fa-circle-user"></i> Hello, <%=u.getName()%></h2>
            <div class="row p-5">
                <div class="col-md-6">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-gear fa-3x" style="color:#424242;"></i>
                               <h4 style="color:#424242;">General</h4>
                               <h6 style="color: grey;">Username , Email , Cart</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-circle-user fa-3x" style="color:#424242;"></i>
                               <h4 style="color:#424242;">Account</h4>
                               <h6 style="color:grey;">Edit Profile</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-location-dot fa-3x" style="color:#424242;"></i>
                               <h4 style="color:#424242;">Address and Details</h4>
                               <h6 style="color:grey;">Order Address</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-box-open fa-3x" style="color: #424242;"></i>
                               <h4 style="color:#424242;">Your Orders</h4>
                               <h6 style="color:grey;">Track Order</h6>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4 mt-3">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-circle-info fa-3x" style="color:#424242;;"></i>
                               <h4 style="color:#424242;">Help Center</h4>
                               <h6 style="color:grey;">27*7 Service</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3 text-center">
                    <a href="">
                        <div class="card">
                            <div class="card-body text-center">
                               <a data-toggle="modal" data-target="#exampleModalCenter" class="btn  text-white" style="border-radius: 20px; border-color: #424242; background-color: grey; "><i class="fa-solid fa-right-from-bracket text-white"></i> Logout</a>
                
                            </div>
                        </div>
                    </a>
                </div>    
                    
                
                    
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
