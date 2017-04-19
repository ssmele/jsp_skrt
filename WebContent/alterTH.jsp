<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>

<%
String th_string_num = (String)request.getParameter("th_num");
int th_num = Integer.parseInt(th_string_num);
ArrayList<TH> th_list = (ArrayList<TH>) session.getAttribute("th_list");
TH current_th = th_list.get(--th_num);
session.setAttribute("current_th", current_th);
/*
System.out.println("0.Done (When you want to stop updating)");
				System.out.println("1.Category");
				System.out.println("2.Price");
				System.out.println("3.Year_Built");
				System.out.println("4.Name");
				System.out.println("5.Address");
				System.out.println("6.Url");
				System.out.println("7.Phone");
				System.out.println("8.Keywords");
				System.out.println("9. Availabilities");
*/
//String category = request.getParameter("category");
//String Price = request.getParameter("price");
//String year_buitl = request.getParameter("year_built");
//String name = request.getParameter("name");
//String address = request.getParameter("address");
//String url = request.getParameter("url");
//String phone = request.getParameter("phone");
%>
<h1>Below are the current attributes of the th you selected. To update the values type the new value in the box below them</h1>
<form action="alterTHProcessor.jsp">
	Current category: <%=current_th.getCategory()%>
	<br/>
	<input type="text" name="category" />
	<br/>
	Current price: <%=current_th.getPrice()%>
	<br/>
	<input type="text" name="price"/>
	<br/>
	Current name: <%=current_th.getName()%>
	<br/>
	<input type="text" name="name"/>
	<br/>
	Current address: <%=current_th.getAddress()%>
	<br/>
	<input type="text" name="address"/>
	<br/>
	Current url: <%=current_th.getUrl()%>
	<br/>
	<input type="text" name="url"/>
	<br/>
	Current phone: <%=current_th.getPhone()%>
	<br/>
	<input type="text" name="phone"/>
	<br/>
	Current year built: <%=current_th.getYear_built()%>
	<br/>
	<input type="text" name="year_built"/>
	<br/>
	<input type="submit" value="Update!"/>
</form>
<br/>
<h2>
To alter keywords and availabitities click on the coresponding button below!
</h2>
<ul>
	<li><input type="button" value="Alter keywords on this TH" onclick="location.href='alterKeywords.jsp'"/></li>
	<li><input type="submit" value="Alter availabilities on this TH" onClick="location.href='alterAvailabilies.jsp'"/></li>
</ul>
<%@ include file="footer.jsp"%>