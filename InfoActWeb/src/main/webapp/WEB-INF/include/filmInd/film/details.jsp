<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/common/err.jsp"/>

<div style="margin-top: 20px;">

	<c:if test="${ss.view}">
		<h1 style="text-align: center; color: #306daa;">
			${record.nume}
			<c:if test="${record.favorit}">
				<img src="${pageContext.request.contextPath}/img/actions/starFull32.png"
					onclick="filmFavorit(${record.id}, true)" style="cursor: pointer;">
			</c:if>
			<c:if test="${not record.favorit}">
				<img src="${pageContext.request.contextPath}/img/actions/starEmpty32.png"
					onclick="filmFavorit(${record.id}, false)" style="cursor: pointer;">
			</c:if>
		</h1>
		<div style="margin-left: 30px; float:left;">
		<c:if test="${not empty record.poza}">
			<img src="${pageContext.request.contextPath}/img/atasamente/${record.document.id}/${record.poza.url}"
				height="210" width="150">
		</c:if>
		<c:if test="${empty record.poza}">
			<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
				height="210" width="150">
		</c:if>
		</div>
		<fmt:formatDate var="dt" pattern="dd.MM.yyyy" value="${record.dt}" />
		<div style="margin-left: 205px; color: #808080;">
			${record.genuri} | ${dt}
		</div>
		<br><br>
		<div style="margin-left: 205px; color: #808080;">
			${record.descriere}
		</div>
		<div style="clear: both;"></div>
	</c:if>
	
	<c:if test="${ss.editable}">
	<table class="tblForm">
		<tr>
			<td>Titlu</td>
			<td>
				<form:input path="nume" cssErrorClass="err" style="width: 300px;"/>
			</td>
		</tr>
		<tr>
			<td>Genuri</td>
			<td>
				<form:input path="genuri"  style="width: 300px;"/>
			</td>
		</tr>
		<tr>
			<td>Dt. aparitie</td>
			<td>
				<form:input path="dt" class="datepicker" type="text" value="${dt}" cssErrorClass="err" style="width: 300px;"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p style="margin-bottom: 7px; margin-top: 15px; margin-left: 1px;">Descriere</p>
				<form:textarea path="descriere" style="width: 400px; height: 200px;"/>
			</td>
		</tr> 
	</table>
	</c:if>
	
	<br>
	
	<c:if test="${empty actori}">
		<br>
		<div class="info">Acest film nu contine nici un actor.</div>
	</c:if>
	
	<c:if test="${not empty actori}">
		<h1 style="text-align: center; color: #306daa;">Actors</h1>
		<table class="tblGrid">
			<tr>
				<th></th>
				<th align="left">Actori</th>
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
	<c:if test="${ss.view}">
	
	<c:if test="${not empty atasamente}">
		<br>
		<h1 style="text-align: center; color: #306daa;">Images</h1>
		<br>
		<div style="overflow-x: auto; height: 340px; white-space: nowrap; ">
			<c:forEach var="imagine" items="${atasamente}">
				<img src="${pageContext.request.contextPath}/img/atasamente/${record.document.id}/${imagine.url}"
					height="320" width="210" style="display: inline-block;">
			</c:forEach>
		</div>
	</c:if>
	
	<br>
	<h1 style="text-align: center; color: #306daa;">Reviews</h1>

	<c:if test="${not empty recenzii}">
		<div>
			<canvas id="chartNote" height="120" width="300"></canvas>
		</div>
	</c:if>
	</c:if>
	<br>

	<jsp:include page="/WEB-INF/include/filmInd/recenzie/list.jsp"/>
	
</div>
