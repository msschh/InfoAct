<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/common/deleteModal.jsp"/>

<div id="divToolbar">
	<c:if test="${ss.list}">
		<c:if test="${empty param.ignoreFilter}">
			<button type="submit" form="formList" formaction="list">
				<img title="Filtrare" src="${pageContext.request.contextPath}/img/actions/refresh.png">
				<br>Reîncărcare
			</button>
			<button onclick="window.location='list'">
				<img title="Clear filter" src="${pageContext.request.contextPath}/img/actions/unsearch3.png">
				<br>Șterge filtru
			</button>
		</c:if>
		
		<c:if test="${empty param.ignoreEdit}">
			<button onclick="window.location='add'">
				<img title="Adăugare" src="${pageContext.request.contextPath}/img/actions/add.png">
				<br>Adăugare
			</button>
		</c:if>
	</c:if>
	
	<c:if test="${ss.view}">
		<button onclick="window.location='list'">
			<img title="Back to list" src="${pageContext.request.contextPath}/img/actions/list2.png">
			<br>&nbsp; Listă &nbsp; 
		</button>
		
		<c:if test="${empty param.ignoreEdit}">
			<button onclick="window.location='edit?id=${record.id}&ls=1'">
				<img title="Editare" src="${pageContext.request.contextPath}/img/actions/edit.png">
				<br>Editare
			</button>
			<button onclick="jQueryDeleteModal('delete', ${record.id})">
				<img title="Ştergere" src="${pageContext.request.contextPath}/img/actions/delete.png">
				<br>Ştergere
			</button>
		</c:if>
	</c:if>
	
	<c:if test="${ss.edit}">
		<button title="Salvare" type="submit" form="frmDetails" formaction="update">
			<img src="${pageContext.request.contextPath}/img/actions/save.png">
			<br>Salvare
		</button>
		<button title="Renuntare" onclick="window.location='view?id=${record.id}&ls=1'">
			<img src="${pageContext.request.contextPath}/img/actions/cancel.png">
			<br>Renunţare
		</button>
	</c:if>
	
	<c:if test="${ss.add}">
		<button title="Salvare" type="submit" form="frmDetails" formaction="create">
			<img src="${pageContext.request.contextPath}/img/actions/save.png">
			<br>Salvare
		</button>
		<button title="Renuntare" onclick="window.location='list'">
			<img src="${pageContext.request.contextPath}/img/actions/cancel.png">
			<br>Renunţare
		</button>
	</c:if>
	
	<c:if test="${not empty param.screenToolbar}">
		<jsp:include page="${param.screenToolbar}"></jsp:include>
	</c:if>
</div>
