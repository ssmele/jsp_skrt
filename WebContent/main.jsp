<%@ page language="java" import="cs5530.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Uotel</title>
</head>
<body>
	<%
	//Gather up some needed variables.
	Querys q = new Querys();
	Connector con = new Connector();
	String login = request.getParameter("login");
	String register = request.getParameter("register");
	
	//Try to login the user/ register them depending on the hidden variable passed in.
	User current_user = null;
	if(login != null){
		current_user = q.loginUser(request.getParameter("username"), request.getParameter("password"), con.stmt);
	}else if(register != null){
		current_user = q.newUser(request.getParameter("username"), request.getParameter("name"), request.getParameter("password"),
				request.getParameter("address"), request.getParameter("phone"), false, con.stmt);
	}
	
	if(current_user == null && login != null){ %>
		<h1>Their was a problem loginning you in please try again by following this link.</h1>
		<a href="login.jsp"> Retry!</a>
	<%}else if (current_user == null && register != null){%>
		<h1>Their was a problem registering a new user please try again by following this link.</h1>
		<a href="login.jsp"> Retry!</a>
	<%}else{
	session.setAttribute("user", "swag");
	%>
	<h1> Welcome to the uotel login <%=request.getParameter("username")%>!</h1>
	<ul>
		<li><input type="button" value="Logout and Review" onclick="location.href='logout.jsp'"/></li>
		<li><input type="submit" value="Create a listing."/></li>
		<li><input type="submit" value="Alter a listing"/></li>
		<li><input type="submit" value="Record a stay"/></li>
		<li><input type="submit" value="Search for a house"/></li>
		<li><input type="submit" value="View most popular houses by category"/></li>
		<li><input type="submit" value="View most expensive by category"/></li>
		<li><input type="submit" value="Vies highest rated by category"/></li>
	</ul>	
	<%} %>
</body>
</html>