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
String room=request.getParameter("roomNo");
int roomNo=Integer.parseInt(room);

int rno=0;
String roomType="";
String status="";
double rent=0;
String sql="select * from new_room_entry";


{
try
{
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","123456");  

 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery(sql);
	
	while(rs.next()) {
		if(roomNo==rs.getInt(1)){
			
			 rno=rs.getInt(1);
			 roomType=rs.getString(2);
			 rent=rs.getDouble(3);
			 status=rs.getString(4);
			 
		}
	}
	if(status.equals("Available")){
		
		//request.setAttribute("RoomNo",rno);
		
		//String rno1=Integer.toString(rno);
		//String rent1=Double.toString(rent); 
		
	%>	
	<table border="1">
	<tr>
	<td>Room No : <%=rno %></td><br>
	<td>Room Type : <%=roomType %></td><br>
	<td>Status : <%=status %></td>
	<td>Price : <%=rent %></td>
	</tr>	
	<form action="userBookRoom.jsp">
	<input type="hidden" name="rno" value="<%=rno %>">
	CustomerName<input type="text" name="cName"><br>
	Address     <input type="text" name="address"><br>
	Mobile No   <input type="text" name="mobile"><br>
	ID_Proof    <input type="text" name="idProof"><br>
	CheckIn Date<input type="text" name="checkIn" placeholder="yyyy-MM-dd"><br>
	No of Member<input type="text" name="noMember"><br>
	
	<input type="submit" value="submit">
	</form>
	
		<% 
	}
	else{
		out.print("Already occupied");
	}
}
catch(SQLException e)
{
    out.println(e.getMessage());
}
}
%>




</body>
</html>