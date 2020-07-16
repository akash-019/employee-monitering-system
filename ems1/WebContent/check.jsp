<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*,java.io.*,java.util.*" %>
    <%@ page import="java.lang.* ,java.text.DateFormat, java.text.SimpleDateFormat,java.time.LocalDateTime,java.time.format.DateTimeFormatter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Authenticating....</title>
</head>
<body>
<%		try
		{		String id=request.getParameter("id");
				String password=request.getParameter("Password");
				String roll=request.getParameter("Roll");
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","");
				Statement st;
				ResultSet rs;
				if(request.getParameter("Roll").compareTo("1")==0)
				{
						String query="SELECT * FROM `admin_login` where `Admin_ID`='"+id+"'";
						 st=con.createStatement();
						 rs=st.executeQuery(query);
						//for admin identification
						while(rs.next())
						{	String aid=rs.getString("Admin_Id");
							String ap=rs.getString("Admin_password");
							
							if(aid.compareTo(id)==0 && ap.compareTo(password)==0)
							{
							session.setAttribute("id",aid);
							session.setAttribute("password", ap);
							response.sendRedirect("http://localhost:8080/ems1/admin/admin_dashboard.jsp");
							}
							else
							{	
								response.sendRedirect("http://localhost:8080/ems1/index.jsp");
								session.setAttribute("wrong","wrong");
							}
							
						}	rs.close();
				}
				//for client identification
				if(request.getParameter("Roll").compareTo("2")==0)
				{
						String query1="SELECT `Client_ID`,`Password` FROM `client_details_table` where `Client_ID`='"+id+"'";
						 st=con.createStatement();
						rs=st.executeQuery(query1);
						while(rs.next())
						{		String cid=rs.getString("Client_ID");
								String cp=rs.getString("Password");
							if(cid.compareTo(id)==0 && cp.compareTo(password)==0)
							{		session.setAttribute("id",cid);
									response.sendRedirect("http://localhost:8080/ems1/client/client_dashboard.jsp");
							}
							else
							{	
								response.sendRedirect("http://localhost:8080/ems1/index.jsp");
								session.setAttribute("wrong","wrong");
							}
						}	rs.close();
				}	
					//for employee idetification
				if(request.getParameter("Roll").compareTo("3")==0)
				{
					String query2="SELECT `Password`, `R_ID`, `Is_Allow` FROM `registration_table` WHERE `R_ID`='"+id+"'";
					 st=con.createStatement();
					 rs=st.executeQuery(query2);
					 String all="Active";
							while(rs.next())
							{	String eid=rs.getString("R_ID");
								String ep=rs.getString("Password");
								String allow=rs.getString("Is_Allow");
								
								
							if(eid.compareTo(id)==0 && ep.compareTo(password)==0 && allow.compareToIgnoreCase(all)==0)
							{		session.setAttribute("id",eid);
									out.println("hello");
									 final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");
									 LocalDateTime now = LocalDateTime.now();
									 final DateTimeFormatter datefor = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									 LocalDateTime now1 = LocalDateTime.now();
								    String time=(String)dtf.format(now);
								    String date=(String)datefor.format(now1);
								   
								    if(time.compareTo("09:00")<=0)
								    {	ResultSet re=st.executeQuery("select Date From attendance_table where R_ID='"+eid+"' ");
								    	int f=0;
								    while(re.next())
								    	{
								    		String selectdate=re.getString("Date");
								    		if(selectdate.compareTo(date)==0)
								    		{	
								    			 f=1;
								    		}
								    	}
								    	if(f==0)
								    	{
										st.executeUpdate("INSERT INTO `attendance_table`(`Date`, `IP_Address`, `Shift_Time`, `In_Time`,`Attendance`, `R_ID`) VALUES  ('"+date+"','"+request.getRemoteAddr()+"','05:00','"+time+"',1,'"+eid+"')");
								    	}
								    	else
								    	{
								    		st.executeUpdate("update  `attendance_table` set In_Time='"+time+"' where R_ID='"+eid+"' AND Date='"+date+"'");
								    	}
										response.sendRedirect("http://localhost:8080/ems1/employee/employee_dashboard.jsp");
								    }else
								    {	
								    	ResultSet re=st.executeQuery("select Date From attendance_table where R_ID='"+eid+"' ");
								    	int f=0;
								    	while(re.next())
								    	{
								    		String selectdate=re.getString("Date");
								    		if(selectdate.compareTo(date)==0)
								    		{	
								    			 f=1;
								    		}
								    	}
								    	if(f==0)
								    	{
										st.executeUpdate("INSERT INTO `attendance_table`(`Date`, `IP_Address`, `Shift_Time`, `In_Time`,`Attendance`, `R_ID`) VALUES  ('"+date+"','"+request.getRemoteAddr()+"','05:00','"+time+"',1,'"+eid+"')");
								    	}
								    	else
								    	{
								    		st.executeUpdate("update  `attendance_table` set In_Time='"+time+"' where R_ID='"+eid+"' AND Date='"+date+"'");
								    	}
								    	
								    	
								    	
								    	int flag=0;
								    	String reason,selectdate;
								    	ResultSet re2=st.executeQuery("select `Reason_Of_Late`,`Date` from attendance_table where R_ID='"+eid+"'");
								   		while(re2.next())
								   		{	 reason=re2.getString("Reason_Of_Late");
								   			 selectdate=re2.getString("Date");
								   			if(date.compareTo(selectdate)==0)
								   			{
												if(reason==null)
												{
													flag=1;
		
												}
												else{flag=0;
													}
									   		}
								   		}
								   		if(flag==1)
								   		{
								   			response.sendRedirect("http://localhost:8080/ems1/reason.jsp");
								   		}else
								   		{
								   			response.sendRedirect("http://localhost:8080/ems1/employee/employee_dashboard.jsp");
											
								   		}
								    
								 	}
							}
							else
							{	
								response.sendRedirect("http://localhost:8080/ems1/index.jsp");
								session.setAttribute("wrong","wrong");
							}
						
						}rs.close();
						
				}
				con.close();
				
				
				
				
		}
	catch(Exception e)
		{
			out.println("enter valid details <h1><a href=index.jsp>Go Back</a><h1>");
		}
 
%>

</body>
</html>