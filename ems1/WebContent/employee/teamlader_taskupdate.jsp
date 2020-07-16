
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>operation</title>
 
<link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="pen-title">
		<h1>Task Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Task</h1>
			<form action="teamlader_taskupdate.jsp" method="POST">


			<div class="input-container">
				
					<input type="number" name="P_ID" required="required">
					<label>Project ID</label>
					<div class="bar">
					</div>
				</div>
			
			<div class="Radio">
			<center><h2><label>State</label>
					<select name="state"><option value="pending">pending</option>
							<option value="inprogress">inprogress</option>		
							<option value="complete">complete</option>
					 </select></h2>
					</center>
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
							
					
				<%if(session.getAttribute("updatetask")!=null)
				{	
					if(request.getParameter("P_ID")!=null && request.getParameter("state")!=null)
					{	out.println(request.getParameter("P_ID")+request.getParameter("state"));
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="UPDATE project_detail_table SET Project_Working_Status='"+request.getParameter("state")+"' WHERE P_ID='"+request.getParameter("P_ID")+"'";
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
						response.sendRedirect("http://localhost:8080/ems1/employee/employee_teamleader.jsp");
					}
				}%>