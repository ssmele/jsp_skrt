<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*"%>
<%@ include file="header.jsp" %>

<%
ArrayList<Reservation> visitCart = (ArrayList<Reservation>) session.getAttribute("visit_cart");
ArrayList<ResPeriodPair> reservationCart = (ArrayList<ResPeriodPair>) session.getAttribute("reservation_cart");
Querys q = new Querys();


int remove_number;
if(request.getParameter("remove_visit") != null){
	remove_number = Integer.parseInt(request.getParameter("remove_visit"));
	visitCart.remove(--remove_number);
	session.setAttribute("visit_cart", visitCart);
}

if(request.getParameter("remove_res") != null){
	remove_number = Integer.parseInt(request.getParameter("remove_res"));
	reservationCart.remove(--remove_number);
	session.setAttribute("reservation_cart", reservationCart);
}

%>

<h1> Summary Page</h1>
<hr>
<h2> Reservations </h2>
<%
if(reservationCart.isEmpty()){
	%><p> No reservations in your cart!</p><%	
}else{
	%><p>Below are a list of current reservations in  your cart click on one to remove it.</p><%
	int count = 1;
	for(ResPeriodPair res: reservationCart){%>
		<input type="button" value="Reservation: <%=res.getReservation().toString()%>, Period: <%=res.getPeriod().toString()%>" onclick="location.href='logout.jsp?remove_res=<%=count%>'"/>
		<br>
	<%
	count++;
	}
}
%>
<hr>
<h2> Visits </h2>
<%
if(visitCart.isEmpty()){
	%><p> No visits in your cart!</p><%	
}else{
	%><p>Below are a list of current visits in  your cart click on one to remove it.</p><%
	int count = 1;
	for(Reservation res: visitCart){%>
		<input type="button" value="<%=res.toString()%>" onclick="location.href='logout.jsp?remove_visit=<%=count%>'"/>
		<br>
	<%
	count++;
	}
}
%>

<hr>
<h4> Click the button checkout button when you have completed editing your selection. </h4>
<input type="submit" value="CHECKOUT!" onclick="location.href='checkout.jsp'"/>

<%@ include file="footer.jsp" %>