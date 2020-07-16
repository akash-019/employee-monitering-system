<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<%
String p=null;
int i=0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT `Admin_Password` FROM `admin_login` WHERE `Admin_Id`='"+session.getAttribute("id")+"'");
while(rs.next())
{	
	p=rs.getString("Admin_Password");
}
String sessionp=(String)session.getAttribute("password");

if(p!=null && sessionp!=null)
{
if(p.compareTo(sessionp)==0)
{
	i=1;
}
}
else
{
	i=0;
}
%>
<%if(session.getAttribute("id")!=null && i==1){ %>

<ul>
  <li><a href="admin_dashboard.jsp" style="text-align:center"><img class="img1" src="emp.PNG" /><br>employee name</a></li>
  <li><a class="active" href="admin_dashboard.jsp">Dashboard</a></li>
  <li><a href="admin_department.jsp">Department</a></li>
  <li><a href="admin_project.jsp">Project</a></li>
  <li><a href="admin_employees.jsp">Employee</a> </li>
  <li><a href="admin_client.jsp">Client</a></li>
  <li><a href="admin_task.jsp">Task</a></li>
  <li><a href="admin_event.jsp">Event</a></li>
  <li><a href="admin_profile.jsp">Profile</a></li>
  <li><a href="admin_attendence.jsp">Attendence</a></li>
   <li><a href="admin_leave.jsp">Leave Applications</a></li>
   <li><a href="admin_employee_report.jsp">Employee report</a></li>
    <li><a href="admin_employee_report.jsp">Employee report</a></li>
</ul>
<div class="headder" > <h2>EMPLOYEE REPORT</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
</div>
<div class="main1" style="overflow:scroll;overflow-x:scroll;overflow-y:scroll;"><br><div class="divinfo">Employee Report</div>

<form action="admin_employee_report.jsp" method="post">
ENTER EMPLOYEE ID  : <input type="number" name="E_ID" value=""/>
<button>Submit</button>
					<div class="divinfo">Attendence Information</div><br>
					</form>
					<% Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
					Statement st1=con1.createStatement(); %>
					 
						<%
								if(request.getParameter("E_ID")!=null)
								{
											out.println("<center>");
											out.println("<table class='table1'>");
											ResultSet re1=st1.executeQuery("SELECT COUNTATTANDENCE(R_ID),Name FROM registration_table where `R_ID`='"+request.getParameter("E_ID")+"'");
											while(re1.next())
											{
												out.println("<tr><th>Eployee Name :     "+re1.getString("Name")+"</th><th>Total :   "+re1.getString("COUNTATTANDENCE(R_ID)")+"</th><tr>");
											}
											out.println("</table></center>");
										
								ResultSet rs1=st.executeQuery("SELECT `Date`, `IP_Address`, `Shift_Time`, `In_Time`, `Reason_Of_Late`, `Attendance` FROM `attendance_table` WHERE `R_ID`='"+request.getParameter("E_ID")+"'");
								out.println("<center>");
								out.println("<table class='table1'>");
								out.println("<tr><th>Date</th><th>IP_Address</th><th>Shift_Time</th><th>In_Time</th><th>Reason_Of_Late</th><th>Attendance</th></tr>");
								
								while(rs1.next())
								{
								out.println("<tr><td>"+rs1.getString("Date")+"</td><td>"+rs1.getString("IP_Address")+"</td><td>"+rs1.getString("Shift_Time")+"</td><td>"+rs1.getString("In_Time")+"</td><td>"+rs1.getString("Reason_Of_Late")+"</td><td>"+rs1.getString("Attendance")+"</td></tr>");	
								
								}
							
								
								out.println("</table></center>");
								}
								
						
						%> <br>
<div class="divinfo">Leave Information</div><br>	
<%		
if(request.getParameter("E_ID")!=null)
{
			ResultSet rs2=st.executeQuery("SELECT`From_Date`, `To_Date`, `Reason`,`Leave_state` FROM `leave_table` WHERE `Emp_ID`='"+request.getParameter("E_ID")+"'");
			out.println("<center>");
			out.println("<table class='table1'>");
			int j=1;
			out.println("<tr><th>NO</th><th>From_Date</th><th>To_Date</th><th>Reason</th><th>Leave_state</th></tr>");
			
			while(rs2.next())
			{
			out.println("<tr><td>"+j+"</td><td>"+rs2.getString("From_Date")+"</td><td>"+rs2.getString("To_Date")+"</td><td>"+rs2.getString("Reason")+"</td><td>"+rs2.getString("Leave_state")+"</td></tr>");	
			j++;
			}
			out.println("</table></center>");
}
%><br>

<div class="divinfo">TeamLeader Information</div><br>	
														<%		
														if(request.getParameter("E_ID")!=null)
														{
															
															ResultSet rs3=st.executeQuery("select * from `team_leader_table` where Teamleader_ID='"+request.getParameter("E_ID")+"'");
															String tid=null,projectid=null,teamid=null;
															int[] pid=new int[10];
															int k=0;
															ResultSet rs1=null;
																
															while(rs3.next())
															{
																teamid=rs3.getString("Team_ID");
																tid=rs3.getString("Teamleader_ID");
																projectid=rs3.getString("P_ID");
																pid[k]=rs3.getInt("P_ID");
																k++;
															}
															if(teamid!=null && tid!=null && projectid!=null)
															{	
																out.println("<center>");
																out.println("<table class='table1'>");
																out.println("<tr><th>P_ID</th><th>P_Name</th><th>Client_Name</th><th>Project_type</th><th>Project_Working_State</th><th>Start_Date</th><th>End_Date</th></tr>");
															
																
																for(k=0;k<10;k++)
																{	if(pid[k]!=0)
																	{	
																		 rs1=st.executeQuery("SELECT `P_ID`, `P_Name`,`client_details_table`.`Client_Name`,`Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date` FROM project_detail_table,client_details_table WHERE project_detail_table.Client_ID=client_details_table.Client_ID and P_ID='"+pid[k]+"'");
																		while(rs1.next())
																		{
																			out.println("<tr><td>"+rs1.getInt("P_ID")+"</td><td>"+rs1.getString("P_Name")+"</td><td>"+rs1.getString("client_details_table.Client_Name")+"</td><td>"+rs1.getString("Project_Type")+"</td><td>"+rs1.getString("Project_Working_Status")+"</td><td>"+rs1.getDate("Start_Date")+"</td><td>"+rs1.getDate("End_Date")+"</td></tr>");	
																				
																		}rs1.close();
																	}
																}
																out.println("</table></center>");
																
														}
														}con.close();st.close();
														%><br>
<div class="divinfo">Task Information</div><br>	
<%
if(request.getParameter("E_ID")!=null)
{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection contask=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement sttask=contask.createStatement();
			
			
	ResultSet rst=sttask.executeQuery("SELECT `Task_ID`, `project_detail_table`.`P_Name`, `registration_table`.`Name`, `Task_Name`, `Task_Details`, `Task_Status`, `Add_log` FROM `team_task_table`,`project_detail_table`,`registration_table` WHERE project_detail_table.P_ID=team_task_table.P_ID AND registration_table.R_ID=`team_task_table`.`Teamleader_ID` AND team_task_table.Emp_ID='"+request.getParameter("E_ID")+"'");
	out.println("<center>");
	out.println("<table class='table1'>");
	out.println("<tr><th>Task_ID</th><th>Project_Name</th><th>Teamleder_Name</th><th>Task_Name</th><th>Task_Details</th><th>Task_Status</th><th>Add_log</th></tr>");
	
	while(rst.next())
	{
	out.println("<tr><td>"+rst.getString("Task_ID")+"</td><td>"+rst.getString("project_detail_table.P_Name")+"</td><td>"+rst.getString("registration_table.Name")+"</td><td>"+rst.getString("Task_Name")+"</td><td>"+rst.getString("Task_Details")+"</td><td>"+rst.getString("Task_Status")+"</td><td>"+rst.getString("Add_log")+"</td></tr>");	
	
	}
	rst.close();
	
	out.println("</table></center>");
	
con.close();
st.close();
}
%>
</div>

<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>

<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</body>
</html>