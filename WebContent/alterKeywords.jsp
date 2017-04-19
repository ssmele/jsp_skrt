<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<%
TH current_th = (TH)session.getAttribute("current_th");
Querys q = new Querys();
Connector con = new Connector();
ArrayList<Keyword> keywords = q.getKeywords(current_th, con.stmt);

int remove_number;
if(request.getParameter("remove") != null){
	remove_number = Integer.parseInt(request.getParameter("remove"));
	q.deleteKeyword(current_th, keywords.get(--remove_number), con.stmt);
	keywords = q.getKeywords(current_th, con.stmt);
}

if(request.getParameter("keyword_to_add") != null){
	String keyword_to_add = request.getParameter("keyword_to_add");
	q.addKeywordToHID(keyword_to_add, current_th.getHid(), con.stmt);
	keywords = q.getKeywords(current_th, con.stmt);
}


if(keywords.isEmpty()){
	%><p> No keywords to alter!</p>
	<a href="alter.jsp">Click here to alter more TH's</a> <%	
}else{
	%><p>Below are a list of keywords assocaited with the current TH. Click one to remove it from the TH!</p><%
	int count = 1;
	for(Keyword key : keywords){%>
		<input type="button" value="<%=key.getWord()%>" onclick="location.href='alterKeywords.jsp?remove=<%=count%>'"/>
		<br>
	<%
	count++;
	}
}
%>

<form action="alterKeywords.jsp" method="post">
	<p>Type in the keyword you would like to add!</p>
	<input type="text" name="keyword_to_add"/>
	<br/>
	<input type="submit" value="Add!"/>
</form>



<%@ include file="footer.jsp"%>