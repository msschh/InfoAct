<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta name="decorator" content="decorator-login">
</head>

<body>
	
	<jsp:include page="/WEB-INF/common/err.jsp"/>
				
	<form:form id="frmLogin" method="POST" action="login" modelAttribute="record"> 	
		<table>
			<tr>
				<td><b>Username</b></td>
				<td><form:input path="username" cssErrorClass="err" value="dan" /></td>
			</tr>
			<tr>
				<td><b>Parola</b></td>
				<td><form:password path="parola" cssErrorClass="err" value="dan" /></td>
			</tr>
		</table>
		
		<br><br><br>
		
		<button type="submit" style="width: 110px;">
			<img title="Autentificare" src="${pageContext.request.contextPath}/img/actions/key.png">
			<br><b>Autentificare</b>
		</button>
		
		<button type="button" onclick="window.location='signUp'" style="width: 110px;">
			<img title="Inregistrare" src="${pageContext.request.contextPath}/img/actions/signUp.png">
			<br><b>Inregistrare</b>
		</button>
			
		<button type="button" onclick="window.location='home'" style="width: 110px;">
			<img title="Renunțare" src="${pageContext.request.contextPath}/img/actions/revocare.png">
			<br><b>Renunțare</b>
		</button>	
	</form:form>
	
	<style>
		#divContainer { width: 600px; }
		#divBody { width: 400px; }
	</style>
</body>

</html>