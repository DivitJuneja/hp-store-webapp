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
        <div id="addstore" class="py-2">
        <div class="container py-lg-5 py-md-3 py-2">  
            <h1 align="center">Enter Store Details</h1> 
            <!--<div class="row">-->
            <form method="post">
                    <input class="in" type="text" placeholder="Store Name*" name="name" required="required">
                    <input class="in" type="tel" placeholder="Registered Phoneno.*" name="phoneno" required="required">
                    <input class="in" type="email" placeholder="Registered mail*" name="mail" required="required">
                    <textarea class="in" placeholder="Address*" name="address" required="required"></textarea>
                    <input class="in" type="text" placeholder="GST Number*" name="gst" required="required">
                    <input class="in" type="submit" value="Register" name="register" >
                </form>
            <!--</div>-->
        </div>
    </div>
        <%
            if(request.getParameter("register")!=null)
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        String qry = "insert into outlet_table(store_name,Phone,Mail,Address,GST) values(?,?,?,?,?)";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("name"));
                        pst.setString(2,request.getParameter("phoneno"));
                        pst.setString(3,request.getParameter("mail"));
                        pst.setString(4,request.getParameter("address"));
                        pst.setString(5,request.getParameter("gst"));
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
            }
            %>
        </body>
</html>
<%@include file="footer.jsp" %>

