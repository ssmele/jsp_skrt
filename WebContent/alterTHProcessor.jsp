<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%
String category = request.getParameter("category");
String price = request.getParameter("price");
String year_built = request.getParameter("year_built");
String name = request.getParameter("name");
String address = request.getParameter("address");
String url = request.getParameter("url");
String phone = request.getParameter("phone");
Querys q = new Querys();
Connector con = new Connector();
TH current_th = (TH)session.getAttribute("current_th");

if(category != "")
	current_th.setCategory(category);
if(price != ""){
	int real_price;
	try{
		real_price = Integer.parseInt(price);
	}catch(Exception e){
		real_price = Integer.MIN_VALUE; 
	}
	
	if(real_price != Integer.MIN_VALUE){
		current_th.setPrice(real_price);
	}else{
		%> <p> UNABLE TO UPDATE price FIELD! PLEASE PROVIDE VALID NUMBER!</p> <%
	}
}
if(year_built != "")
	current_th.setYear_built(year_built);
if(name != "")
	current_th.setName(name);
if(address != "")
	current_th.setAddress(address);
if(url != "")
	current_th.setUrl(url);
if(phone != "")
	current_th.setPhone(phone);
TH updated = q.updateTH(current_th, con.con);
//If created is not null then we throw down.
if(updated != null){
%>
	<h4>Valid fields updated!</h4>
	<br>
	<a href="alterTH.jsp">Click to go back to altering current TH!</a>
<%}else{
%> 
	<p> Could not update the fields given. </p>
	<br/>
	<a href="alterTH.jsp">Click to go back to altering current TH!</a>
<%}%>	
<%@ include file="footer.jsp"%>