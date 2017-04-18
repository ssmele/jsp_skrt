<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>

<%
//Do the query the user is asking for.
String limit_string = (String)request.getParameter("limit");
String type = (String)request.getParameter("type");

//Parse out the limit from the string.
int limit;
try {
	limit = Integer.parseInt(limit_string);
} catch (Exception e) {
	limit = Integer.MIN_VALUE;
}

//If the limit was bad report error message to user else we are good to go. 
if(limit == Integer.MIN_VALUE){%>
	<p> Please provide a valid max house limit! </p>
	<br>
	<a href="main.jsp">Click to return to main page!</a>
	<% 
}else{
	//Getting the necessary TH's to display. Makes use of the type and limit parameters previously retrieved to do so. 	
	Querys q = new Querys();
	Connector con = new Connector();
	UotelDriver uo = new UotelDriver();
	ArrayList<TH> ths = null;
	if(type.equals("expensive")){
		%><h4>Viewing most popular houses by category!</h4> <hr><%
		ths = q.getMostExpensive(con.stmt);
	}else if(type.equals("rated")){
		%><h4>Viewing highest rated houses by category!</h4> <hr><%
		ths = q.getHighestRated(con.stmt);
	}else if(type.equals("popular")){
		%><h4>Viewing most popular houses by category!</h4> <hr><%
		ths = q.getMostPopular(con.stmt);
	}else{
	}
	//Let this warning be its not big deal............. I thinkk. skrt skrt skrt skrt skrt skrt
	ths = uo.limitCategoryNum(ths, limit);
	session.setAttribute("th_list", ths);
	%>

	<%@ include file="displayCatOrderTH.jsp"%>
<%}%>
<%@ include file="footer.jsp"%>