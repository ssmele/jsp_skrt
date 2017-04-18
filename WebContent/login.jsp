<%@ page language="java" import="cs5530.*" %>
<title>Uotel</title>
<html>
<head>
</head>
<body>
<h1>
Please provide a username, and password if you want to login.
</h1>
<form action="main.jsp">
	<input type="text" name="username" value="username"/>
	<br/>
	<input type="password" name="password" value="password"/>
	<input type="hidden" name="login" value="true" />
	<br>
	<input type="submit" value="Login!"/>
</form>
<hr>

<h6>
Please provide registration information if you want to register a new user.
</h6>
<form action="main.jsp">
	<input type="text" name="username" value="username"/>
	<br/>
	<input type="text" name="password" value="password"/>
	<br/>
	<input type="text" name="name" value="name"/>
	<br/>
	<input type="text" name="address" value="address"/>
	<br/>
	<input type="text" name="phone" value="phone"/>
	<br/>
	<input type="hidden" name="register" value="true" />
	<input type="submit" value="Register!"/>
</form>
</body>
</html>