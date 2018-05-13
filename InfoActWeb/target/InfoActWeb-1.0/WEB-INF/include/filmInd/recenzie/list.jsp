<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<br>

<jsp:include page="/WEB-INF/modal/recenzie/modalRecenzie.jsp"/>
<div style="float: left; width: 100%; border-bottom: double 3px silver; margin-bottom: 15px; padding-bottom: 10px;">

	<div style="float: left; padding-top: 12px; padding-left: 2px; color: gray;">
		Recenzii
	</div>
	
	<div style="float: right; padding-right: 2px;">
		<button type="button" class="b1" onclick="modalRecenzie.add();">
			<img src="${pageContext.request.contextPath}/img/actions/add.png">
			Recenzie
		</button>
	</div>
</div>

<div style="float: left; width: 100%;">
	<c:if test="${empty recenzii}">
		<div class="info">Acest film nu contine recenzii.</div>
	</c:if>
		
	<c:if test="${not empty recenzii}">
		<table class="tblGrid">
			<tr>
				<th align="left">Id</th>
				<th align="left">Data</th>
				<th align="left">Nota</th>
				<th align="left">Text</th>
				<th align="left">Utilizator</th>
				<td></td>
			</tr>
		
			<c:forEach var="recenzie" items="${recenzii}">
				<tr>
					<td>${recenzie.id}</td>
					<td>${recenzie.dt}</td>
					<td>${recenzie.nota}</td>
					<td>${recenzie.text}</td>
					<td>${recenzie.user.username}</td>			
					<td align="right">
						<img
							title="delete" style="cursor: pointer;"
							src="${pageContext.request.contextPath}/img/actions/delete.png"
							onclick="browser.deleteModal('recenzie', ${recenzie.id})"> &nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<br>
</div>