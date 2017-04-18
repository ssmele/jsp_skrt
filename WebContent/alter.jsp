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

<form action="thSelected.jsp">
<label>
	Number of TH you want to alter:
   <input type="number">
</label>
</form>

<%}else{%>
<p> You dont have any TH's to alter!
<%}%>
<%@ include file="footer.jsp" %>