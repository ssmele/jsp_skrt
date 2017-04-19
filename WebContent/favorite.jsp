<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.time.LocalDate, java.sql.Date" %>
<%@ include file="header.jsp"%>

<%
TH th = (TH) session.getAttribute("selected_th");
Querys q = new Querys();
Connector con = new Connector();
String result = q.favoriteTH(th, header_user.getLogin(), 
		Date.valueOf(LocalDate.now()), con.stmt);
String thName = th.getName();
%>

<h1><%=thName %></h1>
<h3><%=result %></h3>
<button type="button" name="back" onclick="history.back()">back</button>

<%@ include file="footer.jsp" %>