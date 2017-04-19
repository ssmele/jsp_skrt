<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>

<%
ArrayList<TH> th_list = (ArrayList<TH>) session.getAttribute("th_list");
if(th_list == null || th_list.isEmpty()){%>
<p> No th's to display.</p>
<%}else{
int count = 1;
for(TH th : th_list){%>
	<%String title = count + ". Name: " + th.getName() + " price: " + th.getPrice() + " address: " + th.getAddress(); %>
	<%String url = "location.href='viewTH.jsp?index=" + (count-1) + "'"; %>
	<p><input type="submit" value="<%=title%>" onClick="<%=url%>"/></p> 
<%
count++;
}
}%>



