<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<%
ArrayList<Reservation> visitCart = (ArrayList<Reservation>)session.getAttribute("visit_cart");
ArrayList<ResPeriodPair> reservationCart = (ArrayList<ResPeriodPair>)session.getAttribute("reservation_cart");
Querys q = new Querys();
Connector con = new Connector();

if(reservationCart != null && reservationCart.size() > 0){
	//Do reservation addition logic.
	q.updatePeriod(con.con, reservationCart);
	q.updateAvailable(con.con, reservationCart);
	//Gather all the pids from the periods user is making reservation for.
	ArrayList<Integer> pidList = new ArrayList<>();
	for(ResPeriodPair pair: reservationCart){
		pidList.add(pair.getPeriod().getPid());
	}
	//Inserting reservations, and deleting available periods so other users can reserve th at same time.
	q.deletePeriods(pidList, con.con);
	q.insertReservations(header_user, reservationCart, con.con);
}

ArrayList<Reservation> rejected = null;
if(visitCart != null && visitCart.size() > 0){
	//Do visit addition logic
	rejected = q.insertVisits(header_user, visitCart, con.con);
}

%><h1>Congratulations you have succesfully checked out! </h1> <hr><%

//Display any failed visit loggings.
if(rejected == null){
}
else if(rejected.size() ==0){
}else{%>
	<p> Could not succesfully record the following visits. Sorry about that please try again later!</p><%
	for(Reservation res: rejected){
		%><p><%=res.toString()%></p><%
	}
}%>


<a href="index.html">Click here to exit the application!</a>

<hr>
</body>
</html>