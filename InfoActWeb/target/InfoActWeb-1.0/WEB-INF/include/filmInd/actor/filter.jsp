<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="divFilter" style="height: 35px; width: 830px;">
	<div style="float: left; width: 830px;">
		<table>
			<tr>
				<td>Nume</td>
				<td><input type="text" name="nume" value="${filter.nume}" style="width: 750px;"></td>
			</tr>
		</table>
	</div>
</div>