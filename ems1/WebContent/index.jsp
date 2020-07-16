<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.net.*,java.awt.*" %>
      <%
            String hostname, serverAddress;
            hostname = "error";
            serverAddress = "error";
            try {
                InetAddress inetAddress;
                inetAddress = InetAddress.getLocalHost();
                hostname = inetAddress.getHostName();
                serverAddress = inetAddress.toString();
                session.setAttribute("ip",serverAddress);
            } catch (UnknownHostException e) {

                e.printStackTrace();
            }
            %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log in</title>
<head>
  <title>Login Form</title>
  
      <link rel="stylesheet" href="style.css">
  
</head>

<body>

	
	<div class="pen-title">
		<h1>Login Form</h1>
	</div>
	<div class="container">
		<div class="card"></div>
		<div class="card">
			<h1 class="title">Login</h1>
			<form action="check.jsp" method="POST">
				<div class="input-container">
					<input type="number" name="id" required="required"/>
					<label>UserName</label>
					<div class="bar">
					</div>
				</div>
				<div class="input-container">
					<input type="password" name="Password" required="required"/>
					<label>Password</label>
					<div class="bar">
					</div>	
				</div>
				<div class="radio">
					<label>Roll : </label>
					<input type="radio" checked="checked" name="Roll"  value="1">Admin
					<input type="radio" name="Roll" value="2" >Client
					<input type="radio" name="Roll" value="3">Emp
					<div class="bar">
					</div>	
				</div>
				
				<% if(session.getAttribute("wrong")=="wrong"){	%>
			<h5 style="color:red"><center>Check Username & Password</center></h5>
			<%}session.removeAttribute("wrong"); %>
				<div class="button-container">
					<button><span>Go</span></button>
				</div>
				
			</form>
			
		</div>
	</div>
</body>
</html>