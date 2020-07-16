<%@page import="java.util.Date"%>

<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
    <%@ page import="java.sql.*,java.lang.*,java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMS</title>

 
<link rel="stylesheet" href="style2.css" />
</head>
<body>
<% String p=null;
int flg=0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection aucon=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
Statement aust=aucon.createStatement();
ResultSet aurs=aust.executeQuery("SELECT `Admin_Password` FROM `admin_login` WHERE `Admin_Id`='"+session.getAttribute("id")+"'");
while(aurs.next())
{	
	p=aurs.getString("Admin_Password");
}
String sessionp=(String)session.getAttribute("password");
out.println(sessionp+p);
if(p!=null && sessionp!=null)
{
if(p.compareTo(sessionp)==0)
{
	flg=1;
}
}
else
{
	flg=0;
}
%>
<%if(session.getAttribute("id")!=null && flg==1){ %>

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
</ul>
<div class="headder" > <h2>DEPATMENT SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
</div>
<form action="google.com" method="post">
<div class="main1">Department operation result <br>
<%
 if(session.getAttribute("pNew")!=null)
{
	String name=request.getParameter("name");
	

	try
	{String pname=null,ptype=null,pws=null;
	String c_id;
	String sd,ed;
	pname=request.getParameter("p_name");
	c_id=request.getParameter("cid");
	ptype=request.getParameter("Ptype");
	pws=request.getParameter("pws");
	sd=request.getParameter("sd");
	ed=request.getParameter("ed");
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="INSERT INTO `project_detail_table`(`P_Name`, `Client_ID`, `Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date`) VALUES ('"+pname+"','"+c_id+"','"+ptype+"','"+pws+"','"+sd+"','"+ed+"')";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("Project add successfully");	
		}
	
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("pNew");
	
}









if(session.getAttribute("pModify")!=null)
	{	String  cpname=null,cp_id=null,cptype=null,cpws=null;
		String csd=null,ced=null;
		
		String pname=null,ptype=null,pws=null;
		String c_id;
		String sd,ed;
		pname=request.getParameter("pname");
		ptype=request.getParameter("ptype");
		pws=request.getParameter("pws");
		sd=request.getParameter("sd");
		ed=request.getParameter("ed");
		
	try
	{ String p_id=request.getParameter("P_ID");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `P_Name`, `Project_Type`, `Project_Working_Status`, `Start_Date`, `End_Date` FROM `project_detail_table` WHERE `P_ID`='"+p_id+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	int i=0;
	
	while(re.next())
	{	 cpname=re.getString("P_Name");
		 cptype=re.getString("Project_Type");
		 cpws=re.getString("Project_Working_Status");
		 csd=re.getString("Start_Date");
		 ced=re.getString("End_Date");
	
	}
				if(!pname.equalsIgnoreCase(cpname))
				{	
					st.executeUpdate("UPDATE `project_detail_table` SET `P_Name`='"+pname+"' where `P_ID`='"+p_id+"'");i++;
				}
				if(!ptype.equalsIgnoreCase(cptype))
				{
					st.executeUpdate("UPDATE `project_detail_table` SET `Project_Type`='"+ptype+"' where `P_ID`='"+p_id+"'");i++;
				}
				if(!pws.equalsIgnoreCase(cpws))
				{
					st.executeUpdate("UPDATE `project_detail_table` SET `Project_Working_Status`='"+pws+"' where `P_ID`='"+p_id+"'");i++;
				}
				if(!sd.equalsIgnoreCase(csd))
				{
					st.executeUpdate("UPDATE `project_detail_table` SET `Start_Date`='"+sd+"' where `P_ID`='"+p_id+"'");i++;
				}
				if(!ed.equalsIgnoreCase(ced))
				{
					st.executeUpdate("UPDATE `project_detail_table` SET `End_Date`='"+ed+"' where `P_ID`='"+p_id+"'");i++;
				}
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("pModify");
	
}



if(session.getAttribute("pRemove")!=null)
{
	String id=request.getParameter("Dept_id");
	

	try
	{	String pid=null;
	pid=request.getParameter("p_id");
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="delete from  `project_detail_table` where `P_ID`='"+pid+"'";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("<h3>Peoject remove successfully</h3>");	
			
		}
		
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("pRemove");
	
	
}
%>
<%response.sendRedirect("http://localhost:8080/ems1/admin/admin_project.jsp"); %>
<center><a href="admin_project.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>




<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>