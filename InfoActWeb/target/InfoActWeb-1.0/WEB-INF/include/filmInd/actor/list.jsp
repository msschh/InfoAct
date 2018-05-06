<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="sorterField" name="sorterField" value="${sorter.sorterField}">
<input type="hidden" id="sorterDirection" name="sorterDirection" value="${sorter.sorterDirection}">

<table class="tblGrid">
	<tr>
		<th></th>
		<th align="left">Nume</th>
		<th></th>
	</tr>

	<c:forEach var="actor" items="${recordList}">
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
			
			<td align="left"><a href="view?id=${actor.id}">${actor.nume}</a></td>
			
			<td align="right">
				<jsp:include page="/WEB-INF/common/actionList.jsp">
					<jsp:param name="id" value="${actor.id}"/>
				</jsp:include>		
			</td>
		</tr>
	</c:forEach>
</table>