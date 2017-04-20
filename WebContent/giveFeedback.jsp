<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<form action="giveFeedbackProcessor.jsp" method="post">
	<p> Please provide a description describing feedback you want to give for this TH: </p>
	<input type="text" name="description"/>
	<p> Please enter a score (0 = terrible, 10 = excellent) </p>
	<input type="number" name="score"/>
	<br>
	<input type="submit" value="Give Feedback!"/>
</form>

<%@ include file="footer.jsp"%>