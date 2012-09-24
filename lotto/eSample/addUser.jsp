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
<title>CyberLotto Register</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="css/rp-stylesheet.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="/exam/includes/js/javascript.js"></script>
    <script language="JavaScript">      
        function validateForm() {
          var msg = "";
                		
      		if (!checkStrLength(trim(document.registrationForm.cust_email))) {
      			 msg += "Email\n";
      		} else {
      			if (!checkEmail(document.registrationForm.cust_email)) {
      				msg += "Invalid email.\n";
      			}
      		}
      		
      		if (!checkStrLength(trim(document.registrationForm.cust_password1))) msg += "Password\n";
      		if (!checkStrLength(trim(document.registrationForm.cust_password2))) msg += "Confirm Password\n";
      		      		
      		if (document.registrationForm.cust_password1.value != document.registrationForm.cust_password2.value) {
      			msg += "The passwords do not match.\n";			
      		}
      		
          if (!checkStrLength(trim(document.registrationForm.cust_firstName))) msg += "First Name\n";
      		if (!checkStrLength(trim(document.registrationForm.cust_lastName))) msg += "Last Name\n"; 
      		if (!checkLength(document.registrationForm.cust_address)) msg += "Address\n";
      		if (!checkLength(document.registrationForm.cust_city)) msg += "City\n";
      		
      	  checkNum(document.registrationForm.cust_phone);
      		
      		if (msg != "") {
      			alert("You Must Provide The Following Information:\n\n" + msg);
      			return false;
      		}	
      		
      		document.registrationForm.submit();
          
          function checkNum(phone) {
      		  formobj = document.registrationForm;
      			var phoneNumber = "";
      	
      			formobj.cust_phone.value = trim(formobj.cust_phone);
      			
      			phoneNumber = extractPhoneOrFaxNumber(phone);
      						
      			if (!checkLength(formobj.cust_phone)) {
      				msg += "Phone\n";	
      			} else {
      				if (!isANum(phoneNumber)) {
      					msg += "Phone must be numeric.\n";
      				}
      			} 			
      			return;
      	 } 				
       }
       
    </script>
	
	<script type="text/javascript"> 

function checkAge()
{

var today = new Date();
var d = document.getElementById("birthdate").value;
if (!/\d{4}\-\d{2}\-\d{2}/.test(d))
{ // check valid format
showMessage();
return false;
}

d = d.split("-");
var byr = parseInt(d[0]);
var nowyear = today.getFullYear();
if (byr >= nowyear || byr < 1900)
{ // check valid year
showMessage();
return false;
}
var bmth = parseInt(d[1],10)-1; // radix 10!
if (bmth <0 || bmth >11)
{ // check valid month 0-11
showMessage();
return false;
}
var bdy = parseInt(d[2],10); // radix 10!
var dim = daysInMonth(bmth+1,byr);
if (bdy <1 || bdy > dim)
{ // check valid date according to month
showMessage();
return false;
}

var age = nowyear - byr;
var nowmonth = today.getMonth();
var nowday = today.getDate();
var age_month = nowmonth - bmth;
var age_day = nowday - bdy;
if (age < 18 )
{
alert ("Under 18 years old is not allowed to register.");
}
else if (age == 18 && age_month <= 0 && age_day <0)
{
alert ("Under 18 years old is not allowed to register.");
}


}

function showMessage()
{
if (document.getElementById("birthdate").value != "")
{
alert ("Invalid date format or impossible year/month/day of birth - please re-enter as YYYY-MM-DD");
document.getElementById("birthdate").value = "";
document.getElementById("birthdate").focus();
}
}

function daysInMonth(month,year) { // months are 1-12
var dd = new Date(year, month, 0);
return dd.getDate();
}

</script>

