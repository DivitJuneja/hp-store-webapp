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
        <div>
        <div class="container py-4">  
            <h1 align="center">Orders History</h1>
        </div>
     </div>
        <!--tables start-->
        <div class="container my-3">
        <table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Product ID</th>
      <th scope="col">Taxable</th>
      <th scope="col">Total</th>
      <th scope="col">Address</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
       
      <%
      try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        String qry = "select * from orders_table where mail=?";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,mail);
                        ResultSet rst = pst.executeQuery();
                        if(rst.next())
                        {
                           do
                           {
                               out.print("<tr>");
                               int e = rst.getInt("orderid");
                               out.print("<td>"+e+"</td>");
                               String a = rst.getString("Id");
                               out.print("<td>"+a+"</td>");
                               String b = rst.getString("price");
                               out.print("<td>Rs."+b+"</td>");
                               String c = rst.getString("total");
                               out.print("<td>Rs."+c+"</td>");
                               String d = rst.getString("address");
                               out.print("<td>"+d+"</td>");
                               String currentStatus = rst.getString("status");
                               out.print("<td>"+currentStatus+"</td>");
                               out.print("</tr>");
                            }while(rst.next());
                        }
                        else
                        {
                            out.println("error occured");
                        }
                    }
                    catch(SQLException ex)
                    {
                        out.println("an error occured"+ex.getMessage());
                    }
                }
                catch(SQLException ex)
                {
                    out.println("an error occured"+ex.getMessage());
                }
                            %>
  </tbody>
</table>
            </div>
        <%@include file="footer.jsp" %><!--tables end-->
