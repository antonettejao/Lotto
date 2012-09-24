<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
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

<!DOCTYPE html>
<html>
 <head>

  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <meta name="generator" content="1.1.960.120"/>
  <title>PLAY</title>
  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="css/site_global.css?4075768122"/>
  <link rel="stylesheet" type="text/css" href="css/play.css?71272249"/>
  <!-- Other scripts -->
  <script type="text/javascript">
   document.documentElement.className = 'js';
</script>
   </head>
 <body>

  <div class="clearfix" id="page"><!-- column -->
   <div class="position_content" id="page_position_content">
    <div class="clearfix colelem" id="pu2956"><!-- group -->
     <div class="grpelem" id="u2956"><!-- image -->
      <img id="u2956_img" src="images/red%20blur%20sparkles.jpg" alt="" width="1226" height="1022"/>
     </div>
     <a class="anchor_item grpelem" id="untitled3"></a>
     <div class="rounded-corners grpelem" id="u3018"><!-- custom html -->
      <center><script type="text/javascript">
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
<div id="clockbox"></div></center>


<div id="clockbox" style="font:14pt Arial; color:#FF0000;"></div>

</div>
     <div class="grpelem" id="u3438"><!-- simple frame --></div>
     <ul class="MenuBar rounded-corners clearfix grpelem" id="menuu3656"><!-- row -->
      <li class="MenuItemContainer clearfix grpelem" id="u3708"><!-- vertical box -->
       <a class="nonblock nontext MenuItem MenuItemWithSubMenu rounded-corners clearfix colelem" id="u3711" href="players.jsp"><!-- horizontal box --><div class="MenuItemLabel NoWrap clearfix grpelem" id="u3712-4"><!-- content --><p>HOME</p></div></a>
      </li>
      <li class="MenuItemContainer clearfix grpelem" id="u3664"><!-- vertical box -->
       <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix colelem" id="u3667" href="about-us.jsp"><!-- horizontal box --><div class="MenuItemLabel NoWrap clearfix grpelem" id="u3670-4"><!-- content --><p>ABOUT US</p></div></a>
      </li>
      <li class="MenuItemContainer clearfix grpelem" id="u3657"><!-- vertical box -->
       <a class="nonblock nontext MenuItem MenuItemWithSubMenu MuseMenuActive clearfix colelem" id="u3660" href="play.jsp"><!-- horizontal box --><div class="MenuItemLabel NoWrap clearfix grpelem" id="u3661-4"><!-- content --><p>PLAY</p></div></a>
      </li>
      <li class="MenuItemContainer clearfix grpelem" id="u3671"><!-- vertical box -->
       <a class="nonblock nontext MenuItem MenuItemWithSubMenu clearfix colelem" id="u3674" href="help.jsp"><!-- horizontal box --><div class="MenuItemLabel NoWrap clearfix grpelem" id="u3677-4"><!-- content --><p>HELP</p></div></a>
      </li>
      <li class="MenuItemContainer clearfix grpelem" id="u3678"><!-- vertical box -->
       <a class="nonblock nontext MenuItem MenuItemWithSubMenu rounded-corners clearfix colelem" id="u3688" href="signout.jsp"><!-- horizontal box --><div class="MenuItemLabel NoWrap clearfix grpelem" id="u3689-4"><!-- content --><p>SIGNOUT</p></div></a>
      </li>
     </ul>
     <div class="grpelem" id="u3853"><!-- column -->
      <div class="_u3853 f3s_top clearfix">
       <div class="clearfix colelem" id="u3854-4"><!-- content -->
        <p>ADD BET</p>
       </div>
       <div class="clearfix colelem" id="u3855-4"><!-- content -->
        <p><span id="u3855">ADD BET</span></p>
       </div>
       <div class="clearfix colelem" id="u3857-4"><!-- content -->
        <p><%
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
				
			try {
				String strEmail = session.getAttribute("email").toString();
			
				
				int strFirstPick = Integer.parseInt(request.getParameter("pick1").trim());
				int strSecondPick = Integer.parseInt(request.getParameter("pick2"));
				int strThirdPick = Integer.parseInt(request.getParameter("pick3"));
				int strFourPick	= Integer.parseInt(request.getParameter("pick4"));
				int strFivePick = Integer.parseInt(request.getParameter("pick5"));
				int strSixPick = Integer.parseInt(request.getParameter("pick6"));
				
				System.out.println("Client Email " + strEmail);
				System.out.println("Client First Pick: " +strFirstPick);
				System.out.println("Client Second Pick: " + strSecondPick);
				System.out.println("Client Third Pick: " + strThirdPick);
				System.out.println("Client Fourth Pick: "+ strFourPick);
				System.out.println("Client Fifth Pick: "+ strFivePick);
				System.out.println("Client Sixth Pick: "+ strSixPick);
				
								
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
       
        String query = "insert into PlayerBet(emailAdd, datePick, firstPick, secondPick, thirdPick, fourthPick, fifthPick, sixthPick) values(?,?,?,?,?,?,?,?)";
        String audit = "insert into AuditTrail(emailAdd, date, activity) values (?,?,'Add Bet')";
		application.setAttribute("name", name);
		application.setAttribute("password", password);
		application.setAttribute("server", server);
		application.setAttribute("type", typedriver);
		application.setAttribute("dbName", dbName);
		
				java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				PreparedStatement pstmtAudit = conn.prepareStatement(audit);
				pstmtAudit.setString(1, strEmail);
				pstmtAudit.setDate(2, sqlDate);
				pstmtAudit.executeUpdate();
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, strEmail);
				pstmt.setDate(2, sqlDate);
				pstmt.setInt(3, strFirstPick); 
				pstmt.setInt(4, strSecondPick); 
				pstmt.setInt(5, strThirdPick);  
				pstmt.setInt(6, strFourPick); 
				pstmt.setInt(7, strFivePick); 
				pstmt.setInt(8, strSixPick); 				
				pstmt.executeUpdate();
		 %>
    <h1>Your BET was <%=strFirstPick%>, <%=strSecondPick%>, <%=strThirdPick%>, <%=strFourPick%>, <%=strFivePick%>, <%=strSixPick%><h1>
    </br><a href="players.jsp">Go Back</a></br>
	<p><a href="signout.jsp">Logout</a></p> <%

		
    	} catch (IOException ioe) {
    		  System.out.println("IOException occured: " + ioe.getMessage());
    	} catch (SQLException sqle) {
          System.out.println("SQLException occured: " + sqle.getMessage()); %>
				
				
				<a href="players.jsp">Go Back</a>
				<% 	
    	}	catch (Exception e) {				
  				System.out.println(e.getMessage());
				System.out.println("mali");
			}	finally {
			   if (conn!=null) {
			     conn.close();
         }
      }					
		%></p>
       </div>
      </div>
     </div>
     <div class="clearfix grpelem" id="u3861-4"><!-- content -->
      <p><span id="u3861"><a href="luckyPick.jsp">Don't have any number in mind? LUCKY PICK</a>
      <a href="viewPrize.jsp">View your prizes</a>
      </span></p>
     </div>
    </div>
    <div class="clearfix colelem" id="u3856-4"><!-- content -->
     <p>© 2012 OnLotto All Rights Reserved</p>
    </div>
   </div>
  </div>
  <div class="preload_images">
   <img class="preload" src="images/u2823-r-grad.png" alt=""/>
   <img class="preload" src="images/u2835-a-grad.png" alt=""/>
  </div>
  <!-- JS includes -->
  <script src="http://musecdn.businesscatalyst.com/scripts/1.1/jquery-1.7.min.js" type="text/javascript"></script>
  <script type="text/javascript">
   window.jQuery || document.write('\x3Cscript src="scripts/1.1/jquery-1.7.min.js" type="text/javascript">\x3C/script>');
</script>
  <script src="scripts/1.1/sprydomutils.js?4230755498" type="text/javascript"></script>
  <script src="scripts/1.1/museutils.js?3762396489" type="text/javascript"></script>
  <script src="scripts/1.1/jquery.musemenu.js?3987330193" type="text/javascript"></script>
  <!-- Other scripts -->
  <script type="text/javascript">
   Muse.Utils.addSelectorFn('body', Muse.Utils.transformMarkupToFixBrowserProblemsPreInit);/* body */
Muse.Utils.addSelectorFn('a.nonblock', Muse.Utils.addHyperlinkAnchor); /* a.nonblock */
Muse.Utils.addSelectorFn('.MenuBar', function(elem) { return $(elem).museMenu(); });/* unifiedNavBar */
Muse.Utils.addSelectorFn('body', Muse.Utils.showWidgetsWhenReady);/* body */
Muse.Utils.addSelectorFn('body', Muse.Utils.transformMarkupToFixBrowserProblems);/* body */

</script>
   </body>
</html>
