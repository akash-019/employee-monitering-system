<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
 
<link rel="stylesheet" href="style2.css" />

</head>
<body>
<% String p=null;
int i=0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection aucon=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
Statement aust=aucon.createStatement();
ResultSet aurs=aust.executeQuery("SELECT `Admin_Password` FROM `admin_login` WHERE `Admin_Id`='"+session.getAttribute("id")+"'");
while(aurs.next())
{	
	p=aurs.getString("Admin_Password");
}
String sessionp=(String)session.getAttribute("password");
out.println(sessionp+p);
if(p!=null && sessionp!=null)
{
if(p.compareTo(sessionp)==0)
{
	i=1;
}
}
else
{
	i=0;
}
%>
<%if(session.getAttribute("id")!=null && i==1){ %>

<ul>
    <li><a href="admin_dashboard.jsp" style="text-align:center"><img class="img1" src="emp.PNG" /><br>employee name</a></li>
  <li><a class="active" href="admin_dashboard.jsp">Dashboard</a></li>
  <li><a href="admin_department.jsp">Department</a></li>
  <li><a href="admin_project.jsp">Project</a></li>
  <li><a href="admin_employees.jsp">Employee</a> </li>
  <li><a href="admin_client.jsp">Client</a></li>
  <li><a href="admin_task.jsp">Task</a></li>
  <li><a href="admin_event.jsp">Event</a></li>
  <li><a href="admin_profile.jsp">Profile</a></li>
  <li><a href="admin_attendence.jsp">Attendence</a></li>
   <li><a href="admin_leave.jsp">Leave Applications</a></li>
    <li><a href="admin_employee_report.jsp">Employee report</a></li>
</ul>
<div class="headder" > 
  <h2> CLIENT SECTION</h2>
  <div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
  </div>
<form action="admin_client_collect.jsp" method="post">
<div class="main1" ><div class="divinfo">Client Information</div><br>
  <h3>Enter Client id to Perform Modify and Remove operation </h3>
	<br>
	<input type="number" name="C_ID">
	<br>
	<br>
	<center>
	<table>
	<tr><td><input type="radio" name="operation" value="New"></td><td>New</td></tr>
	<tr><td><input type="radio" name="operation" value="Modify"></td><td>Modify</td></tr>
	<tr><td><input type="radio" name="operation" value="Remove"></td><td>Remove</td></tr>
	</table></center>	<br><br>
	<button name="Submit" value="Submit"> Submit </button><br><br>
	<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from client_details_table");
	out.println("<center>");
	out.println("<table class='table1'>");
	out.println("<tr><th>Client_ID</th><th>Client_Name</th><th>	Email_ID</th><th>Password</th><th>Mobile_Number</th><th>Client_Project_Name</th></tr>");
	
	while(rs.next())
	{
	out.println("<tr><td>"+rs.getInt("Client_ID")+"</td><td>"+rs.getString("Client_Name")+"</td><td>"+rs.getString("Email_ID")+"</td><td>"+rs.getString("Password")+"</td><td>"+rs.getString("Mobile_Number")+"</td><td>"+rs.getString("Client_Project_Name")+"</td></tr>");	
	
	}
	out.println("</table></center>");
	
	%> 
	<br>
	
  </div>
</form>	
			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>