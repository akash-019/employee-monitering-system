<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reasone</title>
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>


<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	String reason=request.getParameter("reason");
	int i=st.executeUpdate("update attendance_table set `Reason_Of_Late`='"+reason+"' where R_ID='"+session.getAttribute("id")+"'");
	if(i>0)
	{
		response.sendRedirect("http://localhost:8080/ems1/employee/employee_dashboard.jsp");
	}
	%> 


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>

</body>
</html>