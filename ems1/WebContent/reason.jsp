<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reason</title>
 
<link rel="stylesheet" href="style.css" />
</head>
<body>


<div class="pen-title">
		<h1>Reason Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Reason</h1>
		<form action="reason_collect.jsp" method="POST">
			<div class="input-container">
					<input type="text" name="reason" required="required">
					<label>Enter Reason</label>
					<div class="bar">
					</div>
				</div>

				<div class="button-container">
				<Button><span>submit</span></Button>
				</div>
			
			</form>
		</div>

	</div>
			
			
	
</body>
</html>