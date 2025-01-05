<%-- 
    Document   : cartitem
    Created on : 08-Aug-2024, 12:47:47 pm
    Author     : HP
--%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.Add_Items"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@page import="com.entity.user"%>
<%@page import="com.DAO.CartDaoImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <%@include file="all_components/allCss.jsp" %>
        <link rel="stylesheet" href="carousel.css">
        <link rel="stylesheet" href="style.css">
        
    </head>
    <body style="background-color: #f5f5f5;">
        <%@include file="all_components/navBar.jsp" %>
        
    <c:if test="${ empty userobj}">
        <c:redirect url="signin.jsp"></c:redirect>
    </c:if>
        
    <c:if test="${not empty deleteSuccess}">
        <div class="alert alert-success text-center" role="alert">
          ${deleteSuccess}  
        </div>
        <c:remove var="deleteSuccess" scope="session"></c:remove>
        
    </c:if>
        
        <c:if test="${not empty deleteFailed}">
        <div class="alert alert-danger text-center" role="alert">
          ${deleteFailed}  
        </div>
        <c:remove var="deleteFailed" scope="session"></c:remove>
        
    </c:if>
    <c:if test="${not empty failed}">
        <div class="alert alert-danger text-center" role="alert">
          ${failed}  
        </div>
        <c:remove var="failed" scope="session"></c:remove>
        
    </c:if>
        <div class="container" >
            <div class="row p-2 ml-2"  >
                <div clas="col-md-6">
                    
                    <div class="card">
                        <h3 class="text-center text-success mt-2"><i class="fa-solid fa-bag-shopping" style="color:grey;"></i> Bag Summary </h3>
                        <div class="card-body">
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
                                    <tbody>
                                      
                                        <%
                                            user u = (user)session.getAttribute("userobj");
                                            
                                        CartDaoImpl dao = new CartDaoImpl(DBConnect.getConn());
                                        List<Cart> cart = dao.getByUser(u.getId());
                                        Double totalPrice=0.00;
                                        itemDaoImpl dao1 = new itemDaoImpl(DBConnect.getConn()); 
                                        
                                       
                                         for(Cart c : cart)
                                        {
                                        totalPrice = totalPrice + c.getTotal_price();
                                        Add_Items ad = dao1.getItemById(c.getId());
                                        %>
                                        <tr>
                                        <td><img src="all_components/card-img/<%=ad.getPhoto()%>" style="width: 60px; height: 60px; border-radius: 3px;"/></td>
                                        <th scope="row"><%=c.getItem_name()%></th>
                                        <td><%=c.getBrand_name()%></td>
                                        <td><%=c.getPrice()%></td>
                                        <td>
                                            <a href="remove_item?id=<%=c.getId()%>&&uid=<%=c.getUid()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                      </tr>
                                        
                                        <%}
                                    
                                        %>
                                        <tr>
                                            <td>Total Amount</td>
                                            <td></td>
                                            <td></td>
                                            <td><%=totalPrice%>/-</td>
                                        </tr>  
                                        
                                      
                                    </tbody>
                                  </table>
                        </div>
                    </div>
                </div>
                
                
                
                    <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">User Details</h3>
                            <form action="order" method="post">
                                <input type="hidden" value="<%=u.getId()%>" name="id">
                                
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label> 
                                      <input type="text" name="username" class="form-control" id="inputEmail4" value="<%=u.getName()%>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                      <label for="inputPassword4">Email</label> 
                                      <input type="email" name="email" class="form-control" id="inputPassword4" value="<%=u.getEmail()%>" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                      <label for="inputEmail4">Contact No.</label>
                                      <input type="number" name="phno" class="form-control" id="inputEmail4" value="<%=u.getPhoneno()%>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                      <label for="inputPassword4">Address</label>
                                      <input type="text" name="address" class="form-control" id="inputPassword4" required >
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                      <label for="inputEmail4">landmark</label>
                                      <input type="text" name="landmark" class="form-control" id="inputEmail4" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                      <label for="inputPassword4">City</label>
                                      <input type="text" name="city" class="form-control" id="inputPassword4" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                      <label for="inputEmail4">State</label>
                                      <input type="text" name="state" class="form-control" id="inputEmail4" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                      <label for="inputPassword4">Pin Code</label>
                                      <input type="text" name="pincode" class="form-control" id="inputPassword4" required>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label>Paymet Mode</label>
                                    <select class="form-control" name="payment">
                                        <option value="COD">Cash On delivery</option>
                                        <option>UPI  </option>
                                        <option>Credit or debit card  </option>
                                        <option>EMI  </option>
                                        <option>Net Banking  </option>
                                    </select>
                                </div>
                                
                                <div class="text-center">
                                    <button class="btn btn-warning">Buy Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>
                                
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
                
                
            </div>
            
            
        </div>
            
    
    
    
    
    </body>
</html>
