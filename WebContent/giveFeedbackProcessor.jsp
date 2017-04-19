<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.time.LocalDate, java.sql.*"%>
<%@ include file="header.jsp"%>
<%
String desc = request.getParameter("desc");
String score_string = request.getParameter("score");

int score;
try{
	score = Integer.parseInt(score_string);
}catch(Exception e){
	score = Integer.MIN_VALUE;
}

Date date = Date.valueOf(LocalDate.now());
TH current_th = (TH)session.getAttribute("selected_th");
Querys q = new Querys();
Connector con = new Connector();

if(score == Integer.MIN_VALUE){
	%><p>Could not rate feedback bad score given.</p><%
}else{
	String result = q.insertFeedback(header_user, current_th, desc, score, date, con.con);
	%><p><%=result%></p><%
}
%>
<%@ include file="footer.jsp"%>