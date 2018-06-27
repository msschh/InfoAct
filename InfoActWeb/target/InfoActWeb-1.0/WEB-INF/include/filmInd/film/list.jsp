<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="sorterField" name="sorterField" value="${sorter.sorterField}">
<input type="hidden" id="sorterDirection" name="sorterDirection" value="${sorter.sorterDirection}">

<c:forEach var="film" items="${recordList}">
	<div style="float: left; width: 31%; margin-left: 15px; margin-bottom: 30px;">
		<table style="margin-left: 15%;">
			<tr>
				<td align="center" style="padding-bottom: 5px;">
					<c:if test="${not empty film.poza}">
						<img src="${pageContext.request.contextPath}/img/atasamente/${film.document.id}/${film.poza.url}"
							height="280" width="175">
					</c:if>
					<c:if test="${empty film.poza}">
						<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
							height="280" width="175">
					</c:if>
				</td>
			</tr>
			<tr>
				<td align="center" style="padding-bottom: 5px;">
					<a href="${pageContext.request.contextPath}/mvc/film/view?id=${film.id}">${film.nume}</a>
				</td>
			</tr>
			<tr>
				<td align="center" style="padding-bottom: 5px;">
					<fmt:formatDate var="dt" pattern="yyyy" value="${film.dt}" />
					<a href="${pageContext.request.contextPath}/mvc/film/view?id=${film.id}">(${dt})</a>
				</td>
			</tr>
		</table>
	</div>
</c:forEach>