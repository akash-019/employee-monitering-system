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
<div class="headder" > <h2>EMPLOYEES SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
</div>
<form action="" method="post">
<div class="main1" ><div class="divinfo">Employees Information</div><br></br><%
	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT `R_ID`,`Name`,`Email_ID`,`Password`,`Gender`,`Address`,`Mobile_NO`,`Birthday`,`Is_Allow`,`department_table`.`Dept_Name` FROM registration_table,department_table WHERE department_table.Dept_ID=registration_table.Dept_ID");
	out.println("<center>");
	out.println("<table class='table1'>");
	out.println("<tr><th>R_ID</th><th>Name</th><th>Email_ID</th><th>Password</th><th>Department</th><th>Gender</th><th>Address</th><th>Mobile_NO</th><th>Birth-day</th><th>Is_Allow</th><th>Login_state</th></tr>");
	String estate=null;
	session.setAttribute("employee", "employee");
	while(rs.next())
	{
	
		if(rs.getString("Is_Allow").equalsIgnoreCase("Active"))
		{
			estate="Deactive";
		}
		else
		{
			estate="Active";
		}
	out.println("<tr><td>"+rs.getInt("R_ID")+"</td><td>"+rs.getString("Name")+"</td><td>"+rs.getString("Email_ID")+"</td><td>"+rs.getString("Password")+"</td><td>"+rs.getString("department_table.Dept_Name")+"</td><td>"+rs.getString("Gender")+"</td><td>"+rs.getString("Address")+"</td><td>"+rs.getString("Mobile_NO")+"</td><td>"+rs.getString("Birthday")+"</td><td>"+rs.getString("Is_Allow")+"</td><td><a href='admin_changestate.jsp'>"+estate+"</a></button></td></tr>");	
	
	}
	out.println("</table></center>");
	}catch(Exception e)
	{
	out.println(e);	
	}
	
%> 
	<br>
	<button><a href="register.jsp" class="a1"> New </a></button>
	<button><a href="update.jsp" class="a1"> Modify </a></button>
	<button><a href="delete.jsp" class="a1"> Remove </a></button>
	</div>
	</form>			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>