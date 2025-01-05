<%-- 
    Document   : favourite.jsp
    Created on : 11-Aug-2024, 5:12:52 pm
    Author     : HP
--%>
<%@page import="java.util.List"%>
<%@page import="com.entity.favourite"%>
<%@page import="com.entity.user"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DAO.FavDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Favourites</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="carousel.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
        
        <c:if test="${ empty userobj}">
        <c:redirect url="signin.jsp"></c:redirect>
    </c:if>
    
       
    <h1 class="text-center">Favorites</h1>
        
 
                    
                                <table class="table">
                                    <thead class="thead-dark">
                                      <tr>
                                        <th scope="col">Image</th>  
                                        <th scope="col">Item-Name</th>
                                        <th scope="col">Brand</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                      </tr>
                                    </thead>
                                    <c:if test="${not empty SuccessFav}">
                                        <div class="alert alert-success" role="alert">
                                          ${SuccessFav}  
                                        </div>
                                        <c:remove var="deleteSuccess" scope="session"></c:remove>

                                    </c:if>

                                        <c:if test="${not empty FailedFav}">
                                        <div class="alert alert-danger" role="alert">
                                          ${FailedFav}  
                                        </div>
                                        <c:remove var="deleteFailed" scope="session"></c:remove>

                                    </c:if>
                                    <tbody>
                                      
                                        <%
                                            user u = (user)session.getAttribute("userobj");
                                            
                                        FavDaoImpl dao = new FavDaoImpl(DBConnect.getConn());
                                        List<favourite> list = dao.getByUser(u.getId());
                                        itemDaoImpl dao1 = new itemDaoImpl(DBConnect.getConn());
                                        for(favourite fav : list)
                                        
                                        {
                                        Add_Items ad = dao1.getItemById(fav.getId());
                                        %>
                                        <tr>
                                        <td><img src="all_components/card-img/<%=ad.getPhoto()%>" style="width: 60px; height: 70px; border-radius: 3px;"/></td>    
                                        <th scope="row"><%=fav.getItem_name()%></th>
                                        <td><%=fav.getBrand_name()%></td>
                                        <td><%=fav.getPrice()%></td>
                                        <td>
                                            <a href="removeFav?id=<%=fav.getId()%>&&uid=<%=fav.getUid()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                      </tr>
                                        
                                        <%}
                                        
                                        %>
                                          
                                        
                                      
                                    </tbody>
                                  </table>
                        
            
      
    
    </body>
</html>
