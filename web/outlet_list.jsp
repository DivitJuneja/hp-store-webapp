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
     <div>
        <div class="container py-4">  
            <h1 align="center">Outlet List</h1>
        </div>
     </div>
        <!--tables start-->
        <div class="container my-3">
        <table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th scope="col">Store name</th>
      <th scope="col">Phone no.</th>
      <th scope="col">Address</th>
      <th scope="col">GST no.</th>
      <th scope="col">Delete</th>
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
                        String qry = "select * from outlet_table";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        ResultSet rst = pst.executeQuery();
                        
                        if(rst.next())
                        {
                           do
                           {
                               String e= rst.getString("store_id");
                               out.print("<tr>");
                               String a = rst.getString("store_name");
                               out.print("<td>"+a+"</td>");
                               String b = rst.getString("Phone");
                               out.print("<td>"+b+"</td>");
                               String c = rst.getString("Address");
                               out.print("<td>"+c+"</td>");
                               String d = rst.getString("GST");
                               out.print("<td>"+d+"</td>");
                               out.print("<td><button onclick='delete_outlet.jsp?id="+e+"' style='background:#ccc; border:none; padding:5px 10px; border-radius:5px;'>Remove</button></td>");
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
        <!--tables end-->
      
        </body>
</html>
<%@include file="footer.jsp" %>


