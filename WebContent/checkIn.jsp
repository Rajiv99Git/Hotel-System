<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String sql="select * from new_room_entry";


try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery(sql);
	
	%>
		
	<table>
	</tr>
<tr bgcolor="#A52A2A">
<td><b>Room No</b></td>
<td><b>Room Type</b></td>
<td><b>Price</b></td>
<td><b>Status</b></td>
</tr>

<%
while(rs.next()) {
%>
<tr bgcolor="#DEB887">

<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getDouble(3) %></td>
<td><%=rs.getString(4) %></td>
</tr>
	
		
<% 
	}%>
	<% 
}
catch(SQLException e)
{
    out.println(e.getMessage());
}

%>
</table>
<form action="bookRoom.jsp" >
Room No<input type="text" name="roomNo">
<input type="submit" value="submit">
</form>

</body>
</html>