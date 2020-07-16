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
		<h1>Event Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Event</h1>
		<form action="admin_operation_event.jsp" method="POST">
							
				<% 				
								String op=request.getParameter("operation");%>
								
<%if(op.equals("New")){ session.setAttribute("evNew",op); %>
				<div class="input-container">
					<input type="Date" name="edate" required="required"/>
					<label>Event Date</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="Time" name="etime" required="required"/>
					<label>Event Time</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">	
					<input type="text" name="etitle" required="required"/>
					<label>Event Title </label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">	
					<input type="text" name="edetails" required="required"/>
					<label>Event Details </label>
					<div class="bar">
					</div>
				</div>
				
			<%} %>
		
		
	<%if(op.equals("Modify")){session.setAttribute("evModify",op); %>
			<%!	String edate=null, etime=null,etitle=null;
			String edetails=null;
			 %>
			<% String e_id=request.getParameter("e_ID");
						try
						{ 
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						String query="SELECT `Event_ID`, `Event_Date`, `Event_Time`, `Event_Title`, `Event_Details` FROM `event_table` WHERE `Event_ID`='"+e_id+"'";
						Statement st=con.createStatement();
						ResultSet re=st.executeQuery(query);
						
						
						while(re.next())
						{	
							edate=re.getString("Event_Date");
							etime=re.getString("Event_Time");
							etitle=re.getString("Event_Title");
							edetails=re.getString("Event_Details");
							
						}con.close();
						st.close();
						}
						catch(Exception e)
						{
							out.println(e);
						} %>
			<div class="input-container">
					<input type="hidden" name="e_ID" value=<%=e_id %>>
					<input type="date" name="date" value=<%=edate %>>
					<label>Event Date</label>
					<div class="bar">
					</div>
				</div>
			
			<div class="input-container">
					<input type="time" name="time" value=<%=etime %> required="required" >
					<label>Time</label>
					<div class="bar">
					</div>
				</div>
			<div class="input-container">
					<input type="text" name="title" value=<%=etitle%>>
					<label>Event Title</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="text" name="datails" value=<%=edetails %>>
					<label>Event Details</label>
					<div class="bar">
					</div>
				</div>
				
			<%} %>
		
<%if(op.equals("Remove")){session.setAttribute("evRemove",op); String e_id=request.getParameter("e_ID");%>
			<div class="input-container">
					<input type="hidden" name="e_ID" value=<%=e_id %>>
					<input type="text" name="e_id" required="required"/>
					<label>Event_ID</label>
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