<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<% session.setAttribute("edelete", "delete"); %>
<div class="pen-title">
		<h1>Delete Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Delete</h1>
			<form action="admin_operation_employee.jsp" method="POST">
				<div class="input-container">
					<input type="text" name="id" required="required"/>
					<label>Employee Id </label>
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