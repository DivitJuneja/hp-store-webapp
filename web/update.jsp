<%@ page import="java.sql.*"%>
<% 
             try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/storefinal","root","");
                
                    try
                    {
                        int qty=0,b=0;
                        String c = request.getParameter("action");
                        if(c.equals("add"))
                        {
                            b=1;
                        }
                        else if(c.equals("delete"))
                        {
                            b=-1;
                        }
                        String query ="UPDATE stock_table SET Qty = Qty + ? WHERE Serial = ?";
                        PreparedStatement pst2 = conn.prepareStatement(query);
                        pst2.setInt(1,b);
                        pst2.setString(2,request.getParameter("Serial")); 
                        pst2.executeUpdate();
                        
                        
                        String qry = "select * from stock_table where Serial=?";
                        PreparedStatement pst = conn.prepareStatement(qry);
                        pst.setString(1,request.getParameter("Serial"));
                        ResultSet rst = pst.executeQuery();
                        
                        if(rst.next())
                        {
                        int newQty = rst.getInt("Qty");
                        out.print("{\"status\":\"ok\", \"qty\":"+newQty+"}");
                        } 
                        else {
                        out.print("{\"status\":\"error\"}");
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