<script type="text/javascript">
			//Created / Generates the captcha function    
    function DrawCaptcha()
    {
        var a = Math.ceil(Math.random() * 10)+ '';
        var b = Math.ceil(Math.random() * 10)+ '';       
        var c = Math.ceil(Math.random() * 10)+ '';  
        var d = Math.ceil(Math.random() * 10)+ '';  
        var e = Math.ceil(Math.random() * 10)+ '';  
        var f = Math.ceil(Math.random() * 10)+ '';  
        var g = Math.ceil(Math.random() * 10)+ '';  
        var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
        document.getElementById("txtCaptcha").value = code
    }

    // Validate the Entered input aganist the generated security code function   
    function ValidCaptcha(){
        var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
        var str2 = removeSpaces(document.getElementById('txtInput').value);
        if (str1 == str2){ return true;}        
        else{
		alert("false");
		return false;
		}
        
    }

    // Remove the spaces from the entered and generated code
    function removeSpaces(string)
    {
        return string.split(' ').join('');
    }
    
 
    </script>

</head>
<body onload="DrawCaptcha();">
<div id="container">
  <div id="header">
    <h1> <a href="index.jsp"><span>Cyber</span>Lotto</a></h1>
    <ul>
      <li><a href="index.jsp">home</a></li>
      <li><a href="about.jsp">about</a></li>
      <li><a href="help.jsp">help</a></li>
      <li><a href="register.jsp" class="on">register</a></li>
      <li><a href="login.jsp">login</a></li>
    </ul>
  </div>
  <div id="body">
    <div>
      <div>
        <div id="content">
          <div class="breadcrumb portfolio">
            <h2>Be a membership</h2>
          </div>
          <h3>REGISTER</h3>
          <p>
		  <%
			String strFirstName = null;
			String strLastName = null;
			String strEmail = null;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
				
			try {
				strEmail = player.getEmailAdd();
				strFirstName = player.getFirstName();
				strLastName = player.getLastName();
				String strPassword = player.getPassword();   
				String strAddress = player.getAddress();
				String strCity = player.getCity();
				//int iPhone = Integer.valueOf(request.getParameter("cust_phone"));	
				int iPhone = player.getPhone();	
				String strBday = player.getBirthdate();
				
				System.out.println("customer email: " + strEmail);
				System.out.println("customer first name: " + strFirstName);
				System.out.println("customer last name: " + strLastName);
				System.out.println("customer password: " + strPassword);
				System.out.println("customer address: " + strAddress);
				System.out.println("customer city address: " + strCity);
				System.out.println("customer phone: " + iPhone);
				System.out.println("customer phone: " + strBday);
								
        Properties property = null;

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
	      //String url = "jdbc:jtds:sqlserver://"+db.getServerName()+":"+db.getPortDB()+"//"+db.getDBName();
	      String url = "jdbc:jtds:sqlserver://"+server+":1433"+"//"+dbName;
	     
        conn = DriverManager.getConnection(url, name, password);
       
        String query = "insert into register(emailAdd, lastName, firstName, address, city, phone, birthday, password, accntType) values(?,?,?,?,?,?,?,?,?)";
        application.setAttribute("name", conn);
		
		
        pstmt = conn.prepareStatement(query); // create a statement
        pstmt.setString(1, strEmail); // set input parameter for customer email address
        pstmt.setString(2, strLastName); // set input parameter for customer last name
        pstmt.setString(3, strFirstName); // set input parameter for customer first name
        //pstmt.setString(4, strPassword); // set input parameter for customer password - NOTE: password would then encrypted or hashed : note to anthony
        pstmt.setString(4, strAddress); // set input parameter for customer address
        pstmt.setString(5, strCity); // set input parameter for customer city address
        pstmt.setInt(6, iPhone); // set input parameter for customer phone number
		pstmt.setString(7, strBday);
		pstmt.setString(8, strPassword);
		pstmt.setString(9, "Player");
        pstmt.executeUpdate(); // execute insert statement
		 %>
    <h1><%=strFirstName%>&nbsp;<%=strLastName%> succefully registered in the game.<h1>
	
	<a href="login.jsp">Go Back</a>
    <%

		
    	} catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
    	} catch (SQLException sqle) {
          System.out.println("SQLException occured: " + sqle.getMessage()); %>
				<h1><%=strEmail%> already registered in the game.<h1>
				
				//<a href="register.jsp">Go Back</a>
				<% 	
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
