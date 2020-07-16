<%@page import="java.sql.Date"%>
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
		<h1>Profile Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Profile</h1>
			<form action="admin_operation_profile.jsp" method="POST">
							
				<% 	String op=request.getParameter("operation");%>
						
		<%session.setAttribute("valid", "valid"); %>
		
	
			<%!	String name=null,email=null,password=null;
				String bdate=null,mobile=null,sname=null;
			%>
			<%
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Admin_Name`, `Admin_Email`, `Admin_Password`, `Birthdate`, `Mobile_number`, `Short_Name`, `Admin_Image` FROM `admin_login` WHERE `Admin_Id`='"+session.getAttribute("id")+"'" ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						
						
						while(re.next())
						{	 name=re.getString("Admin_Name");
							 email=re.getString("Admin_Email");
							 password=re.getString("Admin_Password");
							 bdate=re.getString("Birthdate");
							 mobile=re.getString("Mobile_number");
							 sname=re.getString("Short_Name");
							 							
						}con.close();
						st.close();
						}
						catch(Exception e)
						{
							out.println(e);
						} %>
			<div class="input-container">
					<input type="hidden" name="A_ID" value=<%=session.getAttribute("id") %>>
					<input type="text" name="name" value=<%=name %>>
					<label>Admin Name</label>
					<div class="bar">
					</div>
				</div>
			
			<div class="input-container">
					<input type="text" name="email" value=<%=email %>>
					<label>Email</label>
					<div class="bar">
					</div>
				</div>
			<div class="input-container">
					<input type="text" name="pass" value=<%=password %>>
					<label>Password</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="number" min=1234567890 max=9999999999 name="mobile" value=<%=mobile %>>
					<label>Mobile Number</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="Date" name="bdate" value=<%=bdate %>>
					<label>Birth Date</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="text" name="sname" value=<%=sname %>>
					<label>Short Name</label>
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