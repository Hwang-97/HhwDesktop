<%@page import="java.sql.Connection"%>
<%@page import="com.test.jdbc.DBUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String seq = request.getParameter("seq");
	
	Connection conn;
	
	conn = DBUtill.open();
	int result = conn.prepareStatement(String.format("delete from tblAddress where seq =%s",seq)).executeUpdate();
	
	conn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp" %>
<%@include file="/address/inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<div class="container">
		<h1 class="page-header">주소록<small>추가하기</small></h1>
		
	</div>

<script>
	
	<% if (result == 1) { %>
	//성공
	//alert('추가 성공');
	location.href = '/jsp/address/list.jsp';
	<% } else { %>		
	//실패
	alert('삭제 실패;;');
	//location.href = '/jsp/address/add.jsp';
	history.back();
	<% } %>
	
	
</script>
</body>
</html>

<%
	
%>