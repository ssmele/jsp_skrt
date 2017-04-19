<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>

<%
ArrayList<TH> th_list = (ArrayList<TH>) session.getAttribute("th_list");
TH current_th;
if(session.getAttribute("current_th") == null){
	String th_string_num = (String)request.getParameter("th_num");
	int th_num = Integer.parseInt(th_string_num);
	current_th = th_list.get(--th_num);
	session.setAttribute("current_th", current_th);
}else{
	current_th = (TH)session.getAttribute("current_th");
}


%>
<h1>Below are the current attributes of the th you selected. To update the values type the new value in the box below them</h1>
<form action="alterTHProcessor.jsp" method="post">
	Current category: <%=current_th.getCategory()%>
	<br/>
	<input type="text" name="category" />
	<br/>
	Current price: <%=current_th.getPrice()%>
	<br/>
	<input type="number" name="price"/>
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
	<input type="hidden" name="adding" value="true">
	<input type="submit" value="Update!"/>
</form>
<br/>
<h2>
To alter keywords and availabitities click on the coresponding button below!
</h2>
<ul>
	<li><input type="button" value="Alter keywords on this TH" onclick="location.href='alterKeywords.jsp'"/></li>
	<li><input type="submit" value="Alter availabilities on this TH" onClick="location.href='alterAvailabilities.jsp'"/></li>
</ul>
<br>
<a href="alter.jsp">Click to go back to altering your THs!</a>
<%@ include file="footer.jsp"%>