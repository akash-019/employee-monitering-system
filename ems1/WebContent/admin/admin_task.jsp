<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS </title>
 
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
  <h2> Task SECTION</h2>
  <div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
  </div>
<form action="admin_assign_task.jsp" method="post">
<div class="main1" ><div class="divinfo">Task Information</div><br>
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		Statement st=con.createStatement();
		ResultSet rs;
		String query="SELECT `team_leader_table`.`Teamleader_ID`,`team_leader_table`.`Team_ID`,`project_detail_table`.`P_Name`,`registration_table`.`Name` FROM `team_leader_table`,`project_detail_table`,`registration_table` WHERE `team_leader_table`.`Teamleader_ID`=`registration_table`.`R_ID` AND `team_leader_table`.`P_ID`=`project_detail_table`.`P_ID` " ;

		 rs=st.executeQuery(query);
			 out.println("<center>");
			out.println("<table class='table1'>");
			out.println("<tr><th>Teamleader_ID</th><th>Team_ID</th><th>Project_Name</th><th>Employee Name</th><tr>");
			while(rs.next())
			{
			out.println("<tr><td>"+rs.getInt("team_leader_table.Teamleader_ID")+"</td><td>"+rs.getString("team_leader_table.Team_ID")+"</td><td>"+rs.getString("project_detail_table.P_Name")+"</td><td>"+rs.getString("registration_table.Name")+"</td></tr>");
			
			}	out.println("</table></center>");
			
			con.close();
		}catch(Exception e)
		{
			out.println(e);
		}
	%><br><br><h3>Enter Following Details to ADD Task</h3>
	<br>
	<center>
<h3>SELECT PROJECT : <select name="pid"><%
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="SELECT P_ID,P_Name FROM project_detail_table WHERE P_ID NOT IN ( SELECT P_ID FROM team_leader_table WHERE team_leader_table.P_ID = project_detail_table.P_ID)" ;
		Statement st=con.createStatement();
		ResultSet re=st.executeQuery(query);
		int id;
		String pname;
		while(re.next())
		{	
				 id=re.getInt("P_ID");
				pname=re.getString("P_Name");
				out.print("<option value="+id+">"+id+" "+pname+"</option>");
		}con.close();
		st.close();
		}
		catch(Exception e)
		{
			out.println(e);
		} %>
		</select></h3>
<h3>SELECT DEPET : <select name="did"><%
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="SELECT `Dept_ID`, `Dept_Name` FROM `department_table`";
		Statement st=con.createStatement();
		ResultSet re=st.executeQuery(query);
		int id;
		String dname;
		while(re.next())
		{	 id=re.getInt("Dept_ID");
			dname=re.getString("Dept_Name");
			out.print("<option value="+id+">"+id+" "+dname+"</option>");
		}con.close();
		st.close();
		}
		catch(Exception e)
		{
			out.println(e);
		} 
		session.setAttribute("assigntask","assigntask");
		%>
		</select></h3>
	<Button>Submit</Button>
</center>	
  </div>
</form>	
			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>