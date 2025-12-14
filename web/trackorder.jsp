<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<html>
<head>
<style>
.banner-img {
    height: 320px;
    object-fit: cover;
    filter: brightness(70%);
}
.card {
    border-radius: 15px;
}
</style>
</head>

<body>

<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/3.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption">
        <h2 class="fw-bold">Track Your Order</h2>
        <p>Get real-time updates on your purchase</p>
      </div>
    </div>
  </div>
</div>



<!-- TRACK FORM -->
<% if(request.getParameter("status") == null) { %>

<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-5">

      <div class="card shadow-lg p-4">
        <h3 class="text-center mb-4 fw-bold">Track Your Order</h3>

        <form method="post">
          <div class="mb-3">
            <label class="form-label fw-bold">Email ID</label>
            <input type="email" name="eid" class="form-control form-control-lg"
                   required placeholder="Enter your email">
          </div>

          <div class="mb-3">
            <label class="form-label fw-bold">Order ID</label>
            <input type="text" name="idd" class="form-control form-control-lg"
                   required placeholder="Enter your order ID">
          </div>

          <button class="btn btn1 bs btn-primary btn-lg w-100" name="status">
            Track Order
          </button>
        </form>

      </div>

    </div>
  </div>
</div>

<% } %>



<!-- ORDER RESULT SECTION  -->
<%
if(request.getParameter("status") != null) {

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost/storefinal","root",""
        );

        String qry = "select * from orders_table where orderid=? and mail=?";
        PreparedStatement pst = conn.prepareStatement(qry);
        pst.setString(1, request.getParameter("idd"));
        pst.setString(2, request.getParameter("eid"));
        ResultSet rst = pst.executeQuery();

        if(rst.next()) {

            String id = rst.getString("orderid");
            String price = rst.getString("total");
            String mode = rst.getString("mode");
            String address = rst.getString("address");
            String status = rst.getString("status");

           
%>

<!-- RESULT CARD -->
<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-8">

      <div class="card shadow-lg p-4">

        <h3 class="fw-bold text-center mb-4">Order Details</h3>

        <div class="row mb-3">
          <div class="col-6"><b>Order ID:</b></div>
          <div class="col-6 text-end"><%= id %></div>
        </div>

        <div class="row mb-3">
          <div class="col-6"><b>Grand Total:</b></div>
          <div class="col-6 text-end text-success fw-bold">Rs. <%= price %></div>
        </div>

        <div class="row mb-3">
          <div class="col-6"><b>Payment Mode:</b></div>
          <div class="col-6 text-end"><%= mode %></div>
        </div>

        <div class="row mb-3">
          <div class="col-6"><b>Address:</b></div>
          <div class="col-6 text-end"><%= address %></div>
        </div>

        <div class="row mb-3">
          <div class="col-6"><b>Status:</b></div>
          <div class="col-6 text-end">
            <span class="badge btn1 btn-outline-success bs fs-6 px-3 py-2">
              <%= status %>
            </span>
          </div>
        </div>

      </div>

    </div>
  </div>
</div>

<%
        } else {
%>

<!-- WRONG ORDER ID MESSAGE -->
<div class="container my-5">
  <div class="alert alert-danger text-center fs-5 rounded-3 shadow">
    ❌ No order found with that Email or Order ID.
  </div>
</div>

<%
        }
    } catch(Exception e) {
%>

<div class="container my-5">
  <div class="alert alert-danger text-center fs-5 rounded-3 shadow">
    An error occurred: <%= e.getMessage() %>
  </div>
</div>

<%
    }
}
%>

<%@ include file="footer.jsp" %>
</body>
</html>
