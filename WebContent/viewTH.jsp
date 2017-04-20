<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>
    
<%@ include file="header.jsp" %>
    
<% 
ArrayList<TH> th_list = (ArrayList<TH>) session.getAttribute("th_list");
int index = Integer.parseInt(((String)request.getParameter("index")));
TH th = th_list.get(index);
session.setAttribute("selected_th", th);
String name = th.getName();
String address = th.getAddress();
String lister = th.getLogin();
String year = th.getYear_built();
String price = String.valueOf(th.getPrice());
String dateListed = "" + String.valueOf(th.getDate_listed());
String category = th.getCategory();
String phone = th.getPhone();
String url = th.getUrl();
%>
<h1> <%=name%> </h1>
<ul>
	<li> Typical Price Per Night: <%=price %> </li>
	<li> Category: <%=category %> </li>
	<li> URL: <%=url %> </li>
	<li> Address: <%=address %> </li>
	<li> Year Built: <%=year %> </li>
	<li> Listed By: <%=lister %> </li>
	<li> Date Listed: <%=dateListed %> </li>
	<li> Lister Phone: <%=phone %> </li>
</ul>
<h3> User Options: </h3>
<ul>
	<li><input type="button" value="Mark as Favorite" onclick="location.href='favorite.jsp'"/></li>
	<li><input type="button" value="View Feedback" onclick="location.href='viewFeedback.jsp'"/></li>
	<li><input type="button" value="Give Feedback" onclick="location.href='giveFeedback.jsp'"/></li>
	<li><input type="button" value="Make a Reservation" onclick="location.href='logout.jsp'"/></li>
	<li><input type="button" value="View Most Useful Feedback" onclick="location.href='limitGetter.jsp?for=fb'"/></li>
</ul>

<%@ include file="footer.jsp" %>