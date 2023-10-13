<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<c:if test="${logStatus == null }">
	<a href="/web/login">로그인</a>
</c:if>
<c:if test="${logStatus eq 'Y'}">
	<a href="/web/logout">로그아웃</a>
</c:if>
</body>
</html>
