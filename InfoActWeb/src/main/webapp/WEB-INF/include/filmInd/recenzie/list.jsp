<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/modal/recenzie/modalRecenzie.jsp"/>
<div style="float: left; width: 100%; border-bottom: double 3px silver; margin-bottom: 15px; padding-bottom: 10px;">

	<div style="float: left; padding-top: 12px; padding-left: 2px; color: gray;">
		Reviews
	</div>
	
	<div style="float: right; padding-right: 2px;">
		<button type="button" class="b1" onclick="modalRecenzie.add();">
			<img src="${pageContext.request.contextPath}/img/actions/add.png">
			Review
		</button>
	</div>
</div>

<div style="float: left; width: 100%;">
	<c:if test="${empty recenzii}">
		<div class="info">Acest film nu contine recenzii.</div>
	</c:if>
		
	<c:if test="${not empty recenzii}">
		<c:forEach var="recenzie" items="${recenzii}">
			<div class="comentariu">
			<header>
				${recenzie.user.username} - <fmt:formatDate pattern = "dd.MM.yyyy" value = "${recenzie.dt}" />
			</header>
			<main>
				<article><b>Review ${recenzie.nota} / 10.</b> <br><br> ${recenzie.text}</article>
				<c:if test="${ss.view}">
					<c:if test="${recenzie.user.id == sessionScope.utilizator.id}">
						<div class="action">
							<img
								title="delete" style="cursor: pointer;"
								src="${pageContext.request.contextPath}/img/actions/delete.png"
								onclick="browser.deleteModal('recenzie', ${recenzie.id})">
						</div>
					</c:if>
				</c:if>
				<c:if test="${ss.editable}">
					<div class="action">
						<img
							title="delete" style="cursor: pointer;"
							src="${pageContext.request.contextPath}/img/actions/delete.png"
							onclick="browser.deleteModal('recenzie', ${recenzie.id})">
					</div>
				</c:if>
				<div style="clear: both;"></div>
			</main>
			</div>
		</c:forEach>
	</c:if>
	
	<br>
</div>

<style>
.comentariu {
	margin-bottom: 15px;
}	

.comentariu header {
	padding-left: 8px;
	color: gray;
	font-size: 10pt;
	margin-bottom: 5px;
}	

.comentariu main {
	border: solid 1px #0070d0;
	padding-top: 5px;	
	padding-bottom: 5px;
	padding-right: 5px;	
	border-radius: 4px;
	background-color: #f5fcfe;
	color: #0070d0;
	font-style: italic;
}
.comentariu article {
	float: left;
	width: 970px;
	white-space: pre-wrap;
	padding-left: 8px;
}

.comentariu .action {
	float: right; 
	width: 25px; 
}
</style>