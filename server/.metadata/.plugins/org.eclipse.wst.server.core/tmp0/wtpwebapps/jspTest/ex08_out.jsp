<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
<%int dan=5; %>

<%for(int i=1 ; i<=9;i++){ %>
	<div><%=dan %>X<%=i%>=<%=dan*i %></div>

<%} %>

<%
	for(int i=1; i<9; i++){
		out.println(String.format("<div>%d X %d = %d</div>",dan,i,dan*i));
	}
%>

<script>

</script>
</body>
</html>