<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
</head>
<body>
<%if(request.getParameter("update")!=null){
	out.print("update");
} %>
<%if(session.getAttribute("task")!=null){ %>
<% String selemp=request.getParameter("teamselect");
String pid=request.getParameter("Project");
String tname=request.getParameter("desctask");
String tdetails=request.getParameter("taskdetails");
%>

<%
	if(selemp!=null && tname!=null && tdetails!=null)
	{out.print("hello");
			try
			{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			String query="INSERT INTO `team_task_table`(`Emp_ID`, `P_ID`, `Teamleader_ID`, `Task_Name`, `Task_Details`) VALUES ("+selemp+","+pid+","+session.getAttribute("id")+",'"+tname+"','"+tdetails+"')";
			Statement st=con.createStatement();
			int i=st.executeUpdate(query);
			out.println(i);
			}
			catch(Exception e)
			{
				out.print(e);
			}session.removeAttribute("task");
	}
}
 %>
 
 <%// response.sendRedirect("http://localhost:8080/ems1/employee/employee_teamleader.jsp"); %>
</body>
</html> 