<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%
//Gather up some needed variables.
Querys q = new Querys();
Connector con = new Connector();
String category = request.getParameter("category");
String year_built = request.getParameter("year_built");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String url = request.getParameter("url");
String price_per_night = request.getParameter("price_per_night");

//Parse the price per night if it wasnt succesful set the price to the min of integer.
int price;
try {
	price = Integer.parseInt(price_per_night);
} catch (Exception e) {
	price = Integer.MIN_VALUE;
}

//If price is valid go through with it.
TH created = null;
if(price != Integer.MIN_VALUE){
	created = q.newTh(category, year_built, name, address, url, phone, price, header_user, con.con);
}else{
	%><p>Bad price make sure it's a number.</p><%
}

//If created is not null then we throw down.
if(created != null){%>
	<h4>New listing created succesfully!</h4>
	<a href="main.jsp">Click to return to main page!</a>
	<br>
	<a href="createListing.jsp"> Click to add another listing.! </a>
<%}else{%> 
	<p> Could not succesfully create new list please try again! </p>
	<a href="createListing.jsp"> Click to try again! </a>
	<br>
	<a href="main.jsp">Click to return to main page!</a>
<%}%>

<%@ include file="footer.jsp"%>