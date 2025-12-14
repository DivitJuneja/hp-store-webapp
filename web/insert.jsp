<%@page import="java.sql.*" %> 
<%
           
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        String qry = "insert into sales_table(Outlet,id,Model,Quantity,Sell,Mode)values(?,?,?,?,?,?)";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("outlet"));
                        pst.setString(2,request.getParameter("id"));
                        pst.setString(3,request.getParameter("model"));
                        pst.setString(4,request.getParameter("quantity"));
                        pst.setString(5,request.getParameter("sell"));
                        pst.setString(6,request.getParameter("payment"));
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
