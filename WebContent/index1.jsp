<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<Form action="Servlet1" method="post">

UserName<input type="text" name="name">
<br>

password<input type="password" name="pass">
<br>
Address<input type="text" name="add">
<br>

mobile<input type="text" name="mobile">
<br>

Gmail<input type="text" name="gmail">
<br>

<input type="submit" value="signUp">

<input type="submit" value="Login" formaction="Login.jsp">

</Form>

</body>
</html>