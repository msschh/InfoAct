<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="sorterField" name="sorterField" value="${sorter.sorterField}">
<input type="hidden" id="sorterDirection" name="sorterDirection" value="${sorter.sorterDirection}">

<table class="tblGrid">
	<tr>
		<th align="left" data-sortby="username">Username</th>
		<th align="left" data-sortby="nume">Nume</th>
		<th></th>
	</tr>

	<c:forEach var="utilizator" items="${recordList}">
		<tr>
			<td align="left"><a href="view?id=${utilizator.id}">${utilizator.username}</a></td>
			<td align="left"><a href="view?id=${utilizator.id}">${utilizator.nume}</a></td>
			
			<td align="right">
				<jsp:include page="/WEB-INF/common/actionList.jsp">
					<jsp:param name="id" value="${utilizator.id}"/>
				</jsp:include>		
			</td>
		</tr>
	</c:forEach>
</table>