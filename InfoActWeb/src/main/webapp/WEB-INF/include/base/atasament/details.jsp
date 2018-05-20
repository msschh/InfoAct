<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${ss.add}">
	<form:form id="frmDetails" method="POST" modelAttribute="record" enctype="multipart/form-data" accept-charset="UTF-8">
		<input type="file" id="uploadFile" name="filecontent" onchange="atasament.onUpload();" style="display: none;">
		<input type="hidden" id="txtTipFisier" name="tipFisier">
	</form:form>
</c:if>
<c:if test="${ss.view}">
	<br>
	<img src="${pageContext.request.contextPath}/img-test/${urlImgInitiala}"
		style="max-width: 620px; max-height: 320px;">
	<c:if test="${empty actorPrezis}">
		<img src="${pageContext.request.contextPath}/img/atasamente/default.jpg"
			height="320" width="215">
	</c:if>
	<c:if test="${not empty actorPrezis}">
		<img src="${pageContext.request.contextPath}/img/atasamente/${actorPrezis.document.id}/${actorPrezis.poza.url}"
			height="320" width="215">
	</c:if>
</c:if>