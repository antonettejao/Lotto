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
	
	
   String cookieNameA = "email";
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
		response.sendRedirect("login.jsp");
   }
   
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<style type="text/css">
table {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 18px;
	line-height: normal;
	color: #000;
	text-align: center;
	border-top-color: #F00;
	border-right-color: #F00;
	border-bottom-color: #F00;
	border-left-color: #F00;
}
.tableHead {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 18px;
	font-weight: bolder;
}
</style>

<head>
<title>CyberLotto Play</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/rp-stylesheet.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

/***********************************************
* Limit number of checked checkboxes script- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

function checkboxlimit(checkgroup, limit){
	var checkgroup=checkgroup
	var limit=limit
	for (var i=0; i<checkgroup.length; i++){
		checkgroup[i].onclick=function(){
		var checkedcount=0
		for (var i=0; i<checkgroup.length; i++)
			checkedcount+=(checkgroup[i].checked)? 1 : 0
		if (checkedcount>limit){
			alert("You can only select a maximum/minimum of "+limit+" numbers.")
			this.checked=false
			}
		if (checkedcount<limit){
			alert("choose more!")
			
			
			}
		}
	}
}

</script>

</head>
<body>
<div id="container">
  <div id="header">
    <h1> <a href="playerP.jsp"><span>Cyber</span>Lotto</a></h1>
    
	<ul>
      <li><a href="playerP.jsp">home</a></li>
      <li><a href="aboutP.jsp">about</a></li>
      <li><a href="helpP.jsp">help</a></li>
      <li><a href="play.jsp" class="on">play</a></li>
      <li><a href="logoutP.jsp">logout</a></li>
    </ul>
  </div>
  <div id="body">
    <div>
      <div>
        <div id="content">
          <div class="breadcrumb portfolio">
            <h2>Play 6/49</h2>
          </div>
		<p>
		
		<center>
<p class="tableHead">Select your 6 Numbers below:</p>

<form id="world" name="world" method="post" action="addBet.jsp">
<table border="5">
<tr>
<td><input type="checkbox" name="number" value="1"/> 
  01<br /></td>
<td><input type="checkbox" name="number" value="2" /> 
  02<br /></td>
<td><input type="checkbox" name="number" value="3" /> 
  03<br /></td>
<td><input type="checkbox" name="number" value="4" /> 
  04<br /></td></tr>

<tr>
<td><input type="checkbox" name="number" value="5" /> 
  05<br /></td>
<td><input type="checkbox" name="number" value="6" /> 
  06<br /></td>
<td><input type="checkbox" name="number" value="7" /> 
  07<br /></td>
<td><input type="checkbox" name="number" value="8" /> 
  08<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="9" /> 
  09<br /></td>
<td><input type="checkbox" name="number" value="10" /> 10<br /></td>
<td><input type="checkbox" name="number" value="11" /> 11<br /></td>
<td><input type="checkbox" name="number" value="12" /> 12<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="13" /> 13<br /></td>
<td><input type="checkbox" name="number" value="14" /> 14<br /></td>
<td><input type="checkbox" name="number" value="15" /> 15<br /></td>
<td><input type="checkbox" name="number" value="16" /> 16<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="17" /> 17<br /></td>
<td><input type="checkbox" name="number" value="18" /> 18<br /></td>
<td><input type="checkbox" name="number" value="19" /> 19<br /></td>
<td><input type="checkbox" name="number" value="20" /> 20<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="21" /> 21<br /></td>
<td><input type="checkbox" name="number" value="22" /> 22<br /></td>
<td><input type="checkbox" name="number" value="23" /> 23<br /></td>
<td><input type="checkbox" name="number" value="24" /> 24<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="25" /> 25<br /></td>
<td><input type="checkbox" name="number" value="26" /> 26<br /></td>
<td><input type="checkbox" name="number" value="27" /> 27<br /></td>
<td><input type="checkbox" name="number" value="28" /> 28<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="29" /> 29<br /></td>
<td><input type="checkbox" name="number" value="30" /> 30<br /></td>
<td><input type="checkbox" name="number" value="31" /> 31<br /></td>
<td><input type="checkbox" name="number" value="32" /> 32<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="33" /> 33<br /></td>
<td><input type="checkbox" name="number" value="34" /> 34<br /></td>
<td><input type="checkbox" name="number" value="35" /> 35<br /></td>
<td><input type="checkbox" name="number" value="36" /> 36<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="37" /> 37<br /></td>
<td><input type="checkbox" name="number" value="38" /> 38<br /></td>
<td><input type="checkbox" name="number" value="39" /> 39<br /></td>
<td><input type="checkbox" name="number" value="40" /> 40<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="41" /> 41<br /></td>
<td><input type="checkbox" name="number" value="42" /> 42<br /></td>
<td><input type="checkbox" name="number" value="43" /> 43<br /></td>
<td><input type="checkbox" name="number" value="44" /> 44<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="45" /> 45<br /></td>
<td><input type="checkbox" name="number" value="46" /> 46<br /></td>
<td><input type="checkbox" name="number" value="47" /> 47<br /></td>
<td><input type="checkbox" name="number" value="48" /> 48<br /></td>
</tr>

<tr>
<td><input type="checkbox" name="number" value="49" /> 49<br /></td>
</tr>
</table>


<script type="text/javascript">

//Syntax: checkboxlimit(checkbox_reference, limit)
checkboxlimit(document.forms.world.number, 6)

</script>


<input type="submit" value="Submit" name="B1">








</form>





</center>
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
				%></p>
          <h4>Jackpot</h4>
          <p style="font-family:arial;color:red;font-size:20px;text-decoration: blink"><strong>P100,000,000.00</strong></p>
      
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
