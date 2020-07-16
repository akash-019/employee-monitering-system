<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>
<%try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
String query="UPDATE `team_task_table` SET Task_Status='"+request.getParameter("tstate")+"',Add_log='"+request.getParameter("reason")+"' WHERE Task_ID='"+request.getParameter("taskid")+"'";
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
session.removeAttribute("updatetask");
response.sendRedirect("http://localhost:8080/ems1/employee/employee_task.jsp");
 %>
<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>