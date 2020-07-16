<%@page import="java.util.Date"%>

<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Department operation result</title>
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>
<form action="" method="post">
<ul>
   <li><a href="#home" style="text-align:center"><img class="img1" src="emp.PNG" /><br>employee name</a></li>
  <li><a class="active" href="admin_dashboard.jsp">Dashboard</a></li>
  
  <li><a href="client_profile.jsp">Profile</a></li>
</ul>
<div class="headder" > <h2>PROFILE SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
</div>
<div class="main1"><div class="divinfo">Profile operation result</div> <br>

<%
if(session.getAttribute("cvalid")!=null)
{
		String  cname=null,cemail=null,cpass=null,cmobile=null;
		String cbdate=null;
		
		String name=null,email=null,pass=null;
		String mobile=null;
		name=request.getParameter("name");
		email=request.getParameter("email");
		pass=request.getParameter("pass");
		mobile=request.getParameter("mobile");
	
		
	try
	{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `Client_Name`, `Email_ID`, `Password`, `Mobile_Number` FROM `client_details_table` WHERE  `Client_ID`='"+session.getAttribute("id")+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	int i=0;
	
	while(re.next())
	{	 cname=re.getString("Client_Name");
		 cemail=re.getString("Email_ID");
		 cpass=re.getString("Password");
		 cmobile=re.getString("Mobile_Number");
		
		
	}	
				if(!name.equalsIgnoreCase(cname))
				{	
					st.executeUpdate("UPDATE `client_details_table` SET `Client_Name`='"+name+"' where `Client_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!email.equalsIgnoreCase(cemail))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Email_ID`='"+email+"' where `Client_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!pass.equalsIgnoreCase(cpass))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Password`='"+pass+"' where `Client_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!mobile.equalsIgnoreCase(cmobile))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Mobile_Number`='"+mobile+"' where `Client_Id`='"+session.getAttribute("id")+"'");i++;
				}
				
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
			
		}
		catch(Exception e)
		{
			out.println(e);
		}

session.removeAttribute("cvalid");

}

%><a href="client_profile.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>
<%response.sendRedirect("http://localhost:8080/ems1/client/client_profile.jsp"); %>

<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>