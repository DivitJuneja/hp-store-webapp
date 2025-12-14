<%@include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<% String mail = session.getAttribute("mail").toString(); %>
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
        <% if(session.getAttribute("mail")!=null)
        {
            
             try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                    try
                    {
                        String qry = "select * from usertable1 where Email=?";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,mail);
                        ResultSet rst = pst.executeQuery();
                        if(rst.next())
                        {
                            String name = rst.getString("Name");
                            String phone = rst.getString("Phone");
                            String password = rst.getString("Password");
                            %>
        
        
<div class="py-4 mt-3">
  <div class="container mt-3 py-lg-5 py-md-4 py-3">

    <div class="row justify-content-center">
      <div class="col-md-6">

        <div class="card shadow-lg border-0 rounded-4 p-4">

          <h2 class="text-center mb-4 fw-bold">Your Details</h2>

          <form method="post">

            <div class="mb-3">
              <label class="form-label fw-bold">Name</label>
              <input class="form-control" type="text" name="name" value="<%=name%>">
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Phone</label>
              <input class="form-control" type="text" name="phone" value="<%=phone%>">
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Password</label>
              <input class="form-control" type="password" name="password" value="<%=password%>">
            </div>

           

            <div class="mb-4">
              <label class="form-label fw-bold">Mail ID</label>
              <input type="email" name="mail" class="form-control" value="<%=mail%>" disabled>
            </div>


            <div class="d-grid">
              <button type="submit" name="save" class="btn1 btn-outline-success mx-3 my-2">
                Save Changes
              </button>
            </div>
          </form>
            
        </div>
            
      </div>
    </div>
  </div>
</div>
            
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
        

        if(request.getParameter("save")!=null)
{
            String na = request.getParameter("name");
            String ph = request.getParameter("phone");
            String pass = request.getParameter("password");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                 try
                    {
                        String qry = "update usertable1 set Name=?,Phone=?,Password=? where Email=? ";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,na);
                        pst.setString(2,ph);
                        pst.setString(3,pass);
                        pst.setString(4,mail);
                         if (pst.executeUpdate() > 0)
                         {
                            response.sendRedirect("dashboard.jsp?phone="+ph);
                         } 
                         else 
                         {
                            out.print("Error Occured");
                         }
                    }
                    catch(SQLException ex)
                    {
                        out.print("Error Occured");
                    }
                }
                catch(SQLException ex)
                {
                   out.print("Error Occured");
                }
}
            %>
        
    </body>
</html>
<%@include file="footer.jsp" %>
