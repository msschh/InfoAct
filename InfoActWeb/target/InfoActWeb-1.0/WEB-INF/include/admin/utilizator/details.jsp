<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/common/err.jsp"/>

<div id="tabHeader">
    <button type="button" id="th-general" onclick="openTab(this, 'tab-general')">Date generale</button>
    <button type="button" id="th-roluri" onclick="openTab(this, 'tab-roluri')">Roluri</button>
</div>

<div>

	<div id="tab-general" class="tab">
		<table class="tblForm">
			<c:if test="${ss.add}">
				<tr>
					<td>Username</td>
					<td>
						<form:input path="username" cssErrorClass="err"/>
					</td>
				</tr>
				<tr>
					<td>Parola</td>
					<td>
						<form:input type="password" path="parola" cssErrorClass="err"/>
					</td>
				</tr>
			</c:if>
			<tr>
				<td>Nume</td>
				<td>
					<c:if test="${ss.view}">
						<input type="text" value="${record.nume}" disabled>
					</c:if>
					<c:if test="${ss.editable}">
						<form:input path="nume" cssErrorClass="err"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>
					<c:if test="${ss.view}">
						<input type="text" value="${record.email}" disabled>
					</c:if>
					<c:if test="${ss.editable}">
						<form:input path="email" cssErrorClass="err"/>
					</c:if>
					<c:if test="${ss.edit}">
						<form:hidden path="username"/>
						<form:hidden path="parola"/>
					</c:if>
				</td>			
			</tr>
	   </table>
	</div>
	
	<div id="tab-roluri" class="tab">
		<div style="overflow-y: auto; height: 250px; line-height: 220%;">
			<ul>
				<c:forEach var="rolCurent" items="${listRolCurent}">
					<c:if test="${ss.view}">
						<c:if test="${rolCurent.allowed}">
			            	<input type="checkbox" checked disabled>
			            </c:if>
						<c:if test="${! rolCurent.allowed}">
			            	<input type="checkbox" disabled>
			            </c:if>
		            </c:if>
		            <c:if test="${ss.add}">
		            	<input type="checkbox" name="roluriAlese" value="${rolCurent.rol.id}">
		            </c:if>
					<c:if test="${ss.edit}">
						<c:if test="${rolCurent.allowed}">
			            	<input type="checkbox" name="roluriAlese" value="${rolCurent.rol.id}" checked>
			            </c:if>
						<c:if test="${! rolCurent.allowed}">
			            	<input type="checkbox" name="roluriAlese" value="${rolCurent.rol.id}">
			            </c:if>
		            </c:if>
	            	<label>${rolCurent.rol.nume}</label><br>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
