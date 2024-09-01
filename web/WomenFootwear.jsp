<%-- 
    Document   : WomenFootwear
    Created on : 05-Aug-2024, 10:32:51 pm
    Author     : HP
--%>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.List"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.entity.user"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Women Footwear</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="carousel.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body style="background-color: #f5f5f5;" >
     
        <%
           user u = (user)session.getAttribute("userobj");
        %>

        
        <%@include file="all_components/navBar.jsp" %>
        <!-- CAROUSEL -->   
        <div class="container-fluid back-img mt-2">
          <div class="carousel">
            <div class="carousel-item">
                <img src="all_components/carousel-img/cf1.avif" alt="Image 1">
            </div>
              <div class="carousel-item">
                <img src="all_components/carousel-img/wf1.avif" alt="Image 2">
            </div>
            
            <button class="control carousel-prev">Previous</button>
            <button class="control carousel-next">Next</button>
          </div>  
        </div>
        <script src="all_components/carousel.js"></script>
        
         <div class="container-fluid  mt-3">
             <div class="container mt-3">
                 <h3 class="text-center">Heels</h3>
                    <div class="row">
                            
                            <%
                            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list = dao.getHeels();
                            for(Add_Items itm : list)
                            {%>
                            <div class="col-md-3 p-3">
                                <a href="viewDetails.jsp?id=<%= itm.getId()%>" style=" text-decoration: none; color: black;">
                            <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt='' src='all_components/card-img/<%=itm.getPhoto()%>' style="width:150px;height: 200px;" class="img-thumblin">
                                <p><%=itm.getName()%></p>
                                <p><%=itm.getBrand_name()%></p>
                                <p><%=itm.getCategory()%></p>
                                <div class="row">
                                    <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="cart?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>    
                                    <%
                                        }
                                    %>
                                    <a href="" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                                    <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="favourite?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>    
                                    <%
                                        }
                                    %> 
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
             
             <!-- WOMEN -->
             
             <div class="container mt-3">
                 <h3 class="text-center">Casual Shoes</h3>
                    <div class="row">
                            <%
                            itemDaoImpl dao1 = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list1 = dao1.getWomenCasuals();
                            for(Add_Items itm : list1)
                            {%>
                            <div class="col-md-3 p-3">
                                <a href="viewDetails.jsp?id=<%= itm.getId()%>" style=" text-decoration: none; color: black;">
                            <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt='' src='all_components/card-img/<%=itm.getPhoto()%>' style="width:150px;height: 200px;" class="img-thumblin">
                                <p><%=itm.getName()%></p>
                                <p><%=itm.getBrand_name()%></p>
                                <p><%=itm.getCategory()%></p>
                                <div class="row">
                                    <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="cart?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>    
                                    <%
                                        }
                                    %>
                                    <a href="" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                                <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="favourite?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>    
                                    <%
                                        }
                                    %> 
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
             <!-- KIDS -->
             <div class="container mt-3">
                 <h3 class="text-center">Flats</h3>
                    <div class="row">
                            <%
                            itemDaoImpl dao2 = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list2 = dao2.getFlats();
                            for(Add_Items itm : list2)
                            {%>
                        
                        <div class="col-md-3 p-3">
                            <a href="viewDetails.jsp?id=<%= itm.getId()%>" style=" text-decoration: none; color: black;">
                            <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt='' src='all_components/card-img/<%=itm.getPhoto()%>' style="width:150px;height: 200px;" class="img-thumblin">
                                <p><%=itm.getName()%></p>
                                <p><%=itm.getBrand_name()%></p>
                                <p><%=itm.getCategory()%></p>
                                <div class="row">
                                    <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="cart?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>    
                                    <%
                                        }
                                    %>
                                    <a href="" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                                <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="favourite?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>    
                                    <%
                                        }
                                    %> 
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
             <!-- Beauty -->
             <div class="container-fluid  mt-3">
                <h3 class="text-center">Flip Flop & Slippers</h3>
                <div class="carousel">
                    
             </div>
                <div class="container mt-3">
                    <div class="row">
                            <%
                            itemDaoImpl dao3 = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list3 = dao3.getWomenFlipFlop();
                            for(Add_Items itm : list3)
                            {%>

                        
                        <div class="col-md-3 p-3">
                            <a href="viewDetails.jsp?id=<%= itm.getId()%>" style=" text-decoration: none; color: black;">
                            <div class="card crd-ho">
                            <div class="card-body text-center">
                                <img alt='' src='all_components/card-img/<%=itm.getPhoto()%>' style="width:150px;height: 200px;" class="img-thumblin">
                                <p><%=itm.getName()%></p>
                                <p><%=itm.getBrand_name()%></p>
                                <p><%=itm.getCategory()%></p>
                                <div class="row">
                                    <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="cart?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>    
                                    <%
                                        }
                                    %>
                                    <a href="" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                                <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="favourite?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn  text-white btn-sm ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>    
                                    <%
                                        }
                                    %> 
                                </div>
                            </div>
                            </div>    
                        </div>
                        <%
                            }
                        %>
                        <div class="text-center">
                            <a href=""><i class="fa-solid fa-angle-down"></i></a>
                        </div>
                    </div>
                </div>
             </div>
             
             <hr>
    <%@include file="all_components/footer.jsp" %>
    </body>
</html>
