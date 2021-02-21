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
<Center>Payment Has been Succesfull</Center>
<center>Thanks for visited Hotel</center>
<% 

String roomNo=request.getParameter("rno");
int Room_No=Integer.parseInt(roomNo);
String sql="update checkOut SET mode_of_payment WHERE RoomNo="+Room_No+"";
try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();

 int i=st.executeUpdate(sql);
 System.out.println(i);

}
catch(SQLException e)
{
    out.println(e.getMessage());
}
%>
</body>
</html>