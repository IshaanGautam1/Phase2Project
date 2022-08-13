<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
 <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Class</title>
<style>
	body{
		text-align:center;
	
</style>
</head>

<body>
	<% 
	boolean loggedin=false;
	Cookie ck[] = request.getCookies();
	for(int i=0;i<ck.length;i++){
		Cookie cookie = ck[i];
		if(cookie.getName().equals("u_name") && cookie.getValue().equals("admin")){
			loggedin=true;
			%>
			<h1>Insert Class</h1>
			<br><br>
			<form action="Insert_class.jsp" method="POST">
			Enter Class Name : <input type="text" name="classname">
			<br><br>
			<input type="submit" value="submit">
			</form>
			<%
		break;
		}
	}
	if(loggedin==false){
		%>
		<h1>You need to login to view the requested Page</h1>
		<br><br>
		<a href="index.html">Go to Login Page</a>
		<%
	}
		
			
%>

</body>
</html>