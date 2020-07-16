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
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
Statement st=con.createStatement();
int i=st.executeUpdate("INSERT INTO `leave_table`(`Emp_ID`, `From_Date`, `To_Date`, `Reason`) VALUES ('"+session.getAttribute("id")+"','"+request.getParameter("fdate")+"','"+request.getParameter("tdate")+"','"+request.getParameter("reason")+"')");
out.println(i);
response.sendRedirect("http://localhost:8080/ems1/employee/employee_leave.jsp"); %>
</body>
</html>