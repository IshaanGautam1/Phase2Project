<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<style>
body{
text-align:center
}
</style>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
<%
Cookie[] ck = request.getCookies();
if(ck!=null){
for(int i=0;i<ck.length;i++){
	Cookie cookie = ck[i];
	cookie.setMaxAge(0);
	response.addCookie(cookie);
}}
	%>
	<h2>Sorry!<br>An Exception has occured and we have logged you out.<br>Please login again<br><a href="index.html">Login Page</a></h2>
</body>
</html>