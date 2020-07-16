<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title> 
<link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="pen-title">
		<h1>Task Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Project</h1>
			<form action="admin_assign_task.jsp" method="POST">
			<input type="hidden" name="pid" value=<%= request.getParameter("pid") %>> 
<% if(session.getAttribute("assigntask")!=null){%>
	<div class="radio">
				<label>SELECT EMPLOYEE </label>
					<select name="tid"><%
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `R_ID`,`Name` from registration_table where `Dept_ID`='"+request.getParameter("did")+"'" ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						int id;
						String ename;
						while(re.next())
						{	 id=re.getInt("R_ID");
							ename=re.getString("Name");
							out.print("<option value="+id+">"+id+" "+ename+"</option>");
						}con.close();
						st.close();
						re.close();
						}
						catch(Exception e)
						{
							out.println(e);
						}
					%></select>
					
					<div class="bar">
					<br>
					</div>
					<div class="button-container">
				<Button><span>submit</span></Button>
				</div>
		</div>
		</form>
	</div>
</div>
	
	
<% }	%>
<% if(session.getAttribute("assigntask")!=null){ %>
<%if(request.getParameter("tid")!=null)
	{
			try
			{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			String query="insert into team_leader_table(`Teamleader_ID`,`P_ID`) values('"+request.getParameter("tid")+"','"+request.getParameter("pid")+"')" ;
			Statement st=con.createStatement();
			int i=st.executeUpdate(query);
			out.println(i);
			con.close();
			st.close();
			}
			catch(Exception e)
			{
				out.println(e);
			}
			session.removeAttribute("assigntask");
			response.sendRedirect("http://localhost:8080/ems1/admin/admin_task.jsp");
	}
	
%>

<%} %>
</body>
</html>