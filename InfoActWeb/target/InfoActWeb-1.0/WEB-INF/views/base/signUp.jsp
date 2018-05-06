<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta name="decorator" content="decorator-login">
</head>

<body>
	
	<jsp:include page="/WEB-INF/common/err.jsp"/>
				
	<form:form id="frmSignUp" method="POST" action="signUp" modelAttribute="record"> 	
		<table>
			<tr>
				<td><b>Username</b></td>
				<td><form:input path="username" cssErrorClass="err" /></td>
			</tr>
			<tr>
				<td><b>Parola</b></td>
				<td><form:password path="parola" cssErrorClass="err" /></td>
			</tr>
			<tr>
				<td><b>Nume</b></td>
				<td><form:input path="nume" cssErrorClass="err" /></td>
			</tr>
			<tr>
				<td><b>Email</b></td>
				<td><form:input path="email" cssErrorClass="err" /></td>
			</tr>
		</table>
		
		<br><br><br>
		
		<button type="submit">
			<img title="Inregistrare" src="${pageContext.request.contextPath}/img/actions/signUp.png">
			<br><b>Inregistrare</b>
		</button>	
			
		<button type="button" onclick="window.location='login'">
			<img title="Renunțare" src="${pageContext.request.contextPath}/img/actions/revocare.png">
			<br><b>Renunțare</b>
		</button>	
	</form:form>
</body>

</html>