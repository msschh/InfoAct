<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/common/err.jsp"/>

<div style="margin-top: 20px;">

	<c:if test="${ss.view}">
		<c:if test="${not empty record.poza}">
			<img src="${pageContext.request.contextPath}/img/atasamente/${record.document.id}/${record.poza.url}"
				height="320" width="215">
		</c:if>
		<c:if test="${empty record.poza}">
			<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
				height="320" width="215">
		</c:if>
	</c:if>
	
	<table class="tblForm">
		<tr>
			<td>Nume</td>
			<td>
				<c:if test="${ss.view}">
					<input type="text" value="${record.nume}" disabled>
				</c:if>
				<c:if test="${ss.editable}">
					<form:input path="nume" cssErrorClass="err" style="width: 300px;"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>Dt. nastere</td>
			<td>
				<c:if test="${ss.view}">
					<fmt:formatDate var="dtNastere" pattern="dd.MM.yyyy" value="${record.dtNastere}" />
					<input type="text" value="${dtNastere}" disabled />
				</c:if>
				<c:if test="${ss.editable}">
					<form:input path="dtNastere" class="datepicker" type="text" value="${dtNastere}" cssErrorClass="err" style="width: 300px;"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>Loc nastere</td>
			<td>
				<c:if test="${ss.view}">
					<input type="text" value="${record.locNastere}" disabled>
				</c:if>
				<c:if test="${ss.editable}">
					<form:input path="locNastere" cssErrorClass="err" style="width: 300px;"/>
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
					<form:textarea path="descriere" style="width: 400px; height: 200px;"/>
				</c:if>
			</td>
		</tr> 
	</table>
	
	<c:if test="${ss.view}">
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
	
	<c:if test="${empty filme}">
		<div class="info">Acest actor nu apare in nici un film.</div>
	</c:if>
	
	<c:if test="${not empty filme}">
		<table class="tblGrid">
			<tr>
				<th></th>
				<th align="left">Nume</th>
				<th align="left">Personaj</th>
				<th></th>
			</tr>
			<c:forEach var="film" items="${filme}">
				<tr>
					<td>
						<c:if test="${not empty film.poza}">
							<img src="${pageContext.request.contextPath}/img/atasamente/${film.document.id}/${film.poza.url}"
								height="67" width="45">
						</c:if>
						<c:if test="${empty film.poza}">
							<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
								height="67" width="45">
						</c:if>
					</td>
					<td align="left"><a>${film.nume}</a></td>
					<td align="left"><a>${film.personaj}</a></td>
					<td align="right">
						<c:if test="${ss.edit}">
						<img
							title="delete" style="cursor: pointer;"
							src="${pageContext.request.contextPath}/img/actions/delete.png"
							onclick="modalActorFilm.deleteModal(${record.id}, ${film.id})">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</c:if>
</div>
