<%@include file="header.jsp" %>
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
        <% if(session.getAttribute("mail")!=null)
        {  
            String email = session.getAttribute("mail").toString();
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                    try
                    {
                        String qry = "select * from usertable1 where Email=?";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,email);
                        ResultSet rst = pst.executeQuery();
                        if(rst.next())
                        {
                            String name = rst.getString("Name");
                            String phone = rst.getString("Phone");
                            String password = rst.getString("Password");
                            String maskedPassword = password.replaceAll(".", "*");
                            %>
                            
                            <!--card start-->
                            <div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <div class="card shadow-lg rounded-4 border-0">
        <div class="card-body p-4">

          <h3 class="fw-bold mb-4 text-center">My Profile</h3>

          <div class="d-flex flex-column gap-3">

              <!-- Name -->
              <div class="p-3 rounded-3" style="background:#f8f9fa;">
                <label class="fw-bold text-secondary">Full Name</label>
                <div class="fs-5"><%= name %></div>
              </div>

              <!-- Email -->
              <div class="p-3 rounded-3" style="background:#f8f9fa;">
                <label class="fw-bold text-secondary">Email</label>
                <div class="fs-5"><%= email %></div>
              </div>

              <!-- Phone -->
              <div class="p-3 rounded-3" style="background:#f8f9fa;">
                <label class="fw-bold text-secondary">Phone</label>
                <div class="fs-5"><%= phone %></div>
              </div>
              
              <div class="p-3 rounded-3" style="background:#f8f9fa;">
                <label class="fw-bold text-secondary">Password</label>
                <div class="fs-5"><%= maskedPassword %></div>
              </div>

          </div>

          <!-- Optional Edit Button -->
          <div class="text-center mt-4">
            <a href="editprofile.jsp" class="btn btn1 bs btn-primary px-4">Edit Profile</a>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>

              <!--card closed-->
                        <%}
                    }
                    catch(Exception e)
                    {
                        out.println("An error occured due to "+e.getMessage());
                    }
                }
                catch(Exception e)
                {
                    out.println("Error occured due to "+e.getMessage());
                }
        } 
        else
        {
            response.sendRedirect("login.jsp");
        }
                        
            if(request.getParameter("phone")!=null)
            {%>
                 <script>   
                         alert("Data Updated Successfully");
                 </script>
            <%}

                        
                        %>
        </body>
</html>
<%@include file="footer.jsp" %>
