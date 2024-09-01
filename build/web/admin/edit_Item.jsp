<%@page import="com.entity.Add_Items"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.itemDaoImpl"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>
    <link rel="stylesheet" href="edit.css">
    <script src="edit.js" defer></script>
</head>
<body>

<!-- Anchor Tag to Open the Popup -->
 

<!-- Popup Form -->
<div id="popupForm" class="popup">
    <div class="popup-content">
        <span class="close" id="closePopup">&times;</span>
        <h2>Edit Item</h2>
        
        <c:if test="${not empty editSuccess}">
            <h5 class="text-center text-success">${editSuccess}</h5>
            <c:remove var ="editSuccess" scope="session"/>
        </c:if>
        <c:if test="${not empty editFailed}">
            <h5 class="text-center text-danger ">${editFailed}</h5>
            <c:remove var ="editFailed" scope="session"/>
        </c:if>    
                            
        <%
            int id=Integer.parseInt(request.getParameter("id"));
            itemDaoImpl dao=new itemDaoImpl(DBConnect.getConn());
            Add_Items it = dao.getItemById(id);
        %>
       
                            
        <form action="../editItemServlet" method="post">
            <input type="hidden"  name="id" value =" <%=it.getId()%>">
            <label for="itemName">Item Name:</label>
            <input type="text" id="itemName" name="name" required value="<%=it.getName()%>"><br>

            <label for="brandName">Brand Name:</label>
            <input type="text" id="brandName" name="brand_name" required value="<%=it.getBrand_name()%>"><br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required step="0.01" value="<%=it.getPrice()%>"><br>

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
<br>
            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <%
                    if("In-Stock".equals(it.getStatus()))
                    {
                %>
                        <option>In-Stock</option>
                        <option>Out of Stock</option>
                <%  
                    }else
                    {
               %>
                        <option>Out of Stock</option>
                        <option>In-Stock</option>
                <%  
                    }
                %>
             </select><br>
             <input type="submit" value="Save Changes">
        </form>
    </div>
</div>

</body>
</html>