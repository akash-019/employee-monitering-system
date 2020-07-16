<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>
<form action="employee_assign_task.jsp" method="post">
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
<div class="headder" > <h2>TEAMLEADER SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>  </div>
<div class="main1" style="overflow:scroll;overflow-x:scroll;overflow-y:scroll;"><div class="divinfo">Teamleader Dashboard</div><br>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from `team_leader_table` where Teamleader_ID='"+session.getAttribute("id")+"'");
	String tid=null,projectid=null,teamid=null;
	int[] pid=new int[10];
	int i=0;
	ResultSet rs1=null;
		
	while(rs.next())
	{
		teamid=rs.getString("Team_ID");
		tid=rs.getString("Teamleader_ID");
		projectid=rs.getString("P_ID");
		pid[i]=rs.getInt("P_ID");
		i++;
	}
	if(teamid!=null && tid!=null && projectid!=null)
	{	
		out.println("<center>");
		out.println("<table class='table1'>");
		out.println("<tr><th>P_ID</th><th>P_Name</th><th>Client_Name</th><th>Project_type</th><th>Project_Working_State</th><th>Start_Date</th><th>End_Date</th></tr>");
	
		
		for(i=0;i<10;i++)
		{	if(pid[i]!=0)
			{
				 rs1=st.executeQuery("SELECT `P_ID`, `P_Name`,`client_details_table`.`Client_Name`,`Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date` FROM project_detail_table,client_details_table WHERE project_detail_table.Client_ID=client_details_table.Client_ID and P_ID='"+pid[i]+"'");
				while(rs1.next())
				{
					out.println("<tr><td>"+rs1.getInt("P_ID")+"</td><td>"+rs1.getString("P_Name")+"</td><td>"+rs1.getString("client_details_table.Client_Name")+"</td><td>"+rs1.getString("Project_Type")+"</td><td>"+rs1.getString("Project_Working_Status")+"</td><td>"+rs1.getDate("Start_Date")+"</td><td>"+rs1.getDate("End_Date")+"</td></tr>");	
						
				}rs1.close();
			}
		}con.close();
		st.close();
		out.println("</table></center>");
		%>
		
		<%session.setAttribute("updatetask", "updatetask");%>
		<a href="teamlader_taskupdate.jsp" >UPDATE PROJECT STATE</a>
		
		
		
		
		
		
		
		
		
				<div class="divinfo">Assign task</div><br>
						<center>
						<table style="text-align:left;">
							<tr><td>SELECT EMPLOYEE :</td><td> <select name="teamselect"> <%
												try
												{String did=null;
												Class.forName("com.mysql.jdbc.Driver").newInstance();
												Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
												String query="SELECT `Dept_ID` from registration_table where `R_ID`='"+session.getAttribute("id")+"'";
												Statement st1=con1.createStatement();
												ResultSet re=st1.executeQuery(query);
												while(re.next())
												{
													did=re.getString("Dept_ID");
												}
												out.print("<option value="+null+">Select Team</option>");
												String query1="SELECT `R_ID`,`Name` from registration_table where Dept_ID='"+did+"'";
												ResultSet re1=st1.executeQuery(query1);
												int id;
												String ename;
												while(re1.next())
												{	 id=re1.getInt("R_ID");
													ename=re1.getString("Name");
													out.print("<option value="+id+">"+id+" "+ename+"</option>");
												}con.close();
												st.close();
												}
												catch(Exception e)
												{
													out.println(e);
												}
											%></select></td></tr> 
						<tr><td>SELECT PROJECT  :</td><td> <select name="Project"> <%
												try
												{
												Class.forName("com.mysql.jdbc.Driver").newInstance();
												Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
												Statement st1=con1.createStatement();
												out.print("<option value="+null+">Select Project</option>");
												String query1="SELECT team_leader_table.P_ID,project_detail_table.P_Name FROM project_detail_table,team_leader_table WHERE project_detail_table.P_ID=team_leader_table.P_ID AND project_detail_table.Project_Working_Status='pending' AND team_leader_table.Teamleader_ID='"+session.getAttribute("id")+"'";
												ResultSet re1=st1.executeQuery(query1);
												int id;
												String pname;
												while(re1.next())
												{	 id=re1.getInt("P_ID");
													pname=re1.getString("P_Name");
													out.print("<option value="+id+">"+id+" "+pname+"</option>");
												}con.close();
												st.close();
												}
												catch(Exception e)
												{
													out.println(e);
												}
											%></select></td></tr>
											<tr><td>TASK NAME : </td><td><input type="text" name="desctask" Placeholder="Task Name" style="width:100px;" /></td></tr>
											<tr><td>TASK DETAILS : </td><td><textarea name="taskdetails" Placeholder="Task Details"></textarea></td></tr>
											</table><button>Submit</button>
											<%session.setAttribute("task", "task"); %>
								</center>
						<div class="divinfo">Assigned task</div><br>
						<%
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
						Statement st1=con1.createStatement();
						ResultSet rs2=st1.executeQuery("SELECT `Emp_ID`,`project_detail_table`.`P_Name`,`Task_Name`,`Task_Details`,`Task_Status`,`Add_log` FROM `team_task_table`,`project_detail_table` WHERE `project_detail_table`.`P_ID`=`team_task_table`.`P_ID` AND `team_task_table`.`Teamleader_ID`='"+session.getAttribute("id")+"'");
						out.println("<center>");
						out.println("<table class='table1'>");
						out.println("<tr><th>Emp_ID</th><th>Project_Name</th><th>Task_Name</th><th>Task_Details</th><th>Task_Status</th><th>Add_log</th></tr>");
						
						while(rs2.next())
						{
						out.println("<tr><td>"+rs2.getInt("Emp_ID")+"</td><td>"+rs2.getString("project_detail_table.P_Name")+"</td><td>"+rs2.getString("Task_Name")+"</td><td>"+rs2.getString("Task_Details")+"</td><td>"+rs2.getString("Task_Status")+"</td><td>"+rs2.getString("Add_log")+"</td></tr>");	
						
						}
						out.println("</table></center>");
						
						%> 
													
	<%
	}
	else
	{	out.print("<center><h3>! Sorry NO project TO manage</h3></center>"); 
		
	} %>
	

</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>

</form>
<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>