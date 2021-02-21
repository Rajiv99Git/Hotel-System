<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

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
String room=request.getParameter("rno");
int roomno=Integer.parseInt(room);
String name=request.getParameter("cName");
String address=request.getParameter("address");
String mNo=request.getParameter("mobile");
int mobile=Integer.parseInt(mNo);
String idProof=request.getParameter("idProof");
String checkIn=request.getParameter("checkIn");
String no=request.getParameter("noMember");
int noMember=Integer.parseInt(no);
System.out.println(noMember);
String sql="insert into checkin values ('"+roomno+"','"+name+"','"+address+"','"+mobile+"','"+idProof+"','"+noMember+"','"+checkIn+"')";
try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();

 int i=st.executeUpdate(sql);
 System.out.println(i);
 out.println("Room Alloted");
}
catch(SQLException e)
{
    out.println(e.getMessage());
}

String sql1="update new_room_entry set status='Occupied' where RoomNo="+roomno+"" ;
try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();

 int i=st.executeUpdate(sql1);
 System.out.println(i);
 //out.println("Room Alloted");
 
}
catch(SQLException e)
{
    out.println(e.getMessage());
}


%>
</body>
</html>