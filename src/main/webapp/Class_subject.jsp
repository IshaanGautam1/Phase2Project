<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
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
<title>Add subjects to classes</title>
</head>
<body>
<% 
	boolean loggedin=false;
	Cookie ck[] = request.getCookies();
	for(int i=0;i<ck.length;i++){
		Cookie cookie = ck[i];
		if(cookie.getName().equals("u_name") && cookie.getValue().equals("admin")){
			loggedin=true;
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/phase2project";
			String username = "root";
			String password = "root";
			Connection connection = DriverManager.getConnection(url, username, password);
			Statement statement = connection.createStatement();
			String sql="Select * from classes";
			String sql1="Select * from subjects";
			String sql2="Select count(*) from classes";
			String sql3="Select count(*) from subjects";
			String sql4="Select count(*) from teachers";
			int rownum1=0;
			int rownum2=0;
			int rownum3=0;
			ResultSet result2 = statement.executeQuery(sql2);
			while(result2.next()){
				rownum1=result2.getInt(1);
			}
			ResultSet result3 = statement.executeQuery(sql3);
			while(result3.next()){
				rownum2=result3.getInt(1);
			}
			ResultSet result4 = statement.executeQuery(sql4);
			while(result4.next()){
				rownum3=result4.getInt(1);
			}
			if(rownum1==0){
				%>
				<h2>There are no classes added yet!.<br>Please add classes first.</h2>
		 		<br><br>
		 		<a href="dashboard.jsp">Go back to dashboard</a>
		 		<% 
			}
			else if(rownum2==0){
				%>
				<h2>There are no subjects added yet!.<br>Please add subjects first.</h2>
		 		<br><br>
		 		<a href="dashboard.jsp">Go back to dashboard</a>
		 		<% 
			}
			else if(rownum3==0){
				%>
				<h2>There are no teachers added yet!.<br>Please add teachers first.</h2>
		 		<br><br>
		 		<a href="dashboard.jsp">Go back to dashboard</a>
		 		<% 
			}
			else{
				ResultSet result = statement.executeQuery(sql);
			%>
			<h2>Select Class</h2>
			<br><br>
			<form action="Class_Teacher.jsp" method="POST">
					<select name="classname">
				        <%  while(result.next()){ %>
				            <option><%= result.getString(1)%></option>
				        <% } %>
		     		</select>
					<br><br>
					<h2>Select Subject</h2>
					<br><br>
					<%ResultSet result1 = statement.executeQuery(sql1); %>
					<select name="subject">
				        <%  while(result1.next()){ %>
				            <option><%= result1.getString(1)%></option>
				        <% } %>
		     		</select>
		     		<br><br>
					<input type="submit" value= "submit">
			</form>
			<%
			}
			connection.close();
			break;}
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