<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>
    
<%@ include file="header.jsp" %>

<%
Querys q = new Querys();
ArrayList<Feedback> feedbackList = new ArrayList<>();
TH th = (TH) session.getAttribute("selected_th");
String title = "Feedback for TH: " + th.getName();
Connector con = new Connector();
feedbackList = q.getFeedbackTH(th, con.stmt);
%>
<h2><%=title %></h2>
<%
if (feedbackList.size() == 0){
	%> <h3>There is no feedback for this listing.</h3>
	<%
}
else{
	for (Feedback fb: feedbackList){
		String feedback = fb.toString();
		%> <p><%=feedback %></p>
		<%
	}
}
%>

<%@ include file="footer.jsp" %>