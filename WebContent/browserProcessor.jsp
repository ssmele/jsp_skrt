<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<%
int maxPrice;
try {
	maxPrice = Integer.parseInt((String)request.getParameter("max_price"));
} catch (Exception e) {
	maxPrice = Integer.MIN_VALUE;
}

int minPrice;
try {
	minPrice = Integer.parseInt((String)request.getParameter("min_price"));
} catch (Exception e) {
	minPrice = Integer.MIN_VALUE;
}

int sort = -1;
String city = (String)request.getParameter("city");
String state = (String)request.getParameter("sate");
String keyword = (String)request.getParameter("keyword");
String category = (String)request.getParameter("category");
ArrayList<String> operations = new ArrayList<String>();
ArrayList<KeyValuePair> params =new ArrayList<KeyValuePair>();
ArrayList<KeyValuePair> origParams = new ArrayList<KeyValuePair>();
Connector con = new Connector();

if(maxPrice != Integer.MIN_VALUE){
	origParams.add(new KeyValuePair("min price", Integer.toString(maxPrice)));
}
if(minPrice != Integer.MIN_VALUE){
	origParams.add(new KeyValuePair("min price", Integer.toString(minPrice)));
}
if (city != null)
	origParams.add(new KeyValuePair("city", city));
if (state != null)
	origParams.add(new KeyValuePair("state", state));
if (keyword != null)
	origParams.add(new KeyValuePair("keyword", keyword));
if (category != null)
	origParams.add(new KeyValuePair("category", category));


//FUCK

Querys q = new Querys();
ArrayList<TH> retList = q.browse(con.stmt, params, operations, sort);


%>

<%@ include file="footer.jsp" %>