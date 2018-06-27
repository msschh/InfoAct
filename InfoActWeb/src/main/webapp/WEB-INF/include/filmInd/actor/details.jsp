<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/common/err.jsp"/>

<div style="margin-top: 20px;">
	<c:if test="${ss.view}">
		<h1 style="text-align: center; color: #306daa;">${record.nume}</h1>
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
		<fmt:formatDate var="dtNastere" pattern="dd.MM.yyyy" value="${record.dtNastere}" />
		<div style="margin-left: 205px; color: #808080;">
			<b>Born: </b>${dtNastere} in ${record.locNastere}.
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
				<td>Nume</td>
				<td>
					<form:input path="nume" cssErrorClass="err" style="width: 300px;"/>
				</td>
			</tr>
			<tr>
				<td>Dt. nastere</td>
				<td>
					<form:input path="dtNastere" class="datepicker" type="text" value="${dtNastere}" cssErrorClass="err" style="width: 300px;"/>
				</td>
			</tr>
			<tr>
				<td>Loc nastere</td>
				<td>
					<form:input path="locNastere" cssErrorClass="err" style="width: 300px;"/>
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
	
	<c:if test="${empty filme}">
		<div class="info">Acest actor nu apare in nici un film.</div>
	</c:if>
	
	<c:if test="${not empty filme}">
		<h1 style="text-align: center; color: #306daa;">Movies</h1>
		<table class="tblGrid">
			<tr>
				<th></th>
				<th align="left">Film</th>
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
					<td align="left"><a href="${pageContext.request.contextPath}/mvc/film/view?id=${film.id}">${film.nume}</a></td>
					<td align="left"><a href="${pageContext.request.contextPath}/mvc/film/view?id=${film.id}">${film.personaj}</a></td>
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
	
	<c:if test="${ss.view}">
	<c:if test="${not empty atasamente}">
		<br>
		<h1 style="text-align: center; color: #306daa;">Images</h1>
		<br>
		<div style="overflow-x: auto; height: 340px; white-space: nowrap; ">
			<c:forEach var="imagine" items="${atasamente}">
				<img src="${pageContext.request.contextPath}/img/atasamente/${record.document.id}/${imagine.url}"
					height="320" width="215" style="display: inline-block;">
			</c:forEach>
		</div>
	</c:if>
	</c:if>
	<br>
</div>
