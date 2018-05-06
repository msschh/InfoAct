<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
	<meta name="decorator" content="decorator-main">
</head>

<body>
<div style="text-align: center; padding-top: 30px;">

	<h1>A aparut o eroare</h1>
	
	<img src="${pageContext.request.contextPath}/img/diverse/error.png" height="200" style="margin-top: 60px; margin-bottom: 70px;">
	
	<!--
	Failed URL: ${url}
	
    Exception:  ${exception.message}
    <c:forEach items="${exception.stackTrace}" var="ste">    
    	${ste} 
    </c:forEach>
	-->
</div>
</body>

</html>