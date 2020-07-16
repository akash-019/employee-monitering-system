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
<div class="headder" > <h2>CLIENT SECTION</h2>
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
<div class="main1">Client operation result <br>
<%
 if(session.getAttribute("cNew")!=null)
{

	

	try
	{String cname=null,email=null,pass=null;
	String mobile;
	String cpname;
	cname=request.getParameter("name");
	email=request.getParameter("email");
	pass=request.getParameter("password");
	mobile=request.getParameter("num");
	cpname=request.getParameter("cpname");
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="INSERT INTO `client_details_table`( `Client_Name`, `Email_ID`, `Password`, `Mobile_Number`, `Client_Project_Name`) VALUES ('"+cname+"','"+email+"','"+pass+"','"+mobile+"','"+cpname+"')";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("Client add successfully");	
		}
	
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("cNew");
	
}









if(session.getAttribute("cModify")!=null)
	{	String  cname=null,cemail=null,cpass=null,cmobile=null;
		String cproname=null;
		
		String name=null,email=null,pass=null;
		String c_id=null;
		String mobile=null,cpname=null;
		name=request.getParameter("cname");
		email=request.getParameter("email");
		pass=request.getParameter("pass");
		mobile=request.getParameter("mobile");
		cpname=request.getParameter("cpname");
		
	try
	{ c_id=request.getParameter("C_ID");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `Client_Name`, `Email_ID`, `Password`, `Mobile_Number`, `Client_Project_Name`  FROM `client_details_table` WHERE Client_ID='"+c_id+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	int i=0;
	
	while(re.next())
	{	 cname=re.getString("Client_Name");
		 cemail=re.getString("Email_ID");
		 cpass=re.getString("Password");
		 cmobile=re.getString("Mobile_Number");
		 cproname=re.getString("Client_Project_Name");
	
	}
				if(!name.equalsIgnoreCase(cname))
				{	
					st.executeUpdate("UPDATE `client_details_table` SET `Client_Name`='"+name+"' where `Client_ID`='"+c_id+"'");i++;
				}
				if(!email.equalsIgnoreCase(cemail))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Email_ID`='"+email+"' where `Client_ID`='"+c_id+"'");i++;
				}
				if(!pass.equalsIgnoreCase(cpass))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Password`='"+pass+"' where `Client_ID`='"+c_id+"'");i++;
				}
				if(!mobile.equalsIgnoreCase(cmobile))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Mobile_Number`='"+mobile+"' where `Client_ID`='"+c_id+"'");i++;
				}
				if(!cpname.equalsIgnoreCase(cproname))
				{
					st.executeUpdate("UPDATE `client_details_table` SET `Client_Project_Name`='"+cpname+"' where `Client_ID`='"+c_id+"'");i++;
				}
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("cModify");
	
}



if(session.getAttribute("cRemove")!=null)
{
	String id=request.getParameter("Dept_id");
	

	try
	{	String cid=null;
	cid=request.getParameter("c_id");
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="delete from  `client_details_table` where `Client_ID`='"+cid+"'";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("<h3>client remove successfully</h3>");	
		}
		
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("cRemove");
	
}
%><a href="admin_client.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>


<%//response.sendRedirect("http://localhost:8080/ems1/admin/admin_client.jsp"); %>

<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>