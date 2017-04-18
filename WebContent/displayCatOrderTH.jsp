<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>

<%
ArrayList<TH> th_list = (ArrayList<TH>) session.getAttribute("th_list");
if(th_list == null || th_list.isEmpty()){%>
<p> No th's to display.</p>
<%}else{
int count = 1;
String category = "";
for(TH th : th_list){
	if(true){
		if(!category.equals(th.getCategory())){
			category = th.getCategory();
			%> <h4> <%=category %></h4> <%
		}
	}
%>
	<p><%=count%>. name: <%=th.getName()%>, price: $<%=th.getPrice()%>, address: <%=th.getAddress()%> </p> 
<%
count++;
}
}%>