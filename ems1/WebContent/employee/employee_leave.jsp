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
  <h2> LEAVE SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>  
</div>
<div class="main1" ><div class="divinfo">Leave Application</div><br>
<br><form action="employee_leave_applies.jsp" method="post">
<center>
	<table>
	<h3>
		<tr><td>FromDate</td><td><input type="date" name="fdate" required="required"/></td></tr>
		<tr><td>ToDate</td><td><input type="date" name="tdate" required="required"/></td></tr>	
		<tr><td>Reason</td><td><input type="text" name="reason" required="required"/></td></tr>	
		<tr><td><button>Submit</button></td></tr>	
	</h3>
	</table></center><br>
</form>
<br><br>
	<div class="divinfo">Leaves</div><br>
	<% 	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT`From_Date`, `To_Date`, `Reason`,`Leave_state` FROM `leave_table` WHERE `Emp_ID`='"+session.getAttribute("id")+"'");
	out.println("<center>");
	out.println("<table class='table1'>");
	int i=1;
	out.println("<tr><th>NO</th><th>From_Date</th><th>To_Date</th><th>Reason</th><th>Leave_state</th></tr>");
	
	while(rs.next())
	{
	out.println("<tr><td>"+i+"</td><td>"+rs.getString("From_Date")+"</td><td>"+rs.getString("To_Date")+"</td><td>"+rs.getString("Reason")+"</td><td>"+rs.getString("Leave_state")+"</td></tr>");	
	i++;
	}
	out.println("</table></center>");
	
	%> 


  </div>	
		
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>