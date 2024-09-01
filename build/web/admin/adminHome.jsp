<%-- 
    Document   : adminHome
    Created on : 21-Jul-2024, 11:59:34 am
    Author     : HP
--%>
<%@page import="com.entity.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
       <%@include file="allCss.jsp" %>
    </head>
    <style>
        a{
            text-decoration: none;
            color: black;
        }
    </style>
    <body style="background-color: #f5f5f5;">
        <%@include file="navBar.jsp" %>
        
    <c:if test="${empty userobj}">
    <c:redirect url="../signin.jsp"/>
    </c:if>
        
        <div class="container p-3">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="add_fashion.jsp">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-person fa-3x text-primary"></i><br>
                               <h4>Add Items</h4>
                               ---------------------
                            </div>
                        </div>
                    </a>    
                </div>
                <div class="col-md-3">
                    <a href='manage-items.jsp'>    
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-bars-progress fa-3x text-warning"></i><br>
                                <h4>Manage Items</h4>
                               ---------------------
                            </div>
                        </div>
                    </a>    
                </div>
                <div class="col-md-3">
                    <a href='stocks.jsp'>
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                               <i class="fa-brands fa-stack-overflow fa-3x text-success"></i><br>
                               <h4>Check Stock</h4>
                               ---------------------
                            </div>
                        </div>
                    </a>    
                </div>
                <div class="col-md-3">
                    <a data-toggle="modal" data-target="#exampleModalCenter">
                        <div class="card crd-ho">
                            <div class="card-body text-center">
                               <i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br>
                               <h4>Logout</h4>
                               ---------------------
                            </div>
                        </div>
                        </a>    
                </div>
            </div>
        </div>
        
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
          <a href="../logoutServlet" type="button" class="btn btn-primary text-white">Logout</a>
      
         </div>
      <div class="modal-footer">
        </div>
            </div>
    </div>
  </div>
</div>

        
        <%@include file="footer.jsp" %>
    </body>
</html>
