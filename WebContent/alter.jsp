<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.io.*"%>
<%@ include file="header.jsp" %>


<%
Querys q = new Querys();
Connector con = new Connector();
ArrayList<TH> temp_th_list = q.getUsersTHs(header_user.getLogin(), con.stmt);
if(temp_th_list != null && !temp_th_list.isEmpty()){
session.setAttribute("th_list", temp_th_list);
%>

<%@ include file="displayTHs.jsp"%>


<form action="alterTH.jsp">
	<input type="number" name="th_num"/>
	<input type="submit" value="Choose!"/>
</form>


<%}else{%>
<p> You dont have any TH's to alter!
<%}%>
<%@ include file="footer.jsp" %>