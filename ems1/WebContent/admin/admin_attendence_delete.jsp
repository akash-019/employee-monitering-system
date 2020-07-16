<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="pen-title">
		<h1>Attendence Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Confermation DATE</h1>
			<form action="admin_attendence_delete.jsp" method="POST">
			
			<div class="input-container">
					<input type="date" name="TO" required="required">
					<label>TO</label>
					<div class="bar">
					</div>
				</div>
			<div class="input-container">
					<input type="date" name="FROM" required="required">
					<label>FROM</label>
					<div class="bar">
					</div>
				</div>
			<div class="button-container">
				<Button><span>submit</span></Button>
				</div>
			
			</form>
			
	
		</div>

	</div>
			



<%	
if(session.getAttribute("del_all")!=null)
{
	if(request.getParameter("TO")!=null && request.getParameter("FROM")!=null)
	{
 			try
			{		int i=0;
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
					String query="DELETE FROM attendance_table where `date` BETWEEN '"+request.getParameter("TO")+"' AND '"+request.getParameter("FROM")+"'";
					Statement st=con.createStatement();
							i=st.executeUpdate(query);
							
							out.println("<h3>"+i+" Field affected</h3>");
							con.close();
							
						}
						catch(Exception e)
						{
							out.println(e);
						}
			session.removeAttribute("dell_all");
				response.sendRedirect("http://localhost:8080/ems1/admin/admin_attendence.jsp");
	}
}
%>
</body>
</html>