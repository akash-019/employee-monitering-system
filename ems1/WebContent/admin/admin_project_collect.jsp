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
		<h1>Project Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Project</h1>
			<form action="admin_operation_project.jsp" method="POST">
							
				<% 
								String op=request.getParameter("operation");%>
								
<%if(op.equals("New")){ session.setAttribute("pNew",op); %>
				<div class="input-container">
					<input type="text" name="p_name" required="required"/>
					<label>Project Name</label>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
				<label>Client    </label>
					<select name="cid"><%
						try
						{
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Client_ID`,`Client_Name` from Client_Details_table " ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						int id;
						String cname;
						while(re.next())
						{	 id=re.getInt("Client_ID");
							cname=re.getString("Client_Name");
							out.print("<option value="+id+">"+id+" "+cname+"</option>");
						}con.close();
						st.close();
						}
						catch(Exception e)
						{
							out.println(e);
						} %></select>
					
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="text" name="Ptype" required="required"/>
					<label>Project Type</label>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
					<label>Pro_work_state </label>	
					<select name="pws" required="required"><option value="inProgress">in Progress</option><option value="pending">panding</option></select>
								
					<div class="bar">
					</div>
				</div>
				<div class="radio">
					<label>Start Date:</label>				
					<input type="date" name="sd" required="required"/>
					<div class="bar">
					</div>
				</div>
				<div class="radio">
					<label>End Date:</label>				
					<input type="date" name="ed" required="required"/>
					<div class="bar">
					</div>
				</div>
			<%} %>
		
		
	<%if(op.equals("Modify")){session.setAttribute("pModify",op); %>
			<%!	String name=null,ptype=null,pws=null;
			String p_id=null;
			Date sd,ed; %>
			<%
						try
						{ p_id=request.getParameter("P_ID");
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `P_ID`, `P_Name`, `Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date` FROM `project_detail_table` WHERE P_ID='"+p_id+"'" ;
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						
						
						while(re.next())
						{	 name=re.getString("P_Name");
							 ptype=re.getString("Project_Type");
							 pws=re.getString("Project_Working_Status");
							 sd=re.getDate("Start_Date");
							 ed=re.getDate("End_Date");
							
						}con.close();
						st.close();
						}
						catch(Exception e)
						{
							out.println(e);
						} %>
			<div class="input-container">
					<input type="hidden" name="P_ID" value=<%=p_id %>>
					<input type="text" name="pname" value=<%=name %>>
					<label>Project Name</label>
					<div class="bar">
					</div>
				</div>
			
			<div class="input-container">
					<input type="text" name="ptype" value=<%=ptype %>>
					<label>Project Type</label>
					<div class="bar">
					</div>
				</div>
			<div class="input-container">
					<input type="text" name="pws" value=<%=pws %>>
					<label>Project Working Status</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="Date" name="sd" value=<%=sd %>>
					<label>Start Date</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="Date" name="ed" value=<%=ed %>>
					<label>End Date</label>
					<div class="bar">
					</div>
				</div>
			<%} %>
		
<%if(op.equals("Remove")){session.setAttribute("pRemove",op);%>
			<div class="input-container">
					<input type="text" name="p_id" required="required"/>
					<label>Project_ID</label>
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