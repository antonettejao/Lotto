<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="player" class="player.getPlayer" scope="page"/>
<jsp:setProperty name="player" property="*"/>
<jsp:useBean id="bet" class="one.lottoBean" scope="page"/>
<jsp:setProperty name="bet" property="*"/>

<%
	//session.invalidate();
	
	
   String cookieNameA = "emailA";
   Cookie cookie2 [] = request.getCookies();
   Cookie myCookie2 = null;
   
   if (cookie2 != null){
	for(int i = 0; i< cookie2.length; i++){
	
	
		if(cookie2 [i].getName().equals(cookieNameA)){
			
			myCookie2 = cookie2[i]; 	
			
		} 
		
   
	}
   
   }
   
   if(myCookie2 == null){
		response.sendRedirect("index.jsp");
   }
   
	
	
%>

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
		
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		String dateSql = sqlDate.toString();
            
        //db setup and connection
        Class.forName(typedriver);				      
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = DriverManager.getConnection(url, name, password);
       
       					  
        String query = "select * from PlayerBet where status = ?";
        
        PreparedStatement preparedStatement = conn.prepareStatement(query);    
        
        //System.out.println("email parameter passed: " + request.getParameter("email"));   
        preparedStatement.setString(1, "Pending");
        
        ResultSet rs = preparedStatement.executeQuery();
			  int iCtr = 0;
		  	  			    %>
				

			<table class="cur">
				
<%							
  			while (rs.next()) { 
  			  iCtr++; 
          
        %>
  			   			      
           
            <tr>
            <td style="border: 1px solid;">Email: <%=rs.getString("emailAdd")%></td>
            <td style="border: 1px solid;">Date: <%= rs.getDate("datePick")%></td>
            <td style="border: 1px solid;">First Number: <%= rs.getInt("firstPick")%></td>
			<td style="border: 1px solid;">Second Number: <%= rs.getInt("secondPick")%></td>
			<td style="border: 1px solid;">Third Number: <%= rs.getInt("thirdPick")%></td>
			<td style="border: 1px solid;">Fourth Number: <%= rs.getInt("fourthPick")%></td>
			<td style="border: 1px solid;">Fifth Number: <%= rs.getInt("fifthPick")%></td>
			<td style="border: 1px solid;">Sixth Number: <%= rs.getInt("sixthPick")%></td>	  
                                             
            </tr>  
         
    <% } %>  </table><%    				
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
        <div id="sub">
        
          <h4>Draw Result</h4>
          <p>
		<%
			Connection conn1 = null;
			PreparedStatement pstmt1 = null;
			int checkctr1= 0;
				
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
				
				application.setAttribute("name", name);
				application.setAttribute("password", password);
				application.setAttribute("server", server);
				application.setAttribute("typedriver", typedriver);
				application.setAttribute("dbName", dbName);
					
				//db setup and connection
				Class.forName(typedriver);			
				  //String url = "jdbc:jtds:sqlserver://"+db.getServerName()+":"+db.getPortDB()+"//"+db.getDBName();
				  String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
				 
				conn1 = DriverManager.getConnection(url, name, password);
				
				java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				String dateSql = sqlDate.toString();
				
				java.sql.Date compDate = null;
				
				
				
				String query = "select * from WinningPick where status = ?";
				pstmt1 = conn1.prepareStatement(query);
				pstmt1.setString(1, "Current");
				ResultSet rs = pstmt1.executeQuery();%>
				<table><%
				while(rs.next()){
				%>
				
				
			
       <p>
		
		  <center>Date:<%= rs.getDate("dateWinPick")%></center>	
		 <center>
         <tr><td style="border: 1px solid;">1st:  <%= rs.getInt("firstWinPick")%></td>
		 <td style="border: 1px solid;">2nd:  <%= rs.getInt("secondWinPick")%></td></br>
			<td style="border: 1px solid;">3rd:  <%= rs.getInt("thirdWinPick")%></br></td> 	
			<td style="border: 1px solid;">4th:  <%= rs.getInt("fourthWinPick")%></br></td>
			<td style="border: 1px solid;">5th:  <%= rs.getInt("fifthWinPick")%></br></td> 
			<td style="border: 1px solid;">6th:  <%= rs.getInt("sixthWinPick")%></br></td>		
        </center></tr></br>
		
		</p>
       
			<%	
				}%></table><%
			}catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
			} catch (SQLException sqle) {
						System.out.println("SQLException occured: " + sqle.getMessage());  	
			}	catch (Exception e) {				
							System.out.println(e.getMessage());			  								
			}	finally {
				if (conn1!=null) {
					conn1.close();
							}
				}
				%>
		  </p>
          <h4>Jackpot</h4>
          <p style="font-family:arial;color:red;font-size:20px; text-decoration: blink"><strong>P100,000,000.00</strong></p>
      
          <h4>Widgets</h4>
          <p> <!-- hitwebcounter Code START -->

<center><strong>Number of Visitors</strong>
<!-- hitwebcounter Code START -->
<a href="http://www.hitwebcounter.com/internetcountercontact.php" target="_blank">
<img src="http://hitwebcounter.com/counter/counter.php?page=4535173&style=0009&nbdigits=6&type=page&initCount=0" title="gather your visitors info" Alt="gather your visitors info"   border="0" >
</a><br/>
<!-- hitwebcounter.com --><a href="http://www.hitwebcounter.com/" title="Visits Counter" 
target="_blank" style="font-family: Geneva, Arial, Helvetica, sans-serif; 
font-size: 12px; color: #B6ABAF; text-decoration: underline ;">
</a>    

<br/>
<strong>Date today</strong>
<br/><script type="text/javascript">
tday  =new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
tmonth=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function GetClock(){
d = new Date();
nday   = d.getDay();
nmonth = d.getMonth();
ndate  = d.getDate();
nyear = d.getYear();
nhour  = d.getHours();
nmin   = d.getMinutes();
nsec   = d.getSeconds();

if(nyear<1000) nyear=nyear+1900;

     if(nhour ==  0) {ap = " AM";nhour = 12;} 
else if(nhour <= 11) {ap = " AM";} 
else if(nhour == 12) {ap = " PM";} 
else if(nhour >= 13) {ap = " PM";nhour -= 12;}

if(nmin <= 9) {nmin = "0" +nmin;}
if(nsec <= 9) {nsec = "0" +nsec;}


document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+ap+"";
setTimeout("GetClock()", 1000);
}
window.onload=GetClock;
</script>
<div id="clockbox"></div>

</p></center>
        </div>
      </div>
    </div>
  </div>
  <div id="footer"> <span><a href="#header"><img src="img/top.gif" alt="top" width="29" height="30"/></a></span>
   <p>&copy; 2012 cyberlotto</p>
  </div>
</body>
</html>
