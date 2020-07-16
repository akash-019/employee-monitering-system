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
		<h1>Employee Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Confermation ID</h1>
			<form action="admin_changestate.jsp" method="POST">
			
			<div class="input-container">
					<input type="number" name="Employee_ID" required="required">
					<label>Employee_ID</label>
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
if(session.getAttribute("employee")!=null)
{
	if(request.getParameter("Employee_ID")!=null)
	{
 			try
			{		int i=0;
					String estate=null;
					String Active="Active";
					String Deactive="Deactive";
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
					String query=" SELECT `Is_Allow` FROM `registration_table` WHERE `R_ID`='"+request.getParameter("Employee_ID")+"'";
					Statement st=con.createStatement();
					ResultSet re=st.executeQuery(query);
					while(re.next())
					{	
						estate=re.getString("Is_Allow");
						
						
					}	
								if(!estate.equalsIgnoreCase("Active"))
								{	
									st.executeUpdate("UPDATE `registration_table` SET `Is_Allow`='"+Active+"' WHERE `R_ID`='"+request.getParameter("Employee_ID")+"'");i++;
								}
								else
								{
									st.executeUpdate("UPDATE `registration_table` SET `Is_Allow`='"+Deactive+"' WHERE `R_ID`='"+request.getParameter("Employee_ID")+"'");i++;
								}
							
							out.println("<h3>"+i+" Field Updated</h3>");
							con.close();
							
						}
						catch(Exception e)
						{
							out.println(e);
						}
				session.removeAttribute("employee");
				response.sendRedirect("http://localhost:8080/ems1/admin/admin_employees.jsp");
	}
}
%>
</body>
</html>