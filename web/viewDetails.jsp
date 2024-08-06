<%-- 
    Document   : viewDetails
    Created on : 06-Aug-2024, 1:53:57 pm
    Author     : HP
--%>
<%@ page import="java.sql.Connection" %>
<%@page import="java.util.List"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="style.css">
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
        
        <%
        int id = Integer.parseInt(request.getParameter("id"));
        itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn());
        Add_Items itm = dao.getItemById(id);
        %>
        
        
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="all_components/card-img/<%=itm.getPhoto()%>" style="height: 150px; width: 150px;"><br>
                    <h4 class="mt-3">Name :<span class="text-success"> <%=itm.getName()%></span> </h4>
                    <h4>Brand Name : <span class="text-success"> <%=itm.getBrand_name()%></span></h4>
                    <h4>Category : <span class="text-success"> <%=itm.getCategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2>Tshirt Puma</h2>
                    <div class="row">
                        <div class="col-md-4 text-primary text-center p-2">
                            <i class="fa-solid fa-wallet fa-2x"></i>
                            <p>Cash On Delivery Available</p>
                        </div>
                        <div class="col-md-4 text-primary text-center p-2">
                            <i class="fa-solid fa-rotate-left fa-2x"></i>
                            <p>7 Days Free Return Available</p>
                        </div>
                        <div class="col-md-4 text-primary text-center p-2">
                            <i class="fa-solid fa-truck-fast fa-2x"></i>
                            <p>Delivery Within 2 Days</p>
                        </div>
                        
                    </div>
                    <div class="text-center p-2">
                        <a href="#" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add to Bag</a>
                        <a href="#" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
