<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="player" class="player.getPlayer" scope="page"/>
<jsp:setProperty name="player" property="*"/>
<jsp:useBean id="bet" class="one.lottoBean" scope="page"/>
<jsp:setProperty name="bet" property="*"/>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>CyberLotto Players</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/rp-stylesheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
  <div id="header">
     <h1> <a href="admin.jsp"><span>Cyber</span>Lotto</a></h1>
    <ul>
      <li><a href="admin.jsp">home</a></li>
      <li><a href="aboutA.jsp">about</a></li>
      <li><a href="draw.jsp">draw</a></li>
      <li><a href="playerA.jsp" class="on">players</a></li>
      <li><a href="logoutA.jsp">logout</a></li>
    </ul>
  </div>
  <div id="body">
    <div>
      <div>
        <div id="content">
          <div class="breadcrumb portfolio">
            <h2>Players for the Draw</h2>
          </div>
		  <p>
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
		  </p>
        </div>
       
      </div>
    </div>
  </div>
  
  </div>
</body>
</html>
