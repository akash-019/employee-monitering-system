<%@page import="java.sql.Date"%>
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
		<h1>Profile Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Profile</h1>
			<form action="client_operation_profile.jsp" method="POST">
							
				<% 	String op=request.getParameter("operation");%>
						
		<%session.setAttribute("cvalid", "valid"); %>
		
	
			<%!	String name=null,email=null,password=null;
				String pname=null,mobile=null;
			%>
			<%
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Client_Name`, `Email_ID`, `Password`, `Mobile_Number`, `Mobile_number` FROM `client_details_table` WHERE `Client_Id`='"+session.getAttribute("id")+"'" ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						
						
						while(re.next())
						{	 name=re.getString("Client_Name");
							 email=re.getString("Email_ID");
							 password=re.getString("Password");
							 mobile=re.getString("Mobile_Number");
							
							 							
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
					<label>Client Name</label>
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
					<input type="number" min=1234567892 max=9999999999 name="mobile" value=<%=mobile %>>
					<label>Mobile Number</label>
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