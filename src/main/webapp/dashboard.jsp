<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<style>
body{
text-align:center;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<% 
	Cookie[] ck = request.getCookies();
	boolean loggedin=false;
	for(int j=0; j<ck.length ; j++){
		Cookie cookie=ck[j];
		if(cookie.getName().equals("u_name") && cookie.getValue().equals("admin")){
			loggedin=true;
		%>
		<h1>Welcome to the Dashboard!</h1>
		<br>
		<h3>Please use the below links to perform tasks</h3>
		<br><br>
		<h6><i><b>Please follow this order of insertion:<br>Add Subject -> Add Teacher -> Add Class -> Add Students</b></i></h6>		
	
		<br><br><br><br>
		<h3>
		<a href="Add_subject.jsp">Add Subject</a>
		<br><br>
		<a href="Add_teacher.jsp">Add Teacher</a>
		<br><br>
		<a href="Add_Students.jsp">Add Student</a>
		<br><br>
		<a href="View_Students.jsp">View Students</a>
		<br><br>
		<a href="View_teachers.jsp">View Teachers</a>
		<br><br>
		<a href="View_Subjects.jsp">View Subjects</a>
		<br><br>
		<a href="Add_class.jsp">Add Class</a>
		<br><br>
		<a href="Class_subject.jsp">Add Subject to Class</a>
		<br><br>
		<a href="View_classes.jsp">View Class Report</a>
		<br><br>
		<a href="logout"><i>Logout</i></a></h3>
		<%break;}
	}
 	if(loggedin==false){
 		%> 
 		<h1>You need to login to access the requested page!</h1>
 			<br><br>
			<a href="index.html">Login Page</a>
 		<%
 	}
 %>
		
</body>
</html>