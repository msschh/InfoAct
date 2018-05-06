<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="divFilter" style="height: 35px; width: 610px;">
	<div style="float: left; width: 200px;">
		<table>
			<tr>
				<td>Titlu</td>
				<td><input type="text" name="nume" value="${filter.nume}" style="width: 160px;"></td>
			</tr>
		</table>
	</div>
</div>