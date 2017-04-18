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
	Querys q = new Querys();
	Connector con = new Connector();
	User current_user = q.loginUser(request.getParameter("username"), request.getParameter("password"), con.stmt);
	
	if(current_user == null){ %>
		<h1>Looks like username and password were not valid please follow this link to try again.</h1>
		<a href="login.jsp"> Retry!</a>
	<%}else{%> 
	
	<h1> Welcome to the uotel login <%=request.getParameter("username")%>!</h1>
	<ul>
		<li><input type="submit" value="Logout and Review"/></li>
		<li><input type="submit" value="Create a listing."/></li>
		<li><input type="submit" value="Alter a listing"/></li>
		<li><input type="submit" value="Record a stay"/></li>
		<li><input type="submit" value="Search for a house"/></li>
		<li><input type="submit" value="View most popular houses by category"/></li>
		<li><input type="submit" value="View most expensive by category"/></li>
		<li><input type="submit" value="Vies highest rated by category"/></li>
	</ul>
	<%
	if(current_user.isAdmin()){ %>
		<h3>Admin Options</h3>
		<ul>
			<li><input type="submit" value="View top m 'trusted' users."/></li>
			<li><input type="submit" value="View top m 'useful' users."/></li>
		</ul>
	<%}%>	
	<%} %>
</body>
</html>