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
<div class="headder" > <h2>EVENT SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div>
</div>
<form action="" method="post">
<div class="main1">Event operation result <br>
<%
 if(session.getAttribute("evNew")!=null)
{

	try
	{String edate=null,etime=null,etitle=null;
	String edetails=null;
	edate=request.getParameter("edate");
	etime=request.getParameter("etime");
	etitle=request.getParameter("etitle");
	edetails=request.getParameter("edetails");
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="INSERT INTO `event_table`( `Event_Date`, `Event_Time`, `Event_Title`, `Event_Details`) VALUES('"+edate+"','"+etime+"','"+etitle+"','"+edetails+"')";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("Event add successfully");	
		}
	
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("evNew");
	
}









if(session.getAttribute("evModify")!=null)
	{	String  cdate=null,ctime=null,ctitle=null,cdetails=null;
		
		
		String date=null,time=null,title=null;
		String details=null;
		
		date=request.getParameter("date");
		time=request.getParameter("time");
		title=request.getParameter("title");
		details=request.getParameter("datails");
		
	try
	{ String e_id=request.getParameter("e_ID");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `Event_Date`, `Event_Time`, `Event_Title`, `Event_Details` FROM `event_table` WHERE `Event_ID`='"+e_id+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	int i=0;
	
	while(re.next())
	{	 cdate=re.getString("Event_Date");
		 ctime=re.getString("Event_Time");
		 ctitle=re.getString("Event_Title");
		 cdetails=re.getString("Event_Details");
	
	}
				if(!date.equalsIgnoreCase(cdate))
				{	
					st.executeUpdate("UPDATE `event_table` SET `Event_Date`='"+date+"' where `Event_ID`='"+e_id+"'");i++;
				}
				if(!time.equalsIgnoreCase(ctime))
				{
					st.executeUpdate("UPDATE `event_table` SET `Event_Time`='"+time+"' where `Event_ID`='"+e_id+"'");i++;
				}
				if(!title.equalsIgnoreCase(ctitle))
				{
					st.executeUpdate("UPDATE `event_table` SET `Event_Title`='"+title+"' where `Event_ID`='"+e_id+"'");i++;
				}
				if(!details.equalsIgnoreCase(cdetails))
				{
					st.executeUpdate("UPDATE `event_table` SET `Event_Details`='"+details+"' where `Event_ID`='"+e_id+"'");i++;
				}
				
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("evModify");
	
}



if(session.getAttribute("evRemove")!=null)
{
	String id=request.getParameter("Dept_id");
	

	try
	{	String eid=null;
	
	eid=request.getParameter("e_ID");
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="delete from  `event_table` where `Event_ID`='"+eid+"'";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("<h3>Event remove successfully</h3>");	
		}
		
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("evRemove");
	
}
%><a href="admin_event.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>

<%response.sendRedirect("http://localhost:8080/ems1/admin/admin_event.jsp"); %>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>