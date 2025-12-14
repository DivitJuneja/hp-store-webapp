<%@page import="java.sql.*" %>
<%
            
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        String qry = "update stock_table set Qty=Qty-? where id=? and Qty>=?";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("quantity"));
                        pst.setString(2,request.getParameter("id"));
                        pst.setString(3,request.getParameter("quantity"));
                         if (pst.executeUpdate() > 0)
                         {
                            out.print("{\"status\":\"ok\"}");
                         } 
                         else 
                         {
                            out.print("{\"status\":\"insufficient_stock\"}");
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