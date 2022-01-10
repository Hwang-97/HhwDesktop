<%@page import="com.test.jdbc.DBUtill"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	    
	Connection conn = null;
	int result;
	
	conn=DBUtill.open();
	result = conn.prepareStatement("update tbljava set name='홍홍홍', age = 30 where id='hong'").executeUpdate();
	
	conn.setAutoCommit(false);
	
	conn.close();
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<%if (result>0) {%>
		<div><%="업데이트 성공" %></div>
	<%}else{ %>
		<div><%="업데이트 실패" %></div>
	<%} %>			
<script>

</script>
</body>
</html>