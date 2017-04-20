<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*"%>
    
<%@ include file="header.jsp" %>

<%
Querys q = new Querys();
TH th = (TH) session.getAttribute("selected_th");
Connector con = new Connector();
String title = "Available date periods for TH: " + th.getName();
ArrayList<ResPeriodPair> reservationCart = (ArrayList<ResPeriodPair>) session.getAttribute("reservation_cart");

//First get dates available
ArrayList<Period> avaDates = q.getAvailability(th, con.stmt);
session.setAttribute("available_periods", avaDates);

//Gather all the pids within the reservation so we don't show periods already in the cart
HashSet<Integer> pid_list = new HashSet<>();
for(ResPeriodPair pair : reservationCart){
	pid_list.add(pair.getPeriod().getPid());
}

int count = 1;
int index = 0;
%><h3><%=title%></h3><%
for(Period p : avaDates){
	//We are only going to do this if the pid is not within the reservation cart already.
	if (!pid_list.contains(p.getPid())) {
		String listing = Integer.toString(count) + ".     Dates: " + p.getFrom().toString() + " - "
				+ p.getTo().toString() + "   Price: " + Integer.toString(p.getPrice());
		String url = "location.href='chooseReserveDates.jsp?index=" + index + "'";
		
		%>
		<h4><input type="submit" value="<%=listing%>" onClick="<%=url%>"/></h4>
		<%
		count++;
	}
	index++;
}
if(avaDates.isEmpty()){
	%><h4>There are no availabilities for this TH please try another.</h4><%
}
%>

<%@ include file="footer.jsp" %>