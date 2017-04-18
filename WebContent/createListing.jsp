<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<h2>
Please provide information for new listing.
</h2>
<form action="createListingProcessor.jsp">
	<p>Category:</p>
	<input type="text" name="category"/>
	<br/>
	<p>Year Built:</p>
	<input type="text" name="year_built"/>
	<br/>
	<p>Name:</p>
	<input type="text" name="name"/>
	<br/>
	<p>Phone:</p>
	<input type="text" name="phone"/>
	<br/>
	<p>Address:</p>
	<input type="text" name="address"/>
	<br/>
	<p>Url:</p>
	<input type="text" name="url"/>
	<br/>
	<p>Price per night:</p>
	<input type="number" name="price_per_night"/>
	<br/>
	<input type="submit" value="Create Listing!"/>
</form>
<%@ include file="footer.jsp"%>