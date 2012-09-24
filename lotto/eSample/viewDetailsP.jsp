<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
  <title>View Customer Detail</title>
  </head>
  <body>:) </h2>
    
    	<%
			 Connection conn = null;       				
			 
       try {								
        String name = application.getAttribute("name").toString();
				String password = application.getAttribute("password").toString();
				String server = application.getAttribute("server").toString();
				String typedriver = application.getAttribute("typedriver").toString();
				String dbName = application.getAttribute("dbName").toString();  
                       				  
        System.out.println("name: " + name);          
			  System.out.println("password: " + password);
        System.out.println("server: " + server);
        System.out.println("typedriver: " + typedriver);
        System.out.println("dbName: " + dbName);
            
        //db setup and connection
        Class.forName(typedriver);				      
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = DriverManager.getConnection(url, name, password);
       
       String query = "Select * from PlayerBet where emailAdd= ?";
		PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, request.getParameter("email"));
			ResultSet rs = pstmt.executeQuery();
			
		String queryw = "Select * from Winner where emailAdd= ?";
		PreparedStatement pstmtw = conn.prepareStatement(queryw);
			pstmtw.setString(1, request.getParameter("email"));
			ResultSet rsw = pstmtw.executeQuery();
			
		String querya = "Select * from AuditTrail where emailAdd= ?";
		PreparedStatement pstmta = conn.prepareStatement(querya);
			pstmta.setString(1, request.getParameter("email"));
			ResultSet rsa = pstmta.executeQuery();
		
		   int prize = 0;
		   while(rsw.next()){
		   prize += rsw.getInt("prize");
		   
		   }
        
        %>
			<h3>Player Bets</h3>
		  	  	<table>	
				<th>Date</th>
				<th>1st Pick</th>
				<th>2nd Pick</th>
				<th>3rd Pick</th>
				<th>4th Pick</th>
				<th>5th Pick</th>
				<th>6th Pick</th>
				<th>Bet Status</th>				
  		<%	while (rs.next()) { 
  			
        %>
  			   		
          
            <tr>
              
              <td style="border: 1px solid;"><%= rs.getDate("datePick")%></td>
              <td style="border: 1px solid;"><%= rs.getInt("firstPick")%></td>
              <td style="border: 1px solid;"><%= rs.getInt("secondPick")%></td>
              <td style="border: 1px solid;"><%= rs.getInt("thirdPick") %></td>
              <td style="border: 1px solid;"><%= rs.getInt("fourthPick") %></td>
			   <td style="border: 1px solid;"><%= rs.getInt("fifthPick") %></td>
              <td style="border: 1px solid;"><%= rs.getInt("sixthPick") %></td>
			  <td style="border: 1px solid;"><%= rs.getString("status") %></td>
            </tr>  
         
    <% }%> </table>
	Total Prize : <%=prize%>
	
	<h3>Player Trail</h3>
		  	  	<table>	
				<th>Date</th>
				<th>Activity</th>

	<%    		while(rsa.next()){		%>
			<tr>
              <td style="border: 1px solid;"><a href="viewDetails.jsp?email=<%=rs.getString("emailAdd")%>"><%= rs.getString("emailAdd")%></a></td>
              <td style="border: 1px solid;"><%= rs.getString("date")%></td>
              <td style="border: 1px solid;"><%= rs.getString("activity")%></td>
			</tr>

	<%} %> </table> <%
    	} catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
    	} catch (SQLException sqle) {
          System.out.println("SQLException occured: " + sqle.getMessage());  	
    	}	catch (Exception e) {				
  				System.out.println(e.getMessage());			  								
			}	finally {
			   if (conn!=null) {
			     conn.close();
         }
      }					
		%>		      
  </body>
</html>
