<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
<<link rel="stylesheet" href="style2.css" />
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
<div class="headder" > 
  <h2> PROJECT SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>  
</div>
<div class="main1" ><div class="divinfo">Event Information</div><br>
<br>
	
	<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT `Event_ID`, `Event_Date`, `Event_Time`, `Event_Title`, `Event_Details` FROM `event_table` WHERE 1");
	out.println("<center>");
	out.println("<table class='table1'>");
	out.println("<tr><th>Event_ID</th><th>Event_Date</th><th>Event_Time</th><th>Event_Title</th><th>Event_Details</th></tr>");
	
	while(rs.next())
	{
	out.println("<tr><td>"+rs.getInt("Event_ID")+"</td><td>"+rs.getString("Event_Date")+"</td><td>"+rs.getString("Event_Time")+"</td><td>"+rs.getString("Event_Title")+"</td><td>"+rs.getString("Event_Details")+"</td></tr>");	
	
	}
	out.println("</table></center>");
	
	%> 
	

	
  </div>	
			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>