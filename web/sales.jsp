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

          <h2 class="text-center mb-4 fw-bold">Add Sale</h2>

          <form method="post">

            <!-- Series -->
            <div class="mb-3">
              <label class="form-label fw-bold">Outlet</label>
              <select name="outlet" class="form-select" required>
                  <option value="">Select Outlet</option>
                <% 
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");

                        try
                        {
                            String query = "select * from outlet_table";
                            PreparedStatement pst = conn.prepareStatement(query);
                            ResultSet rst = pst.executeQuery();
                            while(rst.next())
                            {
                                String a = rst.getString("store_id");
                                String b = rst.getString("store_name");
                                out.print("<option>"+a+"."+b+"</option>");
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
              </select>
            </div>

              <div class="mb-3">
              <label class="form-label fw-bold">Product id</label>
              <input type="text" name="pid" class="form-control" required>
            </div>
              
            <!-- Model No -->
            <div class="mb-3">
              <label class="form-label fw-bold">Model No.</label>
              <input type="text" name="modelno" class="form-control" required>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Quantity</label>
              <input type="text" name="quantity" class="form-control" required>
            </div>
            
            <!-- Selling Price -->
            <div class="mb-4">
              <label class="form-label fw-bold">Selling Price</label>
              <input type="text" name="sell" class="form-control" required>
            </div>
            
            <!-- Serial No -->
            <div class="mb-3">
              <label class="form-label fw-bold">Payment Mode</label>
              <select name="payment" class="form-select" required>
                  <option value="">Select mode</option>
                  <option>Cash</option>
                  <option>UPI</option>
                  <option>Card</option>
              </select>
            </div>

            
            
            <!--Quantity-->
            

            <!-- Button -->
            <div class="d-grid">
                
              <button onclick="updatestock()" type="button" name="sold" class="btn1 btn-outline-success bs mx-3 my-2">
                Sell Item
              </button>
            </div>

          </form>
        </div>

      </div>
    </div>

  </div>
</div>

            <!--</div>-->
        
            
 <%@include file="footer.jsp" %>           
            <script>
    function updatestock() 
    {
        let outlet  = document.getElementsByName("outlet")[0].value;
        let pid     = document.getElementsByName("pid")[0].value;
        let model   = document.getElementsByName("modelno")[0].value;
        let qty     = document.getElementsByName("quantity")[0].value;
        let sell    = document.getElementsByName("sell")[0].value;
        let payment = document.getElementsByName("payment")[0].value;
        
        fetch("update2.jsp?quantity="+qty+"&id="+pid)
       .then(res => res.json())
        .then(data => {

            if (data.status === "ok") 
            {

                fetch("insert.jsp?quantity=" + qty +
                      "&id=" + pid +
                      "&model=" + model +
                      "&outlet=" + outlet +
                      "&sell=" + sell +
                      "&payment=" + payment)

                .then(res => res.json())
                .then(data2 => {

                    if (data2.status === "ok") {
                        alert("Sale added successfully!");
                    } else {
                        alert("Sale failed!");
                    }

                });

            }
            else if (data.status === "insufficient_stock")
            {
                alert("Insufficient stock!");
            } else 
            {
                alert("Error updating stock!");
            }
             });
}
</script>

        </body>
</html>



