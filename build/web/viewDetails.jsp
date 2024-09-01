<%-- 
    Document   : viewDetails
    Created on : 06-Aug-2024, 1:53:57 pm
    Author     : HP
--%>
<%@ page import="java.sql.Connection" %>
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
        <title>View Details</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="style.css">
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
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
         <%
           user u = (user)session.getAttribute("userobj");
        %>
        
        <%
        int id = Integer.parseInt(request.getParameter("id"));
        itemDaoImpl dao = new itemDaoImpl(DBConnect.getConn());
        Add_Items itm = dao.getItemById(id);
        %>
       
        
         
        
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
    
        
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="all_components/card-img/<%=itm.getPhoto()%>" style="height: 150px; width: 150px;"><br>
                    <h4 class="mt-3">Name :<span class="text-success"> <%=itm.getName()%></span> </h4>
                    <h4>Brand Name : <span class="text-success"> <%=itm.getBrand_name()%></span></h4>
                    <h4>Category : <span class="text-success"> <%=itm.getCategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=itm.getName()%></h2>
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
                         <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn btn-primary  ml-5"><i class="fa-solid fa-bag-shopping"></i> Add to Bag</a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="cart?id=<%=itm.getId()%>&&uid=<%=u.getId()%>"class="btn btn-primary  ml-5"><i class="fa-solid fa-bag-shopping"></i> Add to Bag</a>    
                                    <%
                                        }
                                    %>
                                    <a href="#" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=itm.getPrice()%></a>
                                    <%
                                        if(u==null)
                                        {
                                    %>
                                            <a href="signin.jsp" class="btn  text-white  ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>
                                    <%
                                        }
                                        else{   
                                    %>
                                             <a href="favourite?id=<%=itm.getId()%>&&uid=<%=u.getId()%>" class="btn  text-white  ml-1" style="border-radius: 20px; border-color: #424242;" ><i class="fa-regular fa-heart" style="color:black;"></i></a>    
                                    <%
                                        }
                                    %> 
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
