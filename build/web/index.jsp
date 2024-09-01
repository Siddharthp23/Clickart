<%-- 
    Document   : index
    Created on : 18-Jul-2024, 9:28:50 am
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
        <title>Clickart-Index</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="carousel.css">
        <link rel="stylesheet" href="style.css">
        <style>
            #toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

        </style>

    </head>
    <body style="background-color: #f5f5f5;" >
        
        <%
           user u = (user)session.getAttribute("userobj");
        %>
        
        
        
        <%@include file="all_components/navBar.jsp" %>
        
        <c:if test="${not empty addcart}">
    <div id="toast"> ${addcart} </div>

        <script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000);
		}	
        </script>
        <c:remove var="addcart" scope="session"/>
    </c:if>
    
    <c:if test="${not empty addfav}">
    <div id="toast"> ${addfav} </div>

        <script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000);
		}	
        </script>
        <c:remove var="addfav" scope="session"/>
    </c:if>
        
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
             <h3 class="text-center">Season's Style</h3>
             <div class="carousel">
                <div class="carousel-inner">
                        <div class="carousel-item active"><img src="all_components/carousel-img/m1.avif" alt="Image 1"></div>
                        <!-- Add more items as needed -->
                </div>
            </div>
             
             <div class="container mt-3">
                 <h3 class="text-center">Men's Fashion</h3>
                    <div class="row">
                            
                            <%
                            itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list = dao.getNewFashion();
                            for(Add_Items itm : list)
                            {%>
                            <div class="col-md-3">
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
                                             <a href="cart?id=<%=itm.getId()%>&&uid=<%=u.getId()%>"class="btn btn-danger btn-sm ml-5"><i class="fa-solid fa-cart-shopping"></i></a>    
                                    <%
                                        }
                                    %>
                                    
                                    <% 
                                        if(itm.getCategory().equalsIgnoreCase("Mens Wear"))
                                        {
                                    %>
                                    <a href="MenWear.jsp" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <% 
                                        } 
                                    %>
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
                            </a>
                            </div>    
                            <%
                                }
                            %>
                                
                        
                        
                    </div>
                 <hr>
             </div>
             
             <!-- WOMEN -->
             
             <div class="container mt-3">
                 <h3 class="text-center">Women's Fashion</h3>
                    <div class="row">
                            <%
                            itemDaoImpl dao1 = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list1 = dao1.getWomenFashion();
                            for(Add_Items itm : list1)
                            {%>
                            <div class="col-md-3">
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
                                    
                                    <% 
                                        if(itm.getCategory().equalsIgnoreCase("Womens Wear"))
                                        {
                                    %>
                                    <a href="MenWear.jsp" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <% 
                                        } 
                                    %>
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
                 <h3 class="text-center">Kid's Fashion</h3>
                    <div class="row">
                            <%
                            itemDaoImpl dao2 = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list2 = dao2.getKidsFashion();
                            for(Add_Items itm : list2)
                            {%>
                        
                        <div class="col-md-3">
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
                                    
                                    <% 
                                        if(itm.getCategory().equalsIgnoreCase("kids Wear"))
                                        {
                                    %>
                                    <a href="MenWear.jsp" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <% 
                                        } 
                                    %>
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
                <h3 class="text-center">Beauty-Products</h3>
                <div class="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active"><img src="all_components/carousel-img/beauty1.avif" alt="Image 1"></div>
                <!-- Add more items as needed -->
                </div>
             </div>
                <div class="container mt-3">
                    <div class="row">
                            <%
                            itemDaoImpl dao3 = new itemDaoImpl(DBConnect.getConn()); 
                            List<Add_Items> list3 = dao3.getBeauty();
                            for(Add_Items itm : list3)
                            {%>

                        
                        <div class="col-md-3">
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
                                             
                                    <% 
                                        if(itm.getCategory().equalsIgnoreCase("Beauty Product"))
                                        {
                                    %>
                                    <a href="BeautyPro.jsp" class="btn btn-success btn-sm ml-1"><i class="fa-solid fa-eye"></i></a>
                                    <% 
                                        } 
                                    %>
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
