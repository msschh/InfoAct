<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta name="decorator" content="decorator-main">
	<c:if test="${ss.view}">
		<script src="${pageContext.request.contextPath}/js/screens/filmInd/film/favorit.js"></script>
	</c:if>
	<c:if test="${ss.edit}">
		<script src="${pageContext.request.contextPath}/js/screens/base/atasament/modalAtasament.js"></script>
		<script src="${pageContext.request.contextPath}/js/screens/base/atasament/atasament.js"></script>
		<script src="${pageContext.request.contextPath}/js/screens/filmInd/modalActorFilm.js"></script>
	</c:if>
</head>

<body>
	<jsp:include page="/WEB-INF/common/title.jsp"/>
	<div style="float: left;">
		<jsp:include page="/WEB-INF/common/toolbar.jsp">
			<jsp:param name="screenToolbar" value="/WEB-INF/include/filmInd/film/toolbar.jsp" />
		</jsp:include>
	</div>
	
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
	
 	<c:if test="${ss.detail}">
		<div style="clear: both;"></div>
 		<input type="hidden" id="ls" value="${ls}">
 		<form:form id="frmDetails" methos="POST" modelAttribute="record">
 			<form:hidden path="id"/>
			<jsp:include page="/WEB-INF/include/filmInd/film/details.jsp"/>
		</form:form>
	</c:if>
			
</body>

</html>