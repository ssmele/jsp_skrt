<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>    
    
<form action="browseResults.jsp">
	<h3> Fill out the criteria you wan't to search by:</h3>
	<p> 1. Please enter max price i.e. 200<p>
	<input type="number" name="max price"/>
	<br/>
	<p> 2. Please enter min price i.e. 100<p>
	<input type="number" name="min price"/>
	<br/>
	<p> 3. Please enter city<p>
	<input type="text" name="city"/>
	<br/>
	<p> 4. Please enter state <p>
	<input type="text" name="state"/>
	<br/>
	<p> 5. Please enter category <p>
	<input type="text" name="category"/>
	<br/>
	<p> 6. Please enter keyword <p>
	<input type="text" name="keyword"/>
	<br/>
	<h2> REQUIRED (unless none are specified): </h2>
	<h3> For your selected criteria, specify an ordering and the operations (and/or) in between:</h3>
	<h4> Example: 3 or 6 and 5</h4>
	<input type="text" name="ordering"/>
	<br/>
	<h2> REQUIRED: </h2>
	<h3> Enter a sort by its numerical value: </h3>
	<ul>
		<li> 1. Sort by Price</li>
		<li> 2. Sort by Highest Rated </li>
		<li> 3. Sort by Highest Rated by Trusted Users </li>
		<li> 4. No Sort </li>
	</ul>
	<input type="number" name="sort"/>
	<br/>
	<br/>
	<input type="submit" value="Search!"/>
	<br/>
	<br/>
</form> 
<%@ include file="footer.jsp" %>