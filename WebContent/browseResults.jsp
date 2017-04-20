<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>

<%

ArrayList<KeyValuePair> params = new ArrayList<KeyValuePair>();
ArrayList<String> operations = new ArrayList<String>();
String rawOdrAndOps = request.getParameter("ordering");
String[] odrAndOps = rawOdrAndOps.trim().split("\\s+");
ArrayList<Integer> prms = new ArrayList<Integer>();
// Get the criteria the user specified
if (!rawOdrAndOps.equals("")){
	for (int i = 0; i < odrAndOps.length; i+=2){
		prms.add(Integer.parseInt(odrAndOps[i]));
	}
}
// Get the operations between the criteria
for (int i = 1; i < odrAndOps.length; i+=2){
	operations.add(odrAndOps[i]);
}
// Generate the params list
for (int parameter: prms){
	KeyValuePair pair;
	switch (parameter){
	case 1:
		pair = new KeyValuePair("max price", request.getParameter("max price"));
		params.add(pair);
		break;
	case 2:
		pair = new KeyValuePair("min price", request.getParameter("min price"));
		params.add(pair);
		break;
	case 3:
		pair = new KeyValuePair("city", request.getParameter("city"));
		params.add(pair);
		break;
	case 4:
		pair = new KeyValuePair("state", request.getParameter("state"));
		params.add(pair);
		break;
	case 5:
		pair = new KeyValuePair("category", request.getParameter("category"));
		params.add(pair);
		break;
	case 6:
		pair = new KeyValuePair("keyword", request.getParameter("keyword"));
		params.add(pair);
		break;
	default:
		continue;
	}
}
int sort = Integer.parseInt(request.getParameter("sort"));
Querys q = new Querys();
Connector con = new Connector();
ArrayList<TH> results = q.browse(con.stmt, params, operations, sort);
session.setAttribute("th_list", results);
if(results == null || results.isEmpty()){%>
<p> No th's to display.</p>
<%}else{
%>
<h3> Results For Your Search: </h3>
<%
int count = 1;
for(TH th : results){%>
	<%String title = count + ". Name: " + th.getName() + " price: " + th.getPrice() + " address: " + th.getAddress(); %>
	<%String url = "location.href='viewTH.jsp?index=" + (count-1) + "'"; %>
	<p><input type="submit" value="<%=title%>" onClick="<%=url%>"/></p> 
<%
count++;
}
}
%>

<%@ include file="footer.jsp" %>