<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:hasBindErrors name="filter">
	<div class="err">
	<ul>
	<c:forEach var="error" items="${errors.allErrors}">
		<li><spring:message message="${error}" /><br></li>
	</c:forEach>
	</ul>
	</div>
</spring:hasBindErrors>
