<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<div class="headder" > <h2>EMPLOYEE SECTION</h2>
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
<div class="main1"> Employee operation result<br>
<%
	
 if(session.getAttribute("eregister")!=null)
{

	try
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String bdate=request.getParameter("bdate");
		String deptid=request.getParameter("did");
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="INSERT INTO registration_table(`Name`, `Email_ID`, `Password`, `Gender`, `Address`, `Mobile_No`,`Birthday`,`Dept_ID`) VALUES ('"+name+"','"+email+"','"+password+"','"+gender+"','"+address+"','"+mobile+"','"+bdate+"','"+deptid+"')";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("employee add successfully");	
		}
		else				
		{
			out.println("record not inserted");
		}
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("eregister");
	
}









if(session.getAttribute("eupdate")!=null)
{	try{
	String id=request.getParameter("id");
	int i=0;
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String address=request.getParameter("address");
	String mobile=request.getParameter("mobile");
	String bdate=request.getParameter("bdate");
	String deptid=request.getParameter("did");
	
	String cname=null,cemail=null,cpassword=null,caddress=null,cmobile=null,cbdate=null,cdeptid=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `Name`, `Email_ID`, `Password`, `Address`, `Mobile_No`,`Birthday`,`Dept_ID` from registration_table where R_ID='"+id+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	while(re.next())
	{
		cname=re.getString("Name");
		cemail=re.getString("Email_ID");
		cpassword=re.getString("Password");
		caddress=re.getString("Address");
		cmobile=re.getString("Mobile_No");
		cbdate=re.getString("Birthday");
		cdeptid=re.getString("Dept_ID");
	}	
		if(!name.equalsIgnoreCase(cname))
		{
			st.executeUpdate("UPDATE registration_table set `Name`='"+name+"' where `R_ID`='"+id+"' ");i++;
		}
		if(!email.equalsIgnoreCase(cemail))
		{
			st.executeUpdate("UPDATE registration_table set `Email_ID`='"+email+"' where `R_ID`='"+id+"' ");i++;
		}
		if(!password.equalsIgnoreCase(cpassword))
		{
			st.executeUpdate("UPDATE registration_table set `Password`='"+password+"' where `R_ID`='"+id+"' ");i++;
		}
		if(!address.equalsIgnoreCase(caddress))
		{
			st.executeUpdate("UPDATE registration_table set `Address`='"+address+"' where `R_ID`='"+id+"' ");i++;
		}
		if(!mobile.equalsIgnoreCase(cmobile))
		{
			st.executeUpdate("UPDATE registration_table set `Mobile_No`='"+mobile+"' where `R_ID`='"+id+"' ");i++;
		}
		if(!bdate.equalsIgnoreCase(cbdate))
		{
			st.executeUpdate("UPDATE registration_table set `Birthday`='"+bdate+"' where `R_ID`='"+id+"' ");i++;
		}
		if(!deptid.equalsIgnoreCase(cdeptid))
		{
			st.executeUpdate("UPDATE registration_table set `Dept_ID`='"+deptid+"' where `R_ID`='"+id+"' ");i++;
		}
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
		}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("eupdate");
	
}



if(session.getAttribute("edelete")!=null)
{
	String id=request.getParameter("id");
	

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
		String query="delete from  registration_table where R_ID='"+id+"' ";
		Statement st=con.createStatement();
		int result=st.executeUpdate(query);
		con.close();
		if(result!=0)
		{
			out.println("<h3>employee remove successfully</h3>");	
		}
		else				
		{
			out.println("record not inserted");
		}
		con.close();
	}
		catch(Exception e)
		{
			out.println(e);
		}
	session.removeAttribute("edalete");
	
}
%><a href="admin_employees.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>


<%response.sendRedirect("http://localhost:8080/ems1/admin/admin_employees.jsp"); %>

<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>