<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.sql.Date, java.time.LocalDate"%>
    
<%@ include file="header.jsp" %>

<%
TH th = (TH) session.getAttribute("selected_th");
Feedback feedback = (Feedback) session.getAttribute("selected_feedback");
String title = "You have tried to rate " + feedback.getLogin() + " on TH: " + th.getName();
int rating = Integer.parseInt(request.getParameter("value"));
Connector con = new Connector();
Querys q = new Querys();
String result = q.insertRating(header_user, feedback.getFid(), rating, con.con);
%>

<h2><%=title %></h2>
<p><%=result %></p>

<%@ include file="footer.jsp" %>