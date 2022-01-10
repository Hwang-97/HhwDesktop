<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1 class="page-header">주소록 <small> 추가하기</small></h1>
		
		<form method="POST" action="/jsp/address/addok.jsp">
		
			<table class="table table-bordered vertical">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="form-control short" required></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" class="form-control short" required></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" name="tel" class="form-control middle" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" class="form-control middle" required></td>
				</tr>
			</table>
			<div class="btns">
				<button type="button" class="btn btn-default" onclick="location.href='/jsp/address/list.jsp';">
					<span class="glyphicon glyphicon-chevron-left"></span>
					돌아가기					
				</button>
				<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-pencil"></span>
					추가하기					
				</button>
			</div>
		
		</form>
		
		
	</div>

<script>

</script>
</body>
</html>

<%
	
%>