<%@page import="java.util.Date"%>

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
<div class="headder" > <h2>PROFILE SECTION</h2>
<div class="dropdown">
    <button class="dropbtn"><img src="001.png" height=30px width=30px/>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:8080/ems1/logout.jsp">Logout</a>
    </div>
  </div></div>
<form action="" method="post">
<div class="main1">Profile operation result <br>

<%
if(session.getAttribute("valid")!=null)
{
		String  cname=null,cemail=null,cpass=null,cmobile=null;
		String cbdate=null,csname=null;
		
		String name=null,email=null,pass=null;
		String bdate=null;
		String mobile=null,sname=null;
		name=request.getParameter("name");
		email=request.getParameter("email");
		pass=request.getParameter("pass");
		mobile=request.getParameter("mobile");
		bdate=request.getParameter("bdate");
		sname=request.getParameter("sname");
		
	try
	{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
	String query="SELECT `Admin_Id`, `Admin_Name`, `Admin_Email`, `Admin_Password`, `Birthdate`, `Mobile_number`, `Short_Name`, `Admin_Image` FROM `admin_login` WHERE `Admin_Id`='"+session.getAttribute("id")+"'";
	Statement st=con.createStatement();
	ResultSet re=st.executeQuery(query);
	int i=0;
	
	while(re.next())
	{	 cname=re.getString("Admin_Name");
		 cemail=re.getString("Admin_Email");
		 cpass=re.getString("Admin_Password");
		 cmobile=re.getString("Mobile_Number");
		 csname=re.getString("Short_Name");
		 cbdate=re.getString("Birthdate");
		
	}	
				if(!name.equalsIgnoreCase(cname))
				{	
					st.executeUpdate("UPDATE `admin_login` SET `Admin_Name`='"+name+"' where `Admin_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!email.equalsIgnoreCase(cemail))
				{
					st.executeUpdate("UPDATE `admin_login` SET `Admin_Email`='"+email+"' where `Admin_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!pass.equalsIgnoreCase(cpass))
				{
					st.executeUpdate("UPDATE `admin_login` SET `Admin_Password`='"+pass+"' where `Admin_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!bdate.equalsIgnoreCase(cbdate))
				{
					st.executeUpdate("UPDATE `admin_login` SET `Birthdate`='"+bdate+"' where `Admin_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!mobile.equalsIgnoreCase(cmobile))
				{
					st.executeUpdate("UPDATE `admin_login` SET `Mobile_number`='"+mobile+"' where `Admin_Id`='"+session.getAttribute("id")+"'");i++;
				}
				if(!sname.equalsIgnoreCase(csname))
				{
					st.executeUpdate("UPDATE `admin_login` SET `Short_Name`='"+sname+"' where `Admin_Id`='"+session.getAttribute("id")+"'");i++;
				}
			con.close();
			out.println("<h3>"+i+" Field Updated</h3>");
			
		}
		catch(Exception e)
		{
			out.println(e);
		}

session.removeAttribute("valid");

}

%><a href="admin_profile.jsp">GO back</a></center>
</div>
<div class="footer1"><h3>&copy COPYRIGHT EMs Developers</h3></div>
</form>

<%response.sendRedirect("http://localhost:8080/ems1/admin/admin_profile.jsp"); %>


<%}else{response.sendRedirect("http://localhost:8080/ems1/index.jsp");} %>
</body>
</html>