<%@include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<html>
    <head>
    </head>
    <body>  
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption">
        <h2 class="fw-bold">Your Account, Your Dashboard</h2>
        <p>Manage your orders, preferences, and profile securely</p>
      </div>
    </div>
  </div>
</div>
        <!--carousel closed-->
    <div id="signup" class="py-2">
        <div class="container py-lg-5 py-md-3 py-2">  
            <h1 align="center">Login - Welcome Back</h1> 
            <!--<div class="row">-->
            <form method="post">
                    <input class="in" type="text" placeholder="Email Id*" name="loginname" required="required">
                    <input class="in" type="password" placeholder="Password*" name="checkpassword" required="required">
                    <input class="in" type="submit" value="Login" name="loginbtn">
                </form>
            <!--</div>-->
        </div>
    </div>
    <%
        if(request.getParameter("loginbtn")!=null)  
          {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                    try
                    {
                        String qry = "select * from usertable1 where Email=? and Password=?";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("loginname"));
                        pst.setString(2,request.getParameter("checkpassword"));
                        ResultSet rst = pst.executeQuery();
                        
                        String qry2 = "select * from admintable where Username=? and Password=?";
                        PreparedStatement pst2 = conn.prepareStatement(qry2);
                        pst2.setString(1,request.getParameter("loginname"));
                        pst2.setString(2,request.getParameter("checkpassword"));
                        ResultSet rst2 = pst2.executeQuery();
                        if(rst.next())
                        {
                            response.sendRedirect("index.jsp");
                            session.setAttribute("mail",rst.getString("Email"));
                            
                        }
                        else if(rst2.next())
                        {
                            response.sendRedirect("adminpanel.jsp");
                            session.setAttribute("aname",rst2.getString("Username"));
                        }
                        else
                        {
                         %>
                            <div style="text-align:center; font-size:1.4rem;font-weight:bold; margin:5px 0px">
                            Wrong Username/Password
                            </div>
                            <%
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
