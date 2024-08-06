<%-- 
    Document   : add_fashion.jsp
    Created on : 23-Jul-2024, 10:32:03 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Items</title>
         <%@include file="allCss.jsp" %>
         <style>
        .form-group {
            margin: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            max-width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        select {
            width: 100%;
            height: 150px;
            overflow-y: auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
    </style>
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="navBar.jsp" %>
        <c:if test="${empty userobj}">
        <c:redirect url="../signin.jsp"/>
        </c:if>
    
        <div class="container p-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card" style="border-radius:  20px;">
                        <div class="card-body">
                            <h3 class="text-center">Add Items</h3>
                            <c:if test="${not empty Adminsuccess}">
                                <p class="text-center text-success">${Adminsuccess}</p>
                                <c:remove var ="Adminsuccess" scope="session"/>
                            </c:if>
                            <c:if test="${not empty Adminfail}">
                                <p class="text-center text-danger ">${Adminfail}</p>
                                <c:remove var ="Adminfail" scope="session"/>
                            </c:if>    
                            
                            
                            <form action="../fashionAdd" method="post" enctype="multipart/form-data">
                                    <div class="form-group mt-1">
                                        <label for="exampleInputEmail1">Item Name</label>
                                        <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter item Name" required="required" name="name">
                                    </div>
                                     <div class="form-group">
                                        <label for="exampleInputEmail1">Brand Name</label>
                                        <input type="text" class="form-control" id="brandName" aria-describedby="emailHelp" placeholder="ex. Puma" required="required" name="brand_name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Price</label>
                                        <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price" required="required" name="price">
                                    </div>
                                <div class="form-group">
                                        <label for="inputState">Category</label>
                                        <select id="inputState" name="category" class="form-control" size="5">
                                            <option>Mens wear</option>
                                            <option>Womens wear</option>
                                            <option>Kids wear</option>
                                            <option>Beauty Product</option>
                                            <option>Sneakers & Sport Shoes</option>
                                            <option>Casual Shoes</option>
                                            <option>Formal Shoes</option>
                                            <option>Flip Flops & Slippers</option>
                                            <option>Men Accessories</option>
                                            <option>Men Traditional</option>
                                            <option>Heels</option>
                                            <option>Women Flip Flop</option>
                                            <option>Women Casual</option>
                                            <option>Flats</option>
                                            <option>Women Western</option>
                                            <option>Women Traditionals</option>
                                            <option>Beauty & Body</option>
                                            
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputState">Status</label>
                                        <select id="inputState" name="status" class="form-control">
                                            <option selected>In-Stock</option>
                                            <option>Out of Stock</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlFile1">Upload Photo</label>
                                        <input type="file" class="form-control-file" id="exampleFormControlFile1" required="required" name="photo">
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-1">Add Item</button>
                                    
                            </form>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        
        
        
      
    </body>
</html>
