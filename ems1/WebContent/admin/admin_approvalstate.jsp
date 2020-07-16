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
		<h1>Leave Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Confermation ID</h1>
			<form action="admin_approvalstate.jsp" method="POST">
<%if(session.getAttribute("lemployee")!=null){ %>
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
			



<%	}
if(session.getAttribute("lemployee")!=null)
{
	if(request.getParameter("Employee_ID")!=null)
	{
 			try
			{		int i=0;
					String estate=null;
					String Active="APPROVAL";
					String Deactive="NOT- APPROVAL";
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
					String query=" SELECT `Leave_state` FROM `leave_table` WHERE `Emp_ID`='"+request.getParameter("Employee_ID")+"'";
					Statement st=con.createStatement();
					ResultSet re=st.executeQuery(query);
					while(re.next())
					{	
						estate=re.getString("Leave_state");
						
						
					}	
								if(!estate.equalsIgnoreCase("APPROVAL"))
								{	
									st.executeUpdate("UPDATE `leave_table` SET `Leave_state`='"+Active+"' WHERE `Emp_ID`='"+request.getParameter("Employee_ID")+"'");i++;
								}
								else
								{
									st.executeUpdate("UPDATE `leave_table` SET `Leave_state`='"+Deactive+"' WHERE `Emp_ID`='"+request.getParameter("Employee_ID")+"'");i++;
								}
							
							out.println("<h3>"+i+" Field Updated</h3>");
							con.close();
							
						}
						catch(Exception e)
						{
							out.println(e);
						}
				session.removeAttribute("lemployee");
				response.sendRedirect("http://localhost:8080/ems1/admin/admin_leave.jsp");
	}
}
%>

</body>
</html>