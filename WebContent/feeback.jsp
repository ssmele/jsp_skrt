<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.sql.Date, java.time.LocalDate"%>
    
<%@ include file="header.jsp" %>

<%
TH th = (TH) session.getAttribute("selected_th");
ArrayList<Feedback> fbs = (ArrayList<Feedback>) session.getAttribute("feedback_list");
int index = Integer.parseInt(request.getParameter("index"));
Feedback feedback = fbs.get(index);
session.setAttribute("selected_feedback", feedback);
String desc = feedback.getText();
String date = String.valueOf(feedback.getDate());
String user = feedback.getLogin();
String score = String.valueOf(feedback.getScore());
String title = user + "'s Feedback for TH: " + th.getName();
%>
<h2><%=title %></h2>
<ul>
	<li>User: <%=user %> </li>
	<li>Description: <%=desc %> </li>
	<li>Score: <%=score %> </li>
	<li>Date: <%=date %> </li>
</ul>

<%
if (header_user.getLogin().equals(user)){
	%>
	<p>You can't rate or trust on your own feedback.</p>
	<%
}
else{
	%>
	<p> Give a Rating: </p>
	<input type="submit" value="Rate as Not-Useful" onClick="location.href='rateFeedback.jsp?value=0'"/>
	<input type="submit" value="Rate as Useful" onClick="location.href='rateFeedback.jsp?value=1'"/>
	<input type="submit" value="Rate as Very-Useful" onClick="location.href='rateFeedback.jsp?value=2'"/>
	<p> Trust This User: </p>
	<input type="submit" value="Mark User as Trusted" onClick="location.href='trustUser.jsp?trusted=1'"/>
	<input type="submit" value="Mark User as Not-Trusted" onClick="location.href='trustUser.jsp?trusted=0'"/>
	<br/>
	<br/>
	<%
}
%>
<%@ include file="footer.jsp" %>