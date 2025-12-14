<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
    String id = request.getParameter("id");
    String price = request.getParameter("price");

    int b = Integer.parseInt(price);
    int a = (18 * b) / 100;
    int c = a + b;

    Integer orderID = null;
%>

<html>
<body>

<div id="bill" class="py-4 mt-3">
  <div class="container mt-3 py-lg-5 py-md-4 py-3">

    <div class="row justify-content-center">
      <div class="col-md-6">

        <div class="card shadow-lg border-0 rounded-4 p-4">

          <h2 class="text-center mb-4 fw-bold">Order Summary</h2>

          <form method="post">

            <input type="hidden" name="price" value="<%= price %>">
            <input type="hidden" name="gst" value="<%= a %>">
            <input type="hidden" name="total" value="<%= c %>">

            <div class="mb-3">
              <label class="form-label fw-bold">Cost Price</label>
              <input class="form-control" type="text" value="Rs.<%=price%>" disabled>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">GST</label>
              <input class="form-control" type="text" value="Rs.<%=a%>" disabled>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Total Bill</label>
              <input class="form-control" type="text" value="Rs.<%=c%>" disabled>
            </div>

            <div class="mb-3">
              <label class="form-label fw-bold">Payment Mode</label>
              <select name="payment" class="form-select" required>
                <option value="">Select mode</option>
                <option>Cash</option>
                <option>UPI</option>
                <option>Card</option>
              </select>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Mail ID</label>
              <input type="email" name="mail" class="form-control" required>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Address</label>
              <textarea class="form-control" name="address" required></textarea>
            </div>

            <div class="d-grid">
              <button type="submit" name="placed" class="btn1 btn-outline-success mx-3 my-2">
                Place Order
              </button>
            </div>

          </form>

        </div>
      </div>
    </div>

  </div>
</div>

<%
if (request.getParameter("placed") != null) {

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost/storefinal", "root", "");

        String qry = "INSERT INTO orders_table(id, price, gst, total, mode, mail, address, status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = conn.prepareStatement(qry, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, id);
        pst.setString(2, request.getParameter("price"));
        pst.setString(3, request.getParameter("gst"));
        pst.setString(4, request.getParameter("total"));
        pst.setString(5, request.getParameter("payment"));
        pst.setString(6, request.getParameter("mail"));
        pst.setString(7, request.getParameter("address"));
        pst.setString(8, "Pending");

        if (pst.executeUpdate() > 0)
        {
            ResultSet rs = pst.getGeneratedKeys();
            if (rs.next()) {
                orderID = rs.getInt(1);
            }
 
        }

    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
}
%>

<% if (orderID != null) { %>

<div class="modal fade" id="orderModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Order Placed</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
        <p>Your order has been placed successfully!<br>
        Order ID: <span style="color:blue;"><%= orderID %></span><br>
        Use this ID to track your order.
        </p>
      </div>

      <div class="modal-footer">
        <a href="trackorder.jsp" class="btn btn-primary">Track Order</a>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<%@ include file="footer2.jsp" %>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var modal = new bootstrap.Modal(document.getElementById('orderModal'));
    modal.show();
});
</script>

<% } %>



</body>
</html>
