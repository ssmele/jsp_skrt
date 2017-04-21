<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.sql.Date, java.time.LocalDate"%>
    
<%@ include file="header.jsp" %>

<%
ArrayList<Period> avaDates = (ArrayList<Period>) session.getAttribute("available_periods");
ArrayList<ResPeriodPair> reservationCart = (ArrayList<ResPeriodPair>) session.getAttribute("reservation_cart");
int index = Integer.parseInt(request.getParameter("index"));
Period intended_period = avaDates.get(index);

HashSet<Integer> pid_list = new HashSet<>();
for(ResPeriodPair pair : reservationCart){
	pid_list.add(pair.getPeriod().getPid());
}
if (pid_list.contains(intended_period.getPid())){
	%><h3>You have already made a reservation in this period. Please go Back.</h3><%
}
else{
	%><h3>Available Dates During This Period. Please Specify Two With Their Numerical Value.</h3>
	<form action="reserveResults.jsp">
	<%
	ArrayList<Date> resDates = UotelDriver.getDatesBetween(intended_period.getFrom(), intended_period.getTo());
	session.setAttribute("period_dates", resDates);
	session.setAttribute("selected_period", intended_period);
	int count = 1;
	for (Date d: resDates){
		String date = count + ".    " + String.valueOf(d);
		count++;
		%>
		<p><%=date %><p>
		<%
	}
	%>
	<br/>
	<p> Please Enter the Number of Your Desired Start Date: </p>
	<input type="number" name="start date"/>
	<br/>
	<p> Please Enter the Number of Your Desired End Date: </p>
	<input type="number" name="end date"/>	
	<br/>
	<br/>
	<input type="submit" value="Reserve!"/>
	<br/>
	<br/>
	</form>
	<%
}
%>

<%@ include file="footer.jsp" %>