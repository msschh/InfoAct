<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="deleteModal" style="z-index: 100000" class="modal">
	<div class="content">
		<div class="header">
			<p align="center">Confirmare ștergere</p>
		</div>
		<div class="body">
			<p align="center">Sigur dorești să ștergi elementul selectat?</p>
			<img style="width: 80px; margin: 0 auto; display: block;" src="${pageContext.request.contextPath}/img/diverse/deleteAlert.png">
		</div>
		<div class="footer">
			<div align="right">
				<button id="delete">
					<img align="left" src="${pageContext.request.contextPath}/img/actions/delete.png">
					<span>Ştergere</span>
				</button>
				<button type="button" id="close" style="width: 120px;">
					<img align="left" src="${pageContext.request.contextPath}/img/actions/close.png">
					<span>Renunţare</span>
				</button>
			</div>
		</div>
	</div>
</div>


