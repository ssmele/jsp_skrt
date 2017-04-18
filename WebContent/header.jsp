<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Uotel</title>
</head>
<body>

<%
User header_user = (User)session.getAttribute("user");
String username = null;
if(header_user == null){
	%> <p> Something got messed up! Please logout and try again! </p> <%
	username = "NULL";
}else{
	username = header_user.getLogin();
}
%>
<h1> Currently logged on as <%=username%> </h1>
<hr>