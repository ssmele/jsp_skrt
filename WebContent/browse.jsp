<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>    
    
<form action="main.jsp">
	<p> Please enter max price <p>
	<input type="number" name="max_price"/>
	<br/>
	<p> Please enter min price <p>
	<input type="number" name="min_price"/>
	<br/>
	<p> Please enter city<p>
	<input type="text" name="city"/>
	<br/>
	<p> Please enter state <p>
	<input type="text" name="state"/>
	<br/>
	<p> Please enter category <p>
	<input type="text" name="category"/>
	<br/>
	<p> Please enter keyword <p>
	<input type="text" name="keyword"/>
	<br/>
	
	<input type="submit" value="Search!"/>
</form> 
<%@ include file="footer.jsp" %>