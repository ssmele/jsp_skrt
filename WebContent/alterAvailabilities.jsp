<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.Date"%>
<%@ include file="header.jsp"%>
<%
TH current_th = (TH)session.getAttribute("current_th");
Querys q = new Querys();
Connector con = new Connector();
ArrayList<Period> periods = q.getAvailability(current_th, con.stmt);

int remove_number;
if(request.getParameter("remove") != null){
	remove_number = Integer.parseInt(request.getParameter("remove"));
	q.removeAvailable(con.stmt, current_th.getHid(), periods.get(--remove_number).getPid());
	periods = q.getAvailability(current_th, con.stmt);
}

if(request.getParameter("from_date_to_add") != null && request.getParameter("to_date_to_add") != null && request.getParameter("price_per_night") != null){
	String from_string = request.getParameter("from_date_to_add");
	String to_string = request.getParameter("to_date_to_add");
	String price_per_night = request.getParameter("price_per_night");
	
	Date from_date;
	Date to_date;
	int price;
	boolean failed = false;
	try{
		from_date = Date.valueOf(from_string);
		to_date = Date.valueOf(to_string);
		price = Integer.parseInt(price_per_night);
	}catch(Exception e){
		failed = true;
	}
	
	if(!failed){
		Period new_period = new Period(0, Date.valueOf(from_string), Date.valueOf(to_string), Integer.parseInt(price_per_night));
		q.insertAvailability(current_th, new_period, con);
		periods = q.getAvailability(current_th, con.stmt);
	}else{
		%><p style="color:#FF0000"> Invalid entry for the availabilty please try agin. Remember the date format, and only provide a numbers for the price per night.<%
	}
}


if(periods.isEmpty()){
	%><p> No availabilities to alter!</p><%	
}else{
	%><p>Below are a list of availabilities for this TH. Click one to remove it from the TH!</p><%
	int count = 1;
	for(Period per : periods){%>
		<input type="button" value="Start:<%=per.getFrom().toString()%>, End:<%=per.getTo().toString()%>, Price per night:<%=per.getPrice()%>" onclick="location.href='alterAvailabilities.jsp?remove=<%=count%>'"/>
		<br>
	<%
	count++;
	}
}
%>

<form action="alterAvailabilities.jsp" method="post">
	<p>Type in the availability information you would like to add! The format should be "YYYY-MM-DD"</p>
	<p>From date: </p>
	<input type="date" name="from_date_to_add"/>
	<br/>
	<p>To date: </p>
	<input type="date" name="to_date_to_add"/>
	<br/>
	<p>Price per night: </p>
	<input type="number" name="price_per_night"/>
	<br/>
	<input type="submit" value="Add!"/>
</form>
<br/>
<a href="alterTH.jsp">Click to go back to altering current TH!</a>

<%@ include file="footer.jsp"%>