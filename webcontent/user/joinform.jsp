<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="joinprocesse.jsp" method="post">
이름:<input type="text" name="name">
<br>
아이디:<input type="text" name="id">
<br>
비밀번호 :<input type="password" name="pwd">
<br>
전화번호<br>
<select  name="phone1">
<option>010</option>
<option>011</option>
</select>-
<input type="text" name="phone2">-
<input type="text" name="phone3">
<br>
성별
<br>
<input type="radio" name="gender" value="남">
<input type="text" name="gender" value="여">
<input type="submit">
</form>

</body>
</html>