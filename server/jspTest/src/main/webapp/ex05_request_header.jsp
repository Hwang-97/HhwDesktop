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
	
	<div class="container">
		<h1>HTTP 요청 메시지 <small>헤더정보</small></h1>
		
	<!--  	
		-->
		
		<hr>
		
		<p>서버 도메인 : <%=request.getServerName() %></p>
		<p>서버 포트번호 : <%=request.getServerPort() %></p>
		<p>요청 URL : <%=request.getRequestURI() %></p>
		<p>요청 쿼리 문자열 : <%=request.getQueryString() %></p>
		<p>클라이언트 주소 : <%=request.getRemoteHost() %></p>
		<p>프로토콜 : <%=request.getProtocol() %></p>
		<p>요청 메소드 : <%=request.getMethod() %></p>
		<p>컨텍스트 경로 : <%=request.getContextPath() %></p>
	</div>

<script>

</script>
</body>
</html>