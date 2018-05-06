<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ss.edit}">
	<jsp:include page="/WEB-INF/modal/base/atasament/modalAtasament.jsp"/>
	<jsp:include page="/WEB-INF/modal/filmInd/modalActorFilm.jsp" />
		
	<button type="button" onclick="modalAtasament.attachModal();">
		<img src="${pageContext.request.contextPath}/img/actions/attach-2.png">
		<br>&nbsp;&nbsp;Imagine&nbsp;&nbsp;
	</button>
	<button type="button" onclick="modalActorFilm.add();">
		<img src="${pageContext.request.contextPath}/img/actions/comment.png">
		<br>&nbsp;&nbsp;&nbsp;&nbsp;Actor&nbsp;&nbsp;&nbsp;&nbsp;
	</button>
</c:if>