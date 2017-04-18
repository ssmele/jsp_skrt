<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.io.*"%>
<%@ include file="header.jsp" %>

<form action="mostList.jsp">
	<p> What is the max number of houses you would like displayed per category? </p>
	<input type="number" name="limit"/>
	<br/>
	<input type="hidden" name="type" value="<%=request.getParameter("type")%>" />
	<input type="submit" value="View!"/>
</form>


<%@ include file="footer.jsp" %>