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
<% String p=null;
int flg=0;
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
	flg=1;
}
}
else
{
	flg=0;
}
%>
<%if(session.getAttribute("id")!=null && flg==1){ %>

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
<div class="headder" > <h2>DEPATMENT SECTION</h2>
<h2  class="msg">PROFILE SECTION</h2>
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
<div class="main1">Department operation result <br>
<%
 if(session.getAttribute("dNew")!=null)
{	
	String name=request.getParameter("name");
	

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="INSERT INTO department_table(`Dept_Name`) VALUES ('"+name+"')";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("Department add successfully");	
		}
	
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("dNew");
	
}









if(session.getAttribute("dModify")!=null)
{	try{
	String id=request.getParameter("dept_id");
	int i=0;
	String name=request.getParameter("name");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
		if(name!=null)
		{
			i=st.executeUpdate("UPDATE `department_table` SET `Dept_Name`='"+name+"' where `Dept_ID`='"+id+"'");
		}
		
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("dModify");
	
}



if(session.getAttribute("dRemove")!=null)
{
	String id=request.getParameter("Dept_id");
	

	try
	{	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="delete from  `department_table` where `Dept_ID`='"+id+"' ";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("<h3>Department remove successfully</h3>");	
		}
		
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("dRemove");
	
}
%><a href="admin_department.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>


<%response.sendRedirect("http://localhost:8080/ems1/admin/admin_department.jsp"); %>

<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>