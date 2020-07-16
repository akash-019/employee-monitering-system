<%@page import="java.util.Date"%>

<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>

 
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>

<ul>
  <li><a href="employee_dashboard.jsp" style="text-align:center"><img class="img1" src="emp.PNG" /><br>employee name</a></li>
  <li><a class="active" href="employee_dashboard.jsp">Dashboard</a></li>
  <li><a href="employee_teamleader.jsp">Teamleader</a></li>
  <li><a href="employee_task.jsp">Task</a></li>
  <li><a href="employee_event.jsp">Event</a></li>
  <li><a href="employee_profile.jsp">Profile</a></li>
  <li><a href="employee_attendence.jsp">Attendence</a></li>
   <li><a href="employee_leave.jsp">Leave</a></li>
</ul>
<div class="headder" > <h2>PROFILE SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div></div>
<form action="" method="post">
<div class="main1">Profile operation result <br>

<%
if(session.getAttribute("valid")!=null)
{
		String  cname=null,cemail=null,cpass=null,cmobile=null;
		String cbdate=null,caddress=null;
		
		String name=null,email=null,pass=null;
		String bdate=null;
		String mobile=null,address=null;
		name=request.getParameter("name");
		email=request.getParameter("email");
		pass=request.getParameter("pass");
		mobile=request.getParameter("mobile");
		bdate=request.getParameter("bdate");
		address=request.getParameter("address");
		
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="SELECT `Name`, `Email_ID`, `Password`, `Birthday`, `Mobile_No`, `Address` FROM `registration_table` WHERE `R_Id`='"+session.getAttribute("id")+"'" ;
		Statement st=con.createStatement();
		ResultSet re=st.executeQuery(query);
		int i=0;
		
		
		while(re.next())
		{	 cname=re.getString("Name");
			 cemail=re.getString("Email_ID");
			 cpass=re.getString("Password");
			 cbdate=re.getString("Birthday");
			 cmobile=re.getString("Mobile_No");
			 caddress=re.getString("Address");
			 							
		}
		
		if(!name.equalsIgnoreCase(cname))
				{	
					st.executeUpdate("UPDATE `registration_table` SET `Name`='"+name+"' where `R_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!email.equalsIgnoreCase(cemail))
				{
					st.executeUpdate("UPDATE `registration_table` SET `Email_ID`='"+email+"' where `R_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!pass.equalsIgnoreCase(cpass))
				{
					st.executeUpdate("UPDATE `registration_table` SET `Password`='"+pass+"' where `R_ID`='"+session.getAttribute("id")+"'");i++;
				}
				if(!bdate.equalsIgnoreCase(cbdate))
				{
					st.executeUpdate("UPDATE `registration_table` SET `Birthday`='"+bdate+"' where `R_ID`='"+session.getAttribute("id")+"'");i++;
				}
				if(!mobile.equalsIgnoreCase(cmobile))
				{
					st.executeUpdate("UPDATE `registration_table` SET `Mobile_No`='"+mobile+"' where `R_ID`='"+session.getAttribute("id")+"'");i++;
				}
				if(!address.equalsIgnoreCase(caddress))
				{
					st.executeUpdate("UPDATE `registration_table` SET `Address`='"+address+"' where `R_ID`='"+session.getAttribute("id")+"'");i++;
				}
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
			
		}
		catch(Exception e)
		{
			out.println(e);
		}

session.removeAttribute("valid");

}

%><a href="employee_profile.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>

<%response.sendRedirect("http://localhost:8080/ems1/employee/employee_profile.jsp"); %>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>