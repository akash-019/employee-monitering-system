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
  <h2> ATTENDENCE SECTION</h2>
  <div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
  </div>
<div class="main1" ><div class="divinfo">Attendence Information</div><br><dr>

 
	<%

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			Statement st=con.createStatement();
						out.println("<center>");
						out.println("<table class='table1'>");
						ResultSet re=st.executeQuery("SELECT COUNTATTANDENCE(R_ID),Name FROM registration_table where `R_ID`='"+session.getAttribute("id")+"'");
						while(re.next())
						{
							out.println("<tr><th>Eployee Name :     "+re.getString("Name")+"</th><th>Total :   "+re.getString("COUNTATTANDENCE(R_ID)")+"</th><tr>");
						}
						out.println("</table></center>");
					
			ResultSet rs=st.executeQuery("SELECT `Date`, `IP_Address`, `Shift_Time`, `In_Time`, `Reason_Of_Late`, `Attendance` FROM `attendance_table` WHERE `R_ID`='"+session.getAttribute("id")+"'");
			out.println("<center>");
			out.println("<table class='table1'>");
			out.println("<tr><th>Date</th><th>IP_Address</th><th>Shift_Time</th><th>In_Time</th><th>Reason_Of_Late</th><th>Attendance</th></tr>");
			
			while(rs.next())
			{
			out.println("<tr><td>"+rs.getString("Date")+"</td><td>"+rs.getString("IP_Address")+"</td><td>"+rs.getString("Shift_Time")+"</td><td>"+rs.getString("In_Time")+"</td><td>"+rs.getString("Reason_Of_Late")+"</td><td>"+rs.getString("Attendance")+"</td></tr>");	
			
			}
			rs.close();
			
			out.println("</table></center>");
			
			
	
	%> 
	<br>

  </div>

			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>