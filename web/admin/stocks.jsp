<%-- 
    Document   : stocks.jsp
    Created on : 23-Jul-2024, 10:32:27 pm
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>stock</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="navBar.jsp" %>  
        <c:if test="${empty userobj}">
        <c:redirect url="../signin.jsp"/>
        </c:if>
    
        <h3 class="text-center p-1">Stock-Availability</h3>
        
        <table class="table table-striped p-3">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Image</th>
                <th scope="col">Name</th>
                <th scope="col">Brand Name</th>
                <th scope="col">Price</th>
                <th scope="col">Category</th>
                <th scope="col">Status</th>
                
            </tr>
            </thead>
            <tbody>
              <%
                itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn()); 
                List<Add_Items> list = dao.getAllImage();
                for(Add_Items a : list)
                {
                %>
            <tr>
              <td><%= a.getId()%></td>
              <td><img src="../all_components/card-img/<%=a.getPhoto()%>" style="height:50px; width: 50px"/></td>
              <td><%= a.getName()%></td>
              <td><%= a.getBrand_name()%></td>
              <td><%= a.getPrice()%></td>
              <td><%= a.getCategory()%></td>
              <td><%= a.getStatus()%></td>
            </tr>
            <%
               }
            %>
            
          </tbody>
        </table>    
        
    </body>
</html>
