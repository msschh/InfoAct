<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="sorterField" name="sorterField" value="${sorter.sorterField}">
<input type="hidden" id="sorterDirection" name="sorterDirection" value="${sorter.sorterDirection}">

<table class="tblGrid">
	<tr>
		<th></th>
		<th align="left">Titlu</th>
		<th></th>
	</tr>

	<c:forEach var="film" items="${recordList}">
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
			
			<td align="right">	
				<c:if test="${screenCode == 'film'}">
					<jsp:include page="/WEB-INF/common/actionList.jsp">
						<jsp:param name="id" value="${film.id}"/>
					</jsp:include>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>