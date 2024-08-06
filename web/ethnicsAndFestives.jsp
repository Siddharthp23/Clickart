<%-- 
    Document   : ethnicsAndFestives
    Created on : 05-Aug-2024, 1:18:25 am
    Author     : HP
--%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.List"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ethnics & Festives</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="carousel.css">
        <link rel="stylesheet" href="style.css">
        
    </head>
    <body style="background-color: #f5f5f5;" >
        <%@include file="all_components/navBar.jsp" %>
        <!-- CAROUSEL -->   
        <div class="container-fluid back-img mt-2">
          <div class="carousel">
            <div class="carousel-item">
                <img src="all_components/carousel-img/c1.avif" alt="Image 1">
            </div>
            <div class="carousel-item">
                <img src="all_components/carousel-img/c2.avif" alt="Image 2">
            </div>
            <div class="carousel-item">
                <img src="all_components/carousel-img/c3.avif" alt="Image 3">
            </div>
            <div class="carousel-item">
                <img src="all_components/carousel-img/season1.png" alt="Image 3">
            </div>
            <button class="control carousel-prev">Previous</button>
            <button class="control carousel-next">Next</button>
          </div>  
        </div>
        <script src="all_components/carousel.js"></script>
        
         <div class="container-fluid  mt-3">
             <div class="container mt-3">
                 <h3 class="text-center">Ethnics & Festives </h3>
                    <div class="row">
                            
                            <%
                            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list = dao.getMenTraditional();
                            for(Add_Items itm : list)
                            {%>
                            <div class="col-md-3 p-3">
                                <a href="viewDetails.jsp?id=<%= itm.getId()%>" style=" text-decoration: none; color: black;">
                            <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt='' src='all_components/card-img/<%=itm.getPhoto()%>' style="width:160px;height: 200px;" class="img-thumblin">
                                <p><%=itm.getName()%></p>
                                <p><%=itm.getBrand_name()%></p>
                                <p><%=itm.getCategory()%></p>
                                <div class="row">
                                    <a href="" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <a href="" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                                </div>
                            </div>
                            </div>
                            </div>    
                            <%
                                }
                            %>
                                
                        
                        
                    </div>
                 <hr>
             </div>
             
            
                    </div>
                </div>
             </div>
             
             <hr>
    <%@include file="all_components/footer.jsp" %>
    </body>
</html>
