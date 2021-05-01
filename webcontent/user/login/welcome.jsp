<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=(String)session.getAttribute("userid");
    String name=(String)session.getAttribute("username");
    String phone1=(String)session.getAttribute("userphone1");
    String phone2=(String)session.getAttribute("userphone2");
    String phone3=(String)session.getAttribute("userphone3");
    String gender=(String)session.getAttribute("gender");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="update.jsp" method="post">
이름:<input type="text" name="name" value="<%= name %>">
<br>
아이디:<input type="text" name="id" value="<%= id %>">
<br>
전화번호<br>
<select  name="phone1" >
<option>010</option>
<option>011</option>
</select>-
<input type="text" name="phone2" value="<%= phone2%>">-
<input type="text" name="phone3" value="<%= phone3 %>">
<br>
성별
<br>
<%if(gender.equals("여")){ %>
남<input type="radio" name="gender" value="남" >
여<input type="radio" name="gender" value="여" checked>
<%}
else
{%>
	남<input type="radio" name="gender" value="남"checked>
	여<input type="radio" name="gender" value="여">	
<%}%>
<input type="submit" value="정보수정">
</form>
<form action="delete.jsp">

<input type="submit" value="탈퇴">
</form>
</body>
</html>