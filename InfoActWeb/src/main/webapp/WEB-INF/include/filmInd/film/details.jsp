<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/common/err.jsp"/>

<div>

	<c:if test="${not empty record.poza}">
		<img src="${pageContext.request.contextPath}/img/atasamente/${record.document.id}/${record.poza.url}"
			height="320" width="215">
	</c:if>
	<c:if test="${empty record.poza}">
		<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
			height="320" width="215">
	</c:if>
	
	<c:if test="${ss.view}">
		<c:if test="${record.favorit}">
			<img src="${pageContext.request.contextPath}/img/actions/starFull32.png"
				onclick="filmFavorit(${record.id}, true)" style="cursor: pointer;">
		</c:if>
		<c:if test="${not record.favorit}">
			<img src="${pageContext.request.contextPath}/img/actions/starEmpty32.png"
				onclick="filmFavorit(${record.id}, false)" style="cursor: pointer;">
		</c:if>
	</c:if>
	
	<table class="tblForm">
		<tr>
			<td>Titlu</td>
			<td>
				<c:if test="${ss.view}">
					<input type="text" value="${record.nume}" disabled>
				</c:if>
				<c:if test="${ss.editable}">
					<form:input path="nume" cssErrorClass="err"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>Genuri</td>
			<td>
				<c:if test="${ss.view}">
					<input type="text" value="${record.genuri}" disabled>
				</c:if>
				<c:if test="${ss.editable}">
					<form:input path="genuri" />
				</c:if>
			</td>
		</tr>
		<tr>
			<td>Dt. aparitie</td>
			<td>
				<c:if test="${ss.view}">
					<fmt:formatDate var="dt" pattern="dd.MM.yyyy" value="${record.dt}" />
					<input type="text" value="${dt}" disabled />
				</c:if>
				<c:if test="${ss.editable}">
					<form:input path="dt" class="datepicker" type="text" value="${dt}" cssErrorClass="err"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p style="margin-bottom: 7px; margin-top: 15px; margin-left: 1px;">Descriere</p>
				<c:if test="${ss.view}">
					<textarea disabled style="width: 400px; height: 110px;">${record.descriere}</textarea>
				</c:if>
				<c:if test="${ss.editable}">
					<form:textarea path="descriere" style="width: 400px; height: 110px;"/>
				</c:if>
			</td>
		</tr> 
	</table>
	
	
	<br><br><br>
	
	<c:if test="${not empty atasamente}">
		<div style="overflow-x: auto; height: 340px; white-space: nowrap; ">
			<c:forEach var="imagine" items="${atasamente}">
				<img src="${pageContext.request.contextPath}/img/atasamente/${record.document.id}/${imagine.url}"
					height="320" width="215" style="display: inline-block;">
			</c:forEach>
		</div>
		
		<br><br><br>
	</c:if>
	
	<c:if test="${empty actori}">
		<div class="info">Acest film nu contine nici un actor.</div>
	</c:if>
	
	<c:if test="${not empty actori}">
		<table class="tblGrid">
			<tr>
				<th></th>
				<th align="left">Nume</th>
				<th align="left">Personaj</th>
				<th></th>
			</tr>
			<c:forEach var="actor" items="${actori}">
				<tr>
					<td>
						<c:if test="${not empty actor.poza}">
							<img src="${pageContext.request.contextPath}/img/atasamente/${actor.document.id}/${actor.poza.url}"
								height="67" width="45">
						</c:if>
						<c:if test="${empty actor.poza}">
							<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
								height="67" width="45">
						</c:if>
					</td>
					<td align="left"><a>${actor.nume}</a></td>
					<td align="left"><a>${actor.personaj}</a></td>
					<td align="right">
						<c:if test="${ss.edit}">
						<img
							title="delete" style="cursor: pointer;"
							src="${pageContext.request.contextPath}/img/actions/delete.png"
							onclick="modalActorFilm.deleteModal(${actor.id}, ${record.id})">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<jsp:include page="/WEB-INF/include/filmInd/recenzie/list.jsp"/>
</div>
