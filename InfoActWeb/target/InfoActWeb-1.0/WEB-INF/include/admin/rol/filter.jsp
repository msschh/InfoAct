<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="divFilter" style="height: 35px;">
	<div style="float: left; width: 300px;">
		<table>
			<tr>
				<td>Cod</td>
				<td><input type="text" name="cod" value="${filter.cod}" style="width: 160px;"></td>
			</tr>
		</table>
	</div>
	
	<div style="float: left; width: 300px;">
		<table>
			<tr>
				<td>Nume</td>
				<td><input type="text" name="nume" value="${filter.nume}" style="width: 160px;"></td>	
			</tr>
		</table>
	</div>
</div>