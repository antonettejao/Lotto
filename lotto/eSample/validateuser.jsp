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
<title>CyberLotto Login</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/rp-stylesheet.css" rel="stylesheet" type="text/css" />


	
	
</head>
<body onload="DrawCaptcha();">
<div id="container">
 <div id="header">
    <h1> <a href="index.jsp"><span>Cyber</span>Lotto</a></h1>
    <ul>
      <li><a href="index.jsp">home</a></li>
      <li><a href="about.jsp">about</a></li>
      <li><a href="help.jsp">help</a></li>
      <li><a href="register.jsp">register</a></li>
      <li><a href="login.jsp" class="on">login</a></li>
    </ul>
  </div>
  <div id="body">
    <div>
      <div>
        <div id="content">
          <div class="breadcrumb contact">
            <h2>For members only</h2>
          </div>
          <h3>Log In</h3>
		  <%
			
			String strEmailAdd = null;
			String strPassword = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				if (request.getParameter("emailAdd") != null) {
					strEmailAdd = player.getEmailAdd();
					
					if (request.getParameter("password") != null) { 
						strPassword = player.getPassword();				
					} else { %>	
						<jsp:include page="errorentry.jsp" flush="true"/>
					<%	System.out.println("error a");
					}	
				} else {	%>	
					<jsp:include page="errorentry.jsp" flush="true"/>
			<%	System.out.println("error b");					
				}		
				
				System.out.println("username entry: " + strEmailAdd);
				System.out.println("password entry: " + strPassword);
				
				
				
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
				
				//get result set for employee
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select emailAdd, password, accntType from register");
				int iCtr = 0;
						
				while (rs.next()) { 
					 
					//System.out.println(rs.getString("emailAdd"));
				
					String email = rs.getString("emailAdd");
					String loginPassword = rs.getString("password");
					String accntType = rs.getString("accntType");
				
					//System.out.println("email: " + email);          
					//System.out.println("password: " + loginPassword);
					System.out.println("type: " + accntType);
					
				  
														
					if (strEmailAdd.equals(email)) {
						if (strPassword.equals(loginPassword)) {
							iCtr++;
							
							if(iCtr == 1){
								if(accntType.equals("Player")){
									Cookie cookie = new Cookie ("email", email);
									cookie.setMaxAge(60*30);
									response.addCookie(cookie);
									session.setAttribute("email", email);
				java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				String audit = "insert into AuditTrail(emailAdd, date, activity) values (?,?,'Login')";
				PreparedStatement pstmtAudit = conn.prepareStatement(audit);
				pstmtAudit.setString(1, strEmailAdd);
				pstmtAudit.setDate(2, sqlDate);
				pstmtAudit.executeUpdate();
									response.sendRedirect("playerP.jsp");
							 }
								if(accntType.equals("admin")){
								Cookie cookie = new Cookie ("emailA", "success");
								cookie.setMaxAge(60*15);
								response.addCookie(cookie);
								
								java.sql.Date sqlDate1 = new java.sql.Date(new java.util.Date().getTime());
								String audit1 = "insert into AuditTrail(emailAdd, date, activity) values (?,?,'Login')";
								PreparedStatement pstmtAudit1 = conn.prepareStatement(audit1);
								pstmtAudit1.setString(1, strEmailAdd);
								pstmtAudit1.setDate(2, sqlDate1);
								pstmtAudit1.executeUpdate();
											
								response.sendRedirect("admin.jsp");
								
							
									}
							} else{ %>
							<jsp:include page="errorlogin.jsp" flush="true"/>
							<%}
							
							} else{ %>
							<jsp:include page="errorlogin.jsp" flush="true"/>
							<%}
						} else{
							%>
							<script language="javascript">
								answer = confirm("It appears you do not have any account. Register?")

									if (answer !=0)

									{

									location = "register.jsp"

									}else{
									location = "login.jsp"
									}
							
							</script>
						<% }	
					
					
					
					
					
					
				}
				System.out.println(iCtr);
			}  catch (IOException ioe) {
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
		} catch (Exception e) {				
  				System.out.println("Exception error 2");%>				
  				<jsp:include page="errorentry.jsp" flush="true"/>				
		<% }
%>		
          
        </div>
		
         <div id="sub">
        
          <h4>Draw Result</h4>
          <p>

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
