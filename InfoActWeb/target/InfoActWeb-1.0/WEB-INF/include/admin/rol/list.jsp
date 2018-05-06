<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="tblGrid">
	<tr>
		<th align="left">Cod</th>
		<th align="left">Nume</th>
		<th></th>
	</tr>
 	<c:forEach var="roluri" items="${recordList}">
		<tr>
			<td align="left"><a href="view?id=${roluri.id}">${roluri.cod}</a></td>
			<td align="left"><a href="view?id=${roluri.id}">${roluri.nume}</a></td>
			<td align="right">
				<jsp:include page="/WEB-INF/common/actionList.jsp">
					<jsp:param name="id" value="${roluri.id}"/>
				</jsp:include>
			</td>
		</tr>
	</c:forEach>
</table>