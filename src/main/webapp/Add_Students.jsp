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
	 	String sql="Select * from classes";
	 	String sql1="Select count(*) from classes";
	 	Statement statement = connection.createStatement();
	 	ResultSet result1 = statement.executeQuery(sql1);
	 	int rowcount=0;
	 	while(result1.next()){
	 		rowcount=result1.getInt(1);
	 	}
	 	if(rowcount==0){
	 		%><h2>There are no Classes inserted yet.</h2>
	 		<br><br>
	 		<a href="dashboard.jsp">Go back to dashboard</a>
	 		<% 
	 	}
	 	else{
        ResultSet result = statement.executeQuery(sql);
	%>
	
			<h2>Enter Student Details</h2>
			<form action="Student_Insert.jsp" method="POST">
			Enter Student's Name: <input type="text" name="student_name">
			<br>
			Select Class for the Student: 
			<select name="student_class">
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