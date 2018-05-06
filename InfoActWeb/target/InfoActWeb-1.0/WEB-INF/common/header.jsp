<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="float: left; width: 100px; margin-left: 2px;">
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/diverse/movie32.png"></a>
</div>

<div style=" float: left; width: 200px; font-family: Arial; font-size: 18pt; color: #0060b0; margin-top: 1px;">
	<a href="${pageContext.request.contextPath}"> InfoAct </a>
</div>

<div style=" float: right; text-align: right; margin-right: 5px; margin-left: 15px; margin-top: 2px; border: solid 0px black;">
	<a href="#"><img src="${pageContext.request.contextPath}/img/flags/ro.png"></a>&nbsp;
	<!--
		<a href="#"><img src="${pageContext.request.contextPath}/img/flags/uk.png"></a>&nbsp;
	-->
</div>

<div style=" float: right; width: 400px; text-align: right; font-family: sans-serif; margin-top: 8px; border: solid 0px black;">
	<c:if test="${sessionScope.utilizator == null}">
		Utilizator neautentificat
	</c:if>
	<c:if test="${sessionScope.utilizator != null}">
		${sessionScope.utilizator.nume}
	</c:if>
	
	&nbsp;|&nbsp;
	
	<c:if test="${sessionScope.utilizator == null}">
		<a href="${pageContext.request.contextPath}/mvc/login">Autentificare</a>		
	</c:if>
	<c:if test="${sessionScope.utilizator != null}">
		<a href="${pageContext.request.contextPath}/mvc/logout">Logout</a>
	</c:if>

</div>

<div style="clear: both;"></div>
