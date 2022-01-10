<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<p>pageContext request : <%=request.getAttribute("a")%></p>
	<p>pageContext session : <%=session.getAttribute("a")%></p>
	
	
    <p><%=pageContext.getAttribute("num2")%></p>
    <p><%=request.getAttribute("num3") %></p>
    <p><%=session.getAttribute("num4") %></p>
<script>

</script>
</body>
</html>