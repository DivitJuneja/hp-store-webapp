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
            <h1 align="center">Inventory</h1>
        </div>
     </div>
            
        <!--tables start-->
        <div class="container my-3">
        <table class="table table-bordered table-hover">
  <thead>
    <tr>
      <th scope="col">Series</th>
      <th scope="col">Product id</th>
      <th scope="col">Model no.</th>
      <th scope="col">Serial no.</th>
      <th scope="col">Quantity</th>
      <th scope="col">Delete</th>
      <th scope="col">Add</th>
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
                        String qry = "select * from stock_table";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        ResultSet rst = pst.executeQuery();
                        
                        if(rst.next())
                        {
                           do
                           {
                               out.print("<tr>");
                               String a = rst.getString("Series");
                               out.print("<td>"+a+"</td>");
                               String e = rst.getString("id");
                               out.print("<td>"+e+"</td>");
                               String b = rst.getString("Model");
                               out.print("<td>"+b+"</td>");
                               String c = rst.getString("Serial");
                               out.print("<td>"+c+"</td>");
                               int d = rst.getInt("Qty");
                               out.print("<td id='qty_"+c+"'>" + d + "</td>");

                                if(d > 0)
                                {
                                    out.print("<td><button onclick=\"stockupdate('" + c + "', 'delete')\" style='background:#ccc; border:none; padding:5px 10px; border-radius:5px;'>Delete</button></td>");
                                }
                                else 
                                {
                                    out.print("<td><button disabled style='background:#ccc; border:none; padding:5px 10px; border-radius:5px; cursor:not-allowed;'>Delete</button></td>");
                                }

                            // ADD BUTTON
                               out.print("<td><button onclick=\"stockupdate('" + c + "', 'add')\" style='background:#ccc; border:none; padding:5px 10px; border-radius:5px;'>Add</button></td>");

                               out.print("</tr>");
                           }while(rst.next());
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
        
        <script>
            function stockupdate(serial,action)
            {
                fetch("update.jsp?Serial="+serial+"&action="+action)
                .then(response => response.json())
                .then(data => {
            if(data.status === "ok")
            {
                document.getElementById("qty_" + serial).innerText = data.qty;
            }
            else 
            {
                alert("Error updating stock");
            }
    })
            .catch(err => alert("Request failed"));
            }
            </script>
        </body>
</html>
<%@include file="footer.jsp" %>

