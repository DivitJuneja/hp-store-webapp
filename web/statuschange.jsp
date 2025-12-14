<%@page import="java.sql.*" %>
<%
            String id = request.getParameter("idd");
            String status = request.getParameter("stat");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        String qry = "update orders_table set status=? where orderid=? ";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,status);
                        pst.setString(2,id);
                         if (pst.executeUpdate() > 0)
                         {
                            out.print("{\"status\":\"ok\"}");
                         } 
                         else 
                         {
                            out.print("{\"status\":\"not ok\"}");
                         }
                    }
                    catch(SQLException ex)
                    {
                        out.print("{\"status\":\"error\"}");
                    }
                }
                catch(SQLException ex)
                {
                   out.print("{\"status\":\"error\"}");
                }
            
            %>
