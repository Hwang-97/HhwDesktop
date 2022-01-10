<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String name = "홍길동";
	int age = 20;
	String color = "cornflowerblue";
	String input = "<input type='text' class='btn'>";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color:<%=color%>>;"><%= name %>
	</h1>
	<%=input %>
	
	<%@ include file="inc/copyright.jsp" %>
<%@ include file ="inc/asset.jsp" %>
</body>
</html>