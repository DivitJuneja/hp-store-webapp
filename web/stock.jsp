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
        <div id="addstore" class="py-4">
  <div class="container py-lg-5 py-md-4 py-3">

    <div class="row justify-content-center">
      <div class="col-md-6">

        <div class="card shadow-lg border-0 rounded-4 p-4">

          <h2 class="text-center mb-4 fw-bold">Enter Stock Details</h2>

          <form method="post">

            <!-- Series -->
            <div class="mb-3">
              <label class="form-label fw-bold">Series</label>
              <select name="series" class="form-select" required>
                <option value="">Select Product</option>
                <option>Laptop</option>
                <option>Printers</option>
                <option>PC</option>
                <option>Accessories</option>
              </select>
            </div>

            <!-- Model No -->
            <div class="mb-3">
              <label class="form-label fw-bold">Product id</label>
              <input type="text" name="pid" class="form-control" required>
            </div>
            
            <div class="mb-3">
              <label class="form-label fw-bold">Model No.</label>
              <input type="text" name="modelno" class="form-control" required>
            </div>

            <!-- Serial No -->
            <div class="mb-3">
              <label class="form-label fw-bold">Serial No.</label>
              <input type="text" name="serialno" class="form-control" required>
            </div>

            <!-- Cost Price -->
            <div class="mb-4">
              <label class="form-label fw-bold">Cost Price</label>
              <input type="text" name="cost" class="form-control" required>
            </div>
            
            <!--Quantity-->
            <div class="mb-4">
              <label class="form-label fw-bold">Quantity</label>
              <input type="text" name="quantity" class="form-control" required>
            </div>

            <!-- Button -->
            <div class="d-grid">
              <button type="submit" name="register2" class="btn1 btn-outline-success bs mx-3">
                Add Item
              </button>
            </div>

          </form>
        </div>

      </div>
    </div>

  </div>
</div>

            <!--</div>-->
        </div>
    </div>
        <%
            if(request.getParameter("register2")!=null)
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        String qry = "insert into stock_table values(?,?,?,?,?,?)";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("series"));
                        pst.setString(2,request.getParameter("pid"));
                        pst.setString(3,request.getParameter("modelno"));
                        pst.setString(4,request.getParameter("serialno"));
                        pst.setString(5,request.getParameter("cost"));
                        pst.setString(6,request.getParameter("quantity"));
                        if(pst.executeUpdate()>0)
                        {
                            %>
                            <div style="text-align:center; font-size:1.4rem;font-weight:bold; margin:2px 0px">
                            Item added
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


