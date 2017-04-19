<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%
Querys q = new Querys();
Connector con = new Connector();
ArrayList<Reservation> unstayedReservations = q.getUnstayedReservation(header_user, con.stmt);
session.setAttribute("res_list", unstayedReservations);
ArrayList<Reservation> visit_cart = (ArrayList<Reservation>)session.getAttribute("visit_cart");


int add_number;
if(request.getParameter("add") != null){
	//Retrive the number we want to add to the 
	add_number = Integer.parseInt(request.getParameter("add"));
	Reservation res = unstayedReservations.get(--add_number);
	visit_cart.add(res);
	session.setAttribute("visit_cart", visit_cart);
}


if(unstayedReservations == null || unstayedReservations.isEmpty() || unstayedReservations.size() == visit_cart.size()){%>
<p> You have no reservations to record stays for!</p>
<%}else{
%><p>Click on the reservation in which you would like to record a stay for.</p><%
int count = 1;
for(final Reservation res : unstayedReservations){
	
	//First part is to check and see if the reservation is already within the visit cart.
	boolean alreadyInCart = false;
	if(!visit_cart.isEmpty()){
		for(Reservation visit_res : visit_cart){
			if(visit_res.getRid() == res.getRid()){
				alreadyInCart = true;
			}
		}
	}
	
	if(!alreadyInCart){
		%>
		<input type="button" value="From: <%=res.getFrom().toString()%>, To: $<%=res.getTo().toString()%>, price: <%=res.getPrice_per_night()%>" onclick="location.href='recordStay.jsp?add=<%=count%>'"/>
		<br> 
	<%
	}
	count++;
}
}
%>
<%@ include file="footer.jsp"%>