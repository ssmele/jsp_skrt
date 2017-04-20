<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>
    
<%@ include file="header.jsp" %>

<%
Querys q = new Querys();
ArrayList<Feedback> feedbackList = new ArrayList<>();
TH th = (TH) session.getAttribute("selected_th");
int limit = Integer.parseInt(request.getParameter("limit"));
String title = "Top " + limit + " Feedback(s) for TH: " + th.getName();
Connector con = new Connector();
feedbackList = q.mostUsefulFeedback(th, limit, con.stmt);
session.setAttribute("feedback_list", feedbackList);
%>
<h2><%=title %></h2>
<%
if (feedbackList.size() == 0){
	%> <h3>There is no feedback for this listing.</h3>
	<%
}
else{
	int count = 0;
	for (Feedback fb: feedbackList){
		String feedback = fb.toString();
		String url = "location.href='feeback.jsp?index=" + count + "'";
		%>
		<input type="submit" value="<%=feedback%>" onClick="<%=url%>"/>
		<%
		count++;
	}
}
%>

<%@ include file="footer.jsp" %>