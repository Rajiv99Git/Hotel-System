<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="RoomEntry.jsp">
RoomNo<input type="text" name="rNo">
<br>
RoomType<select name="RoomType" id="RoomType">
 <option value="Select">Select</option>
  <option value="AC">AC</option>
  <option value="Non-AC">Non-AC</option></select>
  <br>
  Rent<input type="text" name="rent">
  <br>
 Status <select name="status" id="status">
<option value="Select">Select</option>
  <option value="Available">Available</option>
  <option value="Occupied">Occupied</option></select>
	<input type="submit" value="submit">
</form>
</body>
</html>