<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style >
body{
	text-align:center;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<% 
	Cookie[] ck = request.getCookies();
	boolean loggedin=false;
	for(int j=0;j<ck.length;j++){
		Cookie cookie=ck[j];
		if(cookie.getName().equals("u_name") && cookie.getValue().equals("admin")){
			loggedin=true;
	%>
	
		<h2>Enter Subject Details</h2>
		<form action="Subject_Insert.jsp" method="POST">
		Enter Subject Name: <input type="text" name="subject" required>
		<input type="submit" value= "submit">
		</form>
	<%
	break;}
		}
	if(loggedin==false){
	%>
	<h1>You need to login to access the requested page!</h1>
	<br><br>
	<a href="index.html">Login Page</a>
	<% }%>
	
</body>
</html>