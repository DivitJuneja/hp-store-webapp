<%@ page import="java.sql.*" %>
<%
    String a = request.getParameter("id");
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
    try
    {
        String query = "delete * from outlet_table where store_id=?";
        PreparedStatement pst = conn.prepareStatement("query");
        pst.setString(1,a);
        if(pst.executeUpdate()>0)
        {
            response.sendRedirect("outletlist.jsp");
        }
        else
        {
            out.print("an error occured");
        }
        
    }
    catch(Exception e)
    {
        out.println("error : "+e.getMessage());
    }
}
catch(Exception e)
{
    out.println("error : "+e.getMessage());
}


%>