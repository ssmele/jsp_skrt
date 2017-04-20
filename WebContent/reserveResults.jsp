<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs5530.*, java.util.*, java.sql.Date, java.time.LocalDate"%>
    
<%@ include file="header.jsp" %>

<%

int startIndex = Integer.parseInt(request.getParameter("start date")) - 1;
int endIndex = Integer.parseInt(request.getParameter("end date")) - 1;
ArrayList<Date> resDates = (ArrayList<Date>) session.getAttribute("period_dates");
Date startDate = resDates.get(startIndex);
Date endDate = resDates.get(endIndex);
Period intended_period = (Period) session.getAttribute("selected_period");
TH th = (TH) session.getAttribute("selected_th");
Reservation new_res = new Reservation(intended_period.getPid(), startDate, endDate,
		intended_period.getPrice(), header_user.getLogin(), th.getHid()); 
new_res.setPeriodsToAdd(UotelDriver.generatePeriodChanges(intended_period, startDate, endDate));
intended_period.setFrom(startDate);
intended_period.setTo(endDate);

ArrayList<ResPeriodPair> reservationCart = (ArrayList<ResPeriodPair>) session.getAttribute("reservation_cart");
reservationCart.add(new ResPeriodPair(new_res, intended_period));
session.setAttribute("reservation_cart", reservationCart);

String title = "Your reservation has been added to the cart at " + th.getName() + " during  " 
		  + new_res.getFrom().toString() 
		  + " to " 
        + new_res.getTo().toString()
        + " for " + Integer.toString(new_res.getPrice_per_night()) + " a night!";
Querys q = new Querys();
Connector con = new Connector();
ArrayList<TH> th_list = q.getSuggestedTHS(con.stmt, th, header_user);
session.setAttribute("suggestions", th_list);
%>

<h3><%=title %></h3>
<br/>
<h3>Here is a list of THs based on your reservation: </h3>
<%
if(th_list == null || th_list.isEmpty()){%>
<p> No suggestions to display.</p>
<%}else{
int count = 1;
for(TH t : th_list){%>
	<%String temp = count + ". Name: " + t.getName() + " price: " + t.getPrice() + " address: " + t.getAddress(); %>
	<%String url = "location.href='viewTH.jsp?index=" + (count-1) + "&suggested=true'"; %>
	<p><input type="submit" value="<%=temp%>" onClick="<%=url%>"/></p> 
<%
count++;
}
}%>

<%@ include file="footer.jsp" %>