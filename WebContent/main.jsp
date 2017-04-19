<%@ page language="java" import="cs5530.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Uotel</title>
</head>
<body>
	<%
	//Initalize needed variables.
	User current_user = null;
	String login;
	String register;
	
	//If the user session is equal to null need to check if ur is signing in or logining in.
	//If they get to the else it means that they have traveled here from another page 
	if(request.getParameter("login")!= null){
		Querys q = new Querys();
		Connector con = new Connector();
		login = request.getParameter("login");
		register = request.getParameter("register");
	
		//Try to login the user/ register them depending on the hidden variable passed in.
		if(login != null){
			current_user = q.loginUser(request.getParameter("username"), request.getParameter("password"), con.stmt);
		}else if(register != null){
			current_user = q.newUser(request.getParameter("username"), request.getParameter("name"), request.getParameter("password"),
					request.getParameter("address"), request.getParameter("phone"), false, con.stmt);
		}
		
		session.setAttribute("user", current_user);
		session.setAttribute("visit_cart", new ArrayList<Reservation>());
		session.setAttribute("reservation_cart", new ArrayList<ResPeriodPair>());
		session.setAttribute("current_th", null);
		session.setAttribute("th_list", null);
	}else{
		//Try and get the user object out to see the preexisting user.
		//Also need to reset session variables here that could be used later on.
		login = null;
		register = null;
		current_user = (User)session.getAttribute("user");
		session.setAttribute("current_th", null);
		session.setAttribute("th_list", null);
	}
	
	//This logic decides what needs to be displayed.
	//Will display different error messages depending on if they are trying to sign in or not.
	if(current_user == null && login != null){ %>
		<h1>Their was a problem loginning you in please try again by following this link.</h1>
		<a href="login.jsp"> Retry!</a>
	<%}else if (current_user == null && register != null){%>
		<h1>Their was a problem registering a new user please try again by following this link.</h1>
		<a href="login.jsp"> Retry!</a>
	<%}else if(current_user != null){
	%>
	<h1> Welcome to the uotel login <%=current_user.getLogin()%>!</h1>
	<ul>
		<li><input type="button" value="Logout and Review" onclick="location.href='logout.jsp'"/></li>
		<li><input type="submit" value="Create a listing" onClick="location.href='createListing.jsp'"/></li>
		<li><input type="submit" value="Alter a listing" onclick="location.href='alter.jsp'"></li>
		<li><input type="submit" value="Record a stay" onClick="location.href='recordStay.jsp'"/></li>
		<li><input type="submit" value="Search for a house"/></li>
		<li><input type="submit" value="View most popular houses by category" onClick="location.href='limitGetter.jsp?type=popular&for=th'"/></li>
		<li><input type="submit" value="View most expensive by category" onClick="location.href='limitGetter.jsp?type=expensive&for=th'"/></li>
		<li><input type="submit" value="Vies highest rated by category" onClick="location.href='limitGetter.jsp?type=rated&for=th'"/></li>
	</ul>
	<%}else{%>
		<p>Something went wrong please try again!</p>
		<br>
		<a href="login.jsp"> Click to try again!</a>
	<%}%>
<%@ include file="footer.jsp" %>