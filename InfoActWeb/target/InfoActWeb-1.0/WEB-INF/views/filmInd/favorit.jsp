<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta name="decorator" content="decorator-main">
</head>

<body>
	<jsp:include page="/WEB-INF/common/title.jsp"/>
	
	<input type="hidden" id="module" value="${module}">		
	<input type="hidden" id="screenCode" value="${screenCode}">		
	<input type="hidden" id="screenStatus" value="${ss.code}">	
 	
	<c:if test="${ss.list}">
		<form:form id="formList" method="POST" action="list">
			<div style="float: left; margin-top: 12px; margin-left: 12px;">
				<jsp:include page="/WEB-INF/include/filmInd/film/filter.jsp"/>
			</div>
			<div style="clear: both;"></div>
			<c:if test="${pager.recordCount == 0}">
				<jsp:include page="/WEB-INF/common/noRecords.jsp"/>			
			</c:if>
			<c:if test="${pager.recordCount >= 1}">
				<jsp:include page="/WEB-INF/include/filmInd/film/list.jsp"/>			
			</c:if>
			<c:if test="${pager.pageCount >= 2}">
				<jsp:include page="/WEB-INF/common/pager.jsp"/>
			</c:if>
		</form:form>				
	</c:if>
			
</body>

</html>