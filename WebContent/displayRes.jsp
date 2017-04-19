<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>

<%
ArrayList<Reservation> res_list = (ArrayList<Reservation>) session.getAttribute("res_list");
if(res_list == null || res_list.isEmpty()){%>
<p> You have not reservations currently!</p>
<%}else{
int count = 1;
for(Reservation res : res_list){%>
	<p><%=count%>. From: <%=res.getFrom().toString()%>, To: $<%=res.getTo().toString()%>, price: <%=res.getPrice_per_night()%> </p> 
<%
count++;
}
}%>



