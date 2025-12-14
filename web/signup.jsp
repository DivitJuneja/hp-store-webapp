<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<html>
    <head>
    </head>
    <body>  
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption">
        <h2 class="fw-bold">Create Your Account Today</h2>
        <p>Track orders, save favorites, and enjoy a seamless shopping experience</p>
      </div>
    </div>
  </div>
</div>
<!--        carousel closed
        signup form started-->
    <div id="signup" class="py-2">
        <div class="container py-lg-5 py-md-3 py-2">  
            <h1 align="center">Sign Up - Become a Member</h1> 
            <!--<div class="row">-->
            <form method="post">
                <input class="in" type="text" placeholder="Your Name*" name="name" required="required">
                    <input class="in" type="tel" placeholder="Phone no.*" name="phoneno" required="required">
                    <input class="in" type="text" placeholder="Email*" name="email" required="required">
                    <input class="in" type="password" placeholder="Password*" name="password" required="required">
                    <input class="in" type="password" placeholder="Confirm Password*" name="confirmpassword" required="required">
                    <input class="in" type="submit" value="Sign Up" name="signup">
                </form>
            <!--</div>-->
        </div>
    </div>
        <!--signupform closed-->
        <%
          if(request.getParameter("signup")!=null)  
          {
           if(request.getParameter("password").equals(request.getParameter("confirmpassword")))
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                    try
                    {
                        String qry = "insert into usertable1 values(?,?,?,?)";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("name"));
                        pst.setString(2,request.getParameter("phoneno"));
                        pst.setString(3,request.getParameter("email"));
                        pst.setString(4,request.getParameter("password"));
                        if(pst.executeUpdate()>0)
                        {
                            %>
                            <div style="text-align:center; font-size:1.4rem;font-weight:bold; margin:5px 0px">
                            Record saved successfully
                            </div>
                            <%
                        }
                        else
                        {
                            out.println("an error occured");
                        }
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
                out.println("passwords do not match");
            }
          }






            %>
        <script src="jquery-3.7.1.js"></script>
        <script>
            //       form changes
    $(".in").click(function(){
    $(this).removeClass("in").addClass("out");
    
    });
            </script>
    </body>
</html>
<%@include file="footer.jsp" %>
