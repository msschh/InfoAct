<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
	<meta name="decorator" content="decorator-main">
</head>

<body>
<div style="text-align: center; padding-top: 30px;">

	<h1>Accesul nu este permis</h1> 
	
	<img src="${pageContext.request.contextPath}/img/diverse/padlock.png" height="230" style="margin-top: 50px; margin-bottom: 20px;">
	
	<br>
	<span style="color: red;">${entityCode} / ${grant}</span>
	
</div>
</body>

</html>