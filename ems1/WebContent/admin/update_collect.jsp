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
<% session.setAttribute("eupdate", "update"); %>
<% int id=Integer.parseInt(request.getParameter("id"));
	String name="";
	String email="";
	String password="";
	String address="";
	String mobile="";
	String bdate="";
	String did="";
	try
	{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `Name`, `Email_ID`, `Password`, `Address`, `Mobile_No`,`Birthday`,`Dept_ID` from registration_table where R_ID='"+id+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	while(re.next())
	{
		name=re.getString("Name");
		email=re.getString("Email_ID");
		password=re.getString("Password");
		address=re.getString("Address");
		mobile=re.getString("Mobile_No");
		bdate=re.getString("Birthday");
		did=re.getString("Dept_ID");
	}
	}
	catch(Exception e)
	{
		out.println(e);
	}%>
	
	
	<div class="pen-title">
		<h1>Update Form</h1>
		<h3>fill that detail that you want to update..</h3>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<center>fill that that you want to update..</center>
			<h1 class="title">Update</h1>
			<form action="admin_operation_employee.jsp" method="POST">
			<input type="hidden" name="id" value=<%= id %>>
				<div class="input-container">
					<input type="text" name="name" value=<%=name %>>
			
					<label>Name</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="email" name="email" value=<%=email %>>
					<label>Email</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="password" name="password" value=<%=password %>>
					<label>Password</label>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
					<label>Birth Date:</label>				
					<input type="date" name="bdate" value=<%= bdate %>>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="number" min=1234567890 max=9999999999 name="mobile" value=<%=mobile %>>
					<label>Contact No.</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="text" name="address"  value=<%=address %>>
					<label>Address</label>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
				<label>Department </label>
					<select name="did"><%
							out.print("<option value="+did+">"+did+"</option>");
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Dept_ID`,`Dept_Name` from department_table " ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						String cname;
						while(re.next())
						{	 id=re.getInt("Dept_ID");
							cname=re.getString("Dept_Name");
							out.print("<option value="+id+">"+id+" "+cname+"</option>");
						}con.close();
						st.close();
						}
						catch(Exception e)
						{
							out.println(e);
						} %>
						</select>
					</div>
				<div class="button-container">
				<Button><span>submit</span></Button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>