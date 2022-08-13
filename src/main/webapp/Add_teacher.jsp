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
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/phase2project";
			String username = "root";
			String password = "root";
			Connection connection = DriverManager.getConnection(url, username, password);
		 	String sql="Select * from subjects";
		 	String sql1="Select count(*) from subjects";
		 	Statement statement = connection.createStatement();
		 	ResultSet result1 = statement.executeQuery(sql1);
		 	int rowcount=0;
		 	while(result1.next()){
		 		rowcount=result1.getInt(1);
		 	}
		 	if(rowcount==0){
		 		%>
		 		<h2>There are no subjects added yet!.<br>Please add subjects first.</h2>
		 		<br><br>
		 		<a href="dashboard.jsp">Go back to dashboard</a>
	 		<% 
		 	}
		 	else{
	        ResultSet result = statement.executeQuery(sql);
	%>
	
				<h2>Enter Teacher Details</h2>
				<form action="Teacher_Insert.jsp" method="POST">
				Enter Teacher's Name: <input type="text" name="teacher_name" required>
				<br>
				Select Subject for the teacher: 
				<select name="subject">
			        <%  while(result.next()){ %>
			            <option><%= result.getString(1)%></option>
			        <% } %>
			     </select>
			     <br><br>
				<input type="submit" value= "submit">
				
				</form>
				<%
				}
		 	connection.close();
		 	break;
	 		}
			
			}
	if(loggedin==false){
		%>
		<h1>Please login to View the requested page.<br><br><a href="index.html">Go to Login Page</a></h1>
		<%
	}
		
	%>
</body>
</html>