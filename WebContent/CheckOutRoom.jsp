<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.time.temporal.ChronoUnit" %>
<%@	page import="java.text.*" %>
<%@page  %>
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
String rno=request.getParameter("RoomNo");
int RoomNo=Integer.parseInt(rno);
System.out.println(RoomNo);
String cName="";
int memberNo=0;
String checkInDate="";
double rent=0;
String add="";
int mobile=0;
String id_proof="";
String payment_mode="cash";

String sql="select * from checkin";

try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery(sql);
 
 while(rs.next()){
	 if(RoomNo==rs.getInt(1)){
		 cName=rs.getString(2);
		
		  memberNo=rs.getInt(6);
		  add=rs.getString(3);
		  mobile=rs.getInt(4);
		  checkInDate=rs.getString(7);
		  id_proof=rs.getString(5);
	}
 }

	
}catch(SQLException e)
{
    out.println(e.getMessage());
}

String sql1="select * from new_room_entry";

try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery(sql1);
 
 while(rs.next()){
	 if(RoomNo==rs.getInt(1)){
		  rent=rs.getDouble(3);
	}
	 
 }
 
  LocalDate localDate = LocalDate.parse(checkInDate);
 LocalDate dateOut=LocalDate.now();
 double datediff = ChronoUnit.DAYS.between(localDate,dateOut);  
 double amount = rent * datediff;
%>

<table>
	</tr>
<tr bgcolor="#A52A2A">
<td><b>Room No</b></td>
<td><b>Customer Name</b></td>
<td><b>No of member</b></td>
<td><b>Check In Date</b></td>
<td><b>Check Out Date</b></td>
<td><b>Rent</b></td>
<td><b>No of Days</b></td>
<td><b>Total Amount</b></td>

</tr>

<tr bgcolor="#DEB887">

<td><%=RoomNo %></td>
<td><%=cName %></td>
<td><%=memberNo %></td>
<td><%=checkInDate %></td>
<td><%=dateOut %></td>
<td><%=rent %></td>
<td><%=datediff %></td>
<td><%=amount %></td>
</tr>
<% 
String sql2="insert into checkOut values ('"+RoomNo+"','"+cName+"','"+add+"','"+mobile+"','"+memberNo+"','"+id_proof+"','"+checkInDate+"','"+dateOut+"','"+payment_mode+"','"+amount+"')";
try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st1=con.createStatement();

 int i=st.executeUpdate(sql2);

}
catch(SQLException e)
{
    out.println(e.getMessage());
}
%>
<form action="storeCheckOutCustomerStatus.jsp">
Payment Mode<select name="payment" id="payment">
  <option value="Select">Select</option>
  <option value="cash">By Cash</option>
  <option value="paytm">Paytm</option>
  <option value="Google_Pay">Google Pay</option>
  <option value="Phone_Pay">Phone_Pay</option>
  <option value="Debit_Card">Debit_Card</option>
   <option value="Credit_card">Credit Card</option>
   <input type="hidden" name="rno" value="<%=RoomNo %>">
  
<input type="submit" value="submit">
</form>	
<% 	
}catch(SQLException e)
{
    out.println(e.getMessage());
}
%>
</body>
</html>