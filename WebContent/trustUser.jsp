<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.sql.Date, java.time.LocalDate"%>
    
<%@ include file="header.jsp" %>

<%
TH th = (TH) session.getAttribute("selected_th");
Feedback feedback = (Feedback) session.getAttribute("selected_feedback");
String title = "You have tried to trust/not-trust " + feedback.getLogin();
int value = Integer.parseInt(request.getParameter("trusted"));
Boolean trusts = false;
if (value == 1){
	trusts = true;
}
Connector con = new Connector();
Querys q = new Querys();
String result = q.trustUser(header_user.getLogin(), feedback.getLogin(), trusts, con.stmt);
%>

<h2><%=title %></h2>
<p><%=result %></p>

<%@ include file="footer.jsp" %>