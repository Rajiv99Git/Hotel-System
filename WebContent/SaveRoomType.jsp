<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
String roomType=request.getParameter("RoomType");
String sql="insert into new_room_type values ('"+roomType+"')";
try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();

 int i=st.executeUpdate(sql);
 System.out.println(i);
 out.println("Data has been saved Successfully");
}
catch(SQLException e)
{
    out.println(e.getMessage());
}

%>



</body>
</html>