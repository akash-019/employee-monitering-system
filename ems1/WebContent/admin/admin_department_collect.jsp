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
<div class="pen-title">
		<h1>Department Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Department</h1>
			<form action="admin_operation_department.jsp" method="POST">
							
				<% 
								String op=request.getParameter("operation");%>
								
				<%if(op.equals("New")){ session.setAttribute("dNew",op); %>
				<div class="input-container">
					<input type="text" name="name" required="required"/>
					<label>Name</label>
					<div class="bar">
					</div>
				</div>
				
			<%} %>
		
		
			<%if(op.equals("Modify")){session.setAttribute("dModify",op); %>
			<div class="input-container">
					<input type="number" name="dept_id" required="required">
					<label>Dpet_ID</label>
					<div class="bar">
					</div>
				</div>
			<div class="input-container">
					<input type="text" name="name" required="required">
					<label>Dept Name</label>
					<div class="bar">
					</div>
				</div>
			
			<%} %>
		
		<%if(op.equals("Remove")){session.setAttribute("dRemove",op); %>
			<div class="input-container">
					<input type="text" name="Dept_id" required="required"/>
					<label>Dept_Id</label>
					<div class="bar">
					</div>
				</div>
	<%} %>
				<div class="button-container">
				<Button><span>submit</span></Button>
				</div>
			
			</form>
		</div>

	</div>
			
			
	
</body>
</html>