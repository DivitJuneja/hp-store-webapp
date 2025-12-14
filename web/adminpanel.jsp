<%@include file="adminheader.jsp" %>
<%@ page import="java.sql.*" %>
<html>
    <head>
    </head>
    <body>  
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="2000">
                <img src="images/3.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption">
                    <h2>Powering the Future of Performance</h2>
                    <p>Experience next-generation computing with power that adapts to you</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="images/r.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption">
                    <h2>Smarter Design Stronger Performance</h2>
                    <p>Innovative technology built to help you work, create, and connect better</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="images/2.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption">
                    <h2>Technology That Cares for the Planet</h2>
                    <p>Built with sustainability, designed for the modern world.</p>
                </div>
            </div>
        </div>
    </div>
        <!--carousel closed-->
     
        <!--cards start-->
        <%
        if(session.getAttribute("aname")!=null)
        { %>
        
       
        
        <div class="container py-5">
          <div class="row text-center">
            <div class="col-md-6 col-lg-4 mb-4">
            <a href="outlet.jsp"> 
                <div class="card border-0 shadow">
              <img src="images/outlet.jpg" class="card-img-top img-fluid" style="object-fit: contain; height: 250px;">
              </div>
            </a>
            </div>

            <div class="col-md-6 col-lg-4 mb-4">
              <a href="stock.jsp"> 
                <div class="card border-0 shadow">
                <img src="images/stock.jpg" class="card-img-top img-fluid" style="object-fit: contain; height: 250px;">
              </div>
              </a>
            </div>

            <div class="col-md-6 col-lg-4 mb-4 mx-auto">
              <a href="sales.jsp"> 
                <div class="card border-0 shadow">
                <img src="images/addsales.jpg" class="card-img-top img-fluid" style="object-fit: contain; height: 250px;">
              </div>
              </a>
            </div>
            
            
              
               <div class="col-md-6 col-lg-4 mb-4">
              <a href="stock_list.jsp"> 
                <div class="card border-0 shadow">
                <img src="images/log1.jpg" class="card-img-top img-fluid" style="object-fit: contain; height: 250px;">
              </div>
              </a>
            </div>
                  
              <div class="col-md-6 col-lg-4 mb-4">
              <a href="sales_list.jsp"> 
                <div class="card border-0 shadow">
                <img src="images/log2.jpg" class="card-img-top img-fluid" style="object-fit: contain; height: 250px;">
              </div>
              </a>
            </div>
                  
                  <div class="col-md-6 col-lg-4 mb-4">
              <a href="orders.jsp"> 
                <div class="card border-0 shadow">
                <img src="images/Orders.jpg" class="card-img-top img-fluid" style="object-fit: contain; height: 250px;">
              </div>
              </a>
            </div>
                  
               </div>
          </div>

        

        <!--cards end-->
        <%}
        else
            {
                response.sendRedirect("login.jsp");
            }%>
        
        </body>
</html>
<%@include file="footer.jsp" %>

