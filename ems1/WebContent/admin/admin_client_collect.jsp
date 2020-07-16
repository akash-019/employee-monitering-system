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
		<h1>Client Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Client</h1>
			<form action="admin_operation_client.jsp" method="POST">
							
				<% 				
								String op=request.getParameter("operation");%>
								
<%if(op.equals("New")){ session.setAttribute("cNew",op); %>
				<div class="input-container">
					<input type="text" name="name" required="required"/>
					<label>Client Name</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="email" name="email" required="required"/>
					<label>Email_ID</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">	
					<input type="password" name="password" required="required"/>
					<label>Password </label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">	
					<input type="number"  min=1234567892 max=9999999999 name="num" required="required"/>
					<label>Mobile no. </label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">	
					<input type="text" name="cpname" required="required"/>
					<label>Client Project Name </label>
					<div class="bar">
					</div>
				</div>
			<%} %>
		
		
	<%if(op.equals("Modify")){session.setAttribute("cModify",op); %>
			<%!	String ccname=null,cemail=null,cpass=null;
			String cmobile=null,ccpname=null;
			 %>
			<% String c_id=request.getParameter("C_ID");
						try
						{ c_id=request.getParameter("C_ID");
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Client_Name`, `Email_ID`, `Password`, `Mobile_Number`, `Client_Project_Name`, `Client_Project_Image` FROM `client_details_table` WHERE Client_ID='"+c_id+"'";
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						
						
						while(re.next())
						{	
							ccname=re.getString("Client_Name");
							cemail=re.getString("Email_ID");
							cpass=re.getString("Password");
							cmobile=re.getString("Mobile_Number");
							ccpname=re.getString("Client_Project_Name");
						}con.close();
						st.close();
						}
						catch(Exception e)
						{
							out.println(e);
						} %>
			<div class="input-container">
					<input type="hidden" name="C_ID" value=<%=c_id %>>
					<input type="text" name="cname" value=<%=ccname %>>
					<label>Project Name</label>
					<div class="bar">
					</div>
				</div>
			
			<div class="input-container">
					<input type="email" name="email" value=<%=cemail %>>
					<label>Email_ID</label>
					<div class="bar">
					</div>
				</div>
			<div class="input-container">
					<input type="text" name="pass" value=<%=cpass %>>
					<label>Password</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="number" min=123456890 max=9999999999 name="mobile" value=<%=cmobile %>>
					<label>Mobile</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="text" name="cpname" value=<%=ccpname %>>
					<label>Client Project Name</label>
					<div class="bar">
					</div>
				</div>
			<%} %>
		
<%if(op.equals("Remove")){session.setAttribute("cRemove",op);%>
			<div class="input-container">
					<input type="text" name="c_id" required="required"/>
					<label>Client_ID</label>
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