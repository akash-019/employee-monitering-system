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
<%if(session.getAttribute("id")!=null){ %>

<ul>
 <li><a href="employee_dashboard.jsp" style="text-align:center"><img class="img1" src="emp.PNG" /><br>employee name</a></li>
  <li><a class="active" href="employee_dashboard.jsp">Dashboard</a></li>
  <li><a href="employee_teamleader.jsp">Teamleader</a></li>
  <li><a href="employee_task.jsp">Task</a></li>
  <li><a href="employee_event.jsp">Event</a></li>
  <li><a href="employee_profile.jsp">Profile</a></li>
  <li><a href="employee_attendence.jsp">Attendence</a></li>
   <li><a href="employee_leave.jsp">Leave</a></li>

</ul>
<div class="headder" > 
  <h2> TASK SECTION</h2>
  <div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
  </div>
<div class="main1" ><div class="divinfo">Task Information</div><br><dr>

 <form action="employee_updatetask.jsp" name="POST">
	<%

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
			Statement st=con.createStatement();
					
					
			ResultSet rs=st.executeQuery("SELECT `Task_ID`, `project_detail_table`.`P_Name`, `registration_table`.`Name`, `Task_Name`, `Task_Details`, `Task_Status`, `Add_log` FROM `team_task_table`,`project_detail_table`,`registration_table` WHERE project_detail_table.P_ID=team_task_table.P_ID AND registration_table.R_ID=`team_task_table`.`Teamleader_ID` AND team_task_table.Emp_ID='"+session.getAttribute("id")+"'");
			out.println("<center>");
			out.println("<table class='table1'>");
			out.println("<tr><th>Task_ID</th><th>Project_Name</th><th>Teamleder_Name</th><th>Task_Name</th><th>Task_Details</th><th>Task_Status</th><th>Add_log</th></tr>");
			
			while(rs.next())
			{
			out.println("<tr><td>"+rs.getString("Task_ID")+"</td><td>"+rs.getString("project_detail_table.P_Name")+"</td><td>"+rs.getString("registration_table.Name")+"</td><td>"+rs.getString("Task_Name")+"</td><td>"+rs.getString("Task_Details")+"</td><td>"+rs.getString("Task_Status")+"</td><td>"+rs.getString("Add_log")+"</td></tr>");	
			
			}
			rs.close();
			
			out.println("</table></center>");
			
			
	
	%><br>
	<h3>Enter Task id : <input type="number" name="taskid"> 
	Select State :<select name="tstate"><option value="pandding">pandding</option>
							<option value="inprogress">inprogress</option>		
							<option value="complete">complete</option>
					 </select>
	ADD_LOG :<input type="text" name="reason"/>
	<button>Submit</button>
	</h3>
	</form> 
	<br>
	
  </div>

			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>