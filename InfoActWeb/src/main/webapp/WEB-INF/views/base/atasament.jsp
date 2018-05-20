<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta name="decorator" content="decorator-main">
 	<c:if test="${ss.add}">
		<script src="${pageContext.request.contextPath}/js/screens/base/atasament/atasament.js"></script>
	</c:if>
</head>

<body>
	<jsp:include page="/WEB-INF/common/title.jsp"/>

 	<c:if test="${ss.add}">
		<div id="divToolbar">
			<button title="Salvare" type="submit" form="frmDetails" formaction="create">
				<img src="${pageContext.request.contextPath}/img/actions/save.png">
				<br>Salvare
			</button>
			<button type="button" onclick="atasament.upload();">
				<img title="Upload" src="${pageContext.request.contextPath}/img/actions/attach.png">
				<br>&nbsp;&nbsp;Upload&nbsp;&nbsp;
			</button>
		</div>
	</c:if>

	<input type="hidden" id="module" value="${module}">
	<input type="hidden" id="screenCode" value="${screenCode}">	
	<input type="hidden" id="screenStatus" value="${ss.code}">

	<jsp:include page="/WEB-INF/include/base/atasament/details.jsp"/>
</body>

</html>