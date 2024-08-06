<%-- 
    Document   : manage-items.jsp
    Created on : 23-Jul-2024, 10:32:14 pm
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Items</title>
        <%@include file="allCss.jsp" %>
        <link rel="stylesheet" href="edit.css">
         
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="navBar.jsp" %>  
        <c:if test="${empty userobj}">
        <c:redirect url="../signin.jsp"/>
        </c:if>
    
        <h3 class="text-center p-1">Manage-Items</h3>
       <c:if test="${not empty editSuccess}">
            <h5 class="text-center text-success">${editSuccess}</h5>
            <c:remove var ="editSuccess" scope="session"/>
        </c:if>
        <c:if test="${not empty editFailed}">
            <h5 class="text-center text-danger ">${editFailed}</h5>
            <c:remove var ="editFailed" scope="session"/>
        </c:if>    
        
        <c:if test="${not empty deleteSuccess}">
            <h5 class="text-center text-success">${deleteSuccess}</h5>
            <c:remove var ="deleteSuccess" scope="session"/>
        </c:if>
        <c:if test="${not empty deleteFailed}">
            <h5 class="text-center text-danger">${deleteFailed}</h5>
            <c:remove var ="deleteFailed" scope="session"/>
        </c:if>    
        
        <table class="table table-striped p-3">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Image</th>
                <th scope="col">Name</th>
                <th scope="col">Brand Name</th>
                <th scope="col">Price</th>
                <th scope="col">Category</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
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
              <td><%=a.getId()%></td>
              <td><img src="../all_components/card-img/<%=a.getPhoto()%>" style="width: 50px; height: 50px;"/></td>
              <td><%=a.getName()%></td>
              <td><%=a.getBrand_name()%></td>
              <td><%=a.getPrice()%></td>
              <td><%=a.getCategory()%></td>
              <td><%=a.getStatus()%></td>
              <td>
                  
                  <a href="edit_Item.jsp?id=<%=a.getId()%>" id="openPopup" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i></a>
                  <a href="../delete?id=<%=a.getId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i></a>
              </td>
              
            </tr>
                
            <%
               }
            %>
            
          </tbody>
        </table>    
       <script src="edit.js"></script> 
    </body>
</html>
