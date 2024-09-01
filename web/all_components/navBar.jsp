<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>

<div class="container-fluid" style="height: 10px;background-color:#424242;"></div>

<div class="container-fluid p-3" style="background-color: #f5f5f5;">
    <div class="row">
        <div class="col-md-3">
            <h3><i class="fa-solid fa-bag-shopping"></i> ClicKart</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <input class="form-control search-bar mr-sm-2" type="search" name="ch" style="width: 70vh;" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary search-btn my-2 my-sm-0" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        
        <c:if test="${not empty userobj}">
                <div class="col-md-3 mr-auto">
                    <a href="#" class="btn btn-primary text-white" style="border-radius: 20px; border-color: #424242;  width: 9vw;"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
                    <a href="cartitem.jsp" class="btn  text-white" style="border-radius: 20px; border-color: #424242;"><i class="fa-solid fa-bag-shopping" style=" color: grey;"></i></a>
                    <a href="favourite.jsp" class="btn  text-white" style="border-radius: 20px; border-color: #424242;"><i class="fa-solid fa-heart" style="color:red;"></i></a>
                </div>
        
        </c:if>
        <c:if test="${empty userobj}">
            <div class="col-md-3">
                    <a href="signin.jsp" class="btn btn-success text-white" ><i class="fa-solid fa-right-to-bracket"></i> Sign-In</a>
                    <a href="signUp.jsp" class="btn btn-primary text-white" ><i class="fa-solid fa-user-plus"></i> Sign-Up</a>
                </div>
            
            
        </c:if>
        
        
        
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
          <a href="logoutServlet" type="button" class="btn btn-primary text-white">Logout</a>
      
         </div>
      <div class="modal-footer">
        </div>
            </div>
    </div>
  </div>
</div>




<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-user"></i> HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        
      <li class="nav-item active dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="fa-solid fa-mars"></i> MEN
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="footwear.jsp">Footwear</a>
          <a class="dropdown-item" href="MenAccessories.jsp">Accessories</a>
          <a class="dropdown-item" href="ethnicsAndFestives.jsp">Ethnics & Festives</a>
        </div>
      </li>
      <li class="nav-item active dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="fa-solid fa-venus"></i> WOMEN
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="WomenFootwear.jsp">Footwear</a>
          <a class="dropdown-item" href="WomenWestern.jsp">Western-Wear</a>
          <a class="dropdown-item" href="WomenTraditional.jsp">Traditional</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#"><i class="fa-solid fa-child"></i> KIDS</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="BeautyPro.jsp">BEAUTY</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          About
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="all_components/about.jsp">About</a>
          <a class="dropdown-item" href="all_components/contactUs.jsp">Contact Us</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="all_components/help_center.jsp">Help Center</a>
        </div>
      </li>
      <li class="nav-item">
        
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-bars"></i> Setting</a>
    </form>
  </div>
</nav>