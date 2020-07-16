<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="java.sql.*,java.util.*,java.lang.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>client details</title>
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<%if(session.getAttribute("id")!=null){ %>

<ul>
    <li><a href="#home" style="text-align:center"><img class="img1" src="emp.PNG" /><br>employee name</a></li>
  <li><a class="active" href="client_dashboard.jsp">Dashboard</a></li>

  <li><a href="client_profile.jsp">Profile</a></li>
</ul>
<div class="headder" > 
  <h2> PROFILE SECTION</h2>
  <div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
  </div>
<div class="main1" ><div class="divinfo">Project Information</div><br>
  
	<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT `P_ID`,`P_Name`, `client_details_table`.`Client_Name`, `Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date` FROM `project_detail_table`,`client_details_table` WHERE client_details_table.Client_ID='"+session.getAttribute("id")+"' AND client_details_table.Client_ID=project_detail_table.Client_ID");
	out.println("<center>");
	out.println("<table class='table1'>");
	out.println("<tr><th>Client Name</th><th>Project</th><th>Project type</th><th>project_work_state</th><th>Start</th><th>End</th></tr>");
	while(rs.next())
	{
	out.println("<tr><td>"+rs.getString("client_details_table.Client_Name")+"</td><td>"+rs.getString("P_Name")+"</td><td>"+rs.getString("Project_Type")+"</td><td>"+rs.getString("Project_Working_Status")+"</td><td>"+rs.getString("Start_Date")+"</td><td>"+rs.getString("End_Date")+"</td><td>");
	}
	out.println("</table></center><br><br>");

	%>
	
	
  </div>

			
	
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>