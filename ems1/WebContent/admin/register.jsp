<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EMS</title>
<link rel="stylesheet" href="style.css" />
</head>

<body>
<%session.setAttribute("eregister", "register"); %>
<div class="pen-title">
		<h1>Registration Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Register</h1>
			<form action="admin_operation_employee.jsp" method="POST">
				<div class="input-container">
					<input type="text" name="name" required="required"/>
					<label>Name</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="email" name="email" required="required"/>
					<label>Email</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="password" name="password" required="required"/>
					<label>Password</label>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
				<label>Department </label>
					<select name="did"><%
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Dept_ID`,`Dept_Name` from department_table " ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						int id;
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
				<div class="input-container">
					<input type="number" min=1234567890 max=9999999999 name="mobile" required="required" />
					<label>Contact No.</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="text" name="address" required="required"/>
					<label>Address</label>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
					<label>Gender:-</label>				
					<input type="radio" name="gender" value="male"  height="10%" width="10"/>Male<input type="radio" name="gender" value="female"  size="1"/>Female
					<div class="bar">
					</div>
				</div>
				<div class="radio">
					<label>Birth Date:</label>				
					<input type="date" name="bdate"/>
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