<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="sorterField" name="sorterField" value="${sorter.sorterField}">
<input type="hidden" id="sorterDirection" name="sorterDirection" value="${sorter.sorterDirection}">

<c:forEach var="actor" items="${recordList}">
	<div style="float: left; width: 31%; margin-left: 15px; margin-bottom: 30px;">
		<table style="margin-left: 15%;">
			<tr>
				<td align="center">
					<c:if test="${not empty actor.poza}">
						<img src="${pageContext.request.contextPath}/img/atasamente/${actor.document.id}/${actor.poza.url}"
							height="280" width="175">
					</c:if>
					<c:if test="${empty actor.poza}">
						<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
							height="280" width="175">
					</c:if>
				</td>
			</tr>
			<tr>
				<td align="center"><a href="view?id=${actor.id}">${actor.nume}</a></td>
			</tr>
		</table>
	</div>
</c:forEach>