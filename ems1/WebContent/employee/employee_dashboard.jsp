<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>
<form action="" method="post">
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
<div class="headder" > <h2>WEL-COME</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>  </div>
<div class="main1"><div class="divinfo">Employee Dashboard</div><br><%out.println(session.getAttribute("id")); %>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from registration_table where R_ID='"+session.getAttribute("id")+"'");
	out.println("<center>");
	out.println("<table class='table1'>");
	out.println("<tr><th>Name</th></tr>");
	
	while(rs.next())
	{
	out.println("<tr><td>"+rs.getString("Name")+"</td></tr>");	
	
	}
	out.println("</table></center>");
	
	%> 



</div>

<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>

</form>
<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>