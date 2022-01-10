<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = request.getParameter("data");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="/inc/asset.jsp" %>
<body>

<h1>데이터 보내기</h1>

<form method="POST" action="/jsp/ex03ok.jsp">
	<br>
	data : <input type="text"name="data">
	<input type="submit" value="전달하기" >
</form>

</body>
</html>