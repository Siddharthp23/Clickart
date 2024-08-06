<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<div class="container-fluid" style="height: 10px;background-color:#424242;"></div>

<div class="container-fluid p-3" style="background-color: #f5f5f5;">
    <div class="row">
        <div class="col-md-3">
            <h3><i class="fa-solid fa-bag-shopping"></i> ClicKart</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control search-bar mr-sm-2" type="search" style="width: 70vh;" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary search-btn my-2 my-sm-0" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        <div class="col-md-3">
            <c:if test="${not empty userobj}">
            <a href="#" class="btn btn-success text-white"><i class="fa-solid fa-user"></i>  ${ userobj.name}</a>
            <a  data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger text-white"><i class="fa-solid fa-right-from-bracket text-white"></i> Logout</a>
            </c:if>
            <c:if test="${empty userobj}">
                <a href="../signin.jsp" class="btn btn-success text-white"><i class="fa-solid fa-right-to-bracket"></i> Sign-in</a>
                <a href="../signUp.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i> Sign-up</a>
            </c:if>
            
            
            
        </div>
        
                 
        
    </div>
    
</div> 
<!-- Logout button -->

<!-- Modal -->
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




<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="adminHome.jsp"><i class="fa-solid fa-house-user"></i> HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        
      
      <li class="nav-item">
        
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-bars"></i> Setting</button>
    </form>
  </div>
</nav>
                
              